(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

module Lisp = DRY__Code.Lisp

(* Common Lisp *)

let () = assert (Lisp.of_bool true = Lisp.of_bool true)

let () = assert (Lisp.of_bool false = Lisp.of_bool false)

let () = assert (Lisp.of_bool true <> Lisp.of_bool false)

(* Lisp.of_* *)

(*
let () = assert (Lisp.of_bool true = Lisp.i32 1l)

let () = assert (Lisp.of_bool false = Lisp.i32 0l)

let () = assert (Lisp.of_char 'z' = Lisp.i32 0x7al)

let () = assert (Lisp.of_float 1.23 = Lisp.f64 1.23)

let () = assert (Lisp.of_int 42 = Lisp.i64 42L)

let () = assert (Lisp.of_string "foobar" = Lisp.)
*)

(* Lisp.print *)

let to_code expr =
  let buffer = Buffer.create 16 in
  let ppf = Format.formatter_of_buffer buffer in
  Format.pp_open_hbox ppf ();
  Lisp.Expression.print ppf expr;
  Format.pp_close_box ppf ();
  Format.pp_print_flush ppf ();
  Buffer.contents buffer

let () = assert (to_code @@ Lisp.nil = "nil")

let () = assert (to_code @@ Lisp.t = "t")

let () = assert (to_code @@ Lisp.of_bool true = "t")

let () = assert (to_code @@ Lisp.of_bool false = "nil")

let () = assert (to_code @@ Lisp.of_char 'z' = "#\\z")

let () = assert (to_code @@ Lisp.of_float 1.23 = "1.23")

let () = assert (to_code @@ Lisp.of_int 42 = "42")

let () = assert (to_code @@ Lisp.of_string "foobar" = "\"foobar\"")

let () = assert (to_code @@ Lisp.make [] = "()")

let () = assert (to_code @@ Lisp.make [Lisp.nil] = "(nil)")

let () = assert (to_code @@ Lisp.make [Lisp.of_int 1; Lisp.of_int 2; Lisp.of_int 3] = "(1 2 3)")
