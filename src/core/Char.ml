(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib
module Uchar = Stdlib.Uchar

type t = Uchar.t

let of_char = Uchar.of_char

let of_int = Uchar.of_int

let as_int32 c = Uchar.to_int c |> Int32.of_int

let as_int64 c = Uchar.to_int c |> Int64.of_int

let to_char = Uchar.to_char

let to_int = Uchar.to_int

let to_string c = String.make 1 (to_char c) (* FIXME *)
