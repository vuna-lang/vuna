open Ast

exception Error of string

type value =
  | VInt of int
  | VStr of string
  | VCon of string * value list
  | VFun of string * value list
  | VLam of lam
  | VBuiltin of string * value list

and lam = { params : string list; body : expr; env : env }
and env = (string * value) list

type context = {
  globals : env;
  ctor_arity : (string * int) list;
  fun_arity : (string * int) list;
  fun_clauses : (string * (pattern list * expr) list) list;
}

let error message = raise (Error message)

let builtin_names =
  [
    "+";
    "-";
    "*";
    "/";
    "==";
    "/=";
    "<";
    "<=";
    ">";
    ">=";
    "&&";
    "||";
    "++";
    "strLength";
    "strUnpack";
    "strPack";
    "strFromInt";
  ]

let builtin_arity = function
  | "+" | "-" | "*" | "/" | "==" | "/=" | "<" | "<=" | ">" | ">=" | "&&" | "||"
  | "++" ->
      2
  | "strLength" | "strUnpack" | "strPack" | "strFromInt" -> 1
  | name -> error ("unknown builtin: " ^ name)

let string_to_list s =
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (VCon ("Cons", [ VInt (Char.code s.[i]); acc ]))
  in
  go (String.length s - 1) (VCon ("Nil", []))

let list_to_string value =
  let buffer = Buffer.create 16 in
  let rec go = function
    | VCon ("Nil", []) -> ()
    | VCon ("Cons", [ VInt code; rest ]) ->
        if code < 0 || code > 255 then
          error "strPack: character code out of range";
        Buffer.add_char buffer (Char.chr code);
        go rest
    | _ -> error "strPack expects a List Int"
  in
  go value;
  Buffer.contents buffer

let rec match_pattern pattern value =
  match (pattern, value) with
  | PWild, _ -> Some []
  | PVar name, _ -> Some [ (name, value) ]
  | PInt n, VInt m when n = m -> Some []
  | PStr s, VStr t when s = t -> Some []
  | PCon (name, patterns), VCon (ctor, values)
    when name = ctor && List.length patterns = List.length values ->
      match_patterns patterns values
  | _ -> None

and match_patterns patterns values =
  let rec go patterns values acc =
    match (patterns, values) with
    | [], [] -> Some (List.rev acc)
    | pattern :: patterns, value :: values -> (
        match match_pattern pattern value with
        | None -> None
        | Some bindings -> go patterns values (List.rev_append bindings acc))
    | _ -> None
  in
  go patterns values []

let build_context (program : program) : context =
  let constructors = ref [] in
  List.iter
    (function
      | DData { name = _; params = _; ctors } ->
          List.iter
            (fun (ctor, arity) ->
              if List.mem_assoc ctor !constructors then
                error ("duplicate constructor: " ^ ctor);
              constructors := (ctor, arity) :: !constructors)
            ctors
      | _ -> ())
    program;
  let functions = ref [] in
  List.iter
    (function
      | DFun (name, patterns, body) ->
          let clauses =
            match List.assoc_opt name !functions with
            | Some clauses -> clauses
            | None -> []
          in
          functions :=
            (name, (patterns, body) :: clauses)
            :: List.remove_assoc name !functions
      | _ -> ())
    program;
  let functions =
    List.rev_map (fun (name, clauses) -> (name, List.rev clauses)) !functions
  in
  List.iter
    (fun (name, _) ->
      if List.mem_assoc name !constructors then
        error ("name is both a constructor and a function: " ^ name))
    functions;
  let fun_arity =
    List.map
      (fun (name, clauses) ->
        let arities =
          List.sort_uniq compare
            (List.map (fun (patterns, _) -> List.length patterns) clauses)
        in
        match arities with
        | [ arity ] -> (name, arity)
        | _ -> error ("clauses for " ^ name ^ " have different arities"))
      functions
  in
  let globals =
    List.map (fun (name, _) -> (name, VFun (name, []))) functions
    @ List.map (fun (ctor, _) -> (ctor, VCon (ctor, []))) !constructors
    @ List.map (fun name -> (name, VBuiltin (name, []))) builtin_names
  in
  { globals; ctor_arity = !constructors; fun_arity; fun_clauses = functions }

let rec eval ctx env expr =
  match expr with
  | EVar name -> eval_var ctx env name
  | EInt n -> VInt n
  | EStr s -> VStr s
  | ELam (params, body) -> VLam { params; body; env }
  | EApp (fn, args) ->
      let fn_value = eval ctx env fn in
      List.fold_left
        (fun fn_value arg -> apply ctx fn_value (eval ctx env arg))
        fn_value args
  | ELet (bindings, body) ->
      let env =
        List.fold_left
          (fun env (pattern, value_expr) ->
            let value = eval ctx env value_expr in
            match match_pattern pattern value with
            | Some bindings -> List.rev_append bindings env
            | None -> error "let pattern match failure")
          env bindings
      in
      eval ctx env body
  | ECase (scrutinee, alternatives) ->
      let value = eval ctx env scrutinee in
      let rec choose = function
        | [] -> error "case pattern match failure"
        | (pattern, body) :: rest -> (
            match match_pattern pattern value with
            | Some bindings -> eval ctx (List.rev_append bindings env) body
            | None -> choose rest)
      in
      choose alternatives
  | EIf (condition, yes, no) -> (
      match eval ctx env condition with
      | VCon ("True", []) -> eval ctx env yes
      | VCon ("False", []) -> eval ctx env no
      | _ -> error "if condition is not a Bool")

