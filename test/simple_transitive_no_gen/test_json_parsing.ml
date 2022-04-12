let () =
  [ "simple_transitive_change_1.json"; "simple_transitive_change_2.json" ]
  |> List.iter
       ~f:
         (Test_utils.print_parsed_json
            ~to_string:Simple_transitive_change.string_of_employee
            ~from_string:Simple_transitive_change.employee_of_string
            ~read_from_file:Simple_transitive_change.read_employee_from_file)
