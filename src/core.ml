(* This is free and unencumbered software released into the public domain. *)

module OCamlChar  = Char
module OCamlInt32 = Int32
module OCamlInt64 = Int64

module Bool = struct
  type t = bool

  let of_bool b = b
end

module Char = struct
  type t = Uchar.t

  let of_char = Uchar.of_char
  let of_int = Uchar.of_int
end

(*module Complex*)

(*module Datum*)

module Float32 = struct
  type t = float

  let of_float f = f
end

module Float64 = struct
  type t = float

  let of_float f = f
end

module Float = struct
  type t =
    | Float32 of Float32.t
    | Float64 of Float64.t

  let of_float f = Float64 (Float64.of_float f)
end

module Int8 = struct
  type t = int

  let of_int n = n (* FIXME *)
end

module Int16 = struct
  type t = int

  let of_int n = n (* FIXME *)
end

module Int32 = struct
  type t = int32

  let of_int = OCamlInt32.of_int
end

module Int64 = struct
  type t = int64

  let of_int = OCamlInt64.of_int
end

module Int128 = struct
  type t = { value: int64 } (* TODO *)

  let of_int n = { value = OCamlInt64.of_int n }
end

module Int = struct
  type t =
    | Int8 of Int8.t
    | Int16 of Int16.t
    | Int32 of Int32.t
    | Int64 of Int64.t
    | Int128 of Int128.t

  let of_int n = Int64 (Int64.of_int n)
end

module Integer = struct
  type t = { value: int64 } (* TODO *)

  let of_int n = { value = OCamlInt64.of_int n }

  let one = of_int 1
  let zero = of_int 0
end

module Interval = struct
  type t (* TODO *)
end

module Matrix = struct
  type t (* TODO *)
end

module Natural = struct
  type t = Integer.t

  let of_int = Integer.of_int (* FIXME *)
end

(*module Number*)

module Quantity = struct
  type t (* TODO *)
end

module Rational = struct
  type t = { numerator: Integer.t; denominator: Integer.t }

  let of_int n = { numerator = Integer.of_int n; denominator = Integer.one }
end

module Real = struct
  type t = { value: float } (* TODO *)

  let of_float f = { value = f }
end

(*module Scalar*)

module Symbol = struct
  type t = string
end

(*module Tensor*)

module Unit = struct
  type t (* TODO *)
end

module Vector = struct
  type t (* TODO *)
end

module Word8 = struct
  type t = int
end

module Word16 = struct
  type t = int
end

module Word32 = struct
  type t = int32
end

module Word64 = struct
  type t = int64
end

module Word = struct
  type t =
    | Word8 of Word8.t
    | Word16 of Word16.t
    | Word32 of Word32.t
    | Word64 of Word64.t
end

module Complex = struct
  type t = { real: Real.t; imaginary: Real.t }
end

module Number = struct
  type t =
    | Complex of Complex.t
    | Float of Float.t
    | Int of Int.t
    | Integer of Integer.t
    | Natural of Natural.t
    | Rational of Rational.t
    | Real of Real.t

  let of_float f = Float (Float.of_float f)

  let of_int n = Int (Int.of_int n)
end

module Scalar = struct
  type t =
    | Bool of Bool.t
    | Char of Char.t
    | Number of Number.t

  let of_float f = Number (Number.of_float f)

  let of_int n = Number (Number.of_int n)
end

module Tensor = struct
  type t =
    | Scalar of Scalar.t
    | Vector of Vector.t
    | Matrix of Matrix.t

  let of_float f = Scalar (Scalar.of_float f)

  let of_int n = Scalar (Scalar.of_int n)
end

module Datum = struct
  type t =
    | Interval of Interval.t
    | Quantity of Quantity.t
    | Symbol of Symbol.t
    | Tensor of Tensor.t
    | Unit of Unit.t

  let of_float f = Tensor (Tensor.of_float f)

  let of_int n = Tensor (Tensor.of_int n)
end
