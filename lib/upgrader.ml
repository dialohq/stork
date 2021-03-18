open Ast.NoLoc

type generated =
  { intf_list : string list
  ; impl_list : string list
  ; user_intf_list : string list
  }

type variant_upgrade =
  | SameVariant of string
  | SameVariantWithPayload of string
  | ModifiedVariantWithPayload of (string * modification)

and field_upgrade =
  | SameField of string
  | ModifiedField of (string * modification)

and cell_upgrade =
  | SameCell
  | ModifiedCell of modification

and modification =
  | Different of string
  | Option of modification
  | Nullable of modification
  | Shared of modification
  | Wrap of modification
  | Sum of variant_upgrade list
  | Record of field_upgrade list
  | Tuple of cell_upgrade list
  | List of modification

type shallow_equal =
  | Same
  | TransitivelyModified of modification

type upgrade =
  | New
  | ShallowEqual of shallow_equal
  | Modified

module StringMap = Map.Make (String)

let load_sort path =
  let open Atd.Util in
  let (_module_head, module_body), _original_types =
    load_file ~inherit_fields:true ~inherit_variants:true path
  in
  tsort module_body

let to_no_loc_map module_body =
  let rec aux module_body map =
    match module_body with
    | [] ->
      map
    | item :: tail ->
      let (((name, _type_param, _annot), _type_expr) as noLocItem) =
        ModuleItem.from_loc item
      in
      let map = StringMap.add name noLocItem map in
      aux tail map
  in
  aux module_body StringMap.empty

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
               (_, (main_type_name, _, _), Atd.Ast.Record (_, field_list, _)) as
            main_type)
          ] )
      ]
      when has_version_field field_list ->
      ModuleItem.from_loc main_type :: flat_module_items, main_type_name
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
  let reverse_module_items, main_type_name = aux sorted_modules [] in
  List.rev reverse_module_items, main_type_name

(* since the types are shallow equal, it means their composing subtypes existed
   before, so they can only be same or modified, not new *)
let rec classify_shallow_equals ~classified_type_map = function
  | TypeExpr.List (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | TransitivelyModified modification ->
      TransitivelyModified (List modification))
  | TypeExpr.Option (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | TransitivelyModified modification ->
      TransitivelyModified (Option modification))
  | TypeExpr.Nullable (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | TransitivelyModified modification ->
      TransitivelyModified (Nullable modification))
  | TypeExpr.Shared (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | TransitivelyModified modification ->
      TransitivelyModified (Shared modification))
  | TypeExpr.Wrap (type_expr, _) ->
    (match classify_shallow_equals ~classified_type_map type_expr with
    | Same ->
      Same
    | TransitivelyModified modification ->
      TransitivelyModified (Wrap modification))
  | TypeExpr.Name ((("unit" | "bool" | "int" | "float" | "string"), _), _) ->
    Same
  | TypeExpr.Name (("abstract", _), _) ->
    failwith "Abstract types are unsupported"
  | TypeExpr.Name ((type_name, type_expr_list), _) ->
    let same_parameters =
      List.for_all
        ~f:(fun type_expr ->
          match classify_shallow_equals ~classified_type_map type_expr with
          | Same ->
            true
          | TransitivelyModified _ ->
            false)
        type_expr_list
    in
    (match
       same_parameters, StringMap.find_opt type_name classified_type_map
     with
    | _, None ->
      failwith ("unknown type " ^ type_name) (* should not happen *)
    | true, Some (ShallowEqual Same) ->
      Same
    | _ ->
      TransitivelyModified (Different type_name))
  | TypeExpr.Tvar _ ->
    Same
  | TypeExpr.Record (fields, _) ->
    let same = ref true in
    let field_upgrades =
      List.map fields ~f:(fun ((field_name, field_kind, _), type_expr) ->
          match classify_shallow_equals ~classified_type_map type_expr with
          | Same ->
            SameField field_name
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
      Same
    | false ->
      TransitivelyModified (Record field_upgrades))
  | TypeExpr.Sum (variants, _) ->
    let same = ref true in
    let variant_upgrades =
      List.map variants ~f:(fun ((variant_name, _), type_expr) ->
          match type_expr with
          | None ->
            SameVariant variant_name
          | Some type_expr ->
            (match classify_shallow_equals ~classified_type_map type_expr with
            | Same ->
              SameVariantWithPayload variant_name
            | TransitivelyModified modification ->
              let () = same := false in
              ModifiedVariantWithPayload (variant_name, modification)))
    in
    (match !same with
    | true ->
      Same
    | false ->
      TransitivelyModified (Sum variant_upgrades))
  | TypeExpr.Tuple (cells, _) ->
    let same = ref true in
    let cell_upgrades =
      List.map cells ~f:(fun (type_expr, _) ->
          match classify_shallow_equals ~classified_type_map type_expr with
          | Same ->
            SameCell
          | TransitivelyModified modification ->
            let () = same := false in
            ModifiedCell modification)
    in
    (match !same with
    | true ->
      Same
    | false ->
      TransitivelyModified (Tuple cell_upgrades))

