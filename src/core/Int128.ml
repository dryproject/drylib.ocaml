(* This is free and unencumbered software released into the public domain. *)

type t = { value: Int64.t } (* TODO *)

let of_int n = { value = Int64.of_int n }

let to_string { value } = Int64.to_string value
