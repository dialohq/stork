  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat rescript_simple_upgrader_t.mli | ocamlformat --intf -
  module From_1_to_2 : sig
    module OldVersion : module type of Rescript_simple_1_t
  
    module NewVersion : module type of Rescript_simple_2_t
  
    type converter =
      { convert_employee : converter -> OldVersion.employee -> NewVersion.employee
      ; convert_employment :
          converter
          -> OldVersion.employee
          -> OldVersion.employment
          -> NewVersion.employment
      ; convert_employer :
          converter
          -> OldVersion.employee
          -> OldVersion.employer
          -> NewVersion.employer
      ; convert_company :
          converter
          -> OldVersion.employee
          -> OldVersion.company
          -> NewVersion.company
      ; convert_skill :
          converter -> OldVersion.employee -> OldVersion.skill -> NewVersion.skill
      }
  end
