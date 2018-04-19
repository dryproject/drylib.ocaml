(* This is free and unencumbered software released into the public domain. *)

(* See: https://en.wikipedia.org/wiki/JavaScript_syntax *)
(* See: https://www.ecma-international.org/ecma-262/8.0/ *)
(* See: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s
end
