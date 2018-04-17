(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = int

let of_int z = z (* FIXME *)

let as_int64 = Int64.of_int

let to_string = Stdlib.string_of_int
