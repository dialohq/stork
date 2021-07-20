  $ dune exec -- stork gen *.atd
  > cat nominal_variant_1_t.ml
  > echo ---
  > cat nominal_variant_1_t.mli
  > echo ---
  > cat nominal_variant_1_j.ml
  > echo ---
  > cat nominal_variant_1_j.mli
  > echo ---
  > cat nominal_variant_2_t.ml
  > echo ---
  > cat nominal_variant_2_t.mli
  > echo ---
  > cat nominal_variant_2_j.ml
  > echo ---
  > cat nominal_variant_2_j.mli
  > echo ---
  > cat nominal_variant_upgrader_t.ml
  > echo ---
  > cat nominal_variant_upgrader_t.mli
  > echo ---
  > cat nominal_variant.ml
  > echo ---
  > cat nominal_variant.mli
  (* Auto-generated from "nominal_variant_1.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type variant =  Field 
  
  type json = { variant: variant; field1: string; version: int }
  ---
  (* Auto-generated from "nominal_variant_1.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type variant =  Field 
  
  type json = { variant: variant; field1: string; version: int }
  ---
  (* Auto-generated from "nominal_variant_1.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type variant = Nominal_variant_1_t.variant =  Field 
  
  type json = Nominal_variant_1_t.json = {
    variant: variant;
    field1: string;
    version: int
  }
  
  let write_variant : _ -> variant -> _ = (
    fun ob x ->
      match x with
        | Field -> Bi_outbuf.add_string ob "\"Field\""
  )
  let string_of_variant ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_variant ob x;
    Bi_outbuf.contents ob
  let read_variant = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Field" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Field : variant)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Field" ->
                (Field : variant)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let variant_of_string s =
    read_variant (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_json : _ -> json -> _ = (
    fun ob (x : json) ->
      Bi_outbuf.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"variant\":";
      (
        write_variant
      )
        ob x.variant;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"field1\":";
      (
        Yojson.Safe.write_string
      )
        ob x.field1;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"version\":";
      (
        Yojson.Safe.write_int
      )
        ob x.version;
      Bi_outbuf.add_char ob '}';
  )
  let string_of_json ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_json ob x;
    Bi_outbuf.contents ob
  let read_json = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_variant = ref (None) in
      let field_field1 = ref (None) in
      let field_version = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '1' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' then (
                    match String.unsafe_get s (pos+1) with
                      | 'a' -> (
                          if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | 'e' -> (
                          if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
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
              field_variant := (
                Some (
                  (
                    read_variant
                  ) p lb
                )
              );
            | 1 ->
              field_field1 := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_version := (
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
                invalid_arg "out-of-bounds substring position or length";
              match len with
                | 6 -> (
                    if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '1' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'v' then (
                      match String.unsafe_get s (pos+1) with
                        | 'a' -> (
                            if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' then (
                              0
                            )
                            else (
                              -1
                            )
                          )
                        | 'e' -> (
                            if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
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
                field_variant := (
                  Some (
                    (
                      read_variant
                    ) p lb
                  )
                );
              | 1 ->
                field_field1 := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 2 ->
                field_version := (
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
              variant = (match !field_variant with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variant");
              field1 = (match !field_field1 with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "field1");
              version = (match !field_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "version");
            }
           : json)
        )
  )
  let json_of_string s =
    read_json (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  ---
  (* Auto-generated from "nominal_variant_1.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type variant = Nominal_variant_1_t.variant =  Field 
  
  type json = Nominal_variant_1_t.json = {
    variant: variant;
    field1: string;
    version: int
  }
  
  val write_variant :
    Bi_outbuf.t -> variant -> unit
    (** Output a JSON value of type {!variant}. *)
  
  val string_of_variant :
    ?len:int -> variant -> string
    (** Serialize a value of type {!variant}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_variant :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> variant
    (** Input JSON data of type {!variant}. *)
  
  val variant_of_string :
    string -> variant
    (** Deserialize JSON data of type {!variant}. *)
  
  val write_json :
    Bi_outbuf.t -> json -> unit
    (** Output a JSON value of type {!json}. *)
  
  val string_of_json :
    ?len:int -> json -> string
    (** Serialize a value of type {!json}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_json :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> json
    (** Input JSON data of type {!json}. *)
  
  val json_of_string :
    string -> json
    (** Deserialize JSON data of type {!json}. *)
  
  ---
  (* Auto-generated from "nominal_variant_2.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type variant =  Field 
  
  type json = { variant: variant; field2: string; version: int }
  ---
  (* Auto-generated from "nominal_variant_2.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type variant =  Field 
  
  type json = { variant: variant; field2: string; version: int }
  ---
  (* Auto-generated from "nominal_variant_2.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type variant = Nominal_variant_2_t.variant =  Field 
  
  type json = Nominal_variant_2_t.json = {
    variant: variant;
    field2: string;
    version: int
  }
  
  let write_variant : _ -> variant -> _ = (
    fun ob x ->
      match x with
        | Field -> Bi_outbuf.add_string ob "\"Field\""
  )
  let string_of_variant ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_variant ob x;
    Bi_outbuf.contents ob
  let read_variant = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Field" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Field : variant)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Field" ->
                (Field : variant)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let variant_of_string s =
    read_variant (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_json : _ -> json -> _ = (
    fun ob (x : json) ->
      Bi_outbuf.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"variant\":";
      (
        write_variant
      )
        ob x.variant;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"field2\":";
      (
        Yojson.Safe.write_string
      )
        ob x.field2;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"version\":";
      (
        Yojson.Safe.write_int
      )
        ob x.version;
      Bi_outbuf.add_char ob '}';
  )
  let string_of_json ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_json ob x;
    Bi_outbuf.contents ob
  let read_json = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_variant = ref (None) in
      let field_field2 = ref (None) in
      let field_version = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 6 -> (
                  if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '2' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' then (
                    match String.unsafe_get s (pos+1) with
                      | 'a' -> (
                          if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' then (
                            0
                          )
                          else (
                            -1
                          )
                        )
                      | 'e' -> (
                          if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
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
              field_variant := (
                Some (
                  (
                    read_variant
                  ) p lb
                )
              );
            | 1 ->
              field_field2 := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 2 ->
              field_version := (
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
                invalid_arg "out-of-bounds substring position or length";
              match len with
                | 6 -> (
                    if String.unsafe_get s pos = 'f' && String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 'e' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = '2' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'v' then (
                      match String.unsafe_get s (pos+1) with
                        | 'a' -> (
                            if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' then (
                              0
                            )
                            else (
                              -1
                            )
                          )
                        | 'e' -> (
                            if String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
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
                field_variant := (
                  Some (
                    (
                      read_variant
                    ) p lb
                  )
                );
              | 1 ->
                field_field2 := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 2 ->
                field_version := (
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
              variant = (match !field_variant with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "variant");
              field2 = (match !field_field2 with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "field2");
              version = (match !field_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "version");
            }
           : json)
        )
  )
  let json_of_string s =
    read_json (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  ---
  (* Auto-generated from "nominal_variant_2.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type variant = Nominal_variant_2_t.variant =  Field 
  
  type json = Nominal_variant_2_t.json = {
    variant: variant;
    field2: string;
    version: int
  }
  
  val write_variant :
    Bi_outbuf.t -> variant -> unit
    (** Output a JSON value of type {!variant}. *)
  
  val string_of_variant :
    ?len:int -> variant -> string
    (** Serialize a value of type {!variant}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_variant :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> variant
    (** Input JSON data of type {!variant}. *)
  
  val variant_of_string :
    string -> variant
    (** Deserialize JSON data of type {!variant}. *)
  
  val write_json :
    Bi_outbuf.t -> json -> unit
    (** Output a JSON value of type {!json}. *)
  
  val string_of_json :
    ?len:int -> json -> string
    (** Serialize a value of type {!json}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_json :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> json
    (** Input JSON data of type {!json}. *)
  
  val json_of_string :
    string -> json
    (** Deserialize JSON data of type {!json}. *)
  
  ---
  module From_1_to_2 = struct
  module OldVersion = Nominal_variant_1_t
  module NewVersion = Nominal_variant_2_t
  type converter = { convert_json: converter -> OldVersion.json -> NewVersion.json;
  convert_variant: converter -> OldVersion.json -> OldVersion.variant -> NewVersion.variant }
  end
  ---
  module From_1_to_2 : sig
  module OldVersion : (module type of Nominal_variant_1_t)
  module NewVersion : (module type of Nominal_variant_2_t)
  type converter = { convert_json: converter -> OldVersion.json -> NewVersion.json;
  convert_variant: converter -> OldVersion.json -> OldVersion.variant -> NewVersion.variant }
  end
  ---
  [@@@ocaml.warning "-32-33-44"]
  open StdLabels
  module Types = Nominal_variant_2_t
  module Json = Nominal_variant_2_j
  module From_1_to_2 = struct
  
  include Nominal_variant_user_fns.From_1_to_2
  
  let convert_variant: converter -> OldVersion.json -> OldVersion.variant -> NewVersion.variant = fun _ _  x -> Obj.magic x
  let converter = Nominal_variant_upgrader_t.From_1_to_2.{ convert_json;
  convert_variant }
  let convert = convert_json converter
  end
  let convert_from_1_to_latest = From_1_to_2.convert
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
  let string_of_json ?len x = Json.string_of_json ?len { x with Types.version = 2 }
  
  let json_of_string s = match (get_version s) with
    | `Int 2 -> Json.json_of_string s
    | `Int 1 -> convert_from_1_to_latest (Nominal_variant_1_j.json_of_string s)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  
  let read_json_from_file fname = match (get_version_from_file fname) with
    | `Int 2 -> Atdgen_runtime.Util.Json.from_file Json.read_json fname
    | `Int 1 -> convert_from_1_to_latest (Atdgen_runtime.Util.Json.from_file Nominal_variant_1_j.read_json fname)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let write_json buf x = Json.write_json buf { x with Types.version = 2 }
  ---
  module Types: module type of Nominal_variant_2_t
  module Json: module type of Nominal_variant_2_j
  val json_of_string: string -> Types.json
  val string_of_json: ?len:int -> Types.json -> string
  val read_json_from_file: string -> Types.json
  val write_json: Bi_outbuf.t -> Types.json -> unit
  module From_1_to_2 : sig
  module OldVersion : (module type of Nominal_variant_1_t)
  module NewVersion : (module type of Nominal_variant_2_t)
  type converter = Nominal_variant_upgrader_t.From_1_to_2.converter
  val converter: converter
  val convert: OldVersion.json -> NewVersion.json
  end
