(* This is free and unencumbered software released into the public domain. *)

(** Java *)

module Identifier = DRY__Core.Symbol

module Boolean    = DRY__Core.Bool
module Char       = DRY__Core.Char
module Byte       = DRY__Core.Int8
module Short      = DRY__Core.Int16
module Int        = DRY__Core.Int32
module Long       = DRY__Core.Int64
module Float      = DRY__Core.Float32
module Double     = DRY__Core.Float64

module String     = DRY__Stdlib.String

module Comment : sig
  type t

  val create : string -> t

  val to_code : t -> string
  val to_string : t -> string
end

module Primitive : sig
  type t =
    | Boolean of Boolean.t
    | Char of Char.t
    | Byte of Byte.t
    | Short of Short.t
    | Int of Int.t
    | Long of Long.t
    | Float of Float.t
    | Double of Double.t

  val to_code : t -> string
  val to_string : t -> string
end

module PrimitiveType : sig
  type t =
    | Boolean
    | Char
    | Byte
    | Short
    | Int
    | Long
    | Float
    | Double

  val to_code : t -> string
  val to_string : t -> string
end

module Literal : sig
  type t =
    | Null
    | Primitive of Primitive.t
    | Class of Identifier.t

  val to_code : t -> string
  val to_string : t -> string
end

module InterfaceModifier : sig
  type t =
    | Public | Protected | Private
    | Static | Strictfp
    | Annotation of string

  val to_code : t -> string
  val to_string : t -> string
end

module InterfaceDecl : sig
  type t =
    { name: Identifier.t;
      modifiers: InterfaceModifier.t list;
      extends: Identifier.t list;
      comment: Comment.t option; }

  val create :
    ?comment:string ->
    ?modifiers:InterfaceModifier.t list ->
    ?extends:Identifier.t list ->
    string ->
    t

  val to_code : t -> string
  val to_string : t -> string
end

module ClassModifier : sig
  type t =
    | Public | Protected | Private
    | Abstract | Static | Final | Strictfp
    | Annotation of string

  val to_code : t -> string
  val to_string : t -> string
end

module ClassDecl : sig
  type t =
    { name: Identifier.t;
      modifiers: ClassModifier.t list;
      extends: Identifier.t option;
      implements: Identifier.t list;
      comment: Comment.t option; }

  val create :
    ?comment:string ->
    ?modifiers:ClassModifier.t list ->
    ?extends:Identifier.t ->
    ?implements:Identifier.t list ->
    string ->
    t

  val to_code : t -> string
  val to_string : t -> string
end

module TypeDecl : sig
  type t =
    | Interface of InterfaceDecl.t
    | Class of ClassDecl.t

  val to_code : t -> string
  val to_string : t -> string
end

module PackageDecl : sig
  type t =
    | Normal of string

  val to_code : t -> string
  val to_string : t -> string
end

module ImportDecl : sig
  type t =
    | Normal of string
    | Static of string

  val to_code : t -> string
  val to_string : t -> string
end

module CompilationUnit : sig
  type t =
    { package: PackageDecl.t option;
      imports: ImportDecl.t list;
      defines: TypeDecl.t;
      comment: Comment.t option; }

  val create :
    ?comment:string ->
    ?package:PackageDecl.t ->
    ?imports:ImportDecl.t list ->
    TypeDecl.t ->
    t

  val to_code : t -> string
  val to_string : t -> string
end

val null : Literal.t

val boolean : Boolean.t -> Literal.t

val char : Char.t -> Literal.t

val byte : Byte.t -> Literal.t

val short : Short.t -> Literal.t

val int : Int.t -> Literal.t

val long : Long.t -> Literal.t

val float : Float.t -> Literal.t

val double : Double.t -> Literal.t

val of_bool : bool -> Literal.t

val of_char : char -> Literal.t

val of_float : float -> Literal.t

val of_int : int -> Literal.t

val to_string : Literal.t -> string

val to_code : Literal.t -> string
