(* This is free and unencumbered software released into the public domain. *)

(* See: https://golang.org/ref/spec *)
(* See: https://github.com/antlr/grammars-v4/blob/master/golang/Golang.g4 *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s
end
