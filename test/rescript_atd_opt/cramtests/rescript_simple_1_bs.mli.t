  $ cd ..
  $ dune exec -- stork gen --rescript --atdgen-opt="-type-attr=genType" *.atd
  $ cat rescript_simple_1_bs.mli | ocamlformat --enable-outside-detected-project --intf -
  (* Auto-generated from "rescript_simple_1.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = 'b Rescript_simple_1_t.tuple_2
  type skill = Rescript_simple_1_t.skill
  
  type company = Rescript_simple_1_t.company = {
    name : string;
    address : string;
  }
  
  type employer = Rescript_simple_1_t.employer =
    | Self
    | Company of company
  
  type employment = Rescript_simple_1_t.employment
  
  type employee = Rescript_simple_1_t.employee = {
    name : string;
    age : int;
    position : employment;
    prev_position : employment option;
    version : int;
    skills : skill Atdgen_runtime.Util.ocaml_array;
  }
  
  val read_tuple_2
    :  'b Atdgen_codec_runtime.Decode.t ->
    'b tuple_2 Atdgen_codec_runtime.Decode.t
  
  val write_tuple_2
    :  'b Atdgen_codec_runtime.Encode.t ->
    'b tuple_2 Atdgen_codec_runtime.Encode.t
  
  val read_skill : skill Atdgen_codec_runtime.Decode.t
  val write_skill : skill Atdgen_codec_runtime.Encode.t
  val read_company : company Atdgen_codec_runtime.Decode.t
  val write_company : company Atdgen_codec_runtime.Encode.t
  val read_employer : employer Atdgen_codec_runtime.Decode.t
  val write_employer : employer Atdgen_codec_runtime.Encode.t
  val read_employment : employment Atdgen_codec_runtime.Decode.t
  val write_employment : employment Atdgen_codec_runtime.Encode.t
  val read_employee : employee Atdgen_codec_runtime.Decode.t
  val write_employee : employee Atdgen_codec_runtime.Encode.t
