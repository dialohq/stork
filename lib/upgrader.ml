open Ast.NoLoc

type generated =
  { intf_list : string list
  ; impl_list : string list
  ; user_intf_list : string list
  ; upgrader_t : string list
  ; upgrader_t_intf : string list
  }
[@@deriving show]

type sum_repr =
  | Polymorphic
  | Classic

type list_repr =
  | List
  | Array

type variant_upgrade =
  | SameVariant of string
  | SameVariantWithPayload of string
  | SameVariantWithNominalPayload of string
  | ModifiedVariantWithPayload of (string * modification)

and field_upgrade =
  | SameField of string
  | SameFieldNominal of string
  | ModifiedField of (string * modification)

and cell_upgrade =
  | SameCell
  | SameCellNominal
  | ModifiedCell of modification

and name_upgrade =
  | Modified of string
  | New of string

and modification =
  | Name of name_upgrade
  | Option of modification
  | Nullable of modification
  | Shared of modification
  | Wrap of modification
  | Sum of sum_repr * variant_upgrade list
  | Record of field_upgrade list
  | Tuple of cell_upgrade list
  | List of list_repr * modification

type shallow_equal =
  | Same
  | SameNominal
  | TransitivelyModified of modification

type generic = bool

type upgrade =
  | New of generic
  | ShallowEqual of generic * shallow_equal
  | Modified of
      { was_generic : generic
      ; is_generic : generic
      }

module StringMap = Map.Make (String)

let load_sort path =
  let open Atd.Util in
  let (_module_head, module_body), _original_types =
    load_file ~inherit_fields:true ~inherit_variants:true path
  in
  tsort module_body

