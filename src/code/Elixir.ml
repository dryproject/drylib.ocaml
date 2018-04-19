(* This is free and unencumbered software released into the public domain. *)

(* See: https://hexdocs.pm/elixir/master/syntax-reference.html *)
(* See: https://hexdocs.pm/elixir/master/Kernel.SpecialForms.html *)
(* See: https://hexdocs.pm/elixir/master/Kernel.html *)
(* See: https://github.com/elixir-lang/elixir/blob/master/lib/elixir/src/elixir_parser.yrl *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "# %s" s

  let to_string s = s
end
