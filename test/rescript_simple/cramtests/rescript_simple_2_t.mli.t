  $ cd ..
  $ dune exec -- stork gen --rescript *.atd
  $ cat rescript_simple_2_t.mli | ocamlformat --enable-outside-detected-project --intf -
  (* Auto-generated from "rescript_simple_2.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = string * 'b
  
  type skill = {
    domain : string;
    name : string;
  }
  
  type company = {
    name : string;
    turnover : int option;
  }
  
  type employer =
    | Self
    | Company of company
  
  type employment = employer tuple_2
  
  type employee = {
    name : string;
    age : int;
    position : employment;
    prev_position : employment option;
    version : int;
    skills : skill Atdgen_runtime.Util.ocaml_array;
  }
