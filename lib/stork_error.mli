type t =
  [ `Missing_env_var of string
  | `Invalid_path of string
  | `Empty_list
  | `Invalid_atd_file of string
  | `Invalid_version of string
  | `Different_prefix of string * string
  | `Atd_error of int * string
  ]

val to_string : t -> string

val missing_env : string -> t

val invalid_path : string -> t

val empty_list : t
