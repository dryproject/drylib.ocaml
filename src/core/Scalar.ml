(* This is free and unencumbered software released into the public domain. *)

type t =
  | Bool of Bool.t
  | Char of Char.t
  | Number of Number.t

let of_float f = Number (Number.of_float f)

let of_int n = Number (Number.of_int n)

let to_string = function
  | Bool b   -> Bool.to_string b
  | Char c   -> Char.to_string c
  | Number n -> Number.to_string n
