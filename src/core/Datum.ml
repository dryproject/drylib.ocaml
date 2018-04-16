(* This is free and unencumbered software released into the public domain. *)

type t =
  | Interval of Interval.t
  | Quantity of Quantity.t
  | Symbol of Symbol.t
  | Tensor of Tensor.t
  | Unit of Unit.t

let of_float f = Tensor (Tensor.of_float f)

let of_int n = Tensor (Tensor.of_int n)

let to_string = function
  | Interval x -> Interval.to_string x
  | Quantity x -> Quantity.to_string x
  | Symbol s   -> Symbol.to_string s
  | Tensor x   -> Tensor.to_string x
  | Unit x     -> Unit.to_string x
