(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = float

let of_float f = f

let to_string = Stdlib.string_of_float
