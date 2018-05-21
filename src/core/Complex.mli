(* This is free and unencumbered software released into the public domain. *)

type t

val of_ints : int -> int -> t

val to_string : t -> string

val parse : string -> (t, [`Msg of string]) result
