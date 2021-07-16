type t =
  [ `Missing_env_var of string
  | `Invalid_path of string
  | `Empty_list
  | `Invalid_atd_file of string
  | `Invalid_version of string
  | `Different_prefix of string * string
  | `Atd_error of int * string
  | `Different_main_type of string * string
  | `System_error of string * int
  | `Empty_atd_file of string
  | `No_version_field of string
  | `Incoherent_version_field of string * string
  ]

val to_string : t -> string

val missing_env : string -> t

val invalid_path : string -> t

val empty_list : t
