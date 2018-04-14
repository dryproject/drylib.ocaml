(* This is free and unencumbered software released into the public domain. *)

open Dry.Core

(* Code *)

module Code = Dry.Code

(* Code.DRY *)

module DRY = Dry.Code.DRY

let () = assert ((DRY.Expression.Atom (Datum.Symbol "foo")) = (DRY.Expression.Atom (Datum.Symbol "foo")))

(* Code.C *)

module C = Dry.Code.C

(* Code.Cpp *)

module Cpp = Dry.Code.Cpp

(* Code.D *)

module D = Dry.Code.D

(* Code.Dart *)

module Dart = Dry.Code.Dart

(* Code.Elixir *)

module Elixir = Dry.Code.Elixir

(* Code.Go *)

module Go = Dry.Code.Go

(* Code.Java *)

module Java = Dry.Code.Java

(* Code.Julia *)

module Julia = Dry.Code.Julia

(* Code.JS *)

module JS = Dry.Code.JS

(* Code.Kotlin *)

module Kotlin = Dry.Code.Kotlin

(* Code.Lisp *)

module Lisp = Dry.Code.Lisp

(* Code.Lua *)

module Lua = Dry.Code.Lua

(* Code.OCaml *)

module OCaml = Dry.Code.OCaml

(* Code.PHP *)

module PHP = Dry.Code.PHP

(* Code.Python *)

module Python = Dry.Code.Python

(* Code.Ruby *)

module Ruby = Dry.Code.Ruby

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

module Rust = Dry.Code.Rust
