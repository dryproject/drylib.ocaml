(* This is free and unencumbered software released into the public domain. *)

type t =
  | Float32 of Float32.t
  | Float64 of Float64.t

let of_float f = Float64 (Float64.of_float f)

let to_string = function
  | Float32 r -> Float32.to_string r
  | Float64 r -> Float64.to_string r
