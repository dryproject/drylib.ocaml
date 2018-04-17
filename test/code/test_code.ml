(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

(* Code *)

module Code = DRY__Code

(* Code.DRY *)

module Dry = DRY__Code.DRY

(*
let () = assert ((Dry.Expression.Atom (Datum.Symbol "foo")) = (Dry.Expression.Atom (Datum.Symbol "foo")))
*)

(* Code.C *)

module C = DRY__Code.C

(* Code.Cpp *)

module Cpp = DRY__Code.Cpp

(* Code.D *)

module D = DRY__Code.D

(* Code.Dart *)

module Dart = DRY__Code.Dart

(* Code.Elixir *)

module Elixir = DRY__Code.Elixir

(* Code.Go *)

module Go = DRY__Code.Go

(* Code.Java *)

module Java = DRY__Code.Java

(* Code.Julia *)

module Julia = DRY__Code.Julia

(* Code.JS *)

module JS = DRY__Code.JS

(* Code.Kotlin *)

module Kotlin = DRY__Code.Kotlin

(* Code.Lisp *)

module Lisp = DRY__Code.Lisp

(* Code.Lua *)

module Lua = DRY__Code.Lua

let () = assert (Lua.to_string Lua.nil = "nil")

let () = assert (Lua.to_string Lua.empty_table = "{}")

let () = assert (Lua.to_string Lua.empty_string = "\"\"")

let () = assert (Lua.to_string (Lua.var "a") = "a")

let () = assert (Lua.to_string (Lua.of_bool true) = "true")

let () = assert (Lua.to_string (Lua.of_bool false) = "false")

let () = assert (Lua.to_string (Lua.of_float 1.23) = "1.23")

let () = assert (Lua.to_string (Lua.of_int 42) = "42")

let () = assert (Lua.to_string (Lua.of_string "a") = "\"a\"")

(* Code.OCaml *)

module OCaml = DRY__Code.OCaml

(* Code.PHP *)

module PHP = DRY__Code.PHP

(* Code.Python *)

module Python = DRY__Code.Python

(* Code.Ruby *)

module Ruby = DRY__Code.Ruby

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

module Rust = DRY__Code.Rust
