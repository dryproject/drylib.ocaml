(* This is free and unencumbered software released into the public domain. *)

type t = Uchar.t

let of_char = Uchar.of_char

let of_int = Uchar.of_int

let to_char = Uchar.to_char

let to_string c = "?" (* TODO *)