and apply ctx fn arg =
  match fn with
  | VFun (name, bound) -> (
      match List.assoc_opt name ctx.fun_arity with
      | None -> error ("unknown function: " ^ name)
      | Some arity ->
          let bound = bound @ [ arg ] in
          if List.length bound < arity then VFun (name, bound)
          else if List.length bound = arity then call_function ctx name bound
          else error ("function " ^ name ^ " was applied to too many arguments")
      )
  | VLam lam -> apply_lambda ctx lam arg
  | VCon (name, args) -> (
      match List.assoc_opt name ctx.ctor_arity with
      | None -> error ("unknown constructor: " ^ name)
      | Some arity ->
          if List.length args >= arity then
            error ("constructor " ^ name ^ " cannot take more arguments")
          else VCon (name, args @ [ arg ]))
  | VBuiltin (name, args) ->
      let args = args @ [ arg ] in
      let arity = builtin_arity name in
      if List.length args < arity then VBuiltin (name, args)
      else if List.length args = arity then call_builtin name args
      else error ("builtin " ^ name ^ " was applied to too many arguments")
  | VInt _ | VStr _ -> error "cannot apply a non-function"

and apply_lambda ctx lam arg =
  match lam.params with
  | [] -> error "lambda has no parameters"
  | [ param ] -> eval ctx ((param, arg) :: lam.env) lam.body
  | param :: rest ->
      VLam { params = rest; body = lam.body; env = (param, arg) :: lam.env }

and call_function ctx name args =
  match List.assoc_opt name ctx.fun_clauses with
  | None -> error ("unknown function: " ^ name)
  | Some clauses ->
      let rec try_clauses = function
        | [] -> error ("no matching clause for " ^ name)
        | (patterns, body) :: rest -> (
            if List.length patterns <> List.length args then try_clauses rest
            else
              match match_patterns patterns args with
              | Some bindings -> eval ctx bindings body
              | None -> try_clauses rest)
      in
      try_clauses clauses

and eval_var ctx env name =
  match List.assoc_opt name env with
  | Some value -> force_nullary ctx value
  | None -> (
      match List.assoc_opt name ctx.globals with
      | Some value -> force_nullary ctx value
      | None -> error ("unbound variable: " ^ name))

and force_nullary ctx value =
  match value with
  | VFun (name, []) when List.assoc_opt name ctx.fun_arity = Some 0 ->
      call_function ctx name []
  | _ -> value

and call_builtin name args =
  let int_arg = function
    | VInt n -> n
    | _ -> error ("builtin " ^ name ^ " expects an Int argument")
  in
  let string_arg = function
    | VStr s -> s
    | _ -> error ("builtin " ^ name ^ " expects a String argument")
  in
  let bool_of = function
    | VCon ("True", []) -> true
    | VCon ("False", []) -> false
    | _ -> error ("builtin " ^ name ^ " expects a Bool argument")
  in
  let bool b = VCon ((if b then "True" else "False"), []) in
  match (name, args) with
  | "+", [ a; b ] -> VInt (int_arg a + int_arg b)
  | "-", [ a; b ] -> VInt (int_arg a - int_arg b)
  | "*", [ a; b ] -> VInt (int_arg a * int_arg b)
  | "/", [ a; b ] ->
      let divisor = int_arg b in
      if divisor = 0 then error "division by zero"
      else VInt (int_arg a / divisor)
  | "==", [ VInt a; VInt b ] -> bool (a = b)
  | "==", [ VStr a; VStr b ] -> bool (a = b)
  | "/=", [ VInt a; VInt b ] -> bool (a <> b)
  | "/=", [ VStr a; VStr b ] -> bool (a <> b)
  | "<", [ a; b ] -> bool (int_arg a < int_arg b)
  | "<=", [ a; b ] -> bool (int_arg a <= int_arg b)
  | ">", [ a; b ] -> bool (int_arg a > int_arg b)
  | ">=", [ a; b ] -> bool (int_arg a >= int_arg b)
  | "&&", [ a; b ] -> bool (bool_of a && bool_of b)
  | "||", [ a; b ] -> bool (bool_of a || bool_of b)
  | "++", [ a; b ] -> VStr (string_arg a ^ string_arg b)
  | "strLength", [ a ] -> VInt (String.length (string_arg a))
  | "strUnpack", [ a ] -> string_to_list (string_arg a)
  | "strPack", [ a ] -> VStr (list_to_string a)
  | "strFromInt", [ a ] -> VStr (string_of_int (int_arg a))
  | _ -> error ("bad arguments for builtin " ^ name)

let rec show = function
  | VInt n -> string_of_int n
  | VStr s -> Printf.sprintf "%S" s
  | VCon (name, []) -> name
  | VCon (name, values) ->
      "(" ^ name ^ " " ^ String.concat " " (List.map show values) ^ ")"
  | VFun (name, _) -> "<function " ^ name ^ ">"
  | VLam _ -> "<lambda>"
  | VBuiltin (name, _) -> "<builtin " ^ name ^ ">"

let run (program : program) : value =
  let ctx = build_context program in
  match List.assoc_opt "main" ctx.globals with
  | None -> error "no `main` definition"
  | Some (VFun ("main", [])) -> (
      match List.assoc_opt "main" ctx.fun_arity with
      | Some 0 -> call_function ctx "main" []
      | _ -> error "`main` must be a nullary definition")
  | Some _ -> error "`main` must be defined by clauses"

let run_string (program : program) : string =
  match run program with
  | VStr s -> s
  | value ->
      error ("`main` did not evaluate to a String (got " ^ show value ^ ")")
