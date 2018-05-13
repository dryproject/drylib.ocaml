(* This is free and unencumbered software released into the public domain. *)

(** Lua *)

module Comment : sig
  type t

  val of_string : string -> t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Name    = DRY__Core.Symbol

module Boolean = DRY__Core.Bool
module Float   = DRY__Core.Float
module Integer = DRY__Core.Int
module String  = DRY__Stdlib.String

module Number : sig
  type t = Integer of Integer.t | Float of Float.t

  val of_float : float -> t
  val of_int : int -> t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
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

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
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

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module UnaryOperator : sig
  type t = Neg | BNot | Len | Not

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module BinaryOperator : sig
  type t =
    | Add | Sub | Mul | Mod | Pow | Div | IDiv
    | BAnd | BOr | BXor | Shl | Shr | Concat
    | Eq | Lt | Le | Ne | Gt | Ge | And | Or

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Expression : sig
  type t =
    | Literal of Value.t
    | Variable of Name.t
    | UnaryOperator of UnaryOperator.t * t
    | BinaryOperator of BinaryOperator.t * t * t
    | If of t * t * t
    | FunctionCall of Name.t * t list
    | FunctionDef of Name.t list * t list
    | TableConstructor

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Statement : sig
  type t =
    | Empty
    | Break
    | Return of Expression.t option
    | Do of t list
    | While of Expression.t * t list
    | Repeat of Expression.t * t list
    | If of Expression.t * t list * t list
    | FunctionCall of Name.t * t list
    | FunctionDef of Name.t * Name.t list * t list
    | LocalVarBind of Name.t * Expression.t
    | LocalVarsBind of Name.t list * Expression.t list

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

(** A block is a list of statements. *)
module Block : sig
  type t = Statement.t list

  val make : Statement.t list -> t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

val nil : Expression.t
val empty_table : Expression.t
val empty_string : Expression.t

val boolean : Boolean.t -> Expression.t
val number : Number.t -> Expression.t
val float : Float.t -> Expression.t
val integer : Integer.t -> Expression.t
val string : String.t -> Expression.t
val var : string -> Expression.t

val of_bool : bool -> Expression.t
val of_float : float -> Expression.t
val of_int : int -> Expression.t
val of_string : string -> Expression.t

val to_code : Expression.t -> string
val to_string : Expression.t -> string

val print : Format.formatter -> Expression.t -> unit
