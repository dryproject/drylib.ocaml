(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = int32

let of_int = Stdlib.Int32.of_int

let as_int64 = Stdlib.Int64.of_int32

let to_string = Stdlib.Int32.to_string