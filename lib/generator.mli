val split_elements
  :  string
  -> ( string * string * string
     , [> `Invalid_atd_file of string | `Invalid_version of string ] )
     Result.t

val main
  :  ?impl_kind:Config.impl_kind
  -> ?output_prefix:string
  -> string list
  -> ( string list
     , [> `Different_main_type of string * string
       | `Different_prefix of string * string
       | `Empty_list
       | `Invalid_atd_file of string
       | `Invalid_version of string
       ] )
     result

val make_upgraders
  :  ?impl_kind:Config.impl_kind
  -> ?output_prefix:string
  -> string list
  -> ( string * string * Upgrader.generated
     , [> `Different_main_type of string * string
       | `Different_prefix of string * string
       | `Empty_list
       | `Invalid_atd_file of string
       | `Invalid_version of string
       ] )
     result
