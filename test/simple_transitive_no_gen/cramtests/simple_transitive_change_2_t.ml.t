  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat simple_transitive_change_2_t.ml | ocamlformat --enable-outside-detected-project --impl -
  (* Auto-generated from "simple_transitive_change_2.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = string * 'b
  type skill = { domain : string; name : string }
  type company = { name : string; turnover : int option }
  type employer = Self | Company of company
  type employment = employer tuple_2
  
  type employee = {
    name : string;
    age : int;
    position : employment;
    version : int;
    skills : skill Atdgen_runtime.Util.ocaml_array;
  }
