  $ cd ..
  $ dune exec -- stork gen -o custom_output_prefix original_output_prefix_1.atd original_output_prefix_bar.atd
  $ cat custom_output_prefix_1_t.mli | ocamlformat --intf -
  (* Auto-generated from "original_output_prefix_1.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = string * 'b
  
  type skill = string tuple_2
  
  type company =
    { name : string
    ; address : string
    }
  
  type employer =
    | Self
    | Company of company
  
  type employment = employer tuple_2
  
  type employee =
    { name : string
    ; age : int
    ; position : employment
    ; version : int
    ; skills : skill Atdgen_runtime.Util.ocaml_array
    }
