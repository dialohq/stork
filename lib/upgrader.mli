type path := Stork_error.path

type type_name := Stork_error.type_name

type version := Stork_error.version

type type_param_count := int

type generated =
  { intf_list : string list
  ; impl_list : string list
  ; user_intf_list : string list
  ; upgrader_t : string list
  ; upgrader_t_intf : string list
  }
[@@deriving show]

val make
  :  prefix:path
  -> old_file:path
  -> old_file_version:version
  -> new_file:path
  -> new_file_version:version
  -> ( type_name * Version.t * Version.t * generated
     , [> `Different_main_type of type_name * type_name
       | `Empty_atd_file of path
       | `Incoherent_version_field of path * version
       | `No_version_field of path
       ] )
     result

val upgrader_t_name : string -> string

val user_fns_module_name : string -> string

val convert : string

val name_upgrader_module
  :  old_file_version:Version.t
  -> new_file_version:Version.t
  -> string

val name_t_module : path -> Version.t -> string

val name_impl_module : Config.impl_kind -> path -> Version.t -> string

val load_sort_map
  :  version:version
  -> path
  -> ( Ast.NoLoc.ModuleItem.t list
       * Ast.NoLoc.ModuleItem.t Map.Make(StringLabels).t
       * type_name
       * type_param_count
       * Version.t
     , [> `Empty_atd_file of path
       | `Incoherent_version_field of path * version
       | `No_version_field of path
       ] )
     result
