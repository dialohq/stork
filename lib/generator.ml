open Letops.Result

let atd_extension = "atd"

let split_on_last_char ~char s =
  let open String in
  match rindex_opt s char with
  | None ->
    None
  | Some char_last_pos ->
    let total_length = length s in
    let pos = 0 in
    let len = char_last_pos in
    let first_part = sub s ~pos ~len in
    let pos = char_last_pos + 1 in
    let len = total_length - char_last_pos - 1 in
    let last_part = sub s ~pos ~len in
    Some (first_part, last_part)

let split_elements file =
  let folder, filename =
    split_on_last_char ~char:'/' file |> Option.value ~default:(".", file)
  in
  match split_on_last_char ~char:'.' filename with
  | Some (filename, ext) when ext = atd_extension ->
    (match split_on_last_char filename ~char:'_' with
    | None ->
      Error (`Invalid_version file)
    | Some (prefix, version) ->
      (match int_of_string_opt version with
      | None ->
        Error (`Invalid_version file)
      | Some version ->
        Ok (folder, prefix, version)))
  | Some _ | None ->
    Error (`Invalid_atd_file file)

let write_files
    ~folder
    ~prefix
    Upgrader.
      { intf_list; impl_list; user_intf_list; upgrader_t; upgrader_t_intf }
  =
  let path = [%string "$folder/$(prefix)"] in
  let upgrader_t_name = Upgrader.upgrader_t_name prefix in
  let upgrader_t_path =
    [%string "$folder/$(String.lowercase_ascii upgrader_t_name)"]
  in
  let () =
    File.write_string_list ~path:[%string "$(upgrader_t_path).ml"] upgrader_t
  in
  let () =
    File.write_string_list
      ~path:[%string "$(upgrader_t_path).mli"]
      upgrader_t_intf
  in
  let () = File.write_string_list ~path:[%string "$(path).ml"] impl_list in
  let () = File.write_string_list ~path:[%string "$(path).mli"] intf_list in
  let user_fns_module_name = Upgrader.user_fns_module_name prefix in
  File.write_string_list
    ~path:[%string "$folder/$(String.lowercase_ascii user_fns_module_name).mli"]
    user_intf_list

let name_convert_to_latest file_version =
  [%string "$(Upgrader.convert)_from_%i$(file_version)_to_latest"]

let make_convert_to_latest_fns = function
  | [] ->
    []
  | (old_file_version, newest_file_version) :: tail ->
    let convert = Upgrader.convert in
    let from_old_to_new =
      Upgrader.name_upgrader_module
        ~old_file_version
        ~new_file_version:newest_file_version
    in
    let latest_converter =
      [%string
        "let $(name_convert_to_latest old_file_version) = \
         $from_old_to_new.$convert"]
    in
    let rec aux ~acc = function
      | [] ->
        acc
      | (old_file_version, new_file_version) :: tail ->
        let from_old_to_new =
          Upgrader.name_upgrader_module ~old_file_version ~new_file_version
        in
        let acc =
          [%string
            "let $(name_convert_to_latest old_file_version) doc =  \
             $(name_convert_to_latest new_file_version) \
             ($from_old_to_new.$convert doc)"]
          :: acc
        in
        aux ~acc tail
    in
    aux ~acc:[ latest_converter ] tail |> List.rev

let make_get_version_from_json = function
  | Config.Native ->
    {|
let get_version_from_json = function
  | `Assoc fields ->
    let version =
      List.find_map
        ~f:(function "version", `Int version -> Some version | _ -> None)
        fields
    in
    (match version with
    | None ->
      invalid_arg "The parsed JSON should have a `version` field of type int"
    | Some version ->
      version)
  | _ ->
    invalid_arg "The parsed JSON should be an object."
|}
  | Config.Rescript ->
    {|
let get_version_from_json json =
  let toInteger : float -> int option = fun value ->
    if Js.Float.isFinite value && Js.Math.floor_float value == value 
    then Some (Obj.magic value)
    else None
  in let getVersionField obj = Js.Dict.get obj "version"
  in let obj = Js.Json.decodeObject json
  in let versionJson = Belt.Option.flatMap obj getVersionField
  in let versionNumber = Belt.Option.flatMap versionJson Js.Json.decodeNumber
  in let version = Belt.Option.flatMap versionNumber toInteger in
  match version with 
  | Some version -> version 
  | None -> invalid_arg "The parsed JSON should be an object with a `version` field of type int."
|}

let get_version =
  {|let get_version s = 
  get_version_from_json (Yojson.Safe.from_string s)|}

let get_version_from_lexbuf =
  {|let get_version_from_lexbuf p lb = 
  get_version_from_json (Yojson.Safe.from_lexbuf p lb)|}

let make_main_of_string ~impl_kind ~prefix ~main_type =
  let main_type_of_string = [%string "$(main_type)_of_string"] in
  function
  | [] ->
    assert false
  | latest_version :: tail ->
    let version_matches =
      List.map
        ~f:(fun version ->
          [%string
            "  | %i$version -> $(name_convert_to_latest version) \
             ($(Upgrader.name_impl_module impl_kind prefix \
             version).$main_type_of_string s)"])
        tail
      |> String.concat ~sep:"\n"
    in
    ( [%string
        {|
let $main_type_of_string s = match (get_version s) with
  | %i$latest_version -> Json.$main_type_of_string s
$version_matches
  | v -> invalid_arg ("Unknown document version: " ^ "'" ^ (string_of_int v) ^ "'")
|}]
    , [%string "val $main_type_of_string: string -> Types.$main_type"] )

let make_read_main ~impl_kind ~prefix ~main_type =
  let read_main_type = [%string "read_$main_type"] in
  match impl_kind with
  | Config.Native ->
    (function
    | [] ->
      assert false
    | latest_version :: tail ->
      let version_matches =
        List.map
          ~f:(fun version ->
            [%string
              "  | %i$version -> $(name_convert_to_latest version) \
               ($(Upgrader.name_impl_module impl_kind prefix \
               version).$read_main_type p lb)"])
          tail
        |> String.concat ~sep:"\n"
      in
      (* todo change implementation of lexbuf reuse *)
      ( [%string
          {|
let $read_main_type p lb = let Yojson.{ lnum; fname; _ } = p in 
  let new_p = Yojson.init_lexer ?fname ~lnum () in
  let ic = open_in_bin (Option.get fname) in
  let new_lb = Lexing.from_channel ic
  in match (get_version_from_lexbuf new_p new_lb) with
  | %i$latest_version -> Json.$read_main_type p lb
$version_matches
  | v -> invalid_arg ("Unknown document version: " ^ "'" ^ (string_of_int v) ^ "'")
|}]
      , [%string
          "val $read_main_type: Yojson.Safe.lexer_state -> Lexing.lexbuf -> \
           Types.$main_type"] ))
  | Config.Rescript ->
    (function
    | [] ->
      assert false
    | latest_version :: tail ->
      let version_matches =
        List.map
          ~f:(fun version ->
            [%string
              "  | %i$version -> $(name_convert_to_latest version) \
               ($(Upgrader.name_impl_module impl_kind prefix \
               version).$read_main_type json)"])
          tail
        |> String.concat ~sep:"\n"
      in
      ( [%string
          {|
let $read_main_type json = match (get_version_from_json json) with
| %i$latest_version -> Json.$read_main_type json
$version_matches
| v -> invalid_arg ("Unknown document version: " ^ "'" ^ (string_of_int v) ^ "'")
|}]
      , [%string
          "val $read_main_type: Types.$main_type Atdgen_codec_runtime.Decode.t"]
      ))

let make_string_of_main main_type =
  let intf =
    [%string "val string_of_$main_type: ?len:int -> Types.$main_type -> string"]
  in
  let impl = [%string "let string_of_$main_type = Json.string_of_$main_type"] in
  impl, intf

let make_write_main main_type =
  let intf =
    [%string
      "val write_$main_type: Types.$main_type Atdgen_codec_runtime.Encode.t"]
  in
  let impl = [%string "let write_$main_type = Json.write_$main_type"] in
  impl, intf

let make_read_and_write_main ~prefix ~impl_kind ~main_type versions =
  match impl_kind with
  | Config.Native ->
    let string_of_main_impl, string_of_main_intf =
      make_string_of_main main_type
    in
    let read_main_impl, read_main_intf =
      make_read_main ~prefix ~impl_kind ~main_type versions
    in
    let main_of_string_impl, main_of_string_intf =
      make_main_of_string ~prefix ~impl_kind ~main_type versions
    in
    let impl_list =
      [ make_get_version_from_json impl_kind
      ; get_version
      ; get_version_from_lexbuf
      ; string_of_main_impl
      ; main_of_string_impl
      ; read_main_impl
      ]
    in
    let intf_list =
      [ main_of_string_intf; string_of_main_intf; read_main_intf ]
    in
    impl_list, intf_list
  | Config.Rescript ->
    let write_main_impl, write_main_intf = make_write_main main_type in
    let read_main_impl, read_main_intf =
      make_read_main ~prefix ~impl_kind ~main_type versions
    in
    let impl_list =
      [ make_get_version_from_json impl_kind; write_main_impl; read_main_impl ]
    in
    let intf_list = [ write_main_intf; read_main_intf ] in
    impl_list, intf_list

let make_upgraders ?(impl_kind = Config.Native) ?output_prefix = function
  | [] ->
    Error `Empty_list
  | first_file :: _ as files ->
    let* folder, input_prefix, _ = split_elements first_file in
    let rec get_versions acc = function
      | [] ->
        Ok acc
      | file :: tail ->
        (match split_elements file with
        | Ok (f, p, v) when (f, p) = (folder, input_prefix) ->
          get_versions (v :: acc) tail
        | Ok _ ->
          Error (`Different_prefix (folder ^ "/" ^ input_prefix, file))
        | Error e ->
          Error e)
    in
    let* versions = get_versions [] files in
    let file_versions = List.sort ~cmp:Int.compare versions in
    let recreate_path version =
      [%string "$folder/$(input_prefix)_%i$(version).$atd_extension"]
    in
    let prefix = Option.value ~default:input_prefix output_prefix in
    let rec make_upgraders ~version_pairs ~main_type ~upgraders = function
      | [] ->
        assert false
      | [ newest_version ] ->
        let main_type =
          match main_type with
          | Some main_type ->
            main_type
          | None ->
            let _sorted_items, _type_map, main_type, _main_type_param_count =
              Upgrader.load_sort_map (recreate_path newest_version)
            in
            main_type
        in
        Ok (newest_version, main_type, version_pairs, upgraders)
      | old_file_version :: new_file_version :: tail ->
        (match
           Upgrader.make
             ~prefix
             ~old_file:(recreate_path old_file_version)
             ~new_file:(recreate_path new_file_version)
             ~old_file_version
             ~new_file_version
         with
        | Ok (main_type, upgrader) ->
          let upgraders = upgrader :: upgraders in
          let version_pairs =
            (old_file_version, new_file_version) :: version_pairs
          in
          let main_type = Some main_type in
          make_upgraders
            ~upgraders
            ~version_pairs
            ~main_type
            (new_file_version :: tail)
        | Error e ->
          Error e)
    in
    let* newest_version, main_type, version_pairs, upgraders_list =
      make_upgraders
        ~version_pairs:[]
        ~upgraders:[]
        ~main_type:None
        file_versions
    in
    let rec flatten ~acc = function
      | [] ->
        acc
      | Upgrader.
          { intf_list; impl_list; user_intf_list; upgrader_t; upgrader_t_intf }
        :: tail ->
        let open Upgrader in
        let acc =
          { intf_list = intf_list @ acc.intf_list
          ; impl_list = impl_list @ acc.impl_list
          ; user_intf_list = user_intf_list @ acc.user_intf_list
          ; upgrader_t = upgrader_t @ acc.upgrader_t
          ; upgrader_t_intf = upgrader_t_intf @ acc.upgrader_t_intf
          }
        in
        flatten ~acc tail
    in
    let upgraders =
      flatten
        ~acc:
          Upgrader.
            { intf_list = []
            ; impl_list = []
            ; user_intf_list = []
            ; upgrader_t = []
            ; upgrader_t_intf = []
            }
        upgraders_list
    in
    let newest_module_t = Upgrader.name_t_module prefix newest_version in
    let types_module = [%string "module Types = $newest_module_t"] in
    let types_module_sig =
      [%string "module Types: module type of $newest_module_t"]
    in
    let newest_module_impl =
      Upgrader.name_impl_module impl_kind prefix newest_version
    in
    let json_module = [%string "module Json = $newest_module_impl"] in
    let json_module_sig =
      [%string "module Json: module type of $newest_module_impl"]
    in
    let desc_versions = List.rev file_versions in
    let convert_to_latest_fns = make_convert_to_latest_fns version_pairs in
    let read_write_main_impl_list, read_write_main_intf_list =
      make_read_and_write_main ~prefix ~impl_kind ~main_type desc_versions
    in
    let open_std = "open StdLabels" in
    let disable_warnings_impl = {|[@@@ocaml.warning "-32-33-44"]|} in
    let disable_warnings_intf = {|[@@@ocaml.warning "-34"]|} in
    let upgraders =
      Upgrader.
        { upgraders with
          intf_list =
            types_module_sig
            ::
            json_module_sig :: (read_write_main_intf_list @ upgraders.intf_list)
        ; impl_list =
            disable_warnings_impl
            ::
            open_std
            ::
            types_module
            ::
            json_module
            ::
            (upgraders.impl_list
            @ convert_to_latest_fns
            @ read_write_main_impl_list)
        ; user_intf_list = disable_warnings_intf :: upgraders.user_intf_list
        }
    in
    Ok (folder, input_prefix, upgraders)

let main ?(impl_kind = Config.Native) ?output_prefix files =
  let output_folder_and_prefix =
    match output_prefix with
    | Some output_prefix ->
      split_on_last_char ~char:'/' output_prefix
      |> Option.value ~default:(".", output_prefix)
      |> Option.some
    | None ->
      None
  in
  let output_prefix = Option.map snd output_folder_and_prefix in
  let+ folder, file_prefix, upgraders =
    make_upgraders ~impl_kind ?output_prefix files
  in
  let folder, prefix =
    Option.value ~default:(folder, file_prefix) output_folder_and_prefix
  in
  let () = write_files ~folder ~prefix upgraders in
  files
