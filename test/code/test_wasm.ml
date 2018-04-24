(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

module Wasm = DRY__Code.Wasm

(* WebAssembly (Wasm) *)

let () = assert (Wasm.of_bool true = Wasm.of_bool true)

let () = assert (Wasm.of_bool false = Wasm.of_bool false)

let () = assert (Wasm.of_bool true != Wasm.of_bool false)

(* Wasm.of_* *)

let () = assert (Wasm.of_bool true = Wasm.i32 1l)

let () = assert (Wasm.of_bool false = Wasm.i32 0l)

let () = assert (Wasm.of_char 'z' = Wasm.i32 0x7al)

let () = assert (Wasm.of_float 1.23 = Wasm.f64 1.23)

let () = assert (Wasm.of_int 42 = Wasm.i64 42L)

(* Wasm.to_code *)

let () = assert (Wasm.to_code @@ Wasm.of_bool true = "1")

let () = assert (Wasm.to_code @@ Wasm.of_bool false = "0")

let () = assert (Wasm.to_code @@ Wasm.of_char 'a' = "97")

let () = assert (Wasm.to_code @@ Wasm.i32 42l = "42")

let () = assert (Wasm.to_code @@ Wasm.i64 42L = "42")

let () = assert (Wasm.to_code @@ Wasm.f32 1.23 = "1.23")

let () = assert (Wasm.to_code @@ Wasm.f64 1.23 = "1.23")

(* Wasm.Module *)

let () = assert (Wasm.Module.to_code @@ Wasm.Module.create () = "(module)\n")
