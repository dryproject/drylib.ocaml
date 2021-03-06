(* This is free and unencumbered software released into the public domain. *)

type t =
  | Float32 of Float32.t
  | Float64 of Float64.t

val of_float : float -> t

val to_string : t -> string
