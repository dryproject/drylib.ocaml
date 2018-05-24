(* This is free and unencumbered software released into the public domain. *)

(** Common Lisp *)

module Comment : sig
  type t

  val of_string : string -> t

  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Character = DRY__Core.Char
module Number    = DRY__Core.Number
module String    = DRY__Stdlib.String
module Symbol    = DRY__Core.Symbol

module Atom : sig
  type t =
    | Null
    | Character of Character.t
    | Number of Number.t
    | String of String.t
    | Symbol of Symbol.t

  val of_bool : bool -> t
  val of_char : char -> t
  val of_float : float -> t
  val of_int : int -> t
  val of_string : string -> t

  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Object : sig
  type t =
    | Atom of Atom.t
    | Cons of t list

  val of_bool : bool -> t
  val of_char : char -> t
  val of_float : float -> t
  val of_int : int -> t
  val of_string : string -> t

  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Expression : sig
  type t = Object.t

  val make : Object.t list -> t

  val of_bool : bool -> t
  val of_char : char -> t
  val of_float : float -> t
  val of_int : int -> t
  val of_string : string -> t

  val to_string : t -> string

  val print : Format.formatter -> t -> unit
end

module Program : sig
  type t = Expression.t list

  val make : Expression.t list -> t

  val print : Format.formatter -> t -> unit
end

val nil : Expression.t
val t : Expression.t

val form : Object.t list -> Expression.t
val quote : Object.t list -> Expression.t

val character : Character.t -> Expression.t
val number : Number.t -> Expression.t
val string : String.t -> Expression.t
val symbol : Symbol.t -> Expression.t
val keyword : String.t -> Expression.t

val of_bool : bool -> Expression.t
val of_char : char -> Expression.t
val of_float : float -> Expression.t
val of_int : int -> Expression.t
val of_string : string -> Expression.t

val to_string : Expression.t -> string

val print : Format.formatter -> Expression.t -> unit
