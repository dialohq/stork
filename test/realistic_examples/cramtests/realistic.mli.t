  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat realistic.mli  | ocamlformat --intf -
  File "<standard input>", line 1:
  Warning: Ocamlformat disabled because [--enable-outside-detected-project] is not set and no [.ocamlformat] was found within the project (root: ../../../../../.sandbox)
  module Types: module type of Realistic_202103115_t
  module Json: module type of Realistic_202103115_j
  val dialog_file_of_string: string -> Types.dialog_file
  val string_of_dialog_file: ?len:int -> Types.dialog_file -> string
  val read_dialog_file_from_file: string -> Types.dialog_file
  val write_dialog_file: Buffer.t -> Types.dialog_file -> unit
  module From_202008241_to_202103001 : sig
  module OldVersion : (module type of Realistic_202008241_t)
  module NewVersion : (module type of Realistic_202103001_t)
  type converter = Realistic_upgrader_t.From_202008241_to_202103001.converter
  val converter: converter
  val convert: OldVersion.dialog_file -> NewVersion.dialog_file
  end
  module From_202103001_to_202103115 : sig
  module OldVersion : (module type of Realistic_202103001_t)
  module NewVersion : (module type of Realistic_202103115_t)
  type converter = Realistic_upgrader_t.From_202103001_to_202103115.converter
  val converter: converter
  val convert: OldVersion.dialog_file -> NewVersion.dialog_file
  end
