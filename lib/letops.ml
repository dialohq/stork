module Result = struct
  let ( let+ ) o f = match o with Error e -> Error e | Ok x -> Ok (f x)

  let ( let* ) o f = match o with Error e -> Error e | Ok x -> f x
end
