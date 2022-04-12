  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat single_version_1_t.mli | ocamlformat --enable-outside-detected-project --intf -
  (* Auto-generated from "single_version_1.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = string * 'b
  type skill = string tuple_2
  
  type company = {
    name : string;
    address : string;
  }
  
  type employer =
    [ `Self
    | `Company of company
    ]
  
  type employment = employer tuple_2
  
  type employee = {
    name : string;
    age : int;
    position : employment;
    version : int;
    skills : skill list;
  }
