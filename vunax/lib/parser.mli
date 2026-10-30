exception Error of Token.pos * string

val parse_program : string -> Ast.program
(** Parse a complete source file. Raises [Error] on syntax errors. *)

val parse_file : string -> Ast.program
(** Read and parse a file. File system errors are raised as [Sys_error]. *)
