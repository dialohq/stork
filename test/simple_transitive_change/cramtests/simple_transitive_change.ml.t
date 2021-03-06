  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat simple_transitive_change.ml | ocamlformat --enable-outside-detected-project --impl -
  [@@@ocaml.warning "-32-33-44"]
  
  open StdLabels
  module Types = Simple_transitive_change_2_t
  module Json = Simple_transitive_change_2_j
  
  module From_1_to_2 = struct
    include Simple_transitive_change_user_fns.From_1_to_2
  
    let convert_employer :
        converter ->
        OldVersion.employee ->
        OldVersion.employer ->
        NewVersion.employer =
     fun converter old_doc -> function
      | OldVersion.Self -> NewVersion.Self
      | OldVersion.Company payload ->
          NewVersion.Company (payload |> convert_company converter old_doc)
  
    let convert_employment :
        converter ->
        OldVersion.employee ->
        OldVersion.employment ->
        NewVersion.employment =
     fun converter old_doc (a_0, a_1) ->
      (a_0, a_1 |> convert_employer converter old_doc)
  
    let convert_employee : converter -> OldVersion.employee -> NewVersion.employee
        =
     fun converter old_doc ->
      old_doc |> fun old_record ->
      NewVersion.
        {
          name = old_record.name;
          age = old_record.age;
          position = old_record.position |> convert_employment converter old_doc;
          version = 2;
          skills =
            old_record.skills |> Array.map ~f:(convert_skill converter old_doc);
        }
  
    let converter =
      Simple_transitive_change_upgrader_t.From_1_to_2.
        {
          convert_employee;
          convert_employment;
          convert_employer;
          convert_company;
          convert_skill;
        }
  
    let convert = convert_employee converter
  end
  
  let convert_from_1_to_latest = From_1_to_2.convert
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
    Json.string_of_employee ?len { x with Types.version = 2 }
  
  let employee_of_string s =
    match get_version s with
    | `Int 2 -> Json.employee_of_string s
    | `Int 1 ->
        convert_from_1_to_latest
          (Simple_transitive_change_1_j.employee_of_string s)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let read_employee_from_file fname =
    match get_version_from_file fname with
    | `Int 2 -> Atdgen_runtime.Util.Json.from_file Json.read_employee fname
    | `Int 1 ->
        convert_from_1_to_latest
          (Atdgen_runtime.Util.Json.from_file
             Simple_transitive_change_1_j.read_employee fname)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let write_employee buf x = Json.write_employee buf { x with Types.version = 2 }
