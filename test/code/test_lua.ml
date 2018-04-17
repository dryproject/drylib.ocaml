(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

module Lua = DRY__Code.Lua

(* Lua.to_code *)

let () = assert (Lua.to_code @@ Lua.nil = "nil")

let () = assert (Lua.to_code @@ Lua.empty_table = "{}")

let () = assert (Lua.to_code @@ Lua.empty_string = "\"\"")

let () = assert (Lua.to_code @@ Lua.var "a" = "a")

let () = assert (Lua.to_code @@ Lua.of_bool true = "true")

let () = assert (Lua.to_code @@ Lua.of_bool false = "false")

let () = assert (Lua.to_code @@ Lua.of_float 1.23 = "1.23")

let () = assert (Lua.to_code @@ Lua.of_int 42 = "42")

let () = assert (Lua.to_code @@ Lua.of_string "a" = "\"a\"")
