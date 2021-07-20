module From_1_to_2 = struct
  include Simple_transitive_change_upgrader_t.From_1_to_2

  let convert_company _ _ (old_company : OldVersion.company)
      : NewVersion.company
    =
    { NewVersion.name = old_company.OldVersion.name; turnover = None }

  let convert_skill _ _ (domain, name) = NewVersion.{ domain; name }
end