let classify_item
    (((name, _, _), type_expr) as new_item : ModuleItem.t)
    ~old_type_map
    ~classified_type_map
  =
  match StringMap.find_opt name old_type_map with
  | None ->
    name, New
  | Some old_item when old_item = new_item ->
    name, ShallowEqual (classify_shallow_equals ~classified_type_map type_expr)
  | Some _ ->
    name, Modified

let old_version = "OldVersion"

let new_version = "NewVersion"

let convert = "convert"

let make = "make"

let user_fns_module_name prefix =
  [%string "$(String.capitalize_ascii prefix)_user_fns"]

let old_doc = "old_doc"

let rec modification_to_string ?main_type = function
  | Different type_name ->
    [%string "$(convert)_$type_name $old_doc"]
  | Option modification | Nullable modification ->
    [%string "Option.map ($(modification_to_string modification))"]
  | Shared modification | Wrap modification ->
    modification_to_string modification
  | Sum variant_upgrades ->
    let variants =
      List.map variant_upgrades ~f:(function
          | SameVariant variant_name ->
            [%string "| `$variant_name -> `$variant_name"]
          | SameVariantWithPayload variant_name ->
            [%string "| `$variant_name _ as variant -> variant"]
          | ModifiedVariantWithPayload (variant_name, modification) ->
            [%string
              "| `$variant_name payload -> `$variant_name (payload |> \
               ($(modification_to_string modification)))"])
      |> String.concat ~sep:"\n"
    in
    [%string "function \n$variants"]
  | Record field_upgrades ->
    let fields =
      List.map field_upgrades ~f:(fun field_upgrade ->
          match field_upgrade, main_type with
          | SameField "version", Some new_file_version ->
            [%string "version = %i$new_file_version;"]
          | SameField field_name, _ ->
            [%string "$field_name = old_record.$field_name;"]
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
        | ModifiedCell modification ->
          [%string "a_%i$i |> ($(modification_to_string modification))"])
      |> String.concat ~sep:", "
    in
    [%string "fun $tuple_var -> ($cells)"]
  | List modification ->
    [%string "List.map ~f:($(modification_to_string modification))"]

let classified_type_to_strings ~main_type ~new_file_version = function
  | name, ShallowEqual Same ->
    let impl =
      [%string
        "let $(convert)_$name: $old_version.$name -> $new_version.$name = \
         Obj.magic"]
    in
    Some impl, None
  | name, New ->
    let intf =
      [%string
        "val $(make)_$name: $old_version.$main_type -> $new_version.$name"]
    in
    None, Some intf
  | name, Modified when name = main_type ->
    let intf =
      [%string
        "val $(convert)_$name: $old_version.$main_type -> $new_version.$name"]
    in
    None, Some intf
  | name, Modified ->
    let intf =
      [%string
        "val $(convert)_$name: $old_version.$main_type -> $old_version.$name \
         -> $new_version.$name"]
    in
    None, Some intf
  | name, ShallowEqual (TransitivelyModified modification) when name = main_type
    ->
    let fn = modification_to_string ~main_type:new_file_version modification in
    let impl =
      [%string
        "let $(convert)_$name: $old_version.$main_type -> \
         $new_version.$main_type = fun $old_doc -> $old_doc |> ($fn)"]
    in
    Some impl, None
  | name, ShallowEqual (TransitivelyModified modification) ->
    let fn = modification_to_string modification in
    let impl =
      [%string
        "let $(convert)_$name: $old_version.$main_type -> $old_version.$name \
         -> $new_version.$name\n\
        \      = fun old_doc -> $fn"]
    in
    Some impl, None

