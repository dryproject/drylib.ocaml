(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib
module Printf = Stdlib.Printf
module Scan   = Stdlib.Scanf

type t = { numerator: Integer.t; denominator: Integer.t }

let of_int n = { numerator = Integer.of_int n; denominator = Integer.one }
let of_ints n d = { numerator = Integer.of_int n; denominator = Integer.of_int d }

let to_string { numerator; denominator } =
  Printf.sprintf "%s/%s" (Integer.to_string numerator) (Integer.to_string denominator)

let parse input =
  try (Ok (Scanf.sscanf input "%d/%u" of_ints)) with
  | Scanf.Scan_failure s -> Error (`Msg s)
