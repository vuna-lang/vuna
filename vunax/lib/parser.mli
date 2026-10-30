exception Error of Token.pos * string

val parse_program_with_imports : string -> string list * Ast.program
(** Parse a module: its top-of-file [import] names plus declarations. *)

val parse_program : string -> Ast.program
(** Parse a complete source file (imports ignored). Raises [Error] on syntax
    errors. *)

val parse_file_with_imports : string -> string list * Ast.program
(** Read and parse a file, keeping its imports. *)

val parse_file : string -> Ast.program
(** Read and parse a file (imports ignored). File system errors are raised as
    [Sys_error]. *)
