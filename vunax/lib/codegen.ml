open Ast

exception Error of string

let error message = raise (Error message)

(* Builtins: (vuna name, OCaml helper name, arity). *)
let builtins =
  [
    ("+", "bi_add", 2);
    ("-", "bi_sub", 2);
    ("*", "bi_mul", 2);
    ("/", "bi_div", 2);
    ("==", "bi_eq", 2);
    ("/=", "bi_neq", 2);
    ("<", "bi_lt", 2);
    ("<=", "bi_le", 2);
    (">", "bi_gt", 2);
    (">=", "bi_ge", 2);
    ("&&", "bi_and", 2);
    ("||", "bi_or", 2);
    ("++", "bi_concat", 2);
    ("strLength", "bi_str_length", 1);
    ("strUnpack", "bi_str_unpack", 1);
    ("strPack", "bi_str_pack", 1);
    ("strFromInt", "bi_str_from_int", 1);
    ("readFile", "bi_read_file", 1);
    ("writeFile", "bi_write_file", 2);
    ("print", "bi_print", 1);
    ("getArgs", "bi_get_args", 0);
  ]

type env = {
  functions : (string * int) list;
  ctors : (string * int) list;
  builtins : (string * int) list;
}

type state = { mutable counter : int }

let fresh state prefix =
  state.counter <- state.counter + 1;
  Printf.sprintf "__%s%d" prefix state.counter

let runtime =
  {vuna_runtime|
type value =
  | VInt of int
  | VStr of string
  | VCon of string * value list
  | VFun of string * (value -> value)

let fail (msg : string) : 'a = failwith msg

let apply (fn : value) (arg : value) : value =
  match fn with
  | VFun (_, f) -> f arg
  | _ -> fail "cannot apply a non-function"

let expect_int (name : string) (v : value) : int =
  match v with VInt n -> n | _ -> fail (name ^ ": expected an Int argument")

let expect_str (name : string) (v : value) : string =
  match v with VStr s -> s | _ -> fail (name ^ ": expected a String argument")

let vbool (b : bool) : value = VCon ((if b then "True" else "False"), [])

let expect_bool (name : string) (v : value) : bool =
  match v with
  | VCon ("True", []) -> true
  | VCon ("False", []) -> false
  | _ -> fail (name ^ ": expected a Bool argument")

let rec string_to_value (s : string) : value =
  let n = String.length s in
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (VCon ("Cons", [ VInt (Char.code s.[i]); acc ]))
  in
  go (n - 1) (VCon ("Nil", []))

let value_to_string (v : value) : string =
  let buf = Buffer.create 16 in
  let rec go (v : value) =
    match v with
    | VCon ("Nil", []) -> ()
    | VCon ("Cons", [ VInt c; rest ]) ->
        if c < 0 || c > 255 then fail "strPack: character code out of range";
        Buffer.add_char buf (Char.chr c);
        go rest
    | _ -> fail "strPack expects a List Int"
  in
  go v;
  Buffer.contents buf

let list_of_strings (strings : string list) : value =
  List.fold_right
    (fun s acc -> VCon ("Cons", [ VStr s; acc ]))
    strings (VCon ("Nil", []))

let read_file (path : string) : string =
  try
    let channel = open_in_bin path in
    Fun.protect
      ~finally:(fun () -> close_in_noerr channel)
      (fun () -> really_input_string channel (in_channel_length channel))
  with Sys_error message -> fail ("readFile: " ^ message)

let write_file (path : string) (contents : string) : int =
  try
    let channel = open_out_bin path in
    Fun.protect
      ~finally:(fun () -> close_out_noerr channel)
      (fun () -> output_string channel contents);
    String.length contents
  with Sys_error message -> fail ("writeFile: " ^ message)

let print_stdout (text : string) : int =
  print_string text;
  flush stdout;
  String.length text

let get_args () : value =
  let argv = Sys.argv in
  let count = Array.length argv in
  let args =
    if count <= 1 then [] else Array.to_list (Array.sub argv 1 (count - 1))
  in
  list_of_strings args

let bi_add =
  fun a -> VFun ("+", fun b -> VInt (expect_int "+" a + expect_int "+" b))

let bi_sub =
  fun a -> VFun ("-", fun b -> VInt (expect_int "-" a - expect_int "-" b))

let bi_mul =
  fun a -> VFun ("*", fun b -> VInt (expect_int "*" a * expect_int "*" b))

let bi_div =
  fun a ->
    VFun
      ( "/",
        fun b ->
          let x = expect_int "/" a in
          let y = expect_int "/" b in
          if y = 0 then fail "division by zero" else VInt (x / y) )

let bi_eq =
  fun a ->
    VFun
      ( "==",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x = y)
          | VStr x, VStr y -> vbool (x = y)
          | _ -> fail "bad arguments for ==" )