let to_map : ModuleItem.t list -> ModuleItem.t StringMap.t =
  List.fold_left
    ~f:(fun map (((name, _, _), _) as item) -> StringMap.add name item map)
    ~init:StringMap.empty

let load_sort_map path =
  let sorted_items = load_sort path in
  let sorted_items, doc_type = sorted_items |> flatten_module_items in
  let item_map = to_map sorted_items in
  sorted_items, item_map, doc_type

let enclose_module ~header ~module_name ?(impl = false) = function
  | [] ->
    []
  | lines ->
    let delimiter = match impl with true -> "= struct" | false -> ": sig" in
    [%string "module $module_name $delimiter"]
    :: header :: List.rev ("end" :: lines)

let name_t_module prefix version =
  [%string "$(String.capitalize_ascii prefix)_%i$(version)_t"]

let name_j_module prefix version =
  [%string "$(String.capitalize_ascii prefix)_%i$(version)_j"]

let name_upgrader_module ~old_file_version ~new_file_version =
  [%string "From_%i$(old_file_version)_to_%i$new_file_version"]

let make ~prefix ~old_file ~old_file_version ~new_file ~new_file_version =
  let _old_sorted_items, old_type_map, old_doc_type = load_sort_map old_file in
  let new_sorted_items, _new_type_map, new_doc_type = load_sort_map new_file in
  if new_doc_type <> old_doc_type then
    Error (`Different_main_type (old_doc_type, new_doc_type))
  else
    let main_type = old_doc_type in
    let impl_list, user_intf_list, _ =
      List.fold_left
        ~f:(fun (impl_list, user_intf_list, classified_type_map) new_item ->
          let name, classified_item =
            classify_item ~old_type_map ~classified_type_map new_item
          in
          let impl, user_intf =
            classified_type_to_strings
              ~main_type
              ~new_file_version
              (name, classified_item)
          in
          let impl_list =
            match impl with None -> impl_list | Some impl -> impl :: impl_list
          in
          let user_intf_list =
            match user_intf with
            | None ->
              user_intf_list
            | Some user_intf ->
              user_intf :: user_intf_list
          in
          let classified_type_map =
            StringMap.add name classified_item classified_type_map
          in
          impl_list, user_intf_list, classified_type_map)
        ~init:([], [], StringMap.empty)
        new_sorted_items
    in
    let module_name =
      name_upgrader_module ~old_file_version ~new_file_version
    in
    let old_version_t = name_t_module prefix old_file_version in
    let new_version_t = name_t_module prefix new_file_version in
    let user_fns_module =
      [%string "$(user_fns_module_name prefix).$module_name"]
    in
    let impl_header =
      [%string
        {|module $old_version = $old_version_t
module $new_version = $new_version_t
include $user_fns_module|}]
    in
    let intf_header =
      [%string
        {|module $old_version := $old_version_t
module $new_version := $new_version_t|}]
    in
    let main_type_impl = [%string "let $convert = $(convert)_$main_type"] in
    let impl_list = main_type_impl :: impl_list in
    let intf_list =
      [ [%string
          "val $convert: $old_version.$main_type -> $new_version.$main_type"]
      ]
    in
    Ok
      ( main_type
      , { impl_list =
            enclose_module ~module_name ~impl:true ~header:impl_header impl_list
        ; intf_list = enclose_module ~module_name ~header:intf_header intf_list
        ; user_intf_list =
            enclose_module ~module_name ~header:intf_header user_intf_list
        } )
