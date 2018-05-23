(* This is free and unencumbered software released into the public domain. *)

type t

val of_float : float -> t
val of_int : int -> t

val to_float : t -> float
val to_int : t -> int
val to_string : t -> string
