(* This is free and unencumbered software released into the public domain. *)

type t =
  | Scalar of Scalar.t
  | Vector of Vector.t
  | Matrix of Matrix.t

val of_float : float -> t

val of_int : int -> t

val to_string : t -> string
