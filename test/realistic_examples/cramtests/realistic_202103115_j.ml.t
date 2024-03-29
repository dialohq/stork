  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat realistic_202103115_j.ml  | ocamlformat --impl -
  File "<standard input>", line 1:
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
  
  let write_variable_ref_type = (
    fun ob x ->
      match x with
        | `Input -> Buffer.add_string ob "\"Input\""
        | `Model -> Buffer.add_string ob "\"Model\""
  )
  let string_of_variable_ref_type ?(len = 1024) x =
    let ob = Buffer.create len in
    write_variable_ref_type ob x;
    Buffer.contents ob
  let read_variable_ref_type = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Input" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Input
              | "Model" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Model
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Input" ->
                `Input
              | "Model" ->
                `Model
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let variable_ref_type_of_string s =
    read_variable_ref_type (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_variable_ref : _ -> variable_ref -> _ = (
    fun ob (x : variable_ref) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"variableType\":";
      (
        write_variable_ref_type
      )
        ob x.variableType;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"variableId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.variableId;
      Buffer.add_char ob '}';
  )
  let string_of_variable_ref ?(len = 1024) x =
    let ob = Buffer.create len in
    write_variable_ref ob x;
    Buffer.contents ob
  let read_variable_ref = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_variableType = ref (None) in
      let field_variableId = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 10 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'I' && String.unsafe_get s (pos+9) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'T' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_variableType := (
                Some (
                  (
                    read_variable_ref_type
                  ) p lb
                )
              );
            | 1 ->
              field_variableId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 10 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'I' && String.unsafe_get s (pos+9) = 'd' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 12 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'T' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_variableType := (
                  Some (
                    (
                      read_variable_ref_type
                    ) p lb
                  )
                );
              | 1 ->
                field_variableId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              variableType = (match !field_variableType with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variableType");
              variableId = (match !field_variableId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variableId");
            }
           : variable_ref)
        )
  )
  let variable_ref_of_string s =
    read_variable_ref (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_grammar_case = (
    fun ob x ->
      match x with
        | `Nominative -> Buffer.add_string ob "\"Nominative\""
        | `Genitive -> Buffer.add_string ob "\"Genitive\""
        | `Dative -> Buffer.add_string ob "\"Dative\""
        | `Accusative -> Buffer.add_string ob "\"Accusative\""
        | `Instrumental -> Buffer.add_string ob "\"Instrumental\""
        | `Locative -> Buffer.add_string ob "\"Locative\""
  )
  let string_of_grammar_case ?(len = 1024) x =
    let ob = Buffer.create len in
    write_grammar_case ob x;
    Buffer.contents ob
  let read_grammar_case = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Nominative" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Nominative
              | "Genitive" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Genitive
              | "Dative" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Dative
              | "Accusative" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Accusative
              | "Instrumental" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Instrumental
              | "Locative" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Locative
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Nominative" ->
                `Nominative
              | "Genitive" ->
                `Genitive
              | "Dative" ->
                `Dative
              | "Accusative" ->
                `Accusative
              | "Instrumental" ->
                `Instrumental
              | "Locative" ->
                `Locative
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let grammar_case_of_string s =
    read_grammar_case (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_declensed_variable : _ -> declensed_variable -> _ = (
    fun ob (x : declensed_variable) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"ref\":";
      (
        write_variable_ref
      )
        ob x.ref;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"grammarCase\":";
      (
        write_grammar_case
      )
        ob x.grammarCase;
      Buffer.add_char ob '}';
  )
  let string_of_declensed_variable ?(len = 1024) x =
    let ob = Buffer.create len in
    write_declensed_variable ob x;
    Buffer.contents ob
  let read_declensed_variable = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_ref = ref (None) in
      let field_grammarCase = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'f' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'C' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_ref := (
                Some (
                  (
                    read_variable_ref
                  ) p lb
                )
              );
            | 1 ->
              field_grammarCase := (
                Some (
                  (
                    read_grammar_case
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 3 -> (
                    if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'f' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 11 -> (
                    if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'r' && String.unsafe_get s (pos+7) = 'C' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_ref := (
                  Some (
                    (
                      read_variable_ref
                    ) p lb
                  )
                );
              | 1 ->
                field_grammarCase := (
                  Some (
                    (
                      read_grammar_case
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              ref = (match !field_ref with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ref");
              grammarCase = (match !field_grammarCase with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "grammarCase");
            }
           : declensed_variable)
        )
  )
  let declensed_variable_of_string s =
    read_declensed_variable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_prompt_item : _ -> prompt_item -> _ = (
    Atdgen_runtime.Oj_run.write_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.restore (
      fun ob x ->
        match x with
          | Text x ->
            Buffer.add_string ob "[\"Text\",";
            (
              Yojson.Safe.write_string
            ) ob x;
            Buffer.add_char ob ']'
          | Verbatim x ->
            Buffer.add_string ob "[\"Verbatim\",";
            (
              write_variable_ref
            ) ob x;
            Buffer.add_char ob ']'
          | Declensed x ->
            Buffer.add_string ob "[\"Declensed\",";
            (
              write_declensed_variable
            ) ob x;
            Buffer.add_char ob ']'
    )
  )
  let string_of_prompt_item ?(len = 1024) x =
    let ob = Buffer.create len in
    write_prompt_item ob x;
    Buffer.contents ob
  let read_prompt_item = (
    Atdgen_runtime.Oj_run.read_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.normalize (
      fun p lb ->
        Yojson.Safe.read_space p lb;
        match Yojson.Safe.start_any_variant p lb with
          | `Edgy_bracket -> (
              match Yojson.Safe.read_ident p lb with
                | "Text" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Text x : prompt_item)
                | "Verbatim" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_variable_ref
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Verbatim x : prompt_item)
                | "Declensed" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_declensed_variable
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Declensed x : prompt_item)
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Double_quote -> (
              match Yojson.Safe.finish_string p lb with
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Square_bracket -> (
              match Atdgen_runtime.Oj_run.read_string p lb with
                | "Text" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Text x : prompt_item)
                | "Verbatim" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_variable_ref
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Verbatim x : prompt_item)
                | "Declensed" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_declensed_variable
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Declensed x : prompt_item)
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
    )
  )
  let prompt_item_of_string s =
    read_prompt_item (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_18a9968 = (
    Atdgen_runtime.Oj_run.write_array (
      write_prompt_item
    )
  )
  let string_of__x_18a9968 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_18a9968 ob x;
    Buffer.contents ob
  let read__x_18a9968 = (
    Atdgen_runtime.Oj_run.read_array (
      read_prompt_item
    )
  )
  let _x_18a9968_of_string s =
    read__x_18a9968 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_prompt = (
    write__x_18a9968
  )
  let string_of_prompt ?(len = 1024) x =
    let ob = Buffer.create len in
    write_prompt ob x;
    Buffer.contents ob
  let read_prompt = (
    read__x_18a9968
  )
  let prompt_of_string s =
    read_prompt (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_variant : _ -> variant -> _ = (
    fun ob (x : variant) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"value\":";
      (
        write_prompt
      )
        ob x.value;
      Buffer.add_char ob '}';
  )
  let string_of_variant ?(len = 1024) x =
    let ob = Buffer.create len in
    write_variant ob x;
    Buffer.contents ob
  let read_variant = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_value = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_value := (
                Some (
                  (
                    read_prompt
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 5 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_value := (
                  Some (
                    (
                      read_prompt
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              value = (match !field_value with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "value");
            }
           : variant)
        )
  )
  let variant_of_string s =
    read_variant (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_variable_expression : _ -> variable_expression -> _ = (
    fun ob (x : variable_expression) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"ref\":";
      (
        write_variable_ref
      )
        ob x.ref;
      Buffer.add_char ob '}';
  )
  let string_of_variable_expression ?(len = 1024) x =
    let ob = Buffer.create len in
    write_variable_expression ob x;
    Buffer.contents ob
  let read_variable_expression = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      let field_ref = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'f' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_ref := (
                Some (
                  (
                    read_variable_ref
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 3 -> (
                    if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'f' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_ref := (
                  Some (
                    (
                      read_variable_ref
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              ref = (match !field_ref with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "ref");
            }
           : variable_expression)
        )
  )
  let variable_expression_of_string s =
    read_variable_expression (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_variable_expr_token : _ -> variable_expr_token -> _ = (
    fun ob (x : variable_expr_token) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"value\":";
      (
        write_variable_expression
      )
        ob x.value;
      Buffer.add_char ob '}';
  )
  let string_of_variable_expr_token ?(len = 1024) x =
    let ob = Buffer.create len in
    write_variable_expr_token ob x;
    Buffer.contents ob
  let read_variable_expr_token = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_value = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_value := (
                Some (
                  (
                    read_variable_expression
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_value := (
                  Some (
                    (
                      read_variable_expression
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              value = (match !field_value with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "value");
            }
           : variable_expr_token)
        )
  )
  let variable_expr_token_of_string s =
    read_variable_expr_token (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_string : _ -> var_string -> _ = (
    fun ob (x : var_string) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"testValue\":";
      (
        Yojson.Safe.write_string
      )
        ob x.testValue;
      Buffer.add_char ob '}';
  )
  let string_of_var_string ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_string ob x;
    Buffer.contents ob
  let read_var_string = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_testValue = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_testValue := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_testValue := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              testValue = (match !field_testValue with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "testValue");
            }
           : var_string)
        )
  )
  let var_string_of_string s =
    read_var_string (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_pesel : _ -> var_pesel -> _ = (
    fun ob (x : var_pesel) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"testValue\":";
      (
        Yojson.Safe.write_string
      )
        ob x.testValue;
      Buffer.add_char ob '}';
  )
  let string_of_var_pesel ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_pesel ob x;
    Buffer.contents ob
  let read_var_pesel = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_testValue = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_testValue := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_testValue := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              testValue = (match !field_testValue with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "testValue");
            }
           : var_pesel)
        )
  )
  let var_pesel_of_string s =
    read_var_pesel (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_number : _ -> var_number -> _ = (
    fun ob (x : var_number) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"testValue\":";
      (
        Yojson.Safe.write_std_float
      )
        ob x.testValue;
      Buffer.add_char ob '}';
  )
  let string_of_var_number ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_number ob x;
    Buffer.contents ob
  let read_var_number = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_testValue = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_testValue := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_number
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_testValue := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_number
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              testValue = (match !field_testValue with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "testValue");
            }
           : var_number)
        )
  )
  let var_number_of_string s =
    read_var_number (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_number_or_unspecified = (
    fun ob x ->
      match x with
        | `Number x ->
          Buffer.add_string ob "[\"Number\",";
          (
            write_var_number
          ) ob x;
          Buffer.add_char ob ']'
        | `Unspecified -> Buffer.add_string ob "\"Unspecified\""
  )
  let string_of_var_number_or_unspecified ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_number_or_unspecified ob x;
    Buffer.contents ob
  let read_var_number_or_unspecified = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Number" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_var_number
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Number x
              | "Unspecified" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Unspecified
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Unspecified" ->
                `Unspecified
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Number" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_var_number
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                `Number x
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let var_number_or_unspecified_of_string s =
    read_var_number_or_unspecified (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_nip : _ -> var_nip -> _ = (
    fun ob (x : var_nip) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"testValue\":";
      (
        Yojson.Safe.write_string
      )
        ob x.testValue;
      Buffer.add_char ob '}';
  )
  let string_of_var_nip ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_nip ob x;
    Buffer.contents ob
  let read_var_nip = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_testValue = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_testValue := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_testValue := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              testValue = (match !field_testValue with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "testValue");
            }
           : var_nip)
        )
  )
  let var_nip_of_string s =
    read_var_nip (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_date : _ -> date -> _ = (
    fun ob (x : date) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"year\":";
      (
        Yojson.Safe.write_int
      )
        ob x.year;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"month\":";
      (
        Yojson.Safe.write_int
      )
        ob x.month;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"day\":";
      (
        Yojson.Safe.write_int
      )
        ob x.day;
      Buffer.add_char ob '}';
  )
  let string_of_date ?(len = 1024) x =
    let ob = Buffer.create len in
    write_date ob x;
    Buffer.contents ob
  let read_date = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_year = ref (None) in
      let field_month = ref (None) in
      let field_day = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'y' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'y' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'h' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_year := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_month := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 2 ->
              field_day := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 3 -> (
                    if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'y' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'y' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'r' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 5 -> (
                    if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'h' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_year := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 1 ->
                field_month := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 2 ->
                field_day := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              year = (match !field_year with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "year");
              month = (match !field_month with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "month");
              day = (match !field_day with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "day");
            }
           : date)
        )
  )
  let date_of_string s =
    read_date (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_date : _ -> var_date -> _ = (
    fun ob (x : var_date) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"testValue\":";
      (
        write_date
      )
        ob x.testValue;
      Buffer.add_char ob '}';
  )
  let string_of_var_date ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_date ob x;
    Buffer.contents ob
  let read_var_date = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_testValue = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_testValue := (
                Some (
                  (
                    read_date
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_testValue := (
                  Some (
                    (
                      read_date
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              testValue = (match !field_testValue with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "testValue");
            }
           : var_date)
        )
  )
  let var_date_of_string s =
    read_var_date (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_date_or_unspecified = (
    fun ob x ->
      match x with
        | `Date x ->
          Buffer.add_string ob "[\"Date\",";
          (
            write_var_date
          ) ob x;
          Buffer.add_char ob ']'
        | `Unspecified -> Buffer.add_string ob "\"Unspecified\""
  )
  let string_of_var_date_or_unspecified ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_date_or_unspecified ob x;
    Buffer.contents ob
  let read_var_date_or_unspecified = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Date" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_var_date
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Date x
              | "Unspecified" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Unspecified
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Unspecified" ->
                `Unspecified
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Date" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_var_date
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                `Date x
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let var_date_or_unspecified_of_string s =
    read_var_date_or_unspecified (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_decimal_amount : _ -> decimal_amount -> _ = (
    fun ob (x : decimal_amount) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"main\":";
      (
        Yojson.Safe.write_int
      )
        ob x.main;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"sub\":";
      (
        Yojson.Safe.write_int
      )
        ob x.sub;
      Buffer.add_char ob '}';
  )
  let string_of_decimal_amount ?(len = 1024) x =
    let ob = Buffer.create len in
    write_decimal_amount ob x;
    Buffer.contents ob
  let read_decimal_amount = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_main = ref (None) in
      let field_sub = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'b' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_main := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_sub := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 3 -> (
                    if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'b' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'n' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_main := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 1 ->
                field_sub := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              main = (match !field_main with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "main");
              sub = (match !field_sub with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "sub");
            }
           : decimal_amount)
        )
  )
  let decimal_amount_of_string s =
    read_decimal_amount (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_code = (
    fun ob x ->
      match x with
        | `PLN -> Buffer.add_string ob "\"PLN\""
  )
  let string_of_code ?(len = 1024) x =
    let ob = Buffer.create len in
    write_code ob x;
    Buffer.contents ob
  let read_code = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "PLN" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `PLN
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "PLN" ->
                `PLN
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let code_of_string s =
    read_code (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_currency_PLN : _ -> currency_PLN -> _ = (
    fun ob (x : currency_PLN) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"amount\":";
      (
        write_decimal_amount
      )
        ob x.amount;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"code\":";
      (
        write_code
      )
        ob x.code;
      Buffer.add_char ob '}';
  )
  let string_of_currency_PLN ?(len = 1024) x =
    let ob = Buffer.create len in
    write_currency_PLN ob x;
    Buffer.contents ob
  let read_currency_PLN = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_amount = ref (None) in
      let field_code = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_amount := (
                Some (
                  (
                    read_decimal_amount
                  ) p lb
                )
              );
            | 1 ->
              field_code := (
                Some (
                  (
                    read_code
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 4 -> (
                    if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 6 -> (
                    if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_amount := (
                  Some (
                    (
                      read_decimal_amount
                    ) p lb
                  )
                );
              | 1 ->
                field_code := (
                  Some (
                    (
                      read_code
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              amount = (match !field_amount with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "amount");
              code = (match !field_code with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "code");
            }
           : currency_PLN)
        )
  )
  let currency_PLN_of_string s =
    read_currency_PLN (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_currency = (
    write_currency_PLN
  )
  let string_of_currency ?(len = 1024) x =
    let ob = Buffer.create len in
    write_currency ob x;
    Buffer.contents ob
  let read_currency = (
    read_currency_PLN
  )
  let currency_of_string s =
    read_currency (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_currency : _ -> var_currency -> _ = (
    fun ob (x : var_currency) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"testValue\":";
      (
        write_currency
      )
        ob x.testValue;
      Buffer.add_char ob '}';
  )
  let string_of_var_currency ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_currency ob x;
    Buffer.contents ob
  let read_var_currency = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_testValue = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_testValue := (
                Some (
                  (
                    read_currency
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'V' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_testValue := (
                  Some (
                    (
                      read_currency
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              testValue = (match !field_testValue with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "testValue");
            }
           : var_currency)
        )
  )
  let var_currency_of_string s =
    read_var_currency (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_primitive_variable_type = (
    fun ob x ->
      match x with
        | `Number -> Buffer.add_string ob "\"Number\""
        | `String -> Buffer.add_string ob "\"String\""
        | `Date -> Buffer.add_string ob "\"Date\""
        | `Nip -> Buffer.add_string ob "\"Nip\""
        | `Pesel -> Buffer.add_string ob "\"Pesel\""
        | `Currency -> Buffer.add_string ob "\"Currency\""
        | `Range -> Buffer.add_string ob "\"Range\""
  )
  let string_of_primitive_variable_type ?(len = 1024) x =
    let ob = Buffer.create len in
    write_primitive_variable_type ob x;
    Buffer.contents ob
  let read_primitive_variable_type = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Number" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Number
              | "String" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `String
              | "Date" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Date
              | "Nip" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Nip
              | "Pesel" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Pesel
              | "Currency" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Currency
              | "Range" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Range
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Number" ->
                `Number
              | "String" ->
                `String
              | "Date" ->
                `Date
              | "Nip" ->
                `Nip
              | "Pesel" ->
                `Pesel
              | "Currency" ->
                `Currency
              | "Range" ->
                `Range
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let primitive_variable_type_of_string s =
    read_primitive_variable_type (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_structure : _ -> structure -> _ = (
    fun ob (x : structure) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"variableType\":";
      (
        write_primitive_variable_type
      )
        ob x.variableType;
      Buffer.add_char ob '}';
  )
  let string_of_structure ?(len = 1024) x =
    let ob = Buffer.create len in
    write_structure ob x;
    Buffer.contents ob
  let read_structure = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      let field_variableType = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'T' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_variableType := (
                Some (
                  (
                    read_primitive_variable_type
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 12 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'T' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_variableType := (
                  Some (
                    (
                      read_primitive_variable_type
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              variableType = (match !field_variableType with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variableType");
            }
           : structure)
        )
  )
  let structure_of_string s =
    read_structure (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_primitive_var = (
    Atdgen_runtime.Oj_run.write_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.restore (
      fun ob x ->
        match x with
          | `Number x ->
            Buffer.add_string ob "[\"Number\",";
            (
              write_var_number
            ) ob x;
            Buffer.add_char ob ']'
          | `String x ->
            Buffer.add_string ob "[\"String\",";
            (
              write_var_string
            ) ob x;
            Buffer.add_char ob ']'
          | `Date x ->
            Buffer.add_string ob "[\"Date\",";
            (
              write_var_date
            ) ob x;
            Buffer.add_char ob ']'
          | `Nip x ->
            Buffer.add_string ob "[\"Nip\",";
            (
              write_var_nip
            ) ob x;
            Buffer.add_char ob ']'
          | `Pesel x ->
            Buffer.add_string ob "[\"Pesel\",";
            (
              write_var_pesel
            ) ob x;
            Buffer.add_char ob ']'
          | `Currency x ->
            Buffer.add_string ob "[\"Currency\",";
            (
              write_var_currency
            ) ob x;
            Buffer.add_char ob ']'
          | `NumberOrUnspecified x ->
            Buffer.add_string ob "[\"NumberOrUnspecified\",";
            (
              write_var_number_or_unspecified
            ) ob x;
            Buffer.add_char ob ']'
          | `DateOrUnspecified x ->
            Buffer.add_string ob "[\"DateOrUnspecified\",";
            (
              write_var_date_or_unspecified
            ) ob x;
            Buffer.add_char ob ']'
    )
  )
  let string_of_primitive_var ?(len = 1024) x =
    let ob = Buffer.create len in
    write_primitive_var ob x;
    Buffer.contents ob
  let read_primitive_var = (
    Atdgen_runtime.Oj_run.read_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.normalize (
      fun p lb ->
        Yojson.Safe.read_space p lb;
        match Yojson.Safe.start_any_variant p lb with
          | `Edgy_bracket -> (
              match Yojson.Safe.read_ident p lb with
                | "Number" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_number
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Number x
                | "String" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_string
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `String x
                | "Date" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_date
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Date x
                | "Nip" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_nip
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Nip x
                | "Pesel" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_pesel
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Pesel x
                | "Currency" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_currency
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Currency x
                | "NumberOrUnspecified" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_number_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `NumberOrUnspecified x
                | "DateOrUnspecified" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_date_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `DateOrUnspecified x
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Double_quote -> (
              match Yojson.Safe.finish_string p lb with
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Square_bracket -> (
              match Atdgen_runtime.Oj_run.read_string p lb with
                | "Number" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_number
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Number x
                | "String" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_string
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `String x
                | "Date" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_date
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Date x
                | "Nip" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_nip
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Nip x
                | "Pesel" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_pesel
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Pesel x
                | "Currency" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_currency
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Currency x
                | "NumberOrUnspecified" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_number_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `NumberOrUnspecified x
                | "DateOrUnspecified" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_date_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `DateOrUnspecified x
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
    )
  )
  let primitive_var_of_string s =
    read_primitive_var (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_example_value : _ -> example_value -> _ = (
    fun ob (x : example_value) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"value\":";
      (
        write_primitive_var
      )
        ob x.value;
      Buffer.add_char ob '}';
  )
  let string_of_example_value ?(len = 1024) x =
    let ob = Buffer.create len in
    write_example_value ob x;
    Buffer.contents ob
  let read_example_value = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      let field_value = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_value := (
                Some (
                  (
                    read_primitive_var
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 5 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_value := (
                  Some (
                    (
                      read_primitive_var
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              value = (match !field_value with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "value");
            }
           : example_value)
        )
  )
  let example_value_of_string s =
    read_example_value (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_2f72ef7 = (
    Atdgen_runtime.Oj_run.write_array (
      write_example_value
    )
  )
  let string_of__x_2f72ef7 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_2f72ef7 ob x;
    Buffer.contents ob
  let read__x_2f72ef7 = (
    Atdgen_runtime.Oj_run.read_array (
      read_example_value
    )
  )
  let _x_2f72ef7_of_string s =
    read__x_2f72ef7 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_example_item = (
    write__x_2f72ef7
  )
  let string_of_example_item ?(len = 1024) x =
    let ob = Buffer.create len in
    write_example_item ob x;
    Buffer.contents ob
  let read_example_item = (
    read__x_2f72ef7
  )
  let example_item_of_string s =
    read_example_item (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_936f542 = (
    Atdgen_runtime.Oj_run.write_array (
      write_example_item
    )
  )
  let string_of__x_936f542 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_936f542 ob x;
    Buffer.contents ob
  let read__x_936f542 = (
    Atdgen_runtime.Oj_run.read_array (
      read_example_item
    )
  )
  let _x_936f542_of_string s =
    read__x_936f542 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_2a8c705 = (
    Atdgen_runtime.Oj_run.write_array (
      write_structure
    )
  )
  let string_of__x_2a8c705 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_2a8c705 ob x;
    Buffer.contents ob
  let read__x_2a8c705 = (
    Atdgen_runtime.Oj_run.read_array (
      read_structure
    )
  )
  let _x_2a8c705_of_string s =
    read__x_2a8c705 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var_collection : _ -> var_collection -> _ = (
    fun ob (x : var_collection) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"structure\":";
      (
        write__x_2a8c705
      )
        ob x.structure;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"exampleItems\":";
      (
        write__x_936f542
      )
        ob x.exampleItems;
      Buffer.add_char ob '}';
  )
  let string_of_var_collection ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var_collection ob x;
    Buffer.contents ob
  let read_var_collection = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_structure = ref (None) in
      let field_exampleItems = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 9 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_structure := (
                Some (
                  (
                    read__x_2a8c705
                  ) p lb
                )
              );
            | 1 ->
              field_exampleItems := (
                Some (
                  (
                    read__x_936f542
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 9 -> (
                    if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 12 -> (
                    if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'l' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'm' && String.unsafe_get s (pos+11) = 's' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_structure := (
                  Some (
                    (
                      read__x_2a8c705
                    ) p lb
                  )
                );
              | 1 ->
                field_exampleItems := (
                  Some (
                    (
                      read__x_936f542
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              structure = (match !field_structure with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "structure");
              exampleItems = (match !field_exampleItems with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "exampleItems");
            }
           : var_collection)
        )
  )
  let var_collection_of_string s =
    read_var_collection (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_var = (
    Atdgen_runtime.Oj_run.write_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.restore (
      fun ob x ->
        match x with
          | `Number x ->
            Buffer.add_string ob "[\"Number\",";
            (
              write_var_number
            ) ob x;
            Buffer.add_char ob ']'
          | `String x ->
            Buffer.add_string ob "[\"String\",";
            (
              write_var_string
            ) ob x;
            Buffer.add_char ob ']'
          | `Date x ->
            Buffer.add_string ob "[\"Date\",";
            (
              write_var_date
            ) ob x;
            Buffer.add_char ob ']'
          | `Nip x ->
            Buffer.add_string ob "[\"Nip\",";
            (
              write_var_nip
            ) ob x;
            Buffer.add_char ob ']'
          | `Pesel x ->
            Buffer.add_string ob "[\"Pesel\",";
            (
              write_var_pesel
            ) ob x;
            Buffer.add_char ob ']'
          | `Currency x ->
            Buffer.add_string ob "[\"Currency\",";
            (
              write_var_currency
            ) ob x;
            Buffer.add_char ob ']'
          | `Collection x ->
            Buffer.add_string ob "[\"Collection\",";
            (
              write_var_collection
            ) ob x;
            Buffer.add_char ob ']'
          | `NumberOrUnspecified x ->
            Buffer.add_string ob "[\"NumberOrUnspecified\",";
            (
              write_var_number_or_unspecified
            ) ob x;
            Buffer.add_char ob ']'
          | `DateOrUnspecified x ->
            Buffer.add_string ob "[\"DateOrUnspecified\",";
            (
              write_var_date_or_unspecified
            ) ob x;
            Buffer.add_char ob ']'
    )
  )
  let string_of_var ?(len = 1024) x =
    let ob = Buffer.create len in
    write_var ob x;
    Buffer.contents ob
  let read_var = (
    Atdgen_runtime.Oj_run.read_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.normalize (
      fun p lb ->
        Yojson.Safe.read_space p lb;
        match Yojson.Safe.start_any_variant p lb with
          | `Edgy_bracket -> (
              match Yojson.Safe.read_ident p lb with
                | "Number" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_number
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Number x
                | "String" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_string
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `String x
                | "Date" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_date
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Date x
                | "Nip" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_nip
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Nip x
                | "Pesel" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_pesel
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Pesel x
                | "Currency" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_currency
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Currency x
                | "Collection" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_collection
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `Collection x
                | "NumberOrUnspecified" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_number_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `NumberOrUnspecified x
                | "DateOrUnspecified" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_var_date_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  `DateOrUnspecified x
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Double_quote -> (
              match Yojson.Safe.finish_string p lb with
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Square_bracket -> (
              match Atdgen_runtime.Oj_run.read_string p lb with
                | "Number" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_number
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Number x
                | "String" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_string
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `String x
                | "Date" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_date
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Date x
                | "Nip" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_nip
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Nip x
                | "Pesel" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_pesel
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Pesel x
                | "Currency" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_currency
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Currency x
                | "Collection" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_collection
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `Collection x
                | "NumberOrUnspecified" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_number_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `NumberOrUnspecified x
                | "DateOrUnspecified" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_var_date_or_unspecified
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  `DateOrUnspecified x
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
    )
  )
  let var_of_string s =
    read_var (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_user_intent_key : _ -> user_intent_key -> _ = (
    fun ob (x : user_intent_key) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"groupId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.groupId;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      Buffer.add_char ob '}';
  )
  let string_of_user_intent_key ?(len = 1024) x =
    let ob = Buffer.create len in
    write_user_intent_key ob x;
    Buffer.contents ob
  let read_user_intent_key = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_groupId = ref (None) in
      let field_id = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_groupId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_groupId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              groupId = (match !field_groupId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "groupId");
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
            }
           : user_intent_key)
        )
  )
  let user_intent_key_of_string s =
    read_user_intent_key (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_operator_expr_token : _ -> operator_expr_token -> _ = (
    fun ob (x : operator_expr_token) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"tokenType\":";
      (
        Yojson.Safe.write_string
      )
        ob x.tokenType;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"operator\":";
      (
        Yojson.Safe.write_string
      )
        ob x.operator;
      Buffer.add_char ob '}';
  )
  let string_of_operator_expr_token ?(len = 1024) x =
    let ob = Buffer.create len in
    write_operator_expr_token ob x;
    Buffer.contents ob
  let read_operator_expr_token = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_tokenType = ref (None) in
      let field_operator = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 8 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'T' && String.unsafe_get s (pos+6) = 'y' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_tokenType := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_operator := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 8 -> (
                    if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 9 -> (
                    if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'k' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'T' && String.unsafe_get s (pos+6) = 'y' && String.unsafe_get s (pos+7) = 'p' && String.unsafe_get s (pos+8) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_tokenType := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_operator := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              tokenType = (match !field_tokenType with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "tokenType");
              operator = (match !field_operator with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "operator");
            }
           : operator_expr_token)
        )
  )
  let operator_expr_token_of_string s =
    read_operator_expr_token (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_constant_token : _ -> constant_token -> _ = (
    fun ob (x : constant_token) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"value\":";
      (
        Yojson.Safe.write_string
      )
        ob x.value;
      Buffer.add_char ob '}';
  )
  let string_of_constant_token ?(len = 1024) x =
    let ob = Buffer.create len in
    write_constant_token ob x;
    Buffer.contents ob
  let read_constant_token = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_value = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_value := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_value := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              value = (match !field_value with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "value");
            }
           : constant_token)
        )
  )
  let constant_token_of_string s =
    read_constant_token (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_basic_token : _ -> basic_token -> _ = (
    Atdgen_runtime.Oj_run.write_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.restore (
      fun ob x ->
        match x with
          | Operator x ->
            Buffer.add_string ob "[\"Operator\",";
            (
              write_operator_expr_token
            ) ob x;
            Buffer.add_char ob ']'
          | Variable x ->
            Buffer.add_string ob "[\"Variable\",";
            (
              write_variable_expr_token
            ) ob x;
            Buffer.add_char ob ']'
          | Constant x ->
            Buffer.add_string ob "[\"Constant\",";
            (
              write_constant_token
            ) ob x;
            Buffer.add_char ob ']'
    )
  )
  let string_of_basic_token ?(len = 1024) x =
    let ob = Buffer.create len in
    write_basic_token ob x;
    Buffer.contents ob
  let read_basic_token = (
    Atdgen_runtime.Oj_run.read_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.normalize (
      fun p lb ->
        Yojson.Safe.read_space p lb;
        match Yojson.Safe.start_any_variant p lb with
          | `Edgy_bracket -> (
              match Yojson.Safe.read_ident p lb with
                | "Operator" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_operator_expr_token
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Operator x : basic_token)
                | "Variable" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_variable_expr_token
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Variable x : basic_token)
                | "Constant" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_constant_token
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Constant x : basic_token)
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Double_quote -> (
              match Yojson.Safe.finish_string p lb with
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Square_bracket -> (
              match Atdgen_runtime.Oj_run.read_string p lb with
                | "Operator" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_operator_expr_token
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Operator x : basic_token)
                | "Variable" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_variable_expr_token
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Variable x : basic_token)
                | "Constant" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_constant_token
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Constant x : basic_token)
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
    )
  )
  let basic_token_of_string s =
    read_basic_token (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_ed039b7 = (
    Atdgen_runtime.Oj_run.write_array (
      write_basic_token
    )
  )
  let string_of__x_ed039b7 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_ed039b7 ob x;
    Buffer.contents ob
  let read__x_ed039b7 = (
    Atdgen_runtime.Oj_run.read_array (
      read_basic_token
    )
  )
  let _x_ed039b7_of_string s =
    read__x_ed039b7 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_brackets : _ -> brackets -> _ = (
    fun ob (x : brackets) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"value\":";
      (
        write__x_ed039b7
      )
        ob x.value;
      Buffer.add_char ob '}';
  )
  let string_of_brackets ?(len = 1024) x =
    let ob = Buffer.create len in
    write_brackets ob x;
    Buffer.contents ob
  let read_brackets = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_value = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_value := (
                Some (
                  (
                    read__x_ed039b7
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_value := (
                  Some (
                    (
                      read__x_ed039b7
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              value = (match !field_value with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "value");
            }
           : brackets)
        )
  )
  let brackets_of_string s =
    read_brackets (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_basic_value : _ -> basic_value -> _ = (
    fun ob (x : basic_value) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"value\":";
      (
        write_basic_token
      )
        ob x.value;
      Buffer.add_char ob '}';
  )
  let string_of_basic_value ?(len = 1024) x =
    let ob = Buffer.create len in
    write_basic_value ob x;
    Buffer.contents ob
  let read_basic_value = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_value = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_value := (
                Some (
                  (
                    read_basic_token
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 5 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_value := (
                  Some (
                    (
                      read_basic_token
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              value = (match !field_value with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "value");
            }
           : basic_value)
        )
  )
  let basic_value_of_string s =
    read_basic_value (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_expression_token : _ -> expression_token -> _ = (
    Atdgen_runtime.Oj_run.write_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.restore (
      fun ob x ->
        match x with
          | Basic x ->
            Buffer.add_string ob "[\"Basic\",";
            (
              write_basic_value
            ) ob x;
            Buffer.add_char ob ']'
          | Brackets x ->
            Buffer.add_string ob "[\"Brackets\",";
            (
              write_brackets
            ) ob x;
            Buffer.add_char ob ']'
    )
  )
  let string_of_expression_token ?(len = 1024) x =
    let ob = Buffer.create len in
    write_expression_token ob x;
    Buffer.contents ob
  let read_expression_token = (
    Atdgen_runtime.Oj_run.read_with_adapter Atdgen_universal_codec.Json_adapter.Type_field.normalize (
      fun p lb ->
        Yojson.Safe.read_space p lb;
        match Yojson.Safe.start_any_variant p lb with
          | `Edgy_bracket -> (
              match Yojson.Safe.read_ident p lb with
                | "Basic" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_basic_value
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Basic x : expression_token)
                | "Brackets" ->
                  Atdgen_runtime.Oj_run.read_until_field_value p lb;
                  let x = (
                      read_brackets
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_gt p lb;
                  (Brackets x : expression_token)
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Double_quote -> (
              match Yojson.Safe.finish_string p lb with
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
          | `Square_bracket -> (
              match Atdgen_runtime.Oj_run.read_string p lb with
                | "Basic" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_basic_value
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Basic x : expression_token)
                | "Brackets" ->
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_comma p lb;
                  Yojson.Safe.read_space p lb;
                  let x = (
                      read_brackets
                    ) p lb
                  in
                  Yojson.Safe.read_space p lb;
                  Yojson.Safe.read_rbr p lb;
                  (Brackets x : expression_token)
                | x ->
                  Atdgen_runtime.Oj_run.invalid_variant_tag p x
            )
    )
  )
  let expression_token_of_string s =
    read_expression_token (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_73298d8 = (
    Atdgen_runtime.Oj_run.write_array (
      write_expression_token
    )
  )
  let string_of__x_73298d8 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_73298d8 ob x;
    Buffer.contents ob
  let read__x_73298d8 = (
    Atdgen_runtime.Oj_run.read_array (
      read_expression_token
    )
  )
  let _x_73298d8_of_string s =
    read__x_73298d8 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_expression = (
    write__x_73298d8
  )
  let string_of_expression ?(len = 1024) x =
    let ob = Buffer.create len in
    write_expression ob x;
    Buffer.contents ob
  let read_expression = (
    read__x_73298d8
  )
  let expression_of_string s =
    read_expression (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_user_intent : _ -> user_intent -> _ = (
    fun ob (x : user_intent) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"expression\":";
      (
        write_expression
      )
        ob x.expression;
      Buffer.add_char ob '}';
  )
  let string_of_user_intent ?(len = 1024) x =
    let ob = Buffer.create len in
    write_user_intent ob x;
    Buffer.contents ob
  let read_user_intent = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_name = ref (None) in
      let field_expression = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_expression := (
                Some (
                  (
                    read_expression
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 10 -> (
                    if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'o' && String.unsafe_get s (pos+9) = 'n' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 2 ->
                field_expression := (
                  Some (
                    (
                      read_expression
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              expression = (match !field_expression with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "expression");
            }
           : user_intent)
        )
  )
  let user_intent_of_string s =
    read_user_intent (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_20d39e2 = (
    Atdgen_runtime.Oj_run.write_array (
      Yojson.Safe.write_string
    )
  )
  let string_of__x_20d39e2 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_20d39e2 ob x;
    Buffer.contents ob
  let read__x_20d39e2 = (
    Atdgen_runtime.Oj_run.read_array (
      Atdgen_runtime.Oj_run.read_string
    )
  )
  let _x_20d39e2_of_string s =
    read__x_20d39e2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_0a8202e = (
    Atdgen_runtime.Oj_run.write_array (
      write_user_intent
    )
  )
  let string_of__x_0a8202e ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_0a8202e ob x;
    Buffer.contents ob
  let read__x_0a8202e = (
    Atdgen_runtime.Oj_run.read_array (
      read_user_intent
    )
  )
  let _x_0a8202e_of_string s =
    read__x_0a8202e (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_user_intent_group : _ -> user_intent_group -> _ = (
    fun ob (x : user_intent_group) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"extendedModelId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.extendedModelId;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"extendedModelLabels\":";
      (
        write__x_20d39e2
      )
        ob x.extendedModelLabels;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"intents\":";
      (
        write__x_0a8202e
      )
        ob x.intents;
      Buffer.add_char ob '}';
  )
  let string_of_user_intent_group ?(len = 1024) x =
    let ob = Buffer.create len in
    write_user_intent_group ob x;
    Buffer.contents ob
  let read_user_intent_group = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_extendedModelId = ref (None) in
      let field_extendedModelLabels = ref (None) in
      let field_intents = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'M' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 'l' && String.unsafe_get s (pos+13) = 'I' && String.unsafe_get s (pos+14) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 19 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'M' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 'l' && String.unsafe_get s (pos+13) = 'L' && String.unsafe_get s (pos+14) = 'a' && String.unsafe_get s (pos+15) = 'b' && String.unsafe_get s (pos+16) = 'e' && String.unsafe_get s (pos+17) = 'l' && String.unsafe_get s (pos+18) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_extendedModelId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_extendedModelLabels := (
                Some (
                  (
                    read__x_20d39e2
                  ) p lb
                )
              );
            | 3 ->
              field_intents := (
                Some (
                  (
                    read__x_0a8202e
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 's' then (
                      3
                    )
                    else (
                      -1
                    )
                  )
                | 15 -> (
                    if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'M' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 'l' && String.unsafe_get s (pos+13) = 'I' && String.unsafe_get s (pos+14) = 'd' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 19 -> (
                    if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'x' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'M' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'd' && String.unsafe_get s (pos+11) = 'e' && String.unsafe_get s (pos+12) = 'l' && String.unsafe_get s (pos+13) = 'L' && String.unsafe_get s (pos+14) = 'a' && String.unsafe_get s (pos+15) = 'b' && String.unsafe_get s (pos+16) = 'e' && String.unsafe_get s (pos+17) = 'l' && String.unsafe_get s (pos+18) = 's' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_extendedModelId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 2 ->
                field_extendedModelLabels := (
                  Some (
                    (
                      read__x_20d39e2
                    ) p lb
                  )
                );
              | 3 ->
                field_intents := (
                  Some (
                    (
                      read__x_0a8202e
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              extendedModelId = (match !field_extendedModelId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "extendedModelId");
              extendedModelLabels = (match !field_extendedModelLabels with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "extendedModelLabels");
              intents = (match !field_intents with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "intents");
            }
           : user_intent_group)
        )
  )
  let user_intent_group_of_string s =
    read_user_intent_group (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_status_step : _ -> status_step -> _ = (
    fun ob (x : status_step) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      Buffer.add_char ob '}';
  )
  let string_of_status_step ?(len = 1024) x =
    let ob = Buffer.create len in
    write_status_step ob x;
    Buffer.contents ob
  let read_status_step = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 2 && String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 2 && String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
            }
           : status_step)
        )
  )
  let status_step_of_string s =
    read_status_step (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_status : _ -> status -> _ = (
    fun ob (x : status) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"key\":";
      (
        Yojson.Safe.write_string
      )
        ob x.key;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"value\":";
      (
        Yojson.Safe.write_string
      )
        ob x.value;
      Buffer.add_char ob '}';
  )
  let string_of_status ?(len = 1024) x =
    let ob = Buffer.create len in
    write_status ob x;
    Buffer.contents ob
  let read_status = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_key = ref (None) in
      let field_value = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 3 -> (
                  if String.unsafe_get s pos = 'k' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'y' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_key := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_value := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 3 -> (
                    if String.unsafe_get s pos = 'k' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'y' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 5 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_key := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 2 ->
                field_value := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              key = (match !field_key with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "key");
              value = (match !field_value with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "value");
            }
           : status)
        )
  )
  let status_of_string s =
    read_status (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_reaction_step : _ -> reaction_step -> _ = (
    fun ob x ->
      match x with
        | Prompt x ->
          Buffer.add_string ob "[\"Prompt\",";
          (
            write_prompt
          ) ob x;
          Buffer.add_char ob ']'
        | Status x ->
          Buffer.add_string ob "[\"Status\",";
          (
            write_status_step
          ) ob x;
          Buffer.add_char ob ']'
  )
  let string_of_reaction_step ?(len = 1024) x =
    let ob = Buffer.create len in
    write_reaction_step ob x;
    Buffer.contents ob
  let read_reaction_step = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Prompt" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_prompt
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Prompt x : reaction_step)
              | "Status" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_status_step
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Status x : reaction_step)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Prompt" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_prompt
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Prompt x : reaction_step)
              | "Status" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_status_step
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Status x : reaction_step)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let reaction_step_of_string s =
    read_reaction_step (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_output_repeat : _ -> output_repeat -> _ = (
    fun ob (x : output_repeat) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"variantId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.variantId;
      Buffer.add_char ob '}';
  )
  let string_of_output_repeat ?(len = 1024) x =
    let ob = Buffer.create len in
    write_output_repeat ob x;
    Buffer.contents ob
  let read_output_repeat = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_variantId = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'd' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_variantId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'd' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_variantId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              variantId = (match !field_variantId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variantId");
            }
           : output_repeat)
        )
  )
  let output_repeat_of_string s =
    read_output_repeat (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_output_link : _ -> output_link -> _ = (
    fun ob (x : output_link) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"requestId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.requestId;
      Buffer.add_char ob '}';
  )
  let string_of_output_link ?(len = 1024) x =
    let ob = Buffer.create len in
    write_output_link ob x;
    Buffer.contents ob
  let read_output_link = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_requestId = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 9 && String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'd' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_requestId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 9 && String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'd' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_requestId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              requestId = (match !field_requestId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "requestId");
            }
           : output_link)
        )
  )
  let output_link_of_string s =
    read_output_link (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_output : _ -> output -> _ = (
    fun ob x ->
      match x with
        | End -> Buffer.add_string ob "\"End\""
        | Repeat x ->
          Buffer.add_string ob "[\"Repeat\",";
          (
            write_output_repeat
          ) ob x;
          Buffer.add_char ob ']'
        | Link x ->
          Buffer.add_string ob "[\"Link\",";
          (
            write_output_link
          ) ob x;
          Buffer.add_char ob ']'
  )
  let string_of_output ?(len = 1024) x =
    let ob = Buffer.create len in
    write_output ob x;
    Buffer.contents ob
  let read_output = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "End" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (End : output)
              | "Repeat" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_output_repeat
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Repeat x : output)
              | "Link" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_output_link
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Link x : output)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "End" ->
                (End : output)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Repeat" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_output_repeat
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Repeat x : output)
              | "Link" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_output_link
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Link x : output)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let output_of_string s =
    read_output (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_bcfcd11 = (
    Atdgen_runtime.Oj_run.write_array (
      write_reaction_step
    )
  )
  let string_of__x_bcfcd11 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_bcfcd11 ob x;
    Buffer.contents ob
  let read__x_bcfcd11 = (
    Atdgen_runtime.Oj_run.read_array (
      read_reaction_step
    )
  )
  let _x_bcfcd11_of_string s =
    read__x_bcfcd11 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__output_nullable = (
    Atdgen_runtime.Oj_run.write_nullable (
      write_output
    )
  )
  let string_of__output_nullable ?(len = 1024) x =
    let ob = Buffer.create len in
    write__output_nullable ob x;
    Buffer.contents ob
  let read__output_nullable = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      (if Yojson.Safe.read_null_if_possible p lb then None
      else Some ((
        read_output
      ) p lb) : _ option)
  )
  let _output_nullable_of_string s =
    read__output_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_reaction_case : _ -> reaction_case -> _ = (
    fun ob (x : reaction_case) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"steps\":";
      (
        write__x_bcfcd11
      )
        ob x.steps;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"output\":";
      (
        write__output_nullable
      )
        ob x.output;
      Buffer.add_char ob '}';
  )
  let string_of_reaction_case ?(len = 1024) x =
    let ob = Buffer.create len in
    write_reaction_case ob x;
    Buffer.contents ob
  let read_reaction_case = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_steps = ref (None) in
      let field_output = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 't' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_steps := (
                Some (
                  (
                    read__x_bcfcd11
                  ) p lb
                )
              );
            | 1 ->
              field_output := (
                Some (
                  (
                    read__output_nullable
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 5 -> (
                    if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 's' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 6 -> (
                    if String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 't' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_steps := (
                  Some (
                    (
                      read__x_bcfcd11
                    ) p lb
                  )
                );
              | 1 ->
                field_output := (
                  Some (
                    (
                      read__output_nullable
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              steps = (match !field_steps with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "steps");
              output = (match !field_output with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "output");
            }
           : reaction_case)
        )
  )
  let reaction_case_of_string s =
    read_reaction_case (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_2f5fce5 = (
    Atdgen_runtime.Oj_run.write_array (
      write_reaction_case
    )
  )
  let string_of__x_2f5fce5 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_2f5fce5 ob x;
    Buffer.contents ob
  let read__x_2f5fce5 = (
    Atdgen_runtime.Oj_run.read_array (
      read_reaction_case
    )
  )
  let _x_2f5fce5_of_string s =
    read__x_2f5fce5 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__string_nullable = (
    Atdgen_runtime.Oj_run.write_nullable (
      Yojson.Safe.write_string
    )
  )
  let string_of__string_nullable ?(len = 1024) x =
    let ob = Buffer.create len in
    write__string_nullable ob x;
    Buffer.contents ob
  let read__string_nullable = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      (if Yojson.Safe.read_null_if_possible p lb then None
      else Some ((
        Atdgen_runtime.Oj_run.read_string
      ) p lb) : _ option)
  )
  let _string_nullable_of_string s =
    read__string_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_reaction : _ -> reaction -> _ = (
    fun ob (x : reaction) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"matchCounterRef\":";
      (
        write__string_nullable
      )
        ob x.matchCounterRef;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"cases\":";
      (
        write__x_2f5fce5
      )
        ob x.cases;
      Buffer.add_char ob '}';
  )
  let string_of_reaction ?(len = 1024) x =
    let ob = Buffer.create len in
    write_reaction ob x;
    Buffer.contents ob
  let read_reaction = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_matchCounterRef = ref (None) in
      let field_cases = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'C' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'R' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'f' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_matchCounterRef := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 1 ->
              field_cases := (
                Some (
                  (
                    read__x_2f5fce5
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 5 -> (
                    if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 's' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 15 -> (
                    if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'C' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'r' && String.unsafe_get s (pos+12) = 'R' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'f' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_matchCounterRef := (
                  Some (
                    (
                      read__string_nullable
                    ) p lb
                  )
                );
              | 1 ->
                field_cases := (
                  Some (
                    (
                      read__x_2f5fce5
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              matchCounterRef = (match !field_matchCounterRef with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "matchCounterRef");
              cases = (match !field_cases with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "cases");
            }
           : reaction)
        )
  )
  let reaction_of_string s =
    read_reaction (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_model_intent_key : _ -> model_intent_key -> _ = (
    fun ob (x : model_intent_key) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"groupId\":";
      (
        write__string_nullable
      )
        ob x.groupId;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      Buffer.add_char ob '}';
  )
  let string_of_model_intent_key ?(len = 1024) x =
    let ob = Buffer.create len in
    write_model_intent_key ob x;
    Buffer.contents ob
  let read_model_intent_key = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_groupId = ref (None) in
      let field_id = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_groupId := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | 1 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_groupId := (
                  Some (
                    (
                      read__string_nullable
                    ) p lb
                  )
                );
              | 1 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              groupId = (match !field_groupId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "groupId");
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
            }
           : model_intent_key)
        )
  )
  let model_intent_key_of_string s =
    read_model_intent_key (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_intent_key : _ -> intent_key -> _ = (
    fun ob x ->
      match x with
        | Model x ->
          Buffer.add_string ob "[\"Model\",";
          (
            write_model_intent_key
          ) ob x;
          Buffer.add_char ob ']'
        | User x ->
          Buffer.add_string ob "[\"User\",";
          (
            write_user_intent_key
          ) ob x;
          Buffer.add_char ob ']'
  )
  let string_of_intent_key ?(len = 1024) x =
    let ob = Buffer.create len in
    write_intent_key ob x;
    Buffer.contents ob
  let read_intent_key = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Model" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_model_intent_key
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Model x : intent_key)
              | "User" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_user_intent_key
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (User x : intent_key)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Model" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_model_intent_key
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Model x : intent_key)
              | "User" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_user_intent_key
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (User x : intent_key)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let intent_key_of_string s =
    read_intent_key (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_configuredModel : _ -> configuredModel -> _ = (
    fun ob (x : configuredModel) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"modelId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.modelId;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"parameterId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.parameterId;
      Buffer.add_char ob '}';
  )
  let string_of_configuredModel ?(len = 1024) x =
    let ob = Buffer.create len in
    write_configuredModel ob x;
    Buffer.contents ob
  let read_configuredModel = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_modelId = ref (None) in
      let field_parameterId = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'I' && String.unsafe_get s (pos+10) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_modelId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_parameterId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 7 -> (
                    if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 11 -> (
                    if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'I' && String.unsafe_get s (pos+10) = 'd' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_modelId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_parameterId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              modelId = (match !field_modelId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "modelId");
              parameterId = (match !field_parameterId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "parameterId");
            }
           : configuredModel)
        )
  )
  let configuredModel_of_string s =
    read_configuredModel (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_branch : _ -> branch -> _ = (
    fun ob (x : branch) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"intentKey\":";
      (
        write_intent_key
      )
        ob x.intentKey;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"isGuardian\":";
      (
        Yojson.Safe.write_bool
      )
        ob x.isGuardian;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"reaction\":";
      (
        write_reaction
      )
        ob x.reaction;
      Buffer.add_char ob '}';
  )
  let string_of_branch ?(len = 1024) x =
    let ob = Buffer.create len in
    write_branch ob x;
    Buffer.contents ob
  let read_branch = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_intentKey = ref (None) in
      let field_isGuardian = ref (None) in
      let field_reaction = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'K' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'y' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'G' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_intentKey := (
                Some (
                  (
                    read_intent_key
                  ) p lb
                )
              );
            | 2 ->
              field_isGuardian := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_bool
                  ) p lb
                )
              );
            | 3 ->
              field_reaction := (
                Some (
                  (
                    read_reaction
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 8 -> (
                    if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                      3
                    )
                    else (
                      -1
                    )
                  )
                | 9 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 'K' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'y' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 10 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'G' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'r' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'n' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_intentKey := (
                  Some (
                    (
                      read_intent_key
                    ) p lb
                  )
                );
              | 2 ->
                field_isGuardian := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_bool
                    ) p lb
                  )
                );
              | 3 ->
                field_reaction := (
                  Some (
                    (
                      read_reaction
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              intentKey = (match !field_intentKey with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "intentKey");
              isGuardian = (match !field_isGuardian with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "isGuardian");
              reaction = (match !field_reaction with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "reaction");
            }
           : branch)
        )
  )
  let branch_of_string s =
    read_branch (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_e8cdd2b = (
    Atdgen_runtime.Oj_run.write_array (
      write_variant
    )
  )
  let string_of__x_e8cdd2b ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_e8cdd2b ob x;
    Buffer.contents ob
  let read__x_e8cdd2b = (
    Atdgen_runtime.Oj_run.read_array (
      read_variant
    )
  )
  let _x_e8cdd2b_of_string s =
    read__x_e8cdd2b (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_c052790 = (
    Atdgen_runtime.Oj_run.write_array (
      write_branch
    )
  )
  let string_of__x_c052790 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_c052790 ob x;
    Buffer.contents ob
  let read__x_c052790 = (
    Atdgen_runtime.Oj_run.read_array (
      read_branch
    )
  )
  let _x_c052790_of_string s =
    read__x_c052790 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_5dc9d0e = (
    Atdgen_runtime.Oj_run.write_array (
      write_configuredModel
    )
  )
  let string_of__x_5dc9d0e ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_5dc9d0e ob x;
    Buffer.contents ob
  let read__x_5dc9d0e = (
    Atdgen_runtime.Oj_run.read_array (
      read_configuredModel
    )
  )
  let _x_5dc9d0e_of_string s =
    read__x_5dc9d0e (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_request : _ -> request -> _ = (
    fun ob (x : request) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"initialVariantId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.initialVariantId;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"variants\":";
      (
        write__x_e8cdd2b
      )
        ob x.variants;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"noMatch\":";
      (
        write_reaction
      )
        ob x.noMatch;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"noInput\":";
      (
        write_reaction
      )
        ob x.noInput;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"branches\":";
      (
        write__x_c052790
      )
        ob x.branches;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"configuredModels\":";
      (
        write__x_5dc9d0e
      )
        ob x.configuredModels;
      Buffer.add_char ob '}';
  )
  let string_of_request ?(len = 1024) x =
    let ob = Buffer.create len in
    write_request ob x;
    Buffer.contents ob
  let read_request = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_name = ref (None) in
      let field_initialVariantId = ref (None) in
      let field_variants = ref (None) in
      let field_noMatch = ref (None) in
      let field_noInput = ref (None) in
      let field_branches = ref (None) in
      let field_configuredModels = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'o' then (
                    match String.unsafe_get s (pos+2) with
                      | 'I' -> (
                          if String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 't' then (
                            5
                          )
                          else (
                            -1
                          )
                        )
                      | 'M' -> (
                          if String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'h' then (
                            4
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  match String.unsafe_get s pos with
                    | 'b' -> (
                        if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 's' then (
                          6
                        )
                        else (
                          -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 's' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 16 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'd' && String.unsafe_get s (pos+10) = 'M' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'd' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'l' && String.unsafe_get s (pos+15) = 's' then (
                          7
                        )
                        else (
                          -1
                        )
                      )
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'V' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'n' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'I' && String.unsafe_get s (pos+15) = 'd' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_initialVariantId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 3 ->
              field_variants := (
                Some (
                  (
                    read__x_e8cdd2b
                  ) p lb
                )
              );
            | 4 ->
              field_noMatch := (
                Some (
                  (
                    read_reaction
                  ) p lb
                )
              );
            | 5 ->
              field_noInput := (
                Some (
                  (
                    read_reaction
                  ) p lb
                )
              );
            | 6 ->
              field_branches := (
                Some (
                  (
                    read__x_c052790
                  ) p lb
                )
              );
            | 7 ->
              field_configuredModels := (
                Some (
                  (
                    read__x_5dc9d0e
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'o' then (
                      match String.unsafe_get s (pos+2) with
                        | 'I' -> (
                            if String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 't' then (
                              5
                            )
                            else (
                              -1
                            )
                          )
                        | 'M' -> (
                            if String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 'h' then (
                              4
                            )
                            else (
                              -1
                            )
                          )
                        | _ -> (
                            -1
                          )
                    )
                    else (
                      -1
                    )
                  )
                | 8 -> (
                    match String.unsafe_get s pos with
                      | 'b' -> (
                          if String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'h' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 's' then (
                            6
                          )
                          else (
                            -1
                          )
                        )
                      | 'v' -> (
                          if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 's' then (
                            3
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                | 16 -> (
                    match String.unsafe_get s pos with
                      | 'c' -> (
                          if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'f' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'g' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'd' && String.unsafe_get s (pos+10) = 'M' && String.unsafe_get s (pos+11) = 'o' && String.unsafe_get s (pos+12) = 'd' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'l' && String.unsafe_get s (pos+15) = 's' then (
                            7
                          )
                          else (
                            -1
                          )
                        )
                      | 'i' -> (
                          if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'V' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'r' && String.unsafe_get s (pos+10) = 'i' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'n' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = 'I' && String.unsafe_get s (pos+15) = 'd' then (
                            2
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 2 ->
                field_initialVariantId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 3 ->
                field_variants := (
                  Some (
                    (
                      read__x_e8cdd2b
                    ) p lb
                  )
                );
              | 4 ->
                field_noMatch := (
                  Some (
                    (
                      read_reaction
                    ) p lb
                  )
                );
              | 5 ->
                field_noInput := (
                  Some (
                    (
                      read_reaction
                    ) p lb
                  )
                );
              | 6 ->
                field_branches := (
                  Some (
                    (
                      read__x_c052790
                    ) p lb
                  )
                );
              | 7 ->
                field_configuredModels := (
                  Some (
                    (
                      read__x_5dc9d0e
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              initialVariantId = (match !field_initialVariantId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "initialVariantId");
              variants = (match !field_variants with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variants");
              noMatch = (match !field_noMatch with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "noMatch");
              noInput = (match !field_noInput with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "noInput");
              branches = (match !field_branches with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "branches");
              configuredModels = (match !field_configuredModels with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "configuredModels");
            }
           : request)
        )
  )
  let request_of_string s =
    read_request (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__prompt_nullable = (
    Atdgen_runtime.Oj_run.write_nullable (
      write_prompt
    )
  )
  let string_of__prompt_nullable ?(len = 1024) x =
    let ob = Buffer.create len in
    write__prompt_nullable ob x;
    Buffer.contents ob
  let read__prompt_nullable = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      (if Yojson.Safe.read_null_if_possible p lb then None
      else Some ((
        read_prompt
      ) p lb) : _ option)
  )
  let _prompt_nullable_of_string s =
    read__prompt_nullable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_introduction : _ -> introduction -> _ = (
    fun ob (x : introduction) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"prompt\":";
      (
        write__prompt_nullable
      )
        ob x.prompt;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"requestId\":";
      (
        write__string_nullable
      )
        ob x.requestId;
      Buffer.add_char ob '}';
  )
  let string_of_introduction ?(len = 1024) x =
    let ob = Buffer.create len in
    write_introduction ob x;
    Buffer.contents ob
  let read_introduction = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_prompt = ref (None) in
      let field_requestId = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 't' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_prompt := (
                Some (
                  (
                    read__prompt_nullable
                  ) p lb
                )
              );
            | 1 ->
              field_requestId := (
                Some (
                  (
                    read__string_nullable
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 6 -> (
                    if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'p' && String.unsafe_get s (pos+5) = 't' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 9 -> (
                    if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'I' && String.unsafe_get s (pos+8) = 'd' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_prompt := (
                  Some (
                    (
                      read__prompt_nullable
                    ) p lb
                  )
                );
              | 1 ->
                field_requestId := (
                  Some (
                    (
                      read__string_nullable
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              prompt = (match !field_prompt with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "prompt");
              requestId = (match !field_requestId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "requestId");
            }
           : introduction)
        )
  )
  let introduction_of_string s =
    read_introduction (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_19ded64 = (
    Atdgen_runtime.Oj_run.write_array (
      write_request
    )
  )
  let string_of__x_19ded64 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_19ded64 ob x;
    Buffer.contents ob
  let read__x_19ded64 = (
    Atdgen_runtime.Oj_run.read_array (
      read_request
    )
  )
  let _x_19ded64_of_string s =
    read__x_19ded64 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_plan : _ -> plan -> _ = (
    fun ob (x : plan) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"introduction\":";
      (
        write_introduction
      )
        ob x.introduction;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"requests\":";
      (
        write__x_19ded64
      )
        ob x.requests;
      Buffer.add_char ob '}';
  )
  let string_of_plan ?(len = 1024) x =
    let ob = Buffer.create len in
    write_plan ob x;
    Buffer.contents ob
  let read_plan = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_introduction = ref (None) in
      let field_requests = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 8 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_introduction := (
                Some (
                  (
                    read_introduction
                  ) p lb
                )
              );
            | 1 ->
              field_requests := (
                Some (
                  (
                    read__x_19ded64
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 8 -> (
                    if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'q' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 's' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 12 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 't' && String.unsafe_get s (pos+9) = 'i' && String.unsafe_get s (pos+10) = 'o' && String.unsafe_get s (pos+11) = 'n' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_introduction := (
                  Some (
                    (
                      read_introduction
                    ) p lb
                  )
                );
              | 1 ->
                field_requests := (
                  Some (
                    (
                      read__x_19ded64
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              introduction = (match !field_introduction with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "introduction");
              requests = (match !field_requests with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "requests");
            }
           : plan)
        )
  )
  let plan_of_string s =
    read_plan (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_model_variable : _ -> model_variable -> _ = (
    fun ob (x : model_variable) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"key\":";
      (
        Yojson.Safe.write_string
      )
        ob x.key;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"type_\":";
      (
        write_primitive_variable_type
      )
        ob x.type_;
      Buffer.add_char ob '}';
  )
  let string_of_model_variable ?(len = 1024) x =
    let ob = Buffer.create len in
    write_model_variable ob x;
    Buffer.contents ob
  let read_model_variable = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_key = ref (None) in
      let field_type_ = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'k' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'y' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_key := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_type_ := (
                Some (
                  (
                    read_primitive_variable_type
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 3 -> (
                    if String.unsafe_get s pos = 'k' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'y' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 5 -> (
                    if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = '_' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_key := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_type_ := (
                  Some (
                    (
                      read_primitive_variable_type
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              key = (match !field_key with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "key");
              type_ = (match !field_type_ with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "type_");
            }
           : model_variable)
        )
  )
  let model_variable_of_string s =
    read_model_variable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_a53e93e = (
    Atdgen_runtime.Oj_run.write_array (
      write_model_variable
    )
  )
  let string_of__x_a53e93e ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_a53e93e ob x;
    Buffer.contents ob
  let read__x_a53e93e = (
    Atdgen_runtime.Oj_run.read_array (
      read_model_variable
    )
  )
  let _x_a53e93e_of_string s =
    read__x_a53e93e (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_model_response_schema : _ -> model_response_schema -> _ = (
    fun ob (x : model_response_schema) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"modelId\":";
      (
        Yojson.Safe.write_string
      )
        ob x.modelId;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"variables\":";
      (
        write__x_a53e93e
      )
        ob x.variables;
      Buffer.add_char ob '}';
  )
  let string_of_model_response_schema ?(len = 1024) x =
    let ob = Buffer.create len in
    write_model_response_schema ob x;
    Buffer.contents ob
  let read_model_response_schema = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_modelId = ref (None) in
      let field_variables = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_modelId := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_variables := (
                Some (
                  (
                    read__x_a53e93e
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 7 -> (
                    if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'I' && String.unsafe_get s (pos+6) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 9 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 's' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_modelId := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_variables := (
                  Some (
                    (
                      read__x_a53e93e
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              modelId = (match !field_modelId with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "modelId");
              variables = (match !field_variables with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variables");
            }
           : model_response_schema)
        )
  )
  let model_response_schema_of_string s =
    read_model_response_schema (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_metadata : _ -> metadata -> _ = (
    fun ob (x : metadata) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"created_at\":";
      (
        write_date
      )
        ob x.created_at;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"created_by\":";
      (
        Yojson.Safe.write_string
      )
        ob x.created_by;
      Buffer.add_char ob '}';
  )
  let string_of_metadata ?(len = 1024) x =
    let ob = Buffer.create len in
    write_metadata ob x;
    Buffer.contents ob
  let read_metadata = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_created_at = ref (None) in
      let field_created_by = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 10 && String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' then (
              match String.unsafe_get s (pos+8) with
                | 'a' -> (
                    if String.unsafe_get s (pos+9) = 't' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 'b' -> (
                    if String.unsafe_get s (pos+9) = 'y' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_created_at := (
                Some (
                  (
                    read_date
                  ) p lb
                )
              );
            | 1 ->
              field_created_by := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 10 && String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'd' && String.unsafe_get s (pos+7) = '_' then (
                match String.unsafe_get s (pos+8) with
                  | 'a' -> (
                      if String.unsafe_get s (pos+9) = 't' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'b' -> (
                      if String.unsafe_get s (pos+9) = 'y' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_created_at := (
                  Some (
                    (
                      read_date
                    ) p lb
                  )
                );
              | 1 ->
                field_created_by := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              created_at = (match !field_created_at with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "created_at");
              created_by = (match !field_created_by with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "created_by");
            }
           : metadata)
        )
  )
  let metadata_of_string s =
    read_metadata (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_input_variable : _ -> input_variable -> _ = (
    fun ob (x : input_variable) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"variableType\":";
      (
        write_var
      )
        ob x.variableType;
      Buffer.add_char ob '}';
  )
  let string_of_input_variable ?(len = 1024) x =
    let ob = Buffer.create len in
    write_input_variable ob x;
    Buffer.contents ob
  let read_input_variable = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_name = ref (None) in
      let field_variableType = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 12 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'T' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'e' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_variableType := (
                Some (
                  (
                    read_var
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 12 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'b' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'T' && String.unsafe_get s (pos+9) = 'y' && String.unsafe_get s (pos+10) = 'p' && String.unsafe_get s (pos+11) = 'e' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 2 ->
                field_variableType := (
                  Some (
                    (
                      read_var
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              variableType = (match !field_variableType with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variableType");
            }
           : input_variable)
        )
  )
  let input_variable_of_string s =
    read_input_variable (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_gender = (
    fun ob x ->
      match x with
        | `Feminine -> Buffer.add_string ob "\"Feminine\""
        | `Masculine -> Buffer.add_string ob "\"Masculine\""
        | `Unknown -> Buffer.add_string ob "\"Unknown\""
  )
  let string_of_gender ?(len = 1024) x =
    let ob = Buffer.create len in
    write_gender ob x;
    Buffer.contents ob
  let read_gender = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Feminine" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Feminine
              | "Masculine" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Masculine
              | "Unknown" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Unknown
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Feminine" ->
                `Feminine
              | "Masculine" ->
                `Masculine
              | "Unknown" ->
                `Unknown
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let gender_of_string s =
    read_gender (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_environment : _ -> environment -> _ = (
    fun ob (x : environment) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"gender\":";
      (
        write_gender
      )
        ob x.gender;
      Buffer.add_char ob '}';
  )
  let string_of_environment ?(len = 1024) x =
    let ob = Buffer.create len in
    write_environment ob x;
    Buffer.contents ob
  let read_environment = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_gender = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 6 && String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_gender := (
                Some (
                  (
                    read_gender
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 6 && String.unsafe_get s pos = 'g' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'r' then (
                0
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_gender := (
                  Some (
                    (
                      read_gender
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              gender = (match !field_gender with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "gender");
            }
           : environment)
        )
  )
  let environment_of_string s =
    read_environment (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_e502207 = (
    Atdgen_runtime.Oj_run.write_array (
      write_input_variable
    )
  )
  let string_of__x_e502207 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_e502207 ob x;
    Buffer.contents ob
  let read__x_e502207 = (
    Atdgen_runtime.Oj_run.read_array (
      read_input_variable
    )
  )
  let _x_e502207_of_string s =
    read__x_e502207 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_input_variables : _ -> input_variables -> _ = (
    fun ob (x : input_variables) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"userDefined\":";
      (
        write__x_e502207
      )
        ob x.userDefined;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"environment\":";
      (
        write_environment
      )
        ob x.environment;
      Buffer.add_char ob '}';
  )
  let string_of_input_variables ?(len = 1024) x =
    let ob = Buffer.create len in
    write_input_variables ob x;
    Buffer.contents ob
  let read_input_variables = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_userDefined = ref (None) in
      let field_environment = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            if len = 11 then (
              match String.unsafe_get s pos with
                | 'e' -> (
                    if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 'u' -> (
                    if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'D' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_userDefined := (
                Some (
                  (
                    read__x_e502207
                  ) p lb
                )
              );
            | 1 ->
              field_environment := (
                Some (
                  (
                    read_environment
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              if len = 11 then (
                match String.unsafe_get s pos with
                  | 'e' -> (
                      if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'v' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'r' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' && String.unsafe_get s (pos+7) = 'm' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'n' && String.unsafe_get s (pos+10) = 't' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | 'u' -> (
                      if String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'D' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'f' && String.unsafe_get s (pos+7) = 'i' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'e' && String.unsafe_get s (pos+10) = 'd' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
              else (
                -1
              )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_userDefined := (
                  Some (
                    (
                      read__x_e502207
                    ) p lb
                  )
                );
              | 1 ->
                field_environment := (
                  Some (
                    (
                      read_environment
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              userDefined = (match !field_userDefined with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "userDefined");
              environment = (match !field_environment with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "environment");
            }
           : input_variables)
        )
  )
  let input_variables_of_string s =
    read_input_variables (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_add783f = (
    Atdgen_runtime.Oj_run.write_array (
      write_user_intent_group
    )
  )
  let string_of__x_add783f ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_add783f ob x;
    Buffer.contents ob
  let read__x_add783f = (
    Atdgen_runtime.Oj_run.read_array (
      read_user_intent_group
    )
  )
  let _x_add783f_of_string s =
    read__x_add783f (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_7d7e3ec = (
    Atdgen_runtime.Oj_run.write_array (
      write_status
    )
  )
  let string_of__x_7d7e3ec ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_7d7e3ec ob x;
    Buffer.contents ob
  let read__x_7d7e3ec = (
    Atdgen_runtime.Oj_run.read_array (
      read_status
    )
  )
  let _x_7d7e3ec_of_string s =
    read__x_7d7e3ec (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__x_521d90f = (
    Atdgen_runtime.Oj_run.write_array (
      write_model_response_schema
    )
  )
  let string_of__x_521d90f ?(len = 1024) x =
    let ob = Buffer.create len in
    write__x_521d90f ob x;
    Buffer.contents ob
  let read__x_521d90f = (
    Atdgen_runtime.Oj_run.read_array (
      read_model_response_schema
    )
  )
  let _x_521d90f_of_string s =
    read__x_521d90f (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_dialogData : _ -> dialogData -> _ = (
    fun ob (x : dialogData) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"inputVariables\":";
      (
        write_input_variables
      )
        ob x.inputVariables;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"statuses\":";
      (
        write__x_7d7e3ec
      )
        ob x.statuses;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"userIntents\":";
      (
        write__x_add783f
      )
        ob x.userIntents;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"modelResponseSchema\":";
      (
        write__x_521d90f
      )
        ob x.modelResponseSchema;
      Buffer.add_char ob '}';
  )
  let string_of_dialogData ?(len = 1024) x =
    let ob = Buffer.create len in
    write_dialogData ob x;
    Buffer.contents ob
  let read_dialogData = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_inputVariables = ref (None) in
      let field_statuses = ref (None) in
      let field_userIntents = ref (None) in
      let field_modelResponseSchema = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 8 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 11 -> (
                  if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'I' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 's' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 14 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'V' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'b' && String.unsafe_get s (pos+11) = 'l' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 's' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 19 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'R' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'S' && String.unsafe_get s (pos+14) = 'c' && String.unsafe_get s (pos+15) = 'h' && String.unsafe_get s (pos+16) = 'e' && String.unsafe_get s (pos+17) = 'm' && String.unsafe_get s (pos+18) = 'a' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_inputVariables := (
                Some (
                  (
                    read_input_variables
                  ) p lb
                )
              );
            | 1 ->
              field_statuses := (
                Some (
                  (
                    read__x_7d7e3ec
                  ) p lb
                )
              );
            | 2 ->
              field_userIntents := (
                Some (
                  (
                    read__x_add783f
                  ) p lb
                )
              );
            | 3 ->
              field_modelResponseSchema := (
                Some (
                  (
                    read__x_521d90f
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 8 -> (
                    if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 't' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'u' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 's' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 11 -> (
                    if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'I' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 's' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | 14 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'V' && String.unsafe_get s (pos+6) = 'a' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'i' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 'b' && String.unsafe_get s (pos+11) = 'l' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 's' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 19 -> (
                    if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'R' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 's' && String.unsafe_get s (pos+12) = 'e' && String.unsafe_get s (pos+13) = 'S' && String.unsafe_get s (pos+14) = 'c' && String.unsafe_get s (pos+15) = 'h' && String.unsafe_get s (pos+16) = 'e' && String.unsafe_get s (pos+17) = 'm' && String.unsafe_get s (pos+18) = 'a' then (
                      3
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_inputVariables := (
                  Some (
                    (
                      read_input_variables
                    ) p lb
                  )
                );
              | 1 ->
                field_statuses := (
                  Some (
                    (
                      read__x_7d7e3ec
                    ) p lb
                  )
                );
              | 2 ->
                field_userIntents := (
                  Some (
                    (
                      read__x_add783f
                    ) p lb
                  )
                );
              | 3 ->
                field_modelResponseSchema := (
                  Some (
                    (
                      read__x_521d90f
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              inputVariables = (match !field_inputVariables with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "inputVariables");
              statuses = (match !field_statuses with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "statuses");
              userIntents = (match !field_userIntents with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "userIntents");
              modelResponseSchema = (match !field_modelResponseSchema with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "modelResponseSchema");
            }
           : dialogData)
        )
  )
  let dialogData_of_string s =
    read_dialogData (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_dialog : _ -> dialog -> _ = (
    fun ob (x : dialog) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"id\":";
      (
        Yojson.Safe.write_string
      )
        ob x.id;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"plan\":";
      (
        write_plan
      )
        ob x.plan;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"data\":";
      (
        write_dialogData
      )
        ob x.data;
      Buffer.add_char ob '}';
  )
  let string_of_dialog ?(len = 1024) x =
    let ob = Buffer.create len in
    write_dialog ob x;
    Buffer.contents ob
  let read_dialog = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_id = ref (None) in
      let field_plan = ref (None) in
      let field_data = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_plan := (
                Some (
                  (
                    read_plan
                  ) p lb
                )
              );
            | 2 ->
              field_data := (
                Some (
                  (
                    read_dialogData
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 2 -> (
                    if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    match String.unsafe_get s pos with
                      | 'd' -> (
                          if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' then (
                            2
                          )
                          else (
                            -1
                          )
                        )
                      | 'p' -> (
                          if String.unsafe_get s (pos+1) = 'l' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'n' then (
                            1
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_id := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_plan := (
                  Some (
                    (
                      read_plan
                    ) p lb
                  )
                );
              | 2 ->
                field_data := (
                  Some (
                    (
                      read_dialogData
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              id = (match !field_id with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "id");
              plan = (match !field_plan with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "plan");
              data = (match !field_data with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "data");
            }
           : dialog)
        )
  )
  let dialog_of_string s =
    read_dialog (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_deploy_env = (
    fun ob x ->
      match x with
        | `Production -> Buffer.add_string ob "\"Production\""
        | `Test -> Buffer.add_string ob "\"Test\""
  )
  let string_of_deploy_env ?(len = 1024) x =
    let ob = Buffer.create len in
    write_deploy_env ob x;
    Buffer.contents ob
  let read_deploy_env = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Production" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Production
              | "Test" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                `Test
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Production" ->
                `Production
              | "Test" ->
                `Test
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let deploy_env_of_string s =
    read_deploy_env (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_dialog_file : _ -> dialog_file -> _ = (
    fun ob (x : dialog_file) ->
      Buffer.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"version\":";
      (
        Yojson.Safe.write_int
      )
        ob x.version;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"deploy_env\":";
      (
        write_deploy_env
      )
        ob x.deploy_env;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"dialog\":";
      (
        write_dialog
      )
        ob x.dialog;
      if !is_first then
        is_first := false
      else
        Buffer.add_char ob ',';
        Buffer.add_string ob "\"metadata\":";
      (
        write_metadata
      )
        ob x.metadata;
      Buffer.add_char ob '}';
  )
  let string_of_dialog_file ?(len = 1024) x =
    let ob = Buffer.create len in
    write_dialog_file ob x;
    Buffer.contents ob
  let read_dialog_file = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_version = ref (None) in
      let field_deploy_env = ref (None) in
      let field_dialog = ref (None) in
      let field_metadata = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'g' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'v' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_version := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 1 ->
              field_deploy_env := (
                Some (
                  (
                    read_deploy_env
                  ) p lb
                )
              );
            | 2 ->
              field_dialog := (
                Some (
                  (
                    read_dialog
                  ) p lb
                )
              );
            | 3 ->
              field_metadata := (
                Some (
                  (
                    read_metadata
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg (Printf.sprintf "out-of-bounds substring position or length: string = %S, requested position = %i, requested length = %i" s pos len);
              match len with
                | 6 -> (
                    if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'g' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 8 -> (
                    if String.unsafe_get s pos = 'm' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'a' then (
                      3
                    )
                    else (
                      -1
                    )
                  )
                | 10 -> (
                    if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'p' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'y' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'n' && String.unsafe_get s (pos+9) = 'v' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_version := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 1 ->
                field_deploy_env := (
                  Some (
                    (
                      read_deploy_env
                    ) p lb
                  )
                );
              | 2 ->
                field_dialog := (
                  Some (
                    (
                      read_dialog
                    ) p lb
                  )
                );
              | 3 ->
                field_metadata := (
                  Some (
                    (
                      read_metadata
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              version = (match !field_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "version");
              deploy_env = (match !field_deploy_env with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "deploy_env");
              dialog = (match !field_dialog with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "dialog");
              metadata = (match !field_metadata with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "metadata");
            }
           : dialog_file)
        )
  )
  let dialog_file_of_string s =
    read_dialog_file (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
