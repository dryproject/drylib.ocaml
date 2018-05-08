(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = int64

let of_int     = Stdlib.Int64.of_int
let of_int32   = Stdlib.Int64.of_int32
let of_char c  = Stdlib.int_of_char c |> of_int

let as_int32   = Stdlib.Int64.to_int32
let as_int64 z = z
let as_int128  = Int128.of_int64

let to_int8    = Stdlib.Int64.to_int (* FIXME *)
let to_int16   = Stdlib.Int64.to_int (* FIXME *)
let to_int32   = as_int32
let to_int64   = as_int64
let to_int128  = as_int128

let to_string  = Stdlib.Int64.to_string
