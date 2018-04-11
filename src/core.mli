(* This is free and unencumbered software released into the public domain. *)

module Bool : sig
  type t = bool
end

module Char : sig
  type t = int
end

module Complex : sig
  type t
end

(*module Datum*)

module Float32 : sig
  type t = float
end

module Float64 : sig
  type t = float
end

module Float : sig
  type t =
    | Float32 of Float32.t
    | Float64 of Float64.t
end

module Int8 : sig
  type t = int
end

module Int16 : sig
  type t = int
end

module Int32 : sig
  type t = int32
end

module Int64 : sig
  type t = int64
end

module Int128 : sig
  type t
end

module Int : sig
  type t =
    | Int8 of Int8.t
    | Int16 of Int16.t
    | Int32 of Int32.t
    | Int64 of Int64.t
    | Int128 of Int128.t
end

module Integer : sig
  type t
end

module Interval : sig
  type t
end

module Matrix : sig
  type t
end

module Natural : sig
  type t = Integer.t
end

(*module Number*)

module Quantity : sig
  type t
end

module Rational : sig
  type t
end

module Real : sig
  type t
end

(*module Scalar*)

module Symbol : sig
  type t = string
end

(*module Tensor*)

module Unit : sig
  type t
end

module Vector : sig
  type t
end

module Word8 : sig
  type t = int
end

module Word16 : sig
  type t = int
end

module Word32 : sig
  type t = int32
end

module Word64 : sig
  type t = int64
end

module Word : sig
  type t =
    | Word8 of Word8.t
    | Word16 of Word16.t
    | Word32 of Word32.t
    | Word64 of Word64.t
end

module Number : sig
  type t =
    | Complex of Complex.t
    | Float of Float.t
    | Int of Int.t
    | Integer of Integer.t
    | Natural of Natural.t
    | Rational of Rational.t
    | Real of Real.t
end

module Scalar : sig
  type t =
    | Bool of Bool.t
    | Char of Char.t
    | Number of Number.t
end

module Tensor : sig
  type t =
    | Scalar of Scalar.t
    | Vector of Vector.t
    | Matrix of Matrix.t
end

module Datum : sig
  type t =
    | Interval of Interval.t
    | Quantity of Quantity.t
    | Symbol of Symbol.t
    | Tensor of Tensor.t
    | Unit of Unit.t
end
