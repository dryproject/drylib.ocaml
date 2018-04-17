(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

module Ruby = DRY__Code.Ruby

(* Ruby.to_code *)

let () = assert (Ruby.to_code @@ Ruby.number (Number.of_int 42) = "42")

let () = assert (Ruby.to_code @@ Ruby.symbol "a" = ":a")

let () = assert (Ruby.to_code @@ Ruby.string "a" = "\"a\"")

let () = assert (Ruby.to_code @@ Ruby.var "a" = "a")

let () = assert (Ruby.to_code @@ Ruby.nil = "nil")

let () = assert (Ruby.to_code @@ Ruby.self = "self")

let () = assert (Ruby.to_code @@ Ruby.of_int 42 = "42")

let () = assert (Ruby.to_code @@ Ruby.of_float 1.23 = "1.23")

let () = assert (Ruby.to_code @@ Ruby.of_string "a" = "\"a\"")
