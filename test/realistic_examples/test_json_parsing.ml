let () =
  Test_utils.print_parsed_json ~to_string:Realistic.string_of_dialog_file
    ~from_string:Realistic.dialog_file_of_string
    ~read_from_file:Realistic.read_dialog_file_from_file
    "realistic_202008241.json"
