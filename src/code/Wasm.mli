(* This is free and unencumbered software released into the public domain. *)

(** WebAssembly (Wasm) *)

(* See: https://webassembly.github.io/spec/core/text/lexical.html#comments *)
module Comment : sig
  type t

  val of_string : string -> t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module I32 = DRY__Core.Int32
module I64 = DRY__Core.Int64
module F32 = DRY__Core.Float32
module F64 = DRY__Core.Float64

(* See: https://webassembly.github.io/spec/core/syntax/values.html *)
module Value : sig
  type t =
    | I32 of I32.t | I64 of I64.t
    | F32 of F32.t | F64 of F64.t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

(* See: https://webassembly.github.io/spec/core/syntax/types.html#value-types *)
module ValueType : sig
  type t = I32 | I64 | F32 | F64

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

(* See: https://webassembly.github.io/spec/core/syntax/instructions.html *)
module Instruction : sig
  type t
end

(* See: https://webassembly.github.io/spec/core/syntax/instructions.html#expressions *)
module Expression : sig
  type t = Instruction.t list
end

(* See: https://webassembly.github.io/spec/core/syntax/modules.html *)
module Module : sig
  type t

  val create :
    ?imports:string list ->
    ?exports:string list ->
    unit ->
    t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

val i32 : I32.t -> Value.t

val i64 : I64.t -> Value.t

val f32 : F32.t -> Value.t

val f64 : F64.t -> Value.t

val of_bool : bool -> Value.t

val of_char : char -> Value.t

val of_float : float -> Value.t

val of_int : int -> Value.t

val to_string : Value.t -> string

val to_code : Value.t -> string

val print : Format.formatter -> Value.t -> unit
