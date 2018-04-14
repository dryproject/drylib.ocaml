(* This is free and unencumbered software released into the public domain. *)

(** DRY *)
module DRY : sig
  module Expression : sig
    type t =
      | Atom of Core.Datum.t
      | List of t list

    val of_int : int -> t

    val of_float : float -> t
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
end

(** Rust *)
module Rust : sig
end
