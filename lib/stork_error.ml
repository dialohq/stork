type t =
  [ `Missing_env_var of string
  | `Invalid_path of string
  | `Empty_list
  | `Invalid_atd_file of string
  | `Invalid_version of string
  | `Different_prefix of string * string
  | `Atd_error of int * string
  | `Different_main_type of string * string
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
  | `Empty_list ->
    "You must provide at least one file"
  | `Invalid_atd_file file ->
    Printf.sprintf
      "%s is not a valid ATD file, it should have an .atd extension"
      file
  | `Invalid_version file ->
    Printf.sprintf
      "%s is not a valid filename, it must end with an underscore followed by \
       version number, eg foo_1337.atd"
      file
  | `Different_prefix (prefix, file) ->
    Printf.sprintf
      "%s is not a valid path, it should be in the same folder and start with \
       the same prefix as other given files: %s"
      file
      prefix
  | `Atd_error (error, file) ->
    Printf.sprintf
      "ATD exited with error %i when generating serializers for file %s"
      error
      file
  | `Different_main_type (old_main_type, new_main_type) ->
    Printf.sprintf
      "The main type should always be the same, but %s is different from %s"
      new_main_type
      old_main_type

let missing_env env = `Missing_env_var env

let invalid_path path = `Invalid_path path

let empty_list = `Empty_list
