  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat nominal_variant_upgrader_t.ml | ocamlformat --enable-outside-detected-project --impl -
  module From_1_to_2 = struct
    module OldVersion = Nominal_variant_1_t
    module NewVersion = Nominal_variant_2_t
  
    type converter = {
      convert_json : converter -> OldVersion.json -> NewVersion.json;
      convert_variant :
        converter -> OldVersion.json -> OldVersion.variant -> NewVersion.variant;
    }
  end
