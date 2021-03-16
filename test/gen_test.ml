open Test_framework
open Stork

(** Test suite for the Generator module. *)

let lines_match_snapshot lines { expect; _ } =
  (expect.lines lines).toMatchSnapshot ()

let string_match_snapshot s { expect; _ } = (expect.string s).toMatchSnapshot ()

let test_upgraders ~test ~test_name files =
  let _, _, Upgrader.{ intf_list; impl_list; user_intf_list } =
    Generator.make_upgraders files |> Result.get_ok
  in
  test (test_name ^ " - impl list snapshot") (lines_match_snapshot impl_list);
  test (test_name ^ " - intf list snapshot") (lines_match_snapshot intf_list);
  test
    (test_name ^ " - user intf list snapshot")
    (lines_match_snapshot user_intf_list)

let test_json_parsing ~test ~test_name file =
  let json_string = Yojson.Safe.(from_file file |> to_string) in
  let employee = Simple_transitive_change.employee_of_string json_string in
  let res = Simple_transitive_change.string_of_employee employee in
  test (test_name ^ " - parsing " ^ file) (string_match_snapshot res)

let () =
  let test_name = "simple transitive change" in
  describe "Generator" @@ fun { test; _ } ->
  test_upgraders
    ~test
    ~test_name
    [ "test/simple_transitive_change/simple_transitive_change_1.atd"
    ; "test/simple_transitive_change/simple_transitive_change_2.atd"
    ];
  test_json_parsing
    ~test
    ~test_name
    "test/simple_transitive_change/simple_transitive_change_1.json";
  test_json_parsing
    ~test
    ~test_name
    "test/simple_transitive_change/simple_transitive_change_2.json"
