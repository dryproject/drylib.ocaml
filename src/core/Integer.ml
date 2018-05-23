(* This is free and unencumbered software released into the public domain. *)

type t = { value: Int64.t } (* TODO *)

let of_int z   = { value = Int64.of_int z }
let of_int32 z = { value = Int64.of_int32 z }
let of_int64 z = { value = z }

let zero = of_int 0

let one = of_int 1

let to_string { value } = Int64.to_string value
