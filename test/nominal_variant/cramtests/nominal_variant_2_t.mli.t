  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat nominal_variant_2_t.mli | ocamlformat --enable-outside-detected-project --intf -
  (* Auto-generated from "nominal_variant_2.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type variant = Field
  type json = { variant : variant; field2 : string; version : int }
