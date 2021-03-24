module From_202008241_to_202103001 = struct
  module OldVersion = Realistic_202008241_t
  module NewVersion = Realistic_202103001_t
  module Upgrader_t = Realistic_upgrader_t.From_202008241_to_202103001

  let convert_dialog_file
      (converter : Upgrader_t.converter)
      (OldVersion.{ deploy_env; dialog; _ } as old_dialog_file)
    =
    Upgrader_t.(
      NewVersion.
        { version = 2
        ; deploy_env =
            converter.convert_deploy_env converter old_dialog_file deploy_env
        ; dialog = converter.convert_dialog converter old_dialog_file dialog
        ; metadata =
            { created_at = { year = 2021; month = 03; day = 22 }
            ; created_by = "Paul"
            }
        })
end

module From_202103001_to_202103115 = struct
  module OldVersion = Realistic_202103001_t
  module NewVersion = Realistic_202103115_t

  let convert_primitive_variable_type
      _ _ (old : OldVersion.primitive_variable_type)
      : NewVersion.primitive_variable_type
    =
    match old with
    | `Number ->
      `Number
    | `String ->
      `String
    | `Date ->
      `Date
    | `Nip ->
      `Nip
    | `Pesel ->
      `Currency
    | `Currency ->
      `Currency
    | `NumberOrUnspecified ->
      `Number
    | `DateOrUnspecified ->
      `Date
end