let bi_neq =
  fun a ->
    VFun
      ( "/=",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x <> y)
          | VStr x, VStr y -> vbool (x <> y)
          | _ -> fail "bad arguments for /=" )

let bi_lt =
  fun a -> VFun ("<", fun b -> vbool (expect_int "<" a < expect_int "<" b))

let bi_le =
  fun a -> VFun ("<=", fun b -> vbool (expect_int "<=" a <= expect_int "<=" b))

let bi_gt =
  fun a -> VFun (">", fun b -> vbool (expect_int ">" a > expect_int ">" b))

let bi_ge =
  fun a -> VFun (">=", fun b -> vbool (expect_int ">=" a >= expect_int ">=" b))

let bi_and =
  fun a ->
    VFun
      ("&&", fun b -> vbool (expect_bool "&&" a && expect_bool "&&" b))

let bi_or =
  fun a ->
    VFun ("||", fun b -> vbool (expect_bool "||" a || expect_bool "||" b))

let bi_concat =
  fun a -> VFun ("++", fun b -> VStr (expect_str "++" a ^ expect_str "++" b))

let bi_str_length = fun a -> VInt (String.length (expect_str "strLength" a))

let bi_str_unpack =
  fun a -> string_to_value (expect_str "strUnpack" a)

let bi_str_pack = fun a -> VStr (value_to_string a)

let bi_str_from_int =
  fun a -> VStr (string_of_int (expect_int "strFromInt" a))

let rec show_value (v : value) : string =
  match v with
  | VInt n -> string_of_int n
  | VStr s -> "\"" ^ show_chars s 0 (String.length s) ^ "\""
  | VCon (name, []) -> name
  | VCon (name, args) ->
      "(" ^ name ^ " " ^ String.concat " " (List.map show_value args) ^ ")"
  | VFun ("", _) -> "<lambda>"
  | VFun (name, _) -> "<function " ^ name ^ ">"

and show_chars (s : string) (i : int) (n : int) : string =
  if i >= n then ""
  else
    let rest = show_chars s (i + 1) n in
    match s.[i] with
    | '"' -> "\\\"" ^ rest
    | '\\' -> "\\\\" ^ rest
    | '\n' -> "\\n" ^ rest
    | '\t' -> "\\t" ^ rest
    | '\r' -> "\\r" ^ rest
    | '\b' -> "\\b" ^ rest
    | c ->
        let code = Char.code c in
        if code >= 32 && code <= 126 then String.make 1 c ^ rest
        else Printf.sprintf "\\%03d" code ^ rest
|vuna_runtime}

let rec gen_pattern = function
  | PVar name -> ("x_" ^ name, [ name ])
  | PWild -> ("_", [])
  | PInt n -> (Printf.sprintf "VInt (%d)" n, [])
  | PStr s -> (Printf.sprintf "VStr %S" s, [])
  | PCon (name, patterns) ->
      let parts = List.map gen_pattern patterns in
      let patterns = List.map fst parts in
      let bound = List.concat_map snd parts in
      let pattern =
        match patterns with
        | [] -> Printf.sprintf "VCon (%S, [])" name
        | _ ->
            Printf.sprintf "VCon (%S, [%s])" name (String.concat "; " patterns)
      in
      (pattern, bound)

