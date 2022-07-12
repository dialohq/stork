  $ cd ..
  $ dune exec -- stork gen --rescript --atdgen-opt="-type-attr=genType" *.atd
  $ cat rescript_simple_1_t.ml | ocamlformat --enable-outside-detected-project --impl -
  (* Auto-generated from "rescript_simple_1.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = string * 'b [@@genType]
  type skill = string tuple_2 [@@genType]
  type company = { name : string; address : string } [@@genType]
  type employer = Self | Company of company [@@genType]
  type employment = employer tuple_2 [@@genType]
  
  type employee = {
    name : string;
    age : int;
    position : employment;
    prev_position : employment option;
    version : int;
    skills : skill Atdgen_runtime.Util.ocaml_array;
  }
  [@@genType]
