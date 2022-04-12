type t =
  | Int of int
  | String of string

module Kind : sig
  type t =
    | Int
    | String
end

val to_literal_string : t -> string
val to_unwrapped_literal_string : t -> string
val to_string : t -> string
