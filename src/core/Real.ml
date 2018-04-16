(* This is free and unencumbered software released into the public domain. *)

type t = { value: Float64.t } (* TODO *)

let of_float f = { value = Float64.of_float f }

let to_string { value } = Float64.to_string value
