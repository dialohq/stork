let write_string_list ~path string_list =
  let oc = open_out path in
  let () = List.iter ~f:(fun s -> Printf.fprintf oc "%s\n" s) string_list in
  close_out oc
