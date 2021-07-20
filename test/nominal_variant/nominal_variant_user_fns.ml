module From_1_to_2 = struct
  include Nominal_variant_upgrader_t.From_1_to_2

  let convert_json converter (old : OldVersion.json) =
    { NewVersion.version = 123
    ; variant = converter.convert_variant converter old old.variant
    ; field2 = old.field1
    }
end
