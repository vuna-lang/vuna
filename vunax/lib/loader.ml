(** Module loading and name resolution.

    A vuna module is a file under the module root ([lib/] by default). Its
    module name is the path relative to the root with [.vuna] removed and
    separators turned into dots: [lib/Vuna/Parser.vuna] is module [Vuna.Parser].
    Imports are written at the top of a file and are direct dependencies only.
    Names of imported modules must be used fully qualified; names of the current
    module (and builtins) stay unqualified.

    [load] returns a flattened program: every module's declarations are renamed
    with their module prefix (e.g. [Vuna.Parser.parse]), and all names in
    expressions and patterns are resolved to those global names. The result can
    be evaluated or code-generated exactly like a single-file program. *)

open Ast

exception Error of string

let fail message = raise (Error message)
let is_upper c = c >= 'A' && c <= 'Z'

let valid_segment segment =
  String.length segment > 0
  && is_upper segment.[0]
  && String.for_all
       (fun c ->
         (c >= 'A' && c <= 'Z')
         || (c >= 'a' && c <= 'z')
         || (c >= '0' && c <= '9')
         || c = '_')
       segment

let validate_module_name name =
  let segments = String.split_on_char '.' name in
  if name = "" then fail "empty module name";
  List.iter
    (fun segment ->
      if not (valid_segment segment) then
        fail
          (Printf.sprintf
             "invalid module name %S: segments must match [A-Z][A-Za-z0-9_]*"
             name))
    segments

let module_path ~root name =
  let segments = String.split_on_char '.' name in
  Filename.concat root (String.concat Filename.dir_sep segments ^ ".vuna")

let parse path =
  try Parser.parse_file_with_imports path with
  | Lexer.Error (pos, message) | Parser.Error (pos, message) ->
      fail (Printf.sprintf "%s:%s: %s" path (Token.pos_to_string pos) message)
  | Sys_error message -> fail message

type ctx = {
  label : string; (* "<entry>" or the module name, for error messages *)
  prefix : string; (* "" for the entry file, the module name otherwise *)
  own : string list;
  own_ctors : string list;
  imports : string list;
  exports_of : string -> string list;
}

let top_level_names (program : program) =
  List.concat_map
    (function
      | DFun (name, _, _) -> [ name ]
      | DSig (name, _) -> [ name ]
      | DData { name = _; params = _; ctors } -> List.map fst ctors)
    program

let top_level_ctors (program : program) =
  List.concat_map
    (function
      | DData { name = _; params = _; ctors } -> List.map fst ctors | _ -> [])
    program

let check_binder label name =
  if String.contains name '.' then
    fail (Printf.sprintf "%s: invalid variable name %S" label name)

let check_top_name label name =
  if String.contains name '.' then
    fail (Printf.sprintf "%s: invalid top-level name %S" label name)

let split_qualified name =
  match List.rev (String.split_on_char '.' name) with
  | [] -> fail ("invalid name: " ^ name)
  | base :: rev_prefix -> (String.concat "." (List.rev rev_prefix), base)

let mangle ctx name = if ctx.prefix = "" then name else ctx.prefix ^ "." ^ name

let is_global_ctor name =
  name = "True" || name = "False" || name = "Cons" || name = "Nil"

let resolve_qualified ctx name =
  let prefix, base = split_qualified name in
  if not (List.mem prefix ctx.imports) then
    fail (Printf.sprintf "%s: module %s is not imported" ctx.label prefix);
  if is_global_ctor base then base
  else if List.mem base (ctx.exports_of prefix) then name
  else
    fail (Printf.sprintf "%s: %s is not exported by %s" ctx.label base prefix)

let resolve_global ctx scope name =
  if List.mem name scope then name
  else if is_global_ctor name then name
  else if String.contains name '.' then resolve_qualified ctx name
  else if List.mem name ctx.own then mangle ctx name
  else if List.mem name Eval.builtin_names then name
  else fail (Printf.sprintf "%s: unbound variable %s" ctx.label name)

let resolve_ctor ctx name =
  if is_global_ctor name then name
  else if String.contains name '.' then resolve_qualified ctx name
  else if List.mem name ctx.own_ctors then mangle ctx name
  else fail (Printf.sprintf "%s: unknown constructor %s" ctx.label name)

let rec resolve_pattern ctx pattern =
  match pattern with
  | PWild -> (PWild, [])
  | PVar name ->
      check_binder ctx.label name;
      (PVar name, [ name ])
  | PInt n -> (PInt n, [])
  | PStr s -> (PStr s, [])
  | PCon (name, patterns) ->
      let name = resolve_ctor ctx name in
      let parts = List.map (resolve_pattern ctx) patterns in
      (PCon (name, List.map fst parts), List.concat_map snd parts)