let builtin_ocaml_name name =
  match List.find_opt (fun (vuna, _, _) -> vuna = name) builtins with
  | Some (_, ocaml_name, _) -> ocaml_name
  | None -> error ("unknown builtin: " ^ name)

let gen_var env scope name =
  if List.mem name scope then "x_" ^ name
  else
    match List.assoc_opt name env.functions with
    | Some 0 -> Printf.sprintf "v_%s ()" name
    | Some _ -> Printf.sprintf "VFun (%S, v_%s)" name name
    | None -> (
        match List.assoc_opt name env.ctors with
        | Some 0 -> Printf.sprintf "VCon (%S, [])" name
        | Some _ -> Printf.sprintf "VFun (%S, mk_%s)" name name
        | None -> (
            match List.assoc_opt name env.builtins with
            | Some arity ->
                if arity = 0 then
                  Printf.sprintf "%s ()" (builtin_ocaml_name name)
                else
                  Printf.sprintf "VFun (%S, %s)" name (builtin_ocaml_name name)
            | None -> error ("unbound variable: " ^ name)))

let rec gen_lambda state env scope params body =
  match params with
  | [] -> gen_expr state env scope body
  | [ param ] ->
      Printf.sprintf "VFun (\"\", fun x_%s -> %s)" param
        (gen_expr state env (param :: scope) body)
  | param :: rest ->
      Printf.sprintf "VFun (\"\", fun x_%s -> %s)" param
        (gen_lambda state env (param :: scope) rest body)

and gen_let state env scope bindings body =
  match bindings with
  | [] -> gen_expr state env scope body
  | (pattern, value) :: rest -> (
      let value_code = gen_expr state env scope value in
      match pattern with
      | PVar name ->
          Printf.sprintf "(let x_%s = (%s) in %s)" name value_code
            (gen_let state env (name :: scope) rest body)
      | _ ->
          let tmp = fresh state "let" in
          let pattern_code, bound = gen_pattern pattern in
          Printf.sprintf
            "(let %s = (%s) in match %s with %s -> %s | _ -> fail \"let \
             pattern match failure\")"
            tmp value_code tmp pattern_code
            (gen_let state env (bound @ scope) rest body))

and gen_case state env scope scrutinee alts =
  let scrutinee_code = gen_expr state env scope scrutinee in
  let branches =
    List.map
      (fun (pattern, body) ->
        let pattern_code, bound = gen_pattern pattern in
        Printf.sprintf "| %s -> %s" pattern_code
          (gen_expr state env (bound @ scope) body))
      alts
  in
  Printf.sprintf
    "(match (%s) with\n    %s\n    | _ -> fail \"case pattern match failure\")"
    scrutinee_code
    (String.concat "\n    " branches)

and gen_expr state env scope = function
  | EInt n -> Printf.sprintf "VInt (%d)" n
  | EStr s -> Printf.sprintf "VStr %S" s
  | EVar name -> gen_var env scope name
  | ELam (params, body) -> gen_lambda state env scope params body
  | EApp (fn, args) ->
      List.fold_left
        (fun fn_code arg ->
          Printf.sprintf "(apply (%s) (%s))" fn_code
            (gen_expr state env scope arg))
        (gen_expr state env scope fn)
        args
  | ELet (bindings, body) -> gen_let state env scope bindings body
  | ECase (scrutinee, alts) -> gen_case state env scope scrutinee alts
  | EIf (cond, yes, no) ->
      Printf.sprintf
        "(match (%s) with VCon (\"True\", []) -> %s | VCon (\"False\", []) -> \
         %s | _ -> fail \"if condition is not a Bool\")"
        (gen_expr state env scope cond)
        (gen_expr state env scope yes)
        (gen_expr state env scope no)

let group_functions (program : program) =
  let table = ref [] in
  List.iter
    (function
      | DFun (name, patterns, body) ->
          let clauses =
            match List.assoc_opt name !table with
            | Some clauses -> clauses
            | None -> []
          in
          table :=
            (name, (patterns, body) :: clauses) :: List.remove_assoc name !table
      | _ -> ())
    program;
  List.rev_map (fun (name, clauses) -> (name, List.rev clauses)) !table

