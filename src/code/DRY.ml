(* This is free and unencumbered software released into the public domain. *)

open DRY__Core

module Location = struct
  type t = { line: int; column: int }
end

module Expression = struct
  type t =
    | Atom of Datum.t
    | List of t list

  let of_int z = Atom (Datum.of_int z)

  let of_float r = Atom (Datum.of_float r)

  let rec to_string = function
    | Atom datum -> Datum.to_string datum
    | List data -> "(" ^ (String.concat " " (List.map to_string data)) ^ ")"
end
