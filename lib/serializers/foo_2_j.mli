(* Auto-generated from "foo_2.atd" *)
[@@@ocaml.warning "-27-32-35-39"]

type company = Foo_2_t.company = { name: string; turnover: int option }

type employee = Foo_2_t.employee = {
  name: string;
  age: int;
  company: company;
  version: int
}

val write_company :
  Bi_outbuf.t -> company -> unit
  (** Output a JSON value of type {!company}. *)

val string_of_company :
  ?len:int -> company -> string
  (** Serialize a value of type {!company}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_company :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> company
  (** Input JSON data of type {!company}. *)

val company_of_string :
  string -> company
  (** Deserialize JSON data of type {!company}. *)

val write_employee :
  Bi_outbuf.t -> employee -> unit
  (** Output a JSON value of type {!employee}. *)

val string_of_employee :
  ?len:int -> employee -> string
  (** Serialize a value of type {!employee}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_employee :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> employee
  (** Input JSON data of type {!employee}. *)

val employee_of_string :
  string -> employee
  (** Deserialize JSON data of type {!employee}. *)

