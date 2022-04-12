  $ cd ..
  $ dune exec -- stork gen --rescript --type-attr=genType *.atd
  $ cat rescript_simple_2_t.mli | ocamlformat --enable-outside-detected-project --intf -
  (* Auto-generated from "rescript_simple_2.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = string * 'b [@@genType]
  
  type skill = {
    domain : string;
    name : string;
  }
  [@@genType]
  
  type company = {
    name : string;
    turnover : int option;
  }
  [@@genType]
  
  type employer =
    | Self
    | Company of company
  [@@genType]
  
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
