(* This is free and unencumbered software released into the public domain. *)

type t =
  | Word8 of Word8.t
  | Word16 of Word16.t
  | Word32 of Word32.t
  | Word64 of Word64.t

let to_string = function
  | Word8 w   -> Word8.to_string w
  | Word16 w  -> Word16.to_string w
  | Word32 w  -> Word32.to_string w
  | Word64 w  -> Word64.to_string w
