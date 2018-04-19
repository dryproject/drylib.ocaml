(* This is free and unencumbered software released into the public domain. *)

(* See: https://isocpp.org/std/the-standard *)
(* See: https://github.com/antlr/grammars-v4/blob/master/cpp/CPP14.g4 *)
(* See: http://www.nongnu.org/hcb/ *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s
end
