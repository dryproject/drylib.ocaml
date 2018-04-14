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
  end
end

(** C *)
module C = struct
  (* TODO *)
end

(** C++ *)
module Cpp = struct
  (* TODO *)
end

(** D *)
module D = struct
  (* TODO *)
end

(** Dart *)
module Dart = struct
  (* TODO *)
end

(** Elixir *)
module Elixir = struct
  (* TODO *)
end

(** Go *)
module Go = struct
  (* TODO *)
end

(** Java *)
module Java = struct
  (* TODO *)
end

(** Julia *)
module Julia = struct
  (* TODO *)
end

(** JS *)
module JS = struct
  (* TODO *)
end

(** Kotlin *)
module Kotlin = struct
  (* TODO *)
end

(** Common Lisp *)
module Lisp = struct
  (* TODO *)
end

(** Lua *)
module Lua = struct
  (* TODO *)
end

(** OCaml *)
module OCaml = struct
  (* TODO *)
end

(** PHP *)
module PHP = struct
  (* TODO *)
end

(** Python *)
module Python = struct
  (* TODO *)
end

(** Ruby *)
module Ruby = struct
  (* TODO *)
end

(** Rust *)
module Rust = struct
  (* TODO *)
end
