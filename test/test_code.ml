(* This is free and unencumbered software released into the public domain. *)

open DRY.Core

(* Code *)

module Code = DRY.Code

(* Code.DRY *)

(* FIXME
module DRY = DRY.Code.DRY

let () = assert ((DRY.Expression.Atom (Datum.Symbol "foo")) = (DRY.Expression.Atom (Datum.Symbol "foo")))
*)

(* Code.C *)

module C = DRY.Code.C

(* Code.Cpp *)

module Cpp = DRY.Code.Cpp

(* Code.D *)

module D = DRY.Code.D

(* Code.Dart *)

module Dart = DRY.Code.Dart

(* Code.Elixir *)

module Elixir = DRY.Code.Elixir

(* Code.Go *)

module Go = DRY.Code.Go

(* Code.Java *)

module Java = DRY.Code.Java

(* Code.Julia *)

module Julia = DRY.Code.Julia

(* Code.JS *)

module JS = DRY.Code.JS

(* Code.Kotlin *)

module Kotlin = DRY.Code.Kotlin

(* Code.Lisp *)

module Lisp = DRY.Code.Lisp

(* Code.Lua *)

(*
module Lua = DRY.Code.Lua
*)

(* Code.OCaml *)

module OCaml = DRY.Code.OCaml

(* Code.PHP *)

module PHP = DRY.Code.PHP

(* Code.Python *)

module Python = DRY.Code.Python

(* Code.Ruby *)

module Ruby = DRY.Code.Ruby

let () = assert (Ruby.to_string (Ruby.number (Number.of_int 42)) = "42")

let () = assert (Ruby.to_string (Ruby.symbol "a") = ":a")

let () = assert (Ruby.to_string (Ruby.string "a") = "\"a\"")

let () = assert (Ruby.to_string (Ruby.var "a") = "a")

let () = assert (Ruby.to_string Ruby.nil = "nil")

let () = assert (Ruby.to_string Ruby.self = "self")

let () = assert (Ruby.to_string (Ruby.of_int 42) = "42")

let () = assert (Ruby.to_string (Ruby.of_float 1.23) = "1.23")

let () = assert (Ruby.to_string (Ruby.of_string "a") = "\"a\"")

(* Code.Rust *)

module Rust = DRY.Code.Rust
