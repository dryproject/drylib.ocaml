(* This is free and unencumbered software released into the public domain. *)

type t = int

val of_int : int -> t

val as_int32 : t -> Int32.t

val as_int64 : t -> Int64.t

val to_string : t -> string
