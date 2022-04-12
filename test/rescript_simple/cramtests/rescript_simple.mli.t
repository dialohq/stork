  $ cd ..
  $ dune exec -- stork gen --rescript *.atd
  $ cat rescript_simple.mli | ocamlformat --enable-outside-detected-project --intf -
  module Types : module type of Rescript_simple_2_t
  module Json : module type of Rescript_simple_2_bs
  
  val write_employee : Types.employee Atdgen_codec_runtime.Encode.t
  val read_employee : Types.employee Atdgen_codec_runtime.Decode.t
  
  module From_1_to_2 : sig
    module OldVersion : module type of Rescript_simple_1_t
    module NewVersion : module type of Rescript_simple_2_t
  
    type converter = Rescript_simple_upgrader_t.From_1_to_2.converter
  
    val converter : converter
    val convert : OldVersion.employee -> NewVersion.employee
  end
