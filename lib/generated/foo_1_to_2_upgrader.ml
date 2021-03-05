module OldVersion = Foo_1_t
module NewVersion = Foo_2_t
include Foo_1_to_2_user_fns

let make_employee
    (old_record : OldVersion.employee) (old_doc : OldVersion.employee)
    : NewVersion.employee
  =
  NewVersion.
    { version = old_record.OldVersion.version
    ; age = old_record.OldVersion.age
    ; name = old_record.OldVersion.name
    ; company = make_company old_record.OldVersion.company old_doc
    }
