
let vuna_fail file line col msg =
  if line = 0 then failwith msg

else failwith (file ^ ":" ^ string_of_int line ^ ":" ^ string_of_int col ^ ": " ^ msg)
let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith "division by zero"
else a / b
let bi_eq a b = a = b
let bi_neq a b = a <> b
let bi_lt a b = a < b
let bi_le a b = a <= b
let bi_gt a b = a > b
let bi_ge a b = a >= b
let bi_eq_int (a : int) (b : int) = a = b
let bi_neq_int (a : int) (b : int) = a <> b
let bi_lt_int (a : int) (b : int) = a < b
let bi_le_int (a : int) (b : int) = a <= b
let bi_gt_int (a : int) (b : int) = a > b
let bi_ge_int (a : int) (b : int) = a >= b
let bi_eq_str (a : string) (b : string) = a = b
let bi_neq_str (a : string) (b : string) = a <> b
let bi_eq_bool (a : bool) (b : bool) = a = b
let bi_neq_bool (a : bool) (b : bool) = a <> b
let bi_and a b = a && b
let bi_or a b = a || b
let bi_concat a b = a ^ b
let bi_str_length a = String.length a
let bi_str_unpack s =
  let rec go i acc =
    if i < 0 then acc

else go (i - 1) (Char.code s.[i] :: acc)
  in
  go (String.length s - 1) []
let bi_str_pack cs =
  let buf = Buffer.create 16 in
  let rec go = function
    | [] -> ()
    | c :: rest -> Buffer.add_char buf (Char.chr c); go rest
  in
  go cs;
  Buffer.contents buf
let bi_str_from_int n = string_of_int n
let bi_read_file path =
  try
    let ch = open_in_bin path in
    Fun.protect ~finally:(fun () -> close_in_noerr ch)
      (fun () -> really_input_string ch (in_channel_length ch))
  with Sys_error msg -> failwith ("readFile: " ^ msg)
let bi_write_file path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith ("writeFile: " ^ msg)
let bi_print s = print_string s; flush stdout; String.length s
let bi_file_exists path = Sys.file_exists path
let bi_exit n = exit n
let bi_get_args () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then []
else Array.to_list (Array.sub argv 1 (n - 1))
let show_ctor name args = if args = [] then name
else "(" ^ name ^ " " ^ String.concat " " args ^ ")"
let show_vbool b = if b then "True"
else "False"
let show_vstring s =
  let buf = Buffer.create 16 in
  Buffer.add_char buf (Char.chr 34);
  String.iter (fun c ->
    let n = Char.code c in
    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))

  else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))

  else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "n")

  else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "t")

  else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "r")

  else Buffer.add_char buf c) s;
  Buffer.add_char buf (Char.chr 34);
  Buffer.contents buf
let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =
  match v with
  | [] -> "Nil"
  | x :: xs -> "(Cons " ^ show_elem x ^ " " ^ show_vlist show_elem xs ^ ")"

type   t_Lint_dEdit =
    C_Lint_dEdit of (int) * (int) * ((string) list)
and   t_Lint_dFinding =
    C_Lint_dFinding of (int) * (int) * (string) * (string) * ((t_Lint_dEdit) t_Vuna_dBase_dMaybe)
and   t_Lint_dLitBranch =
    C_Lint_dLitBranch of (string) * (string)
and   t_Lint_dIfHead =
    C_Lint_dIfHead of (string) * (string) * (string)
and   t_Lint_dEnclosing =
    C_Lint_dEnclosing of (int) * ((t_Vuna_dLexer_dPTok) list) * (string)
and   t_Lint_dCaseBody =
    C_Lint_dCaseBody of (int) * ((string) list)
and   t_Vuna_dTypecheck_dTy =
    C_Vuna_dTypecheck_dTVar of (int)
  | C_Vuna_dTypecheck_dTCon of (string) * ((t_Vuna_dTypecheck_dTy) list)
  | C_Vuna_dTypecheck_dTFun of (t_Vuna_dTypecheck_dTy) * (t_Vuna_dTypecheck_dTy)
and   t_Vuna_dTypecheck_dScheme =
    C_Vuna_dTypecheck_dScheme of ((int) list) * (t_Vuna_dTypecheck_dTy)
and   t_Vuna_dTypecheck_dTC =
    C_Vuna_dTypecheck_dTC of (int) * (((int, t_Vuna_dTypecheck_dTy) t_Vuna_dBase_dPair) list)
and   t_Vuna_dTypecheck_dEExpr =
    C_Vuna_dTypecheck_dXEVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEStr of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXELam of ((string) list) * (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEApp of (t_Vuna_dTypecheck_dEExpr) * ((t_Vuna_dTypecheck_dEExpr) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXECmp of (string) * ((t_Vuna_dTypecheck_dEExpr) list) * (t_Vuna_dTypecheck_dTy)
* (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXELet of (((t_Vuna_dAst_dPat, t_Vuna_dTypecheck_dEExpr) t_Vuna_dBase_dPair) list)
* (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXECase of (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dTy) * (((t_Vuna_dAst_dPat,
      t_Vuna_dTypecheck_dEExpr) t_Vuna_dBase_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEIf of (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dEExpr)
* (t_Vuna_dBase_dSpan)
and   t_Vuna_dCodegen_dBuiltinInfo =
    C_Vuna_dCodegen_dBuiltinInfo of (string) * (string) * (int) * (string)
and   t_Vuna_dEval_dValue =
    C_Vuna_dEval_dVInt of (int)
  | C_Vuna_dEval_dVStr of (string)
  | C_Vuna_dEval_dVCon of (string) * ((t_Vuna_dEval_dValue) list)
  | C_Vuna_dEval_dVFun of (string) * ((t_Vuna_dEval_dValue) list)
  | C_Vuna_dEval_dVLam of ((string) list) * (t_Vuna_dAst_dExpr) * (((string, t_Vuna_dEval_dValue) t_Vuna_dBase_dPair)
  list)
  | C_Vuna_dEval_dVBuiltin of (string) * ((t_Vuna_dEval_dValue) list)
and   t_Vuna_dLoader_dModule =
    C_Vuna_dLoader_dModule of (string) * ((t_Vuna_dAst_dImport) list) * ((t_Vuna_dAst_dDecl) list) * ((string)
  list)
and   t_Vuna_dParser_dPState =
    C_Vuna_dParser_dPState of (string) * ((t_Vuna_dLexer_dPTok) list) * (t_Vuna_dBase_dPos)
and   t_Vuna_dLexer_dTok =
    C_Vuna_dLexer_dTIdent of (string)
  | C_Vuna_dLexer_dTKw of (string)
  | C_Vuna_dLexer_dTInt of (int)
  | C_Vuna_dLexer_dTStr of (string)
  | C_Vuna_dLexer_dTSym of (string)
  | C_Vuna_dLexer_dTEof
and   t_Vuna_dLexer_dPTok =
    C_Vuna_dLexer_dPTok of (t_Vuna_dLexer_dTok) * (t_Vuna_dBase_dPos)
and   t_Vuna_dLexer_dChars =
    C_Vuna_dLexer_dChars of ((int) list) * (t_Vuna_dBase_dPos)
and   t_Vuna_dAst_dPat =
    C_Vuna_dAst_dPVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPWild of (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPCon of (string) * ((t_Vuna_dAst_dPat) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPStr of (string) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dExpr =
    C_Vuna_dAst_dEVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEStr of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dELam of ((string) list) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEApp of (t_Vuna_dAst_dExpr) * ((t_Vuna_dAst_dExpr) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dELet of (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair) list) * (t_Vuna_dAst_dExpr)
* (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dECase of (t_Vuna_dAst_dExpr) * (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair)
  list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEIf of (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dCtor =
    C_Vuna_dAst_dCtor of (string) * (t_Vuna_dAst_dExpr) * (int) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dDecl =
    C_Vuna_dAst_dDData of (string) * ((string) list) * ((t_Vuna_dAst_dCtor) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDSig of (string) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDFun of (string) * ((t_Vuna_dAst_dPat) list) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dImport =
    C_Vuna_dAst_dImport of (string) * (bool) * ((string) t_Vuna_dBase_dMaybe) * (t_Vuna_dBase_dSpan)
and   'p0 t_Vuna_dBase_dResult =
    C_Vuna_dBase_dOk of ('p0)
  | C_Vuna_dBase_dErr of (string)
and   'p0 t_Vuna_dBase_dMaybe =
    C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust of ('p0)
and   ('p0, 'p1) t_Vuna_dBase_dPair =
    C_Vuna_dBase_dPair of ('p0) * ('p1)
and   t_Vuna_dBase_dPos =
    C_Vuna_dBase_dPos of (int) * (int)
and   t_Vuna_dBase_dSpan =
    C_Vuna_dBase_dSpan of (string) * (int) * (int) * (int) * (int)

let rec show_Lint_dEdit v =
  match v with
  | C_Lint_dEdit (f0, f1, f2) -> show_ctor "Edit" [(string_of_int) f0; (string_of_int) f1; ((fun v ->
    let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f2]
and show_Lint_dFinding v =
  match v with
  | C_Lint_dFinding (f0, f1, f2, f3, f4) -> show_ctor "Finding" [(string_of_int) f0; (string_of_int) f1;
(show_vstring) f2; (show_vstring) f3; ((show_Vuna_dBase_dMaybe show_Lint_dEdit)) f4]
and show_Lint_dLitBranch v =
  match v with
  | C_Lint_dLitBranch (f0, f1) -> show_ctor "LitBranch" [(show_vstring) f0; (show_vstring) f1]
and show_Lint_dIfHead v =
  match v with
  | C_Lint_dIfHead (f0, f1, f2) -> show_ctor "IfHead" [(show_vstring) f0; (show_vstring) f1; (show_vstring)
f2]
and show_Lint_dEnclosing v =
  match v with
  | C_Lint_dEnclosing (f0, f1, f2) -> show_ctor "Enclosing" [(string_of_int) f0; ((fun v -> let rec go
    = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dLexer_dPTok) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_vstring) f2]
and show_Lint_dCaseBody v =
  match v with
  | C_Lint_dCaseBody (f0, f1) -> show_ctor "CaseBody" [(string_of_int) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
and show_Vuna_dTypecheck_dTy v =
  match v with
  | C_Vuna_dTypecheck_dTVar f0 -> show_ctor "TVar" [(string_of_int) f0]
  | C_Vuna_dTypecheck_dTCon (f0, f1) -> show_ctor "TCon" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dTy) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dTypecheck_dTFun (f0, f1) -> show_ctor "TFun" [(show_Vuna_dTypecheck_dTy) f0; (show_Vuna_dTypecheck_dTy)
f1]
and show_Vuna_dTypecheck_dScheme v =
  match v with
  | C_Vuna_dTypecheck_dScheme (f0, f1) -> show_ctor "Scheme" [((fun v -> let rec go = function [] -> "Nil"
    | x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dTypecheck_dTy) f1]
and show_Vuna_dTypecheck_dTC v =
  match v with
  | C_Vuna_dTypecheck_dTC (f0, f1) -> show_ctor "TC" [(string_of_int) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair string_of_int show_Vuna_dTypecheck_dTy))
    x ^ " " ^ go xs ^ ")" in
    go v)) f1]
and show_Vuna_dTypecheck_dEExpr v =
  match v with
  | C_Vuna_dTypecheck_dXEVar (f0, f1) -> show_ctor "XEVar" [(show_vstring) f0; (show_Vuna_dBase_dSpan)
f1]
  | C_Vuna_dTypecheck_dXEInt (f0, f1) -> show_ctor "XEInt" [(string_of_int) f0; (show_Vuna_dBase_dSpan)
f1]
  | C_Vuna_dTypecheck_dXEStr (f0, f1) -> show_ctor "XEStr" [(show_vstring) f0; (show_Vuna_dBase_dSpan)
f1]
  | C_Vuna_dTypecheck_dXELam (f0, f1, f2) -> show_ctor "XELam" [((fun v -> let rec go = function [] ->
    "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dTypecheck_dEExpr) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dTypecheck_dXEApp (f0, f1, f2) -> show_ctor "XEApp" [(show_Vuna_dTypecheck_dEExpr) f0; ((fun
    v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dEExpr) x ^ " "
    ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dTypecheck_dXECmp (f0, f1, f2, f3) -> show_ctor "XECmp" [(show_vstring) f0; ((fun v -> let
    rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dEExpr) x ^ " " ^ go xs
    ^ ")" in
    go v)) f1; (show_Vuna_dTypecheck_dTy) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXELet (f0, f1, f2) -> show_ctor "XELet" [((fun v -> let rec go = function [] ->
    "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dTypecheck_dEExpr))
    x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dTypecheck_dEExpr) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dTypecheck_dXECase (f0, f1, f2, f3) -> show_ctor "XECase" [(show_Vuna_dTypecheck_dEExpr) f0;
(show_Vuna_dTypecheck_dTy) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair
        show_Vuna_dAst_dPat show_Vuna_dTypecheck_dEExpr)) x ^ " " ^ go xs ^ ")" in
    go v)) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXEIf (f0, f1, f2, f3) -> show_ctor "XEIf" [(show_Vuna_dTypecheck_dEExpr) f0; (show_Vuna_dTypecheck_dEExpr)
f1; (show_Vuna_dTypecheck_dEExpr) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dCodegen_dBuiltinInfo v =
  match v with
  | C_Vuna_dCodegen_dBuiltinInfo (f0, f1, f2, f3) -> show_ctor "BuiltinInfo" [(show_vstring) f0; (show_vstring)
f1; (string_of_int) f2; (show_vstring) f3]
and show_Vuna_dEval_dValue v =
  match v with
  | C_Vuna_dEval_dVInt f0 -> show_ctor "VInt" [(string_of_int) f0]
  | C_Vuna_dEval_dVStr f0 -> show_ctor "VStr" [(show_vstring) f0]
  | C_Vuna_dEval_dVCon (f0, f1) -> show_ctor "VCon" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dEval_dVFun (f0, f1) -> show_ctor "VFun" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dEval_dVLam (f0, f1, f2) -> show_ctor "VLam" [((fun v -> let rec go = function [] -> "Nil"
    | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dAst_dExpr) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs ->
    "(Cons " ^ ((show_Vuna_dBase_dPair show_vstring show_Vuna_dEval_dValue)) x ^ " " ^ go xs ^ ")" in
    go v)) f2]
  | C_Vuna_dEval_dVBuiltin (f0, f1) -> show_ctor "VBuiltin" [(show_vstring) f0; ((fun v -> let rec go
    = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
and show_Vuna_dLoader_dModule v =
  match v with
  | C_Vuna_dLoader_dModule (f0, f1, f2, f3) -> show_ctor "Module" [(show_vstring) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dImport) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl)
    x ^ " " ^ go xs ^ ")" in
    go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x
    ^ " " ^ go xs ^ ")" in
    go v)) f3]
and show_Vuna_dParser_dPState v =
  match v with
  | C_Vuna_dParser_dPState (f0, f1, f2) -> show_ctor "PState" [(show_vstring) f0; ((fun v -> let rec go
    = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dLexer_dPTok) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dPos) f2]
and show_Vuna_dLexer_dTok v =
  match v with
  | C_Vuna_dLexer_dTIdent f0 -> show_ctor "TIdent" [(show_vstring) f0]
  | C_Vuna_dLexer_dTKw f0 -> show_ctor "TKw" [(show_vstring) f0]
  | C_Vuna_dLexer_dTInt f0 -> show_ctor "TInt" [(string_of_int) f0]
  | C_Vuna_dLexer_dTStr f0 -> show_ctor "TStr" [(show_vstring) f0]
  | C_Vuna_dLexer_dTSym f0 -> show_ctor "TSym" [(show_vstring) f0]
  | C_Vuna_dLexer_dTEof -> "TEof"
and show_Vuna_dLexer_dPTok v =
  match v with
  | C_Vuna_dLexer_dPTok (f0, f1) -> show_ctor "PTok" [(show_Vuna_dLexer_dTok) f0; (show_Vuna_dBase_dPos)
f1]
and show_Vuna_dLexer_dChars v =
  match v with
  | C_Vuna_dLexer_dChars (f0, f1) -> show_ctor "Chars" [((fun v -> let rec go = function [] -> "Nil" |
    x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dBase_dPos) f1]
and show_Vuna_dAst_dPat v =
  match v with
  | C_Vuna_dAst_dPVar (f0, f1) -> show_ctor "PVar" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPWild f0 -> show_ctor "PWild" [(show_Vuna_dBase_dSpan) f0]
  | C_Vuna_dAst_dPCon (f0, f1, f2) -> show_ctor "PCon" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dPInt (f0, f1) -> show_ctor "PInt" [(string_of_int) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPStr (f0, f1) -> show_ctor "PStr" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
and show_Vuna_dAst_dExpr v =
  match v with
  | C_Vuna_dAst_dEVar (f0, f1) -> show_ctor "EVar" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dEInt (f0, f1) -> show_ctor "EInt" [(string_of_int) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dEStr (f0, f1) -> show_ctor "EStr" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dELam (f0, f1, f2) -> show_ctor "ELam" [((fun v -> let rec go = function [] -> "Nil" |
    x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEApp (f0, f1, f2) -> show_ctor "EApp" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dExpr) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dELet (f0, f1, f2) -> show_ctor "ELet" [((fun v -> let rec go = function [] -> "Nil" |
    x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr)) x ^ " " ^
    go xs ^ ")" in
    go v)) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dECase (f0, f1, f2) -> show_ctor "ECase" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr))
    x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEIf (f0, f1, f2, f3) -> show_ctor "EIf" [(show_Vuna_dAst_dExpr) f0; (show_Vuna_dAst_dExpr)
f1; (show_Vuna_dAst_dExpr) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dAst_dCtor v =
  match v with
  | C_Vuna_dAst_dCtor (f0, f1, f2, f3) -> show_ctor "Ctor" [(show_vstring) f0; (show_Vuna_dAst_dExpr)
f1; (string_of_int) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dAst_dDecl v =
  match v with
  | C_Vuna_dAst_dDData (f0, f1, f2, f3) -> show_ctor "DData" [(show_vstring) f0; ((fun v -> let rec go
    = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dCtor)
    x ^ " " ^ go xs ^ ")" in
    go v)) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dDSig (f0, f1, f2) -> show_ctor "DSig" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1;
(show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dDFun (f0, f1, f2, f3) -> show_ctor "DFun" [(show_vstring) f0; ((fun v -> let rec go =
    function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dAst_dExpr) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dAst_dImport v =
  match v with
  | C_Vuna_dAst_dImport (f0, f1, f2, f3) -> show_ctor "Import" [(show_vstring) f0; (show_vbool) f1; ((show_Vuna_dBase_dMaybe
    show_vstring)) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dBase_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dBase_dResult -> string = fun s0 v
-> match v with
  | C_Vuna_dBase_dOk f0 -> show_ctor "Ok" [(s0) f0]
  | C_Vuna_dBase_dErr f0 -> show_ctor "Err" [(show_vstring) f0]
and show_Vuna_dBase_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dBase_dMaybe -> string = fun s0 v ->
match v with
  | C_Vuna_dBase_dNothing -> "Nothing"
  | C_Vuna_dBase_dJust f0 -> show_ctor "Just" [(s0) f0]
and show_Vuna_dBase_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dBase_dPair
-> string = fun s0 s1 v -> match v with
  | C_Vuna_dBase_dPair (f0, f1) -> show_ctor "Pair" [(s0) f0; (s1) f1]
and show_Vuna_dBase_dPos v =
  match v with
  | C_Vuna_dBase_dPos (f0, f1) -> show_ctor "Pos" [(string_of_int) f0; (string_of_int) f1]
and show_Vuna_dBase_dSpan v =
  match v with
  | C_Vuna_dBase_dSpan (f0, f1, f2, f3, f4) -> show_ctor "Span" [(show_vstring) f0; (string_of_int) f1;
(string_of_int) f2; (string_of_int) f3; (string_of_int) f4]

let v_usage = "usage:
  vuna compile [--no-print] [--no-typecheck] [--typecheck] [--typed] [--root DIR]... <entry.vuna> [out.ml]
  vuna check [--root DIR]... <entry.vuna>
  vuna lint [--fix] <file.vuna>...
  vuna interp [--root DIR]... <file.vuna>
  vuna help
"

let v_help = fun () -> (let _ = bi_print v_usage in
  0)

let v_usageError = fun () -> (let _ = bi_print v_usage in
  2)

let rec v_printWarnings = fun a0 -> match a0 with
  | ([]) -> 0
  | ((w) :: (rest)) -> (let _ = bi_print (((w) ^ ("\n"))) in
  v_printWarnings rest)
  | _ -> vuna_fail "app/Main.vuna" 84 1 ("no matching clause for printWarnings")

let v_Lint_deditStart = fun a0 -> match a0 with
  | (C_Lint_dEdit (start, stop, lines)) -> start
  | _ -> vuna_fail "app/Lint.vuna" 25 1 ("no matching clause for Lint.editStart")

let v_Lint_deditEnd = fun a0 -> match a0 with
  | (C_Lint_dEdit (start, stop, lines)) -> stop
  | _ -> vuna_fail "app/Lint.vuna" 27 1 ("no matching clause for Lint.editEnd")

let v_Lint_deditLines = fun a0 -> match a0 with
  | (C_Lint_dEdit (start, stop, lines)) -> lines
  | _ -> vuna_fail "app/Lint.vuna" 29 1 ("no matching clause for Lint.editLines")

let v_Lint_dfindingLine = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> line
  | _ -> vuna_fail "app/Lint.vuna" 31 1 ("no matching clause for Lint.findingLine")

let v_Lint_dfindingCol = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> col
  | _ -> vuna_fail "app/Lint.vuna" 33 1 ("no matching clause for Lint.findingCol")

let v_Lint_dfindingRule = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> rule
  | _ -> vuna_fail "app/Lint.vuna" 35 1 ("no matching clause for Lint.findingRule")

let v_Lint_dfindingMessage = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> message
  | _ -> vuna_fail "app/Lint.vuna" 37 1 ("no matching clause for Lint.findingMessage")

let v_Lint_dfindingEdit = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> edit
  | _ -> vuna_fail "app/Lint.vuna" 39 1 ("no matching clause for Lint.findingEdit")

let v_Lint_dlitText = fun a0 -> match a0 with
  | (C_Lint_dLitBranch (text, expr)) -> text
  | _ -> vuna_fail "app/Lint.vuna" 41 1 ("no matching clause for Lint.litText")

let v_Lint_dlitExpr = fun a0 -> match a0 with
  | (C_Lint_dLitBranch (text, expr)) -> expr
  | _ -> vuna_fail "app/Lint.vuna" 43 1 ("no matching clause for Lint.litExpr")

let v_Lint_dheadName = fun a0 -> match a0 with
  | (C_Lint_dIfHead (name, text, expr)) -> name
  | _ -> vuna_fail "app/Lint.vuna" 45 1 ("no matching clause for Lint.headName")

let v_Lint_dheadText = fun a0 -> match a0 with
  | (C_Lint_dIfHead (name, text, expr)) -> text
  | _ -> vuna_fail "app/Lint.vuna" 47 1 ("no matching clause for Lint.headText")

let v_Lint_dheadExpr = fun a0 -> match a0 with
  | (C_Lint_dIfHead (name, text, expr)) -> expr
  | _ -> vuna_fail "app/Lint.vuna" 49 1 ("no matching clause for Lint.headExpr")

let v_Lint_denclosingLine = fun a0 -> match a0 with
  | (C_Lint_dEnclosing (line, toks, kind)) -> line
  | _ -> vuna_fail "app/Lint.vuna" 51 1 ("no matching clause for Lint.enclosingLine")

let v_Lint_denclosingToks = fun a0 -> match a0 with
  | (C_Lint_dEnclosing (line, toks, kind)) -> toks
  | _ -> vuna_fail "app/Lint.vuna" 53 1 ("no matching clause for Lint.enclosingToks")

let v_Lint_denclosingKind = fun a0 -> match a0 with
  | (C_Lint_dEnclosing (line, toks, kind)) -> kind
  | _ -> vuna_fail "app/Lint.vuna" 55 1 ("no matching clause for Lint.enclosingKind")

let v_Lint_dcaseBodyEnd = fun a0 -> match a0 with
  | (C_Lint_dCaseBody (stop, lines)) -> stop
  | _ -> vuna_fail "app/Lint.vuna" 57 1 ("no matching clause for Lint.caseBodyEnd")

let v_Lint_dcaseBodyLines = fun a0 -> match a0 with
  | (C_Lint_dCaseBody (stop, lines)) -> lines
  | _ -> vuna_fail "app/Lint.vuna" 59 1 ("no matching clause for Lint.caseBodyLines")

let v_Lint_disNilList = fun a0 -> match a0 with
  | ([]) -> true
  | ((x) :: (rest)) -> false
  | _ -> vuna_fail "app/Lint.vuna" 61 1 ("no matching clause for Lint.isNilList")

let v_Lint_dnotBool = fun b -> if b then false
else true

let v_Lint_disSpaceChar = fun c -> (if (bi_eq_int c 32) then true
  else (bi_eq_int c 9))

let rec v_Lint_dspaceChars = fun n -> if bi_le_int n 0 then []
else (32) :: (v_Lint_dspaceChars (bi_sub n 1))

let v_Lint_dspaces = fun n -> bi_str_pack (v_Lint_dspaceChars n)

let rec v_Lint_dindentChars = fun a0 -> match a0 with
  | ([]) -> 0
  | ((c) :: (rest)) -> if bi_eq_int c 32 then bi_add 1 (v_Lint_dindentChars rest)
else if bi_eq_int c 9 then bi_add 1 (v_Lint_dindentChars rest)
else 0
  | _ -> vuna_fail "app/Lint.vuna" 74 1 ("no matching clause for Lint.indentChars")

let v_Lint_dindentOf = fun line -> v_Lint_dindentChars (bi_str_unpack line)

let rec v_Lint_dblankChars = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> (if (v_Lint_disSpaceChar c) then (v_Lint_dblankChars rest)
  else false)
  | _ -> vuna_fail "app/Lint.vuna" 83 1 ("no matching clause for Lint.blankChars")

let v_Lint_disBlankLine = fun line -> v_Lint_dblankChars (bi_str_unpack line)

let rec v_Lint_djoinLines = fun a0 -> match a0 with
  | ([]) -> ""
  | ((line) :: (rest)) -> (let vuna_cat0' = (line) in
  (let vuna_cat1' = ("\n") in
    (let vuna_cat2' = (v_Lint_djoinLines rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "app/Lint.vuna" 95 1 ("no matching clause for Lint.joinLines")

let rec v_Lint_dnthLine = fun a0 a1 -> match (a0, a1) with
  | ([], n) -> ""
  | ((line) :: (rest), n) -> if bi_le_int n 1 then line
else v_Lint_dnthLine rest (bi_sub n 1)
  | _ -> vuna_fail "app/Lint.vuna" 99 1 ("no matching clause for Lint.nthLine")

let v_Lint_dlineAt = fun lines n -> v_Lint_dnthLine lines n

let rec v_Lint_dtakeChars = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (c) :: (rest)) -> if bi_le_int n 0 then []
else (c) :: (v_Lint_dtakeChars (bi_sub n 1) rest)
  | _ -> vuna_fail "app/Lint.vuna" 105 1 ("no matching clause for Lint.takeChars")

let rec v_Lint_ddropChars = fun n chars -> if bi_le_int n 0 then chars
else (match chars with
  | [] -> []
  | (c) :: (rest) -> v_Lint_ddropChars (bi_sub n 1) rest
  | _ -> vuna_fail "app/Lint.vuna" 112 5 ("case pattern match failure"))

let v_Lint_dsliceChars = fun start count chars -> v_Lint_dtakeChars count (v_Lint_ddropChars start chars)

let v_Lint_dsliceLine = fun start count line -> bi_str_pack (v_Lint_dsliceChars start count (bi_str_unpack
    line))

let v_Lint_ddropIndent = fun n line -> bi_str_pack (v_Lint_ddropChars n (bi_str_unpack line))

let rec v_Lint_dnthChar = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> 0
  | (i, (c) :: (rest)) -> if bi_le_int i 0 then c
else v_Lint_dnthChar (bi_sub i 1) rest
  | _ -> vuna_fail "app/Lint.vuna" 122 1 ("no matching clause for Lint.nthChar")

let rec v_Lint_dtrimLen = fun chars n -> if bi_le_int n 0 then 0
else if v_Lint_disSpaceChar (v_Lint_dnthChar (bi_sub n 1) chars) then v_Lint_dtrimLen chars (bi_sub n
  1)
else n

let rec v_Lint_ddropSpaceChars = fun chars -> (match chars with
  | [] -> []
  | (c) :: (rest) -> if v_Lint_disSpaceChar c then v_Lint_ddropSpaceChars rest
  else chars
  | _ -> vuna_fail "app/Lint.vuna" 134 3 ("case pattern match failure"))

let v_Lint_dtrimStart = fun line -> bi_str_pack (v_Lint_ddropSpaceChars (bi_str_unpack line))

let rec v_Lint_dblankFill = fun n stop -> if bi_gt_int n stop then []
else ("") :: (v_Lint_dblankFill (bi_add n 1) stop)

let v_Lint_dtailFromCol = fun line col -> bi_str_pack (v_Lint_ddropChars (bi_sub col 1) (bi_str_unpack
    line))

let v_Lint_dstartsLower = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (bi_ge_int c 97) then (bi_le_int c 122)
    else false)
  | _ -> vuna_fail "app/Lint.vuna" 149 3 ("case pattern match failure"))

let v_Lint_dstartsUpper = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (bi_ge_int c 65) then (bi_le_int c 90)
    else false)
  | _ -> vuna_fail "app/Lint.vuna" 154 3 ("case pattern match failure"))

let rec v_Lint_dprefixChars = fun a0 a1 -> match (a0, a1) with
  | ([], text) -> true
  | ((p) :: (prest), text) -> (match text with
  | [] -> false
  | (t) :: (trest) -> if bi_eq p t then v_Lint_dprefixChars prest trest
  else false
  | _ -> vuna_fail "app/Lint.vuna" 161 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 158 1 ("no matching clause for Lint.prefixChars")

let rec v_Lint_dcontainsSubChars = fun pat text -> (match text with
  | [] -> false
  | (c) :: (rest) -> if v_Lint_dprefixChars pat text then true
  else v_Lint_dcontainsSubChars pat rest
  | _ -> vuna_fail "app/Lint.vuna" 166 3 ("case pattern match failure"))

let rec v_Lint_dcontainsChar = fun a0 a1 -> match (a0, a1) with
  | (c, []) -> false
  | (c, (x) :: (rest)) -> if bi_eq x c then true
else v_Lint_dcontainsChar c rest
  | _ -> vuna_fail "app/Lint.vuna" 170 1 ("no matching clause for Lint.containsChar")

let v_Lint_dhasComment = fun line -> (if (v_Lint_dcontainsSubChars (bi_str_unpack "--") (bi_str_unpack
      line)) then true
  else (v_Lint_dcontainsSubChars (bi_str_unpack "{-") (bi_str_unpack line)))

let v_Lint_dhasTabOrCR = fun line -> (if (v_Lint_dcontainsChar 9 (bi_str_unpack line)) then true
  else (v_Lint_dcontainsChar 13 (bi_str_unpack line)))

let v_Lint_dposLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (line, col)) -> line
  | _ -> vuna_fail "app/Lint.vuna" 178 1 ("no matching clause for Lint.posLine")

let v_Lint_dposCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (line, col)) -> col
  | _ -> vuna_fail "app/Lint.vuna" 180 1 ("no matching clause for Lint.posCol")

let v_Lint_dtokPos = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> p
  | _ -> vuna_fail "app/Lint.vuna" 182 1 ("no matching clause for Lint.tokPos")

let v_Lint_dtokLine = fun tok -> v_Lint_dposLine (v_Lint_dtokPos tok)

let v_Lint_dtokCol = fun tok -> v_Lint_dposCol (v_Lint_dtokPos tok)

let v_Lint_dtokIsKw = fun tok key -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> bi_eq_str x key
  | _ -> false
  | _ -> vuna_fail "app/Lint.vuna" 189 3 ("case pattern match failure"))

let v_Lint_dtokIsSym = fun tok sym -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> bi_eq_str x sym
  | _ -> false
  | _ -> vuna_fail "app/Lint.vuna" 194 3 ("case pattern match failure"))

let v_Lint_dtokIdentOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> C_Vuna_dBase_dJust (x)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 199 3 ("case pattern match failure"))

let v_Lint_dtokStrOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> C_Vuna_dBase_dJust (x)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 204 3 ("case pattern match failure"))

let v_Lint_dtokIntOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> C_Vuna_dBase_dJust (x)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 209 3 ("case pattern match failure"))

let v_Lint_dheadToken = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dNothing
  | ((t) :: (rest)) -> C_Vuna_dBase_dJust (t)
  | _ -> vuna_fail "app/Lint.vuna" 213 1 ("no matching clause for Lint.headToken")

let rec v_Lint_dlastToken = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dNothing
  | ((t) :: ([])) -> C_Vuna_dBase_dJust (t)
  | ((t) :: (rest)) -> v_Lint_dlastToken rest
  | _ -> vuna_fail "app/Lint.vuna" 217 1 ("no matching clause for Lint.lastToken")

let rec v_Lint_dfilterTokLine = fun a0 a1 -> match (a0, a1) with
  | ([], n) -> []
  | ((t) :: (rest), n) -> if bi_eq_int (v_Lint_dtokLine t) n then (t) :: (v_Lint_dfilterTokLine rest n)

else v_Lint_dfilterTokLine rest n
  | _ -> vuna_fail "app/Lint.vuna" 225 1 ("no matching clause for Lint.filterTokLine")

let v_Lint_dtokensOnLine = fun toks n -> v_Lint_dfilterTokLine toks n

let rec v_Lint_dhasSym = fun a0 a1 -> match (a0, a1) with
  | ([], sym) -> false
  | ((t) :: (rest), sym) -> if v_Lint_dtokIsSym t sym then true
else v_Lint_dhasSym rest sym
  | _ -> vuna_fail "app/Lint.vuna" 235 1 ("no matching clause for Lint.hasSym")

let v_Lint_dtailOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((t) :: (rest)) -> rest
  | _ -> vuna_fail "app/Lint.vuna" 239 1 ("no matching clause for Lint.tailOf")

let rec v_Lint_dcountIdent = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> 0
  | (name, (t) :: (rest)) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (other) -> if bi_eq_str other name then bi_add 1 (v_Lint_dcountIdent name rest)

  else v_Lint_dcountIdent name rest
  | C_Vuna_dBase_dNothing -> v_Lint_dcountIdent name rest
  | _ -> vuna_fail "app/Lint.vuna" 254 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 251 1 ("no matching clause for Lint.countIdent")

let rec v_Lint_dbodyMentionsVar = fun toks var start stop -> if bi_ge_int start stop then false
else if bi_gt_int (v_Lint_dcountIdent var (v_Lint_dtokensOnLine toks start)) 0 then true
else v_Lint_dbodyMentionsVar toks var (bi_add start 1) stop

let rec v_Lint_dlowercaseIdents = fun a0 -> match a0 with
  | ([]) -> []
  | ((t) :: (rest)) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (name) -> if (if (v_Lint_dstartsLower name) then (bi_neq_str name "_")
    else false) then (name) :: (v_Lint_dlowercaseIdents rest)
  else v_Lint_dlowercaseIdents rest
  | C_Vuna_dBase_dNothing -> v_Lint_dlowercaseIdents rest
  | _ -> vuna_fail "app/Lint.vuna" 261 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 258 1 ("no matching clause for Lint.lowercaseIdents")

let rec v_Lint_dsimpleFrom = fun a0 a1 -> match (a0, a1) with
  | ([], depth) -> bi_eq_int depth 0
  | ((t) :: (rest), depth) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (s), p) -> if (if (bi_eq_str s "(") then true
    else (bi_eq_str s "[")) then v_Lint_dsimpleFrom rest (bi_add depth 1)
  else if (if (bi_eq_str s ")") then true
    else (bi_eq_str s "]")) then if bi_gt_int depth 0 then v_Lint_dsimpleFrom rest (bi_sub depth 1)
  else false
  else v_Lint_dsimpleFrom rest depth
  | _ -> v_Lint_dsimpleFrom rest depth
  | _ -> vuna_fail "app/Lint.vuna" 277 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 274 1 ("no matching clause for Lint.simpleFrom")

let rec v_Lint_dnoKeyword = fun a0 -> match a0 with
  | ([]) -> true
  | ((t) :: (rest)) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> false
  | _ -> v_Lint_dnoKeyword rest
  | _ -> vuna_fail "app/Lint.vuna" 287 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 284 1 ("no matching clause for Lint.noKeyword")

let v_Lint_disSimpleTokens = fun toks -> (if (v_Lint_dsimpleFrom toks 0) then (v_Lint_dnoKeyword toks)

  else false)

let v_Lint_dstartsWithIf = fun toks -> (match toks with
  | (t) :: (rest) -> v_Lint_dtokIsKw t "if"
  | [] -> false
  | _ -> vuna_fail "app/Lint.vuna" 292 3 ("case pattern match failure"))

let v_Lint_drenderLitBranch = fun indent branch -> (let vuna_cat0' = (v_Lint_dspaces (bi_add indent 2))
  in
  (let vuna_cat1' = (v_Lint_dlitText branch) in
    (let vuna_cat2' = (" => ") in
      (let vuna_cat3' = (v_Lint_dlitExpr branch) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let v_Lint_dcaseVarOf = fun toks -> (match toks with
  | [] -> C_Vuna_dBase_dNothing
  | (t1) :: (rest) -> if v_Lint_dtokIsKw t1 "case" then (match rest with
  | [] -> C_Vuna_dBase_dNothing
  | (t2) :: (rest2) -> (match v_Lint_dtokIdentOf t2 with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (name) -> (match rest2 with
  | [] -> C_Vuna_dBase_dNothing
  | (t3) :: (rest3) -> if (if (v_Lint_dtokIsKw t3 "of") then (v_Lint_disNilList rest3)
          else false) then C_Vuna_dBase_dJust (name)
        else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 398 17 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 395 13 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 392 9 ("case pattern match failure"))
  else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 388 3 ("case pattern match failure"))

let v_Lint_denclosingClause = fun lines toks headLine -> if bi_lt_int headLine 1 then C_Vuna_dBase_dNothing

else (let line = v_Lint_dlineAt lines headLine in
  if v_Lint_disBlankLine line then C_Vuna_dBase_dNothing
  else if bi_neq_int (v_Lint_dindentOf line) 0 then C_Vuna_dBase_dNothing
  else (let ts = v_Lint_dtokensOnLine toks headLine in
    if (if (v_Lint_dhasSym ts "=") then (v_Lint_dnotBool (v_Lint_dhasSym ts "=>"))
      else false) then C_Vuna_dBase_dJust (C_Lint_dEnclosing (headLine, ts, "clause"))
    else C_Vuna_dBase_dNothing))

let v_Lint_denclosingAlt = fun lines toks headLine expectedIndent -> if bi_lt_int headLine 1 then C_Vuna_dBase_dNothing

else (let line = v_Lint_dlineAt lines headLine in
  if v_Lint_disBlankLine line then C_Vuna_dBase_dNothing
  else if bi_neq (v_Lint_dindentOf line) expectedIndent then C_Vuna_dBase_dNothing
  else (let ts = v_Lint_dtokensOnLine toks headLine in
    if v_Lint_dhasSym ts "\\" then C_Vuna_dBase_dNothing
    else (match v_Lint_dlastToken ts with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (t) -> if v_Lint_dtokIsSym t "=>" then C_Vuna_dBase_dJust (C_Lint_dEnclosing (headLine,
          ts, "alt"))
      else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 425 15 ("case pattern match failure"))))

let v_Lint_denclosingOf = fun lines toks caseLine indent -> if bi_eq_int indent 2 then v_Lint_denclosingClause
lines toks (bi_sub caseLine 1)
else v_Lint_denclosingAlt lines toks (bi_sub caseLine 1) (bi_sub indent 2)

let v_Lint_dctorOrLitPattern = fun toks -> (match toks with
  | [] -> false
  | (t) :: (rest) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (name) -> v_Lint_dstartsUpper name
  | C_Vuna_dBase_dNothing -> (match v_Lint_dtokIntOf t with
  | C_Vuna_dBase_dJust (n) -> true
  | C_Vuna_dBase_dNothing -> (match v_Lint_dtokStrOf t with
  | C_Vuna_dBase_dJust (s) -> true
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "app/Lint.vuna" 443 15 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 440 11 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 437 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 434 3 ("case pattern match failure"))

let rec v_Lint_dbodyIndentOk = fun lines n stop indent -> if bi_ge_int n stop then true
else (let line = v_Lint_dlineAt lines n in
  if v_Lint_disBlankLine line then v_Lint_dbodyIndentOk lines (bi_add n 1) stop indent
  else if (if (v_Lint_dhasComment line) then true
    else (v_Lint_dhasTabOrCR line)) then false
  else if bi_lt_int (v_Lint_dindentOf line) (bi_add indent 4) then false
  else v_Lint_dbodyIndentOk lines (bi_add n 1) stop indent)

let rec v_Lint_dnoSiblingAlt = fun lines toks n stop indent -> if bi_ge_int n stop then true
else (let line = v_Lint_dlineAt lines n in
  (let ts = v_Lint_dtokensOnLine toks n in
    if v_Lint_disBlankLine line then v_Lint_dnoSiblingAlt lines toks (bi_add n 1) stop indent
    else if (if (bi_eq_int (v_Lint_dindentOf line) (bi_add indent 2)) then (v_Lint_dhasSym ts "=>")
      else false) then false
    else v_Lint_dnoSiblingAlt lines toks (bi_add n 1) stop indent))

let v_Lint_dblockBodyOk = fun lines toks lastLine start stop indent -> if bi_ge_int start stop then false

else if (if (v_Lint_dbodyIndentOk lines start stop indent) then (v_Lint_dnoSiblingAlt lines toks start
    stop indent)
  else false) then true
else false

let rec v_Lint_dnextNonBlank = fun lines n lastLine -> if bi_gt_int n lastLine then n
else (let line = v_Lint_dlineAt lines n in
  if v_Lint_disBlankLine line then v_Lint_dnextNonBlank lines (bi_add n 1) lastLine
  else n)

let v_Lint_dtokenText = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> bi_str_from_int x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> ""
  | _ -> vuna_fail "app/Lint.vuna" 487 3 ("case pattern match failure"))

let v_Lint_dtailTokenCol = fun tok -> bi_add (v_Lint_dtokCol tok) (bi_str_length (v_Lint_dtokenText tok))

let v_Lint_dreplaceIdentInLine = fun line tok replacement -> (let col = v_Lint_dtokCol tok in
  let len = bi_str_length (v_Lint_dtokenText tok) in
  let prefix = v_Lint_dsliceLine 0 (bi_sub col 1) line in
  let suffix = v_Lint_dtailFromCol line (bi_add col len) in
  (let vuna_cat0' = (prefix) in
    (let vuna_cat1' = (replacement) in
      (let vuna_cat2' = (suffix) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Lint_dlastClauseCheck = fun lines toks lastLine stop fnName -> (let next = v_Lint_dnextNonBlank
  lines stop lastLine in
  if bi_gt_int next lastLine then true
  else (let line = v_Lint_dlineAt lines next in
    if bi_neq_int (v_Lint_dindentOf line) 0 then false
    else (let ts = v_Lint_dtokensOnLine toks next in
      (match v_Lint_dheadToken ts with
  | C_Vuna_dBase_dNothing -> false
  | C_Vuna_dBase_dJust (t) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (other) -> v_Lint_dnotBool (bi_eq_str other fnName)
  | C_Vuna_dBase_dNothing -> true
  | _ -> vuna_fail "app/Lint.vuna" 528 28 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 526 16 ("case pattern match failure")))))

let v_Lint_dlastAltCheck = fun lines toks lastLine stop indent -> (let next = v_Lint_dnextNonBlank lines
  stop lastLine in
  if bi_gt_int next lastLine then true
  else (let line = v_Lint_dlineAt lines next in
    (let ind = v_Lint_dindentOf line in
      if bi_eq_int ind (bi_sub indent 2) then if v_Lint_dhasSym (v_Lint_dtokensOnLine toks next) "=>"
      then false
      else true
      else if bi_lt_int ind (bi_sub indent 2) then true
      else false)))

let rec v_Lint_dlinesClean = fun lines start stop -> if bi_gt_int start stop then true
else (let line = v_Lint_dlineAt lines start in
  if (if (v_Lint_dhasComment line) then true
    else (v_Lint_dhasTabOrCR line)) then false
  else v_Lint_dlinesClean lines (bi_add start 1) stop)

let v_Lint_dheadOfTokens = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, C_Vuna_dBase_dPos (1, 1))
  | ((t) :: (rest)) -> t
  | _ -> vuna_fail "app/Lint.vuna" 574 1 ("no matching clause for Lint.headOfTokens")

let rec v_Lint_dtokenOfVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (t) :: (rest)) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (other) -> if bi_eq_str other name then C_Vuna_dBase_dJust (t)
  else v_Lint_dtokenOfVar name rest
  | C_Vuna_dBase_dNothing -> v_Lint_dtokenOfVar name rest
  | _ -> vuna_fail "app/Lint.vuna" 634 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 631 1 ("no matching clause for Lint.tokenOfVar")

let rec v_Lint_dremoveName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (x) :: (rest)) -> if bi_eq_str x name then v_Lint_dremoveName name rest
else (x) :: (v_Lint_dremoveName name rest)
  | _ -> vuna_fail "app/Lint.vuna" 638 1 ("no matching clause for Lint.removeName")

let v_Lint_denclosingIsLast = fun lines toks lastLine stop indent kind fnOrKind -> if bi_eq_str kind "clause"
then v_Lint_dlastClauseCheck lines toks lastLine stop fnOrKind
else v_Lint_dlastAltCheck lines toks lastLine stop indent

let rec v_Lint_dinsertFinding = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> (f) :: ([])
  | (f, (g) :: (rest)) -> if bi_lt_int (v_Lint_dfindingLine f) (v_Lint_dfindingLine g) then (f) :: ((g)
  :: (rest))
else if (if (bi_eq_int (v_Lint_dfindingLine f) (v_Lint_dfindingLine g)) then (bi_le_int (v_Lint_dfindingCol
      f) (v_Lint_dfindingCol g))
  else false) then (f) :: ((g) :: (rest))
else (g) :: (v_Lint_dinsertFinding f rest)
  | _ -> vuna_fail "app/Lint.vuna" 677 1 ("no matching clause for Lint.insertFinding")

let rec v_Lint_dsortFindings = fun a0 -> match a0 with
  | ([]) -> []
  | ((f) :: (rest)) -> v_Lint_dinsertFinding f (v_Lint_dsortFindings rest)
  | _ -> vuna_fail "app/Lint.vuna" 673 1 ("no matching clause for Lint.sortFindings")

let rec v_Lint_dinsertEdit = fun a0 a1 -> match (a0, a1) with
  | (e, []) -> (e) :: ([])
  | (e, (f) :: (rest)) -> if bi_gt_int (v_Lint_deditStart e) (v_Lint_deditStart f) then (e) :: ((f) ::
  (rest))
else (f) :: (v_Lint_dinsertEdit e rest)
  | _ -> vuna_fail "app/Lint.vuna" 688 1 ("no matching clause for Lint.insertEdit")

let rec v_Lint_dsortEdits = fun a0 -> match a0 with
  | ([]) -> []
  | ((e) :: (rest)) -> v_Lint_dinsertEdit e (v_Lint_dsortEdits rest)
  | _ -> vuna_fail "app/Lint.vuna" 684 1 ("no matching clause for Lint.sortEdits")

let rec v_Lint_dcollectEdits = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((f) :: (rest), acc) -> (match v_Lint_dfindingEdit f with
  | C_Vuna_dBase_dNothing -> v_Lint_dcollectEdits rest acc
  | C_Vuna_dBase_dJust (e) -> v_Lint_dcollectEdits rest ((e) :: (acc))
  | _ -> vuna_fail "app/Lint.vuna" 697 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 694 1 ("no matching clause for Lint.collectEdits")

let rec v_Lint_dtakeList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (rest)) -> if bi_le_int n 0 then []
else (x) :: (v_Lint_dtakeList (bi_sub n 1) rest)
  | _ -> vuna_fail "app/Lint.vuna" 701 1 ("no matching clause for Lint.takeList")

let rec v_Lint_ddropList = fun n lines -> if bi_le_int n 0 then lines
else (match lines with
  | [] -> []
  | (x) :: (rest) -> v_Lint_ddropList (bi_sub n 1) rest
  | _ -> vuna_fail "app/Lint.vuna" 708 5 ("case pattern match failure"))

let v_Lint_dprintFinding = fun path fixMode f -> (let suffix = if fixMode then " (not auto-fixable)"
  else "" in
  let text = (let vuna_cat0' = (path) in
    (let vuna_cat1' = (":") in
      (let vuna_cat2' = (bi_str_from_int (v_Lint_dfindingLine f)) in
        (let vuna_cat3' = (":") in
          (let vuna_cat4' = (bi_str_from_int (v_Lint_dfindingCol f)) in
            (let vuna_cat5' = (": ") in
              (let vuna_cat6' = (v_Lint_dfindingRule f) in
                (let vuna_cat7' = (": ") in
                  (let vuna_cat8' = (v_Lint_dfindingMessage f) in
                    (let vuna_cat9' = (suffix) in
                      (let vuna_cat10' = ("\n") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'])))))))))))
  in
  (let _ = bi_print text in
    0))

let rec v_Lint_dprintFindings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (path, fixMode, []) -> 0
  | (path, fixMode, (f) :: (rest)) -> (let _ = v_Lint_dprintFinding path fixMode f in
  v_Lint_dprintFindings path fixMode rest)
  | _ -> vuna_fail "app/Lint.vuna" 747 1 ("no matching clause for Lint.printFindings")

let v_Lint_dlintUsage = "usage: vuna lint [--fix] <file.vuna>...\n"

let v_Lint_dlintUsageError = fun () -> (let _ = bi_print v_Lint_dlintUsage in
  2)

let v_Lint_dreportFindings = fun path fixMode findings -> (let _ = v_Lint_dprintFindings path fixMode
  findings in
  if v_Lint_disNilList findings then 0
  else 1)

let v_Vuna_dInterp_deffectiveRoots = fun a0 -> match a0 with
  | ([]) -> ("lib") :: ([])
  | (roots) -> roots
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 19 1 ("no matching clause for Vuna.Interp.effectiveRoots")

let rec v_Vuna_dTypedCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 9 1 ("no matching clause for Vuna.TypedCodegen.joinWith")

let v_Vuna_dTypedCodegen_dparamVar = fun i -> (("'p") ^ (bi_str_from_int i))

let v_Vuna_dTypedCodegen_dshowParamVar = fun i -> (("s") ^ (bi_str_from_int i))

let rec v_Vuna_dTypedCodegen_dparamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, v_Vuna_dTypedCodegen_dparamVar i)) :: (v_Vuna_dTypedCodegen_dparamMapAt
  rest (bi_add i 1))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 33 1 ("no matching clause for Vuna.TypedCodegen.paramMapAt")

let v_Vuna_dTypedCodegen_dparamMap = fun params -> v_Vuna_dTypedCodegen_dparamMapAt params 0

let rec v_Vuna_dTypedCodegen_dshowParamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, v_Vuna_dTypedCodegen_dshowParamVar i)) :: (v_Vuna_dTypedCodegen_dshowParamMapAt
  rest (bi_add i 1))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 38 1 ("no matching clause for Vuna.TypedCodegen.showParamMapAt")

let v_Vuna_dTypedCodegen_dshowParamMap = fun params -> v_Vuna_dTypedCodegen_dshowParamMapAt params 0

let rec v_Vuna_dTypedCodegen_dlookupParam = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, v)) :: (rest)) -> if bi_eq n name then C_Vuna_dBase_dJust (v)
else v_Vuna_dTypedCodegen_dlookupParam name rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 43 1 ("no matching clause for Vuna.TypedCodegen.lookupParam")

let rec v_Vuna_dTypedCodegen_ddataDecls = fun decls -> (match decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _) -> (d) :: (v_Vuna_dTypedCodegen_ddataDecls rest)
  | _ -> v_Vuna_dTypedCodegen_ddataDecls rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 51 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 48 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dlookupData = fun decls name -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dn, ps, cs, _) -> if bi_eq_str dn name then C_Vuna_dBase_dJust (d)
    else v_Vuna_dTypedCodegen_dlookupData rest name
  | _ -> v_Vuna_dTypedCodegen_dlookupData rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 69 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 66 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dappType = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> name
  | ((x) :: ([]), name) -> (let vuna_cat0' = ("(") in
  (let vuna_cat1' = (x) in
    (let vuna_cat2' = (") ") in
      (let vuna_cat3' = (name) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | (args, name) -> (let vuna_cat0' = ("(") in
  (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " args) in
    (let vuna_cat2' = (") ") in
      (let vuna_cat3' = (name) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 116 1 ("no matching clause for Vuna.TypedCodegen.appType")

let rec v_Vuna_dTypedCodegen_dsplitArrows = fun expr -> (match expr with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (a) :: (v_Vuna_dTypedCodegen_dsplitArrows
    b)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 121 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_drange = fun i n -> if bi_ge_int i n then []
else (i) :: (v_Vuna_dTypedCodegen_drange (bi_add i 1) n)

let rec v_Vuna_dTypedCodegen_dparamVarsAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (v_Vuna_dTypedCodegen_dparamVar i) :: (v_Vuna_dTypedCodegen_dparamVarsAt rest
  (bi_add i 1))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 139 1 ("no matching clause for Vuna.TypedCodegen.paramVarsAt")

let v_Vuna_dTypedCodegen_dparamVars = fun params -> v_Vuna_dTypedCodegen_dparamVarsAt params 0

let v_Vuna_dTypedCodegen_ddataPrefix = fun params -> (match params with
  | [] -> ""
  | (p) :: ([]) -> ((v_Vuna_dTypedCodegen_dparamVar 0) ^ (" "))
  | _ -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " (v_Vuna_dTypedCodegen_dparamVars params))
      in
      (let vuna_cat2' = (") ") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 134 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dpairSecond = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (_, v)) -> v
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 246 1 ("no matching clause for Vuna.TypedCodegen.pairSecond")

let v_Vuna_dTypedCodegen_dnoLocSpan = C_Vuna_dBase_dSpan ("", 0, 0, 0, 0)

let rec v_Vuna_dTypedCodegen_dfoldStringLiterals = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dAst_dEStr (s, _)) :: (rest)) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals rest with
  | (C_Vuna_dAst_dEStr (s2, _)) :: (rest2) -> (C_Vuna_dAst_dEStr (((s) ^ (s2)), v_Vuna_dTypedCodegen_dnoLocSpan))
  :: (rest2)
  | folded -> (C_Vuna_dAst_dEStr (s, v_Vuna_dTypedCodegen_dnoLocSpan)) :: (folded)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 337 3 ("case pattern match failure"))
  | ((e) :: (rest)) -> (e) :: (v_Vuna_dTypedCodegen_dfoldStringLiterals rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 335 1 ("no matching clause for Vuna.TypedCodegen.foldStringLiterals")

let v_Vuna_dTypedCodegen_dconcatBindingName = fun i -> (let vuna_cat0' = ("vuna_cat") in
  (let vuna_cat1' = (bi_str_from_int i) in
    (let vuna_cat2' = ("'") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dTypedCodegen_dwrapConcatBindings = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((C_Vuna_dBase_dPair (n, code)) :: (rest), body) -> (let vuna_cat0' = ("(let ") in
  (let vuna_cat1' = (n) in
    (let vuna_cat2' = (" = (") in
      (let vuna_cat3' = (code) in
        (let vuna_cat4' = (") in ") in
          (let vuna_cat5' = (v_Vuna_dTypedCodegen_dwrapConcatBindings rest body) in
            (let vuna_cat6' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
              vuna_cat6'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 398 1 ("no matching clause for Vuna.TypedCodegen.wrapConcatBindings")

let v_Vuna_dTypedCodegen_dbuiltinName = fun a0 -> match a0 with
  | ("+") -> C_Vuna_dBase_dJust ("bi_add")
  | ("+") -> C_Vuna_dBase_dJust ("bi_add")
  | ("-") -> C_Vuna_dBase_dJust ("bi_sub")
  | ("*") -> C_Vuna_dBase_dJust ("bi_mul")
  | ("/") -> C_Vuna_dBase_dJust ("bi_div")
  | ("==") -> C_Vuna_dBase_dJust ("bi_eq")
  | ("/=") -> C_Vuna_dBase_dJust ("bi_neq")
  | ("<") -> C_Vuna_dBase_dJust ("bi_lt")
  | ("<=") -> C_Vuna_dBase_dJust ("bi_le")
  | (">") -> C_Vuna_dBase_dJust ("bi_gt")
  | (">=") -> C_Vuna_dBase_dJust ("bi_ge")
  | ("&&") -> C_Vuna_dBase_dJust ("bi_and")
  | ("||") -> C_Vuna_dBase_dJust ("bi_or")
  | ("++") -> C_Vuna_dBase_dJust ("bi_concat")
  | ("bi_eq_int") -> C_Vuna_dBase_dJust ("bi_eq_int")
  | ("bi_neq_int") -> C_Vuna_dBase_dJust ("bi_neq_int")
  | ("bi_lt_int") -> C_Vuna_dBase_dJust ("bi_lt_int")
  | ("bi_le_int") -> C_Vuna_dBase_dJust ("bi_le_int")
  | ("bi_gt_int") -> C_Vuna_dBase_dJust ("bi_gt_int")
  | ("bi_ge_int") -> C_Vuna_dBase_dJust ("bi_ge_int")
  | ("bi_eq_str") -> C_Vuna_dBase_dJust ("bi_eq_str")
  | ("bi_neq_str") -> C_Vuna_dBase_dJust ("bi_neq_str")
  | ("bi_eq_bool") -> C_Vuna_dBase_dJust ("bi_eq_bool")
  | ("bi_neq_bool") -> C_Vuna_dBase_dJust ("bi_neq_bool")
  | ("strLength") -> C_Vuna_dBase_dJust ("bi_str_length")
  | ("strUnpack") -> C_Vuna_dBase_dJust ("bi_str_unpack")
  | ("strPack") -> C_Vuna_dBase_dJust ("bi_str_pack")
  | ("strFromInt") -> C_Vuna_dBase_dJust ("bi_str_from_int")
  | ("readFile") -> C_Vuna_dBase_dJust ("bi_read_file")
  | ("writeFile") -> C_Vuna_dBase_dJust ("bi_write_file")
  | ("print") -> C_Vuna_dBase_dJust ("bi_print")
  | ("getArgs") -> C_Vuna_dBase_dJust ("bi_get_args")
  | ("fileExists") -> C_Vuna_dBase_dJust ("bi_file_exists")
  | ("exit") -> C_Vuna_dBase_dJust ("bi_exit")
  | (_) -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 413 1 ("no matching clause for Vuna.TypedCodegen.builtinName")

let v_Vuna_dTypedCodegen_disIrrefutable = fun p -> (match p with
  | C_Vuna_dAst_dPVar (_, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 565 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disVarPattern = fun p -> (match p with
  | C_Vuna_dAst_dPVar (_, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 571 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dallVarPatterns = fun a0 -> match a0 with
  | ([]) -> true
  | ((p) :: (rest)) -> (if (v_Vuna_dTypedCodegen_disVarPattern p) then (v_Vuna_dTypedCodegen_dallVarPatterns
    rest)
  else false)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 576 1 ("no matching clause for Vuna.TypedCodegen.allVarPatterns")

let rec v_Vuna_dTypedCodegen_dfunSpan = fun decls name -> (match decls with
  | [] -> v_Vuna_dTypedCodegen_dnoLocSpan
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> if bi_eq_str n name then sp
    else v_Vuna_dTypedCodegen_dfunSpan rest name
  | _ -> v_Vuna_dTypedCodegen_dfunSpan rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 589 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 586 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_ddeclFunName = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> name
  | _ -> ""
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 623 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfilterNames = fun pred names -> (match names with
  | [] -> []
  | (n) :: (rest) -> if pred n then (n) :: (v_Vuna_dTypedCodegen_dfilterNames pred rest)
  else v_Vuna_dTypedCodegen_dfilterNames pred rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 635 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dneighborsOf = fun adj name -> (match adj with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, ns)) :: (rest) -> if bi_eq_str n name then ns
  else v_Vuna_dTypedCodegen_dneighborsOf rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 644 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_druntimePrelude = (C_Vuna_dBase_dPair ("vuna_fail", "let vuna_fail file line col msg =
  if line = 0 then failwith msg
  else failwith (file ^ \":\" ^ string_of_int line ^ \":\" ^ string_of_int col ^ \": \" ^ msg)
")) :: ((C_Vuna_dBase_dPair ("bi_add", "let bi_add a b = a + b\n")) :: ((C_Vuna_dBase_dPair ("bi_sub",
        "let bi_sub a b = a - b\n")) :: ((C_Vuna_dBase_dPair ("bi_mul", "let bi_mul a b = a * b\n")) ::
      ((C_Vuna_dBase_dPair ("bi_div", "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n"))
        :: ((C_Vuna_dBase_dPair ("bi_eq", "let bi_eq a b = a = b\n")) :: ((C_Vuna_dBase_dPair ("bi_neq",
                "let bi_neq a b = a <> b\n")) :: ((C_Vuna_dBase_dPair ("bi_lt", "let bi_lt a b = a < b\n"))
              :: ((C_Vuna_dBase_dPair ("bi_le", "let bi_le a b = a <= b\n")) :: ((C_Vuna_dBase_dPair ("bi_gt",
                      "let bi_gt a b = a > b\n")) :: ((C_Vuna_dBase_dPair ("bi_ge", "let bi_ge a b = a >= b\n"))
                    :: ((C_Vuna_dBase_dPair ("bi_eq_int", "let bi_eq_int (a : int) (b : int) = a = b\n"))
                      :: ((C_Vuna_dBase_dPair ("bi_neq_int", "let bi_neq_int (a : int) (b : int) = a <> b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_lt_int", "let bi_lt_int (a : int) (b : int) = a < b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_le_int", "let bi_le_int (a : int) (b : int) = a <= b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_gt_int", "let bi_gt_int (a : int) (b : int) = a > b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_ge_int", "let bi_ge_int (a : int) (b : int) = a >= b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_eq_str", "let bi_eq_str (a : string) (b : string) = a = b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_neq_str", "let bi_neq_str (a : string) (b : string) = a <> b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_eq_bool", "let bi_eq_bool (a : bool) (b : bool) = a = b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_neq_bool", "let bi_neq_bool (a : bool) (b : bool) = a <> b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_and", "let bi_and a b = a && b\n")) :: ((C_Vuna_dBase_dPair
                        ("bi_or", "let bi_or a b = a || b\n")) :: ((C_Vuna_dBase_dPair ("bi_concat", "let bi_concat a b = a ^ b\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_str_length", "let bi_str_length a = String.length a\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_str_unpack", "let bi_str_unpack s =
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (Char.code s.[i] :: acc)
  in
  go (String.length s - 1) []
")) :: ((C_Vuna_dBase_dPair ("bi_str_pack", "let bi_str_pack cs =
  let buf = Buffer.create 16 in
  let rec go = function
    | [] -> ()
    | c :: rest -> Buffer.add_char buf (Char.chr c); go rest
  in
  go cs;
  Buffer.contents buf
")) :: ((C_Vuna_dBase_dPair ("bi_str_from_int", "let bi_str_from_int n = string_of_int n\n")) :: ((C_Vuna_dBase_dPair
                        ("bi_read_file", "let bi_read_file path =
  try
    let ch = open_in_bin path in
    Fun.protect ~finally:(fun () -> close_in_noerr ch)
      (fun () -> really_input_string ch (in_channel_length ch))
  with Sys_error msg -> failwith (\"readFile: \" ^ msg)
")) :: ((C_Vuna_dBase_dPair ("bi_write_file", "let bi_write_file path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)
")) :: ((C_Vuna_dBase_dPair ("bi_print", "let bi_print s = print_string s; flush stdout; String.length s\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_file_exists", "let bi_file_exists path = Sys.file_exists path\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_exit", "let bi_exit n = exit n\n")) :: ((C_Vuna_dBase_dPair
                        ("bi_get_args", "let bi_get_args () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
")) :: ((C_Vuna_dBase_dPair ("show_ctor", "let show_ctor name args = if args = [] then name else \"(\" ^ name ^ \" \" ^ String.concat \" \" args ^ \")\"
")) :: ((C_Vuna_dBase_dPair ("show_vbool", "let show_vbool b = if b then \"True\" else \"False\"\n"))
                        :: ((C_Vuna_dBase_dPair ("show_vstring", "let show_vstring s =
  let buf = Buffer.create 16 in
  Buffer.add_char buf (Char.chr 34);
  String.iter (fun c ->
    let n = Char.code c in
    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))
    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))
    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")
    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")
    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")
    else Buffer.add_char buf c) s;
  Buffer.add_char buf (Char.chr 34);
  Buffer.contents buf
")) :: ((C_Vuna_dBase_dPair ("show_vlist", "let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =
  match v with
  | [] -> \"Nil\"
  | x :: xs -> \"(Cons \" ^ show_elem x ^ \" \" ^ show_vlist show_elem xs ^ \")\"
")) :: ([]))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dTypedCodegen_dstartsWith = fun a0 a1 -> match (a0, a1) with
  | ([], hay) -> true
  | ((c) :: (cs), []) -> false
  | ((c) :: (cs), (h) :: (hs)) -> if bi_eq c h then v_Vuna_dTypedCodegen_dstartsWith cs hs
else false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 868 1 ("no matching clause for Vuna.TypedCodegen.startsWith")

let rec v_Vuna_dTypedCodegen_dcontainsName = fun a0 a1 -> match (a0, a1) with
  | (needle, []) -> false
  | (needle, (h) :: (hs)) -> if v_Vuna_dTypedCodegen_dstartsWith needle ((h) :: (hs)) then true
else v_Vuna_dTypedCodegen_dcontainsName needle hs
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 872 1 ("no matching clause for Vuna.TypedCodegen.containsName")

let rec v_Vuna_dTypedCodegen_dfilterRuntime = fun a0 a1 -> match (a0, a1) with
  | ([], bodyChars) -> []
  | ((C_Vuna_dBase_dPair (name, chunk)) :: (rest), bodyChars) -> if v_Vuna_dTypedCodegen_dcontainsName
(bi_str_unpack name) bodyChars then (C_Vuna_dBase_dPair (name, chunk)) :: (v_Vuna_dTypedCodegen_dfilterRuntime
  rest bodyChars)
else v_Vuna_dTypedCodegen_dfilterRuntime rest bodyChars
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 876 1 ("no matching clause for Vuna.TypedCodegen.filterRuntime")

let v_Vuna_dTypedCodegen_dindentWidth = fun depth -> if bi_gt_int depth 12 then 24
else bi_mul depth 2

let rec v_Vuna_dTypedCodegen_dtrimTrailing = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if bi_eq_int c 32 then v_Vuna_dTypedCodegen_dtrimTrailing rest
else (c) :: (rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 897 1 ("no matching clause for Vuna.TypedCodegen.trimTrailing")

let v_Vuna_dTypedCodegen_dpadCode = fun c -> if bi_lt_int c 10 then (("00") ^ (bi_str_from_int c))
else if bi_lt_int c 100 then (("0") ^ (bi_str_from_int c))
else bi_str_from_int c

let v_Vuna_dTypedCodegen_descapeChar = fun c -> if bi_eq_int c 34 then "\\\""
else if bi_eq_int c 92 then "\\\\"
else if bi_eq_int c 10 then "\n"
else if bi_eq_int c 9 then "\t"
else if bi_lt_int c 32 then (("\\") ^ (v_Vuna_dTypedCodegen_dpadCode c))
else if bi_gt_int c 126 then (("\\") ^ (v_Vuna_dTypedCodegen_dpadCode c))
else bi_str_pack ((c) :: ([]))

let rec v_Vuna_dTypedCodegen_descapeLong = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (v_Vuna_dTypedCodegen_descapeChar c) :: (v_Vuna_dTypedCodegen_descapeLong rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 951 1 ("no matching clause for Vuna.TypedCodegen.escapeLong")

let v_Vuna_dTypecheck_deeSpan = fun e -> (match e with
  | C_Vuna_dTypecheck_dXEVar (n, sp) -> sp
  | C_Vuna_dTypecheck_dXEInt (n, sp) -> sp
  | C_Vuna_dTypecheck_dXEStr (s, sp) -> sp
  | C_Vuna_dTypecheck_dXELam (ps, b, sp) -> sp
  | C_Vuna_dTypecheck_dXEApp (f, a, sp) -> sp
  | C_Vuna_dTypecheck_dXECmp (n, a, ty, sp) -> sp
  | C_Vuna_dTypecheck_dXELet (bs, b, sp) -> sp
  | C_Vuna_dTypecheck_dXECase (s, ty, a, sp) -> sp
  | C_Vuna_dTypecheck_dXEIf (c, t, e, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 33 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dlookupSubst = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dBase_dNothing
  | (i, (C_Vuna_dBase_dPair (j, t)) :: (rest)) -> if bi_eq i j then C_Vuna_dBase_dJust (t)
else v_Vuna_dTypecheck_dlookupSubst i rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 48 1 ("no matching clause for Vuna.Typecheck.lookupSubst")

let rec v_Vuna_dTypecheck_dmemInt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> false
  | (i, (x) :: (rest)) -> if bi_eq i x then true
else v_Vuna_dTypecheck_dmemInt i rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 52 1 ("no matching clause for Vuna.Typecheck.memInt")

let v_Vuna_dTypecheck_daddUnique = fun x xs -> if v_Vuna_dTypecheck_dmemInt x xs then xs
else (x) :: (xs)

let rec v_Vuna_dTypecheck_dunionInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> v_Vuna_dTypecheck_daddUnique x (v_Vuna_dTypecheck_dunionInts rest ys)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 57 1 ("no matching clause for Vuna.Typecheck.unionInts")

let rec v_Vuna_dTypecheck_ddiffInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> []
  | ((x) :: (rest), ys) -> if v_Vuna_dTypecheck_dmemInt x ys then v_Vuna_dTypecheck_ddiffInts rest ys

else (x) :: (v_Vuna_dTypecheck_ddiffInts rest ys)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 60 1 ("no matching clause for Vuna.Typecheck.diffInts")

let rec v_Vuna_dTypecheck_dshowTy = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (("t") ^ (bi_str_from_int i))
  | C_Vuna_dTypecheck_dTCon (n, []) -> n
  | C_Vuna_dTypecheck_dTCon (n, args) -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (n) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTyArgs args) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dTypecheck_dTFun (a, b) -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy a) in
      (let vuna_cat2' = (" -> ") in
        (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy b) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 85 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dshowTyArgs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((ty) :: ([])) -> v_Vuna_dTypecheck_dshowTy ty
  | ((ty) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dTypecheck_dshowTy ty) in
  (let vuna_cat1' = (" ") in
    (let vuna_cat2' = (v_Vuna_dTypecheck_dshowTyArgs rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 91 1 ("no matching clause for Vuna.Typecheck.showTyArgs")

let v_Vuna_dTypecheck_dnextVar = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s)) -> C_Vuna_dBase_dPair (n, C_Vuna_dTypecheck_dTC (bi_add n 1, s))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 96 1 ("no matching clause for Vuna.Typecheck.nextVar")

let v_Vuna_dTypecheck_dfreshTy = fun st -> (match v_Vuna_dTypecheck_dnextVar st with
  | C_Vuna_dBase_dPair (n, st2) -> C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTVar (n), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 100 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dbindVar = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, ty, C_Vuna_dTypecheck_dTC (n, s)) -> C_Vuna_dBase_dOk (C_Vuna_dTypecheck_dTC (n, (C_Vuna_dBase_dPair
      (i, ty)) :: (s)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 104 1 ("no matching clause for Vuna.Typecheck.bindVar")

let rec v_Vuna_dTypecheck_dinstantiateVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((q) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st2) -> (match v_Vuna_dTypecheck_dinstantiateVars rest st2 with
  | C_Vuna_dBase_dPair (mapping, st3) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (q, ty)) :: (mapping),
      st3)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 149 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 147 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 145 1 ("no matching clause for Vuna.Typecheck.instantiateVars")

let rec v_Vuna_dTypecheck_dfreeVarsTy = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: ([])
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_Vuna_dTypecheck_dfreeVarsArgs args
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsTy a) (v_Vuna_dTypecheck_dfreeVarsTy
    b)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 167 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dfreeVarsArgs = fun a0 -> match a0 with
  | ([]) -> []
  | ((ty) :: (rest)) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsTy ty) (v_Vuna_dTypecheck_dfreeVarsArgs
  rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 172 1 ("no matching clause for Vuna.Typecheck.freeVarsArgs")

let v_Vuna_dTypecheck_dfreeVarsScheme = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dScheme (qs, ty)) -> v_Vuna_dTypecheck_ddiffInts (v_Vuna_dTypecheck_dfreeVarsTy
  ty) qs
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 175 1 ("no matching clause for Vuna.Typecheck.freeVarsScheme")

let rec v_Vuna_dTypecheck_dfreeVarsEnv = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (n, sch)) :: (rest)) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsScheme
  sch) (v_Vuna_dTypecheck_dfreeVarsEnv rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 177 1 ("no matching clause for Vuna.Typecheck.freeVarsEnv")

let v_Vuna_dTypecheck_disLowerName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (bi_ge_int c 97) then (bi_le_int c 122)
    else false)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 186 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dlookupTyVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> if bi_eq n name then C_Vuna_dBase_dJust (ty)
else v_Vuna_dTypecheck_dlookupTyVar name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 190 1 ("no matching clause for Vuna.Typecheck.lookupTyVar")

let rec v_Vuna_dTypecheck_dvarIds = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: (v_Vuna_dTypecheck_dvarIds rest)
  | _ -> v_Vuna_dTypecheck_dvarIds rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 242 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 240 1 ("no matching clause for Vuna.Typecheck.varIds")

let rec v_Vuna_dTypecheck_dseedVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedVars rest st1 with
  | C_Vuna_dBase_dPair (vars, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, ty)) :: (vars), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 255 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 253 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 251 1 ("no matching clause for Vuna.Typecheck.seedVars")

let rec v_Vuna_dTypecheck_ddeclDataNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _) -> (name) :: (v_Vuna_dTypecheck_ddeclDataNames rest)
  | _ -> v_Vuna_dTypecheck_ddeclDataNames rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 272 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 270 1 ("no matching clause for Vuna.Typecheck.declDataNames")

let v_Vuna_dTypecheck_dintTy = C_Vuna_dTypecheck_dTCon ("Int", [])

let v_Vuna_dTypecheck_dstrTy = C_Vuna_dTypecheck_dTCon ("String", [])

let v_Vuna_dTypecheck_dboolTy = C_Vuna_dTypecheck_dTCon ("Bool", [])

let v_Vuna_dTypecheck_dlistOf = fun ty -> C_Vuna_dTypecheck_dTCon ("List", (ty) :: ([]))

let v_Vuna_dTypecheck_dfun2 = fun a b c -> C_Vuna_dTypecheck_dTFun (a, C_Vuna_dTypecheck_dTFun (b, c))

let v_Vuna_dTypecheck_dbuiltinSchemes = fun () -> (C_Vuna_dBase_dPair ("+", C_Vuna_dTypecheck_dScheme
    ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy)))
:: ((C_Vuna_dBase_dPair ("-", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy
        v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy))) :: ((C_Vuna_dBase_dPair ("*", C_Vuna_dTypecheck_dScheme
        ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy)))
    :: ((C_Vuna_dBase_dPair ("/", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy
            v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy))) :: ((C_Vuna_dBase_dPair ("==", C_Vuna_dTypecheck_dScheme
            ((0) :: ([]), v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar
                (0)) v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("/=", C_Vuna_dTypecheck_dScheme
              ((0) :: ([]), v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar
                  (0)) v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("<", C_Vuna_dTypecheck_dScheme
                ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy)))
            :: ((C_Vuna_dBase_dPair ("<=", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy
                    v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair (">",
                    C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy
                      v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair (">=", C_Vuna_dTypecheck_dScheme
                      ([], v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy)))
                  :: ((C_Vuna_dBase_dPair ("&&", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy)))
                    :: ((C_Vuna_dBase_dPair ("||", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy)))
                      :: ((C_Vuna_dBase_dPair ("++", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dstrTy)))
                        :: ((C_Vuna_dBase_dPair ("strLength", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dintTy)))) :: ((C_Vuna_dBase_dPair
                        ("strUnpack", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy,
                        v_Vuna_dTypecheck_dlistOf v_Vuna_dTypecheck_dintTy)))) :: ((C_Vuna_dBase_dPair
                        ("strPack", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dlistOf
                        v_Vuna_dTypecheck_dintTy, v_Vuna_dTypecheck_dstrTy)))) :: ((C_Vuna_dBase_dPair
                        ("strFromInt", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dintTy,
                        v_Vuna_dTypecheck_dstrTy)))) :: ((C_Vuna_dBase_dPair ("readFile", C_Vuna_dTypecheck_dScheme
                        ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dstrTy))))
                        :: ((C_Vuna_dBase_dPair ("writeFile", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dintTy)))
                        :: ((C_Vuna_dBase_dPair ("print", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dintTy)))) :: ((C_Vuna_dBase_dPair
                        ("getArgs", C_Vuna_dTypecheck_dScheme ([], v_Vuna_dTypecheck_dlistOf v_Vuna_dTypecheck_dstrTy)))
                        :: ((C_Vuna_dBase_dPair ("fileExists", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dboolTy)))) :: ((C_Vuna_dBase_dPair
                        ("exit", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dintTy,
                        v_Vuna_dTypecheck_dintTy)))) :: ([])))))))))))))))))))))))

let v_Vuna_dTypecheck_dintCmpName = fun name -> (match name with
  | "==" -> "bi_eq_int"
  | "/=" -> "bi_neq_int"
  | "<" -> "bi_lt_int"
  | "<=" -> "bi_le_int"
  | ">" -> "bi_gt_int"
  | ">=" -> "bi_ge_int"
  | _ -> name
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 351 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dstrCmpName = fun name -> (match name with
  | "==" -> "bi_eq_str"
  | "/=" -> "bi_neq_str"
  | _ -> name
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 361 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dboolCmpName = fun name -> (match name with
  | "==" -> "bi_eq_bool"
  | "/=" -> "bi_neq_bool"
  | _ -> name
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 367 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dfirstArgTy = fun argTys -> (match argTys with
  | (ty) :: (rest) -> ty
  | [] -> C_Vuna_dTypecheck_dTCon ("", [])
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 382 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_disCmpName = fun name -> (if ((if ((if ((if ((if (bi_eq_str name "==") then true

                  else (bi_eq_str name "/="))) then true
              else (bi_eq_str name "<"))) then true
          else (bi_eq_str name "<="))) then true
      else (bi_eq_str name ">"))) then true
  else (bi_eq_str name ">="))

let v_Vuna_dTypecheck_delabAppExpr = fun fn fnElab args argTys argEls sp -> (match fn with
  | C_Vuna_dAst_dEVar (name, _) -> (match args with
  | (_) :: ((_) :: ([])) -> if v_Vuna_dTypecheck_disCmpName name then C_Vuna_dTypecheck_dXECmp (name,
      argEls, v_Vuna_dTypecheck_dfirstArgTy argTys, sp)
    else C_Vuna_dTypecheck_dXEApp (fnElab, argEls, sp)
  | _ -> C_Vuna_dTypecheck_dXEApp (fnElab, argEls, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 392 7 ("case pattern match failure"))
  | _ -> C_Vuna_dTypecheck_dXEApp (fnElab, argEls, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 390 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dlookupLocal = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> if bi_eq n name then C_Vuna_dBase_dJust (ty)
else v_Vuna_dTypecheck_dlookupLocal name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 424 1 ("no matching clause for Vuna.Typecheck.lookupLocal")

let rec v_Vuna_dTypecheck_dlookupScheme = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, sch)) :: (rest)) -> if bi_eq_str n name then C_Vuna_dBase_dJust (sch)

else v_Vuna_dTypecheck_dlookupScheme name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 428 1 ("no matching clause for Vuna.Typecheck.lookupScheme")

let rec v_Vuna_dTypecheck_dfunArgs = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> (a) :: (v_Vuna_dTypecheck_dfunArgs b)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 433 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfunResult = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dTypecheck_dfunResult b
  | _ -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 438 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfoldFun = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((a) :: (rest), body) -> C_Vuna_dTypecheck_dTFun (a, v_Vuna_dTypecheck_dfoldFun rest body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 442 1 ("no matching clause for Vuna.Typecheck.foldFun")

let rec v_Vuna_dTypecheck_dseedPatTypes = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((p) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedPatTypes rest st1 with
  | C_Vuna_dBase_dPair (tys, st2) -> C_Vuna_dBase_dPair ((ty) :: (tys), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 449 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 447 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 445 1 ("no matching clause for Vuna.Typecheck.seedPatTypes")

let rec v_Vuna_dTypecheck_dseedLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], locals, st) -> C_Vuna_dBase_dPair ([], C_Vuna_dBase_dPair (locals, st))
  | ((name) :: (rest), locals, st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedLocals rest ((C_Vuna_dBase_dPair (name,
          ty)) :: (locals)) st1 with
  | C_Vuna_dBase_dPair (tys, C_Vuna_dBase_dPair (locals2, st2)) -> C_Vuna_dBase_dPair ((ty) :: (tys),
      C_Vuna_dBase_dPair (locals2, st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 494 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 492 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 490 1 ("no matching clause for Vuna.Typecheck.seedLocals")

let v_Vuna_dTypecheck_ddeclFunName = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> name
  | _ -> ""
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 613 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dupdateScheme = fun name sch env -> (match env with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, s)) :: (rest) -> if bi_eq n name then (C_Vuna_dBase_dPair (n, sch)) :: (rest)

  else (C_Vuna_dBase_dPair (n, s)) :: (v_Vuna_dTypecheck_dupdateScheme name sch rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 635 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfreeVarsEnvExcept = fun name env -> (match env with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, sch)) :: (rest) -> if bi_eq n name then v_Vuna_dTypecheck_dfreeVarsEnvExcept
  name rest
  else v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsScheme sch) (v_Vuna_dTypecheck_dfreeVarsEnvExcept
    name rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 641 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dsubstOf = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s)) -> s
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 647 1 ("no matching clause for Vuna.Typecheck.substOf")

let rec v_Vuna_dTypecheck_dreplaceElab = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clauses, []) -> []
  | (name, clauses, (C_Vuna_dBase_dPair (n, old)) :: (rest)) -> if bi_eq_str n name then (C_Vuna_dBase_dPair
  (n, clauses)) :: (rest)
else (C_Vuna_dBase_dPair (n, old)) :: (v_Vuna_dTypecheck_dreplaceElab name clauses rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 694 1 ("no matching clause for Vuna.Typecheck.replaceElab")

let v_Vuna_dTypecheck_dfirstPat = fun a0 -> match a0 with
  | ((p) :: (rest)) -> p
  | ([]) -> C_Vuna_dAst_dPWild (C_Vuna_dBase_dSpan ("", 0, 0, 0, 0))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 823 1 ("no matching clause for Vuna.Typecheck.firstPat")

let rec v_Vuna_dTypecheck_dnthOrWild = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dAst_dPWild (C_Vuna_dBase_dSpan ("", 0, 0, 0, 0))
  | (0, (p) :: (rest)) -> p
  | (i, (p) :: (rest)) -> v_Vuna_dTypecheck_dnthOrWild (bi_sub i 1) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 826 1 ("no matching clause for Vuna.Typecheck.nthOrWild")

let v_Vuna_dTypecheck_dclausePatAt = fun a0 a1 -> match (a0, a1) with
  | (i, C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dTypecheck_dnthOrWild i pats
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 811 1 ("no matching clause for Vuna.Typecheck.clausePatAt")

let v_Vuna_dTypecheck_ddropFirstPat = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pats, body)) -> (match pats with
  | [] -> C_Vuna_dBase_dPair ([], body)
  | (p) :: (pr) -> C_Vuna_dBase_dPair (pr, body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 831 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 830 1 ("no matching clause for Vuna.Typecheck.dropFirstPat")

let v_Vuna_dTypecheck_dpatCoversCtor = fun c p -> (match p with
  | C_Vuna_dAst_dPVar (n, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | C_Vuna_dAst_dPCon (pn, subpats, _) -> bi_eq_str pn c
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 856 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dctorCovered = fun a0 a1 -> match (a0, a1) with
  | (c, []) -> false
  | (c, (p) :: (rest)) -> if v_Vuna_dTypecheck_dpatCoversCtor c p then true
else v_Vuna_dTypecheck_dctorCovered c rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 851 1 ("no matching clause for Vuna.Typecheck.ctorCovered")

let rec v_Vuna_dTypecheck_dallCtorsCovered = fun a0 a1 -> match (a0, a1) with
  | (pats, []) -> true
  | (pats, (c) :: (rest)) -> if v_Vuna_dTypecheck_dctorCovered c pats then v_Vuna_dTypecheck_dallCtorsCovered
pats rest
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 847 1 ("no matching clause for Vuna.Typecheck.allCtorsCovered")

let rec v_Vuna_dTypecheck_dhasCatchAll = fun a0 -> match a0 with
  | ([]) -> false
  | ((p) :: (rest)) -> (match p with
  | C_Vuna_dAst_dPVar (n, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> v_Vuna_dTypecheck_dhasCatchAll rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 864 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 862 1 ("no matching clause for Vuna.Typecheck.hasCatchAll")

let v_Vuna_dTypecheck_dsubsumes = fun earlier p -> (match earlier with
  | C_Vuna_dAst_dPVar (n, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | C_Vuna_dAst_dPCon (en, subpats, _) -> (match p with
  | C_Vuna_dAst_dPCon (pn, ps2, _) -> bi_eq_str en pn
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 886 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 882 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_danySubsumes = fun a0 a1 -> match (a0, a1) with
  | (p, []) -> false
  | (p, (earlier) :: (rest)) -> if v_Vuna_dTypecheck_dsubsumes earlier p then true
else v_Vuna_dTypecheck_danySubsumes p rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 877 1 ("no matching clause for Vuna.Typecheck.anySubsumes")

let rec v_Vuna_dTypecheck_dzipLocals = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> []
  | ((n) :: (ns), (t) :: (ts)) -> (C_Vuna_dBase_dPair (n, t)) :: (v_Vuna_dTypecheck_dzipLocals ns ts)
  | (_, _) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 900 1 ("no matching clause for Vuna.Typecheck.zipLocals")

let v_Vuna_dTypecheck_dschemeTy = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dScheme (qs, ty)) -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 904 1 ("no matching clause for Vuna.Typecheck.schemeTy")

let rec v_Vuna_dTypecheck_dflattenFun = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> (a) :: (v_Vuna_dTypecheck_dflattenFun b)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 907 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dcollectData = fun decls -> C_Vuna_dBase_dPair (v_Vuna_dTypecheck_ddeclDataNames
  decls, decls)

let v_Vuna_dCodegen_druntimeCode = "
type value =
  | VInt of int
  | VStr of string
  | VCon of string * value list
  | VFun of string * (value -> value)

let fail (msg : string) : 'a = failwith msg

let apply (fn : value) (arg : value) : value =
  match fn with
  | VFun (_, f) -> f arg
  | _ -> fail \"cannot apply a non-function\"

let expect_int (name : string) (v : value) : int =
  match v with VInt n -> n | _ -> fail (name ^ \": expected an Int argument\")

let expect_str (name : string) (v : value) : string =
  match v with VStr s -> s | _ -> fail (name ^ \": expected a String argument\")

let vbool (b : bool) : value = VCon ((if b then \"True\" else \"False\"), [])

let expect_bool (name : string) (v : value) : bool =
  match v with
  | VCon (\"True\", []) -> true
  | VCon (\"False\", []) -> false
  | _ -> fail (name ^ \": expected a Bool argument\")

let string_to_value (s : string) : value =
  let n = String.length s in
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (VCon (\"Cons\", [ VInt (Char.code s.[i]); acc ]))
  in
  go (n - 1) (VCon (\"Nil\", []))

let value_to_string (v : value) : string =
  let buf = Buffer.create 16 in
  let rec go (v : value) =
    match v with
    | VCon (\"Nil\", []) -> ()
    | VCon (\"Cons\", [ VInt c; rest ]) ->
        if c < 0 || c > 255 then fail \"strPack: character code out of range\";
        Buffer.add_char buf (Char.chr c);
        go rest
    | _ -> fail \"strPack expects a List Int\"
  in
  go v;
  Buffer.contents buf

let list_of_strings (strings : string list) : value =
  List.fold_right
    (fun s acc -> VCon (\"Cons\", [ VStr s; acc ]))
    strings (VCon (\"Nil\", []))

let read_file (path : string) : string =
  try
    let channel = open_in_bin path in
    Fun.protect
      ~finally:(fun () -> close_in_noerr channel)
      (fun () -> really_input_string channel (in_channel_length channel))
  with Sys_error message -> fail (\"readFile: \" ^ message)

let write_file (path : string) (contents : string) : int =
  try
    let channel = open_out_bin path in
    Fun.protect
      ~finally:(fun () -> close_out_noerr channel)
      (fun () -> output_string channel contents);
    String.length contents
  with Sys_error message -> fail (\"writeFile: \" ^ message)

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
  fun a -> VFun (\"+\", fun b -> VInt (expect_int \"+\" a + expect_int \"+\" b))

let bi_sub =
  fun a -> VFun (\"-\", fun b -> VInt (expect_int \"-\" a - expect_int \"-\" b))

let bi_mul =
  fun a -> VFun (\"*\", fun b -> VInt (expect_int \"*\" a * expect_int \"*\" b))

let bi_div =
  fun a ->
    VFun
      ( \"/\",
        fun b ->
          let x = expect_int \"/\" a in
          let y = expect_int \"/\" b in
          if y = 0 then fail \"division by zero\" else VInt (x / y) )

let bi_eq =
  fun a ->
    VFun
      ( \"==\",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x = y)
          | VStr x, VStr y -> vbool (x = y)
          | _ -> fail \"bad arguments for ==\" )

let bi_neq =
  fun a ->
    VFun
      ( \"/=\",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x <> y)
          | VStr x, VStr y -> vbool (x <> y)
          | _ -> fail \"bad arguments for /=\" )

let bi_lt =
  fun a -> VFun (\"<\", fun b -> vbool (expect_int \"<\" a < expect_int \"<\" b))

let bi_le =
  fun a -> VFun (\"<=\", fun b -> vbool (expect_int \"<=\" a <= expect_int \"<=\" b))

let bi_gt =
  fun a -> VFun (\">\", fun b -> vbool (expect_int \">\" a > expect_int \">\" b))

let bi_ge =
  fun a -> VFun (\">=\", fun b -> vbool (expect_int \">=\" a >= expect_int \">=\" b))

let bi_and =
  fun a ->
    VFun
      (\"&&\", fun b -> vbool (expect_bool \"&&\" a && expect_bool \"&&\" b))

let bi_or =
  fun a ->
    VFun (\"||\", fun b -> vbool (expect_bool \"||\" a || expect_bool \"||\" b))

let bi_concat =
  fun a -> VFun (\"++\", fun b -> VStr (expect_str \"++\" a ^ expect_str \"++\" b))

let bi_str_length = fun a -> VInt (String.length (expect_str \"strLength\" a))

let bi_str_unpack =
  fun a -> string_to_value (expect_str \"strUnpack\" a)

let bi_str_pack = fun a -> VStr (value_to_string a)

let bi_str_from_int =
  fun a -> VStr (string_of_int (expect_int \"strFromInt\" a))

let display_name (name : string) : string =
  match String.rindex_opt name '.' with
  | Some index -> String.sub name (index + 1) (String.length name - index - 1)
  | None -> name

let rec show_value (v : value) : string =
  match v with
  | VInt n -> string_of_int n
  | VStr s -> \"\\\"\" ^ show_chars s 0 (String.length s) ^ \"\\\"\"
  | VCon (name, []) -> display_name name
  | VCon (name, args) ->
      \"(\" ^ display_name name ^ \" \"
      ^ String.concat \" \" (List.map show_value args)
      ^ \")\"
  | VFun (\"\", _) -> \"<lambda>\"
  | VFun (name, _) -> \"<function \" ^ display_name name ^ \">\"

and show_chars (s : string) (i : int) (n : int) : string =
  if i >= n then \"\"
  else
    let rest = show_chars s (i + 1) n in
    match s.[i] with
    | '\"' -> \"\\\\\\\"\" ^ rest
    | '\\\\' -> \"\\\\\\\\\" ^ rest
    | '\\n' -> \"\\\\n\" ^ rest
    | '\\t' -> \"\\\\t\" ^ rest
    | '\\r' -> \"\\\\r\" ^ rest
    | '\\b' -> \"\\\\b\" ^ rest
    | c ->
        let code = Char.code c in
        if code >= 32 && code <= 126 then String.make 1 c ^ rest
        else Printf.sprintf \"\\\\%03d\" code ^ rest
"

let v_Vuna_dCodegen_dbuiltinInfos = (C_Vuna_dCodegen_dBuiltinInfo ("+", "bi_add", 2, "VInt (expect_int \"+\" a + expect_int \"+\" b)"))
:: ((C_Vuna_dCodegen_dBuiltinInfo ("-", "bi_sub", 2, "VInt (expect_int \"-\" a - expect_int \"-\" b)"))
  :: ((C_Vuna_dCodegen_dBuiltinInfo ("*", "bi_mul", 2, "VInt (expect_int \"*\" a * expect_int \"*\" b)"))
    :: ((C_Vuna_dCodegen_dBuiltinInfo ("/", "bi_div", 2, "let x = expect_int \"/\" a in let y = expect_int \"/\" b in if y = 0 then fail \"division by zero\" else VInt (x / y)"))
      :: ((C_Vuna_dCodegen_dBuiltinInfo ("==", "bi_eq", 2, "match (a, b) with VInt x, VInt y -> vbool (x = y) | VStr x, VStr y -> vbool (x = y) | _ -> fail \"bad arguments for ==\""))
        :: ((C_Vuna_dCodegen_dBuiltinInfo ("/=", "bi_neq", 2, "match (a, b) with VInt x, VInt y -> vbool (x <> y) | VStr x, VStr y -> vbool (x <> y) | _ -> fail \"bad arguments for /=\""))
          :: ((C_Vuna_dCodegen_dBuiltinInfo ("<", "bi_lt", 2, "vbool (expect_int \"<\" a < expect_int \"<\" b)"))
            :: ((C_Vuna_dCodegen_dBuiltinInfo ("<=", "bi_le", 2, "vbool (expect_int \"<=\" a <= expect_int \"<=\" b)"))
              :: ((C_Vuna_dCodegen_dBuiltinInfo (">", "bi_gt", 2, "vbool (expect_int \">\" a > expect_int \">\" b)"))
                :: ((C_Vuna_dCodegen_dBuiltinInfo (">=", "bi_ge", 2, "vbool (expect_int \">=\" a >= expect_int \">=\" b)"))
                  :: ((C_Vuna_dCodegen_dBuiltinInfo ("&&", "bi_and", 2, "vbool (expect_bool \"&&\" a && expect_bool \"&&\" b)"))
                    :: ((C_Vuna_dCodegen_dBuiltinInfo ("||", "bi_or", 2, "vbool (expect_bool \"||\" a || expect_bool \"||\" b)"))
                      :: ((C_Vuna_dCodegen_dBuiltinInfo ("++", "bi_concat", 2, "VStr (expect_str \"++\" a ^ expect_str \"++\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("strLength", "bi_str_length", 1, "VInt (String.length (expect_str \"strLength\" a))"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("strUnpack", "bi_str_unpack", 1, "string_to_value (expect_str \"strUnpack\" a)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("strPack", "bi_str_pack", 1, "VStr (value_to_string a)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("strFromInt", "bi_str_from_int", 1, "VStr (string_of_int (expect_int \"strFromInt\" a))"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("readFile", "bi_read_file", 1, "VStr (read_file (expect_str \"readFile\" a))"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("writeFile", "bi_write_file", 2, "VInt (write_file (expect_str \"writeFile\" a) (expect_str \"writeFile\" b))"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("print", "bi_print", 1, "let text = expect_str \"print\" a in VInt (print_stdout text)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("getArgs", "bi_get_args", 0, "get_args ()"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("fileExists", "bi_file_exists", 1, "vbool (Sys.file_exists (expect_str \"fileExists\" a))"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("exit", "bi_exit", 1, "exit (expect_int \"exit\" a)"))
                        :: ([])))))))))))))))))))))))

let rec v_Vuna_dCodegen_dfindBuiltin = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) :: (rest)) -> if bi_eq_str vname
name then C_Vuna_dBase_dJust (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body))
else v_Vuna_dCodegen_dfindBuiltin name rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 40 1 ("no matching clause for Vuna.Codegen.findBuiltin")

let rec v_Vuna_dCodegen_djoinList = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dCodegen_djoinList sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 44 1 ("no matching clause for Vuna.Codegen.joinList")

let v_Vuna_dCodegen_dheadOf = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: (rest)) -> x
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 48 1 ("no matching clause for Vuna.Codegen.headOf")

let rec v_Vuna_dCodegen_dnthList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> ""
  | (n, (x) :: (rest)) -> if bi_eq_int n 0 then x
else v_Vuna_dCodegen_dnthList (bi_sub n 1) rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 51 1 ("no matching clause for Vuna.Codegen.nthList")

let v_Vuna_dCodegen_dsanitizeChar = fun c -> if bi_eq_int c 46 then (95) :: ((100) :: ([]))
else if bi_eq_int c 95 then (95) :: ((117) :: ([]))
else if bi_eq_int c 39 then (95) :: ((112) :: ([]))
else (c) :: ([])

let v_Vuna_dCodegen_dpad3 = fun s -> if bi_eq_int (bi_str_length s) 1 then (("00") ^ (s))
else if bi_eq_int (bi_str_length s) 2 then (("0") ^ (s))
else s

let v_Vuna_dCodegen_descapeChar = fun c -> if bi_eq_int c 34 then (92) :: ((34) :: ([]))
else if bi_eq_int c 92 then (92) :: ((92) :: ([]))
else if bi_eq_int c 10 then (92) :: ((110) :: ([]))
else if bi_eq_int c 9 then (92) :: ((116) :: ([]))
else if bi_eq_int c 13 then (92) :: ((114) :: ([]))
else if (if (bi_ge_int c 32) then (bi_le_int c 126)
  else false) then (c) :: ([])
else bi_str_unpack ((("\\") ^ (v_Vuna_dCodegen_dpad3 (bi_str_from_int c))))

let rec v_Vuna_dCodegen_dcgApplyFold = fun a0 a1 -> match (a0, a1) with
  | (acc, []) -> acc
  | (acc, (a) :: (rest)) -> v_Vuna_dCodegen_dcgApplyFold ((let vuna_cat0' = ("(apply (") in
    (let vuna_cat1' = (acc) in
      (let vuna_cat2' = (") (") in
        (let vuna_cat3' = (a) in
          (let vuna_cat4' = ("))") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 150 1 ("no matching clause for Vuna.Codegen.cgApplyFold")

let rec v_Vuna_dCodegen_dmakeParamsFrom = fun i n -> if bi_gt_int i n then []
else ((("a") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeParams = fun n -> v_Vuna_dCodegen_dmakeParamsFrom 1 n

let rec v_Vuna_dCodegen_dmakeCtorParamsFrom = fun i n -> if bi_gt_int i n then []
else ((("c") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeCtorParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeCtorParams = fun n -> v_Vuna_dCodegen_dmakeCtorParamsFrom 1 n

let v_Vuna_dEval_dnoLocSpan = C_Vuna_dBase_dSpan ("", 0, 0, 0, 0)

let v_Vuna_dEval_dvbool = fun b -> if b then C_Vuna_dEval_dVCon ("True", [])
else C_Vuna_dEval_dVCon ("False", [])

let rec v_Vuna_dEval_dcharsToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((c) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVInt (c)) :: ((v_Vuna_dEval_dcharsToValue
      rest) :: ([])))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 224 1 ("no matching clause for Vuna.Eval.charsToValue")

let v_Vuna_dEval_dstringToValue = fun s -> v_Vuna_dEval_dcharsToValue (bi_str_unpack s)

let rec v_Vuna_dEval_dstrListToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((s) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVStr (s)) :: ((v_Vuna_dEval_dstrListToValue
      rest) :: ([])))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 229 1 ("no matching clause for Vuna.Eval.strListToValue")

let rec v_Vuna_dEval_dshowStringChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> if bi_eq_int c 34 then (("\\\"") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 92 then (("\\\\") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 10 then (("\\n") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 9 then (("\\t") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 13 then (("\\r") ^ (v_Vuna_dEval_dshowStringChars rest))
else ((bi_str_pack ((c) :: ([]))) ^ (v_Vuna_dEval_dshowStringChars rest))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 371 1 ("no matching clause for Vuna.Eval.showStringChars")

let v_Vuna_dEval_dshowString = fun s -> (let vuna_cat0' = ("\"") in
  (let vuna_cat1' = (v_Vuna_dEval_dshowStringChars (bi_str_unpack s)) in
    (let vuna_cat2' = ("\"") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dLoader_disGlobalCtor = fun name -> (if ((if ((if (bi_eq_str name "True") then true
          else (bi_eq_str name "False"))) then true
      else (bi_eq_str name "Cons"))) then true
  else (bi_eq_str name "Nil"))

let v_Vuna_dLoader_dmangle = fun prefix name -> if bi_eq_str prefix "" then name
else (let vuna_cat0' = (prefix) in
  (let vuna_cat1' = (".") in
    (let vuna_cat2' = (name) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dLoader_dimportName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 44 1 ("no matching clause for Vuna.Loader.importName")

let v_Vuna_dLoader_dimportIsQualified = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> isQualified
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 46 1 ("no matching clause for Vuna.Loader.importIsQualified")

let v_Vuna_dLoader_dimportAlias = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> alias
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 48 1 ("no matching clause for Vuna.Loader.importAlias")

let rec v_Vuna_dLoader_dimportAliases = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> (match v_Vuna_dLoader_dimportAlias imp with
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dimportAliases rest
  | C_Vuna_dBase_dJust (alias) -> (C_Vuna_dBase_dPair (alias, v_Vuna_dLoader_dimportName imp)) :: (v_Vuna_dLoader_dimportAliases
      rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 60 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 57 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dopenModuleNames = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> if v_Vuna_dLoader_dimportIsQualified imp then v_Vuna_dLoader_dopenModuleNames rest

  else (v_Vuna_dLoader_dimportName imp) :: (v_Vuna_dLoader_dopenModuleNames rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 83 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dfindImportPrefix = fun imports prefix -> (match imports with
  | [] -> C_Vuna_dBase_dNothing
  | (imp) :: (rest) -> if bi_eq_str (v_Vuna_dLoader_dimportName imp) prefix then C_Vuna_dBase_dJust (v_Vuna_dLoader_dimportName
    imp)
  else (match v_Vuna_dLoader_dimportAlias imp with
  | C_Vuna_dBase_dJust (alias) -> if bi_eq_str alias prefix then C_Vuna_dBase_dJust (v_Vuna_dLoader_dimportName
      imp)
    else v_Vuna_dLoader_dfindImportPrefix rest prefix
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dfindImportPrefix rest prefix
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 95 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 90 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_djoinNames = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (", ") in
    (let vuna_cat2' = (v_Vuna_dLoader_djoinNames rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 100 1 ("no matching clause for Vuna.Loader.joinNames")

let rec v_Vuna_dLoader_dfindModule = fun modules name -> (match modules with
  | [] -> C_Vuna_dBase_dNothing
  | (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) :: (rest) -> if bi_eq_str mname name then
  C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports))
  else v_Vuna_dLoader_dfindModule rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 148 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmoduleDecls = fun modules name -> (match v_Vuna_dLoader_dfindModule modules name with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) -> decls
  | C_Vuna_dBase_dNothing -> []
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 105 3 ("case pattern match failure"))

let v_Vuna_dLoader_dexportsOf = fun modules name -> (match v_Vuna_dLoader_dfindModule modules name with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) -> exports
  | C_Vuna_dBase_dNothing -> []
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 154 3 ("case pattern match failure"))

let v_Vuna_dLoader_dtyShape = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (n, _) -> (("var ") ^ (n))
  | C_Vuna_dAst_dEApp (f, a, _) -> "app"
  | C_Vuna_dAst_dEInt (n, _) -> "int"
  | C_Vuna_dAst_dEStr (s, _) -> "str"
  | C_Vuna_dAst_dELam (ps, b, _) -> "lam"
  | C_Vuna_dAst_dELet (bs, b, _) -> "let"
  | C_Vuna_dAst_dECase (s, alts, _) -> "case"
  | C_Vuna_dAst_dEIf (c, t, e, _) -> "if"
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 396 3 ("case pattern match failure"))

let v_Vuna_dBuiltins_dbuiltinArity = fun a0 -> match a0 with
  | ("+") -> C_Vuna_dBase_dJust (2)
  | ("-") -> C_Vuna_dBase_dJust (2)
  | ("*") -> C_Vuna_dBase_dJust (2)
  | ("/") -> C_Vuna_dBase_dJust (2)
  | ("==") -> C_Vuna_dBase_dJust (2)
  | ("/=") -> C_Vuna_dBase_dJust (2)
  | ("<") -> C_Vuna_dBase_dJust (2)
  | ("<=") -> C_Vuna_dBase_dJust (2)
  | (">") -> C_Vuna_dBase_dJust (2)
  | (">=") -> C_Vuna_dBase_dJust (2)
  | ("&&") -> C_Vuna_dBase_dJust (2)
  | ("||") -> C_Vuna_dBase_dJust (2)
  | ("++") -> C_Vuna_dBase_dJust (2)
  | ("strLength") -> C_Vuna_dBase_dJust (1)
  | ("strUnpack") -> C_Vuna_dBase_dJust (1)
  | ("strPack") -> C_Vuna_dBase_dJust (1)
  | ("strFromInt") -> C_Vuna_dBase_dJust (1)
  | ("readFile") -> C_Vuna_dBase_dJust (1)
  | ("writeFile") -> C_Vuna_dBase_dJust (2)
  | ("print") -> C_Vuna_dBase_dJust (1)
  | ("getArgs") -> C_Vuna_dBase_dJust (0)
  | ("fileExists") -> C_Vuna_dBase_dJust (1)
  | ("exit") -> C_Vuna_dBase_dJust (1)
  | (_) -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Builtins.vuna" 5 1 ("no matching clause for Vuna.Builtins.builtinArity")

let v_Vuna_dLoader_disBuiltinName = fun name -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dBase_dJust (arity) -> true
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 159 3 ("case pattern match failure"))

let v_Vuna_dParser_dposOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> p
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 13 1 ("no matching clause for Vuna.Parser.posOf")

let v_Vuna_dParser_dtokOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> t
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 15 1 ("no matching clause for Vuna.Parser.tokOf")

let v_Vuna_dParser_dfileOf = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> file
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 17 1 ("no matching clause for Vuna.Parser.fileOf")

let v_Vuna_dParser_dpeekTok = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> (match toks with
  | (t) :: (rest) -> t
  | [] -> C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, C_Vuna_dBase_dPos (1, 1))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 23 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 22 1 ("no matching clause for Vuna.Parser.peekTok")

let v_Vuna_dParser_dpeekPos = fun st -> v_Vuna_dParser_dposOf (v_Vuna_dParser_dpeekTok st)

let v_Vuna_dParser_dlastPos = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> last
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 29 1 ("no matching clause for Vuna.Parser.lastPos")

let v_Vuna_dParser_dadvance = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> (match toks with
  | (t) :: (rest) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> C_Vuna_dParser_dPState (file, toks, last)
  | _ -> C_Vuna_dParser_dPState (file, rest, v_Vuna_dParser_dposOf t)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 34 7 ("case pattern match failure"))
  | [] -> C_Vuna_dParser_dPState (file, toks, last)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 32 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 31 1 ("no matching clause for Vuna.Parser.advance")

let v_Vuna_dParser_disEof = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 40 3 ("case pattern match failure"))

let v_Vuna_dParser_datSym = fun st s -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> bi_eq_str x s
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 45 3 ("case pattern match failure"))

let v_Vuna_dParser_datKw = fun st k -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> bi_eq_str x k
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 50 3 ("case pattern match failure"))

let v_Vuna_dParser_dcanContinue = fun st blockCol -> (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> (match v_Vuna_dParser_dlastPos st with
  | C_Vuna_dBase_dPos (lastLine, lastCol) -> (if (bi_eq_int line lastLine) then true
      else (bi_gt_int col blockCol))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 57 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 55 3 ("case pattern match failure"))

let v_Vuna_dParser_dexpectSym = fun st s -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> if bi_eq_str x s then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
    (0, v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dErr ((("expected ") ^ (s)))
  | _ -> C_Vuna_dBase_dErr ((("expected ") ^ (s)))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 61 3 ("case pattern match failure"))

let v_Vuna_dParser_dexpectKw = fun st k -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> if bi_eq_str x k then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
    (0, v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dErr ((("expected ") ^ (k)))
  | _ -> C_Vuna_dBase_dErr ((("expected ") ^ (k)))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 66 3 ("case pattern match failure"))

let v_Vuna_dParser_dexpectIdent = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (x, v_Vuna_dParser_dadvance
      st))
  | _ -> C_Vuna_dBase_dErr ("expected identifier")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 71 3 ("case pattern match failure"))

let v_Vuna_dParser_dupperFirst = fun s -> (match bi_str_unpack s with
  | (c) :: (rest) -> (if (bi_ge_int c 65) then (bi_le_int c 90)
    else false)
  | [] -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 76 3 ("case pattern match failure"))

let v_Vuna_dParser_dstartsAtom = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("Type"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 81 3 ("case pattern match failure"))

let v_Vuna_dParser_dstartsPatternAtom = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 91 3 ("case pattern match failure"))

let v_Vuna_dParser_dinfixInfo = fun a0 -> match a0 with
  | ("->") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (1, 1))
  | ("||") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (2, 0))
  | ("&&") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (3, 0))
  | ("==") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0))
  | ("/=") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0))
  | ("<") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0))
  | ("<=") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0))
  | (">") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0))
  | (">=") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0))
  | ("++") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (5, 1))
  | ("+") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (6, 0))
  | ("-") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (6, 0))
  | ("*") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (7, 0))
  | ("/") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (7, 0))
  | ("::") -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (8, 1))
  | (_) -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 99 1 ("no matching clause for Vuna.Parser.infixInfo")

let v_Vuna_dParser_dopExpr = fun a0 a1 -> match (a0, a1) with
  | ("::", sp) -> C_Vuna_dAst_dEVar ("Cons", sp)
  | (op, sp) -> C_Vuna_dAst_dEVar (op, sp)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 116 1 ("no matching clause for Vuna.Parser.opExpr")

let rec v_Vuna_dParser_dcountArrows = fun e -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (x) :: ((rest) :: ([])), _) -> bi_add 1 (v_Vuna_dParser_dcountArrows
    rest)
  | _ -> 0
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 120 3 ("case pattern match failure"))

let v_Vuna_dParser_dterminatesExpression = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (")"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("]"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (","), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("else"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("in"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("then"), p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 125 3 ("case pattern match failure"))

let v_Vuna_dParser_dbadCaseIndent = fun st altCol -> if v_Vuna_dParser_disEof st then false
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_gt_int col altCol then (match v_Vuna_dParser_dterminatesExpression
    (v_Vuna_dParser_dpeekTok st) with
  | true -> false
  | false -> true
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 140 11 ("case pattern match failure"))
  else false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 137 5 ("case pattern match failure"))

let rec v_Vuna_dParser_dfoldCons = fun a0 a1 -> match (a0, a1) with
  | (sp, []) -> C_Vuna_dAst_dEVar ("Nil", sp)
  | (sp, (e) :: (rest)) -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("Cons", sp), (e) :: ((v_Vuna_dParser_dfoldCons
      sp rest) :: ([])), sp)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 325 1 ("no matching clause for Vuna.Parser.foldCons")

let rec v_Vuna_dParser_dfoldPCon = fun a0 a1 -> match (a0, a1) with
  | (sp, []) -> C_Vuna_dAst_dPCon ("Nil", [], sp)
  | (sp, (p) :: (rest)) -> C_Vuna_dAst_dPCon ("Cons", (p) :: ((v_Vuna_dParser_dfoldPCon sp rest) :: ([])),
  sp)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 469 1 ("no matching clause for Vuna.Parser.foldPCon")

let v_Vuna_dLexer_dadvanceChar = fun a0 a1 -> match (a0, a1) with
  | (c, C_Vuna_dBase_dPos (line, col)) -> if bi_eq_int c 10 then C_Vuna_dBase_dPos (bi_add line 1, 1)

else C_Vuna_dBase_dPos (line, bi_add col 1)
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 19 1 ("no matching clause for Vuna.Lexer.advanceChar")

let v_Vuna_dLexer_disUpperChar = fun c -> (if (bi_ge_int c 65) then (bi_le_int c 90)
  else false)

let v_Vuna_dLexer_disLowerChar = fun c -> (if (bi_ge_int c 97) then (bi_le_int c 122)
  else false)

let v_Vuna_dLoader_disLowerTypeName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> v_Vuna_dLexer_disLowerChar c
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 276 3 ("case pattern match failure"))

let v_Vuna_dLexer_disIdentStart = fun c -> (if ((if (v_Vuna_dLexer_disUpperChar c) then true
      else (v_Vuna_dLexer_disLowerChar c))) then true
  else (bi_eq_int c 95))

let v_Vuna_dLexer_disDigit = fun c -> (if (bi_ge_int c 48) then (bi_le_int c 57)
  else false)

let rec v_Vuna_dLoader_dallIdentChars = fun chars -> (match chars with
  | [] -> true
  | (c) :: (rest) -> if (if (v_Vuna_dLexer_disIdentStart c) then true
    else (v_Vuna_dLexer_disDigit c)) then v_Vuna_dLoader_dallIdentChars rest
  else false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 14 3 ("case pattern match failure"))

let v_Vuna_dLoader_dvalidSegment = fun seg -> (match bi_str_unpack seg with
  | [] -> false
  | (c) :: (rest) -> (if (v_Vuna_dLexer_disUpperChar c) then (v_Vuna_dLoader_dallIdentChars rest)
    else false)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 20 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dallSegmentsValid = fun segs -> (match segs with
  | [] -> false
  | (seg) :: (rest) -> if v_Vuna_dLoader_dvalidSegment seg then (match rest with
  | [] -> true
  | _ -> v_Vuna_dLoader_dallSegmentsValid rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 29 9 ("case pattern match failure"))
  else false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 25 3 ("case pattern match failure"))

let v_Vuna_dLexer_disIdentChar = fun c -> (if ((if (v_Vuna_dLexer_disIdentStart c) then true
      else (v_Vuna_dLexer_disDigit c))) then true
  else (bi_eq_int c 39))

let v_Vuna_dLexer_disSpace = fun c -> (if ((if ((if (bi_eq_int c 32) then true
          else (bi_eq_int c 9))) then true
      else (bi_eq_int c 10))) then true
  else (bi_eq_int c 13))

let v_Vuna_dLexer_disOpChar = fun c -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if
                        ((if ((if ((if ((if (bi_eq_int c 33) then true
                        else (bi_eq_int c 36))) then true
                        else (bi_eq_int c 37))) then true
                        else (bi_eq_int c 38))) then true
                        else (bi_eq_int c 42))) then true
                        else (bi_eq_int c 43))) then true
                        else (bi_eq_int c 45))) then true
                        else (bi_eq_int c 47))) then true
                        else (bi_eq_int c 60))) then true
                        else (bi_eq_int c 61))) then true
                        else (bi_eq_int c 62))) then true
                        else (bi_eq_int c 63))) then true
                      else (bi_eq_int c 64))) then true
                  else (bi_eq_int c 92))) then true
              else (bi_eq_int c 94))) then true
          else (bi_eq_int c 124))) then true
      else (bi_eq_int c 126))) then true
  else (bi_eq_int c 58))

let v_Vuna_dLexer_disKeyword = fun s -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if (bi_eq_str
                        s "data") then true
                        else (bi_eq_str s "case"))) then true
                        else (bi_eq_str s "of"))) then true
                        else (bi_eq_str s "let"))) then true
                        else (bi_eq_str s "in"))) then true
                        else (bi_eq_str s "if"))) then true
                        else (bi_eq_str s "then"))) then true
                      else (bi_eq_str s "else"))) then true
                  else (bi_eq_str s "where"))) then true
              else (bi_eq_str s "Type"))) then true
          else (bi_eq_str s "import"))) then true
      else (bi_eq_str s "qualified"))) then true
  else (bi_eq_str s "as"))

let v_Vuna_dLexer_dclassifyIdent = fun s -> if v_Vuna_dLexer_disKeyword s then C_Vuna_dLexer_dTKw (s)

else C_Vuna_dLexer_dTIdent (s)

let rec v_Vuna_dLexer_dskipLineComment = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dChars ([], p)) -> C_Vuna_dLexer_dChars ([], p)
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p)) -> if bi_eq_int c 10 then C_Vuna_dLexer_dChars ((c) :: (rest),
  p)
else v_Vuna_dLexer_dskipLineComment (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 46 1 ("no matching clause for Vuna.Lexer.skipLineComment")

let rec v_Vuna_dLexer_dskipBlockComment = fun depth cs -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dErr ("unterminated block comment")
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> (match rest with
  | (c2) :: (rest2) -> if (if (bi_eq_int c 123) then (bi_eq_int c2 45)
      else false) then v_Vuna_dLexer_dskipBlockComment (bi_add depth 1) (C_Vuna_dLexer_dChars (rest2,
        v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p)))
    else if (if (bi_eq_int c 45) then (bi_eq_int c2 125)
      else false) then if bi_eq_int depth 1 then C_Vuna_dBase_dOk (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar
        c2 (v_Vuna_dLexer_dadvanceChar c p)))
    else v_Vuna_dLexer_dskipBlockComment (bi_sub depth 1) (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar
        c2 (v_Vuna_dLexer_dadvanceChar c p)))
    else v_Vuna_dLexer_dskipBlockComment depth (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
        c p))
  | [] -> v_Vuna_dLexer_dskipBlockComment depth (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
        c p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 55 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 52 3 ("case pattern match failure"))

let rec v_Vuna_dLexer_dskipTrivia = fun cs -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dOk (cs)
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> if v_Vuna_dLexer_disSpace c then v_Vuna_dLexer_dskipTrivia
  (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  else (match rest with
  | (c2) :: (rest2) -> if (if (bi_eq_int c 45) then (bi_eq_int c2 45)
      else false) then v_Vuna_dLexer_dskipTrivia (v_Vuna_dLexer_dskipLineComment (C_Vuna_dLexer_dChars
        (rest, v_Vuna_dLexer_dadvanceChar c p)))
    else if (if (bi_eq_int c 123) then (bi_eq_int c2 45)
      else false) then (match v_Vuna_dLexer_dskipBlockComment 1 (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
          c p)) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (cs2) -> v_Vuna_dLexer_dskipTrivia cs2
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 76 15 ("case pattern match failure"))
    else C_Vuna_dBase_dOk (cs)
  | [] -> C_Vuna_dBase_dOk (cs)
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 71 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 66 3 ("case pattern match failure"))

let rec v_Vuna_dLexer_dcollectInt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disDigit c then v_Vuna_dLexer_dcollectInt
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) (bi_add (bi_mul acc 10) (bi_sub c 48))
else C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 94 1 ("no matching clause for Vuna.Lexer.collectInt")

let v_Vuna_dAst_dpatSpan = fun pat -> (match pat with
  | C_Vuna_dAst_dPVar (name, sp) -> sp
  | C_Vuna_dAst_dPWild (sp) -> sp
  | C_Vuna_dAst_dPCon (name, pats, sp) -> sp
  | C_Vuna_dAst_dPInt (n, sp) -> sp
  | C_Vuna_dAst_dPStr (s, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 32 3 ("case pattern match failure"))

let v_Vuna_dAst_dexprSpan = fun expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> sp
  | C_Vuna_dAst_dEInt (n, sp) -> sp
  | C_Vuna_dAst_dEStr (s, sp) -> sp
  | C_Vuna_dAst_dELam (ps, body, sp) -> sp
  | C_Vuna_dAst_dEApp (fn, args, sp) -> sp
  | C_Vuna_dAst_dELet (binds, body, sp) -> sp
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> sp
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 40 3 ("case pattern match failure"))

let v_Vuna_dAst_ddeclSpan = fun decl -> (match decl with
  | C_Vuna_dAst_dDData (name, params, ctors, sp) -> sp
  | C_Vuna_dAst_dDSig (name, ty, sp) -> sp
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 51 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, sp)) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 56 1 ("no matching clause for Vuna.Ast.ctorSpan")

let v_Vuna_dAst_dimportSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 61 1 ("no matching clause for Vuna.Ast.importSpan")

let rec v_Vuna_dAst_dcollectClauses = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, _) -> if bi_eq_str n name then (C_Vuna_dBase_dPair (pats, body))
  :: (v_Vuna_dAst_dcollectClauses rest name)
  else v_Vuna_dAst_dcollectClauses rest name
  | _ -> v_Vuna_dAst_dcollectClauses rest name
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 65 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 63 1 ("no matching clause for Vuna.Ast.collectClauses")

let v_Vuna_dAst_dclausesFor = fun decls name -> v_Vuna_dAst_dcollectClauses decls name

let v_Vuna_dAst_dctorName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> name
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 78 1 ("no matching clause for Vuna.Ast.ctorName")

let v_Vuna_dAst_dctorType = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> ty
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 80 1 ("no matching clause for Vuna.Ast.ctorType")

let rec v_Vuna_dAst_dtypeArity = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (x) :: ((rest) :: ([])), _) -> bi_add 1 (v_Vuna_dAst_dtypeArity
    rest)
  | _ -> 0
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 83 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorArityOf = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> arity
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 87 1 ("no matching clause for Vuna.Ast.ctorArityOf")

let rec v_Vuna_dCodegen_dctorPairs = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (C_Vuna_dBase_dPair (v_Vuna_dAst_dctorName c, v_Vuna_dAst_dctorArityOf c)) :: (v_Vuna_dCodegen_dctorPairs
  rest)
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 239 1 ("no matching clause for Vuna.Codegen.ctorPairs")

let rec v_Vuna_dAst_dlookupCtorArity = fun name ctors -> (match ctors with
  | [] -> C_Vuna_dBase_dNothing
  | (c) :: (rest) -> if bi_eq_str (v_Vuna_dAst_dctorName c) name then C_Vuna_dBase_dJust (v_Vuna_dAst_dctorArityOf
    c)
  else v_Vuna_dAst_dlookupCtorArity name rest
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 90 3 ("case pattern match failure"))

let rec v_Vuna_dAst_dctorArity = fun name decls -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, _) -> (match v_Vuna_dAst_dlookupCtorArity name ctors with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dJust (arity)
  | C_Vuna_dBase_dNothing -> v_Vuna_dAst_dctorArity name rest
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 101 11 ("case pattern match failure"))
  | _ -> v_Vuna_dAst_dctorArity name rest
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 99 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 96 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dcheckNoCtorFun = fun a0 a1 -> match (a0, a1) with
  | ([], decls) -> C_Vuna_dBase_dOk ([])
  | ((C_Vuna_dBase_dPair (name, clauses)) :: (rest), decls) -> (match v_Vuna_dAst_dctorArity name decls
  with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dErr ((("name is both a constructor and a function: ")
      ^ (name)))
  | C_Vuna_dBase_dNothing -> v_Vuna_dCodegen_dcheckNoCtorFun rest decls
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 257 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 255 1 ("no matching clause for Vuna.Codegen.checkNoCtorFun")

let v_Vuna_dAst_ddeclTypeNames = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _) -> (name) :: ([])
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 122 3 ("case pattern match failure"))

let v_Vuna_dBase_dposLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (l, c)) -> l
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 32 1 ("no matching clause for Vuna.Base.posLine")

let v_Vuna_dBase_dposCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (l, c)) -> c
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 34 1 ("no matching clause for Vuna.Base.posCol")

let v_Vuna_dParser_dspanOf = fun st st2 -> C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine
  (v_Vuna_dParser_dpeekPos st), v_Vuna_dBase_dposCol (v_Vuna_dParser_dpeekPos st), v_Vuna_dBase_dposLine
  (v_Vuna_dParser_dlastPos st2), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos st2))

let v_Vuna_dBase_dspanFile = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> f
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 36 1 ("no matching clause for Vuna.Base.spanFile")

let v_Vuna_dBase_dspanStartLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> sl
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 38 1 ("no matching clause for Vuna.Base.spanStartLine")

let v_Vuna_dBase_dspanStartCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> sc
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 40 1 ("no matching clause for Vuna.Base.spanStartCol")

let v_Vuna_dBase_dspanEndLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> el
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 42 1 ("no matching clause for Vuna.Base.spanEndLine")

let v_Vuna_dBase_dspanEndCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> ec
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 44 1 ("no matching clause for Vuna.Base.spanEndCol")

let v_Vuna_dBase_dshowSpanLoc = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> (let vuna_cat0' = (f) in
  (let vuna_cat1' = (":") in
    (let vuna_cat2' = (bi_str_from_int sl) in
      (let vuna_cat3' = (":") in
        (let vuna_cat4' = (bi_str_from_int sc) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 47 1 ("no matching clause for Vuna.Base.showSpanLoc")

let v_Vuna_dTypecheck_dfunLoc = fun name decls -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> ""
  | (C_Vuna_dBase_dPair (pats, body)) :: (_) -> (let sp = v_Vuna_dAst_dexprSpan body in
    if bi_eq_int (v_Vuna_dBase_dspanStartLine sp) 0 then ""
    else ((v_Vuna_dBase_dshowSpanLoc sp) ^ (": ")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 651 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dbindWarnings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, decls, C_Vuna_dBase_dPair (pat, value)) -> (match pat with
  | C_Vuna_dAst_dPVar (n, _) -> []
  | C_Vuna_dAst_dPWild (_) -> []
  | _ -> (((v_Vuna_dBase_dshowSpanLoc (v_Vuna_dAst_dpatSpan pat)) ^ (": non-exhaustive let pattern")))
  :: ([])
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 788 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 787 1 ("no matching clause for Vuna.Typecheck.bindWarnings")

let v_Vuna_dEval_derrAt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec), msg) -> if bi_eq_int sl 0 then C_Vuna_dBase_dErr (msg)
else C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc (C_Vuna_dBase_dSpan (f, sl, sc, el,
          ec))) in
    (let vuna_cat1' = (": ") in
      (let vuna_cat2' = (msg) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 18 1 ("no matching clause for Vuna.Eval.errAt")

let v_Vuna_dEval_dexpectBoolValue = fun sp v -> (match v with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (v)
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (v)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 79 3 ("case pattern match failure"))

let v_Vuna_dEval_dintArg = fun sp v -> (match v with
  | C_Vuna_dEval_dVInt (n) -> C_Vuna_dBase_dOk (n)
  | _ -> v_Vuna_dEval_derrAt sp "expected an Int argument"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 213 3 ("case pattern match failure"))

let v_Vuna_dEval_dstringArg = fun sp v -> (match v with
  | C_Vuna_dEval_dVStr (s) -> C_Vuna_dBase_dOk (s)
  | _ -> v_Vuna_dEval_derrAt sp "expected a String argument"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 218 3 ("case pattern match failure"))

let v_Vuna_dEval_deqBuiltin = fun sp args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_eq_int a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_eq_str a b))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for =="
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 258 3 ("case pattern match failure"))

let v_Vuna_dEval_dneqBuiltin = fun sp args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_neq_int a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_neq_str a b))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for /="
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 264 3 ("case pattern match failure"))

let v_Vuna_dEval_dandBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 274 11 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 272 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for &&"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 270 3 ("case pattern match failure"))

let v_Vuna_dEval_dorBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 288 11 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 285 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for ||"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 283 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dappend = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (xs), ys) -> (x) :: (v_Vuna_dBase_dappend xs ys)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 50 1 ("no matching clause for Vuna.Base.append")

let v_Lint_dreplaceRange = fun start stop newLines lines -> v_Vuna_dBase_dappend (v_Lint_dtakeList (bi_sub
    start 1) lines) (v_Vuna_dBase_dappend newLines (v_Lint_ddropList stop lines))

let rec v_Lint_dapplyEditList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | ([], lines, limit, count) -> C_Vuna_dBase_dPair (count, lines)
  | ((e) :: (rest), lines, limit, count) -> if bi_lt_int (v_Lint_deditEnd e) limit then v_Lint_dapplyEditList
rest (v_Lint_dreplaceRange (v_Lint_deditStart e) (v_Lint_deditEnd e) (v_Lint_deditLines e) lines) (v_Lint_deditStart
  e) (bi_add count 1)
else v_Lint_dapplyEditList rest lines limit count
  | _ -> vuna_fail "app/Lint.vuna" 714 1 ("no matching clause for Lint.applyEditList")

let rec v_Vuna_dTypedCodegen_dconcatFlatten = fun e -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("++", _), (a) :: ((b) :: ([])), _) -> v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dconcatFlatten
    a) (v_Vuna_dTypedCodegen_dconcatFlatten b)
  | _ -> (e) :: ([])
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 328 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dpatVarsTy = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dAst_dPVar (n, _), ty) -> (C_Vuna_dBase_dPair (n, ty)) :: ([])
  | (C_Vuna_dAst_dPCon (_, subpats, _), ty) -> v_Vuna_dTypecheck_dsubPatsVarNames subpats ty
  | (_, ty) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 780 1 ("no matching clause for Vuna.Typecheck.patVarsTy")
and v_Vuna_dTypecheck_dsubPatsVarNames = fun a0 a1 -> match (a0, a1) with
  | ([], ty) -> []
  | ((p) :: (rest), ty) -> v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dpatVarsTy p ty) (v_Vuna_dTypecheck_dsubPatsVarNames
  rest ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 784 1 ("no matching clause for Vuna.Typecheck.subPatsVarNames")

let rec v_Vuna_dTypecheck_dredWarn = fun a0 a1 -> match (a0, a1) with
  | (prefix, []) -> []
  | (prefix, (p) :: (rest)) -> (let more = v_Vuna_dTypecheck_dredWarn (v_Vuna_dBase_dappend prefix ((p)
      :: ([]))) rest in
  if v_Vuna_dTypecheck_danySubsumes p prefix then (((v_Vuna_dBase_dshowSpanLoc (v_Vuna_dAst_dpatSpan
          p)) ^ (": redundant pattern"))) :: (more)
  else more)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 871 1 ("no matching clause for Vuna.Typecheck.redWarn")

let v_Vuna_dTypecheck_dredundantWarnings = fun pats -> v_Vuna_dTypecheck_dredWarn [] pats

let rec v_Vuna_dCodegen_daddClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clause, []) -> (C_Vuna_dBase_dPair (name, (clause) :: ([]))) :: ([])
  | (name, clause, (C_Vuna_dBase_dPair (gname, clauses)) :: (rest)) -> if bi_eq_str gname name then (C_Vuna_dBase_dPair
  (gname, v_Vuna_dBase_dappend clauses ((clause) :: ([])))) :: (rest)
else (C_Vuna_dBase_dPair (gname, clauses)) :: (v_Vuna_dCodegen_daddClause name clause rest)
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 225 1 ("no matching clause for Vuna.Codegen.addClause")

let rec v_Vuna_dCodegen_dgroupFunctionsLoop = fun a0 a1 -> match (a0, a1) with
  | ([], groups) -> groups
  | ((d) :: (rest), groups) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> v_Vuna_dCodegen_dgroupFunctionsLoop rest (v_Vuna_dCodegen_daddClause
    name (C_Vuna_dBase_dPair (pats, body)) groups)
  | _ -> v_Vuna_dCodegen_dgroupFunctionsLoop rest groups
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 220 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 218 1 ("no matching clause for Vuna.Codegen.groupFunctionsLoop")

let v_Vuna_dCodegen_dgroupFunctions = fun decls -> v_Vuna_dCodegen_dgroupFunctionsLoop decls []

let rec v_Vuna_dCodegen_dallCtors = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, _) -> v_Vuna_dBase_dappend (v_Vuna_dCodegen_dctorPairs ctors)
  (v_Vuna_dCodegen_dallCtors rest)
  | _ -> v_Vuna_dCodegen_dallCtors rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 245 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 243 1 ("no matching clause for Vuna.Codegen.allCtors")

let rec v_Vuna_dBase_dreverseOnto = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((x) :: (xs), acc) -> v_Vuna_dBase_dreverseOnto xs ((x) :: (acc))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 54 1 ("no matching clause for Vuna.Base.reverseOnto")

let v_Vuna_dBase_dreverse = fun xs -> v_Vuna_dBase_dreverseOnto xs []

let rec v_Lint_dsplitLinesFrom = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], acc, cur) -> v_Vuna_dBase_dreverse ((bi_str_pack (v_Vuna_dBase_dreverse cur)) :: (acc))
  | ((c) :: (rest), acc, cur) -> if bi_eq_int c 10 then v_Lint_dsplitLinesFrom rest ((bi_str_pack (v_Vuna_dBase_dreverse
      cur)) :: (acc)) []
else v_Lint_dsplitLinesFrom rest acc ((c) :: (cur))
  | _ -> vuna_fail "app/Lint.vuna" 89 1 ("no matching clause for Lint.splitLinesFrom")

let v_Lint_dsplitLines = fun source -> v_Lint_dsplitLinesFrom (bi_str_unpack source) [] []

let rec v_Lint_dsplitAtSymGo = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (sym, [], acc) -> C_Vuna_dBase_dNothing
  | (sym, (t) :: (rest), acc) -> if v_Lint_dtokIsSym t sym then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair
  (v_Vuna_dBase_dreverse acc, C_Vuna_dBase_dPair (t, rest)))
else v_Lint_dsplitAtSymGo sym rest ((t) :: (acc))
  | _ -> vuna_fail "app/Lint.vuna" 245 1 ("no matching clause for Lint.splitAtSymGo")

let v_Lint_dsplitAtSym = fun sym toks -> v_Lint_dsplitAtSymGo sym toks []

let rec v_Lint_dscanBody = fun lines toks lastLine n indent acc -> if bi_gt_int n lastLine then C_Lint_dCaseBody
(n, v_Vuna_dBase_dreverse acc)
else (let line = v_Lint_dlineAt lines n in
  if v_Lint_disBlankLine line then v_Lint_dscanBody lines toks lastLine (bi_add n 1) indent ((line)
    :: (acc))
  else if bi_gt_int (v_Lint_dindentOf line) indent then v_Lint_dscanBody lines toks lastLine (bi_add n
    1) indent ((line) :: (acc))
  else C_Lint_dCaseBody (n, v_Vuna_dBase_dreverse acc))

let v_Lint_dclauseHeadPatterns = fun toks -> (match v_Lint_dsplitAtSym "=" toks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (before, C_Vuna_dBase_dPair (arrow, after))) -> if v_Lint_disNilList
  after then (match before with
  | [] -> C_Vuna_dBase_dNothing
  | (fn) :: (rest) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (v_Lint_dtokenText fn, rest))
  | _ -> vuna_fail "app/Lint.vuna" 507 9 ("case pattern match failure"))
  else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 503 3 ("case pattern match failure"))

let v_Lint_daltHeadPatterns = fun toks -> (match v_Lint_dsplitAtSym "=>" toks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (before, C_Vuna_dBase_dPair (arrow, after))) -> if v_Lint_disNilList
  after then C_Vuna_dBase_dJust (before)
  else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 513 3 ("case pattern match failure"))

let v_Lint_denclosingPatterns = fun kind headToks -> if bi_eq_str kind "clause" then (match v_Lint_dclauseHeadPatterns
  headToks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (fnName, pats)) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (fnName,
      pats))
  | _ -> vuna_fail "app/Lint.vuna" 645 5 ("case pattern match failure"))
else (match v_Lint_daltHeadPatterns headToks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (pats) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("", pats))
  | _ -> vuna_fail "app/Lint.vuna" 650 5 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_demitStr = fun str acc -> v_Vuna_dBase_dappend (v_Vuna_dBase_dreverse (bi_str_unpack
    str)) acc

let rec v_Vuna_dLexer_dcollectIdent = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc),
  C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disIdentChar c then v_Vuna_dLexer_dcollectIdent
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
else if bi_eq_int c 46 then (match rest with
  | (c2) :: (rest2) -> if v_Vuna_dLexer_disIdentStart c2 then v_Vuna_dLexer_dcollectIdent (C_Vuna_dLexer_dChars
    (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
  else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
      p))
  | [] -> C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
      p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 86 5 ("case pattern match failure"))
else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
    p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 82 1 ("no matching clause for Vuna.Lexer.collectIdent")

let rec v_Vuna_dLexer_dcollectOp = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc),
  C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disOpChar c then v_Vuna_dLexer_dcollectOp
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
    p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 99 1 ("no matching clause for Vuna.Lexer.collectOp")

let rec v_Vuna_dLexer_dscanString = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if bi_eq_int c 34 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
  (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)))

else if bi_eq_int c 10 then C_Vuna_dBase_dErr ("unterminated string literal")
else if bi_eq_int c 92 then v_Vuna_dLexer_dscanEscape (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) acc
else v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 104 1 ("no matching clause for Vuna.Lexer.scanString")
and v_Vuna_dLexer_dscanEscape = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if bi_eq_int c 110 then v_Vuna_dLexer_dscanString
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((10) :: (acc))
else if bi_eq_int c 116 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((9) :: (acc))
else if bi_eq_int c 114 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((13) :: (acc))
else if bi_eq_int c 34 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((34) :: (acc))
else if bi_eq_int c 92 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((92) :: (acc))
else if bi_eq_int c 39 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((39) :: (acc))
else C_Vuna_dBase_dErr ("unknown escape sequence")
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 111 1 ("no matching clause for Vuna.Lexer.scanEscape")

let rec v_Vuna_dLexer_dlexChars = fun cs -> (match v_Vuna_dLexer_dskipTrivia cs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (cs2) -> (match cs2 with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p)) ::
      ([]))
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> v_Vuna_dLexer_dlexToken c rest p
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 125 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 122 3 ("case pattern match failure"))
and v_Vuna_dLexer_dlexToken = fun c rest p -> if v_Vuna_dLexer_disIdentStart c then (match v_Vuna_dLexer_dcollectIdent
  (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (name, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (v_Vuna_dLexer_dclassifyIdent name,
          p)) :: (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 133 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 131 5 ("case pattern match failure"))
else if v_Vuna_dLexer_disDigit c then (match v_Vuna_dLexer_dcollectInt (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) (bi_sub c 48) with
  | C_Vuna_dBase_dPair (n, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p)) ::
      (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 139 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 137 5 ("case pattern match failure"))
else if bi_eq_int c 34 then (match v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (s, cs2)) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p)) ::
      (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 146 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 143 5 ("case pattern match failure"))
else if (if ((if ((if ((if (bi_eq_int c 40) then true
              else (bi_eq_int c 41))) then true
          else (bi_eq_int c 91))) then true
      else (bi_eq_int c 93))) then true
  else (bi_eq_int c 44)) then (match v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (bi_str_pack
          ((c) :: ([]))), p)) :: (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 150 5 ("case pattern match failure"))
else if v_Vuna_dLexer_disOpChar c then (match v_Vuna_dLexer_dcollectOp (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (op, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (op), p)) ::
      (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 156 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 154 5 ("case pattern match failure"))
else C_Vuna_dBase_dErr ("unexpected character")

let v_Vuna_dLexer_dlexSource = fun source -> v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (bi_str_unpack
    source, C_Vuna_dBase_dPos (1, 1)))

let rec v_Vuna_dBase_dlength = fun a0 -> match a0 with
  | ([]) -> 0
  | ((x) :: (xs)) -> bi_add 1 (v_Vuna_dBase_dlength xs)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 61 1 ("no matching clause for Vuna.Base.length")

let v_Lint_dtrimEnd = fun line -> bi_str_pack (v_Lint_dtakeChars (v_Lint_dtrimLen (bi_str_unpack line)
    (v_Vuna_dBase_dlength (bi_str_unpack line))) (bi_str_unpack line))

let v_Lint_dtrimBoth = fun line -> v_Lint_dtrimStart (v_Lint_dtrimEnd line)

let v_Lint_dtextFromCol = fun line col -> v_Lint_dtrimBoth (bi_str_pack (v_Lint_ddropChars (bi_sub col
      1) (bi_str_unpack line)))

let v_Lint_dparseIfHead = fun toks line -> (match toks with
  | [] -> C_Vuna_dBase_dNothing
  | (t1) :: (rest) -> (match v_Lint_dtokIdentOf t1 with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (name) -> (match rest with
  | [] -> C_Vuna_dBase_dNothing
  | (t2) :: (rest2) -> if v_Lint_dtokIsSym t2 "==" then (match rest2 with
  | [] -> C_Vuna_dBase_dNothing
  | (t3) :: (rest3) -> (match v_Lint_dtokStrOf t3 with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (lit) -> (match rest3 with
  | [] -> C_Vuna_dBase_dNothing
  | (t4) :: (rest4) -> if v_Lint_dtokIsKw t4 "then" then if v_Lint_disNilList rest4 then C_Vuna_dBase_dNothing

            else if v_Lint_disSimpleTokens rest4 then C_Vuna_dBase_dJust (C_Lint_dIfHead (name, v_Lint_dtrimEnd
                (v_Lint_dsliceLine (bi_sub (v_Lint_dtokCol t3) 1) (bi_sub (v_Lint_dtokCol t4) (v_Lint_dtokCol
                      t3)) line), v_Lint_dtextFromCol line (bi_add (v_Lint_dtokCol t4) 4)))
            else C_Vuna_dBase_dNothing
            else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 313 25 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 310 21 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 307 17 ("case pattern match failure"))
      else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 303 11 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 300 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 297 3 ("case pattern match failure"))

let v_Lint_dfinalElseText = fun line elseTok rest -> if v_Lint_disNilList rest then C_Vuna_dBase_dNothing

else if v_Lint_dstartsWithIf rest then C_Vuna_dBase_dNothing
else if v_Lint_disSimpleTokens rest then C_Vuna_dBase_dJust (v_Lint_dtextFromCol line (bi_add (v_Lint_dtokCol
      elseTok) 4))
else C_Vuna_dBase_dNothing

let rec v_Vuna_dCodegen_dcheckArities = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, expected, []) -> C_Vuna_dBase_dOk (expected)
  | (name, expected, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> if bi_eq_int (v_Vuna_dBase_dlength
  pats) expected then v_Vuna_dCodegen_dcheckArities name expected rest
else C_Vuna_dBase_dErr ((let vuna_cat0' = ("clauses for ") in
    (let vuna_cat1' = (name) in
      (let vuna_cat2' = (" have different arities") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 234 1 ("no matching clause for Vuna.Codegen.checkArities")

let v_Vuna_dCodegen_darityOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("function ") in
    (let vuna_cat1' = (name) in
      (let vuna_cat2' = (" has no clauses") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (name, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> v_Vuna_dCodegen_dcheckArities name (v_Vuna_dBase_dlength
  pats) rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 231 1 ("no matching clause for Vuna.Codegen.arityOf")

let v_Vuna_dEval_dapplyCtor = fun decls name args arg sp -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown constructor: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> if bi_ge_int (v_Vuna_dBase_dlength args) arity then v_Vuna_dEval_derrAt
  sp ((let vuna_cat0' = ("constructor ") in
      (let vuna_cat1' = (name) in
        (let vuna_cat2' = (" cannot take more arguments") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  else C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, v_Vuna_dBase_dappend args ((arg) :: ([]))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 155 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dmatchPatterns = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> C_Vuna_dBase_dJust ([])
  | ((p) :: (ps), (v) :: (vs)) -> (match v_Vuna_dEval_dmatchPattern p v with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs) -> (match v_Vuna_dEval_dmatchPatterns ps vs with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs2) -> C_Vuna_dBase_dJust (v_Vuna_dBase_dappend bs bs2)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 187 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 184 3 ("case pattern match failure"))
  | (_, _) -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 182 1 ("no matching clause for Vuna.Eval.matchPatterns")
and v_Vuna_dEval_dmatchPattern = fun p v -> (match p with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dBase_dJust ([])
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dBase_dJust ((C_Vuna_dBase_dPair (name, v)) :: ([]))
  | C_Vuna_dAst_dPInt (n, _) -> (match v with
  | C_Vuna_dEval_dVInt (m) -> if bi_eq_int n m then C_Vuna_dBase_dJust ([])
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 197 7 ("case pattern match failure"))
  | C_Vuna_dAst_dPStr (s, _) -> (match v with
  | C_Vuna_dEval_dVStr (t) -> if bi_eq_str s t then C_Vuna_dBase_dJust ([])
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 201 7 ("case pattern match failure"))
  | C_Vuna_dAst_dPCon (name, pats, _) -> (match v with
  | C_Vuna_dEval_dVCon (vname, vargs) -> if (if (bi_eq_str name vname) then (bi_eq_int (v_Vuna_dBase_dlength
          pats) (v_Vuna_dBase_dlength vargs))
      else false) then v_Vuna_dEval_dmatchPatterns pats vargs
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 205 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 193 3 ("case pattern match failure"))

let v_Vuna_dAst_dfunArity = fun name decls -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> C_Vuna_dBase_dNothing
  | (C_Vuna_dBase_dPair (pats, body)) :: (_) -> C_Vuna_dBase_dJust (v_Vuna_dBase_dlength pats)
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 74 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dzeroArgBody = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> (match v_Vuna_dAst_dclausesFor decls name with
  | (C_Vuna_dBase_dPair ([], body)) :: ([]) -> C_Vuna_dBase_dJust (body)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 346 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 344 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dmap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> (f x) :: (v_Vuna_dBase_dmap f xs)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 65 1 ("no matching clause for Vuna.Base.map")

let v_Lint_dmakeChainFinding = fun firstLine indent scrutinee acc defaultText lastLine -> (let branches
  = v_Vuna_dBase_dreverse acc in
  if bi_lt_int (v_Vuna_dBase_dlength branches) 2 then []
  else (let newLines = v_Vuna_dBase_dappend (((let vuna_cat0' = (v_Lint_dspaces indent) in
          (let vuna_cat1' = ("case ") in
            (let vuna_cat2' = (scrutinee) in
              (let vuna_cat3' = (" of") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: ([])) (v_Vuna_dBase_dappend
      (v_Vuna_dBase_dmap (fun b -> v_Lint_drenderLitBranch indent b) branches) (((let vuna_cat0' = (v_Lint_dspaces
              (bi_add indent 2)) in
            (let vuna_cat1' = ("_ => ") in
              (let vuna_cat2' = (defaultText) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: ([]))) in
    (C_Lint_dFinding (firstLine, bi_add indent 1, "literal-if-chain", (let vuna_cat0' = ("if/else-if chain on `")
          in
          (let vuna_cat1' = (scrutinee) in
            (let vuna_cat2' = ("` can be a case with literal patterns") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), C_Vuna_dBase_dJust (C_Lint_dEdit
          (firstLine, lastLine, newLines)))) :: ([])))

let rec v_Lint_dfinishChain = fun lines toks lastLine n indent firstLine scrutinee acc -> if bi_gt_int
n lastLine then []
else (let line = v_Lint_dlineAt lines n in
  (let ts = v_Lint_dtokensOnLine toks n in
    if v_Lint_disNilList ts then []
    else if bi_neq_int (v_Lint_dindentOf line) indent then []
    else if v_Lint_dhasComment line then []
    else (match ts with
  | [] -> []
  | (first) :: (rest) -> if v_Lint_dtokIsKw first "else" then (match rest with
  | [] -> []
  | (second) :: (rest2) -> if v_Lint_dtokIsKw second "if" then (match v_Lint_dparseIfHead rest2 line with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (head) -> if bi_eq_str (v_Lint_dheadName head) scrutinee then v_Lint_dfinishChain
          lines toks lastLine (bi_add n 1) indent firstLine scrutinee ((C_Lint_dLitBranch (v_Lint_dheadText
                head, v_Lint_dheadExpr head)) :: (acc))
          else []
  | _ -> vuna_fail "app/Lint.vuna" 356 22 ("case pattern match failure"))
        else (match v_Lint_dfinalElseText line first rest with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (text) -> v_Lint_dmakeChainFinding firstLine indent scrutinee acc text n
  | _ -> vuna_fail "app/Lint.vuna" 363 22 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 352 16 ("case pattern match failure"))
      else []
  | _ -> vuna_fail "app/Lint.vuna" 348 10 ("case pattern match failure"))))

let v_Lint_difChainAt = fun lines toks lastLine n -> (let line = v_Lint_dlineAt lines n in
  (let ts = v_Lint_dtokensOnLine toks n in
    if v_Lint_disNilList ts then []
    else if v_Lint_dhasComment line then []
    else (match ts with
  | [] -> []
  | (first) :: (rest) -> if (if (v_Lint_dtokIsKw first "if") then (bi_eq_int (v_Lint_dtokCol first) (bi_add
            (v_Lint_dindentOf line) 1))
        else false) then (match v_Lint_dparseIfHead rest line with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (head) -> v_Lint_dfinishChain lines toks lastLine (bi_add n 1) (v_Lint_dindentOf
          line) n (v_Lint_dheadName head) ((C_Lint_dLitBranch (v_Lint_dheadText head, v_Lint_dheadExpr
              head)) :: ([]))
  | _ -> vuna_fail "app/Lint.vuna" 378 14 ("case pattern match failure"))
      else []
  | _ -> vuna_fail "app/Lint.vuna" 374 8 ("case pattern match failure"))))

let rec v_Lint_dscanIfChains = fun lines toks n lastLine -> if bi_gt_int n lastLine then []
else v_Vuna_dBase_dappend (v_Lint_difChainAt lines toks lastLine n) (v_Lint_dscanIfChains lines toks (bi_add
    n 1) lastLine)

let v_Vuna_dTypedCodegen_dgenParams = fun n -> v_Vuna_dBase_dmap (fun i -> (("a") ^ (bi_str_from_int i)))
(v_Vuna_dTypedCodegen_drange 0 n)

let v_Vuna_dTypedCodegen_dfieldVars = fun n -> v_Vuna_dBase_dmap (fun i -> (("f") ^ (bi_str_from_int i)))
(v_Vuna_dTypedCodegen_drange 0 n)

let v_Vuna_dTypedCodegen_dindentSpaces = fun n -> v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dBase_dmap
  (fun _u -> " ") (v_Vuna_dTypedCodegen_drange 0 n))

let rec v_Vuna_dTypedCodegen_dformatChars = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5,
  a6) with
  | ([], col, depth, inStr, escaped, prev, acc) -> acc
  | ((c) :: (rest), col, depth, inStr, escaped, prev, acc) -> if inStr then if escaped then v_Vuna_dTypedCodegen_dformatChars
rest (bi_add col 1) depth true false c ((c) :: (acc))
else if bi_eq_int c 92 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true true c ((c)
  :: (acc))
else if bi_eq_int c 34 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c
((c) :: (acc))
else if bi_eq_int c 10 then v_Vuna_dTypedCodegen_dformatChars rest 0 depth true false c ((c) :: (acc))

else v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc))
else if bi_eq_int c 34 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c)
  :: (acc))
else if bi_eq_int c 10 then v_Vuna_dTypedCodegen_dformatChars rest 0 depth false false c ((c) :: (v_Vuna_dTypedCodegen_dtrimTrailing
    acc))
else if bi_eq_int c 40 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) (bi_add depth 1) false
false c ((c) :: (acc))
else if bi_eq_int c 41 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) (if bi_gt_int depth
  0 then bi_sub depth 1
  else 0) false false c ((c) :: (acc))
else if (if (bi_eq_int prev 32) then (bi_eq_int c 105)
  else false) then (match rest with
  | (110) :: ((32) :: (rest2)) -> (let width = v_Vuna_dTypedCodegen_dindentWidth depth in
    v_Vuna_dTypedCodegen_dformatChars rest2 (bi_add width 2) depth false false 32 (v_Vuna_dTypedCodegen_demitStr
      ((("in\n") ^ (v_Vuna_dTypedCodegen_dindentSpaces width))) acc))
  | _ -> v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 914 5 ("case pattern match failure"))
else if (if (bi_eq_int prev 32) then (bi_eq_int c 101)
  else false) then (match rest with
  | (108) :: ((115) :: ((101) :: ((32) :: (rest2)))) -> (let width = v_Vuna_dTypedCodegen_dindentWidth
    depth in
    v_Vuna_dTypedCodegen_dformatChars rest2 (bi_add width 5) depth false false 32 (v_Vuna_dTypedCodegen_demitStr
      ((let vuna_cat0' = ("\n") in
          (let vuna_cat1' = (v_Vuna_dTypedCodegen_dindentSpaces width) in
            (let vuna_cat2' = ("else ") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) (v_Vuna_dTypedCodegen_dtrimTrailing
        acc)))
  | _ -> v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 920 5 ("case pattern match failure"))
else if (if (bi_eq_int c 32) then (bi_gt_int col 100)
  else false) then (let width = v_Vuna_dTypedCodegen_dindentWidth depth in
  v_Vuna_dTypedCodegen_dformatChars rest width depth false false 32 (v_Vuna_dTypedCodegen_demitStr ((("\n")
        ^ (v_Vuna_dTypedCodegen_dindentSpaces width))) (v_Vuna_dTypedCodegen_dtrimTrailing acc)))
else v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 901 1 ("no matching clause for Vuna.TypedCodegen.formatChars")

let v_Vuna_dTypedCodegen_dformatOutput = fun s -> bi_str_pack (v_Vuna_dBase_dreverse (v_Vuna_dTypedCodegen_dtrimTrailing
    (v_Vuna_dTypedCodegen_dformatChars (bi_str_unpack s) 0 0 false false 0 [])))

let rec v_Vuna_dTypecheck_dresolveTy = fun s ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match v_Vuna_dTypecheck_dlookupSubst i s with
  | C_Vuna_dBase_dJust (t) -> v_Vuna_dTypecheck_dresolveTy s t
  | C_Vuna_dBase_dNothing -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 67 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dresolveTy
      s) args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dresolveTy s a, v_Vuna_dTypecheck_dresolveTy
    s b)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 65 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_doccursIn = fun i s ty -> (match v_Vuna_dTypecheck_dresolveTy s ty with
  | C_Vuna_dTypecheck_dTVar (j) -> bi_eq_int i j
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_Vuna_dTypecheck_doccursInArgs i s args
  | C_Vuna_dTypecheck_dTFun (a, b) -> (if (v_Vuna_dTypecheck_doccursIn i s a) then true
    else (v_Vuna_dTypecheck_doccursIn i s b))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 75 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_doccursInArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, s, []) -> false
  | (i, s, (ty) :: (rest)) -> (if (v_Vuna_dTypecheck_doccursIn i s ty) then true
  else (v_Vuna_dTypecheck_doccursInArgs i s rest))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 80 1 ("no matching clause for Vuna.Typecheck.occursInArgs")

let rec v_Vuna_dTypecheck_drenameTy = fun mapping ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match v_Vuna_dTypecheck_dlookupSubst i mapping with
  | C_Vuna_dBase_dJust (t) -> t
  | C_Vuna_dBase_dNothing -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 155 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_drenameTy
      mapping) args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_drenameTy mapping a,
    v_Vuna_dTypecheck_drenameTy mapping b)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 153 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dinstantiate = fun a0 a1 -> match (a0, a1) with
  | (st, C_Vuna_dTypecheck_dScheme (qs, ty)) -> (match v_Vuna_dTypecheck_dinstantiateVars qs st with
  | C_Vuna_dBase_dPair (mapping, st2) -> C_Vuna_dBase_dPair (v_Vuna_dTypecheck_drenameTy mapping ty, st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 163 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 162 1 ("no matching clause for Vuna.Typecheck.instantiate")

let rec v_Vuna_dTypecheck_dctorNamesOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dAst_dDData (dn, params, ctors, _) -> if bi_eq_str dn name then v_Vuna_dBase_dmap v_Vuna_dAst_dctorName
  ctors
  else v_Vuna_dTypecheck_dctorNamesOf rest name
  | _ -> v_Vuna_dTypecheck_dctorNamesOf rest name
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 842 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 840 1 ("no matching clause for Vuna.Typecheck.ctorNamesOf")

let v_Vuna_dTypecheck_dtyCtorNames = fun decls ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (name, _) -> v_Vuna_dTypecheck_dctorNamesOf decls name
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 836 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dcoverageWarnings = fun decls ty posPats -> (let ctors = v_Vuna_dTypecheck_dtyCtorNames
  decls ty in
  if bi_eq ctors [] then []
  else if bi_eq posPats [] then []
  else (let exhaustive = (if (v_Vuna_dTypecheck_dhasCatchAll posPats) then true
      else (v_Vuna_dTypecheck_dallCtorsCovered posPats ctors)) in
    (let nonEx = if exhaustive then []
      else (((v_Vuna_dBase_dshowSpanLoc (v_Vuna_dAst_dpatSpan (v_Vuna_dTypecheck_dfirstPat posPats)))
          ^ (": non-exhaustive function clauses"))) :: ([]) in
      v_Vuna_dBase_dappend nonEx (v_Vuna_dTypecheck_dredundantWarnings posPats))))

let rec v_Vuna_dTypecheck_dfunCoverageWarnings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, [], clauses) -> []
  | (decls, (ty) :: (rest), clauses) -> (let posPats = v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dclausePatAt
    0) clauses in
  (let w1 = v_Vuna_dTypecheck_dcoverageWarnings decls ty posPats in
    v_Vuna_dBase_dappend w1 (v_Vuna_dTypecheck_dfunCoverageWarnings decls rest (v_Vuna_dBase_dmap v_Vuna_dTypecheck_ddropFirstPat
        clauses))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 805 1 ("no matching clause for Vuna.Typecheck.funCoverageWarnings")

let v_Vuna_dTypecheck_dfinalizeScheme = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dTypecheck_dScheme (qs, ty)) -> C_Vuna_dTypecheck_dScheme (qs, v_Vuna_dTypecheck_dresolveTy
  subst ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 921 1 ("no matching clause for Vuna.Typecheck.finalizeScheme")

let rec v_Vuna_dTypecheck_dfinalizeGlobals = fun subst globals -> (match globals with
  | [] -> []
  | (C_Vuna_dBase_dPair (name, sch)) :: (rest) -> (C_Vuna_dBase_dPair (name, v_Vuna_dTypecheck_dfinalizeScheme
      subst sch)) :: (v_Vuna_dTypecheck_dfinalizeGlobals subst rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 924 3 ("case pattern match failure"))

let v_Vuna_dLoader_dimportModuleNames = fun imports -> v_Vuna_dBase_dmap v_Vuna_dLoader_dimportName imports

let v_Vuna_dAst_ddeclNames = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> (name) :: ([])
  | C_Vuna_dAst_dDSig (name, ty, _) -> (name) :: ([])
  | C_Vuna_dAst_dDData (dname, params, ctors, _) -> v_Vuna_dBase_dmap v_Vuna_dAst_dctorName ctors
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 107 3 ("case pattern match failure"))

let v_Vuna_dAst_ddeclCtors = fun d -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, _) -> v_Vuna_dBase_dmap v_Vuna_dAst_dctorName ctors
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 115 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dtraverse = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (xs)) -> (match f x with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (y) -> (match v_Vuna_dBase_dtraverse f xs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (ys) -> C_Vuna_dBase_dOk ((y) :: (ys))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 74 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 71 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 69 1 ("no matching clause for Vuna.Base.traverse")

let v_Vuna_dBase_dandThen = fun r f -> (match r with
  | C_Vuna_dBase_dOk (x) -> f x
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 80 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dmapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (rest)) -> v_Vuna_dBase_dandThen (f x) (fun y -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
    f rest) (fun ys -> C_Vuna_dBase_dOk ((y) :: (ys))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 73 1 ("no matching clause for Vuna.TypedCodegen.mapResult")

let rec v_Vuna_dEval_dvalueToChars = fun sp v -> (match v with
  | C_Vuna_dEval_dVCon ("Nil", []) -> C_Vuna_dBase_dOk ([])
  | C_Vuna_dEval_dVCon ("Cons", (head) :: ((tail) :: ([]))) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg
    sp head) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dvalueToChars sp tail) (fun rest -> C_Vuna_dBase_dOk
      ((n) :: (rest))))
  | _ -> v_Vuna_dEval_derrAt sp "strPack expects a List Int"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 233 3 ("case pattern match failure"))

let v_Vuna_dEval_dint2 = fun sp args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dintArg sp b) (fun y -> f x y))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 240 3 ("case pattern match failure"))

let v_Vuna_dEval_dstr2 = fun sp args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dstringArg sp b) (fun y -> f x y))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 245 3 ("case pattern match failure"))

let v_Vuna_dEval_ddivideBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dintArg sp b) (fun y -> if bi_eq_int y 0 then v_Vuna_dEval_derrAt sp "division by zero"

      else C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_div x y))))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for /"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 250 3 ("case pattern match failure"))

let v_Vuna_dEval_dcallBuiltin = fun name args sp -> (match name with
  | "+" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_add x y)))
  | "-" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_sub x y)))
  | "*" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_mul x y)))
  | "/" -> v_Vuna_dEval_ddivideBuiltin sp args
  | "==" -> v_Vuna_dEval_deqBuiltin sp args
  | "/=" -> v_Vuna_dEval_dneqBuiltin sp args
  | "<" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_lt_int x y)))
  | "<=" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_le_int x
        y)))
  | ">" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_gt_int x y)))
  | ">=" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_ge_int x
        y)))
  | "&&" -> v_Vuna_dEval_dandBuiltin sp args
  | "||" -> v_Vuna_dEval_dorBuiltin sp args
  | "++" -> v_Vuna_dEval_dstr2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr (((x) ^ (y)))))
  | "strLength" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_str_length s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strLength"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 311 7 ("case pattern match failure"))
  | "strUnpack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (v_Vuna_dEval_dstringToValue
        s))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strUnpack"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 315 7 ("case pattern match failure"))
  | "strPack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dvalueToChars sp a) (fun cs -> C_Vuna_dBase_dOk
      (C_Vuna_dEval_dVStr (bi_str_pack cs)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strPack"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 319 7 ("case pattern match failure"))
  | "strFromInt" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (bi_str_from_int n)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strFromInt"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 323 7 ("case pattern match failure"))
  | "readFile" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (bi_read_file s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for readFile"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 327 7 ("case pattern match failure"))
  | "writeFile" -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun path -> v_Vuna_dBase_dandThen
      (v_Vuna_dEval_dstringArg sp b) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_write_file path
            s))))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for writeFile"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 331 7 ("case pattern match failure"))
  | "print" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_print s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for print"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 337 7 ("case pattern match failure"))
  | "getArgs" -> C_Vuna_dBase_dOk (v_Vuna_dEval_dstrListToValue (bi_get_args ()))
  | "fileExists" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
        (bi_file_exists s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for fileExists"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 342 7 ("case pattern match failure"))
  | "exit" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_exit n)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for exit"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 346 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp ((("unknown builtin: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 296 3 ("case pattern match failure"))

let v_Vuna_dEval_devalGlobalNonFun = fun decls name sp -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, []))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then v_Vuna_dEval_dcallBuiltin name [] sp
    else C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin (name, []))
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unbound variable: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 45 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 42 3 ("case pattern match failure"))

let v_Vuna_dEval_dapplyBuiltin = fun decls name args arg sp -> (match v_Vuna_dBuiltins_dbuiltinArity name
  with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown builtin: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (let args2 = v_Vuna_dBase_dappend args ((arg) :: ([])) in
    if bi_lt_int (v_Vuna_dBase_dlength args2) arity then C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin (name,
        args2))
    else if bi_eq_int (v_Vuna_dBase_dlength args2) arity then v_Vuna_dEval_dcallBuiltin name args2 sp

    else v_Vuna_dEval_derrAt sp ((("too many arguments for builtin ") ^ (name))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 162 3 ("case pattern match failure"))

let v_Vuna_dBase_dstep = fun r k -> (match r with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (x, st)) -> k x st
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 86 3 ("case pattern match failure"))

let v_Vuna_dParser_dparseImportAlias = fun st isQualified -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
  st) (fun name st1 -> if v_Vuna_dParser_datKw st1 "as" then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
    st1 "as") (fun _u st2 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st2) (fun alias st3 -> C_Vuna_dBase_dOk
      (C_Vuna_dBase_dPair (C_Vuna_dAst_dImport (name, isQualified, C_Vuna_dBase_dJust (alias), v_Vuna_dParser_dspanOf
            st st3), st3))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dImport (name, isQualified, C_Vuna_dBase_dNothing,
        v_Vuna_dParser_dspanOf st st1), st1)))

let v_Vuna_dParser_dparseImportSpec = fun st -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "import")
(fun _u st1 -> if v_Vuna_dParser_datKw st1 "qualified" then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
    st1 "qualified") (fun _u st2 -> v_Vuna_dParser_dparseImportAlias st2 true)
  else v_Vuna_dParser_dparseImportAlias st1 false)

let rec v_Vuna_dParser_dparseImports = fun st -> if v_Vuna_dParser_datKw st "import" then v_Vuna_dBase_dstep
(v_Vuna_dParser_dparseImportSpec st) (fun imp st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseImports
    st1) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((imp) :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))

let rec v_Vuna_dParser_dparseParams = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseParams
    (v_Vuna_dParser_dadvance st)) (fun rest st1 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((name) :: (rest),
        st1)))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 228 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dparseLambdaParams = fun st acc -> if v_Vuna_dParser_datSym st "," then v_Vuna_dBase_dstep
(v_Vuna_dParser_dexpectIdent (v_Vuna_dParser_dadvance st)) (fun name st1 -> v_Vuna_dParser_dparseLambdaParams
  st1 (v_Vuna_dBase_dappend acc ((name) :: ([]))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (acc, st))

let rec v_Vuna_dParser_dparsePatternSingle = fun st blockCol -> v_Vuna_dParser_dparsePatternCons st blockCol
and v_Vuna_dParser_dparsePatternCons = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternHead
  st blockCol) (fun lhs st1 -> if (if (v_Vuna_dParser_datSym st1 "::") then (v_Vuna_dParser_dcanContinue
      st1 blockCol)
    else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternCons (v_Vuna_dParser_dadvance st1)
    blockCol) (fun rhs st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Cons", (lhs) ::
          ((rhs) :: ([])), v_Vuna_dParser_dspanOf st st2), st2)))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st1)))
and v_Vuna_dParser_dparsePatternHead = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> if v_Vuna_dParser_dupperFirst name then v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparsePatternAtoms (v_Vuna_dParser_dadvance st) blockCol) (fun args st1 -> C_Vuna_dBase_dOk
    (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, args, v_Vuna_dParser_dspanOf st st1), st1)))
  else v_Vuna_dParser_dparsePatternAtom st blockCol
  | _ -> v_Vuna_dParser_dparsePatternAtom st blockCol
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 425 3 ("case pattern match failure"))
and v_Vuna_dParser_dparsePatternAtoms = fun st blockCol -> if (if (v_Vuna_dParser_dstartsPatternAtom st)
  then (v_Vuna_dParser_dcanContinue st blockCol)
  else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternAtom st blockCol) (fun pat st1 -> v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparsePatternAtoms st1 blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ((pat) :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparsePatternAtom = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent ("_"), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild
      (v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> if v_Vuna_dParser_dupperFirst name then C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, [], v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance
          st)), v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name, v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance
          st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPInt
      (n, v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPStr
      (s, v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    (v_Vuna_dParser_dadvance st) blockCol) (fun inner st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
      st1 ")") (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (inner, st2))))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> v_Vuna_dParser_dparseListPattern st blockCol
  | _ -> C_Vuna_dBase_dErr ("expected pattern")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 441 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseListPattern = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
  st "[") (fun _u st1 -> if v_Vuna_dParser_datSym st1 "]" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon
      ("Nil", [], v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st1)), v_Vuna_dParser_dadvance st1))

  else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseListPatternElems st1 blockCol) (fun pats st2 -> C_Vuna_dBase_dOk
    (C_Vuna_dBase_dPair (v_Vuna_dParser_dfoldPCon (v_Vuna_dParser_dspanOf st st2) pats, st2))))
and v_Vuna_dParser_dparseListPatternElems = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
  st blockCol) (fun pat st1 -> if v_Vuna_dParser_datSym st1 "," then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseListPatternElems
    (v_Vuna_dParser_dadvance st1) blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((pat)
        :: (rest), st2)))
  else if v_Vuna_dParser_datSym st1 "]" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((pat) :: ([]), v_Vuna_dParser_dadvance
      st1))
  else C_Vuna_dBase_dErr ("expected , or ]"))

let rec v_Vuna_dParser_dparseClausePatterns = fun st blockCol -> if (if (v_Vuna_dParser_dstartsPatternAtom
    st) then (v_Vuna_dParser_dcanContinue st blockCol)
  else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternAtom st blockCol) (fun pat st1 -> v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparseClausePatterns st1 blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ((pat) :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))

let rec v_Vuna_dParser_dparseExpr = fun st blockCol minPrec -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dErr
("unexpected end of input")
else if v_Vuna_dParser_dcanContinue st blockCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseLhs st blockCol)
(fun lhs st1 -> v_Vuna_dParser_dparseInfix st1 blockCol minPrec lhs)
else C_Vuna_dBase_dErr ("expression is not indented enough")
and v_Vuna_dParser_dparseInfix = fun st blockCol minPrec lhs -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (op), p) -> (match v_Vuna_dParser_dinfixInfo op with
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (prec, assoc)) -> if (if (bi_ge_int prec minPrec) then (v_Vuna_dParser_dcanContinue
        st blockCol)
      else false) then (let rhsPrec = if bi_eq_int assoc 0 then bi_add prec 1
      else prec in
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr (v_Vuna_dParser_dadvance st) blockCol rhsPrec) (fun
        rhs st2 -> v_Vuna_dParser_dparseInfix st2 blockCol minPrec (C_Vuna_dAst_dEApp (v_Vuna_dParser_dopExpr
            op (v_Vuna_dParser_dspanOf st st2), (lhs) :: ((rhs) :: ([])), v_Vuna_dParser_dspanOf st st2))))

    else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 266 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 264 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseLhs = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("\\"), p) -> v_Vuna_dParser_dparseLambda st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("let"), p) -> v_Vuna_dParser_dparseLet st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("case"), p) -> v_Vuna_dParser_dparseCase st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("if"), p) -> v_Vuna_dParser_dparseIf st blockCol
  | _ -> v_Vuna_dParser_dparseApplication st blockCol
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 277 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseApplication = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAtom
  st blockCol) (fun first st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseArgs st1 blockCol) (fun args
    st2 -> (match args with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (first, st2))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEApp (first, args, v_Vuna_dParser_dspanOf
            st st2), st2))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 287 7 ("case pattern match failure"))))
and v_Vuna_dParser_dparseArgs = fun st blockCol -> if (if (v_Vuna_dParser_dstartsAtom st) then (v_Vuna_dParser_dcanContinue
    st blockCol)
  else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAtom st blockCol) (fun arg st1 -> v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparseArgs st1 blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((arg)
        :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparseAtom = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar
      (name, v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEInt
      (n, v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEStr
      (s, v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("Type"), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar
      ("Type", v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr
    (v_Vuna_dParser_dadvance st) blockCol 0) (fun inner st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
      st1 ")") (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (inner, st2))))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> v_Vuna_dParser_dparseListExpr st blockCol
  | _ -> C_Vuna_dBase_dErr ("expected expression")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 299 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseListExpr = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st
  "[") (fun _u st1 -> if v_Vuna_dParser_datSym st1 "]" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar
      ("Nil", v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st1)), v_Vuna_dParser_dadvance st1))

  else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseListExprElems st1 blockCol) (fun elems st2 -> C_Vuna_dBase_dOk
    (C_Vuna_dBase_dPair (v_Vuna_dParser_dfoldCons (v_Vuna_dParser_dspanOf st st2) elems, st2))))
and v_Vuna_dParser_dparseListExprElems = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr
  st blockCol 0) (fun e st1 -> if v_Vuna_dParser_datSym st1 "," then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseListExprElems
    (v_Vuna_dParser_dadvance st1) blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((e)
        :: (rest), st2)))
  else if v_Vuna_dParser_datSym st1 "]" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((e) :: ([]), v_Vuna_dParser_dadvance
      st1))
  else C_Vuna_dBase_dErr ("expected , or ]"))
and v_Vuna_dParser_dparseLambda = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st
  "\\") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1) (fun first st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dparseLambdaParams st2 ((first) :: ([]))) (fun params st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
        st3 "=>") (fun _u st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st4 blockCol 0) (fun body
          st5 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dELam (params, body, v_Vuna_dParser_dspanOf
                st st5), st5)))))))
and v_Vuna_dParser_dparseLet = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "let")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseLetBindings st1 blockCol) (fun binds st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dexpectKw st2 "in") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st3
        blockCol 0) (fun body st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dELet (binds, body,
              v_Vuna_dParser_dspanOf st st4), st4))))))
and v_Vuna_dParser_dparseLetBindings = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dErr
("expected a let binding")
else if v_Vuna_dParser_datKw st "in" then C_Vuna_dBase_dErr ("expected a let binding")
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_le_int col blockCol then C_Vuna_dBase_dErr ("let binding is not indented enough")

  else v_Vuna_dParser_dparseLetBindingsAt st col
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 353 5 ("case pattern match failure"))
and v_Vuna_dParser_dparseLetBindingsAt = fun st declCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else if v_Vuna_dParser_datKw st "in" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_eq_int col declCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    st declCol) (fun pat st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun _u st2 ->
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 declCol 0) (fun value st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dparseLetBindingsAt st3 declCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            ((C_Vuna_dBase_dPair (pat, value)) :: (rest), st4))))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 362 5 ("case pattern match failure"))
and v_Vuna_dParser_dparseCase = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "case")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun scrut st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dexpectKw st2 "of") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseCaseAlts
        st3 blockCol) (fun alts st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dECase (scrut,
              alts, v_Vuna_dParser_dspanOf st st4), st4))))))
and v_Vuna_dParser_dparseCaseAlts = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dErr
("case expression needs an alternative")
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_le_int col blockCol then C_Vuna_dBase_dErr ("case alternative is not indented enough")

  else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAltList st col) (fun alts st2 -> if v_Vuna_dParser_dbadCaseIndent
    st2 col then C_Vuna_dBase_dErr ("unexpected indentation after case alternative")
    else (match alts with
  | [] -> C_Vuna_dBase_dErr ("case expression needs an alternative")
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (alts, st2))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 389 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 382 5 ("case pattern match failure"))
and v_Vuna_dParser_dparseAltList = fun st altCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_eq_int col altCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    st altCol) (fun pat st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=>") (fun _u st2 ->
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 altCol 0) (fun body st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dparseAltList st3 altCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            ((C_Vuna_dBase_dPair (pat, body)) :: (rest), st4))))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 396 5 ("case pattern match failure"))
and v_Vuna_dParser_dparseIf = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "if")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun cond st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dexpectKw st2 "then") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr
        st3 blockCol 0) (fun yes st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st4 "else") (fun
          _u st5 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st5 blockCol 0) (fun no st6 -> C_Vuna_dBase_dOk
            (C_Vuna_dBase_dPair (C_Vuna_dAst_dEIf (cond, yes, no, v_Vuna_dParser_dspanOf st st6), st6))))))))

let v_Vuna_dParser_dparseSignature = fun st blockCol name namePos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
  st ":") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun ty st2 ->
    C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDSig (name, ty, C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf
            st, v_Vuna_dBase_dposLine namePos, v_Vuna_dBase_dposCol namePos, v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos
              st2), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos st2))), st2))))

let v_Vuna_dParser_dparseClause = fun st blockCol name namePos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseClausePatterns
  st blockCol) (fun pats st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun _u st2 ->
    v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 blockCol 0) (fun body st3 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dAst_dDFun (name, pats, body, C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine
              namePos, v_Vuna_dBase_dposCol namePos, v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos st3),
              v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos st3))), st3)))))

let rec v_Vuna_dParser_dparseCtorList = fun st ctorCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_eq_int col ctorCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st) (fun name st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Vuna_dBase_dstep
      (v_Vuna_dParser_dparseExpr st2 ctorCol 0) (fun ty st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseCtorList
          st3 ctorCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dAst_dCtor (name,
                  ty, v_Vuna_dParser_dcountArrows ty, v_Vuna_dParser_dspanOf st st4)) :: (rest), st4))))))

  else if bi_gt_int col ctorCol then C_Vuna_dBase_dErr ("unexpected indentation in data block")
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 245 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseCtors = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_gt_int col blockCol then v_Vuna_dParser_dparseCtorList st col

  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 237 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseData = fun st blockCol kwPos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
  st "data") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1) (fun name st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dparseParams st2) (fun params st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
        st3 ":") (fun _u st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st4 blockCol 0) (fun ty
          st5 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st5 "where") (fun _u st6 -> v_Vuna_dBase_dstep
            (v_Vuna_dParser_dparseCtors st6 blockCol) (fun ctors st7 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
                (C_Vuna_dAst_dDData (name, params, ctors, C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf st,
                      v_Vuna_dBase_dposLine kwPos, v_Vuna_dBase_dposCol kwPos, v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos
                        st7), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos st7))), st7)))))))))

let v_Vuna_dParser_dparseDecl = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("data"), p) -> v_Vuna_dParser_dparseData st blockCol p
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if v_Vuna_dParser_datSym st1 ":" then v_Vuna_dParser_dparseSignature st1 blockCol name p
    else v_Vuna_dParser_dparseClause st1 blockCol name p)
  | _ -> C_Vuna_dBase_dErr ("expected a top-level declaration")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 191 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dparseDecls = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if bi_eq_int col blockCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecl
    st blockCol) (fun decl st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecls st1 blockCol) (fun rest
      st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((decl) :: (rest), st2))))
  else C_Vuna_dBase_dErr ((("expected a declaration at column ") ^ (bi_str_from_int blockCol)))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 182 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseProgram = fun st -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseImports st) (fun
  imports st1 -> if v_Vuna_dParser_disEof st1 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, []))

  else (match v_Vuna_dParser_dpeekPos st1 with
  | C_Vuna_dBase_dPos (line, col) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecls st1 col) (fun decls
      st2 -> if v_Vuna_dParser_disEof st2 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, decls))

      else C_Vuna_dBase_dErr ("expected end of input"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 173 7 ("case pattern match failure")))

let v_Vuna_dParser_dparseSource = fun file source -> v_Vuna_dBase_dandThen (v_Vuna_dLexer_dlexSource source)
(fun toks -> v_Vuna_dParser_dparseProgram (C_Vuna_dParser_dPState (file, toks, C_Vuna_dBase_dPos (1, 0))))

let v_Lint_dapplyFixes = fun source findings -> (let edits = v_Lint_dsortEdits (v_Lint_dcollectEdits findings
    []) in
  (match v_Lint_dapplyEditList edits (v_Lint_dsplitLines source) (bi_add (v_Vuna_dBase_dlength (v_Lint_dsplitLines
          source)) 1) 0 with
  | C_Vuna_dBase_dPair (count, newLines) -> if bi_eq_int count 0 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      (0, source))
    else (let newSource = v_Lint_djoinLines newLines in
      (match v_Vuna_dParser_dparseSource "<lint>" newSource with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((("parse failed after fix: ") ^ (e)))
  | C_Vuna_dBase_dOk (ignored) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (count, newSource))
  | _ -> vuna_fail "app/Lint.vuna" 728 15 ("case pattern match failure")))
  | _ -> vuna_fail "app/Lint.vuna" 723 6 ("case pattern match failure")))

let rec v_Vuna_dBase_dconcatMap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (rest)) -> v_Vuna_dBase_dappend (f x) (v_Vuna_dBase_dconcatMap f rest)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 92 1 ("no matching clause for Vuna.Base.concatMap")

let rec v_Vuna_dTypedCodegen_dpatVars = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> []
  | C_Vuna_dAst_dPVar (name, _) -> (name) :: ([])
  | C_Vuna_dAst_dPInt (n, _) -> []
  | C_Vuna_dAst_dPStr (s, _) -> []
  | C_Vuna_dAst_dPCon (name, pats, _) -> v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 281 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dpatVarNames = fun p -> (match p with
  | C_Vuna_dAst_dPVar (n, _) -> (n) :: ([])
  | C_Vuna_dAst_dPCon (_, subpats, _) -> v_Vuna_dBase_dconcatMap v_Vuna_dTypecheck_dpatVarNames subpats
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 895 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dpatsVarNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dpatVarNames p) (v_Vuna_dTypecheck_dpatsVarNames
  rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 891 1 ("no matching clause for Vuna.Typecheck.patsVarNames")

let v_Vuna_dCodegen_dsanitizeName = fun name -> bi_str_pack (v_Vuna_dBase_dconcatMap v_Vuna_dCodegen_dsanitizeChar
  (bi_str_unpack name))

let v_Vuna_dTypedCodegen_dtypeNameOf = fun name -> (("t_") ^ (v_Vuna_dCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dctorNameOf = fun name -> (("C_") ^ (v_Vuna_dCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dvalueName = fun name -> (("v_") ^ (v_Vuna_dCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dshowNameOf = fun name -> (("show_") ^ (v_Vuna_dCodegen_dsanitizeName name))

let v_Vuna_dTypedCodegen_dshowAnnotation = fun params name -> (let vars = v_Vuna_dTypedCodegen_dparamVars
  params in
  (let vuna_cat0' = (v_Vuna_dTypedCodegen_djoinWith " " vars) in
    (let vuna_cat1' = (". ") in
      (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith " -> " (v_Vuna_dBase_dappend (v_Vuna_dBase_dmap
              (fun v -> (let vuna_cat0' = ("(") in
                  (let vuna_cat1' = (v) in
                    (let vuna_cat2' = (" -> string)") in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) vars) ((v_Vuna_dTypedCodegen_dappType
                vars (v_Vuna_dTypedCodegen_dtypeNameOf name)) :: (("string") :: ([]))))) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dTypedCodegen_dgenShowBody = fun pmap params name arms -> (match v_Vuna_dBase_dmap v_Vuna_dTypedCodegen_dpairSecond
  pmap with
  | [] -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
      (let vuna_cat1' = (" v =\n  match v with\n") in
        (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith "\n" arms) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | pvars -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
      (let vuna_cat1' = (" : ") in
        (let vuna_cat2' = (v_Vuna_dTypedCodegen_dshowAnnotation params name) in
          (let vuna_cat3' = (" = fun ") in
            (let vuna_cat4' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dBase_dappend pvars (("v")
                    :: ([])))) in
              (let vuna_cat5' = (" -> match v with\n") in
                (let vuna_cat6' = (v_Vuna_dTypedCodegen_djoinWith "\n" arms) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                  vuna_cat6']))))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 234 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dpatParam = fun p -> (match p with
  | C_Vuna_dAst_dPVar (name, _) -> v_Vuna_dCodegen_dsanitizeName name
  | _ -> "_"
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 580 3 ("case pattern match failure"))

let v_Vuna_dCodegen_docamlString = fun s -> (let vuna_cat0' = ("\"") in
  (let vuna_cat1' = (bi_str_pack (v_Vuna_dBase_dconcatMap v_Vuna_dCodegen_descapeChar (bi_str_unpack
          s))) in
    (let vuna_cat2' = ("\"") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dTypedCodegen_dgenPat = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dBase_dOk ("_")
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dBase_dOk (v_Vuna_dCodegen_dsanitizeName name)
  | C_Vuna_dAst_dPInt (n, _) -> C_Vuna_dBase_dOk (bi_str_from_int n)
  | C_Vuna_dAst_dPStr (s, _) -> C_Vuna_dBase_dOk (v_Vuna_dCodegen_docamlString s)
  | C_Vuna_dAst_dPCon (name, pats, _) -> (match name with
  | "Nil" -> C_Vuna_dBase_dOk ("[]")
  | "True" -> C_Vuna_dBase_dOk ("true")
  | "False" -> C_Vuna_dBase_dOk ("false")
  | "Cons" -> (match pats with
  | (h) :: ((t) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenPat h) (fun ph -> v_Vuna_dBase_dandThen
        (v_Vuna_dTypedCodegen_dgenPat t) (fun pt -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
              (let vuna_cat1' = (ph) in
                (let vuna_cat2' = (") :: (") in
                  (let vuna_cat3' = (pt) in
                    (let vuna_cat4' = (")") in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: Cons pattern arity")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 268 11 ("case pattern match failure"))
  | _ -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult v_Vuna_dTypedCodegen_dgenPat pats) (fun
      ps -> (match ps with
  | [] -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dctorNameOf name)
  | (p) :: ([]) -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
            (let vuna_cat1' = (" (") in
              (let vuna_cat2' = (p) in
                (let vuna_cat3' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
            (let vuna_cat1' = (" (") in
              (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith ", " ps) in
                (let vuna_cat3' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 275 13 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 263 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 257 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenCatchAll = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec), msg) -> if bi_eq_int sl 0 then (let vuna_cat0' = ("  | _ -> vuna_fail \"\" 0 0 (")
  in
  (let vuna_cat1' = (v_Vuna_dCodegen_docamlString msg) in
    (let vuna_cat2' = (")") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
else (let vuna_cat0' = ("  | _ -> vuna_fail ") in
  (let vuna_cat1' = (v_Vuna_dCodegen_docamlString f) in
    (let vuna_cat2' = (" ") in
      (let vuna_cat3' = (bi_str_from_int sl) in
        (let vuna_cat4' = (" ") in
          (let vuna_cat5' = (bi_str_from_int sc) in
            (let vuna_cat6' = (" (") in
              (let vuna_cat7' = (v_Vuna_dCodegen_docamlString msg) in
                (let vuna_cat8' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                  vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 545 1 ("no matching clause for Vuna.TypedCodegen.genCatchAll")

let v_Vuna_dTypedCodegen_dtypedString = fun s -> if bi_gt_int (bi_str_length s) 80 then (let vuna_cat0'
  = ("\"") in
  (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dTypedCodegen_descapeLong (bi_str_unpack
          s))) in
    (let vuna_cat2' = ("\"") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
else v_Vuna_dCodegen_docamlString s

let v_Vuna_dCodegen_dpconPattern = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> (let vuna_cat0' = ("VCon (") in
  (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
    (let vuna_cat2' = (", [])") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | (name, pats) -> (let vuna_cat0' = ("VCon (") in
  (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
    (let vuna_cat2' = (", [") in
      (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "; " pats) in
        (let vuna_cat4' = ("])") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 99 1 ("no matching clause for Vuna.Codegen.pconPattern")

let rec v_Vuna_dCodegen_dwrapFun = fun name params matchCode k -> if bi_eq_int k (bi_sub (v_Vuna_dBase_dlength
    params) 1) then (let vuna_cat0' = ("(fun ") in
  (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in
    (let vuna_cat2' = (" -> ") in
      (let vuna_cat3' = (matchCode) in
        (let vuna_cat4' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
else (let vuna_cat0' = ("(fun ") in
  (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in
    (let vuna_cat2' = (" -> VFun (") in
      (let vuna_cat3' = (v_Vuna_dCodegen_docamlString name) in
        (let vuna_cat4' = (", ") in
          (let vuna_cat5' = (v_Vuna_dCodegen_dwrapFun name params matchCode (bi_add k 1)) in
            (let vuna_cat6' = ("))") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
              vuna_cat6'])))))))

let rec v_Vuna_dCodegen_dwrapCtor = fun name params body k -> if bi_eq_int k (bi_sub (v_Vuna_dBase_dlength
    params) 1) then (let vuna_cat0' = ("(fun ") in
  (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in
    (let vuna_cat2' = (" -> ") in
      (let vuna_cat3' = (body) in
        (let vuna_cat4' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
else (let vuna_cat0' = ("(fun ") in
  (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in
    (let vuna_cat2' = (" -> VFun (") in
      (let vuna_cat3' = (v_Vuna_dCodegen_docamlString name) in
        (let vuna_cat4' = (", ") in
          (let vuna_cat5' = (v_Vuna_dCodegen_dwrapCtor name params body (bi_add k 1)) in
            (let vuna_cat6' = ("))") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
              vuna_cat6'])))))))

let v_Vuna_dCodegen_dgenCtor = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (name, arity)) -> if bi_eq_int arity 0 then C_Vuna_dBase_dOk ("")
else (let params = v_Vuna_dCodegen_dmakeCtorParams arity in
  (let body = (let vuna_cat0' = ("VCon (") in
      (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
        (let vuna_cat2' = (", [") in
          (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "; " params) in
            (let vuna_cat4' = ("])") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) in
    C_Vuna_dBase_dOk ((let vuna_cat0' = ("let mk_") in
        (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName name) in
          (let vuna_cat2' = (" = ") in
            (let vuna_cat3' = (v_Vuna_dCodegen_dwrapCtor name params body 0) in
              (let vuna_cat4' = ("\n") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 304 1 ("no matching clause for Vuna.Codegen.genCtor")

let rec v_Vuna_dCodegen_dgenCtorDefs = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ("")
  | ((c) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenCtor c) (fun def -> v_Vuna_dBase_dandThen
  (v_Vuna_dCodegen_dgenCtorDefs rest) (fun restDefs -> C_Vuna_dBase_dOk (((def) ^ (restDefs)))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 320 1 ("no matching clause for Vuna.Codegen.genCtorDefs")

let rec v_Vuna_dCodegen_dgenBuiltinDef = fun a0 -> match a0 with
  | ([]) -> ""
  | ((C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) :: (rest)) -> (let def = if bi_eq_int
  arity 0 then (let vuna_cat0' = ("let ") in
    (let vuna_cat1' = (ocname) in
      (let vuna_cat2' = (" = fun () -> ") in
        (let vuna_cat3' = (body) in
          (let vuna_cat4' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  else if bi_eq_int arity 1 then (let vuna_cat0' = ("let ") in
    (let vuna_cat1' = (ocname) in
      (let vuna_cat2' = (" = fun a -> ") in
        (let vuna_cat3' = (body) in
          (let vuna_cat4' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  else (let vuna_cat0' = ("let ") in
    (let vuna_cat1' = (ocname) in
      (let vuna_cat2' = (" = fun a -> VFun (") in
        (let vuna_cat3' = (v_Vuna_dCodegen_docamlString vname) in
          (let vuna_cat4' = (", fun b -> ") in
            (let vuna_cat5' = (body) in
              (let vuna_cat6' = (")\n") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                vuna_cat6']))))))) in
  ((def) ^ (v_Vuna_dCodegen_dgenBuiltinDef rest)))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 325 1 ("no matching clause for Vuna.Codegen.genBuiltinDef")

let v_Vuna_dAst_dtopNames = fun decls -> v_Vuna_dBase_dconcatMap v_Vuna_dAst_ddeclNames decls

let v_Vuna_dAst_dctorsOf = fun decls -> v_Vuna_dBase_dconcatMap v_Vuna_dAst_ddeclCtors decls

let v_Vuna_dLoader_dmoduleCtors = fun modules name -> v_Vuna_dAst_dctorsOf (v_Vuna_dLoader_dmoduleDecls
  modules name)

let v_Vuna_dAst_dtypeNamesOf = fun decls -> v_Vuna_dBase_dconcatMap v_Vuna_dAst_ddeclTypeNames decls

let v_Vuna_dLoader_dtypeExportsOf = fun modules name -> v_Vuna_dAst_dtypeNamesOf (v_Vuna_dLoader_dmoduleDecls
  modules name)

let rec v_Vuna_dBase_dmemName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (x) :: (rest)) -> if bi_eq_str x name then true
else v_Vuna_dBase_dmemName name rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 96 1 ("no matching clause for Vuna.Base.memName")

let rec v_Lint_dintersects = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> false
  | ((x) :: (rest), ys) -> if v_Vuna_dBase_dmemName x ys then true
else v_Lint_dintersects rest ys
  | _ -> vuna_fail "app/Lint.vuna" 267 1 ("no matching clause for Lint.intersects")

let v_Lint_dredundantFinding = fun lines toks lastLine caseLine indent var enclosing patToks patText mentions
stop newBody -> (let headLine = v_Lint_denclosingLine enclosing in
  let headToks = v_Lint_denclosingToks enclosing in
  let kind = v_Lint_denclosingKind enclosing in
  let headText = v_Lint_dlineAt lines headLine in
  (match v_Lint_dtokenOfVar var headToks with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (varTok) -> (match v_Lint_denclosingPatterns kind headToks with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (fnOrKind, patArea)) -> (let outerNames = v_Lint_dlowercaseIdents
        patArea in
        let innerNames = v_Lint_dlowercaseIdents patToks in
        let otherOuter = v_Lint_dremoveName var outerNames in
        let conflict = v_Lint_dintersects innerNames otherOuter in
        let oneOccurrence = bi_eq_int (v_Lint_dcountIdent var patArea) 1 in
        let lastOk = v_Lint_denclosingIsLast lines toks lastLine stop indent kind fnOrKind in
        let cleanOk = v_Lint_dlinesClean lines headLine (bi_add caseLine 1) in
        if v_Lint_dnotBool oneOccurrence then []
        else if conflict then []
        else (let newHead = v_Lint_dreplaceIdentInLine headText varTok ((let vuna_cat0' = ("(") in
              (let vuna_cat1' = (patText) in
                (let vuna_cat2' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in
          let newLines = (newHead) :: (newBody) in
          let fixable = (if ((if (lastOk) then (cleanOk)
                else false)) then (v_Lint_dnotBool mentions)
            else false) in
          let edit = if fixable then C_Vuna_dBase_dJust (C_Lint_dEdit (headLine, bi_sub stop 1, newLines))

          else C_Vuna_dBase_dNothing in
          (C_Lint_dFinding (caseLine, bi_add indent 1, "redundant-case", (let vuna_cat0' = ("single-alternative case on `")
                in
                (let vuna_cat1' = (var) in
                  (let vuna_cat2' = ("` can be folded into the enclosing pattern") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), edit)) :: ([])))
  | _ -> vuna_fail "app/Lint.vuna" 612 10 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 609 6 ("case pattern match failure")))

let v_Lint_dinlineShape = fun lines toks lastLine caseLine indent var enclosing patToks patText arrow
bodyToks -> (let altLine = bi_add caseLine 1 in
  let altText = v_Lint_dlineAt lines altLine in
  let next = v_Lint_dnextNonBlank lines (bi_add altLine 1) lastLine in
  if v_Lint_dnotBool (v_Lint_dsimpleFrom bodyToks 0) then []
  else if (if (bi_le_int next lastLine) then (bi_ge_int (v_Lint_dindentOf (v_Lint_dlineAt lines next))
      indent)
    else false) then []
  else if v_Lint_dnotBool (v_Lint_dlinesClean lines (v_Lint_denclosingLine enclosing) (bi_add caseLine
      1)) then []
  else (let bodyText = v_Lint_dtextFromCol altText (bi_add (v_Lint_dtokCol arrow) 2) in
    let tailEnd = if bi_gt_int next lastLine then lastLine
    else bi_sub next 1 in
    let newBody = (((v_Lint_dspaces indent) ^ (bodyText))) :: (v_Lint_dblankFill (bi_add altLine 1)
      tailEnd) in
    v_Lint_dredundantFinding lines toks lastLine caseLine indent var enclosing patToks patText (bi_gt_int
      (v_Lint_dcountIdent var bodyToks) 0) next newBody))

let v_Lint_dblockShape = fun lines toks lastLine caseLine indent var enclosing patToks patText arrow ->
(let altLine = bi_add caseLine 1 in
  let scanned = v_Lint_dscanBody lines toks lastLine (bi_add altLine 1) indent [] in
  (match scanned with
  | C_Lint_dCaseBody (stop, rawLines) -> if bi_le_int stop (bi_add altLine 1) then []
    else if v_Lint_dnotBool ((if (bi_gt_int stop lastLine) then true
        else (bi_lt_int (v_Lint_dindentOf (v_Lint_dlineAt lines stop)) indent))) then []
    else if v_Lint_dnotBool (v_Lint_dblockBodyOk lines toks lastLine (bi_add altLine 1) stop indent) then
    []
    else if v_Lint_dnotBool (v_Lint_dlinesClean lines (v_Lint_denclosingLine enclosing) (bi_sub stop 1))
    then []
    else (let newBody = v_Vuna_dBase_dmap (fun line -> v_Lint_ddropIndent 4 line) rawLines in
      v_Lint_dredundantFinding lines toks lastLine caseLine indent var enclosing patToks patText (v_Lint_dbodyMentionsVar
        toks var (bi_add altLine 1) stop) stop newBody)
  | _ -> vuna_fail "app/Lint.vuna" 594 6 ("case pattern match failure")))

let v_Lint_dcheckRedundantBody = fun lines toks lastLine caseLine indent var enclosing -> (let headLine
  = v_Lint_denclosingLine enclosing in
  let headToks = v_Lint_denclosingToks enclosing in
  let kind = v_Lint_denclosingKind enclosing in
  let altLine = bi_add caseLine 1 in
  if bi_gt_int altLine lastLine then []
  else (let altText = v_Lint_dlineAt lines altLine in
    if v_Lint_disBlankLine altText then []
    else if bi_neq_int (v_Lint_dindentOf altText) (bi_add indent 2) then []
    else (let altToks = v_Lint_dtokensOnLine toks altLine in
      (match v_Lint_dsplitAtSym "=>" altToks with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (patToks, C_Vuna_dBase_dPair (arrow, bodyToks))) -> if v_Lint_disNilList
        patToks then []
        else if v_Lint_dnotBool (v_Lint_dctorOrLitPattern patToks) then []
        else (let patText = v_Lint_dtrimEnd (v_Lint_dsliceLine (bi_sub (v_Lint_dtokCol (v_Lint_dheadOfTokens
                  patToks)) 1) (bi_sub (v_Lint_dtokCol arrow) (v_Lint_dtokCol (v_Lint_dheadOfTokens patToks)))
            altText) in
          if v_Lint_disNilList bodyToks then v_Lint_dblockShape lines toks lastLine caseLine indent
          var enclosing patToks patText arrow
          else v_Lint_dinlineShape lines toks lastLine caseLine indent var enclosing patToks patText arrow
          bodyToks)
  | _ -> vuna_fail "app/Lint.vuna" 562 16 ("case pattern match failure")))))

let v_Lint_dredundantCaseAt = fun lines toks lastLine n -> (let line = v_Lint_dlineAt lines n in
  (let indent = v_Lint_dindentOf line in
    (let ts = v_Lint_dtokensOnLine toks n in
      (match v_Lint_dcaseVarOf ts with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (var) -> (match v_Lint_denclosingOf lines toks n indent with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (enclosing) -> v_Lint_dcheckRedundantBody lines toks lastLine n indent var enclosing
  | _ -> vuna_fail "app/Lint.vuna" 665 10 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 662 6 ("case pattern match failure")))))

let rec v_Lint_dscanRedundant = fun lines toks n lastLine -> if bi_gt_int n lastLine then []
else v_Vuna_dBase_dappend (v_Lint_dredundantCaseAt lines toks lastLine n) (v_Lint_dscanRedundant lines
  toks (bi_add n 1) lastLine)

let v_Lint_dlintSource = fun source -> (match v_Vuna_dParser_dparseSource "<lint>" source with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (ignored) -> (match v_Vuna_dLexer_dlexSource source with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> (let lines = v_Lint_dsplitLines source in
      C_Vuna_dBase_dOk (v_Lint_dsortFindings (v_Vuna_dBase_dappend (v_Lint_dscanIfChains lines toks
            1 (v_Vuna_dBase_dlength lines)) (v_Lint_dscanRedundant lines toks 1 (v_Vuna_dBase_dlength
              lines)))))
  | _ -> vuna_fail "app/Lint.vuna" 736 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 733 3 ("case pattern match failure"))

let rec v_Lint_dfixLoop = fun source findings passes total -> if bi_le_int passes 0 then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair (total, source))
else (match v_Lint_dapplyFixes source findings with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (count, newSource)) -> if bi_eq_int count 0 then C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (total, source))
  else (match v_Lint_dlintSource newSource with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (remaining) -> v_Lint_dfixLoop newSource remaining (bi_sub passes 1) (bi_add total
      count)
  | _ -> vuna_fail "app/Lint.vuna" 769 11 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 764 5 ("case pattern match failure"))

let v_Lint_dfixReport = fun path source findings -> (match v_Lint_dfixLoop source findings 8 0 with
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in
        (let vuna_cat1' = (": error: ") in
          (let vuna_cat2' = (e) in
            (let vuna_cat3' = ("\n") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in
    2)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (count, newSource)) -> if bi_eq_int count 0 then v_Lint_dreportFindings
  path true findings
  else (let _ = bi_write_file path newSource in
    (match v_Lint_dlintSource newSource with
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in
            (let vuna_cat1' = (": error: ") in
              (let vuna_cat2' = (e) in
                (let vuna_cat3' = ("\n") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in
        2)
  | C_Vuna_dBase_dOk (remaining) -> (let _ = bi_print ((let vuna_cat0' = (path) in
            (let vuna_cat1' = (": fixed ") in
              (let vuna_cat2' = (bi_str_from_int count) in
                (let vuna_cat3' = (" finding(s)\n") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in
        v_Lint_dreportFindings path true remaining)
  | _ -> vuna_fail "app/Lint.vuna" 780 12 ("case pattern match failure")))
  | _ -> vuna_fail "app/Lint.vuna" 774 3 ("case pattern match failure"))

let v_Lint_dlintExisting = fun doFix path source -> (match v_Lint_dlintSource source with
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in
        (let vuna_cat1' = (": error: ") in
          (let vuna_cat2' = (e) in
            (let vuna_cat3' = ("\n") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in
    2)
  | C_Vuna_dBase_dOk (findings) -> if doFix then v_Lint_dfixReport path source findings
  else v_Lint_dreportFindings path false findings
  | _ -> vuna_fail "app/Lint.vuna" 787 3 ("case pattern match failure"))

let v_Lint_dlintOne = fun doFix path -> if bi_file_exists path then v_Lint_dlintExisting doFix path (bi_read_file
  path)
else (let _ = bi_print (((path) ^ (": error: file not found\n"))) in
  2)

let rec v_Lint_dlintFiles = fun a0 a1 -> match (a0, a1) with
  | (doFix, []) -> 0
  | (doFix, (path) :: (rest)) -> (let code = v_Lint_dlintOne doFix path in
  (let restCode = v_Lint_dlintFiles doFix rest in
    if bi_gt_int code restCode then code
    else restCode))
  | _ -> vuna_fail "app/Lint.vuna" 795 1 ("no matching clause for Lint.lintFiles")

let rec v_Vuna_dTypedCodegen_dallPureExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, seen, []) -> true
  | (decls, seen, (e) :: (rest)) -> (if (v_Vuna_dTypedCodegen_dpureExpr decls seen e) then (v_Vuna_dTypedCodegen_dallPureExpr
    decls seen rest)
  else false)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 351 1 ("no matching clause for Vuna.TypedCodegen.allPureExpr")
and v_Vuna_dTypedCodegen_dpureExpr = fun decls seen e -> (match e with
  | C_Vuna_dAst_dEInt (n, _) -> true
  | C_Vuna_dAst_dEStr (s, _) -> true
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dBase_dmemName name seen then false
  else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (0) -> true
  | _ -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls name with
  | C_Vuna_dBase_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: (seen)) body
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 364 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 361 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("++", _) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals (v_Vuna_dTypedCodegen_dconcatFlatten
        e) with
  | (C_Vuna_dAst_dEStr (_, _)) :: ([]) -> true
  | _ -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 370 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (_) -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 374 11 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 368 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 355 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disPureZeroArg = fun decls name -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls
  name with
  | C_Vuna_dBase_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: ([])) body
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 381 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disAtomicExpr = fun decls env e -> (match e with
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dBase_dmemName name env then true
  else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then true
    else false
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dbuiltinName name with
  | C_Vuna_dBase_dJust (ref) -> if bi_eq_str name "getArgs" then false
      else true
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dTypedCodegen_disPureZeroArg decls name
  | C_Vuna_dBase_dJust (_) -> true
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 305 17 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 302 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 299 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, _) -> true
  | C_Vuna_dAst_dEStr (s, _) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 295 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dformatArg = fun decls env e code -> if v_Vuna_dTypedCodegen_disAtomicExpr decls
env e then code
else (let vuna_cat0' = ("(") in
  (let vuna_cat1' = (code) in
    (let vuna_cat2' = (")") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dTypedCodegen_dapplyArgs = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], []) -> ""
  | (decls, env, (c) :: (cs), (e) :: (es)) -> (let vuna_cat0' = (" ") in
  (let vuna_cat1' = (v_Vuna_dTypedCodegen_dformatArg decls env e c) in
    (let vuna_cat2' = (v_Vuna_dTypedCodegen_dapplyArgs decls env cs es) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | (decls, env, _, _) -> ""
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 316 1 ("no matching clause for Vuna.TypedCodegen.applyArgs")

let v_Vuna_dTypedCodegen_dgenAppAware = fun decls env fn args fCode argCodes -> (let head = if v_Vuna_dTypedCodegen_disAtomicExpr
  decls env fn then fCode
  else (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (fCode) in
      (let vuna_cat2' = (")") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in
  ((head) ^ (v_Vuna_dTypedCodegen_dapplyArgs decls env argCodes args)))

let v_Vuna_dTypedCodegen_dzeroArgRef = fun decls name -> if v_Vuna_dTypedCodegen_disPureZeroArg decls
name then v_Vuna_dTypedCodegen_dvalueName name
else ((v_Vuna_dTypedCodegen_dvalueName name) ^ (" ()"))

let rec v_Vuna_dTypedCodegen_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if bi_eq_str name "" then v_Vuna_dTypedCodegen_duniqueNames rest
else if v_Vuna_dBase_dmemName name rest then v_Vuna_dTypedCodegen_duniqueNames rest
else (name) :: (v_Vuna_dTypedCodegen_duniqueNames rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 627 1 ("no matching clause for Vuna.TypedCodegen.uniqueNames")

let v_Vuna_dTypedCodegen_dfunctionNames = fun decls -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dBase_dmap
  v_Vuna_dTypedCodegen_ddeclFunName decls)

let v_Vuna_dTypedCodegen_dnotIn = fun name names -> if v_Vuna_dBase_dmemName name names then false
else true

let rec v_Vuna_dTypedCodegen_ddependentsOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (C_Vuna_dBase_dPair (n, ns)) :: (rest)) -> (let dep = v_Vuna_dTypedCodegen_ddependentsOf name
  rest in
  if v_Vuna_dBase_dmemName name ns then (n) :: (dep)
  else dep)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 654 1 ("no matching clause for Vuna.TypedCodegen.dependentsOf")

let v_Vuna_dTypedCodegen_dreverseAdj = fun names adj -> v_Vuna_dBase_dmap (fun n -> C_Vuna_dBase_dPair
  (n, v_Vuna_dTypedCodegen_ddependentsOf n adj)) names

let rec v_Vuna_dTypedCodegen_dfoldNeighborsPost = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], visited, order) -> C_Vuna_dBase_dPair (visited, order)
  | (adj, (m) :: (rest), visited, order) -> if v_Vuna_dBase_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsPost
adj rest visited order
else (match v_Vuna_dTypedCodegen_ddfsPost adj m ((m) :: (visited)) order with
  | C_Vuna_dBase_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dfoldNeighborsPost adj rest visited2
  order2
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 667 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 663 1 ("no matching clause for Vuna.TypedCodegen.foldNeighborsPost")
and v_Vuna_dTypedCodegen_ddfsPost = fun adj n visited order -> (match v_Vuna_dTypedCodegen_dfoldNeighborsPost
  adj (v_Vuna_dTypedCodegen_dneighborsOf adj n) visited order with
  | C_Vuna_dBase_dPair (visited2, order2) -> C_Vuna_dBase_dPair (visited2, (n) :: (order2))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 672 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dpostOrder = fun adj nodes visited order -> (match nodes with
  | [] -> C_Vuna_dBase_dPair (visited, order)
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n visited then v_Vuna_dTypedCodegen_dpostOrder adj rest
  visited order
  else (match v_Vuna_dTypedCodegen_ddfsPost adj n ((n) :: (visited)) order with
  | C_Vuna_dBase_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dpostOrder adj rest visited2 order2
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 682 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 677 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfoldNeighborsCollect = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (revAdj, [], visited, comp) -> C_Vuna_dBase_dPair (visited, comp)
  | (revAdj, (m) :: (rest), visited, comp) -> if v_Vuna_dBase_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsCollect
revAdj rest visited comp
else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj m ((m) :: (visited)) comp with
  | C_Vuna_dBase_dPair (visited2, comp2) -> v_Vuna_dTypedCodegen_dfoldNeighborsCollect revAdj rest visited2
  comp2
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 690 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 686 1 ("no matching clause for Vuna.TypedCodegen.foldNeighborsCollect")
and v_Vuna_dTypedCodegen_ddfsCollect = fun revAdj n visited comp -> (match v_Vuna_dTypedCodegen_dfoldNeighborsCollect
  revAdj (v_Vuna_dTypedCodegen_dneighborsOf revAdj n) visited comp with
  | C_Vuna_dBase_dPair (visited2, comp2) -> C_Vuna_dBase_dPair (visited2, (n) :: (comp2))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 695 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dcollectComps = fun revAdj nodes visited comps -> (match nodes with
  | [] -> comps
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n visited then v_Vuna_dTypedCodegen_dcollectComps revAdj
  rest visited comps
  else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj n ((n) :: (visited)) [] with
  | C_Vuna_dBase_dPair (visited2, comp) -> v_Vuna_dTypedCodegen_dcollectComps revAdj rest visited2 ((comp)
      :: (comps))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 705 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 700 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dcomponentOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> C_Vuna_dBase_dNothing
  | ((g) :: (rest), name) -> if v_Vuna_dBase_dmemName name g then C_Vuna_dBase_dJust (g)
else v_Vuna_dTypedCodegen_dcomponentOf rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 709 1 ("no matching clause for Vuna.TypedCodegen.componentOf")

let rec v_Vuna_dTypedCodegen_dgroupsFromCompsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (comps, allNames, [], emitted) -> []
  | (comps, allNames, (n) :: (rest), emitted) -> if v_Vuna_dBase_dmemName n emitted then v_Vuna_dTypedCodegen_dgroupsFromCompsGo
comps allNames rest emitted
else (match v_Vuna_dTypedCodegen_dcomponentOf comps n with
  | C_Vuna_dBase_dJust (g) -> (v_Vuna_dTypedCodegen_dfilterNames (fun m -> v_Vuna_dBase_dmemName m g)
    allNames) :: (v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest (v_Vuna_dBase_dappend g
      emitted))
  | C_Vuna_dBase_dNothing -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest emitted
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 723 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 719 1 ("no matching clause for Vuna.TypedCodegen.groupsFromCompsGo")

let v_Vuna_dTypedCodegen_dgroupsFromComps = fun comps names -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo
comps names names []

let v_Vuna_dTypedCodegen_dgroupDeps = fun adj group -> v_Vuna_dTypedCodegen_dfilterNames (fun n -> v_Vuna_dTypedCodegen_dnotIn
  n group) (v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dBase_dconcatMap (v_Vuna_dTypedCodegen_dneighborsOf
      adj) group))

let rec v_Vuna_dTypedCodegen_dallIn = fun names allowed -> (match names with
  | [] -> true
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n allowed then v_Vuna_dTypedCodegen_dallIn rest allowed

  else false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 734 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgroupReady = fun adj group emitted -> v_Vuna_dTypedCodegen_dallIn (v_Vuna_dTypedCodegen_dgroupDeps
  adj group) emitted

let rec v_Vuna_dTypedCodegen_dpickReadyAcc = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], before, emitted) -> C_Vuna_dBase_dNothing
  | (adj, (g) :: (rest), before, emitted) -> if v_Vuna_dTypedCodegen_dgroupReady adj g emitted then C_Vuna_dBase_dJust
(C_Vuna_dBase_dPair (g, v_Vuna_dBase_dappend (v_Vuna_dBase_dreverse before) rest))
else v_Vuna_dTypedCodegen_dpickReadyAcc adj rest ((g) :: (before)) emitted
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 743 1 ("no matching clause for Vuna.TypedCodegen.pickReadyAcc")

let v_Vuna_dTypedCodegen_dpickReady = fun adj groups emitted -> v_Vuna_dTypedCodegen_dpickReadyAcc adj
groups [] emitted

let rec v_Vuna_dTypedCodegen_dorderGroupsAcc = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, [], emitted) -> C_Vuna_dBase_dOk ([])
  | (adj, remaining, emitted) -> (match v_Vuna_dTypedCodegen_dpickReady adj remaining emitted with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: dependency cycle between groups")
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (g, rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dorderGroupsAcc
    adj rest (v_Vuna_dBase_dappend g emitted)) (fun tail -> C_Vuna_dBase_dOk ((g) :: (tail)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 753 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 751 1 ("no matching clause for Vuna.TypedCodegen.orderGroupsAcc")

let v_Vuna_dTypedCodegen_dorderGroups = fun adj groups -> v_Vuna_dTypedCodegen_dorderGroupsAcc adj groups
[]

let rec v_Vuna_dTypedCodegen_dunionNames = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> if v_Vuna_dBase_dmemName x ys then v_Vuna_dTypedCodegen_dunionNames rest ys

else (x) :: (v_Vuna_dTypedCodegen_dunionNames rest ys)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 800 1 ("no matching clause for Vuna.TypedCodegen.unionNames")

let rec v_Vuna_dTypedCodegen_dexprRefs = fun expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> (name) :: ([])
  | C_Vuna_dAst_dEInt (n, _) -> []
  | C_Vuna_dAst_dEStr (s, _) -> []
  | C_Vuna_dAst_dEApp (fn, args, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs
    fn) (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dexprRefs args)
  | C_Vuna_dAst_dELam (params, body, _) -> v_Vuna_dTypedCodegen_dexprRefs body
  | C_Vuna_dAst_dELet (binds, body, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dbindRefs
    binds) (v_Vuna_dTypedCodegen_dexprRefs body)
  | C_Vuna_dAst_dECase (scrut, alts, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs
    scrut) (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_daltRefs alts)
  | C_Vuna_dAst_dEIf (c, t, e, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs
    c) (v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs t) (v_Vuna_dTypedCodegen_dexprRefs
      e))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 783 3 ("case pattern match failure"))
and v_Vuna_dTypedCodegen_dbindRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pat, value)) -> v_Vuna_dTypedCodegen_dexprRefs value
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 794 1 ("no matching clause for Vuna.TypedCodegen.bindRefs")
and v_Vuna_dTypedCodegen_daltRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 797 1 ("no matching clause for Vuna.TypedCodegen.altRefs")

let v_Vuna_dTypedCodegen_dclauseRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 779 1 ("no matching clause for Vuna.TypedCodegen.clauseRefs")

let v_Vuna_dTypedCodegen_dgenFunctionRefs = fun decls name -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dBase_dconcatMap
  v_Vuna_dTypedCodegen_dclauseRefs (v_Vuna_dAst_dclausesFor decls name))

let v_Vuna_dTypedCodegen_dgroupNeedsRec = fun decls group -> (match group with
  | [] -> false
  | (n) :: ([]) -> v_Vuna_dBase_dmemName n (v_Vuna_dTypedCodegen_dgenFunctionRefs decls n)
  | _ -> true
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 765 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dtypedMainSuffix = fun decls showMain printResult -> if printResult then (let
  vuna_cat0' = ("let () = print_endline (") in
  (let vuna_cat1' = (showMain) in
    (let vuna_cat2' = (" (") in
      (let vuna_cat3' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in
        (let vuna_cat4' = ("))\n") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
else (let vuna_cat0' = ("let () = ignore (") in
  (let vuna_cat1' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in
    (let vuna_cat2' = (")\n") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypecheck_dknownTypeName = fun typeNames name -> (if ((if ((if (v_Vuna_dBase_dmemName name
            typeNames) then true
          else (bi_eq_str name "Int"))) then true
      else (bi_eq_str name "String"))) then true
  else (bi_eq_str name "Bool"))

let rec v_Vuna_dTypecheck_dconvertTypes = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, vars, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair ([], vars),
    st))
  | (typeNames, vars, (e) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames
  vars st e) (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars1), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertTypes
      typeNames vars1 rest st1) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tys, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair ((ty) :: (tys), vars2), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 203 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 200 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 197 1 ("no matching clause for Vuna.Typecheck.convertTypes")
and v_Vuna_dTypecheck_dconvertType = fun typeNames vars st expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypecheck_dknownTypeName typeNames name then C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, []), vars), st))
  else if v_Vuna_dTypecheck_disLowerName name then (match v_Vuna_dTypecheck_dlookupTyVar name vars with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars), st))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, (C_Vuna_dBase_dPair
              (name, ty)) :: (vars)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 215 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 212 9 ("case pattern match failure"))
  else C_Vuna_dBase_dErr ((("unknown type: ") ^ (name)))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames vars st a)
      (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ta, vars1), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType
            typeNames vars1 st1 b) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tb, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair
                  (C_Vuna_dTypecheck_dTFun (ta, tb), vars2), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 227 23 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 224 17 ("case pattern match failure")))
  | _ -> C_Vuna_dBase_dErr ("invalid arrow type")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 221 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypecheck_dknownTypeName typeNames name then v_Vuna_dBase_dandThen
    (v_Vuna_dTypecheck_dconvertTypes typeNames vars args st) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tys, vars1), st1) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, tys), vars1), st1))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 234 15 ("case pattern match failure")))
    else C_Vuna_dBase_dErr ((("unknown type constructor: ") ^ (name)))
  | _ -> C_Vuna_dBase_dErr ("invalid type application")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 219 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("invalid type expression")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 207 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dschemeOfSig = fun typeNames ty st -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType
  typeNames [] st ty) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dScheme
        (v_Vuna_dTypecheck_dvarIds vars, ty2), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 248 5 ("case pattern match failure")))

let v_Vuna_dTypecheck_dschemeOfCtor = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, st, C_Vuna_dAst_dCtor (name, ty, arity, _)) -> (match v_Vuna_dTypecheck_dseedVars
  params st with
  | C_Vuna_dBase_dPair (vars, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames
    vars st1 ty) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dBase_dPair (name, C_Vuna_dTypecheck_dScheme (v_Vuna_dTypecheck_dvarIds vars2, ty2)),
          st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 262 9 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 259 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 258 1 ("no matching clause for Vuna.Typecheck.schemeOfCtor")

let rec v_Vuna_dTypecheck_dcollectSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDSig (name, ty, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dschemeOfSig typeNames
    ty st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (sch, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectSigs typeNames rest
        st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (sigs, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name,
                  sch)) :: (sigs), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 284 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 281 9 ("case pattern match failure")))
  | _ -> v_Vuna_dTypecheck_dcollectSigs typeNames rest st
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 278 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 276 1 ("no matching clause for Vuna.Typecheck.collectSigs")

let rec v_Vuna_dTypecheck_dcollectCtorList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, params, (c) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dschemeOfCtor typeNames
  params st c) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (cname, sch), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtorList
      typeNames params rest st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (cname,
                sch)) :: (ctors), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 304 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 301 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 298 1 ("no matching clause for Vuna.Typecheck.collectCtorList")

let rec v_Vuna_dTypecheck_dcollectCtors = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtorList
    typeNames params ctors st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (newCtors, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtors typeNames
        rest st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors2, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dappend newCtors
              ctors2, st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 295 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 292 9 ("case pattern match failure")))
  | _ -> v_Vuna_dTypecheck_dcollectCtors typeNames rest st
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 289 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 287 1 ("no matching clause for Vuna.Typecheck.collectCtors")

let rec v_Vuna_dTypecheck_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if bi_eq_str name "" then v_Vuna_dTypecheck_duniqueNames rest
else if v_Vuna_dBase_dmemName name rest then v_Vuna_dTypecheck_duniqueNames rest
else (name) :: (v_Vuna_dTypecheck_duniqueNames rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 617 1 ("no matching clause for Vuna.Typecheck.uniqueNames")

let v_Vuna_dTypecheck_dfunctionNames = fun decls -> v_Vuna_dTypecheck_duniqueNames (v_Vuna_dBase_dmap
  v_Vuna_dTypecheck_ddeclFunName decls)

let v_Vuna_dCodegen_dgenVar = fun decls scope name -> if v_Vuna_dBase_dmemName name scope then C_Vuna_dBase_dOk
((("x_") ^ (v_Vuna_dCodegen_dsanitizeName name)))
else (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("v_") in
      (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName name) in
        (let vuna_cat2' = (" ()") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VFun (") in
      (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
        (let vuna_cat2' = (", v_") in
          (let vuna_cat3' = (v_Vuna_dCodegen_dsanitizeName name) in
            (let vuna_cat4' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (0) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VCon (") in
        (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
          (let vuna_cat2' = (", [])") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VFun (") in
        (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
          (let vuna_cat2' = (", mk_") in
            (let vuna_cat3' = (v_Vuna_dCodegen_dsanitizeName name) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dCodegen_dfindBuiltin name v_Vuna_dCodegen_dbuiltinInfos with
  | C_Vuna_dBase_dJust (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) -> if bi_eq_int arity
      0 then C_Vuna_dBase_dOk (((ocname) ^ (" ()")))
      else C_Vuna_dBase_dOk ((let vuna_cat0' = ("VFun (") in
          (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
            (let vuna_cat2' = (", ") in
              (let vuna_cat3' = (ocname) in
                (let vuna_cat4' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unbound variable: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 93 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 86 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 81 5 ("case pattern match failure"))

let rec v_Vuna_dLoader_dhasDuplicateName = fun a0 -> match a0 with
  | ([]) -> false
  | ((x) :: (rest)) -> if v_Vuna_dBase_dmemName x rest then true
else v_Vuna_dLoader_dhasDuplicateName rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 52 1 ("no matching clause for Vuna.Loader.hasDuplicateName")

let rec v_Vuna_dLoader_dmodulesExportingFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> if v_Vuna_dBase_dmemName name (v_Vuna_dLoader_dexportsOf modules m) then (m) :: (v_Vuna_dLoader_dmodulesExportingFrom
    modules rest name)
  else v_Vuna_dLoader_dmodulesExportingFrom modules rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 112 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmodulesExporting = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dLoader_dmodulesExportingCtorFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> if v_Vuna_dBase_dmemName name (v_Vuna_dLoader_dmoduleCtors modules m) then (m) ::
  (v_Vuna_dLoader_dmodulesExportingCtorFrom modules rest name)
  else v_Vuna_dLoader_dmodulesExportingCtorFrom modules rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 123 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmodulesExportingCtor = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingCtorFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dLoader_dmodulesExportingTypeFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> if v_Vuna_dBase_dmemName name (v_Vuna_dLoader_dtypeExportsOf modules m) then (m)
  :: (v_Vuna_dLoader_dmodulesExportingTypeFrom modules rest name)
  else v_Vuna_dLoader_dmodulesExportingTypeFrom modules rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 283 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmodulesExportingType = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingTypeFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dBase_dlookupPair = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (k, v)) :: (rest)) -> if bi_eq_str k name then C_Vuna_dBase_dJust (v)
else v_Vuna_dBase_dlookupPair name rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 100 1 ("no matching clause for Vuna.Base.lookupPair")

let rec v_Vuna_dTypecheck_drebuildDecls = fun a0 a1 -> match (a0, a1) with
  | ([], elabMap) -> []
  | ((d) :: (rest), elabMap) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> (match v_Vuna_dBase_dlookupPair name elabMap with
  | C_Vuna_dBase_dJust ((C_Vuna_dBase_dPair (pats2, body2)) :: (restElab)) -> (C_Vuna_dAst_dDFun (name,
        pats2, body2, sp)) :: (v_Vuna_dTypecheck_drebuildDecls rest (v_Vuna_dTypecheck_dreplaceElab name
        restElab elabMap))
  | _ -> (d) :: (v_Vuna_dTypecheck_drebuildDecls rest elabMap)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 688 7 ("case pattern match failure"))
  | _ -> (d) :: (v_Vuna_dTypecheck_drebuildDecls rest elabMap)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 686 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 684 1 ("no matching clause for Vuna.Typecheck.rebuildDecls")

let rec v_Vuna_dEval_dforceValue = fun decls v -> (match v with
  | C_Vuna_dEval_dVFun (name, []) -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dEval_dcallFunction decls name [] v_Vuna_dEval_dnoLocSpan
  | _ -> C_Vuna_dBase_dOk (v)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 24 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dOk (v)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 22 3 ("case pattern match failure"))
and v_Vuna_dEval_devalVar = fun decls env name sp -> (match v_Vuna_dBase_dlookupPair name env with
  | C_Vuna_dBase_dJust (v) -> v_Vuna_dEval_dforceValue decls v
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_devalGlobal decls name sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 30 3 ("case pattern match failure"))
and v_Vuna_dEval_devalGlobal = fun decls name sp -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then v_Vuna_dEval_dcallFunction decls name [] sp

  else C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun (name, []))
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_devalGlobalNonFun decls name sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 35 3 ("case pattern match failure"))
and v_Vuna_dEval_devalExpr = fun decls env expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> v_Vuna_dEval_devalVar decls env name sp
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (n))
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr (s))
  | C_Vuna_dAst_dELam (params, body, _) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (params, body, env))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dEval_devalApp decls env sp fn args
  | C_Vuna_dAst_dELet (binds, body, sp) -> v_Vuna_dEval_devalLet decls env sp binds body
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dEval_devalCase decls env sp scrut alts
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dEval_devalIf decls env sp c t e
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 51 3 ("case pattern match failure"))
and v_Vuna_dEval_devalApp = fun decls env sp fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("&&", sp2) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalAndShort decls env sp2 a b
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 66 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar ("||", sp2) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalOrShort decls env sp2 a b
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 70 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 64 3 ("case pattern match failure"))
and v_Vuna_dEval_devalApply = fun decls env sp fn args -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env fn) (fun fv -> v_Vuna_dEval_dfoldApply decls env sp fv args)
and v_Vuna_dEval_devalAndShort = fun decls env sp a b -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (av)
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun
      bv -> v_Vuna_dEval_dexpectBoolValue sp bv)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 86 5 ("case pattern match failure")))
and v_Vuna_dEval_devalOrShort = fun decls env sp a b -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (av)
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun
      bv -> v_Vuna_dEval_dexpectBoolValue sp bv)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 94 5 ("case pattern match failure")))
and v_Vuna_dEval_dfoldApply = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, sp, fv, []) -> C_Vuna_dBase_dOk (fv)
  | (decls, env, sp, fv, (arg) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env arg)
(fun av -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dapplyValue decls sp fv av) (fun fv2 -> v_Vuna_dEval_dfoldApply
    decls env sp fv2 rest))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 100 1 ("no matching clause for Vuna.Eval.foldApply")
and v_Vuna_dEval_devalLet = fun decls env sp binds body -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalBindings
  decls env sp binds) (fun env2 -> v_Vuna_dEval_devalExpr decls env2 body)
and v_Vuna_dEval_devalBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, sp, []) -> C_Vuna_dBase_dOk (env)
  | (decls, env, sp, (C_Vuna_dBase_dPair (pat, valueExpr)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env valueExpr) (fun v -> (match v_Vuna_dEval_dmatchPattern pat v with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt (v_Vuna_dAst_dpatSpan pat) "let pattern match failure"
  | C_Vuna_dBase_dJust (bs) -> v_Vuna_dEval_devalBindings decls (v_Vuna_dBase_dappend bs env) sp rest
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 111 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 108 1 ("no matching clause for Vuna.Eval.evalBindings")
and v_Vuna_dEval_devalCase = fun decls env sp scrut alts -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env scrut) (fun v -> v_Vuna_dEval_dchooseAlt decls env sp v alts)
and v_Vuna_dEval_dchooseAlt = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, sp, v, []) -> v_Vuna_dEval_derrAt sp "case pattern match failure"
  | (decls, env, sp, v, (C_Vuna_dBase_dPair (pat, body)) :: (rest)) -> (match v_Vuna_dEval_dmatchPattern
  pat v with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_dchooseAlt decls env sp v rest
  | C_Vuna_dBase_dJust (bs) -> v_Vuna_dEval_devalExpr decls (v_Vuna_dBase_dappend bs env) body
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 120 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 118 1 ("no matching clause for Vuna.Eval.chooseAlt")
and v_Vuna_dEval_devalIf = fun decls env sp c t e -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls
  env c) (fun cv -> (match cv with
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dEval_devalExpr decls env t
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dEval_devalExpr decls env e
  | _ -> v_Vuna_dEval_derrAt sp "if condition is not a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 126 5 ("case pattern match failure")))
and v_Vuna_dEval_dapplyValue = fun decls sp v arg -> (match v with
  | C_Vuna_dEval_dVFun (name, bound) -> v_Vuna_dEval_dapplyFun decls name bound arg sp
  | C_Vuna_dEval_dVLam (params, body, env) -> v_Vuna_dEval_dapplyLambda decls params body env arg
  | C_Vuna_dEval_dVCon (name, args) -> v_Vuna_dEval_dapplyCtor decls name args arg sp
  | C_Vuna_dEval_dVBuiltin (name, args) -> v_Vuna_dEval_dapplyBuiltin decls name args arg sp
  | _ -> v_Vuna_dEval_derrAt sp "cannot apply a non-function"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 132 3 ("case pattern match failure"))
and v_Vuna_dEval_dapplyFun = fun decls name bound arg sp -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown function: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (let bound2 = v_Vuna_dBase_dappend bound ((arg) :: ([])) in
    if bi_lt_int (v_Vuna_dBase_dlength bound2) arity then C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun (name,
        bound2))
    else if bi_eq_int (v_Vuna_dBase_dlength bound2) arity then v_Vuna_dEval_dcallFunction decls name bound2
    sp
    else v_Vuna_dEval_derrAt sp ((("too many arguments for ") ^ (name))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 140 3 ("case pattern match failure"))
and v_Vuna_dEval_dapplyLambda = fun decls params body env arg -> (match params with
  | [] -> v_Vuna_dEval_derrAt v_Vuna_dEval_dnoLocSpan "lambda has no parameters"
  | (p) :: ([]) -> v_Vuna_dEval_devalExpr decls ((C_Vuna_dBase_dPair (p, arg)) :: (env)) body
  | (p) :: (rest) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (rest, body, (C_Vuna_dBase_dPair (p, arg)) ::
      (env)))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 149 3 ("case pattern match failure"))
and v_Vuna_dEval_dcallFunction = fun decls name args sp -> v_Vuna_dEval_dtryClauses decls name (v_Vuna_dAst_dclausesFor
  decls name) args sp
and v_Vuna_dEval_dtryClauses = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, name, [], args, sp) -> v_Vuna_dEval_derrAt sp ((("no matching clause for ") ^ (name)))
  | (decls, name, (C_Vuna_dBase_dPair (pats, body)) :: (rest), args, sp) -> if bi_eq_int (v_Vuna_dBase_dlength
  pats) (v_Vuna_dBase_dlength args) then v_Vuna_dEval_dtryMatch decls name pats body rest args sp
else v_Vuna_dEval_dtryClauses decls name rest args sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 172 1 ("no matching clause for Vuna.Eval.tryClauses")
and v_Vuna_dEval_dtryMatch = fun decls name pats body rest args sp -> (match v_Vuna_dEval_dmatchPatterns
  pats args with
  | C_Vuna_dBase_dJust (binds) -> v_Vuna_dEval_devalExpr decls binds body
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_dtryClauses decls name rest args sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 178 3 ("case pattern match failure"))

let v_Vuna_dEval_dinterpretMain = fun decls -> (match v_Vuna_dAst_dfunArity "main" decls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then v_Vuna_dEval_dcallFunction decls "main" []
  v_Vuna_dEval_dnoLocSpan
  else C_Vuna_dBase_dErr ("`main` must be a nullary definition")
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 381 3 ("case pattern match failure"))

let v_Vuna_dBase_dfirstOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (a, b)) -> a
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 105 1 ("no matching clause for Vuna.Base.firstOf")

let rec v_Vuna_dTypedCodegen_dgenArgs = fun decls env args -> v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenExpr
  decls env) args
and v_Vuna_dTypedCodegen_dconcatBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, i, []) -> C_Vuna_dBase_dOk ([])
  | (decls, env, i, (e) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env e)
(fun code -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dconcatBindings decls env (bi_add i 1) rest)
  (fun binds -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (v_Vuna_dTypedCodegen_dconcatBindingName i, code))
      :: (binds))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 392 1 ("no matching clause for Vuna.TypedCodegen.concatBindings")
and v_Vuna_dTypedCodegen_dgenConcatN = fun decls env pieces -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dconcatBindings
  decls env 0 pieces) (fun binds -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dwrapConcatBindings binds ((let
        vuna_cat0' = ("String.concat \"\" [") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "; " (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
              binds)) in
          (let vuna_cat2' = ("]") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))
and v_Vuna_dTypedCodegen_dgenCall = fun decls env fn args -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr
  decls env fn) (fun f -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenArgs decls env args) (fun as2
    -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dgenAppAware decls env fn args f as2)))
and v_Vuna_dTypedCodegen_dgenExpr = fun decls env expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dBase_dmemName name env then C_Vuna_dBase_dOk (v_Vuna_dCodegen_dsanitizeName
    name)
  else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_str name "Nil" then C_Vuna_dBase_dOk ("[]")
    else if bi_eq_str name "True" then C_Vuna_dBase_dOk ("true")
    else if bi_eq_str name "False" then C_Vuna_dBase_dOk ("false")
    else if bi_eq_int arity 0 then C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dctorNameOf name)
    else C_Vuna_dBase_dErr ((let vuna_cat0' = ("typed codegen: constructor ") in
        (let vuna_cat1' = (name) in
          (let vuna_cat2' = (" used without arguments") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dbuiltinName name with
  | C_Vuna_dBase_dJust (ref) -> if bi_eq_str name "getArgs" then C_Vuna_dBase_dOk ("bi_get_args ()")
      else C_Vuna_dBase_dOk (ref)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dzeroArgRef decls name)
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dvalueName name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unbound variable ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 468 17 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 464 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 456 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dBase_dOk (bi_str_from_int n)
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dtypedString s)
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar (name, _) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if (if ((if (bi_eq_str name "Nil") then true
            else (bi_eq_str name "True"))) then true
        else (bi_eq_str name "False")) then C_Vuna_dBase_dErr ((let vuna_cat0' = ("typed codegen: constructor ")
          in
          (let vuna_cat1' = (name) in
            (let vuna_cat2' = (" cannot take arguments") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
      else if bi_eq_str name "Cons" then (match args with
  | (h) :: ((t) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env h) (fun ph
          -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env t) (fun pt -> C_Vuna_dBase_dOk
            ((let vuna_cat0' = ("(") in
                (let vuna_cat1' = (ph) in
                  (let vuna_cat2' = (") :: (") in
                    (let vuna_cat3' = (pt) in
                      (let vuna_cat4' = (")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: Cons arity")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 482 17 ("case pattern match failure"))
      else if bi_eq_int (v_Vuna_dBase_dlength args) arity then v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenArgs
        decls env args) (fun as2 -> (match as2 with
  | (a) :: ([]) -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
              (let vuna_cat1' = (" (") in
                (let vuna_cat2' = (a) in
                  (let vuna_cat3' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
              (let vuna_cat1' = (" (") in
                (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith ", " as2) in
                  (let vuna_cat3' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 490 19 ("case pattern match failure")))
      else C_Vuna_dBase_dErr ((("typed codegen: partial constructor ") ^ (name)))
  | C_Vuna_dBase_dNothing -> if bi_eq_str name "&&" then (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga
          -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dBase_dOk
            ((let vuna_cat0' = ("(if (") in
                (let vuna_cat1' = (ga) in
                  (let vuna_cat2' = (") then (") in
                    (let vuna_cat3' = (gb) in
                      (let vuna_cat4' = (") else false)") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 496 17 ("case pattern match failure"))
      else if bi_eq_str name "||" then (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga
          -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dBase_dOk
            ((let vuna_cat0' = ("(if (") in
                (let vuna_cat1' = (ga) in
                  (let vuna_cat2' = (") then true else (") in
                    (let vuna_cat3' = (gb) in
                      (let vuna_cat4' = ("))") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 503 17 ("case pattern match failure"))
      else if bi_eq_str name "++" then (match args with
  | (_) :: ((_) :: ([])) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals (v_Vuna_dTypedCodegen_dconcatFlatten
            expr) with
  | (only) :: ([]) -> v_Vuna_dTypedCodegen_dgenExpr decls env only
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga
            -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dBase_dOk
              ((let vuna_cat0' = ("((") in
                  (let vuna_cat1' = (ga) in
                    (let vuna_cat2' = (") ^ (") in
                      (let vuna_cat3' = (gb) in
                        (let vuna_cat4' = ("))") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | pieces -> v_Vuna_dTypedCodegen_dgenConcatN decls env pieces
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 512 21 ("case pattern match failure"))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 510 17 ("case pattern match failure"))
      else v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 477 11 ("case pattern match failure"))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 475 7 ("case pattern match failure"))
  | C_Vuna_dAst_dELam (params, body, _) -> (let env2 = v_Vuna_dBase_dappend params env in
    v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env2 body) (fun b -> C_Vuna_dBase_dOk
      ((let vuna_cat0' = ("fun ") in
          (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dBase_dmap v_Vuna_dCodegen_dsanitizeName
                params)) in
            (let vuna_cat2' = (" -> ") in
              (let vuna_cat3' = (b) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | C_Vuna_dAst_dELet (binds, body, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenBinds decls
    env binds body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
        (let vuna_cat1' = (b) in
          (let vuna_cat2' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls
    env scrut) (fun s -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenAlt
        decls env) alts) (fun arms -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(match ") in
          (let vuna_cat1' = (s) in
            (let vuna_cat2' = (" with\n") in
              (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith "\n" (v_Vuna_dBase_dappend arms ((v_Vuna_dTypedCodegen_dgenCatchAll
                        sp "case pattern match failure") :: ([])))) in
                (let vuna_cat4' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dAst_dEIf (c, t, e, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env c)
  (fun gc -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env t) (fun gt -> v_Vuna_dBase_dandThen
      (v_Vuna_dTypedCodegen_dgenExpr decls env e) (fun ge -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("if ")
            in
            (let vuna_cat1' = (gc) in
              (let vuna_cat2' = (" then ") in
                (let vuna_cat3' = (gt) in
                  (let vuna_cat4' = (" else ") in
                    (let vuna_cat5' = (ge) in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                      vuna_cat5']))))))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 452 3 ("case pattern match failure"))
and v_Vuna_dTypedCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenPat
  pat) (fun p -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dpatVars
        pat) env) body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | ") in
        (let vuna_cat1' = (p) in
          (let vuna_cat2' = (" -> ") in
            (let vuna_cat3' = (b) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 539 1 ("no matching clause for Vuna.TypedCodegen.genAlt")
and v_Vuna_dTypedCodegen_dgenBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], body) -> v_Vuna_dTypedCodegen_dgenExpr decls env body
  | (decls, env, (C_Vuna_dBase_dPair (pat, value)) :: (rest), body) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenPat
  pat) (fun p -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env value) (fun v -> v_Vuna_dBase_dandThen
    (v_Vuna_dTypedCodegen_dgenBinds decls (v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dpatVars pat) env)
      rest body) (fun r -> if v_Vuna_dTypedCodegen_disIrrefutable pat then C_Vuna_dBase_dOk ((let vuna_cat0'
          = ("let ") in
          (let vuna_cat1' = (p) in
            (let vuna_cat2' = (" = ") in
              (let vuna_cat3' = (v) in
                (let vuna_cat4' = (" in ") in
                  (let vuna_cat5' = (r) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))

      else C_Vuna_dBase_dOk ((let vuna_cat0' = ("(match ") in
          (let vuna_cat1' = (v) in
            (let vuna_cat2' = (" with\n  | ") in
              (let vuna_cat3' = (p) in
                (let vuna_cat4' = (" -> ") in
                  (let vuna_cat5' = (r) in
                    (let vuna_cat6' = ("\n  | _ -> vuna_fail ") in
                      (let vuna_cat7' = (v_Vuna_dCodegen_docamlString (v_Vuna_dBase_dspanFile (v_Vuna_dAst_dpatSpan
                        pat))) in
                        (let vuna_cat8' = (" ") in
                        (let vuna_cat9' = (bi_str_from_int (v_Vuna_dBase_dspanStartLine (v_Vuna_dAst_dpatSpan
                        pat))) in
                        (let vuna_cat10' = (" ") in
                        (let vuna_cat11' = (bi_str_from_int (v_Vuna_dBase_dspanStartCol (v_Vuna_dAst_dpatSpan
                        pat))) in
                        (let vuna_cat12' = (" (\"let pattern match failure\"))") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'; vuna_cat11';
                        vuna_cat12'])))))))))))))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 550 1 ("no matching clause for Vuna.TypedCodegen.genBinds")

let v_Vuna_dTypedCodegen_dgenClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
  v_Vuna_dTypedCodegen_dgenPat pats) (fun ps -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls
    (v_Vuna_dBase_dappend (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats) env) body) (fun
    b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | (") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " ps) in
          (let vuna_cat2' = (") -> ") in
            (let vuna_cat3' = (b) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 559 1 ("no matching clause for Vuna.TypedCodegen.genClause")

let v_Vuna_dTypedCodegen_dgenFunction = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown function ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> C_Vuna_dBase_dErr ((("typed codegen: no clauses for ") ^ (name)))
  | (C_Vuna_dBase_dPair (pats, body)) :: ([]) -> if bi_eq_int arity 0 then if v_Vuna_dTypedCodegen_disPureZeroArg
    decls name then v_Vuna_dTypedCodegen_dgenExpr decls [] body
    else v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls [] body) (fun b -> C_Vuna_dBase_dOk
      ((("fun () -> ") ^ (b))))
    else if v_Vuna_dTypedCodegen_dallVarPatterns pats then v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr
      decls (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats) body) (fun b -> C_Vuna_dBase_dOk
      ((let vuna_cat0' = ("fun ") in
          (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dBase_dmap v_Vuna_dTypedCodegen_dpatParam
                pats)) in
            (let vuna_cat2' = (" -> ") in
              (let vuna_cat3' = (b) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
    else v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenClause decls
        []) (v_Vuna_dAst_dclausesFor decls name)) (fun arms -> (let params = v_Vuna_dTypedCodegen_dgenParams
        arity in
        (let matched = if bi_eq_int arity 1 then "a0"
          else (let vuna_cat0' = ("(") in
            (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " params) in
              (let vuna_cat2' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in
          C_Vuna_dBase_dOk ((let vuna_cat0' = ("fun ") in
              (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " params) in
                (let vuna_cat2' = (" -> match ") in
                  (let vuna_cat3' = (matched) in
                    (let vuna_cat4' = (" with\n") in
                      (let vuna_cat5' = (v_Vuna_dTypedCodegen_djoinWith "\n" (v_Vuna_dBase_dappend arms
                        ((v_Vuna_dTypedCodegen_dgenCatchAll (v_Vuna_dTypedCodegen_dfunSpan decls name)
                        ((("no matching clause for ") ^ (name)))) :: ([])))) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5']))))))))))
  | (first) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenClause
        decls []) (v_Vuna_dAst_dclausesFor decls name)) (fun arms -> (let params = v_Vuna_dTypedCodegen_dgenParams
        arity in
        (let matched = if bi_eq_int arity 1 then "a0"
          else (let vuna_cat0' = ("(") in
            (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " params) in
              (let vuna_cat2' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in
          C_Vuna_dBase_dOk ((let vuna_cat0' = ("fun ") in
              (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " params) in
                (let vuna_cat2' = (" -> match ") in
                  (let vuna_cat3' = (matched) in
                    (let vuna_cat4' = (" with\n") in
                      (let vuna_cat5' = (v_Vuna_dTypedCodegen_djoinWith "\n" (v_Vuna_dBase_dappend arms
                        ((v_Vuna_dTypedCodegen_dgenCatchAll (v_Vuna_dTypedCodegen_dfunSpan decls name)
                        ((("no matching clause for ") ^ (name)))) :: ([])))) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5']))))))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 598 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 595 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenGroupDef = fun decls name -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenFunction
  decls name) (fun body -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dvalueName name)
      in
      (let vuna_cat1' = (" = ") in
        (let vuna_cat2' = (body) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))

let v_Vuna_dTypedCodegen_dgenGroup = fun decls group -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
  (v_Vuna_dTypedCodegen_dgenGroupDef decls) group) (fun defs -> C_Vuna_dBase_dOk (((if v_Vuna_dTypedCodegen_dgroupNeedsRec
        decls group then "let rec "
        else "let ") ^ (v_Vuna_dTypedCodegen_djoinWith "\nand " defs))))

let v_Vuna_dTypedCodegen_dgenTop = fun decls -> (match v_Vuna_dTypedCodegen_dfunctionNames decls with
  | [] -> C_Vuna_dBase_dErr ("typed codegen: no definitions")
  | names -> (let adj = v_Vuna_dBase_dmap (fun n -> C_Vuna_dBase_dPair (n, v_Vuna_dTypedCodegen_dfilterNames
        (fun r -> v_Vuna_dBase_dmemName r names) (v_Vuna_dTypedCodegen_dgenFunctionRefs decls n))) names
    in
    (let revAdj = v_Vuna_dTypedCodegen_dreverseAdj names adj in
      (match v_Vuna_dTypedCodegen_dpostOrder adj names [] [] with
  | C_Vuna_dBase_dPair (_, order) -> (let comps = v_Vuna_dTypedCodegen_dcollectComps revAdj order [] []
          in
          (let groups = v_Vuna_dTypedCodegen_dgroupsFromComps comps names in
            v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dorderGroups adj groups) (fun ordered -> v_Vuna_dBase_dandThen
              (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenGroup decls) ordered) (fun parts
                -> C_Vuna_dBase_dOk (((v_Vuna_dTypedCodegen_djoinWith "\n\n" parts) ^ ("\n")))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 813 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 806 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dhasSig = fun name sigs -> v_Vuna_dBase_dmemName name (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
  sigs)

let rec v_Vuna_dTypecheck_dseedPlaceholders = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], sigs, st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), sigs, st) -> if v_Vuna_dTypecheck_dhasSig name sigs then v_Vuna_dTypecheck_dseedPlaceholders
rest sigs st
else (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedPlaceholders rest sigs st1 with
  | C_Vuna_dBase_dPair (ps, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, C_Vuna_dTypecheck_dScheme
          ([], ty))) :: (ps), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 631 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 629 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 625 1 ("no matching clause for Vuna.Typecheck.seedPlaceholders")

let rec v_Vuna_dCodegen_dvalidateCtors = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ([])
  | ((C_Vuna_dBase_dPair (name, arity)) :: (rest)) -> if v_Vuna_dBase_dmemName name (v_Vuna_dBase_dmap
  v_Vuna_dBase_dfirstOf rest) then C_Vuna_dBase_dErr ((("duplicate constructor: ") ^ (name)))
else v_Vuna_dCodegen_dvalidateCtors rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 249 1 ("no matching clause for Vuna.Codegen.validateCtors")

let rec v_Vuna_dLoader_dcheckImportAliases = fun label moduleNames aliases -> (match aliases with
  | [] -> C_Vuna_dBase_dOk ([])
  | (C_Vuna_dBase_dPair (alias, m)) :: (rest) -> if v_Vuna_dLoader_dvalidSegment alias then if v_Vuna_dBase_dmemName
  alias (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf rest) then C_Vuna_dBase_dErr ((let vuna_cat0' = (label)
      in
      (let vuna_cat1' = (": duplicate module alias ") in
        (let vuna_cat2' = (alias) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  else if v_Vuna_dBase_dmemName alias moduleNames then if bi_eq_str alias m then v_Vuna_dLoader_dcheckImportAliases
  label moduleNames rest
  else C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": module alias ") in
        (let vuna_cat2' = (alias) in
          (let vuna_cat3' = (" conflicts with an imported module") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  else v_Vuna_dLoader_dcheckImportAliases label moduleNames rest
  else C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": invalid module alias ") in
        (let vuna_cat2' = (alias) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 65 3 ("case pattern match failure"))

let v_Vuna_dLoader_dvalidateImports = fun label imports -> if v_Vuna_dLoader_dhasDuplicateName (v_Vuna_dLoader_dimportModuleNames
  imports) then C_Vuna_dBase_dErr (((label) ^ (": duplicate import")))
else v_Vuna_dLoader_dcheckImportAliases label (v_Vuna_dLoader_dimportModuleNames imports) (v_Vuna_dLoader_dimportAliases
  imports)

let v_Vuna_dBase_dsecondOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (a, b)) -> b
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 108 1 ("no matching clause for Vuna.Base.secondOf")

let v_Vuna_dTypedCodegen_druntimeCodeTyped = fun () -> (("\n") ^ (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dBase_dmap
      v_Vuna_dBase_dsecondOf v_Vuna_dTypedCodegen_druntimePrelude)))

let v_Vuna_dTypedCodegen_druntimeForBody = fun body -> if bi_gt_int (bi_str_length body) 20000 then v_Vuna_dTypedCodegen_druntimeCodeTyped
()
else (("\n") ^ (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dBase_dmap v_Vuna_dBase_dsecondOf (v_Vuna_dTypedCodegen_dfilterRuntime
        v_Vuna_dTypedCodegen_druntimePrelude (bi_str_unpack body)))))

let rec v_Vuna_dCodegen_dgenPattern = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ("_", []))
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((("x_") ^ (v_Vuna_dCodegen_dsanitizeName
          name)), (name) :: ([])))
  | C_Vuna_dAst_dPInt (n, _) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((let vuna_cat0' = ("VInt (") in
        (let vuna_cat1' = (bi_str_from_int n) in
          (let vuna_cat2' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), []))
  | C_Vuna_dAst_dPStr (s, _) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((("VStr ") ^ (v_Vuna_dCodegen_docamlString
          s)), []))
  | C_Vuna_dAst_dPCon (name, pats, _) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse v_Vuna_dCodegen_dgenPattern
    pats) (fun parts -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dCodegen_dpconPattern name (v_Vuna_dBase_dmap
          v_Vuna_dBase_dfirstOf parts), v_Vuna_dBase_dconcatMap v_Vuna_dBase_dsecondOf parts)))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 104 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dgenLambda = fun decls scope params body -> (match params with
  | [] -> v_Vuna_dCodegen_dgenExpr decls scope body
  | (p) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenLambda decls ((p) :: (scope)) rest body)
  (fun inner -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VFun (\"\", fun x_") in
        (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName p) in
          (let vuna_cat2' = (" -> ") in
            (let vuna_cat3' = (inner) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 116 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenPattern
  pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (patCode, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dBase_dappend
        bound scope) body) (fun bodyCode -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("| ") in
          (let vuna_cat1' = (patCode) in
            (let vuna_cat2' = (" -> ") in
              (let vuna_cat3' = (bodyCode) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 124 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 122 1 ("no matching clause for Vuna.Codegen.genAlt")
and v_Vuna_dCodegen_dgenCase = fun decls scope scrut alts -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr
  decls scope scrut) (fun scrutCode -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dCodegen_dgenAlt
      decls scope) alts) (fun branches -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(match (") in
        (let vuna_cat1' = (scrutCode) in
          (let vuna_cat2' = (") with\n    ") in
            (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "\n    " branches) in
              (let vuna_cat4' = ("\n    | _ -> fail \"case pattern match failure\")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenLet = fun decls scope binds body -> (match binds with
  | [] -> v_Vuna_dCodegen_dgenExpr decls scope body
  | (C_Vuna_dBase_dPair (pat, value)) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls
    scope value) (fun valueCode -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenPattern pat) (fun p -> (match
        p with
  | C_Vuna_dBase_dPair (patCode, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenLet decls (v_Vuna_dBase_dappend
            bound scope) rest body) (fun bodyCode -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(let ") in
              (let vuna_cat1' = (patCode) in
                (let vuna_cat2' = (" = (") in
                  (let vuna_cat3' = (valueCode) in
                    (let vuna_cat4' = (") in ") in
                      (let vuna_cat5' = (bodyCode) in
                        (let vuna_cat6' = (")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'])))))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 143 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 138 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenApply = fun decls scope fn args -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr
  decls scope fn) (fun fnCode -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (fun a -> v_Vuna_dCodegen_dgenExpr
      decls scope a) args) (fun argCodes -> C_Vuna_dBase_dOk (v_Vuna_dCodegen_dcgApplyFold fnCode argCodes)))
and v_Vuna_dCodegen_dgenAndShort = fun decls scope a b -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr
  decls scope a) (fun ac -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls scope b) (fun bc ->
    C_Vuna_dBase_dOk ((let vuna_cat0' = ("(let vuna_and' = (") in
        (let vuna_cat1' = (ac) in
          (let vuna_cat2' = (") in (match vuna_and' with VCon (\"True\", []) -> (match (") in
            (let vuna_cat3' = (bc) in
              (let vuna_cat4' = (") with VCon (\"True\", []) -> VCon (\"True\", []) | VCon (\"False\", []) -> VCon (\"False\", []) | _ -> fail \"expected a Bool\") | VCon (\"False\", []) -> VCon (\"False\", []) | _ -> fail \"expected a Bool\"))")
                in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenOrShort = fun decls scope a b -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr
  decls scope a) (fun ac -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls scope b) (fun bc ->
    C_Vuna_dBase_dOk ((let vuna_cat0' = ("(let vuna_or' = (") in
        (let vuna_cat1' = (ac) in
          (let vuna_cat2' = (") in (match vuna_or' with VCon (\"True\", []) -> VCon (\"True\", []) | VCon (\"False\", []) -> (match (")
            in
            (let vuna_cat3' = (bc) in
              (let vuna_cat4' = (") with VCon (\"True\", []) -> VCon (\"True\", []) | VCon (\"False\", []) -> VCon (\"False\", []) | _ -> fail \"expected a Bool\") | _ -> fail \"expected a Bool\"))")
                in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenEApp = fun decls scope fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("&&", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCodegen_dgenAndShort decls scope a b
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 188 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar ("||", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCodegen_dgenOrShort decls scope a b
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 192 7 ("case pattern match failure"))
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 186 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenExpr = fun decls scope expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> v_Vuna_dCodegen_dgenVar decls scope name
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VInt (") in
      (let vuna_cat1' = (bi_str_from_int n) in
        (let vuna_cat2' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dBase_dOk ((("VStr ") ^ (v_Vuna_dCodegen_docamlString s)))
  | C_Vuna_dAst_dELam (params, body, _) -> v_Vuna_dCodegen_dgenLambda decls scope params body
  | C_Vuna_dAst_dEApp (fn, args, _) -> v_Vuna_dCodegen_dgenEApp decls scope fn args
  | C_Vuna_dAst_dELet (binds, body, _) -> v_Vuna_dCodegen_dgenLet decls scope binds body
  | C_Vuna_dAst_dECase (scrut, alts, _) -> v_Vuna_dCodegen_dgenCase decls scope scrut alts
  | C_Vuna_dAst_dEIf (c, t, e, _) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls scope c) (fun
    cc -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls scope t) (fun tc -> v_Vuna_dBase_dandThen
      (v_Vuna_dCodegen_dgenExpr decls scope e) (fun ec -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(match (")
            in
            (let vuna_cat1' = (cc) in
              (let vuna_cat2' = (") with VCon (\"True\", []) -> ") in
                (let vuna_cat3' = (tc) in
                  (let vuna_cat4' = (" | VCon (\"False\", []) -> ") in
                    (let vuna_cat5' = (ec) in
                      (let vuna_cat6' = (" | _ -> fail \"if condition is not a Bool\")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'])))))))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 198 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dgenBranches = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, arity, []) -> C_Vuna_dBase_dOk ([])
  | (decls, arity, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
  v_Vuna_dCodegen_dgenPattern pats) (fun parts -> (let patternCode = if bi_eq_int arity 1 then v_Vuna_dCodegen_dheadOf
    (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf parts)
    else (let vuna_cat0' = ("(") in
      (let vuna_cat1' = (v_Vuna_dCodegen_djoinList ", " (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf parts))
        in
        (let vuna_cat2' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in
    v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dBase_dconcatMap v_Vuna_dBase_dsecondOf
        parts) body) (fun b -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenBranches decls arity rest) (fun
        restBranches -> C_Vuna_dBase_dOk (((let vuna_cat0' = ("| ") in
              (let vuna_cat1' = (patternCode) in
                (let vuna_cat2' = (" -> ") in
                  (let vuna_cat3' = (b) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (restBranches))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 274 1 ("no matching clause for Vuna.Codegen.genBranches")

let v_Vuna_dCodegen_dgenFunction = fun decls name clauses -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_darityOf
  name clauses) (fun arity -> (match clauses with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("function ") in
        (let vuna_cat1' = (name) in
          (let vuna_cat2' = (" has no clauses") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (C_Vuna_dBase_dPair (pats, body)) :: (_) -> if bi_eq_int arity 0 then v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr
      decls [] body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(fun () -> ") in
          (let vuna_cat1' = (b) in
            (let vuna_cat2' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
    else (let params = v_Vuna_dCodegen_dmakeParams arity in
      (let scrutinee = if bi_eq_int arity 1 then v_Vuna_dCodegen_dheadOf params
        else (let vuna_cat0' = ("(") in
          (let vuna_cat1' = (v_Vuna_dCodegen_djoinList ", " params) in
            (let vuna_cat2' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in
        v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenBranches decls arity clauses) (fun branches -> (let
            matchCode = (let vuna_cat0' = ("(match (") in
              (let vuna_cat1' = (scrutinee) in
                (let vuna_cat2' = (") with\n    ") in
                  (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "\n    " branches) in
                    (let vuna_cat4' = ("\n    | _ -> fail \"no matching clause for ") in
                      (let vuna_cat5' = (name) in
                        (let vuna_cat6' = ("\")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6']))))))) in
            C_Vuna_dBase_dOk (v_Vuna_dCodegen_dwrapFun name params matchCode 0)))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 284 5 ("case pattern match failure")))

let rec v_Vuna_dCodegen_dgenFunctions = fun a0 a1 -> match (a0, a1) with
  | (decls, []) -> C_Vuna_dBase_dOk ([])
  | (decls, (C_Vuna_dBase_dPair (name, clauses)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunction
  decls name clauses) (fun def -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunctions decls rest) (fun
    defs -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (name, def)) :: (defs))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 330 1 ("no matching clause for Vuna.Codegen.genFunctions")

let rec v_Vuna_dCodegen_drenderRecsFrom = fun a0 a1 -> match (a0, a1) with
  | ([], index) -> ""
  | ((f) :: (rest), index) -> (let prefix = if bi_eq_int index 0 then "let rec "
  else "and " in
  (let vuna_cat0' = (prefix) in
    (let vuna_cat1' = ("v_") in
      (let vuna_cat2' = (v_Vuna_dCodegen_dsanitizeName (v_Vuna_dBase_dfirstOf f)) in
        (let vuna_cat3' = (" = ") in
          (let vuna_cat4' = (v_Vuna_dBase_dsecondOf f) in
            (let vuna_cat5' = ("\n") in
              (let vuna_cat6' = (v_Vuna_dCodegen_drenderRecsFrom rest (bi_add index 1)) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                vuna_cat6']))))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 336 1 ("no matching clause for Vuna.Codegen.renderRecsFrom")

let v_Vuna_dCodegen_dgenerateProgram = fun decls printResult -> (match v_Vuna_dCodegen_dallCtors decls
  with
  | ctors -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dvalidateCtors ctors) (fun _u -> v_Vuna_dBase_dandThen
    (v_Vuna_dCodegen_dcheckNoCtorFun (v_Vuna_dCodegen_dgroupFunctions decls) decls) (fun _u -> (match
        v_Vuna_dAst_dfunArity "main" decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunctions decls (v_Vuna_dCodegen_dgroupFunctions
            decls)) (fun defs -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenCtorDefs ctors) (fun ctorDefs
            -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dCodegen_druntimeCode) in
                (let vuna_cat1' = (ctorDefs) in
                  (let vuna_cat2' = (v_Vuna_dCodegen_dgenBuiltinDef v_Vuna_dCodegen_dbuiltinInfos) in
                    (let vuna_cat3' = (v_Vuna_dCodegen_drenderRecsFrom defs 0) in
                      (let vuna_cat4' = (if printResult then "let () = print_endline (show_value (v_main ()))\n"

                        else "let () = ignore (v_main ())\n") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dErr ("`main` must be a nullary definition")
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 347 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 343 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dmemChar = fun c chars -> (match chars with
  | [] -> false
  | (x) :: (rest) -> if bi_eq_int x c then true
  else v_Vuna_dBase_dmemChar c rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 112 3 ("case pattern match failure"))

let v_Vuna_dBase_dcontainsDot = fun s -> v_Vuna_dBase_dmemChar 46 (bi_str_unpack s)

let v_Vuna_dLoader_dcheckBinder = fun label name -> if v_Vuna_dBase_dcontainsDot name then C_Vuna_dBase_dErr
((let vuna_cat0' = (label) in
    (let vuna_cat1' = (": invalid variable name ") in
      (let vuna_cat2' = (name) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
else C_Vuna_dBase_dOk (name)

let v_Vuna_dLoader_dcheckTopName = fun label name -> if v_Vuna_dBase_dcontainsDot name then C_Vuna_dBase_dErr
((let vuna_cat0' = (label) in
    (let vuna_cat1' = (": invalid top-level name ") in
      (let vuna_cat2' = (name) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
else C_Vuna_dBase_dOk (name)

let v_Vuna_dLoader_dresolveTopName = fun label prefix name -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcheckTopName
  label name) (fun _u -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name))

let v_Vuna_dLoader_dresolveCtorDecl = fun label prefix ctor -> if v_Vuna_dLoader_disGlobalCtor ctor then
C_Vuna_dBase_dOk (ctor)
else v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcheckTopName label ctor) (fun _u -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle
    prefix ctor))

let v_Vuna_dLoader_dresolveTypeTopName = fun label prefix name -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcheckTopName
  label name) (fun _u -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name))

let rec v_Vuna_dBase_dstartsWithChars = fun a0 a1 -> match (a0, a1) with
  | ([], text) -> true
  | ((p) :: (prest), text) -> (match text with
  | [] -> false
  | (t) :: (trest) -> if bi_eq_int p t then v_Vuna_dBase_dstartsWithChars prest trest
  else false
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 125 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 123 1 ("no matching clause for Vuna.Base.startsWithChars")

let v_Vuna_dBase_dstartsWith = fun prefix text -> v_Vuna_dBase_dstartsWithChars (bi_str_unpack prefix)
(bi_str_unpack text)

let rec v_Lint_dlintArgs = fun doFix files args -> (match args with
  | [] -> if v_Lint_disNilList files then v_Lint_dlintUsageError ()
  else v_Lint_dlintFiles doFix (v_Vuna_dBase_dreverse files)
  | (arg) :: (rest) -> if bi_eq_str arg "--fix" then v_Lint_dlintArgs true files rest
  else if v_Vuna_dBase_dstartsWith "-" arg then v_Lint_dlintUsageError ()
  else v_Lint_dlintArgs doFix ((arg) :: (files)) rest
  | _ -> vuna_fail "app/Lint.vuna" 803 3 ("case pattern match failure"))

let v_Lint_drunLint = fun args -> v_Lint_dlintArgs false [] args

let rec v_Vuna_dBase_dsplitCharsOnDot = fun chars acc seg -> (match chars with
  | [] -> v_Vuna_dBase_dreverse ((bi_str_pack (v_Vuna_dBase_dreverse seg)) :: (acc))
  | (c) :: (rest) -> if bi_eq_int c 46 then v_Vuna_dBase_dsplitCharsOnDot rest ((bi_str_pack (v_Vuna_dBase_dreverse
        seg)) :: (acc)) []
  else v_Vuna_dBase_dsplitCharsOnDot rest acc ((c) :: (seg))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 134 3 ("case pattern match failure"))

let v_Vuna_dBase_dsplitOnDot = fun s -> v_Vuna_dBase_dsplitCharsOnDot (bi_str_unpack s) [] []

let v_Vuna_dLoader_dvalidModuleName = fun name -> (match v_Vuna_dBase_dsplitOnDot name with
  | [] -> false
  | segs -> v_Vuna_dLoader_dallSegmentsValid segs
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 35 3 ("case pattern match failure"))

let v_Vuna_dBase_dsplitLastDot = fun parts -> (match v_Vuna_dBase_dreverse parts with
  | [] -> C_Vuna_dBase_dPair ([], "")
  | (last) :: (rest) -> C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse rest, last)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 142 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dlastName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> base
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 14 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disBoolName = fun name -> bi_eq_str (v_Vuna_dTypedCodegen_dlastName name) "Bool"

let v_Vuna_dTypedCodegen_disListName = fun name -> bi_eq_str (v_Vuna_dTypedCodegen_dlastName name) "List"

let rec v_Vuna_dTypedCodegen_dnonSpecialData = fun decls -> (match v_Vuna_dTypedCodegen_ddataDecls decls
  with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _) -> if (if (v_Vuna_dTypedCodegen_disBoolName name) then
      true
      else (v_Vuna_dTypedCodegen_disListName name)) then v_Vuna_dTypedCodegen_dnonSpecialData rest
    else (d) :: (v_Vuna_dTypedCodegen_dnonSpecialData rest)
  | _ -> v_Vuna_dTypedCodegen_dnonSpecialData rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 59 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 56 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_docamlType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if bi_eq_str name "Int" then C_Vuna_dBase_dOk ("int")
  else if bi_eq_str name "String" then C_Vuna_dBase_dOk ("string")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("bool")
  else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dBase_dErr ("List type needs an argument")

  else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (ty)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dtypeNameOf name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown type ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 89 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 86 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls params a) (fun
        ta -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls params b) (fun tb -> C_Vuna_dBase_dOk
          ((let vuna_cat0' = ("(") in
              (let vuna_cat1' = (ta) in
                (let vuna_cat2' = (") -> (") in
                  (let vuna_cat3' = (tb) in
                    (let vuna_cat4' = (")") in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid arrow type")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 95 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls params a) (fun ta -> C_Vuna_dBase_dOk
        ((let vuna_cat0' = ("(") in
            (let vuna_cat1' = (ta) in
              (let vuna_cat2' = (") list") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid List type")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 103 13 ("case pattern match failure"))
    else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown type constructor ") ^ (name)))
  | C_Vuna_dBase_dJust (d) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_docamlType
          decls params) args) (fun tys -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dappType tys (v_Vuna_dTypedCodegen_dtypeNameOf
            name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 108 13 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type application")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 93 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type expression")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 79 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dAst_dCtor (name, ty, arity, _)) -> (match v_Vuna_dTypedCodegen_dsplitArrows
  ty with
  | [] -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dctorNameOf name)
  | (only) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls pmap only) (fun t ->
    C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
        (let vuna_cat1' = (" of (") in
          (let vuna_cat2' = (t) in
            (let vuna_cat3' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | fields -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_docamlType
      decls pmap) fields) (fun ts -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dTypedCodegen_dctorNameOf
          name) in
        (let vuna_cat1' = (" of ") in
          (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith " * " (v_Vuna_dBase_dmap (fun t -> (let
                    vuna_cat0' = ("(") in
                    (let vuna_cat1' = (t) in
                      (let vuna_cat2' = (")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) ts)) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 145 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 144 1 ("no matching clause for Vuna.TypedCodegen.genCtor")

let v_Vuna_dTypedCodegen_dgenData = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors, _)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
  (v_Vuna_dTypedCodegen_dgenCtor decls (v_Vuna_dTypedCodegen_dparamMap params)) ctors) (fun cs -> C_Vuna_dBase_dOk
  ((let vuna_cat0' = ("  ") in
      (let vuna_cat1' = (v_Vuna_dTypedCodegen_ddataPrefix params) in
        (let vuna_cat2' = (v_Vuna_dTypedCodegen_dtypeNameOf name) in
          (let vuna_cat3' = (" =\n    ") in
            (let vuna_cat4' = (v_Vuna_dTypedCodegen_djoinWith "\n  | " cs) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 129 1 ("no matching clause for Vuna.TypedCodegen.genData")

let v_Vuna_dTypedCodegen_dgenTypeDecls = fun decls -> (match v_Vuna_dTypedCodegen_dnonSpecialData decls
  with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenData decls)
    ds) (fun parts -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("type ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in
          (let vuna_cat2' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 153 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dshowForType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if bi_eq_str name "Int" then C_Vuna_dBase_dOk ("string_of_int")
  else if bi_eq_str name "String" then C_Vuna_dBase_dOk ("show_vstring")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("show_vbool")
  else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dBase_dErr ("typed codegen: List type needs an argument")

  else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dBase_dJust (s) -> C_Vuna_dBase_dOk (s)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dshowNameOf name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown show type ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 170 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 167 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("->", _) -> C_Vuna_dBase_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForType decls params a) (fun sa ->
        C_Vuna_dBase_dOk ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (")
            in
            (let vuna_cat1' = (sa) in
              (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid List show type")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 178 13 ("case pattern match failure"))
    else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForType
          decls params) args) (fun ss -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
            (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
              (let vuna_cat2' = (" ") in
                (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in
                  (let vuna_cat4' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown show type constructor ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 183 13 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type application")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 174 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 160 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dshowForTy = fun decls ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> C_Vuna_dBase_dOk ("(fun _ -> \"<value>\")")
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dBase_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dTypecheck_dTCon (name, args) -> if bi_eq_str name "Int" then C_Vuna_dBase_dOk ("string_of_int")

  else if bi_eq_str name "String" then C_Vuna_dBase_dOk ("show_vstring")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("show_vbool")
  else if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForTy decls a) (fun sa -> C_Vuna_dBase_dOk
      ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (")
          in
          (let vuna_cat1' = (sa) in
            (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: main List type must have one argument")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 200 9 ("case pattern match failure"))
  else v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForTy decls)
    args) (fun ss -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
          (let vuna_cat2' = (" ") in
            (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 192 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dgenShowFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, pmap, [], []) -> C_Vuna_dBase_dOk ([])
  | (decls, pmap, (f) :: (fs), (v) :: (vs)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForType
  decls pmap f) (fun s -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenShowFields decls pmap fs vs)
  (fun ss -> C_Vuna_dBase_dOk (((let vuna_cat0' = ("(") in
          (let vuna_cat1' = (s) in
            (let vuna_cat2' = (") ") in
              (let vuna_cat3' = (v) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (ss))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 209 1 ("no matching clause for Vuna.TypedCodegen.genShowFields")

let v_Vuna_dTypedCodegen_dgenShowCtorWith = fun decls pmap name fields -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenShowFields
  decls pmap fields (v_Vuna_dTypedCodegen_dfieldVars (v_Vuna_dBase_dlength fields))) (fun shows -> (match
    v_Vuna_dTypedCodegen_dfieldVars (v_Vuna_dBase_dlength fields) with
  | [] -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
          (let vuna_cat2' = (" -> ") in
            (let vuna_cat3' = (v_Vuna_dCodegen_docamlString (v_Vuna_dTypedCodegen_dlastName name)) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | (v) :: ([]) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
          (let vuna_cat2' = (" ") in
            (let vuna_cat3' = (v) in
              (let vuna_cat4' = (" -> show_ctor ") in
                (let vuna_cat5' = (v_Vuna_dCodegen_docamlString (v_Vuna_dTypedCodegen_dlastName name))
                  in
                  (let vuna_cat6' = (" [") in
                    (let vuna_cat7' = (v_Vuna_dTypedCodegen_djoinWith "; " shows) in
                      (let vuna_cat8' = ("]") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8']))))))))))
  | vars -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_dctorNameOf name) in
          (let vuna_cat2' = (" (") in
            (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith ", " vars) in
              (let vuna_cat4' = (") -> show_ctor ") in
                (let vuna_cat5' = (v_Vuna_dCodegen_docamlString (v_Vuna_dTypedCodegen_dlastName name))
                  in
                  (let vuna_cat6' = (" [") in
                    (let vuna_cat7' = (v_Vuna_dTypedCodegen_djoinWith "; " shows) in
                      (let vuna_cat8' = ("]") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8']))))))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 219 5 ("case pattern match failure")))

let v_Vuna_dTypedCodegen_dgenShowCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dAst_dCtor (name, ty, arity, _)) -> v_Vuna_dTypedCodegen_dgenShowCtorWith decls
pmap name (v_Vuna_dTypedCodegen_dsplitArrows ty)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 215 1 ("no matching clause for Vuna.TypedCodegen.genShowCtor")

let v_Vuna_dTypedCodegen_dgenShowFuncWith = fun decls pmap params name ctors -> v_Vuna_dBase_dandThen
(v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowCtor decls pmap) ctors) (fun arms -> v_Vuna_dTypedCodegen_dgenShowBody
  pmap params name arms)

let v_Vuna_dTypedCodegen_dgenShowFunc = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors, _)) -> v_Vuna_dTypedCodegen_dgenShowFuncWith decls
(v_Vuna_dTypedCodegen_dshowParamMap params) params name ctors
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 224 1 ("no matching clause for Vuna.TypedCodegen.genShowFunc")

let v_Vuna_dTypedCodegen_dgenShowDecls = fun decls -> (match v_Vuna_dTypedCodegen_dnonSpecialData decls
  with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowFunc decls)
    ds) (fun parts -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("let rec ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in
          (let vuna_cat2' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 249 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenerateProgramTyped = fun decls globals printResult -> (match v_Vuna_dTypecheck_dlookupScheme
  "main" globals with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: no main definition")
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dScheme (qs, ty)) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dBase_dErr ("typed codegen: main must be zero-arity")
  | _ -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForTy decls ty) (fun showMain -> v_Vuna_dBase_dandThen
      (v_Vuna_dTypedCodegen_dgenTypeDecls decls) (fun types -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenShowDecls
          decls) (fun shows -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenTop decls) (fun tops ->
            (let core = (let vuna_cat0' = (types) in
                (let vuna_cat1' = ("\n") in
                  (let vuna_cat2' = (shows) in
                    (let vuna_cat3' = ("\n") in
                      (let vuna_cat4' = (tops) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
              in
              (let suffix = v_Vuna_dTypedCodegen_dtypedMainSuffix decls showMain printResult in
                C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dformatOutput ((let vuna_cat0' = (v_Vuna_dTypedCodegen_druntimeForBody
                        (((core) ^ (suffix)))) in
                      (let vuna_cat1' = ("\n") in
                        (let vuna_cat2' = (core) in
                        (let vuna_cat3' = (suffix) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 963 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 960 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dshortTyName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> base
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 914 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dspecializeCmp = fun name ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (n, args) -> if bi_eq_str (v_Vuna_dTypecheck_dshortTyName n) "Int" then v_Vuna_dTypecheck_dintCmpName
  name
  else if bi_eq_str (v_Vuna_dTypecheck_dshortTyName n) "String" then v_Vuna_dTypecheck_dstrCmpName name

  else if bi_eq_str (v_Vuna_dTypecheck_dshortTyName n) "Bool" then v_Vuna_dTypecheck_dboolCmpName name

  else name
  | _ -> name
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 373 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dlowerExpr = fun subst expr -> (match expr with
  | C_Vuna_dTypecheck_dXEVar (name, sp) -> C_Vuna_dAst_dEVar (name, sp)
  | C_Vuna_dTypecheck_dXEInt (n, sp) -> C_Vuna_dAst_dEInt (n, sp)
  | C_Vuna_dTypecheck_dXEStr (s, sp) -> C_Vuna_dAst_dEStr (s, sp)
  | C_Vuna_dTypecheck_dXELam (params, body, sp) -> C_Vuna_dAst_dELam (params, v_Vuna_dTypecheck_dlowerExpr
    subst body, sp)
  | C_Vuna_dTypecheck_dXEApp (fn, args, sp) -> C_Vuna_dAst_dEApp (v_Vuna_dTypecheck_dlowerExpr subst fn,
    v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerExpr subst) args, sp)
  | C_Vuna_dTypecheck_dXECmp (name, args, ty, sp) -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (v_Vuna_dTypecheck_dspecializeCmp
      name (v_Vuna_dTypecheck_dresolveTy subst ty), sp), v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerExpr
      subst) args, sp)
  | C_Vuna_dTypecheck_dXELet (binds, body, sp) -> C_Vuna_dAst_dELet (v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerBind
      subst) binds, v_Vuna_dTypecheck_dlowerExpr subst body, sp)
  | C_Vuna_dTypecheck_dXECase (scrut, ty, alts, sp) -> C_Vuna_dAst_dECase (v_Vuna_dTypecheck_dlowerExpr
    subst scrut, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerAlt subst) alts, sp)
  | C_Vuna_dTypecheck_dXEIf (c, t, e, sp) -> C_Vuna_dAst_dEIf (v_Vuna_dTypecheck_dlowerExpr subst c, v_Vuna_dTypecheck_dlowerExpr
    subst t, v_Vuna_dTypecheck_dlowerExpr subst e, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 400 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dlowerBind = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dBase_dPair (pat, value)) -> C_Vuna_dBase_dPair (pat, v_Vuna_dTypecheck_dlowerExpr
  subst value)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 411 1 ("no matching clause for Vuna.Typecheck.lowerBind")
and v_Vuna_dTypecheck_dlowerAlt = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dBase_dPair (pat, body)) -> C_Vuna_dBase_dPair (pat, v_Vuna_dTypecheck_dlowerExpr subst
  body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 413 1 ("no matching clause for Vuna.Typecheck.lowerAlt")

let v_Vuna_dTypecheck_dlowerClause = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dBase_dPair (pats, body)) -> C_Vuna_dBase_dPair (pats, v_Vuna_dTypecheck_dlowerExpr
  subst body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 415 1 ("no matching clause for Vuna.Typecheck.lowerClause")

let rec v_Vuna_dTypecheck_dlowerClauses = fun a0 a1 -> match (a0, a1) with
  | (subst, []) -> []
  | (subst, (clause) :: (rest)) -> (v_Vuna_dTypecheck_dlowerClause subst clause) :: (v_Vuna_dTypecheck_dlowerClauses
  subst rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 417 1 ("no matching clause for Vuna.Typecheck.lowerClauses")

let v_Vuna_dTypecheck_dsameBuiltinTy = fun a b -> (let sa = v_Vuna_dTypecheck_dshortTyName a in
  (if ((if (bi_eq_str sa "Bool") then true
        else (bi_eq_str sa "List"))) then (bi_eq_str sa (v_Vuna_dTypecheck_dshortTyName b))
    else false))

let rec v_Vuna_dTypecheck_dunifyLists = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], st) -> C_Vuna_dBase_dOk (st)
  | ((a) :: (ar), (b) :: (br), st) -> (match v_Vuna_dTypecheck_dunify a b st with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (st2) -> v_Vuna_dTypecheck_dunifyLists ar br st2
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 109 3 ("case pattern match failure"))
  | (_, _, st) -> C_Vuna_dBase_dErr ("type mismatch: different number of arguments")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 107 1 ("no matching clause for Vuna.Typecheck.unifyLists")
and v_Vuna_dTypecheck_dunify = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (a, b, C_Vuna_dTypecheck_dTC (n, s)) -> (match v_Vuna_dTypecheck_dresolveTy s a with
  | ra -> (match v_Vuna_dTypecheck_dresolveTy s b with
  | rb -> (match ra with
  | C_Vuna_dTypecheck_dTVar (i) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if bi_eq_int i j then C_Vuna_dBase_dOk (C_Vuna_dTypecheck_dTC (n, s))

        else v_Vuna_dTypecheck_dbindVar i rb (C_Vuna_dTypecheck_dTC (n, s))
  | _ -> if v_Vuna_dTypecheck_doccursIn i s rb then C_Vuna_dBase_dErr ((("occurs check: ") ^ (v_Vuna_dTypecheck_dshowTy
              rb)))
        else v_Vuna_dTypecheck_dbindVar i rb (C_Vuna_dTypecheck_dTC (n, s))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 122 15 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (tn, xs) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if v_Vuna_dTypecheck_doccursIn j s ra then C_Vuna_dBase_dErr ((("occurs check: ")
            ^ (v_Vuna_dTypecheck_dshowTy ra)))
        else v_Vuna_dTypecheck_dbindVar j ra (C_Vuna_dTypecheck_dTC (n, s))
  | C_Vuna_dTypecheck_dTCon (tn2, ys) -> if (if (bi_eq_str tn tn2) then true
          else (v_Vuna_dTypecheck_dsameBuiltinTy tn tn2)) then v_Vuna_dTypecheck_dunifyLists xs ys (C_Vuna_dTypecheck_dTC
          (n, s))
        else C_Vuna_dBase_dErr ((let vuna_cat0' = ("type mismatch: expected ") in
            (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy rb) in
              (let vuna_cat2' = (" but got ") in
                (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy ra) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("type mismatch: expected ") in
            (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy rb) in
              (let vuna_cat2' = (" but got ") in
                (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy ra) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 129 15 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTFun (x, y) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if v_Vuna_dTypecheck_doccursIn j s ra then C_Vuna_dBase_dErr ((("occurs check: ")
            ^ (v_Vuna_dTypecheck_dshowTy ra)))
        else v_Vuna_dTypecheck_dbindVar j ra (C_Vuna_dTypecheck_dTC (n, s))
  | C_Vuna_dTypecheck_dTFun (x2, y2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify x x2 (C_Vuna_dTypecheck_dTC
            (n, s))) (fun st2 -> v_Vuna_dTypecheck_dunify y y2 st2)
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("type mismatch: expected ") in
            (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy rb) in
              (let vuna_cat2' = (" but got ") in
                (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy ra) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 138 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 120 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 118 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 116 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 115 1 ("no matching clause for Vuna.Typecheck.unify")

let v_Vuna_dEval_ddisplayName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> base
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 352 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dshowValue = fun v -> (match v with
  | C_Vuna_dEval_dVInt (n) -> bi_str_from_int n
  | C_Vuna_dEval_dVStr (s) -> v_Vuna_dEval_dshowString s
  | C_Vuna_dEval_dVCon (name, []) -> v_Vuna_dEval_ddisplayName name
  | C_Vuna_dEval_dVCon (name, args) -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (v_Vuna_dEval_ddisplayName name) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_Vuna_dEval_dshowValues args) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dEval_dVFun (name, args) -> (let vuna_cat0' = ("<function ") in
    (let vuna_cat1' = (v_Vuna_dEval_ddisplayName name) in
      (let vuna_cat2' = (">") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dEval_dVLam (params, body, env) -> "<lambda>"
  | C_Vuna_dEval_dVBuiltin (name, args) -> (let vuna_cat0' = ("<builtin ") in
    (let vuna_cat1' = (name) in
      (let vuna_cat2' = (">") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 356 3 ("case pattern match failure"))
and v_Vuna_dEval_dshowValues = fun a0 -> match a0 with
  | ([]) -> ""
  | ((v) :: ([])) -> v_Vuna_dEval_dshowValue v
  | ((v) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dEval_dshowValue v) in
  (let vuna_cat1' = (" ") in
    (let vuna_cat2' = (v_Vuna_dEval_dshowValues rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 365 1 ("no matching clause for Vuna.Eval.showValues")

let v_Vuna_dEval_drunDecls = fun decls -> (match v_Vuna_dEval_dinterpretMain decls with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (v) -> v_Vuna_dEval_dshowValue v
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 388 3 ("case pattern match failure"))

let v_Vuna_dInterp_dinterpret = fun source -> (match v_Vuna_dParser_dparseSource "<input>" source with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, decls)) -> (match imports with
  | [] -> v_Vuna_dEval_drunDecls decls
  | _ -> "error: imports are only supported by interpretFile"
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 15 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 12 3 ("case pattern match failure"))

let rec v_Vuna_dBase_djoinDots = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (".") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinDots rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 147 1 ("no matching clause for Vuna.Base.joinDots")

let v_Vuna_dLoader_dresolveQualified = fun modules label imports name -> (match v_Vuna_dBase_dsplitLastDot
  (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (let prefix = v_Vuna_dBase_djoinDots revPrefix in
    (match v_Vuna_dLoader_dfindImportPrefix imports prefix with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": module ") in
            (let vuna_cat2' = (prefix) in
              (let vuna_cat3' = (" is not imported") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Vuna_dBase_dJust (m) -> if v_Vuna_dLoader_disGlobalCtor base then C_Vuna_dBase_dOk (base)
      else if v_Vuna_dBase_dmemName base (v_Vuna_dLoader_dexportsOf modules m) then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle
        m base)
      else C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": ") in
            (let vuna_cat2' = (base) in
              (let vuna_cat3' = (" is not exported by ") in
                (let vuna_cat4' = (m) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 167 10 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 164 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveTypeName = fun modules label prefix ownTypes imports name -> if (if ((if ((if
          ((if (bi_eq_str name "Int") then true
              else (bi_eq_str name "String"))) then true
          else (bi_eq_str name "Bool"))) then true
      else (bi_eq_str name "Type"))) then true
  else (bi_eq_str name "->")) then C_Vuna_dBase_dOk (name)
else if v_Vuna_dLoader_disLowerTypeName name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dBase_dcontainsDot name then (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (let typePrefix = v_Vuna_dBase_djoinDots revPrefix in
    (match v_Vuna_dLoader_dfindImportPrefix imports typePrefix with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": module ") in
            (let vuna_cat2' = (typePrefix) in
              (let vuna_cat3' = (" is not imported") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Vuna_dBase_dJust (m) -> if v_Vuna_dBase_dmemName base (v_Vuna_dLoader_dtypeExportsOf modules m)
      then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle m base)
      else C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": type ") in
            (let vuna_cat2' = (base) in
              (let vuna_cat3' = (" is not exported by ") in
                (let vuna_cat4' = (m) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 301 12 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 298 5 ("case pattern match failure"))
else if v_Vuna_dBase_dmemName name ownTypes then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name)

else (match v_Vuna_dLoader_dmodulesExportingType modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": unknown type ") in
        (let vuna_cat2' = (name) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (m) :: ([]) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle m name)
  | ms -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": ambiguous type ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (" (imported from ") in
            (let vuna_cat4' = (v_Vuna_dLoader_djoinNames ms) in
              (let vuna_cat5' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 308 5 ("case pattern match failure"))

let rec v_Vuna_dLoader_dresolveTypeExpr = fun modules label prefix ownTypes imports ty -> (match ty with
  | C_Vuna_dAst_dEVar (name, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeName modules label
    prefix ownTypes imports name) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (n, sp)))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr modules
    label prefix ownTypes imports fn) (fun fn2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveTypeExpr
        modules label prefix ownTypes imports) args) (fun args2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp
        (fn2, args2, sp))))
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": invalid type expression (") in
        (let vuna_cat2' = (v_Vuna_dLoader_dtyShape ty) in
          (let vuna_cat3' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 314 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveCtorSpec = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Vuna_dAst_dCtor (ctor, ty, arity, sp)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolveCtorDecl label prefix ctor) (fun c2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr
    modules label prefix ownTypes imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dCtor (c2, ty2,
        arity, sp))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 325 1 ("no matching clause for Vuna.Loader.resolveCtorSpec")

let rec v_Vuna_dBase_djoinSlashes = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = ("/") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinSlashes rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 152 1 ("no matching clause for Vuna.Base.joinSlashes")

let v_Vuna_dLoader_dmodulePath = fun root name -> (let vuna_cat0' = (root) in
  (let vuna_cat1' = ("/") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinSlashes (v_Vuna_dBase_dsplitOnDot name)) in
      (let vuna_cat3' = (".vuna") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let rec v_Vuna_dLoader_dcollectModuleFiles = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], name, acc) -> v_Vuna_dBase_dreverse acc
  | ((root) :: (rest), name, acc) -> (let path = v_Vuna_dLoader_dmodulePath root name in
  if bi_file_exists path then v_Vuna_dLoader_dcollectModuleFiles rest name ((path) :: (acc))
  else v_Vuna_dLoader_dcollectModuleFiles rest name acc)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 135 1 ("no matching clause for Vuna.Loader.collectModuleFiles")

let v_Vuna_dLoader_dfindModuleFile = fun roots name -> (match v_Vuna_dLoader_dcollectModuleFiles roots
  name [] with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("module ") in
      (let vuna_cat1' = (name) in
        (let vuna_cat2' = (" not found (roots: ") in
          (let vuna_cat3' = (v_Vuna_dLoader_djoinNames roots) in
            (let vuna_cat4' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | (path) :: ([]) -> C_Vuna_dBase_dOk (path)
  | paths -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("ambiguous module ") in
      (let vuna_cat1' = (name) in
        (let vuna_cat2' = (" (found in: ") in
          (let vuna_cat3' = (v_Vuna_dLoader_djoinNames paths) in
            (let vuna_cat4' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 142 3 ("case pattern match failure"))

let rec v_Vuna_dBase_djoinArrows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (" -> ") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinArrows rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 157 1 ("no matching clause for Vuna.Base.joinArrows")

let v_Vuna_dLoader_dshowCycle = fun name stack -> v_Vuna_dBase_djoinArrows (v_Vuna_dBase_dreverse ((name)
    :: (stack)))

let rec v_Vuna_dLoader_dloadAll = fun roots modules stack imports -> (match imports with
  | [] -> C_Vuna_dBase_dOk (modules)
  | (imp) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadModule roots modules stack (v_Vuna_dLoader_dimportName
      imp)) (fun modules2 -> v_Vuna_dLoader_dloadAll roots modules2 stack rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 362 3 ("case pattern match failure"))
and v_Vuna_dLoader_dloadModule = fun roots modules stack name -> (match v_Vuna_dLoader_dfindModule modules
  name with
  | C_Vuna_dBase_dJust (m) -> C_Vuna_dBase_dOk (modules)
  | C_Vuna_dBase_dNothing -> if v_Vuna_dBase_dmemName name stack then C_Vuna_dBase_dErr ((("import cycle: ")
      ^ (v_Vuna_dLoader_dshowCycle name stack)))
  else if v_Vuna_dLoader_dvalidModuleName name then v_Vuna_dBase_dandThen (v_Vuna_dLoader_dfindModuleFile
    roots name) (fun path -> v_Vuna_dBase_dandThen (v_Vuna_dParser_dparseSource path (bi_read_file path))
    (fun p -> (match p with
  | C_Vuna_dBase_dPair (imports, decls) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dvalidateImports name
          imports) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadAll roots modules ((name) ::
              (stack)) imports) (fun modules2 -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dModule (name, imports,
                  decls, v_Vuna_dAst_dtopNames decls)) :: (modules2))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 376 13 ("case pattern match failure"))))
  else C_Vuna_dBase_dErr ((("invalid module name: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 369 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dprefixLen2 = fun a0 a1 -> match (a0, a1) with
  | ([], _) -> 0
  | (_, []) -> 0
  | ((x) :: (xs), (y) :: (ys)) -> if bi_eq_int x y then bi_add 1 (v_Vuna_dBase_dprefixLen2 xs ys)
else 0
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 176 1 ("no matching clause for Vuna.Base.prefixLen2")

let v_Vuna_dBase_dlengthDiffLE = fun la lb n -> if bi_ge_int la lb then bi_le_int (bi_sub la lb) n
else bi_le_int (bi_sub lb la) n

let v_Vuna_dBase_dsimilarName = fun a b -> if bi_eq_str a b then false
else if v_Vuna_dBase_dstartsWith a b then true
else if v_Vuna_dBase_dstartsWith b a then true
else (let la = bi_str_unpack a in
  (let lb = bi_str_unpack b in
    (if (v_Vuna_dBase_dlengthDiffLE (v_Vuna_dBase_dlength la) (v_Vuna_dBase_dlength lb) 2) then (bi_ge_int
        (v_Vuna_dBase_dprefixLen2 la lb) 2)
      else false)))

let rec v_Vuna_dBase_dsuggest = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> ""
  | (name, (c) :: (rest)) -> if v_Vuna_dBase_dsimilarName name c then (let vuna_cat0' = (" (did you mean ")
  in
  (let vuna_cat1' = (c) in
    (let vuna_cat2' = ("?)") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
else v_Vuna_dBase_dsuggest name rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 163 1 ("no matching clause for Vuna.Base.suggest")

let rec v_Vuna_dTypecheck_dinferPatterns = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, [], [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | (globals, locals, (p) :: (pr), (ty) :: (tr), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferPattern
  globals locals st p ty) (fun q -> (match q with
  | C_Vuna_dBase_dPair (locals2, st1) -> v_Vuna_dTypecheck_dinferPatterns globals locals2 pr tr st1
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 455 5 ("case pattern match failure")))
  | (globals, locals, _, _, st) -> C_Vuna_dBase_dErr ("pattern arity mismatch")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 452 1 ("no matching clause for Vuna.Typecheck.inferPatterns")
and v_Vuna_dTypecheck_dinferPattern = fun globals locals st pat expected -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, expected))
      :: (locals), st))
  | C_Vuna_dAst_dPInt (n, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify v_Vuna_dTypecheck_dintTy
    expected st) (fun st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st2)))
  | C_Vuna_dAst_dPStr (s, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify v_Vuna_dTypecheck_dstrTy
    expected st) (fun st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st2)))
  | C_Vuna_dAst_dPCon (name, pats, _) -> (match v_Vuna_dTypecheck_dlookupScheme name globals with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("unknown constructor: ") in
        (let vuna_cat1' = (name) in
          (let vuna_cat2' = (v_Vuna_dBase_dsuggest name (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf globals))
            in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (sch) -> (match v_Vuna_dTypecheck_dinstantiate st sch with
  | C_Vuna_dBase_dPair (ctorTy, st1) -> (let argTys = v_Vuna_dTypecheck_dfunArgs ctorTy in
        if bi_eq_int (v_Vuna_dBase_dlength pats) (v_Vuna_dBase_dlength argTys) then v_Vuna_dBase_dandThen
        (v_Vuna_dTypecheck_dunify (v_Vuna_dTypecheck_dfunResult ctorTy) expected st1) (fun st2 -> v_Vuna_dTypecheck_dinferPatterns
          globals locals pats argTys st2)
        else C_Vuna_dBase_dErr ((let vuna_cat0' = ("constructor ") in
            (let vuna_cat1' = (name) in
              (let vuna_cat2' = (" expects ") in
                (let vuna_cat3' = (bi_str_from_int (v_Vuna_dBase_dlength argTys)) in
                  (let vuna_cat4' = (" arguments") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 469 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 466 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 460 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dinferArgs = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, fnTy, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], C_Vuna_dBase_dPair ([],
      C_Vuna_dBase_dPair (fnTy, st))))
  | (globals, locals, fnTy, (arg) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
  globals locals st arg) (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (argTy, argElab), st1) -> (match v_Vuna_dTypecheck_dfreshTy
      st1 with
  | C_Vuna_dBase_dPair (resTy, st2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify fnTy (C_Vuna_dTypecheck_dTFun
          (argTy, resTy)) st2) (fun st3 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferArgs globals
          locals resTy rest st3) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (argTys, C_Vuna_dBase_dPair (argEls, C_Vuna_dBase_dPair (finalTy, st4))) -> C_Vuna_dBase_dOk
            (C_Vuna_dBase_dPair ((argTy) :: (argTys), C_Vuna_dBase_dPair ((argElab) :: (argEls), C_Vuna_dBase_dPair
                  (finalTy, st4))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 486 17 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 482 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 480 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 477 1 ("no matching clause for Vuna.Typecheck.inferArgs")
and v_Vuna_dTypecheck_dinferBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, locals, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], C_Vuna_dBase_dPair (locals,
      st)))
  | (globals, locals, (C_Vuna_dBase_dPair (pat, value)) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
  globals locals st value) (fun pv -> (match pv with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (valueTy, valueElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferPattern
      globals locals st1 pat valueTy) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferBinds globals
          locals2 rest st2) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (bindEls, C_Vuna_dBase_dPair (locals3, st3)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
              ((C_Vuna_dBase_dPair (pat, valueElab)) :: (bindEls), C_Vuna_dBase_dPair (locals3, st3)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 506 17 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 503 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 500 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 497 1 ("no matching clause for Vuna.Typecheck.inferBinds")
and v_Vuna_dTypecheck_dinferAlts = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, scrutTy, [], st) -> C_Vuna_dBase_dErr ("empty case")
  | (globals, locals, scrutTy, (C_Vuna_dBase_dPair (pat, body)) :: (rest), st) -> v_Vuna_dBase_dandThen
(v_Vuna_dTypecheck_dinferPattern globals locals st pat scrutTy) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals2
      st1 body) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st2) -> (match rest with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (pat, bodyElab)) :: ([]), C_Vuna_dBase_dPair
              (bodyTy, st2)))
  | _ -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferAlts globals locals scrutTy rest st2) (fun pr
            -> (match pr with
  | C_Vuna_dBase_dPair (altsElab, C_Vuna_dBase_dPair (restTy, st3)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
                bodyTy restTy st3) (fun st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair
                      (pat, bodyElab)) :: (altsElab), C_Vuna_dBase_dPair (bodyTy, st4))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 522 21 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 518 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 516 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 513 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 510 1 ("no matching clause for Vuna.Typecheck.inferAlts")
and v_Vuna_dTypecheck_dinferExpr = fun globals locals st expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> (match v_Vuna_dTypecheck_dlookupLocal name locals with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEVar
          (name, sp)), st))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_dlookupScheme name globals with
  | C_Vuna_dBase_dJust (sch) -> (match v_Vuna_dTypecheck_dinstantiate st sch with
  | C_Vuna_dBase_dPair (ty, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEVar
              (name, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 535 15 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("unbound variable: ") in
          (let vuna_cat1' = (name) in
            (let vuna_cat2' = (v_Vuna_dBase_dsuggest name (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf globals))
              in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 533 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 530 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, sp) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dintTy,
        C_Vuna_dTypecheck_dXEInt (n, sp)), st))
  | C_Vuna_dAst_dEStr (s, sp) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dstrTy,
        C_Vuna_dTypecheck_dXEStr (s, sp)), st))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals
    st fn) (fun pf -> (match pf with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (fnTy, fnElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferArgs
        globals locals fnTy args st1) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (argTys, C_Vuna_dBase_dPair (argEls, C_Vuna_dBase_dPair (resTy, st2))) -> C_Vuna_dBase_dOk
          (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (resTy, v_Vuna_dTypecheck_delabAppExpr fn fnElab args
                argTys argEls sp), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 545 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 542 9 ("case pattern match failure")))
  | C_Vuna_dAst_dELam (params, body, sp) -> (match v_Vuna_dTypecheck_dseedLocals params locals st with
  | C_Vuna_dBase_dPair (paramTys, C_Vuna_dBase_dPair (locals2, st1)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
      globals locals2 st1 body) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfoldFun paramTys bodyTy, C_Vuna_dTypecheck_dXELam (params,
                bodyElab, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 552 13 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 549 7 ("case pattern match failure"))
  | C_Vuna_dAst_dELet (binds, body, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferBinds globals
    locals binds st) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (bindEls, C_Vuna_dBase_dPair (locals2, st1)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
        globals locals2 st1 body) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (bodyTy, C_Vuna_dTypecheck_dXELet (bindEls, bodyElab, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 560 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 557 9 ("case pattern match failure")))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals
    locals st scrut) (fun ps -> (match ps with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (scrutTy, scrutElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferAlts
        globals locals scrutTy alts st1) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (altsElab, C_Vuna_dBase_dPair (bodyTy, st2)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (bodyTy, C_Vuna_dTypecheck_dXECase (scrutElab, scrutTy, altsElab, sp)),
              st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 568 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 565 9 ("case pattern match failure")))
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals
    st c) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (condTy, condElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
        condTy v_Vuna_dTypecheck_dboolTy st1) (fun st2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
          globals locals st2 t) (fun pt -> (match pt with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (thenTy, thenElab), st3) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
              globals locals st3 e) (fun pe -> (match pe with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (elseTy, elseElab), st4) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
                  thenTy elseTy st4) (fun st5 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair
                      (thenTy, C_Vuna_dTypecheck_dXEIf (condElab, thenElab, elseElab, sp)), st5)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 580 23 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 577 17 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 573 9 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 528 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dinferClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, st, C_Vuna_dBase_dPair (pats, body)) -> (match v_Vuna_dTypecheck_dseedPatTypes pats st with
  | C_Vuna_dBase_dPair (paramTys, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferPatterns globals
    [] pats paramTys st1) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals2
        st2 body) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st3) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfoldFun paramTys bodyTy, C_Vuna_dBase_dPair (pats,
                  bodyElab)), st3))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 592 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 589 9 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 586 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 585 1 ("no matching clause for Vuna.Typecheck.inferClause")

let rec v_Vuna_dTypecheck_dinferClauses = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, [], st) -> C_Vuna_dBase_dErr ("function has no clauses")
  | (globals, (clause) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferClause globals
  st clause) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, clauseElab), st1) -> (match rest with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((clauseElab) :: ([]), C_Vuna_dBase_dPair (ty, st1)))
  | _ -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferClauses globals rest st1) (fun pr -> (match pr
          with
  | C_Vuna_dBase_dPair (clauseEls, C_Vuna_dBase_dPair (restTy, st2)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
            ty restTy st2) (fun st3 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((clauseElab) :: (clauseEls),
                C_Vuna_dBase_dPair (ty, st3))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 605 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 601 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 599 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 596 1 ("no matching clause for Vuna.Typecheck.inferClauses")

let v_Vuna_dTypecheck_dcheckFunction = fun globals decls sigs name st -> (match v_Vuna_dTypecheck_dlookupScheme
  name globals with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("missing type signature: ") ^ (name)))
  | C_Vuna_dBase_dJust (sch) -> (match v_Vuna_dTypecheck_dinstantiate st sch with
  | C_Vuna_dBase_dPair (expected, st1) -> (match v_Vuna_dTypecheck_dinferClauses globals (v_Vuna_dAst_dclausesFor
        decls name) st1 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dTypecheck_dfunLoc name decls)
          in
          (let vuna_cat1' = ("in ") in
            (let vuna_cat2' = (name) in
              (let vuna_cat3' = (": ") in
                (let vuna_cat4' = (e) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (clauseEls, C_Vuna_dBase_dPair (inferred, st2))) -> (match v_Vuna_dTypecheck_dunify
        inferred expected st2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dTypecheck_dfunLoc name decls)
            in
            (let vuna_cat1' = ("in ") in
              (let vuna_cat2' = (name) in
                (let vuna_cat3' = (": ") in
                  (let vuna_cat4' = (e) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dOk (st3) -> (let elabClauses = v_Vuna_dTypecheck_dlowerClauses (v_Vuna_dTypecheck_dsubstOf
            st3) clauseEls in
          if v_Vuna_dTypecheck_dhasSig name sigs then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elabClauses,
              C_Vuna_dBase_dPair (globals, st3)))
          else (let resolved = v_Vuna_dTypecheck_dresolveTy (v_Vuna_dTypecheck_dsubstOf st3) inferred
            in
            (let scheme = C_Vuna_dTypecheck_dScheme (v_Vuna_dTypecheck_ddiffInts (v_Vuna_dTypecheck_dfreeVarsTy
                  resolved) (v_Vuna_dTypecheck_dfreeVarsEnvExcept name globals), resolved) in
              C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elabClauses, C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dupdateScheme
                    name scheme globals, st3))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 666 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 663 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 661 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 658 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dcheckFunctions = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (globals, decls, sigs, [], st, elabMap) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse
    elabMap, C_Vuna_dBase_dPair (globals, st)))
  | (globals, decls, sigs, (name) :: (rest), st, elabMap) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckFunction
  globals decls sigs name st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (clauseEls, C_Vuna_dBase_dPair (globals2, st1)) -> v_Vuna_dTypecheck_dcheckFunctions
    globals2 decls sigs rest st1 ((C_Vuna_dBase_dPair (name, clauseEls)) :: (elabMap))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 680 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 677 1 ("no matching clause for Vuna.Typecheck.checkFunctions")

let v_Vuna_dTypecheck_dcheckProgramInfoElab = fun decls -> (match v_Vuna_dTypecheck_dcollectData decls
  with
  | C_Vuna_dBase_dPair (typeNames, dataDecls) -> (match v_Vuna_dTypecheck_dcollectSigs typeNames decls
    (C_Vuna_dTypecheck_dTC (0, [])) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (sigs, st1)) -> (match v_Vuna_dTypecheck_dcollectCtors typeNames
      decls st1 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (ctors, st2)) -> (match v_Vuna_dTypecheck_dseedPlaceholders (v_Vuna_dTypecheck_dfunctionNames
          decls) sigs st2 with
  | C_Vuna_dBase_dPair (placeholders, st3) -> (match v_Vuna_dTypecheck_dcheckFunctions (v_Vuna_dBase_dappend
            (v_Vuna_dTypecheck_dbuiltinSchemes ()) (v_Vuna_dBase_dappend ctors (v_Vuna_dBase_dappend sigs
                placeholders))) decls sigs (v_Vuna_dTypecheck_dfunctionNames decls) st3 [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elabMap, C_Vuna_dBase_dPair (globals, st4))) -> C_Vuna_dBase_dOk
          (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfinalizeGlobals (v_Vuna_dTypecheck_dsubstOf st4) globals,
              v_Vuna_dTypecheck_drebuildDecls decls elabMap))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 710 19 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 708 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 705 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 702 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 700 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dcheckProgramInfo = fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab
  decls) (fun p -> C_Vuna_dBase_dOk (v_Vuna_dBase_dfirstOf p))

let v_Vuna_dTypecheck_dcheckProgram = fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfo
  decls) (fun _u -> C_Vuna_dBase_dOk ([]))

let v_Vuna_dTypecheck_dpatternLocals = fun globals locals pat value -> (match v_Vuna_dTypecheck_dinferExpr
  globals locals (C_Vuna_dTypecheck_dTC (0, [])) value with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, _), _)) -> v_Vuna_dTypecheck_dpatVarsTy
  pat ty
  | C_Vuna_dBase_dErr (_) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 776 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dletLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, locals, []) -> []
  | (globals, locals, (C_Vuna_dBase_dPair (pat, value)) :: (rest)) -> (let patTys = v_Vuna_dTypecheck_dpatternLocals
  globals locals pat value in
  v_Vuna_dBase_dappend patTys (v_Vuna_dTypecheck_dletLocals globals locals rest))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 770 1 ("no matching clause for Vuna.Typecheck.letLocals")

let v_Vuna_dTypecheck_dcaseWarnings = fun globals decls locals scrut alts sp -> (match v_Vuna_dTypecheck_dinferExpr
  globals locals (C_Vuna_dTypecheck_dTC (0, [])) scrut with
  | C_Vuna_dBase_dErr (_) -> []
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, _), _)) -> (let ctors = v_Vuna_dTypecheck_dtyCtorNames
    decls ty in
    if bi_eq ctors [] then []
    else (let pats = v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf alts in
      (let exhaustive = (if (v_Vuna_dTypecheck_dhasCatchAll pats) then true
          else (v_Vuna_dTypecheck_dallCtorsCovered pats ctors)) in
        (let nonEx = if exhaustive then []
          else (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": non-exhaustive case"))) :: ([]) in
          v_Vuna_dBase_dappend nonEx (v_Vuna_dTypecheck_dredundantWarnings pats)))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 794 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dexprWarnings = fun globals decls locals e -> (match e with
  | C_Vuna_dAst_dEVar (n, sp) -> []
  | C_Vuna_dAst_dEInt (n, sp) -> []
  | C_Vuna_dAst_dEStr (s, sp) -> []
  | C_Vuna_dAst_dELam (ps, body, sp) -> (match v_Vuna_dTypecheck_dinferExpr globals locals (C_Vuna_dTypecheck_dTC
      (0, [])) e with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, _), _)) -> (let pty = v_Vuna_dTypecheck_dflattenFun
      ty in
      v_Vuna_dTypecheck_dexprWarnings globals decls (v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dzipLocals
          ps pty) locals) body)
  | C_Vuna_dBase_dErr (_) -> v_Vuna_dTypecheck_dexprWarnings globals decls locals body
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 753 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dexprWarnings globals
    decls locals) ((fn) :: (args))
  | C_Vuna_dAst_dELet (binds, body, sp) -> (let locals2 = v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dletLocals
      globals locals binds) locals in
    v_Vuna_dBase_dappend (v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dbindWarnings globals decls) binds)
    (v_Vuna_dTypecheck_dexprWarnings globals decls locals2 body))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dcaseWarnings globals
    decls locals scrut alts sp) (v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dexprWarnings globals decls locals
      scrut) (v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_daltWarnings globals decls locals) alts))
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dexprWarnings globals
    decls locals) ((c) :: ((t) :: ((e) :: ([]))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 748 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_daltWarnings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, decls, locals, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dTypecheck_dexprWarnings globals
decls locals body
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 767 1 ("no matching clause for Vuna.Typecheck.altWarnings")

let v_Vuna_dTypecheck_dclauseBodyWarnings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, decls, paramTys, C_Vuna_dBase_dPair (pats, body)) -> (let locals = v_Vuna_dTypecheck_dzipLocals
  (v_Vuna_dTypecheck_dpatsVarNames pats) paramTys in
  v_Vuna_dTypecheck_dexprWarnings globals decls locals body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 743 1 ("no matching clause for Vuna.Typecheck.clauseBodyWarnings")

let v_Vuna_dTypecheck_dfunWarnings = fun globals decls name -> (match v_Vuna_dTypecheck_dlookupScheme
  name globals with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (sch) -> (let clauses = v_Vuna_dAst_dclausesFor decls name in
    (let paramTys = v_Vuna_dTypecheck_dflattenFun (v_Vuna_dTypecheck_dschemeTy sch) in
      (let bodyWarn = v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dclauseBodyWarnings globals decls paramTys)
        clauses in
        v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dfunCoverageWarnings decls paramTys clauses) bodyWarn)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 735 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dprogramWarnings = fun globals decls -> v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dfunWarnings
  globals decls) (v_Vuna_dTypecheck_dfunctionNames decls)

let v_Vuna_dTypecheck_dexhaustiveWarnings = fun decls -> (match v_Vuna_dTypecheck_dcheckProgramInfo decls
  with
  | C_Vuna_dBase_dOk (globals) -> v_Vuna_dTypecheck_dprogramWarnings globals decls
  | C_Vuna_dBase_dErr (_) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 727 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveGlobal = fun modules label prefix own imports scope name -> if v_Vuna_dBase_dmemName
name scope then C_Vuna_dBase_dOk (name)
else if v_Vuna_dLoader_disGlobalCtor name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dBase_dcontainsDot name then v_Vuna_dLoader_dresolveQualified modules label imports name

else if v_Vuna_dBase_dmemName name own then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name)
else if v_Vuna_dLoader_disBuiltinName name then C_Vuna_dBase_dOk (name)
else (match v_Vuna_dLoader_dmodulesExporting modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": unbound variable ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (v_Vuna_dBase_dsuggest name (v_Vuna_dBase_dappend own scope)) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | (m) :: ([]) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle m name)
  | ms -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": ambiguous name ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (" (imported from ") in
            (let vuna_cat4' = (v_Vuna_dLoader_djoinNames ms) in
              (let vuna_cat5' = ("); qualify it") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 181 5 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveCtor = fun modules label prefix ownCtors imports name -> if v_Vuna_dLoader_disGlobalCtor
name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dBase_dcontainsDot name then v_Vuna_dLoader_dresolveQualified modules label imports name

else if v_Vuna_dBase_dmemName name ownCtors then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name)

else (match v_Vuna_dLoader_dmodulesExportingCtor modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": unknown constructor ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (v_Vuna_dBase_dsuggest name ownCtors) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | (m) :: ([]) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle m name)
  | ms -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": ambiguous constructor ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (" (imported from ") in
            (let vuna_cat4' = (v_Vuna_dLoader_djoinNames ms) in
              (let vuna_cat5' = ("); qualify it") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 191 5 ("case pattern match failure"))

let rec v_Vuna_dLoader_dresolvePattern = fun modules label prefix ownCtors imports pat -> (match pat with
  | C_Vuna_dAst_dPWild (sp) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild (sp), []))
  | C_Vuna_dAst_dPVar (name, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcheckBinder label name) (fun
    _u -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name, sp), (name) :: ([]))))
  | C_Vuna_dAst_dPInt (n, sp) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPInt (n, sp), []))
  | C_Vuna_dAst_dPStr (s, sp) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPStr (s, sp), []))
  | C_Vuna_dAst_dPCon (name, pats, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveCtor modules label
    prefix ownCtors imports name) (fun name2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolvePattern
        modules label prefix ownCtors imports) pats) (fun parts -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dAst_dPCon (name2, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf parts, sp), v_Vuna_dBase_dconcatMap
          v_Vuna_dBase_dsecondOf parts))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 208 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dresolveAlt = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6,
  a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label
      prefix own ownCtors imports (v_Vuna_dBase_dappend bound scope) body) (fun body2 -> C_Vuna_dBase_dOk
      (C_Vuna_dBase_dPair (pat2, body2)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 222 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 220 1 ("no matching clause for Vuna.Loader.resolveAlt")
and v_Vuna_dLoader_dresolveLet = fun modules label prefix own ownCtors imports scope binds body -> (match
  binds with
  | [] -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix own ownCtors imports
    scope body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], b)))
  | (C_Vuna_dBase_dPair (pat, value)) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
    modules label prefix own ownCtors imports scope value) (fun value2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolvePattern
      modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveLet modules label
          prefix own ownCtors imports (v_Vuna_dBase_dappend bound scope) rest body) (fun r -> (match r
            with
  | C_Vuna_dBase_dPair (binds2, body2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (pat2,
                    value2)) :: (binds2), body2))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 238 17 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 235 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 228 3 ("case pattern match failure"))
and v_Vuna_dLoader_dresolveExpr = fun modules label prefix own ownCtors imports scope expr -> (match expr
  with
  | C_Vuna_dAst_dEVar (name, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveGlobal modules label
    prefix own imports scope name) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (n, sp)))
  | C_Vuna_dAst_dEInt (n, sp) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEInt (n, sp))
  | C_Vuna_dAst_dEStr (s, sp) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEStr (s, sp))
  | C_Vuna_dAst_dELam (params, body, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dcheckBinder
      label) params) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix
      own ownCtors imports (v_Vuna_dBase_dappend params scope) body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELam
        (params, b, sp))))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label
    prefix own ownCtors imports scope fn) (fun fn2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (fun
        a -> v_Vuna_dLoader_dresolveExpr modules label prefix own ownCtors imports scope a) args) (fun
      args2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp (fn2, args2, sp))))
  | C_Vuna_dAst_dELet (binds, body, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveLet modules label
    prefix own ownCtors imports scope binds body) (fun r -> (match r with
  | C_Vuna_dBase_dPair (binds2, body2) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELet (binds2, body2, sp))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 259 9 ("case pattern match failure")))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules
    label prefix own ownCtors imports scope scrut) (fun scrut2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
      (v_Vuna_dLoader_dresolveAlt modules label prefix own ownCtors imports scope) alts) (fun alts2 ->
      C_Vuna_dBase_dOk (C_Vuna_dAst_dECase (scrut2, alts2, sp))))
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label
    prefix own ownCtors imports scope c) (fun c2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
      modules label prefix own ownCtors imports scope t) (fun t2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
        modules label prefix own ownCtors imports scope e) (fun e2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEIf
          (c2, t2, e2, sp)))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 243 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveDecl = fun modules label prefix own ownCtors ownTypes imports d -> (match d
  with
  | C_Vuna_dAst_dDData (dname, params, ctors, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeTopName
    label prefix dname) (fun dn -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveCtorSpec
        modules label prefix ownTypes imports) ctors) (fun ctors2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDData
        (dn, params, ctors2, sp))))
  | C_Vuna_dAst_dDSig (name, ty, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTopName label prefix
    name) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr modules label prefix ownTypes
      imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDSig (n, ty2, sp))))
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTopName
    label prefix name) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolvePattern
        modules label prefix ownCtors imports) pats) (fun parts -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
        modules label prefix own ownCtors imports (v_Vuna_dBase_dconcatMap v_Vuna_dBase_dsecondOf parts)
        body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDFun (n, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
            parts, b, sp)))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 331 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveProgram = fun modules label prefix own ownCtors ownTypes imports decls -> v_Vuna_dBase_dtraverse
(v_Vuna_dLoader_dresolveDecl modules label prefix own ownCtors ownTypes imports) decls

let v_Vuna_dLoader_dresolveEntry = fun modules imports decls -> v_Vuna_dLoader_dresolveProgram modules
"<entry>" "" (v_Vuna_dAst_dtopNames decls) (v_Vuna_dAst_dctorsOf decls) (v_Vuna_dAst_dtypeNamesOf decls)
imports decls

let rec v_Vuna_dLoader_dresolveModules = fun modules -> (match modules with
  | [] -> C_Vuna_dBase_dOk ([])
  | (C_Vuna_dLoader_dModule (name, imports, decls, exports)) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveProgram
    modules name name exports (v_Vuna_dAst_dctorsOf decls) (v_Vuna_dAst_dtypeNamesOf decls) imports decls)
  (fun d1 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveModules rest) (fun d2 -> C_Vuna_dBase_dOk (v_Vuna_dBase_dappend
        d1 d2)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 353 3 ("case pattern match failure"))

let v_Vuna_dLoader_dloadProgram = fun roots entry -> if bi_file_exists entry then v_Vuna_dBase_dandThen
(v_Vuna_dParser_dparseSource entry (bi_read_file entry)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (imports, decls) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dvalidateImports "<entry>"
      imports) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadAll roots [] [] imports) (fun modules
        -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveEntry modules imports decls) (fun entryDecls
          -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveModules modules) (fun moduleDecls -> C_Vuna_dBase_dOk
            (v_Vuna_dBase_dappend entryDecls moduleDecls)))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 386 7 ("case pattern match failure")))
else C_Vuna_dBase_dErr ((("entry file not found: ") ^ (entry)))

let v_Vuna_dInterp_dinterpretFile = fun roots entry -> (match v_Vuna_dLoader_dloadProgram roots entry
  with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (decls) -> v_Vuna_dEval_drunDecls decls
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 23 3 ("case pattern match failure"))

let v_interpEmit = fun roots path -> (let output = v_Vuna_dInterp_dinterpretFile roots path in
  (let _ = bi_print (((output) ^ ("\n"))) in
    if v_Vuna_dBase_dstartsWith "error:" output then 2
    else 0))

let rec v_interpParse = fun roots args -> (match args with
  | ("--root") :: ((dir) :: (rest)) -> v_interpParse (v_Vuna_dBase_dappend roots ((dir) :: ([]))) rest
  | (path) :: ([]) -> v_interpEmit (v_Vuna_dInterp_deffectiveRoots roots) path
  | _ -> v_usageError ()
  | _ -> vuna_fail "app/Main.vuna" 61 3 ("case pattern match failure"))

let v_interpArgs = fun args -> v_interpParse [] args

let v_Vuna_dInterp_dcompileFile = fun roots entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  roots entry) (fun decls -> (match decls with
  | ds -> v_Vuna_dCodegen_dgenerateProgram ds printResult
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 29 5 ("case pattern match failure")))

let v_Vuna_dInterp_dcompileFileChecked = fun roots entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  roots entry) (fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgram decls) (fun _u ->
    v_Vuna_dCodegen_dgenerateProgram decls printResult))

let v_Vuna_dInterp_dcompileFileTyped = fun roots entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  roots entry) (fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun
    p -> (match p with
  | C_Vuna_dBase_dPair (globals, elabDecls) -> v_Vuna_dTypedCodegen_dgenerateProgramTyped elabDecls globals
      printResult
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 38 7 ("case pattern match failure"))))

let v_compileEmit = fun printResult typeCheck typed roots entry rest -> (let actualRoots = v_Vuna_dInterp_deffectiveRoots
  roots in
  (let result = if typed then v_Vuna_dInterp_dcompileFileTyped actualRoots entry printResult
    else if typeCheck then v_Vuna_dInterp_dcompileFileChecked actualRoots entry printResult
    else v_Vuna_dInterp_dcompileFile actualRoots entry printResult in
    (match result with
  | C_Vuna_dBase_dOk (code) -> (match rest with
  | (out) :: ([]) -> (let _ = bi_write_file out code in
          0)
  | _ -> (let _ = bi_print code in
          0)
  | _ -> vuna_fail "app/Main.vuna" 53 12 ("case pattern match failure"))
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in
            (let vuna_cat1' = (e) in
              (let vuna_cat2' = ("\n") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in
        1)
  | _ -> vuna_fail "app/Main.vuna" 51 8 ("case pattern match failure"))))

let rec v_compileParse = fun printResult typeCheck typed roots args -> (match args with
  | [] -> v_usageError ()
  | (arg) :: (rest) -> (match arg with
  | "--no-print" -> v_compileParse false typeCheck typed roots rest
  | "--no-typecheck" -> v_compileParse printResult false false roots rest
  | "--typecheck" -> v_compileParse printResult true typed roots rest
  | "--typed" -> v_compileParse true true true roots rest
  | "--root" -> (match rest with
  | (dir) :: (rest2) -> v_compileParse printResult typeCheck typed (v_Vuna_dBase_dappend roots ((dir)
          :: ([]))) rest2
  | [] -> v_usageError ()
  | _ -> vuna_fail "app/Main.vuna" 40 11 ("case pattern match failure"))
  | _ -> v_compileEmit printResult typeCheck typed roots arg rest
  | _ -> vuna_fail "app/Main.vuna" 34 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Main.vuna" 31 3 ("case pattern match failure"))

let v_compileArgs = fun args -> v_compileParse true true true [] args

let v_Vuna_dInterp_dcheckFile = fun roots entry -> (match v_Vuna_dLoader_dloadProgram roots entry with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (decls) -> (match v_Vuna_dTypecheck_dcheckProgramInfo decls with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (_) -> C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dexhaustiveWarnings decls)
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 46 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 43 3 ("case pattern match failure"))

let v_checkEmit = fun roots path -> (match v_Vuna_dInterp_dcheckFile roots path with
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in
        (let vuna_cat1' = (e) in
          (let vuna_cat2' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in
    1)
  | C_Vuna_dBase_dOk (warnings) -> (let _ = v_printWarnings warnings in
    0)
  | _ -> vuna_fail "app/Main.vuna" 80 3 ("case pattern match failure"))

let rec v_checkParse = fun roots args -> (match args with
  | ("--root") :: ((dir) :: (rest)) -> v_checkParse (v_Vuna_dBase_dappend roots ((dir) :: ([]))) rest
  | (path) :: ([]) -> v_checkEmit (v_Vuna_dInterp_deffectiveRoots roots) path
  | _ -> v_usageError ()
  | _ -> vuna_fail "app/Main.vuna" 74 3 ("case pattern match failure"))

let v_checkArgs = fun args -> v_checkParse [] args

let v_dispatch = fun args -> (match args with
  | [] -> v_usageError ()
  | (arg) :: (rest) -> (match arg with
  | "compile" -> v_compileArgs rest
  | "check" -> v_checkArgs rest
  | "lint" -> v_Lint_drunLint rest
  | "interp" -> v_interpArgs rest
  | "help" -> v_help ()
  | "--help" -> v_help ()
  | _ -> v_compileArgs args
  | _ -> vuna_fail "app/Main.vuna" 15 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Main.vuna" 12 3 ("case pattern match failure"))

let v_main = fun () -> bi_exit (v_dispatch (bi_get_args ()))
let () = ignore (v_main ())
