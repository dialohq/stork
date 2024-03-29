  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat realistic.ml  | ocamlformat --impl -
  File "<standard input>", line 1:
  Warning: Ocamlformat disabled because [--enable-outside-detected-project] is not set and no [.ocamlformat] was found within the project (root: ../../../../../.sandbox)
  [@@@ocaml.warning "-32-33-44"]
  open StdLabels
  module Types = Realistic_202103115_t
  module Json = Realistic_202103115_j
  module From_202008241_to_202103001 = struct
  
  include Realistic_user_fns.From_202008241_to_202103001
  
  let convert_variable_ref_type _ _ x = x
  let convert_variable_ref: converter -> OldVersion.dialog_file -> OldVersion.variable_ref -> NewVersion.variable_ref = fun _ _  x -> Obj.magic x
  let convert_grammar_case _ _ x = x
  let convert_declensed_variable: converter -> OldVersion.dialog_file -> OldVersion.declensed_variable -> NewVersion.declensed_variable = fun _ _  x -> Obj.magic x
  let convert_prompt_item: converter -> OldVersion.dialog_file -> OldVersion.prompt_item -> NewVersion.prompt_item = fun _ _  x -> Obj.magic x
  let convert_prompt: converter -> OldVersion.dialog_file -> OldVersion.prompt -> NewVersion.prompt = fun _ _  x -> Obj.magic x
  let convert_variant: converter -> OldVersion.dialog_file -> OldVersion.variant -> NewVersion.variant = fun _ _  x -> Obj.magic x
  let convert_variable_expression: converter -> OldVersion.dialog_file -> OldVersion.variable_expression -> NewVersion.variable_expression = fun _ _  x -> Obj.magic x
  let convert_variable_expr_token: converter -> OldVersion.dialog_file -> OldVersion.variable_expr_token -> NewVersion.variable_expr_token = fun _ _  x -> Obj.magic x
  let convert_var_string: converter -> OldVersion.dialog_file -> OldVersion.var_string -> NewVersion.var_string = fun _ _  x -> Obj.magic x
  let convert_var_pesel: converter -> OldVersion.dialog_file -> OldVersion.var_pesel -> NewVersion.var_pesel = fun _ _  x -> Obj.magic x
  let convert_var_number: converter -> OldVersion.dialog_file -> OldVersion.var_number -> NewVersion.var_number = fun _ _  x -> Obj.magic x
  let convert_var_number_or_unspecified: converter -> OldVersion.dialog_file -> OldVersion.var_number_or_unspecified -> NewVersion.var_number_or_unspecified = fun _ _  x -> Obj.magic x
  let convert_var_nip: converter -> OldVersion.dialog_file -> OldVersion.var_nip -> NewVersion.var_nip = fun _ _  x -> Obj.magic x
  let convert_date: converter -> OldVersion.dialog_file -> OldVersion.date -> NewVersion.date = fun _ _  x -> Obj.magic x
  let convert_var_date: converter -> OldVersion.dialog_file -> OldVersion.var_date -> NewVersion.var_date = fun _ _  x -> Obj.magic x
  let convert_var_date_or_unspecified: converter -> OldVersion.dialog_file -> OldVersion.var_date_or_unspecified -> NewVersion.var_date_or_unspecified = fun _ _  x -> Obj.magic x
  let convert_decimal_amount: converter -> OldVersion.dialog_file -> OldVersion.decimal_amount -> NewVersion.decimal_amount = fun _ _  x -> Obj.magic x
  let convert_code _ _ x = x
  let convert_currency_PLN: converter -> OldVersion.dialog_file -> OldVersion.currency_PLN -> NewVersion.currency_PLN = fun _ _  x -> Obj.magic x
  let convert_currency: converter -> OldVersion.dialog_file -> OldVersion.currency -> NewVersion.currency = fun _ _  x -> Obj.magic x
  let convert_var_currency: converter -> OldVersion.dialog_file -> OldVersion.var_currency -> NewVersion.var_currency = fun _ _  x -> Obj.magic x
  let convert_primitive_variable_type _ _ x = x
  let convert_structure: converter -> OldVersion.dialog_file -> OldVersion.structure -> NewVersion.structure = fun _ _  x -> Obj.magic x
  let convert_primitive_var: converter -> OldVersion.dialog_file -> OldVersion.primitive_var -> NewVersion.primitive_var = fun _ _  x -> Obj.magic x
  let convert_example_value: converter -> OldVersion.dialog_file -> OldVersion.example_value -> NewVersion.example_value = fun _ _  x -> Obj.magic x
  let convert_example_item: converter -> OldVersion.dialog_file -> OldVersion.example_item -> NewVersion.example_item = fun _ _  x -> Obj.magic x
  let convert_var_collection: converter -> OldVersion.dialog_file -> OldVersion.var_collection -> NewVersion.var_collection = fun _ _  x -> Obj.magic x
  let convert_var: converter -> OldVersion.dialog_file -> OldVersion.var -> NewVersion.var = fun _ _  x -> Obj.magic x
  let convert_user_intent_key: converter -> OldVersion.dialog_file -> OldVersion.user_intent_key -> NewVersion.user_intent_key = fun _ _  x -> Obj.magic x
  let convert_operator_expr_token: converter -> OldVersion.dialog_file -> OldVersion.operator_expr_token -> NewVersion.operator_expr_token = fun _ _  x -> Obj.magic x
  let convert_constant_token: converter -> OldVersion.dialog_file -> OldVersion.constant_token -> NewVersion.constant_token = fun _ _  x -> Obj.magic x
  let convert_basic_token: converter -> OldVersion.dialog_file -> OldVersion.basic_token -> NewVersion.basic_token = fun _ _  x -> Obj.magic x
  let convert_brackets: converter -> OldVersion.dialog_file -> OldVersion.brackets -> NewVersion.brackets = fun _ _  x -> Obj.magic x
  let convert_basic_value: converter -> OldVersion.dialog_file -> OldVersion.basic_value -> NewVersion.basic_value = fun _ _  x -> Obj.magic x
  let convert_expression_token: converter -> OldVersion.dialog_file -> OldVersion.expression_token -> NewVersion.expression_token = fun _ _  x -> Obj.magic x
  let convert_expression: converter -> OldVersion.dialog_file -> OldVersion.expression -> NewVersion.expression = fun _ _  x -> Obj.magic x
  let convert_user_intent: converter -> OldVersion.dialog_file -> OldVersion.user_intent -> NewVersion.user_intent = fun _ _  x -> Obj.magic x
  let convert_user_intent_group: converter -> OldVersion.dialog_file -> OldVersion.user_intent_group -> NewVersion.user_intent_group = fun _ _  x -> Obj.magic x
  let convert_status_step: converter -> OldVersion.dialog_file -> OldVersion.status_step -> NewVersion.status_step = fun _ _  x -> Obj.magic x
  let convert_status: converter -> OldVersion.dialog_file -> OldVersion.status -> NewVersion.status = fun _ _  x -> Obj.magic x
  let convert_reaction_step: converter -> OldVersion.dialog_file -> OldVersion.reaction_step -> NewVersion.reaction_step = fun _ _  x -> Obj.magic x
  let convert_output_repeat: converter -> OldVersion.dialog_file -> OldVersion.output_repeat -> NewVersion.output_repeat = fun _ _  x -> Obj.magic x
  let convert_output_link: converter -> OldVersion.dialog_file -> OldVersion.output_link -> NewVersion.output_link = fun _ _  x -> Obj.magic x
  let convert_output: converter -> OldVersion.dialog_file -> OldVersion.output -> NewVersion.output = fun _ _  x -> Obj.magic x
  let convert_reaction_case: converter -> OldVersion.dialog_file -> OldVersion.reaction_case -> NewVersion.reaction_case = fun _ _  x -> Obj.magic x
  let convert_reaction: converter -> OldVersion.dialog_file -> OldVersion.reaction -> NewVersion.reaction = fun _ _  x -> Obj.magic x
  let convert_model_intent_key: converter -> OldVersion.dialog_file -> OldVersion.model_intent_key -> NewVersion.model_intent_key = fun _ _  x -> Obj.magic x
  let convert_intent_key: converter -> OldVersion.dialog_file -> OldVersion.intent_key -> NewVersion.intent_key = fun _ _  x -> Obj.magic x
  let convert_configuredModel: converter -> OldVersion.dialog_file -> OldVersion.configuredModel -> NewVersion.configuredModel = fun _ _  x -> Obj.magic x
  let convert_branch: converter -> OldVersion.dialog_file -> OldVersion.branch -> NewVersion.branch = fun _ _  x -> Obj.magic x
  let convert_request: converter -> OldVersion.dialog_file -> OldVersion.request -> NewVersion.request = fun _ _  x -> Obj.magic x
  let convert_introduction: converter -> OldVersion.dialog_file -> OldVersion.introduction -> NewVersion.introduction = fun _ _  x -> Obj.magic x
  let convert_plan: converter -> OldVersion.dialog_file -> OldVersion.plan -> NewVersion.plan = fun _ _  x -> Obj.magic x
  let convert_model_variable: converter -> OldVersion.dialog_file -> OldVersion.model_variable -> NewVersion.model_variable = fun _ _  x -> Obj.magic x
  let convert_model_response_schema: converter -> OldVersion.dialog_file -> OldVersion.model_response_schema -> NewVersion.model_response_schema = fun _ _  x -> Obj.magic x
  let convert_input_variable: converter -> OldVersion.dialog_file -> OldVersion.input_variable -> NewVersion.input_variable = fun _ _  x -> Obj.magic x
  let convert_gender _ _ x = x
  let convert_environment: converter -> OldVersion.dialog_file -> OldVersion.environment -> NewVersion.environment = fun _ _  x -> Obj.magic x
  let convert_input_variables: converter -> OldVersion.dialog_file -> OldVersion.input_variables -> NewVersion.input_variables = fun _ _  x -> Obj.magic x
  let convert_dialogData: converter -> OldVersion.dialog_file -> OldVersion.dialogData -> NewVersion.dialogData = fun _ _  x -> Obj.magic x
  let convert_dialog: converter -> OldVersion.dialog_file -> OldVersion.dialog -> NewVersion.dialog = fun _ _  x -> Obj.magic x
  let convert_deploy_env _ _ x = x
  let converter = Realistic_upgrader_t.From_202008241_to_202103001.{ convert_dialog_file;
  convert_deploy_env;
  convert_dialog;
  convert_dialogData;
  convert_input_variables;
  convert_environment;
  convert_gender;
  convert_input_variable;
  convert_model_response_schema;
  convert_model_variable;
  convert_plan;
  convert_introduction;
  convert_request;
  convert_branch;
  convert_configuredModel;
  convert_intent_key;
  convert_model_intent_key;
  convert_reaction;
  convert_reaction_case;
  convert_output;
  convert_output_link;
  convert_output_repeat;
  convert_reaction_step;
  convert_status;
  convert_status_step;
  convert_user_intent_group;
  convert_user_intent;
  convert_expression;
  convert_expression_token;
  convert_basic_value;
  convert_brackets;
  convert_basic_token;
  convert_constant_token;
  convert_operator_expr_token;
  convert_user_intent_key;
  convert_var;
  convert_var_collection;
  convert_example_item;
  convert_example_value;
  convert_primitive_var;
  convert_structure;
  convert_primitive_variable_type;
  convert_var_currency;
  convert_currency;
  convert_currency_PLN;
  convert_code;
  convert_decimal_amount;
  convert_var_date_or_unspecified;
  convert_var_date;
  convert_date;
  convert_var_nip;
  convert_var_number_or_unspecified;
  convert_var_number;
  convert_var_pesel;
  convert_var_string;
  convert_variable_expr_token;
  convert_variable_expression;
  convert_variant;
  convert_prompt;
  convert_prompt_item;
  convert_declensed_variable;
  convert_grammar_case;
  convert_variable_ref;
  convert_variable_ref_type }
  let convert = convert_dialog_file converter
  end
  module From_202103001_to_202103115 = struct
  
  include Realistic_user_fns.From_202103001_to_202103115
  
  let convert_variable_ref_type _ _ x = x
  let convert_variable_ref: converter -> OldVersion.dialog_file -> OldVersion.variable_ref -> NewVersion.variable_ref = fun _ _  x -> Obj.magic x
  let convert_grammar_case _ _ x = x
  let convert_declensed_variable: converter -> OldVersion.dialog_file -> OldVersion.declensed_variable -> NewVersion.declensed_variable = fun _ _  x -> Obj.magic x
  let convert_prompt_item: converter -> OldVersion.dialog_file -> OldVersion.prompt_item -> NewVersion.prompt_item = fun _ _  x -> Obj.magic x
  let convert_prompt: converter -> OldVersion.dialog_file -> OldVersion.prompt -> NewVersion.prompt = fun _ _  x -> Obj.magic x
  let convert_variant: converter -> OldVersion.dialog_file -> OldVersion.variant -> NewVersion.variant = fun _ _  x -> Obj.magic x
  let convert_variable_expression: converter -> OldVersion.dialog_file -> OldVersion.variable_expression -> NewVersion.variable_expression = fun _ _  x -> Obj.magic x
  let convert_variable_expr_token: converter -> OldVersion.dialog_file -> OldVersion.variable_expr_token -> NewVersion.variable_expr_token = fun _ _  x -> Obj.magic x
  let convert_var_string: converter -> OldVersion.dialog_file -> OldVersion.var_string -> NewVersion.var_string = fun _ _  x -> Obj.magic x
  let convert_var_pesel: converter -> OldVersion.dialog_file -> OldVersion.var_pesel -> NewVersion.var_pesel = fun _ _  x -> Obj.magic x
  let convert_var_number: converter -> OldVersion.dialog_file -> OldVersion.var_number -> NewVersion.var_number = fun _ _  x -> Obj.magic x
  let convert_var_number_or_unspecified: converter -> OldVersion.dialog_file -> OldVersion.var_number_or_unspecified -> NewVersion.var_number_or_unspecified = fun _ _  x -> Obj.magic x
  let convert_var_nip: converter -> OldVersion.dialog_file -> OldVersion.var_nip -> NewVersion.var_nip = fun _ _  x -> Obj.magic x
  let convert_date: converter -> OldVersion.dialog_file -> OldVersion.date -> NewVersion.date = fun _ _  x -> Obj.magic x
  let convert_var_date: converter -> OldVersion.dialog_file -> OldVersion.var_date -> NewVersion.var_date = fun _ _  x -> Obj.magic x
  let convert_var_date_or_unspecified: converter -> OldVersion.dialog_file -> OldVersion.var_date_or_unspecified -> NewVersion.var_date_or_unspecified = fun _ _  x -> Obj.magic x
  let convert_decimal_amount: converter -> OldVersion.dialog_file -> OldVersion.decimal_amount -> NewVersion.decimal_amount = fun _ _  x -> Obj.magic x
  let convert_code _ _ x = x
  let convert_currency_PLN: converter -> OldVersion.dialog_file -> OldVersion.currency_PLN -> NewVersion.currency_PLN = fun _ _  x -> Obj.magic x
  let convert_currency: converter -> OldVersion.dialog_file -> OldVersion.currency -> NewVersion.currency = fun _ _  x -> Obj.magic x
  let convert_var_currency: converter -> OldVersion.dialog_file -> OldVersion.var_currency -> NewVersion.var_currency = fun _ _  x -> Obj.magic x
  let convert_structure: converter -> OldVersion.dialog_file -> OldVersion.structure -> NewVersion.structure = fun converter old_doc -> fun old_record -> NewVersion.{ name = old_record.name;
  variableType = old_record.variableType |> (convert_primitive_variable_type converter old_doc); }
  let convert_primitive_var: converter -> OldVersion.dialog_file -> OldVersion.primitive_var -> NewVersion.primitive_var = fun _ _  x -> Obj.magic x
  let convert_example_value: converter -> OldVersion.dialog_file -> OldVersion.example_value -> NewVersion.example_value = fun _ _  x -> Obj.magic x
  let convert_example_item: converter -> OldVersion.dialog_file -> OldVersion.example_item -> NewVersion.example_item = fun _ _  x -> Obj.magic x
  let convert_var_collection: converter -> OldVersion.dialog_file -> OldVersion.var_collection -> NewVersion.var_collection = fun converter old_doc -> fun old_record -> NewVersion.{ structure = old_record.structure |> (Array.map ~f:(convert_structure converter old_doc));
  exampleItems = Obj.magic old_record.exampleItems; }
  let convert_var: converter -> OldVersion.dialog_file -> OldVersion.var -> NewVersion.var = fun converter old_doc -> function 
  | `Number payload -> `Number (Obj.magic payload)
  | `String payload -> `String (Obj.magic payload)
  | `Date payload -> `Date (Obj.magic payload)
  | `Nip payload -> `Nip (Obj.magic payload)
  | `Pesel payload -> `Pesel (Obj.magic payload)
  | `Currency payload -> `Currency (Obj.magic payload)
  | `Collection payload -> `Collection (payload |> (convert_var_collection converter old_doc))
  | `NumberOrUnspecified payload -> `NumberOrUnspecified (Obj.magic payload)
  | `DateOrUnspecified payload -> `DateOrUnspecified (Obj.magic payload)
  let convert_user_intent_key: converter -> OldVersion.dialog_file -> OldVersion.user_intent_key -> NewVersion.user_intent_key = fun _ _  x -> Obj.magic x
  let convert_operator_expr_token: converter -> OldVersion.dialog_file -> OldVersion.operator_expr_token -> NewVersion.operator_expr_token = fun _ _  x -> Obj.magic x
  let convert_constant_token: converter -> OldVersion.dialog_file -> OldVersion.constant_token -> NewVersion.constant_token = fun _ _  x -> Obj.magic x
  let convert_basic_token: converter -> OldVersion.dialog_file -> OldVersion.basic_token -> NewVersion.basic_token = fun _ _  x -> Obj.magic x
  let convert_brackets: converter -> OldVersion.dialog_file -> OldVersion.brackets -> NewVersion.brackets = fun _ _  x -> Obj.magic x
  let convert_basic_value: converter -> OldVersion.dialog_file -> OldVersion.basic_value -> NewVersion.basic_value = fun _ _  x -> Obj.magic x
  let convert_expression_token: converter -> OldVersion.dialog_file -> OldVersion.expression_token -> NewVersion.expression_token = fun _ _  x -> Obj.magic x
  let convert_expression: converter -> OldVersion.dialog_file -> OldVersion.expression -> NewVersion.expression = fun _ _  x -> Obj.magic x
  let convert_user_intent: converter -> OldVersion.dialog_file -> OldVersion.user_intent -> NewVersion.user_intent = fun _ _  x -> Obj.magic x
  let convert_user_intent_group: converter -> OldVersion.dialog_file -> OldVersion.user_intent_group -> NewVersion.user_intent_group = fun _ _  x -> Obj.magic x
  let convert_status_step: converter -> OldVersion.dialog_file -> OldVersion.status_step -> NewVersion.status_step = fun _ _  x -> Obj.magic x
  let convert_status: converter -> OldVersion.dialog_file -> OldVersion.status -> NewVersion.status = fun _ _  x -> Obj.magic x
  let convert_reaction_step: converter -> OldVersion.dialog_file -> OldVersion.reaction_step -> NewVersion.reaction_step = fun _ _  x -> Obj.magic x
  let convert_output_repeat: converter -> OldVersion.dialog_file -> OldVersion.output_repeat -> NewVersion.output_repeat = fun _ _  x -> Obj.magic x
  let convert_output_link: converter -> OldVersion.dialog_file -> OldVersion.output_link -> NewVersion.output_link = fun _ _  x -> Obj.magic x
  let convert_output: converter -> OldVersion.dialog_file -> OldVersion.output -> NewVersion.output = fun _ _  x -> Obj.magic x
  let convert_reaction_case: converter -> OldVersion.dialog_file -> OldVersion.reaction_case -> NewVersion.reaction_case = fun _ _  x -> Obj.magic x
  let convert_reaction: converter -> OldVersion.dialog_file -> OldVersion.reaction -> NewVersion.reaction = fun _ _  x -> Obj.magic x
  let convert_model_intent_key: converter -> OldVersion.dialog_file -> OldVersion.model_intent_key -> NewVersion.model_intent_key = fun _ _  x -> Obj.magic x
  let convert_intent_key: converter -> OldVersion.dialog_file -> OldVersion.intent_key -> NewVersion.intent_key = fun _ _  x -> Obj.magic x
  let convert_configuredModel: converter -> OldVersion.dialog_file -> OldVersion.configuredModel -> NewVersion.configuredModel = fun _ _  x -> Obj.magic x
  let convert_branch: converter -> OldVersion.dialog_file -> OldVersion.branch -> NewVersion.branch = fun _ _  x -> Obj.magic x
  let convert_request: converter -> OldVersion.dialog_file -> OldVersion.request -> NewVersion.request = fun _ _  x -> Obj.magic x
  let convert_introduction: converter -> OldVersion.dialog_file -> OldVersion.introduction -> NewVersion.introduction = fun _ _  x -> Obj.magic x
  let convert_plan: converter -> OldVersion.dialog_file -> OldVersion.plan -> NewVersion.plan = fun _ _  x -> Obj.magic x
  let convert_model_variable: converter -> OldVersion.dialog_file -> OldVersion.model_variable -> NewVersion.model_variable = fun converter old_doc -> fun old_record -> NewVersion.{ key = old_record.key;
  type_ = old_record.type_ |> (convert_primitive_variable_type converter old_doc); }
  let convert_model_response_schema: converter -> OldVersion.dialog_file -> OldVersion.model_response_schema -> NewVersion.model_response_schema = fun converter old_doc -> fun old_record -> NewVersion.{ modelId = old_record.modelId;
  variables = old_record.variables |> (Array.map ~f:(convert_model_variable converter old_doc)); }
  let convert_metadata: converter -> OldVersion.dialog_file -> OldVersion.metadata -> NewVersion.metadata = fun _ _  x -> Obj.magic x
  let convert_input_variable: converter -> OldVersion.dialog_file -> OldVersion.input_variable -> NewVersion.input_variable = fun converter old_doc -> fun old_record -> NewVersion.{ id = old_record.id;
  name = old_record.name;
  variableType = old_record.variableType |> (convert_var converter old_doc); }
  let convert_gender _ _ x = x
  let convert_environment: converter -> OldVersion.dialog_file -> OldVersion.environment -> NewVersion.environment = fun _ _  x -> Obj.magic x
  let convert_input_variables: converter -> OldVersion.dialog_file -> OldVersion.input_variables -> NewVersion.input_variables = fun converter old_doc -> fun old_record -> NewVersion.{ userDefined = old_record.userDefined |> (Array.map ~f:(convert_input_variable converter old_doc));
  environment = Obj.magic old_record.environment; }
  let convert_dialogData: converter -> OldVersion.dialog_file -> OldVersion.dialogData -> NewVersion.dialogData = fun converter old_doc -> fun old_record -> NewVersion.{ inputVariables = old_record.inputVariables |> (convert_input_variables converter old_doc);
  statuses = Obj.magic old_record.statuses;
  userIntents = Obj.magic old_record.userIntents;
  modelResponseSchema = old_record.modelResponseSchema |> (Array.map ~f:(convert_model_response_schema converter old_doc)); }
  let convert_dialog: converter -> OldVersion.dialog_file -> OldVersion.dialog -> NewVersion.dialog = fun converter old_doc -> fun old_record -> NewVersion.{ id = old_record.id;
  plan = Obj.magic old_record.plan;
  data = old_record.data |> (convert_dialogData converter old_doc); }
  let convert_deploy_env _ _ x = x
  let convert_dialog_file: converter -> OldVersion.dialog_file -> NewVersion.dialog_file = fun converter old_doc -> old_doc |> (fun old_record -> NewVersion.{ version = 202103115;
  deploy_env = old_record.deploy_env;
  dialog = old_record.dialog |> (convert_dialog converter old_doc);
  metadata = Obj.magic old_record.metadata; })
  let converter = Realistic_upgrader_t.From_202103001_to_202103115.{ convert_dialog_file;
  convert_deploy_env;
  convert_dialog;
  convert_dialogData;
  convert_input_variables;
  convert_environment;
  convert_gender;
  convert_input_variable;
  convert_metadata;
  convert_model_response_schema;
  convert_model_variable;
  convert_plan;
  convert_introduction;
  convert_request;
  convert_branch;
  convert_configuredModel;
  convert_intent_key;
  convert_model_intent_key;
  convert_reaction;
  convert_reaction_case;
  convert_output;
  convert_output_link;
  convert_output_repeat;
  convert_reaction_step;
  convert_status;
  convert_status_step;
  convert_user_intent_group;
  convert_user_intent;
  convert_expression;
  convert_expression_token;
  convert_basic_value;
  convert_brackets;
  convert_basic_token;
  convert_constant_token;
  convert_operator_expr_token;
  convert_user_intent_key;
  convert_var;
  convert_var_collection;
  convert_example_item;
  convert_example_value;
  convert_primitive_var;
  convert_structure;
  convert_primitive_variable_type;
  convert_var_currency;
  convert_currency;
  convert_currency_PLN;
  convert_code;
  convert_decimal_amount;
  convert_var_date_or_unspecified;
  convert_var_date;
  convert_date;
  convert_var_nip;
  convert_var_number_or_unspecified;
  convert_var_number;
  convert_var_pesel;
  convert_var_string;
  convert_variable_expr_token;
  convert_variable_expression;
  convert_variant;
  convert_prompt;
  convert_prompt_item;
  convert_declensed_variable;
  convert_grammar_case;
  convert_variable_ref;
  convert_variable_ref_type }
  let convert = convert_dialog_file converter
  end
  let convert_from_202103001_to_latest = From_202103001_to_202103115.convert
  let convert_from_202008241_to_latest doc =  convert_from_202103001_to_latest (From_202008241_to_202103001.convert doc)
  let version_to_string = function `Int v -> string_of_int v | `String s -> s
  
  let get_version_from_json = function
    | `Assoc fields ->
      let version =
        List.find_map
          ~f:(function
            | "version", ((`String _ | `Int _) as version) ->
              Some version
            | _ ->
              None)
          fields
      in
      (match version with
      | None ->
        invalid_arg
          "The parsed JSON should have a `version` field of type int or string"
      | Some version ->
        version)
    | _ ->
      invalid_arg "The parsed JSON should be an object."
  
  let get_version s =
    get_version_from_json (Yojson.Safe.from_string s)
  let get_version_from_file fname =
    get_version_from_json (Yojson.Safe.from_file ~fname fname)
  let string_of_dialog_file ?len x = Json.string_of_dialog_file ?len { x with Types.version = 202103115 }
  
  let dialog_file_of_string s = match (get_version s) with
    | `Int 202103115 -> Json.dialog_file_of_string s
    | `Int 202103001 -> convert_from_202103001_to_latest (Realistic_202103001_j.dialog_file_of_string s)
    | `Int 202008241 -> convert_from_202008241_to_latest (Realistic_202008241_j.dialog_file_of_string s)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  
  let read_dialog_file_from_file fname = match (get_version_from_file fname) with
    | `Int 202103115 -> Atdgen_runtime.Util.Json.from_file Json.read_dialog_file fname
    | `Int 202103001 -> convert_from_202103001_to_latest (Atdgen_runtime.Util.Json.from_file Realistic_202103001_j.read_dialog_file fname)
    | `Int 202008241 -> convert_from_202008241_to_latest (Atdgen_runtime.Util.Json.from_file Realistic_202008241_j.read_dialog_file fname)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let write_dialog_file buf x = Json.write_dialog_file buf { x with Types.version = 202103115 }
