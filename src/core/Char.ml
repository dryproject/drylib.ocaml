(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib
module Uchar = Stdlib.Uchar

type t = Uchar.t

let of_char = Uchar.of_char

let of_int = Uchar.of_int

let to_char = Uchar.to_char

let to_string c = "?" (* TODO *)
