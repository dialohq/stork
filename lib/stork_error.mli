type t =
  [ `Missing_env_var of string
  | `Invalid_path of string
  ]

val to_string : t -> string

val missing_env : string -> t

val invalid_path : string -> t
