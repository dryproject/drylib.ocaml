(* This is free and unencumbered software released into the public domain. *)

(* See: https://www.lua.org/manual/5.3/manual.html#9 *)
(* See: http://lua4z.com/doc/manual/syntax.md.html *)
(* See: http://lua-users.org/wiki/LuaGrammar *)

open DRY__Core

module Stdlib = DRY__Stdlib
module Printf = DRY__Stdlib.Printf

module Boolean = DRY__Core.Bool

module Float   = DRY__Core.Float

module Integer = DRY__Core.Int

module String  = DRY__Stdlib.String

module Number = struct
  type t = Integer of Integer.t | Float of Float.t

  let of_float r = Float (Float.of_float r)

  let of_int z = Integer (Integer.of_int z)

  let to_string = function
    | Integer z -> Integer.to_string z
    | Float r -> Float.to_string r
end

module Function = struct
  type t (* TODO *)
end

module Table = struct
  type t (* TODO *)
end

module Value = struct
  type t =
    | Nil
    | Boolean of Boolean.t
    | Number of Number.t
    | String of String.t
    | Function (* TODO *)
    | Userdata
    | Thread
    | Table (* TODO *)

  let nil = Nil

  let of_bool b = Boolean (Boolean.of_bool b)

  let of_float r = Number (Number.of_float r)

  let of_int z = Number (Number.of_int z)

  let of_string s = String s

  let to_string = function
    | Nil -> "nil"
    | Boolean b -> Boolean.to_string b
    | Number n -> Number.to_string n
    | String s -> s
    | Function -> "<function>"
    | Userdata -> "<userdata>"
    | Thread -> "<thread>"
    | Table -> "<table>" (* TODO *)
end

module Type = struct
  type t =
    | Nil
    | Boolean
    | Number
    | String
    | Function
    | Userdata
    | Thread
    | Table

  let of_value = function
    | Value.Nil -> Nil
    | Value.Boolean _ -> Boolean
    | Value.Number _ -> Number
    | Value.String _ -> String
    | Value.Function -> Function
    | Value.Userdata -> Userdata
    | Value.Thread -> Thread
    | Value.Table -> Table

  let to_string = function
    | Nil -> "nil"
    | Boolean -> "boolean"
    | Number -> "number"
    | String -> "string"
    | Function -> "function"
    | Userdata -> "userdata"
    | Thread -> "thread"
    | Table -> "table"
end

module UnaryOperator = struct
  type t = Neg | BNot | Len | Not

  let to_string = function
    | Neg -> "-"
    | BNot -> "~"
    | Len -> "#"
    | Not -> "not"
end

module BinaryOperator = struct
  type t =
    | Add | Sub | Mul | Mod | Pow | Div | IDiv
    | BAnd | BOr | BXor | Shl | Shr | Concat
    | Eq | Lt | Le | Ne | Gt | Ge | And | Or

  let to_string = function
    | Add -> "+"
    | Sub -> "-"
    | Mul -> "*"
    | Mod -> "%"
    | Pow -> "^"
    | Div -> "/"
    | IDiv -> "//"
    | BAnd -> "&"
    | BOr -> "|"
    | BXor -> "~"
    | Shl -> "<<"
    | Shr -> ">>"
    | Concat -> ".."
    | Eq -> "=="
    | Lt -> "<"
    | Le -> "<="
    | Ne -> "~="
    | Gt -> ">"
    | Ge -> ">="
    | And -> "and"
    | Or -> "or"
end

module Expression = struct
  type t =
    | Value of Value.t
    | UnaryOperator of UnaryOperator.t * t
    | BinaryOperator of BinaryOperator.t * t * t

  let rec to_string = function
    | Value x -> Value.to_string x
    | UnaryOperator (op, a) ->
      Printf.sprintf "(%s %s)" (UnaryOperator.to_string op) (to_string a)
    | BinaryOperator (op, a, b) ->
      Printf.sprintf "(%s %s %s)" (to_string a) (BinaryOperator.to_string op) (to_string b)
end
