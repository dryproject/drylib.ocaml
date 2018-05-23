(* This is free and unencumbered software released into the public domain. *)

type t =
  | Word8 of Word8.t
  | Word16 of Word16.t
  | Word32 of Word32.t
  | Word64 of Word64.t

val as_int64  : t -> int64 (*Int64.t*)

val to_int64  : t -> int64 (*Int64.t*)
val to_string : t -> string

val parse_bin : string -> (t, [`Msg of string]) result
val parse_oct : string -> (t, [`Msg of string]) result
val parse_hex : string -> (t, [`Msg of string]) result
