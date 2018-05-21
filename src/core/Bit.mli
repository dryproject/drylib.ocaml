(* This is free and unencumbered software released into the public domain. *)

type t = Zero | One

val of_bool : bool -> t
val of_int : int -> t

val to_bool : t -> bool
val to_int : t -> int
val to_string : t -> string
