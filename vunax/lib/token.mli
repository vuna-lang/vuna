(** Source positions and lexer tokens for the core-v0 surface syntax. *)

type pos = { line : int; col : int }

type t =
  | Ident of string
  | Kw of string
  | Int of int
  | Str of string
  | Sym of string
  | Eof

type located = { tok : t; pos : pos }

val pos_to_string : pos -> string
(** Human-readable [line:col]. *)

val to_string : t -> string
(** Description used in parser error messages. *)
