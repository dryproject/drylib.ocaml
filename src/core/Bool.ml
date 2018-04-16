(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

type t = bool

let of_bool b = b

let to_string = Stdlib.string_of_bool