let arity_of name clauses =
  let arities =
    List.sort_uniq compare
      (List.map (fun (patterns, _) -> List.length patterns) clauses)
  in
  match arities with
  | [ arity ] -> arity
  | _ -> error ("clauses for " ^ name ^ " have different arities")

let collect_ctors (program : program) =
  let ctors = ref [] in
  List.iter
    (function
      | DData { name = _; params = _; ctors = declared } ->
          List.iter
            (fun (ctor, arity) ->
              if List.mem_assoc ctor !ctors then
                error ("duplicate constructor: " ^ ctor);
              ctors := (ctor, arity) :: !ctors)
            declared
      | _ -> ())
    program;
  List.rev !ctors

let gen_ctor (name, arity) =
  if arity = 0 then ""
  else
    let params = List.init arity (fun i -> Printf.sprintf "c%d" (i + 1)) in
    let value_args = String.concat "; " (List.map (fun p -> p) params) in
    let body = Printf.sprintf "VCon (%S, [%s])" name value_args in
    let rec wrap k =
      if k = arity - 1 then
        Printf.sprintf "(fun %s -> %s)" (List.nth params k) body
      else
        Printf.sprintf "(fun %s -> VFun (%S, %s))" (List.nth params k) name
          (wrap (k + 1))
    in
    Printf.sprintf "let mk_%s = %s\n" name (wrap 0)

let gen_builtin_definitions () =
  let buffer = Buffer.create 4096 in
  List.iter
    (fun (_, ocaml_name, arity) ->
      let body =
        match ocaml_name with
        | "bi_add" -> "VInt (expect_int \"+\" a + expect_int \"+\" b)"
        | "bi_sub" -> "VInt (expect_int \"-\" a - expect_int \"-\" b)"
        | "bi_mul" -> "VInt (expect_int \"*\" a * expect_int \"*\" b)"
        | "bi_div" ->
            "let x = expect_int \"/\" a in let y = expect_int \"/\" b in if y \
             = 0 then fail \"division by zero\" else VInt (x / y)"
        | "bi_eq" ->
            "match (a, b) with VInt x, VInt y -> vbool (x = y) | VStr x, VStr \
             y -> vbool (x = y) | _ -> fail \"bad arguments for ==\""
        | "bi_neq" ->
            "match (a, b) with VInt x, VInt y -> vbool (x <> y) | VStr x, VStr \
             y -> vbool (x <> y) | _ -> fail \"bad arguments for /=\""
        | "bi_lt" -> "vbool (expect_int \"<\" a < expect_int \"<\" b)"
        | "bi_le" -> "vbool (expect_int \"<=\" a <= expect_int \"<=\" b)"
        | "bi_gt" -> "vbool (expect_int \">\" a > expect_int \">\" b)"
        | "bi_ge" -> "vbool (expect_int \">=\" a >= expect_int \">=\" b)"
        | "bi_and" -> "vbool (expect_bool \"&&\" a && expect_bool \"&&\" b)"
        | "bi_or" -> "vbool (expect_bool \"||\" a || expect_bool \"||\" b)"
        | "bi_concat" -> "VStr (expect_str \"++\" a ^ expect_str \"++\" b)"
        | "bi_str_length" -> "VInt (String.length (expect_str \"strLength\" a))"
        | "bi_str_unpack" -> "string_to_value (expect_str \"strUnpack\" a)"
        | "bi_str_pack" -> "VStr (value_to_string a)"
        | "bi_str_from_int" ->
            "VStr (string_of_int (expect_int \"strFromInt\" a))"
        | "bi_read_file" -> "VStr (read_file (expect_str \"readFile\" a))"
        | "bi_write_file" ->
            "VInt (write_file (expect_str \"writeFile\" a) (expect_str \
             \"writeFile\" b))"
        | "bi_print" ->
            "let text = expect_str \"print\" a in VInt (print_stdout text)"
        | "bi_get_args" -> "get_args ()"
        | other -> error ("unhandled builtin: " ^ other)
      in
      match arity with
      | 0 ->
          Buffer.add_string buffer
            (Printf.sprintf "let %s = fun () -> %s\n" ocaml_name body)
      | 1 ->
          Buffer.add_string buffer
            (Printf.sprintf "let %s = fun a -> %s\n" ocaml_name body)
      | 2 ->
          Buffer.add_string buffer
            (Printf.sprintf "let %s = fun a -> VFun (%S, fun b -> %s)\n"
               ocaml_name
               (match
                  List.find_opt (fun (_, oc, _) -> oc = ocaml_name) builtins
                with
               | Some (vuna, _, _) -> vuna
               | None -> "")
               body)
      | _ -> error "unsupported builtin arity")
    builtins;
  Buffer.contents buffer

