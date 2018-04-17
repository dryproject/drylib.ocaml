(* This is free and unencumbered software released into the public domain. *)

(** Java *)

module Identifier = DRY__Core.Symbol

module Boolean    = DRY__Core.Bool
module Char       = DRY__Core.Char
module Byte       = DRY__Core.Int8
module Short      = DRY__Core.Int16
module Int        = DRY__Core.Int32
module Long       = DRY__Core.Int64
module Float      = DRY__Core.Float32
module Double     = DRY__Core.Float64

module String     = DRY__Stdlib.String

module Primitive : sig
  type t =
    | Boolean of Boolean.t
    | Char of Char.t
    | Byte of Byte.t
    | Short of Short.t
    | Int of Int.t
    | Long of Long.t
    | Float of Float.t
    | Double of Double.t
end

module PrimitiveType : sig
  type t =
    | Boolean
    | Char
    | Byte
    | Short
    | Int
    | Long
    | Float
    | Double
end

val boolean : Boolean.t -> Primitive.t

val char : Char.t -> Primitive.t

val byte : Byte.t -> Primitive.t

val short : Short.t -> Primitive.t

val int : Int.t -> Primitive.t

val long : Long.t -> Primitive.t

val float : Float.t -> Primitive.t

val double : Double.t -> Primitive.t

val of_bool : bool -> Primitive.t

val of_char : char -> Primitive.t

val of_float : float -> Primitive.t

val of_int : int -> Primitive.t

val to_string : Primitive.t -> string
