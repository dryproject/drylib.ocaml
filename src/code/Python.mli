(* This is free and unencumbered software released into the public domain. *)

(** Python *)

module Comment : sig
  type t

  val of_string : string -> t

  val to_code : t -> string
  val to_string : t -> string
end
