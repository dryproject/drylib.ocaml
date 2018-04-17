(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

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
