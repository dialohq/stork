module From_1_to_2 = struct
  module OldVersion = Simple_transitive_change_1_t
  module NewVersion = Simple_transitive_change_2_t

  let convert_company _ (old_company : OldVersion.company) : NewVersion.company =
    { NewVersion.name = old_company.OldVersion.name; turnover = None }
end
