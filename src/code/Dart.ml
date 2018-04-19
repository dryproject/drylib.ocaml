(* This is free and unencumbered software released into the public domain. *)

(* See: https://www.dartlang.org/guides/language/spec *)
(* See: https://github.com/chalin/dart-spec-and-grammar *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s
end
