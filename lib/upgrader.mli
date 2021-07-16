type generated =
  { intf_list : string list
  ; impl_list : string list
  ; user_intf_list : string list
  ; upgrader_t : string list
  ; upgrader_t_intf : string list
  }
[@@deriving show]

val make
  :  prefix:string
  -> old_file:string
  -> old_file_version:string
  -> new_file:string
  -> new_file_version:string
  -> ( string * Version.t * Version.t * generated
     , [> `Different_main_type of string * string
       | `Empty_atd_file of string
       | `Incoherent_version_field of string * string
       | `No_version_field of string
       ] )
     result

val upgrader_t_name : string -> string

val user_fns_module_name : string -> string

val convert : string

val name_upgrader_module
  :  old_file_version:Version.t
  -> new_file_version:Version.t
  -> string

val name_t_module : string -> Version.t -> string

val name_impl_module : Config.impl_kind -> string -> Version.t -> string

val load_sort_map
  :  version:string
  -> string
  -> ( ((string * string list * (string * (string * string option) list) list)
       * Ast.NoLoc.TypeExpr.t)
       list
       * ((string * Ast.NoLoc.ModuleItem.type_param * Ast.NoLoc.annot)
         * Ast.NoLoc.TypeExpr.t)
         Stdlib.Map.Make(Stdlib.StringLabels).t
       * string
       * int
       * Version.t
     , [> `Empty_atd_file of string
       | `Incoherent_version_field of string * string
       | `No_version_field of string
       ] )
     result
