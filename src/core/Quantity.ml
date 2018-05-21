(* This is free and unencumbered software released into the public domain. *)

type t = Tensor.t * Unit.t

let to_string (value, unit) =
  (Tensor.to_string value) ^ (Unit.to_string unit)
