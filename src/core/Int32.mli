(* This is free and unencumbered software released into the public domain. *)

type t = int32

val of_char   : char -> t
val of_int    : int -> t

val as_int32  : t -> t (*Int32.t*)
val as_int64  : t -> int64 (*Int64.t*)
val as_int128 : t -> Int128.t

val to_int8   : t -> int (*Int8.t*)
val to_int16  : t -> int (*Int16.t*)
val to_int32  : t -> t (*Int32.t*)
val to_int64  : t -> int64 (*Int64.t*)
val to_int128 : t -> Int128.t

val to_string : t -> string
