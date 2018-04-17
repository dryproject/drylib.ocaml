(* This is free and unencumbered software released into the public domain. *)

type t =
  | Bool of Bool.t
  | Char of Char.t
  | Number of Number.t
  | Word of Word.t

let of_bool b = Bool (Bool.of_bool b)

let of_char c = Char (Char.of_char c)

let of_float r = Number (Number.of_float r)

let of_int z = Number (Number.of_int z)

let to_string = function
  | Bool b   -> Bool.to_string b
  | Char c   -> Char.to_string c
  | Number n -> Number.to_string n
  | Word w   -> Word.to_string w
