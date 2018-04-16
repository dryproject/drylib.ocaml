(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = int64

let of_int = Stdlib.Int64.of_int

let to_string = Stdlib.Int64.to_string
