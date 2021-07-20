  $ cd ..
  $ dune exec -- stork gen -o custom_output_prefix original_output_prefix_1.atd original_output_prefix_bar.atd
  $ cat custom_output_prefix_upgrader_t.ml | ocamlformat --impl -
  module From_1_to_bar = struct
    module OldVersion = Custom_output_prefix_1_t
    module NewVersion = Custom_output_prefix_bar_t
  
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
