
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
let bi_show_string s = show_vstring s
let bi_eq_generic (a : 'a) (b : 'a) = a = b
let bi_neq_generic (a : 'a) (b : 'a) = a <> b
let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0
let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0
let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0
let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0
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
    C_Vuna_dTypecheck_dScheme of ((int) list) * (((string, t_Vuna_dTypecheck_dTy) t_Vuna_dBase_dPair)
  list) * (t_Vuna_dTypecheck_dTy)
and   t_Vuna_dTypecheck_dRecordInfo =
    C_Vuna_dTypecheck_dRecordInfo of (string) * ((string) list) * (((string, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair)
  list) * ((string) list)
and   t_Vuna_dTypecheck_dRecConstraint =
    C_Vuna_dTypecheck_dFieldCon of (t_Vuna_dTypecheck_dTy) * (string) * (t_Vuna_dTypecheck_dTy) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dUpdateCon of (t_Vuna_dTypecheck_dTy) * (string) * (t_Vuna_dTypecheck_dTy) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dTypecheck_dTC =
    C_Vuna_dTypecheck_dTC of (int) * (((int, t_Vuna_dTypecheck_dTy) t_Vuna_dBase_dPair) list) * ((string)
  list) * ((t_Vuna_dTypecheck_dRecordInfo) list) * ((t_Vuna_dTypecheck_dRecConstraint) list) * ((t_Vuna_dTypecheck_dTraitMethodRef)
  list) * (t_Vuna_dTypecheck_dTraitCtx)
and   t_Vuna_dTypecheck_dEExpr =
    C_Vuna_dTypecheck_dXEVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEStr of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXELam of ((string) list) * (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEApp of (t_Vuna_dTypecheck_dEExpr) * ((t_Vuna_dTypecheck_dEExpr) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXELet of (((t_Vuna_dAst_dPat, t_Vuna_dTypecheck_dEExpr) t_Vuna_dBase_dPair) list)
* (t_Vuna_dTypecheck_dEExpr) * (bool) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXECase of (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dTy) * (((t_Vuna_dAst_dPat,
      t_Vuna_dTypecheck_dEExpr) t_Vuna_dBase_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEIf of (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dEExpr)
* (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEField of (t_Vuna_dTypecheck_dEExpr) * (string) * (t_Vuna_dTypecheck_dTy) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXERecUpdate of (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dTy) * (((string,
      t_Vuna_dTypecheck_dEExpr) t_Vuna_dBase_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEFun of (string) * (((string, t_Vuna_dTypecheck_dTy) t_Vuna_dBase_dPair) list)
* (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEMethod of (string) * (string) * (t_Vuna_dTypecheck_dTy) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dTypecheck_dXEMethodInst of (string) * (string) * (string) * (t_Vuna_dTypecheck_dTy) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dTypecheck_dDictParam =
    C_Vuna_dTypecheck_dDictParam of (string) * (int) * (string) * (string)
and   t_Vuna_dTypecheck_dTraitMethodInfo =
    C_Vuna_dTypecheck_dTraitMethodInfo of (string) * (t_Vuna_dTypecheck_dScheme) * (t_Vuna_dAst_dExpr)
and   t_Vuna_dTypecheck_dTraitDecl =
    C_Vuna_dTypecheck_dTraitDecl of (string) * (string) * ((t_Vuna_dTypecheck_dTraitMethodInfo) list)
and   t_Vuna_dTypecheck_dTraitMethodRef =
    C_Vuna_dTypecheck_dTraitMethodRef of (string) * (string) * (t_Vuna_dTypecheck_dScheme) * (int)
and   t_Vuna_dTypecheck_dTraitInst =
    C_Vuna_dTypecheck_dTraitInst of (string) * ((string) t_Vuna_dBase_dMaybe) * (t_Vuna_dTypecheck_dTy)
* (((string, string) t_Vuna_dBase_dPair) list)
and   t_Vuna_dTypecheck_dTraitCtx =
    C_Vuna_dTypecheck_dTraitCtx of ((t_Vuna_dTypecheck_dTraitDecl) list) * ((t_Vuna_dTypecheck_dTraitInst)
  list) * ((string) list) * ((string) list) * ((t_Vuna_dTypecheck_dTraitMethodRef) list)
and   t_Vuna_dTypecheck_dDataShape =
    C_Vuna_dTypecheck_dDataShape of (string) * ((string) list) * (((string, (t_Vuna_dAst_dExpr) list)
    t_Vuna_dBase_dPair) list)
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
    C_Vuna_dLoader_dModule of (string) * ((t_Vuna_dAst_dImport) list) * ((t_Vuna_dAst_dDecl) list) * ((t_Vuna_dLoader_dExportEntry)
  list)
and   t_Vuna_dLoader_dExportEntry =
    C_Vuna_dLoader_dExportEntry of (string) * (string) * (string) * (string)
and   t_Vuna_dLoader_dExportRef =
    C_Vuna_dLoader_dExportRef of (string) * (string) * (string)
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
and   t_Vuna_dAst_dField =
    C_Vuna_dAst_dField of (string) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dPat =
    C_Vuna_dAst_dPVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPWild of (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPCon of (string) * ((t_Vuna_dAst_dPat) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPStr of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPRecord of (string) * (((string, t_Vuna_dAst_dPat) t_Vuna_dBase_dPair) list) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dExpr =
    C_Vuna_dAst_dEVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEStr of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dELam of ((string) list) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEApp of (t_Vuna_dAst_dExpr) * ((t_Vuna_dAst_dExpr) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dELet of (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair) list) * (t_Vuna_dAst_dExpr)
* (bool) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dECase of (t_Vuna_dAst_dExpr) * (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair)
  list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEIf of (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEField of (t_Vuna_dAst_dExpr) * (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dERecord of (string) * (((string, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dERecUpdate of (t_Vuna_dAst_dExpr) * (((string, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair)
  list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEInstSel of (t_Vuna_dAst_dExpr) * (string) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dCtor =
    C_Vuna_dAst_dCtor of (string) * (t_Vuna_dAst_dExpr) * (int) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dDecl =
    C_Vuna_dAst_dDData of (string) * ((string) list) * ((t_Vuna_dAst_dCtor) list) * ((string) list) *
(t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDSig of (string) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDFun of (string) * ((t_Vuna_dAst_dPat) list) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDRecord of (string) * ((string) list) * ((t_Vuna_dAst_dField) list) * ((string) list)
* (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDTrait of (string) * ((string) list) * (((string, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair)
  list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDInstance of ((string) t_Vuna_dBase_dMaybe) * (bool) * (t_Vuna_dAst_dExpr) * ((t_Vuna_dAst_dDecl)
  list) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dExportItem =
    C_Vuna_dAst_dXBare of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dXTypeAll of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dXModule of (string) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dModDecl =
    C_Vuna_dAst_dModDecl of (string) * (bool) * ((t_Vuna_dAst_dExportItem) list) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dSourceFile =
    C_Vuna_dAst_dSource of ((t_Vuna_dAst_dModDecl) t_Vuna_dBase_dMaybe) * ((t_Vuna_dAst_dImport) list)
* ((t_Vuna_dAst_dDecl) list)
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
  | C_Vuna_dTypecheck_dScheme (f0, f1, f2) -> show_ctor "Scheme" [((fun v -> let rec go = function []
    -> "Nil" | x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in
    go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair
        show_vstring show_Vuna_dTypecheck_dTy)) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dTypecheck_dTy) f2]
and show_Vuna_dTypecheck_dRecordInfo v =
  match v with
  | C_Vuna_dTypecheck_dRecordInfo (f0, f1, f2, f3) -> show_ctor "RecordInfo" [(show_vstring) f0; ((fun
    v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")"
    in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair
        show_vstring show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in
    go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x
    ^ " " ^ go xs ^ ")" in
    go v)) f3]
and show_Vuna_dTypecheck_dRecConstraint v =
  match v with
  | C_Vuna_dTypecheck_dFieldCon (f0, f1, f2, f3) -> show_ctor "FieldCon" [(show_Vuna_dTypecheck_dTy) f0;
(show_vstring) f1; (show_Vuna_dTypecheck_dTy) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dUpdateCon (f0, f1, f2, f3) -> show_ctor "UpdateCon" [(show_Vuna_dTypecheck_dTy)
f0; (show_vstring) f1; (show_Vuna_dTypecheck_dTy) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dTypecheck_dTC v =
  match v with
  | C_Vuna_dTypecheck_dTC (f0, f1, f2, f3, f4, f5, f6) -> show_ctor "TC" [(string_of_int) f0; ((fun v
    -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair string_of_int
        show_Vuna_dTypecheck_dTy)) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x
    ^ " " ^ go xs ^ ")" in
    go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dRecordInfo)
    x ^ " " ^ go xs ^ ")" in
    go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dRecConstraint)
    x ^ " " ^ go xs ^ ")" in
    go v)) f4; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dTraitMethodRef)
    x ^ " " ^ go xs ^ ")" in
    go v)) f5; (show_Vuna_dTypecheck_dTraitCtx) f6]
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
  | C_Vuna_dTypecheck_dXELet (f0, f1, f2, f3) -> show_ctor "XELet" [((fun v -> let rec go = function []
    -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dTypecheck_dEExpr))
    x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dTypecheck_dEExpr) f1; (show_vbool) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXECase (f0, f1, f2, f3) -> show_ctor "XECase" [(show_Vuna_dTypecheck_dEExpr) f0;
(show_Vuna_dTypecheck_dTy) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair
        show_Vuna_dAst_dPat show_Vuna_dTypecheck_dEExpr)) x ^ " " ^ go xs ^ ")" in
    go v)) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXEIf (f0, f1, f2, f3) -> show_ctor "XEIf" [(show_Vuna_dTypecheck_dEExpr) f0; (show_Vuna_dTypecheck_dEExpr)
f1; (show_Vuna_dTypecheck_dEExpr) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXEField (f0, f1, f2, f3) -> show_ctor "XEField" [(show_Vuna_dTypecheck_dEExpr)
f0; (show_vstring) f1; (show_Vuna_dTypecheck_dTy) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXERecUpdate (f0, f1, f2, f3) -> show_ctor "XERecUpdate" [(show_Vuna_dTypecheck_dEExpr)
f0; (show_Vuna_dTypecheck_dTy) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons "
    ^ ((show_Vuna_dBase_dPair show_vstring show_Vuna_dTypecheck_dEExpr)) x ^ " " ^ go xs ^ ")" in
    go v)) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXEFun (f0, f1, f2) -> show_ctor "XEFun" [(show_vstring) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_vstring show_Vuna_dTypecheck_dTy))
    x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dTypecheck_dXEMethod (f0, f1, f2, f3) -> show_ctor "XEMethod" [(show_vstring) f0; (show_vstring)
f1; (show_Vuna_dTypecheck_dTy) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dTypecheck_dXEMethodInst (f0, f1, f2, f3, f4) -> show_ctor "XEMethodInst" [(show_vstring) f0;
(show_vstring) f1; (show_vstring) f2; (show_Vuna_dTypecheck_dTy) f3; (show_Vuna_dBase_dSpan) f4]
and show_Vuna_dTypecheck_dDictParam v =
  match v with
  | C_Vuna_dTypecheck_dDictParam (f0, f1, f2, f3) -> show_ctor "DictParam" [(show_vstring) f0; (string_of_int)
f1; (show_vstring) f2; (show_vstring) f3]
and show_Vuna_dTypecheck_dTraitMethodInfo v =
  match v with
  | C_Vuna_dTypecheck_dTraitMethodInfo (f0, f1, f2) -> show_ctor "TraitMethodInfo" [(show_vstring) f0;
(show_Vuna_dTypecheck_dScheme) f1; (show_Vuna_dAst_dExpr) f2]
and show_Vuna_dTypecheck_dTraitDecl v =
  match v with
  | C_Vuna_dTypecheck_dTraitDecl (f0, f1, f2) -> show_ctor "TraitDecl" [(show_vstring) f0; (show_vstring)
f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dTraitMethodInfo)
    x ^ " " ^ go xs ^ ")" in
    go v)) f2]
and show_Vuna_dTypecheck_dTraitMethodRef v =
  match v with
  | C_Vuna_dTypecheck_dTraitMethodRef (f0, f1, f2, f3) -> show_ctor "TraitMethodRef" [(show_vstring) f0;
(show_vstring) f1; (show_Vuna_dTypecheck_dScheme) f2; (string_of_int) f3]
and show_Vuna_dTypecheck_dTraitInst v =
  match v with
  | C_Vuna_dTypecheck_dTraitInst (f0, f1, f2, f3) -> show_ctor "TraitInst" [(show_vstring) f0; ((show_Vuna_dBase_dMaybe
    show_vstring)) f1; (show_Vuna_dTypecheck_dTy) f2; ((fun v -> let rec go = function [] -> "Nil" | x
    :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in
    go v)) f3]
and show_Vuna_dTypecheck_dTraitCtx v =
  match v with
  | C_Vuna_dTypecheck_dTraitCtx (f0, f1, f2, f3, f4) -> show_ctor "TraitCtx" [((fun v -> let rec go =
    function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dTraitDecl) x ^ " " ^ go xs ^ ")"
    in
    go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dTraitInst)
    x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x
    ^ " " ^ go xs ^ ")" in
    go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x
    ^ " " ^ go xs ^ ")" in
    go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dTraitMethodRef)
    x ^ " " ^ go xs ^ ")" in
    go v)) f4]
and show_Vuna_dTypecheck_dDataShape v =
  match v with
  | C_Vuna_dTypecheck_dDataShape (f0, f1, f2) -> show_ctor "DataShape" [(show_vstring) f0; ((fun v ->
    let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair
        show_vstring (fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dExpr)
          x ^ " " ^ go xs ^ ")" in
          go v))) x ^ " " ^ go xs ^ ")" in
    go v)) f2]
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
    go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dLoader_dExportEntry)
    x ^ " " ^ go xs ^ ")" in
    go v)) f3]
and show_Vuna_dLoader_dExportEntry v =
  match v with
  | C_Vuna_dLoader_dExportEntry (f0, f1, f2, f3) -> show_ctor "ExportEntry" [(show_vstring) f0; (show_vstring)
f1; (show_vstring) f2; (show_vstring) f3]
and show_Vuna_dLoader_dExportRef v =
  match v with
  | C_Vuna_dLoader_dExportRef (f0, f1, f2) -> show_ctor "ExportRef" [(show_vstring) f0; (show_vstring)
f1; (show_vstring) f2]
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
and show_Vuna_dAst_dField v =
  match v with
  | C_Vuna_dAst_dField (f0, f1, f2) -> show_ctor "Field" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1;
(show_Vuna_dBase_dSpan) f2]
and show_Vuna_dAst_dPat v =
  match v with
  | C_Vuna_dAst_dPVar (f0, f1) -> show_ctor "PVar" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPWild f0 -> show_ctor "PWild" [(show_Vuna_dBase_dSpan) f0]
  | C_Vuna_dAst_dPCon (f0, f1, f2) -> show_ctor "PCon" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dPInt (f0, f1) -> show_ctor "PInt" [(string_of_int) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPStr (f0, f1) -> show_ctor "PStr" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPRecord (f0, f1, f2) -> show_ctor "PRecord" [(show_vstring) f0; ((fun v -> let rec go
    = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_vstring show_Vuna_dAst_dPat))
    x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
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
  | C_Vuna_dAst_dELet (f0, f1, f2, f3) -> show_ctor "ELet" [((fun v -> let rec go = function [] -> "Nil"
    | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr)) x ^ " "
    ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dAst_dExpr) f1; (show_vbool) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dECase (f0, f1, f2) -> show_ctor "ECase" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr))
    x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEIf (f0, f1, f2, f3) -> show_ctor "EIf" [(show_Vuna_dAst_dExpr) f0; (show_Vuna_dAst_dExpr)
f1; (show_Vuna_dAst_dExpr) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dEField (f0, f1, f2) -> show_ctor "EField" [(show_Vuna_dAst_dExpr) f0; (show_vstring)
f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dERecord (f0, f1, f2) -> show_ctor "ERecord" [(show_vstring) f0; ((fun v -> let rec go
    = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_vstring show_Vuna_dAst_dExpr))
    x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dERecUpdate (f0, f1, f2) -> show_ctor "ERecUpdate" [(show_Vuna_dAst_dExpr) f0; ((fun v
    -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_vstring
        show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEInstSel (f0, f1, f2) -> show_ctor "EInstSel" [(show_Vuna_dAst_dExpr) f0; (show_vstring)
f1; (show_Vuna_dBase_dSpan) f2]
and show_Vuna_dAst_dCtor v =
  match v with
  | C_Vuna_dAst_dCtor (f0, f1, f2, f3) -> show_ctor "Ctor" [(show_vstring) f0; (show_Vuna_dAst_dExpr)
f1; (string_of_int) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dAst_dDecl v =
  match v with
  | C_Vuna_dAst_dDData (f0, f1, f2, f3, f4) -> show_ctor "DData" [(show_vstring) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dCtor)
    x ^ " " ^ go xs ^ ")" in
    go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x
    ^ " " ^ go xs ^ ")" in
    go v)) f3; (show_Vuna_dBase_dSpan) f4]
  | C_Vuna_dAst_dDSig (f0, f1, f2) -> show_ctor "DSig" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1;
(show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dDFun (f0, f1, f2, f3) -> show_ctor "DFun" [(show_vstring) f0; ((fun v -> let rec go =
    function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dAst_dExpr) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dDRecord (f0, f1, f2, f3, f4) -> show_ctor "DRecord" [(show_vstring) f0; ((fun v -> let
    rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dField)
    x ^ " " ^ go xs ^ ")" in
    go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x
    ^ " " ^ go xs ^ ")" in
    go v)) f3; (show_Vuna_dBase_dSpan) f4]
  | C_Vuna_dAst_dDTrait (f0, f1, f2, f3) -> show_ctor "DTrait" [(show_vstring) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair
        show_vstring show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in
    go v)) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dDInstance (f0, f1, f2, f3, f4) -> show_ctor "DInstance" [((show_Vuna_dBase_dMaybe show_vstring))
f0; (show_vbool) f1; (show_Vuna_dAst_dExpr) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs
    -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in
    go v)) f3; (show_Vuna_dBase_dSpan) f4]
and show_Vuna_dAst_dExportItem v =
  match v with
  | C_Vuna_dAst_dXBare (f0, f1) -> show_ctor "XBare" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dXTypeAll (f0, f1) -> show_ctor "XTypeAll" [(show_vstring) f0; (show_Vuna_dBase_dSpan)
f1]
  | C_Vuna_dAst_dXModule (f0, f1) -> show_ctor "XModule" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
and show_Vuna_dAst_dModDecl v =
  match v with
  | C_Vuna_dAst_dModDecl (f0, f1, f2, f3) -> show_ctor "ModDecl" [(show_vstring) f0; (show_vbool) f1;
((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dExportItem) x ^
    " " ^ go xs ^ ")" in
    go v)) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dAst_dSourceFile v =
  match v with
  | C_Vuna_dAst_dSource (f0, f1, f2) -> show_ctor "Source" [((show_Vuna_dBase_dMaybe show_Vuna_dAst_dModDecl))
f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dImport) x ^
    " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl)
    x ^ " " ^ go xs ^ ")" in
    go v)) f2]
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
  | _ -> vuna_fail "app/Lint.vuna" 27 1 ("no matching clause for Lint.editStart")

let v_Lint_deditEnd = fun a0 -> match a0 with
  | (C_Lint_dEdit (start, stop, lines)) -> stop
  | _ -> vuna_fail "app/Lint.vuna" 29 1 ("no matching clause for Lint.editEnd")

let v_Lint_deditLines = fun a0 -> match a0 with
  | (C_Lint_dEdit (start, stop, lines)) -> lines
  | _ -> vuna_fail "app/Lint.vuna" 31 1 ("no matching clause for Lint.editLines")

let v_Lint_dfindingLine = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> line
  | _ -> vuna_fail "app/Lint.vuna" 33 1 ("no matching clause for Lint.findingLine")

let v_Lint_dfindingCol = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> col
  | _ -> vuna_fail "app/Lint.vuna" 35 1 ("no matching clause for Lint.findingCol")

let v_Lint_dfindingRule = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> rule
  | _ -> vuna_fail "app/Lint.vuna" 37 1 ("no matching clause for Lint.findingRule")

let v_Lint_dfindingMessage = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> message
  | _ -> vuna_fail "app/Lint.vuna" 39 1 ("no matching clause for Lint.findingMessage")

let v_Lint_dfindingEdit = fun a0 -> match a0 with
  | (C_Lint_dFinding (line, col, rule, message, edit)) -> edit
  | _ -> vuna_fail "app/Lint.vuna" 41 1 ("no matching clause for Lint.findingEdit")

let v_Lint_dlitText = fun a0 -> match a0 with
  | (C_Lint_dLitBranch (text, expr)) -> text
  | _ -> vuna_fail "app/Lint.vuna" 43 1 ("no matching clause for Lint.litText")

let v_Lint_dlitExpr = fun a0 -> match a0 with
  | (C_Lint_dLitBranch (text, expr)) -> expr
  | _ -> vuna_fail "app/Lint.vuna" 45 1 ("no matching clause for Lint.litExpr")

let v_Lint_dheadName = fun a0 -> match a0 with
  | (C_Lint_dIfHead (name, text, expr)) -> name
  | _ -> vuna_fail "app/Lint.vuna" 47 1 ("no matching clause for Lint.headName")

let v_Lint_dheadText = fun a0 -> match a0 with
  | (C_Lint_dIfHead (name, text, expr)) -> text
  | _ -> vuna_fail "app/Lint.vuna" 49 1 ("no matching clause for Lint.headText")

let v_Lint_dheadExpr = fun a0 -> match a0 with
  | (C_Lint_dIfHead (name, text, expr)) -> expr
  | _ -> vuna_fail "app/Lint.vuna" 51 1 ("no matching clause for Lint.headExpr")

let v_Lint_denclosingLine = fun a0 -> match a0 with
  | (C_Lint_dEnclosing (line, toks, kind)) -> line
  | _ -> vuna_fail "app/Lint.vuna" 53 1 ("no matching clause for Lint.enclosingLine")

let v_Lint_denclosingToks = fun a0 -> match a0 with
  | (C_Lint_dEnclosing (line, toks, kind)) -> toks
  | _ -> vuna_fail "app/Lint.vuna" 55 1 ("no matching clause for Lint.enclosingToks")

let v_Lint_denclosingKind = fun a0 -> match a0 with
  | (C_Lint_dEnclosing (line, toks, kind)) -> kind
  | _ -> vuna_fail "app/Lint.vuna" 57 1 ("no matching clause for Lint.enclosingKind")

let v_Lint_dcaseBodyEnd = fun a0 -> match a0 with
  | (C_Lint_dCaseBody (stop, lines)) -> stop
  | _ -> vuna_fail "app/Lint.vuna" 59 1 ("no matching clause for Lint.caseBodyEnd")

let v_Lint_dcaseBodyLines = fun a0 -> match a0 with
  | (C_Lint_dCaseBody (stop, lines)) -> lines
  | _ -> vuna_fail "app/Lint.vuna" 61 1 ("no matching clause for Lint.caseBodyLines")

let v_Lint_disNilList = fun a0 -> match a0 with
  | ([]) -> true
  | ((x) :: (rest)) -> false
  | _ -> vuna_fail "app/Lint.vuna" 63 1 ("no matching clause for Lint.isNilList")

let v_Lint_dnotBool = fun b -> if b then false
else true

let rec v_Lint_djoinLines = fun a0 -> match a0 with
  | ([]) -> ""
  | ((line) :: (rest)) -> (let vuna_cat0' = (line) in
  (let vuna_cat1' = ("\n") in
    (let vuna_cat2' = (v_Lint_djoinLines rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "app/Lint.vuna" 97 1 ("no matching clause for Lint.joinLines")

let v_Lint_dposLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (line, col)) -> line
  | _ -> vuna_fail "app/Lint.vuna" 183 1 ("no matching clause for Lint.posLine")

let v_Lint_dposCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (line, col)) -> col
  | _ -> vuna_fail "app/Lint.vuna" 185 1 ("no matching clause for Lint.posCol")

let v_Lint_dtokPos = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> p
  | _ -> vuna_fail "app/Lint.vuna" 187 1 ("no matching clause for Lint.tokPos")

let v_Lint_dtokLine = fun tok -> v_Lint_dposLine (v_Lint_dtokPos tok)

let v_Lint_dtokCol = fun tok -> v_Lint_dposCol (v_Lint_dtokPos tok)

let v_Lint_dtokIdentOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> C_Vuna_dBase_dJust (x)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 204 3 ("case pattern match failure"))

let v_Lint_dtokStrOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> C_Vuna_dBase_dJust (x)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 209 3 ("case pattern match failure"))

let v_Lint_dtokIntOf = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> C_Vuna_dBase_dJust (x)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 214 3 ("case pattern match failure"))

let v_Lint_dheadToken = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dNothing
  | ((t) :: (rest)) -> C_Vuna_dBase_dJust (t)
  | _ -> vuna_fail "app/Lint.vuna" 218 1 ("no matching clause for Lint.headToken")

let rec v_Lint_dlastToken = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dNothing
  | ((t) :: ([])) -> C_Vuna_dBase_dJust (t)
  | ((t) :: (rest)) -> v_Lint_dlastToken rest
  | _ -> vuna_fail "app/Lint.vuna" 222 1 ("no matching clause for Lint.lastToken")

let v_Lint_dtailOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((t) :: (rest)) -> rest
  | _ -> vuna_fail "app/Lint.vuna" 244 1 ("no matching clause for Lint.tailOf")

let rec v_Lint_dnoKeyword = fun a0 -> match a0 with
  | ([]) -> true
  | ((t) :: (rest)) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> false
  | _ -> v_Lint_dnoKeyword rest
  | _ -> vuna_fail "app/Lint.vuna" 292 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 289 1 ("no matching clause for Lint.noKeyword")

let v_Lint_dtokenText = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> bi_str_from_int x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> x
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> ""
  | _ -> vuna_fail "app/Lint.vuna" 492 3 ("case pattern match failure"))

let v_Lint_dtailTokenCol = fun tok -> bi_add (v_Lint_dtokCol tok) (bi_str_length (v_Lint_dtokenText tok))

let v_Lint_dheadOfTokens = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, C_Vuna_dBase_dPos (1, 1))
  | ((t) :: (rest)) -> t
  | _ -> vuna_fail "app/Lint.vuna" 579 1 ("no matching clause for Lint.headOfTokens")

let rec v_Lint_dcollectEdits = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((f) :: (rest), acc) -> (match v_Lint_dfindingEdit f with
  | C_Vuna_dBase_dNothing -> v_Lint_dcollectEdits rest acc
  | C_Vuna_dBase_dJust (e) -> v_Lint_dcollectEdits rest ((e) :: (acc))
  | _ -> vuna_fail "app/Lint.vuna" 702 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 699 1 ("no matching clause for Lint.collectEdits")

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
  | _ -> vuna_fail "app/Lint.vuna" 752 1 ("no matching clause for Lint.printFindings")

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
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 25 1 ("no matching clause for Vuna.Interp.effectiveRoots")

let rec v_Vuna_dInterp_dpatsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((p) :: (rest)) -> if v_Vuna_dInterp_dpatNeedsElab p then true
else v_Vuna_dInterp_dpatsNeedElab rest
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 47 1 ("no matching clause for Vuna.Interp.patsNeedElab")
and v_Vuna_dInterp_dpatNeedsElab = fun p -> (match p with
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> true
  | C_Vuna_dAst_dPCon (name, pats, sp) -> v_Vuna_dInterp_dpatsNeedElab pats
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 52 3 ("case pattern match failure"))

let rec v_Vuna_dInterp_dargsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((e) :: (rest)) -> if v_Vuna_dInterp_dexprNeedsElab e then true
else v_Vuna_dInterp_dargsNeedElab rest
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 57 1 ("no matching clause for Vuna.Interp.argsNeedElab")
and v_Vuna_dInterp_dbindsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((C_Vuna_dBase_dPair (pat, value)) :: (rest)) -> if v_Vuna_dInterp_dpatNeedsElab pat then true
else if v_Vuna_dInterp_dexprNeedsElab value then true
else v_Vuna_dInterp_dbindsNeedElab rest
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 61 1 ("no matching clause for Vuna.Interp.bindsNeedElab")
and v_Vuna_dInterp_daltsNeedElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((C_Vuna_dBase_dPair (pat, body)) :: (rest)) -> if v_Vuna_dInterp_dpatNeedsElab pat then true
else if v_Vuna_dInterp_dexprNeedsElab body then true
else v_Vuna_dInterp_daltsNeedElab rest
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 68 1 ("no matching clause for Vuna.Interp.altsNeedElab")
and v_Vuna_dInterp_dexprNeedsElab = fun e -> (match e with
  | C_Vuna_dAst_dEField (base, fname, sp) -> true
  | C_Vuna_dAst_dERecord (name, fields, sp) -> true
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> true
  | C_Vuna_dAst_dEInstSel (meth, iname, sp) -> true
  | C_Vuna_dAst_dEVar (name, sp) -> false
  | C_Vuna_dAst_dEInt (n, sp) -> false
  | C_Vuna_dAst_dEStr (s, sp) -> false
  | C_Vuna_dAst_dELam (ps, body, sp) -> v_Vuna_dInterp_dexprNeedsElab body
  | C_Vuna_dAst_dEApp (fn, args, sp) -> if v_Vuna_dInterp_dexprNeedsElab fn then true
  else v_Vuna_dInterp_dargsNeedElab args
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> if v_Vuna_dInterp_dbindsNeedElab binds then true
  else v_Vuna_dInterp_dexprNeedsElab body
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> if v_Vuna_dInterp_dexprNeedsElab scrut then true
  else v_Vuna_dInterp_daltsNeedElab alts
  | C_Vuna_dAst_dEIf (c, t, el, sp) -> if v_Vuna_dInterp_dexprNeedsElab c then true
  else if v_Vuna_dInterp_dexprNeedsElab t then true
  else v_Vuna_dInterp_dexprNeedsElab el
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 76 3 ("case pattern match failure"))

let rec v_Vuna_dInterp_dprogramNeedsElab = fun a0 -> match a0 with
  | ([]) -> false
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> true
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> true
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> true
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> (match derivings with
  | [] -> v_Vuna_dInterp_dprogramNeedsElab rest
  | _ -> true
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 38 7 ("case pattern match failure"))
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> if v_Vuna_dInterp_dpatsNeedElab pats then true
  else if v_Vuna_dInterp_dexprNeedsElab body then true
  else v_Vuna_dInterp_dprogramNeedsElab rest
  | C_Vuna_dAst_dDSig (name, ty, sp) -> v_Vuna_dInterp_dprogramNeedsElab rest
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 33 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 30 1 ("no matching clause for Vuna.Interp.programNeedsElab")

let rec v_Vuna_dTypedCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 11 1 ("no matching clause for Vuna.TypedCodegen.joinWith")

let v_Vuna_dTypedCodegen_dparamVar = fun i -> (("'p") ^ (bi_str_from_int i))

let v_Vuna_dTypedCodegen_dshowParamVar = fun i -> (("s") ^ (bi_str_from_int i))

let rec v_Vuna_dTypedCodegen_dparamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, v_Vuna_dTypedCodegen_dparamVar i)) :: (v_Vuna_dTypedCodegen_dparamMapAt
  rest (bi_add i 1))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 35 1 ("no matching clause for Vuna.TypedCodegen.paramMapAt")

let v_Vuna_dTypedCodegen_dparamMap = fun params -> v_Vuna_dTypedCodegen_dparamMapAt params 0

let rec v_Vuna_dTypedCodegen_dshowParamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, v_Vuna_dTypedCodegen_dshowParamVar i)) :: (v_Vuna_dTypedCodegen_dshowParamMapAt
  rest (bi_add i 1))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 40 1 ("no matching clause for Vuna.TypedCodegen.showParamMapAt")

let v_Vuna_dTypedCodegen_dshowParamMap = fun params -> v_Vuna_dTypedCodegen_dshowParamMapAt params 0

let rec v_Vuna_dTypedCodegen_ddataDecls = fun decls -> (match decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _, _) -> (d) :: (v_Vuna_dTypedCodegen_ddataDecls rest)
  | _ -> v_Vuna_dTypedCodegen_ddataDecls rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 53 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 50 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 118 1 ("no matching clause for Vuna.TypedCodegen.appType")

let rec v_Vuna_dTypedCodegen_dsplitArrows = fun expr -> (match expr with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (a) :: (v_Vuna_dTypedCodegen_dsplitArrows
    b)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 123 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dparamVarsAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (v_Vuna_dTypedCodegen_dparamVar i) :: (v_Vuna_dTypedCodegen_dparamVarsAt rest
  (bi_add i 1))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 141 1 ("no matching clause for Vuna.TypedCodegen.paramVarsAt")

let v_Vuna_dTypedCodegen_dparamVars = fun params -> v_Vuna_dTypedCodegen_dparamVarsAt params 0

let v_Vuna_dTypedCodegen_ddataPrefix = fun params -> (match params with
  | [] -> ""
  | (p) :: ([]) -> ((v_Vuna_dTypedCodegen_dparamVar 0) ^ (" "))
  | _ -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " (v_Vuna_dTypedCodegen_dparamVars params))
      in
      (let vuna_cat2' = (") ") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 136 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dpairSecond = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (_, v)) -> v
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 248 1 ("no matching clause for Vuna.TypedCodegen.pairSecond")

let v_Vuna_dTypedCodegen_dnoLocSpan = C_Vuna_dBase_dSpan ("", 0, 0, 0, 0)

let rec v_Vuna_dTypedCodegen_dfoldStringLiterals = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dAst_dEStr (s, _)) :: (rest)) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals rest with
  | (C_Vuna_dAst_dEStr (s2, _)) :: (rest2) -> (C_Vuna_dAst_dEStr (((s) ^ (s2)), v_Vuna_dTypedCodegen_dnoLocSpan))
  :: (rest2)
  | folded -> (C_Vuna_dAst_dEStr (s, v_Vuna_dTypedCodegen_dnoLocSpan)) :: (folded)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 339 3 ("case pattern match failure"))
  | ((e) :: (rest)) -> (e) :: (v_Vuna_dTypedCodegen_dfoldStringLiterals rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 337 1 ("no matching clause for Vuna.TypedCodegen.foldStringLiterals")

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 400 1 ("no matching clause for Vuna.TypedCodegen.wrapConcatBindings")

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
  | ("bi_show_string") -> C_Vuna_dBase_dJust ("bi_show_string")
  | ("bi_eq_generic") -> C_Vuna_dBase_dJust ("bi_eq_generic")
  | ("bi_neq_generic") -> C_Vuna_dBase_dJust ("bi_neq_generic")
  | ("bi_lt_generic") -> C_Vuna_dBase_dJust ("bi_lt_generic")
  | ("bi_le_generic") -> C_Vuna_dBase_dJust ("bi_le_generic")
  | ("bi_gt_generic") -> C_Vuna_dBase_dJust ("bi_gt_generic")
  | ("bi_ge_generic") -> C_Vuna_dBase_dJust ("bi_ge_generic")
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 415 1 ("no matching clause for Vuna.TypedCodegen.builtinName")

let rec v_Vuna_dTypedCodegen_drecBindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name, _), _)) :: (rest)) -> (name) :: (v_Vuna_dTypedCodegen_drecBindNames
  rest)
  | ((C_Vuna_dBase_dPair (_, _)) :: (_)) -> []
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 567 1 ("no matching clause for Vuna.TypedCodegen.recBindNames")

let v_Vuna_dTypedCodegen_disIrrefutable = fun p -> (match p with
  | C_Vuna_dAst_dPVar (_, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 594 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disVarPattern = fun p -> (match p with
  | C_Vuna_dAst_dPVar (_, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 600 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dallVarPatterns = fun a0 -> match a0 with
  | ([]) -> true
  | ((p) :: (rest)) -> (if (v_Vuna_dTypedCodegen_disVarPattern p) then (v_Vuna_dTypedCodegen_dallVarPatterns
    rest)
  else false)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 605 1 ("no matching clause for Vuna.TypedCodegen.allVarPatterns")

let v_Vuna_dTypedCodegen_ddeclFunName = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> name
  | _ -> ""
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 652 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfilterNames = fun pred names -> (match names with
  | [] -> []
  | (n) :: (rest) -> if pred n then (n) :: (v_Vuna_dTypedCodegen_dfilterNames pred rest)
  else v_Vuna_dTypedCodegen_dfilterNames pred rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 664 3 ("case pattern match failure"))

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
")) :: ((C_Vuna_dBase_dPair ("bi_show_string", "let bi_show_string s = show_vstring s\n")) :: ((C_Vuna_dBase_dPair
                        ("bi_eq_generic", "let bi_eq_generic (a : 'a) (b : 'a) = a = b\n")) :: ((C_Vuna_dBase_dPair
                        ("bi_neq_generic", "let bi_neq_generic (a : 'a) (b : 'a) = a <> b\n")) :: ((C_Vuna_dBase_dPair
                        ("bi_lt_generic", "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_le_generic", "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_gt_generic", "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n"))
                        :: ((C_Vuna_dBase_dPair ("bi_ge_generic", "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n"))
                        :: ((C_Vuna_dBase_dPair ("show_vlist", "let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =
  match v with
  | [] -> \"Nil\"
  | x :: xs -> \"(Cons \" ^ show_elem x ^ \" \" ^ show_vlist show_elem xs ^ \")\"
")) :: ([])))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dTypedCodegen_dchunkNameOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (n, c)) -> n
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 918 1 ("no matching clause for Vuna.TypedCodegen.chunkNameOf")

let v_Vuna_dTypedCodegen_dchunkTextOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (n, c)) -> c
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 920 1 ("no matching clause for Vuna.TypedCodegen.chunkTextOf")

let rec v_Vuna_dTypedCodegen_dfilterNames2 = fun pred names all -> (match all with
  | [] -> []
  | (ch) :: (rest) -> if pred (v_Vuna_dTypedCodegen_dchunkNameOf ch) then (ch) :: (v_Vuna_dTypedCodegen_dfilterNames2
    pred names rest)
  else v_Vuna_dTypedCodegen_dfilterNames2 pred names rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 939 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dmkScheme = fun qs ty -> C_Vuna_dTypecheck_dScheme (qs, [], ty)

let v_Vuna_dTypecheck_deeSpan = fun e -> (match e with
  | C_Vuna_dTypecheck_dXEVar (n, sp) -> sp
  | C_Vuna_dTypecheck_dXEInt (n, sp) -> sp
  | C_Vuna_dTypecheck_dXEStr (s, sp) -> sp
  | C_Vuna_dTypecheck_dXELam (ps, b, sp) -> sp
  | C_Vuna_dTypecheck_dXEApp (f, a, sp) -> sp
  | C_Vuna_dTypecheck_dXELet (bs, b, _, sp) -> sp
  | C_Vuna_dTypecheck_dXECase (s, ty, a, sp) -> sp
  | C_Vuna_dTypecheck_dXEIf (c, t, e, sp) -> sp
  | C_Vuna_dTypecheck_dXEField (b, f, ty, sp) -> sp
  | C_Vuna_dTypecheck_dXERecUpdate (b, ty, fs, sp) -> sp
  | C_Vuna_dTypecheck_dXEFun (name, cons, sp) -> sp
  | C_Vuna_dTypecheck_dXEMethod (tr, meth, ty, sp) -> sp
  | C_Vuna_dTypecheck_dXEMethodInst (tr, meth, inst, ty, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 55 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 111 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dshowTyArgs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((ty) :: ([])) -> v_Vuna_dTypecheck_dshowTy ty
  | ((ty) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dTypecheck_dshowTy ty) in
  (let vuna_cat1' = (" ") in
    (let vuna_cat2' = (v_Vuna_dTypecheck_dshowTyArgs rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 117 1 ("no matching clause for Vuna.Typecheck.showTyArgs")

let v_Vuna_dTypecheck_dnextVar = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Vuna_dBase_dPair (n,
  C_Vuna_dTypecheck_dTC (bi_add n 1, s, typeNames, records, cons, methods, tctx))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 122 1 ("no matching clause for Vuna.Typecheck.nextVar")

let v_Vuna_dTypecheck_dfreshTy = fun st -> (match v_Vuna_dTypecheck_dnextVar st with
  | C_Vuna_dBase_dPair (n, st2) -> C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTVar (n), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 126 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dbindVar = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, ty, C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Vuna_dBase_dOk
(C_Vuna_dTypecheck_dTC (n, (C_Vuna_dBase_dPair (i, ty)) :: (s), typeNames, records, cons, methods, tctx))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 130 1 ("no matching clause for Vuna.Typecheck.bindVar")

let rec v_Vuna_dTypecheck_dinstantiateVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((q) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st2) -> (match v_Vuna_dTypecheck_dinstantiateVars rest st2 with
  | C_Vuna_dBase_dPair (mapping, st3) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (q, ty)) :: (mapping),
      st3)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 175 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 173 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 171 1 ("no matching clause for Vuna.Typecheck.instantiateVars")

let rec v_Vuna_dTypecheck_dvarIds = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: (v_Vuna_dTypecheck_dvarIds rest)
  | _ -> v_Vuna_dTypecheck_dvarIds rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 279 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 277 1 ("no matching clause for Vuna.Typecheck.varIds")

let rec v_Vuna_dTypecheck_dseedVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedVars rest st1 with
  | C_Vuna_dBase_dPair (vars, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, ty)) :: (vars), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 292 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 290 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 288 1 ("no matching clause for Vuna.Typecheck.seedVars")

let rec v_Vuna_dTypecheck_ddeclDataNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _, _) -> (name) :: (v_Vuna_dTypecheck_ddeclDataNames rest)
  | _ -> v_Vuna_dTypecheck_ddeclDataNames rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 309 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 307 1 ("no matching clause for Vuna.Typecheck.declDataNames")

let v_Vuna_dTypecheck_dintTy = C_Vuna_dTypecheck_dTCon ("Int", [])

let v_Vuna_dTypecheck_dstrTy = C_Vuna_dTypecheck_dTCon ("String", [])

let v_Vuna_dTypecheck_dboolTy = C_Vuna_dTypecheck_dTCon ("Bool", [])

let v_Vuna_dTypecheck_dlistOf = fun ty -> C_Vuna_dTypecheck_dTCon ("List", (ty) :: ([]))

let v_Vuna_dTypecheck_dfun2 = fun a b c -> C_Vuna_dTypecheck_dTFun (a, C_Vuna_dTypecheck_dTFun (b, c))

let v_Vuna_dTypecheck_dbuiltinSchemes = fun () -> (C_Vuna_dBase_dPair ("True", v_Vuna_dTypecheck_dmkScheme
    [] v_Vuna_dTypecheck_dboolTy)) :: ((C_Vuna_dBase_dPair ("False", v_Vuna_dTypecheck_dmkScheme [] v_Vuna_dTypecheck_dboolTy))
  :: ((C_Vuna_dBase_dPair ("Nil", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTCon ("List",
            (C_Vuna_dTypecheck_dTVar (0)) :: ([]))))) :: ((C_Vuna_dBase_dPair ("Cons", v_Vuna_dTypecheck_dmkScheme
          ((0) :: ([])) (v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTCon
              ("List", (C_Vuna_dTypecheck_dTVar (0)) :: ([]))) (C_Vuna_dTypecheck_dTCon ("List", (C_Vuna_dTypecheck_dTVar
                  (0)) :: ([])))))) :: ((C_Vuna_dBase_dPair ("+", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
              v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy))) :: ((C_Vuna_dBase_dPair
            ("-", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy
                v_Vuna_dTypecheck_dintTy))) :: ((C_Vuna_dBase_dPair ("*", v_Vuna_dTypecheck_dmkScheme
                [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy)))
            :: ((C_Vuna_dBase_dPair ("/", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy
                    v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy))) :: ((C_Vuna_dBase_dPair ("bi_eq_int",
                    v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy
                      v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("bi_neq_int", v_Vuna_dTypecheck_dmkScheme
                      [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy)))
                  :: ((C_Vuna_dBase_dPair ("bi_lt_int", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy)))
                    :: ((C_Vuna_dBase_dPair ("bi_le_int", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy)))
                      :: ((C_Vuna_dBase_dPair ("bi_gt_int", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy)))
                        :: ((C_Vuna_dBase_dPair ("bi_ge_int", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dintTy v_Vuna_dTypecheck_dboolTy)))
                        :: ((C_Vuna_dBase_dPair ("bi_eq_str", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dboolTy)))
                        :: ((C_Vuna_dBase_dPair ("bi_neq_str", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dboolTy)))
                        :: ((C_Vuna_dBase_dPair ("bi_eq_bool", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy)))
                        :: ((C_Vuna_dBase_dPair ("bi_neq_bool", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dfun2
                        v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy)))
                        :: ((C_Vuna_dBase_dPair ("bi_show_string", v_Vuna_dTypecheck_dmkScheme [] (C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dstrTy)))) :: ((C_Vuna_dBase_dPair
                        ("bi_eq_generic", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dTypecheck_dfun2
                        (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar (0)) v_Vuna_dTypecheck_dboolTy)))
                        :: ((C_Vuna_dBase_dPair ("bi_neq_generic", v_Vuna_dTypecheck_dmkScheme ((0) ::
                        ([])) (v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar
                        (0)) v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("bi_lt_generic", v_Vuna_dTypecheck_dmkScheme
                        ((0) :: ([])) (v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar
                        (0)) v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("bi_le_generic", v_Vuna_dTypecheck_dmkScheme
                        ((0) :: ([])) (v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar
                        (0)) v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("bi_gt_generic", v_Vuna_dTypecheck_dmkScheme
                        ((0) :: ([])) (v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar
                        (0)) v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("bi_ge_generic", v_Vuna_dTypecheck_dmkScheme
                        ((0) :: ([])) (v_Vuna_dTypecheck_dfun2 (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar
                        (0)) v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("&&", v_Vuna_dTypecheck_dmkScheme
                        [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy
                        v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("||", v_Vuna_dTypecheck_dmkScheme
                        [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dboolTy v_Vuna_dTypecheck_dboolTy
                        v_Vuna_dTypecheck_dboolTy))) :: ((C_Vuna_dBase_dPair ("++", v_Vuna_dTypecheck_dmkScheme
                        [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dstrTy
                        v_Vuna_dTypecheck_dstrTy))) :: ((C_Vuna_dBase_dPair ("strLength", v_Vuna_dTypecheck_dmkScheme
                        [] (C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dintTy))))
                        :: ((C_Vuna_dBase_dPair ("strUnpack", v_Vuna_dTypecheck_dmkScheme [] (C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dlistOf v_Vuna_dTypecheck_dintTy))))
                        :: ((C_Vuna_dBase_dPair ("strPack", v_Vuna_dTypecheck_dmkScheme [] (C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dlistOf v_Vuna_dTypecheck_dintTy, v_Vuna_dTypecheck_dstrTy))))
                        :: ((C_Vuna_dBase_dPair ("strFromInt", v_Vuna_dTypecheck_dmkScheme [] (C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dintTy, v_Vuna_dTypecheck_dstrTy)))) :: ((C_Vuna_dBase_dPair
                        ("readFile", v_Vuna_dTypecheck_dmkScheme [] (C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy,
                        v_Vuna_dTypecheck_dstrTy)))) :: ((C_Vuna_dBase_dPair ("writeFile", v_Vuna_dTypecheck_dmkScheme
                        [] (v_Vuna_dTypecheck_dfun2 v_Vuna_dTypecheck_dstrTy v_Vuna_dTypecheck_dstrTy
                        v_Vuna_dTypecheck_dintTy))) :: ((C_Vuna_dBase_dPair ("print", v_Vuna_dTypecheck_dmkScheme
                        [] (C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dintTy))))
                        :: ((C_Vuna_dBase_dPair ("getArgs", v_Vuna_dTypecheck_dmkScheme [] (v_Vuna_dTypecheck_dlistOf
                        v_Vuna_dTypecheck_dstrTy))) :: ((C_Vuna_dBase_dPair ("fileExists", v_Vuna_dTypecheck_dmkScheme
                        [] (C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy, v_Vuna_dTypecheck_dboolTy))))
                        :: ((C_Vuna_dBase_dPair ("exit", v_Vuna_dTypecheck_dmkScheme [] (C_Vuna_dTypecheck_dTFun
                        (v_Vuna_dTypecheck_dintTy, v_Vuna_dTypecheck_dintTy)))) :: ([]))))))))))))))))))))))))))))))))))))))

let v_Vuna_dTypecheck_delabAppExpr = fun fn fnElab args argTys argEls sp -> C_Vuna_dTypecheck_dXEApp (fnElab,
  argEls, sp)

let v_Vuna_dTypecheck_dnoInstanceMsg = fun tctx tr ty -> (let vuna_cat0' = ("no instance ") in
  (let vuna_cat1' = (tr) in
    (let vuna_cat2' = (" ") in
      (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy ty) in
        (let vuna_cat4' = (" (M10.5 \233\157\153\230\128\129\230\180\190\229\143\145\239\188\154\232\176\131\231\148\168\231\130\185\231\177\187\229\158\139\229\191\133\233\161\187\231\161\174\229\174\154)")
          in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))

let v_Vuna_dTypecheck_dordGenericName = fun key -> (match key with
  | "lt" -> "vuna_lt_generic"
  | "le" -> "vuna_le_generic"
  | "gt" -> "vuna_gt_generic"
  | _ -> "vuna_ge_generic"
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 462 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dordFallback = fun tctx ty key -> (match ty with
  | C_Vuna_dTypecheck_dTCon ("Int", []) -> (match key with
  | "lt" -> C_Vuna_dBase_dOk ("vuna_lt_int")
  | "le" -> C_Vuna_dBase_dOk ("vuna_le_int")
  | "gt" -> C_Vuna_dBase_dOk ("vuna_gt_int")
  | _ -> C_Vuna_dBase_dOk ("vuna_ge_int")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 452 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon ("String", []) -> C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dordGenericName key)
  | C_Vuna_dTypecheck_dTCon ("Bool", []) -> C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dordGenericName key)
  | _ -> C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dnoInstanceMsg tctx "Ord" ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 450 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_ddictParamTrait = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dDictParam (tr, vid, key, name)) -> tr
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 517 1 ("no matching clause for Vuna.Typecheck.dictParamTrait")

let v_Vuna_dTypecheck_ddictParamVar = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dDictParam (tr, vid, key, name)) -> vid
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 519 1 ("no matching clause for Vuna.Typecheck.dictParamVar")

let v_Vuna_dTypecheck_ddictParamKey = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dDictParam (tr, vid, key, name)) -> key
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 521 1 ("no matching clause for Vuna.Typecheck.dictParamKey")

let v_Vuna_dTypecheck_ddictParamName = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dDictParam (tr, vid, key, name)) -> name
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 523 1 ("no matching clause for Vuna.Typecheck.dictParamName")

let rec v_Vuna_dTypecheck_drecFieldCount = fun a0 -> match a0 with
  | ([]) -> 0
  | ((C_Vuna_dBase_dPair (n, t)) :: (rest)) -> bi_add 1 (v_Vuna_dTypecheck_drecFieldCount rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 751 1 ("no matching clause for Vuna.Typecheck.recFieldCount")

let v_Vuna_dTypecheck_drecordsOf = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> records
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 866 1 ("no matching clause for Vuna.Typecheck.recordsOf")

let v_Vuna_dTypecheck_dtraitMethodsOf = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> methods
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 868 1 ("no matching clause for Vuna.Typecheck.traitMethodsOf")

let v_Vuna_dTypecheck_dtraitCtxOf = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> tctx
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 870 1 ("no matching clause for Vuna.Typecheck.traitCtxOf")

let v_Vuna_dTypecheck_dtypeNamesOfTC = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> typeNames
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 872 1 ("no matching clause for Vuna.Typecheck.typeNamesOfTC")

let v_Vuna_dTypecheck_dconstraintsOfTC = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> cons
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 874 1 ("no matching clause for Vuna.Typecheck.constraintsOfTC")

let v_Vuna_dTypecheck_daddRecConstraint = fun a0 a1 -> match (a0, a1) with
  | (c, C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Vuna_dTypecheck_dTC
(n, s, typeNames, records, (c) :: (cons), methods, tctx)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 876 1 ("no matching clause for Vuna.Typecheck.addRecConstraint")

let v_Vuna_dTypecheck_dclearRecConstraints = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Vuna_dTypecheck_dTC (n,
  s, typeNames, records, [], methods, tctx)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 878 1 ("no matching clause for Vuna.Typecheck.clearRecConstraints")

let rec v_Vuna_dTypecheck_dzipParamTys = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> []
  | ((p) :: (ps), (t) :: (ts)) -> (C_Vuna_dBase_dPair (p, t)) :: (v_Vuna_dTypecheck_dzipParamTys ps ts)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 886 1 ("no matching clause for Vuna.Typecheck.zipParamTys")

let rec v_Vuna_dTypecheck_dfreshParamTys = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((p) :: (ps), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dfreshParamTys ps st1 with
  | C_Vuna_dBase_dPair (tys, st2) -> C_Vuna_dBase_dPair ((ty) :: (tys), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 895 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 893 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 890 1 ("no matching clause for Vuna.Typecheck.freshParamTys")

let rec v_Vuna_dTypecheck_dfieldNamesOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (n, t)) :: (rest)) -> (n) :: (v_Vuna_dTypecheck_dfieldNamesOf rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 898 1 ("no matching clause for Vuna.Typecheck.fieldNamesOf")

let v_Vuna_dTypecheck_drecordFieldPair = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (fname, ty, sp)) -> C_Vuna_dBase_dPair (fname, ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 958 1 ("no matching clause for Vuna.Typecheck.recordFieldPair")

let rec v_Vuna_dTypecheck_drecordParamNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> (p) :: (v_Vuna_dTypecheck_drecordParamNames rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 960 1 ("no matching clause for Vuna.Typecheck.recordParamNames")

let rec v_Vuna_dTypecheck_dfunArgs = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> (a) :: (v_Vuna_dTypecheck_dfunArgs b)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1105 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfunResult = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dTypecheck_dfunResult b
  | _ -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1110 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfoldFun = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((a) :: (rest), body) -> C_Vuna_dTypecheck_dTFun (a, v_Vuna_dTypecheck_dfoldFun rest body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1114 1 ("no matching clause for Vuna.Typecheck.foldFun")

let rec v_Vuna_dTypecheck_dseedPatTypes = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((p) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedPatTypes rest st1 with
  | C_Vuna_dBase_dPair (tys, st2) -> C_Vuna_dBase_dPair ((ty) :: (tys), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1121 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1119 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1117 1 ("no matching clause for Vuna.Typecheck.seedPatTypes")

let rec v_Vuna_dTypecheck_dseedLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], locals, st) -> C_Vuna_dBase_dPair ([], C_Vuna_dBase_dPair (locals, st))
  | ((name) :: (rest), locals, st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedLocals rest ((C_Vuna_dBase_dPair (name,
          ty)) :: (locals)) st1 with
  | C_Vuna_dBase_dPair (tys, C_Vuna_dBase_dPair (locals2, st2)) -> C_Vuna_dBase_dPair ((ty) :: (tys),
      C_Vuna_dBase_dPair (locals2, st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1166 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1164 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1162 1 ("no matching clause for Vuna.Typecheck.seedLocals")

let rec v_Vuna_dTypecheck_dseedRecNames = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | ((C_Vuna_dBase_dPair (pat, value)) :: (rest), st) -> (match pat with
  | C_Vuna_dAst_dPVar (name, _) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedRecNames rest st1 with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (tail, st2)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (name, ty), C_Vuna_dBase_dPair (pat, value))) :: (tail), st2))
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1202 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1200 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("recursive let bindings must be simple names")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1198 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1196 1 ("no matching clause for Vuna.Typecheck.seedRecNames")

let rec v_Vuna_dTypecheck_drecExtendLocals = fun a0 a1 -> match (a0, a1) with
  | (locals, []) -> locals
  | (locals, (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (name, ty), _)) :: (rest)) -> v_Vuna_dTypecheck_drecExtendLocals
((C_Vuna_dBase_dPair (name, ty)) :: (locals)) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1207 1 ("no matching clause for Vuna.Typecheck.recExtendLocals")

let v_Vuna_dTypecheck_dtcNoSpan = C_Vuna_dBase_dSpan ("", 0, 0, 0, 0)

let v_Vuna_dTypecheck_dboolTrueExpr = C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("bi_eq_int", v_Vuna_dTypecheck_dtcNoSpan),
  (C_Vuna_dAst_dEInt (0, v_Vuna_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dAst_dEInt (0, v_Vuna_dTypecheck_dtcNoSpan))
    :: ([])), v_Vuna_dTypecheck_dtcNoSpan)

let v_Vuna_dTypecheck_dboolFalseExpr = C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("bi_eq_int", v_Vuna_dTypecheck_dtcNoSpan),
  (C_Vuna_dAst_dEInt (0, v_Vuna_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dAst_dEInt (1, v_Vuna_dTypecheck_dtcNoSpan))
    :: ([])), v_Vuna_dTypecheck_dtcNoSpan)

let rec v_Vuna_dTypecheck_dprependClauseParam = fun a0 a1 -> match (a0, a1) with
  | (pname, []) -> []
  | (pname, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> (C_Vuna_dBase_dPair ((C_Vuna_dAst_dPVar (pname,
        v_Vuna_dTypecheck_dtcNoSpan)) :: (pats), body)) :: (v_Vuna_dTypecheck_dprependClauseParam pname
  rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 852 1 ("no matching clause for Vuna.Typecheck.prependClauseParam")

let rec v_Vuna_dTypecheck_dprependClauseParams = fun a0 a1 -> match (a0, a1) with
  | ([], clauses) -> clauses
  | ((pname) :: (prest), clauses) -> v_Vuna_dTypecheck_dprependClauseParams prest (v_Vuna_dTypecheck_dprependClauseParam
  pname clauses)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 857 1 ("no matching clause for Vuna.Typecheck.prependClauseParams")

let v_Vuna_dTypecheck_ddeclFunName = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> name
  | _ -> ""
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1445 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dsubstOf = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> s
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1479 1 ("no matching clause for Vuna.Typecheck.substOf")

let rec v_Vuna_dTypecheck_dtcJoin = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dTypecheck_dtcJoin sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1582 1 ("no matching clause for Vuna.Typecheck.tcJoin")

let v_Vuna_dTypecheck_dtraitDeclName = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitDecl (n, p, ms)) -> n
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1639 1 ("no matching clause for Vuna.Typecheck.traitDeclName")

let v_Vuna_dTypecheck_dtraitDeclParam = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitDecl (n, p, ms)) -> p
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1641 1 ("no matching clause for Vuna.Typecheck.traitDeclParam")

let v_Vuna_dTypecheck_dtraitDeclMethods = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitDecl (n, p, ms)) -> ms
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1643 1 ("no matching clause for Vuna.Typecheck.traitDeclMethods")

let v_Vuna_dTypecheck_dmethodInfoName = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitMethodInfo (n, s, t)) -> n
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1645 1 ("no matching clause for Vuna.Typecheck.methodInfoName")

let v_Vuna_dTypecheck_dmethodInfoScheme = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitMethodInfo (n, s, t)) -> s
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1647 1 ("no matching clause for Vuna.Typecheck.methodInfoScheme")

let v_Vuna_dTypecheck_dmethodInfoSig = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitMethodInfo (n, s, t)) -> t
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1649 1 ("no matching clause for Vuna.Typecheck.methodInfoSig")

let v_Vuna_dTypecheck_dinstTraitName = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitInst (t, n, h, impls)) -> t
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1651 1 ("no matching clause for Vuna.Typecheck.instTraitName")

let v_Vuna_dTypecheck_dinstNameOf = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitInst (t, n, h, impls)) -> n
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1653 1 ("no matching clause for Vuna.Typecheck.instNameOf")

let v_Vuna_dTypecheck_dinstHeadTy = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitInst (t, n, h, impls)) -> h
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1655 1 ("no matching clause for Vuna.Typecheck.instHeadTy")

let v_Vuna_dTypecheck_dinstImpls = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitInst (t, n, h, impls)) -> impls
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1657 1 ("no matching clause for Vuna.Typecheck.instImpls")

let v_Vuna_dTypecheck_dtraitCtxDecls = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> ds
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1659 1 ("no matching clause for Vuna.Typecheck.traitCtxDecls")

let v_Vuna_dTypecheck_dtraitCtxInsts = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> is
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1661 1 ("no matching clause for Vuna.Typecheck.traitCtxInsts")

let v_Vuna_dTypecheck_dtraitCtxSupported = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> sup
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1663 1 ("no matching clause for Vuna.Typecheck.traitCtxSupported")

let v_Vuna_dTypecheck_dtraitCtxEqSupported = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> eqsup
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1665 1 ("no matching clause for Vuna.Typecheck.traitCtxEqSupported")

let v_Vuna_dTypecheck_dtraitCtxRefs = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> refs
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1667 1 ("no matching clause for Vuna.Typecheck.traitCtxRefs")

let v_Vuna_dTypecheck_dbuiltinA = C_Vuna_dAst_dEVar ("a", v_Vuna_dTypecheck_dtcNoSpan)

let v_Vuna_dTypecheck_dbuiltinArrow = fun a b -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", v_Vuna_dTypecheck_dtcNoSpan),
  (a) :: ((b) :: ([])), v_Vuna_dTypecheck_dtcNoSpan)

let v_Vuna_dTypecheck_dbuiltinShowTrait = fun () -> C_Vuna_dTypecheck_dTraitDecl ("Show", "a", (C_Vuna_dTypecheck_dTraitMethodInfo
    ("show", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
          (0), v_Vuna_dTypecheck_dstrTy)), v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA
      (C_Vuna_dAst_dEVar ("String", v_Vuna_dTypecheck_dtcNoSpan)))) :: ([]))

let v_Vuna_dTypecheck_dbuiltinEqTrait = fun () -> C_Vuna_dTypecheck_dTraitDecl ("Eq", "a", (C_Vuna_dTypecheck_dTraitMethodInfo
    ("eq", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
          (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))), v_Vuna_dTypecheck_dbuiltinArrow
      v_Vuna_dTypecheck_dbuiltinA (v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA (C_Vuna_dAst_dEVar
          ("Bool", v_Vuna_dTypecheck_dtcNoSpan))))) :: ((C_Vuna_dTypecheck_dTraitMethodInfo ("neq", v_Vuna_dTypecheck_dmkScheme
        ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
              (0), v_Vuna_dTypecheck_dboolTy))), v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA
        (v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA (C_Vuna_dAst_dEVar ("Bool", v_Vuna_dTypecheck_dtcNoSpan)))))
    :: ([])))

let v_Vuna_dTypecheck_dbuiltinOrdTrait = fun () -> C_Vuna_dTypecheck_dTraitDecl ("Ord", "a", (C_Vuna_dTypecheck_dTraitMethodInfo
    ("lt", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
          (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))), v_Vuna_dTypecheck_dbuiltinArrow
      v_Vuna_dTypecheck_dbuiltinA (v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA (C_Vuna_dAst_dEVar
          ("Bool", v_Vuna_dTypecheck_dtcNoSpan))))) :: ((C_Vuna_dTypecheck_dTraitMethodInfo ("le", v_Vuna_dTypecheck_dmkScheme
        ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
              (0), v_Vuna_dTypecheck_dboolTy))), v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA
        (v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA (C_Vuna_dAst_dEVar ("Bool", v_Vuna_dTypecheck_dtcNoSpan)))))
    :: ((C_Vuna_dTypecheck_dTraitMethodInfo ("gt", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun
            (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))),
          v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA (v_Vuna_dTypecheck_dbuiltinArrow
            v_Vuna_dTypecheck_dbuiltinA (C_Vuna_dAst_dEVar ("Bool", v_Vuna_dTypecheck_dtcNoSpan))))) ::
      ((C_Vuna_dTypecheck_dTraitMethodInfo ("ge", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun
              (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))),
            v_Vuna_dTypecheck_dbuiltinArrow v_Vuna_dTypecheck_dbuiltinA (v_Vuna_dTypecheck_dbuiltinArrow
              v_Vuna_dTypecheck_dbuiltinA (C_Vuna_dAst_dEVar ("Bool", v_Vuna_dTypecheck_dtcNoSpan)))))
        :: ([])))))

let v_Vuna_dTypecheck_dbuiltinTraitDecls = fun () -> (v_Vuna_dTypecheck_dbuiltinShowTrait ()) :: ((v_Vuna_dTypecheck_dbuiltinEqTrait
    ()) :: ((v_Vuna_dTypecheck_dbuiltinOrdTrait ()) :: ([])))

let v_Vuna_dTypecheck_dbuiltinMethodRefs = fun () -> (C_Vuna_dTypecheck_dTraitMethodRef ("show", "Show",
    v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dstrTy)),
    0)) :: ((C_Vuna_dTypecheck_dTraitMethodRef ("eq", "Eq", v_Vuna_dTypecheck_dmkScheme ((0) :: ([]))
      (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
            (0), v_Vuna_dTypecheck_dboolTy))), 0)) :: ((C_Vuna_dTypecheck_dTraitMethodRef ("neq", "Eq",
        v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0),
            C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))), 0)) ::
    ((C_Vuna_dTypecheck_dTraitMethodRef ("lt", "Ord", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun
            (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))),
          0)) :: ((C_Vuna_dTypecheck_dTraitMethodRef ("le", "Ord", v_Vuna_dTypecheck_dmkScheme ((0) ::
              ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
                  (0), v_Vuna_dTypecheck_dboolTy))), 0)) :: ((C_Vuna_dTypecheck_dTraitMethodRef ("gt",
              "Ord", v_Vuna_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar
                  (0), C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))),
              0)) :: ((C_Vuna_dTypecheck_dTraitMethodRef ("ge", "Ord", v_Vuna_dTypecheck_dmkScheme ((0)
                  :: ([])) (C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTVar (0), C_Vuna_dTypecheck_dTFun
                    (C_Vuna_dTypecheck_dTVar (0), v_Vuna_dTypecheck_dboolTy))), 0)) :: ([])))))))

let v_Vuna_dTypecheck_doperatorMethod = fun name -> (match name with
  | "==" -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("Eq", "eq"))
  | "/=" -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("Eq", "neq"))
  | "<" -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("Ord", "lt"))
  | "<=" -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("Ord", "le"))
  | ">" -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("Ord", "gt"))
  | ">=" -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("Ord", "ge"))
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1799 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dshapeName = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dDataShape (n, p, cs)) -> n
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1860 1 ("no matching clause for Vuna.Typecheck.shapeName")

let v_Vuna_dTypecheck_dshapeParams = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dDataShape (n, p, cs)) -> p
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1862 1 ("no matching clause for Vuna.Typecheck.shapeParams")

let v_Vuna_dTypecheck_dshapeCtors = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dDataShape (n, p, cs)) -> cs
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1864 1 ("no matching clause for Vuna.Typecheck.shapeCtors")

let rec v_Vuna_dTypecheck_dsplitTyFields = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (a) :: (v_Vuna_dTypecheck_dsplitTyFields
    b)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1867 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dshapeOfCtor = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (cname, ty, arity, sp)) -> C_Vuna_dBase_dPair (cname, v_Vuna_dTypecheck_dsplitTyFields
  ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1871 1 ("no matching clause for Vuna.Typecheck.shapeOfCtor")

let v_Vuna_dTypecheck_dctorPatternSrc = fun cname vars -> (match vars with
  | [] -> cname
  | _ -> (let vuna_cat0' = (cname) in
    (let vuna_cat1' = (" ") in
      (let vuna_cat2' = (v_Vuna_dTypecheck_dtcJoin " " vars) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1977 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_deqCondAt = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> "(0 == 0)"
  | ((v) :: (vs), (w) :: (ws)) -> (match v_Vuna_dTypecheck_deqCondAt vs ws with
  | "(0 == 0)" -> (let vuna_cat0' = ("((") in
    (let vuna_cat1' = (v) in
      (let vuna_cat2' = (") == (") in
        (let vuna_cat3' = (w) in
          (let vuna_cat4' = ("))") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | rest -> (let vuna_cat0' = ("((") in
    (let vuna_cat1' = (v) in
      (let vuna_cat2' = (") == (") in
        (let vuna_cat3' = (w) in
          (let vuna_cat4' = (")) && ") in
            (let vuna_cat5' = (rest) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2001 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1998 1 ("no matching clause for Vuna.Typecheck.eqCondAt")

let v_Vuna_dTypecheck_dandThenListPair = fun fn v rest -> ((let vuna_cat0' = (fn) in
    (let vuna_cat1' = (" (") in
      (let vuna_cat2' = (v) in
        (let vuna_cat3' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (rest)

let rec v_Vuna_dTypecheck_deqCondJoin = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> "(0 == 0)"
  | ((f) :: (rest), (w) :: (wrest)) -> (match v_Vuna_dTypecheck_deqCondJoin rest wrest with
  | "(0 == 0)" -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (f) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (w) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | more -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (f) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (w) in
          (let vuna_cat4' = (") && ") in
            (let vuna_cat5' = (more) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2028 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2025 1 ("no matching clause for Vuna.Typecheck.eqCondJoin")

let v_Vuna_dTypecheck_deqSigTypeSrc = fun sh -> (let tyName = v_Vuna_dTypecheck_dshapeName sh in
  (let params = v_Vuna_dTypecheck_dshapeParams sh in
    (match params with
  | [] -> tyName
  | _ -> (let vuna_cat0' = ("(") in
        (let vuna_cat1' = (tyName) in
          (let vuna_cat2' = (" ") in
            (let vuna_cat3' = (v_Vuna_dTypecheck_dtcJoin " " params) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2041 6 ("case pattern match failure"))))

let v_Vuna_dTypecheck_dbuiltinHelperSrc = "vuna_show_int n = strFromInt n
vuna_show_bool b = if b then \"True\" else \"False\"
vuna_show_string s = bi_show_string s
vuna_eq_int a b = bi_eq_int a b
vuna_neq_int a b = bi_neq_int a b
vuna_eq_bool a b = bi_eq_bool a b
vuna_neq_bool a b = bi_neq_bool a b
vuna_eq_str a b = bi_eq_str a b
vuna_neq_str a b = bi_neq_str a b
vuna_lt_int a b = bi_lt_int a b
vuna_le_int a b = bi_le_int a b
vuna_gt_int a b = bi_gt_int a b
vuna_ge_int a b = bi_ge_int a b
vuna_eq_generic a b = bi_eq_generic a b
vuna_neq_generic a b = bi_neq_generic a b
vuna_lt_generic a b = bi_lt_generic a b
vuna_le_generic a b = bi_le_generic a b
vuna_gt_generic a b = bi_gt_generic a b
vuna_ge_generic a b = bi_ge_generic a b
"

let v_Vuna_dTypecheck_dinstanceHeadParts = fun headExpr -> (match headExpr with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (traitName, sp), (headTy) :: ([]), _) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
    (traitName, headTy))
  | _ -> C_Vuna_dBase_dErr ("invalid instance head (expected `instance Trait Type`)")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2109 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dinstanceNameFor = fun isDefault iname -> (match iname with
  | C_Vuna_dBase_dJust (n) -> if isDefault then C_Vuna_dBase_dNothing
  else C_Vuna_dBase_dJust (n)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2114 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dclauseDecl = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (implName, C_Vuna_dBase_dPair (pats, body), sp) -> C_Vuna_dAst_dDFun (implName, pats, body, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2135 1 ("no matching clause for Vuna.Typecheck.clauseDecl")

let v_Vuna_dTypecheck_dpreludeModule = "<prelude>"

let v_Vuna_dTypecheck_dtyOuterTypeName = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (n, args) -> n
  | _ -> ""
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2175 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dinstUniqueKey = fun inst -> (match v_Vuna_dTypecheck_dinstNameOf inst with
  | C_Vuna_dBase_dJust (n) -> (("named|") ^ (n))
  | C_Vuna_dBase_dNothing -> (let vuna_cat0' = ("default|") in
    (let vuna_cat1' = (v_Vuna_dTypecheck_dinstTraitName inst) in
      (let vuna_cat2' = ("|") in
        (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy (v_Vuna_dTypecheck_dinstHeadTy inst)) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2266 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dstripTraitDecls = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDTrait (n, p, ms, sp) -> v_Vuna_dTypecheck_dstripTraitDecls rest
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> v_Vuna_dTypecheck_dstripTraitDecls
  rest
  | _ -> (d) :: (v_Vuna_dTypecheck_dstripTraitDecls rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2281 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2278 1 ("no matching clause for Vuna.Typecheck.stripTraitDecls")

let v_Vuna_dTypecheck_dfirstPat = fun a0 -> match a0 with
  | ((p) :: (rest)) -> p
  | ([]) -> C_Vuna_dAst_dPWild (C_Vuna_dBase_dSpan ("", 0, 0, 0, 0))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2460 1 ("no matching clause for Vuna.Typecheck.firstPat")

let rec v_Vuna_dTypecheck_dnthOrWild = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dAst_dPWild (C_Vuna_dBase_dSpan ("", 0, 0, 0, 0))
  | (0, (p) :: (rest)) -> p
  | (i, (p) :: (rest)) -> v_Vuna_dTypecheck_dnthOrWild (bi_sub i 1) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2463 1 ("no matching clause for Vuna.Typecheck.nthOrWild")

let v_Vuna_dTypecheck_dclausePatAt = fun a0 a1 -> match (a0, a1) with
  | (i, C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dTypecheck_dnthOrWild i pats
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2448 1 ("no matching clause for Vuna.Typecheck.clausePatAt")

let v_Vuna_dTypecheck_ddropFirstPat = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pats, body)) -> (match pats with
  | [] -> C_Vuna_dBase_dPair ([], body)
  | (p) :: (pr) -> C_Vuna_dBase_dPair (pr, body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2468 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2467 1 ("no matching clause for Vuna.Typecheck.dropFirstPat")

let rec v_Vuna_dTypecheck_dhasCatchAll = fun a0 -> match a0 with
  | ([]) -> false
  | ((p) :: (rest)) -> (match p with
  | C_Vuna_dAst_dPVar (n, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | _ -> v_Vuna_dTypecheck_dhasCatchAll rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2501 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2499 1 ("no matching clause for Vuna.Typecheck.hasCatchAll")

let rec v_Vuna_dTypecheck_dzipLocals = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> []
  | ((n) :: (ns), (t) :: (ts)) -> (C_Vuna_dBase_dPair (n, t)) :: (v_Vuna_dTypecheck_dzipLocals ns ts)
  | (_, _) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2537 1 ("no matching clause for Vuna.Typecheck.zipLocals")

let v_Vuna_dTypecheck_dschemeTy = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2541 1 ("no matching clause for Vuna.Typecheck.schemeTy")

let rec v_Vuna_dTypecheck_dflattenFun = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> (a) :: (v_Vuna_dTypecheck_dflattenFun b)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2544 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dcollectData = fun decls -> C_Vuna_dBase_dPair (v_Vuna_dTypecheck_ddeclDataNames
  decls, decls)

let rec v_Vuna_dCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dCodegen_djoinWith sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 8 1 ("no matching clause for Vuna.Codegen.joinWith")

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
  fun a -> VStr (string_of_int (expect_int \"strFromInt\" a))"

let v_Vuna_dCodegen_dshowPrelude = "
let vuna_short (name : string) : string =
  match String.rindex_opt name '.' with
  | Some index -> String.sub name (index + 1) (String.length name - index - 1)
  | None -> name

let vuna_quote = String.make 1 (Char.chr 34)

let vuna_escape (s : string) : string =
  let buf = Buffer.create (String.length s + 2) in
  let backslash = String.make 1 (Char.chr 92) in
  String.iter
    (fun c ->
      let code = Char.code c in
      if code = 34 then (Buffer.add_string buf backslash; Buffer.add_char buf c)
      else if code = 92 then (Buffer.add_string buf backslash; Buffer.add_char buf c)
      else if code = 10 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 110))
      else if code = 9 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 116))
      else if code = 13 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 114))
      else if code = 8 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 98))
      else if code >= 32 && code <= 126 then Buffer.add_char buf c
      else (Buffer.add_string buf backslash; Buffer.add_string buf (Printf.sprintf \"%03d\" code)))
    s;
  Buffer.contents buf
"

let rec v_Vuna_dCodegen_dsplitCtorFields = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((rest) :: ([])), _) -> (a) :: (v_Vuna_dCodegen_dsplitCtorFields
    rest)
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 27 3 ("case pattern match failure"))

let v_Vuna_dCodegen_druntimeCompareCode = "
let rec value_compare (a : value) (b : value) : int =
  match a with
  | VInt x -> (match b with VInt y -> if x < y then -1 else if x = y then 0 else 1 | _ -> -1)
  | VStr x -> (match b with VStr y -> compare x y | VInt _ -> 1 | _ -> -1)
  | VCon (n, xs) -> (match b with VCon (m, ys) -> con_compare n xs m ys | _ -> 1)
  | _ -> 0

and con_compare n xs m ys =
  let r = compare n m in
  if r = 0 then list_compare xs ys else r

and list_compare xs ys =
  match xs, ys with
  | [], [] -> 0
  | [], _ :: _ -> -1
  | _ :: _, [] -> 1
  | x :: xr, y :: yr ->
      let r = value_compare x y in
      if r = 0 then list_compare xr yr else r
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
                  :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_show_string", "bi_show_string", 1, "VStr (vuna_quote ^ vuna_escape (expect_str \"bi_show_string\" a) ^ vuna_quote)"))
                    :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_generic", "bi_eq_generic", 2, "vbool (value_compare a b = 0)"))
                      :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_generic", "bi_neq_generic", 2, "vbool (value_compare a b <> 0)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_lt_generic", "bi_lt_generic", 2, "vbool (value_compare a b < 0)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_le_generic", "bi_le_generic", 2, "vbool (value_compare a b <= 0)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_gt_generic", "bi_gt_generic", 2, "vbool (value_compare a b > 0)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_ge_generic", "bi_ge_generic", 2, "vbool (value_compare a b >= 0)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_int", "bi_eq_int", 2, "vbool (expect_int \"==\" a = expect_int \"==\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_int", "bi_neq_int", 2, "vbool (expect_int \"/=\" a <> expect_int \"/=\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_lt_int", "bi_lt_int", 2, "vbool (expect_int \"<\" a < expect_int \"<\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_le_int", "bi_le_int", 2, "vbool (expect_int \"<=\" a <= expect_int \"<=\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_gt_int", "bi_gt_int", 2, "vbool (expect_int \">\" a > expect_int \">\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_ge_int", "bi_ge_int", 2, "vbool (expect_int \">=\" a >= expect_int \">=\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_str", "bi_eq_str", 2, "vbool (expect_str \"==\" a = expect_str \"==\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_str", "bi_neq_str", 2, "vbool (expect_str \"/=\" a <> expect_str \"/=\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_bool", "bi_eq_bool", 2, "vbool (expect_bool \"==\" a = expect_bool \"==\" b)"))
                        :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_bool", "bi_neq_bool", 2, "vbool (expect_bool \"/=\" a <> expect_bool \"/=\" b)"))
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
                        :: ([]))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCodegen_djoinList = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dCodegen_djoinList sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 162 1 ("no matching clause for Vuna.Codegen.joinList")

let v_Vuna_dCodegen_dheadOf = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: (rest)) -> x
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 166 1 ("no matching clause for Vuna.Codegen.headOf")

let rec v_Vuna_dCodegen_drecBindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name, _), _)) :: (rest)) -> (name) :: (v_Vuna_dCodegen_drecBindNames
  rest)
  | ((C_Vuna_dBase_dPair (_, _)) :: (_)) -> []
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 278 1 ("no matching clause for Vuna.Codegen.recBindNames")

let rec v_Vuna_dCodegen_dcgApplyFold = fun a0 a1 -> match (a0, a1) with
  | (acc, []) -> acc
  | (acc, (a) :: (rest)) -> v_Vuna_dCodegen_dcgApplyFold ((let vuna_cat0' = ("(apply (") in
    (let vuna_cat1' = (acc) in
      (let vuna_cat2' = (") (") in
        (let vuna_cat3' = (a) in
          (let vuna_cat4' = ("))") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 289 1 ("no matching clause for Vuna.Codegen.cgApplyFold")

let v_Vuna_dEval_dnoLocSpan = C_Vuna_dBase_dSpan ("", 0, 0, 0, 0)

let rec v_Vuna_dEval_dany = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> false
  | (f, (x) :: (rest)) -> if f x then true
else v_Vuna_dEval_dany f rest
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 114 1 ("no matching clause for Vuna.Eval.any")

let v_Vuna_dEval_dpairSecond = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (_, v)) -> v
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 117 1 ("no matching clause for Vuna.Eval.pairSecond")

let v_Vuna_dEval_dvbool = fun b -> if b then C_Vuna_dEval_dVCon ("True", [])
else C_Vuna_dEval_dVCon ("False", [])

let rec v_Vuna_dEval_dcharsToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((c) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVInt (c)) :: ((v_Vuna_dEval_dcharsToValue
      rest) :: ([])))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 257 1 ("no matching clause for Vuna.Eval.charsToValue")

let v_Vuna_dEval_dstringToValue = fun s -> v_Vuna_dEval_dcharsToValue (bi_str_unpack s)

let rec v_Vuna_dEval_dstrListToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((s) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVStr (s)) :: ((v_Vuna_dEval_dstrListToValue
      rest) :: ([])))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 262 1 ("no matching clause for Vuna.Eval.strListToValue")

let v_Vuna_dEval_dboolEqValue = fun a b -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 293 7 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon ("False", []) -> (match b with
  | C_Vuna_dEval_dVCon ("False", []) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 297 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 291 3 ("case pattern match failure"))

let v_Vuna_dLoader_dimportName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 60 1 ("no matching clause for Vuna.Loader.importName")

let v_Vuna_dLoader_dimportIsQualified = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> isQualified
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 62 1 ("no matching clause for Vuna.Loader.importIsQualified")

let v_Vuna_dLoader_dimportAlias = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> alias
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 64 1 ("no matching clause for Vuna.Loader.importAlias")

let rec v_Vuna_dLoader_dimportAliases = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> (match v_Vuna_dLoader_dimportAlias imp with
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dimportAliases rest
  | C_Vuna_dBase_dJust (alias) -> (C_Vuna_dBase_dPair (alias, v_Vuna_dLoader_dimportName imp)) :: (v_Vuna_dLoader_dimportAliases
      rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 76 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 73 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dopenModuleNames = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> if v_Vuna_dLoader_dimportIsQualified imp then v_Vuna_dLoader_dopenModuleNames rest

  else (v_Vuna_dLoader_dimportName imp) :: (v_Vuna_dLoader_dopenModuleNames rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 99 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_d_ujoinNames = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (", ") in
    (let vuna_cat2' = (v_Vuna_dLoader_d_ujoinNames rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 116 1 ("no matching clause for Vuna.Loader._joinNames")

let v_Vuna_dLoader_dentryKind = fun e -> (match e with
  | C_Vuna_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf0
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 133 15 ("case pattern match failure"))

let v_Vuna_dLoader_dentryPublic = fun e -> (match e with
  | C_Vuna_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf1
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 136 17 ("case pattern match failure"))

let v_Vuna_dLoader_dentryTarget = fun e -> (match e with
  | C_Vuna_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf2
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 139 17 ("case pattern match failure"))

let v_Vuna_dLoader_dentryParent = fun e -> (match e with
  | C_Vuna_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf3
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 142 17 ("case pattern match failure"))

let rec v_Vuna_dLoader_dfoldFieldChain = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (base, [], sp) -> base
  | (base, (f) :: (rest), sp) -> v_Vuna_dLoader_dfoldFieldChain (C_Vuna_dAst_dEField (base, f, sp)) rest
sp
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 284 1 ("no matching clause for Vuna.Loader.foldFieldChain")

let v_Vuna_dLoader_drefKind = fun a0 -> match a0 with
  | (C_Vuna_dLoader_dExportRef (k, tgt, parent)) -> k
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 740 1 ("no matching clause for Vuna.Loader.refKind")

let v_Vuna_dLoader_drefTarget = fun a0 -> match a0 with
  | (C_Vuna_dLoader_dExportRef (k, tgt, parent)) -> tgt
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 742 1 ("no matching clause for Vuna.Loader.refTarget")

let v_Vuna_dLoader_drefEntryList = fun a0 a1 -> match (a0, a1) with
  | (pub, C_Vuna_dBase_dNothing) -> []
  | (pub, C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef (k, tgt, parent))) -> (C_Vuna_dLoader_dExportEntry
  (k, pub, tgt, parent)) :: ([])
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 776 1 ("no matching clause for Vuna.Loader.refEntryList")

let v_Vuna_dLoader_dtyShape = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (n, _) -> (("var ") ^ (n))
  | C_Vuna_dAst_dEApp (f, a, _) -> "app"
  | C_Vuna_dAst_dEInt (n, _) -> "int"
  | C_Vuna_dAst_dEStr (s, _) -> "str"
  | C_Vuna_dAst_dELam (ps, b, _) -> "lam"
  | C_Vuna_dAst_dELet (bs, b, _, _) -> "let"
  | C_Vuna_dAst_dECase (s, alts, _) -> "case"
  | C_Vuna_dAst_dEIf (c, t, e, _) -> "if"
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 995 3 ("case pattern match failure"))

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
  | ("bi_show_string") -> C_Vuna_dBase_dJust (1)
  | ("bi_eq_generic") -> C_Vuna_dBase_dJust (2)
  | ("bi_neq_generic") -> C_Vuna_dBase_dJust (2)
  | ("bi_lt_generic") -> C_Vuna_dBase_dJust (2)
  | ("bi_le_generic") -> C_Vuna_dBase_dJust (2)
  | ("bi_gt_generic") -> C_Vuna_dBase_dJust (2)
  | ("bi_ge_generic") -> C_Vuna_dBase_dJust (2)
  | ("bi_eq_int") -> C_Vuna_dBase_dJust (2)
  | ("bi_neq_int") -> C_Vuna_dBase_dJust (2)
  | ("bi_lt_int") -> C_Vuna_dBase_dJust (2)
  | ("bi_le_int") -> C_Vuna_dBase_dJust (2)
  | ("bi_gt_int") -> C_Vuna_dBase_dJust (2)
  | ("bi_ge_int") -> C_Vuna_dBase_dJust (2)
  | ("bi_eq_str") -> C_Vuna_dBase_dJust (2)
  | ("bi_neq_str") -> C_Vuna_dBase_dJust (2)
  | ("bi_eq_bool") -> C_Vuna_dBase_dJust (2)
  | ("bi_neq_bool") -> C_Vuna_dBase_dJust (2)
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
  | _ -> vuna_fail "lib/Vuna/Builtins.vuna" 7 1 ("no matching clause for Vuna.Builtins.builtinArity")

let v_Vuna_dLoader_disBuiltinName = fun name -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dBase_dJust (arity) -> true
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 227 3 ("case pattern match failure"))

let v_Vuna_dParser_dposOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> p
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 15 1 ("no matching clause for Vuna.Parser.posOf")

let v_Vuna_dParser_dtokOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> t
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 17 1 ("no matching clause for Vuna.Parser.tokOf")

let v_Vuna_dParser_dfileOf = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> file
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 19 1 ("no matching clause for Vuna.Parser.fileOf")

let v_Vuna_dParser_dpeekTok = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> (match toks with
  | (t) :: (rest) -> t
  | [] -> C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, C_Vuna_dBase_dPos (1, 1))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 25 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 24 1 ("no matching clause for Vuna.Parser.peekTok")

let v_Vuna_dParser_dpeekPos = fun st -> v_Vuna_dParser_dposOf (v_Vuna_dParser_dpeekTok st)

let v_Vuna_dParser_dlastPos = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> last
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 31 1 ("no matching clause for Vuna.Parser.lastPos")

let v_Vuna_dParser_dadvance = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (file, toks, last)) -> (match toks with
  | (t) :: (rest) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> C_Vuna_dParser_dPState (file, toks, last)
  | _ -> C_Vuna_dParser_dPState (file, rest, v_Vuna_dParser_dposOf t)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 36 7 ("case pattern match failure"))
  | [] -> C_Vuna_dParser_dPState (file, toks, last)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 34 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 33 1 ("no matching clause for Vuna.Parser.advance")

let v_Vuna_dParser_disEof = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 42 3 ("case pattern match failure"))

let v_Vuna_dParser_dexpectIdent = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (x, v_Vuna_dParser_dadvance
      st))
  | _ -> C_Vuna_dBase_dErr ("expected identifier")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 73 3 ("case pattern match failure"))

let v_Vuna_dParser_dstartsAtom = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("Type"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 97 3 ("case pattern match failure"))

let v_Vuna_dParser_dstartsPatternAtom = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 107 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 115 1 ("no matching clause for Vuna.Parser.infixInfo")

let v_Vuna_dParser_dopExpr = fun a0 a1 -> match (a0, a1) with
  | ("::", sp) -> C_Vuna_dAst_dEVar ("Cons", sp)
  | (op, sp) -> C_Vuna_dAst_dEVar (op, sp)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 132 1 ("no matching clause for Vuna.Parser.opExpr")

let rec v_Vuna_dParser_dcountArrows = fun e -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (x) :: ((rest) :: ([])), _) -> bi_add 1 (v_Vuna_dParser_dcountArrows
    rest)
  | _ -> 0
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 136 3 ("case pattern match failure"))

let v_Vuna_dParser_dterminatesExpression = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (")"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("]"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (","), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("else"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("in"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("then"), p) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 141 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dlamNames = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ([])
  | ((C_Vuna_dAst_dPVar (n, _)) :: (rest)) -> (match v_Vuna_dParser_dlamNames rest with
  | C_Vuna_dBase_dOk (ns) -> C_Vuna_dBase_dOk ((n) :: (ns))
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 333 3 ("case pattern match failure"))
  | ((_) :: (_)) -> C_Vuna_dBase_dErr ("where function arguments must be simple names")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 331 1 ("no matching clause for Vuna.Parser.lamNames")

let v_Vuna_dParser_dinstanceIsDefault = fun name -> (match name with
  | C_Vuna_dBase_dNothing -> true
  | C_Vuna_dBase_dJust (_) -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 447 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dfoldCons = fun a0 a1 -> match (a0, a1) with
  | (sp, []) -> C_Vuna_dAst_dEVar ("Nil", sp)
  | (sp, (e) :: (rest)) -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("Cons", sp), (e) :: ((v_Vuna_dParser_dfoldCons
      sp rest) :: ([])), sp)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 635 1 ("no matching clause for Vuna.Parser.foldCons")

let rec v_Vuna_dParser_dfoldPCon = fun a0 a1 -> match (a0, a1) with
  | (sp, []) -> C_Vuna_dAst_dPCon ("Nil", [], sp)
  | (sp, (p) :: (rest)) -> C_Vuna_dAst_dPCon ("Cons", (p) :: ((v_Vuna_dParser_dfoldPCon sp rest) :: ([])),
  sp)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 808 1 ("no matching clause for Vuna.Parser.foldPCon")

let v_Vuna_dAst_dpatSpan = fun pat -> (match pat with
  | C_Vuna_dAst_dPVar (name, sp) -> sp
  | C_Vuna_dAst_dPWild (sp) -> sp
  | C_Vuna_dAst_dPCon (name, pats, sp) -> sp
  | C_Vuna_dAst_dPInt (n, sp) -> sp
  | C_Vuna_dAst_dPStr (s, sp) -> sp
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 61 3 ("case pattern match failure"))

let v_Vuna_dAst_dexprSpan = fun expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> sp
  | C_Vuna_dAst_dEInt (n, sp) -> sp
  | C_Vuna_dAst_dEStr (s, sp) -> sp
  | C_Vuna_dAst_dELam (ps, body, sp) -> sp
  | C_Vuna_dAst_dEApp (fn, args, sp) -> sp
  | C_Vuna_dAst_dELet (binds, body, _, sp) -> sp
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> sp
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> sp
  | C_Vuna_dAst_dEField (base, f, sp) -> sp
  | C_Vuna_dAst_dERecord (name, fields, sp) -> sp
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> sp
  | C_Vuna_dAst_dEInstSel (meth, name, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 70 3 ("case pattern match failure"))

let v_Vuna_dAst_ddeclSpan = fun decl -> (match decl with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> sp
  | C_Vuna_dAst_dDSig (name, ty, sp) -> sp
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> sp
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> sp
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> sp
  | C_Vuna_dAst_dDInstance (name, isDefault, head, methods, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 85 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, sp)) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 93 1 ("no matching clause for Vuna.Ast.ctorSpan")

let v_Vuna_dAst_dfieldSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (name, ty, sp)) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 95 1 ("no matching clause for Vuna.Ast.fieldSpan")

let v_Vuna_dAst_dfieldName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (name, ty, sp)) -> name
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 97 1 ("no matching clause for Vuna.Ast.fieldName")

let v_Vuna_dAst_dfieldType = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (name, ty, sp)) -> ty
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 99 1 ("no matching clause for Vuna.Ast.fieldType")

let rec v_Vuna_dTypecheck_drecordArrowType = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], ret, sp) -> ret
  | ((f) :: (fs), ret, sp) -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", sp), (v_Vuna_dAst_dfieldType
    f) :: ((v_Vuna_dTypecheck_drecordArrowType fs ret sp) :: ([])), sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 970 1 ("no matching clause for Vuna.Typecheck.recordArrowType")

let v_Vuna_dAst_dimportSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 104 1 ("no matching clause for Vuna.Ast.importSpan")

let v_Vuna_dAst_dexportItemSpan = fun item -> (match item with
  | C_Vuna_dAst_dXBare (name, sp) -> sp
  | C_Vuna_dAst_dXTypeAll (name, sp) -> sp
  | C_Vuna_dAst_dXModule (name, sp) -> sp
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 107 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> name
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 127 1 ("no matching clause for Vuna.Ast.ctorName")

let v_Vuna_dAst_dctorType = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> ty
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 129 1 ("no matching clause for Vuna.Ast.ctorType")

let rec v_Vuna_dAst_dtypeArity = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (x) :: ((rest) :: ([])), _) -> bi_add 1 (v_Vuna_dAst_dtypeArity
    rest)
  | _ -> 0
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 132 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorArityOf = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> arity
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 136 1 ("no matching clause for Vuna.Ast.ctorArityOf")

let rec v_Vuna_dCodegen_dctorPairs = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (C_Vuna_dBase_dPair (v_Vuna_dAst_dctorName c, v_Vuna_dAst_dctorArityOf c)) :: (v_Vuna_dCodegen_dctorPairs
  rest)
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 378 1 ("no matching clause for Vuna.Codegen.ctorPairs")

let v_Vuna_dAst_ddeclTypeNames = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, _) -> (name) :: ([])
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, _) -> (name) :: ([])
  | C_Vuna_dAst_dDTrait (name, params, methods, _) -> (name) :: ([])
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 181 3 ("case pattern match failure"))

let v_Vuna_dAst_ddeclDerivings = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, _) -> derivings
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, _) -> derivings
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 190 3 ("case pattern match failure"))

let v_Vuna_dBase_dposLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (l, c)) -> l
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 34 1 ("no matching clause for Vuna.Base.posLine")

let v_Vuna_dBase_dposCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPos (l, c)) -> c
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 36 1 ("no matching clause for Vuna.Base.posCol")

let v_Vuna_dParser_dspanOf = fun st st2 -> C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine
  (v_Vuna_dParser_dpeekPos st), v_Vuna_dBase_dposCol (v_Vuna_dParser_dpeekPos st), v_Vuna_dBase_dposLine
  (v_Vuna_dParser_dlastPos st2), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos st2))

let v_Vuna_dBase_dspanFile = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> f
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 38 1 ("no matching clause for Vuna.Base.spanFile")

let v_Vuna_dBase_dspanStartLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> sl
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 40 1 ("no matching clause for Vuna.Base.spanStartLine")

let v_Vuna_dBase_dspanStartCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> sc
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 42 1 ("no matching clause for Vuna.Base.spanStartCol")

let v_Vuna_dParser_dspanFromExpr = fun e st2 -> (let sp = v_Vuna_dAst_dexprSpan e in
  C_Vuna_dBase_dSpan (v_Vuna_dBase_dspanFile sp, v_Vuna_dBase_dspanStartLine sp, v_Vuna_dBase_dspanStartCol
    sp, v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos st2), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos
      st2)))

let v_Vuna_dBase_dspanEndLine = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> el
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 44 1 ("no matching clause for Vuna.Base.spanEndLine")

let v_Vuna_dBase_dspanEndCol = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> ec
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 46 1 ("no matching clause for Vuna.Base.spanEndCol")

let v_Vuna_dBase_dshowSpanLoc = fun a0 -> match a0 with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec)) -> (let vuna_cat0' = (f) in
  (let vuna_cat1' = (":") in
    (let vuna_cat2' = (bi_str_from_int sl) in
      (let vuna_cat3' = (":") in
        (let vuna_cat4' = (bi_str_from_int sc) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 49 1 ("no matching clause for Vuna.Base.showSpanLoc")

let v_Vuna_dTypecheck_dmissingFieldMsg = fun sp fname -> (let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc
    sp) in
  (let vuna_cat1' = (": missing field ") in
    (let vuna_cat2' = (fname) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypecheck_dunknownFieldMsg = fun sp fname -> (let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc
    sp) in
  (let vuna_cat1' = (": unknown field ") in
    (let vuna_cat2' = (fname) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypecheck_dduplicateFieldMsg = fun sp -> ((v_Vuna_dBase_dshowSpanLoc sp) ^ (": duplicate field"))

let v_Vuna_dTypecheck_drecConstraintFailMsg = fun a0 -> match a0 with
  | ([]) -> "cannot resolve record type; add a type signature"
  | ((c) :: (rest)) -> (match c with
  | C_Vuna_dTypecheck_dFieldCon (baseTy, fname, resTy, sp) -> (let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc
      sp) in
    (let vuna_cat1' = (": cannot resolve record type for field access .") in
      (let vuna_cat2' = (fname) in
        (let vuna_cat3' = ("; add a type signature") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Vuna_dTypecheck_dUpdateCon (baseTy, fname, valTy, sp) -> (let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc
      sp) in
    (let vuna_cat1' = (": cannot resolve record type for record update {") in
      (let vuna_cat2' = (fname) in
        (let vuna_cat3' = (" = ...}; add a type signature") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1375 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1372 1 ("no matching clause for Vuna.Typecheck.recConstraintFailMsg")

let v_Vuna_dTypecheck_dbindWarnings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, decls, C_Vuna_dBase_dPair (pat, value)) -> (match pat with
  | C_Vuna_dAst_dPVar (n, _) -> []
  | C_Vuna_dAst_dPWild (_) -> []
  | _ -> (((v_Vuna_dBase_dshowSpanLoc (v_Vuna_dAst_dpatSpan pat)) ^ (": non-exhaustive let pattern")))
  :: ([])
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2425 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2424 1 ("no matching clause for Vuna.Typecheck.bindWarnings")

let v_Vuna_dLoader_dprivateExportMsg = fun prefix sp name -> (let vuna_cat0' = (prefix) in
  (let vuna_cat1' = (": ") in
    (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
      (let vuna_cat3' = (": cannot export private name ") in
        (let vuna_cat4' = (name) in
          (let vuna_cat5' = (" (names starting with _ are module-private)") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))

let rec v_Vuna_dBase_dappend = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (xs), ys) -> (x) :: (v_Vuna_dBase_dappend xs ys)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 52 1 ("no matching clause for Vuna.Base.append")

let rec v_Vuna_dTypedCodegen_dconcatFlatten = fun e -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("++", _), (a) :: ((b) :: ([])), _) -> v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dconcatFlatten
    a) (v_Vuna_dTypedCodegen_dconcatFlatten b)
  | _ -> (e) :: ([])
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 330 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dpatVarsTy = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dAst_dPVar (n, _), ty) -> (C_Vuna_dBase_dPair (n, ty)) :: ([])
  | (C_Vuna_dAst_dPCon (_, subpats, _), ty) -> v_Vuna_dTypecheck_dsubPatsVarNames subpats ty
  | (_, ty) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2417 1 ("no matching clause for Vuna.Typecheck.patVarsTy")
and v_Vuna_dTypecheck_dsubPatsVarNames = fun a0 a1 -> match (a0, a1) with
  | ([], ty) -> []
  | ((p) :: (rest), ty) -> v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dpatVarsTy p ty) (v_Vuna_dTypecheck_dsubPatsVarNames
  rest ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2421 1 ("no matching clause for Vuna.Typecheck.subPatsVarNames")

let rec v_Vuna_dCodegen_dallDataCtors = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> v_Vuna_dBase_dappend ctors (v_Vuna_dCodegen_dallDataCtors
    rest)
  | _ -> v_Vuna_dCodegen_dallDataCtors rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 86 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 84 1 ("no matching clause for Vuna.Codegen.allDataCtors")

let rec v_Vuna_dCodegen_dallCtors = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, _, _) -> v_Vuna_dBase_dappend (v_Vuna_dCodegen_dctorPairs
    ctors) (v_Vuna_dCodegen_dallCtors rest)
  | _ -> v_Vuna_dCodegen_dallCtors rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 384 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 382 1 ("no matching clause for Vuna.Codegen.allCtors")

let rec v_Vuna_dBase_dreverseOnto = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((x) :: (xs), acc) -> v_Vuna_dBase_dreverseOnto xs ((x) :: (acc))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 56 1 ("no matching clause for Vuna.Base.reverseOnto")

let v_Vuna_dBase_dreverse = fun xs -> v_Vuna_dBase_dreverseOnto xs []

let v_Vuna_dTypedCodegen_demitStr = fun str acc -> v_Vuna_dBase_dappend (v_Vuna_dBase_dreverse (bi_str_unpack
    str)) acc

let rec v_Vuna_dBase_dlength = fun a0 -> match a0 with
  | ([]) -> 0
  | ((x) :: (xs)) -> bi_add 1 (v_Vuna_dBase_dlength xs)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 63 1 ("no matching clause for Vuna.Base.length")

let rec v_Vuna_dTypecheck_dtotalConstraints = fun a0 -> match a0 with
  | ([]) -> 0
  | ((C_Vuna_dBase_dPair (name, C_Vuna_dTypecheck_dScheme (qs, cons, ty))) :: (rest)) -> bi_add (v_Vuna_dBase_dlength
  cons) (v_Vuna_dTypecheck_dtotalConstraints rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2309 1 ("no matching clause for Vuna.Typecheck.totalConstraints")

let rec v_Vuna_dBase_dmap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> (f x) :: (v_Vuna_dBase_dmap f xs)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 67 1 ("no matching clause for Vuna.Base.map")

let v_Vuna_dTypedCodegen_dchunkNamesOf = fun chunks -> v_Vuna_dBase_dmap v_Vuna_dTypedCodegen_dchunkNameOf
chunks

let v_Vuna_dTypecheck_ddictParamNames = fun params -> v_Vuna_dBase_dmap v_Vuna_dTypecheck_ddictParamName
params

let v_Vuna_dTypecheck_drecordParamVarExprs = fun params sp -> v_Vuna_dBase_dmap (fun p -> C_Vuna_dAst_dEVar
  (p, sp)) params

let v_Vuna_dTypecheck_drecordCtorFieldExprs = fun fields -> v_Vuna_dBase_dmap v_Vuna_dAst_dfieldType fields

let v_Vuna_dTypecheck_drecordRetType = fun dname params sp -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (dname,
    sp), v_Vuna_dTypecheck_drecordParamVarExprs (v_Vuna_dTypecheck_drecordParamNames params) sp, sp)

let v_Vuna_dTypecheck_drecordDeclToData = fun a0 -> match a0 with
  | (C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp)) -> C_Vuna_dAst_dDData (dname, params,
  (C_Vuna_dAst_dCtor (dname, v_Vuna_dTypecheck_drecordArrowType fields (v_Vuna_dTypecheck_drecordRetType
        dname params sp) sp, v_Vuna_dBase_dlength fields, sp)) :: ([]), derivings, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 975 1 ("no matching clause for Vuna.Typecheck.recordDeclToData")

let rec v_Vuna_dTypecheck_dextractRecords = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dPair ([], [])
  | ((d) :: (rest)) -> (match v_Vuna_dTypecheck_dextractRecords rest with
  | C_Vuna_dBase_dPair (recs, ds) -> (match d with
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp) -> (let info = C_Vuna_dTypecheck_dRecordInfo
      (dname, params, v_Vuna_dBase_dmap v_Vuna_dTypecheck_drecordFieldPair fields, derivings) in
      C_Vuna_dBase_dPair ((info) :: (recs), (v_Vuna_dTypecheck_drecordDeclToData d) :: (ds)))
  | _ -> C_Vuna_dBase_dPair (recs, (d) :: (ds))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 952 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 950 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 947 1 ("no matching clause for Vuna.Typecheck.extractRecords")

let rec v_Vuna_dTypecheck_drenderTyExpr = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (n, sp) -> n
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", sp), (a) :: ((b) :: ([])), _) -> (let vuna_cat0' = ("(")
    in
    (let vuna_cat1' = (v_Vuna_dTypecheck_drenderTyExpr a) in
      (let vuna_cat2' = (" -> ") in
        (let vuna_cat3' = (v_Vuna_dTypecheck_drenderTyExpr b) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dAst_dEApp (f, args, sp) -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (v_Vuna_dTypecheck_drenderTyExpr f) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_Vuna_dTypecheck_dtcJoin " " (v_Vuna_dBase_dmap v_Vuna_dTypecheck_drenderTyExpr
              args)) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> "Int"
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1615 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dcollectDataShapes = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> (C_Vuna_dTypecheck_dDataShape (name, params,
      v_Vuna_dBase_dmap v_Vuna_dTypecheck_dshapeOfCtor ctors)) :: (v_Vuna_dTypecheck_dcollectDataShapes
    rest)
  | _ -> v_Vuna_dTypecheck_dcollectDataShapes rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1876 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1873 1 ("no matching clause for Vuna.Typecheck.collectDataShapes")

let v_Vuna_dTypecheck_ddataHeadTy = fun a0 a1 -> match (a0, a1) with
  | (tyName, []) -> C_Vuna_dTypecheck_dTCon (tyName, [])
  | (tyName, params) -> C_Vuna_dTypecheck_dTCon (tyName, v_Vuna_dBase_dmap (fun p -> C_Vuna_dTypecheck_dTVar
    (0)) params)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2261 1 ("no matching clause for Vuna.Typecheck.dataHeadTy")

let v_Vuna_dLoader_dimportModuleNames = fun imports -> v_Vuna_dBase_dmap v_Vuna_dLoader_dimportName imports

let rec v_Vuna_dBase_dtraverse = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (xs)) -> (match f x with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (y) -> (match v_Vuna_dBase_dtraverse f xs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (ys) -> C_Vuna_dBase_dOk ((y) :: (ys))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 76 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 73 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 71 1 ("no matching clause for Vuna.Base.traverse")

let v_Vuna_dBase_dandThen = fun r f -> (match r with
  | C_Vuna_dBase_dOk (x) -> f x
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 82 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dmapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (rest)) -> v_Vuna_dBase_dandThen (f x) (fun y -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
    f rest) (fun ys -> C_Vuna_dBase_dOk ((y) :: (ys))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 75 1 ("no matching clause for Vuna.TypedCodegen.mapResult")

let v_Vuna_dBase_dstep = fun r k -> (match r with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (x, st)) -> k x st
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 88 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dparseParams = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseParams
    (v_Vuna_dParser_dadvance st)) (fun rest st1 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((name) :: (rest),
        st1)))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 486 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dconcatMap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (rest)) -> v_Vuna_dBase_dappend (f x) (v_Vuna_dBase_dconcatMap f rest)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 94 1 ("no matching clause for Vuna.Base.concatMap")

let rec v_Vuna_dTypedCodegen_dpatVars = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> []
  | C_Vuna_dAst_dPVar (name, _) -> (name) :: ([])
  | C_Vuna_dAst_dPInt (n, _) -> []
  | C_Vuna_dAst_dPStr (s, _) -> []
  | C_Vuna_dAst_dPCon (name, pats, _) -> v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 283 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dpatVarNames = fun p -> (match p with
  | C_Vuna_dAst_dPVar (n, _) -> (n) :: ([])
  | C_Vuna_dAst_dPCon (_, subpats, _) -> v_Vuna_dBase_dconcatMap v_Vuna_dTypecheck_dpatVarNames subpats
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2532 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dpatsVarNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dpatVarNames p) (v_Vuna_dTypecheck_dpatsVarNames
  rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2528 1 ("no matching clause for Vuna.Typecheck.patsVarNames")

let rec v_Vuna_dEval_dpatNames = fun a0 -> match a0 with
  | (C_Vuna_dAst_dPVar (n, _)) -> (n) :: ([])
  | (C_Vuna_dAst_dPCon (_, ps, _)) -> v_Vuna_dBase_dconcatMap v_Vuna_dEval_dpatNames ps
  | (_) -> []
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 122 1 ("no matching clause for Vuna.Eval.patNames")

let rec v_Vuna_dEval_dbindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (pat, _)) :: (rest)) -> v_Vuna_dBase_dappend (v_Vuna_dEval_dpatNames pat) (v_Vuna_dEval_dbindNames
  rest)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 119 1 ("no matching clause for Vuna.Eval.bindNames")

let v_Vuna_dAst_dtypeNamesOf = fun decls -> v_Vuna_dBase_dconcatMap v_Vuna_dAst_ddeclTypeNames decls

let v_Vuna_dBase_dfirstOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (a, b)) -> a
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 107 1 ("no matching clause for Vuna.Base.firstOf")

let v_Vuna_dAst_ddeclNames = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> (name) :: ([])
  | C_Vuna_dAst_dDSig (name, ty, _) -> (name) :: ([])
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, _) -> v_Vuna_dBase_dmap v_Vuna_dAst_dctorName
  ctors
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, _) -> (dname) :: ([])
  | C_Vuna_dAst_dDTrait (tname, params, methods, _) -> v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf methods
  | C_Vuna_dAst_dDInstance (name, isDefault, head, methods, _) -> (match name with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (n) -> (n) :: ([])
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 165 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 158 3 ("case pattern match failure"))

let v_Vuna_dAst_dtopNames = fun decls -> v_Vuna_dBase_dconcatMap v_Vuna_dAst_ddeclNames decls

let v_Vuna_dAst_d_udeclCtors = fun d -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, _) -> v_Vuna_dBase_dmap v_Vuna_dAst_dctorName
  ctors
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, _) -> (dname) :: ([])
  | C_Vuna_dAst_dDTrait (tname, params, methods, _) -> v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf methods
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 172 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorsOf = fun decls -> v_Vuna_dBase_dconcatMap v_Vuna_dAst_d_udeclCtors decls

let v_Vuna_dBase_dsecondOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (a, b)) -> b
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 110 1 ("no matching clause for Vuna.Base.secondOf")

let v_Vuna_dTypedCodegen_druntimeCodeTyped = fun () -> (("\n") ^ (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dBase_dmap
      v_Vuna_dBase_dsecondOf v_Vuna_dTypedCodegen_druntimePrelude)))

let v_Vuna_dBase_dsplitLastDot = fun parts -> (match v_Vuna_dBase_dreverse parts with
  | [] -> C_Vuna_dBase_dPair ([], "")
  | (last) :: (rest) -> C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse rest, last)
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 144 3 ("case pattern match failure"))

let rec v_Vuna_dBase_djoinDots = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (".") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinDots rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 149 1 ("no matching clause for Vuna.Base.joinDots")

let rec v_Vuna_dBase_djoinSlashes = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = ("/") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinSlashes rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 154 1 ("no matching clause for Vuna.Base.joinSlashes")

let rec v_Vuna_dBase_djoinArrows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (" -> ") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinArrows rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 159 1 ("no matching clause for Vuna.Base.joinArrows")

let v_Vuna_dLoader_dshowCycle = fun name stack -> v_Vuna_dBase_djoinArrows (v_Vuna_dBase_dreverse ((name)
    :: (stack)))

let v_vuna_ushow_uint = fun n -> bi_str_from_int n

let v_vuna_ushow_ubool = fun b -> if b then "True"
else "False"

let v_vuna_ushow_ustring = fun s -> bi_show_string s

let v_vuna_ueq_uint = fun a b -> bi_eq_int a b

let v_Lint_disSpaceChar = fun c -> (if (v_vuna_ueq_uint c 32) then true
  else (v_vuna_ueq_uint c 9))

let rec v_Lint_dindentChars = fun a0 -> match a0 with
  | ([]) -> 0
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 32 then bi_add 1 (v_Lint_dindentChars rest)
else if v_vuna_ueq_uint c 9 then bi_add 1 (v_Lint_dindentChars rest)
else 0
  | _ -> vuna_fail "app/Lint.vuna" 76 1 ("no matching clause for Lint.indentChars")

let v_Lint_dindentOf = fun line -> v_Lint_dindentChars (bi_str_unpack line)

let rec v_Lint_dblankChars = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> (if (v_Lint_disSpaceChar c) then (v_Lint_dblankChars rest)
  else false)
  | _ -> vuna_fail "app/Lint.vuna" 85 1 ("no matching clause for Lint.blankChars")

let v_Lint_disBlankLine = fun line -> v_Lint_dblankChars (bi_str_unpack line)

let rec v_Lint_dsplitLinesFrom = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], acc, cur) -> v_Vuna_dBase_dreverse ((bi_str_pack (v_Vuna_dBase_dreverse cur)) :: (acc))
  | ((c) :: (rest), acc, cur) -> if v_vuna_ueq_uint c 10 then v_Lint_dsplitLinesFrom rest ((bi_str_pack
    (v_Vuna_dBase_dreverse cur)) :: (acc)) []
else v_Lint_dsplitLinesFrom rest acc ((c) :: (cur))
  | _ -> vuna_fail "app/Lint.vuna" 91 1 ("no matching clause for Lint.splitLinesFrom")

let v_Lint_dsplitLines = fun source -> v_Lint_dsplitLinesFrom (bi_str_unpack source) [] []

let rec v_Lint_ddropSpaceChars = fun chars -> (match chars with
  | [] -> []
  | (c) :: (rest) -> if v_Lint_disSpaceChar c then v_Lint_ddropSpaceChars rest
  else chars
  | _ -> vuna_fail "app/Lint.vuna" 136 3 ("case pattern match failure"))

let v_Lint_dtrimStart = fun line -> bi_str_pack (v_Lint_ddropSpaceChars (bi_str_unpack line))

let rec v_Lint_dprefixChars = fun a0 a1 -> match (a0, a1) with
  | ([], text) -> true
  | ((p) :: (prest), text) -> (match text with
  | [] -> false
  | (t) :: (trest) -> if v_vuna_ueq_uint p t then v_Lint_dprefixChars prest trest
  else false
  | _ -> vuna_fail "app/Lint.vuna" 164 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 161 1 ("no matching clause for Lint.prefixChars")

let rec v_Lint_dcontainsSubChars = fun pat text -> (match text with
  | [] -> false
  | (c) :: (rest) -> if v_Lint_dprefixChars pat text then true
  else v_Lint_dcontainsSubChars pat rest
  | _ -> vuna_fail "app/Lint.vuna" 170 3 ("case pattern match failure"))

let rec v_Lint_dcontainsChar = fun a0 a1 -> match (a0, a1) with
  | (c, []) -> false
  | (c, (x) :: (rest)) -> if v_vuna_ueq_uint x c then true
else v_Lint_dcontainsChar c rest
  | _ -> vuna_fail "app/Lint.vuna" 175 1 ("no matching clause for Lint.containsChar")

let v_Lint_dhasComment = fun line -> (if (v_Lint_dcontainsSubChars (bi_str_unpack "--") (bi_str_unpack
      line)) then true
  else (v_Lint_dcontainsSubChars (bi_str_unpack "{-") (bi_str_unpack line)))

let v_Lint_dhasTabOrCR = fun line -> (if (v_Lint_dcontainsChar 9 (bi_str_unpack line)) then true
  else (v_Lint_dcontainsChar 13 (bi_str_unpack line)))

let rec v_Lint_dfilterTokLine = fun a0 a1 -> match (a0, a1) with
  | ([], n) -> []
  | ((t) :: (rest), n) -> if v_vuna_ueq_uint (v_Lint_dtokLine t) n then (t) :: (v_Lint_dfilterTokLine
  rest n)
else v_Lint_dfilterTokLine rest n
  | _ -> vuna_fail "app/Lint.vuna" 230 1 ("no matching clause for Lint.filterTokLine")

let v_Lint_dtokensOnLine = fun toks n -> v_Lint_dfilterTokLine toks n

let rec v_Vuna_dTypedCodegen_dtrimTrailing = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 32 then v_Vuna_dTypedCodegen_dtrimTrailing rest
else (c) :: (rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 968 1 ("no matching clause for Vuna.TypedCodegen.trimTrailing")

let rec v_Vuna_dTypecheck_dnthNameAt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> ""
  | (i, (x) :: (rest)) -> if v_vuna_ueq_uint i 0 then x
else v_Vuna_dTypecheck_dnthNameAt (bi_sub i 1) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 745 1 ("no matching clause for Vuna.Typecheck.nthNameAt")

let v_Vuna_dTypecheck_dnthName = fun i vars -> v_Vuna_dTypecheck_dnthNameAt i vars

let rec v_Vuna_dTypecheck_dnthFieldTy = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dAst_dEInt (0, v_Vuna_dTypecheck_dtcNoSpan)
  | (i, (C_Vuna_dBase_dPair (n, t)) :: (rest)) -> if v_vuna_ueq_uint i 0 then t
else v_Vuna_dTypecheck_dnthFieldTy (bi_sub i 1) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1356 1 ("no matching clause for Vuna.Typecheck.nthFieldTy")

let v_Vuna_dTypecheck_dsanitizeSymChar = fun c -> if (if (v_vuna_ueq_uint c 46) then true
  else (v_vuna_ueq_uint c 35)) then 95
else c

let v_Vuna_dTypecheck_dsanitizeSym = fun name -> bi_str_pack (v_Vuna_dBase_dmap v_Vuna_dTypecheck_dsanitizeSymChar
  (bi_str_unpack name))

let v_Vuna_dTypecheck_dtcQuoteChar = fun c -> if v_vuna_ueq_uint c 34 then "\\\""
else if v_vuna_ueq_uint c 92 then "\\\\"
else if v_vuna_ueq_uint c 10 then "\\n"
else if v_vuna_ueq_uint c 9 then "\\t"
else if v_vuna_ueq_uint c 13 then "\\r"
else bi_str_pack ((c) :: ([]))

let rec v_Vuna_dTypecheck_dtcQuoteChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> ((v_Vuna_dTypecheck_dtcQuoteChar c) ^ (v_Vuna_dTypecheck_dtcQuoteChars rest))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1608 1 ("no matching clause for Vuna.Typecheck.tcQuoteChars")

let v_Vuna_dTypecheck_dtcQuote = fun s -> (let vuna_cat0' = ("\"") in
  (let vuna_cat1' = (v_Vuna_dTypecheck_dtcQuoteChars (bi_str_unpack s)) in
    (let vuna_cat2' = ("\"") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypecheck_dshowFnName = fun tyName -> (("vuna_show_") ^ (v_Vuna_dTypecheck_dsanitizeSym tyName))

let v_Vuna_dTypecheck_deqFnName = fun tyName -> (("vuna_eq_") ^ (v_Vuna_dTypecheck_dsanitizeSym tyName))

let v_Vuna_dTypecheck_dneqFnName = fun tyName -> (("vuna_neq_") ^ (v_Vuna_dTypecheck_dsanitizeSym tyName))

let rec v_Vuna_dTypecheck_dshowArgParts = fun a0 -> match a0 with
  | ([]) -> []
  | ((v) :: (rest)) -> (v_Vuna_dTypecheck_dtcQuote " ") :: (((let vuna_cat0' = ("(show ") in
      (let vuna_cat1' = (v) in
        (let vuna_cat2' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: (v_Vuna_dTypecheck_dshowArgParts
    rest))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1981 1 ("no matching clause for Vuna.Typecheck.showArgParts")

let v_Vuna_dTypecheck_dinstKeyOf = fun isDefault iname headTy -> if isDefault then (("d_") ^ (v_Vuna_dTypecheck_dsanitizeSym
    (v_Vuna_dTypecheck_drenderTyExpr headTy)))
else (match iname with
  | C_Vuna_dBase_dJust (n) -> v_Vuna_dTypecheck_dsanitizeSym n
  | C_Vuna_dBase_dNothing -> (("d_") ^ (v_Vuna_dTypecheck_dsanitizeSym (v_Vuna_dTypecheck_drenderTyExpr
        headTy)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2121 5 ("case pattern match failure"))

let v_Vuna_dTypecheck_dimplNameOf = fun instKey methodShort -> (let vuna_cat0' = ("vuna_inst_") in
  (let vuna_cat1' = (v_Vuna_dTypecheck_dsanitizeSym instKey) in
    (let vuna_cat2' = ("_") in
      (let vuna_cat3' = (v_Vuna_dTypecheck_dsanitizeSym methodShort) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let v_Vuna_dTypecheck_dderivingImpls = fun traitName tyName -> (match traitName with
  | "Show" -> (C_Vuna_dBase_dPair ("show", v_Vuna_dTypecheck_dshowFnName tyName)) :: ([])
  | "Eq" -> (C_Vuna_dBase_dPair ("eq", v_Vuna_dTypecheck_deqFnName tyName)) :: ((C_Vuna_dBase_dPair ("neq",
        v_Vuna_dTypecheck_dneqFnName tyName)) :: ([]))
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2224 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dnthList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> ""
  | (n, (x) :: (rest)) -> if v_vuna_ueq_uint n 0 then x
else v_Vuna_dCodegen_dnthList (bi_sub n 1) rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 169 1 ("no matching clause for Vuna.Codegen.nthList")

let v_Vuna_dCodegen_dsanitizeChar = fun c -> if v_vuna_ueq_uint c 46 then (95) :: ((100) :: ([]))
else if v_vuna_ueq_uint c 95 then (95) :: ((117) :: ([]))
else if v_vuna_ueq_uint c 39 then (95) :: ((112) :: ([]))
else (c) :: ([])

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 236 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dpatParam = fun p -> (match p with
  | C_Vuna_dAst_dPVar (name, _) -> v_Vuna_dCodegen_dsanitizeName name
  | _ -> "_"
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 609 3 ("case pattern match failure"))

let v_Vuna_dCodegen_dpad3 = fun s -> if v_vuna_ueq_uint (bi_str_length s) 1 then (("00") ^ (s))
else if v_vuna_ueq_uint (bi_str_length s) 2 then (("0") ^ (s))
else s

let rec v_Vuna_dCodegen_dcheckArities = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, expected, []) -> C_Vuna_dBase_dOk (expected)
  | (name, expected, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> if v_vuna_ueq_uint (v_Vuna_dBase_dlength
  pats) expected then v_Vuna_dCodegen_dcheckArities name expected rest
else C_Vuna_dBase_dErr ((let vuna_cat0' = ("clauses for ") in
    (let vuna_cat1' = (name) in
      (let vuna_cat2' = (" have different arities") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 373 1 ("no matching clause for Vuna.Codegen.checkArities")

let v_Vuna_dCodegen_darityOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("function ") in
    (let vuna_cat1' = (name) in
      (let vuna_cat2' = (" has no clauses") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (name, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> v_Vuna_dCodegen_dcheckArities name (v_Vuna_dBase_dlength
  pats) rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 370 1 ("no matching clause for Vuna.Codegen.arityOf")

let rec v_Vuna_dCodegen_drenderRecsFrom = fun a0 a1 -> match (a0, a1) with
  | ([], index) -> ""
  | ((f) :: (rest), index) -> (let prefix = if v_vuna_ueq_uint index 0 then "let rec "
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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 475 1 ("no matching clause for Vuna.Codegen.renderRecsFrom")

let v_Vuna_dEval_derrAt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec), msg) -> if v_vuna_ueq_uint sl 0 then C_Vuna_dBase_dErr (msg)

else C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc (C_Vuna_dBase_dSpan (f, sl, sc, el,
          ec))) in
    (let vuna_cat1' = (": ") in
      (let vuna_cat2' = (msg) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 20 1 ("no matching clause for Vuna.Eval.errAt")

let v_Vuna_dEval_dexpectBoolValue = fun sp v -> (match v with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (v)
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (v)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 81 3 ("case pattern match failure"))

let v_Vuna_dEval_dintArg = fun sp v -> (match v with
  | C_Vuna_dEval_dVInt (n) -> C_Vuna_dBase_dOk (n)
  | _ -> v_Vuna_dEval_derrAt sp "expected an Int argument"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 246 3 ("case pattern match failure"))

let v_Vuna_dEval_dstringArg = fun sp v -> (match v with
  | C_Vuna_dEval_dVStr (s) -> C_Vuna_dBase_dOk (s)
  | _ -> v_Vuna_dEval_derrAt sp "expected a String argument"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 251 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dvalueToChars = fun sp v -> (match v with
  | C_Vuna_dEval_dVCon ("Nil", []) -> C_Vuna_dBase_dOk ([])
  | C_Vuna_dEval_dVCon ("Cons", (head) :: ((tail) :: ([]))) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg
    sp head) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dvalueToChars sp tail) (fun rest -> C_Vuna_dBase_dOk
      ((n) :: (rest))))
  | _ -> v_Vuna_dEval_derrAt sp "strPack expects a List Int"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 266 3 ("case pattern match failure"))

let v_Vuna_dEval_dint2 = fun sp args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dintArg sp b) (fun y -> f x y))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 273 3 ("case pattern match failure"))

let v_Vuna_dEval_dstr2 = fun sp args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dstringArg sp b) (fun y -> f x y))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 278 3 ("case pattern match failure"))

let v_Vuna_dEval_ddivideBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dintArg sp b) (fun y -> if v_vuna_ueq_uint y 0 then v_Vuna_dEval_derrAt sp "division by zero"

      else C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_div x y))))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for /"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 283 3 ("case pattern match failure"))

let v_Vuna_dEval_dandBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 319 11 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 317 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for &&"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 315 3 ("case pattern match failure"))

let v_Vuna_dEval_dorBuiltin = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 333 11 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 330 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for ||"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 328 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dshowStringChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 34 then (("\\\"") ^ (v_Vuna_dEval_dshowStringChars rest))

else if v_vuna_ueq_uint c 92 then (("\\\\") ^ (v_Vuna_dEval_dshowStringChars rest))
else if v_vuna_ueq_uint c 10 then (("\\n") ^ (v_Vuna_dEval_dshowStringChars rest))
else if v_vuna_ueq_uint c 9 then (("\\t") ^ (v_Vuna_dEval_dshowStringChars rest))
else if v_vuna_ueq_uint c 13 then (("\\r") ^ (v_Vuna_dEval_dshowStringChars rest))
else ((bi_str_pack ((c) :: ([]))) ^ (v_Vuna_dEval_dshowStringChars rest))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 511 1 ("no matching clause for Vuna.Eval.showStringChars")

let v_Vuna_dEval_dshowString = fun s -> (let vuna_cat0' = ("\"") in
  (let vuna_cat1' = (v_Vuna_dEval_dshowStringChars (bi_str_unpack s)) in
    (let vuna_cat2' = ("\"") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dLexer_dadvanceChar = fun a0 a1 -> match (a0, a1) with
  | (c, C_Vuna_dBase_dPos (line, col)) -> if v_vuna_ueq_uint c 10 then C_Vuna_dBase_dPos (bi_add line
  1, 1)
else C_Vuna_dBase_dPos (line, bi_add col 1)
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 21 1 ("no matching clause for Vuna.Lexer.advanceChar")

let v_Vuna_dLexer_disSpace = fun c -> (if ((if ((if (v_vuna_ueq_uint c 32) then true
          else (v_vuna_ueq_uint c 9))) then true
      else (v_vuna_ueq_uint c 10))) then true
  else (v_vuna_ueq_uint c 13))

let v_Vuna_dLexer_disOpChar = fun c -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if
                        ((if ((if ((if ((if ((if (v_vuna_ueq_uint c 33) then true
                        else (v_vuna_ueq_uint c 36))) then true
                        else (v_vuna_ueq_uint c 37))) then true
                        else (v_vuna_ueq_uint c 38))) then true
                        else (v_vuna_ueq_uint c 42))) then true
                        else (v_vuna_ueq_uint c 43))) then true
                        else (v_vuna_ueq_uint c 45))) then true
                        else (v_vuna_ueq_uint c 46))) then true
                        else (v_vuna_ueq_uint c 47))) then true
                        else (v_vuna_ueq_uint c 60))) then true
                        else (v_vuna_ueq_uint c 61))) then true
                        else (v_vuna_ueq_uint c 62))) then true
                        else (v_vuna_ueq_uint c 63))) then true
                      else (v_vuna_ueq_uint c 64))) then true
                  else (v_vuna_ueq_uint c 92))) then true
              else (v_vuna_ueq_uint c 94))) then true
          else (v_vuna_ueq_uint c 124))) then true
      else (v_vuna_ueq_uint c 126))) then true
  else (v_vuna_ueq_uint c 58))

let rec v_Vuna_dLexer_dskipLineComment = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dChars ([], p)) -> C_Vuna_dLexer_dChars ([], p)
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p)) -> if v_vuna_ueq_uint c 10 then C_Vuna_dLexer_dChars ((c)
  :: (rest), p)
else v_Vuna_dLexer_dskipLineComment (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 49 1 ("no matching clause for Vuna.Lexer.skipLineComment")

let rec v_Vuna_dLexer_dskipBlockComment = fun depth cs -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dErr ("unterminated block comment")
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> (match rest with
  | (c2) :: (rest2) -> if (if (v_vuna_ueq_uint c 123) then (v_vuna_ueq_uint c2 45)
      else false) then v_Vuna_dLexer_dskipBlockComment (bi_add depth 1) (C_Vuna_dLexer_dChars (rest2,
        v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p)))
    else if (if (v_vuna_ueq_uint c 45) then (v_vuna_ueq_uint c2 125)
      else false) then if v_vuna_ueq_uint depth 1 then C_Vuna_dBase_dOk (C_Vuna_dLexer_dChars (rest2,
        v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p)))
    else v_Vuna_dLexer_dskipBlockComment (bi_sub depth 1) (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar
        c2 (v_Vuna_dLexer_dadvanceChar c p)))
    else v_Vuna_dLexer_dskipBlockComment depth (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
        c p))
  | [] -> v_Vuna_dLexer_dskipBlockComment depth (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
        c p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 58 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 55 3 ("case pattern match failure"))

let rec v_Vuna_dLexer_dskipTrivia = fun cs -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dOk (cs)
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> if v_Vuna_dLexer_disSpace c then v_Vuna_dLexer_dskipTrivia
  (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  else (match rest with
  | (c2) :: (rest2) -> if (if (v_vuna_ueq_uint c 45) then (v_vuna_ueq_uint c2 45)
      else false) then v_Vuna_dLexer_dskipTrivia (v_Vuna_dLexer_dskipLineComment (C_Vuna_dLexer_dChars
        (rest, v_Vuna_dLexer_dadvanceChar c p)))
    else if (if (v_vuna_ueq_uint c 123) then (v_vuna_ueq_uint c2 45)
      else false) then (match v_Vuna_dLexer_dskipBlockComment 1 (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
          c p)) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (cs2) -> v_Vuna_dLexer_dskipTrivia cs2
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 79 15 ("case pattern match failure"))
    else C_Vuna_dBase_dOk (cs)
  | [] -> C_Vuna_dBase_dOk (cs)
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 74 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 69 3 ("case pattern match failure"))

let rec v_Vuna_dLexer_dcollectOp = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc),
  C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disOpChar c then v_Vuna_dLexer_dcollectOp
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
    p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 102 1 ("no matching clause for Vuna.Lexer.collectOp")

let rec v_Vuna_dLexer_dscanString = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_vuna_ueq_uint c 34 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
  (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)))

else if v_vuna_ueq_uint c 10 then C_Vuna_dBase_dErr ("unterminated string literal")
else if v_vuna_ueq_uint c 92 then v_Vuna_dLexer_dscanEscape (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) acc
else v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 107 1 ("no matching clause for Vuna.Lexer.scanString")
and v_Vuna_dLexer_dscanEscape = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_vuna_ueq_uint c 110 then v_Vuna_dLexer_dscanString
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((10) :: (acc))
else if v_vuna_ueq_uint c 116 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((9) :: (acc))
else if v_vuna_ueq_uint c 114 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((13) :: (acc))
else if v_vuna_ueq_uint c 34 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((34) :: (acc))
else if v_vuna_ueq_uint c 92 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((92) :: (acc))
else if v_vuna_ueq_uint c 39 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) ((39) :: (acc))
else C_Vuna_dBase_dErr ("unknown escape sequence")
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 114 1 ("no matching clause for Vuna.Lexer.scanEscape")

let rec v_Vuna_dBase_dmemChar = fun c chars -> (match chars with
  | [] -> false
  | (x) :: (rest) -> if v_vuna_ueq_uint x c then true
  else v_Vuna_dBase_dmemChar c rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 114 3 ("case pattern match failure"))

let v_Vuna_dBase_dcontainsDot = fun s -> v_Vuna_dBase_dmemChar 46 (bi_str_unpack s)

let v_Vuna_dLoader_dcheckBinder = fun label name -> if v_Vuna_dBase_dcontainsDot name then C_Vuna_dBase_dErr
((let vuna_cat0' = (label) in
    (let vuna_cat1' = (": invalid variable name ") in
      (let vuna_cat2' = (name) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
else C_Vuna_dBase_dOk (name)

let rec v_Vuna_dBase_dstartsWithChars = fun a0 a1 -> match (a0, a1) with
  | ([], text) -> true
  | ((p) :: (prest), text) -> (match text with
  | [] -> false
  | (t) :: (trest) -> if v_vuna_ueq_uint p t then v_Vuna_dBase_dstartsWithChars prest trest
  else false
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 127 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 125 1 ("no matching clause for Vuna.Base.startsWithChars")

let v_Vuna_dBase_dstartsWith = fun prefix text -> v_Vuna_dBase_dstartsWithChars (bi_str_unpack prefix)
(bi_str_unpack text)

let v_Vuna_dLoader_disPrivateName = fun name -> v_Vuna_dBase_dstartsWith "_" name

let rec v_Vuna_dBase_dsplitCharsOnDot = fun chars acc seg -> (match chars with
  | [] -> v_Vuna_dBase_dreverse ((bi_str_pack (v_Vuna_dBase_dreverse seg)) :: (acc))
  | (c) :: (rest) -> if v_vuna_ueq_uint c 46 then v_Vuna_dBase_dsplitCharsOnDot rest ((bi_str_pack (v_Vuna_dBase_dreverse
        seg)) :: (acc)) []
  else v_Vuna_dBase_dsplitCharsOnDot rest acc ((c) :: (seg))
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 136 3 ("case pattern match failure"))

let v_Vuna_dBase_dsplitOnDot = fun s -> v_Vuna_dBase_dsplitCharsOnDot (bi_str_unpack s) [] []

let v_Vuna_dTypedCodegen_dlastName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> base
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 16 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dlastSeg = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> base
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1593 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dmodulePrefixOf = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> v_Vuna_dBase_djoinDots rev
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1597 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dtyOuterName = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_Vuna_dTypecheck_dmodulePrefixOf n
  | _ -> ""
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2170 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dshortTyName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> base
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2551 3 ("case pattern match failure"))

let v_Vuna_dCodegen_dlastSegment = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (before, after) -> after
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 22 3 ("case pattern match failure"))

let v_Vuna_dCodegen_dctorShort = fun c -> v_Vuna_dCodegen_dlastSegment (v_Vuna_dAst_dctorName c)

let v_Vuna_dEval_ddisplayName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> base
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 492 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 496 3 ("case pattern match failure"))
and v_Vuna_dEval_dshowValues = fun a0 -> match a0 with
  | ([]) -> ""
  | ((v) :: ([])) -> v_Vuna_dEval_dshowValue v
  | ((v) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dEval_dshowValue v) in
  (let vuna_cat1' = (" ") in
    (let vuna_cat2' = (v_Vuna_dEval_dshowValues rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 505 1 ("no matching clause for Vuna.Eval.showValues")

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
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 208 1 ("no matching clause for Vuna.Loader.collectModuleFiles")

let v_Vuna_dLoader_dfindModuleFile = fun roots name -> (match v_Vuna_dLoader_dcollectModuleFiles roots
  name [] with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("module ") in
      (let vuna_cat1' = (name) in
        (let vuna_cat2' = (" not found (roots: ") in
          (let vuna_cat3' = (v_Vuna_dLoader_d_ujoinNames roots) in
            (let vuna_cat4' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | (path) :: ([]) -> C_Vuna_dBase_dOk (path)
  | paths -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("ambiguous module ") in
      (let vuna_cat1' = (name) in
        (let vuna_cat2' = (" (found in: ") in
          (let vuna_cat3' = (v_Vuna_dLoader_d_ujoinNames paths) in
            (let vuna_cat4' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 215 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dprefixLen2 = fun a0 a1 -> match (a0, a1) with
  | ([], _) -> 0
  | (_, []) -> 0
  | ((x) :: (xs), (y) :: (ys)) -> if v_vuna_ueq_uint x y then bi_add 1 (v_Vuna_dBase_dprefixLen2 xs ys)

else 0
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 178 1 ("no matching clause for Vuna.Base.prefixLen2")

let v_vuna_uneq_uint = fun a b -> bi_neq_int a b

let v_vuna_ueq_ubool = fun a b -> bi_eq_bool a b

let v_vuna_uneq_ubool = fun a b -> bi_neq_bool a b

let v_vuna_ueq_ustr = fun a b -> bi_eq_str a b

let v_Lint_dtokIsKw = fun tok key -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> v_vuna_ueq_ustr x key
  | _ -> false
  | _ -> vuna_fail "app/Lint.vuna" 194 3 ("case pattern match failure"))

let v_Lint_dtokIsSym = fun tok sym -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> v_vuna_ueq_ustr x sym
  | _ -> false
  | _ -> vuna_fail "app/Lint.vuna" 199 3 ("case pattern match failure"))

let rec v_Lint_dhasSym = fun a0 a1 -> match (a0, a1) with
  | ([], sym) -> false
  | ((t) :: (rest), sym) -> if v_Lint_dtokIsSym t sym then true
else v_Lint_dhasSym rest sym
  | _ -> vuna_fail "app/Lint.vuna" 240 1 ("no matching clause for Lint.hasSym")

let rec v_Lint_dsplitAtSymGo = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (sym, [], acc) -> C_Vuna_dBase_dNothing
  | (sym, (t) :: (rest), acc) -> if v_Lint_dtokIsSym t sym then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair
  (v_Vuna_dBase_dreverse acc, C_Vuna_dBase_dPair (t, rest)))
else v_Lint_dsplitAtSymGo sym rest ((t) :: (acc))
  | _ -> vuna_fail "app/Lint.vuna" 250 1 ("no matching clause for Lint.splitAtSymGo")

let v_Lint_dsplitAtSym = fun sym toks -> v_Lint_dsplitAtSymGo sym toks []

let rec v_Lint_dcountIdent = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> 0
  | (name, (t) :: (rest)) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (other) -> if v_vuna_ueq_ustr other name then bi_add 1 (v_Lint_dcountIdent name
    rest)
  else v_Lint_dcountIdent name rest
  | C_Vuna_dBase_dNothing -> v_Lint_dcountIdent name rest
  | _ -> vuna_fail "app/Lint.vuna" 259 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 256 1 ("no matching clause for Lint.countIdent")

let v_Lint_dstartsWithIf = fun toks -> (match toks with
  | (t) :: (rest) -> v_Lint_dtokIsKw t "if"
  | [] -> false
  | _ -> vuna_fail "app/Lint.vuna" 297 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "app/Lint.vuna" 403 17 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 400 13 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 397 9 ("case pattern match failure"))
  else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 393 3 ("case pattern match failure"))

let v_Lint_dclauseHeadPatterns = fun toks -> (match v_Lint_dsplitAtSym "=" toks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (before, C_Vuna_dBase_dPair (arrow, after))) -> if v_Lint_disNilList
  after then (match before with
  | [] -> C_Vuna_dBase_dNothing
  | (fn) :: (rest) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (v_Lint_dtokenText fn, rest))
  | _ -> vuna_fail "app/Lint.vuna" 512 9 ("case pattern match failure"))
  else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 508 3 ("case pattern match failure"))

let v_Lint_daltHeadPatterns = fun toks -> (match v_Lint_dsplitAtSym "=>" toks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (before, C_Vuna_dBase_dPair (arrow, after))) -> if v_Lint_disNilList
  after then C_Vuna_dBase_dJust (before)
  else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 518 3 ("case pattern match failure"))

let rec v_Lint_dtokenOfVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (t) :: (rest)) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (other) -> if v_vuna_ueq_ustr other name then C_Vuna_dBase_dJust (t)
  else v_Lint_dtokenOfVar name rest
  | C_Vuna_dBase_dNothing -> v_Lint_dtokenOfVar name rest
  | _ -> vuna_fail "app/Lint.vuna" 639 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 636 1 ("no matching clause for Lint.tokenOfVar")

let rec v_Lint_dremoveName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then v_Lint_dremoveName name rest
else (x) :: (v_Lint_dremoveName name rest)
  | _ -> vuna_fail "app/Lint.vuna" 643 1 ("no matching clause for Lint.removeName")

let v_Lint_denclosingPatterns = fun kind headToks -> if v_vuna_ueq_ustr kind "clause" then (match v_Lint_dclauseHeadPatterns
  headToks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (fnName, pats)) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (fnName,
      pats))
  | _ -> vuna_fail "app/Lint.vuna" 650 5 ("case pattern match failure"))
else (match v_Lint_daltHeadPatterns headToks with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (pats) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair ("", pats))
  | _ -> vuna_fail "app/Lint.vuna" 655 5 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disBoolName = fun name -> v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dlastName name)
"Bool"

let v_Vuna_dTypedCodegen_disListName = fun name -> v_vuna_ueq_ustr (v_Vuna_dTypedCodegen_dlastName name)
"List"

let rec v_Vuna_dTypedCodegen_dnonSpecialData = fun decls -> (match v_Vuna_dTypedCodegen_ddataDecls decls
  with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _, _) -> if (if (v_Vuna_dTypedCodegen_disBoolName name) then
      true
      else (v_Vuna_dTypedCodegen_disListName name)) then v_Vuna_dTypedCodegen_dnonSpecialData rest
    else (d) :: (v_Vuna_dTypedCodegen_dnonSpecialData rest)
  | _ -> v_Vuna_dTypedCodegen_dnonSpecialData rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 61 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 58 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dlookupData = fun decls name -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dn, ps, cs, _, _) -> if v_vuna_ueq_ustr dn name then C_Vuna_dBase_dJust (d)
    else v_Vuna_dTypedCodegen_dlookupData rest name
  | _ -> v_Vuna_dTypedCodegen_dlookupData rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 71 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 68 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dshowForTy = fun decls ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> C_Vuna_dBase_dOk ("(fun _ -> \"<value>\")")
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dBase_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dTypecheck_dTCon (name, args) -> if v_vuna_ueq_ustr name "Int" then C_Vuna_dBase_dOk ("string_of_int")

  else if v_vuna_ueq_ustr name "String" then C_Vuna_dBase_dOk ("show_vstring")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("show_vbool")
  else if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForTy decls a) (fun sa -> C_Vuna_dBase_dOk
      ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (")
          in
          (let vuna_cat1' = (sa) in
            (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: main List type must have one argument")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 202 9 ("case pattern match failure"))
  else v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForTy decls)
    args) (fun ss -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
          (let vuna_cat2' = (" ") in
            (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 194 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfunSpan = fun decls name -> (match decls with
  | [] -> v_Vuna_dTypedCodegen_dnoLocSpan
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then sp
    else v_Vuna_dTypedCodegen_dfunSpan rest name
  | _ -> v_Vuna_dTypedCodegen_dfunSpan rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 618 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 615 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dneighborsOf = fun adj name -> (match adj with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, ns)) :: (rest) -> if v_vuna_ueq_ustr n name then ns
  else v_Vuna_dTypedCodegen_dneighborsOf rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 673 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dgenericMethodName = fun tr key -> (match tr with
  | "Eq" -> if v_vuna_ueq_ustr key "neq" then C_Vuna_dBase_dJust ("vuna_neq_generic")
  else C_Vuna_dBase_dJust ("vuna_eq_generic")
  | "Ord" -> (match key with
  | "lt" -> C_Vuna_dBase_dJust ("vuna_lt_generic")
  | "le" -> C_Vuna_dBase_dJust ("vuna_le_generic")
  | "gt" -> C_Vuna_dBase_dJust ("vuna_gt_generic")
  | _ -> C_Vuna_dBase_dJust ("vuna_ge_generic")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 472 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 469 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dhasNeed = fun a0 a1 -> match (a0, a1) with
  | (key, []) -> false
  | (key, (C_Vuna_dBase_dPair (tr, ty)) :: (rest)) -> if v_vuna_ueq_ustr ((let vuna_cat0' = (tr) in
    (let vuna_cat1' = ("|") in
      (let vuna_cat2' = (v_Vuna_dTypecheck_dshowTy ty) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) key then true
else v_Vuna_dTypecheck_dhasNeed key rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 540 1 ("no matching clause for Vuna.Typecheck.hasNeed")

let v_Vuna_dTypecheck_daddNeed = fun tr ty needs -> (let key = (let vuna_cat0' = (tr) in
    (let vuna_cat1' = ("|") in
      (let vuna_cat2' = (v_Vuna_dTypecheck_dshowTy ty) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in
  if v_Vuna_dTypecheck_dhasNeed key needs then needs
  else v_Vuna_dBase_dappend needs ((C_Vuna_dBase_dPair (tr, ty)) :: ([])))

let rec v_Vuna_dTypecheck_dfindDictParam = fun params tr v key -> (match params with
  | [] -> C_Vuna_dBase_dNothing
  | (p) :: (rest) -> if (if ((if (v_vuna_ueq_ustr (v_Vuna_dTypecheck_ddictParamTrait p) tr) then (v_vuna_ueq_uint
          (v_Vuna_dTypecheck_ddictParamVar p) v)
        else false)) then (v_vuna_ueq_ustr (v_Vuna_dTypecheck_ddictParamKey p) key)
    else false) then C_Vuna_dBase_dJust (v_Vuna_dTypecheck_ddictParamName p)
  else v_Vuna_dTypecheck_dfindDictParam rest tr v key
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 625 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dlookupRecord = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dTypecheck_dRecordInfo (rname, params, fields, derivings)) :: (rest)) -> if v_vuna_ueq_ustr
rname name then C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dRecordInfo (rname, params, fields, derivings))

else v_Vuna_dTypecheck_dlookupRecord name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 880 1 ("no matching clause for Vuna.Typecheck.lookupRecord")

let rec v_Vuna_dTypecheck_dlookupProvided = fun a0 a1 -> match (a0, a1) with
  | (fname, []) -> C_Vuna_dBase_dNothing
  | (fname, (C_Vuna_dBase_dPair (n, e)) :: (rest)) -> if v_vuna_ueq_ustr n fname then C_Vuna_dBase_dJust
(e)
else v_Vuna_dTypecheck_dlookupProvided fname rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 910 1 ("no matching clause for Vuna.Typecheck.lookupProvided")

let rec v_Vuna_dTypecheck_dhasDuplicateFieldNames = fun a0 -> match a0 with
  | ([]) -> false
  | ((C_Vuna_dBase_dPair (n, e)) :: (rest)) -> (match v_Vuna_dTypecheck_dlookupProvided n rest with
  | C_Vuna_dBase_dJust (_) -> true
  | C_Vuna_dBase_dNothing -> v_Vuna_dTypecheck_dhasDuplicateFieldNames rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 919 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 916 1 ("no matching clause for Vuna.Typecheck.hasDuplicateFieldNames")

let rec v_Vuna_dTypecheck_dlookupScheme = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, sch)) :: (rest)) -> if v_vuna_ueq_ustr n name then C_Vuna_dBase_dJust
(sch)
else v_Vuna_dTypecheck_dlookupScheme name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1100 1 ("no matching clause for Vuna.Typecheck.lookupScheme")

let rec v_Vuna_dTypecheck_dreplaceElab = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clauses, []) -> []
  | (name, clauses, (C_Vuna_dBase_dPair (n, old)) :: (rest)) -> if v_vuna_ueq_ustr n name then (C_Vuna_dBase_dPair
  (n, clauses)) :: (rest)
else (C_Vuna_dBase_dPair (n, old)) :: (v_Vuna_dTypecheck_dreplaceElab name clauses rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1571 1 ("no matching clause for Vuna.Typecheck.replaceElab")

let rec v_Vuna_dTypecheck_dlookupTraitDecl = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dTypecheck_dTraitDecl (n, p, ms)) :: (rest)) -> if v_vuna_ueq_ustr n name then C_Vuna_dBase_dJust
(C_Vuna_dTypecheck_dTraitDecl (n, p, ms))
else v_Vuna_dTypecheck_dlookupTraitDecl name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1669 1 ("no matching clause for Vuna.Typecheck.lookupTraitDecl")

let v_Vuna_dTypecheck_dtraitMethodKeys = fun tctx tr -> (match v_Vuna_dTypecheck_dlookupTraitDecl tr (v_Vuna_dTypecheck_dtraitCtxDecls
    tctx) with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (td) -> v_Vuna_dBase_dmap v_Vuna_dTypecheck_dmethodInfoName (v_Vuna_dTypecheck_dtraitDeclMethods
    td)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 526 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_ddictParamsForGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (tctx, [], acc, idx) -> v_Vuna_dBase_dreverse acc
  | (tctx, (C_Vuna_dBase_dPair (tr, ty)) :: (rest), acc, idx) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (v) -> v_Vuna_dTypecheck_ddictParamsForMethods tctx tr v (v_Vuna_dTypecheck_dtraitMethodKeys
    tctx tr) acc idx rest
  | other -> v_Vuna_dTypecheck_ddictParamsForGo tctx rest acc idx
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 612 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 609 1 ("no matching clause for Vuna.Typecheck.dictParamsForGo")
and v_Vuna_dTypecheck_ddictParamsForMethods = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5,
  a6) with
  | (tctx, tr, v, [], acc, idx, rest) -> v_Vuna_dTypecheck_ddictParamsForGo tctx rest acc idx
  | (tctx, tr, v, (key) :: (keys), acc, idx, rest) -> (let pname = (("vuna_dict") ^ (bi_str_from_int idx))
  in
  v_Vuna_dTypecheck_ddictParamsForMethods tctx tr v keys ((C_Vuna_dTypecheck_dDictParam (tr, v, key,
        pname)) :: (acc)) (bi_add idx 1) rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 616 1 ("no matching clause for Vuna.Typecheck.dictParamsForMethods")

let v_Vuna_dTypecheck_ddictParamsFor = fun tctx needs -> v_Vuna_dTypecheck_ddictParamsForGo tctx needs
[] 0

let rec v_Vuna_dTypecheck_dlookupMethodRef = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dTypecheck_dTraitMethodRef (key, tr, sch, pid)) :: (rest)) -> if v_vuna_ueq_ustr key
name then C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dTraitMethodRef (key, tr, sch, pid))
else v_Vuna_dTypecheck_dlookupMethodRef name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1674 1 ("no matching clause for Vuna.Typecheck.lookupMethodRef")

let rec v_Vuna_dTypecheck_dlookupImpl = fun a0 a1 -> match (a0, a1) with
  | (meth, []) -> C_Vuna_dBase_dNothing
  | (meth, (C_Vuna_dBase_dPair (m, fn)) :: (rest)) -> if v_vuna_ueq_ustr m meth then C_Vuna_dBase_dJust
(fn)
else v_Vuna_dTypecheck_dlookupImpl meth rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1679 1 ("no matching clause for Vuna.Typecheck.lookupImpl")

let rec v_Vuna_dTypecheck_dlookupNamedInst = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (inst) :: (rest)) -> (match v_Vuna_dTypecheck_dinstNameOf inst with
  | C_Vuna_dBase_dJust (n) -> if v_vuna_ueq_ustr n name then C_Vuna_dBase_dJust (inst)
  else v_Vuna_dTypecheck_dlookupNamedInst name rest
  | C_Vuna_dBase_dNothing -> v_Vuna_dTypecheck_dlookupNamedInst name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1687 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1684 1 ("no matching clause for Vuna.Typecheck.lookupNamedInst")

let rec v_Vuna_dTypecheck_dtyMatchesPattern = fun pattern ty -> (match pattern with
  | C_Vuna_dTypecheck_dTVar (i) -> true
  | C_Vuna_dTypecheck_dTCon (n, ps) -> (match ty with
  | C_Vuna_dTypecheck_dTCon (m, args) -> (if (v_vuna_ueq_ustr n m) then (v_Vuna_dTypecheck_dtyListMatches
        ps args)
      else false)
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1695 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTFun (a, b) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (x, y) -> (if (v_Vuna_dTypecheck_dtyMatchesPattern a x) then (v_Vuna_dTypecheck_dtyMatchesPattern
        b y)
      else false)
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1699 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1692 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dtyListMatches = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> true
  | ((p) :: (ps), (t) :: (ts)) -> if v_Vuna_dTypecheck_dtyMatchesPattern p t then v_Vuna_dTypecheck_dtyListMatches
ps ts
else false
  | (_, _) -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1703 1 ("no matching clause for Vuna.Typecheck.tyListMatches")

let rec v_Vuna_dTypecheck_dfindDefaultInst = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (tr, ty, []) -> C_Vuna_dBase_dNothing
  | (tr, ty, (inst) :: (rest)) -> (match v_Vuna_dTypecheck_dinstNameOf inst with
  | C_Vuna_dBase_dNothing -> if (if (v_vuna_ueq_ustr (v_Vuna_dTypecheck_dinstTraitName inst) tr) then
    (v_Vuna_dTypecheck_dtyMatchesPattern (v_Vuna_dTypecheck_dinstHeadTy inst) ty)
    else false) then C_Vuna_dBase_dJust (inst)
  else v_Vuna_dTypecheck_dfindDefaultInst tr ty rest
  | C_Vuna_dBase_dJust (_) -> v_Vuna_dTypecheck_dfindDefaultInst tr ty rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1713 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1710 1 ("no matching clause for Vuna.Typecheck.findDefaultInst")

let rec v_Vuna_dTypecheck_dtyEqual = fun a b -> (match a with
  | C_Vuna_dTypecheck_dTVar (i) -> (match b with
  | C_Vuna_dTypecheck_dTVar (j) -> v_vuna_ueq_uint i j
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1722 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (n, xs) -> (match b with
  | C_Vuna_dTypecheck_dTCon (m, ys) -> (if (v_vuna_ueq_ustr n m) then (v_Vuna_dTypecheck_dtyListEqual
        xs ys)
      else false)
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1726 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTFun (x, y) -> (match b with
  | C_Vuna_dTypecheck_dTFun (x2, y2) -> (if (v_Vuna_dTypecheck_dtyEqual x x2) then (v_Vuna_dTypecheck_dtyEqual
        y y2)
      else false)
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1730 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1720 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dtyListEqual = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> true
  | ((a) :: (xs), (b) :: (ys)) -> (if (v_Vuna_dTypecheck_dtyEqual a b) then (v_Vuna_dTypecheck_dtyListEqual
    xs ys)
  else false)
  | (_, _) -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1734 1 ("no matching clause for Vuna.Typecheck.tyListEqual")

let v_Vuna_dTypecheck_dmethodRefForName = fun name refs -> (match v_Vuna_dTypecheck_dlookupMethodRef name
  refs with
  | C_Vuna_dBase_dJust (r) -> C_Vuna_dBase_dJust (r)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_doperatorMethod name with
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (tr, key)) -> v_Vuna_dTypecheck_dlookupMethodRef key refs
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1812 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1809 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dlookupDataShape = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (sh) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dTypecheck_dshapeName sh) name then C_Vuna_dBase_dJust
(sh)
else v_Vuna_dTypecheck_dlookupDataShape name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1881 1 ("no matching clause for Vuna.Typecheck.lookupDataShape")

let rec v_Vuna_dTypecheck_dmethodClauses = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then (C_Vuna_dBase_dPair (pats,
      body)) :: (v_Vuna_dTypecheck_dmethodClauses name rest)
  else v_Vuna_dTypecheck_dmethodClauses name rest
  | _ -> v_Vuna_dTypecheck_dmethodClauses name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2098 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2095 1 ("no matching clause for Vuna.Typecheck.methodClauses")

let rec v_Vuna_dTypecheck_dsubstTyParam = fun paramName headTy ty -> (match ty with
  | C_Vuna_dAst_dEVar (n, sp) -> if v_vuna_ueq_ustr n paramName then headTy
  else C_Vuna_dAst_dEVar (n, sp)
  | C_Vuna_dAst_dEApp (f, args, sp) -> C_Vuna_dAst_dEApp (v_Vuna_dTypecheck_dsubstTyParam paramName headTy
    f, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dsubstTyParam paramName headTy) args, sp)
  | _ -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2103 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_disBuiltinTypeName = fun name -> (if ((if ((if (v_vuna_ueq_ustr name "Int") then
          true
          else (v_vuna_ueq_ustr name "String"))) then true
      else (v_vuna_ueq_ustr name "Bool"))) then true
  else (v_vuna_ueq_ustr name "List"))

let rec v_Vuna_dTypecheck_dctorNamesOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dAst_dDData (dn, params, ctors, _, _) -> if v_vuna_ueq_ustr dn name then v_Vuna_dBase_dmap
  v_Vuna_dAst_dctorName ctors
  else v_Vuna_dTypecheck_dctorNamesOf rest name
  | _ -> v_Vuna_dTypecheck_dctorNamesOf rest name
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2479 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2477 1 ("no matching clause for Vuna.Typecheck.ctorNamesOf")

let v_Vuna_dTypecheck_dtyCtorNames = fun decls ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (name, _) -> v_Vuna_dTypecheck_dctorNamesOf decls name
  | _ -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2473 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dpatCoversCtor = fun c p -> (match p with
  | C_Vuna_dAst_dPVar (n, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | C_Vuna_dAst_dPCon (pn, subpats, _) -> v_vuna_ueq_ustr pn c
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2493 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dctorCovered = fun a0 a1 -> match (a0, a1) with
  | (c, []) -> false
  | (c, (p) :: (rest)) -> if v_Vuna_dTypecheck_dpatCoversCtor c p then true
else v_Vuna_dTypecheck_dctorCovered c rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2488 1 ("no matching clause for Vuna.Typecheck.ctorCovered")

let rec v_Vuna_dTypecheck_dallCtorsCovered = fun a0 a1 -> match (a0, a1) with
  | (pats, []) -> true
  | (pats, (c) :: (rest)) -> if v_Vuna_dTypecheck_dctorCovered c pats then v_Vuna_dTypecheck_dallCtorsCovered
pats rest
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2484 1 ("no matching clause for Vuna.Typecheck.allCtorsCovered")

let v_Vuna_dTypecheck_dsubsumes = fun earlier p -> (match earlier with
  | C_Vuna_dAst_dPVar (n, _) -> true
  | C_Vuna_dAst_dPWild (_) -> true
  | C_Vuna_dAst_dPCon (en, subpats, _) -> (match p with
  | C_Vuna_dAst_dPCon (pn, ps2, _) -> v_vuna_ueq_ustr en pn
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2523 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2519 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_danySubsumes = fun a0 a1 -> match (a0, a1) with
  | (p, []) -> false
  | (p, (earlier) :: (rest)) -> if v_Vuna_dTypecheck_dsubsumes earlier p then true
else v_Vuna_dTypecheck_danySubsumes p rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2514 1 ("no matching clause for Vuna.Typecheck.anySubsumes")

let rec v_Vuna_dTypecheck_dredWarn = fun a0 a1 -> match (a0, a1) with
  | (prefix, []) -> []
  | (prefix, (p) :: (rest)) -> (let more = v_Vuna_dTypecheck_dredWarn (v_Vuna_dBase_dappend prefix ((p)
      :: ([]))) rest in
  if v_Vuna_dTypecheck_danySubsumes p prefix then (((v_Vuna_dBase_dshowSpanLoc (v_Vuna_dAst_dpatSpan
          p)) ^ (": redundant pattern"))) :: (more)
  else more)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2508 1 ("no matching clause for Vuna.Typecheck.redWarn")

let v_Vuna_dTypecheck_dredundantWarnings = fun pats -> v_Vuna_dTypecheck_dredWarn [] pats

let v_Vuna_dTypecheck_dsameBuiltinTy = fun a b -> (let sa = v_Vuna_dTypecheck_dshortTyName a in
  (if ((if (v_vuna_ueq_ustr sa "Bool") then true
        else (v_vuna_ueq_ustr sa "List"))) then (v_vuna_ueq_ustr sa (v_Vuna_dTypecheck_dshortTyName b))

    else false))

let rec v_Vuna_dCodegen_dfieldShowFn = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "Int" then "vuna_show_int"

  else if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "String" then "vuna_show_str"
  else if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "Bool" then "vuna_show_bool"
  else "vuna_show"
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar (name, _) -> (match args with
  | (a) :: ([]) -> if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "List" then (let vuna_cat0'
        = ("(vuna_show_list ") in
        (let vuna_cat1' = (v_Vuna_dCodegen_dfieldShowFn a) in
          (let vuna_cat2' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
      else "vuna_show"
  | _ -> "vuna_show"
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 44 11 ("case pattern match failure"))
  | _ -> "vuna_show"
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 42 7 ("case pattern match failure"))
  | _ -> "vuna_show"
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 35 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dgenFieldShows = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> []
  | ((f) :: (fs), (v) :: (vs)) -> ((let vuna_cat0' = ("(") in
    (let vuna_cat1' = (v_Vuna_dCodegen_dfieldShowFn f) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: (v_Vuna_dCodegen_dgenFieldShows
  fs vs)
  | (_, _) -> []
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 52 1 ("no matching clause for Vuna.Codegen.genFieldShows")

let rec v_Vuna_dCodegen_dfindBuiltin = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) :: (rest)) -> if v_vuna_ueq_ustr
vname name then C_Vuna_dBase_dJust (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body))
else v_Vuna_dCodegen_dfindBuiltin name rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 158 1 ("no matching clause for Vuna.Codegen.findBuiltin")

let rec v_Vuna_dCodegen_daddClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clause, []) -> (C_Vuna_dBase_dPair (name, (clause) :: ([]))) :: ([])
  | (name, clause, (C_Vuna_dBase_dPair (gname, clauses)) :: (rest)) -> if v_vuna_ueq_ustr gname name then
(C_Vuna_dBase_dPair (gname, v_Vuna_dBase_dappend clauses ((clause) :: ([])))) :: (rest)
else (C_Vuna_dBase_dPair (gname, clauses)) :: (v_Vuna_dCodegen_daddClause name clause rest)
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 364 1 ("no matching clause for Vuna.Codegen.addClause")

let rec v_Vuna_dCodegen_dgroupFunctionsLoop = fun a0 a1 -> match (a0, a1) with
  | ([], groups) -> groups
  | ((d) :: (rest), groups) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> v_Vuna_dCodegen_dgroupFunctionsLoop rest (v_Vuna_dCodegen_daddClause
    name (C_Vuna_dBase_dPair (pats, body)) groups)
  | _ -> v_Vuna_dCodegen_dgroupFunctionsLoop rest groups
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 359 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 357 1 ("no matching clause for Vuna.Codegen.groupFunctionsLoop")

let v_Vuna_dCodegen_dgroupFunctions = fun decls -> v_Vuna_dCodegen_dgroupFunctionsLoop decls []

let rec v_Vuna_dEval_dmatchPatterns = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> C_Vuna_dBase_dJust ([])
  | ((p) :: (ps), (v) :: (vs)) -> (match v_Vuna_dEval_dmatchPattern p v with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs) -> (match v_Vuna_dEval_dmatchPatterns ps vs with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs2) -> C_Vuna_dBase_dJust (v_Vuna_dBase_dappend bs bs2)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 220 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 217 3 ("case pattern match failure"))
  | (_, _) -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 215 1 ("no matching clause for Vuna.Eval.matchPatterns")
and v_Vuna_dEval_dmatchPattern = fun p v -> (match p with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dBase_dJust ([])
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dBase_dJust ((C_Vuna_dBase_dPair (name, v)) :: ([]))
  | C_Vuna_dAst_dPInt (n, _) -> (match v with
  | C_Vuna_dEval_dVInt (m) -> if v_vuna_ueq_uint n m then C_Vuna_dBase_dJust ([])
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 230 7 ("case pattern match failure"))
  | C_Vuna_dAst_dPStr (s, _) -> (match v with
  | C_Vuna_dEval_dVStr (t) -> if v_vuna_ueq_ustr s t then C_Vuna_dBase_dJust ([])
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 234 7 ("case pattern match failure"))
  | C_Vuna_dAst_dPCon (name, pats, _) -> (match v with
  | C_Vuna_dEval_dVCon (vname, vargs) -> if (if (v_vuna_ueq_ustr name vname) then (v_vuna_ueq_uint (v_Vuna_dBase_dlength
          pats) (v_Vuna_dBase_dlength vargs))
      else false) then v_Vuna_dEval_dmatchPatterns pats vargs
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 238 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 226 3 ("case pattern match failure"))

let v_Vuna_dEval_deqBuiltin = fun sp args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (v_vuna_ueq_uint a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (v_vuna_ueq_ustr a b))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for =="
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 303 3 ("case pattern match failure"))

let v_Vuna_dLoader_disGlobalCtor = fun name -> (if ((if ((if (v_vuna_ueq_ustr name "True") then true
          else (v_vuna_ueq_ustr name "False"))) then true
      else (v_vuna_ueq_ustr name "Cons"))) then true
  else (v_vuna_ueq_ustr name "Nil"))

let v_Vuna_dLoader_dmangle = fun prefix name -> if v_vuna_ueq_ustr prefix "" then name
else (let vuna_cat0' = (prefix) in
  (let vuna_cat1' = (".") in
    (let vuna_cat2' = (name) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dLoader_dfindImportPrefix = fun imports prefix -> (match imports with
  | [] -> C_Vuna_dBase_dNothing
  | (imp) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dLoader_dimportName imp) prefix then C_Vuna_dBase_dJust
  (v_Vuna_dLoader_dimportName imp)
  else (match v_Vuna_dLoader_dimportAlias imp with
  | C_Vuna_dBase_dJust (alias) -> if v_vuna_ueq_ustr alias prefix then C_Vuna_dBase_dJust (v_Vuna_dLoader_dimportName
      imp)
    else v_Vuna_dLoader_dfindImportPrefix rest prefix
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dfindImportPrefix rest prefix
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 111 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 106 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dsameTargetRest = fun e pairs -> (match pairs with
  | [] -> true
  | (C_Vuna_dBase_dPair (m, e2)) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dLoader_dentryTarget e) (v_Vuna_dLoader_dentryTarget
    e2) then v_Vuna_dLoader_dsameTargetRest e rest
  else false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 193 3 ("case pattern match failure"))

let v_Vuna_dLoader_dunifyEntryPairs = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (label, kindLabel, name, []) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
    (let vuna_cat1' = (": unknown ") in
      (let vuna_cat2' = (kindLabel) in
        (let vuna_cat3' = (" ") in
          (let vuna_cat4' = (name) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | (label, kindLabel, name, (p) :: (rest)) -> if v_Vuna_dLoader_dsameTargetRest (v_Vuna_dBase_dsecondOf
  p) rest then C_Vuna_dBase_dOk (p)
else C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
    (let vuna_cat1' = (": ambiguous ") in
      (let vuna_cat2' = (kindLabel) in
        (let vuna_cat3' = (" ") in
          (let vuna_cat4' = (name) in
            (let vuna_cat5' = (" (imported from ") in
              (let vuna_cat6' = (v_Vuna_dLoader_d_ujoinNames (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
                    ((p) :: (rest)))) in
                (let vuna_cat7' = ("); qualify it") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                  vuna_cat6'; vuna_cat7'])))))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 197 1 ("no matching clause for Vuna.Loader.unifyEntryPairs")

let rec v_Vuna_dLoader_dfindModule = fun modules name -> (match modules with
  | [] -> C_Vuna_dBase_dNothing
  | (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) :: (rest) -> if v_vuna_ueq_ustr mname name
  then C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports))
  else v_Vuna_dLoader_dfindModule rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 221 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmoduleDecls = fun modules name -> (match v_Vuna_dLoader_dfindModule modules name with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) -> decls
  | C_Vuna_dBase_dNothing -> []
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 121 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmoduleCtors = fun modules name -> v_Vuna_dAst_dctorsOf (v_Vuna_dLoader_dmoduleDecls
  modules name)

let v_Vuna_dLoader_dexportsOf = fun modules name -> (match v_Vuna_dLoader_dfindModule modules name with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) -> exports
  | C_Vuna_dBase_dNothing -> []
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 128 3 ("case pattern match failure"))

let v_Vuna_dLoader_disBuiltinTraitName = fun name -> (if ((if (v_vuna_ueq_ustr name "Show") then true

      else (v_vuna_ueq_ustr name "Eq"))) then true
  else (v_vuna_ueq_ustr name "Ord"))

let v_Vuna_dLoader_disPreludeTraitMethod = fun name -> (if ((if ((if ((if ((if ((if (v_vuna_ueq_ustr name
                        "show") then true
                      else (v_vuna_ueq_ustr name "eq"))) then true
                  else (v_vuna_ueq_ustr name "neq"))) then true
              else (v_vuna_ueq_ustr name "lt"))) then true
          else (v_vuna_ueq_ustr name "le"))) then true
      else (v_vuna_ueq_ustr name "gt"))) then true
  else (v_vuna_ueq_ustr name "ge"))

let v_Vuna_dLoader_dcheckTopName = fun label name -> if v_vuna_ueq_ustr name "_" then C_Vuna_dBase_dErr
(((label) ^ (": invalid top-level name _ (bare _ is reserved)")))
else if v_Vuna_dBase_dcontainsDot name then C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
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

let v_Vuna_dLoader_dresolveInstanceName = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (label, prefix, C_Vuna_dBase_dNothing) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (v_Vuna_dLoader_dmangle
    prefix "#default"))
  | (label, prefix, C_Vuna_dBase_dJust (name)) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTopName
  label prefix name) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (n)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 568 1 ("no matching clause for Vuna.Loader.resolveInstanceName")

let rec v_Vuna_dLoader_dfindOwnData = fun name decls -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> if v_vuna_ueq_ustr dname name then C_Vuna_dBase_dJust
    (C_Vuna_dBase_dPair (dname, v_Vuna_dBase_dmap v_Vuna_dAst_dctorName ctors))
    else v_Vuna_dLoader_dfindOwnData name rest
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_vuna_ueq_ustr dname name then
    C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (dname, (dname) :: ([])))
    else v_Vuna_dLoader_dfindOwnData name rest
  | C_Vuna_dAst_dDTrait (tname, params, methods, sp) -> if v_vuna_ueq_ustr tname name then C_Vuna_dBase_dJust
    (C_Vuna_dBase_dPair (tname, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf methods))
    else v_Vuna_dLoader_dfindOwnData name rest
  | _ -> v_Vuna_dLoader_dfindOwnData name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 615 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 612 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dfindOwnFn = fun name decls -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then C_Vuna_dBase_dJust (name)

    else v_Vuna_dLoader_dfindOwnFn name rest
  | C_Vuna_dAst_dDSig (n, ty, sp) -> if v_vuna_ueq_ustr n name then C_Vuna_dBase_dJust (name)
    else v_Vuna_dLoader_dfindOwnFn name rest
  | _ -> v_Vuna_dLoader_dfindOwnFn name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 628 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 625 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dfindCtorNamed = fun name ctors -> (match ctors with
  | [] -> C_Vuna_dBase_dNothing
  | (c) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dAst_dctorName c) name then C_Vuna_dBase_dJust (v_Vuna_dAst_dctorName
    c)
  else v_Vuna_dLoader_dfindCtorNamed name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 634 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dfindOwnInstanceName = fun name decls -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> if isDefault then v_Vuna_dLoader_dfindOwnInstanceName
    name rest
    else (match iname with
  | C_Vuna_dBase_dJust (n) -> if v_vuna_ueq_ustr n name then C_Vuna_dBase_dJust (n)
      else v_Vuna_dLoader_dfindOwnInstanceName name rest
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dfindOwnInstanceName name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 653 13 ("case pattern match failure"))
  | _ -> v_Vuna_dLoader_dfindOwnInstanceName name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 649 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 646 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_downCtorEntries = fun prefix dname names -> (match names with
  | [] -> []
  | (cname) :: (rest) -> if v_Vuna_dLoader_disPrivateName cname then v_Vuna_dLoader_downCtorEntries prefix
  dname rest
  else (C_Vuna_dLoader_dExportEntry ("ctor", cname, v_Vuna_dLoader_dmangle prefix cname, v_Vuna_dLoader_dmangle
      prefix dname)) :: (v_Vuna_dLoader_downCtorEntries prefix dname rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 676 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dctorEntriesOfType = fun typeTarget entries -> (match entries with
  | [] -> []
  | (e) :: (rest) -> if (if (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryKind e) "ctor") then (v_vuna_ueq_ustr
      (v_Vuna_dLoader_dentryParent e) typeTarget)
    else false) then (e) :: (v_Vuna_dLoader_dctorEntriesOfType typeTarget rest)
  else v_Vuna_dLoader_dctorEntriesOfType typeTarget rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 688 3 ("case pattern match failure"))

let v_Vuna_dLoader_ddeclImplicitExports = fun prefix d -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> if v_Vuna_dLoader_disPrivateName dname
  then []
  else (C_Vuna_dLoader_dExportEntry ("type", dname, v_Vuna_dLoader_dmangle prefix dname, "")) :: (v_Vuna_dLoader_downCtorEntries
    prefix dname (v_Vuna_dBase_dmap v_Vuna_dAst_dctorName ctors))
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_Vuna_dLoader_disPrivateName dname
  then []
  else (C_Vuna_dLoader_dExportEntry ("type", dname, v_Vuna_dLoader_dmangle prefix dname, "")) :: (v_Vuna_dLoader_downCtorEntries
    prefix dname ((dname) :: ([])))
  | C_Vuna_dAst_dDTrait (tname, params, methods, sp) -> if v_Vuna_dLoader_disPrivateName tname then []

  else (C_Vuna_dLoader_dExportEntry ("type", tname, v_Vuna_dLoader_dmangle prefix tname, "")) :: (v_Vuna_dLoader_downCtorEntries
    prefix tname (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf methods))
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> if isDefault then []
  else (match iname with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (name) -> if v_Vuna_dLoader_disPrivateName name then []
    else (C_Vuna_dLoader_dExportEntry ("val", name, v_Vuna_dLoader_dmangle prefix name, "")) :: ([])
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 718 9 ("case pattern match failure"))
  | C_Vuna_dAst_dDSig (name, ty, sp) -> if v_Vuna_dLoader_disPrivateName name then []
  else (C_Vuna_dLoader_dExportEntry ("val", name, v_Vuna_dLoader_dmangle prefix name, "")) :: ([])
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> if v_Vuna_dLoader_disPrivateName name then []
  else (C_Vuna_dLoader_dExportEntry ("val", name, v_Vuna_dLoader_dmangle prefix name, "")) :: ([])
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 696 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_disRecordDecl = fun dname decls -> (match decls with
  | [] -> false
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDRecord (dn, params, fields, derivings, sp) -> if v_vuna_ueq_ustr dn dname then true

    else v_Vuna_dLoader_disRecordDecl dname rest
  | _ -> v_Vuna_dLoader_disRecordDecl dname rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 771 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 768 3 ("case pattern match failure"))

let v_Vuna_dLoader_disRecordTarget = fun modules decls prefix target -> (match v_Vuna_dBase_dsplitLastDot
  (v_Vuna_dBase_dsplitOnDot target) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (let m = v_Vuna_dBase_djoinDots revPrefix in
    if v_vuna_ueq_ustr m prefix then v_Vuna_dLoader_disRecordDecl base decls
    else (match v_Vuna_dLoader_dfindModule modules m with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, dcs, exports)) -> v_Vuna_dLoader_disRecordDecl
      base dcs
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 763 12 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 758 3 ("case pattern match failure"))

let v_Vuna_dLoader_dtypeRefDominates = fun modules decls prefix tr vr -> (match tr with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef (tk, tt, tp)) -> (match vr with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef (vk, vt, vp)) -> if (if ((if (v_vuna_ueq_ustr tk "type")
          then (v_vuna_ueq_ustr vk "ctor")
          else false)) then (v_vuna_ueq_ustr tt vt)
      else false) then v_Vuna_dLoader_disRecordTarget modules decls prefix tt
    else false
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 750 7 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 748 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dhasSamePublicKind = fun e entries -> (match entries with
  | [] -> false
  | (e2) :: (rest) -> if (if (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryKind e) (v_Vuna_dLoader_dentryKind
        e2)) then (v_vuna_ueq_ustr (v_Vuna_dLoader_dentryPublic e) (v_Vuna_dLoader_dentryPublic e2))
    else false) then true
  else v_Vuna_dLoader_dhasSamePublicKind e rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 913 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_ddedupeImplicitExports = fun a0 -> match a0 with
  | ([]) -> []
  | ((e) :: (rest)) -> if v_Vuna_dLoader_dhasSamePublicKind e rest then v_Vuna_dLoader_ddedupeImplicitExports
rest
else (e) :: (v_Vuna_dLoader_ddedupeImplicitExports rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 734 1 ("no matching clause for Vuna.Loader.dedupeImplicitExports")

let v_Vuna_dLoader_dimplicitExports = fun prefix decls -> v_Vuna_dLoader_ddedupeImplicitExports (v_Vuna_dBase_dconcatMap
  (v_Vuna_dLoader_ddeclImplicitExports prefix) decls)

let rec v_Vuna_dLoader_dcheckExportDuplicates = fun a0 a1 -> match (a0, a1) with
  | (prefix, []) -> C_Vuna_dBase_dOk ([])
  | (prefix, (e) :: (rest)) -> if v_Vuna_dLoader_dhasSamePublicKind e rest then C_Vuna_dBase_dErr ((let
    vuna_cat0' = (prefix) in
    (let vuna_cat1' = (": duplicate export ") in
      (let vuna_cat2' = (v_Vuna_dLoader_dentryPublic e) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
else v_Vuna_dLoader_dcheckExportDuplicates prefix rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 919 1 ("no matching clause for Vuna.Loader.checkExportDuplicates")

let v_Vuna_dLoader_dvalidateModuleHeader = fun label hdr -> (match hdr with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk ([])
  | C_Vuna_dBase_dJust (C_Vuna_dAst_dModDecl (declared, hasList, items, sp)) -> if v_vuna_ueq_ustr declared
  label then C_Vuna_dBase_dOk ([])
  else C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": ") in
        (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
          (let vuna_cat3' = (": module name mismatch: source declares ") in
            (let vuna_cat4' = (declared) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 934 3 ("case pattern match failure"))

let v_Vuna_dParser_datSym = fun st s -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> v_vuna_ueq_ustr x s
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 47 3 ("case pattern match failure"))

let v_Vuna_dParser_datKw = fun st k -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> v_vuna_ueq_ustr x k
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 52 3 ("case pattern match failure"))

let v_Vuna_dParser_dexpectSym = fun st s -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> if v_vuna_ueq_ustr x s then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
    (0, v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dErr ((("expected ") ^ (s)))
  | _ -> C_Vuna_dBase_dErr ((("expected ") ^ (s)))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 63 3 ("case pattern match failure"))

let v_Vuna_dParser_dexpectKw = fun st k -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> if v_vuna_ueq_ustr x k then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
    (0, v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dErr ((("expected ") ^ (k)))
  | _ -> C_Vuna_dBase_dErr ((("expected ") ^ (k)))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 68 3 ("case pattern match failure"))

let v_Vuna_dParser_dparseExportItem = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("module"), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
    st "module") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1) (fun name st2 ->
      C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dXModule (name, v_Vuna_dParser_dspanOf st st2),
          st2))))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if v_Vuna_dParser_datSym st1 "(" then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "(") (fun
      _u st2 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st2 "..") (fun _u st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dexpectSym st3 ")") (fun _u st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dXTypeAll
              (name, v_Vuna_dParser_dspanOf st st4), st4)))))
    else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dXBare (name, v_Vuna_dParser_dspanOf st st1),
        st1)))
  | _ -> C_Vuna_dBase_dErr ("expected an export item")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 205 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dparseExportItemsFrom = fun st -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExportItem
  st) (fun item st1 -> if v_Vuna_dParser_datSym st1 "," then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExportItemsFrom
    (v_Vuna_dParser_dadvance st1)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((item) :: (rest),
        st2)))
  else v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 ")") (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ((item) :: ([]), st2))))

let v_Vuna_dParser_dparseExportItems = fun st -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st "(")
(fun _u st1 -> if v_Vuna_dParser_datSym st1 ")" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], v_Vuna_dParser_dadvance
      st1))
  else v_Vuna_dParser_dparseExportItemsFrom st1)

let v_Vuna_dParser_dparseModDecl = fun st -> if v_Vuna_dParser_datKw st "module" then v_Vuna_dBase_dstep
(v_Vuna_dParser_dexpectKw st "module") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st1) (fun name st2 -> if v_Vuna_dParser_datSym st2 "(" then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExportItems
      st2) (fun items st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st3 "where") (fun _u st4 ->
        C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dJust (C_Vuna_dAst_dModDecl (name, true, items,
                v_Vuna_dParser_dspanOf st st4)), st4))))
    else v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st2 "where") (fun _u st3 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dBase_dJust (C_Vuna_dAst_dModDecl (name, false, [], v_Vuna_dParser_dspanOf st st3)), st3)))))

else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dNothing, st))

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

let rec v_Vuna_dParser_dparseDerivingNames = fun st -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
  st) (fun name st1 -> if v_Vuna_dParser_datSym st1 "," then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDerivingNames
    (v_Vuna_dParser_dadvance st1)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((name) :: (rest),
        st2)))
  else v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 ")") (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ((name) :: ([]), st2))))

let v_Vuna_dParser_dparseDeriving = fun st -> if v_Vuna_dParser_datKw st "deriving" then v_Vuna_dBase_dstep
(v_Vuna_dParser_dexpectKw st "deriving") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
    st1 "(") (fun _u st2 -> if v_Vuna_dParser_datSym st2 ")" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ([], v_Vuna_dParser_dadvance st2))
    else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDerivingNames st2) (fun names st3 -> C_Vuna_dBase_dOk
      (C_Vuna_dBase_dPair (names, st3)))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))

let v_Vuna_dParser_dparseInstanceName = fun st -> if v_Vuna_dParser_datKw st "as" then v_Vuna_dBase_dstep
(v_Vuna_dParser_dexpectKw st "as") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1)
  (fun name st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dJust (name), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dNothing, st))

let v_Vuna_dParser_dparseInstanceSelector = fun st blockCol first -> if v_Vuna_dParser_datSym st "@" then
v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st "@") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st1) (fun name st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEInstSel (first, name, v_Vuna_dParser_dspanFromExpr
          first st2), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (first, st))

let rec v_Vuna_dParser_dparseFieldSuffix = fun st blockCol base -> if v_Vuna_dParser_datSym st "." then
v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st ".") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st1) (fun fname st2 -> v_Vuna_dParser_dparseFieldSuffix st2 blockCol (C_Vuna_dAst_dEField (base, fname,
        v_Vuna_dParser_dspanFromExpr base st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (base, st))

let rec v_Vuna_dParser_dparseLambdaParams = fun st acc -> if v_Vuna_dParser_datSym st "," then v_Vuna_dBase_dstep
(v_Vuna_dParser_dexpectIdent (v_Vuna_dParser_dadvance st)) (fun name st1 -> v_Vuna_dParser_dparseLambdaParams
  st1 (v_Vuna_dBase_dappend acc ((name) :: ([]))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (acc, st))

let v_Vuna_dLexer_disKeyword = fun s -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if
                        ((if ((if ((if ((if (v_vuna_ueq_ustr s "data") then true
                        else (v_vuna_ueq_ustr s "case"))) then true
                        else (v_vuna_ueq_ustr s "of"))) then true
                        else (v_vuna_ueq_ustr s "let"))) then true
                        else (v_vuna_ueq_ustr s "in"))) then true
                        else (v_vuna_ueq_ustr s "if"))) then true
                        else (v_vuna_ueq_ustr s "then"))) then true
                        else (v_vuna_ueq_ustr s "else"))) then true
                        else (v_vuna_ueq_ustr s "where"))) then true
                        else (v_vuna_ueq_ustr s "Type"))) then true
                        else (v_vuna_ueq_ustr s "import"))) then true
                        else (v_vuna_ueq_ustr s "module"))) then true
                      else (v_vuna_ueq_ustr s "qualified"))) then true
                  else (v_vuna_ueq_ustr s "as"))) then true
              else (v_vuna_ueq_ustr s "record"))) then true
          else (v_vuna_ueq_ustr s "trait"))) then true
      else (v_vuna_ueq_ustr s "instance"))) then true
  else (v_vuna_ueq_ustr s "deriving"))

let v_Vuna_dLexer_dclassifyIdent = fun s -> if v_Vuna_dLexer_disKeyword s then C_Vuna_dLexer_dTKw (s)

else C_Vuna_dLexer_dTIdent (s)

let rec v_Vuna_dAst_dcollectClauses = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, _) -> if v_vuna_ueq_ustr n name then (C_Vuna_dBase_dPair (pats,
      body)) :: (v_Vuna_dAst_dcollectClauses rest name)
  else v_Vuna_dAst_dcollectClauses rest name
  | _ -> v_Vuna_dAst_dcollectClauses rest name
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 114 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 112 1 ("no matching clause for Vuna.Ast.collectClauses")

let v_Vuna_dAst_dclausesFor = fun decls name -> v_Vuna_dAst_dcollectClauses decls name

let v_Vuna_dTypecheck_dfunLoc = fun name decls -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> ""
  | (C_Vuna_dBase_dPair (pats, body)) :: (_) -> (let sp = v_Vuna_dAst_dexprSpan body in
    if v_vuna_ueq_uint (v_Vuna_dBase_dspanStartLine sp) 0 then ""
    else ((v_Vuna_dBase_dshowSpanLoc sp) ^ (": ")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1483 3 ("case pattern match failure"))

let v_Vuna_dAst_dfunArity = fun name decls -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> C_Vuna_dBase_dNothing
  | (C_Vuna_dBase_dPair (pats, body)) :: (_) -> C_Vuna_dBase_dJust (v_Vuna_dBase_dlength pats)
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 123 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dzeroArgBody = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> (match v_Vuna_dAst_dclausesFor decls name with
  | (C_Vuna_dBase_dPair ([], body)) :: ([]) -> C_Vuna_dBase_dJust (body)
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 348 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dNothing
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 346 3 ("case pattern match failure"))

let rec v_Vuna_dAst_dlookupCtorArity = fun name ctors -> (match ctors with
  | [] -> C_Vuna_dBase_dNothing
  | (c) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dAst_dctorName c) name then C_Vuna_dBase_dJust (v_Vuna_dAst_dctorArityOf
    c)
  else v_Vuna_dAst_dlookupCtorArity name rest
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 139 3 ("case pattern match failure"))

let rec v_Vuna_dAst_dctorArity = fun name decls -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> (match v_Vuna_dAst_dlookupCtorArity name
      ctors with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dJust (arity)
  | C_Vuna_dBase_dNothing -> v_Vuna_dAst_dctorArity name rest
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 150 11 ("case pattern match failure"))
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_vuna_ueq_ustr name dname then
    C_Vuna_dBase_dJust (v_Vuna_dBase_dlength fields)
    else v_Vuna_dAst_dctorArity name rest
  | _ -> v_Vuna_dAst_dctorArity name rest
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 148 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Ast.vuna" 145 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dcheckNoCtorFun = fun a0 a1 -> match (a0, a1) with
  | ([], decls) -> C_Vuna_dBase_dOk ([])
  | ((C_Vuna_dBase_dPair (name, clauses)) :: (rest), decls) -> (match v_Vuna_dAst_dctorArity name decls
  with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dErr ((("name is both a constructor and a function: ")
      ^ (name)))
  | C_Vuna_dBase_dNothing -> v_Vuna_dCodegen_dcheckNoCtorFun rest decls
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 396 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 394 1 ("no matching clause for Vuna.Codegen.checkNoCtorFun")

let rec v_Vuna_dBase_dmemName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then true
else v_Vuna_dBase_dmemName name rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 98 1 ("no matching clause for Vuna.Base.memName")

let rec v_Lint_dintersects = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> false
  | ((x) :: (rest), ys) -> if v_Vuna_dBase_dmemName x ys then true
else v_Lint_dintersects rest ys
  | _ -> vuna_fail "app/Lint.vuna" 272 1 ("no matching clause for Lint.intersects")

let rec v_Vuna_dTypedCodegen_dallPureExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, seen, []) -> true
  | (decls, seen, (e) :: (rest)) -> (if (v_Vuna_dTypedCodegen_dpureExpr decls seen e) then (v_Vuna_dTypedCodegen_dallPureExpr
    decls seen rest)
  else false)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 353 1 ("no matching clause for Vuna.TypedCodegen.allPureExpr")
and v_Vuna_dTypedCodegen_dpureExpr = fun decls seen e -> (match e with
  | C_Vuna_dAst_dEInt (n, _) -> true
  | C_Vuna_dAst_dEStr (s, _) -> true
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dBase_dmemName name seen then false
  else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (0) -> true
  | _ -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls name with
  | C_Vuna_dBase_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: (seen)) body
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 366 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 363 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("++", _) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals (v_Vuna_dTypedCodegen_dconcatFlatten
        e) with
  | (C_Vuna_dAst_dEStr (_, _)) :: ([]) -> true
  | _ -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 372 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (_) -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 376 11 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 370 7 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 357 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disPureZeroArg = fun decls name -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls
  name with
  | C_Vuna_dBase_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: ([])) body
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 383 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_disAtomicExpr = fun decls env e -> (match e with
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dBase_dmemName name env then true
  else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if v_vuna_ueq_uint arity 0 then true
    else false
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dbuiltinName name with
  | C_Vuna_dBase_dJust (ref) -> if v_vuna_ueq_ustr name "getArgs" then false
      else true
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dTypedCodegen_disPureZeroArg decls name
  | C_Vuna_dBase_dJust (_) -> true
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 307 17 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 304 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 301 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, _) -> true
  | C_Vuna_dAst_dEStr (s, _) -> true
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 297 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 318 1 ("no matching clause for Vuna.TypedCodegen.applyArgs")

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
  | ((name) :: (rest)) -> if v_vuna_ueq_ustr name "" then v_Vuna_dTypedCodegen_duniqueNames rest
else if v_Vuna_dBase_dmemName name rest then v_Vuna_dTypedCodegen_duniqueNames rest
else (name) :: (v_Vuna_dTypedCodegen_duniqueNames rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 656 1 ("no matching clause for Vuna.TypedCodegen.uniqueNames")

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 683 1 ("no matching clause for Vuna.TypedCodegen.dependentsOf")

let v_Vuna_dTypedCodegen_dreverseAdj = fun names adj -> v_Vuna_dBase_dmap (fun n -> C_Vuna_dBase_dPair
  (n, v_Vuna_dTypedCodegen_ddependentsOf n adj)) names

let rec v_Vuna_dTypedCodegen_dfoldNeighborsPost = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], visited, order) -> C_Vuna_dBase_dPair (visited, order)
  | (adj, (m) :: (rest), visited, order) -> if v_Vuna_dBase_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsPost
adj rest visited order
else (match v_Vuna_dTypedCodegen_ddfsPost adj m ((m) :: (visited)) order with
  | C_Vuna_dBase_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dfoldNeighborsPost adj rest visited2
  order2
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 696 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 692 1 ("no matching clause for Vuna.TypedCodegen.foldNeighborsPost")
and v_Vuna_dTypedCodegen_ddfsPost = fun adj n visited order -> (match v_Vuna_dTypedCodegen_dfoldNeighborsPost
  adj (v_Vuna_dTypedCodegen_dneighborsOf adj n) visited order with
  | C_Vuna_dBase_dPair (visited2, order2) -> C_Vuna_dBase_dPair (visited2, (n) :: (order2))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 701 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dpostOrder = fun adj nodes visited order -> (match nodes with
  | [] -> C_Vuna_dBase_dPair (visited, order)
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n visited then v_Vuna_dTypedCodegen_dpostOrder adj rest
  visited order
  else (match v_Vuna_dTypedCodegen_ddfsPost adj n ((n) :: (visited)) order with
  | C_Vuna_dBase_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dpostOrder adj rest visited2 order2
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 711 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 706 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dfoldNeighborsCollect = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (revAdj, [], visited, comp) -> C_Vuna_dBase_dPair (visited, comp)
  | (revAdj, (m) :: (rest), visited, comp) -> if v_Vuna_dBase_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsCollect
revAdj rest visited comp
else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj m ((m) :: (visited)) comp with
  | C_Vuna_dBase_dPair (visited2, comp2) -> v_Vuna_dTypedCodegen_dfoldNeighborsCollect revAdj rest visited2
  comp2
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 719 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 715 1 ("no matching clause for Vuna.TypedCodegen.foldNeighborsCollect")
and v_Vuna_dTypedCodegen_ddfsCollect = fun revAdj n visited comp -> (match v_Vuna_dTypedCodegen_dfoldNeighborsCollect
  revAdj (v_Vuna_dTypedCodegen_dneighborsOf revAdj n) visited comp with
  | C_Vuna_dBase_dPair (visited2, comp2) -> C_Vuna_dBase_dPair (visited2, (n) :: (comp2))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 724 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dcollectComps = fun revAdj nodes visited comps -> (match nodes with
  | [] -> comps
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n visited then v_Vuna_dTypedCodegen_dcollectComps revAdj
  rest visited comps
  else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj n ((n) :: (visited)) [] with
  | C_Vuna_dBase_dPair (visited2, comp) -> v_Vuna_dTypedCodegen_dcollectComps revAdj rest visited2 ((comp)
      :: (comps))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 734 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 729 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dcomponentOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> C_Vuna_dBase_dNothing
  | ((g) :: (rest), name) -> if v_Vuna_dBase_dmemName name g then C_Vuna_dBase_dJust (g)
else v_Vuna_dTypedCodegen_dcomponentOf rest name
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 738 1 ("no matching clause for Vuna.TypedCodegen.componentOf")

let rec v_Vuna_dTypedCodegen_dgroupsFromCompsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (comps, allNames, [], emitted) -> []
  | (comps, allNames, (n) :: (rest), emitted) -> if v_Vuna_dBase_dmemName n emitted then v_Vuna_dTypedCodegen_dgroupsFromCompsGo
comps allNames rest emitted
else (match v_Vuna_dTypedCodegen_dcomponentOf comps n with
  | C_Vuna_dBase_dJust (g) -> (v_Vuna_dTypedCodegen_dfilterNames (fun m -> v_Vuna_dBase_dmemName m g)
    allNames) :: (v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest (v_Vuna_dBase_dappend g
      emitted))
  | C_Vuna_dBase_dNothing -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest emitted
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 752 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 748 1 ("no matching clause for Vuna.TypedCodegen.groupsFromCompsGo")

let v_Vuna_dTypedCodegen_dgroupsFromComps = fun comps names -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo
comps names names []

let v_Vuna_dTypedCodegen_dgroupDeps = fun adj group -> v_Vuna_dTypedCodegen_dfilterNames (fun n -> v_Vuna_dTypedCodegen_dnotIn
  n group) (v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dBase_dconcatMap (v_Vuna_dTypedCodegen_dneighborsOf
      adj) group))

let rec v_Vuna_dTypedCodegen_dallIn = fun names allowed -> (match names with
  | [] -> true
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n allowed then v_Vuna_dTypedCodegen_dallIn rest allowed

  else false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 763 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgroupReady = fun adj group emitted -> v_Vuna_dTypedCodegen_dallIn (v_Vuna_dTypedCodegen_dgroupDeps
  adj group) emitted

let rec v_Vuna_dTypedCodegen_dpickReadyAcc = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], before, emitted) -> C_Vuna_dBase_dNothing
  | (adj, (g) :: (rest), before, emitted) -> if v_Vuna_dTypedCodegen_dgroupReady adj g emitted then C_Vuna_dBase_dJust
(C_Vuna_dBase_dPair (g, v_Vuna_dBase_dappend (v_Vuna_dBase_dreverse before) rest))
else v_Vuna_dTypedCodegen_dpickReadyAcc adj rest ((g) :: (before)) emitted
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 772 1 ("no matching clause for Vuna.TypedCodegen.pickReadyAcc")

let v_Vuna_dTypedCodegen_dpickReady = fun adj groups emitted -> v_Vuna_dTypedCodegen_dpickReadyAcc adj
groups [] emitted

let rec v_Vuna_dTypedCodegen_dorderGroupsAcc = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, [], emitted) -> C_Vuna_dBase_dOk ([])
  | (adj, remaining, emitted) -> (match v_Vuna_dTypedCodegen_dpickReady adj remaining emitted with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: dependency cycle between groups")
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (g, rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dorderGroupsAcc
    adj rest (v_Vuna_dBase_dappend g emitted)) (fun tail -> C_Vuna_dBase_dOk ((g) :: (tail)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 782 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 780 1 ("no matching clause for Vuna.TypedCodegen.orderGroupsAcc")

let v_Vuna_dTypedCodegen_dorderGroups = fun adj groups -> v_Vuna_dTypedCodegen_dorderGroupsAcc adj groups
[]

let rec v_Vuna_dTypedCodegen_dunionNames = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> if v_Vuna_dBase_dmemName x ys then v_Vuna_dTypedCodegen_dunionNames rest ys

else (x) :: (v_Vuna_dTypedCodegen_dunionNames rest ys)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 829 1 ("no matching clause for Vuna.TypedCodegen.unionNames")

let rec v_Vuna_dTypedCodegen_dexprRefs = fun expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> (name) :: ([])
  | C_Vuna_dAst_dEInt (n, _) -> []
  | C_Vuna_dAst_dEStr (s, _) -> []
  | C_Vuna_dAst_dEApp (fn, args, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs
    fn) (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dexprRefs args)
  | C_Vuna_dAst_dELam (params, body, _) -> v_Vuna_dTypedCodegen_dexprRefs body
  | C_Vuna_dAst_dELet (binds, body, _, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dBase_dconcatMap
    v_Vuna_dTypedCodegen_dbindRefs binds) (v_Vuna_dTypedCodegen_dexprRefs body)
  | C_Vuna_dAst_dECase (scrut, alts, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs
    scrut) (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_daltRefs alts)
  | C_Vuna_dAst_dEIf (c, t, e, _) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs
    c) (v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs t) (v_Vuna_dTypedCodegen_dexprRefs
      e))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 812 3 ("case pattern match failure"))
and v_Vuna_dTypedCodegen_dbindRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pat, value)) -> v_Vuna_dTypedCodegen_dexprRefs value
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 823 1 ("no matching clause for Vuna.TypedCodegen.bindRefs")
and v_Vuna_dTypedCodegen_daltRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 826 1 ("no matching clause for Vuna.TypedCodegen.altRefs")

let v_Vuna_dTypedCodegen_dclauseRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dTypedCodegen_dexprRefs body
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 808 1 ("no matching clause for Vuna.TypedCodegen.clauseRefs")

let v_Vuna_dTypedCodegen_dgenFunctionRefs = fun decls name -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dBase_dconcatMap
  v_Vuna_dTypedCodegen_dclauseRefs (v_Vuna_dAst_dclausesFor decls name))

let v_Vuna_dTypedCodegen_dgroupNeedsRec = fun decls group -> (match group with
  | [] -> false
  | (n) :: ([]) -> v_Vuna_dBase_dmemName n (v_Vuna_dTypedCodegen_dgenFunctionRefs decls n)
  | _ -> true
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 794 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dkeepChunks = fun a0 a1 -> match (a0, a1) with
  | (names, []) -> []
  | (names, (ch) :: (rest)) -> if v_Vuna_dBase_dmemName (v_Vuna_dTypedCodegen_dchunkNameOf ch) names then
(ch) :: (v_Vuna_dTypedCodegen_dkeepChunks names rest)
else v_Vuna_dTypedCodegen_dkeepChunks names rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 945 1 ("no matching clause for Vuna.TypedCodegen.keepChunks")

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
          else (v_vuna_ueq_ustr name "Int"))) then true
      else (v_vuna_ueq_ustr name "String"))) then true
  else (v_vuna_ueq_ustr name "Bool"))

let v_Vuna_dTypecheck_dshowFallback = fun tctx ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon ("Int", []) -> C_Vuna_dBase_dOk ("vuna_show_int")
  | C_Vuna_dTypecheck_dTCon ("String", []) -> C_Vuna_dBase_dOk ("vuna_show_string")
  | C_Vuna_dTypecheck_dTCon ("Bool", []) -> C_Vuna_dBase_dOk ("vuna_show_bool")
  | C_Vuna_dTypecheck_dTCon (n, []) -> if v_Vuna_dBase_dmemName n (v_Vuna_dTypecheck_dtraitCtxSupported
    tctx) then C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dshowFnName n)
  else C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dnoInstanceMsg tctx "Show" ty)
  | _ -> C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dnoInstanceMsg tctx "Show" ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 405 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_deqFallback = fun tctx ty key -> (match ty with
  | C_Vuna_dTypecheck_dTCon ("Int", []) -> if v_vuna_ueq_ustr key "neq" then C_Vuna_dBase_dOk ("vuna_neq_int")

  else C_Vuna_dBase_dOk ("vuna_eq_int")
  | C_Vuna_dTypecheck_dTCon ("Bool", []) -> if v_vuna_ueq_ustr key "neq" then C_Vuna_dBase_dOk ("vuna_neq_bool")

  else C_Vuna_dBase_dOk ("vuna_eq_bool")
  | C_Vuna_dTypecheck_dTCon ("String", []) -> if v_vuna_ueq_ustr key "neq" then C_Vuna_dBase_dOk ("vuna_neq_str")

  else C_Vuna_dBase_dOk ("vuna_eq_str")
  | C_Vuna_dTypecheck_dTCon (n, args) -> if v_Vuna_dBase_dmemName n (v_Vuna_dTypecheck_dtraitCtxEqSupported
    tctx) then if v_vuna_ueq_ustr key "neq" then C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dneqFnName n)
  else C_Vuna_dBase_dOk (v_Vuna_dTypecheck_deqFnName n)
  else C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dnoInstanceMsg tctx "Eq" ty)
  | _ -> C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dnoInstanceMsg tctx "Eq" ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 439 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dconcreteMethodName = fun tctx ty tr key -> (match v_Vuna_dTypecheck_dfindDefaultInst
  tr ty (v_Vuna_dTypecheck_dtraitCtxInsts tctx) with
  | C_Vuna_dBase_dJust (inst) -> (match v_Vuna_dTypecheck_dlookupImpl (v_Vuna_dTypecheck_dlastSeg key)
    (v_Vuna_dTypecheck_dinstImpls inst) with
  | C_Vuna_dBase_dJust (fn) -> C_Vuna_dBase_dOk (fn)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("instance ") in
        (let vuna_cat1' = (tr) in
          (let vuna_cat2' = (" ") in
            (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy ty) in
              (let vuna_cat4' = (" does not implement ") in
                (let vuna_cat5' = (key) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 503 7 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> (match tr with
  | "Show" -> v_Vuna_dTypecheck_dshowFallback tctx ty
  | "Eq" -> v_Vuna_dTypecheck_deqFallback tctx ty key
  | "Ord" -> v_Vuna_dTypecheck_dordFallback tctx ty key
  | _ -> C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dnoInstanceMsg tctx tr ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 507 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 501 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dneedsHave = fun need needs -> v_Vuna_dBase_dmemName need needs

let rec v_Vuna_dTypecheck_dhasUnknownFields = fun a0 a1 -> match (a0, a1) with
  | (fieldNames, []) -> false
  | (fieldNames, (C_Vuna_dBase_dPair (n, v)) :: (rest)) -> if v_Vuna_dBase_dmemName n fieldNames then
v_Vuna_dTypecheck_dhasUnknownFields fieldNames rest
else true
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 929 1 ("no matching clause for Vuna.Typecheck.hasUnknownFields")

let rec v_Vuna_dTypecheck_dfirstUnknownFieldMsg = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (sp, fieldNames, []) -> v_Vuna_dTypecheck_dunknownFieldMsg sp ""
  | (sp, fieldNames, (C_Vuna_dBase_dPair (n, v)) :: (rest)) -> if v_Vuna_dBase_dmemName n fieldNames then
v_Vuna_dTypecheck_dfirstUnknownFieldMsg sp fieldNames rest
else v_Vuna_dTypecheck_dunknownFieldMsg sp n
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 934 1 ("no matching clause for Vuna.Typecheck.firstUnknownFieldMsg")

let rec v_Vuna_dTypecheck_dcheckProvidedFields = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (fieldNames, [], sp) -> C_Vuna_dBase_dOk ([])
  | (fieldNames, (C_Vuna_dBase_dPair (n, v)) :: (rest), sp) -> if v_Vuna_dBase_dmemName n fieldNames then
v_Vuna_dTypecheck_dcheckProvidedFields fieldNames rest sp
else C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dunknownFieldMsg sp n)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 940 1 ("no matching clause for Vuna.Typecheck.checkProvidedFields")

let rec v_Vuna_dTypecheck_ddesugarPattern = fun records pat -> (match pat with
  | C_Vuna_dAst_dPWild (sp) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dPWild (sp))
  | C_Vuna_dAst_dPVar (n, sp) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dPVar (n, sp))
  | C_Vuna_dAst_dPInt (n, sp) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dPInt (n, sp))
  | C_Vuna_dAst_dPStr (s, sp) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dPStr (s, sp))
  | C_Vuna_dAst_dPCon (name, pats, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dTypecheck_ddesugarPattern
      records) pats) (fun ps -> C_Vuna_dBase_dOk (C_Vuna_dAst_dPCon (name, ps, sp)))
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> (match v_Vuna_dTypecheck_dlookupRecord name records with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": unknown record: ") in
          (let vuna_cat2' = (name) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dRecordInfo (rname, params, fdefs, derivings)) -> if v_Vuna_dTypecheck_dhasDuplicateFieldNames
    fields then C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dduplicateFieldMsg sp)
    else if v_Vuna_dTypecheck_dhasUnknownFields (v_Vuna_dTypecheck_dfieldNamesOf fdefs) fields then C_Vuna_dBase_dErr
    (v_Vuna_dTypecheck_dfirstUnknownFieldMsg sp (v_Vuna_dTypecheck_dfieldNamesOf fdefs) fields)
    else v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarRecordPatternFields records fdefs fields sp)
    (fun ps -> C_Vuna_dBase_dOk (C_Vuna_dAst_dPCon (rname, ps, sp)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1006 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 998 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_ddesugarRecordPatternFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (records, [], provided, sp) -> C_Vuna_dBase_dOk ([])
  | (records, (C_Vuna_dBase_dPair (fname, fty)) :: (rest), provided, sp) -> (match v_Vuna_dTypecheck_dlookupProvided
  fname provided with
  | C_Vuna_dBase_dNothing -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarRecordPatternFields records
    rest provided sp) (fun ps -> C_Vuna_dBase_dOk ((C_Vuna_dAst_dPWild (sp)) :: (ps)))
  | C_Vuna_dBase_dJust (p) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarPattern records p) (fun
    p2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarRecordPatternFields records rest provided sp)
    (fun ps -> C_Vuna_dBase_dOk ((p2) :: (ps))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1019 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1016 1 ("no matching clause for Vuna.Typecheck.desugarRecordPatternFields")

let rec v_Vuna_dTypecheck_ddesugarExpr = fun records e -> (match e with
  | C_Vuna_dAst_dEVar (n, sp) -> C_Vuna_dBase_dOk (e)
  | C_Vuna_dAst_dEInt (n, sp) -> C_Vuna_dBase_dOk (e)
  | C_Vuna_dAst_dEStr (s, sp) -> C_Vuna_dBase_dOk (e)
  | C_Vuna_dAst_dELam (ps, b, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records b)
  (fun b2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELam (ps, b2, sp)))
  | C_Vuna_dAst_dEApp (f, args, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records f)
  (fun f2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dTypecheck_ddesugarExpr records) args)
    (fun a2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp (f2, a2, sp))))
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dTypecheck_ddesugarBind
      records) binds) (fun b2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records body) (fun
      body2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELet (b2, body2, rec_u, sp))))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records
    scrut) (fun s2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dTypecheck_ddesugarAlt records)
      alts) (fun a2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dECase (s2, a2, sp))))
  | C_Vuna_dAst_dEIf (c, t, el, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records c)
  (fun c2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records t) (fun t2 -> v_Vuna_dBase_dandThen
      (v_Vuna_dTypecheck_ddesugarExpr records el) (fun e2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEIf (c2, t2,
            e2, sp)))))
  | C_Vuna_dAst_dEField (base, fname, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records
    base) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEField (b, fname, sp)))
  | C_Vuna_dAst_dERecord (name, fields, sp) -> (match v_Vuna_dTypecheck_dlookupRecord name records with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": unknown record: ") in
          (let vuna_cat2' = (name) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dRecordInfo (rname, params, fdefs, derivings)) -> if v_Vuna_dTypecheck_dhasDuplicateFieldNames
    fields then C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dduplicateFieldMsg sp)
    else if v_Vuna_dTypecheck_dhasUnknownFields (v_Vuna_dTypecheck_dfieldNamesOf fdefs) fields then C_Vuna_dBase_dErr
    (v_Vuna_dTypecheck_dfirstUnknownFieldMsg sp (v_Vuna_dTypecheck_dfieldNamesOf fdefs) fields)
    else v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarRecordValues records fdefs fields sp) (fun vs
      -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (rname, sp), vs, sp)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1052 7 ("case pattern match failure"))
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr
    records base) (fun b -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dTypecheck_ddesugarFieldValue
        records) fields) (fun fs -> C_Vuna_dBase_dOk (C_Vuna_dAst_dERecUpdate (b, fs, sp))))
  | C_Vuna_dAst_dEInstSel (m, n, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records
    m) (fun m2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEInstSel (m2, n, sp)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1030 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_ddesugarRecordValues = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (records, [], provided, sp) -> C_Vuna_dBase_dOk ([])
  | (records, (C_Vuna_dBase_dPair (fname, fty)) :: (rest), provided, sp) -> (match v_Vuna_dTypecheck_dlookupProvided
  fname provided with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dmissingFieldMsg sp fname)
  | C_Vuna_dBase_dJust (v) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records v) (fun v2
    -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarRecordValues records rest provided sp) (fun vs
      -> C_Vuna_dBase_dOk ((v2) :: (vs))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1071 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1068 1 ("no matching clause for Vuna.Typecheck.desugarRecordValues")
and v_Vuna_dTypecheck_ddesugarFieldValue = fun a0 a1 -> match (a0, a1) with
  | (records, C_Vuna_dBase_dPair (fname, v)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr
  records v) (fun v2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (fname, v2)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1079 1 ("no matching clause for Vuna.Typecheck.desugarFieldValue")
and v_Vuna_dTypecheck_ddesugarBind = fun a0 a1 -> match (a0, a1) with
  | (records, C_Vuna_dBase_dPair (pat, value)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarPattern
  records pat) (fun p2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records value) (fun v2
    -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (p2, v2))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1083 1 ("no matching clause for Vuna.Typecheck.desugarBind")
and v_Vuna_dTypecheck_ddesugarAlt = fun a0 a1 -> match (a0, a1) with
  | (records, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarPattern
  records pat) (fun p2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records body) (fun b2
    -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (p2, b2))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1088 1 ("no matching clause for Vuna.Typecheck.desugarAlt")

let rec v_Vuna_dTypecheck_ddesugarRecordDecl = fun records d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dTypecheck_ddesugarPattern
      records) pats) (fun pats2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_ddesugarExpr records body)
    (fun body2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDFun (name, pats2, body2, sp))))
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> C_Vuna_dBase_dOk (d)
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> C_Vuna_dBase_dOk (d)
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> C_Vuna_dBase_dOk (d)
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
    (v_Vuna_dTypecheck_ddesugarRecordDecl records) methods) (fun ms -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDInstance
      (iname, isDefault, head, ms, sp)))
  | C_Vuna_dAst_dDSig (name, ty, sp) -> C_Vuna_dBase_dOk (d)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 986 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_ddesugarRecords = fun records decls -> v_Vuna_dBase_dtraverse (v_Vuna_dTypecheck_ddesugarRecordDecl
  records) decls

let rec v_Vuna_dTypecheck_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_vuna_ueq_ustr name "" then v_Vuna_dTypecheck_duniqueNames rest
else if v_Vuna_dBase_dmemName name rest then v_Vuna_dTypecheck_duniqueNames rest
else (name) :: (v_Vuna_dTypecheck_duniqueNames rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1449 1 ("no matching clause for Vuna.Typecheck.uniqueNames")

let v_Vuna_dTypecheck_dfunctionNames = fun decls -> v_Vuna_dTypecheck_duniqueNames (v_Vuna_dBase_dmap
  v_Vuna_dTypecheck_ddeclFunName decls)

let v_Vuna_dTypecheck_dhasSig = fun name sigs -> v_Vuna_dBase_dmemName name (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
  sigs)

let rec v_Vuna_dTypecheck_dseedPlaceholders = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], sigs, st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), sigs, st) -> if v_Vuna_dTypecheck_dhasSig name sigs then v_Vuna_dTypecheck_dseedPlaceholders
rest sigs st
else (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedPlaceholders rest sigs st1 with
  | C_Vuna_dBase_dPair (ps, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, v_Vuna_dTypecheck_dmkScheme
          [] ty)) :: (ps), st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1463 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1461 5 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1457 1 ("no matching clause for Vuna.Typecheck.seedPlaceholders")

let v_Vuna_dTypecheck_dfieldTypeSupported = fun supported ty -> (match ty with
  | C_Vuna_dAst_dEVar ("Int", sp) -> true
  | C_Vuna_dAst_dEVar ("String", sp) -> true
  | C_Vuna_dAst_dEVar ("Bool", sp) -> true
  | C_Vuna_dAst_dEVar (n, sp) -> v_Vuna_dBase_dmemName n supported
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1887 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfieldTypesSupported = fun a0 a1 -> match (a0, a1) with
  | (supported, []) -> true
  | (supported, (ty) :: (rest)) -> if v_Vuna_dTypecheck_dfieldTypeSupported supported ty then v_Vuna_dTypecheck_dfieldTypesSupported
supported rest
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1894 1 ("no matching clause for Vuna.Typecheck.fieldTypesSupported")

let rec v_Vuna_dTypecheck_dctorsSupported = fun a0 a1 -> match (a0, a1) with
  | (supported, []) -> true
  | (supported, (C_Vuna_dBase_dPair (cname, ftypes)) :: (rest)) -> if v_Vuna_dTypecheck_dfieldTypesSupported
supported ftypes then v_Vuna_dTypecheck_dctorsSupported supported rest
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1902 1 ("no matching clause for Vuna.Typecheck.ctorsSupported")

let rec v_Vuna_dTypecheck_deqFieldSupported = fun eqsup params ty -> (match ty with
  | C_Vuna_dAst_dEVar (n, sp) -> if v_Vuna_dBase_dmemName n params then true
  else if (if ((if (v_vuna_ueq_ustr n "Int") then true
        else (v_vuna_ueq_ustr n "String"))) then true
    else (v_vuna_ueq_ustr n "Bool")) then true
  else v_Vuna_dBase_dmemName n eqsup
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (n, sp), args, _) -> (if (v_Vuna_dBase_dmemName n eqsup) then
    (v_Vuna_dTypecheck_deqArgsSupported eqsup params args)
    else false)
  | _ -> false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1925 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_deqArgsSupported = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (eqsup, params, []) -> true
  | (eqsup, params, (ty) :: (rest)) -> if v_Vuna_dTypecheck_deqFieldSupported eqsup params ty then v_Vuna_dTypecheck_deqArgsSupported
eqsup params rest
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1933 1 ("no matching clause for Vuna.Typecheck.eqArgsSupported")

let rec v_Vuna_dTypecheck_dfieldsEqSupported = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (eqsup, params, []) -> true
  | (eqsup, params, (ty) :: (rest)) -> if v_Vuna_dTypecheck_deqFieldSupported eqsup params ty then v_Vuna_dTypecheck_dfieldsEqSupported
eqsup params rest
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1946 1 ("no matching clause for Vuna.Typecheck.fieldsEqSupported")

let rec v_Vuna_dTypecheck_deqCtorsSupported = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (eqsup, params, []) -> true
  | (eqsup, params, (C_Vuna_dBase_dPair (cname, ftypes)) :: (rest)) -> if v_Vuna_dTypecheck_dfieldsEqSupported
eqsup params ftypes then v_Vuna_dTypecheck_deqCtorsSupported eqsup params rest
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1941 1 ("no matching clause for Vuna.Typecheck.eqCtorsSupported")

let v_Vuna_dTypecheck_deqShapeSupported = fun a0 a1 -> match (a0, a1) with
  | (eqsup, C_Vuna_dTypecheck_dDataShape (n, params, ctors)) -> v_Vuna_dTypecheck_deqCtorsSupported eqsup
params ctors
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1938 1 ("no matching clause for Vuna.Typecheck.eqShapeSupported")

let rec v_Vuna_dTypecheck_daddEqSupportedShapes = fun a0 a1 -> match (a0, a1) with
  | ([], eqsup) -> C_Vuna_dBase_dPair (eqsup, 0)
  | ((sh) :: (shapes), eqsup) -> (match v_Vuna_dTypecheck_daddEqSupportedShapes shapes eqsup with
  | C_Vuna_dBase_dPair (eqsup2, cnt) -> if v_Vuna_dBase_dmemName (v_Vuna_dTypecheck_dshapeName sh) eqsup2
  then C_Vuna_dBase_dPair (eqsup2, cnt)
  else if v_Vuna_dTypecheck_deqShapeSupported ((v_Vuna_dTypecheck_dshapeName sh) :: (eqsup2)) sh then
  C_Vuna_dBase_dPair (v_Vuna_dBase_dappend eqsup2 ((v_Vuna_dTypecheck_dshapeName sh) :: ([])), bi_add
    cnt 1)
  else C_Vuna_dBase_dPair (eqsup2, cnt)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1954 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1951 1 ("no matching clause for Vuna.Typecheck.addEqSupportedShapes")

let rec v_Vuna_dTypecheck_deqSupportedLoop = fun shapes eqsup -> (match v_Vuna_dTypecheck_daddEqSupportedShapes
  shapes eqsup with
  | C_Vuna_dBase_dPair (eqsup2, cnt) -> if v_vuna_ueq_uint cnt 0 then eqsup2
  else v_Vuna_dTypecheck_deqSupportedLoop shapes eqsup2
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1961 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_deqSupportedShapes = fun shapes -> v_Vuna_dTypecheck_deqSupportedLoop shapes []

let v_Vuna_dTypecheck_deqFieldFnSource = fun params ty -> (match ty with
  | C_Vuna_dAst_dEVar (n, sp) -> if v_Vuna_dBase_dmemName n params then "vuna_eq_generic"
  else if v_vuna_ueq_ustr n "Int" then "vuna_eq_int"
  else if v_vuna_ueq_ustr n "String" then "vuna_eq_str"
  else if v_vuna_ueq_ustr n "Bool" then "vuna_eq_bool"
  else v_Vuna_dTypecheck_deqFnName n
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (n, sp), args, _) -> v_Vuna_dTypecheck_deqFnName n
  | _ -> "vuna_eq_generic"
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2006 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_deqPairConds = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], params) -> []
  | ((fty) :: (frest), (v) :: (rest), params) -> v_Vuna_dTypecheck_dandThenListPair (v_Vuna_dTypecheck_deqFieldFnSource
  params fty) v (v_Vuna_dTypecheck_deqPairConds frest rest params)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2016 1 ("no matching clause for Vuna.Typecheck.eqPairConds")

let v_Vuna_dTypecheck_deqCondSrc = fun params ftypes vvars wvars -> v_Vuna_dTypecheck_deqCondJoin (v_Vuna_dTypecheck_deqPairConds
  ftypes vvars params) wvars

let rec v_Vuna_dTypecheck_dunknownMethodNames = fun a0 a1 -> match (a0, a1) with
  | (known, []) -> []
  | (known, (d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> if v_Vuna_dBase_dmemName n known then v_Vuna_dTypecheck_dunknownMethodNames
  known rest
  else (n) :: (v_Vuna_dTypecheck_dunknownMethodNames known rest)
  | C_Vuna_dAst_dDSig (n, ty, sp) -> v_Vuna_dTypecheck_dunknownMethodNames known rest
  | _ -> v_Vuna_dTypecheck_dunknownMethodNames known rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2130 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2127 1 ("no matching clause for Vuna.Typecheck.unknownMethodNames")

let rec v_Vuna_dTypecheck_dinstanceImplsGo = fun a0 a1 a2 a3 a4 a5 a6 a7 a8 -> match (a0, a1, a2, a3,
  a4, a5, a6, a7, a8) with
  | (typeNames, traitDecl, headTyExpr, methods, instKey, sp, [], decls, impls) -> (match v_Vuna_dTypecheck_dunknownMethodNames
  (v_Vuna_dBase_dmap v_Vuna_dTypecheck_dmethodInfoName (v_Vuna_dTypecheck_dtraitDeclMethods traitDecl))
  methods with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse impls, v_Vuna_dBase_dreverse decls))
  | (bad) :: (rest) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
      (let vuna_cat1' = (": instance has unknown method ") in
        (let vuna_cat2' = (bad) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2141 3 ("case pattern match failure"))
  | (typeNames, traitDecl, headTyExpr, methods, instKey, sp, (info) :: (rest), decls, impls) -> (let short
  = v_Vuna_dTypecheck_dmethodInfoName info in
  (let clauses = v_Vuna_dTypecheck_dmethodClauses short methods in
    (match clauses with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
          (let vuna_cat1' = (": instance is missing method ") in
            (let vuna_cat2' = (short) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> (let implName = v_Vuna_dTypecheck_dimplNameOf instKey short in
        (let sigTy = v_Vuna_dTypecheck_dsubstTyParam (v_Vuna_dTypecheck_dtraitDeclParam traitDecl) headTyExpr
          (v_Vuna_dTypecheck_dmethodInfoSig info) in
          (let sigDecl = C_Vuna_dAst_dDSig (implName, sigTy, sp) in
            (let funDecls = v_Vuna_dBase_dmap (fun c -> v_Vuna_dTypecheck_dclauseDecl implName c sp)
              clauses in
              v_Vuna_dTypecheck_dinstanceImplsGo typeNames traitDecl headTyExpr methods instKey sp rest
              (v_Vuna_dBase_dappend ((sigDecl) :: (v_Vuna_dBase_dappend funDecls [])) decls) ((C_Vuna_dBase_dPair
                  (short, implName)) :: (impls))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2148 9 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2140 1 ("no matching clause for Vuna.Typecheck.instanceImplsGo")

let v_Vuna_dTypecheck_dinstanceImpls = fun typeNames traitDecl headTyExpr methods instKey sp -> v_Vuna_dTypecheck_dinstanceImplsGo
typeNames traitDecl headTyExpr methods instKey sp (v_Vuna_dTypecheck_dtraitDeclMethods traitDecl) [] []

let v_Vuna_dTypecheck_dorphanAllowed = fun instModule traitName headTy -> (let traitModule = if v_Vuna_dBase_dmemName
  traitName (("Show") :: (("Eq") :: (("Ord") :: ([])))) then v_Vuna_dTypecheck_dpreludeModule
  else v_Vuna_dTypecheck_dmodulePrefixOf traitName in
  (let outerName = v_Vuna_dTypecheck_dtyOuterTypeName headTy in
    (let headModule = if v_Vuna_dTypecheck_disBuiltinTypeName outerName then v_Vuna_dTypecheck_dpreludeModule

      else v_Vuna_dTypecheck_dmodulePrefixOf outerName in
      (if (v_vuna_ueq_ustr instModule traitModule) then true
        else (v_vuna_ueq_ustr instModule headModule)))))

let v_Vuna_dTypecheck_ddefaultInstanceAllowed = fun derivedType derivings traitName supported sp -> if
v_Vuna_dBase_dmemName (v_Vuna_dTypecheck_dtyOuterTypeName (C_Vuna_dTypecheck_dTCon (derivedType, [])))
supported then if v_Vuna_dBase_dmemName traitName (("Show") :: (("Eq") :: ([]))) then C_Vuna_dBase_dOk
([])
else C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
    (let vuna_cat1' = (": deriving only supports Show/Eq in M10.5 (got ") in
      (let vuna_cat2' = (traitName) in
        (let vuna_cat3' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
else C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
    (let vuna_cat1' = (": deriving ") in
      (let vuna_cat2' = (traitName) in
        (let vuna_cat3' = (" is not supported for type ") in
          (let vuna_cat4' = (derivedType) in
            (let vuna_cat5' = (" (fields must be Int/String/Bool or data types built from them)") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))

let rec v_Vuna_dTypecheck_dcollectDerivingsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (supported, eqSupported, [], insts) -> C_Vuna_dBase_dOk (v_Vuna_dBase_dreverse insts)
  | (supported, eqSupported, (d) :: (rest), insts) -> (match v_Vuna_dAst_ddeclDerivings d with
  | [] -> v_Vuna_dTypecheck_dcollectDerivingsGo supported eqSupported rest insts
  | derivings -> (match d with
  | C_Vuna_dAst_dDData (tyName, params, ctors, derivings2, sp) -> v_Vuna_dTypecheck_dcollectDerivingNames
    supported eqSupported tyName params derivings sp insts rest
  | _ -> v_Vuna_dTypecheck_dcollectDerivingsGo supported eqSupported rest insts
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2237 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2234 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2231 1 ("no matching clause for Vuna.Typecheck.collectDerivingsGo")
and v_Vuna_dTypecheck_dcollectDerivingNames = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4,
  a5, a6, a7) with
  | (supported, eqSupported, tyName, params, [], sp, insts, rest) -> v_Vuna_dTypecheck_dcollectDerivingsGo
supported eqSupported rest insts
  | (supported, eqSupported, tyName, params, (traitName) :: (drest), sp, insts, rest) -> if (if (v_vuna_ueq_ustr
    traitName "Show") then ((fun vuna_uneq_ula vuna_uneq_ulb -> if ((let rec vuna_ueq_ulist_ugo = fun
          vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_ustr vuna_ueq_ulh vuna_ueq_ulh2) then (vuna_ueq_ulist_ugo
                  vuna_ueq_ult vuna_ueq_ult2)
                else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in
          vuna_ueq_ulist_ugo)) vuna_uneq_ula vuna_uneq_ulb then bi_eq_int 0 1
      else bi_eq_int 0 0) params [])
  else false) then C_Vuna_dBase_dErr (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": deriving Show is only supported for non-parameterized data types")))

else (let allowedSet = if v_vuna_ueq_ustr traitName "Eq" then eqSupported
  else supported in
  (match v_Vuna_dTypecheck_ddefaultInstanceAllowed tyName drest traitName allowedSet sp with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (_) -> v_Vuna_dTypecheck_dcollectDerivingNames supported eqSupported tyName params
    drest sp ((C_Vuna_dTypecheck_dTraitInst (traitName, C_Vuna_dBase_dNothing, v_Vuna_dTypecheck_ddataHeadTy
          tyName params, v_Vuna_dTypecheck_dderivingImpls traitName tyName)) :: (insts)) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2250 8 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2242 1 ("no matching clause for Vuna.Typecheck.collectDerivingNames")

let v_Vuna_dTypecheck_dcollectDerivings = fun supported eqSupported decls -> v_Vuna_dTypecheck_dcollectDerivingsGo
supported eqSupported decls []

let rec v_Vuna_dTypecheck_dcheckInstUniqueness = fun a0 a1 -> match (a0, a1) with
  | ([], seen) -> C_Vuna_dBase_dOk ([])
  | ((inst) :: (rest), seen) -> (let key = v_Vuna_dTypecheck_dinstUniqueKey inst in
  if v_Vuna_dBase_dmemName key seen then C_Vuna_dBase_dErr ((let vuna_cat0' = ("duplicate instance: ")
      in
      (let vuna_cat1' = (v_Vuna_dTypecheck_dinstTraitName inst) in
        (let vuna_cat2' = (" ") in
          (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy (v_Vuna_dTypecheck_dinstHeadTy inst)) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  else v_Vuna_dTypecheck_dcheckInstUniqueness rest ((key) :: (seen)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2270 1 ("no matching clause for Vuna.Typecheck.checkInstUniqueness")

let rec v_Vuna_dCodegen_dvalidateCtors = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ([])
  | ((C_Vuna_dBase_dPair (name, arity)) :: (rest)) -> if v_Vuna_dBase_dmemName name (v_Vuna_dBase_dmap
  v_Vuna_dBase_dfirstOf rest) then C_Vuna_dBase_dErr ((("duplicate constructor: ") ^ (name)))
else v_Vuna_dCodegen_dvalidateCtors rest
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 388 1 ("no matching clause for Vuna.Codegen.validateCtors")

let rec v_Vuna_dEval_dexprUsesAny = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dAst_dEVar (n, _), names) -> v_Vuna_dBase_dmemName n names
  | (C_Vuna_dAst_dEApp (f, args, _), names) -> (if (v_Vuna_dEval_dexprUsesAny f names) then true
  else (v_Vuna_dEval_dany (fun a -> v_Vuna_dEval_dexprUsesAny a names) args))
  | (C_Vuna_dAst_dELam (_, body, _), names) -> v_Vuna_dEval_dexprUsesAny body names
  | (C_Vuna_dAst_dELet (binds, body, _, _), names) -> (if (v_Vuna_dEval_dany (fun b -> v_Vuna_dEval_dexprUsesAny
      (v_Vuna_dEval_dpairSecond b) names) binds) then true
  else (v_Vuna_dEval_dexprUsesAny body names))
  | (C_Vuna_dAst_dECase (s, alts, _), names) -> (if (v_Vuna_dEval_dexprUsesAny s names) then true
  else (v_Vuna_dEval_dany (fun a -> v_Vuna_dEval_dexprUsesAny (v_Vuna_dEval_dpairSecond a) names) alts))
  | (C_Vuna_dAst_dEIf (c, t, e, _), names) -> (if ((if (v_Vuna_dEval_dexprUsesAny c names) then true
      else (v_Vuna_dEval_dexprUsesAny t names))) then true
  else (v_Vuna_dEval_dexprUsesAny e names))
  | (_, names) -> false
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 126 1 ("no matching clause for Vuna.Eval.exprUsesAny")

let v_Vuna_dEval_drecursiveBindings = fun a0 -> match a0 with
  | ([]) -> false
  | (binds) -> (let names = v_Vuna_dEval_dbindNames binds in
  v_Vuna_dEval_dany (fun b -> v_Vuna_dEval_dexprUsesAny (v_Vuna_dEval_dpairSecond b) names) binds)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 136 1 ("no matching clause for Vuna.Eval.recursiveBindings")

let rec v_Vuna_dLoader_dhasDuplicateName = fun a0 -> match a0 with
  | ([]) -> false
  | ((x) :: (rest)) -> if v_Vuna_dBase_dmemName x rest then true
else v_Vuna_dLoader_dhasDuplicateName rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 68 1 ("no matching clause for Vuna.Loader.hasDuplicateName")

let rec v_Vuna_dLoader_dlookupExport = fun kinds name entries -> (match entries with
  | [] -> C_Vuna_dBase_dNothing
  | (e) :: (rest) -> if (if (v_Vuna_dBase_dmemName (v_Vuna_dLoader_dentryKind e) kinds) then (v_vuna_ueq_ustr
      (v_Vuna_dLoader_dentryPublic e) name)
    else false) then C_Vuna_dBase_dJust (e)
  else v_Vuna_dLoader_dlookupExport kinds name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 146 3 ("case pattern match failure"))

let v_Vuna_dLoader_dfindExportValue = fun entries name -> v_Vuna_dLoader_dlookupExport (("val") :: (("ctor")
    :: ([]))) name entries

let v_Vuna_dLoader_dfindExportCtor = fun entries name -> v_Vuna_dLoader_dlookupExport (("ctor") :: ([]))
name entries

let v_Vuna_dLoader_dfindExportType = fun entries name -> v_Vuna_dLoader_dlookupExport (("type") :: ([]))
name entries

let rec v_Vuna_dLoader_dmodulesExportingValueFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> (match v_Vuna_dLoader_dfindExportValue (v_Vuna_dLoader_dexportsOf modules m) name
    with
  | C_Vuna_dBase_dJust (e) -> (C_Vuna_dBase_dPair (m, e)) :: (v_Vuna_dLoader_dmodulesExportingValueFrom
      modules rest name)
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dmodulesExportingValueFrom modules rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 162 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 159 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmodulesExportingValue = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingValueFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dLoader_dmodulesExportingCtorFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> (match v_Vuna_dLoader_dfindExportCtor (v_Vuna_dLoader_dexportsOf modules m) name
    with
  | C_Vuna_dBase_dJust (e) -> (C_Vuna_dBase_dPair (m, e)) :: (v_Vuna_dLoader_dmodulesExportingCtorFrom
      modules rest name)
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dmodulesExportingCtorFrom modules rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 173 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 170 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmodulesExportingCtor = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingCtorFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dLoader_dmodulesExportingTypeFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> (match v_Vuna_dLoader_dfindExportType (v_Vuna_dLoader_dexportsOf modules m) name
    with
  | C_Vuna_dBase_dJust (e) -> (C_Vuna_dBase_dPair (m, e)) :: (v_Vuna_dLoader_dmodulesExportingTypeFrom
      modules rest name)
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dmodulesExportingTypeFrom modules rest name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 184 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 181 3 ("case pattern match failure"))

let v_Vuna_dLoader_dmodulesExportingType = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingTypeFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

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
      else (match v_Vuna_dLoader_dfindExportValue (v_Vuna_dLoader_dexportsOf modules m) base with
  | C_Vuna_dBase_dJust (e) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dentryTarget e)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
            (let vuna_cat1' = (": ") in
              (let vuna_cat2' = (base) in
                (let vuna_cat3' = (" is not exported by ") in
                  (let vuna_cat4' = (m) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 247 16 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 242 10 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 239 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveQualifiedCtor = fun modules label imports name -> (match v_Vuna_dBase_dsplitLastDot
  (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (let prefix = v_Vuna_dBase_djoinDots revPrefix in
    (match v_Vuna_dLoader_dfindImportPrefix imports prefix with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": module ") in
            (let vuna_cat2' = (prefix) in
              (let vuna_cat3' = (" is not imported") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Vuna_dBase_dJust (m) -> if v_Vuna_dLoader_disGlobalCtor base then C_Vuna_dBase_dOk (base)
      else (match v_Vuna_dLoader_dfindExportCtor (v_Vuna_dLoader_dexportsOf modules m) base with
  | C_Vuna_dBase_dJust (e) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dentryTarget e)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
            (let vuna_cat1' = (": constructor ") in
              (let vuna_cat2' = (base) in
                (let vuna_cat3' = (" is not exported by ") in
                  (let vuna_cat4' = (m) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 261 16 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 256 10 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 253 3 ("case pattern match failure"))

let v_Vuna_dLoader_downOrImportedTypeRef = fun modules prefix decls imports name -> (match v_Vuna_dLoader_dfindOwnData
  name decls with
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (dname, ctorNames)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust
    (C_Vuna_dLoader_dExportRef ("type", v_Vuna_dLoader_dmangle prefix dname, "")))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dLoader_dmodulesExportingType modules imports name with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dNothing)
  | pairs -> (match v_Vuna_dLoader_dunifyEntryPairs prefix "type" name pairs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef ("type", v_Vuna_dLoader_dentryTarget
            (v_Vuna_dBase_dsecondOf p), "")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 787 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 784 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 781 3 ("case pattern match failure"))

let v_Vuna_dLoader_dexportSelective = fun modules prefix m base name sp -> (match v_Vuna_dLoader_dfindExportValue
  (v_Vuna_dLoader_dexportsOf modules m) base with
  | C_Vuna_dBase_dJust (e) -> (match v_Vuna_dLoader_dfindExportType (v_Vuna_dLoader_dexportsOf modules
      m) base with
  | C_Vuna_dBase_dJust (te) -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dExportEntry (v_Vuna_dLoader_dentryKind
          e, base, v_Vuna_dLoader_dentryTarget e, v_Vuna_dLoader_dentryParent e)) :: ((C_Vuna_dLoader_dExportEntry
          ("type", base, v_Vuna_dLoader_dentryTarget te, "")) :: ([])))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dExportEntry (v_Vuna_dLoader_dentryKind
          e, base, v_Vuna_dLoader_dentryTarget e, v_Vuna_dLoader_dentryParent e)) :: ([]))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 845 7 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dLoader_dfindExportType (v_Vuna_dLoader_dexportsOf modules
      m) base with
  | C_Vuna_dBase_dJust (te) -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dExportEntry ("type", base, v_Vuna_dLoader_dentryTarget
          te, "")) :: ([]))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (prefix) in
        (let vuna_cat1' = (": ") in
          (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
            (let vuna_cat3' = (": cannot export unknown name ") in
              (let vuna_cat4' = (name) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 853 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 843 3 ("case pattern match failure"))

let v_Vuna_dLoader_dexportTypeAll = fun modules prefix decls imports name sp -> (match v_Vuna_dBase_dsplitLastDot
  (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (match revPrefix with
  | [] -> if v_Vuna_dLoader_disPrivateName name then C_Vuna_dBase_dErr (v_Vuna_dLoader_dprivateExportMsg
      prefix sp name)
    else (match v_Vuna_dLoader_dfindOwnData name decls with
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (dname, ctorNames)) -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dExportEntry
          ("type", name, v_Vuna_dLoader_dmangle prefix dname, "")) :: (v_Vuna_dLoader_downCtorEntries
          prefix dname ctorNames))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dLoader_dmodulesExportingType modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (prefix) in
            (let vuna_cat1' = (": ") in
              (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
                (let vuna_cat3' = (": cannot export unknown name ") in
                  (let vuna_cat4' = (name) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | pairs -> (match v_Vuna_dLoader_dunifyEntryPairs prefix "type" name pairs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (p) -> (let m = v_Vuna_dBase_dfirstOf p in
            (let tgt = v_Vuna_dLoader_dentryTarget (v_Vuna_dBase_dsecondOf p) in
              C_Vuna_dBase_dOk ((C_Vuna_dLoader_dExportEntry ("type", name, tgt, "")) :: (v_Vuna_dLoader_dctorEntriesOfType
                  tgt (v_Vuna_dLoader_dexportsOf modules m)))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 876 21 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 872 17 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 865 13 ("case pattern match failure"))
  | _ -> (let mprefix = v_Vuna_dBase_djoinDots revPrefix in
      (match v_Vuna_dLoader_dfindImportPrefix imports mprefix with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (prefix) in
            (let vuna_cat1' = (": ") in
              (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
                (let vuna_cat3' = (": module ") in
                  (let vuna_cat4' = (mprefix) in
                    (let vuna_cat5' = (" is not imported") in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                      vuna_cat5'])))))))
  | C_Vuna_dBase_dJust (m) -> (match v_Vuna_dLoader_dfindExportType (v_Vuna_dLoader_dexportsOf modules
            m) base with
  | C_Vuna_dBase_dJust (e) -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dExportEntry ("type", base, v_Vuna_dLoader_dentryTarget
                e, "")) :: (v_Vuna_dLoader_dctorEntriesOfType (v_Vuna_dLoader_dentryTarget e) (v_Vuna_dLoader_dexportsOf
                modules m)))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (prefix) in
              (let vuna_cat1' = (": ") in
                (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
                  (let vuna_cat3' = (": type ") in
                    (let vuna_cat4' = (base) in
                      (let vuna_cat5' = (" is not exported by ") in
                        (let vuna_cat6' = (m) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6']))))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 891 18 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 887 14 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 861 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 859 3 ("case pattern match failure"))

let rec v_Vuna_dBase_dlookupPair = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (k, v)) :: (rest)) -> if v_vuna_ueq_ustr k name then C_Vuna_dBase_dJust
(v)
else v_Vuna_dBase_dlookupPair name rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 102 1 ("no matching clause for Vuna.Base.lookupPair")

let rec v_Vuna_dTypecheck_drebuildDecls = fun a0 a1 -> match (a0, a1) with
  | ([], elabMap) -> []
  | ((d) :: (rest), elabMap) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> (match v_Vuna_dBase_dlookupPair name elabMap with
  | C_Vuna_dBase_dJust ((C_Vuna_dBase_dPair (pats2, body2)) :: (restElab)) -> (C_Vuna_dAst_dDFun (name,
        pats2, body2, sp)) :: (v_Vuna_dTypecheck_drebuildDecls rest (v_Vuna_dTypecheck_dreplaceElab name
        restElab elabMap))
  | _ -> (d) :: (v_Vuna_dTypecheck_drebuildDecls rest elabMap)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1565 7 ("case pattern match failure"))
  | _ -> (d) :: (v_Vuna_dTypecheck_drebuildDecls rest elabMap)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1563 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1561 1 ("no matching clause for Vuna.Typecheck.rebuildDecls")

let v_vuna_uneq_ustr = fun a b -> bi_neq_str a b

let v_Vuna_dTypecheck_disDictTrait = fun tr -> (if (v_vuna_uneq_ustr tr "Eq") then (v_vuna_uneq_ustr tr
    "Ord")
  else false)

let v_Vuna_dEval_dneqBuiltin = fun sp args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (v_vuna_uneq_uint a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (v_vuna_uneq_ustr a b))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for /="
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 309 3 ("case pattern match failure"))

let v_vuna_ult_uint = fun a b -> bi_lt_int a b

let v_Vuna_dTypedCodegen_dpadCode = fun c -> if v_vuna_ult_uint c 10 then (("00") ^ (bi_str_from_int c))

else if v_vuna_ult_uint c 100 then (("0") ^ (bi_str_from_int c))
else bi_str_from_int c

let v_vuna_ule_uint = fun a b -> bi_le_int a b

let rec v_Lint_dspaceChars = fun n -> if v_vuna_ule_uint n 0 then []
else (32) :: (v_Lint_dspaceChars (bi_sub n 1))

let v_Lint_dspaces = fun n -> bi_str_pack (v_Lint_dspaceChars n)

let rec v_Lint_dnthLine = fun a0 a1 -> match (a0, a1) with
  | ([], n) -> ""
  | ((line) :: (rest), n) -> if v_vuna_ule_uint n 1 then line
else v_Lint_dnthLine rest (bi_sub n 1)
  | _ -> vuna_fail "app/Lint.vuna" 101 1 ("no matching clause for Lint.nthLine")

let v_Lint_dlineAt = fun lines n -> v_Lint_dnthLine lines n

let rec v_Lint_dtakeChars = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (c) :: (rest)) -> if v_vuna_ule_uint n 0 then []
else (c) :: (v_Lint_dtakeChars (bi_sub n 1) rest)
  | _ -> vuna_fail "app/Lint.vuna" 107 1 ("no matching clause for Lint.takeChars")

let rec v_Lint_ddropChars = fun n chars -> if v_vuna_ule_uint n 0 then chars
else (match chars with
  | [] -> []
  | (c) :: (rest) -> v_Lint_ddropChars (bi_sub n 1) rest
  | _ -> vuna_fail "app/Lint.vuna" 114 5 ("case pattern match failure"))

let v_Lint_dsliceChars = fun start count chars -> v_Lint_dtakeChars count (v_Lint_ddropChars start chars)

let v_Lint_dsliceLine = fun start count line -> bi_str_pack (v_Lint_dsliceChars start count (bi_str_unpack
    line))

let v_Lint_ddropIndent = fun n line -> bi_str_pack (v_Lint_ddropChars n (bi_str_unpack line))

let rec v_Lint_dnthChar = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> 0
  | (i, (c) :: (rest)) -> if v_vuna_ule_uint i 0 then c
else v_Lint_dnthChar (bi_sub i 1) rest
  | _ -> vuna_fail "app/Lint.vuna" 124 1 ("no matching clause for Lint.nthChar")

let rec v_Lint_dtrimLen = fun chars n -> if v_vuna_ule_uint n 0 then 0
else if v_Lint_disSpaceChar (v_Lint_dnthChar (bi_sub n 1) chars) then v_Lint_dtrimLen chars (bi_sub n
  1)
else n

let v_Lint_dtrimEnd = fun line -> bi_str_pack (v_Lint_dtakeChars (v_Lint_dtrimLen (bi_str_unpack line)
    (v_Vuna_dBase_dlength (bi_str_unpack line))) (bi_str_unpack line))

let v_Lint_dtrimBoth = fun line -> v_Lint_dtrimStart (v_Lint_dtrimEnd line)

let v_Lint_dtextFromCol = fun line col -> v_Lint_dtrimBoth (bi_str_pack (v_Lint_ddropChars (bi_sub col
      1) (bi_str_unpack line)))

let v_Lint_dtailFromCol = fun line col -> bi_str_pack (v_Lint_ddropChars (bi_sub col 1) (bi_str_unpack
    line))

let v_Lint_drenderLitBranch = fun indent branch -> (let vuna_cat0' = (v_Lint_dspaces (bi_add indent 2))
  in
  (let vuna_cat1' = (v_Lint_dlitText branch) in
    (let vuna_cat2' = (" => ") in
      (let vuna_cat3' = (v_Lint_dlitExpr branch) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let v_Lint_dmakeChainFinding = fun firstLine indent scrutinee acc defaultText lastLine -> (let branches
  = v_Vuna_dBase_dreverse acc in
  if v_vuna_ult_uint (v_Vuna_dBase_dlength branches) 2 then []
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

let v_Lint_denclosingClause = fun lines toks headLine -> if v_vuna_ult_uint headLine 1 then C_Vuna_dBase_dNothing

else (let line = v_Lint_dlineAt lines headLine in
  if v_Lint_disBlankLine line then C_Vuna_dBase_dNothing
  else if v_vuna_uneq_uint (v_Lint_dindentOf line) 0 then C_Vuna_dBase_dNothing
  else (let ts = v_Lint_dtokensOnLine toks headLine in
    if (if (v_Lint_dhasSym ts "=") then (v_Lint_dnotBool (v_Lint_dhasSym ts "=>"))
      else false) then C_Vuna_dBase_dJust (C_Lint_dEnclosing (headLine, ts, "clause"))
    else C_Vuna_dBase_dNothing))

let v_Lint_dreplaceIdentInLine = fun line tok replacement -> (let col = v_Lint_dtokCol tok in
  let len = bi_str_length (v_Lint_dtokenText tok) in
  let prefix = v_Lint_dsliceLine 0 (bi_sub col 1) line in
  let suffix = v_Lint_dtailFromCol line (bi_add col len) in
  (let vuna_cat0' = (prefix) in
    (let vuna_cat1' = (replacement) in
      (let vuna_cat2' = (suffix) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let rec v_Lint_dinsertFinding = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> (f) :: ([])
  | (f, (g) :: (rest)) -> if v_vuna_ult_uint (v_Lint_dfindingLine f) (v_Lint_dfindingLine g) then (f)
:: ((g) :: (rest))
else if (if (v_vuna_ueq_uint (v_Lint_dfindingLine f) (v_Lint_dfindingLine g)) then (v_vuna_ule_uint (v_Lint_dfindingCol
      f) (v_Lint_dfindingCol g))
  else false) then (f) :: ((g) :: (rest))
else (g) :: (v_Lint_dinsertFinding f rest)
  | _ -> vuna_fail "app/Lint.vuna" 682 1 ("no matching clause for Lint.insertFinding")

let rec v_Lint_dsortFindings = fun a0 -> match a0 with
  | ([]) -> []
  | ((f) :: (rest)) -> v_Lint_dinsertFinding f (v_Lint_dsortFindings rest)
  | _ -> vuna_fail "app/Lint.vuna" 678 1 ("no matching clause for Lint.sortFindings")

let rec v_Lint_dtakeList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (rest)) -> if v_vuna_ule_uint n 0 then []
else (x) :: (v_Lint_dtakeList (bi_sub n 1) rest)
  | _ -> vuna_fail "app/Lint.vuna" 706 1 ("no matching clause for Lint.takeList")

let rec v_Lint_ddropList = fun n lines -> if v_vuna_ule_uint n 0 then lines
else (match lines with
  | [] -> []
  | (x) :: (rest) -> v_Lint_ddropList (bi_sub n 1) rest
  | _ -> vuna_fail "app/Lint.vuna" 713 5 ("case pattern match failure"))

let v_Lint_dreplaceRange = fun start stop newLines lines -> v_Vuna_dBase_dappend (v_Lint_dtakeList (bi_sub
    start 1) lines) (v_Vuna_dBase_dappend newLines (v_Lint_ddropList stop lines))

let rec v_Lint_dapplyEditList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | ([], lines, limit, count) -> C_Vuna_dBase_dPair (count, lines)
  | ((e) :: (rest), lines, limit, count) -> if v_vuna_ult_uint (v_Lint_deditEnd e) limit then v_Lint_dapplyEditList
rest (v_Lint_dreplaceRange (v_Lint_deditStart e) (v_Lint_deditEnd e) (v_Lint_deditLines e) lines) (v_Lint_deditStart
  e) (bi_add count 1)
else v_Lint_dapplyEditList rest lines limit count
  | _ -> vuna_fail "app/Lint.vuna" 719 1 ("no matching clause for Lint.applyEditList")

let rec v_Vuna_dLoader_dtakeSegs = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (rest)) -> if v_vuna_ule_uint n 0 then []
else (x) :: (v_Vuna_dLoader_dtakeSegs (bi_sub n 1) rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 288 1 ("no matching clause for Vuna.Loader.takeSegs")

let rec v_Vuna_dLoader_ddropSegs = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (rest)) -> if v_vuna_ule_uint n 0 then (x) :: (rest)
else v_Vuna_dLoader_ddropSegs (bi_sub n 1) rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 291 1 ("no matching clause for Vuna.Loader.dropSegs")

let rec v_Vuna_dLoader_dresolveQualifiedPath = fun modules label imports segs n sp -> if v_vuna_ule_uint
n 1 then C_Vuna_dBase_dOk (C_Vuna_dBase_dNothing)
else (match v_Vuna_dLoader_dfindImportPrefix imports (v_Vuna_dBase_djoinDots (v_Vuna_dLoader_dtakeSegs
      (bi_sub n 1) segs)) with
  | C_Vuna_dBase_dJust (m) -> (match v_Vuna_dLoader_ddropSegs (bi_sub n 1) segs with
  | (member) :: ([]) -> if v_Vuna_dLoader_disGlobalCtor member then C_Vuna_dBase_dOk (C_Vuna_dBase_dJust
      (C_Vuna_dAst_dEVar (member, sp)))
    else (match v_Vuna_dLoader_dfindExportValue (v_Vuna_dLoader_dexportsOf modules m) member with
  | C_Vuna_dBase_dJust (e) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (C_Vuna_dAst_dEVar (v_Vuna_dLoader_dentryTarget
            e, sp)))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": ") in
            (let vuna_cat2' = (member) in
              (let vuna_cat3' = (" is not exported by ") in
                (let vuna_cat4' = (m) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 303 15 ("case pattern match failure"))
  | (member) :: (rest) -> (match v_Vuna_dLoader_dfindExportValue (v_Vuna_dLoader_dexportsOf modules m)
      member with
  | C_Vuna_dBase_dJust (e) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (v_Vuna_dLoader_dfoldFieldChain (C_Vuna_dAst_dEVar
            (v_Vuna_dLoader_dentryTarget e, sp)) rest sp))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": ") in
            (let vuna_cat2' = (member) in
              (let vuna_cat3' = (" is not exported by ") in
                (let vuna_cat4' = (m) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 307 13 ("case pattern match failure"))
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dNothing)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 299 9 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dresolveQualifiedPath modules label imports segs (bi_sub n
    1) sp
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 297 5 ("case pattern match failure"))

let v_vuna_ugt_uint = fun a b -> bi_gt_int a b

let rec v_Lint_dblankFill = fun n stop -> if v_vuna_ugt_uint n stop then []
else ("") :: (v_Lint_dblankFill (bi_add n 1) stop)

let rec v_Lint_dsimpleFrom = fun a0 a1 -> match (a0, a1) with
  | ([], depth) -> v_vuna_ueq_uint depth 0
  | ((t) :: (rest), depth) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (s), p) -> if (if (v_vuna_ueq_ustr s "(") then true
    else (v_vuna_ueq_ustr s "[")) then v_Lint_dsimpleFrom rest (bi_add depth 1)
  else if (if (v_vuna_ueq_ustr s ")") then true
    else (v_vuna_ueq_ustr s "]")) then if v_vuna_ugt_uint depth 0 then v_Lint_dsimpleFrom rest (bi_sub
    depth 1)
  else false
  else v_Lint_dsimpleFrom rest depth
  | _ -> v_Lint_dsimpleFrom rest depth
  | _ -> vuna_fail "app/Lint.vuna" 282 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 279 1 ("no matching clause for Lint.simpleFrom")

let v_Lint_disSimpleTokens = fun toks -> (if (v_Lint_dsimpleFrom toks 0) then (v_Lint_dnoKeyword toks)

  else false)

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
  | _ -> vuna_fail "app/Lint.vuna" 318 25 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 315 21 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 312 17 ("case pattern match failure"))
      else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 308 11 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 305 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 302 3 ("case pattern match failure"))

let v_Lint_dfinalElseText = fun line elseTok rest -> if v_Lint_disNilList rest then C_Vuna_dBase_dNothing

else if v_Lint_dstartsWithIf rest then C_Vuna_dBase_dNothing
else if v_Lint_disSimpleTokens rest then C_Vuna_dBase_dJust (v_Lint_dtextFromCol line (bi_add (v_Lint_dtokCol
      elseTok) 4))
else C_Vuna_dBase_dNothing

let rec v_Lint_dfinishChain = fun lines toks lastLine n indent firstLine scrutinee acc -> if v_vuna_ugt_uint
n lastLine then []
else (let line = v_Lint_dlineAt lines n in
  (let ts = v_Lint_dtokensOnLine toks n in
    if v_Lint_disNilList ts then []
    else if v_vuna_uneq_uint (v_Lint_dindentOf line) indent then []
    else if v_Lint_dhasComment line then []
    else (match ts with
  | [] -> []
  | (first) :: (rest) -> if v_Lint_dtokIsKw first "else" then (match rest with
  | [] -> []
  | (second) :: (rest2) -> if v_Lint_dtokIsKw second "if" then (match v_Lint_dparseIfHead rest2 line with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (head) -> if v_vuna_ueq_ustr (v_Lint_dheadName head) scrutinee then v_Lint_dfinishChain
          lines toks lastLine (bi_add n 1) indent firstLine scrutinee ((C_Lint_dLitBranch (v_Lint_dheadText
                head, v_Lint_dheadExpr head)) :: (acc))
          else []
  | _ -> vuna_fail "app/Lint.vuna" 361 22 ("case pattern match failure"))
        else (match v_Lint_dfinalElseText line first rest with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (text) -> v_Lint_dmakeChainFinding firstLine indent scrutinee acc text n
  | _ -> vuna_fail "app/Lint.vuna" 368 22 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 357 16 ("case pattern match failure"))
      else []
  | _ -> vuna_fail "app/Lint.vuna" 353 10 ("case pattern match failure"))))

let v_Lint_difChainAt = fun lines toks lastLine n -> (let line = v_Lint_dlineAt lines n in
  (let ts = v_Lint_dtokensOnLine toks n in
    if v_Lint_disNilList ts then []
    else if v_Lint_dhasComment line then []
    else (match ts with
  | [] -> []
  | (first) :: (rest) -> if (if (v_Lint_dtokIsKw first "if") then (v_vuna_ueq_uint (v_Lint_dtokCol first)
          (bi_add (v_Lint_dindentOf line) 1))
        else false) then (match v_Lint_dparseIfHead rest line with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (head) -> v_Lint_dfinishChain lines toks lastLine (bi_add n 1) (v_Lint_dindentOf
          line) n (v_Lint_dheadName head) ((C_Lint_dLitBranch (v_Lint_dheadText head, v_Lint_dheadExpr
              head)) :: ([]))
  | _ -> vuna_fail "app/Lint.vuna" 383 14 ("case pattern match failure"))
      else []
  | _ -> vuna_fail "app/Lint.vuna" 379 8 ("case pattern match failure"))))

let rec v_Lint_dscanIfChains = fun lines toks n lastLine -> if v_vuna_ugt_uint n lastLine then []
else v_Vuna_dBase_dappend (v_Lint_difChainAt lines toks lastLine n) (v_Lint_dscanIfChains lines toks (bi_add
    n 1) lastLine)

let rec v_Lint_dnextNonBlank = fun lines n lastLine -> if v_vuna_ugt_uint n lastLine then n
else (let line = v_Lint_dlineAt lines n in
  if v_Lint_disBlankLine line then v_Lint_dnextNonBlank lines (bi_add n 1) lastLine
  else n)

let v_Lint_dlastClauseCheck = fun lines toks lastLine stop fnName -> (let next = v_Lint_dnextNonBlank
  lines stop lastLine in
  if v_vuna_ugt_uint next lastLine then true
  else (let line = v_Lint_dlineAt lines next in
    if v_vuna_uneq_uint (v_Lint_dindentOf line) 0 then false
    else (let ts = v_Lint_dtokensOnLine toks next in
      (match v_Lint_dheadToken ts with
  | C_Vuna_dBase_dNothing -> false
  | C_Vuna_dBase_dJust (t) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (other) -> v_Lint_dnotBool (v_vuna_ueq_ustr other fnName)
  | C_Vuna_dBase_dNothing -> true
  | _ -> vuna_fail "app/Lint.vuna" 533 28 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 531 16 ("case pattern match failure")))))

let v_Lint_dlastAltCheck = fun lines toks lastLine stop indent -> (let next = v_Lint_dnextNonBlank lines
  stop lastLine in
  if v_vuna_ugt_uint next lastLine then true
  else (let line = v_Lint_dlineAt lines next in
    (let ind = v_Lint_dindentOf line in
      if v_vuna_ueq_uint ind (bi_sub indent 2) then if v_Lint_dhasSym (v_Lint_dtokensOnLine toks next)
      "=>" then false
      else true
      else if v_vuna_ult_uint ind (bi_sub indent 2) then true
      else false)))

let rec v_Lint_dlinesClean = fun lines start stop -> if v_vuna_ugt_uint start stop then true
else (let line = v_Lint_dlineAt lines start in
  if (if (v_Lint_dhasComment line) then true
    else (v_Lint_dhasTabOrCR line)) then false
  else v_Lint_dlinesClean lines (bi_add start 1) stop)

let v_Lint_denclosingIsLast = fun lines toks lastLine stop indent kind fnOrKind -> if v_vuna_ueq_ustr
kind "clause" then v_Lint_dlastClauseCheck lines toks lastLine stop fnOrKind
else v_Lint_dlastAltCheck lines toks lastLine stop indent

let rec v_Lint_dinsertEdit = fun a0 a1 -> match (a0, a1) with
  | (e, []) -> (e) :: ([])
  | (e, (f) :: (rest)) -> if v_vuna_ugt_uint (v_Lint_deditStart e) (v_Lint_deditStart f) then (e) :: ((f)
  :: (rest))
else (f) :: (v_Lint_dinsertEdit e rest)
  | _ -> vuna_fail "app/Lint.vuna" 693 1 ("no matching clause for Lint.insertEdit")

let rec v_Lint_dsortEdits = fun a0 -> match a0 with
  | ([]) -> []
  | ((e) :: (rest)) -> v_Lint_dinsertEdit e (v_Lint_dsortEdits rest)
  | _ -> vuna_fail "app/Lint.vuna" 689 1 ("no matching clause for Lint.sortEdits")

let v_Vuna_dTypedCodegen_dindentWidth = fun depth -> if v_vuna_ugt_uint depth 12 then 24
else bi_mul depth 2

let v_Vuna_dTypedCodegen_descapeChar = fun c -> if v_vuna_ueq_uint c 34 then "\\\""
else if v_vuna_ueq_uint c 92 then "\\\\"
else if v_vuna_ueq_uint c 10 then "\n"
else if v_vuna_ueq_uint c 9 then "\t"
else if v_vuna_ult_uint c 32 then (("\\") ^ (v_Vuna_dTypedCodegen_dpadCode c))
else if v_vuna_ugt_uint c 126 then (("\\") ^ (v_Vuna_dTypedCodegen_dpadCode c))
else bi_str_pack ((c) :: ([]))

let rec v_Vuna_dTypedCodegen_descapeLong = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (v_Vuna_dTypedCodegen_descapeChar c) :: (v_Vuna_dTypedCodegen_descapeLong rest)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 1022 1 ("no matching clause for Vuna.TypedCodegen.escapeLong")

let rec v_Vuna_dCodegen_dmakeParamsFrom = fun i n -> if v_vuna_ugt_uint i n then []
else ((("a") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeParams = fun n -> v_Vuna_dCodegen_dmakeParamsFrom 1 n

let rec v_Vuna_dCodegen_dmakeCtorParamsFrom = fun i n -> if v_vuna_ugt_uint i n then []
else ((("c") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeCtorParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeCtorParams = fun n -> v_Vuna_dCodegen_dmakeCtorParamsFrom 1 n

let v_Vuna_dParser_dcanContinue = fun st blockCol -> (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> (match v_Vuna_dParser_dlastPos st with
  | C_Vuna_dBase_dPos (lastLine, lastCol) -> (if (v_vuna_ueq_uint line lastLine) then true
      else (v_vuna_ugt_uint col blockCol))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 59 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 57 3 ("case pattern match failure"))

let v_Vuna_dParser_dbadCaseIndent = fun st altCol -> if v_Vuna_dParser_disEof st then false
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ugt_uint col altCol then (match v_Vuna_dParser_dterminatesExpression
    (v_Vuna_dParser_dpeekTok st) with
  | true -> false
  | false -> true
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 156 11 ("case pattern match failure"))
  else false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 153 5 ("case pattern match failure"))

let v_vuna_uge_uint = fun a b -> bi_ge_int a b

let v_Lint_dstartsLower = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122)
    else false)
  | _ -> vuna_fail "app/Lint.vuna" 151 3 ("case pattern match failure"))

let v_Lint_dstartsUpper = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90)
    else false)
  | _ -> vuna_fail "app/Lint.vuna" 156 3 ("case pattern match failure"))

let rec v_Lint_dbodyMentionsVar = fun toks var start stop -> if v_vuna_uge_uint start stop then false

else if v_vuna_ugt_uint (v_Lint_dcountIdent var (v_Lint_dtokensOnLine toks start)) 0 then true
else v_Lint_dbodyMentionsVar toks var (bi_add start 1) stop

let rec v_Lint_dlowercaseIdents = fun a0 -> match a0 with
  | ([]) -> []
  | ((t) :: (rest)) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (name) -> if (if (v_Lint_dstartsLower name) then (v_vuna_uneq_ustr name "_")
    else false) then (name) :: (v_Lint_dlowercaseIdents rest)
  else v_Lint_dlowercaseIdents rest
  | C_Vuna_dBase_dNothing -> v_Lint_dlowercaseIdents rest
  | _ -> vuna_fail "app/Lint.vuna" 266 3 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 263 1 ("no matching clause for Lint.lowercaseIdents")

let v_Lint_dctorOrLitPattern = fun toks -> (match toks with
  | [] -> false
  | (t) :: (rest) -> (match v_Lint_dtokIdentOf t with
  | C_Vuna_dBase_dJust (name) -> v_Lint_dstartsUpper name
  | C_Vuna_dBase_dNothing -> (match v_Lint_dtokIntOf t with
  | C_Vuna_dBase_dJust (n) -> true
  | C_Vuna_dBase_dNothing -> (match v_Lint_dtokStrOf t with
  | C_Vuna_dBase_dJust (s) -> true
  | C_Vuna_dBase_dNothing -> false
  | _ -> vuna_fail "app/Lint.vuna" 448 15 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 445 11 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 442 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 439 3 ("case pattern match failure"))

let rec v_Lint_dbodyIndentOk = fun lines n stop indent -> if v_vuna_uge_uint n stop then true
else (let line = v_Lint_dlineAt lines n in
  if v_Lint_disBlankLine line then v_Lint_dbodyIndentOk lines (bi_add n 1) stop indent
  else if (if (v_Lint_dhasComment line) then true
    else (v_Lint_dhasTabOrCR line)) then false
  else if v_vuna_ult_uint (v_Lint_dindentOf line) (bi_add indent 4) then false
  else v_Lint_dbodyIndentOk lines (bi_add n 1) stop indent)

let rec v_Lint_dnoSiblingAlt = fun lines toks n stop indent -> if v_vuna_uge_uint n stop then true
else (let line = v_Lint_dlineAt lines n in
  (let ts = v_Lint_dtokensOnLine toks n in
    if v_Lint_disBlankLine line then v_Lint_dnoSiblingAlt lines toks (bi_add n 1) stop indent
    else if (if (v_vuna_ueq_uint (v_Lint_dindentOf line) (bi_add indent 2)) then (v_Lint_dhasSym ts "=>")

      else false) then false
    else v_Lint_dnoSiblingAlt lines toks (bi_add n 1) stop indent))

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
        let oneOccurrence = v_vuna_ueq_uint (v_Lint_dcountIdent var patArea) 1 in
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
  | _ -> vuna_fail "app/Lint.vuna" 617 10 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 614 6 ("case pattern match failure")))

let v_Lint_dinlineShape = fun lines toks lastLine caseLine indent var enclosing patToks patText arrow
bodyToks -> (let altLine = bi_add caseLine 1 in
  let altText = v_Lint_dlineAt lines altLine in
  let next = v_Lint_dnextNonBlank lines (bi_add altLine 1) lastLine in
  if v_Lint_dnotBool (v_Lint_dsimpleFrom bodyToks 0) then []
  else if (if (v_vuna_ule_uint next lastLine) then (v_vuna_uge_uint (v_Lint_dindentOf (v_Lint_dlineAt
          lines next)) indent)
    else false) then []
  else if v_Lint_dnotBool (v_Lint_dlinesClean lines (v_Lint_denclosingLine enclosing) (bi_add caseLine
      1)) then []
  else (let bodyText = v_Lint_dtextFromCol altText (bi_add (v_Lint_dtokCol arrow) 2) in
    let tailEnd = if v_vuna_ugt_uint next lastLine then lastLine
    else bi_sub next 1 in
    let newBody = (((v_Lint_dspaces indent) ^ (bodyText))) :: (v_Lint_dblankFill (bi_add altLine 1)
      tailEnd) in
    v_Lint_dredundantFinding lines toks lastLine caseLine indent var enclosing patToks patText (v_vuna_ugt_uint
      (v_Lint_dcountIdent var bodyToks) 0) next newBody))

let rec v_Vuna_dTypedCodegen_drange = fun i n -> if v_vuna_uge_uint i n then []
else (i) :: (v_Vuna_dTypedCodegen_drange (bi_add i 1) n)

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
else if v_vuna_ueq_uint c 92 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true true
c ((c) :: (acc))
else if v_vuna_ueq_uint c 34 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false
c ((c) :: (acc))
else if v_vuna_ueq_uint c 10 then v_Vuna_dTypedCodegen_dformatChars rest 0 depth true false c ((c) ::
  (acc))
else v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false c ((c) :: (acc))
else if v_vuna_ueq_uint c 34 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth true false
c ((c) :: (acc))
else if v_vuna_ueq_uint c 10 then v_Vuna_dTypedCodegen_dformatChars rest 0 depth false false c ((c) ::
  (v_Vuna_dTypedCodegen_dtrimTrailing acc))
else if v_vuna_ueq_uint c 40 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) (bi_add depth
  1) false false c ((c) :: (acc))
else if v_vuna_ueq_uint c 41 then v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) (if v_vuna_ugt_uint
  depth 0 then bi_sub depth 1
  else 0) false false c ((c) :: (acc))
else if (if (v_vuna_ueq_uint prev 32) then (v_vuna_ueq_uint c 105)
  else false) then (match rest with
  | (110) :: ((32) :: (rest2)) -> (let width = v_Vuna_dTypedCodegen_dindentWidth depth in
    v_Vuna_dTypedCodegen_dformatChars rest2 (bi_add width 2) depth false false 32 (v_Vuna_dTypedCodegen_demitStr
      ((("in\n") ^ (v_Vuna_dTypedCodegen_dindentSpaces width))) acc))
  | _ -> v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 985 5 ("case pattern match failure"))
else if (if (v_vuna_ueq_uint prev 32) then (v_vuna_ueq_uint c 101)
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 991 5 ("case pattern match failure"))
else if (if (v_vuna_ueq_uint c 32) then (v_vuna_ugt_uint col 100)
  else false) then (let width = v_Vuna_dTypedCodegen_dindentWidth depth in
  v_Vuna_dTypedCodegen_dformatChars rest width depth false false 32 (v_Vuna_dTypedCodegen_demitStr ((("\n")
        ^ (v_Vuna_dTypedCodegen_dindentSpaces width))) (v_Vuna_dTypedCodegen_dtrimTrailing acc)))
else v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 972 1 ("no matching clause for Vuna.TypedCodegen.formatChars")

let v_Vuna_dTypedCodegen_dformatOutput = fun s -> bi_str_pack (v_Vuna_dBase_dreverse (v_Vuna_dTypedCodegen_dtrimTrailing
    (v_Vuna_dTypedCodegen_dformatChars (bi_str_unpack s) 0 0 false false 0 [])))

let v_Vuna_dTypecheck_disLowerName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122)
    else false)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 223 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_drecFieldVarsAt = fun i n -> if v_vuna_uge_uint i n then []
else ((("vuna_rf") ^ (bi_str_from_int i))) :: (v_Vuna_dTypecheck_drecFieldVarsAt (bi_add i 1) n)

let v_Vuna_dTypecheck_drecFieldVars = fun n -> v_Vuna_dTypecheck_drecFieldVarsAt 0 n

let rec v_Vuna_dTypecheck_dvarNamesAt = fun prefix i n -> if v_vuna_uge_uint i n then []
else (((prefix) ^ (bi_str_from_int i))) :: (v_Vuna_dTypecheck_dvarNamesAt prefix (bi_add i 1) n)

let v_Vuna_dTypecheck_dvarNames = fun prefix n -> v_Vuna_dTypecheck_dvarNamesAt prefix 0 n

let v_Vuna_dTypecheck_dshowCtorBody = fun cname n -> if v_vuna_ueq_uint n 0 then v_Vuna_dTypecheck_dtcQuote
(v_Vuna_dTypecheck_dlastSeg cname)
else (let vuna_cat0' = ("(") in
  (let vuna_cat1' = (v_Vuna_dTypecheck_dtcJoin " ++ " (v_Vuna_dBase_dappend ((v_Vuna_dTypecheck_dtcQuote
            "(") :: ((v_Vuna_dTypecheck_dtcQuote (v_Vuna_dTypecheck_dlastSeg cname)) :: (v_Vuna_dBase_dappend
              (v_Vuna_dTypecheck_dshowArgParts (v_Vuna_dTypecheck_dvarNames "v" n)) ((v_Vuna_dTypecheck_dtcQuote
                  ")") :: ([]))))) [])) in
    (let vuna_cat2' = (")") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypecheck_dstructuralShowClause = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (cname, ftypes)) -> (let vuna_cat0' = ("  ") in
  (let vuna_cat1' = (v_Vuna_dTypecheck_dctorPatternSrc cname (v_Vuna_dTypecheck_dvarNames "v" (v_Vuna_dBase_dlength
          ftypes))) in
    (let vuna_cat2' = (" => ") in
      (let vuna_cat3' = (v_Vuna_dTypecheck_dshowCtorBody cname (v_Vuna_dBase_dlength ftypes)) in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1989 1 ("no matching clause for Vuna.Typecheck.structuralShowClause")

let v_Vuna_dTypecheck_dstructuralShowSrc = fun sh -> (let tyName = v_Vuna_dTypecheck_dshapeName sh in
  (let vuna_cat0' = (v_Vuna_dTypecheck_dshowFnName tyName) in
    (let vuna_cat1' = (" : ") in
      (let vuna_cat2' = (tyName) in
        (let vuna_cat3' = (" -> String\n") in
          (let vuna_cat4' = (v_Vuna_dTypecheck_dshowFnName tyName) in
            (let vuna_cat5' = (" x = case x of\n") in
              (let vuna_cat6' = (v_Vuna_dTypecheck_dtcJoin "\n" (v_Vuna_dBase_dmap v_Vuna_dTypecheck_dstructuralShowClause
                    (v_Vuna_dTypecheck_dshapeCtors sh))) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                vuna_cat6']))))))))

let v_Vuna_dTypecheck_dstructuralEqClause = fun a0 a1 -> match (a0, a1) with
  | (params, C_Vuna_dBase_dPair (cname, ftypes)) -> (let n = v_Vuna_dBase_dlength ftypes in
  (let vuna_cat0' = ("  ") in
    (let vuna_cat1' = (v_Vuna_dTypecheck_dctorPatternSrc cname (v_Vuna_dTypecheck_dvarNames "v" n))
      in
      (let vuna_cat2' = (" => case y of\n    ") in
        (let vuna_cat3' = (v_Vuna_dTypecheck_dctorPatternSrc cname (v_Vuna_dTypecheck_dvarNames "w"
              n)) in
          (let vuna_cat4' = (" => ") in
            (let vuna_cat5' = (v_Vuna_dTypecheck_deqCondSrc params ftypes (v_Vuna_dTypecheck_dvarNames
                  "v" n) (v_Vuna_dTypecheck_dvarNames "w" n)) in
              (let vuna_cat6' = ("\n    _ => (0 == 1)") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                vuna_cat6']))))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2032 1 ("no matching clause for Vuna.Typecheck.structuralEqClause")

let v_Vuna_dTypecheck_dstructuralEqSrc = fun sh -> (let tyName = v_Vuna_dTypecheck_dshapeName sh in
  (let params = v_Vuna_dTypecheck_dshapeParams sh in
    (let vuna_cat0' = (v_Vuna_dTypecheck_deqFnName tyName) in
      (let vuna_cat1' = (" : ") in
        (let vuna_cat2' = (v_Vuna_dTypecheck_deqSigTypeSrc sh) in
          (let vuna_cat3' = (" -> ") in
            (let vuna_cat4' = (v_Vuna_dTypecheck_deqSigTypeSrc sh) in
              (let vuna_cat5' = (" -> Bool\n") in
                (let vuna_cat6' = (v_Vuna_dTypecheck_deqFnName tyName) in
                  (let vuna_cat7' = (" x y = case x of\n") in
                    (let vuna_cat8' = (v_Vuna_dTypecheck_dtcJoin "\n" (v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dstructuralEqClause
                        params) (v_Vuna_dTypecheck_dshapeCtors sh))) in
                      (let vuna_cat9' = ("\n  _ => (0 == 1)\n") in
                        (let vuna_cat10' = (v_Vuna_dTypecheck_dneqFnName tyName) in
                        (let vuna_cat11' = (" : ") in
                        (let vuna_cat12' = (v_Vuna_dTypecheck_deqSigTypeSrc sh) in
                        (let vuna_cat13' = (" -> ") in
                        (let vuna_cat14' = (v_Vuna_dTypecheck_deqSigTypeSrc sh) in
                        (let vuna_cat15' = (" -> Bool\n") in
                        (let vuna_cat16' = (v_Vuna_dTypecheck_dneqFnName tyName) in
                        (let vuna_cat17' = (" x y = if ") in
                        (let vuna_cat18' = (v_Vuna_dTypecheck_deqFnName tyName) in
                        (let vuna_cat19' = (" x y then (0 == 1) else (0 == 0)") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'; vuna_cat11';
                        vuna_cat12'; vuna_cat13'; vuna_cat14'; vuna_cat15'; vuna_cat16'; vuna_cat17';
                        vuna_cat18'; vuna_cat19']))))))))))))))))))))))

let v_Vuna_dTypecheck_dstructuralSrcs = fun shapes supported eqSupported -> v_Vuna_dBase_dconcatMap (fun
  sh -> v_Vuna_dBase_dappend (if v_Vuna_dBase_dmemName (v_Vuna_dTypecheck_dshapeName sh) supported then
    (v_Vuna_dTypecheck_dstructuralShowSrc sh) :: ([])
    else []) (if v_Vuna_dBase_dmemName (v_Vuna_dTypecheck_dshapeName sh) eqSupported then (v_Vuna_dTypecheck_dstructuralEqSrc
      sh) :: ([])
    else [])) shapes

let v_Vuna_dCodegen_descapeChar = fun c -> if v_vuna_ueq_uint c 34 then (92) :: ((34) :: ([]))
else if v_vuna_ueq_uint c 92 then (92) :: ((92) :: ([]))
else if v_vuna_ueq_uint c 10 then (92) :: ((110) :: ([]))
else if v_vuna_ueq_uint c 9 then (92) :: ((116) :: ([]))
else if v_vuna_ueq_uint c 13 then (92) :: ((114) :: ([]))
else if (if (v_vuna_uge_uint c 32) then (v_vuna_ule_uint c 126)
  else false) then (c) :: ([])
else bi_str_unpack ((("\\") ^ (v_Vuna_dCodegen_dpad3 (bi_str_from_int c))))

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 270 11 ("case pattern match failure"))
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 277 13 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 265 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 259 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_dgenCatchAll = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dBase_dSpan (f, sl, sc, el, ec), msg) -> if v_vuna_ueq_uint sl 0 then (let vuna_cat0' = ("  | _ -> vuna_fail \"\" 0 0 (")
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 554 1 ("no matching clause for Vuna.TypedCodegen.genCatchAll")

let v_Vuna_dTypedCodegen_dtypedString = fun s -> if v_vuna_ugt_uint (bi_str_length s) 80 then (let vuna_cat0'
  = ("\"") in
  (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dTypedCodegen_descapeLong (bi_str_unpack
          s))) in
    (let vuna_cat2' = ("\"") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
else v_Vuna_dCodegen_docamlString s

let rec v_Vuna_dTypedCodegen_dgenArgs = fun decls env args -> v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenExpr
  decls env) args
and v_Vuna_dTypedCodegen_dconcatBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, i, []) -> C_Vuna_dBase_dOk ([])
  | (decls, env, i, (e) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env e)
(fun code -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dconcatBindings decls env (bi_add i 1) rest)
  (fun binds -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (v_Vuna_dTypedCodegen_dconcatBindingName i, code))
      :: (binds))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 394 1 ("no matching clause for Vuna.TypedCodegen.concatBindings")
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
  | C_Vuna_dBase_dJust (arity) -> if v_vuna_ueq_ustr name "Nil" then C_Vuna_dBase_dOk ("[]")
    else if v_vuna_ueq_ustr name "True" then C_Vuna_dBase_dOk ("true")
    else if v_vuna_ueq_ustr name "False" then C_Vuna_dBase_dOk ("false")
    else if v_vuna_ueq_uint arity 0 then C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dctorNameOf name)
    else C_Vuna_dBase_dErr ((let vuna_cat0' = ("typed codegen: constructor ") in
        (let vuna_cat1' = (name) in
          (let vuna_cat2' = (" used without arguments") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dbuiltinName name with
  | C_Vuna_dBase_dJust (ref) -> if v_vuna_ueq_ustr name "getArgs" then C_Vuna_dBase_dOk ("bi_get_args ()")

      else C_Vuna_dBase_dOk (ref)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dzeroArgRef decls name)
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dvalueName name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unbound variable ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 477 17 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 473 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 465 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dBase_dOk (bi_str_from_int n)
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dtypedString s)
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar (name, _) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if (if ((if (v_vuna_ueq_ustr name "Nil") then true
            else (v_vuna_ueq_ustr name "True"))) then true
        else (v_vuna_ueq_ustr name "False")) then C_Vuna_dBase_dErr ((let vuna_cat0' = ("typed codegen: constructor ")
          in
          (let vuna_cat1' = (name) in
            (let vuna_cat2' = (" cannot take arguments") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
      else if v_vuna_ueq_ustr name "Cons" then (match args with
  | (h) :: ((t) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env h) (fun ph
          -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env t) (fun pt -> C_Vuna_dBase_dOk
            ((let vuna_cat0' = ("(") in
                (let vuna_cat1' = (ph) in
                  (let vuna_cat2' = (") :: (") in
                    (let vuna_cat3' = (pt) in
                      (let vuna_cat4' = (")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: Cons arity")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 491 17 ("case pattern match failure"))
      else if v_vuna_ueq_uint (v_Vuna_dBase_dlength args) arity then v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenArgs
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 499 19 ("case pattern match failure")))
      else C_Vuna_dBase_dErr ((("typed codegen: partial constructor ") ^ (name)))
  | C_Vuna_dBase_dNothing -> if v_vuna_ueq_ustr name "&&" then (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga
          -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dBase_dOk
            ((let vuna_cat0' = ("(if (") in
                (let vuna_cat1' = (ga) in
                  (let vuna_cat2' = (") then (") in
                    (let vuna_cat3' = (gb) in
                      (let vuna_cat4' = (") else false)") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 505 17 ("case pattern match failure"))
      else if v_vuna_ueq_ustr name "||" then (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga
          -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dBase_dOk
            ((let vuna_cat0' = ("(if (") in
                (let vuna_cat1' = (ga) in
                  (let vuna_cat2' = (") then true else (") in
                    (let vuna_cat3' = (gb) in
                      (let vuna_cat4' = ("))") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 512 17 ("case pattern match failure"))
      else if v_vuna_ueq_ustr name "++" then (match args with
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 521 21 ("case pattern match failure"))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 519 17 ("case pattern match failure"))
      else v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 486 11 ("case pattern match failure"))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 484 7 ("case pattern match failure"))
  | C_Vuna_dAst_dELam (params, body, _) -> (let env2 = v_Vuna_dBase_dappend params env in
    v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env2 body) (fun b -> C_Vuna_dBase_dOk
      ((let vuna_cat0' = ("fun ") in
          (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dBase_dmap v_Vuna_dCodegen_dsanitizeName
                params)) in
            (let vuna_cat2' = (" -> ") in
              (let vuna_cat3' = (b) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | C_Vuna_dAst_dELet (binds, body, rec_u, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenLetBinds
    decls env binds body rec_u) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 461 3 ("case pattern match failure"))
and v_Vuna_dTypedCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenPat
  pat) (fun p -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dpatVars
        pat) env) body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | ") in
        (let vuna_cat1' = (p) in
          (let vuna_cat2' = (" -> ") in
            (let vuna_cat3' = (b) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 548 1 ("no matching clause for Vuna.TypedCodegen.genAlt")
and v_Vuna_dTypedCodegen_dgenLetBinds = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, binds, body, false) -> v_Vuna_dTypedCodegen_dgenBinds decls env binds body
  | (decls, env, binds, body, true) -> v_Vuna_dTypedCodegen_dgenRecBinds decls env binds body
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 558 1 ("no matching clause for Vuna.TypedCodegen.genLetBinds")
and v_Vuna_dTypedCodegen_dgenRecBinds = fun decls env binds body -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenRecDefs
  decls (v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_drecBindNames binds) env) binds) (fun defs -> v_Vuna_dBase_dandThen
  (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_drecBindNames binds)
      env) body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("let rec ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " defs) in
          (let vuna_cat2' = (" in ") in
            (let vuna_cat3' = (b) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
and v_Vuna_dTypedCodegen_dgenRecDefs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, []) -> C_Vuna_dBase_dOk ([])
  | (decls, env, (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name, _), value)) :: (rest)) -> v_Vuna_dBase_dandThen
(v_Vuna_dTypedCodegen_dgenExpr decls env value) (fun v -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenRecDefs
    decls env rest) (fun tail -> C_Vuna_dBase_dOk (((let vuna_cat0' = (v_Vuna_dCodegen_dsanitizeName name)
          in
          (let vuna_cat1' = (" = ") in
            (let vuna_cat2' = (v) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: (tail))))
  | (decls, env, (C_Vuna_dBase_dPair (_, _)) :: (_)) -> C_Vuna_dBase_dErr ("recursive let bindings must be simple names")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 571 1 ("no matching clause for Vuna.TypedCodegen.genRecDefs")
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 579 1 ("no matching clause for Vuna.TypedCodegen.genBinds")

let v_Vuna_dTypedCodegen_dgenClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
  v_Vuna_dTypedCodegen_dgenPat pats) (fun ps -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls
    (v_Vuna_dBase_dappend (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats) env) body) (fun
    b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | (") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " ps) in
          (let vuna_cat2' = (") -> ") in
            (let vuna_cat3' = (b) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 588 1 ("no matching clause for Vuna.TypedCodegen.genClause")

let v_Vuna_dTypedCodegen_dgenFunction = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown function ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> C_Vuna_dBase_dErr ((("typed codegen: no clauses for ") ^ (name)))
  | (C_Vuna_dBase_dPair (pats, body)) :: ([]) -> if v_vuna_ueq_uint arity 0 then if v_Vuna_dTypedCodegen_disPureZeroArg
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
        (let matched = if v_vuna_ueq_uint arity 1 then "a0"
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
        (let matched = if v_vuna_ueq_uint arity 1 then "a0"
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 627 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 624 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 842 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 835 3 ("case pattern match failure"))

let v_Vuna_dCodegen_dctorShowBody = fun a0 a1 -> match (a0, a1) with
  | (short, []) -> v_Vuna_dCodegen_docamlString short
  | (short, shows) -> (let vuna_cat0' = ("\"(\" ^ ") in
  (let vuna_cat1' = (v_Vuna_dCodegen_docamlString short) in
    (let vuna_cat2' = (" ^ \" \" ^ ") in
      (let vuna_cat3' = (v_Vuna_dCodegen_djoinList " ^ \" \" ^ " shows) in
        (let vuna_cat4' = (" ^ \")\"") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 59 1 ("no matching clause for Vuna.Codegen.ctorShowBody")

let v_Vuna_dCodegen_dgenCtorShow = fun c -> (let short = v_Vuna_dCodegen_dctorShort c in
  (let fields = v_Vuna_dCodegen_dsplitCtorFields (v_Vuna_dAst_dctorType c) in
    (let vars = v_Vuna_dCodegen_dmakeCtorParams (v_Vuna_dBase_dlength fields) in
      (let shows = v_Vuna_dCodegen_dgenFieldShows fields vars in
        (let vuna_cat0' = ("and vuna_show_ctor_") in
          (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName short) in
            (let vuna_cat2' = (" (args : value list) : string =\n  match args with\n  | [") in
              (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "; " vars) in
                (let vuna_cat4' = ("] -> ") in
                  (let vuna_cat5' = (v_Vuna_dCodegen_dctorShowBody short shows) in
                    (let vuna_cat6' = ("\n  | _ -> vuna_show_con_generic ") in
                      (let vuna_cat7' = (v_Vuna_dCodegen_docamlString short) in
                        (let vuna_cat8' = (" args\n") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))))))

let rec v_Vuna_dCodegen_dgenCtorArms = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> (let vuna_cat0' = ("  | ") in
  (let vuna_cat1' = (v_Vuna_dCodegen_docamlString (v_Vuna_dCodegen_dctorShort c)) in
    (let vuna_cat2' = (" -> vuna_show_ctor_") in
      (let vuna_cat3' = (v_Vuna_dCodegen_dsanitizeName (v_Vuna_dCodegen_dctorShort c)) in
        (let vuna_cat4' = (" args\n") in
          (let vuna_cat5' = (v_Vuna_dCodegen_dgenCtorArms rest) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 76 1 ("no matching clause for Vuna.Codegen.genCtorArms")

let rec v_Vuna_dCodegen_dgenCtorShows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> ((v_Vuna_dCodegen_dgenCtorShow c) ^ (v_Vuna_dCodegen_dgenCtorShows rest))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 81 1 ("no matching clause for Vuna.Codegen.genCtorShows")

let v_Vuna_dCodegen_dgenShowDefs = fun decls -> (let ctors = v_Vuna_dCodegen_dallDataCtors decls in
  (let vuna_cat0' = (v_Vuna_dCodegen_dshowPrelude) in
    (let vuna_cat1' = ("
let rec vuna_show (v : value) : string =
  match v with
  | VInt n -> string_of_int n
  | VStr s -> vuna_quote ^ vuna_escape s ^ vuna_quote
  | VFun (\"\", _) -> \"<lambda>\"
  | VFun (name, _) -> \"<function \" ^ vuna_short name ^ \">\"
  | VCon (name, args) -> vuna_show_con (vuna_short name) args

and vuna_show_con (name : string) (args : value list) : string =
  match name with
") in
      (let vuna_cat2' = (v_Vuna_dCodegen_dgenCtorArms ctors) in
        (let vuna_cat3' = ("  | _ -> vuna_show_con_generic name args

and vuna_show_con_generic (name : string) (args : value list) : string =
  match args with
  | [] -> name
  | _ -> \"(\" ^ name ^ \" \" ^ String.concat \" \" (List.map vuna_show args) ^ \")\"

and vuna_show_int (v : value) : string =
  match v with VInt n -> string_of_int n | _ -> vuna_show v

and vuna_show_str (v : value) : string =
  match v with VStr s -> vuna_quote ^ vuna_escape s ^ vuna_quote | _ -> vuna_show v

and vuna_show_bool (v : value) : string =
  match v with
  | VCon (\"True\", []) -> \"True\"
  | VCon (\"False\", []) -> \"False\"
  | _ -> vuna_show v

and vuna_show_list (sh : value -> string) (v : value) : string =
  match v with
  | VCon (\"Nil\", []) -> \"Nil\"
  | VCon (\"Cons\", [ x; xs ]) -> \"(Cons \" ^ sh x ^ \" \" ^ vuna_show_list sh xs ^ \")\"
  | _ -> vuna_show v
") in
          (let vuna_cat4' = (v_Vuna_dCodegen_dgenCtorShows ctors) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))

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
  | C_Vuna_dBase_dJust (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) -> if v_vuna_ueq_uint
      arity 0 then C_Vuna_dBase_dOk (((ocname) ^ (" ()")))
      else C_Vuna_dBase_dOk ((let vuna_cat0' = ("VFun (") in
          (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in
            (let vuna_cat2' = (", ") in
              (let vuna_cat3' = (ocname) in
                (let vuna_cat4' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unbound variable: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 211 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 204 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 199 5 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 217 1 ("no matching clause for Vuna.Codegen.pconPattern")

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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 222 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dgenLambda = fun decls scope params body -> (match params with
  | [] -> v_Vuna_dCodegen_dgenExpr decls scope body
  | (p) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenLambda decls ((p) :: (scope)) rest body)
  (fun inner -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VFun (\"\", fun x_") in
        (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName p) in
          (let vuna_cat2' = (" -> ") in
            (let vuna_cat3' = (inner) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 234 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenPattern
  pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (patCode, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dBase_dappend
        bound scope) body) (fun bodyCode -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("| ") in
          (let vuna_cat1' = (patCode) in
            (let vuna_cat2' = (" -> ") in
              (let vuna_cat3' = (bodyCode) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 242 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 240 1 ("no matching clause for Vuna.Codegen.genAlt")
and v_Vuna_dCodegen_dgenCase = fun decls scope scrut alts -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr
  decls scope scrut) (fun scrutCode -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dCodegen_dgenAlt
      decls scope) alts) (fun branches -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(match (") in
        (let vuna_cat1' = (scrutCode) in
          (let vuna_cat2' = (") with\n    ") in
            (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "\n    " branches) in
              (let vuna_cat4' = ("\n    | _ -> fail \"case pattern match failure\")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenLet = fun decls scope rec_u binds body -> if rec_u then v_Vuna_dCodegen_dgenRecLet
decls scope binds body
else v_Vuna_dCodegen_dgenLetSeq decls scope binds body
and v_Vuna_dCodegen_dgenLetSeq = fun decls scope binds body -> (match binds with
  | [] -> v_Vuna_dCodegen_dgenExpr decls scope body
  | (C_Vuna_dBase_dPair (pat, value)) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls
    scope value) (fun valueCode -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenPattern pat) (fun p -> (match
        p with
  | C_Vuna_dBase_dPair (patCode, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenLetSeq decls (v_Vuna_dBase_dappend
            bound scope) rest body) (fun bodyCode -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(let ") in
              (let vuna_cat1' = (patCode) in
                (let vuna_cat2' = (" = (") in
                  (let vuna_cat3' = (valueCode) in
                    (let vuna_cat4' = (") in ") in
                      (let vuna_cat5' = (bodyCode) in
                        (let vuna_cat6' = (")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'])))))))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 265 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 260 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenRecLet = fun decls scope binds body -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenRecDefs
  decls (v_Vuna_dBase_dappend (v_Vuna_dCodegen_drecBindNames binds) scope) binds) (fun defs -> v_Vuna_dBase_dandThen
  (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dBase_dappend (v_Vuna_dCodegen_drecBindNames binds) scope) body)
  (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(let rec ") in
        (let vuna_cat1' = (v_Vuna_dCodegen_djoinWith " and " defs) in
          (let vuna_cat2' = (" in ") in
            (let vuna_cat3' = (b) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenRecDefs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, []) -> C_Vuna_dBase_dOk ([])
  | (decls, scope, (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name, _), value)) :: (rest)) -> v_Vuna_dBase_dandThen
(v_Vuna_dCodegen_dgenExpr decls scope value) (fun v -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenRecDefs
    decls scope rest) (fun tail -> C_Vuna_dBase_dOk (((let vuna_cat0' = ("x_") in
          (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName name) in
            (let vuna_cat2' = (" = ") in
              (let vuna_cat3' = (v) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (tail))))
  | (decls, scope, (C_Vuna_dBase_dPair (_, _)) :: (_)) -> C_Vuna_dBase_dErr ("recursive let bindings must be simple names")
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 282 1 ("no matching clause for Vuna.Codegen.genRecDefs")
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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 327 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar ("||", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCodegen_dgenOrShort decls scope a b
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 331 7 ("case pattern match failure"))
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 325 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenExpr = fun decls scope expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> v_Vuna_dCodegen_dgenVar decls scope name
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VInt (") in
      (let vuna_cat1' = (bi_str_from_int n) in
        (let vuna_cat2' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dBase_dOk ((("VStr ") ^ (v_Vuna_dCodegen_docamlString s)))
  | C_Vuna_dAst_dELam (params, body, _) -> v_Vuna_dCodegen_dgenLambda decls scope params body
  | C_Vuna_dAst_dEApp (fn, args, _) -> v_Vuna_dCodegen_dgenEApp decls scope fn args
  | C_Vuna_dAst_dELet (binds, body, rec_u, _) -> v_Vuna_dCodegen_dgenLet decls scope rec_u binds body
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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 337 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dgenBranches = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, arity, []) -> C_Vuna_dBase_dOk ([])
  | (decls, arity, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
  v_Vuna_dCodegen_dgenPattern pats) (fun parts -> (let patternCode = if v_vuna_ueq_uint arity 1 then v_Vuna_dCodegen_dheadOf
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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 413 1 ("no matching clause for Vuna.Codegen.genBranches")

let rec v_Vuna_dCodegen_dwrapFun = fun name params matchCode k -> if v_vuna_ueq_uint k (bi_sub (v_Vuna_dBase_dlength
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

let v_Vuna_dCodegen_dgenFunction = fun decls name clauses -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_darityOf
  name clauses) (fun arity -> (match clauses with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("function ") in
        (let vuna_cat1' = (name) in
          (let vuna_cat2' = (" has no clauses") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (C_Vuna_dBase_dPair (pats, body)) :: (_) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dBase_dandThen
    (v_Vuna_dCodegen_dgenExpr decls [] body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(fun () -> ")
          in
          (let vuna_cat1' = (b) in
            (let vuna_cat2' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
    else (let params = v_Vuna_dCodegen_dmakeParams arity in
      (let scrutinee = if v_vuna_ueq_uint arity 1 then v_Vuna_dCodegen_dheadOf params
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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 423 5 ("case pattern match failure")))

let rec v_Vuna_dCodegen_dwrapCtor = fun name params body k -> if v_vuna_ueq_uint k (bi_sub (v_Vuna_dBase_dlength
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
  | (C_Vuna_dBase_dPair (name, arity)) -> if v_vuna_ueq_uint arity 0 then C_Vuna_dBase_dOk ("")
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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 443 1 ("no matching clause for Vuna.Codegen.genCtor")

let rec v_Vuna_dCodegen_dgenCtorDefs = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ("")
  | ((c) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenCtor c) (fun def -> v_Vuna_dBase_dandThen
  (v_Vuna_dCodegen_dgenCtorDefs rest) (fun restDefs -> C_Vuna_dBase_dOk (((def) ^ (restDefs)))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 459 1 ("no matching clause for Vuna.Codegen.genCtorDefs")

let rec v_Vuna_dCodegen_dgenBuiltinDef = fun a0 -> match a0 with
  | ([]) -> ""
  | ((C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) :: (rest)) -> (let def = if v_vuna_ueq_uint
  arity 0 then (let vuna_cat0' = ("let ") in
    (let vuna_cat1' = (ocname) in
      (let vuna_cat2' = (" = fun () -> ") in
        (let vuna_cat3' = (body) in
          (let vuna_cat4' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  else if v_vuna_ueq_uint arity 1 then (let vuna_cat0' = ("let ") in
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
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 464 1 ("no matching clause for Vuna.Codegen.genBuiltinDef")

let rec v_Vuna_dCodegen_dgenFunctions = fun a0 a1 -> match (a0, a1) with
  | (decls, []) -> C_Vuna_dBase_dOk ([])
  | (decls, (C_Vuna_dBase_dPair (name, clauses)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunction
  decls name clauses) (fun def -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunctions decls rest) (fun
    defs -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (name, def)) :: (defs))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 469 1 ("no matching clause for Vuna.Codegen.genFunctions")

let v_Vuna_dCodegen_dgenerateProgram = fun decls printResult -> (match v_Vuna_dCodegen_dallCtors decls
  with
  | ctors -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dvalidateCtors ctors) (fun _u -> v_Vuna_dBase_dandThen
    (v_Vuna_dCodegen_dcheckNoCtorFun (v_Vuna_dCodegen_dgroupFunctions decls) decls) (fun _u -> (match
        v_Vuna_dAst_dfunArity "main" decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunctions decls (v_Vuna_dCodegen_dgroupFunctions
            decls)) (fun defs -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenCtorDefs ctors) (fun ctorDefs
            -> C_Vuna_dBase_dOk ((let vuna_cat0' = (v_Vuna_dCodegen_druntimeCode) in
                (let vuna_cat1' = (v_Vuna_dCodegen_druntimeCompareCode) in
                  (let vuna_cat2' = (v_Vuna_dCodegen_dgenShowDefs decls) in
                    (let vuna_cat3' = (ctorDefs) in
                      (let vuna_cat4' = (v_Vuna_dCodegen_dgenBuiltinDef v_Vuna_dCodegen_dbuiltinInfos)
                        in
                        (let vuna_cat5' = (v_Vuna_dCodegen_drenderRecsFrom defs 0) in
                        (let vuna_cat6' = (if printResult then "let () = print_endline (vuna_show (v_main ()))\n"

                        else "let () = ignore (v_main ())\n") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6']))))))))))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dErr ("`main` must be a nullary definition")
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 486 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Codegen.vuna" 482 3 ("case pattern match failure"))

let v_Vuna_dEval_dapplyCtor = fun decls name args arg sp -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown constructor: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> if v_vuna_uge_uint (v_Vuna_dBase_dlength args) arity then v_Vuna_dEval_derrAt
  sp ((let vuna_cat0' = ("constructor ") in
      (let vuna_cat1' = (name) in
        (let vuna_cat2' = (" cannot take more arguments") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  else C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, v_Vuna_dBase_dappend args ((arg) :: ([]))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 188 3 ("case pattern match failure"))

let v_Vuna_dLoader_dstartsUpperName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90)
    else false)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 481 3 ("case pattern match failure"))

let v_Vuna_dParser_dupperFirst = fun s -> (match bi_str_unpack s with
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90)
    else false)
  | [] -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 78 3 ("case pattern match failure"))

let v_Vuna_dParser_dunderscoreCtorName = fun s -> (match bi_str_unpack s with
  | (c) :: (rest) -> if v_vuna_ueq_uint c 95 then (match rest with
  | (c2) :: (rest2) -> (if (v_vuna_uge_uint c2 65) then (v_vuna_ule_uint c2 90)
      else false)
  | [] -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 88 9 ("case pattern match failure"))
  else false
  | [] -> false
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 85 3 ("case pattern match failure"))

let v_Vuna_dParser_dctorPatternStart = fun name -> (if (v_Vuna_dParser_dupperFirst name) then true
  else (v_Vuna_dParser_dunderscoreCtorName name))

let rec v_Vuna_dParser_dparsePatternSingle = fun st blockCol -> v_Vuna_dParser_dparsePatternCons st blockCol
and v_Vuna_dParser_dparsePatternCons = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternHead
  st blockCol) (fun lhs st1 -> if (if (v_Vuna_dParser_datSym st1 "::") then (v_Vuna_dParser_dcanContinue
      st1 blockCol)
    else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternCons (v_Vuna_dParser_dadvance st1)
    blockCol) (fun rhs st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Cons", (lhs) ::
          ((rhs) :: ([])), v_Vuna_dParser_dspanOf st st2), st2)))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st1)))
and v_Vuna_dParser_dparsePatternHead = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if (if (v_Vuna_dParser_dctorPatternStart name) then (v_Vuna_dParser_datSym st1 "{")
      else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseRecordPatternFields st1 blockCol) (fun
      fields st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPRecord (name, fields, v_Vuna_dParser_dspanOf
            st st2), st2)))
    else if v_Vuna_dParser_dctorPatternStart name then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternAtoms
      st1 blockCol) (fun args st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, args,
            v_Vuna_dParser_dspanOf st st2), st2)))
    else v_Vuna_dParser_dparsePatternAtom st blockCol)
  | _ -> v_Vuna_dParser_dparsePatternAtom st blockCol
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 735 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseRecordPatternFields = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
  st "{") (fun _u st1 -> v_Vuna_dParser_dparseRecordPatternList st1 blockCol)
and v_Vuna_dParser_dparseRecordPatternList = fun st blockCol -> if v_Vuna_dParser_datSym st "}" then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], v_Vuna_dParser_dadvance st))
else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseRecordPatternField st blockCol) (fun f st1 -> if v_Vuna_dParser_datSym
  st1 "," then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseRecordPatternList (v_Vuna_dParser_dadvance st1)
    blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((f) :: (rest), st2)))
  else v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "}") (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ((f) :: ([]), st2))))
and v_Vuna_dParser_dparseRecordPatternField = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (fname), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if v_Vuna_dParser_datSym st1 "=" then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun
      _u st2 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle st2 blockCol) (fun pat st3 -> C_Vuna_dBase_dOk
        (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (fname, pat), st3))))
    else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (fname, C_Vuna_dAst_dPVar (fname, C_Vuna_dBase_dSpan
            (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine p, v_Vuna_dBase_dposCol p, v_Vuna_dBase_dposLine
              p, v_Vuna_dBase_dposCol p))), st1)))
  | _ -> C_Vuna_dBase_dErr ("expected a record field pattern")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 761 3 ("case pattern match failure"))
and v_Vuna_dParser_dparsePatternAtoms = fun st blockCol -> if (if (v_Vuna_dParser_dstartsPatternAtom st)
  then (v_Vuna_dParser_dcanContinue st blockCol)
  else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternAtom st blockCol) (fun pat st1 -> v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparsePatternAtoms st1 blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ((pat) :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparsePatternAtom = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent ("_"), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild
      (v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance st)), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> if v_Vuna_dParser_dctorPatternStart name
  then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, [], v_Vuna_dParser_dspanOf st (v_Vuna_dParser_dadvance
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
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 780 3 ("case pattern match failure"))
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
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (prec, assoc)) -> if (if (v_vuna_uge_uint prec minPrec) then
      (v_Vuna_dParser_dcanContinue st blockCol)
      else false) then (let rhsPrec = if v_vuna_ueq_uint assoc 0 then bi_add prec 1
      else prec in
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr (v_Vuna_dParser_dadvance st) blockCol rhsPrec) (fun
        rhs st2 -> v_Vuna_dParser_dparseInfix st2 blockCol minPrec (C_Vuna_dAst_dEApp (v_Vuna_dParser_dopExpr
            op (v_Vuna_dParser_dspanOf st st2), (lhs) :: ((rhs) :: ([])), v_Vuna_dParser_dspanOf st st2))))

    else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 524 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 522 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseLhs = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("\\"), p) -> v_Vuna_dParser_dparseLambda st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("let"), p) -> v_Vuna_dParser_dparseLet st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("case"), p) -> v_Vuna_dParser_dparseCase st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("if"), p) -> v_Vuna_dParser_dparseIf st blockCol
  | _ -> v_Vuna_dParser_dparseApplication st blockCol
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 535 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseApplication = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAtom
  st blockCol) (fun first st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseInstanceSelector st1 blockCol
    first) (fun first2 st2 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseArgs st2 blockCol) (fun args st3
      -> (match args with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (first2, st3))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEApp (first2, args, v_Vuna_dParser_dspanOf
              st st3), st3))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 546 9 ("case pattern match failure")))))
and v_Vuna_dParser_dparseArgs = fun st blockCol -> if (if (v_Vuna_dParser_dstartsAtom st) then (v_Vuna_dParser_dcanContinue
    st blockCol)
  else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAtom st blockCol) (fun arg st1 -> v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparseArgs st1 blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((arg)
        :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparseAtom = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAtomBase st
  blockCol) (fun base st1 -> v_Vuna_dParser_dparseFieldSuffix st1 blockCol base)
and v_Vuna_dParser_dparseAtomBase = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if v_Vuna_dParser_datSym st1 "{" then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "{") (fun
      _u st1b -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseRecordAssignments st1b blockCol) (fun fields
        st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dERecord (name, fields, v_Vuna_dParser_dspanOf
              st st2), st2))))
    else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar (name, v_Vuna_dParser_dspanOf st st1),
        st1)))
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
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("{"), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
    st "{") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun base st2
      -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st2 "|") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseRecordAssignments
          st3 blockCol) (fun fields st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dERecUpdate
              (base, fields, v_Vuna_dParser_dspanOf st st4), st4))))))
  | _ -> C_Vuna_dBase_dErr ("expected expression")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 581 3 ("case pattern match failure"))
and v_Vuna_dParser_dparseRecordAssignments = fun st blockCol -> if v_Vuna_dParser_datSym st "}" then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], v_Vuna_dParser_dadvance st))
else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseRecordAssignList st blockCol) (fun fs st1 -> C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (fs, st1)))
and v_Vuna_dParser_dparseRecordAssignList = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
  st) (fun fname st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun _u st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dparseExpr st2 blockCol 0) (fun value st3 -> if v_Vuna_dParser_datSym st3 "," then
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseRecordAssignList (v_Vuna_dParser_dadvance st3) blockCol)
      (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (fname, value)) :: (rest),
            st4)))
      else v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st3 "}") (fun _u st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          ((C_Vuna_dBase_dPair (fname, value)) :: ([]), st4))))))
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
              false, v_Vuna_dParser_dspanOf st st4), st4))))))
and v_Vuna_dParser_dparseLetBindings = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dErr
("expected a let binding")
else if v_Vuna_dParser_datKw st "in" then C_Vuna_dBase_dErr ("expected a let binding")
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ule_uint col blockCol then C_Vuna_dBase_dErr ("let binding is not indented enough")

  else v_Vuna_dParser_dparseLetBindingsAt st col
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 663 5 ("case pattern match failure"))
and v_Vuna_dParser_dparseLetBindingsAt = fun st declCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else if v_Vuna_dParser_datKw st "in" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col declCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    st declCol) (fun pat st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun _u st2 ->
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 declCol 0) (fun value st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dparseLetBindingsAt st3 declCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            ((C_Vuna_dBase_dPair (pat, value)) :: (rest), st4))))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 672 5 ("case pattern match failure"))
and v_Vuna_dParser_dparseCase = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "case")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun scrut st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dexpectKw st2 "of") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseCaseAlts
        st3 blockCol) (fun alts st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dECase (scrut,
              alts, v_Vuna_dParser_dspanOf st st4), st4))))))
and v_Vuna_dParser_dparseCaseAlts = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dErr
("case expression needs an alternative")
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ule_uint col blockCol then C_Vuna_dBase_dErr ("case alternative is not indented enough")

  else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAltList st col) (fun alts st2 -> if v_Vuna_dParser_dbadCaseIndent
    st2 col then C_Vuna_dBase_dErr ("unexpected indentation after case alternative")
    else (match alts with
  | [] -> C_Vuna_dBase_dErr ("case expression needs an alternative")
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (alts, st2))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 699 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 692 5 ("case pattern match failure"))
and v_Vuna_dParser_dparseAltList = fun st altCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col altCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    st altCol) (fun pat st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=>") (fun _u st2 ->
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 altCol 0) (fun body st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dparseAltList st3 altCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            ((C_Vuna_dBase_dPair (pat, body)) :: (rest), st4))))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 706 5 ("case pattern match failure"))
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

let v_Vuna_dParser_dparseWhereValue = fun st pat blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
  st "=") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun value st2
    -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (pat, value), st2))))

let v_Vuna_dParser_dparseWhereBinding = fun st bindCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
  st bindCol) (fun pat st1 -> (match pat with
  | C_Vuna_dAst_dPVar (name, _) -> if (if (v_Vuna_dParser_dstartsPatternAtom st1) then (v_Vuna_dParser_dcanContinue
        st1 bindCol)
      else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseClausePatterns st1 bindCol) (fun pats
      st2 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st2 "=") (fun _u st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dparseExpr st3 bindCol 0) (fun value st4 -> v_Vuna_dBase_dandThen (v_Vuna_dParser_dlamNames
            pats) (fun names -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar
                  (name, v_Vuna_dAst_dpatSpan pat), C_Vuna_dAst_dELam (names, value, v_Vuna_dParser_dspanOf
                    st st4)), st4))))))
    else v_Vuna_dParser_dparseWhereValue st1 pat bindCol
  | _ -> v_Vuna_dParser_dparseWhereValue st1 pat bindCol
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 314 5 ("case pattern match failure")))

let rec v_Vuna_dParser_dparseWhereBindingsAt = fun st bindCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col bindCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseWhereBinding
    st bindCol) (fun b st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseWhereBindingsAt st1 bindCol) (fun
      rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((b) :: (rest), st2))))
  else if v_vuna_ugt_uint col bindCol then C_Vuna_dBase_dErr ("unexpected indentation in where block")

  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 302 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseWhereBindings = fun st whereCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ugt_uint col whereCol then v_Vuna_dParser_dparseWhereBindingsAt
  st col
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 294 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseWhere = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("where"), p) -> if v_vuna_ugt_uint (v_Vuna_dBase_dposCol
    p) blockCol then v_Vuna_dBase_dstep (C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (0, v_Vuna_dParser_dadvance
        st))) (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseWhereBindings st1 blockCol) (fun
      binds st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (binds, st2))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 282 3 ("case pattern match failure"))

let v_Vuna_dParser_dparseClause = fun st blockCol name namePos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseClausePatterns
  st blockCol) (fun pats st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun _u st2 ->
    v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 blockCol 0) (fun body st3 -> v_Vuna_dBase_dstep
      (v_Vuna_dParser_dparseWhere st3 blockCol) (fun wheres st4 -> (let body2 = (match wheres with
  | [] -> body
  | (_) :: (_) -> C_Vuna_dAst_dELet (wheres, body, true, v_Vuna_dParser_dspanOf st st4)
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 275 17 ("case pattern match failure")) in
          C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDFun (name, pats, body2, C_Vuna_dBase_dSpan
                (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine namePos, v_Vuna_dBase_dposCol namePos,
                  v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos st4), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos
                    st4))), st4)))))))

let rec v_Vuna_dParser_dparseFieldList = fun st fieldCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col fieldCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st) (fun name st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Vuna_dBase_dstep
      (v_Vuna_dParser_dparseExpr st2 fieldCol 0) (fun ty st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseFieldList
          st3 fieldCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dAst_dField (name,
                  ty, v_Vuna_dParser_dspanOf st st3)) :: (rest), st4))))))
  else if v_vuna_ugt_uint col fieldCol then C_Vuna_dBase_dErr ("unexpected indentation in record block")

  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 377 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseFields = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dParser_dparseFieldList
  st col
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 369 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseRecord = fun st blockCol kwPos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
  st "record") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1) (fun name st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dparseParams st2) (fun params st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
        st3 "where") (fun _u st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseFields st4 blockCol) (fun
          fields st5 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDeriving st5) (fun derivings st6 -> C_Vuna_dBase_dOk
            (C_Vuna_dBase_dPair (C_Vuna_dAst_dDRecord (name, params, fields, derivings, C_Vuna_dBase_dSpan
                  (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine kwPos, v_Vuna_dBase_dposCol kwPos,
                    v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos st6), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos
                      st6))), st6))))))))

let rec v_Vuna_dParser_dparseMethodSigList = fun st methodCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col methodCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st) (fun name st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Vuna_dBase_dstep
      (v_Vuna_dParser_dparseExpr st2 methodCol 0) (fun ty st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseMethodSigList
          st3 methodCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name,
                  ty)) :: (rest), st4))))))
  else if v_vuna_ugt_uint col methodCol then C_Vuna_dBase_dErr ("unexpected indentation in trait block")

  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 425 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseMethodSigs = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dParser_dparseMethodSigList
  st col
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 417 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseTrait = fun st blockCol kwPos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
  st "trait") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1) (fun name st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dparseParams st2) (fun params st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
        st3 "where") (fun _u st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseMethodSigs st4 blockCol)
        (fun methods st5 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDTrait (name, params, methods,
                C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine kwPos, v_Vuna_dBase_dposCol
                  kwPos, v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos st5), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos
                    st5))), st5)))))))

let v_Vuna_dParser_dparseInstanceDecl = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if v_Vuna_dParser_datSym st1 ":" then v_Vuna_dParser_dparseSignature st1 blockCol name p
    else v_Vuna_dParser_dparseClause st1 blockCol name p)
  | _ -> C_Vuna_dBase_dErr ("expected an instance method")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 478 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dparseInstanceDeclList = fun st declCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col declCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseInstanceDecl
    st declCol) (fun decl st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseInstanceDeclList st1 declCol)
    (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((decl) :: (rest), st2))))
  else if v_vuna_ugt_uint col declCol then C_Vuna_dBase_dErr ("unexpected indentation in instance block")

  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 468 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseInstanceBody = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dParser_dparseInstanceDeclList
  st col
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 460 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseInstance = fun st blockCol kwPos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
  st "instance") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun head
    st2 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseInstanceName st2) (fun name st3 -> v_Vuna_dBase_dstep
      (v_Vuna_dParser_dexpectKw st3 "where") (fun _u st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseInstanceBody
          st4 blockCol) (fun methods st5 -> (let isDefault = v_Vuna_dParser_dinstanceIsDefault name in
            C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDInstance (name, isDefault, head, methods,
                  C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine kwPos, v_Vuna_dBase_dposCol
                    kwPos, v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos st5), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos
                      st5))), st5))))))))

let rec v_Vuna_dParser_dparseCtorList = fun st ctorCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col ctorCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st) (fun name st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Vuna_dBase_dstep
      (v_Vuna_dParser_dparseExpr st2 ctorCol 0) (fun ty st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseCtorList
          st3 ctorCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dAst_dCtor (name,
                  ty, v_Vuna_dParser_dcountArrows ty, v_Vuna_dParser_dspanOf st st4)) :: (rest), st4))))))

  else if v_vuna_ugt_uint col ctorCol then C_Vuna_dBase_dErr ("unexpected indentation in data block")

  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 503 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseCtors = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ugt_uint col blockCol then v_Vuna_dParser_dparseCtorList
  st col
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 495 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseData = fun st blockCol kwPos -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
  st "data") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1) (fun name st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dparseParams st2) (fun params st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
        st3 ":") (fun _u st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st4 blockCol 0) (fun ty
          st5 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st5 "where") (fun _u st6 -> v_Vuna_dBase_dstep
            (v_Vuna_dParser_dparseCtors st6 blockCol) (fun ctors st7 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDeriving
                st7) (fun derivings st8 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDData (name,
                      params, ctors, derivings, C_Vuna_dBase_dSpan (v_Vuna_dParser_dfileOf st, v_Vuna_dBase_dposLine
                        kwPos, v_Vuna_dBase_dposCol kwPos, v_Vuna_dBase_dposLine (v_Vuna_dParser_dlastPos
                        st8), v_Vuna_dBase_dposCol (v_Vuna_dParser_dlastPos st8))), st8))))))))))

let v_Vuna_dParser_dparseDecl = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("data"), p) -> v_Vuna_dParser_dparseData st blockCol p
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("record"), p) -> v_Vuna_dParser_dparseRecord st blockCol
  p
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("trait"), p) -> v_Vuna_dParser_dparseTrait st blockCol p
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("instance"), p) -> v_Vuna_dParser_dparseInstance st blockCol
  p
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if v_Vuna_dParser_datSym st1 ":" then v_Vuna_dParser_dparseSignature st1 blockCol name p
    else v_Vuna_dParser_dparseClause st1 blockCol name p)
  | _ -> C_Vuna_dBase_dErr ("expected a top-level declaration")
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 253 3 ("case pattern match failure"))

let rec v_Vuna_dParser_dparseDecls = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dBase_dPos (line, col) -> if v_vuna_ueq_uint col blockCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecl
    st blockCol) (fun decl st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecls st1 blockCol) (fun rest
      st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((decl) :: (rest), st2))))
  else C_Vuna_dBase_dErr ((("expected a declaration at column ") ^ (bi_str_from_int blockCol)))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 244 5 ("case pattern match failure"))

let v_Vuna_dParser_dparseSourceFile = fun st -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseModDecl st) (fun
  hdr st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseImports st1) (fun imports st2 -> if v_Vuna_dParser_disEof
    st2 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dSource (hdr, imports, []), st2))
    else (match v_Vuna_dParser_dpeekPos st2 with
  | C_Vuna_dBase_dPos (line, col) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecls st2 col) (fun decls
        st3 -> if v_Vuna_dParser_disEof st3 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dSource
            (hdr, imports, decls), st3))
        else C_Vuna_dBase_dErr ("expected end of input"))
  | _ -> vuna_fail "lib/Vuna/Parser.vuna" 171 9 ("case pattern match failure"))))

let v_Vuna_dLexer_disUpperChar = fun c -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90)
  else false)

let v_Vuna_dLexer_disLowerChar = fun c -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122)
  else false)

let v_Vuna_dLoader_disLowerTypeName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> v_Vuna_dLexer_disLowerChar c
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 476 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveTypeName = fun modules label prefix ownTypes imports name -> if (if ((if ((if
          ((if (v_vuna_ueq_ustr name "Int") then true
              else (v_vuna_ueq_ustr name "String"))) then true
          else (v_vuna_ueq_ustr name "Bool"))) then true
      else (v_vuna_ueq_ustr name "Type"))) then true
  else (v_vuna_ueq_ustr name "->")) then C_Vuna_dBase_dOk (name)
else if v_Vuna_dLoader_disBuiltinTraitName name then C_Vuna_dBase_dOk (name)
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
  | C_Vuna_dBase_dJust (m) -> (match v_Vuna_dLoader_dfindExportType (v_Vuna_dLoader_dexportsOf modules
          m) base with
  | C_Vuna_dBase_dJust (e) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dentryTarget e)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
            (let vuna_cat1' = (": type ") in
              (let vuna_cat2' = (base) in
                (let vuna_cat3' = (" is not exported by ") in
                  (let vuna_cat4' = (m) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 497 16 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 494 12 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 491 5 ("case pattern match failure"))
else if v_Vuna_dBase_dmemName name ownTypes then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name)

else (match v_Vuna_dLoader_dmodulesExportingType modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": unknown type ") in
        (let vuna_cat2' = (name) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | pairs -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dunifyEntryPairs label "type" name pairs) (fun p ->
    C_Vuna_dBase_dOk (v_Vuna_dLoader_dentryTarget (v_Vuna_dBase_dsecondOf p)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 502 5 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 508 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveCtorSpec = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Vuna_dAst_dCtor (ctor, ty, arity, sp)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolveCtorDecl label prefix ctor) (fun c2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr
    modules label prefix ownTypes imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dCtor (c2, ty2,
        arity, sp))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 519 1 ("no matching clause for Vuna.Loader.resolveCtorSpec")

let v_Vuna_dLoader_dresolveRecordField = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Vuna_dAst_dField (fname, ty, sp)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dcheckBinder label fname) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr
    modules label prefix ownTypes imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dField (fname,
        ty2, sp))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 557 1 ("no matching clause for Vuna.Loader.resolveRecordField")

let v_Vuna_dLoader_dresolveTraitMethod = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Vuna_dBase_dPair (mname, ty)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolveTopName label prefix mname) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr
    modules label prefix ownTypes imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (n, ty2))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 562 1 ("no matching clause for Vuna.Loader.resolveTraitMethod")

let v_Vuna_dLexer_disIdentStart = fun c -> (if ((if (v_Vuna_dLexer_disUpperChar c) then true
      else (v_Vuna_dLexer_disLowerChar c))) then true
  else (v_vuna_ueq_uint c 95))

let v_Vuna_dLexer_disDigit = fun c -> (if (v_vuna_uge_uint c 48) then (v_vuna_ule_uint c 57)
  else false)

let rec v_Vuna_dLoader_dallIdentChars = fun chars -> (match chars with
  | [] -> true
  | (c) :: (rest) -> if (if (v_Vuna_dLexer_disIdentStart c) then true
    else (v_Vuna_dLexer_disDigit c)) then v_Vuna_dLoader_dallIdentChars rest
  else false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 30 3 ("case pattern match failure"))

let v_Vuna_dLoader_dvalidSegment = fun seg -> (match bi_str_unpack seg with
  | [] -> false
  | (c) :: (rest) -> (if (v_Vuna_dLexer_disUpperChar c) then (v_Vuna_dLoader_dallIdentChars rest)
    else false)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 36 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dallSegmentsValid = fun segs -> (match segs with
  | [] -> false
  | (seg) :: (rest) -> if v_Vuna_dLoader_dvalidSegment seg then (match rest with
  | [] -> true
  | _ -> v_Vuna_dLoader_dallSegmentsValid rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 45 9 ("case pattern match failure"))
  else false
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 41 3 ("case pattern match failure"))

let v_Vuna_dLoader_dvalidModuleName = fun name -> (match v_Vuna_dBase_dsplitOnDot name with
  | [] -> false
  | segs -> v_Vuna_dLoader_dallSegmentsValid segs
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 51 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dcheckImportAliases = fun label moduleNames aliases -> (match aliases with
  | [] -> C_Vuna_dBase_dOk ([])
  | (C_Vuna_dBase_dPair (alias, m)) :: (rest) -> if v_Vuna_dLoader_dvalidSegment alias then if v_Vuna_dBase_dmemName
  alias (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf rest) then C_Vuna_dBase_dErr ((let vuna_cat0' = (label)
      in
      (let vuna_cat1' = (": duplicate module alias ") in
        (let vuna_cat2' = (alias) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  else if v_Vuna_dBase_dmemName alias moduleNames then if v_vuna_ueq_ustr alias m then v_Vuna_dLoader_dcheckImportAliases
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
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 81 3 ("case pattern match failure"))

let v_Vuna_dLoader_dvalidateImports = fun label imports -> if v_Vuna_dLoader_dhasDuplicateName (v_Vuna_dLoader_dimportModuleNames
  imports) then C_Vuna_dBase_dErr (((label) ^ (": duplicate import")))
else v_Vuna_dLoader_dcheckImportAliases label (v_Vuna_dLoader_dimportModuleNames imports) (v_Vuna_dLoader_dimportAliases
  imports)

let v_Vuna_dLexer_disIdentChar = fun c -> (if ((if (v_Vuna_dLexer_disIdentStart c) then true
      else (v_Vuna_dLexer_disDigit c))) then true
  else (v_vuna_ueq_uint c 39))

let rec v_Vuna_dLexer_dcollectIdent = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc),
  C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disIdentChar c then v_Vuna_dLexer_dcollectIdent
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
else if v_vuna_ueq_uint c 46 then (match rest with
  | (c2) :: (rest2) -> if v_Vuna_dLexer_disIdentStart c2 then v_Vuna_dLexer_dcollectIdent (C_Vuna_dLexer_dChars
    (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
  else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
      p))
  | [] -> C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
      p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 89 5 ("case pattern match failure"))
else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
    p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 85 1 ("no matching clause for Vuna.Lexer.collectIdent")

let rec v_Vuna_dLexer_dcollectInt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disDigit c then v_Vuna_dLexer_dcollectInt
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) (bi_add (bi_mul acc 10) (bi_sub c 48))
else C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 97 1 ("no matching clause for Vuna.Lexer.collectInt")

let rec v_Vuna_dLexer_dlexChars = fun cs -> (match v_Vuna_dLexer_dskipTrivia cs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (cs2) -> (match cs2 with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p)) ::
      ([]))
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> v_Vuna_dLexer_dlexToken c rest p
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 128 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 125 3 ("case pattern match failure"))
and v_Vuna_dLexer_dlexToken = fun c rest p -> if v_Vuna_dLexer_disIdentStart c then (match v_Vuna_dLexer_dcollectIdent
  (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (name, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (v_Vuna_dLexer_dclassifyIdent name,
          p)) :: (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 136 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 134 5 ("case pattern match failure"))
else if v_Vuna_dLexer_disDigit c then (match v_Vuna_dLexer_dcollectInt (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) (bi_sub c 48) with
  | C_Vuna_dBase_dPair (n, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p)) ::
      (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 142 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 140 5 ("case pattern match failure"))
else if v_vuna_ueq_uint c 34 then (match v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (s, cs2)) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p)) ::
      (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 149 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 146 5 ("case pattern match failure"))
else if (if ((if ((if ((if ((if ((if (v_vuna_ueq_uint c 40) then true
                      else (v_vuna_ueq_uint c 41))) then true
                  else (v_vuna_ueq_uint c 91))) then true
              else (v_vuna_ueq_uint c 93))) then true
          else (v_vuna_ueq_uint c 44))) then true
      else (v_vuna_ueq_uint c 123))) then true
  else (v_vuna_ueq_uint c 125)) then (match v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (bi_str_pack
          ((c) :: ([]))), p)) :: (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 153 5 ("case pattern match failure"))
else if v_Vuna_dLexer_disOpChar c then (match v_Vuna_dLexer_dcollectOp (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (op, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (op), p)) ::
      (toks))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 159 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Lexer.vuna" 157 5 ("case pattern match failure"))
else C_Vuna_dBase_dErr ("unexpected character")

let v_Vuna_dLexer_dlexSource = fun source -> v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (bi_str_unpack
    source, C_Vuna_dBase_dPos (1, 1)))

let v_Vuna_dParser_dparseSource = fun file source -> v_Vuna_dBase_dandThen (v_Vuna_dLexer_dlexSource source)
(fun toks -> v_Vuna_dBase_dandThen (v_Vuna_dParser_dparseSourceFile (C_Vuna_dParser_dPState (file, toks,
        C_Vuna_dBase_dPos (1, 0)))) (fun p -> C_Vuna_dBase_dOk (v_Vuna_dBase_dfirstOf p)))

let v_Lint_dapplyFixes = fun source findings -> (let edits = v_Lint_dsortEdits (v_Lint_dcollectEdits findings
    []) in
  (match v_Lint_dapplyEditList edits (v_Lint_dsplitLines source) (bi_add (v_Vuna_dBase_dlength (v_Lint_dsplitLines
          source)) 1) 0 with
  | C_Vuna_dBase_dPair (count, newLines) -> if v_vuna_ueq_uint count 0 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      (0, source))
    else (let newSource = v_Lint_djoinLines newLines in
      (match v_Vuna_dParser_dparseSource "<lint>" newSource with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((("parse failed after fix: ") ^ (e)))
  | C_Vuna_dBase_dOk (ignored) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (count, newSource))
  | _ -> vuna_fail "app/Lint.vuna" 733 15 ("case pattern match failure")))
  | _ -> vuna_fail "app/Lint.vuna" 728 6 ("case pattern match failure")))

let v_Vuna_dTypecheck_dparseGenerated = fun src -> (match v_Vuna_dParser_dparseSource "<generated>" src
  with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((("internal generated source error: ") ^ (e)))
  | C_Vuna_dBase_dOk (C_Vuna_dAst_dSource (hdr, imports, decls)) -> (match hdr with
  | C_Vuna_dBase_dJust (h) -> C_Vuna_dBase_dErr ("internal generated source error: unexpected module header")
  | C_Vuna_dBase_dNothing -> (match imports with
  | [] -> C_Vuna_dBase_dOk (decls)
  | _ -> C_Vuna_dBase_dErr ("internal generated source error: unexpected imports")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2089 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2086 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2083 3 ("case pattern match failure"))

let v_Vuna_dBase_dlengthDiffLE = fun la lb n -> if v_vuna_uge_uint la lb then v_vuna_ule_uint (bi_sub
  la lb) n
else v_vuna_ule_uint (bi_sub lb la) n

let v_Vuna_dBase_d_usimilarName = fun a b -> if v_vuna_ueq_ustr a b then false
else if v_Vuna_dBase_dstartsWith a b then true
else if v_Vuna_dBase_dstartsWith b a then true
else (let la = bi_str_unpack a in
  (let lb = bi_str_unpack b in
    (if (v_Vuna_dBase_dlengthDiffLE (v_Vuna_dBase_dlength la) (v_Vuna_dBase_dlength lb) 2) then (v_vuna_uge_uint
        (v_Vuna_dBase_dprefixLen2 la lb) 2)
      else false)))

let rec v_Vuna_dBase_dsuggest = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> ""
  | (name, (c) :: (rest)) -> if v_Vuna_dBase_d_usimilarName name c then (let vuna_cat0' = (" (did you mean ")
  in
  (let vuna_cat1' = (c) in
    (let vuna_cat2' = ("?)") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
else v_Vuna_dBase_dsuggest name rest
  | _ -> vuna_fail "lib/Vuna/Base.vuna" 165 1 ("no matching clause for Vuna.Base.suggest")

let v_Vuna_dLoader_dresolveGlobal = fun modules label prefix own imports scope name -> if v_Vuna_dBase_dmemName
name scope then C_Vuna_dBase_dOk (name)
else if v_Vuna_dLoader_disGlobalCtor name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dBase_dcontainsDot name then v_Vuna_dLoader_dresolveQualified modules label imports name

else if v_Vuna_dBase_dmemName name own then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name)
else if v_Vuna_dLoader_disBuiltinName name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dLoader_disBuiltinTraitName name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dLoader_disPreludeTraitMethod name then C_Vuna_dBase_dOk (name)
else (match v_Vuna_dLoader_dmodulesExportingValue modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": unbound variable ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (v_Vuna_dBase_dsuggest name (v_Vuna_dBase_dappend own scope)) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | pairs -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dunifyEntryPairs label "name" name pairs) (fun p ->
    C_Vuna_dBase_dOk (v_Vuna_dLoader_dentryTarget (v_Vuna_dBase_dsecondOf p)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 322 5 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveDottedExpr = fun modules label prefix own imports scope name sp -> (match v_Vuna_dBase_dsplitOnDot
  name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": invalid dotted name ") in
        (let vuna_cat2' = (name) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (head) :: (rest) -> if v_Vuna_dBase_dmemName head scope then C_Vuna_dBase_dOk (v_Vuna_dLoader_dfoldFieldChain
    (C_Vuna_dAst_dEVar (head, sp)) rest sp)
  else v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveQualifiedPath modules label imports (v_Vuna_dBase_dsplitOnDot
      name) (v_Vuna_dBase_dlength (v_Vuna_dBase_dsplitOnDot name)) sp) (fun q -> (match q with
  | C_Vuna_dBase_dJust (e) -> C_Vuna_dBase_dOk (e)
  | C_Vuna_dBase_dNothing -> if v_Vuna_dBase_dmemName head own then C_Vuna_dBase_dOk (v_Vuna_dLoader_dfoldFieldChain
        (C_Vuna_dAst_dEVar (v_Vuna_dLoader_dmangle prefix head, sp)) rest sp)
      else if v_Vuna_dLoader_disBuiltinName head then C_Vuna_dBase_dOk (v_Vuna_dLoader_dfoldFieldChain
        (C_Vuna_dAst_dEVar (head, sp)) rest sp)
      else if v_Vuna_dLoader_dstartsUpperName head then C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": module ") in
            (let vuna_cat2' = (head) in
              (let vuna_cat3' = (" is not imported") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
      else v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveGlobal modules label prefix own imports scope
        head) (fun n -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dfoldFieldChain (C_Vuna_dAst_dEVar (n, sp)) rest
          sp))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 274 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 268 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveCtor = fun modules label prefix ownCtors imports name -> if v_Vuna_dLoader_disGlobalCtor
name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dBase_dcontainsDot name then v_Vuna_dLoader_dresolveQualifiedCtor modules label imports
name
else if v_Vuna_dBase_dmemName name ownCtors then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name)

else (match v_Vuna_dLoader_dmodulesExportingCtor modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": unknown constructor ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (v_Vuna_dBase_dsuggest name ownCtors) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | pairs -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dunifyEntryPairs label "constructor" name pairs) (fun
    p -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dentryTarget (v_Vuna_dBase_dsecondOf p)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 332 5 ("case pattern match failure"))

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
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveCtor modules
    label prefix ownCtors imports name) (fun name2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveRecordPatternField
        modules label prefix ownCtors imports) fields) (fun parts -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dAst_dPRecord (name2, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf parts, sp), v_Vuna_dBase_dconcatMap
          v_Vuna_dBase_dsecondOf parts))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 350 3 ("case pattern match failure"))
and v_Vuna_dLoader_dresolveRecordPatternField = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5)
with
  | (modules, label, prefix, ownCtors, imports, C_Vuna_dBase_dPair (fname, pat)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (fname,
          pat2), bound))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 368 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 366 1 ("no matching clause for Vuna.Loader.resolveRecordPatternField")

let rec v_Vuna_dLoader_dcollectRecBinds = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownCtors, imports, []) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], []))
  | (modules, label, prefix, ownCtors, imports, (C_Vuna_dBase_dPair (pat, value)) :: (rest)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (pat2, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcollectRecBinds modules
      label prefix ownCtors imports rest) (fun r -> (match r with
  | C_Vuna_dBase_dPair (names, tail) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dappend bound
            names, (C_Vuna_dBase_dPair (pat2, value)) :: (tail)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 413 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 410 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 407 1 ("no matching clause for Vuna.Loader.collectRecBinds")

let rec v_Vuna_dLoader_dresolveAlt = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6,
  a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label
      prefix own ownCtors imports (v_Vuna_dBase_dappend bound scope) body) (fun body2 -> C_Vuna_dBase_dOk
      (C_Vuna_dBase_dPair (pat2, body2)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 373 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 371 1 ("no matching clause for Vuna.Loader.resolveAlt")
and v_Vuna_dLoader_dresolveLet = fun modules label prefix own ownCtors imports scope rec_u binds body
-> if rec_u then v_Vuna_dLoader_dresolveRecLet modules label prefix own ownCtors imports scope binds body

else v_Vuna_dLoader_dresolveLetSeq modules label prefix own ownCtors imports scope binds body
and v_Vuna_dLoader_dresolveLetSeq = fun modules label prefix own ownCtors imports scope binds body ->
(match binds with
  | [] -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix own ownCtors imports
    scope body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], b)))
  | (C_Vuna_dBase_dPair (pat, value)) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
    modules label prefix own ownCtors imports scope value) (fun value2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolvePattern
      modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveLetSeq modules label
          prefix own ownCtors imports (v_Vuna_dBase_dappend bound scope) rest body) (fun r -> (match r
            with
  | C_Vuna_dBase_dPair (binds2, body2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (pat2,
                    value2)) :: (binds2), body2))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 393 17 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 390 11 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 383 3 ("case pattern match failure"))
and v_Vuna_dLoader_dresolveRecLet = fun modules label prefix own ownCtors imports scope binds body ->
(match v_Vuna_dLoader_dcollectRecBinds modules label prefix ownCtors imports binds with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (names, pairs)) -> (let scope2 = v_Vuna_dBase_dappend names scope
    in
    v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveRecValues modules label prefix own ownCtors imports
      scope2 pairs) (fun values2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix
        own ownCtors imports scope2 body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (values2, b)))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 399 3 ("case pattern match failure"))
and v_Vuna_dLoader_dresolveRecValues = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6,
  a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, []) -> C_Vuna_dBase_dOk ([])
  | (modules, label, prefix, own, ownCtors, imports, scope, (C_Vuna_dBase_dPair (pat, value)) :: (rest))
-> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix own ownCtors imports scope
  value) (fun value2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveRecValues modules label prefix own
    ownCtors imports scope rest) (fun tail -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (pat, value2)) ::
      (tail))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 416 1 ("no matching clause for Vuna.Loader.resolveRecValues")
and v_Vuna_dLoader_dresolveExpr = fun modules label prefix own ownCtors imports scope expr -> (match expr
  with
  | C_Vuna_dAst_dEVar (name, sp) -> if v_Vuna_dBase_dcontainsDot name then v_Vuna_dLoader_dresolveDottedExpr
  modules label prefix own imports scope name sp
  else v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveGlobal modules label prefix own imports scope name)
  (fun n -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (n, sp)))
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
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveLet modules
    label prefix own ownCtors imports scope rec_u binds body) (fun r -> (match r with
  | C_Vuna_dBase_dPair (binds2, body2) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELet (binds2, body2, rec_u, sp))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 439 9 ("case pattern match failure")))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules
    label prefix own ownCtors imports scope scrut) (fun scrut2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
      (v_Vuna_dLoader_dresolveAlt modules label prefix own ownCtors imports scope) alts) (fun alts2 ->
      C_Vuna_dBase_dOk (C_Vuna_dAst_dECase (scrut2, alts2, sp))))
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label
    prefix own ownCtors imports scope c) (fun c2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
      modules label prefix own ownCtors imports scope t) (fun t2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
        modules label prefix own ownCtors imports scope e) (fun e2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEIf
          (c2, t2, e2, sp)))))
  | C_Vuna_dAst_dEField (base, fname, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules
    label prefix own ownCtors imports scope base) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEField (b,
        fname, sp)))
  | C_Vuna_dAst_dERecord (name, fields, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveCtor modules
    label prefix ownCtors imports name) (fun name2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveFieldValue
        modules label prefix own ownCtors imports scope) fields) (fun fs -> C_Vuna_dBase_dOk (C_Vuna_dAst_dERecord
        (name2, fs, sp))))
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules
    label prefix own ownCtors imports scope base) (fun b -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
      (v_Vuna_dLoader_dresolveFieldValue modules label prefix own ownCtors imports scope) fields) (fun
      fs -> C_Vuna_dBase_dOk (C_Vuna_dAst_dERecUpdate (b, fs, sp))))
  | C_Vuna_dAst_dEInstSel (meth, name, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules
    label prefix own ownCtors imports scope meth) (fun m2 -> (match v_Vuna_dLoader_dresolveGlobal modules
      label prefix own imports scope name with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
          (let vuna_cat1' = (": unknown instance name ") in
            (let vuna_cat2' = (name) in
              (let vuna_cat3' = (" (@") in
                (let vuna_cat4' = (name) in
                  (let vuna_cat5' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | C_Vuna_dBase_dOk (n2) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEInstSel (m2, n2, sp))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 463 9 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 423 3 ("case pattern match failure"))
and v_Vuna_dLoader_dresolveFieldValue = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5,
  a6, a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, C_Vuna_dBase_dPair (fname, value)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolveExpr modules label prefix own ownCtors imports scope value) (fun v -> C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (fname, v)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 467 1 ("no matching clause for Vuna.Loader.resolveFieldValue")

let v_Vuna_dLoader_dresolveInstanceMethod = fun modules label prefix own ownCtors ownTypes imports d ->
(match d with
  | C_Vuna_dAst_dDSig (name, ty, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcheckTopName label name)
  (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr modules label prefix ownTypes imports
      ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDSig (name, ty2, sp))))
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcheckTopName label
    name) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolvePattern modules
        label prefix ownCtors imports) pats) (fun parts -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
        modules label prefix own ownCtors imports (v_Vuna_dBase_dconcatMap v_Vuna_dBase_dsecondOf parts)
        body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDFun (name, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
            parts, b, sp)))))
  | _ -> C_Vuna_dBase_dErr (((label) ^ (": instance body may only contain method signatures/definitions")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 574 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveDecl = fun modules label prefix own ownCtors ownTypes imports d -> (match d
  with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeTopName
    label prefix dname) (fun dn -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveCtorSpec
        modules label prefix ownTypes imports) ctors) (fun ctors2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
        (v_Vuna_dLoader_dresolveTypeName modules label prefix ownTypes imports) derivings) (fun ds2 ->
        C_Vuna_dBase_dOk (C_Vuna_dAst_dDData (dn, params, ctors2, ds2, sp)))))
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeTopName
    label prefix dname) (fun dn -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveRecordField
        modules label prefix ownTypes imports) fields) (fun fields2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
        (v_Vuna_dLoader_dresolveTypeName modules label prefix ownTypes imports) derivings) (fun ds2 ->
        C_Vuna_dBase_dOk (C_Vuna_dAst_dDRecord (dn, params, fields2, ds2, sp)))))
  | C_Vuna_dAst_dDTrait (tname, params, methods, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeTopName
    label prefix tname) (fun tn -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveTraitMethod
        modules label prefix ownTypes imports) methods) (fun ms -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDTrait
        (tn, params, ms, sp))))
  | C_Vuna_dAst_dDInstance (iname, isDefault, head, methods, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveInstanceName
    label prefix iname) (fun in2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr modules label
      prefix ownTypes imports head) (fun head2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveInstanceMethod
          modules label prefix own ownCtors ownTypes imports) methods) (fun ms -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDInstance
          (in2, isDefault, head2, ms, sp)))))
  | C_Vuna_dAst_dDSig (name, ty, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTopName label prefix
    name) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr modules label prefix ownTypes
      imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDSig (n, ty2, sp))))
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTopName
    label prefix name) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolvePattern
        modules label prefix ownCtors imports) pats) (fun parts -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
        modules label prefix own ownCtors imports (v_Vuna_dBase_dconcatMap v_Vuna_dBase_dsecondOf parts)
        body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDFun (n, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
            parts, b, sp)))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 525 3 ("case pattern match failure"))

let v_Vuna_dLoader_dresolveProgram = fun modules label prefix own ownCtors ownTypes imports decls -> v_Vuna_dBase_dtraverse
(v_Vuna_dLoader_dresolveDecl modules label prefix own ownCtors ownTypes imports) decls

let v_Vuna_dLoader_dresolveEntry = fun modules imports decls -> v_Vuna_dLoader_dresolveProgram modules
"<entry>" "" (v_Vuna_dAst_dtopNames decls) (v_Vuna_dAst_dctorsOf decls) (v_Vuna_dAst_dtypeNamesOf decls)
imports decls

let rec v_Vuna_dLoader_dresolveModules = fun modules -> (match modules with
  | [] -> C_Vuna_dBase_dOk ([])
  | (C_Vuna_dLoader_dModule (name, imports, decls, exports)) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveProgram
    modules name name (v_Vuna_dAst_dtopNames decls) (v_Vuna_dAst_dctorsOf decls) (v_Vuna_dAst_dtypeNamesOf
      decls) imports decls) (fun d1 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveModules rest) (fun
      d2 -> C_Vuna_dBase_dOk (v_Vuna_dBase_dappend d1 d2)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 593 3 ("case pattern match failure"))

let v_vuna_ueq_ugeneric = fun a b -> bi_eq_generic a b

let rec v_Vuna_dTypedCodegen_dlookupParam = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, v)) :: (rest)) -> if v_vuna_ueq_ugeneric n name then C_Vuna_dBase_dJust
(v)
else v_Vuna_dTypedCodegen_dlookupParam name rest
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 45 1 ("no matching clause for Vuna.TypedCodegen.lookupParam")

let rec v_Vuna_dTypedCodegen_docamlType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr name "Int" then C_Vuna_dBase_dOk ("int")
  else if v_vuna_ueq_ustr name "String" then C_Vuna_dBase_dOk ("string")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("bool")
  else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dBase_dErr ("List type needs an argument")

  else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (ty)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dtypeNameOf name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown type ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 91 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 88 9 ("case pattern match failure"))
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 97 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls params a) (fun ta -> C_Vuna_dBase_dOk
        ((let vuna_cat0' = ("(") in
            (let vuna_cat1' = (ta) in
              (let vuna_cat2' = (") list") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid List type")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 105 13 ("case pattern match failure"))
    else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown type constructor ") ^ (name)))
  | C_Vuna_dBase_dJust (d) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_docamlType
          decls params) args) (fun tys -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dappType tys (v_Vuna_dTypedCodegen_dtypeNameOf
            name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 110 13 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type application")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 95 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type expression")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 81 3 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 147 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 146 1 ("no matching clause for Vuna.TypedCodegen.genCtor")

let v_Vuna_dTypedCodegen_dgenData = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors, _, _)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
  (v_Vuna_dTypedCodegen_dgenCtor decls (v_Vuna_dTypedCodegen_dparamMap params)) ctors) (fun cs -> C_Vuna_dBase_dOk
  ((let vuna_cat0' = ("  ") in
      (let vuna_cat1' = (v_Vuna_dTypedCodegen_ddataPrefix params) in
        (let vuna_cat2' = (v_Vuna_dTypedCodegen_dtypeNameOf name) in
          (let vuna_cat3' = (" =\n    ") in
            (let vuna_cat4' = (v_Vuna_dTypedCodegen_djoinWith "\n  | " cs) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 131 1 ("no matching clause for Vuna.TypedCodegen.genData")

let v_Vuna_dTypedCodegen_dgenTypeDecls = fun decls -> (match v_Vuna_dTypedCodegen_dnonSpecialData decls
  with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenData decls)
    ds) (fun parts -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("type ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in
          (let vuna_cat2' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 155 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dshowForType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr name "Int" then C_Vuna_dBase_dOk ("string_of_int")

  else if v_vuna_ueq_ustr name "String" then C_Vuna_dBase_dOk ("show_vstring")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("show_vbool")
  else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dBase_dErr ("typed codegen: List type needs an argument")

  else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dBase_dJust (s) -> C_Vuna_dBase_dOk (s)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dshowNameOf name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown show type ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 172 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 169 9 ("case pattern match failure"))
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 180 13 ("case pattern match failure"))
    else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForType
          decls params) args) (fun ss -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
            (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
              (let vuna_cat2' = (" ") in
                (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in
                  (let vuna_cat4' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown show type constructor ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 185 13 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type application")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 176 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type")
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 162 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dgenShowFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, pmap, [], []) -> C_Vuna_dBase_dOk ([])
  | (decls, pmap, (f) :: (fs), (v) :: (vs)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForType
  decls pmap f) (fun s -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenShowFields decls pmap fs vs)
  (fun ss -> C_Vuna_dBase_dOk (((let vuna_cat0' = ("(") in
          (let vuna_cat1' = (s) in
            (let vuna_cat2' = (") ") in
              (let vuna_cat3' = (v) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (ss))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 211 1 ("no matching clause for Vuna.TypedCodegen.genShowFields")

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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 221 5 ("case pattern match failure")))

let v_Vuna_dTypedCodegen_dgenShowCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dAst_dCtor (name, ty, arity, _)) -> v_Vuna_dTypedCodegen_dgenShowCtorWith decls
pmap name (v_Vuna_dTypedCodegen_dsplitArrows ty)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 217 1 ("no matching clause for Vuna.TypedCodegen.genShowCtor")

let v_Vuna_dTypedCodegen_dgenShowFuncWith = fun decls pmap params name ctors -> v_Vuna_dBase_dandThen
(v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowCtor decls pmap) ctors) (fun arms -> v_Vuna_dTypedCodegen_dgenShowBody
  pmap params name arms)

let v_Vuna_dTypedCodegen_dgenShowFunc = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors, _, _)) -> v_Vuna_dTypedCodegen_dgenShowFuncWith decls
(v_Vuna_dTypedCodegen_dshowParamMap params) params name ctors
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 226 1 ("no matching clause for Vuna.TypedCodegen.genShowFunc")

let v_Vuna_dTypedCodegen_dgenShowDecls = fun decls -> (match v_Vuna_dTypedCodegen_dnonSpecialData decls
  with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowFunc decls)
    ds) (fun parts -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("let rec ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in
          (let vuna_cat2' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 251 3 ("case pattern match failure"))

let rec v_Vuna_dTypedCodegen_dstartsWith = fun a0 a1 -> match (a0, a1) with
  | ([], hay) -> true
  | ((c) :: (cs), []) -> false
  | ((c) :: (cs), (h) :: (hs)) -> if v_vuna_ueq_ugeneric c h then v_Vuna_dTypedCodegen_dstartsWith cs
hs
else false
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 904 1 ("no matching clause for Vuna.TypedCodegen.startsWith")

let rec v_Vuna_dTypedCodegen_dcontainsName = fun a0 a1 -> match (a0, a1) with
  | (needle, []) -> false
  | (needle, (h) :: (hs)) -> if v_Vuna_dTypedCodegen_dstartsWith needle ((h) :: (hs)) then true
else v_Vuna_dTypedCodegen_dcontainsName needle hs
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 908 1 ("no matching clause for Vuna.TypedCodegen.containsName")

let rec v_Vuna_dTypedCodegen_dfilterRuntime = fun a0 a1 -> match (a0, a1) with
  | ([], bodyChars) -> []
  | ((C_Vuna_dBase_dPair (name, chunk)) :: (rest), bodyChars) -> if v_Vuna_dTypedCodegen_dcontainsName
(bi_str_unpack name) bodyChars then (C_Vuna_dBase_dPair (name, chunk)) :: (v_Vuna_dTypedCodegen_dfilterRuntime
  rest bodyChars)
else v_Vuna_dTypedCodegen_dfilterRuntime rest bodyChars
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 912 1 ("no matching clause for Vuna.TypedCodegen.filterRuntime")

let v_Vuna_dTypedCodegen_dneededByChunks = fun chunks -> v_Vuna_dBase_dconcatMap (fun ch -> v_Vuna_dTypedCodegen_dfilterNames
  (fun n -> v_Vuna_dTypedCodegen_dcontainsName (bi_str_unpack n) (bi_str_unpack (v_Vuna_dTypedCodegen_dchunkTextOf
        ch))) (v_Vuna_dBase_dmap v_Vuna_dTypedCodegen_dchunkNameOf v_Vuna_dTypedCodegen_druntimePrelude))
chunks

let v_Vuna_dTypedCodegen_dmissingChunks = fun included -> v_Vuna_dTypedCodegen_dfilterNames2 (fun n ->
  (if (v_Vuna_dTypedCodegen_dnotIn n (v_Vuna_dTypedCodegen_dchunkNamesOf included)) then (v_Vuna_dBase_dmemName
      n (v_Vuna_dTypedCodegen_dneededByChunks included))
    else false)) (v_Vuna_dBase_dmap v_Vuna_dTypedCodegen_dchunkNameOf v_Vuna_dTypedCodegen_druntimePrelude)
v_Vuna_dTypedCodegen_druntimePrelude

let rec v_Vuna_dTypedCodegen_dexpandRuntime = fun included -> (match v_Vuna_dTypedCodegen_dmissingChunks
  included with
  | [] -> included
  | missing -> v_Vuna_dTypedCodegen_dexpandRuntime (v_Vuna_dBase_dappend included missing)
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 928 3 ("case pattern match failure"))

let v_Vuna_dTypedCodegen_druntimeForBody = fun body -> if v_vuna_ugt_uint (bi_str_length body) 20000 then
v_Vuna_dTypedCodegen_druntimeCodeTyped ()
else (let selected = v_Vuna_dTypedCodegen_dexpandRuntime (v_Vuna_dTypedCodegen_dfilterRuntime v_Vuna_dTypedCodegen_druntimePrelude
    (bi_str_unpack body)) in
  (("\n") ^ (v_Vuna_dTypedCodegen_djoinWith "" (v_Vuna_dBase_dmap v_Vuna_dBase_dsecondOf (v_Vuna_dTypedCodegen_dkeepChunks
          (v_Vuna_dBase_dmap v_Vuna_dTypedCodegen_dchunkNameOf selected) v_Vuna_dTypedCodegen_druntimePrelude)))))

let v_Vuna_dTypedCodegen_dgenerateProgramTyped = fun decls globals printResult -> (match v_Vuna_dTypecheck_dlookupScheme
  "main" globals with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: no main definition")
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> (match ty with
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
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 1034 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/TypedCodegen.vuna" 1031 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dlookupSubst = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dBase_dNothing
  | (i, (C_Vuna_dBase_dPair (j, t)) :: (rest)) -> if v_vuna_ueq_ugeneric i j then C_Vuna_dBase_dJust (t)

else v_Vuna_dTypecheck_dlookupSubst i rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 74 1 ("no matching clause for Vuna.Typecheck.lookupSubst")

let rec v_Vuna_dTypecheck_dmemInt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> false
  | (i, (x) :: (rest)) -> if v_vuna_ueq_ugeneric i x then true
else v_Vuna_dTypecheck_dmemInt i rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 78 1 ("no matching clause for Vuna.Typecheck.memInt")

let v_Vuna_dTypecheck_daddUnique = fun x xs -> if v_Vuna_dTypecheck_dmemInt x xs then xs
else (x) :: (xs)

let rec v_Vuna_dTypecheck_dunionInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> v_Vuna_dTypecheck_daddUnique x (v_Vuna_dTypecheck_dunionInts rest ys)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 83 1 ("no matching clause for Vuna.Typecheck.unionInts")

let rec v_Vuna_dTypecheck_ddiffInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> []
  | ((x) :: (rest), ys) -> if v_Vuna_dTypecheck_dmemInt x ys then v_Vuna_dTypecheck_ddiffInts rest ys

else (x) :: (v_Vuna_dTypecheck_ddiffInts rest ys)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 86 1 ("no matching clause for Vuna.Typecheck.diffInts")

let rec v_Vuna_dTypecheck_dresolveTy = fun s ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match v_Vuna_dTypecheck_dlookupSubst i s with
  | C_Vuna_dBase_dJust (t) -> v_Vuna_dTypecheck_dresolveTy s t
  | C_Vuna_dBase_dNothing -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 93 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dresolveTy
      s) args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dresolveTy s a, v_Vuna_dTypecheck_dresolveTy
    s b)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 91 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_doccursIn = fun i s ty -> (match v_Vuna_dTypecheck_dresolveTy s ty with
  | C_Vuna_dTypecheck_dTVar (j) -> v_vuna_ueq_uint i j
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_Vuna_dTypecheck_doccursInArgs i s args
  | C_Vuna_dTypecheck_dTFun (a, b) -> (if (v_Vuna_dTypecheck_doccursIn i s a) then true
    else (v_Vuna_dTypecheck_doccursIn i s b))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 101 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_doccursInArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, s, []) -> false
  | (i, s, (ty) :: (rest)) -> (if (v_Vuna_dTypecheck_doccursIn i s ty) then true
  else (v_Vuna_dTypecheck_doccursInArgs i s rest))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 106 1 ("no matching clause for Vuna.Typecheck.occursInArgs")

let rec v_Vuna_dTypecheck_dunifyLists = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], st) -> C_Vuna_dBase_dOk (st)
  | ((a) :: (ar), (b) :: (br), st) -> (match v_Vuna_dTypecheck_dunify a b st with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (st2) -> v_Vuna_dTypecheck_dunifyLists ar br st2
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 135 3 ("case pattern match failure"))
  | (_, _, st) -> C_Vuna_dBase_dErr ("type mismatch: different number of arguments")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 133 1 ("no matching clause for Vuna.Typecheck.unifyLists")
and v_Vuna_dTypecheck_dunify = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (a, b, C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> (match v_Vuna_dTypecheck_dresolveTy
  s a with
  | ra -> (match v_Vuna_dTypecheck_dresolveTy s b with
  | rb -> (match ra with
  | C_Vuna_dTypecheck_dTVar (i) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if v_vuna_ueq_uint i j then C_Vuna_dBase_dOk (C_Vuna_dTypecheck_dTC
          (n, s, typeNames, records, cons, methods, tctx))
        else v_Vuna_dTypecheck_dbindVar i rb (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods,
            tctx))
  | _ -> if v_Vuna_dTypecheck_doccursIn i s rb then C_Vuna_dBase_dErr ((("occurs check: ") ^ (v_Vuna_dTypecheck_dshowTy
              rb)))
        else v_Vuna_dTypecheck_dbindVar i rb (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods,
            tctx))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 148 15 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (tn, xs) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if v_Vuna_dTypecheck_doccursIn j s ra then C_Vuna_dBase_dErr ((("occurs check: ")
            ^ (v_Vuna_dTypecheck_dshowTy ra)))
        else v_Vuna_dTypecheck_dbindVar j ra (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods,
            tctx))
  | C_Vuna_dTypecheck_dTCon (tn2, ys) -> if (if (v_vuna_ueq_ustr tn tn2) then true
          else (v_Vuna_dTypecheck_dsameBuiltinTy tn tn2)) then v_Vuna_dTypecheck_dunifyLists xs ys (C_Vuna_dTypecheck_dTC
          (n, s, typeNames, records, cons, methods, tctx))
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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 155 15 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTFun (x, y) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if v_Vuna_dTypecheck_doccursIn j s ra then C_Vuna_dBase_dErr ((("occurs check: ")
            ^ (v_Vuna_dTypecheck_dshowTy ra)))
        else v_Vuna_dTypecheck_dbindVar j ra (C_Vuna_dTypecheck_dTC (n, s, typeNames, records, cons, methods,
            tctx))
  | C_Vuna_dTypecheck_dTFun (x2, y2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify x x2 (C_Vuna_dTypecheck_dTC
            (n, s, typeNames, records, cons, methods, tctx))) (fun st2 -> v_Vuna_dTypecheck_dunify y y2
          st2)
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("type mismatch: expected ") in
            (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy rb) in
              (let vuna_cat2' = (" but got ") in
                (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy ra) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 164 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 146 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 144 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 142 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 141 1 ("no matching clause for Vuna.Typecheck.unify")

let rec v_Vuna_dTypecheck_drenameTy = fun mapping ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match v_Vuna_dTypecheck_dlookupSubst i mapping with
  | C_Vuna_dBase_dJust (t) -> t
  | C_Vuna_dBase_dNothing -> ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 181 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_drenameTy
      mapping) args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_drenameTy mapping a,
    v_Vuna_dTypecheck_drenameTy mapping b)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 179 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dinstantiateFull = fun a0 a1 -> match (a0, a1) with
  | (st, C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> (match v_Vuna_dTypecheck_dinstantiateVars qs st
  with
  | C_Vuna_dBase_dPair (mapping, st2) -> (let ty2 = v_Vuna_dTypecheck_drenameTy mapping ty in
    (let cons2 = v_Vuna_dBase_dmap (fun c -> C_Vuna_dBase_dPair (v_Vuna_dBase_dfirstOf c, v_Vuna_dTypecheck_drenameTy
          mapping (v_Vuna_dBase_dsecondOf c))) cons in
      C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, cons2), st2)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 189 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 188 1 ("no matching clause for Vuna.Typecheck.instantiateFull")

let v_Vuna_dTypecheck_dinstantiate = fun st sch -> (match v_Vuna_dTypecheck_dinstantiateFull st sch with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, cons), st2) -> C_Vuna_dBase_dPair (ty, st2)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 197 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfreeVarsTy = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: ([])
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_Vuna_dTypecheck_dfreeVarsArgs args
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsTy a) (v_Vuna_dTypecheck_dfreeVarsTy
    b)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 201 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dfreeVarsArgs = fun a0 -> match a0 with
  | ([]) -> []
  | ((ty) :: (rest)) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsTy ty) (v_Vuna_dTypecheck_dfreeVarsArgs
  rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 206 1 ("no matching clause for Vuna.Typecheck.freeVarsArgs")

let v_Vuna_dTypecheck_dconsFreeVars = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (tr, ty)) -> v_Vuna_dTypecheck_dfreeVarsTy ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 212 1 ("no matching clause for Vuna.Typecheck.consFreeVars")

let v_Vuna_dTypecheck_dfreeVarsScheme = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> v_Vuna_dTypecheck_ddiffInts (v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dfreeVarsTy
    ty) (v_Vuna_dBase_dconcatMap v_Vuna_dTypecheck_dconsFreeVars cons)) qs
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 209 1 ("no matching clause for Vuna.Typecheck.freeVarsScheme")

let rec v_Vuna_dTypecheck_dfreeVarsEnv = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (n, sch)) :: (rest)) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsScheme
  sch) (v_Vuna_dTypecheck_dfreeVarsEnv rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 214 1 ("no matching clause for Vuna.Typecheck.freeVarsEnv")

let rec v_Vuna_dTypecheck_dlookupTyVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ugeneric n name then C_Vuna_dBase_dJust
(ty)
else v_Vuna_dTypecheck_dlookupTyVar name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 227 1 ("no matching clause for Vuna.Typecheck.lookupTyVar")

let rec v_Vuna_dTypecheck_dconvertTypes = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, vars, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair ([], vars),
    st))
  | (typeNames, vars, (e) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames
  vars st e) (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars1), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertTypes
      typeNames vars1 rest st1) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tys, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair ((ty) :: (tys), vars2), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 240 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 237 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 234 1 ("no matching clause for Vuna.Typecheck.convertTypes")
and v_Vuna_dTypecheck_dconvertType = fun typeNames vars st expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypecheck_dknownTypeName typeNames name then C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, []), vars), st))
  else if v_Vuna_dTypecheck_disLowerName name then (match v_Vuna_dTypecheck_dlookupTyVar name vars with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars), st))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, (C_Vuna_dBase_dPair
              (name, ty)) :: (vars)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 252 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 249 9 ("case pattern match failure"))
  else C_Vuna_dBase_dErr ((("unknown type: ") ^ (name)))
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames vars st a)
      (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ta, vars1), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType
            typeNames vars1 st1 b) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tb, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair
                  (C_Vuna_dTypecheck_dTFun (ta, tb), vars2), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 264 23 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 261 17 ("case pattern match failure")))
  | _ -> C_Vuna_dBase_dErr ("invalid arrow type")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 258 11 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar (name, _) -> if v_Vuna_dTypecheck_dknownTypeName typeNames name then v_Vuna_dBase_dandThen
    (v_Vuna_dTypecheck_dconvertTypes typeNames vars args st) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tys, vars1), st1) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, tys), vars1), st1))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 271 15 ("case pattern match failure")))
    else C_Vuna_dBase_dErr ((("unknown type constructor: ") ^ (name)))
  | _ -> C_Vuna_dBase_dErr ("invalid type application")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 256 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ("invalid type expression")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 244 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dschemeOfSig = fun typeNames ty st -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType
  typeNames [] st ty) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dmkScheme
        (v_Vuna_dTypecheck_dvarIds vars) ty2, st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 285 5 ("case pattern match failure")))

let v_Vuna_dTypecheck_dschemeOfCtor = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, st, C_Vuna_dAst_dCtor (name, ty, arity, _)) -> (match v_Vuna_dTypecheck_dseedVars
  params st with
  | C_Vuna_dBase_dPair (vars, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames
    vars st1 ty) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dBase_dPair (name, v_Vuna_dTypecheck_dmkScheme (v_Vuna_dTypecheck_dvarIds vars2) ty2),
          st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 299 9 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 296 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 295 1 ("no matching clause for Vuna.Typecheck.schemeOfCtor")

let rec v_Vuna_dTypecheck_dcollectSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDSig (name, ty, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dschemeOfSig typeNames
    ty st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (sch, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectSigs typeNames rest
        st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (sigs, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name,
                  sch)) :: (sigs), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 321 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 318 9 ("case pattern match failure")))
  | _ -> v_Vuna_dTypecheck_dcollectSigs typeNames rest st
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 315 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 313 1 ("no matching clause for Vuna.Typecheck.collectSigs")

let rec v_Vuna_dTypecheck_dcollectCtorList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, params, (c) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dschemeOfCtor typeNames
  params st c) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (cname, sch), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtorList
      typeNames params rest st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (cname,
                sch)) :: (ctors), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 341 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 338 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 335 1 ("no matching clause for Vuna.Typecheck.collectCtorList")

let rec v_Vuna_dTypecheck_dcollectCtors = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, _, _) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtorList
    typeNames params ctors st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (newCtors, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtors typeNames
        rest st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors2, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dappend newCtors
              ctors2, st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 332 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 329 9 ("case pattern match failure")))
  | _ -> v_Vuna_dTypecheck_dcollectCtors typeNames rest st
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 326 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 324 1 ("no matching clause for Vuna.Typecheck.collectCtors")

let rec v_Vuna_dTypecheck_deqMethodExprFor = fun tctx ty -> (match v_Vuna_dTypecheck_dtraitMethodExpr
  tctx ty "Eq" "eq" with
  | C_Vuna_dBase_dOk (e) -> e
  | C_Vuna_dBase_dErr (_) -> C_Vuna_dAst_dEVar ("vuna_eq_generic", v_Vuna_dTypecheck_dtcNoSpan)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 417 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_deqListExpr = fun tctx elemTy -> (let goName = "vuna_eq_list_go" in
  (let x = "vuna_eq_lx" in
    (let y = "vuna_eq_ly" in
      (let h = "vuna_eq_lh" in
        (let t = "vuna_eq_lt" in
          (let h2 = "vuna_eq_lh2" in
            (let t2 = "vuna_eq_lt2" in
              (let elemEq = v_Vuna_dTypecheck_deqMethodExprFor tctx elemTy in
                (let recCall = C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (goName, v_Vuna_dTypecheck_dtcNoSpan),
                    (C_Vuna_dAst_dEVar (t, v_Vuna_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dAst_dEVar (t2, v_Vuna_dTypecheck_dtcNoSpan))
                      :: ([])), v_Vuna_dTypecheck_dtcNoSpan) in
                  (let consBody = C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("&&", v_Vuna_dTypecheck_dtcNoSpan),
                      (C_Vuna_dAst_dEApp (elemEq, (C_Vuna_dAst_dEVar (h, v_Vuna_dTypecheck_dtcNoSpan))
                        :: ((C_Vuna_dAst_dEVar (h2, v_Vuna_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dTypecheck_dtcNoSpan))
                      :: ((recCall) :: ([])), v_Vuna_dTypecheck_dtcNoSpan) in
                    (let consCase = C_Vuna_dAst_dECase (C_Vuna_dAst_dEVar (y, v_Vuna_dTypecheck_dtcNoSpan),
                        (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Cons", (C_Vuna_dAst_dPVar (h2, v_Vuna_dTypecheck_dtcNoSpan))
                        :: ((C_Vuna_dAst_dPVar (t2, v_Vuna_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dTypecheck_dtcNoSpan),
                        consBody)) :: ((C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild (v_Vuna_dTypecheck_dtcNoSpan),
                        v_Vuna_dTypecheck_dboolFalseExpr)) :: ([])), v_Vuna_dTypecheck_dtcNoSpan) in
                      (let nilCase = C_Vuna_dAst_dECase (C_Vuna_dAst_dEVar (y, v_Vuna_dTypecheck_dtcNoSpan),
                        (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Nil", [], v_Vuna_dTypecheck_dtcNoSpan),
                        v_Vuna_dTypecheck_dboolTrueExpr)) :: ((C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild
                        (v_Vuna_dTypecheck_dtcNoSpan), v_Vuna_dTypecheck_dboolFalseExpr)) :: ([])), v_Vuna_dTypecheck_dtcNoSpan)
                        in
                        (let goBody = C_Vuna_dAst_dECase (C_Vuna_dAst_dEVar (x, v_Vuna_dTypecheck_dtcNoSpan),
                        (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Nil", [], v_Vuna_dTypecheck_dtcNoSpan),
                        nilCase)) :: ((C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Cons", (C_Vuna_dAst_dPVar
                        (h, v_Vuna_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dAst_dPVar (t, v_Vuna_dTypecheck_dtcNoSpan))
                        :: ([])), v_Vuna_dTypecheck_dtcNoSpan), consCase)) :: ([])), v_Vuna_dTypecheck_dtcNoSpan)
                        in
                        C_Vuna_dAst_dELet ((C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (goName, v_Vuna_dTypecheck_dtcNoSpan),
                        C_Vuna_dAst_dELam ((x) :: ((y) :: ([])), goBody, v_Vuna_dTypecheck_dtcNoSpan)))
                        :: ([]), C_Vuna_dAst_dEVar (goName, v_Vuna_dTypecheck_dtcNoSpan), true, v_Vuna_dTypecheck_dtcNoSpan))))))))))))))
and v_Vuna_dTypecheck_dlistNeqExpr = fun tctx elemTy -> (let eqExpr = v_Vuna_dTypecheck_deqListExpr tctx
  elemTy in
  (let a = "vuna_neq_la" in
    (let b = "vuna_neq_lb" in
      (let cond = C_Vuna_dAst_dEApp (eqExpr, (C_Vuna_dAst_dEVar (a, v_Vuna_dTypecheck_dtcNoSpan)) ::
          ((C_Vuna_dAst_dEVar (b, v_Vuna_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dTypecheck_dtcNoSpan)
        in
        C_Vuna_dAst_dELam ((a) :: ((b) :: ([])), C_Vuna_dAst_dEIf (cond, v_Vuna_dTypecheck_dboolFalseExpr,
            v_Vuna_dTypecheck_dboolTrueExpr, v_Vuna_dTypecheck_dtcNoSpan), v_Vuna_dTypecheck_dtcNoSpan)))))
and v_Vuna_dTypecheck_dtraitMethodExpr = fun tctx ty tr key -> if (fun vuna_uneq_ula vuna_uneq_ulb ->
  if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uint vuna_ueq_ulh vuna_ueq_ulh2) then (vuna_ueq_ulist_ugo
              vuna_ueq_ult vuna_ueq_ult2)
            else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in
      vuna_ueq_ulist_ugo)) vuna_uneq_ula vuna_uneq_ulb then bi_eq_int 0 1
  else bi_eq_int 0 0) (v_Vuna_dTypecheck_dfreeVarsTy ty) [] then (match v_Vuna_dTypecheck_dgenericMethodName
  tr key with
  | C_Vuna_dBase_dJust (fn) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (fn, v_Vuna_dTypecheck_dtcNoSpan))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("trait method ") in
      (let vuna_cat1' = (key) in
        (let vuna_cat2' = (" used at a polymorphic type (only Eq/Ord have a generic fallback in M10.5)")
          in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 488 5 ("case pattern match failure"))
else (match tr with
  | "Eq" -> (match ty with
  | C_Vuna_dTypecheck_dTCon ("List", (elemTy) :: ([])) -> if v_vuna_ueq_ustr key "neq" then C_Vuna_dBase_dOk
    (v_Vuna_dTypecheck_dlistNeqExpr tctx elemTy)
    else C_Vuna_dBase_dOk (v_Vuna_dTypecheck_deqListExpr tctx elemTy)
  | _ -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconcreteMethodName tctx ty tr key) (fun fn -> C_Vuna_dBase_dOk
      (C_Vuna_dAst_dEVar (fn, v_Vuna_dTypecheck_dtcNoSpan)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 494 9 ("case pattern match failure"))
  | _ -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconcreteMethodName tctx ty tr key) (fun fn -> C_Vuna_dBase_dOk
    (C_Vuna_dAst_dEVar (fn, v_Vuna_dTypecheck_dtcNoSpan)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 492 5 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfoldNeeds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (C_Vuna_dBase_dPair (tr, ty)) :: (rest)) -> if v_Vuna_dTypecheck_disDictTrait
tr then (match v_Vuna_dTypecheck_dresolveTy subst ty with
  | C_Vuna_dTypecheck_dTVar (v) -> v_Vuna_dTypecheck_dfoldNeeds subst tctx (v_Vuna_dTypecheck_daddNeed
    tr (C_Vuna_dTypecheck_dTVar (v)) needs) rest
  | other -> v_Vuna_dTypecheck_dfoldNeeds subst tctx needs rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 589 5 ("case pattern match failure"))
else v_Vuna_dTypecheck_dfoldNeeds subst tctx needs rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 585 1 ("no matching clause for Vuna.Typecheck.foldNeeds")

let rec v_Vuna_dTypecheck_dcollectNeedsFromExpr = fun subst tctx needs expr -> (match expr with
  | C_Vuna_dTypecheck_dXEMethod (tr, key, paramTy, sp) -> if v_Vuna_dTypecheck_disDictTrait tr then (match
    v_Vuna_dTypecheck_dresolveTy subst paramTy with
  | C_Vuna_dTypecheck_dTVar (v) -> v_Vuna_dTypecheck_daddNeed tr (C_Vuna_dTypecheck_dTVar (v)) needs
  | other -> needs
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 550 9 ("case pattern match failure"))
  else needs
  | C_Vuna_dTypecheck_dXEFun (name, cons, sp) -> v_Vuna_dTypecheck_dfoldNeeds subst tctx needs cons
  | C_Vuna_dTypecheck_dXEVar (n, sp) -> needs
  | C_Vuna_dTypecheck_dXEInt (n, sp) -> needs
  | C_Vuna_dTypecheck_dXEStr (s, sp) -> needs
  | C_Vuna_dTypecheck_dXELam (ps, b, sp) -> v_Vuna_dTypecheck_dcollectNeedsFromExpr subst tctx needs b
  | C_Vuna_dTypecheck_dXEApp (f, args, sp) -> v_Vuna_dTypecheck_dcollectNeedsFromExprList subst tctx (v_Vuna_dTypecheck_dcollectNeedsFromExpr
    subst tctx needs f) args
  | C_Vuna_dTypecheck_dXELet (binds, body, rec_u, sp) -> v_Vuna_dTypecheck_dcollectNeedsFromExpr subst
  tctx (v_Vuna_dTypecheck_dcollectNeedsFromBinds subst tctx needs binds) body
  | C_Vuna_dTypecheck_dXECase (scrut, ty, alts, sp) -> v_Vuna_dTypecheck_dcollectNeedsFromExprList subst
  tctx (v_Vuna_dTypecheck_dcollectNeedsFromExpr subst tctx needs scrut) (v_Vuna_dBase_dmap v_Vuna_dBase_dsecondOf
    alts)
  | C_Vuna_dTypecheck_dXEIf (c, t, e, sp) -> v_Vuna_dTypecheck_dcollectNeedsFromExpr subst tctx (v_Vuna_dTypecheck_dcollectNeedsFromExpr
    subst tctx (v_Vuna_dTypecheck_dcollectNeedsFromExpr subst tctx needs c) t) e
  | C_Vuna_dTypecheck_dXEField (base, fname, baseTy, sp) -> v_Vuna_dTypecheck_dcollectNeedsFromExpr subst
  tctx needs base
  | C_Vuna_dTypecheck_dXERecUpdate (base, baseTy, fields, sp) -> v_Vuna_dTypecheck_dcollectNeedsFromExpr
  subst tctx needs base
  | C_Vuna_dTypecheck_dXEMethodInst (tr, key, instName, paramTy, sp) -> needs
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 547 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dcollectNeedsFromExprList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (e) :: (rest)) -> v_Vuna_dTypecheck_dcollectNeedsFromExprList subst tctx (v_Vuna_dTypecheck_dcollectNeedsFromExpr
  subst tctx needs e) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 573 1 ("no matching clause for Vuna.Typecheck.collectNeedsFromExprList")
and v_Vuna_dTypecheck_dcollectNeedsFromBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (C_Vuna_dBase_dPair (pat, value)) :: (rest)) -> v_Vuna_dTypecheck_dcollectNeedsFromBinds
subst tctx (v_Vuna_dTypecheck_dcollectNeedsFromExpr subst tctx needs value) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 579 1 ("no matching clause for Vuna.Typecheck.collectNeedsFromBinds")

let rec v_Vuna_dTypecheck_dfoldClauseNeeds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> v_Vuna_dTypecheck_dfoldClauseNeeds
subst tctx (v_Vuna_dTypecheck_dcollectNeedsFromExpr subst tctx needs body) rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 599 1 ("no matching clause for Vuna.Typecheck.foldClauseNeeds")

let v_Vuna_dTypecheck_dcollectNeedsClauses = fun subst tctx clauses -> v_Vuna_dTypecheck_dfoldClauseNeeds
subst tctx [] clauses

let v_Vuna_dTypecheck_ddictMethodExpr = fun tctx subst params tr key paramTy -> (let ty = v_Vuna_dTypecheck_dresolveTy
  subst paramTy in
  (match ty with
  | C_Vuna_dTypecheck_dTVar (v) -> (match v_Vuna_dTypecheck_dfindDictParam params tr v (v_Vuna_dTypecheck_dlastSeg
        key) with
  | C_Vuna_dBase_dJust (p) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (p, v_Vuna_dTypecheck_dtcNoSpan))
  | C_Vuna_dBase_dNothing -> v_Vuna_dTypecheck_dtraitMethodExpr tctx ty tr key
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 636 10 ("case pattern match failure"))
  | other -> v_Vuna_dTypecheck_dtraitMethodExpr tctx ty tr key
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 634 6 ("case pattern match failure")))

let v_Vuna_dTypecheck_ddictMethodArg = fun tctx subst params tr key ty -> (match v_Vuna_dTypecheck_ddictMethodExpr
  tctx subst params tr key ty with
  | C_Vuna_dBase_dOk (e) -> e
  | C_Vuna_dBase_dErr (_) -> C_Vuna_dAst_dEVar ("vuna_missing_dict", v_Vuna_dTypecheck_dtcNoSpan)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 656 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_ddictMethodArgs = fun tctx subst params tr ty -> (match v_Vuna_dTypecheck_dtraitMethodKeys
  tctx tr with
  | [] -> []
  | keys -> v_Vuna_dBase_dmap (fun key -> v_Vuna_dTypecheck_ddictMethodArg tctx subst params tr (v_Vuna_dTypecheck_dlastSeg
      key) ty) keys
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 651 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfoldDictArgs = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (tctx, subst, params, acc, []) -> v_Vuna_dBase_dreverse acc
  | (tctx, subst, params, acc, (C_Vuna_dBase_dPair (tr, ty)) :: (rest)) -> v_Vuna_dTypecheck_dfoldDictArgs
tctx subst params (v_Vuna_dBase_dappend acc (v_Vuna_dTypecheck_ddictMethodArgs tctx subst params tr ty))
rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 645 1 ("no matching clause for Vuna.Typecheck.foldDictArgs")

let v_Vuna_dTypecheck_ddictArgsFor = fun tctx subst params cons -> v_Vuna_dTypecheck_dfoldDictArgs tctx
subst params [] cons

let rec v_Vuna_dTypecheck_dvalidateFunDictKeys = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5)
with
  | (subst, tctx, params, tr, [], ty) -> C_Vuna_dBase_dOk (0)
  | (subst, tctx, params, tr, (key) :: (keys), ty) -> (match v_Vuna_dTypecheck_ddictMethodExpr tctx subst
  params tr key ty with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (ex) -> v_Vuna_dTypecheck_dvalidateFunDictKeys subst tctx params tr keys ty
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 712 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 709 1 ("no matching clause for Vuna.Typecheck.validateFunDictKeys")

let rec v_Vuna_dTypecheck_dvalidateFunDicts = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Vuna_dBase_dOk (0)
  | (subst, tctx, params, (C_Vuna_dBase_dPair (tr, ty)) :: (rest)) -> (match v_Vuna_dTypecheck_dtraitMethodKeys
  tctx tr with
  | [] -> v_Vuna_dTypecheck_dvalidateFunDicts subst tctx params rest
  | keys -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateFunDictKeys subst tctx params tr keys ty)
  (fun _u -> v_Vuna_dTypecheck_dvalidateFunDicts subst tctx params rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 704 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 701 1 ("no matching clause for Vuna.Typecheck.validateFunDicts")

let rec v_Vuna_dTypecheck_dvalidateTraitUsesList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Vuna_dBase_dOk (0)
  | (subst, tctx, params, (e) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
  subst tctx params e) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesList subst tctx params rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 661 1 ("no matching clause for Vuna.Typecheck.validateTraitUsesList")
and v_Vuna_dTypecheck_dvalidateTraitUses = fun subst tctx params expr -> (match expr with
  | C_Vuna_dTypecheck_dXEVar (n, sp) -> C_Vuna_dBase_dOk (0)
  | C_Vuna_dTypecheck_dXEInt (n, sp) -> C_Vuna_dBase_dOk (0)
  | C_Vuna_dTypecheck_dXEStr (s, sp) -> C_Vuna_dBase_dOk (0)
  | C_Vuna_dTypecheck_dXELam (ps, b, sp) -> v_Vuna_dTypecheck_dvalidateTraitUses subst tctx params b
  | C_Vuna_dTypecheck_dXEApp (f, args, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
    subst tctx params f) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesList subst tctx params args)
  | C_Vuna_dTypecheck_dXELet (binds, body, rec_u, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUsesBinds
    subst tctx params binds) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUses subst tctx params body)
  | C_Vuna_dTypecheck_dXECase (scrut, ty, alts, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
    subst tctx params scrut) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesAlts subst tctx params alts)
  | C_Vuna_dTypecheck_dXEIf (c, t, e, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
    subst tctx params c) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses subst
      tctx params t) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUses subst tctx params e))
  | C_Vuna_dTypecheck_dXEField (base, fname, baseTy, sp) -> v_Vuna_dTypecheck_dvalidateTraitUses subst
  tctx params base
  | C_Vuna_dTypecheck_dXERecUpdate (base, baseTy, fields, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
    subst tctx params base) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesFields subst tctx params fields)
  | C_Vuna_dTypecheck_dXEFun (name, cons, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateFunDicts
    subst tctx params cons) (fun _u -> C_Vuna_dBase_dOk (0))
  | C_Vuna_dTypecheck_dXEMethod (tr, key, paramTy, sp) -> (match v_Vuna_dTypecheck_ddictMethodExpr tctx
    subst params tr key paramTy with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": ") in
          (let vuna_cat2' = (e) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dOk (ex) -> C_Vuna_dBase_dOk (0)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 688 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEMethodInst (tr, key, instName, paramTy, sp) -> (let ty = v_Vuna_dTypecheck_dresolveTy
    subst paramTy in
    (match v_Vuna_dTypecheck_dlookupNamedInst instName (v_Vuna_dTypecheck_dtraitCtxInsts tctx) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
          (let vuna_cat1' = (": unknown named instance ") in
            (let vuna_cat2' = (instName) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (inst) -> if v_vuna_ueq_ustr (v_Vuna_dTypecheck_dinstTraitName inst) tr then if
      v_Vuna_dTypecheck_dtyEqual (v_Vuna_dTypecheck_dinstHeadTy inst) ty then C_Vuna_dBase_dOk (0)
      else C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
          (let vuna_cat1' = (": instance ") in
            (let vuna_cat2' = (instName) in
              (let vuna_cat3' = (" expects ") in
                (let vuna_cat4' = (v_Vuna_dTypecheck_dshowTy (v_Vuna_dTypecheck_dinstHeadTy inst)) in
                  (let vuna_cat5' = (" but method is used at ") in
                    (let vuna_cat6' = (v_Vuna_dTypecheck_dshowTy ty) in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                      vuna_cat5'; vuna_cat6']))))))))
      else C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
          (let vuna_cat1' = (": instance ") in
            (let vuna_cat2' = (instName) in
              (let vuna_cat3' = (" is not an instance of ") in
                (let vuna_cat4' = (tr) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 693 10 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 668 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dvalidateTraitUsesBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Vuna_dBase_dOk (0)
  | (subst, tctx, params, (C_Vuna_dBase_dPair (pat, value)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
  subst tctx params value) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesBinds subst tctx params rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 723 1 ("no matching clause for Vuna.Typecheck.validateTraitUsesBinds")
and v_Vuna_dTypecheck_dvalidateTraitUsesAlts = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Vuna_dBase_dOk (0)
  | (subst, tctx, params, (C_Vuna_dBase_dPair (pat, body)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
  subst tctx params body) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesAlts subst tctx params rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 729 1 ("no matching clause for Vuna.Typecheck.validateTraitUsesAlts")
and v_Vuna_dTypecheck_dvalidateTraitUsesFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Vuna_dBase_dOk (0)
  | (subst, tctx, params, (C_Vuna_dBase_dPair (fname, value)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
  subst tctx params value) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesFields subst tctx params rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 735 1 ("no matching clause for Vuna.Typecheck.validateTraitUsesFields")

let rec v_Vuna_dTypecheck_dvalidateTraitUsesClauses = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Vuna_dBase_dOk (0)
  | (subst, tctx, params, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUses
  subst tctx params body) (fun _u -> v_Vuna_dTypecheck_dvalidateTraitUsesClauses subst tctx params rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 717 1 ("no matching clause for Vuna.Typecheck.validateTraitUsesClauses")

let rec v_Vuna_dTypecheck_dfieldIndexAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (fname, [], i) -> C_Vuna_dBase_dNothing
  | (fname, (C_Vuna_dBase_dPair (n, t)) :: (rest), i) -> if v_vuna_ueq_ugeneric n fname then C_Vuna_dBase_dJust
(i)
else v_Vuna_dTypecheck_dfieldIndexAt fname rest (bi_add i 1)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 902 1 ("no matching clause for Vuna.Typecheck.fieldIndexAt")

let v_Vuna_dTypecheck_dfieldIndex = fun fname fields -> v_Vuna_dTypecheck_dfieldIndexAt fname fields 0

let rec v_Vuna_dTypecheck_dlowerFieldAccess = fun subst typeNames records tctx params base fname baseTy
sp -> (match v_Vuna_dTypecheck_dresolveTy subst baseTy with
  | C_Vuna_dTypecheck_dTCon (rname, args) -> (match v_Vuna_dTypecheck_dlookupRecord rname records with
  | C_Vuna_dBase_dNothing -> C_Vuna_dAst_dEInt (0, sp)
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dRecordInfo (rname2, rparams, fdefs, derivings)) -> (match v_Vuna_dTypecheck_dfieldIndex
      fname fdefs with
  | C_Vuna_dBase_dNothing -> C_Vuna_dAst_dEInt (0, sp)
  | C_Vuna_dBase_dJust (k) -> (let n = v_Vuna_dTypecheck_drecFieldCount fdefs in
        (let names = v_Vuna_dTypecheck_drecFieldVars n in
          (let pats = v_Vuna_dBase_dmap (fun nm -> C_Vuna_dAst_dPVar (nm, sp)) names in
            C_Vuna_dAst_dECase (v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx params base,
              (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (rname, pats, sp), C_Vuna_dAst_dEVar (v_Vuna_dTypecheck_dnthName
                    k names, sp))) :: ([]), sp))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 761 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 758 7 ("case pattern match failure"))
  | _ -> C_Vuna_dAst_dEInt (0, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 756 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_drecUpdateArgs = fun subst typeNames records tctx params fields provided vars i
sp -> (match fields with
  | [] -> []
  | (C_Vuna_dBase_dPair (fname, fty)) :: (rest) -> (match v_Vuna_dTypecheck_dlookupProvided fname provided
    with
  | C_Vuna_dBase_dJust (e) -> (v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx params e) ::
    (v_Vuna_dTypecheck_drecUpdateArgs subst typeNames records tctx params rest provided vars (bi_add i
        1) sp)
  | C_Vuna_dBase_dNothing -> (C_Vuna_dAst_dEVar (v_Vuna_dTypecheck_dnthName i vars, sp)) :: (v_Vuna_dTypecheck_drecUpdateArgs
      subst typeNames records tctx params rest provided vars (bi_add i 1) sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 775 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 772 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dlowerRecUpdate = fun subst typeNames records tctx params base baseTy fields sp
-> (match v_Vuna_dTypecheck_dresolveTy subst baseTy with
  | C_Vuna_dTypecheck_dTCon (rname, args) -> (match v_Vuna_dTypecheck_dlookupRecord rname records with
  | C_Vuna_dBase_dNothing -> C_Vuna_dAst_dEInt (0, sp)
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dRecordInfo (rname2, rparams, fdefs, derivings)) -> (let n =
      v_Vuna_dTypecheck_drecFieldCount fdefs in
      (let names = v_Vuna_dTypecheck_drecFieldVars n in
        (let pats = v_Vuna_dBase_dmap (fun nm -> C_Vuna_dAst_dPVar (nm, sp)) names in
          (let args2 = v_Vuna_dTypecheck_drecUpdateArgs subst typeNames records tctx params fdefs fields
            names 0 sp in
            C_Vuna_dAst_dECase (v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx params base,
              (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (rname, pats, sp), C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar
                    (rname, sp), args2, sp))) :: ([]), sp)))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 786 7 ("case pattern match failure"))
  | _ -> C_Vuna_dAst_dEInt (0, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 784 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dlowerExpr = fun subst typeNames records tctx params expr -> (match expr with
  | C_Vuna_dTypecheck_dXEVar (name, sp) -> C_Vuna_dAst_dEVar (name, sp)
  | C_Vuna_dTypecheck_dXEInt (n, sp) -> C_Vuna_dAst_dEInt (n, sp)
  | C_Vuna_dTypecheck_dXEStr (s, sp) -> C_Vuna_dAst_dEStr (s, sp)
  | C_Vuna_dTypecheck_dXELam (ps, b, sp) -> C_Vuna_dAst_dELam (ps, v_Vuna_dTypecheck_dlowerExpr subst
    typeNames records tctx params b, sp)
  | C_Vuna_dTypecheck_dXEApp (fn, args, sp) -> C_Vuna_dAst_dEApp (v_Vuna_dTypecheck_dlowerExpr subst typeNames
    records tctx params fn, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx
      params) args, sp)
  | C_Vuna_dTypecheck_dXELet (binds, body, rec_u, sp) -> C_Vuna_dAst_dELet (v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerBind
      subst typeNames records tctx params) binds, v_Vuna_dTypecheck_dlowerExpr subst typeNames records
    tctx params body, rec_u, sp)
  | C_Vuna_dTypecheck_dXECase (scrut, ty, alts, sp) -> C_Vuna_dAst_dECase (v_Vuna_dTypecheck_dlowerExpr
    subst typeNames records tctx params scrut, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerAlt subst typeNames
      records tctx params) alts, sp)
  | C_Vuna_dTypecheck_dXEIf (c, t, e, sp) -> C_Vuna_dAst_dEIf (v_Vuna_dTypecheck_dlowerExpr subst typeNames
    records tctx params c, v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx params t, v_Vuna_dTypecheck_dlowerExpr
    subst typeNames records tctx params e, sp)
  | C_Vuna_dTypecheck_dXEField (base, fname, baseTy, sp) -> v_Vuna_dTypecheck_dlowerFieldAccess subst
  typeNames records tctx params base fname baseTy sp
  | C_Vuna_dTypecheck_dXERecUpdate (base, baseTy, fields, sp) -> v_Vuna_dTypecheck_dlowerRecUpdate subst
  typeNames records tctx params base baseTy fields sp
  | C_Vuna_dTypecheck_dXEFun (name, cons, sp) -> (match v_Vuna_dTypecheck_ddictArgsFor tctx subst params
    cons with
  | [] -> C_Vuna_dAst_dEVar (name, sp)
  | args -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (name, sp), args, sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 821 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEMethod (tr, key, paramTy, sp) -> (match v_Vuna_dTypecheck_ddictMethodExpr tctx
    subst params tr key paramTy with
  | C_Vuna_dBase_dOk (ex) -> ex
  | C_Vuna_dBase_dErr (_) -> C_Vuna_dAst_dEVar ("vuna_missing_instance", sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 825 7 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEMethodInst (tr, key, instName, paramTy, sp) -> (match v_Vuna_dTypecheck_dlookupNamedInst
    instName (v_Vuna_dTypecheck_dtraitCtxInsts tctx) with
  | C_Vuna_dBase_dJust (inst) -> (match v_Vuna_dTypecheck_dlookupImpl (v_Vuna_dTypecheck_dlastSeg key)
      (v_Vuna_dTypecheck_dinstImpls inst) with
  | C_Vuna_dBase_dJust (fn) -> C_Vuna_dAst_dEVar (fn, sp)
  | C_Vuna_dBase_dNothing -> C_Vuna_dAst_dEVar ("vuna_missing_instance", sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 831 11 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> C_Vuna_dAst_dEVar ("vuna_missing_instance", sp)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 829 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 798 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dlowerBind = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, C_Vuna_dBase_dPair (pat, value)) -> C_Vuna_dBase_dPair (pat,
  v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx params value)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 836 1 ("no matching clause for Vuna.Typecheck.lowerBind")
and v_Vuna_dTypecheck_dlowerAlt = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, C_Vuna_dBase_dPair (pat, body)) -> C_Vuna_dBase_dPair (pat,
  v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx params body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 839 1 ("no matching clause for Vuna.Typecheck.lowerAlt")

let v_Vuna_dTypecheck_dlowerClause = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, C_Vuna_dBase_dPair (pats, body)) -> C_Vuna_dBase_dPair (pats,
  v_Vuna_dTypecheck_dlowerExpr subst typeNames records tctx params body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 842 1 ("no matching clause for Vuna.Typecheck.lowerClause")

let rec v_Vuna_dTypecheck_dlowerClauses = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, []) -> []
  | (subst, typeNames, records, tctx, params, (clause) :: (rest)) -> (v_Vuna_dTypecheck_dlowerClause subst
  typeNames records tctx params clause) :: (v_Vuna_dTypecheck_dlowerClauses subst typeNames records tctx
  params rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 845 1 ("no matching clause for Vuna.Typecheck.lowerClauses")

let rec v_Vuna_dTypecheck_dlookupLocal = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ugeneric n name then C_Vuna_dBase_dJust
(ty)
else v_Vuna_dTypecheck_dlookupLocal name rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1096 1 ("no matching clause for Vuna.Typecheck.lookupLocal")

let rec v_Vuna_dTypecheck_dinferPatterns = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, [], [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | (globals, locals, (p) :: (pr), (ty) :: (tr), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferPattern
  globals locals st p ty) (fun q -> (match q with
  | C_Vuna_dBase_dPair (locals2, st1) -> v_Vuna_dTypecheck_dinferPatterns globals locals2 pr tr st1
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1127 5 ("case pattern match failure")))
  | (globals, locals, _, _, st) -> C_Vuna_dBase_dErr ("pattern arity mismatch")
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1124 1 ("no matching clause for Vuna.Typecheck.inferPatterns")
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
        if v_vuna_ueq_uint (v_Vuna_dBase_dlength pats) (v_Vuna_dBase_dlength argTys) then v_Vuna_dBase_dandThen
        (v_Vuna_dTypecheck_dunify (v_Vuna_dTypecheck_dfunResult ctorTy) expected st1) (fun st2 -> v_Vuna_dTypecheck_dinferPatterns
          globals locals pats argTys st2)
        else C_Vuna_dBase_dErr ((let vuna_cat0' = ("constructor ") in
            (let vuna_cat1' = (name) in
              (let vuna_cat2' = (" expects ") in
                (let vuna_cat3' = (bi_str_from_int (v_Vuna_dBase_dlength argTys)) in
                  (let vuna_cat4' = (" arguments") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1141 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1138 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1132 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dinstantiateForParam = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (st, C_Vuna_dTypecheck_dScheme (qs, cons, ty), pid) -> (match v_Vuna_dTypecheck_dinstantiateVars qs
  st with
  | C_Vuna_dBase_dPair (mapping, st2) -> (let ty2 = v_Vuna_dTypecheck_drenameTy mapping ty in
    (let paramTy = (match v_Vuna_dTypecheck_dlookupSubst pid mapping with
  | C_Vuna_dBase_dJust (t) -> t
  | C_Vuna_dBase_dNothing -> C_Vuna_dTypecheck_dTVar (pid)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1242 24 ("case pattern match failure")) in
      C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, paramTy), st2)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1239 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1238 1 ("no matching clause for Vuna.Typecheck.instantiateForParam")

let v_Vuna_dTypecheck_dsolveFieldConstraint = fun typeNames records baseTy fname targetTy sp st -> (match
  v_Vuna_dTypecheck_dresolveTy (v_Vuna_dTypecheck_dsubstOf st) baseTy with
  | C_Vuna_dTypecheck_dTVar (i) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (false, st))
  | C_Vuna_dTypecheck_dTCon (rname, args) -> (match v_Vuna_dTypecheck_dlookupRecord rname records with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": not a record type: ") in
          (let vuna_cat2' = (rname) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dRecordInfo (rname2, params, fdefs, derivings)) -> (match v_Vuna_dTypecheck_dfieldIndex
      fname fdefs with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
          (let vuna_cat1' = (": unknown field ") in
            (let vuna_cat2' = (fname) in
              (let vuna_cat3' = (" for record ") in
                (let vuna_cat4' = (rname) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dJust (k) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames (v_Vuna_dTypecheck_dzipParamTys
          params args) st (v_Vuna_dTypecheck_dnthFieldTy k fdefs)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (fty, vars), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
            targetTy fty st1) (fun st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (true, st2)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1412 17 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1407 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1404 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": not a record type in field access/update")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1401 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dsolveOneConstraint = fun typeNames records c st -> (match c with
  | C_Vuna_dTypecheck_dFieldCon (baseTy, fname, targetTy, sp) -> v_Vuna_dTypecheck_dsolveFieldConstraint
  typeNames records baseTy fname targetTy sp st
  | C_Vuna_dTypecheck_dUpdateCon (baseTy, fname, valTy, sp) -> v_Vuna_dTypecheck_dsolveFieldConstraint
  typeNames records baseTy fname valTy sp st
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1394 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dsolveRecPass = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (typeNames, records, [], st, acc) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse acc,
    st))
  | (typeNames, records, (c) :: (rest), st, acc) -> (match v_Vuna_dTypecheck_dsolveOneConstraint typeNames
  records c st with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (solved, st1)) -> (match solved with
  | true -> v_Vuna_dTypecheck_dsolveRecPass typeNames records rest st1 acc
  | false -> v_Vuna_dTypecheck_dsolveRecPass typeNames records rest st1 ((c) :: (acc))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1389 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1386 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1383 1 ("no matching clause for Vuna.Typecheck.solveRecPass")

let rec v_Vuna_dTypecheck_dsolveRecConstraints = fun typeNames records cons st -> (match v_Vuna_dTypecheck_dsolveRecPass
  typeNames records cons st [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (remaining, st2)) -> (match remaining with
  | [] -> C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dclearRecConstraints st2)
  | _ -> if v_vuna_ueq_uint (v_Vuna_dBase_dlength remaining) (v_Vuna_dBase_dlength cons) then C_Vuna_dBase_dErr
    (v_Vuna_dTypecheck_drecConstraintFailMsg remaining)
    else v_Vuna_dTypecheck_dsolveRecConstraints typeNames records remaining st2
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1365 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1362 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dupdateScheme = fun name sch env -> (match env with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, s)) :: (rest) -> if v_vuna_ueq_ugeneric n name then (C_Vuna_dBase_dPair (n,
      sch)) :: (rest)
  else (C_Vuna_dBase_dPair (n, s)) :: (v_Vuna_dTypecheck_dupdateScheme name sch rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1467 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfreeVarsEnvExcept = fun name env -> (match env with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, sch)) :: (rest) -> if v_vuna_ueq_ugeneric n name then v_Vuna_dTypecheck_dfreeVarsEnvExcept
  name rest
  else v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsScheme sch) (v_Vuna_dTypecheck_dfreeVarsEnvExcept
    name rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1473 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dfilterNeeds = fun a0 a1 -> match (a0, a1) with
  | (genVars, []) -> []
  | (genVars, (C_Vuna_dBase_dPair (tr, ty)) :: (rest)) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (v) -> if v_Vuna_dTypecheck_dmemInt v genVars then (C_Vuna_dBase_dPair (tr,
      ty)) :: (v_Vuna_dTypecheck_dfilterNeeds genVars rest)
  else v_Vuna_dTypecheck_dfilterNeeds genVars rest
  | other -> v_Vuna_dTypecheck_dfilterNeeds genVars rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1492 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1489 1 ("no matching clause for Vuna.Typecheck.filterNeeds")

let v_Vuna_dTypecheck_dfinishFunctionScheme = fun globals name inferred needs elab st -> (let resolved
  = v_Vuna_dTypecheck_dresolveTy (v_Vuna_dTypecheck_dsubstOf st) inferred in
  (let qs = v_Vuna_dTypecheck_ddiffInts (v_Vuna_dTypecheck_dfreeVarsTy resolved) (v_Vuna_dTypecheck_dfreeVarsEnvExcept
      name globals) in
    (let scheme = C_Vuna_dTypecheck_dScheme (qs, needs, resolved) in
      C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elab, C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dupdateScheme
            name scheme globals, st))))))

let v_Vuna_dTypecheck_dfinishFunctionLower = fun globals name inferred needs params clauses2 st -> (let
  elab = v_Vuna_dTypecheck_dlowerClauses (v_Vuna_dTypecheck_dsubstOf st) (v_Vuna_dTypecheck_dtypeNamesOfTC
    st) (v_Vuna_dTypecheck_drecordsOf st) (v_Vuna_dTypecheck_dtraitCtxOf st) params clauses2 in
  v_Vuna_dTypecheck_dfinishFunctionScheme globals name inferred needs elab st)

let v_Vuna_dTypecheck_dfinishFunctionCheck = fun globals name inferred needs params clauses st -> (match
  v_Vuna_dTypecheck_dprependClauseParams (v_Vuna_dTypecheck_ddictParamNames params) clauses with
  | clauses2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dvalidateTraitUsesClauses (v_Vuna_dTypecheck_dsubstOf
      st) (v_Vuna_dTypecheck_dtraitCtxOf st) params clauses2) (fun _u -> v_Vuna_dTypecheck_dfinishFunctionLower
    globals name inferred needs params clauses2 st)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1523 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dfinishFunction = fun globals decls sigs name inferred needs genVars clauses st
-> (let params = v_Vuna_dTypecheck_ddictParamsFor (v_Vuna_dTypecheck_dtraitCtxOf st) needs in
  v_Vuna_dTypecheck_dfinishFunctionCheck globals name inferred needs params clauses st)

let v_Vuna_dTypecheck_dtraitMethodScheme = fun typeNames paramName sigTy -> v_Vuna_dTypecheck_dconvertType
typeNames ((C_Vuna_dBase_dPair (paramName, C_Vuna_dTypecheck_dTVar (0))) :: ([])) (C_Vuna_dTypecheck_dTC
  (0, [], typeNames, [], [], [], C_Vuna_dTypecheck_dTraitCtx ([], [], [], [], []))) sigTy

let rec v_Vuna_dTypecheck_dtraitMethodInfos = fun typeNames tname paramName methods infos refs sp -> (match
  methods with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse infos, v_Vuna_dBase_dreverse refs))
  | (C_Vuna_dBase_dPair (mname, sigTy)) :: (rest) -> if v_Vuna_dBase_dmemName (v_Vuna_dTypecheck_dlastSeg
    mname) (v_Vuna_dBase_dmap v_Vuna_dTypecheck_dmethodInfoName infos) then C_Vuna_dBase_dErr ((let vuna_cat0'
      = (v_Vuna_dBase_dshowSpanLoc sp) in
      (let vuna_cat1' = (": duplicate trait method ") in
        (let vuna_cat2' = (mname) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  else (match v_Vuna_dTypecheck_dtraitMethodScheme typeNames paramName sigTy with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": in trait ") in
          (let vuna_cat2' = (tname) in
            (let vuna_cat3' = (" method ") in
              (let vuna_cat4' = (mname) in
                (let vuna_cat5' = (": ") in
                  (let vuna_cat6' = (e) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                    vuna_cat6']))))))))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars), st)) -> (match v_Vuna_dTypecheck_dlookupTyVar
      paramName vars with
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dTVar (pid)) -> v_Vuna_dTypecheck_dtraitMethodInfos typeNames
      tname paramName rest ((C_Vuna_dTypecheck_dTraitMethodInfo (v_Vuna_dTypecheck_dlastSeg mname, v_Vuna_dTypecheck_dmkScheme
            (v_Vuna_dTypecheck_dvarIds vars) ty, sigTy)) :: (infos)) ((C_Vuna_dTypecheck_dTraitMethodRef
          (mname, tname, v_Vuna_dTypecheck_dmkScheme (v_Vuna_dTypecheck_dvarIds vars) ty, pid)) :: (refs))
      sp
  | _ -> C_Vuna_dBase_dErr (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": internal trait parameter error")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1848 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1845 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1839 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dcollectTraitDeclsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, [], acc, refs) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (acc, refs))
  | (typeNames, (d) :: (rest), acc, refs) -> (match d with
  | C_Vuna_dAst_dDTrait (tname, params, methods, sp) -> (match params with
  | (p) :: ([]) -> if v_Vuna_dBase_dmemName tname (v_Vuna_dBase_dmap v_Vuna_dTypecheck_dtraitDeclName
      acc) then C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": duplicate trait ") in
          (let vuna_cat2' = (tname) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
    else (match v_Vuna_dTypecheck_dtraitMethodInfos typeNames tname p methods [] [] sp with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (infos, newRefs)) -> v_Vuna_dTypecheck_dcollectTraitDeclsGo typeNames
      rest (v_Vuna_dBase_dappend acc ((C_Vuna_dTypecheck_dTraitDecl (tname, p, infos)) :: ([]))) (v_Vuna_dBase_dappend
        refs newRefs)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1831 13 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": trait ") in
          (let vuna_cat2' = (tname) in
            (let vuna_cat3' = (" must have exactly one type parameter") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1826 7 ("case pattern match failure"))
  | _ -> v_Vuna_dTypecheck_dcollectTraitDeclsGo typeNames rest acc refs
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1824 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1821 1 ("no matching clause for Vuna.Typecheck.collectTraitDeclsGo")

let v_Vuna_dTypecheck_dcollectTraitDecls = fun typeNames decls -> v_Vuna_dTypecheck_dcollectTraitDeclsGo
typeNames decls (v_Vuna_dTypecheck_dbuiltinTraitDecls ()) (v_Vuna_dTypecheck_dbuiltinMethodRefs ())

let v_Vuna_dTypecheck_dfinalizeScheme = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dTypecheck_dScheme (qs, cons, ty)) -> C_Vuna_dTypecheck_dScheme (qs, v_Vuna_dBase_dmap
  (fun c -> C_Vuna_dBase_dPair (v_Vuna_dBase_dfirstOf c, v_Vuna_dTypecheck_dresolveTy subst (v_Vuna_dBase_dsecondOf
        c))) cons, v_Vuna_dTypecheck_dresolveTy subst ty)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2558 1 ("no matching clause for Vuna.Typecheck.finalizeScheme")

let rec v_Vuna_dTypecheck_dfinalizeGlobals = fun subst globals -> (match globals with
  | [] -> []
  | (C_Vuna_dBase_dPair (name, sch)) :: (rest) -> (C_Vuna_dBase_dPair (name, v_Vuna_dTypecheck_dfinalizeScheme
      subst sch)) :: (v_Vuna_dTypecheck_dfinalizeGlobals subst rest)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2562 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dfindMethodNamed = fun name methods -> (match methods with
  | [] -> C_Vuna_dBase_dNothing
  | (C_Vuna_dBase_dPair (mname, ty)) :: (rest) -> if v_vuna_ueq_ugeneric mname name then C_Vuna_dBase_dJust
  (mname)
  else v_Vuna_dLoader_dfindMethodNamed name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 640 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dfindOwnCtorName = fun name decls -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> (match v_Vuna_dLoader_dfindCtorNamed name
      ctors with
  | C_Vuna_dBase_dJust (cname) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (dname, cname))
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dfindOwnCtorName name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 664 11 ("case pattern match failure"))
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_vuna_ueq_ustr dname name then
    C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (dname, dname))
    else v_Vuna_dLoader_dfindOwnCtorName name rest
  | C_Vuna_dAst_dDTrait (tname, params, methods, sp) -> (match v_Vuna_dLoader_dfindMethodNamed name methods
      with
  | C_Vuna_dBase_dJust (mname) -> C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (tname, mname))
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dfindOwnCtorName name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 670 11 ("case pattern match failure"))
  | _ -> v_Vuna_dLoader_dfindOwnCtorName name rest
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 662 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 659 3 ("case pattern match failure"))

let v_Vuna_dLoader_downOrImportedValueRef2 = fun modules prefix decls imports name -> (match v_Vuna_dLoader_dfindOwnCtorName
  name decls with
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (dname, cname)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef
      ("ctor", v_Vuna_dLoader_dmangle prefix cname, v_Vuna_dLoader_dmangle prefix dname)))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dLoader_dmodulesExportingValue modules imports name with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dNothing)
  | pairs -> (match v_Vuna_dLoader_dunifyEntryPairs prefix "name" name pairs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (p) -> (let e = v_Vuna_dBase_dsecondOf p in
        C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef (v_Vuna_dLoader_dentryKind e,
              v_Vuna_dLoader_dentryTarget e, v_Vuna_dLoader_dentryParent e))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 808 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 805 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 801 3 ("case pattern match failure"))

let v_Vuna_dLoader_downOrImportedValueRef = fun modules prefix decls imports name -> (match v_Vuna_dLoader_dfindOwnFn
  name decls with
  | C_Vuna_dBase_dJust (fn) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef ("val",
        v_Vuna_dLoader_dmangle prefix fn, "")))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dLoader_dfindOwnInstanceName name decls with
  | C_Vuna_dBase_dJust (iname) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dJust (C_Vuna_dLoader_dExportRef ("val",
          v_Vuna_dLoader_dmangle prefix iname, "")))
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_downOrImportedValueRef2 modules prefix decls imports name
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 795 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 792 3 ("case pattern match failure"))

let v_Vuna_dLoader_dexportBare = fun modules prefix decls imports name sp -> (match v_Vuna_dBase_dsplitLastDot
  (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (match revPrefix with
  | [] -> if v_Vuna_dLoader_disPrivateName name then C_Vuna_dBase_dErr (v_Vuna_dLoader_dprivateExportMsg
      prefix sp name)
    else v_Vuna_dBase_dandThen (v_Vuna_dLoader_downOrImportedTypeRef modules prefix decls imports name)
    (fun tr -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_downOrImportedValueRef modules prefix decls imports
        name) (fun vr -> (match tr with
  | C_Vuna_dBase_dNothing -> (match vr with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (prefix) in
                (let vuna_cat1' = (": ") in
                  (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
                    (let vuna_cat3' = (": cannot export unknown name ") in
                      (let vuna_cat4' = (name) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dBase_dJust (_) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_drefEntryList name vr)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 825 21 ("case pattern match failure"))
  | C_Vuna_dBase_dJust (_) -> (match vr with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk (v_Vuna_dLoader_drefEntryList name tr)
  | C_Vuna_dBase_dJust (_) -> if v_Vuna_dLoader_dtypeRefDominates modules decls prefix tr vr then C_Vuna_dBase_dOk
            (v_Vuna_dLoader_drefEntryList name tr)
            else C_Vuna_dBase_dOk (v_Vuna_dBase_dappend (v_Vuna_dLoader_drefEntryList name tr) (v_Vuna_dLoader_drefEntryList
                name vr))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 830 21 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 823 17 ("case pattern match failure"))))
  | _ -> (let mprefix = v_Vuna_dBase_djoinDots revPrefix in
      (match v_Vuna_dLoader_dfindImportPrefix imports mprefix with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (prefix) in
            (let vuna_cat1' = (": ") in
              (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
                (let vuna_cat3' = (": module ") in
                  (let vuna_cat4' = (mprefix) in
                    (let vuna_cat5' = (" is not imported") in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                      vuna_cat5'])))))))
  | C_Vuna_dBase_dJust (m) -> v_Vuna_dLoader_dexportSelective modules prefix m base name sp
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 837 14 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 817 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 815 3 ("case pattern match failure"))

let v_Vuna_dLoader_dexportItemEntries = fun modules prefix decls imports item -> (match item with
  | C_Vuna_dAst_dXModule (name, sp) -> (match v_Vuna_dLoader_dfindImportPrefix imports name with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (prefix) in
        (let vuna_cat1' = (": ") in
          (let vuna_cat2' = (v_Vuna_dBase_dshowSpanLoc sp) in
            (let vuna_cat3' = (": module ") in
              (let vuna_cat4' = (name) in
                (let vuna_cat5' = (" is not imported") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | C_Vuna_dBase_dJust (m) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dexportsOf modules m)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 905 7 ("case pattern match failure"))
  | C_Vuna_dAst_dXTypeAll (name, sp) -> v_Vuna_dLoader_dexportTypeAll modules prefix decls imports name
  sp
  | C_Vuna_dAst_dXBare (name, sp) -> v_Vuna_dLoader_dexportBare modules prefix decls imports name sp
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 903 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dexplicitExports = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (modules, prefix, decls, imports, []) -> C_Vuna_dBase_dOk ([])
  | (modules, prefix, decls, imports, (item) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dexportItemEntries
  modules prefix decls imports item) (fun es -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dexplicitExports
    modules prefix decls imports rest) (fun tail -> C_Vuna_dBase_dOk (v_Vuna_dBase_dappend es tail)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 926 1 ("no matching clause for Vuna.Loader.explicitExports")

let v_Vuna_dLoader_dcomputeExports = fun modules prefix hdr imports decls -> (match hdr with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dimplicitExports prefix decls)
  | C_Vuna_dBase_dJust (C_Vuna_dAst_dModDecl (declared, hasList, items, sp)) -> if hasList then v_Vuna_dBase_dandThen
  (v_Vuna_dLoader_dexplicitExports modules prefix decls imports items) (fun es -> v_Vuna_dBase_dandThen
    (v_Vuna_dLoader_dcheckExportDuplicates prefix es) (fun _u -> C_Vuna_dBase_dOk (es)))
  else C_Vuna_dBase_dOk (v_Vuna_dLoader_dimplicitExports prefix decls)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 944 3 ("case pattern match failure"))

let rec v_Vuna_dLoader_dloadAll = fun roots modules stack imports -> (match imports with
  | [] -> C_Vuna_dBase_dOk (modules)
  | (imp) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadModule roots modules stack (v_Vuna_dLoader_dimportName
      imp)) (fun modules2 -> v_Vuna_dLoader_dloadAll roots modules2 stack rest)
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 955 3 ("case pattern match failure"))
and v_Vuna_dLoader_dloadModule = fun roots modules stack name -> (match v_Vuna_dLoader_dfindModule modules
  name with
  | C_Vuna_dBase_dJust (m) -> C_Vuna_dBase_dOk (modules)
  | C_Vuna_dBase_dNothing -> if v_Vuna_dBase_dmemName name stack then C_Vuna_dBase_dErr ((("import cycle: ")
      ^ (v_Vuna_dLoader_dshowCycle name stack)))
  else if v_Vuna_dLoader_dvalidModuleName name then v_Vuna_dBase_dandThen (v_Vuna_dLoader_dfindModuleFile
    roots name) (fun path -> v_Vuna_dBase_dandThen (v_Vuna_dParser_dparseSource path (bi_read_file path))
    (fun src -> (match src with
  | C_Vuna_dAst_dSource (hdr, imports, decls) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dvalidateModuleHeader
          name hdr) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dvalidateImports name imports) (fun
            _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadAll roots modules ((name) :: (stack)) imports)
            (fun modules2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcomputeExports modules2 name hdr imports
                decls) (fun exports -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dModule (name, imports, decls,
                      exports)) :: (modules2))))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 969 13 ("case pattern match failure"))))
  else C_Vuna_dBase_dErr ((("invalid module name: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 962 3 ("case pattern match failure"))

let v_Vuna_dLoader_dloadProgram = fun roots entry -> if bi_file_exists entry then v_Vuna_dBase_dandThen
(v_Vuna_dParser_dparseSource entry (bi_read_file entry)) (fun src -> (match src with
  | C_Vuna_dAst_dSource (hdr, imports, decls) -> (match hdr with
  | C_Vuna_dBase_dJust (C_Vuna_dAst_dModDecl (dname, hasList, items, sp)) -> C_Vuna_dBase_dErr ((let vuna_cat0'
          = ("module header is not allowed in entry file (") in
          (let vuna_cat1' = (entry) in
            (let vuna_cat2' = (")") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dNothing -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dvalidateImports "<entry>" imports)
      (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadAll roots [] [] imports) (fun modules -> v_Vuna_dBase_dandThen
          (v_Vuna_dLoader_dresolveEntry modules imports decls) (fun entryDecls -> v_Vuna_dBase_dandThen
            (v_Vuna_dLoader_dresolveModules modules) (fun moduleDecls -> C_Vuna_dBase_dOk (v_Vuna_dBase_dappend
                entryDecls moduleDecls)))))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 983 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Loader.vuna" 981 7 ("case pattern match failure")))
else C_Vuna_dBase_dErr ((("entry file not found: ") ^ (entry)))

let v_vuna_uneq_ugeneric = fun a b -> bi_neq_generic a b

let v_Lint_denclosingAlt = fun lines toks headLine expectedIndent -> if v_vuna_ult_uint headLine 1 then
C_Vuna_dBase_dNothing
else (let line = v_Lint_dlineAt lines headLine in
  if v_Lint_disBlankLine line then C_Vuna_dBase_dNothing
  else if v_vuna_uneq_ugeneric (v_Lint_dindentOf line) expectedIndent then C_Vuna_dBase_dNothing
  else (let ts = v_Lint_dtokensOnLine toks headLine in
    if v_Lint_dhasSym ts "\\" then C_Vuna_dBase_dNothing
    else (match v_Lint_dlastToken ts with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (t) -> if v_Lint_dtokIsSym t "=>" then C_Vuna_dBase_dJust (C_Lint_dEnclosing (headLine,
          ts, "alt"))
      else C_Vuna_dBase_dNothing
  | _ -> vuna_fail "app/Lint.vuna" 430 15 ("case pattern match failure"))))

let v_Lint_denclosingOf = fun lines toks caseLine indent -> if v_vuna_ueq_uint indent 2 then v_Lint_denclosingClause
lines toks (bi_sub caseLine 1)
else v_Lint_denclosingAlt lines toks (bi_sub caseLine 1) (bi_sub indent 2)

let v_vuna_ult_ugeneric = fun a b -> bi_lt_generic a b

let v_vuna_ule_ugeneric = fun a b -> bi_le_generic a b

let v_vuna_ugt_ugeneric = fun a b -> bi_gt_generic a b

let rec v_Lint_dscanBody = fun lines toks lastLine n indent acc -> if v_vuna_ugt_uint n lastLine then
C_Lint_dCaseBody (n, v_Vuna_dBase_dreverse acc)
else (let line = v_Lint_dlineAt lines n in
  if v_Lint_disBlankLine line then v_Lint_dscanBody lines toks lastLine (bi_add n 1) indent ((line)
    :: (acc))
  else if v_vuna_ugt_ugeneric (v_Lint_dindentOf line) indent then v_Lint_dscanBody lines toks lastLine
  (bi_add n 1) indent ((line) :: (acc))
  else C_Lint_dCaseBody (n, v_Vuna_dBase_dreverse acc))

let rec v_Vuna_dEval_dstrCmpChars = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> 0
  | ([], (y) :: (ys)) -> bi_sub 0 1
  | ((x) :: (xs), []) -> 1
  | ((x) :: (xs), (y) :: (ys)) -> if v_vuna_ult_ugeneric x y then bi_sub 0 1
else if v_vuna_ugt_ugeneric x y then 1
else v_Vuna_dEval_dstrCmpChars xs ys
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 340 1 ("no matching clause for Vuna.Eval.strCmpChars")

let rec v_Vuna_dEval_dvalueCompare = fun a b -> (match a with
  | C_Vuna_dEval_dVInt (x) -> (match b with
  | C_Vuna_dEval_dVInt (y) -> if v_vuna_ult_uint x y then bi_sub 0 1
    else if v_vuna_ueq_uint x y then 0
    else 1
  | _ -> bi_sub 0 1
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 352 7 ("case pattern match failure"))
  | C_Vuna_dEval_dVStr (x) -> (match b with
  | C_Vuna_dEval_dVStr (y) -> v_Vuna_dEval_dstrCmpChars (bi_str_unpack x) (bi_str_unpack y)
  | C_Vuna_dEval_dVInt (y) -> 1
  | _ -> bi_sub 0 1
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 356 7 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon (n, xs) -> (match b with
  | C_Vuna_dEval_dVCon (m, ys) -> v_Vuna_dEval_dconCmp n xs m ys
  | _ -> 1
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 361 7 ("case pattern match failure"))
  | _ -> 0
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 350 3 ("case pattern match failure"))
and v_Vuna_dEval_dconCmp = fun n xs m ys -> (match v_Vuna_dEval_dstrCmpChars (bi_str_unpack n) (bi_str_unpack
    m) with
  | 0 -> v_Vuna_dEval_dlistCmp xs ys
  | r -> r
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 367 3 ("case pattern match failure"))
and v_Vuna_dEval_dlistCmp = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> 0
  | ([], (y) :: (ys)) -> bi_sub 0 1
  | ((x) :: (xs), []) -> 1
  | ((x) :: (xs), (y) :: (ys)) -> (match v_Vuna_dEval_dvalueCompare x y with
  | 0 -> v_Vuna_dEval_dlistCmp xs ys
  | r -> r
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 378 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 371 1 ("no matching clause for Vuna.Eval.listCmp")

let v_Vuna_dEval_dgenericEq = fun sp args -> (match args with
  | (a) :: ((b) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ueq_uint (v_Vuna_dEval_dvalueCompare
        a b) 0))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for generic equality"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 383 3 ("case pattern match failure"))

let v_Vuna_dEval_dgenericCmp = fun sp args mode -> (match args with
  | (a) :: ((b) :: ([])) -> (let r = v_Vuna_dEval_dvalueCompare a b in
    if v_vuna_ueq_uint mode 0 then C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ult_uint r 0))
    else if v_vuna_ueq_uint mode 1 then C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ule_uint r 0))
    else if v_vuna_ueq_uint mode 2 then C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ugt_uint r 0))
    else C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_uge_uint r 0)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for generic comparison"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 388 3 ("case pattern match failure"))

let v_Vuna_dEval_dcallBuiltin = fun name args sp -> (match name with
  | "+" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_add x y)))
  | "-" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_sub x y)))
  | "*" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_mul x y)))
  | "/" -> v_Vuna_dEval_ddivideBuiltin sp args
  | "==" -> v_Vuna_dEval_deqBuiltin sp args
  | "/=" -> v_Vuna_dEval_dneqBuiltin sp args
  | "<" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ult_uint
        x y)))
  | "<=" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ule_uint
        x y)))
  | ">" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ugt_uint
        x y)))
  | ">=" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_uge_uint
        x y)))
  | "bi_eq_generic" -> v_Vuna_dEval_dgenericEq sp args
  | "bi_neq_generic" -> (match v_Vuna_dEval_dgenericEq sp args with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (v) -> (match v with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | _ -> C_Vuna_dBase_dErr ("bad bool")
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 413 17 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 411 7 ("case pattern match failure"))
  | "bi_lt_generic" -> v_Vuna_dEval_dgenericCmp sp args 0
  | "bi_le_generic" -> v_Vuna_dEval_dgenericCmp sp args 1
  | "bi_gt_generic" -> v_Vuna_dEval_dgenericCmp sp args 2
  | "bi_ge_generic" -> v_Vuna_dEval_dgenericCmp sp args 3
  | "bi_show_string" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (v_Vuna_dEval_dshowString s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for bi_show_string"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 422 7 ("case pattern match failure"))
  | "bi_eq_int" -> v_Vuna_dEval_deqBuiltin sp args
  | "bi_neq_int" -> v_Vuna_dEval_dneqBuiltin sp args
  | "bi_lt_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ult_uint
        x y)))
  | "bi_le_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ule_uint
        x y)))
  | "bi_gt_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_ugt_uint
        x y)))
  | "bi_ge_int" -> v_Vuna_dEval_dint2 sp args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (v_vuna_uge_uint
        x y)))
  | "bi_eq_str" -> v_Vuna_dEval_deqBuiltin sp args
  | "bi_neq_str" -> v_Vuna_dEval_dneqBuiltin sp args
  | "bi_eq_bool" -> (match args with
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool false)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool false)
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for bi_eq_bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 434 7 ("case pattern match failure"))
  | "bi_neq_bool" -> (match args with
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool true)
  | (C_Vuna_dEval_dVCon ("True", [])) :: ((C_Vuna_dEval_dVCon ("True", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool false)
  | (C_Vuna_dEval_dVCon ("False", [])) :: ((C_Vuna_dEval_dVCon ("False", [])) :: ([])) -> C_Vuna_dBase_dOk
    (v_Vuna_dEval_dvbool false)
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for bi_neq_bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 441 7 ("case pattern match failure"))
  | "&&" -> v_Vuna_dEval_dandBuiltin sp args
  | "||" -> v_Vuna_dEval_dorBuiltin sp args
  | "++" -> v_Vuna_dEval_dstr2 sp args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr (((x) ^ (y)))))
  | "strLength" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_str_length s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strLength"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 451 7 ("case pattern match failure"))
  | "strUnpack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (v_Vuna_dEval_dstringToValue
        s))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strUnpack"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 455 7 ("case pattern match failure"))
  | "strPack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dvalueToChars sp a) (fun cs -> C_Vuna_dBase_dOk
      (C_Vuna_dEval_dVStr (bi_str_pack cs)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strPack"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 459 7 ("case pattern match failure"))
  | "strFromInt" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (bi_str_from_int n)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for strFromInt"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 463 7 ("case pattern match failure"))
  | "readFile" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (bi_read_file s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for readFile"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 467 7 ("case pattern match failure"))
  | "writeFile" -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun path -> v_Vuna_dBase_dandThen
      (v_Vuna_dEval_dstringArg sp b) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_write_file path
            s))))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for writeFile"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 471 7 ("case pattern match failure"))
  | "print" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_print s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for print"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 477 7 ("case pattern match failure"))
  | "getArgs" -> C_Vuna_dBase_dOk (v_Vuna_dEval_dstrListToValue (bi_get_args ()))
  | "fileExists" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg sp a) (fun s -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
        (bi_file_exists s)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for fileExists"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 482 7 ("case pattern match failure"))
  | "exit" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg sp a) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_exit n)))
  | _ -> v_Vuna_dEval_derrAt sp "bad arguments for exit"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 486 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_derrAt sp ((("unknown builtin: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 398 3 ("case pattern match failure"))

let v_Vuna_dEval_devalGlobalNonFun = fun decls name sp -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, []))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dBase_dJust (arity) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dEval_dcallBuiltin name [] sp

    else C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin (name, []))
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unbound variable: ") ^ (name)))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 47 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 44 3 ("case pattern match failure"))

let v_Vuna_dEval_dapplyBuiltin = fun decls name args arg sp -> (match v_Vuna_dBuiltins_dbuiltinArity name
  with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown builtin: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (let args2 = v_Vuna_dBase_dappend args ((arg) :: ([])) in
    if v_vuna_ult_uint (v_Vuna_dBase_dlength args2) arity then C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin
      (name, args2))
    else if v_vuna_ueq_uint (v_Vuna_dBase_dlength args2) arity then v_Vuna_dEval_dcallBuiltin name args2
    sp
    else v_Vuna_dEval_derrAt sp ((("too many arguments for builtin ") ^ (name))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 195 3 ("case pattern match failure"))

let rec v_Vuna_dEval_dforceValue = fun decls v -> (match v with
  | C_Vuna_dEval_dVFun (name, []) -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dEval_dcallFunction decls name [] v_Vuna_dEval_dnoLocSpan
  | _ -> C_Vuna_dBase_dOk (v)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 26 7 ("case pattern match failure"))
  | _ -> C_Vuna_dBase_dOk (v)
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 24 3 ("case pattern match failure"))
and v_Vuna_dEval_devalVar = fun decls env name sp -> (match v_Vuna_dBase_dlookupPair name env with
  | C_Vuna_dBase_dJust (v) -> v_Vuna_dEval_dforceValue decls v
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_devalGlobal decls name sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 32 3 ("case pattern match failure"))
and v_Vuna_dEval_devalGlobal = fun decls name sp -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dEval_dcallFunction decls name
  [] sp
  else C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun (name, []))
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_devalGlobalNonFun decls name sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 37 3 ("case pattern match failure"))
and v_Vuna_dEval_devalExpr = fun decls env expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> v_Vuna_dEval_devalVar decls env name sp
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (n))
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr (s))
  | C_Vuna_dAst_dELam (params, body, _) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (params, body, env))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dEval_devalApp decls env sp fn args
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dEval_devalLet decls env sp rec_u binds body
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dEval_devalCase decls env sp scrut alts
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dEval_devalIf decls env sp c t e
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 53 3 ("case pattern match failure"))
and v_Vuna_dEval_devalApp = fun decls env sp fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("&&", sp2) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalAndShort decls env sp2 a b
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 68 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar ("||", sp2) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalOrShort decls env sp2 a b
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 72 7 ("case pattern match failure"))
  | _ -> v_Vuna_dEval_devalApply decls env sp fn args
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 66 3 ("case pattern match failure"))
and v_Vuna_dEval_devalApply = fun decls env sp fn args -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env fn) (fun fv -> v_Vuna_dEval_dfoldApply decls env sp fv args)
and v_Vuna_dEval_devalAndShort = fun decls env sp a b -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (av)
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun
      bv -> v_Vuna_dEval_dexpectBoolValue sp bv)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 88 5 ("case pattern match failure")))
and v_Vuna_dEval_devalOrShort = fun decls env sp a b -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (av)
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun
      bv -> v_Vuna_dEval_dexpectBoolValue sp bv)
  | _ -> v_Vuna_dEval_derrAt sp "expected a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 96 5 ("case pattern match failure")))
and v_Vuna_dEval_dfoldApply = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, sp, fv, []) -> C_Vuna_dBase_dOk (fv)
  | (decls, env, sp, fv, (arg) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env arg)
(fun av -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dapplyValue decls sp fv av) (fun fv2 -> v_Vuna_dEval_dfoldApply
    decls env sp fv2 rest))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 102 1 ("no matching clause for Vuna.Eval.foldApply")
and v_Vuna_dEval_devalLet = fun decls env sp rec_u binds body -> if (if (rec_u) then (v_Vuna_dEval_drecursiveBindings
    binds)
  else false) then v_Vuna_dEval_derrAt sp "recursive let (where) bindings are only supported by the compiler (use --typecheck); the interpreter evaluates them sequentially"

else v_Vuna_dBase_dandThen (v_Vuna_dEval_devalBindings decls env sp binds) (fun env2 -> v_Vuna_dEval_devalExpr
  decls env2 body)
and v_Vuna_dEval_devalBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, sp, []) -> C_Vuna_dBase_dOk (env)
  | (decls, env, sp, (C_Vuna_dBase_dPair (pat, valueExpr)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env valueExpr) (fun v -> (match v_Vuna_dEval_dmatchPattern pat v with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt (v_Vuna_dAst_dpatSpan pat) "let pattern match failure"
  | C_Vuna_dBase_dJust (bs) -> v_Vuna_dEval_devalBindings decls (v_Vuna_dBase_dappend bs env) sp rest
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 144 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 141 1 ("no matching clause for Vuna.Eval.evalBindings")
and v_Vuna_dEval_devalCase = fun decls env sp scrut alts -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env scrut) (fun v -> v_Vuna_dEval_dchooseAlt decls env sp v alts)
and v_Vuna_dEval_dchooseAlt = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, sp, v, []) -> v_Vuna_dEval_derrAt sp "case pattern match failure"
  | (decls, env, sp, v, (C_Vuna_dBase_dPair (pat, body)) :: (rest)) -> (match v_Vuna_dEval_dmatchPattern
  pat v with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_dchooseAlt decls env sp v rest
  | C_Vuna_dBase_dJust (bs) -> v_Vuna_dEval_devalExpr decls (v_Vuna_dBase_dappend bs env) body
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 153 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 151 1 ("no matching clause for Vuna.Eval.chooseAlt")
and v_Vuna_dEval_devalIf = fun decls env sp c t e -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls
  env c) (fun cv -> (match cv with
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dEval_devalExpr decls env t
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dEval_devalExpr decls env e
  | _ -> v_Vuna_dEval_derrAt sp "if condition is not a Bool"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 159 5 ("case pattern match failure")))
and v_Vuna_dEval_dapplyValue = fun decls sp v arg -> (match v with
  | C_Vuna_dEval_dVFun (name, bound) -> v_Vuna_dEval_dapplyFun decls name bound arg sp
  | C_Vuna_dEval_dVLam (params, body, env) -> v_Vuna_dEval_dapplyLambda decls params body env arg
  | C_Vuna_dEval_dVCon (name, args) -> v_Vuna_dEval_dapplyCtor decls name args arg sp
  | C_Vuna_dEval_dVBuiltin (name, args) -> v_Vuna_dEval_dapplyBuiltin decls name args arg sp
  | _ -> v_Vuna_dEval_derrAt sp "cannot apply a non-function"
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 165 3 ("case pattern match failure"))
and v_Vuna_dEval_dapplyFun = fun decls name bound arg sp -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_derrAt sp ((("unknown function: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (let bound2 = v_Vuna_dBase_dappend bound ((arg) :: ([])) in
    if v_vuna_ult_uint (v_Vuna_dBase_dlength bound2) arity then C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun
      (name, bound2))
    else if v_vuna_ueq_uint (v_Vuna_dBase_dlength bound2) arity then v_Vuna_dEval_dcallFunction decls
    name bound2 sp
    else v_Vuna_dEval_derrAt sp ((("too many arguments for ") ^ (name))))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 173 3 ("case pattern match failure"))
and v_Vuna_dEval_dapplyLambda = fun decls params body env arg -> (match params with
  | [] -> v_Vuna_dEval_derrAt v_Vuna_dEval_dnoLocSpan "lambda has no parameters"
  | (p) :: ([]) -> v_Vuna_dEval_devalExpr decls ((C_Vuna_dBase_dPair (p, arg)) :: (env)) body
  | (p) :: (rest) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (rest, body, (C_Vuna_dBase_dPair (p, arg)) ::
      (env)))
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 182 3 ("case pattern match failure"))
and v_Vuna_dEval_dcallFunction = fun decls name args sp -> v_Vuna_dEval_dtryClauses decls name (v_Vuna_dAst_dclausesFor
  decls name) args sp
and v_Vuna_dEval_dtryClauses = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, name, [], args, sp) -> v_Vuna_dEval_derrAt sp ((("no matching clause for ") ^ (name)))
  | (decls, name, (C_Vuna_dBase_dPair (pats, body)) :: (rest), args, sp) -> if v_vuna_ueq_uint (v_Vuna_dBase_dlength
  pats) (v_Vuna_dBase_dlength args) then v_Vuna_dEval_dtryMatch decls name pats body rest args sp
else v_Vuna_dEval_dtryClauses decls name rest args sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 205 1 ("no matching clause for Vuna.Eval.tryClauses")
and v_Vuna_dEval_dtryMatch = fun decls name pats body rest args sp -> (match v_Vuna_dEval_dmatchPatterns
  pats args with
  | C_Vuna_dBase_dJust (binds) -> v_Vuna_dEval_devalExpr decls binds body
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_dtryClauses decls name rest args sp
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 211 3 ("case pattern match failure"))

let v_Vuna_dEval_dinterpretMain = fun decls -> (match v_Vuna_dAst_dfunArity "main" decls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")
  | C_Vuna_dBase_dJust (arity) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dEval_dcallFunction decls "main"
  [] v_Vuna_dEval_dnoLocSpan
  else C_Vuna_dBase_dErr ("`main` must be a nullary definition")
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 521 3 ("case pattern match failure"))

let v_Vuna_dEval_drunDecls = fun decls -> (match v_Vuna_dEval_dinterpretMain decls with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (v) -> v_Vuna_dEval_dshowValue v
  | _ -> vuna_fail "lib/Vuna/Eval.vuna" 528 3 ("case pattern match failure"))

let v_Vuna_dInterp_dinterpret = fun source -> (match v_Vuna_dParser_dparseSource "<input>" source with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (C_Vuna_dAst_dSource (hdr, imports, decls)) -> (match hdr with
  | C_Vuna_dBase_dJust (_) -> "error: module header is not allowed in entry file"
  | C_Vuna_dBase_dNothing -> (match imports with
  | [] -> v_Vuna_dEval_drunDecls decls
  | _ -> "error: imports are only supported by interpretFile"
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 21 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 18 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 15 3 ("case pattern match failure"))

let v_vuna_uge_ugeneric = fun a b -> bi_ge_generic a b

let v_Lint_dblockBodyOk = fun lines toks lastLine start stop indent -> if v_vuna_uge_ugeneric start stop
then false
else if (if (v_Lint_dbodyIndentOk lines start stop indent) then (v_Lint_dnoSiblingAlt lines toks start
    stop indent)
  else false) then true
else false

let v_Lint_dblockShape = fun lines toks lastLine caseLine indent var enclosing patToks patText arrow ->
(let altLine = bi_add caseLine 1 in
  let scanned = v_Lint_dscanBody lines toks lastLine (bi_add altLine 1) indent [] in
  (match scanned with
  | C_Lint_dCaseBody (stop, rawLines) -> if v_vuna_ule_uint stop (bi_add altLine 1) then []
    else if v_Lint_dnotBool ((if (v_vuna_ugt_uint stop lastLine) then true
        else (v_vuna_ult_uint (v_Lint_dindentOf (v_Lint_dlineAt lines stop)) indent))) then []
    else if v_Lint_dnotBool (v_Lint_dblockBodyOk lines toks lastLine (bi_add altLine 1) stop indent) then
    []
    else if v_Lint_dnotBool (v_Lint_dlinesClean lines (v_Lint_denclosingLine enclosing) (bi_sub stop 1))
    then []
    else (let newBody = v_Vuna_dBase_dmap (fun line -> v_Lint_ddropIndent 4 line) rawLines in
      v_Lint_dredundantFinding lines toks lastLine caseLine indent var enclosing patToks patText (v_Lint_dbodyMentionsVar
        toks var (bi_add altLine 1) stop) stop newBody)
  | _ -> vuna_fail "app/Lint.vuna" 599 6 ("case pattern match failure")))

let v_Lint_dcheckRedundantBody = fun lines toks lastLine caseLine indent var enclosing -> (let headLine
  = v_Lint_denclosingLine enclosing in
  let headToks = v_Lint_denclosingToks enclosing in
  let kind = v_Lint_denclosingKind enclosing in
  let altLine = bi_add caseLine 1 in
  if v_vuna_ugt_uint altLine lastLine then []
  else (let altText = v_Lint_dlineAt lines altLine in
    if v_Lint_disBlankLine altText then []
    else if v_vuna_uneq_uint (v_Lint_dindentOf altText) (bi_add indent 2) then []
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
  | _ -> vuna_fail "app/Lint.vuna" 567 16 ("case pattern match failure")))))

let v_Lint_dredundantCaseAt = fun lines toks lastLine n -> (let line = v_Lint_dlineAt lines n in
  (let indent = v_Lint_dindentOf line in
    (let ts = v_Lint_dtokensOnLine toks n in
      (match v_Lint_dcaseVarOf ts with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (var) -> (match v_Lint_denclosingOf lines toks n indent with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (enclosing) -> v_Lint_dcheckRedundantBody lines toks lastLine n indent var enclosing
  | _ -> vuna_fail "app/Lint.vuna" 670 10 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 667 6 ("case pattern match failure")))))

let rec v_Lint_dscanRedundant = fun lines toks n lastLine -> if v_vuna_ugt_uint n lastLine then []
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
  | _ -> vuna_fail "app/Lint.vuna" 741 7 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 738 3 ("case pattern match failure"))

let rec v_Lint_dfixLoop = fun source findings passes total -> if v_vuna_ule_uint passes 0 then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair (total, source))
else (match v_Lint_dapplyFixes source findings with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (count, newSource)) -> if v_vuna_ueq_uint count 0 then C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (total, source))
  else (match v_Lint_dlintSource newSource with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (remaining) -> v_Lint_dfixLoop newSource remaining (bi_sub passes 1) (bi_add total
      count)
  | _ -> vuna_fail "app/Lint.vuna" 774 11 ("case pattern match failure"))
  | _ -> vuna_fail "app/Lint.vuna" 769 5 ("case pattern match failure"))

let v_Lint_dfixReport = fun path source findings -> (match v_Lint_dfixLoop source findings 8 0 with
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in
        (let vuna_cat1' = (": error: ") in
          (let vuna_cat2' = (e) in
            (let vuna_cat3' = ("\n") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in
    2)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (count, newSource)) -> if v_vuna_ueq_uint count 0 then v_Lint_dreportFindings
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
  | _ -> vuna_fail "app/Lint.vuna" 785 12 ("case pattern match failure")))
  | _ -> vuna_fail "app/Lint.vuna" 779 3 ("case pattern match failure"))

let v_Lint_dlintExisting = fun doFix path source -> (match v_Lint_dlintSource source with
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = (path) in
        (let vuna_cat1' = (": error: ") in
          (let vuna_cat2' = (e) in
            (let vuna_cat3' = ("\n") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) in
    2)
  | C_Vuna_dBase_dOk (findings) -> if doFix then v_Lint_dfixReport path source findings
  else v_Lint_dreportFindings path false findings
  | _ -> vuna_fail "app/Lint.vuna" 792 3 ("case pattern match failure"))

let v_Lint_dlintOne = fun doFix path -> if bi_file_exists path then v_Lint_dlintExisting doFix path (bi_read_file
  path)
else (let _ = bi_print (((path) ^ (": error: file not found\n"))) in
  2)

let rec v_Lint_dlintFiles = fun a0 a1 -> match (a0, a1) with
  | (doFix, []) -> 0
  | (doFix, (path) :: (rest)) -> (let code = v_Lint_dlintOne doFix path in
  (let restCode = v_Lint_dlintFiles doFix rest in
    if v_vuna_ugt_uint code restCode then code
    else restCode))
  | _ -> vuna_fail "app/Lint.vuna" 800 1 ("no matching clause for Lint.lintFiles")

let rec v_Lint_dlintArgs = fun doFix files args -> (match args with
  | [] -> if v_Lint_disNilList files then v_Lint_dlintUsageError ()
  else v_Lint_dlintFiles doFix (v_Vuna_dBase_dreverse files)
  | (arg) :: (rest) -> if v_vuna_ueq_ustr arg "--fix" then v_Lint_dlintArgs true files rest
  else if v_Vuna_dBase_dstartsWith "-" arg then v_Lint_dlintUsageError ()
  else v_Lint_dlintArgs doFix ((arg) :: (files)) rest
  | _ -> vuna_fail "app/Lint.vuna" 808 3 ("case pattern match failure"))

let v_Lint_drunLint = fun args -> v_Lint_dlintArgs false [] args

let v_vuna_ushow_uLint_uLitBranch = fun x -> (match x with
  | C_Lint_dLitBranch (v0, v1) -> (let vuna_cat0' = ("(LitBranch ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_ustring v1) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 40 30 ("case pattern match failure"))

let v_vuna_ueq_uLint_uLitBranch = fun x y -> (match x with
  | C_Lint_dLitBranch (v0, v1) -> (match y with
  | C_Lint_dLitBranch (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 45 27 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 44 30 ("case pattern match failure"))

let v_vuna_uneq_uLint_uLitBranch = fun x y -> if v_vuna_ueq_uLint_uLitBranch x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uLint_uIfHead = fun x -> (match x with
  | C_Lint_dIfHead (v0, v1, v2) -> (let vuna_cat0' = ("(IfHead ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_ustring v1) in
          (let vuna_cat4' = (" ") in
            (let vuna_cat5' = (v_vuna_ushow_ustring v2) in
              (let vuna_cat6' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                vuna_cat6'])))))))
  | _ -> vuna_fail "<generated>" 53 27 ("case pattern match failure"))

let v_vuna_ueq_uLint_uIfHead = fun x y -> (match x with
  | C_Lint_dIfHead (v0, v1, v2) -> (match y with
  | C_Lint_dIfHead (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1)
          else false)) then (v_vuna_ueq_ustr v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 58 27 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 57 27 ("case pattern match failure"))

let v_vuna_uneq_uLint_uIfHead = fun x y -> if v_vuna_ueq_uLint_uIfHead x y then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uTypecheck_uDictParam = fun x -> (match x with
  | C_Vuna_dTypecheck_dDictParam (v0, v1, v2, v3) -> (let vuna_cat0' = ("(DictParam ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_uint v1) in
          (let vuna_cat4' = (" ") in
            (let vuna_cat5' = (v_vuna_ushow_ustring v2) in
              (let vuna_cat6' = (" ") in
                (let vuna_cat7' = (v_vuna_ushow_ustring v3) in
                  (let vuna_cat8' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                    vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "<generated>" 183 40 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uTypecheck_uDictParam = fun x y -> (match x with
  | C_Vuna_dTypecheck_dDictParam (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dDictParam (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uint
                v1 w1)
              else false)) then (v_vuna_ueq_ustr v2 w2)
          else false)) then (v_vuna_ueq_ustr v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 188 43 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 187 40 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uDictParam = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uDictParam x y
then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uCodegen_uBuiltinInfo = fun x -> (match x with
  | C_Vuna_dCodegen_dBuiltinInfo (v0, v1, v2, v3) -> (let vuna_cat0' = ("(BuiltinInfo ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_ustring v1) in
          (let vuna_cat4' = (" ") in
            (let vuna_cat5' = (v_vuna_ushow_uint v2) in
              (let vuna_cat6' = (" ") in
                (let vuna_cat7' = (v_vuna_ushow_ustring v3) in
                  (let vuna_cat8' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                    vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "<generated>" 250 40 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCodegen_uBuiltinInfo = fun x y -> (match x with
  | C_Vuna_dCodegen_dBuiltinInfo (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCodegen_dBuiltinInfo (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr
                v1 w1)
              else false)) then (v_vuna_ueq_uint v2 w2)
          else false)) then (v_vuna_ueq_ustr v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 255 43 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 254 40 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCodegen_uBuiltinInfo = fun x y -> if v_vuna_ueq_uVuna_uCodegen_uBuiltinInfo x y
then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLoader_uExportEntry = fun x -> (match x with
  | C_Vuna_dLoader_dExportEntry (v0, v1, v2, v3) -> (let vuna_cat0' = ("(ExportEntry ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_ustring v1) in
          (let vuna_cat4' = (" ") in
            (let vuna_cat5' = (v_vuna_ushow_ustring v2) in
              (let vuna_cat6' = (" ") in
                (let vuna_cat7' = (v_vuna_ushow_ustring v3) in
                  (let vuna_cat8' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                    vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "<generated>" 296 39 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLoader_uExportEntry = fun x y -> (match x with
  | C_Vuna_dLoader_dExportEntry (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dLoader_dExportEntry (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr
                v1 w1)
              else false)) then (v_vuna_ueq_ustr v2 w2)
          else false)) then (v_vuna_ueq_ustr v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 301 42 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 300 39 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLoader_uExportEntry = fun x y -> if v_vuna_ueq_uVuna_uLoader_uExportEntry x y then
v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLoader_uExportRef = fun x -> (match x with
  | C_Vuna_dLoader_dExportRef (v0, v1, v2) -> (let vuna_cat0' = ("(ExportRef ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_ustring v1) in
          (let vuna_cat4' = (" ") in
            (let vuna_cat5' = (v_vuna_ushow_ustring v2) in
              (let vuna_cat6' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5';
                vuna_cat6'])))))))
  | _ -> vuna_fail "<generated>" 309 37 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLoader_uExportRef = fun x y -> (match x with
  | C_Vuna_dLoader_dExportRef (v0, v1, v2) -> (match y with
  | C_Vuna_dLoader_dExportRef (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1
            w1)
          else false)) then (v_vuna_ueq_ustr v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 314 37 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 313 37 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLoader_uExportRef = fun x y -> if v_vuna_ueq_uVuna_uLoader_uExportRef x y then
v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLexer_uTok = fun x -> (match x with
  | C_Vuna_dLexer_dTIdent (v0) -> (let vuna_cat0' = ("(TIdent ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (")") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTKw (v0) -> (let vuna_cat0' = ("(TKw ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (")") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTInt (v0) -> (let vuna_cat0' = ("(TInt ") in
    (let vuna_cat1' = (v_vuna_ushow_uint v0) in
      (let vuna_cat2' = (")") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTStr (v0) -> (let vuna_cat0' = ("(TStr ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (")") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTSym (v0) -> (let vuna_cat0' = ("(TSym ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (")") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTEof -> "TEof"
  | _ -> vuna_fail "<generated>" 331 30 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLexer_uTok = fun x y -> (match x with
  | C_Vuna_dLexer_dTIdent (v0) -> (match y with
  | C_Vuna_dLexer_dTIdent (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 341 27 ("case pattern match failure"))
  | C_Vuna_dLexer_dTKw (v0) -> (match y with
  | C_Vuna_dLexer_dTKw (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 344 24 ("case pattern match failure"))
  | C_Vuna_dLexer_dTInt (v0) -> (match y with
  | C_Vuna_dLexer_dTInt (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 347 25 ("case pattern match failure"))
  | C_Vuna_dLexer_dTStr (v0) -> (match y with
  | C_Vuna_dLexer_dTStr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 350 25 ("case pattern match failure"))
  | C_Vuna_dLexer_dTSym (v0) -> (match y with
  | C_Vuna_dLexer_dTSym (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 353 25 ("case pattern match failure"))
  | C_Vuna_dLexer_dTEof -> (match y with
  | C_Vuna_dLexer_dTEof -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 356 22 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 340 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uTok = fun x y -> if v_vuna_ueq_uVuna_uLexer_uTok x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uBase_uResult = fun x y -> (match x with
  | C_Vuna_dBase_dOk (v0) -> (match y with
  | C_Vuna_dBase_dOk (w0) -> v_vuna_ueq_ugeneric v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 543 22 ("case pattern match failure"))
  | C_Vuna_dBase_dErr (v0) -> (match y with
  | C_Vuna_dBase_dErr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 546 23 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 542 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uBase_uResult = fun x y -> if v_vuna_ueq_uVuna_uBase_uResult x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uBase_uMaybe = fun x y -> (match x with
  | C_Vuna_dBase_dNothing -> (match y with
  | C_Vuna_dBase_dNothing -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 555 24 ("case pattern match failure"))
  | C_Vuna_dBase_dJust (v0) -> (match y with
  | C_Vuna_dBase_dJust (w0) -> v_vuna_ueq_ugeneric v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 558 24 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 554 31 ("case pattern match failure"))

let v_vuna_ueq_uLint_uFinding = fun x y -> (match x with
  | C_Lint_dFinding (v0, v1, v2, v3, v4) -> (match y with
  | C_Lint_dFinding (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uint
                    v1 w1)
                  else false)) then (v_vuna_ueq_ustr v2 w2)
              else false)) then (v_vuna_ueq_ustr v3 w3)
          else false)) then (v_vuna_ueq_uVuna_uBase_uMaybe v4 w4)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 32 34 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 31 28 ("case pattern match failure"))

let v_vuna_uneq_uLint_uFinding = fun x y -> if v_vuna_ueq_uLint_uFinding x y then v_vuna_ueq_uint 0 1

else v_vuna_ueq_uint 0 0

let v_vuna_uneq_uVuna_uBase_uMaybe = fun x y -> if v_vuna_ueq_uVuna_uBase_uMaybe x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let rec v_vuna_ueq_uVuna_uBase_uList = fun x y -> (match x with
  | [] -> (match y with
  | [] -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 567 10 ("case pattern match failure"))
  | (v0) :: (v1) -> (match y with
  | (w0) :: (w1) -> (if (v_vuna_ueq_ugeneric v0 w0) then (v_vuna_ueq_uVuna_uBase_uList v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 570 17 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 566 30 ("case pattern match failure"))

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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1158 17 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1154 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1152 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1149 1 ("no matching clause for Vuna.Typecheck.inferArgs")
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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1178 17 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1175 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1172 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1169 1 ("no matching clause for Vuna.Typecheck.inferBinds")
and v_Vuna_dTypecheck_dinferRecLet = fun globals locals binds body sp st -> (match v_Vuna_dTypecheck_dseedRecNames
  binds st with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (recPairs, st1)) -> (let locals2 = v_Vuna_dTypecheck_drecExtendLocals
    locals recPairs in
    (match v_Vuna_dTypecheck_dcheckRecValues globals locals2 recPairs st1 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (recElabs, st2)) -> (match v_Vuna_dTypecheck_dinferExpr globals
        locals2 st2 body with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st3)) -> C_Vuna_dBase_dOk
        (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, C_Vuna_dTypecheck_dXELet (recElabs, bodyElab,
                true, sp)), st3))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1191 14 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1188 10 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1184 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dcheckRecValues = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, locals, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (globals, locals, (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (_, ty), C_Vuna_dBase_dPair (pat, value)))
  :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals st value) (fun
  pv -> (match pv with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (valueTy, valueElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
      ty valueTy st1) (fun st2 -> (match v_Vuna_dTypecheck_dcheckRecValues globals locals rest st2 with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (tail, st3)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair
              (pat, valueElab)) :: (tail), st3))
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1217 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1214 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1211 1 ("no matching clause for Vuna.Typecheck.checkRecValues")
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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1233 21 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1229 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1227 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1224 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1221 1 ("no matching clause for Vuna.Typecheck.inferAlts")
and v_Vuna_dTypecheck_dinferExpr = fun globals locals st expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> (match v_Vuna_dTypecheck_dlookupLocal name locals with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEVar
          (name, sp)), st))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_dlookupScheme name globals with
  | C_Vuna_dBase_dJust (sch) -> (match v_Vuna_dTypecheck_dinstantiateFull st sch with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, cons), st2) -> if v_vuna_ueq_uVuna_uBase_uList cons []
        then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEVar (name,
                sp)), st2))
        else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEFun (name,
                cons, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1255 15 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_dmethodRefForName name (v_Vuna_dTypecheck_dtraitMethodsOf
          st) with
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dTraitMethodRef (key, tr, sch, pid)) -> (match v_Vuna_dTypecheck_dinstantiateForParam
          st sch pid with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, paramTy), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEMethod (tr, key, paramTy, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1262 19 ("case pattern match failure"))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("unbound variable: ") in
            (let vuna_cat1' = (name) in
              (let vuna_cat2' = (v_Vuna_dBase_dsuggest name (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
                    globals)) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1260 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1253 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1250 7 ("case pattern match failure"))
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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1273 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1270 9 ("case pattern match failure")))
  | C_Vuna_dAst_dELam (params, body, sp) -> (match v_Vuna_dTypecheck_dseedLocals params locals st with
  | C_Vuna_dBase_dPair (paramTys, C_Vuna_dBase_dPair (locals2, st1)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
      globals locals2 st1 body) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfoldFun paramTys bodyTy, C_Vuna_dTypecheck_dXELam (params,
                bodyElab, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1280 13 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1277 7 ("case pattern match failure"))
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> if rec_u then v_Vuna_dTypecheck_dinferRecLet globals
  locals binds body sp st
  else v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferBinds globals locals binds st) (fun pb -> (match
      pb with
  | C_Vuna_dBase_dPair (bindEls, C_Vuna_dBase_dPair (locals2, st1)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
        globals locals2 st1 body) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (bodyTy, C_Vuna_dTypecheck_dXELet (bindEls, bodyElab, false, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1290 17 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1287 11 ("case pattern match failure")))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals
    locals st scrut) (fun ps -> (match ps with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (scrutTy, scrutElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferAlts
        globals locals scrutTy alts st1) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (altsElab, C_Vuna_dBase_dPair (bodyTy, st2)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (bodyTy, C_Vuna_dTypecheck_dXECase (scrutElab, scrutTy, altsElab, sp)),
              st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1298 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1295 9 ("case pattern match failure")))
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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1310 23 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1307 17 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1303 9 ("case pattern match failure")))
  | C_Vuna_dAst_dEField (base, fname, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals
    locals st base) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (baseTy, baseElab), st1) -> (match v_Vuna_dTypecheck_dfreshTy
        st1 with
  | C_Vuna_dBase_dPair (resTy, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (resTy,
              C_Vuna_dTypecheck_dXEField (baseElab, fname, baseTy, sp)), v_Vuna_dTypecheck_daddRecConstraint
            (C_Vuna_dTypecheck_dFieldCon (baseTy, fname, resTy, sp)) st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1318 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1316 9 ("case pattern match failure")))
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
    globals locals st base) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (baseTy, baseElab), st1) -> if v_Vuna_dTypecheck_dhasDuplicateFieldNames
      fields then C_Vuna_dBase_dErr (v_Vuna_dTypecheck_dduplicateFieldMsg sp)
      else v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferUpdateValues globals locals baseTy sp fields
        st1) (fun p -> (match p with
  | C_Vuna_dBase_dPair (vals, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (baseTy,
                C_Vuna_dTypecheck_dXERecUpdate (baseElab, baseTy, vals, sp)), st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1329 17 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1324 9 ("case pattern match failure")))
  | C_Vuna_dAst_dERecord (rname, fields, sp) -> C_Vuna_dBase_dErr (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": internal: record expression should be desugared before inference")))
  | C_Vuna_dAst_dEInstSel (inner, iname, sp) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals
    locals st inner) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, elab), st1) -> (match elab with
  | C_Vuna_dTypecheck_dXEMethod (tr, key, paramTy, msp) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair
            (ty, C_Vuna_dTypecheck_dXEMethodInst (tr, key, iname, paramTy, sp)), st1))
  | _ -> C_Vuna_dBase_dErr (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": @instance \229\143\170\232\131\189\231\148\168\228\186\142 trait \230\150\185\230\179\149")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1337 13 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1335 9 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1248 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_dinferUpdateValues = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (globals, locals, baseTy, sp, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (globals, locals, baseTy, sp, (C_Vuna_dBase_dPair (fname, e)) :: (rest), st) -> v_Vuna_dBase_dandThen
(v_Vuna_dTypecheck_dinferExpr globals locals st e) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (vty, velab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferUpdateValues
      globals locals baseTy sp rest st1) (fun r -> (match r with
  | C_Vuna_dBase_dPair (vs, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (fname,
                velab)) :: (vs), v_Vuna_dTypecheck_daddRecConstraint (C_Vuna_dTypecheck_dUpdateCon (baseTy,
                fname, vty, sp)) st2))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1349 11 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1346 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1342 1 ("no matching clause for Vuna.Typecheck.inferUpdateValues")

let v_Vuna_dTypecheck_dinferClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, st, C_Vuna_dBase_dPair (pats, body)) -> (match v_Vuna_dTypecheck_dseedPatTypes pats st with
  | C_Vuna_dBase_dPair (paramTys, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferPatterns globals
    [] pats paramTys st1) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals2
        st2 body) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st3) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfoldFun paramTys bodyTy, C_Vuna_dBase_dPair (pats,
                  bodyElab)), st3))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1424 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1421 9 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1418 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1417 1 ("no matching clause for Vuna.Typecheck.inferClause")

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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1437 15 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1433 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1431 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1428 1 ("no matching clause for Vuna.Typecheck.inferClauses")

let v_Vuna_dTypecheck_dcheckFunctionOnce = fun globals decls sigs name st -> (match v_Vuna_dTypecheck_dlookupScheme
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
  | C_Vuna_dBase_dOk (st3) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dsolveRecConstraints (v_Vuna_dTypecheck_dtypeNamesOfTC
            st3) (v_Vuna_dTypecheck_drecordsOf st3) (v_Vuna_dTypecheck_dconstraintsOfTC st3) st3) (fun
          st4 -> (let resolved = v_Vuna_dTypecheck_dresolveTy (v_Vuna_dTypecheck_dsubstOf st4) inferred
            in
            (let genVars = v_Vuna_dTypecheck_ddiffInts (v_Vuna_dTypecheck_dfreeVarsTy resolved) (v_Vuna_dTypecheck_dfreeVarsEnvExcept
                name globals) in
              (let needs = v_Vuna_dTypecheck_dcollectNeedsClauses (v_Vuna_dTypecheck_dsubstOf st4) (v_Vuna_dTypecheck_dtraitCtxOf
                  st4) clauseEls in
                C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (clauseEls, C_Vuna_dBase_dPair (inferred, C_Vuna_dBase_dPair
                      (needs, C_Vuna_dBase_dPair (genVars, st4)))))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1507 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1504 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1502 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1499 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dshapeSupported = fun a0 a1 -> match (a0, a1) with
  | (supported, C_Vuna_dTypecheck_dDataShape (n, params, ctors)) -> if v_vuna_ueq_uVuna_uBase_uList params
[] then v_Vuna_dTypecheck_dctorsSupported supported ctors
else false
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1899 1 ("no matching clause for Vuna.Typecheck.shapeSupported")

let rec v_Vuna_dTypecheck_daddSupportedShapes = fun a0 a1 -> match (a0, a1) with
  | ([], supported) -> C_Vuna_dBase_dPair (supported, 0)
  | ((sh) :: (shapes), supported) -> (match v_Vuna_dTypecheck_daddSupportedShapes shapes supported with
  | C_Vuna_dBase_dPair (supported2, cnt) -> if v_Vuna_dBase_dmemName (v_Vuna_dTypecheck_dshapeName sh)
  supported2 then C_Vuna_dBase_dPair (supported2, cnt)
  else if v_Vuna_dTypecheck_dshapeSupported ((v_Vuna_dTypecheck_dshapeName sh) :: (supported2)) sh then
  C_Vuna_dBase_dPair (v_Vuna_dBase_dappend supported2 ((v_Vuna_dTypecheck_dshapeName sh) :: ([])), bi_add
    cnt 1)
  else C_Vuna_dBase_dPair (supported2, cnt)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1910 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1907 1 ("no matching clause for Vuna.Typecheck.addSupportedShapes")

let rec v_Vuna_dTypecheck_dsupportedShapesLoop = fun shapes supported -> (match v_Vuna_dTypecheck_daddSupportedShapes
  shapes supported with
  | C_Vuna_dBase_dPair (supported2, cnt) -> if v_vuna_ueq_uint cnt 0 then supported2
  else v_Vuna_dTypecheck_dsupportedShapesLoop shapes supported2
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1917 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dsupportedShapes = fun shapes -> v_Vuna_dTypecheck_dsupportedShapesLoop shapes []

let v_Vuna_dTypecheck_dpatternLocals = fun globals locals pat value -> (match v_Vuna_dTypecheck_dinferExpr
  globals locals (C_Vuna_dTypecheck_dTC (0, [], [], [], [], [], C_Vuna_dTypecheck_dTraitCtx ([], [], [],
        [], []))) value with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, _), _)) -> v_Vuna_dTypecheck_dpatVarsTy
  pat ty
  | C_Vuna_dBase_dErr (_) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2413 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dletLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, locals, []) -> []
  | (globals, locals, (C_Vuna_dBase_dPair (pat, value)) :: (rest)) -> (let patTys = v_Vuna_dTypecheck_dpatternLocals
  globals locals pat value in
  v_Vuna_dBase_dappend patTys (v_Vuna_dTypecheck_dletLocals globals locals rest))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2407 1 ("no matching clause for Vuna.Typecheck.letLocals")

let v_Vuna_dTypecheck_dcaseWarnings = fun globals decls locals scrut alts sp -> (match v_Vuna_dTypecheck_dinferExpr
  globals locals (C_Vuna_dTypecheck_dTC (0, [], [], [], [], [], C_Vuna_dTypecheck_dTraitCtx ([], [], [],
        [], []))) scrut with
  | C_Vuna_dBase_dErr (_) -> []
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, _), _)) -> (let ctors = v_Vuna_dTypecheck_dtyCtorNames
    decls ty in
    if v_vuna_ueq_ugeneric ctors [] then []
    else (let pats = v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf alts in
      (let exhaustive = (if (v_Vuna_dTypecheck_dhasCatchAll pats) then true
          else (v_Vuna_dTypecheck_dallCtorsCovered pats ctors)) in
        (let nonEx = if exhaustive then []
          else (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": non-exhaustive case"))) :: ([]) in
          v_Vuna_dBase_dappend nonEx (v_Vuna_dTypecheck_dredundantWarnings pats)))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2431 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dexprWarnings = fun globals decls locals e -> (match e with
  | C_Vuna_dAst_dEVar (n, sp) -> []
  | C_Vuna_dAst_dEInt (n, sp) -> []
  | C_Vuna_dAst_dEStr (s, sp) -> []
  | C_Vuna_dAst_dELam (ps, body, sp) -> (match v_Vuna_dTypecheck_dinferExpr globals locals (C_Vuna_dTypecheck_dTC
      (0, [], [], [], [], [], C_Vuna_dTypecheck_dTraitCtx ([], [], [], [], []))) e with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, _), _)) -> (let pty = v_Vuna_dTypecheck_dflattenFun
      ty in
      v_Vuna_dTypecheck_dexprWarnings globals decls (v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dzipLocals
          ps pty) locals) body)
  | C_Vuna_dBase_dErr (_) -> v_Vuna_dTypecheck_dexprWarnings globals decls locals body
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2390 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dexprWarnings globals
    decls locals) ((fn) :: (args))
  | C_Vuna_dAst_dELet (binds, body, _, sp) -> (let locals2 = v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dletLocals
      globals locals binds) locals in
    v_Vuna_dBase_dappend (v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dbindWarnings globals decls) binds)
    (v_Vuna_dTypecheck_dexprWarnings globals decls locals2 body))
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dcaseWarnings globals
    decls locals scrut alts sp) (v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dexprWarnings globals decls locals
      scrut) (v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_daltWarnings globals decls locals) alts))
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dexprWarnings globals
    decls locals) ((c) :: ((t) :: ((e) :: ([]))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2385 3 ("case pattern match failure"))
and v_Vuna_dTypecheck_daltWarnings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, decls, locals, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dTypecheck_dexprWarnings globals
decls locals body
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2404 1 ("no matching clause for Vuna.Typecheck.altWarnings")

let v_Vuna_dTypecheck_dclauseBodyWarnings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, decls, paramTys, C_Vuna_dBase_dPair (pats, body)) -> (let locals = v_Vuna_dTypecheck_dzipLocals
  (v_Vuna_dTypecheck_dpatsVarNames pats) paramTys in
  v_Vuna_dTypecheck_dexprWarnings globals decls locals body)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2380 1 ("no matching clause for Vuna.Typecheck.clauseBodyWarnings")

let v_vuna_ueq_uLint_uEdit = fun x y -> (match x with
  | C_Lint_dEdit (v0, v1, v2) -> (match y with
  | C_Lint_dEdit (w0, w1, w2) -> (if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uint v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 23 25 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 22 25 ("case pattern match failure"))

let v_vuna_uneq_uLint_uEdit = fun x y -> if v_vuna_ueq_uLint_uEdit x y then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uLint_uEnclosing = fun x y -> (match x with
  | C_Lint_dEnclosing (v0, v1, v2) -> (match y with
  | C_Lint_dEnclosing (w0, w1, w2) -> (if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_ustr v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 67 30 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 66 30 ("case pattern match failure"))

let v_vuna_uneq_uLint_uEnclosing = fun x y -> if v_vuna_ueq_uLint_uEnclosing x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uLint_uCaseBody = fun x y -> (match x with
  | C_Lint_dCaseBody (v0, v1) -> (match y with
  | C_Lint_dCaseBody (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uBase_uList v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 76 26 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 75 29 ("case pattern match failure"))

let v_vuna_uneq_uLint_uCaseBody = fun x y -> if v_vuna_ueq_uLint_uCaseBody x y then v_vuna_ueq_uint 0
1
else v_vuna_ueq_uint 0 0

let rec v_vuna_ueq_uVuna_uTypecheck_uTy = fun x y -> (match x with
  | C_Vuna_dTypecheck_dTVar (v0) -> (match y with
  | C_Vuna_dTypecheck_dTVar (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 85 29 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTCon (v0, v1) -> (match y with
  | C_Vuna_dTypecheck_dTCon (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 88 32 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dTFun (v0, v1) -> (match y with
  | C_Vuna_dTypecheck_dTFun (w0, w1) -> (if (v_vuna_ueq_uVuna_uTypecheck_uTy v0 w0) then (v_vuna_ueq_uVuna_uTypecheck_uTy
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 91 32 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 84 33 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uTy = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uTy x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uTypecheck_uScheme = fun x y -> (match x with
  | C_Vuna_dTypecheck_dScheme (v0, v1, v2) -> (match y with
  | C_Vuna_dTypecheck_dScheme (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uBase_uList v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTy v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 100 37 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 99 37 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uScheme = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uScheme x y then
v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uTypecheck_uRecordInfo = fun x y -> (match x with
  | C_Vuna_dTypecheck_dRecordInfo (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dRecordInfo (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 109 44 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 108 41 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uRecordInfo = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uRecordInfo x
y then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uTypecheck_uTraitDecl = fun x y -> (match x with
  | C_Vuna_dTypecheck_dTraitDecl (v0, v1, v2) -> (match y with
  | C_Vuna_dTypecheck_dTraitDecl (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 206 40 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 205 40 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uTraitDecl = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uTraitDecl x y
then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uTypecheck_uTraitMethodRef = fun x y -> (match x with
  | C_Vuna_dTypecheck_dTraitMethodRef (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dTraitMethodRef (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uScheme v2 w2)
          else false)) then (v_vuna_ueq_uint v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 215 48 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 214 45 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uTraitMethodRef = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uTraitMethodRef
x y then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uTypecheck_uTraitInst = fun x y -> (match x with
  | C_Vuna_dTypecheck_dTraitInst (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dTraitInst (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uMaybe
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTy v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 224 43 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 223 40 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uTraitInst = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uTraitInst x y
then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uTypecheck_uTraitCtx = fun x y -> (match x with
  | C_Vuna_dTypecheck_dTraitCtx (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dTypecheck_dTraitCtx (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_uVuna_uBase_uList
                    v0 w0) then (v_vuna_ueq_uVuna_uBase_uList v1 w1)
                  else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v4 w4)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 233 45 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 232 39 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uTypecheck_uTC = fun x y -> (match x with
  | C_Vuna_dTypecheck_dTC (v0, v1, v2, v3, v4, v5, v6) -> (match y with
  | C_Vuna_dTypecheck_dTC (w0, w1, w2, w3, w4, w5, w6) -> (if ((if ((if ((if ((if ((if (v_vuna_ueq_uint
                        v0 w0) then (v_vuna_ueq_uVuna_uBase_uList v1 w1)
                        else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
                      else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
                  else false)) then (v_vuna_ueq_uVuna_uBase_uList v4 w4)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v5 w5)
          else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTraitCtx v6 w6)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 130 45 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 129 33 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uTC = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uTC x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_uneq_uVuna_uTypecheck_uTraitCtx = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uTraitCtx x y then
v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uTypecheck_uDataShape = fun x y -> (match x with
  | C_Vuna_dTypecheck_dDataShape (v0, v1, v2) -> (match y with
  | C_Vuna_dTypecheck_dDataShape (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 242 40 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 241 40 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uDataShape = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uDataShape x y
then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uLoader_uModule = fun x y -> (match x with
  | C_Vuna_dLoader_dModule (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dLoader_dModule (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 288 37 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 287 34 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLoader_uModule = fun x y -> if v_vuna_ueq_uVuna_uLoader_uModule x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uSourceFile = fun x y -> (match x with
  | C_Vuna_dAst_dSource (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dSource (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uBase_uMaybe v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 525 31 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 524 35 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uSourceFile = fun x y -> if v_vuna_ueq_uVuna_uAst_uSourceFile x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_uneq_uVuna_uBase_uList = fun x y -> if v_vuna_ueq_uVuna_uBase_uList x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uBase_uPair = fun x y -> (match x with
  | C_Vuna_dBase_dPair (v0, v1) -> (match y with
  | C_Vuna_dBase_dPair (w0, w1) -> (if (v_vuna_ueq_ugeneric v0 w0) then (v_vuna_ueq_ugeneric v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 579 27 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 578 30 ("case pattern match failure"))

let v_Vuna_dTypecheck_dcheckFunction = fun globals decls sigs name st -> (match v_Vuna_dTypecheck_dcheckFunctionOnce
  globals decls sigs name st with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (clauses, C_Vuna_dBase_dPair (inferred, C_Vuna_dBase_dPair (needs,
          C_Vuna_dBase_dPair (genVars, st1))))) -> (let needs1 = v_Vuna_dTypecheck_dfilterNeeds genVars
    needs in
    if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uVuna_uBase_uPair vuna_ueq_ulh vuna_ueq_ulh2)
              then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2)
              else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in
        vuna_ueq_ulist_ugo)) needs1 [] then v_Vuna_dTypecheck_dfinishFunction globals decls sigs name
    inferred [] genVars clauses st1
    else (let resolved = v_Vuna_dTypecheck_dresolveTy (v_Vuna_dTypecheck_dsubstOf st1) inferred in
      (let scheme1 = C_Vuna_dTypecheck_dScheme (genVars, needs1, resolved) in
        (let globals2 = v_Vuna_dTypecheck_dupdateScheme name scheme1 globals in
          (match v_Vuna_dTypecheck_dcheckFunctionOnce globals2 decls sigs name st1 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (clauses2, C_Vuna_dBase_dPair (inferred2, C_Vuna_dBase_dPair
                  (needs2, C_Vuna_dBase_dPair (genVars2, st2))))) -> v_Vuna_dTypecheck_dfinishFunction
            globals2 decls sigs name inferred2 (v_Vuna_dTypecheck_dfilterNeeds genVars2 needs2) genVars2
            clauses2 st2
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1549 21 ("case pattern match failure"))))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1539 3 ("case pattern match failure"))

let rec v_Vuna_dTypecheck_dcheckFunctions = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (globals, decls, sigs, [], st, elabMap) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse
    elabMap, C_Vuna_dBase_dPair (globals, st)))
  | (globals, decls, sigs, (name) :: (rest), st, elabMap) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckFunction
  globals decls sigs name st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (clauseEls, C_Vuna_dBase_dPair (globals2, st1)) -> v_Vuna_dTypecheck_dcheckFunctions
    globals2 decls sigs rest st1 ((C_Vuna_dBase_dPair (name, clauseEls)) :: (elabMap))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1557 5 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 1554 1 ("no matching clause for Vuna.Typecheck.checkFunctions")

let rec v_Vuna_dTypecheck_dcollectUserInstancesGo = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (typeNames, traitDecls, [], insts, declsOut) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse
    insts, v_Vuna_dBase_dreverse declsOut))
  | (typeNames, traitDecls, (d) :: (rest), insts, declsOut) -> (match d with
  | C_Vuna_dAst_dDInstance (iname, isDefault, headExpr, methods, sp) -> (match v_Vuna_dTypecheck_dinstanceHeadParts
    headExpr with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
        (let vuna_cat1' = (": ") in
          (let vuna_cat2' = (e) in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (traitName, headTyExpr)) -> (match v_Vuna_dTypecheck_dlookupTraitDecl
      traitName traitDecls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
          (let vuna_cat1' = (": unknown trait ") in
            (let vuna_cat2' = (traitName) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dJust (traitDecl) -> (match v_Vuna_dTypecheck_dconvertType typeNames [] (C_Vuna_dTypecheck_dTC
          (0, [], typeNames, [], [], [], C_Vuna_dTypecheck_dTraitCtx ([], [], [], [], []))) headTyExpr
        with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
            (let vuna_cat1' = (": in instance head: ") in
              (let vuna_cat2' = (e) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (headTy, vars), st)) -> if ((let rec vuna_ueq_ulist_ugo
            = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uVuna_uBase_uPair vuna_ueq_ulh vuna_ueq_ulh2)
                  then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2)
                  else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in
            vuna_ueq_ulist_ugo)) vars [] then (match iname with
  | C_Vuna_dBase_dJust (internalName) -> if isDefault then if v_Vuna_dTypecheck_dorphanAllowed (v_Vuna_dTypecheck_dmodulePrefixOf
            internalName) traitName headTy then v_Vuna_dTypecheck_dfinishInstance typeNames traitDecls
          traitDecl traitName iname isDefault headTyExpr headTy methods sp insts declsOut rest
          else C_Vuna_dBase_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in
              (let vuna_cat1' = (": orphan default instance ") in
                (let vuna_cat2' = (traitName) in
                  (let vuna_cat3' = (" ") in
                    (let vuna_cat4' = (v_Vuna_dTypecheck_dtyOuterTypeName headTy) in
                      (let vuna_cat5' = ("; name it with `as`") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'])))))))
          else v_Vuna_dTypecheck_dfinishInstance typeNames traitDecls traitDecl traitName iname isDefault
          headTyExpr headTy methods sp insts declsOut rest
  | C_Vuna_dBase_dNothing -> v_Vuna_dTypecheck_dfinishInstance typeNames traitDecls traitDecl traitName
          iname isDefault headTyExpr headTy methods sp insts declsOut rest
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2196 21 ("case pattern match failure"))
        else C_Vuna_dBase_dErr (((v_Vuna_dBase_dshowSpanLoc sp) ^ (": instance head must be a concrete type")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2192 15 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2189 11 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2186 7 ("case pattern match failure"))
  | _ -> v_Vuna_dTypecheck_dcollectUserInstancesGo typeNames traitDecls rest insts declsOut
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2184 3 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2181 1 ("no matching clause for Vuna.Typecheck.collectUserInstancesGo")
and v_Vuna_dTypecheck_dfinishInstance = fun typeNames traitDecls traitDecl traitName iname isDefault headTyExpr
headTy methods sp insts declsOut rest -> (let instKey = v_Vuna_dTypecheck_dinstKeyOf isDefault iname headTyExpr
  in
  (match v_Vuna_dTypecheck_dinstanceImpls typeNames traitDecl headTyExpr methods instKey sp with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (impls, newDecls)) -> v_Vuna_dTypecheck_dcollectUserInstancesGo
    typeNames traitDecls rest ((C_Vuna_dTypecheck_dTraitInst (traitName, v_Vuna_dTypecheck_dinstanceNameFor
          isDefault iname, headTy, impls)) :: (insts)) (v_Vuna_dBase_dappend newDecls declsOut)
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2210 6 ("case pattern match failure")))

let v_Vuna_dTypecheck_dcollectUserInstances = fun typeNames traitDecls decls -> v_Vuna_dTypecheck_dcollectUserInstancesGo
typeNames traitDecls decls [] []

let v_Vuna_dTypecheck_dprepareTraits = fun typeNames decls -> (match v_Vuna_dTypecheck_dcollectTraitDecls
  typeNames decls with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (traitDecls, methodRefs)) -> (match v_Vuna_dTypecheck_dcollectUserInstances
    typeNames traitDecls decls with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (userInsts, instanceDecls)) -> (let shapes = v_Vuna_dTypecheck_dcollectDataShapes
      decls in
      (let supported = v_Vuna_dTypecheck_dsupportedShapes shapes in
        (let eqSupported = v_Vuna_dTypecheck_deqSupportedShapes shapes in
          (match v_Vuna_dTypecheck_dcollectDerivings supported eqSupported decls with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (derivedInsts) -> (match v_Vuna_dTypecheck_dcheckInstUniqueness (v_Vuna_dBase_dappend
                userInsts derivedInsts) [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (_) -> (match v_Vuna_dTypecheck_dparseGenerated ((let vuna_cat0' = (v_Vuna_dTypecheck_dbuiltinHelperSrc)
                    in
                    (let vuna_cat1' = ("\n") in
                      (let vuna_cat2' = (v_Vuna_dTypecheck_dtcJoin "\n\n" (v_Vuna_dTypecheck_dstructuralSrcs
                        shapes supported eqSupported)) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (structDecls) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTraitCtx
                    (traitDecls, v_Vuna_dBase_dappend userInsts derivedInsts, supported, eqSupported,
                      methodRefs), v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dstripTraitDecls decls) (v_Vuna_dBase_dappend
                      instanceDecls structDecls)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2302 25 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2299 21 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2296 20 ("case pattern match failure")))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2290 7 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2287 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dcheckProgramInfoElab = fun decls0 -> (match v_Vuna_dTypecheck_dextractRecords decls0
  with
  | C_Vuna_dBase_dPair (records, decls1) -> (let typeNames = v_Vuna_dAst_dtypeNamesOf decls1 in
    (match v_Vuna_dTypecheck_dprepareTraits typeNames decls1 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (tctx, declsT)) -> (match v_Vuna_dTypecheck_ddesugarRecords records
        declsT with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (decls2) -> (let freshTC = C_Vuna_dTypecheck_dTC (0, [], typeNames, records, [],
            v_Vuna_dTypecheck_dtraitCtxRefs tctx, tctx) in
          (match v_Vuna_dTypecheck_dcollectSigs typeNames decls2 freshTC with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (sigs, st1)) -> (match v_Vuna_dTypecheck_dcollectCtors typeNames
              decls2 st1 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (ctors, st2)) -> (match v_Vuna_dTypecheck_dseedPlaceholders (v_Vuna_dTypecheck_dfunctionNames
                  decls2) sigs st2 with
  | C_Vuna_dBase_dPair (placeholders, st3) -> (let names = v_Vuna_dTypecheck_dfunctionNames decls2 in
                  (let env0 = v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dbuiltinSchemes ()) (v_Vuna_dBase_dappend
                      ctors (v_Vuna_dBase_dappend sigs placeholders)) in
                    (match v_Vuna_dTypecheck_dcheckFunctions env0 decls2 sigs names st3 [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elab1, C_Vuna_dBase_dPair (g1, stA))) -> if v_vuna_ueq_uint
                      (v_Vuna_dTypecheck_dtotalConstraints g1) 0 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
                        (v_Vuna_dTypecheck_dfinalizeGlobals (v_Vuna_dTypecheck_dsubstOf stA) g1, v_Vuna_dTypecheck_drebuildDecls
                        decls2 elab1))
                      else (match v_Vuna_dTypecheck_dcheckFunctions g1 decls2 sigs names freshTC [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elab2, C_Vuna_dBase_dPair (g2, stB))) -> if v_vuna_ule_uint
                        (v_Vuna_dTypecheck_dtotalConstraints g2) (v_Vuna_dTypecheck_dtotalConstraints
                        g1) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfinalizeGlobals
                        (v_Vuna_dTypecheck_dsubstOf stB) g2, v_Vuna_dTypecheck_drebuildDecls decls2 elab2))

                        else (match v_Vuna_dTypecheck_dcheckFunctions g2 decls2 sigs names freshTC []
                        with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elab3, C_Vuna_dBase_dPair (g3, stC))) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
                        (v_Vuna_dTypecheck_dfinalizeGlobals (v_Vuna_dTypecheck_dsubstOf stC) g3, v_Vuna_dTypecheck_drebuildDecls
                        decls2 elab3))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2347 48 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2341 42 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2335 36 ("case pattern match failure"))))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2331 29 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2328 25 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2325 21 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2321 14 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2318 10 ("case pattern match failure")))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2315 3 ("case pattern match failure"))

let v_Vuna_dInterp_dinterpretFile = fun roots entry -> (match v_Vuna_dLoader_dloadProgram roots entry
  with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (decls) -> if v_Vuna_dInterp_dprogramNeedsElab decls then (match v_Vuna_dTypecheck_dcheckProgramInfoElab
    decls with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (globals, elabDecls)) -> v_Vuna_dEval_drunDecls elabDecls
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 97 9 ("case pattern match failure"))
  else v_Vuna_dEval_drunDecls decls
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 93 3 ("case pattern match failure"))

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
  roots entry) (fun decls -> if v_Vuna_dInterp_dprogramNeedsElab decls then v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab
    decls) (fun p -> v_Vuna_dCodegen_dgenerateProgram (v_Vuna_dBase_dsecondOf p) printResult)
  else v_Vuna_dCodegen_dgenerateProgram decls printResult)

let v_Vuna_dInterp_dcompileFileTyped = fun roots entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  roots entry) (fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun
    p -> (match p with
  | C_Vuna_dBase_dPair (globals, elabDecls) -> v_Vuna_dTypedCodegen_dgenerateProgramTyped elabDecls globals
      printResult
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 117 7 ("case pattern match failure"))))

let v_Vuna_dTypecheck_dcheckProgramInfo = fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab
  decls) (fun p -> C_Vuna_dBase_dOk (v_Vuna_dBase_dfirstOf p))

let v_Vuna_dTypecheck_dcheckProgram = fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfo
  decls) (fun _u -> C_Vuna_dBase_dOk ([]))

let v_Vuna_dInterp_dcompileFileChecked = fun roots entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  roots entry) (fun decls -> if v_Vuna_dInterp_dprogramNeedsElab decls then v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab
    decls) (fun p -> v_Vuna_dCodegen_dgenerateProgram (v_Vuna_dBase_dsecondOf p) printResult)
  else v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgram decls) (fun _u -> v_Vuna_dCodegen_dgenerateProgram
    decls printResult))

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

let v_vuna_uneq_uVuna_uBase_uPair = fun x y -> if v_vuna_ueq_uVuna_uBase_uPair x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uBase_uBool = fun x -> (match x with
  | false -> "False"
  | true -> "True"
  | _ -> vuna_fail "<generated>" 587 30 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uBase_uBool = fun x y -> (match x with
  | false -> (match y with
  | false -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 593 12 ("case pattern match failure"))
  | true -> (match y with
  | true -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 596 11 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 592 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uBase_uBool = fun x y -> if v_vuna_ueq_uVuna_uBase_uBool x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uBase_uPos = fun x -> (match x with
  | C_Vuna_dBase_dPos (v0, v1) -> (let vuna_cat0' = ("(Pos ") in
    (let vuna_cat1' = (v_vuna_ushow_uint v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_uint v1) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 604 29 ("case pattern match failure"))

let v_vuna_ushow_uVuna_uLexer_uPTok = fun x -> (match x with
  | C_Vuna_dLexer_dPTok (v0, v1) -> (let vuna_cat0' = ("(PTok ") in
    (let vuna_cat1' = (v_vuna_ushow_uVuna_uLexer_uTok v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uPos v1) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 364 31 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uBase_uPos = fun x y -> (match x with
  | C_Vuna_dBase_dPos (v0, v1) -> (match y with
  | C_Vuna_dBase_dPos (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uint v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 609 26 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 608 29 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uParser_uPState = fun x y -> (match x with
  | C_Vuna_dParser_dPState (v0, v1, v2) -> (match y with
  | C_Vuna_dParser_dPState (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uPos v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 323 34 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 322 34 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uParser_uPState = fun x y -> if v_vuna_ueq_uVuna_uParser_uPState x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uLexer_uPTok = fun x y -> (match x with
  | C_Vuna_dLexer_dPTok (v0, v1) -> (match y with
  | C_Vuna_dLexer_dPTok (w0, w1) -> (if (v_vuna_ueq_uVuna_uLexer_uTok v0 w0) then (v_vuna_ueq_uVuna_uBase_uPos
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 369 28 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 368 31 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uPTok = fun x y -> if v_vuna_ueq_uVuna_uLexer_uPTok x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uLexer_uChars = fun x y -> (match x with
  | C_Vuna_dLexer_dChars (v0, v1) -> (match y with
  | C_Vuna_dLexer_dChars (w0, w1) -> (if (v_vuna_ueq_uVuna_uBase_uList v0 w0) then (v_vuna_ueq_uVuna_uBase_uPos
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 378 29 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 377 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uChars = fun x y -> if v_vuna_ueq_uVuna_uLexer_uChars x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_uneq_uVuna_uBase_uPos = fun x y -> if v_vuna_ueq_uVuna_uBase_uPos x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uBase_uSpan = fun x -> (match x with
  | C_Vuna_dBase_dSpan (v0, v1, v2, v3, v4) -> (let vuna_cat0' = ("(Span ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_uint v1) in
          (let vuna_cat4' = (" ") in
            (let vuna_cat5' = (v_vuna_ushow_uint v2) in
              (let vuna_cat6' = (" ") in
                (let vuna_cat7' = (v_vuna_ushow_uint v3) in
                  (let vuna_cat8' = (" ") in
                    (let vuna_cat9' = (v_vuna_ushow_uint v4) in
                      (let vuna_cat10' = (")") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'])))))))))))
  | _ -> vuna_fail "<generated>" 617 30 ("case pattern match failure"))

let v_vuna_ushow_uVuna_uAst_uExportItem = fun x -> (match x with
  | C_Vuna_dAst_dXBare (v0, v1) -> (let vuna_cat0' = ("(XBare ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uSpan v1) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dAst_dXTypeAll (v0, v1) -> (let vuna_cat0' = ("(XTypeAll ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uSpan v1) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dAst_dXModule (v0, v1) -> (let vuna_cat0' = ("(XModule ") in
    (let vuna_cat1' = (v_vuna_ushow_ustring v0) in
      (let vuna_cat2' = (" ") in
        (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uSpan v1) in
          (let vuna_cat4' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 494 35 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uBase_uSpan = fun x y -> (match x with
  | C_Vuna_dBase_dSpan (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dBase_dSpan (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uint
                    v1 w1)
                  else false)) then (v_vuna_ueq_uint v2 w2)
              else false)) then (v_vuna_ueq_uint v3 w3)
          else false)) then (v_vuna_ueq_uint v4 w4)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 622 36 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 621 30 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uTypecheck_uRecConstraint = fun x y -> (match x with
  | C_Vuna_dTypecheck_dFieldCon (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dFieldCon (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uTypecheck_uTy v0
                w0) then (v_vuna_ueq_ustr v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTy v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 118 42 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dUpdateCon (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dUpdateCon (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uTypecheck_uTy v0
                w0) then (v_vuna_ueq_ustr v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTy v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 121 43 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 117 44 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uRecConstraint = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uRecConstraint
x y then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let rec v_vuna_ueq_uVuna_uTypecheck_uEExpr = fun x y -> (match x with
  | C_Vuna_dTypecheck_dXEVar (v0, v1) -> (match y with
  | C_Vuna_dTypecheck_dXEVar (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 139 33 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEInt (v0, v1) -> (match y with
  | C_Vuna_dTypecheck_dXEInt (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 142 33 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEStr (v0, v1) -> (match y with
  | C_Vuna_dTypecheck_dXEStr (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 145 33 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXELam (v0, v1, v2) -> (match y with
  | C_Vuna_dTypecheck_dXELam (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uBase_uList v0 w0) then (v_vuna_ueq_uVuna_uTypecheck_uEExpr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 148 36 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEApp (v0, v1, v2) -> (match y with
  | C_Vuna_dTypecheck_dXEApp (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uTypecheck_uEExpr v0 w0) then
          (v_vuna_ueq_uVuna_uBase_uList v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 151 36 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXELet (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dXELet (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uBase_uList v0 w0) then
              (v_vuna_ueq_uVuna_uTypecheck_uEExpr v1 w1)
              else false)) then (v_vuna_ueq_ubool v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 154 39 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXECase (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dXECase (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uTypecheck_uEExpr v0
                w0) then (v_vuna_ueq_uVuna_uTypecheck_uTy v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 157 40 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEIf (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dXEIf (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uTypecheck_uEExpr v0 w0)
              then (v_vuna_ueq_uVuna_uTypecheck_uEExpr v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uEExpr v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 160 38 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEField (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dXEField (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uTypecheck_uEExpr v0
                w0) then (v_vuna_ueq_ustr v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTy v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 163 41 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXERecUpdate (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dXERecUpdate (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uTypecheck_uEExpr
                v0 w0) then (v_vuna_ueq_uVuna_uTypecheck_uTy v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 166 45 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEFun (v0, v1, v2) -> (match y with
  | C_Vuna_dTypecheck_dXEFun (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 169 36 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEMethod (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dTypecheck_dXEMethod (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTy v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 172 42 ("case pattern match failure"))
  | C_Vuna_dTypecheck_dXEMethodInst (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dTypecheck_dXEMethodInst (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_ustr v0 w0)
                  then (v_vuna_ueq_ustr v1 w1)
                  else false)) then (v_vuna_ueq_ustr v2 w2)
              else false)) then (v_vuna_ueq_uVuna_uTypecheck_uTy v3 w3)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v4 w4)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 175 49 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 138 36 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uEExpr = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uEExpr x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uPat = fun x y -> (match x with
  | C_Vuna_dAst_dPVar (v0, v1) -> (match y with
  | C_Vuna_dAst_dPVar (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 396 26 ("case pattern match failure"))
  | C_Vuna_dAst_dPWild (v0) -> (match y with
  | C_Vuna_dAst_dPWild (w0) -> v_vuna_ueq_uVuna_uBase_uSpan v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 399 24 ("case pattern match failure"))
  | C_Vuna_dAst_dPCon (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dPCon (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 402 29 ("case pattern match failure"))
  | C_Vuna_dAst_dPInt (v0, v1) -> (match y with
  | C_Vuna_dAst_dPInt (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 405 26 ("case pattern match failure"))
  | C_Vuna_dAst_dPStr (v0, v1) -> (match y with
  | C_Vuna_dAst_dPStr (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 408 26 ("case pattern match failure"))
  | C_Vuna_dAst_dPRecord (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dPRecord (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 411 32 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 395 28 ("case pattern match failure"))

let v_Vuna_dTypecheck_dcoverageWarnings = fun decls ty posPats -> (let ctors = v_Vuna_dTypecheck_dtyCtorNames
  decls ty in
  if v_vuna_ueq_ugeneric ctors [] then []
  else if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uVuna_uAst_uPat vuna_ueq_ulh vuna_ueq_ulh2)
            then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2)
            else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in
      vuna_ueq_ulist_ugo)) posPats [] then []
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
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2442 1 ("no matching clause for Vuna.Typecheck.funCoverageWarnings")

let v_Vuna_dTypecheck_dfunWarnings = fun globals decls name -> (match v_Vuna_dTypecheck_dlookupScheme
  name globals with
  | C_Vuna_dBase_dNothing -> []
  | C_Vuna_dBase_dJust (sch) -> (let clauses = v_Vuna_dAst_dclausesFor decls name in
    (let paramTys = v_Vuna_dTypecheck_dflattenFun (v_Vuna_dTypecheck_dschemeTy sch) in
      (let bodyWarn = v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dclauseBodyWarnings globals decls paramTys)
        clauses in
        v_Vuna_dBase_dappend (v_Vuna_dTypecheck_dfunCoverageWarnings decls paramTys clauses) bodyWarn)))
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2372 3 ("case pattern match failure"))

let v_Vuna_dTypecheck_dprogramWarnings = fun globals decls -> v_Vuna_dBase_dconcatMap (v_Vuna_dTypecheck_dfunWarnings
  globals decls) (v_Vuna_dTypecheck_dfunctionNames decls)

let v_Vuna_dTypecheck_dexhaustiveWarnings = fun decls -> (match v_Vuna_dTypecheck_dcheckProgramInfo decls
  with
  | C_Vuna_dBase_dOk (globals) -> v_Vuna_dTypecheck_dprogramWarnings globals decls
  | C_Vuna_dBase_dErr (_) -> []
  | _ -> vuna_fail "lib/Vuna/Typecheck.vuna" 2364 3 ("case pattern match failure"))

let v_Vuna_dInterp_dcheckFile = fun roots entry -> (match v_Vuna_dLoader_dloadProgram roots entry with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (decls) -> if v_Vuna_dInterp_dprogramNeedsElab decls then (match v_Vuna_dTypecheck_dcheckProgramInfoElab
    decls with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (globals, elabDecls)) -> C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dexhaustiveWarnings
      elabDecls)
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 126 9 ("case pattern match failure"))
  else (match v_Vuna_dTypecheck_dcheckProgramInfo decls with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (_) -> C_Vuna_dBase_dOk (v_Vuna_dTypecheck_dexhaustiveWarnings decls)
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 130 9 ("case pattern match failure"))
  | _ -> vuna_fail "lib/Vuna/Interp.vuna" 122 3 ("case pattern match failure"))

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

let v_vuna_uneq_uVuna_uAst_uPat = fun x y -> if v_vuna_ueq_uVuna_uAst_uPat x y then v_vuna_ueq_uint 0
1
else v_vuna_ueq_uint 0 0

let rec v_vuna_ueq_uVuna_uAst_uExpr = fun x y -> (match x with
  | C_Vuna_dAst_dEVar (v0, v1) -> (match y with
  | C_Vuna_dAst_dEVar (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 420 26 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (v0, v1) -> (match y with
  | C_Vuna_dAst_dEInt (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 423 26 ("case pattern match failure"))
  | C_Vuna_dAst_dEStr (v0, v1) -> (match y with
  | C_Vuna_dAst_dEStr (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 426 26 ("case pattern match failure"))
  | C_Vuna_dAst_dELam (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dELam (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uBase_uList v0 w0) then (v_vuna_ueq_uVuna_uAst_uExpr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 429 29 ("case pattern match failure"))
  | C_Vuna_dAst_dEApp (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dEApp (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uAst_uExpr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 432 29 ("case pattern match failure"))
  | C_Vuna_dAst_dELet (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dELet (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uBase_uList v0 w0) then (v_vuna_ueq_uVuna_uAst_uExpr
                v1 w1)
              else false)) then (v_vuna_ueq_ubool v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 435 32 ("case pattern match failure"))
  | C_Vuna_dAst_dECase (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dECase (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uAst_uExpr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 438 30 ("case pattern match failure"))
  | C_Vuna_dAst_dEIf (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dEIf (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uAst_uExpr v0 w0) then (v_vuna_ueq_uVuna_uAst_uExpr
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uAst_uExpr v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 441 31 ("case pattern match failure"))
  | C_Vuna_dAst_dEField (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dEField (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uAst_uExpr v0 w0) then (v_vuna_ueq_ustr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 444 31 ("case pattern match failure"))
  | C_Vuna_dAst_dERecord (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dERecord (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 447 32 ("case pattern match failure"))
  | C_Vuna_dAst_dERecUpdate (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dERecUpdate (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uAst_uExpr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 450 35 ("case pattern match failure"))
  | C_Vuna_dAst_dEInstSel (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dEInstSel (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uAst_uExpr v0 w0) then (v_vuna_ueq_ustr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 453 33 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 419 29 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uTypecheck_uTraitMethodInfo = fun x y -> (match x with
  | C_Vuna_dTypecheck_dTraitMethodInfo (v0, v1, v2) -> (match y with
  | C_Vuna_dTypecheck_dTraitMethodInfo (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uTypecheck_uScheme
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uAst_uExpr v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 197 46 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 196 46 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uTypecheck_uTraitMethodInfo = fun x y -> if v_vuna_ueq_uVuna_uTypecheck_uTraitMethodInfo
x y then v_vuna_ueq_uint 0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uEval_uValue = fun x y -> (match x with
  | C_Vuna_dEval_dVInt (v0) -> (match y with
  | C_Vuna_dEval_dVInt (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 264 24 ("case pattern match failure"))
  | C_Vuna_dEval_dVStr (v0) -> (match y with
  | C_Vuna_dEval_dVStr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 267 24 ("case pattern match failure"))
  | C_Vuna_dEval_dVCon (v0, v1) -> (match y with
  | C_Vuna_dEval_dVCon (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 270 27 ("case pattern match failure"))
  | C_Vuna_dEval_dVFun (v0, v1) -> (match y with
  | C_Vuna_dEval_dVFun (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 273 27 ("case pattern match failure"))
  | C_Vuna_dEval_dVLam (v0, v1, v2) -> (match y with
  | C_Vuna_dEval_dVLam (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uBase_uList v0 w0) then (v_vuna_ueq_uVuna_uAst_uExpr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 276 30 ("case pattern match failure"))
  | C_Vuna_dEval_dVBuiltin (v0, v1) -> (match y with
  | C_Vuna_dEval_dVBuiltin (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
        v1 w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 279 31 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 263 31 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uEval_uValue = fun x y -> if v_vuna_ueq_uVuna_uEval_uValue x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uField = fun x y -> (match x with
  | C_Vuna_dAst_dField (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dField (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uAst_uExpr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 387 30 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 386 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uField = fun x y -> if v_vuna_ueq_uVuna_uAst_uField x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_uneq_uVuna_uAst_uExpr = fun x y -> if v_vuna_ueq_uVuna_uAst_uExpr x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uCtor = fun x y -> (match x with
  | C_Vuna_dAst_dCtor (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dCtor (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uAst_uExpr
                v1 w1)
              else false)) then (v_vuna_ueq_uint v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 462 32 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 461 29 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uCtor = fun x y -> if v_vuna_ueq_uVuna_uAst_uCtor x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uDecl = fun x y -> (match x with
  | C_Vuna_dAst_dDData (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dAst_dDData (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
                    v1 w1)
                  else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v4 w4)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 471 36 ("case pattern match failure"))
  | C_Vuna_dAst_dDSig (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dDSig (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uAst_uExpr
            v1 w1)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 474 29 ("case pattern match failure"))
  | C_Vuna_dAst_dDFun (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dDFun (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uAst_uExpr v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 477 32 ("case pattern match failure"))
  | C_Vuna_dAst_dDRecord (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dAst_dDRecord (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
                    v1 w1)
                  else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v4 w4)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 480 38 ("case pattern match failure"))
  | C_Vuna_dAst_dDTrait (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dDTrait (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uList
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 483 34 ("case pattern match failure"))
  | C_Vuna_dAst_dDInstance (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dAst_dDInstance (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_uVuna_uBase_uMaybe v0
                    w0) then (v_vuna_ueq_ubool v1 w1)
                  else false)) then (v_vuna_ueq_uVuna_uAst_uExpr v2 w2)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v3 w3)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v4 w4)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 486 40 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 470 29 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uDecl = fun x y -> if v_vuna_ueq_uVuna_uAst_uDecl x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uExportItem = fun x y -> (match x with
  | C_Vuna_dAst_dXBare (v0, v1) -> (match y with
  | C_Vuna_dAst_dXBare (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1)

      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 501 27 ("case pattern match failure"))
  | C_Vuna_dAst_dXTypeAll (v0, v1) -> (match y with
  | C_Vuna_dAst_dXTypeAll (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1
        w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 504 30 ("case pattern match failure"))
  | C_Vuna_dAst_dXModule (v0, v1) -> (match y with
  | C_Vuna_dAst_dXModule (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1
        w1)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 507 29 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 500 35 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uExportItem = fun x y -> if v_vuna_ueq_uVuna_uAst_uExportItem x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uModDecl = fun x y -> (match x with
  | C_Vuna_dAst_dModDecl (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dModDecl (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ubool
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uBase_uList v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 516 35 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 515 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uModDecl = fun x y -> if v_vuna_ueq_uVuna_uAst_uModDecl x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uImport = fun x y -> (match x with
  | C_Vuna_dAst_dImport (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dImport (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ubool
                v1 w1)
              else false)) then (v_vuna_ueq_uVuna_uBase_uMaybe v2 w2)
          else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3)
      else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 534 34 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 533 31 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uImport = fun x y -> if v_vuna_ueq_uVuna_uAst_uImport x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0

let v_vuna_uneq_uVuna_uBase_uSpan = fun x y -> if v_vuna_ueq_uVuna_uBase_uSpan x y then v_vuna_ueq_uint
0 1
else v_vuna_ueq_uint 0 0
let () = ignore (v_main ())
