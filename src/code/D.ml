(* This is free and unencumbered software released into the public domain. *)

(* See: https://dlang.org/spec/grammar.html *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s
end
