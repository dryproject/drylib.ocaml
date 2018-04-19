(* This is free and unencumbered software released into the public domain. *)

(* See: https://caml.inria.fr/pub/docs/manual-ocaml/language.html *)
(* See: https://askra.de/software/ocaml-doc/4.02/full-grammar.html *)
(* See: https://github.com/ocaml/ocaml/tree/trunk/parsing *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "(* %s *)" s

  let to_string s = s
end
