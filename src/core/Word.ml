(* This is free and unencumbered software released into the public domain. *)

module Stdlib = DRY__Stdlib
module String = Stdlib.String

type t =
  | Word8 of Word8.t
  | Word16 of Word16.t
  | Word32 of Word32.t
  | Word64 of Word64.t

let to_string = function
  | Word8 w   -> Word8.to_string w
  | Word16 w  -> Word16.to_string w
  | Word32 w  -> Word32.to_string w
  | Word64 w  -> Word64.to_string w

let parse_bin input =
  Error (`Msg "not implemented yet") (* TODO *)

let parse_oct input =
  Error (`Msg "not implemented yet") (* TODO *)

let parse_hex input =
  let make =
    match (String.length input) with
    | 0 -> Error (`Msg "input underflow")
    | 1 | 2 -> Ok (fun x -> Word8 (Word8.of_int64 x))
    | 3 | 4 -> Ok (fun x -> Word16 (Word16.of_int64 x))
    | 5 | 6 | 7 | 8 -> Ok (fun x -> Word32 (Word32.of_int64 x))
    | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 -> Ok (fun x -> Word64 (Word64.of_int64 x))
    | _ -> Error (`Msg "input overflow")
  in
  match make with
  | Error (`Msg s) -> Error (`Msg s)
  | Ok make ->
    begin try (Ok (Scanf.sscanf input "%LX" make)) with
    | Scanf.Scan_failure s -> Error (`Msg s)
    | End_of_file -> Error (`Msg "premature end of input")
    | Failure _ | Invalid_argument _ -> assert false
    end
