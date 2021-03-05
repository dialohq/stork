open Test_framework
open Stork

(** Test suite for the Utils module. *)

let test_hello_with_name name { expect; _ } =
  let greeting = Utils.greet name in
  let expected = "Hello " ^ name ^ "!" in
  (expect.string greeting).toEqual expected

let () =
  describe "Utils" @@ fun { test; _ } ->
  test "can greet Tom" (test_hello_with_name "Tom");
  test "can greet John" (test_hello_with_name "John")
