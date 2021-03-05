type t =
  [ `Missing_env_var of string
  | `Invalid_path of string
  ]

let to_string = function
  | `Missing_env_var s ->
    Printf.sprintf
      "The environment variable %S is needed, but could not be found in your \
       environment.\n\
       Hint: Try setting it and run the program again."
      s
  | `Invalid_path path ->
    Printf.sprintf
      "The given path %S is invalid, it doesn't point to a valid folder"
      path

let missing_env env = `Missing_env_var env

let invalid_path path = `Invalid_path path
