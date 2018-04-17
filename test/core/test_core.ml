(* This is free and unencumbered software released into the public domain. *)

module Core = DRY__Core

(* Core.Bool *)

module Bool = DRY__Core.Bool

let () = assert (Bool.of_bool(true) = true)

let () = assert (Bool.of_bool(false) = false)

let () = assert (Bool.of_bool(true) != false)

let () = assert (Bool.to_string(true) = "true")

let () = assert (Bool.to_string(false) = "false")

(* Core.Char *)

module Char = DRY__Core.Char

let () = assert (Char.of_int(0) = Char.of_int(0))

let () = assert (Char.of_char('a') = Char.of_char('a'))

let () = assert (Char.of_char('a') != Char.of_char('b'))

(* Core.Complex *)

module Complex = DRY__Core.Complex

(* Core.Datum *)

module Datum = DRY__Core.Datum

let () = assert (Datum.to_string(Datum.of_float 1.23) = "1.23")

let () = assert (Datum.to_string(Datum.of_int 42) = "42")

(* Core.Float *)

module Float = DRY__Core.Float

let () = assert (Float.to_string(Float.of_float 1.23) = "1.23")

(* Core.Float32 *)

module Float32 = DRY__Core.Float32

let () = assert (Float32.to_string(Float32.of_float 1.23) = "1.23")

(* Core.Float64 *)

module Float64 = DRY__Core.Float64

let () = assert (Float64.to_string(Float64.of_float 1.23) = "1.23")

(* Core.Int *)

module Int = DRY__Core.Int

let () = assert (Int.to_string(Int.of_int 42) = "42")

(* Core.Int8 *)

module Int8 = DRY__Core.Int8

let () = assert (Int8.to_string(Int8.of_int 42) = "42")

(* Core.Int16 *)

module Int16 = DRY__Core.Int16

let () = assert (Int16.to_string(Int16.of_int 42) = "42")

(* Core.Int32 *)

module Int32 = DRY__Core.Int32

let () = assert (Int32.to_string(Int32.of_int 42) = "42")

(* Core.Int64 *)

module Int64 = DRY__Core.Int64

let () = assert (Int64.to_string(Int64.of_int 42) = "42")

(* Core.Int128 *)

module Int128 = DRY__Core.Int128

let () = assert (Int128.to_string(Int128.of_int 42) = "42")

(* Core.Integer *)

module Integer = DRY__Core.Integer

let () = assert (Integer.to_string(Integer.of_int 42) = "42")

(* Core.Interval *)

module Interval = DRY__Core.Interval

(* Core.Matrix *)

module Matrix = DRY__Core.Matrix

(* Core.Natural *)

module Natural = DRY__Core.Natural

let () = assert (Natural.to_string(Natural.of_int 42) = "42")

(* Core.Number *)

module Number = DRY__Core.Number

let () = assert (Number.to_string(Number.of_float 1.23) = "1.23")

let () = assert (Number.to_string(Number.of_int 42) = "42")

(* Core.Quantity *)

module Quantity = DRY__Core.Quantity

(* Core.Rational *)

module Rational = DRY__Core.Rational

let () = assert (Rational.to_string(Rational.of_int 42) = "42/1")

(* Core.Real *)

module Real = DRY__Core.Real

let () = assert (Real.to_string(Real.of_float 1.23) = "1.23")

(* Core.Scalar *)

module Scalar = DRY__Core.Scalar

let () = assert (Scalar.to_string(Scalar.of_float 1.23) = "1.23")

let () = assert (Scalar.to_string(Scalar.of_int 42) = "42")

(* Core.Symbol *)

module Symbol = DRY__Core.Symbol

let () = assert (Symbol.to_string(Symbol.of_string "foobar") = "foobar")

(* Core.Tensor *)

module Tensor = DRY__Core.Tensor

let () = assert (Tensor.to_string(Tensor.of_float 1.23) = "1.23")

let () = assert (Tensor.to_string(Tensor.of_int 42) = "42")

(* Core.Unit *)

module Unit = DRY__Core.Unit

(* Core.Vector *)

module Vector = DRY__Core.Vector

(* Core.Word *)

module Word = DRY__Core.Word

(* Core.Word8 *)

module Word8 = DRY__Core.Word8

(* Core.Word16 *)

module Word16 = DRY__Core.Word16

(* Core.Word32 *)

module Word32 = DRY__Core.Word32

(* Core.Word64 *)

module Word64 = DRY__Core.Word64
