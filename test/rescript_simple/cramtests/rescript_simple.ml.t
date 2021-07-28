  $ cd ..
  $ dune exec -- stork gen --rescript *.atd
  $ cat rescript_simple.ml | ocamlformat --impl -
  [@@@ocaml.warning "-32-33-44"]
  
  open StdLabels
  module Types = Rescript_simple_2_t
  module Json = Rescript_simple_2_bs
  
  module From_1_to_2 = struct
    include Rescript_simple_user_fns.From_1_to_2
  
    let convert_employer
        :  converter -> OldVersion.employee -> OldVersion.employer
        -> NewVersion.employer
      =
     fun converter old_doc -> function
      | OldVersion.Self ->
        NewVersion.Self
      | OldVersion.Company payload ->
        NewVersion.Company (payload |> convert_company converter old_doc)
  
    let convert_employment
        :  converter -> OldVersion.employee -> OldVersion.employment
        -> NewVersion.employment
      =
     fun converter old_doc (a_0, a_1) ->
      a_0, a_1 |> convert_employer converter old_doc
  
    let convert_employee : converter -> OldVersion.employee -> NewVersion.employee
      =
     fun converter old_doc ->
      old_doc |> fun old_record ->
      NewVersion.
        { name = old_record.name
        ; age = old_record.age
        ; position = old_record.position |> convert_employment converter old_doc
        ; prev_position =
            ( old_record.prev_position |> fun x ->
              Belt.Option.map x (convert_employment converter old_doc) )
        ; version = 2
        ; skills =
            ( old_record.skills |> fun x ->
              Belt.Array.map x (convert_skill converter old_doc) )
        }
  
    let converter =
      Rescript_simple_upgrader_t.From_1_to_2.
        { convert_employee
        ; convert_employment
        ; convert_employer
        ; convert_company
        ; convert_skill
        }
  
    let convert = convert_employee converter
  end
  
  let convert_from_1_to_latest = From_1_to_2.convert
  
  let version_to_string = function `Int v -> string_of_int v | `String s -> s
  
  let get_version_from_json json =
    let toInteger : float -> int option =
     fun value ->
      if Js.Float.isFinite value && Js.Math.floor_float value == value then
        Some (int_of_float value)
      else
        None
    in
    let getVersionField obj = Js.Dict.get obj "version" in
    let obj = Js.Json.decodeObject json in
    let versionJson = Belt.Option.flatMap obj getVersionField in
    let invalid_arg_message =
      "The parsed JSON should be an object with a `version` field of type int or \
       string."
    in
    let version = Belt.Option.map versionJson Js.Json.classify in
    match version with
    | Some (Js.Json.JSONString version) ->
      `String version
    | Some (Js.Json.JSONNumber version) ->
      (match toInteger version with
      | Some version ->
        `Int version
      | None ->
        invalid_arg invalid_arg_message)
    | Some _ | None ->
      invalid_arg invalid_arg_message
  
  let write_employee x = Json.write_employee { x with Types.version = 2 }
  
  let read_employee json =
    match get_version_from_json json with
    | `Int 2 ->
      Json.read_employee json
    | `Int 1 ->
      convert_from_1_to_latest (Rescript_simple_1_bs.read_employee json)
    | v ->
      invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
