type generated =
  { intf_list : string list
  ; impl_list : string list
  ; user_intf_list : string list
  }
[@@deriving show]

val make
  :  prefix:string
  -> old_file:string
  -> old_file_version:int
  -> new_file:string
  -> new_file_version:int
  -> (string * generated, [> `Different_main_type of string * string ]) result

val user_fns_module_name : string -> string

val convert : string

val name_upgrader_module
  :  old_file_version:int
  -> new_file_version:int
  -> string

val name_t_module : string -> int -> string

val name_j_module : string -> int -> string

val load_sort_map
  :  string
  -> ((string * string list * (string * (string * string option) list) list)
     * Ast.NoLoc.TypeExpr.t)
     list
     * ((string * Ast.NoLoc.ModuleItem.type_param * Ast.NoLoc.annot)
       * Ast.NoLoc.TypeExpr.t)
       Stdlib.Map.Make(Stdlib.StringLabels).t
     * string
     * int
