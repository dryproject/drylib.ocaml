(* This is free and unencumbered software released into the public domain. *)

(** DRY *)
module DRY = struct
  module Datum = Core.Datum

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
end

(** C *)
module C = struct
  (* TODO *)
end

(** C++ *)
module Cpp = struct
  (* TODO *)
end

(** D *)
module D = struct
  (* TODO *)
end

(** Dart *)
module Dart = struct
  (* TODO *)
end

(** Elixir *)
module Elixir = struct
  (* TODO *)
end

(** Go *)
module Go = struct
  (* TODO *)
end

(** Java *)
module Java = struct
  (* TODO *)
end

(** Julia *)
module Julia = struct
  (* TODO *)
end

(** JS *)
module JS = struct
  (* TODO *)
end

(** Kotlin *)
module Kotlin = struct
  (* TODO *)
end

(** Common Lisp *)
module Lisp = struct
  (* TODO *)
end

(** Lua *)
module Lua = struct
  (* TODO *)
end

(** OCaml *)
module OCaml = struct
  (* TODO *)
end

(** PHP *)
module PHP = struct
  (* TODO *)
end

(** Python *)
module Python = struct
  (* TODO *)
end

(** Ruby *)
module Ruby = struct
  module Literal = struct
    type t =
      | Number of Core.Number.t
      | Symbol of string
      | String of string

    let to_string = function
      | Number n -> Core.Number.to_string n
      | Symbol s -> ":" ^ s
      | String s -> "\"" ^ s ^ "\"" (* TODO: escaping *)
  end

  module Variable = struct
    type t =
      | Varname of string
      | Nil
      | Self

    let to_string = function
      | Varname s -> s
      | Nil -> "nil"
      | Self -> "self"
  end

  module Expression = struct
    type t =
      | Literal of Literal.t
      | Variable of Variable.t
      | Not of t
      | And of t * t
      | Or of t * t
      | Return of t
      | Yield of t

    let rec to_string = function
      | Literal x -> Literal.to_string x
      | Variable x -> Variable.to_string x
      | Not x -> Printf.sprintf "(not %s)" (to_string x)
      | And (x, y) -> Printf.sprintf "(%s and %s)" (to_string x) (to_string y)
      | Or (x, y) -> Printf.sprintf "(%s or %s)" (to_string x) (to_string y)
      | Return x -> Printf.sprintf "return (%s)" (to_string x)
      | Yield x -> Printf.sprintf "yield (%s)" (to_string x)
  end

  module Program = struct
    type t = Expression.t list

    let to_string prog =
      String.concat "\n" (List.map Expression.to_string prog)
  end

  let number n = Expression.Literal (Literal.Number n)

  let symbol s = Expression.Literal (Literal.Symbol s)

  let string s = Expression.Literal (Literal.String s)

  let var name = Expression.Variable (Variable.Varname name)

  let nil = Expression.Variable Variable.Nil

  let self = Expression.Variable Variable.Self

  let of_int z = number (Core.Number.of_int z)

  let of_float r = number (Core.Number.of_float r)

  let of_string = string

  let to_string = Expression.to_string
end

(** Rust *)
module Rust = struct
  (* TODO *)
end
