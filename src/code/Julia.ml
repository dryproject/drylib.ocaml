(* This is free and unencumbered software released into the public domain. *)

(* See: https://github.com/JuliaLang/julia/blob/master/src/julia-parser.scm *)
(* See: https://github.com/JuliaLang/JuliaParser.jl *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "# %s" s

  let to_string s = s
end
