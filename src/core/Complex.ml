(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib
module Printf = Stdlib.Printf
module Scan   = Stdlib.Scanf

type t = { real: Real.t; imaginary: Real.t }

let of_ints r i = { real = Real.of_int r; imaginary = Real.of_int i; }

let to_string { real; imaginary } =
  Printf.sprintf "%s+%si"
    (Real.to_string real)
    (Real.to_string imaginary)

let parse input =
  let make = (fun r s i -> of_ints r (if s = "+" then i else -i)) in
  try (Ok (Scanf.sscanf input "%d%[+-]%ui" make)) with
  | Scanf.Scan_failure s -> Error (`Msg s)
  | End_of_file -> Error (`Msg "end of input")
  | Failure _ | Invalid_argument _ -> assert false
