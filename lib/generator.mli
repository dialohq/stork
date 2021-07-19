type path := Stork_error.path

type type_name := Stork_error.type_name

type version := Stork_error.version

val split_elements
  :  path
  -> ( path * path * version
     , [> `Invalid_atd_file of path | `Invalid_version of path ] )
     Result.t

val split_filename
  :  string
  -> (string * string * string, [> `Invalid_atd_file of string ]) Result.t

val split_commit
  :  string
  -> (int * string option, [> `Invalid_version of string ]) Result.t

val main
  :  ?impl_kind:Config.impl_kind
  -> ?output_prefix:path
  -> path list
  -> ( path list
     , [> `Different_main_type of type_name * type_name
       | `Different_prefix of path * path
       | `Empty_atd_file of path
       | `Empty_list
       | `Incoherent_version_field of path * version
       | `Invalid_atd_file of path
       | `Invalid_version of path
       | `No_version_field of path
       ] )
     result

val make_upgraders
  :  ?impl_kind:Config.impl_kind
  -> ?output_prefix:path
  -> path list
  -> ( path * path * Upgrader.generated
     , [> `Different_main_type of type_name * type_name
       | `Different_prefix of path * path
       | `Empty_atd_file of path
       | `Empty_list
       | `Incoherent_version_field of path * version
       | `Invalid_atd_file of path
       | `Invalid_version of path
       | `No_version_field of path
       ] )
     result
