(* This is free and unencumbered software released into the public domain. *)

type t =
  | Interval of Interval.t
  | Quantity of Quantity.t
  | Symbol of Symbol.t
  | Tensor of Tensor.t
  | Unit of Unit.t

val of_bool : bool -> t

val of_char : char -> t

val of_float : float -> t

val of_int : int -> t

val to_string : t -> string
