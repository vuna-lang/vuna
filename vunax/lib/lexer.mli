exception Error of Token.pos * string

val lex : string -> Token.located array
(** Tokenize a source file. Whitespace and comments are dropped; every token
    carries its 1-based line and column so that the parser can implement layout
    (offside) rules. *)
