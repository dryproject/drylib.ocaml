(* This is free and unencumbered software released into the public domain. *)

type t = int64

val of_char   : char -> t
val of_int    : int -> t
val of_int32  : int32 (*Int32.t*) -> t

val as_int32  : t -> int32 (*Int32.t*)
val as_int64  : t -> t (*Int64.t*)
val as_int128 : t -> Int128.t

val to_int8   : t -> int (*Int8.t*)
val to_int16  : t -> int (*Int16.t*)
val to_int32  : t -> int32 (*Int32.t*)
val to_int64  : t -> t (*Int64.t*)
val to_int128 : t -> Int128.t

val to_string : t -> string
