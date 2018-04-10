(* This is free and unencumbered software released into the public domain. *)

module Bool = struct
  type t = bool
end

module Char = struct
  type t = int
end

module Datum = struct
  type t (* TODO *)
end

module Float32 = struct
  type t = float
end

module Float64 = struct
  type t = float
end

module Float = Float64

module Int8 = struct
  type t = int
end

module Int16 = struct
  type t = int
end

module Int32 = struct
  type t = int32
end

module Int64 = struct
  type t = int64
end

module Int128 = struct
  type t (* TODO *)
end

module Int = Int64

module Integer = struct
  type t = { value: int64 } (* TODO *)
end

module Interval = struct
  type t (* TODO *)
end

module Matrix = struct
  type t (* TODO *)
end

module Natural = struct
  type t = Integer.t
end

module Number = struct
  type t (* TODO *)
end

module Quantity = struct
  type t (* TODO *)
end

module Rational = struct
  type t = { numerator: Integer.t; denominator: Integer.t }
end

module Real = struct
  type t = { value: float } (* TODO *)
end

module Scalar = struct
  type t (* TODO *)
end

module Symbol = struct
  type t = string
end

module Tensor = struct
  type t (* TODO *)
end

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

module Word = Word64

module Complex = struct
  type t = { real: Real.t; imaginary: Real.t }
end
