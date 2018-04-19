(* This is free and unencumbered software released into the public domain. *)

(* See: http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf *)
(* See: https://github.com/jhjourdan/C11parser *)
(* See: https://github.com/antlr/grammars-v4/blob/master/c/C.g4 *)
(* See: http://www.quut.com/c/ANSI-C-grammar-y.html *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s
end
