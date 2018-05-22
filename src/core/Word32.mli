(* This is free and unencumbered software released into the public domain. *)

type t

val of_int : int -> t
val of_int32 : int32 -> t
val of_int64 : int64 -> t

val to_string : t -> string
