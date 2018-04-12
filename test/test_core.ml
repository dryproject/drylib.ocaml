(* This is free and unencumbered software released into the public domain. *)

(* Core *)

module Core = Dry.Core

(* Core.Bool *)

module Bool = Dry.Core.Bool

let () = assert (Bool.of_bool(true) = true)

let () = assert (Bool.of_bool(false) = false)

let () = assert (Bool.of_bool(true) != false)

let () = assert (Bool.to_string(true) = "true")

let () = assert (Bool.to_string(false) = "false")

(* Core.Char *)

module Char = Dry.Core.Char

let () = assert (Char.of_int(0) = Char.of_int(0))

let () = assert (Char.of_char('a') = Char.of_char('a'))

let () = assert (Char.of_char('a') != Char.of_char('b'))

(* Core.Complex *)

module Complex = Dry.Core.Complex

(* Core.Datum *)

module Datum = Dry.Core.Datum

let () = assert (Datum.to_string(Datum.of_float 1.23) = "1.23")

let () = assert (Datum.to_string(Datum.of_int 42) = "42")

(* Core.Float *)

module Float = Dry.Core.Float

let () = assert (Float.to_string(Float.of_float 1.23) = "1.23")

(* Core.Float32 *)

module Float32 = Dry.Core.Float32

let () = assert (Float32.to_string(Float32.of_float 1.23) = "1.23")

(* Core.Float64 *)

module Float64 = Dry.Core.Float64

let () = assert (Float64.to_string(Float64.of_float 1.23) = "1.23")

(* Core.Int *)

module Int = Dry.Core.Int

let () = assert (Int.to_string(Int.of_int 42) = "42")

(* Core.Int8 *)

module Int8 = Dry.Core.Int8

let () = assert (Int8.to_string(Int8.of_int 42) = "42")

(* Core.Int16 *)

module Int16 = Dry.Core.Int16

let () = assert (Int16.to_string(Int16.of_int 42) = "42")

(* Core.Int32 *)

module Int32 = Dry.Core.Int32

let () = assert (Int32.to_string(Int32.of_int 42) = "42")

(* Core.Int64 *)

module Int64 = Dry.Core.Int64

let () = assert (Int64.to_string(Int64.of_int 42) = "42")

(* Core.Int128 *)

module Int128 = Dry.Core.Int128

let () = assert (Int128.to_string(Int128.of_int 42) = "42")

(* Core.Integer *)

module Integer = Dry.Core.Integer

let () = assert (Integer.to_string(Integer.of_int 42) = "42")

(* Core.Interval *)

module Interval = Dry.Core.Interval

(* Core.Matrix *)

module Matrix = Dry.Core.Matrix

(* Core.Natural *)

module Natural = Dry.Core.Natural

let () = assert (Natural.to_string(Natural.of_int 42) = "42")

(* Core.Number *)

module Number = Dry.Core.Number

let () = assert (Number.to_string(Number.of_float 1.23) = "1.23")

let () = assert (Number.to_string(Number.of_int 42) = "42")

(* Core.Quantity *)

module Quantity = Dry.Core.Quantity

(* Core.Rational *)

module Rational = Dry.Core.Rational

let () = assert (Rational.to_string(Rational.of_int 42) = "42/1")

(* Core.Real *)

module Real = Dry.Core.Real

let () = assert (Real.to_string(Real.of_float 1.23) = "1.23")

(* Core.Scalar *)

module Scalar = Dry.Core.Scalar

let () = assert (Scalar.to_string(Scalar.of_float 1.23) = "1.23")

let () = assert (Scalar.to_string(Scalar.of_int 42) = "42")

(* Core.Symbol *)

module Symbol = Dry.Core.Symbol

let () = assert (Symbol.to_string("foobar") = "foobar")

(* Core.Tensor *)

module Tensor = Dry.Core.Tensor

let () = assert (Tensor.to_string(Tensor.of_float 1.23) = "1.23")

let () = assert (Tensor.to_string(Tensor.of_int 42) = "42")

(* Core.Unit *)

module Unit = Dry.Core.Unit

(* Core.Vector *)

module Vector = Dry.Core.Vector

(* Core.Word *)

module Word = Dry.Core.Word

(* Core.Word8 *)

module Word8 = Dry.Core.Word8

(* Core.Word16 *)

module Word16 = Dry.Core.Word16

(* Core.Word32 *)

module Word32 = Dry.Core.Word32

(* Core.Word64 *)

module Word64 = Dry.Core.Word64

let () = assert (1 = 1)
