let () =
  Test_utils.print_parsed_json
    ~to_string:Single_version.string_of_employee
    ~from_string:Single_version.employee_of_string
    ~read_from_file:Single_version.read_employee_from_file
    "single_version_1.json"
