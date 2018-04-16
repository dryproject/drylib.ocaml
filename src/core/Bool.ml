(* This is free and unencumbered software released into the public domain. *)

type t = bool

let of_bool b = b

let to_string = DRY__Stdlib.Pervasives.string_of_bool
