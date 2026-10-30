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
  | DSig of string * expr
  | DFun of string * pattern list * expr

type program = decl list

let rec sexp_of_pattern = function
  | PVar x -> Printf.sprintf "(pvar %s)" x
  | PWild -> "_"
  | PCon (name, []) -> Printf.sprintf "(pcon %s)" name
  | PCon (name, args) ->
      Printf.sprintf "(pcon %s %s)" name
        (String.concat " " (List.map sexp_of_pattern args))
  | PInt n -> Printf.sprintf "(pint %d)" n
  | PStr s -> Printf.sprintf "(pstr %S)" s

and sexp_of_expr = function
  | EVar x -> Printf.sprintf "(var %s)" x
  | EInt n -> Printf.sprintf "(int %d)" n
  | EStr s -> Printf.sprintf "(str %S)" s
  | ELam (params, body) ->
      Printf.sprintf "(lam (%s) %s)" (String.concat " " params)
        (sexp_of_expr body)
  | EApp (fn, args) ->
      Printf.sprintf "(app %s%s)" (sexp_of_expr fn)
        (String.concat "" (List.map (fun arg -> " " ^ sexp_of_expr arg) args))
  | ELet (bindings, body) ->
      Printf.sprintf "(let%s %s)"
        (String.concat ""
           (List.map
              (fun (pat, value) ->
                Printf.sprintf " (bind %s %s)" (sexp_of_pattern pat)
                  (sexp_of_expr value))
              bindings))
        (sexp_of_expr body)
  | ECase (scrutinee, alts) ->
      Printf.sprintf "(case %s%s)" (sexp_of_expr scrutinee)
        (String.concat ""
           (List.map
              (fun (pat, body) ->
                Printf.sprintf " (branch %s %s)" (sexp_of_pattern pat)
                  (sexp_of_expr body))
              alts))
  | EIf (cond, yes, no) ->
      Printf.sprintf "(if %s %s %s)" (sexp_of_expr cond) (sexp_of_expr yes)
        (sexp_of_expr no)

let sexp_of_decl = function
  | DData { name; params; ctors } ->
      Printf.sprintf "(data %s (%s)%s)" name (String.concat " " params)
        (String.concat ""
           (List.map
              (fun (ctor, arity) -> Printf.sprintf " (%s %d)" ctor arity)
              ctors))
  | DSig (name, ty) -> Printf.sprintf "(sig %s %s)" name (sexp_of_expr ty)
  | DFun (name, pats, body) ->
      Printf.sprintf "(fun %s (%s) %s)" name
        (String.concat " " (List.map sexp_of_pattern pats))
        (sexp_of_expr body)

let sexp_of_program (program : program) : string =
  let buf = Buffer.create 256 in
  Buffer.add_string buf "(program";
  List.iter
    (fun decl ->
      Buffer.add_char buf '\n';
      Buffer.add_string buf "  ";
      Buffer.add_string buf (sexp_of_decl decl))
    program;
  (match program with [] -> () | _ -> Buffer.add_char buf '\n');
  Buffer.add_char buf ')';
  Buffer.contents buf
