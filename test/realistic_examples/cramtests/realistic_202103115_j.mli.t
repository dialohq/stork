  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat realistic_202103115_j.mli  | ocamlformat --intf -
  File <standard input>
  Warning: Ocamlformat disabled because [--enable-outside-detected-project] is not set and no [.ocamlformat] was found within the project (root: ../../../../../.sandbox)
  (* Auto-generated from "realistic_202103115.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type variable_ref_type = Realistic_202103115_t.variable_ref_type
  
  type variable_ref = Realistic_202103115_t.variable_ref = {
    variableType: variable_ref_type;
    variableId: string
  }
  
  type grammar_case = Realistic_202103115_t.grammar_case
  
  type declensed_variable = Realistic_202103115_t.declensed_variable = {
    ref: variable_ref;
    grammarCase: grammar_case
  }
  
  type prompt_item = Realistic_202103115_t.prompt_item = 
      Text of string
    | Verbatim of variable_ref
    | Declensed of declensed_variable
  
  
  type prompt = Realistic_202103115_t.prompt
  
  type variant = Realistic_202103115_t.variant = { id: string; value: prompt }
  
  type variable_expression = Realistic_202103115_t.variable_expression = {
    name: string;
    ref: variable_ref
  }
  
  type variable_expr_token = Realistic_202103115_t.variable_expr_token = {
    value: variable_expression
  }
  
  type var_string = Realistic_202103115_t.var_string = { testValue: string }
  
  type var_pesel = Realistic_202103115_t.var_pesel = { testValue: string }
  
  type var_number = Realistic_202103115_t.var_number = { testValue: float }
  
  type var_number_or_unspecified =
    Realistic_202103115_t.var_number_or_unspecified
  
  type var_nip = Realistic_202103115_t.var_nip = { testValue: string }
  
  type date = Realistic_202103115_t.date = { year: int; month: int; day: int }
  
  type var_date = Realistic_202103115_t.var_date = { testValue: date }
  
  type var_date_or_unspecified = Realistic_202103115_t.var_date_or_unspecified
  
  type decimal_amount = Realistic_202103115_t.decimal_amount = {
    main: int;
    sub: int
  }
  
  type code = Realistic_202103115_t.code
  
  type currency_PLN = Realistic_202103115_t.currency_PLN = {
    amount: decimal_amount;
    code: code
  }
  
  type currency = Realistic_202103115_t.currency
  
  type var_currency = Realistic_202103115_t.var_currency = {
    testValue: currency
  }
  
  type primitive_variable_type = Realistic_202103115_t.primitive_variable_type
  
  type structure = Realistic_202103115_t.structure = {
    name: string;
    variableType: primitive_variable_type
  }
  
  type primitive_var = Realistic_202103115_t.primitive_var
  
  type example_value = Realistic_202103115_t.example_value = {
    name: string;
    value: primitive_var
  }
  
  type example_item = Realistic_202103115_t.example_item
  
  type var_collection = Realistic_202103115_t.var_collection = {
    structure: structure Atdgen_runtime.Util.ocaml_array;
    exampleItems: example_item Atdgen_runtime.Util.ocaml_array
  }
  
  type var = Realistic_202103115_t.var
  
  type user_intent_key = Realistic_202103115_t.user_intent_key = {
    groupId: string;
    id: string
  }
  
  type operator_expr_token = Realistic_202103115_t.operator_expr_token = {
    tokenType: string;
    operator: string
  }
  
  type constant_token = Realistic_202103115_t.constant_token = {
    value: string
  }
  
  type basic_token = Realistic_202103115_t.basic_token = 
      Operator of operator_expr_token
    | Variable of variable_expr_token
    | Constant of constant_token
  
  
  type brackets = Realistic_202103115_t.brackets = {
    value: basic_token Atdgen_runtime.Util.ocaml_array
  }
  
  type basic_value = Realistic_202103115_t.basic_value = { value: basic_token }
  
  type expression_token = Realistic_202103115_t.expression_token = 
      Basic of basic_value
    | Brackets of brackets
  
  
  type expression = Realistic_202103115_t.expression
  
  type user_intent = Realistic_202103115_t.user_intent = {
    id: string;
    name: string;
    expression: expression
  }
  
  type user_intent_group = Realistic_202103115_t.user_intent_group = {
    id: string;
    extendedModelId: string;
    extendedModelLabels: string Atdgen_runtime.Util.ocaml_array;
    intents: user_intent Atdgen_runtime.Util.ocaml_array
  }
  
  type status_step = Realistic_202103115_t.status_step = { id: string }
  
  type status = Realistic_202103115_t.status = {
    id: string;
    key: string;
    value: string
  }
  
  type reaction_step = Realistic_202103115_t.reaction_step = 
      Prompt of prompt
    | Status of status_step
  
  
  type output_repeat = Realistic_202103115_t.output_repeat = {
    variantId: string
  }
  
  type output_link = Realistic_202103115_t.output_link = { requestId: string }
  
  type output = Realistic_202103115_t.output = 
      End
    | Repeat of output_repeat
    | Link of output_link
  
  
  type reaction_case = Realistic_202103115_t.reaction_case = {
    steps: reaction_step Atdgen_runtime.Util.ocaml_array;
    output: output option
  }
  
  type reaction = Realistic_202103115_t.reaction = {
    matchCounterRef: string option;
    cases: reaction_case Atdgen_runtime.Util.ocaml_array
  }
  
  type model_intent_key = Realistic_202103115_t.model_intent_key = {
    groupId: string option;
    id: string
  }
  
  type intent_key = Realistic_202103115_t.intent_key = 
      Model of model_intent_key
    | User of user_intent_key
  
  
  type configuredModel = Realistic_202103115_t.configuredModel = {
    modelId: string;
    parameterId: string
  }
  
  type branch = Realistic_202103115_t.branch = {
    id: string;
    intentKey: intent_key;
    isGuardian: bool;
    reaction: reaction
  }
  
  type request = Realistic_202103115_t.request = {
    id: string;
    name: string;
    initialVariantId: string;
    variants: variant Atdgen_runtime.Util.ocaml_array;
    noMatch: reaction;
    noInput: reaction;
    branches: branch Atdgen_runtime.Util.ocaml_array;
    configuredModels: configuredModel Atdgen_runtime.Util.ocaml_array
  }
  
  type introduction = Realistic_202103115_t.introduction = {
    prompt: prompt option;
    requestId: string option
  }
  
  type plan = Realistic_202103115_t.plan = {
    introduction: introduction;
    requests: request Atdgen_runtime.Util.ocaml_array
  }
  
  type model_variable = Realistic_202103115_t.model_variable = {
    key: string;
    type_: primitive_variable_type
  }
  
  type model_response_schema = Realistic_202103115_t.model_response_schema = {
    modelId: string;
    variables: model_variable Atdgen_runtime.Util.ocaml_array
  }
  
  type metadata = Realistic_202103115_t.metadata = {
    created_at: date;
    created_by: string
  }
  
  type input_variable = Realistic_202103115_t.input_variable = {
    id: string;
    name: string;
    variableType: var
  }
  
  type gender = Realistic_202103115_t.gender
  
  type environment = Realistic_202103115_t.environment = { gender: gender }
  
  type input_variables = Realistic_202103115_t.input_variables = {
    userDefined: input_variable Atdgen_runtime.Util.ocaml_array;
    environment: environment
  }
  
  type dialogData = Realistic_202103115_t.dialogData = {
    inputVariables: input_variables;
    statuses: status Atdgen_runtime.Util.ocaml_array;
    userIntents: user_intent_group Atdgen_runtime.Util.ocaml_array;
    modelResponseSchema: model_response_schema Atdgen_runtime.Util.ocaml_array
  }
  
  type dialog = Realistic_202103115_t.dialog = {
    id: string;
    plan: plan;
    data: dialogData
  }
  
  type deploy_env = Realistic_202103115_t.deploy_env
  
  type dialog_file = Realistic_202103115_t.dialog_file = {
    version: int;
    deploy_env: deploy_env;
    dialog: dialog;
    metadata: metadata
  }
  
  val write_variable_ref_type :
    Bi_outbuf.t -> variable_ref_type -> unit
    (** Output a JSON value of type {!type:variable_ref_type}. *)
  
  val string_of_variable_ref_type :
    ?len:int -> variable_ref_type -> string
    (** Serialize a value of type {!type:variable_ref_type}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_variable_ref_type :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> variable_ref_type
    (** Input JSON data of type {!type:variable_ref_type}. *)
  
  val variable_ref_type_of_string :
    string -> variable_ref_type
    (** Deserialize JSON data of type {!type:variable_ref_type}. *)
  
  val write_variable_ref :
    Bi_outbuf.t -> variable_ref -> unit
    (** Output a JSON value of type {!type:variable_ref}. *)
  
  val string_of_variable_ref :
    ?len:int -> variable_ref -> string
    (** Serialize a value of type {!type:variable_ref}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_variable_ref :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> variable_ref
    (** Input JSON data of type {!type:variable_ref}. *)
  
  val variable_ref_of_string :
    string -> variable_ref
    (** Deserialize JSON data of type {!type:variable_ref}. *)
  
  val write_grammar_case :
    Bi_outbuf.t -> grammar_case -> unit
    (** Output a JSON value of type {!type:grammar_case}. *)
  
  val string_of_grammar_case :
    ?len:int -> grammar_case -> string
    (** Serialize a value of type {!type:grammar_case}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_grammar_case :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> grammar_case
    (** Input JSON data of type {!type:grammar_case}. *)
  
  val grammar_case_of_string :
    string -> grammar_case
    (** Deserialize JSON data of type {!type:grammar_case}. *)
  
  val write_declensed_variable :
    Bi_outbuf.t -> declensed_variable -> unit
    (** Output a JSON value of type {!type:declensed_variable}. *)
  
  val string_of_declensed_variable :
    ?len:int -> declensed_variable -> string
    (** Serialize a value of type {!type:declensed_variable}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_declensed_variable :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> declensed_variable
    (** Input JSON data of type {!type:declensed_variable}. *)
  
  val declensed_variable_of_string :
    string -> declensed_variable
    (** Deserialize JSON data of type {!type:declensed_variable}. *)
  
  val write_prompt_item :
    Bi_outbuf.t -> prompt_item -> unit
    (** Output a JSON value of type {!type:prompt_item}. *)
  
  val string_of_prompt_item :
    ?len:int -> prompt_item -> string
    (** Serialize a value of type {!type:prompt_item}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_prompt_item :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> prompt_item
    (** Input JSON data of type {!type:prompt_item}. *)
  
  val prompt_item_of_string :
    string -> prompt_item
    (** Deserialize JSON data of type {!type:prompt_item}. *)
  
  val write_prompt :
    Bi_outbuf.t -> prompt -> unit
    (** Output a JSON value of type {!type:prompt}. *)
  
  val string_of_prompt :
    ?len:int -> prompt -> string
    (** Serialize a value of type {!type:prompt}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_prompt :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> prompt
    (** Input JSON data of type {!type:prompt}. *)
  
  val prompt_of_string :
    string -> prompt
    (** Deserialize JSON data of type {!type:prompt}. *)
  
  val write_variant :
    Bi_outbuf.t -> variant -> unit
    (** Output a JSON value of type {!type:variant}. *)
  
  val string_of_variant :
    ?len:int -> variant -> string
    (** Serialize a value of type {!type:variant}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_variant :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> variant
    (** Input JSON data of type {!type:variant}. *)
  
  val variant_of_string :
    string -> variant
    (** Deserialize JSON data of type {!type:variant}. *)
  
  val write_variable_expression :
    Bi_outbuf.t -> variable_expression -> unit
    (** Output a JSON value of type {!type:variable_expression}. *)
  
  val string_of_variable_expression :
    ?len:int -> variable_expression -> string
    (** Serialize a value of type {!type:variable_expression}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_variable_expression :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> variable_expression
    (** Input JSON data of type {!type:variable_expression}. *)
  
  val variable_expression_of_string :
    string -> variable_expression
    (** Deserialize JSON data of type {!type:variable_expression}. *)
  
  val write_variable_expr_token :
    Bi_outbuf.t -> variable_expr_token -> unit
    (** Output a JSON value of type {!type:variable_expr_token}. *)
  
  val string_of_variable_expr_token :
    ?len:int -> variable_expr_token -> string
    (** Serialize a value of type {!type:variable_expr_token}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_variable_expr_token :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> variable_expr_token
    (** Input JSON data of type {!type:variable_expr_token}. *)
  
  val variable_expr_token_of_string :
    string -> variable_expr_token
    (** Deserialize JSON data of type {!type:variable_expr_token}. *)
  
  val write_var_string :
    Bi_outbuf.t -> var_string -> unit
    (** Output a JSON value of type {!type:var_string}. *)
  
  val string_of_var_string :
    ?len:int -> var_string -> string
    (** Serialize a value of type {!type:var_string}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_string :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_string
    (** Input JSON data of type {!type:var_string}. *)
  
  val var_string_of_string :
    string -> var_string
    (** Deserialize JSON data of type {!type:var_string}. *)
  
  val write_var_pesel :
    Bi_outbuf.t -> var_pesel -> unit
    (** Output a JSON value of type {!type:var_pesel}. *)
  
  val string_of_var_pesel :
    ?len:int -> var_pesel -> string
    (** Serialize a value of type {!type:var_pesel}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_pesel :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_pesel
    (** Input JSON data of type {!type:var_pesel}. *)
  
  val var_pesel_of_string :
    string -> var_pesel
    (** Deserialize JSON data of type {!type:var_pesel}. *)
  
  val write_var_number :
    Bi_outbuf.t -> var_number -> unit
    (** Output a JSON value of type {!type:var_number}. *)
  
  val string_of_var_number :
    ?len:int -> var_number -> string
    (** Serialize a value of type {!type:var_number}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_number :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_number
    (** Input JSON data of type {!type:var_number}. *)
  
  val var_number_of_string :
    string -> var_number
    (** Deserialize JSON data of type {!type:var_number}. *)
  
  val write_var_number_or_unspecified :
    Bi_outbuf.t -> var_number_or_unspecified -> unit
    (** Output a JSON value of type {!type:var_number_or_unspecified}. *)
  
  val string_of_var_number_or_unspecified :
    ?len:int -> var_number_or_unspecified -> string
    (** Serialize a value of type {!type:var_number_or_unspecified}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_number_or_unspecified :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_number_or_unspecified
    (** Input JSON data of type {!type:var_number_or_unspecified}. *)
  
  val var_number_or_unspecified_of_string :
    string -> var_number_or_unspecified
    (** Deserialize JSON data of type {!type:var_number_or_unspecified}. *)
  
  val write_var_nip :
    Bi_outbuf.t -> var_nip -> unit
    (** Output a JSON value of type {!type:var_nip}. *)
  
  val string_of_var_nip :
    ?len:int -> var_nip -> string
    (** Serialize a value of type {!type:var_nip}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_nip :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_nip
    (** Input JSON data of type {!type:var_nip}. *)
  
  val var_nip_of_string :
    string -> var_nip
    (** Deserialize JSON data of type {!type:var_nip}. *)
  
  val write_date :
    Bi_outbuf.t -> date -> unit
    (** Output a JSON value of type {!type:date}. *)
  
  val string_of_date :
    ?len:int -> date -> string
    (** Serialize a value of type {!type:date}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_date :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> date
    (** Input JSON data of type {!type:date}. *)
  
  val date_of_string :
    string -> date
    (** Deserialize JSON data of type {!type:date}. *)
  
  val write_var_date :
    Bi_outbuf.t -> var_date -> unit
    (** Output a JSON value of type {!type:var_date}. *)
  
  val string_of_var_date :
    ?len:int -> var_date -> string
    (** Serialize a value of type {!type:var_date}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_date :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_date
    (** Input JSON data of type {!type:var_date}. *)
  
  val var_date_of_string :
    string -> var_date
    (** Deserialize JSON data of type {!type:var_date}. *)
  
  val write_var_date_or_unspecified :
    Bi_outbuf.t -> var_date_or_unspecified -> unit
    (** Output a JSON value of type {!type:var_date_or_unspecified}. *)
  
  val string_of_var_date_or_unspecified :
    ?len:int -> var_date_or_unspecified -> string
    (** Serialize a value of type {!type:var_date_or_unspecified}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_date_or_unspecified :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_date_or_unspecified
    (** Input JSON data of type {!type:var_date_or_unspecified}. *)
  
  val var_date_or_unspecified_of_string :
    string -> var_date_or_unspecified
    (** Deserialize JSON data of type {!type:var_date_or_unspecified}. *)
  
  val write_decimal_amount :
    Bi_outbuf.t -> decimal_amount -> unit
    (** Output a JSON value of type {!type:decimal_amount}. *)
  
  val string_of_decimal_amount :
    ?len:int -> decimal_amount -> string
    (** Serialize a value of type {!type:decimal_amount}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_decimal_amount :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> decimal_amount
    (** Input JSON data of type {!type:decimal_amount}. *)
  
  val decimal_amount_of_string :
    string -> decimal_amount
    (** Deserialize JSON data of type {!type:decimal_amount}. *)
  
  val write_code :
    Bi_outbuf.t -> code -> unit
    (** Output a JSON value of type {!type:code}. *)
  
  val string_of_code :
    ?len:int -> code -> string
    (** Serialize a value of type {!type:code}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_code :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> code
    (** Input JSON data of type {!type:code}. *)
  
  val code_of_string :
    string -> code
    (** Deserialize JSON data of type {!type:code}. *)
  
  val write_currency_PLN :
    Bi_outbuf.t -> currency_PLN -> unit
    (** Output a JSON value of type {!type:currency_PLN}. *)
  
  val string_of_currency_PLN :
    ?len:int -> currency_PLN -> string
    (** Serialize a value of type {!type:currency_PLN}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_currency_PLN :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> currency_PLN
    (** Input JSON data of type {!type:currency_PLN}. *)
  
  val currency_PLN_of_string :
    string -> currency_PLN
    (** Deserialize JSON data of type {!type:currency_PLN}. *)
  
  val write_currency :
    Bi_outbuf.t -> currency -> unit
    (** Output a JSON value of type {!type:currency}. *)
  
  val string_of_currency :
    ?len:int -> currency -> string
    (** Serialize a value of type {!type:currency}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_currency :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> currency
    (** Input JSON data of type {!type:currency}. *)
  
  val currency_of_string :
    string -> currency
    (** Deserialize JSON data of type {!type:currency}. *)
  
  val write_var_currency :
    Bi_outbuf.t -> var_currency -> unit
    (** Output a JSON value of type {!type:var_currency}. *)
  
  val string_of_var_currency :
    ?len:int -> var_currency -> string
    (** Serialize a value of type {!type:var_currency}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_currency :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_currency
    (** Input JSON data of type {!type:var_currency}. *)
  
  val var_currency_of_string :
    string -> var_currency
    (** Deserialize JSON data of type {!type:var_currency}. *)
  
  val write_primitive_variable_type :
    Bi_outbuf.t -> primitive_variable_type -> unit
    (** Output a JSON value of type {!type:primitive_variable_type}. *)
  
  val string_of_primitive_variable_type :
    ?len:int -> primitive_variable_type -> string
    (** Serialize a value of type {!type:primitive_variable_type}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_primitive_variable_type :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> primitive_variable_type
    (** Input JSON data of type {!type:primitive_variable_type}. *)
  
  val primitive_variable_type_of_string :
    string -> primitive_variable_type
    (** Deserialize JSON data of type {!type:primitive_variable_type}. *)
  
  val write_structure :
    Bi_outbuf.t -> structure -> unit
    (** Output a JSON value of type {!type:structure}. *)
  
  val string_of_structure :
    ?len:int -> structure -> string
    (** Serialize a value of type {!type:structure}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_structure :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> structure
    (** Input JSON data of type {!type:structure}. *)
  
  val structure_of_string :
    string -> structure
    (** Deserialize JSON data of type {!type:structure}. *)
  
  val write_primitive_var :
    Bi_outbuf.t -> primitive_var -> unit
    (** Output a JSON value of type {!type:primitive_var}. *)
  
  val string_of_primitive_var :
    ?len:int -> primitive_var -> string
    (** Serialize a value of type {!type:primitive_var}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_primitive_var :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> primitive_var
    (** Input JSON data of type {!type:primitive_var}. *)
  
  val primitive_var_of_string :
    string -> primitive_var
    (** Deserialize JSON data of type {!type:primitive_var}. *)
  
  val write_example_value :
    Bi_outbuf.t -> example_value -> unit
    (** Output a JSON value of type {!type:example_value}. *)
  
  val string_of_example_value :
    ?len:int -> example_value -> string
    (** Serialize a value of type {!type:example_value}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_example_value :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> example_value
    (** Input JSON data of type {!type:example_value}. *)
  
  val example_value_of_string :
    string -> example_value
    (** Deserialize JSON data of type {!type:example_value}. *)
  
  val write_example_item :
    Bi_outbuf.t -> example_item -> unit
    (** Output a JSON value of type {!type:example_item}. *)
  
  val string_of_example_item :
    ?len:int -> example_item -> string
    (** Serialize a value of type {!type:example_item}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_example_item :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> example_item
    (** Input JSON data of type {!type:example_item}. *)
  
  val example_item_of_string :
    string -> example_item
    (** Deserialize JSON data of type {!type:example_item}. *)
  
  val write_var_collection :
    Bi_outbuf.t -> var_collection -> unit
    (** Output a JSON value of type {!type:var_collection}. *)
  
  val string_of_var_collection :
    ?len:int -> var_collection -> string
    (** Serialize a value of type {!type:var_collection}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var_collection :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var_collection
    (** Input JSON data of type {!type:var_collection}. *)
  
  val var_collection_of_string :
    string -> var_collection
    (** Deserialize JSON data of type {!type:var_collection}. *)
  
  val write_var :
    Bi_outbuf.t -> var -> unit
    (** Output a JSON value of type {!type:var}. *)
  
  val string_of_var :
    ?len:int -> var -> string
    (** Serialize a value of type {!type:var}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_var :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> var
    (** Input JSON data of type {!type:var}. *)
  
  val var_of_string :
    string -> var
    (** Deserialize JSON data of type {!type:var}. *)
  
  val write_user_intent_key :
    Bi_outbuf.t -> user_intent_key -> unit
    (** Output a JSON value of type {!type:user_intent_key}. *)
  
  val string_of_user_intent_key :
    ?len:int -> user_intent_key -> string
    (** Serialize a value of type {!type:user_intent_key}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_user_intent_key :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> user_intent_key
    (** Input JSON data of type {!type:user_intent_key}. *)
  
  val user_intent_key_of_string :
    string -> user_intent_key
    (** Deserialize JSON data of type {!type:user_intent_key}. *)
  
  val write_operator_expr_token :
    Bi_outbuf.t -> operator_expr_token -> unit
    (** Output a JSON value of type {!type:operator_expr_token}. *)
  
  val string_of_operator_expr_token :
    ?len:int -> operator_expr_token -> string
    (** Serialize a value of type {!type:operator_expr_token}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_operator_expr_token :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> operator_expr_token
    (** Input JSON data of type {!type:operator_expr_token}. *)
  
  val operator_expr_token_of_string :
    string -> operator_expr_token
    (** Deserialize JSON data of type {!type:operator_expr_token}. *)
  
  val write_constant_token :
    Bi_outbuf.t -> constant_token -> unit
    (** Output a JSON value of type {!type:constant_token}. *)
  
  val string_of_constant_token :
    ?len:int -> constant_token -> string
    (** Serialize a value of type {!type:constant_token}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_constant_token :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> constant_token
    (** Input JSON data of type {!type:constant_token}. *)
  
  val constant_token_of_string :
    string -> constant_token
    (** Deserialize JSON data of type {!type:constant_token}. *)
  
  val write_basic_token :
    Bi_outbuf.t -> basic_token -> unit
    (** Output a JSON value of type {!type:basic_token}. *)
  
  val string_of_basic_token :
    ?len:int -> basic_token -> string
    (** Serialize a value of type {!type:basic_token}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_basic_token :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> basic_token
    (** Input JSON data of type {!type:basic_token}. *)
  
  val basic_token_of_string :
    string -> basic_token
    (** Deserialize JSON data of type {!type:basic_token}. *)
  
  val write_brackets :
    Bi_outbuf.t -> brackets -> unit
    (** Output a JSON value of type {!type:brackets}. *)
  
  val string_of_brackets :
    ?len:int -> brackets -> string
    (** Serialize a value of type {!type:brackets}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_brackets :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> brackets
    (** Input JSON data of type {!type:brackets}. *)
  
  val brackets_of_string :
    string -> brackets
    (** Deserialize JSON data of type {!type:brackets}. *)
  
  val write_basic_value :
    Bi_outbuf.t -> basic_value -> unit
    (** Output a JSON value of type {!type:basic_value}. *)
  
  val string_of_basic_value :
    ?len:int -> basic_value -> string
    (** Serialize a value of type {!type:basic_value}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_basic_value :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> basic_value
    (** Input JSON data of type {!type:basic_value}. *)
  
  val basic_value_of_string :
    string -> basic_value
    (** Deserialize JSON data of type {!type:basic_value}. *)
  
  val write_expression_token :
    Bi_outbuf.t -> expression_token -> unit
    (** Output a JSON value of type {!type:expression_token}. *)
  
  val string_of_expression_token :
    ?len:int -> expression_token -> string
    (** Serialize a value of type {!type:expression_token}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_expression_token :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> expression_token
    (** Input JSON data of type {!type:expression_token}. *)
  
  val expression_token_of_string :
    string -> expression_token
    (** Deserialize JSON data of type {!type:expression_token}. *)
  
  val write_expression :
    Bi_outbuf.t -> expression -> unit
    (** Output a JSON value of type {!type:expression}. *)
  
  val string_of_expression :
    ?len:int -> expression -> string
    (** Serialize a value of type {!type:expression}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_expression :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> expression
    (** Input JSON data of type {!type:expression}. *)
  
  val expression_of_string :
    string -> expression
    (** Deserialize JSON data of type {!type:expression}. *)
  
  val write_user_intent :
    Bi_outbuf.t -> user_intent -> unit
    (** Output a JSON value of type {!type:user_intent}. *)
  
  val string_of_user_intent :
    ?len:int -> user_intent -> string
    (** Serialize a value of type {!type:user_intent}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_user_intent :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> user_intent
    (** Input JSON data of type {!type:user_intent}. *)
  
  val user_intent_of_string :
    string -> user_intent
    (** Deserialize JSON data of type {!type:user_intent}. *)
  
  val write_user_intent_group :
    Bi_outbuf.t -> user_intent_group -> unit
    (** Output a JSON value of type {!type:user_intent_group}. *)
  
  val string_of_user_intent_group :
    ?len:int -> user_intent_group -> string
    (** Serialize a value of type {!type:user_intent_group}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_user_intent_group :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> user_intent_group
    (** Input JSON data of type {!type:user_intent_group}. *)
  
  val user_intent_group_of_string :
    string -> user_intent_group
    (** Deserialize JSON data of type {!type:user_intent_group}. *)
  
  val write_status_step :
    Bi_outbuf.t -> status_step -> unit
    (** Output a JSON value of type {!type:status_step}. *)
  
  val string_of_status_step :
    ?len:int -> status_step -> string
    (** Serialize a value of type {!type:status_step}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_status_step :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> status_step
    (** Input JSON data of type {!type:status_step}. *)
  
  val status_step_of_string :
    string -> status_step
    (** Deserialize JSON data of type {!type:status_step}. *)
  
  val write_status :
    Bi_outbuf.t -> status -> unit
    (** Output a JSON value of type {!type:status}. *)
  
  val string_of_status :
    ?len:int -> status -> string
    (** Serialize a value of type {!type:status}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_status :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> status
    (** Input JSON data of type {!type:status}. *)
  
  val status_of_string :
    string -> status
    (** Deserialize JSON data of type {!type:status}. *)
  
  val write_reaction_step :
    Bi_outbuf.t -> reaction_step -> unit
    (** Output a JSON value of type {!type:reaction_step}. *)
  
  val string_of_reaction_step :
    ?len:int -> reaction_step -> string
    (** Serialize a value of type {!type:reaction_step}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_reaction_step :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> reaction_step
    (** Input JSON data of type {!type:reaction_step}. *)
  
  val reaction_step_of_string :
    string -> reaction_step
    (** Deserialize JSON data of type {!type:reaction_step}. *)
  
  val write_output_repeat :
    Bi_outbuf.t -> output_repeat -> unit
    (** Output a JSON value of type {!type:output_repeat}. *)
  
  val string_of_output_repeat :
    ?len:int -> output_repeat -> string
    (** Serialize a value of type {!type:output_repeat}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_output_repeat :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> output_repeat
    (** Input JSON data of type {!type:output_repeat}. *)
  
  val output_repeat_of_string :
    string -> output_repeat
    (** Deserialize JSON data of type {!type:output_repeat}. *)
  
  val write_output_link :
    Bi_outbuf.t -> output_link -> unit
    (** Output a JSON value of type {!type:output_link}. *)
  
  val string_of_output_link :
    ?len:int -> output_link -> string
    (** Serialize a value of type {!type:output_link}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_output_link :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> output_link
    (** Input JSON data of type {!type:output_link}. *)
  
  val output_link_of_string :
    string -> output_link
    (** Deserialize JSON data of type {!type:output_link}. *)
  
  val write_output :
    Bi_outbuf.t -> output -> unit
    (** Output a JSON value of type {!type:output}. *)
  
  val string_of_output :
    ?len:int -> output -> string
    (** Serialize a value of type {!type:output}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_output :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> output
    (** Input JSON data of type {!type:output}. *)
  
  val output_of_string :
    string -> output
    (** Deserialize JSON data of type {!type:output}. *)
  
  val write_reaction_case :
    Bi_outbuf.t -> reaction_case -> unit
    (** Output a JSON value of type {!type:reaction_case}. *)
  
  val string_of_reaction_case :
    ?len:int -> reaction_case -> string
    (** Serialize a value of type {!type:reaction_case}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_reaction_case :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> reaction_case
    (** Input JSON data of type {!type:reaction_case}. *)
  
  val reaction_case_of_string :
    string -> reaction_case
    (** Deserialize JSON data of type {!type:reaction_case}. *)
  
  val write_reaction :
    Bi_outbuf.t -> reaction -> unit
    (** Output a JSON value of type {!type:reaction}. *)
  
  val string_of_reaction :
    ?len:int -> reaction -> string
    (** Serialize a value of type {!type:reaction}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_reaction :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> reaction
    (** Input JSON data of type {!type:reaction}. *)
  
  val reaction_of_string :
    string -> reaction
    (** Deserialize JSON data of type {!type:reaction}. *)
  
  val write_model_intent_key :
    Bi_outbuf.t -> model_intent_key -> unit
    (** Output a JSON value of type {!type:model_intent_key}. *)
  
  val string_of_model_intent_key :
    ?len:int -> model_intent_key -> string
    (** Serialize a value of type {!type:model_intent_key}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_model_intent_key :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> model_intent_key
    (** Input JSON data of type {!type:model_intent_key}. *)
  
  val model_intent_key_of_string :
    string -> model_intent_key
    (** Deserialize JSON data of type {!type:model_intent_key}. *)
  
  val write_intent_key :
    Bi_outbuf.t -> intent_key -> unit
    (** Output a JSON value of type {!type:intent_key}. *)
  
  val string_of_intent_key :
    ?len:int -> intent_key -> string
    (** Serialize a value of type {!type:intent_key}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_intent_key :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> intent_key
    (** Input JSON data of type {!type:intent_key}. *)
  
  val intent_key_of_string :
    string -> intent_key
    (** Deserialize JSON data of type {!type:intent_key}. *)
  
  val write_configuredModel :
    Bi_outbuf.t -> configuredModel -> unit
    (** Output a JSON value of type {!type:configuredModel}. *)
  
  val string_of_configuredModel :
    ?len:int -> configuredModel -> string
    (** Serialize a value of type {!type:configuredModel}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_configuredModel :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> configuredModel
    (** Input JSON data of type {!type:configuredModel}. *)
  
  val configuredModel_of_string :
    string -> configuredModel
    (** Deserialize JSON data of type {!type:configuredModel}. *)
  
  val write_branch :
    Bi_outbuf.t -> branch -> unit
    (** Output a JSON value of type {!type:branch}. *)
  
  val string_of_branch :
    ?len:int -> branch -> string
    (** Serialize a value of type {!type:branch}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_branch :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> branch
    (** Input JSON data of type {!type:branch}. *)
  
  val branch_of_string :
    string -> branch
    (** Deserialize JSON data of type {!type:branch}. *)
  
  val write_request :
    Bi_outbuf.t -> request -> unit
    (** Output a JSON value of type {!type:request}. *)
  
  val string_of_request :
    ?len:int -> request -> string
    (** Serialize a value of type {!type:request}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_request :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> request
    (** Input JSON data of type {!type:request}. *)
  
  val request_of_string :
    string -> request
    (** Deserialize JSON data of type {!type:request}. *)
  
  val write_introduction :
    Bi_outbuf.t -> introduction -> unit
    (** Output a JSON value of type {!type:introduction}. *)
  
  val string_of_introduction :
    ?len:int -> introduction -> string
    (** Serialize a value of type {!type:introduction}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_introduction :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> introduction
    (** Input JSON data of type {!type:introduction}. *)
  
  val introduction_of_string :
    string -> introduction
    (** Deserialize JSON data of type {!type:introduction}. *)
  
  val write_plan :
    Bi_outbuf.t -> plan -> unit
    (** Output a JSON value of type {!type:plan}. *)
  
  val string_of_plan :
    ?len:int -> plan -> string
    (** Serialize a value of type {!type:plan}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_plan :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> plan
    (** Input JSON data of type {!type:plan}. *)
  
  val plan_of_string :
    string -> plan
    (** Deserialize JSON data of type {!type:plan}. *)
  
  val write_model_variable :
    Bi_outbuf.t -> model_variable -> unit
    (** Output a JSON value of type {!type:model_variable}. *)
  
  val string_of_model_variable :
    ?len:int -> model_variable -> string
    (** Serialize a value of type {!type:model_variable}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_model_variable :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> model_variable
    (** Input JSON data of type {!type:model_variable}. *)
  
  val model_variable_of_string :
    string -> model_variable
    (** Deserialize JSON data of type {!type:model_variable}. *)
  
  val write_model_response_schema :
    Bi_outbuf.t -> model_response_schema -> unit
    (** Output a JSON value of type {!type:model_response_schema}. *)
  
  val string_of_model_response_schema :
    ?len:int -> model_response_schema -> string
    (** Serialize a value of type {!type:model_response_schema}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_model_response_schema :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> model_response_schema
    (** Input JSON data of type {!type:model_response_schema}. *)
  
  val model_response_schema_of_string :
    string -> model_response_schema
    (** Deserialize JSON data of type {!type:model_response_schema}. *)
  
  val write_metadata :
    Bi_outbuf.t -> metadata -> unit
    (** Output a JSON value of type {!type:metadata}. *)
  
  val string_of_metadata :
    ?len:int -> metadata -> string
    (** Serialize a value of type {!type:metadata}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_metadata :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> metadata
    (** Input JSON data of type {!type:metadata}. *)
  
  val metadata_of_string :
    string -> metadata
    (** Deserialize JSON data of type {!type:metadata}. *)
  
  val write_input_variable :
    Bi_outbuf.t -> input_variable -> unit
    (** Output a JSON value of type {!type:input_variable}. *)
  
  val string_of_input_variable :
    ?len:int -> input_variable -> string
    (** Serialize a value of type {!type:input_variable}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_input_variable :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> input_variable
    (** Input JSON data of type {!type:input_variable}. *)
  
  val input_variable_of_string :
    string -> input_variable
    (** Deserialize JSON data of type {!type:input_variable}. *)
  
  val write_gender :
    Bi_outbuf.t -> gender -> unit
    (** Output a JSON value of type {!type:gender}. *)
  
  val string_of_gender :
    ?len:int -> gender -> string
    (** Serialize a value of type {!type:gender}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_gender :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> gender
    (** Input JSON data of type {!type:gender}. *)
  
  val gender_of_string :
    string -> gender
    (** Deserialize JSON data of type {!type:gender}. *)
  
  val write_environment :
    Bi_outbuf.t -> environment -> unit
    (** Output a JSON value of type {!type:environment}. *)
  
  val string_of_environment :
    ?len:int -> environment -> string
    (** Serialize a value of type {!type:environment}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_environment :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> environment
    (** Input JSON data of type {!type:environment}. *)
  
  val environment_of_string :
    string -> environment
    (** Deserialize JSON data of type {!type:environment}. *)
  
  val write_input_variables :
    Bi_outbuf.t -> input_variables -> unit
    (** Output a JSON value of type {!type:input_variables}. *)
  
  val string_of_input_variables :
    ?len:int -> input_variables -> string
    (** Serialize a value of type {!type:input_variables}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_input_variables :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> input_variables
    (** Input JSON data of type {!type:input_variables}. *)
  
  val input_variables_of_string :
    string -> input_variables
    (** Deserialize JSON data of type {!type:input_variables}. *)
  
  val write_dialogData :
    Bi_outbuf.t -> dialogData -> unit
    (** Output a JSON value of type {!type:dialogData}. *)
  
  val string_of_dialogData :
    ?len:int -> dialogData -> string
    (** Serialize a value of type {!type:dialogData}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_dialogData :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> dialogData
    (** Input JSON data of type {!type:dialogData}. *)
  
  val dialogData_of_string :
    string -> dialogData
    (** Deserialize JSON data of type {!type:dialogData}. *)
  
  val write_dialog :
    Bi_outbuf.t -> dialog -> unit
    (** Output a JSON value of type {!type:dialog}. *)
  
  val string_of_dialog :
    ?len:int -> dialog -> string
    (** Serialize a value of type {!type:dialog}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_dialog :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> dialog
    (** Input JSON data of type {!type:dialog}. *)
  
  val dialog_of_string :
    string -> dialog
    (** Deserialize JSON data of type {!type:dialog}. *)
  
  val write_deploy_env :
    Bi_outbuf.t -> deploy_env -> unit
    (** Output a JSON value of type {!type:deploy_env}. *)
  
  val string_of_deploy_env :
    ?len:int -> deploy_env -> string
    (** Serialize a value of type {!type:deploy_env}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_deploy_env :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> deploy_env
    (** Input JSON data of type {!type:deploy_env}. *)
  
  val deploy_env_of_string :
    string -> deploy_env
    (** Deserialize JSON data of type {!type:deploy_env}. *)
  
  val write_dialog_file :
    Bi_outbuf.t -> dialog_file -> unit
    (** Output a JSON value of type {!type:dialog_file}. *)
  
  val string_of_dialog_file :
    ?len:int -> dialog_file -> string
    (** Serialize a value of type {!type:dialog_file}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_dialog_file :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> dialog_file
    (** Input JSON data of type {!type:dialog_file}. *)
  
  val dialog_file_of_string :
    string -> dialog_file
    (** Deserialize JSON data of type {!type:dialog_file}. *)
  
