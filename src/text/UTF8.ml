(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib

module String = struct
  type t = string

  let ends_with_char s c =
    let len = String.length s in
    len > 0 && c = (String.get s (len - 1))

  let starts_with_char s c =
    let len = String.length s in
    len > 0 && c = (String.get s 0)

  let contains_char = Stdlib.String.contains

  let contains_string s1 s2 =
    try ignore (Str.search_forward (Str.regexp_string s2) s1 0); true
    with Not_found -> false
end
