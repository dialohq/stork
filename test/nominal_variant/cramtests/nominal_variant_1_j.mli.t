  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat nominal_variant_1_j.mli | ocamlformat --intf -
  (* Auto-generated from "nominal_variant_1.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type variant = Nominal_variant_1_t.variant = Field
  
  type json = Nominal_variant_1_t.json =
    { variant : variant
    ; field1 : string
    ; version : int
    }
  
  val write_variant : Bi_outbuf.t -> variant -> unit
  (** Output a JSON value of type {!variant}. *)
  
  val string_of_variant : ?len:int -> variant -> string
  (** Serialize a value of type {!variant} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_variant : Yojson.Safe.lexer_state -> Lexing.lexbuf -> variant
  (** Input JSON data of type {!variant}. *)
  
  val variant_of_string : string -> variant
  (** Deserialize JSON data of type {!variant}. *)
  
  val write_json : Bi_outbuf.t -> json -> unit
  (** Output a JSON value of type {!json}. *)
  
  val string_of_json : ?len:int -> json -> string
  (** Serialize a value of type {!json} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_json : Yojson.Safe.lexer_state -> Lexing.lexbuf -> json
  (** Input JSON data of type {!json}. *)
  
  val json_of_string : string -> json
  (** Deserialize JSON data of type {!json}. *)
