type generated =
  { intf_list : string list
  ; impl_list : string list
  ; user_intf_list : string list
  }

type upgrade_kind =
  | New of string
  | Same of string
  | TransitivelyModified of
      { record_name : string
      ; unmodified_fields : string list
      ; transitive_fields : string list
      }
  | Modified of string

module StringMap = Map.Make (String)
open Ast.NoLoc

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
        , [ Atd.Ast.(
              Type (_, (main_type_name, _, _), Record (_, field_list, _)) as
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

let classify_record ~record_name ~old_fields ~new_fields ~new_type_map =
  let rec aux new_fields unmodified_fields transitive_fields =
    match new_fields with
    | [] ->
      TransitivelyModified { record_name; unmodified_fields; transitive_fields }
    | (((name, _field_kind, _annot), _type_expr) as new_field) :: tail ->
      (match
         ( StringMap.find_opt name new_type_map
         , List.find_opt ~f:(fun old_field -> old_field = new_field) old_fields
         )
       with
      | Some _, _ ->
        aux tail unmodified_fields (name :: transitive_fields)
      | _, Some ((name, _, _), _) ->
        aux tail (name :: unmodified_fields) transitive_fields
      | None, None ->
        Modified record_name)
  in
  aux new_fields [] []

let same_or_transitively_modified ~classified_type_map ~record_name = function
  | Ast.NoLoc.TypeExpr.Record (fields, _) ->
    (match
       List.fold_left
         ~init:([], [])
         ~f:
           (fun (unmodified_fields, transitive_fields) ((field_name, _, _), _) ->
           match StringMap.find_opt field_name classified_type_map with
           | Some (Same _) | None ->
             field_name :: unmodified_fields, transitive_fields
           | _ ->
             unmodified_fields, field_name :: transitive_fields)
         fields
     with
    | _, [] ->
      Same record_name
    | unmodified_fields, transitive_fields ->
      TransitivelyModified { record_name; unmodified_fields; transitive_fields })
  | _ ->
    Same record_name

let classify_item
    (((name, _, _), type_expr) as new_item : ModuleItem.t)
    ~old_type_map
    ~new_type_map
    ~classified_type_map
  =
  let open TypeExpr in
  match type_expr, StringMap.find_opt name old_type_map with
  | _, None ->
    New name
  | _, Some old_item when old_item = new_item ->
    same_or_transitively_modified
      ~classified_type_map
      ~record_name:name
      type_expr
  | Record (new_fields, _), Some (_, Record (old_fields, _)) ->
    classify_record ~record_name:name ~old_fields ~new_fields ~new_type_map
  | _, Some (_, _) ->
    New name

let old_version = "OldVersion"

let new_version = "NewVersion"

let convert = "convert"

let make = "make"

let user_fns_module_name prefix =
  [%string "$(String.capitalize_ascii prefix)_user_fns"]

let classified_type_to_strings
    ~intf_list ~impl_list ~user_intf_list ~old_doc_type ~new_type_map
  = function
  | Same name ->
    let impl =
      [%string
        "let $(convert)_$name: $old_version.$name -> $new_version.$name = \
         Obj.magic"]
    in
    let intf =
      [%string "val $(convert)_$name: $old_version.$name -> $new_version.$name"]
    in
    impl :: impl_list, intf :: intf_list, user_intf_list
  | New name ->
    let intf =
      [%string
        "val $(make)_$name: $old_version.$old_doc_type -> $new_version.$name"]
    in
    impl_list, intf :: intf_list, intf :: user_intf_list
  | Modified name ->
    let intf =
      [%string
        "val\n\
        \   $(convert)_$name: $old_version.$old_doc_type -> $old_version.$name \
         -> $new_version.$name"]
    in
    impl_list, intf :: intf_list, intf :: user_intf_list
  | TransitivelyModified { record_name; unmodified_fields; transitive_fields }
    ->
    let intf =
      [%string
        "val $(convert)_$record_name: $old_version.$old_doc_type -> \
         $old_version.$record_name -> $new_version.$record_name"]
    in
    let unmodified_fields =
      List.fold_left
        ~f:(fun acc field ->
          match StringMap.mem field new_type_map with
          | true ->
            acc ^ [%string "$field = $(convert)_$field old_record.$field;\n"]
          | false ->
            acc ^ [%string "$field = old_record.$field;\n"])
        ~init:""
        unmodified_fields
    in
    let transitive_fields =
      List.fold_left
        ~f:(fun acc field ->
          acc
          ^ [%string "$field = $(convert)_$field old_doc old_record.$field ;\n"])
        ~init:""
        transitive_fields
    in
    let impl =
      [%string
        "let $(convert)_$record_name (old_record: $old_version.$record_name)  \
         (old_doc: $old_version.$old_doc_type ) : $new_version.$record_name = \
         { $unmodified_fields $transitive_fields }"]
    in
    impl :: impl_list, intf :: intf_list, user_intf_list

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

let make ~prefix ~old_file ~old_file_version ~new_file ~new_file_version =
  let _old_sorted_items, old_type_map, old_doc_type = load_sort_map old_file in
  let new_sorted_items, new_type_map, _doc_type = load_sort_map new_file in
  let impl_list, intf_list, user_intf_list, _ =
    List.fold_left
      ~f:
        (fun (impl_list, intf_list, user_intf_list, classified_type_map)
             (((name, _, _), _) as new_item) ->
        let classified_item =
          classify_item
            ~old_type_map
            ~new_type_map
            ~classified_type_map
            new_item
        in
        let impl_list, intf_list, user_intf_list =
          classified_type_to_strings
            ~intf_list
            ~impl_list
            ~user_intf_list
            ~old_doc_type
            ~new_type_map
            classified_item
        in
        let classified_type_map =
          StringMap.add name classified_item classified_type_map
        in
        impl_list, intf_list, user_intf_list, classified_type_map)
      ~init:([], [], [], StringMap.empty)
      new_sorted_items
  in
  let module_name =
    [%string
      "From_$(string_of_int old_file_version)_to_$(string_of_int \
       new_file_version)"]
  in
  let old_version_t =
    [%string
      "$(String.capitalize_ascii prefix)_$(string_of_int old_file_version)_t"]
  in
  let new_version_t =
    [%string
      "$(String.capitalize_ascii prefix)_$(string_of_int new_file_version)_t"]
  in
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
  { impl_list =
      enclose_module ~module_name ~impl:true ~header:impl_header impl_list
  ; intf_list = enclose_module ~module_name ~header:intf_header intf_list
  ; user_intf_list =
      enclose_module ~module_name ~header:intf_header user_intf_list
  }
