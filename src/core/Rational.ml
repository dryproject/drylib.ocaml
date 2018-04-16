(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib
module Printf = Stdlib.Printf

type t = { numerator: Integer.t; denominator: Integer.t }

let of_int n = { numerator = Integer.of_int n; denominator = Integer.one }

let to_string { numerator; denominator } =
  Printf.sprintf "%s/%s" (Integer.to_string numerator) (Integer.to_string denominator)
