module OldVersion = Foo_1_t
module NewVersion = Foo_2_t

let make_company (old_company : OldVersion.company) _ : NewVersion.company =
  { NewVersion.name = old_company.OldVersion.name; turnover = None }
