(** Call-by-value evaluator for core-v0.

    Programs are evaluated by building a global environment from the
    declarations and then evaluating the nullary definition [main]. Runtime
    errors are reported with [Error]; the AST currently carries no source
    positions, so messages have no location. *)

exception Error of string

type value

val run : Ast.program -> value
(** Build the global environment and evaluate [main]. Raises [Error] on runtime
    errors (including a missing or non-nullary [main]). *)

val run_string : Ast.program -> string
(** Like [run], but requires [main] to evaluate to a [String] and returns it
    unquoted. Used by the differential tests and the self-interpreter. *)

val show : value -> string
(** Render a value for the test harness and the CLI. *)
