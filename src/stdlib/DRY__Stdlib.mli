(* This is free and unencumbered software released into the public domain. *)

(* See: https://github.com/ocaml/ocaml/blob/trunk/stdlib/stdlib.mli *)

include module type of struct include Pervasives end

module Arg          = Arg
module Array        = Array
module ArrayLabels  = ArrayLabels
module Bigarray     = Bigarray
module Buffer       = Buffer
module Bytes        = Bytes
module BytesLabels  = BytesLabels
module Callback     = Callback
module Char         = Char
module Complex      = Complex
module Digest       = Digest
module Ephemeron    = Ephemeron
module Filename     = Filename
(*module Float        = Float*)
module Format       = Format
module Gc           = Gc
module Genlex       = Genlex
module Hashtbl      = Hashtbl
module Int32        = Int32
module Int64        = Int64
module Lazy         = Lazy
module Lexing       = Lexing
module List         = List
module ListLabels   = ListLabels
module Map          = Map
module Marshal      = Marshal
module MoreLabels   = MoreLabels
module Nativeint    = Nativeint
module Obj          = Obj
module Oo           = Oo
module Parsing      = Parsing
module Printexc     = Printexc
module Printf       = Printf
module Queue        = Queue
module Random       = Random
module Scanf        = Scanf
(*module Seq          = Seq*)
module Set          = Set
module Sort         = Sort
module Spacetime    = Spacetime
module Stack        = Stack
module StdLabels    = StdLabels
module Stream       = Stream
module String       = String
module StringLabels = StringLabels
module Sys          = Sys
module Uchar        = Uchar
module Weak         = Weak
