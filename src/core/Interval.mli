(* This is free and unencumbered software released into the public domain. *)

type t =
  | Char of Char.t * Char.t
  | Number of Number.t * Number.t
  | Word of Word.t * Word.t

val to_string : t -> string
