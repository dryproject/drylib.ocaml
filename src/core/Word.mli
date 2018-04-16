(* This is free and unencumbered software released into the public domain. *)

type t =
  | Word8 of Word8.t
  | Word16 of Word16.t
  | Word32 of Word32.t
  | Word64 of Word64.t

val to_string : t -> string
