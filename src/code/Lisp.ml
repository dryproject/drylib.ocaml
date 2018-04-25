(* This is free and unencumbered software released into the public domain. *)

(* See: http://www.lispworks.com/documentation/HyperSpec/Front/index.htm *)
(* See: http://cltl2.lisp.se/cltl/cltl2.html *)
(* See: http://sellout.github.io/2012/03/03/common-lisp-type-hierarchy/ *)

open DRY__Core

module Stdlib = DRY__Stdlib
module Buffer = Stdlib.Buffer
module Format = Stdlib.Format

module Comment = struct
  type t = string

  let of_string s = s

  let to_string s = s

  let print ppf s =
    Format.fprintf ppf "; %s\n" s
end

module Character = DRY__Core.Char
module Number    = DRY__Core.Number
module String    = DRY__Stdlib.String
module Symbol    = DRY__Core.Symbol

module Atom = struct
  type t =
    | Null
    | Character of Character.t
    | Number of Number.t
    | String of String.t
    | Symbol of Symbol.t

  open Format

  let of_bool b = Symbol (Symbol.of_string (if b then "t" else "nil"))
  let of_char c = Character (Character.of_char c)
  let of_float r = Number (Number.of_float r)
  let of_int z = Number (Number.of_int z)
  let of_string s = String s

  let print ppf = function
    | Null -> pp_print_string ppf "()"
    | Character c -> fprintf ppf "#\\%s" (Character.to_string c)
    | Number n -> pp_print_string ppf (Number.to_string n)
    | String s -> fprintf ppf "\"%s\"" s (* FIXME *)
    | Symbol s -> pp_print_string ppf (Symbol.to_string s)

  let to_string s = "x"
end

module Object = struct
  type t =
    | Atom of Atom.t
    | Cons of t list

  open Format

  let of_bool b   = Atom (Atom.of_bool b)
  let of_char c   = Atom (Atom.of_char c)
  let of_float r  = Atom (Atom.of_float r)
  let of_int z    = Atom (Atom.of_int z)
  let of_string s = Atom (Atom.of_string s)

  let to_string = function
    | Atom atom -> Atom.to_string atom
    | Cons _ -> "(...)"

  let rec print ppf = function
    | Atom atom -> Atom.print ppf atom
    | Cons cons ->
      pp_print_char ppf '(';
      pp_print_list ~pp_sep:pp_print_space print ppf cons;
      pp_print_char ppf ')';
end

module Expression = struct
  type t = Object.t

  let make args = Object.Cons args

  let of_bool    = Object.of_bool
  let of_char    = Object.of_char
  let of_float   = Object.of_float
  let of_int     = Object.of_int
  let of_string  = Object.of_string

  let to_string = Object.to_string

  let print = Object.print
end

module Program = struct
  type t = Expression.t list

  open Format

  let make args = args

  let print ppf code =
    pp_print_char ppf '(';
    pp_print_list ~pp_sep:pp_print_space Expression.print ppf code;
    pp_print_char ppf ')';
end

let nil = Expression.of_bool false
let t   = Expression.of_bool true

let form = Expression.make
let quote = Expression.make

let character c = Object.Atom (Atom.Character c)
let number n = Object.Atom (Atom.Number n)
let string s = Object.Atom (Atom.String s)
let symbol s = Object.Atom (Atom.Symbol s)

let of_bool   = Expression.of_bool
let of_char   = Expression.of_char
let of_float  = Expression.of_float
let of_int    = Expression.of_int
let of_string = Expression.of_string

let to_string = Expression.to_string

let print = Expression.print
