(* This is free and unencumbered software released into the public domain. *)

(** UTF-8 text *)

module String : sig
  type t = string

  val ends_with_char : t -> char -> bool
  val starts_with_char : t -> char -> bool
  val contains_char : t -> char -> bool

  val contains_string : t -> t -> bool
end
