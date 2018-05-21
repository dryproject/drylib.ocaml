(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = float

let of_float r = r
let of_int = Stdlib.float_of_int

let to_string = Stdlib.string_of_float
