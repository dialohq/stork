val split_elements
  :  string
  -> ( string * string * string
     , [> `Invalid_atd_file of string | `Invalid_version of string ] )
     Result.t

val split_filename
  :  string
  -> (string * string * string, [> `Invalid_atd_file of string ]) Result.t

val split_commit
  :  string
  -> (int * string option, [> `Invalid_version of string ]) Result.t

val main
  :  ?impl_kind:Config.impl_kind
  -> ?output_prefix:string
  -> string list
  -> ( string list
     , [> `Different_main_type of string * string
       | `Different_prefix of string * string
       | `Empty_atd_file of string
       | `Empty_list
       | `Incoherent_version_field of string * string
       | `Invalid_atd_file of string
       | `Invalid_version of string
       | `No_version_field of string
       ] )
     result

val make_upgraders
  :  ?impl_kind:Config.impl_kind
  -> ?output_prefix:string
  -> string list
  -> ( string * string * Upgrader.generated
     , [> `Different_main_type of string * string
       | `Different_prefix of string * string
       | `Empty_atd_file of string
       | `Empty_list
       | `Incoherent_version_field of string * string
       | `Invalid_atd_file of string
       | `Invalid_version of string
       | `No_version_field of string
       ] )
     result