and resolve_expr ctx scope expr =
  match expr with
  | EVar name -> EVar (resolve_global ctx scope name)
  | EInt n -> EInt n
  | EStr s -> EStr s
  | ELam (params, body) ->
      List.iter (check_binder ctx.label) params;
      ELam (params, resolve_expr ctx (params @ scope) body)
  | EApp (fn, args) ->
      EApp (resolve_expr ctx scope fn, List.map (resolve_expr ctx scope) args)
  | ELet (bindings, body) -> resolve_let ctx scope bindings body
  | ECase (scrutinee, alts) ->
      ECase
        ( resolve_expr ctx scope scrutinee,
          List.map
            (fun (pattern, body) ->
              let pattern, bound = resolve_pattern ctx pattern in
              (pattern, resolve_expr ctx (bound @ scope) body))
            alts )
  | EIf (cond, yes, no) ->
      EIf
        ( resolve_expr ctx scope cond,
          resolve_expr ctx scope yes,
          resolve_expr ctx scope no )

and resolve_let ctx scope bindings body =
  let rec go scope acc = function
    | [] -> (List.rev acc, resolve_expr ctx scope body)
    | (pattern, value) :: rest ->
        let value = resolve_expr ctx scope value in
        let pattern, bound = resolve_pattern ctx pattern in
        go (bound @ scope) ((pattern, value) :: acc) rest
  in
  let bindings, body = go scope [] bindings in
  ELet (bindings, body)

let resolve_top_name ctx name =
  check_top_name ctx.label name;
  mangle ctx name

let resolve_decl ctx decl =
  match decl with
  | DData { name; params; ctors } ->
      let ctors =
        List.map
          (fun (ctor, arity) ->
            check_top_name ctx.label ctor;
            let ctor = if is_global_ctor ctor then ctor else mangle ctx ctor in
            (ctor, arity))
          ctors
      in
      DData { name; params; ctors }
  | DSig (name, ty) ->
      (* core-v0 erases types; do not resolve names inside annotations. *)
      DSig (resolve_top_name ctx name, ty)
  | DFun (name, patterns, body) ->
      let name = resolve_top_name ctx name in
      let parts = List.map (resolve_pattern ctx) patterns in
      let bound = List.concat_map snd parts in
      DFun (name, List.map fst parts, resolve_expr ctx bound body)

let resolve_program ctx program = List.map (resolve_decl ctx) program

let make_ctx ~label ~prefix ~imports ~exports_of program =
  {
    label;
    prefix;
    own = top_level_names program;
    own_ctors = top_level_ctors program;
    imports;
    exports_of;
  }

type module_info = {
  name : string;
  imports : string list;
  program : program;
  exports : string list;
}

let load ~root entry =
  let modules : (string, module_info) Hashtbl.t = Hashtbl.create 16 in
  let rec load_module stack name =
    match Hashtbl.find_opt modules name with
    | Some info -> info
    | None ->
        if List.mem name stack then
          fail
            (Printf.sprintf "import cycle: %s"
               (String.concat " -> " (List.rev (name :: stack))));
        validate_module_name name;
        let path = module_path ~root name in
        let imports, program = parse path in
        List.iter (fun dep -> ignore (load_module (name :: stack) dep)) imports;
        let info =
          { name; imports; program; exports = top_level_names program }
        in
        Hashtbl.replace modules name info;
        info
  in
  let entry_imports, entry_program = parse entry in
  List.iter (fun dep -> ignore (load_module [] dep)) entry_imports;
  let exports_of name =
    match Hashtbl.find_opt modules name with
    | Some info -> info.exports
    | None -> []
  in
  let entry_ctx =
    make_ctx ~label:"<entry>" ~prefix:"" ~imports:entry_imports ~exports_of
      entry_program
  in
  let entry_program = resolve_program entry_ctx entry_program in
  let names =
    Hashtbl.fold (fun name _ acc -> name :: acc) modules []
    |> List.sort String.compare
  in
  let module_programs =
    List.concat_map
      (fun name ->
        let info = Hashtbl.find modules name in
        let ctx =
          make_ctx ~label:info.name ~prefix:info.name ~imports:info.imports
            ~exports_of info.program
        in
        resolve_program ctx info.program)
      names
  in
  entry_program @ module_programs
