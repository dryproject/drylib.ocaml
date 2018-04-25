(* This is free and unencumbered software released into the public domain. *)

type t =
  | Complex of Complex.t
  | Float of Float.t
  | Int of Int.t
  | Integer of Integer.t
  | Natural of Natural.t
  | Rational of Rational.t
  | Real of Real.t

val of_float : float -> t

val of_int : int -> t

val of_int32 : int32 -> t

val of_int64 : int64 -> t

val to_string : t -> string
