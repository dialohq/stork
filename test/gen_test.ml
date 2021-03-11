open Test_framework
open Stork

(** Test suite for the Generator module. *)

let lines_match_snapshot lines { expect; _ } =
  (expect.lines lines).toMatchSnapshot ()

let test_upgraders ~test ~test_name files =
  let _, _, Upgrader.{ intf_list; impl_list; user_intf_list } =
    Generator.make_upgraders files |> Result.get_ok
  in
  test (test_name ^ " - impl list snapshot") (lines_match_snapshot impl_list);
  test (test_name ^ " - intf list snapshot") (lines_match_snapshot intf_list);
  test
    (test_name ^ " - user intf list snapshot")
    (lines_match_snapshot user_intf_list)

let () =
  describe "Generator" @@ fun { test; _ } ->
  test_upgraders
    ~test
    ~test_name:"simple transitive change"
    [ "test/simple_transitive_change/simple_transitive_change_1.atd"
    ; "test/simple_transitive_change/simple_transitive_change_2.atd"
    ]
