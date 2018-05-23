(* This is free and unencumbered software released into the public domain. *)

type t = { value: Float64.t } (* TODO *)

let of_float r = { value = Float64.of_float r }
let of_int z = { value = Float64.of_int z }

let to_float { value } = value
let to_int { value }   = int_of_float value

let to_string { value } = Float64.to_string value
