  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat simple_transitive_change.mli | ocamlformat --enable-outside-detected-project --intf -
  module Types : module type of Simple_transitive_change_2_t
  module Json : module type of Simple_transitive_change_2_j
  
  val employee_of_string : string -> Types.employee
  val string_of_employee : ?len:int -> Types.employee -> string
  val read_employee_from_file : string -> Types.employee
  val write_employee : Buffer.t -> Types.employee -> unit
  
  module From_1_to_2 : sig
    module OldVersion : module type of Simple_transitive_change_1_t
    module NewVersion : module type of Simple_transitive_change_2_t
  
    type converter = Simple_transitive_change_upgrader_t.From_1_to_2.converter
  
    val converter : converter
    val convert : OldVersion.employee -> NewVersion.employee
  end
