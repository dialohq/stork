  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat nominal_variant.ml | ocamlformat --enable-outside-detected-project --impl -
  [@@@ocaml.warning "-32-33-44"]
  
  open StdLabels
  
  module From_1_to_2 = struct
    include Nominal_variant_user_fns.From_1_to_2
  
    let convert_variant
        : converter -> OldVersion.json -> OldVersion.variant -> NewVersion.variant
      =
     fun _ _ x -> Obj.magic x
  
    let converter =
      Nominal_variant_upgrader_t.From_1_to_2.{ convert_json; convert_variant }
  
    let convert = convert_json converter
  end
  
  let convert_from_1_to_latest = From_1_to_2.convert
  let version_to_string = function `Int v -> string_of_int v | `String s -> s
  
  let get_version_from_json = function
    | `Assoc fields ->
      let version =
        List.find_map
          ~f:(function
            | "version", ((`String _ | `Int _) as version) -> Some version
            | _ -> None)
          fields
      in
      (match version with
      | None ->
        invalid_arg
          "The parsed JSON should have a `version` field of type int or string"
      | Some version -> version)
    | _ -> invalid_arg "The parsed JSON should be an object."
  
  let get_version s = get_version_from_json (Yojson.Safe.from_string s)
  
  let get_version_from_file fname =
    get_version_from_json (Yojson.Safe.from_file ~fname fname)
  
  let string_of_json ?len x =
    Json.string_of_json ?len { x with Types.version = 2 }
  
  let json_of_string s =
    match get_version s with
    | `Int 2 -> Json.json_of_string s
    | `Int 1 -> convert_from_1_to_latest (Nominal_variant_1_j.json_of_string s)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let read_json_from_file fname =
    match get_version_from_file fname with
    | `Int 2 -> Atdgen_runtime.Util.Json.from_file Json.read_json fname
    | `Int 1 ->
      convert_from_1_to_latest
        (Atdgen_runtime.Util.Json.from_file Nominal_variant_1_j.read_json fname)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let write_json buf x = Json.write_json buf { x with Types.version = 2 }
