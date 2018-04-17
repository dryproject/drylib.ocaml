(* This is free and unencumbered software released into the public domain. *)

type t =
  | Scalar of Scalar.t
  | Vector of Vector.t
  | Matrix of Matrix.t

let of_bool b = Scalar (Scalar.of_bool b)

let of_char c = Scalar (Scalar.of_char c)

let of_float r = Scalar (Scalar.of_float r)

let of_int z = Scalar (Scalar.of_int z)

let to_string = function
  | Scalar x -> Scalar.to_string x
  | Vector x -> Vector.to_string x
  | Matrix x -> Matrix.to_string x
