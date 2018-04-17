(* This is free and unencumbered software released into the public domain. *)

(** PHP *)

module Boolean    = DRY__Core.Bool
module Float      = DRY__Core.Float64
module Integer    = DRY__Core.Int64
module String     = DRY__Stdlib.String

module Primitive : sig
  type t =
    | Boolean of Boolean.t
    | Float of Float.t
    | Integer of Integer.t
    | String of String.t

  val to_string : t -> string

  val to_code : t -> string
end

module PrimitiveType : sig
  type t =
    | Boolean
    | Float
    | Integer
    | String

  val to_string : t -> string

  val to_code : t -> string
end

module Literal : sig
  type t =
    | Null
    | Primitive of Primitive.t

  val to_string : t -> string

  val to_code : t -> string
end

val null : Literal.t

val boolean : Boolean.t -> Literal.t

val float : Float.t -> Literal.t

val integer : Integer.t -> Literal.t

val string : String.t -> Literal.t

val of_bool : bool -> Literal.t

val of_float : float -> Literal.t

val of_int : int -> Literal.t

val of_string : string -> Literal.t

val to_string : Literal.t -> string

val to_code : Literal.t -> string
