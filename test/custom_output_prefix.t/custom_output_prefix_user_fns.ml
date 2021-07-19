module From_1_to_bar = struct
  include Custom_output_prefix_upgrader_t.From_1_to_bar

  let convert_company _ _ (old_company : OldVersion.company)
      : NewVersion.company
    =
    { NewVersion.name = old_company.OldVersion.name; turnover = None }

  let convert_skill _ _ (domain, name) = NewVersion.{ domain; name }
end
