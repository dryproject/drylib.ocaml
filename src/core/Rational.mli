(* This is free and unencumbered software released into the public domain. *)

type t = { numerator: Integer.t; denominator: Integer.t }

val of_int : int -> t
val of_ints : int -> int -> t

val to_string : t -> string

val parse : string -> (t, [`Msg of string]) result