let gen_function state env (name, clauses) =
  let arity = arity_of name clauses in
  let params = List.init arity (fun i -> Printf.sprintf "a%d" (i + 1)) in
  let body =
    if arity = 0 then
      match clauses with
      | (_, body) :: _ -> gen_expr state env [] body
      | [] -> error ("function " ^ name ^ " has no clauses")
    else
      let branches =
        List.map
          (fun (patterns, body) ->
            if List.length patterns <> arity then
              error ("clauses for " ^ name ^ " have different arities");
            let parts = List.map gen_pattern patterns in
            let pattern_codes = List.map fst parts in
            let bound = List.concat_map snd parts in
            let pattern_code =
              if arity = 1 then List.hd pattern_codes
              else "(" ^ String.concat ", " pattern_codes ^ ")"
            in
            Printf.sprintf "| %s -> %s" pattern_code
              (gen_expr state env bound body))
          clauses
      in
      let scrutinee =
        if arity = 1 then "a1" else "(" ^ String.concat ", " params ^ ")"
      in
      Printf.sprintf
        "(match %s with\n    %s\n    | _ -> fail \"no matching clause for %s\")"
        scrutinee
        (String.concat "\n    " branches)
        name
  in
  if arity = 0 then Printf.sprintf "(fun () -> %s)" body
  else
    let rec wrap k =
      if k = arity - 1 then
        Printf.sprintf "(fun %s -> %s)" (List.nth params k) body
      else
        Printf.sprintf "(fun %s -> VFun (%S, %s))" (List.nth params k) name
          (wrap (k + 1))
    in
    wrap 0

let generate (program : program) : string =
  let functions = group_functions program in
  let ctors = collect_ctors program in
  let function_arities =
    List.map (fun (name, clauses) -> (name, arity_of name clauses)) functions
  in
  List.iter
    (fun (name, _) ->
      if List.mem_assoc name ctors then
        error ("name is both a constructor and a function: " ^ name))
    function_arities;
  (match List.assoc_opt "main" function_arities with
  | Some 0 -> ()
  | Some _ -> error "`main` must be a nullary definition"
  | None -> error "no `main` definition");
  let env =
    {
      functions = function_arities;
      ctors;
      builtins = List.map (fun (vuna, _, arity) -> (vuna, arity)) builtins;
    }
  in
  let state = { counter = 0 } in
  let buffer = Buffer.create 65536 in
  Buffer.add_string buffer runtime;
  List.iter
    (fun ctor ->
      let definition = gen_ctor ctor in
      if definition <> "" then Buffer.add_string buffer definition)
    ctors;
  Buffer.add_string buffer (gen_builtin_definitions ());
  let rec_bindings =
    List.mapi
      (fun index (name, clauses) ->
        Printf.sprintf "%s%s = %s"
          (if index = 0 then "let rec " else "and ")
          ("v_" ^ name)
          (gen_function state env (name, clauses)))
      functions
  in
  Buffer.add_string buffer (String.concat "\n" rec_bindings);
  Buffer.add_string buffer "\nlet () = print_endline (show_value (v_main ()))\n";
  Buffer.contents buffer
