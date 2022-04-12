  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat nominal_variant_upgrader_t.mli | ocamlformat --enable-outside-detected-project --intf -
  module From_1_to_2 : sig
    module OldVersion : module type of Nominal_variant_1_t
    module NewVersion : module type of Nominal_variant_2_t
  
    type converter = {
      convert_json : converter -> OldVersion.json -> NewVersion.json;
      convert_variant :
        converter -> OldVersion.json -> OldVersion.variant -> NewVersion.variant;
    }
  end
