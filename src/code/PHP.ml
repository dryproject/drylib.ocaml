(* This is free and unencumbered software released into the public domain. *)

(* See: http://php.net/manual/en/langref.php *)
(* See: http://php.net/manual/en/language.types.intro.php *)
(* See: https://github.com/php/php-langspec/blob/master/spec/09-lexical-structure.md *)
(* See: https://github.com/php/php-src/blob/master/Zend/zend_language_parser.y *)
(* See: https://github.com/php/php-src/blob/master/Zend/zend_language_scanner.l *)
(* See: https://github.com/nikic/PHP-Parser/blob/master/grammar/php7.y *)
(* See: https://github.com/antlr/grammars-v4/blob/master/php/PhpParser.g4 *)

open DRY__Core

module Stdlib     = DRY__Stdlib
module Format     = Stdlib.Format

(* Scalar types *)
module Boolean    = DRY__Core.Bool
module Float      = DRY__Core.Float64
module Integer    = DRY__Core.Int64
module String     = DRY__Stdlib.String

(* Compound types *)
(* TODO *)

let sprintf = Stdlib.Printf.sprintf

module Comment = struct
  type t = string

  let of_string s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module Primitive = struct
  type t =
    | Boolean of Boolean.t
    | Float of Float.t
    | Integer of Integer.t
    | String of String.t

  let of_bool b = Boolean (Boolean.of_bool b)

  let of_float r = Float (Float.of_float r)

  let of_int z = Integer (Integer.of_int z)

  let of_string s = String s

  let to_string = function
    | Boolean b -> Boolean.to_string b
    | Float r -> Float.to_string r
    | Integer z -> Integer.to_string z
    | String s -> s

  let to_code = function
    | String s -> sprintf "\"%s\"" s (* FIXME *)
    | _ as x -> to_string x

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module PrimitiveType = struct
  type t =
    | Boolean
    | Float
    | Integer
    | String

  let to_string = function
    | Boolean -> "boolean"
    | Float -> "float"
    | Integer -> "integer"
    | String -> "string"

  let to_code = to_string

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

module Literal = struct
  type t =
    | Null
    | Primitive of Primitive.t

  let of_bool b = Primitive (Primitive.of_bool b)

  let of_float r = Primitive (Primitive.of_float r)

  let of_int z = Primitive (Primitive.of_int z)

  let of_string s = Primitive (Primitive.of_string s)

  let to_string = function
    | Null -> "null"
    | Primitive x -> Primitive.to_string x

  let to_code = function
    | Primitive x -> Primitive.to_code x
    | _ as x -> to_string x

  let print ppf code =
    to_code code |> Format.pp_print_string ppf
end

let null = Literal.Null
let boolean b = Literal.Primitive (Primitive.Boolean b)
let float r = Literal.Primitive (Primitive.Float r)
let integer z = Literal.Primitive (Primitive.Integer z)
let string s = Literal.Primitive (Primitive.String s)

let of_bool = Literal.of_bool
let of_float = Literal.of_float
let of_int = Literal.of_int
let of_string = Literal.of_string

let to_code = Literal.to_code
let to_string = Literal.to_string
let print = Literal.print
