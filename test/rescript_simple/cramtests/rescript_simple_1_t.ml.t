  $ cd ..
  $ dune exec -- stork gen --rescript *.atd
  $ cat rescript_simple_1_t.ml | ocamlformat --enable-outside-detected-project --impl -
  (* Auto-generated from "rescript_simple_1.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = string * 'b
  type skill = string tuple_2
  type company = { name : string; address : string }
  type employer = Self | Company of company
  type employment = employer tuple_2
  
  type employee = {
    name : string;
    age : int;
    position : employment;
    prev_position : employment option;
    version : int;
    skills : skill Atdgen_runtime.Util.ocaml_array;
  }
