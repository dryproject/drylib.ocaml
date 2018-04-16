(* This is free and unencumbered software released into the public domain. *)

(** Lua *)

module Boolean = DRY__Core.Bool

module Float = DRY__Core.Float

module Integer = DRY__Core.Int

module String = DRY__Stdlib.String

module Number : sig
  type t = Integer of Integer.t | Float of Float.t

  val of_float : float -> t

  val of_int : int -> t

  val to_string : t -> string
end

module Function : sig
  type t
end

module Table : sig
  type t
end

module Value : sig
  type t =
    | Nil
    | Boolean of Boolean.t
    | Number of Number.t
    | String of String.t
    | Function
    | Userdata
    | Thread
    | Table

  val nil : t

  val of_bool : bool -> t

  val of_float : float -> t

  val of_int : int -> t

  val to_string : t -> string
end

module Type : sig
  type t =
    | Nil
    | Boolean
    | Number
    | String
    | Function
    | Userdata
    | Thread
    | Table

  val of_value : Value.t -> t

  val to_string : t -> string
end

module UnaryOperator : sig
  type t = Neg | BNot | Len | Not

  val to_string : t -> string
end

module BinaryOperator : sig
  type t =
    | Add | Sub | Mul | Mod | Pow | Div | IDiv
    | BAnd | BOr | BXor | Shl | Shr | Concat
    | Eq | Lt | Le | Ne | Gt | Ge | And | Or

  val to_string : t -> string
end

module Expression : sig
  type t =
    | Value of Value.t
    | UnaryOperator of UnaryOperator.t * t
    | BinaryOperator of BinaryOperator.t * t * t

  val to_string : t -> string
end
