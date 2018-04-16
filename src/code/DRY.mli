(* This is free and unencumbered software released into the public domain. *)

(** DRY *)

module Location : sig
  type t = { line: int; column: int }
end

module Expression : sig
  type t =
    | Atom of DRY__Core.Datum.t
    | List of t list

  val of_int : int -> t

  val of_float : float -> t

  val to_string : t -> string
end
