(* This is free and unencumbered software released into the public domain. *)

(* See: https://www.lua.org/manual/5.3/manual.html#9 *)
(* See: http://lua4z.com/doc/manual/syntax.md.html *)
(* See: http://lua-users.org/wiki/LuaGrammar *)

open DRY__Core

module Stdlib  = DRY__Stdlib
module Format  = Stdlib.Format

module Name    = DRY__Core.Symbol
module Boolean = DRY__Core.Bool
module Float   = DRY__Core.Float
module Integer = DRY__Core.Int
module String  = DRY__Stdlib.String

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "-- %s" s

  let to_string s = s

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module Number = struct
  type t = Integer of Integer.t | Float of Float.t

  let of_float r = Float (Float.of_float r)

  let of_int z = Integer (Integer.of_int z)

  let to_string = function
    | Integer z -> Integer.to_string z
    | Float r -> Float.to_string r

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
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
    | String s -> sprintf "\"%s\"" s (* TODO: escape characters *)
    | Function -> "<function>"
    | Userdata -> "<userdata>"
    | Thread -> "<thread>"
    | Table -> "{}" (* TODO *)

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
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

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module UnaryOperator = struct
  type t = Neg | BNot | Len | Not

  let to_string = function
    | Neg -> "-"
    | BNot -> "~"
    | Len -> "#"
    | Not -> "not"

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
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

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module Expression = struct
  type t =
    | Literal of Value.t
    | Variable of Name.t
    | UnaryOperator of UnaryOperator.t * t
    | BinaryOperator of BinaryOperator.t * t * t
    | If of t * t * t
    | FunctionCall of Name.t * t list
    | FunctionDef of Name.t list * t list
    | TableConstructor (* TODO*)

  let rec to_string = function
    | Literal x -> Value.to_string x
    | Variable v -> Name.to_string v
    | UnaryOperator (op, a) ->
      sprintf "(%s %s)" (UnaryOperator.to_string op) (to_string a)
    | BinaryOperator (op, a, b) ->
      sprintf "(%s %s %s)" (to_string a) (BinaryOperator.to_string op) (to_string b)
    | If (test, then_body, else_body) ->
      (* See: http://lua-users.org/wiki/TernaryOperator *)
      sprintf "(function() if %s then return %s else return %s end end)()"
        (to_string test)
        (to_string then_body)
        (to_string else_body)
    | FunctionCall (name, args) ->
      sprintf "%s(%s)" (Name.to_string name)
        (Stdlib.String.concat ", " (Stdlib.List.map to_string args))
    | FunctionDef (params, body) ->
      sprintf "(function(%s) %s end)"
        (Stdlib.String.concat ", " (Stdlib.List.map Name.to_string params))
        (Stdlib.String.concat "; " (Stdlib.List.map to_string body))
    | TableConstructor -> "{}" (* TODO*)

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module Statement = struct
  type t =
    | Empty
    | Break
    | Return of Expression.t option
    | Do of t list
    | While of Expression.t * t list
    | Repeat of Expression.t * t list
    | If of Expression.t * t list * t list
    | FunctionCall of Name.t * t list
    | FunctionDef of Name.t * Name.t list * t list

  let rec to_string = function
    | Empty -> ""
    | Break -> "break"
    | Return None -> "return"
    | Return Some expr -> sprintf "return %s" (Expression.to_string expr)
    | Do body -> sprintf "do %s end" (Stdlib.String.concat "; " (Stdlib.List.map to_string body))
    | While (expr, body) ->
      sprintf "while %s do %s end" (Expression.to_string expr)
        (Stdlib.String.concat "; " (Stdlib.List.map to_string body))
    | Repeat (expr, body) ->
      sprintf "repeat %s until %s"
        (Stdlib.String.concat "; " (Stdlib.List.map to_string body)) (Expression.to_string expr)
    | If (test, then_body, else_body) ->
      sprintf "if %s then %s else %s end"
        (Expression.to_string test)
        (Stdlib.String.concat "; " (Stdlib.List.map to_string then_body))
        (Stdlib.String.concat "; " (Stdlib.List.map to_string else_body))
    | FunctionCall (name, args) ->
      sprintf "%s(%s)" (Name.to_string name) (Stdlib.String.concat ", " (Stdlib.List.map to_string args))
    | FunctionDef (name, params, body) ->
      sprintf "function %s(%s) %s end" (Name.to_string name)
        (Stdlib.String.concat ", " (Stdlib.List.map Name.to_string params))
        (Stdlib.String.concat "; " (Stdlib.List.map to_string body))

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module Block = struct
  type t = Statement.t list

  let make statements = statements

  let to_string block =
    Stdlib.String.concat "; " (Stdlib.List.map Statement.to_string block)

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

let nil = Expression.Literal Value.Nil
let empty_table = Expression.Literal Value.Table
let empty_string = Expression.Literal (Value.String "")
let boolean b = Expression.Literal (Value.of_bool b)
let number n = Expression.Literal (Value.Number n)
let float r = number (Number.Float r)
let integer z = number (Number.Integer z)
let string s = Expression.Literal (Value.String s)
let var name = Expression.Variable (Name.of_string name)

let of_bool = boolean
let of_float r = number (Number.of_float r)
let of_int z = number (Number.of_int z)
let of_string = string

let to_code = Expression.to_code
let to_string = Expression.to_string
let print = Expression.print
