(* This is free and unencumbered software released into the public domain. *)

type t =
  | Interval of Interval.t
  | Quantity of Quantity.t
  | Symbol of Symbol.t
  | Tensor of Tensor.t
  | Unit of Unit.t

let of_bool b = Tensor (Tensor.of_bool b)

let of_char c = Tensor (Tensor.of_char c)

let of_float r = Tensor (Tensor.of_float r)

let of_int z = Tensor (Tensor.of_int z)

let to_string = function
  | Interval x -> Interval.to_string x
  | Quantity x -> Quantity.to_string x
  | Symbol s   -> Symbol.to_string s
  | Tensor x   -> Tensor.to_string x
  | Unit x     -> Unit.to_string x
