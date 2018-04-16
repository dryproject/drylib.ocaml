(* This is free and unencumbered software released into the public domain. *)

type t =
  | Scalar of Scalar.t
  | Vector of Vector.t
  | Matrix of Matrix.t

let of_float f = Scalar (Scalar.of_float f)

let of_int n = Scalar (Scalar.of_int n)

let to_string = function
  | Scalar x -> Scalar.to_string x
  | Vector x -> Vector.to_string x
  | Matrix x -> Matrix.to_string x
