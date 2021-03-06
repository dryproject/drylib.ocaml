(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib
module Printf = Stdlib.Printf

type t = int64

let of_int     = Stdlib.Int64.of_int
let of_int32   = Stdlib.Int64.of_int32
let of_int64 z = z

let as_int64 z = z
let to_int64 = as_int64

let to_string w = Printf.sprintf "0x%02LX" w
