val main
  :  string list
  -> ( string list
     , [> `Different_main_type of string * string
       | `Different_prefix of string * string
       | `Empty_list
       | `Invalid_atd_file of string
       | `Invalid_version of string
       ] )
     result

val make_upgraders
  :  string list
  -> ( string * string * Upgrader.generated
     , [> `Different_main_type of string * string
       | `Different_prefix of string * string
       | `Empty_list
       | `Invalid_atd_file of string
       | `Invalid_version of string
       ] )
     result
