(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

module Java = DRY__Code.Java

(* Java *)

let () = assert (Java.null = Java.null)

let () = assert (Java.boolean true = Java.boolean true)

let () = assert (Java.boolean false = Java.boolean false)

let () = assert (Java.boolean true != Java.boolean false)

(* Java.of_* *)

let () = assert (Java.of_bool true = Java.boolean true)

let () = assert (Java.of_bool false = Java.boolean false)

let () = assert (Java.of_char 'z' = Java.char (Char.of_char 'z'))

let () = assert (Java.of_float 1.23 = Java.double 1.23)

let () = assert (Java.of_int 42 = Java.long 42L)

(* Java.to_code *)

let () = assert (Java.to_code @@ Java.null = "null")

let () = assert (Java.to_code @@ Java.boolean true = "true")

let () = assert (Java.to_code @@ Java.boolean false = "false")

let () = assert (Java.to_code @@ Java.char (Char.of_char 'a') = "'a'")

let () = assert (Java.to_code @@ Java.byte 42 = "42")

let () = assert (Java.to_code @@ Java.short 42 = "42")

let () = assert (Java.to_code @@ Java.int 42l = "42")

let () = assert (Java.to_code @@ Java.long 42L = "42L")

let () = assert (Java.to_code @@ Java.float 1.23 = "1.23f")

let () = assert (Java.to_code @@ Java.double 1.23 = "1.23d")
