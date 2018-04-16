(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = int

let of_int n = n (* FIXME *)

let to_string = Stdlib.string_of_int
