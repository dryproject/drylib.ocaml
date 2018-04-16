(* This is free and unencumbered software released into the public domain. *)

type t =
  | Int8 of Int8.t
  | Int16 of Int16.t
  | Int32 of Int32.t
  | Int64 of Int64.t
  | Int128 of Int128.t

let of_int n = Int64 (Int64.of_int n)

let to_string = function
  | Int8 z   -> Int8.to_string z
  | Int16 z  -> Int16.to_string z
  | Int32 z  -> Int32.to_string z
  | Int64 z  -> Int64.to_string z
  | Int128 z -> Int128.to_string z
