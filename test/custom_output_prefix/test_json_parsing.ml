let () =
  [ "custom_output_prefix_1.json"; "custom_output_prefix_bar.json" ]
  |> List.iter
       ~f:
         (Test_utils.print_parsed_json
            ~to_string:Custom_output_prefix.string_of_employee
            ~from_string:Custom_output_prefix.employee_of_string
            ~read_from_file:Custom_output_prefix.read_employee_from_file)
