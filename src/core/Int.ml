(* This is free and unencumbered software released into the public domain. *)

type t =
  | Int8 of Int8.t
  | Int16 of Int16.t
  | Int32 of Int32.t
  | Int64 of Int64.t
  | Int128 of Int128.t

(* Value constructors *)

let of_char c  = Int8 (Int8.of_char c)
let of_int z   = Int64 (Int64.of_int z)
let of_int32 z = Int32 z
let of_int64 z = Int64 z

(* Lossless conversions *)

let as_int32 = function
  | Int8 z   -> Int8.as_int32 z
  | Int16 z  -> Int16.as_int32 z
  | Int32 z  -> Int32.as_int32 z
  | Int64 z  -> Int64.as_int32 z
  | Int128 z -> Int128.as_int32 z

let as_int64 = function
  | Int8 z   -> Int8.as_int64 z
  | Int16 z  -> Int16.as_int64 z
  | Int32 z  -> Int32.as_int64 z
  | Int64 z  -> Int64.as_int64 z
  | Int128 z -> Int128.as_int64 z

let as_int128 = function
  | Int8 z   -> Int8.as_int128 z
  | Int16 z  -> Int16.as_int128 z
  | Int32 z  -> Int32.as_int128 z
  | Int64 z  -> Int64.as_int128 z
  | Int128 z -> Int128.as_int128 z

(* Lossy conversions *)

let to_int8 = function
  | Int8 z   -> Int8.to_int8 z
  | Int16 z  -> Int16.to_int8 z
  | Int32 z  -> Int32.to_int8 z
  | Int64 z  -> Int64.to_int8 z
  | Int128 z -> Int128.to_int8 z

let to_int16 = function
  | Int8 z   -> Int8.to_int16 z
  | Int16 z  -> Int16.to_int16 z
  | Int32 z  -> Int32.to_int16 z
  | Int64 z  -> Int64.to_int16 z
  | Int128 z -> Int128.to_int16 z

let to_int32 = function
  | Int8 z   -> Int8.to_int32 z
  | Int16 z  -> Int16.to_int32 z
  | Int32 z  -> Int32.to_int32 z
  | Int64 z  -> Int64.to_int32 z
  | Int128 z -> Int128.to_int32 z

let to_int64 = function
  | Int8 z   -> Int8.to_int64 z
  | Int16 z  -> Int16.to_int64 z
  | Int32 z  -> Int32.to_int64 z
  | Int64 z  -> Int64.to_int64 z
  | Int128 z -> Int128.to_int64 z

let to_int128 = function
  | Int8 z   -> Int8.to_int128 z
  | Int16 z  -> Int16.to_int128 z
  | Int32 z  -> Int32.to_int128 z
  | Int64 z  -> Int64.to_int128 z
  | Int128 z -> Int128.to_int128 z

let to_string = function
  | Int8 z   -> Int8.to_string z
  | Int16 z  -> Int16.to_string z
  | Int32 z  -> Int32.to_string z
  | Int64 z  -> Int64.to_string z
  | Int128 z -> Int128.to_string z
