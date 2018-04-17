(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

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
