open Test_framework
open Stork

(** Test suite for the Generator module. *)

let lines_match_snapshot lines { expect; _ } =
  (expect.lines lines).toMatchSnapshot ()

let string_equals s1 s2 { expect; _ } = (expect.string s1).toEqual s2

let test_upgraders ~test ~test_name files =
  let ( _
      , _
      , Upgrader.
          { intf_list; impl_list; user_intf_list; upgrader_t; upgrader_t_intf }
      )
    =
    Generator.make_upgraders files |> Result.get_ok
  in
  test (test_name ^ " - impl list snapshot") (lines_match_snapshot impl_list);
  test (test_name ^ " - intf list snapshot") (lines_match_snapshot intf_list);
  test
    (test_name ^ " - user intf list snapshot")
    (lines_match_snapshot user_intf_list);
  test
    (test_name ^ " - upgrader_t impl list snapshot")
    (lines_match_snapshot upgrader_t);
  test
    (test_name ^ " - upgrader_t intf list snapshot")
    (lines_match_snapshot upgrader_t_intf)

let test_json_parsing ~test ~test_name ~to_string ~from_string ~read file =
  let json_string = Yojson.Safe.from_file file |> Yojson.Safe.to_string in
  let doc_of_string = from_string json_string in
  let res_of_string = to_string doc_of_string in
  let doc_read = Atdgen_runtime.Util.Json.from_file read file in
  let res_read = to_string doc_read in
  let () =
    test
      (test_name
      ^ " - when parsing via\n\
        \ type_of_string and read_type, results equals for file "
      ^ file)
      (fun { expect; _ } -> (expect.string res_of_string).toEqual res_read)
  in
  test
    (test_name ^ " - parsing " ^ file)
    (fun { expect; _ } -> (expect.string res_of_string).toMatchSnapshot ())

let simple_test_json_parsing =
  test_json_parsing
    ~to_string:Simple_transitive_change.string_of_employee
    ~from_string:Simple_transitive_change.employee_of_string
    ~read:Simple_transitive_change.read_employee

let realistic_test_json_parsing =
  test_json_parsing
    ~to_string:Realistic.string_of_dialog_file
    ~from_string:Realistic.dialog_file_of_string
    ~read:Realistic.read_dialog_file

let single_version_json_parsing =
  test_json_parsing
    ~to_string:Single_version.string_of_employee
    ~from_string:Single_version.employee_of_string
    ~read:Single_version.read_employee

let () =
  let test_name = "simple transitive change" in
  describe "Generator" @@ fun { test; _ } ->
  test_upgraders
    ~test
    ~test_name
    [ "test/simple_transitive_change/simple_transitive_change_1.atd"
    ; "test/simple_transitive_change/simple_transitive_change_2.atd"
    ];
  simple_test_json_parsing
    ~test
    ~test_name
    "test/simple_transitive_change/simple_transitive_change_1.json";
  simple_test_json_parsing
    ~test
    ~test_name
    "test/simple_transitive_change/simple_transitive_change_2.json";
  let test_name = "simple transitive change" in
  test_upgraders
    ~test
    ~test_name
    [ "test/realistic_examples/realistic_202008241.atd"
    ; "test/realistic_examples/realistic_202103001.atd"
    ; "test/realistic_examples/realistic_202103115.atd"
    ];
  realistic_test_json_parsing
    ~test
    ~test_name
    "test/realistic_examples/realistic_202008241.json";
  let test_name = "single version" in
  test_upgraders ~test ~test_name [ "test/single_version/single_version_1.atd" ];
  single_version_json_parsing
    ~test
    ~test_name
    "test/single_version/single_version_1.json"
