let atd_extension = "atd"

let ( let+ ) o f = match o with Error e -> Error e | Ok x -> Ok (f x)

let ( let* ) o f = match o with Error e -> Error e | Ok x -> f x

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

let write_files
    ~folder ~prefix Upgrader.{ intf_list; impl_list; user_intf_list }
  =
  let path = [%string "$folder/$(prefix)"] in
  let () = File.write_string_list ~path:[%string "$(path).ml"] impl_list in
  let () = File.write_string_list ~path:[%string "$(path).mli"] intf_list in
  let user_fns_module_name = Upgrader.user_fns_module_name prefix in
  File.write_string_list
    ~path:[%string "$folder/$(String.lowercase_ascii user_fns_module_name).mli"]
    user_intf_list

let make_upgraders = function
  | [] ->
    Error `Empty_list
  | first_file :: _ as files ->
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
    in
    let* folder, prefix, _ = split_elements first_file in
    let rec get_versions acc = function
      | [] ->
        Ok acc
      | file :: tail ->
        (match split_elements file with
        | Ok (f, p, v) when (f, p) = (folder, prefix) ->
          get_versions (v :: acc) tail
        | Ok _ ->
          Error (`Different_prefix (folder ^ "/" ^ prefix, file))
        | Error e ->
          Error e)
    in
    let+ versions = get_versions [] files in
    let file_versions = List.sort ~cmp:Int.compare versions in
    let recreate_path version =
      [%string "$folder/$(prefix)_$( string_of_int version).$atd_extension"]
    in
    let rec make_upgraders ~acc = function
      | [] ->
        assert false
      | [ newest_version ] ->
        newest_version, acc
      | old_file_version :: new_file_version :: tail ->
        let acc =
          Upgrader.make
            ~prefix
            ~old_file:(recreate_path old_file_version)
            ~new_file:(recreate_path new_file_version)
            ~old_file_version
            ~new_file_version
          :: acc
        in
        make_upgraders ~acc (new_file_version :: tail)
    in
    let newest_version, upgraders_list = make_upgraders ~acc:[] file_versions in
    let rec flatten ~acc = function
      | [] ->
        acc
      | Upgrader.{ intf_list; impl_list; user_intf_list } :: tail ->
        let open Upgrader in
        let acc =
          { intf_list = intf_list @ acc.intf_list
          ; impl_list = impl_list @ acc.impl_list
          ; user_intf_list = user_intf_list @ acc.user_intf_list
          }
        in
        flatten ~acc tail
    in
    let upgraders =
      flatten
        ~acc:Upgrader.{ intf_list = []; impl_list = []; user_intf_list = [] }
        upgraders_list
    in
    let newest_module_t = Upgrader.make_t_module_name prefix newest_version in
    let types_module = [%string "module Types = $newest_module_t\n"] in
    let types_module_sig =
      [%string "module Types: module type of $newest_module_t\n"]
    in
    let upgraders =
      Upgrader.
        { upgraders with
          intf_list = types_module_sig :: upgraders.intf_list
        ; impl_list = types_module :: upgraders.impl_list
        }
    in
    folder, prefix, upgraders

let main files =
  let+ folder, prefix, upgraders = make_upgraders files in
  let () = write_files ~folder ~prefix upgraders in
  files
