(* This is free and unencumbered software released into the public domain. *)

(** Ruby *)

module Comment : sig
  type t

  val of_string : string -> t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Literal : sig
  type t =
    | Number of DRY__Core.Number.t
    | Symbol of string
    | String of string

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Variable : sig
  type t =
    | Varname of string
    | Nil
    | Self

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Expression : sig
  type t =
    | Literal of Literal.t
    | Variable of Variable.t
    | Not of t
    | And of t * t
    | Or of t * t
    | Return of t
    | Yield of t

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Program : sig
  type t = Expression.t list

  val to_code : t -> string
  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

val number : DRY__Core.Number.t -> Expression.t
val symbol : string -> Expression.t
val string : string -> Expression.t
val var : string -> Expression.t
val nil : Expression.t
val self : Expression.t

val of_int : int -> Expression.t
val of_float : float -> Expression.t
val of_string : string -> Expression.t

val to_code : Expression.t -> string
val to_string : Expression.t -> string

val print : Format.formatter -> Expression.t -> unit
