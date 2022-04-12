type path = string
type type_name = string
type version = string
type var_name = string
type error_code = int
type command = string

type t =
  [ `Missing_env_var of var_name
  | `Invalid_path of path
  | `Empty_list
  | `Invalid_atd_file of path
  | `Invalid_version of path
  | `Different_prefix of path * path
  | `Atd_error of error_code * path
  | `Different_main_type of type_name * type_name
  | `System_error of command * error_code
  | `Empty_atd_file of path
  | `No_version_field of path
  | `Incoherent_version_field of path * version
  ]

val to_string : t -> string
val missing_env : var_name -> t
val invalid_path : path -> t
val empty_list : t
