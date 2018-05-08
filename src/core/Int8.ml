(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = int

let of_char c  = Stdlib.Char.code c
let of_int z   = z (* FIXME *)

let as_int32   = Stdlib.Int32.of_int
let as_int64   = Stdlib.Int64.of_int
let as_int128  = Int128.of_int

let to_int8  z = z
let to_int16 z = z
let to_int32   = as_int32
let to_int64   = as_int64
let to_int128  = as_int128

let to_string  = Stdlib.string_of_int
