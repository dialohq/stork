module From_1_to_2 = struct
  module OldVersion = Custom_output_prefix_1_t
  module NewVersion = Custom_output_prefix_2_t

  let convert_company _ _ (old_company : OldVersion.company)
      : NewVersion.company
    =
    { NewVersion.name = old_company.OldVersion.name; turnover = None }

  let convert_skill _ _ (domain, name) = NewVersion.{ domain; name }
end
