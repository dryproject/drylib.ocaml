(* This is free and unencumbered software released into the public domain. *)

type t =
  | Int8 of Int8.t
  | Int16 of Int16.t
  | Int32 of Int32.t
  | Int64 of Int64.t
  | Int128 of Int128.t

val of_char   : char -> t
val of_int    : int -> t
val of_int32  : Int32.t -> t
val of_int64  : Int64.t -> t

val as_int32  : t -> Int32.t
val as_int64  : t -> Int64.t
val as_int128 : t -> Int128.t

val to_int8   : t -> Int8.t
val to_int16  : t -> Int16.t
val to_int32  : t -> Int32.t
val to_int64  : t -> Int64.t
val to_int128 : t -> Int128.t

val to_string : t -> string
