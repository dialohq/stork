let atd_extension = ".atd"

let main path =
  let open String in
  let folder, prefix =
    match rindex_opt path '/' with
    | Some last_slash_pos ->
      let total_length = length path in
      let pos = 0 in
      let len = last_slash_pos in
      let folder = sub path ~pos ~len in
      let pos = last_slash_pos + 1 in
      let len = total_length - last_slash_pos - 1 in
      let prefix = sub path ~pos ~len in
      folder, prefix
    | None ->
      ".", path
  in
  match Sys.is_directory folder with
  | (exception Sys_error _) | false ->
    Error (`Invalid_path folder)
  | true ->
    let prefix_len = length prefix in
    let extension_len = length atd_extension in
    let file_versions =
      Sys.readdir folder
      |> Array.to_list
      |> List.filter_map ~f:(fun file ->
             let file_len = length file in
             let file_prefix = sub ~pos:0 ~len:prefix_len file
             and file_extension =
               sub ~pos:(file_len - extension_len) ~len:extension_len file
             in
             match file_prefix = prefix && file_extension = atd_extension with
             | false ->
               None
             | true ->
               let file_version =
                 sub
                   ~pos:prefix_len
                   ~len:(file_len - prefix_len - extension_len)
                   file
               in
               (try Some (int_of_string file_version) with _ -> None))
      |> List.sort ~cmp:Int.compare
    in
    let recreate_path version =
      folder ^ "/" ^ prefix ^ string_of_int version ^ atd_extension
    in
    let rec make_upgraders = function
      | [] | [ _ ] ->
        ()
      | old_file_version :: new_file_version :: tail ->
        let () =
          Upgrader.make
            ~prefix
            ~old_file:(recreate_path old_file_version)
            ~new_file:(recreate_path new_file_version)
            ~old_file_version
            ~new_file_version
        in
        make_upgraders (new_file_version :: tail)
    in
    let () = make_upgraders file_versions in
    let file_paths =
      List.map ~f:recreate_path file_versions |> String.concat ~sep:"\n"
    in
    Ok file_paths
