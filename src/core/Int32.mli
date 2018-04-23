(* This is free and unencumbered software released into the public domain. *)

type t = int32

val of_int : int -> t

val of_char : char -> t

val as_int64 : t -> Int64.t

val to_string : t -> string
