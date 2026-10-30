(** Emit OCaml source for a core-v0 program.

    The generated program has no interpreter loop: vuna functions become curried
    OCaml functions, constructors become closure builders, and pattern matching
    becomes OCaml [match] over the runtime [value] variant. Values are
    represented dynamically because core-v0 has no type checker yet; typed code
    generation comes after a type system exists. *)

exception Error of string

val generate : Ast.program -> string
(** Render a complete OCaml program (ending in a newline) that prints the [show]
    representation of [main]'s value on stdout. *)
