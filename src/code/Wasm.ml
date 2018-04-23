(* This is free and unencumbered software released into the public domain. *)

(* See: https://webassembly.github.io/spec/ *)

open DRY__Core

module Identifier = DRY__Core.Symbol

let sprintf = DRY__Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf ";; %s" s

  let to_string s = s
end

module I32 = DRY__Core.Int32
module I64 = DRY__Core.Int64
module F32 = DRY__Core.Float32
module F64 = DRY__Core.Float64

module Value = struct
  type t =
    | I32 of I32.t | I64 of I64.t
    | F32 of F32.t | F64 of F64.t

  let of_bool b = I32 (if b then 1l else 0l)

  let of_char c = I32 (I32.of_char c)

  let of_float r = F64 (F64.of_float r)

  let of_int z = I64 (I64.of_int z)

  let to_code = function
    | I32 x -> I32.to_string x
    | I64 x -> I64.to_string x
    | F32 x -> F32.to_string x
    | F64 x -> F64.to_string x

  let to_string = to_code
end

module ValueType = struct
  type t = I32 | I64 | F32 | F64

  let to_code = function
    | I32 -> "i32" | I64 -> "i64"
    | F32 -> "f32" | F64 -> "f64"

  let to_string = to_code
end

module Instruction = struct
  type t (* TODO *)

  let to_code (x : t) = "" (* TODO *)

  let to_string = to_code
end

module Expression = struct
  type t = Instruction.t list

  let to_code (x : t) = "" (* TODO *)

  let to_string = to_code
end

module Module = struct
  type t

  let to_code (x : t) = "" (* TODO *)

  let to_string = to_code
end

let i32 z = Value.I32 z
let i64 z = Value.I64 z
let f32 r = Value.F32 r
let f64 r = Value.F64 r

let of_bool = Value.of_bool
let of_char = Value.of_char
let of_float = Value.of_float
let of_int = Value.of_int

let to_string = Value.to_string
let to_code = Value.to_code
