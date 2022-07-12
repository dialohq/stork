  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat single_version.ml | ocamlformat --enable-outside-detected-project --impl -
  [@@@ocaml.warning "-32-33-44"]
  
  open StdLabels
  module Types = Single_version_1_t
  module Json = Single_version_1_j
  
  let version_to_string = function `Int v -> string_of_int v | `String s -> s
  
  let get_version_from_json = function
    | `Assoc fields -> (
        let version =
          List.find_map
            ~f:(function
              | "version", ((`String _ | `Int _) as version) -> Some version
              | _ -> None)
            fields
        in
        match version with
        | None ->
            invalid_arg
              "The parsed JSON should have a `version` field of type int or \
               string"
        | Some version -> version)
    | _ -> invalid_arg "The parsed JSON should be an object."
  
  let get_version s = get_version_from_json (Yojson.Safe.from_string s)
  
  let get_version_from_file fname =
    get_version_from_json (Yojson.Safe.from_file ~fname fname)
  
  let string_of_employee ?len x =
    Json.string_of_employee ?len { x with Types.version = 1 }
  
  let employee_of_string s =
    match get_version s with
    | `Int 1 -> Json.employee_of_string s
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let read_employee_from_file fname =
    match get_version_from_file fname with
    | `Int 1 -> Atdgen_runtime.Util.Json.from_file Json.read_employee fname
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let write_employee buf x = Json.write_employee buf { x with Types.version = 1 }
