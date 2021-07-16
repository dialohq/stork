type t =
  | Int of int
  | String of string

module Kind = struct
  type t =
    | Int
    | String
end

let to_literal_string = function
  | Int v ->
    [%string {|`Int %i$v|}]
  | String s ->
    [%string {|`String "$s"|}]

let to_unwrapped_literal_string = function
  | Int v ->
    [%string {|%i$v|}]
  | String s ->
    [%string {|"$s"|}]

let to_string = function Int v -> string_of_int v | String s -> s
