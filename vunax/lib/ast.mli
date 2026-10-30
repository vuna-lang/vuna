(** Abstract syntax of core-v0.

    Types are parsed into the same expression type (see [DSig]) and erased
    before evaluation in M2; constructor arities are extracted from the arrow
    structure of constructor types. *)

type pattern =
  | PVar of string
  | PWild
  | PCon of string * pattern list
  | PInt of int
  | PStr of string

type expr =
  | EVar of string
  | EInt of int
  | EStr of string
  | ELam of string list * expr
  | EApp of expr * expr list
  | ELet of (pattern * expr) list * expr
  | ECase of expr * (pattern * expr) list
  | EIf of expr * expr * expr

type decl =
  | DData of {
      name : string;
      params : string list;
      ctors : (string * int) list;
    }
      (** Constructors are paired with their arity, e.g.
          [Cons : a -> List a -> List a] has arity 2. *)
  | DSig of string * expr  (** Type signature; [expr] is the type. *)
  | DFun of string * pattern list * expr  (** One clause of a function. *)

type program = decl list

val sexp_of_program : program -> string
(** Deterministic S-expression rendering, used by golden tests and the CLI. *)
