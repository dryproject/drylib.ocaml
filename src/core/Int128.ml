(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = { value: int64 } (* TODO *)

let of_int z   = { value = Stdlib.Int64.of_int z }
let of_int32 z = { value = Stdlib.Int64.of_int32 z }
let of_int64 z = { value = z }
let of_char c  = Stdlib.int_of_char c |> of_int

let as_int32 { value }  = Stdlib.Int64.to_int32 value
let as_int64 { value }  = value
let as_int128 z         = z

let to_int8 { value }   = Stdlib.Int64.to_int value
let to_int16 { value }  = Stdlib.Int64.to_int value
let to_int32            = as_int32
let to_int64 { value }  = value
let to_int128 z         = z

let to_string { value } = Stdlib.Int64.to_string value
