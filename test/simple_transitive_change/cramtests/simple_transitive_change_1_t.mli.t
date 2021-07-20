  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat simple_transitive_change_1_t.mli | ocamlformat --intf -
  (* Auto-generated from "simple_transitive_change_1.atd" *)
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
