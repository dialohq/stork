  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat single_version.mli | ocamlformat --enable-outside-detected-project --intf -
  module Types : module type of Single_version_1_t
  module Json : module type of Single_version_1_j
  
  val employee_of_string : string -> Types.employee
  val string_of_employee : ?len:int -> Types.employee -> string
  val read_employee_from_file : string -> Types.employee
  val write_employee : Bi_outbuf.t -> Types.employee -> unit
