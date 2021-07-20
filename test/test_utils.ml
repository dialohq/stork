let print_parsed_json ~to_string ~from_string ~read_from_file file =
  let json_string = Yojson.(Safe.from_file file |> Yojson.Safe.to_string) in
  let doc_of_string = from_string json_string in
  let res_of_string = to_string doc_of_string in
  let doc_read = read_from_file file in
  let res_read = to_string doc_read in
  assert (res_of_string = res_read);
  print_endline res_read;
  print_endline "---";
  print_endline res_of_string;
  print_endline "---"
