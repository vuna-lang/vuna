(** Module loading and name resolution for vuna source files.

    Module root defaults to [lib/]; [Lib/A/B.vuna] is module [A.B]. See {!load}.
*)

exception Error of string

val load : root:string -> string -> Ast.program
(** [load ~root entry] parses [entry], loads its imported modules from [root]
    (detecting cycles and missing files), resolves every name and returns a
    flattened program ready for evaluation or code generation.

    Raises [Error] with a human-readable message for missing modules, invalid
    module names, cycles, unknown names and module files that fail to parse. *)
