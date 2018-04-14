(* This is free and unencumbered software released into the public domain. *)

(** DRY *)
module DRY : sig
  module Location : sig
    type t = { line: int; column: int }
  end

  module Expression : sig
    type t =
      | Atom of Core.Datum.t
      | List of t list

    val of_int : int -> t

    val of_float : float -> t

    val to_string : t -> string
  end
end

(** C *)
module C : sig
end

(** C++ *)
module Cpp : sig
end

(** D *)
module D : sig
end

(** Dart *)
module Dart : sig
end

(** Elixir *)
module Elixir : sig
end

(** Go *)
module Go : sig
end

(** Java *)
module Java : sig
end

(** Julia *)
module Julia : sig
end

(** JS *)
module JS : sig
end

(** Kotlin *)
module Kotlin : sig
end

(** Common Lisp *)
module Lisp : sig
end

(** Lua *)
module Lua : sig
end

(** OCaml *)
module OCaml : sig
end

(** PHP *)
module PHP : sig
end

(** Python *)
module Python : sig
end

(** Ruby *)
module Ruby : sig
  module Literal : sig
    type t =
      | Number of Core.Number.t
      | Symbol of string
      | String of string

    val to_string : t -> string
  end

  module Variable : sig
    type t =
      | Varname of string
      | Nil
      | Self

    val to_string : t -> string
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

    val to_string : t -> string
  end

  module Program : sig
    type t = Expression.t list

    val to_string : t -> string
  end

  val number : Core.Number.t -> Expression.t

  val symbol : string -> Expression.t

  val string : string -> Expression.t

  val var : string -> Expression.t

  val nil : Expression.t

  val self : Expression.t

  val of_int : int -> Expression.t

  val of_float : float -> Expression.t

  val of_string : string -> Expression.t

  val to_string : Expression.t -> string
end

(** Rust *)
module Rust : sig
end
