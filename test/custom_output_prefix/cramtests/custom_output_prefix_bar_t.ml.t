  $ cd ..
  $ dune exec -- stork gen -o custom_output_prefix original_output_prefix_1.atd original_output_prefix_bar.atd
  $ cat custom_output_prefix_bar_t.ml | ocamlformat --enable-outside-detected-project --impl -
  (* Auto-generated from "original_output_prefix_bar.atd" *)
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
    version : string;
    skills : skill Atdgen_runtime.Util.ocaml_array;
  }
