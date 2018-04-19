(* This is free and unencumbered software released into the public domain. *)

(* See: https://docs.oracle.com/javase/specs/jls/se8/html/jls-19.html *)
(* See: https://github.com/antlr/grammars-v4/blob/master/java8/Java8.g4 *)

open DRY__Core

module Stdlib     = DRY__Stdlib
module Buffer     = Stdlib.Buffer
module List       = Stdlib.List

(* Syntactic constructs *)
module Identifier = DRY__Core.Symbol

(* Primitive data types *)
module Boolean    = DRY__Core.Bool
module Char       = DRY__Core.Char
module Byte       = DRY__Core.Int8
module Short      = DRY__Core.Int16
module Int        = DRY__Core.Int32
module Long       = DRY__Core.Int64
module Float      = DRY__Core.Float32
module Double     = DRY__Core.Float64

(* Object types *)
module String     = DRY__Stdlib.String

let sprintf = Stdlib.Printf.sprintf

module Primitive = struct
  type t =
    | Boolean of Boolean.t
    | Char of Char.t
    | Byte of Byte.t
    | Short of Short.t
    | Int of Int.t
    | Long of Long.t
    | Float of Float.t
    | Double of Double.t

  let of_bool b = Boolean (Boolean.of_bool b)

  let of_char c = Char (Char.of_char c)

  let of_float r = Double (Double.of_float r)

  let of_int z = Long (Long.of_int z)

  let to_string = function
    | Boolean b -> Boolean.to_string b
    | Char c -> Char.to_string c
    | Byte z -> Byte.to_string z
    | Short z -> Short.to_string z
    | Int z -> Int.to_string z
    | Long z -> Long.to_string z
    | Float r -> Float.to_string r
    | Double r -> Double.to_string r

  let to_code = function
    | Char c -> sprintf "'%s'" (Char.to_string c) (* FIXME *)
    | Long z -> sprintf "%sL" (Long.to_string z)
    | Float r -> sprintf "%sf" (Float.to_string r)
    | Double r -> sprintf "%sd" (Double.to_string r)
    | _ as x -> to_string x
end

module PrimitiveType = struct
  type t =
    | Boolean
    | Char
    | Byte
    | Short
    | Int
    | Long
    | Float
    | Double

  let to_string = function
    | Boolean -> "boolean"
    | Char -> "char"
    | Byte -> "byte"
    | Short -> "short"
    | Int -> "int"
    | Long -> "long"
    | Float -> "float"
    | Double -> "double"

  let to_code = to_string
end

module Literal = struct
  type t =
    | Null
    | Primitive of Primitive.t
    | Class of Identifier.t

  let of_bool b = Primitive (Primitive.of_bool b)

  let of_char c = Primitive (Primitive.of_char c)

  let of_float r = Primitive (Primitive.of_float r)

  let of_int z = Primitive (Primitive.of_int z)

  let to_string = function
    | Null -> "null"
    | Primitive x -> Primitive.to_string x
    | Class id -> sprintf "%s.class" (Identifier.to_string id)

  let to_code = function
    | Primitive x -> Primitive.to_code x
    | _ as x -> to_string x
end

module TypeDeclaration = struct
  type t =
    | Class of string
    | Interface of string

  let to_string = function
    | Class name -> sprintf "class %s" name
    | Interface name -> sprintf "interface %s" name

  let to_code (type_def : t) =
    let buffer = Buffer.create 256 in
    let print = Buffer.add_string buffer in
    begin match type_def with
    | Class name -> print "class "; print name
    | Interface name -> print "interface "; print name
    end;
    print " {\n"; (* TODO *) print "}\n";
    Buffer.contents buffer
end

module CompilationUnit = struct
  type t =
    { comment: string option;
      package: string option;
      imports: string list;
      defines: TypeDeclaration.t }

  let create comment package imports defines =
    { comment = comment;
      package = package;
      imports = imports;
      defines = defines }

  let to_string (file : t) = ""

  let to_code (file : t) =
    let buffer = Buffer.create 256 in
    let print = Buffer.add_string buffer in
    begin match file.comment with
    | None -> () | Some s -> print "/* "; print s; print "*/\n\n"
    end;
    begin match file.package with
    | None -> () | Some s -> print "package "; print s; print ";\n\n"
    end;
    List.iter (fun import -> print "import "; print import; print ";\n") file.imports;
    print (if (List.length file.imports) = 0 then "" else "\n");
    print (TypeDeclaration.to_code file.defines);
    Buffer.contents buffer
end

let null = Literal.Null

let boolean b = Literal.Primitive (Primitive.Boolean b)

let char c = Literal.Primitive (Primitive.Char c)

let byte z = Literal.Primitive (Primitive.Byte z)

let short z = Literal.Primitive (Primitive.Short z)

let int z = Literal.Primitive (Primitive.Int z)

let long z = Literal.Primitive (Primitive.Long z)

let float r = Literal.Primitive (Primitive.Float r)

let double r = Literal.Primitive (Primitive.Double r)

let of_bool = Literal.of_bool

let of_char = Literal.of_char

let of_float = Literal.of_float

let of_int = Literal.of_int

let to_string = Literal.to_string

let to_code = Literal.to_code
