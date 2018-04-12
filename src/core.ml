(* This is free and unencumbered software released into the public domain. *)

module PrimitiveChar  = Char
module PrimitiveInt32 = Int32
module PrimitiveInt64 = Int64

module Bool = struct
  type t = bool

  let of_bool b = b

  let to_string = Pervasives.string_of_bool
end

module Char = struct
  type t = Uchar.t

  let of_char = Uchar.of_char

  let of_int = Uchar.of_int

  let to_char = Uchar.to_char

  let to_string c = "?" (* TODO *)
end

(*module Complex*)

(*module Datum*)

module Float32 = struct
  type t = float

  let of_float f = f

  let to_string = Pervasives.string_of_float
end

module Float64 = struct
  type t = float

  let of_float f = f

  let to_string = Pervasives.string_of_float
end

module Float = struct
  type t =
    | Float32 of Float32.t
    | Float64 of Float64.t

  let of_float f = Float64 (Float64.of_float f)

  let to_string = function
    | Float32 r -> Float32.to_string r
    | Float64 r -> Float64.to_string r
end

module Int8 = struct
  type t = int

  let of_int n = n (* FIXME *)

  let to_string = Pervasives.string_of_int
end

module Int16 = struct
  type t = int

  let of_int n = n (* FIXME *)

  let to_string = Pervasives.string_of_int
end

module Int32 = struct
  type t = int32

  let of_int = PrimitiveInt32.of_int

  let to_string = PrimitiveInt32.to_string
end

module Int64 = struct
  type t = int64

  let of_int = PrimitiveInt64.of_int

  let to_string = PrimitiveInt64.to_string
end

module Int128 = struct
  type t = { value: Int64.t } (* TODO *)

  let of_int n = { value = Int64.of_int n }

  let to_string { value } = Int64.to_string value
end

module Int = struct
  type t =
    | Int8 of Int8.t
    | Int16 of Int16.t
    | Int32 of Int32.t
    | Int64 of Int64.t
    | Int128 of Int128.t

  let of_int n = Int64 (Int64.of_int n)

  let to_string = function
    | Int8 z   -> Int8.to_string z
    | Int16 z  -> Int16.to_string z
    | Int32 z  -> Int32.to_string z
    | Int64 z  -> Int64.to_string z
    | Int128 z -> Int128.to_string z
end

module Integer = struct
  type t = { value: Int64.t } (* TODO *)

  let of_int n = { value = Int64.of_int n }

  let one = of_int 1

  let zero = of_int 0

  let to_string { value } = Int64.to_string value
end

module Interval = struct
  type t (* TODO *)

  let to_string x = "?" (* TODO *)
end

module Matrix = struct
  type t (* TODO *)

  let to_string x = "?" (* TODO *)
end

module Natural = struct
  type t = Integer.t

  let of_int = Integer.of_int (* FIXME *)

  let to_string = Integer.to_string
end

(*module Number*)

module Quantity = struct
  type t (* TODO *)

  let to_string x = "?" (* TODO *)
end

module Rational = struct
  type t = { numerator: Integer.t; denominator: Integer.t }

  let of_int n = { numerator = Integer.of_int n; denominator = Integer.one }

  let to_string { numerator; denominator } =
    Printf.sprintf "%s/%s" (Integer.to_string numerator) (Integer.to_string denominator)
end

module Real = struct
  type t = { value: Float64.t } (* TODO *)

  let of_float f = { value = Float64.of_float f }

  let to_string { value } = Float64.to_string value
end

(*module Scalar*)

module Symbol = struct
  type t = string

  let to_string s = s
end

(*module Tensor*)

module Unit = struct
  type t (* TODO *)

  let to_string x = "?" (* TODO *)
end

module Vector = struct
  type t (* TODO *)

  let to_string x = "?" (* TODO *)
end

module Word8 = struct
  type t = nativeint

  let to_string x = "?" (* TODO *)
end

module Word16 = struct
  type t = nativeint

  let to_string x = "?" (* TODO *)
end

module Word32 = struct
  type t = nativeint

  let to_string x = "?" (* TODO *)
end

module Word64 = struct
  type t = int64

  let to_string x = "?" (* TODO *)
end

module Word = struct
  type t =
    | Word8 of Word8.t
    | Word16 of Word16.t
    | Word32 of Word32.t
    | Word64 of Word64.t

  let to_string = function
    | Word8 w   -> Word8.to_string w
    | Word16 w  -> Word16.to_string w
    | Word32 w  -> Word32.to_string w
    | Word64 w  -> Word64.to_string w
end

module Complex = struct
  type t = { real: Real.t; imaginary: Real.t }

  let to_string x = "?" (* TODO *)
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

  let to_string = function
    | Complex c  -> Complex.to_string c
    | Float r    -> Float.to_string r
    | Int z      -> Int.to_string z
    | Integer z  -> Integer.to_string z
    | Natural n  -> Natural.to_string n
    | Rational q -> Rational.to_string q
    | Real r     -> Real.to_string r
end

module Scalar = struct
  type t =
    | Bool of Bool.t
    | Char of Char.t
    | Number of Number.t

  let of_float f = Number (Number.of_float f)

  let of_int n = Number (Number.of_int n)

  let to_string = function
    | Bool b   -> Bool.to_string b
    | Char c   -> Char.to_string c
    | Number n -> Number.to_string n
end

module Tensor = struct
  type t =
    | Scalar of Scalar.t
    | Vector of Vector.t
    | Matrix of Matrix.t

  let of_float f = Scalar (Scalar.of_float f)

  let of_int n = Scalar (Scalar.of_int n)

  let to_string = function
    | Scalar x -> Scalar.to_string x
    | Vector x -> Vector.to_string x
    | Matrix x -> Matrix.to_string x
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

  let to_string = function
    | Interval x -> Interval.to_string x
    | Quantity x -> Quantity.to_string x
    | Symbol s   -> Symbol.to_string s
    | Tensor x   -> Tensor.to_string x
    | Unit x     -> Unit.to_string x
end
