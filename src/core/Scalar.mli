(* This is free and unencumbered software released into the public domain. *)

type t =
  | Bool of Bool.t
  | Char of Char.t
  | Number of Number.t
  | Word of Word.t

val of_bool : bool -> t

val of_char : char -> t

val of_float : float -> t

val of_int : int -> t

val to_string : t -> string
