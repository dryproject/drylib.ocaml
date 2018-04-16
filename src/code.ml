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
  (* See: http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf *)
  (* See: https://github.com/jhjourdan/C11parser *)
  (* See: https://github.com/antlr/grammars-v4/blob/master/c/C.g4 *)
  (* See: http://www.quut.com/c/ANSI-C-grammar-y.html *)

  (* TODO *)
end

(** C++ *)
module Cpp = struct
  (* See: https://isocpp.org/std/the-standard *)
  (* See: https://github.com/antlr/grammars-v4/blob/master/cpp/CPP14.g4 *)
  (* See: http://www.nongnu.org/hcb/ *)

  (* TODO *)
end

(** D *)
module D = struct
  (* See: https://dlang.org/spec/grammar.html *)

  (* TODO *)
end

(** Dart *)
module Dart = struct
  (* See: https://www.dartlang.org/guides/language/spec *)
  (* See: https://github.com/chalin/dart-spec-and-grammar *)

  (* TODO *)
end

(** Elixir *)
module Elixir = struct
  (* See: https://hexdocs.pm/elixir/master/syntax-reference.html *)
  (* See: https://hexdocs.pm/elixir/master/Kernel.SpecialForms.html *)
  (* See: https://hexdocs.pm/elixir/master/Kernel.html *)
  (* See: https://github.com/elixir-lang/elixir/blob/master/lib/elixir/src/elixir_parser.yrl *)

  (* TODO *)
end

(** Go *)
module Go = struct
  (* See: https://golang.org/ref/spec *)
  (* See: https://github.com/antlr/grammars-v4/blob/master/golang/Golang.g4 *)

  (* TODO *)
end

(** Java *)
module Java = struct
  (* See: https://docs.oracle.com/javase/specs/jls/se8/html/jls-19.html *)
  (* See: https://github.com/antlr/grammars-v4/blob/master/java8/Java8.g4 *)

  (* TODO *)
end

(** Julia *)
module Julia = struct
  (* See: *)
  (* See: https://github.com/JuliaLang/julia/blob/master/src/julia-parser.scm *)
  (* See: https://github.com/JuliaLang/JuliaParser.jl *)

  (* TODO *)
end

(** JS *)
module JS = struct
  (* See: https://en.wikipedia.org/wiki/JavaScript_syntax *)
  (* See: https://www.ecma-international.org/ecma-262/8.0/ *)
  (* See: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar *)

  (* TODO *)
end

(** Kotlin *)
module Kotlin = struct
  (* See: https://kotlinlang.org/docs/reference/grammar.html *)
  (* See: https://github.com/JetBrains/kotlin/tree/master/grammar *)
  (* See: https://jetbrains.github.io/kotlin-spec/ *)

  (* TODO *)
end

(** Common Lisp *)
module Lisp = struct
  (* See: http://www.lispworks.com/documentation/lw70/CLHS/Body/02_.htm *)

  (* TODO *)
end

(** Lua *)
module Lua = struct
  (* See: https://www.lua.org/manual/5.3/manual.html#9 *)
  (* See: http://lua4z.com/doc/manual/syntax.md.html *)
  (* See: http://lua-users.org/wiki/LuaGrammar *)

  (* TODO *)
end

(** OCaml *)
module OCaml = struct
  (* See: https://caml.inria.fr/pub/docs/manual-ocaml/language.html *)
  (* See: https://askra.de/software/ocaml-doc/4.02/full-grammar.html *)
  (* See: https://github.com/ocaml/ocaml/tree/trunk/parsing *)

  (* TODO *)
end

(** PHP *)
module PHP = struct
  (* See: https://github.com/php/php-langspec/blob/master/spec/09-lexical-structure.md *)
  (* See: https://github.com/php/php-src/blob/master/Zend/zend_language_parser.y *)
  (* See: https://github.com/php/php-src/blob/master/Zend/zend_language_scanner.l *)
  (* See: https://github.com/nikic/PHP-Parser/blob/master/grammar/php7.y *)
  (* See: https://github.com/antlr/grammars-v4/blob/master/php/PhpParser.g4 *)

  (* TODO *)
end

(** Python *)
module Python = struct
  (* See: https://docs.python.org/3/reference/grammar.html *)
  (* See: https://github.com/python/cpython/blob/master/Grammar/Grammar *)

  (* TODO *)
end

(** Ruby *)
module Ruby = struct
  (* See: https://github.com/Ruby/Ruby/blob/trunk/parse.y *)
  (* See: https://stackoverflow.com/q/663027 *)

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
  (* See: https://doc.rust-lang.org/grammar.html *)
  (* See: https://github.com/rust-lang/rust/tree/master/src/grammar *)

  (* TODO *)
end
