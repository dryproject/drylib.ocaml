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

module Datum : sig
  type t
end

module Float32 : sig
  type t = float
end

module Float64 : sig
  type t = float
end

module Float = Float64

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

module Int = Int64

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

module Number : sig
  type t
end

module Quantity : sig
  type t
end

module Rational : sig
  type t
end

module Real : sig
  type t
end

module Scalar : sig
  type t
end

module Symbol : sig
  type t = string
end

module Tensor : sig
  type t
end

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

module Word = Word64
