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

let to_string = function
  | `Missing_env_var s ->
    Printf.sprintf
      "The environment variable %S is needed, but could not be found in your \
       environment.\n\
       Hint: Try setting it and run the program again." s
  | `Invalid_path path ->
    Printf.sprintf
      "The given path %S is invalid, it doesn't point to a valid folder" path
  | `Empty_list -> "You must provide at least one file"
  | `Invalid_atd_file file ->
    Printf.sprintf
      "%s is not a valid ATD file, it should have an .atd extension" file
  | `Invalid_version file ->
    Printf.sprintf
      "%s is not a valid filename, it must end with an underscore followed by \
       version number, eg foo_1337.atd"
      file
  | `Different_prefix (prefix, file) ->
    Printf.sprintf
      "%s is not a valid path, it should be in the same folder and start with \
       the same prefix as other given files: %s"
      file prefix
  | `Atd_error (error, file) ->
    Printf.sprintf
      "ATD exited with error %i when generating serializers for file %s" error
      file
  | `Different_main_type (old_main_type, new_main_type) ->
    Printf.sprintf
      "The main type should always be the same, but %s is different from %s"
      new_main_type old_main_type
  | `System_error (cmd, retval) ->
    Printf.sprintf "Command `%s` failed with return value %i" cmd retval
  | `Empty_atd_file path -> Printf.sprintf "ATD file `%s` is empty" path
  | `No_version_field path ->
    Printf.sprintf
      "In ATD file `%s`, the main (and last) type is not a record with a \
       `version` field of type `int` as it should"
      path
  | `Incoherent_version_field (path, version) ->
    Printf.sprintf
      "In ATD file `%s`, `version` is of type `int` but its version number is \
       `%s` and cannot be converted to an int"
      path version

let missing_env env = `Missing_env_var env
let invalid_path path = `Invalid_path path
let empty_list = `Empty_list
