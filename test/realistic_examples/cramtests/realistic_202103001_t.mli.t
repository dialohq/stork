  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat realistic_202103001_t.mli | ocamlformat --enable-outside-detected-project --intf -
  (* Auto-generated from "realistic_202103001.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type variable_ref_type = [ `Input | `Model ]
  type variable_ref = { variableType : variable_ref_type; variableId : string }
  
  type grammar_case =
    [ `Nominative | `Genitive | `Dative | `Accusative | `Instrumental | `Locative ]
  
  type declensed_variable = { ref : variable_ref; grammarCase : grammar_case }
  
  type prompt_item =
    | Text of string
    | Verbatim of variable_ref
    | Declensed of declensed_variable
  
  type prompt = prompt_item Atdgen_runtime.Util.ocaml_array
  type variant = { id : string; value : prompt }
  type variable_expression = { name : string; ref : variable_ref }
  type variable_expr_token = { value : variable_expression }
  type var_string = { testValue : string }
  type var_pesel = { testValue : string }
  type var_number = { testValue : float }
  type var_number_or_unspecified = [ `Number of var_number | `Unspecified ]
  type var_nip = { testValue : string }
  type date = { year : int; month : int; day : int }
  type var_date = { testValue : date }
  type var_date_or_unspecified = [ `Date of var_date | `Unspecified ]
  type decimal_amount = { main : int; sub : int }
  type code = [ `PLN ]
  type currency_PLN = { amount : decimal_amount; code : code }
  type currency = currency_PLN
  type var_currency = { testValue : currency }
  
  type primitive_variable_type =
    [ `Number
    | `String
    | `Date
    | `Nip
    | `Pesel
    | `Currency
    | `NumberOrUnspecified
    | `DateOrUnspecified ]
  
  type structure = { name : string; variableType : primitive_variable_type }
  
  type primitive_var =
    [ `Number of var_number
    | `String of var_string
    | `Date of var_date
    | `Nip of var_nip
    | `Pesel of var_pesel
    | `Currency of var_currency
    | `NumberOrUnspecified of var_number_or_unspecified
    | `DateOrUnspecified of var_date_or_unspecified ]
  
  type example_value = { name : string; value : primitive_var }
  type example_item = example_value Atdgen_runtime.Util.ocaml_array
  
  type var_collection = {
    structure : structure Atdgen_runtime.Util.ocaml_array;
    exampleItems : example_item Atdgen_runtime.Util.ocaml_array;
  }
  
  type var =
    [ `Number of var_number
    | `String of var_string
    | `Date of var_date
    | `Nip of var_nip
    | `Pesel of var_pesel
    | `Currency of var_currency
    | `Collection of var_collection
    | `NumberOrUnspecified of var_number_or_unspecified
    | `DateOrUnspecified of var_date_or_unspecified ]
  
  type user_intent_key = { groupId : string; id : string }
  type operator_expr_token = { tokenType : string; operator : string }
  type constant_token = { value : string }
  
  type basic_token =
    | Operator of operator_expr_token
    | Variable of variable_expr_token
    | Constant of constant_token
  
  type brackets = { value : basic_token Atdgen_runtime.Util.ocaml_array }
  type basic_value = { value : basic_token }
  type expression_token = Basic of basic_value | Brackets of brackets
  type expression = expression_token Atdgen_runtime.Util.ocaml_array
  type user_intent = { id : string; name : string; expression : expression }
  
  type user_intent_group = {
    id : string;
    extendedModelId : string;
    extendedModelLabels : string Atdgen_runtime.Util.ocaml_array;
    intents : user_intent Atdgen_runtime.Util.ocaml_array;
  }
  
  type status_step = { id : string }
  type status = { id : string; key : string; value : string }
  type reaction_step = Prompt of prompt | Status of status_step
  type output_repeat = { variantId : string }
  type output_link = { requestId : string }
  type output = End | Repeat of output_repeat | Link of output_link
  
  type reaction_case = {
    steps : reaction_step Atdgen_runtime.Util.ocaml_array;
    output : output option;
  }
  
  type reaction = {
    matchCounterRef : string option;
    cases : reaction_case Atdgen_runtime.Util.ocaml_array;
  }
  
  type model_intent_key = { groupId : string option; id : string }
  type intent_key = Model of model_intent_key | User of user_intent_key
  type configuredModel = { modelId : string; parameterId : string }
  
  type branch = {
    id : string;
    intentKey : intent_key;
    isGuardian : bool;
    reaction : reaction;
  }
  
  type request = {
    id : string;
    name : string;
    initialVariantId : string;
    variants : variant Atdgen_runtime.Util.ocaml_array;
    noMatch : reaction;
    noInput : reaction;
    branches : branch Atdgen_runtime.Util.ocaml_array;
    configuredModels : configuredModel Atdgen_runtime.Util.ocaml_array;
  }
  
  type introduction = { prompt : prompt option; requestId : string option }
  
  type plan = {
    introduction : introduction;
    requests : request Atdgen_runtime.Util.ocaml_array;
  }
  
  type model_variable = { key : string; type_ : primitive_variable_type }
  
  type model_response_schema = {
    modelId : string;
    variables : model_variable Atdgen_runtime.Util.ocaml_array;
  }
  
  type metadata = { created_at : date; created_by : string }
  type input_variable = { id : string; name : string; variableType : var }
  type gender = [ `Feminine | `Masculine | `Unknown ]
  type environment = { gender : gender }
  
  type input_variables = {
    userDefined : input_variable Atdgen_runtime.Util.ocaml_array;
    environment : environment;
  }
  
  type dialogData = {
    inputVariables : input_variables;
    statuses : status Atdgen_runtime.Util.ocaml_array;
    userIntents : user_intent_group Atdgen_runtime.Util.ocaml_array;
    modelResponseSchema : model_response_schema Atdgen_runtime.Util.ocaml_array;
  }
  
  type dialog = { id : string; plan : plan; data : dialogData }
  type deploy_env = [ `Production | `Test ]
  
  type dialog_file = {
    version : int;
    deploy_env : deploy_env;
    dialog : dialog;
    metadata : metadata;
  }
