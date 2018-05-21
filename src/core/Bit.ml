(* This is free and unencumbered software released into the public domain. *)

type t = Zero | One

let of_bool b = if b then One else Zero
let of_int z  = if z = 0 then Zero else One

let to_bool = function
  | Zero -> false | One -> true

let to_int = function
  | Zero -> 0 | One -> 1

let to_string = function
  | Zero -> "0" | One -> "1"
