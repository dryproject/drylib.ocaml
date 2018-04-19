(* This is free and unencumbered software released into the public domain. *)

(* See: https://github.com/Ruby/Ruby/blob/trunk/parse.y *)
(* See: https://stackoverflow.com/q/663027 *)

open DRY__Core

module Stdlib = DRY__Stdlib

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "# %s" s

  let to_string s = s
end

module Literal = struct
  type t =
    | Number of Number.t
    | Symbol of string
    | String of string

  let to_string = function
    | Number n -> Number.to_string n
    | Symbol s -> ":" ^ s
    | String s -> "\"" ^ s ^ "\"" (* TODO: escaping *)

  let to_code = to_string
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

  let to_code = to_string
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
    | Not x -> sprintf "(not %s)" (to_string x)
    | And (x, y) -> sprintf "(%s and %s)" (to_string x) (to_string y)
    | Or (x, y) -> sprintf "(%s or %s)" (to_string x) (to_string y)
    | Return x -> sprintf "return (%s)" (to_string x)
    | Yield x -> sprintf "yield (%s)" (to_string x)

  let to_code = to_string
end

module Program = struct
  type t = Expression.t list

  let to_string prog =
    Stdlib.String.concat "\n" (Stdlib.List.map Expression.to_string prog)

  let to_code = to_string
end

let number n = Expression.Literal (Literal.Number n)

let symbol s = Expression.Literal (Literal.Symbol s)

let string s = Expression.Literal (Literal.String s)

let var name = Expression.Variable (Variable.Varname name)

let nil = Expression.Variable Variable.Nil

let self = Expression.Variable Variable.Self

let of_int z = number (Number.of_int z)

let of_float r = number (Number.of_float r)

let of_string = string

let to_string = Expression.to_string

let to_code = Expression.to_code
