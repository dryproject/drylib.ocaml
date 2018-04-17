(* This is free and unencumbered software released into the public domain. *)

(* See: https://docs.oracle.com/javase/specs/jls/se8/html/jls-19.html *)
(* See: https://github.com/antlr/grammars-v4/blob/master/java8/Java8.g4 *)

open DRY__Core

module Stdlib     = DRY__Stdlib
module Printf     = DRY__Stdlib.Printf

(* Syntactic constructs *)
module Identifier = DRY__Core.Symbol

(* Primitive data types *)
module Boolean    = DRY__Core.Bool
module Char       = DRY__Core.Char
module Byte       = DRY__Core.Int8
module Short      = DRY__Core.Int16
module Int        = DRY__Core.Int32
module Long       = DRY__Core.Int64
module Float      = DRY__Core.Float32
module Double     = DRY__Core.Float64

(* Object types *)
module String     = DRY__Stdlib.String

module Primitive = struct
  type t =
    | Boolean of Boolean.t
    | Char of Char.t
    | Byte of Byte.t
    | Short of Short.t
    | Int of Int.t
    | Long of Long.t
    | Float of Float.t
    | Double of Double.t

  let of_bool b = Boolean (Boolean.of_bool b)

  let of_char c = Char (Char.of_char c)

  let of_float r = Double (Double.of_float r)

  let of_int z = Long (Long.of_int z)

  let to_string = function
    | Boolean b -> Boolean.to_string b
    | Char c -> Char.to_string c
    | Byte z -> Byte.to_string z
    | Short z -> Short.to_string z
    | Int z -> Int.to_string z
    | Long z -> Long.to_string z
    | Float r -> Float.to_string r
    | Double r -> Double.to_string r
end

module PrimitiveType = struct
  type t =
    | Boolean
    | Char
    | Byte
    | Short
    | Int
    | Long
    | Float
    | Double

  let to_string = function
    | Boolean -> "boolean"
    | Char -> "char"
    | Byte -> "byte"
    | Short -> "short"
    | Int -> "int"
    | Long -> "long"
    | Float -> "float"
    | Double -> "double"
end

let boolean b = Primitive.Boolean b

let char c = Primitive.Char c

let byte z = Primitive.Byte z

let short z = Primitive.Short z

let int z = Primitive.Int z

let long z = Primitive.Long z

let float r = Primitive.Float r

let double r = Primitive.Double r

let of_bool = Primitive.of_bool

let of_char = Primitive.of_char

let of_float = Primitive.of_float

let of_int = Primitive.of_int

let to_string = Primitive.to_string
