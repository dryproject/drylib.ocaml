(* This is free and unencumbered software released into the public domain. *)

type t = DRY__Stdlib.Uchar.t

val of_char : char -> t

val of_int : int -> t

val as_int32 : t -> Int32.t

val as_int64 : t -> Int64.t

val to_char : t -> char

val to_int : t -> int

val to_string : t -> string
