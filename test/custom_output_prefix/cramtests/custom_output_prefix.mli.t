  $ cd ..
  $ dune exec -- stork gen -o custom_output_prefix original_output_prefix_1.atd original_output_prefix_bar.atd
  $ cat custom_output_prefix.mli | ocamlformat --enable-outside-detected-project --intf -
  module Types : module type of Custom_output_prefix_bar_t
  module Json : module type of Custom_output_prefix_bar_j
  
  val employee_of_string : string -> Types.employee
  val string_of_employee : ?len:int -> Types.employee -> string
  val read_employee_from_file : string -> Types.employee
  val write_employee : Buffer.t -> Types.employee -> unit
  
  module From_1_to_bar : sig
    module OldVersion : module type of Custom_output_prefix_1_t
    module NewVersion : module type of Custom_output_prefix_bar_t
  
    type converter = Custom_output_prefix_upgrader_t.From_1_to_bar.converter
  
    val converter : converter
    val convert : OldVersion.employee -> NewVersion.employee
  end
