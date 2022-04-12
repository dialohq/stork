module Result : sig
  val ( let+ ) : ('a, 'b) result -> ('a -> 'c) -> ('c, 'b) result
  val ( let* ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
end
