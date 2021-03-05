module OldVersion := Foo_1_t
module NewVersion := Foo_2_t

val make_company
  :  OldVersion.company
  -> OldVersion.employee
  -> NewVersion.company
