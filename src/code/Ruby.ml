(* This is free and unencumbered software released into the public domain. *)

(* See: https://github.com/Ruby/Ruby/blob/trunk/parse.y *)
(* See: https://stackoverflow.com/q/663027 *)

open DRY__Core

module Literal = struct
  type t =
    | Number of Number.t
    | Symbol of string
    | String of string

  let to_string = function
    | Number n -> Number.to_string n
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

let of_int z = number (Number.of_int z)

let of_float r = number (Number.of_float r)

let of_string = string

let to_string = Expression.to_string