let has_version_field (field_list : Atd.Ast.field list) : bool =
  List.exists
    ~f:(function
      | `Field (_, ("version", _, _), Atd.Ast.Name (_, (_, "int", _), _)) ->
        true
      | `Field _ | `Inherit _ ->
        false)
    field_list

let flatten_module_items sorted_modules =
  let rec aux sorted_modules flat_module_items =
    match sorted_modules with
    | [] | [ (_, []) ] ->
      failwith "ATD file is empty"
    | [ ( _flag
        , [ (Atd.Ast.Type
               ( _
               , (main_type_name, main_type_param, _)
               , Atd.Ast.Record (_, field_list, _) ) as main_type)
          ] )
      ]
      when has_version_field field_list ->
      ( ModuleItem.from_loc main_type :: flat_module_items
      , main_type_name
      , List.length main_type_param )
    | [ _ ] ->
      failwith
        "The main (and last) type of the file must be a record with a \
         `version` field of type `int`"
    | (_flag, []) :: modules ->
      aux modules flat_module_items
    | (flag, module_item :: tail) :: modules ->
      aux
        ((flag, tail) :: modules)
        (ModuleItem.from_loc module_item :: flat_module_items)
  in
  let reverse_module_items, main_type_name, main_type_param_count =
    aux sorted_modules []
  in
  List.rev reverse_module_items, main_type_name, main_type_param_count

let filter_ocaml_annot : annot -> annot_field list option =
  List.find_map ~f:(function
      | "ocaml", ocaml_annot ->
        Some ocaml_annot
      | _ ->
        None)

let filter_repr_annot : annot_field list -> string option =
  List.find_map ~f:(function "repr", repr -> repr | _ -> None)

let annot_to_list_repr annot : list_repr =
  let ocaml_annot = filter_ocaml_annot annot in
  match Option.bind ocaml_annot filter_repr_annot with
  | Some "array" ->
    Array
  | Some other ->
    failwith ("unknown list repr: " ^ other)
  | None ->
    List

let annot_to_sum_repr annot : sum_repr =
  let ocaml_annot = filter_ocaml_annot annot in
  match Option.bind ocaml_annot filter_repr_annot with
  | Some "classic" ->
    Classic
  | Some other ->
    failwith ("unknown sum repr: " ^ other)
  | None ->
    Polymorphic

let replace_type_vars ~concrete_params ~tvars =
  let tvarMap =
    List.fold_left2
      ~f:(fun map tvar concrete_param -> StringMap.add tvar concrete_param map)
      ~init:StringMap.empty
      tvars
      concrete_params
  in
  let rec aux = function
    | TypeExpr.Sum (variants, annot) ->
      let variants =
        List.map variants ~f:(fun ((name, annot), t) ->
            (name, annot), Option.map aux t)
      in
      TypeExpr.Sum (variants, annot)
    | TypeExpr.Record (fields, annot) ->
      let fields =
        List.map fields ~f:(fun ((name, field_kind, annot), t) ->
            (name, field_kind, annot), aux t)
      in
      TypeExpr.Record (fields, annot)
    | TypeExpr.Tuple (cells, annot) ->
      let cells = List.map cells ~f:(fun (t, annot) -> aux t, annot) in
      TypeExpr.Tuple (cells, annot)
    | TypeExpr.List (t, annot) ->
      TypeExpr.List (aux t, annot)
    | TypeExpr.Option (t, annot) ->
      TypeExpr.Option (aux t, annot)
    | TypeExpr.Nullable (t, annot) ->
      TypeExpr.Nullable (aux t, annot)
    | TypeExpr.Shared (t, annot) ->
      TypeExpr.Shared (aux t, annot)
    | TypeExpr.Wrap (t, annot) ->
      TypeExpr.Wrap (aux t, annot)
    | TypeExpr.Name _ as name ->
      name
    | TypeExpr.Tvar var ->
      StringMap.find var tvarMap
  in
  aux

let is_not_empty = function [] -> false | _ :: _ -> true

(* since the types are shallow equal, it means their composing subtypes existed
   before, so they can only be same or transitively modified, not new *)
let rec classify_shallow_equals ~classified_type_map = function
  | TypeExpr.List (type_expr, annot) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | SameNominal ->
      SameNominal
    | TransitivelyModified modification ->
      TransitivelyModified (List (annot_to_list_repr annot, modification)))
  | TypeExpr.Option (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | SameNominal ->
      SameNominal
    | TransitivelyModified modification ->
      TransitivelyModified (Option modification))
  | TypeExpr.Nullable (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | SameNominal ->
      SameNominal
    | TransitivelyModified modification ->
      TransitivelyModified (Nullable modification))
  | TypeExpr.Shared (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | SameNominal ->
      SameNominal
    | TransitivelyModified modification ->
      TransitivelyModified (Shared modification))
  | TypeExpr.Wrap (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | SameNominal ->
      SameNominal
    | TransitivelyModified modification ->
      TransitivelyModified (Wrap modification))
  | TypeExpr.Name ((("unit" | "bool" | "int" | "float" | "string"), _), _) ->
    Same
  | TypeExpr.Name (("abstract", _), _) ->
    failwith "Abstract types should only appear in top level"
  | TypeExpr.Name ((type_name, []), _) ->
    (match StringMap.find_opt type_name classified_type_map with
    | None ->
      failwith ("unknown type " ^ type_name) (* should not happen *)
    | Some (ShallowEqual (_, Same), _) ->
      Same
    | Some (ShallowEqual (_, SameNominal), _) ->
      SameNominal
    | Some (ShallowEqual (_, TransitivelyModified _), _) ->
      TransitivelyModified (Name (Modified type_name))
    | Some (New _, _) ->
      TransitivelyModified (Name (New type_name))
    | Some (Modified _, _) ->
      TransitivelyModified (Name (Modified type_name)))
  | TypeExpr.Name ((type_name, concrete_params), _) ->
    let rec parameter_list_kind ~current = function
      | [] ->
        current
      | param :: tail ->
        (match classify_shallow_equals ~classified_type_map param with
        | Same ->
          parameter_list_kind ~current tail
        | SameNominal ->
          parameter_list_kind ~current:SameNominal tail
        | TransitivelyModified _ as modified ->
          modified)
    in
    let parameter_list_kind =
      parameter_list_kind ~current:Same concrete_params
    in
    (match
       parameter_list_kind, StringMap.find_opt type_name classified_type_map
     with
    | _, None ->
      failwith ("unknown type " ^ type_name) (* should not happen *)
    | Same, Some (ShallowEqual (_, Same), _) ->
      Same
    | (Same | SameNominal), Some (ShallowEqual (_, (Same | SameNominal)), _) ->
      SameNominal
    | _, Some (_, ((_, tvars, _), type_expr)) ->
      let expanded_named_type =
        replace_type_vars ~tvars ~concrete_params type_expr
      in
      classify_shallow_equals ~classified_type_map expanded_named_type)
  | TypeExpr.Tvar _ ->
    Same
  | TypeExpr.Record (fields, _) ->
    let same = ref true in
    let field_upgrades =
      List.map fields ~f:(fun ((field_name, field_kind, _), type_expr) ->
          match classify_shallow_equals ~classified_type_map type_expr with
          | Same ->
            SameField field_name
          | SameNominal ->
            SameFieldNominal field_name
          | TransitivelyModified modification ->
            let () = same := false in
            ModifiedField
              ( field_name
              , match field_kind with
                | TypeExpr.Required | TypeExpr.With_default ->
                  modification
                | TypeExpr.Optional ->
                  Option modification ))
    in
    (match !same with
    | true ->
      SameNominal
    | false ->
      TransitivelyModified (Record field_upgrades))
  | TypeExpr.Sum (variants, annot) ->
    let variant_upgrades =
      List.map variants ~f:(fun ((variant_name, _), type_expr) ->
          let upgrade_kind =
            match type_expr with
            | None ->
              SameVariant variant_name
            | Some type_expr ->
              (match classify_shallow_equals ~classified_type_map type_expr with
              | Same ->
                SameVariantWithPayload variant_name
              | SameNominal ->
                SameVariantWithNominalPayload variant_name
              | TransitivelyModified modification ->
                ModifiedVariantWithPayload (variant_name, modification))
          in
          upgrade_kind)
    in
    let rec aux ~current = function
      | [] ->
        current
      | (SameVariant _ | SameVariantWithPayload _) :: tail ->
        aux ~current tail
      | SameVariantWithNominalPayload _ :: tail ->
        aux ~current:SameNominal tail
      | ModifiedVariantWithPayload (_, modif) :: _ ->
        TransitivelyModified modif
    in
    let upgrade_kind = aux ~current:Same variant_upgrades in
    (match upgrade_kind with
    | Same ->
      Same
    | SameNominal ->
      SameNominal
    | TransitivelyModified _ ->
      TransitivelyModified (Sum (annot_to_sum_repr annot, variant_upgrades)))
  | TypeExpr.Tuple (cells, _) ->
    let cell_upgrades =
      List.map cells ~f:(fun (type_expr, _) ->
          match classify_shallow_equals ~classified_type_map type_expr with
          | Same ->
            SameCell
          | SameNominal ->
            SameCellNominal
          | TransitivelyModified modification ->
            ModifiedCell modification)
    in
    let rec aux ~current = function
      | [] ->
        current
      | SameCell :: tail ->
        aux ~current tail
      | SameCellNominal :: tail ->
        aux ~current:SameNominal tail
      | ModifiedCell modif :: _ ->
        TransitivelyModified modif
    in
    let upgrade_kind = aux ~current:Same cell_upgrades in
    (match upgrade_kind with
    | Same ->
      Same
    | SameNominal ->
      SameNominal
    | TransitivelyModified _ ->
      TransitivelyModified (Tuple cell_upgrades))

let classify_item
    (((name, type_param, _), type_expr) as new_item : ModuleItem.t)
    ~old_type_map
    ~classified_type_map
  =
  let is_generic = is_not_empty type_param in
  match type_expr, StringMap.find_opt name old_type_map with
  | _, None ->
    name, (New is_generic : upgrade)
  | TypeExpr.Name (("abstract", _), _), Some ((_, old_type_param, _), _) ->
    let was_generic = is_not_empty old_type_param in
    name, Modified { is_generic; was_generic }
  | _, Some old_item when old_item = new_item ->
    ( name
    , ShallowEqual
        (is_generic, classify_shallow_equals ~classified_type_map type_expr) )
  | _, Some ((_, old_type_param, _), _) ->
    let was_generic = is_not_empty old_type_param in
    name, Modified { is_generic; was_generic }

let old_version = "OldVersion"

let new_version = "NewVersion"

let upgrader_t_name prefix =
  [%string "$(String.capitalize_ascii prefix)_upgrader_t"]

let converter = "converter"

let convert = "convert"

let make = "make"

let user_fns_module_name prefix =
  [%string "$(String.capitalize_ascii prefix)_user_fns"]

let old_doc = "old_doc"

let name_converter name = [%string "$(convert)_$name"]

let rec modification_to_string ?version_when_main_type = function
  | Name (New type_name) ->
    [%string "fun _ -> $(make)_$type_name $converter $old_doc"]
  | Name (Modified type_name) ->
    [%string "$(name_converter type_name) $converter $old_doc"]
  | Option modification | Nullable modification ->
    [%string "Option.map ($(modification_to_string modification))"]
  | Shared modification | Wrap modification ->
    modification_to_string modification
  | Sum (sum_repr, variant_upgrades) ->
    let old_prefix, new_prefix =
      match sum_repr with
      | Polymorphic ->
        "`", "`"
      | Classic ->
        [%string "$old_version."], [%string "$new_version."]
    in
    let variants =
      List.map variant_upgrades ~f:(function
          | SameVariant variant_name ->
            [%string "| $old_prefix$variant_name -> $new_prefix$variant_name"]
          | SameVariantWithPayload variant_name ->
            [%string
              "| $old_prefix$variant_name payload -> $new_prefix$variant_name \
               payload"]
          | SameVariantWithNominalPayload variant_name ->
            [%string
              "| $old_prefix$variant_name payload -> $new_prefix$variant_name \
               (Obj.magic payload)"]
          | ModifiedVariantWithPayload (variant_name, modification) ->
            [%string
              "| $old_prefix$variant_name payload -> $new_prefix$variant_name \
               (payload |> ($(modification_to_string modification)))"])
      |> String.concat ~sep:"\n"
    in
    [%string "function \n$variants"]
  | Record field_upgrades ->
    let fields =
      List.map field_upgrades ~f:(fun field_upgrade ->
          match field_upgrade, version_when_main_type with
          | SameField "version", Some new_file_version ->
            [%string "version = %i$new_file_version;"]
          | SameField field_name, _ ->
            [%string "$field_name = old_record.$field_name;"]
          | SameFieldNominal field_name, _ ->
            [%string "$field_name = Obj.magic old_record.$field_name;"]
          | ModifiedField (field_name, modification), _ ->
            [%string
              "$field_name = old_record.$field_name |> \
               ($(modification_to_string modification));"])
      |> String.concat ~sep:"\n"
    in
    [%string "fun old_record -> $new_version.{ $fields }"]
  | Tuple cell_upgrades ->
    let tuple_var =
      List.mapi cell_upgrades ~f:(fun i _ -> [%string "a_%i$i"])
      |> String.concat ~sep:", "
    in
    let tuple_var = [%string "($tuple_var)"] in
    let cells =
      List.mapi cell_upgrades ~f:(fun i -> function
        | SameCell ->
          [%string "a_%i$i"]
        | SameCellNominal ->
          [%string "Obj.magic a_%i$i"]
        | ModifiedCell modification ->
          [%string "a_%i$i |> ($(modification_to_string modification))"])
      |> String.concat ~sep:", "
    in
    [%string "fun $tuple_var -> ($cells)"]
  | List (list_repr, modification) ->
    let map =
      match list_repr with List -> "List.map" | Array -> "Array.map"
    in
    [%string "$map ~f:($(modification_to_string modification))"]

let generate_type_params ~start = function
  | 0 ->
    ""
  | 1 ->
    [%string "'a_%i$start "]
  | n ->
    let rec aux ~acc i =
      match n - i with
      | 1 ->
        [%string "($(acc)'a_%i$i) "]
      | _ ->
        let acc = [%string "$(acc)'a_%i$i, "] in
        aux ~acc (i + 1)
    in
    aux ~acc:"" start

let classified_type_to_strings ~main_type ~new_file_version =
  let old_main_type = [%string "$old_version.$main_type"] in
  let make name =
    let old_type = [%string "$old_version.$name"] in
    let new_type = [%string "$new_version.$name"] in
    let fn = name_converter name in
    let fn_intf =
      [%string "$converter -> $old_main_type -> $old_type -> $new_type"]
    in
    let intf = [%string "val $fn: $fn_intf"] in
    let field = fn, fn_intf in
    fn, fn_intf, intf, field
  in
  function
  | name, (New true : upgrade)
  | name, ShallowEqual (true, _)
  | name, Modified { is_generic = true; _ }
  | name, Modified { was_generic = true; _ } ->
    if name = main_type then
      failwith "The main type cannot be generic"
    else
      None, None, None
  | name, ShallowEqual (false, Same) ->
    let fn, _, _, field = make name in
    let impl = [%string "let $fn _ _ x = x"] in
    Some impl, None, Some field
  | name, ShallowEqual (false, SameNominal) ->
    let fn, fn_intf, _, field = make name in
    let impl = [%string "let $fn: $fn_intf = fun _ _  x -> Obj.magic x"] in
    Some impl, None, Some field
  | _, (New _ : upgrade) ->
    None, None, None
  | name, Modified _ when name = main_type ->
    (* not sure how to ensure that version is correctly updated in this case *)
    let old_type = [%string "$old_version.$name"] in
    let new_type = [%string "$new_version.$name"] in
    let fn = name_converter name in
    let fn_intf = [%string "$converter -> $old_type -> $new_type"] in
    let intf = [%string "val $fn: $fn_intf"] in
    let field = fn, fn_intf in
    None, Some intf, Some field
  | name, Modified { was_generic = false; is_generic = false } ->
    let _, _, intf, field = make name in
    None, Some intf, Some field
  | name, ShallowEqual (false, TransitivelyModified modification)
    when name = main_type ->
    let fn = name_converter name in
    let fn_impl =
      modification_to_string
        ~version_when_main_type:new_file_version
        modification
    in
    let fn_intf =
      [%string "$converter -> $old_version.$name -> $new_version.$name"]
    in
    let impl =
      [%string
        "let $fn: $fn_intf = fun $converter $old_doc -> $old_doc |> ($fn_impl)"]
    in
    let field = fn, fn_intf in
    Some impl, None, Some field
  | name, ShallowEqual (false, TransitivelyModified modification) ->
    let fn, fn_intf, _, field = make name in
    let fn_impl = modification_to_string modification in
    let impl =
      [%string "let $fn: $fn_intf = fun $converter $old_doc -> $fn_impl"]
    in
    Some impl, None, Some field

let to_map : ModuleItem.t list -> ModuleItem.t StringMap.t =
  List.fold_left
    ~f:(fun map (((name, _, _), _) as item) -> StringMap.add name item map)
    ~init:StringMap.empty

let load_sort_map path =
  let sorted_items = load_sort path in
  let sorted_items, main_type, main_type_param_count =
    sorted_items |> flatten_module_items
  in
  let item_map = to_map sorted_items in
  sorted_items, item_map, main_type, main_type_param_count

let enclose_module ~header ~module_name ?(impl = false) = function
  | [] ->
    []
  | lines ->
    let delimiter = match impl with true -> "= struct" | false -> ": sig" in
    [%string "module $module_name $delimiter"]
    :: header :: List.rev ("end" :: lines)

let name_t_module prefix version =
  [%string "$(String.capitalize_ascii prefix)_%i$(version)_t"]

let name_impl_module kind prefix version =
  [%string
    {|$(String.capitalize_ascii prefix)_%i$(version)_$(match kind with Config.Native -> "j" | Config.Rescript -> "bs")|}]

let name_upgrader_module ~old_file_version ~new_file_version =
  [%string "From_%i$(old_file_version)_to_%i$new_file_version"]

let make ~prefix ~old_file ~old_file_version ~new_file ~new_file_version =
  let _old_sorted_items, old_type_map, old_main_type, old_main_type_param_count =
    load_sort_map old_file
  in
  let new_sorted_items, _new_type_map, new_main_type, new_main_type_param_count =
    load_sort_map new_file
  in
  if new_main_type <> old_main_type then
    Error (`Different_main_type (new_main_type, new_main_type))
  else
    let main_type = new_main_type in
    let impl_list, user_intf_list, fields, _ =
      List.fold_left
        ~f:
          (fun (impl_list, user_intf_list, fields, classified_type_map) new_item ->
          let name, classified_item =
            classify_item ~old_type_map ~classified_type_map new_item
          in
          let impl, user_intf, field =
            classified_type_to_strings
              ~main_type
              ~new_file_version
              (name, classified_item)
          in
          let add_if_some l = function None -> l | Some el -> el :: l in
          let impl_list = add_if_some impl_list impl in
          let user_intf_list = add_if_some user_intf_list user_intf in
          let fields = add_if_some fields field in
          let classified_type_map =
            StringMap.add name (classified_item, new_item) classified_type_map
          in
          impl_list, user_intf_list, fields, classified_type_map)
        ~init:([], [], [], StringMap.empty)
        new_sorted_items
    in
    let module_name =
      name_upgrader_module ~old_file_version ~new_file_version
    in
    let upgrader_t = upgrader_t_name prefix in
    let converter_type =
      List.map ~f:(fun (name, intf) -> [%string "$name: $intf"]) fields
      |> String.concat ~sep:";\n"
    in
    let converter_type = [%string "type $converter = { $converter_type }"] in
    let converter_impl = List.map ~f:fst fields |> String.concat ~sep:";\n" in
    let converter_impl =
      [%string "let converter = $upgrader_t.$module_name.{ $converter_impl }"]
    in
    let old_version_t = name_t_module prefix old_file_version in
    let new_version_t = name_t_module prefix new_file_version in
    let user_fns_module =
      [%string "$(user_fns_module_name prefix).$module_name"]
    in
    let impl_header =
      [%string
        {|
include $user_fns_module
type $converter = $upgrader_t.$module_name.$converter|}]
    in
    let intf_header =
      [%string
        {|module $old_version : (module type of $old_version_t)
module $new_version : (module type of $new_version_t)
type $converter := $upgrader_t.$module_name.$converter|}]
    in
    let upgrader_t_header =
      [%string
        {|module $old_version = $old_version_t
module $new_version = $new_version_t|}]
    in
    let upgrader_t_intf_header =
      [%string
        {|module $old_version : (module type of $old_version_t)
module $new_version : (module type of $new_version_t)|}]
    in
    let main_type_impl =
      [%string "let $convert = $(convert)_$main_type $converter"]
    in
    let impl_list = main_type_impl :: converter_impl :: impl_list in
    let old_main_type_params =
      generate_type_params old_main_type_param_count ~start:0
    in
    let new_main_type_params =
      generate_type_params
        new_main_type_param_count
        ~start:old_main_type_param_count
    in
    let main_converter_type =
      [%string
        "$old_main_type_params$(old_version).$main_type -> \
         $new_main_type_params$(new_version).$main_type"]
    in
    let intf_list =
      [ [%string "val $convert: $main_converter_type"]
      ; [%string "val $converter: converter"]
      ]
    in
    Ok
      ( main_type
      , { impl_list =
            enclose_module ~module_name ~impl:true ~header:impl_header impl_list
        ; intf_list = enclose_module ~module_name ~header:intf_header intf_list
        ; user_intf_list =
            enclose_module ~module_name ~header:intf_header user_intf_list
        ; upgrader_t =
            enclose_module
              ~module_name
              ~impl:true
              ~header:upgrader_t_header
              [ converter_type ]
        ; upgrader_t_intf =
            enclose_module
              ~module_name
              ~header:upgrader_t_intf_header
              [ converter_type ]
        } )
