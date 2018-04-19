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

module Comment = struct
  type t = string

  let create s = s

  let to_code s = sprintf "/* %s */" s

  let to_string s = s
end

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

  let to_code = function
    | Boolean b -> Boolean.to_string b
    | Char c -> sprintf "'%s'" (Char.to_string c) (* FIXME *)
    | Byte z -> Byte.to_string z
    | Short z -> Short.to_string z
    | Int z -> Int.to_string z
    | Long z -> sprintf "%sL" (Long.to_string z)
    | Float r -> sprintf "%sf" (Float.to_string r)
    | Double r -> sprintf "%sd" (Double.to_string r)

  let to_string = function
    | Char c -> Char.to_string c
    | Long z -> Long.to_string z
    | Float r -> Float.to_string r
    | Double r -> Double.to_string r
    | _ as x -> to_code x
end

module PrimitiveType = struct
  type t =
    | Boolean | Char
    | Byte | Short | Int | Long
    | Float | Double

  let to_code = function
    | Boolean -> "boolean" | Char -> "char"
    | Byte -> "byte" | Short -> "short" | Int -> "int" | Long -> "long"
    | Float -> "float" | Double -> "double"

  let to_string = to_code
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

  let to_code = function
    | Null -> "null"
    | Primitive x -> Primitive.to_code x
    | Class id -> sprintf "%s.class" (Identifier.to_string id)

  let to_string = function
    | Primitive x -> Primitive.to_string x
    | _ as x -> to_code x
end

module InterfaceModifier = struct
  (* See: https://docs.oracle.com/javase/specs/jls/se8/html/jls-9.html#jls-InterfaceModifier *)

  type t =
    | Public | Protected | Private
    | Static | Strictfp
    | Annotation of string

  let to_code = function
    | Public -> "public" | Protected -> "protected" | Private -> "private"
    | Static -> "static" | Strictfp -> "strictfp"
    | Annotation s -> "@" ^ s

  let to_string = to_code
end

module InterfaceDecl = struct
  (* See: https://docs.oracle.com/javase/specs/jls/se8/html/jls-9.html#jls-InterfaceDeclaration *)

  type t =
    { name: Identifier.t;
      modifiers: InterfaceModifier.t list;
      extends: Identifier.t list;
      comment: Comment.t option; }

  let create ?(comment = "") ?(modifiers = []) ?(extends = []) name =
    { name = Identifier.of_string name;
      modifiers = modifiers;
      extends = extends;
      comment = (match comment with "" -> None | s -> Some (Comment.create comment)); }

  let to_code decl =
    let buffer = Buffer.create 256 in
    let print = Buffer.add_string buffer in
    begin match decl.comment with
    | None -> () | Some c -> print (Comment.to_code c); print "\n"
    end;
    print (String.concat " " (List.map InterfaceModifier.to_code decl.modifiers));
    print (if (List.length decl.modifiers) = 0 then "" else " ");
    print "interface ";
    print (Identifier.to_string decl.name);
    print (if (List.length decl.extends) = 0 then "" else " extends ");
    print (String.concat ", " (List.map Identifier.to_string decl.extends));
    print " {\n";
    (* TODO: decl.body *)
    print "}\n";
    Buffer.contents buffer

  let to_string = to_code
end

module ClassModifier = struct
  (* See: https://docs.oracle.com/javase/specs/jls/se8/html/jls-8.html#jls-ClassModifier *)

  type t =
    | Public | Protected | Private
    | Abstract | Static | Final | Strictfp
    | Annotation of string

  let to_code = function
    | Public -> "public" | Protected -> "protected" | Private -> "private"
    | Abstract -> "abstract" | Static -> "static" | Final -> "final" | Strictfp -> "strictfp"
    | Annotation s -> "@" ^ s

  let to_string = to_code
end

module ClassDecl = struct
  (* See: https://docs.oracle.com/javase/specs/jls/se8/html/jls-8.html#jls-ClassDeclaration *)

  type t =
    { name: Identifier.t;
      modifiers: ClassModifier.t list;
      extends: Identifier.t option;
      implements: Identifier.t list;
      comment: Comment.t option; }

  let create ?(comment = "") ?(modifiers = []) ?extends ?(implements = []) name =
    { name = Identifier.of_string name;
      modifiers = modifiers;
      extends = extends;
      implements = implements;
      comment = (match comment with "" -> None | s -> Some (Comment.create comment)); }

  let to_code decl =
    let buffer = Buffer.create 256 in
    let print = Buffer.add_string buffer in
    begin match decl.comment with
    | None -> () | Some c -> print (Comment.to_code c); print "\n"
    end;
    print (String.concat " " (List.map ClassModifier.to_code decl.modifiers));
    print (if (List.length decl.modifiers) = 0 then "" else " ");
    print "class ";
    print (Identifier.to_string decl.name);
    begin match decl.extends with
    | None -> () | Some x -> print " extends "; print (Identifier.to_string x)
    end;
    print (if (List.length decl.implements) = 0 then "" else " implements ");
    print (String.concat ", " (List.map Identifier.to_string decl.implements));
    print " {\n";
    (* TODO: decl.body *)
    print "}\n";
    Buffer.contents buffer

  let to_string = to_code
end

module TypeDecl = struct
  type t =
    | Interface of InterfaceDecl.t
    | Class of ClassDecl.t

  let to_code = function
    | Class decl -> ClassDecl.to_code decl
    | Interface decl -> InterfaceDecl.to_code decl

  let to_string = to_code
end

module PackageDecl = struct
  type t =
    | Normal of string

  let to_code = function
    | Normal s -> sprintf "package %s;\n" s

  let to_string = to_code
end

module ImportDecl = struct
  type t =
    | Normal of string
    | Static of string

  let to_code = function
    | Normal s -> sprintf "import %s;\n" s
    | Static s -> sprintf "import static %s;\n" s

  let to_string = to_code
end

module CompilationUnit = struct
  type t =
    { package: PackageDecl.t option;
      imports: ImportDecl.t list;
      defines: TypeDecl.t;
      comment: Comment.t option; }

  let create ?(comment = "") ?package ?imports defines =
    { package = package;
      imports = (match imports with None -> [] | Some x -> x);
      defines = defines;
      comment = (match comment with "" -> None | s -> Some (Comment.create comment)); }

  let to_code (file : t) =
    let buffer = Buffer.create 256 in
    let print = Buffer.add_string buffer in
    begin match file.comment with
    | None -> () | Some c -> print (Comment.to_code c); print "\n\n"
    end;
    begin match file.package with
    | None -> () | Some p -> print (PackageDecl.to_code p); print "\n"
    end;
    List.iter (fun import -> print (ImportDecl.to_code import)) file.imports;
    print (if (List.length file.imports) = 0 then "" else "\n");
    print (TypeDecl.to_code file.defines);
    Buffer.contents buffer

  let to_string = to_code
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
