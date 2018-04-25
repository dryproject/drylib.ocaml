(* This is free and unencumbered software released into the public domain. *)

type t =
  | Complex of Complex.t
  | Float of Float.t
  | Int of Int.t
  | Integer of Integer.t
  | Natural of Natural.t
  | Rational of Rational.t
  | Real of Real.t

let of_float f = Float (Float.of_float f)

let of_int n = Int (Int.of_int n)

let of_int32 n = Int (Int.Int32 n)

let of_int64 n = Int (Int.Int64 n)

let to_string = function
  | Complex c  -> Complex.to_string c
  | Float r    -> Float.to_string r
  | Int z      -> Int.to_string z
  | Integer z  -> Integer.to_string z
  | Natural n  -> Natural.to_string n
  | Rational q -> Rational.to_string q
  | Real r     -> Real.to_string r
