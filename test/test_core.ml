(* This is free and unencumbered software released into the public domain. *)

(* Core *)

module Core = DRY.Core

(* Core.Bool *)

module Bool = DRY.Core.Bool

let () = assert (Bool.of_bool(true) = true)

let () = assert (Bool.of_bool(false) = false)

let () = assert (Bool.of_bool(true) != false)

let () = assert (Bool.to_string(true) = "true")

let () = assert (Bool.to_string(false) = "false")

(* Core.Char *)

module Char = DRY.Core.Char

let () = assert (Char.of_int(0) = Char.of_int(0))

let () = assert (Char.of_char('a') = Char.of_char('a'))

let () = assert (Char.of_char('a') != Char.of_char('b'))

(* Core.Complex *)

module Complex = DRY.Core.Complex

(* Core.Datum *)

module Datum = DRY.Core.Datum

let () = assert (Datum.to_string(Datum.of_float 1.23) = "1.23")

let () = assert (Datum.to_string(Datum.of_int 42) = "42")

(* Core.Float *)

module Float = DRY.Core.Float

let () = assert (Float.to_string(Float.of_float 1.23) = "1.23")

(* Core.Float32 *)

module Float32 = DRY.Core.Float32

let () = assert (Float32.to_string(Float32.of_float 1.23) = "1.23")

(* Core.Float64 *)

module Float64 = DRY.Core.Float64

let () = assert (Float64.to_string(Float64.of_float 1.23) = "1.23")

(* Core.Int *)

module Int = DRY.Core.Int

let () = assert (Int.to_string(Int.of_int 42) = "42")

(* Core.Int8 *)

module Int8 = DRY.Core.Int8

let () = assert (Int8.to_string(Int8.of_int 42) = "42")

(* Core.Int16 *)

module Int16 = DRY.Core.Int16

let () = assert (Int16.to_string(Int16.of_int 42) = "42")

(* Core.Int32 *)

module Int32 = DRY.Core.Int32

let () = assert (Int32.to_string(Int32.of_int 42) = "42")

(* Core.Int64 *)

module Int64 = DRY.Core.Int64

let () = assert (Int64.to_string(Int64.of_int 42) = "42")

(* Core.Int128 *)

module Int128 = DRY.Core.Int128

let () = assert (Int128.to_string(Int128.of_int 42) = "42")

(* Core.Integer *)

module Integer = DRY.Core.Integer

let () = assert (Integer.to_string(Integer.of_int 42) = "42")

(* Core.Interval *)

module Interval = DRY.Core.Interval

(* Core.Matrix *)

module Matrix = DRY.Core.Matrix

(* Core.Natural *)

module Natural = DRY.Core.Natural

let () = assert (Natural.to_string(Natural.of_int 42) = "42")

(* Core.Number *)

module Number = DRY.Core.Number

let () = assert (Number.to_string(Number.of_float 1.23) = "1.23")

let () = assert (Number.to_string(Number.of_int 42) = "42")

(* Core.Quantity *)

module Quantity = DRY.Core.Quantity

(* Core.Rational *)

module Rational = DRY.Core.Rational

let () = assert (Rational.to_string(Rational.of_int 42) = "42/1")

(* Core.Real *)

module Real = DRY.Core.Real

let () = assert (Real.to_string(Real.of_float 1.23) = "1.23")

(* Core.Scalar *)

module Scalar = DRY.Core.Scalar

let () = assert (Scalar.to_string(Scalar.of_float 1.23) = "1.23")

let () = assert (Scalar.to_string(Scalar.of_int 42) = "42")

(* Core.Symbol *)

module Symbol = DRY.Core.Symbol

let () = assert (Symbol.to_string("foobar") = "foobar")

(* Core.Tensor *)

module Tensor = DRY.Core.Tensor

let () = assert (Tensor.to_string(Tensor.of_float 1.23) = "1.23")

let () = assert (Tensor.to_string(Tensor.of_int 42) = "42")

(* Core.Unit *)

module Unit = DRY.Core.Unit

(* Core.Vector *)

module Vector = DRY.Core.Vector

(* Core.Word *)

module Word = DRY.Core.Word

(* Core.Word8 *)

module Word8 = DRY.Core.Word8

(* Core.Word16 *)

module Word16 = DRY.Core.Word16

(* Core.Word32 *)

module Word32 = DRY.Core.Word32

(* Core.Word64 *)

module Word64 = DRY.Core.Word64

let () = assert (1 = 1)
