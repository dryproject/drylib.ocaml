(* This is free and unencumbered software released into the public domain. *)

type t = DRY__Stdlib.Uchar.t

val of_char : char -> t

val of_int : int -> t

val to_char : t -> char

val to_string : t -> string
