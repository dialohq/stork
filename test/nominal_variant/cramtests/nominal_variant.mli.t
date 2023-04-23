  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat nominal_variant.mli | ocamlformat --enable-outside-detected-project --intf -
  module Types : module type of Nominal_variant_2_t
  module Json : module type of Nominal_variant_2_j
  
  val json_of_string : string -> Types.json
  val string_of_json : ?len:int -> Types.json -> string
  val read_json_from_file : string -> Types.json
  val write_json : Buffer.t -> Types.json -> unit
  
  module From_1_to_2 : sig
    module OldVersion : module type of Nominal_variant_1_t
    module NewVersion : module type of Nominal_variant_2_t
  
    type converter = Nominal_variant_upgrader_t.From_1_to_2.converter
  
    val converter : converter
    val convert : OldVersion.json -> NewVersion.json
  end
