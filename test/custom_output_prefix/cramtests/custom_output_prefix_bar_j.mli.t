  $ cd ..
  $ dune exec -- stork gen -o custom_output_prefix original_output_prefix_1.atd original_output_prefix_bar.atd
  $ cat custom_output_prefix_bar_j.mli | ocamlformat --intf -
  (* Auto-generated from "original_output_prefix_bar.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = 'b Custom_output_prefix_bar_t.tuple_2
  
  type skill = Custom_output_prefix_bar_t.skill =
    { domain : string
    ; name : string
    }
  
  type company = Custom_output_prefix_bar_t.company =
    { name : string
    ; turnover : int option
    }
  
  type employer = Custom_output_prefix_bar_t.employer =
    | Self
    | Company of company
  
  type employment = Custom_output_prefix_bar_t.employment
  
  type employee = Custom_output_prefix_bar_t.employee =
    { name : string
    ; age : int
    ; position : employment
    ; version : string
    ; skills : skill Atdgen_runtime.Util.ocaml_array
    }
  
  val write_tuple_2
    :  (Bi_outbuf.t -> 'b -> unit)
    -> Bi_outbuf.t
    -> 'b tuple_2
    -> unit
  (** Output a JSON value of type {!tuple_2}. *)
  
  val string_of_tuple_2
    :  (Bi_outbuf.t -> 'b -> unit)
    -> ?len:int
    -> 'b tuple_2
    -> string
  (** Serialize a value of type {!tuple_2} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_tuple_2
    :  (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b)
    -> Yojson.Safe.lexer_state
    -> Lexing.lexbuf
    -> 'b tuple_2
  (** Input JSON data of type {!tuple_2}. *)
  
  val tuple_2_of_string
    :  (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b)
    -> string
    -> 'b tuple_2
  (** Deserialize JSON data of type {!tuple_2}. *)
  
  val write_skill : Bi_outbuf.t -> skill -> unit
  (** Output a JSON value of type {!skill}. *)
  
  val string_of_skill : ?len:int -> skill -> string
  (** Serialize a value of type {!skill} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_skill : Yojson.Safe.lexer_state -> Lexing.lexbuf -> skill
  (** Input JSON data of type {!skill}. *)
  
  val skill_of_string : string -> skill
  (** Deserialize JSON data of type {!skill}. *)
  
  val write_company : Bi_outbuf.t -> company -> unit
  (** Output a JSON value of type {!company}. *)
  
  val string_of_company : ?len:int -> company -> string
  (** Serialize a value of type {!company} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_company : Yojson.Safe.lexer_state -> Lexing.lexbuf -> company
  (** Input JSON data of type {!company}. *)
  
  val company_of_string : string -> company
  (** Deserialize JSON data of type {!company}. *)
  
  val write_employer : Bi_outbuf.t -> employer -> unit
  (** Output a JSON value of type {!employer}. *)
  
  val string_of_employer : ?len:int -> employer -> string
  (** Serialize a value of type {!employer} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_employer : Yojson.Safe.lexer_state -> Lexing.lexbuf -> employer
  (** Input JSON data of type {!employer}. *)
  
  val employer_of_string : string -> employer
  (** Deserialize JSON data of type {!employer}. *)
  
  val write_employment : Bi_outbuf.t -> employment -> unit
  (** Output a JSON value of type {!employment}. *)
  
  val string_of_employment : ?len:int -> employment -> string
  (** Serialize a value of type {!employment} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_employment : Yojson.Safe.lexer_state -> Lexing.lexbuf -> employment
  (** Input JSON data of type {!employment}. *)
  
  val employment_of_string : string -> employment
  (** Deserialize JSON data of type {!employment}. *)
  
  val write_employee : Bi_outbuf.t -> employee -> unit
  (** Output a JSON value of type {!employee}. *)
  
  val string_of_employee : ?len:int -> employee -> string
  (** Serialize a value of type {!employee} into a JSON string.
  
      @param len specifies the initial length of the buffer used internally.
      Default: 1024. *)
  
  val read_employee : Yojson.Safe.lexer_state -> Lexing.lexbuf -> employee
  (** Input JSON data of type {!employee}. *)
  
  val employee_of_string : string -> employee
  (** Deserialize JSON data of type {!employee}. *)
