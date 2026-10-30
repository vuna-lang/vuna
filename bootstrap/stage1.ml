
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

type   t_Vuna_dTypecheck_dTy =
    C_Vuna_dTypecheck_dTVar of (int)
  | C_Vuna_dTypecheck_dTCon of (string) * ((t_Vuna_dTypecheck_dTy) list)
  | C_Vuna_dTypecheck_dTFun of (t_Vuna_dTypecheck_dTy) * (t_Vuna_dTypecheck_dTy)
and   t_Vuna_dTypecheck_dScheme =
    C_Vuna_dTypecheck_dScheme of ((int) list) * (t_Vuna_dTypecheck_dTy)
and   t_Vuna_dTypecheck_dTC =
    C_Vuna_dTypecheck_dTC of (int) * (((int, t_Vuna_dTypecheck_dTy) t_Vuna_dBase_dPair) list)
and   t_Vuna_dTypecheck_dEExpr =
    C_Vuna_dTypecheck_dXEVar of (string)
  | C_Vuna_dTypecheck_dXEInt of (int)
  | C_Vuna_dTypecheck_dXEStr of (string)
  | C_Vuna_dTypecheck_dXELam of ((string) list) * (t_Vuna_dTypecheck_dEExpr)
  | C_Vuna_dTypecheck_dXEApp of (t_Vuna_dTypecheck_dEExpr) * ((t_Vuna_dTypecheck_dEExpr) list)
  | C_Vuna_dTypecheck_dXECmp of (string) * ((t_Vuna_dTypecheck_dEExpr) list) * (t_Vuna_dTypecheck_dTy)
  | C_Vuna_dTypecheck_dXELet of (((t_Vuna_dAst_dPat, t_Vuna_dTypecheck_dEExpr) t_Vuna_dBase_dPair) list)
* (t_Vuna_dTypecheck_dEExpr)
  | C_Vuna_dTypecheck_dXECase of (t_Vuna_dTypecheck_dEExpr) * (((t_Vuna_dAst_dPat, t_Vuna_dTypecheck_dEExpr)
    t_Vuna_dBase_dPair) list)
  | C_Vuna_dTypecheck_dXEIf of (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dEExpr) * (t_Vuna_dTypecheck_dEExpr)
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
    C_Vuna_dParser_dPState of ((t_Vuna_dLexer_dPTok) list) * (t_Vuna_dLexer_dPos)
and   t_Vuna_dLexer_dPos =
    C_Vuna_dLexer_dPos of (int) * (int)
and   t_Vuna_dLexer_dTok =
    C_Vuna_dLexer_dTIdent of (string)
  | C_Vuna_dLexer_dTKw of (string)
  | C_Vuna_dLexer_dTInt of (int)
  | C_Vuna_dLexer_dTStr of (string)
  | C_Vuna_dLexer_dTSym of (string)
  | C_Vuna_dLexer_dTEof
and   t_Vuna_dLexer_dPTok =
    C_Vuna_dLexer_dPTok of (t_Vuna_dLexer_dTok) * (t_Vuna_dLexer_dPos)
and   t_Vuna_dLexer_dChars =
    C_Vuna_dLexer_dChars of ((int) list) * (t_Vuna_dLexer_dPos)
and   t_Vuna_dAst_dPat =
    C_Vuna_dAst_dPVar of (string)
  | C_Vuna_dAst_dPWild
  | C_Vuna_dAst_dPCon of (string) * ((t_Vuna_dAst_dPat) list)
  | C_Vuna_dAst_dPInt of (int)
  | C_Vuna_dAst_dPStr of (string)
and   t_Vuna_dAst_dExpr =
    C_Vuna_dAst_dEVar of (string)
  | C_Vuna_dAst_dEInt of (int)
  | C_Vuna_dAst_dEStr of (string)
  | C_Vuna_dAst_dELam of ((string) list) * (t_Vuna_dAst_dExpr)
  | C_Vuna_dAst_dEApp of (t_Vuna_dAst_dExpr) * ((t_Vuna_dAst_dExpr) list)
  | C_Vuna_dAst_dELet of (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair) list) * (t_Vuna_dAst_dExpr)
  | C_Vuna_dAst_dECase of (t_Vuna_dAst_dExpr) * (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair)
  list)
  | C_Vuna_dAst_dEIf of (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr)
and   t_Vuna_dAst_dCtor =
    C_Vuna_dAst_dCtor of (string) * (t_Vuna_dAst_dExpr) * (int)
and   t_Vuna_dAst_dDecl =
    C_Vuna_dAst_dDData of (string) * ((string) list) * ((t_Vuna_dAst_dCtor) list)
  | C_Vuna_dAst_dDSig of (string) * (t_Vuna_dAst_dExpr)
  | C_Vuna_dAst_dDFun of (string) * ((t_Vuna_dAst_dPat) list) * (t_Vuna_dAst_dExpr)
and   t_Vuna_dAst_dImport =
    C_Vuna_dAst_dImport of (string) * (bool) * ((string) t_Vuna_dBase_dMaybe)
and   'p0 t_Vuna_dBase_dResult =
    C_Vuna_dBase_dOk of ('p0)
  | C_Vuna_dBase_dErr of (string)
and   'p0 t_Vuna_dBase_dMaybe =
    C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust of ('p0)
and   ('p0, 'p1) t_Vuna_dBase_dPair =
    C_Vuna_dBase_dPair of ('p0) * ('p1)

let rec show_Vuna_dTypecheck_dTy v =
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
  | C_Vuna_dTypecheck_dXEVar f0 -> show_ctor "XEVar" [(show_vstring) f0]
  | C_Vuna_dTypecheck_dXEInt f0 -> show_ctor "XEInt" [(string_of_int) f0]
  | C_Vuna_dTypecheck_dXEStr f0 -> show_ctor "XEStr" [(show_vstring) f0]
  | C_Vuna_dTypecheck_dXELam (f0, f1) -> show_ctor "XELam" [((fun v -> let rec go = function [] -> "Nil"
    | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dTypecheck_dEExpr) f1]
  | C_Vuna_dTypecheck_dXEApp (f0, f1) -> show_ctor "XEApp" [(show_Vuna_dTypecheck_dEExpr) f0; ((fun v
    -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dEExpr) x ^ " "
    ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dTypecheck_dXECmp (f0, f1, f2) -> show_ctor "XECmp" [(show_vstring) f0; ((fun v -> let rec
    go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dEExpr) x ^ " " ^ go xs ^
    ")" in
    go v)) f1; (show_Vuna_dTypecheck_dTy) f2]
  | C_Vuna_dTypecheck_dXELet (f0, f1) -> show_ctor "XELet" [((fun v -> let rec go = function [] -> "Nil"
    | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dTypecheck_dEExpr))
    x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dTypecheck_dEExpr) f1]
  | C_Vuna_dTypecheck_dXECase (f0, f1) -> show_ctor "XECase" [(show_Vuna_dTypecheck_dEExpr) f0; ((fun
    v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat
        show_Vuna_dTypecheck_dEExpr)) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dTypecheck_dXEIf (f0, f1, f2) -> show_ctor "XEIf" [(show_Vuna_dTypecheck_dEExpr) f0; (show_Vuna_dTypecheck_dEExpr)
f1; (show_Vuna_dTypecheck_dEExpr) f2]
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
  | C_Vuna_dParser_dPState (f0, f1) -> show_ctor "PState" [((fun v -> let rec go = function [] -> "Nil"
    | x :: xs -> "(Cons " ^ (show_Vuna_dLexer_dPTok) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dLexer_dPos) f1]
and show_Vuna_dLexer_dPos v =
  match v with
  | C_Vuna_dLexer_dPos (f0, f1) -> show_ctor "Pos" [(string_of_int) f0; (string_of_int) f1]
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
  | C_Vuna_dLexer_dPTok (f0, f1) -> show_ctor "PTok" [(show_Vuna_dLexer_dTok) f0; (show_Vuna_dLexer_dPos)
f1]
and show_Vuna_dLexer_dChars v =
  match v with
  | C_Vuna_dLexer_dChars (f0, f1) -> show_ctor "Chars" [((fun v -> let rec go = function [] -> "Nil" |
    x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dLexer_dPos) f1]
and show_Vuna_dAst_dPat v =
  match v with
  | C_Vuna_dAst_dPVar f0 -> show_ctor "PVar" [(show_vstring) f0]
  | C_Vuna_dAst_dPWild -> "PWild"
  | C_Vuna_dAst_dPCon (f0, f1) -> show_ctor "PCon" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dAst_dPInt f0 -> show_ctor "PInt" [(string_of_int) f0]
  | C_Vuna_dAst_dPStr f0 -> show_ctor "PStr" [(show_vstring) f0]
and show_Vuna_dAst_dExpr v =
  match v with
  | C_Vuna_dAst_dEVar f0 -> show_ctor "EVar" [(show_vstring) f0]
  | C_Vuna_dAst_dEInt f0 -> show_ctor "EInt" [(string_of_int) f0]
  | C_Vuna_dAst_dEStr f0 -> show_ctor "EStr" [(show_vstring) f0]
  | C_Vuna_dAst_dELam (f0, f1) -> show_ctor "ELam" [((fun v -> let rec go = function [] -> "Nil" | x ::
    xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f0; (show_Vuna_dAst_dExpr) f1]
  | C_Vuna_dAst_dEApp (f0, f1) -> show_ctor "EApp" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec go =
    function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dExpr) x ^ " " ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dAst_dELet (f0, f1) -> show_ctor "ELet" [((fun v -> let rec go = function [] -> "Nil" | x ::
    xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr)) x ^ " " ^ go xs
    ^ ")" in
    go v)) f0; (show_Vuna_dAst_dExpr) f1]
  | C_Vuna_dAst_dECase (f0, f1) -> show_ctor "ECase" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec go
    = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr))
    x ^ " " ^ go xs ^ ")" in
    go v)) f1]
  | C_Vuna_dAst_dEIf (f0, f1, f2) -> show_ctor "EIf" [(show_Vuna_dAst_dExpr) f0; (show_Vuna_dAst_dExpr)
f1; (show_Vuna_dAst_dExpr) f2]
and show_Vuna_dAst_dCtor v =
  match v with
  | C_Vuna_dAst_dCtor (f0, f1, f2) -> show_ctor "Ctor" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1;
(string_of_int) f2]
and show_Vuna_dAst_dDecl v =
  match v with
  | C_Vuna_dAst_dDData (f0, f1, f2) -> show_ctor "DData" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in
    go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dCtor)
    x ^ " " ^ go xs ^ ")" in
    go v)) f2]
  | C_Vuna_dAst_dDSig (f0, f1) -> show_ctor "DSig" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1]
  | C_Vuna_dAst_dDFun (f0, f1, f2) -> show_ctor "DFun" [(show_vstring) f0; ((fun v -> let rec go = function
    [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in
    go v)) f1; (show_Vuna_dAst_dExpr) f2]
and show_Vuna_dAst_dImport v =
  match v with
  | C_Vuna_dAst_dImport (f0, f1, f2) -> show_ctor "Import" [(show_vstring) f0; (show_vbool) f1; ((show_Vuna_dBase_dMaybe
    show_vstring)) f2]
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

let v_usage = "usage: vuna [--no-print] [--no-typecheck] [--typed] [--root DIR] <entry.vuna> [out.ml]"

let v_emitUsage = fun () -> (let _ = bi_print (((v_usage) ^ ("\n"))) in
  1)

let v_Vuna_dInterp_ddemo = "main = 40 + 2"

let rec v_Vuna_dTypedCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dTypedCodegen_djoinWith sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypedCodegen_dparamVar = fun i -> (("'p") ^ (bi_str_from_int i))

let v_Vuna_dTypedCodegen_dshowParamVar = fun i -> (("s") ^ (bi_str_from_int i))

let rec v_Vuna_dTypedCodegen_dparamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, v_Vuna_dTypedCodegen_dparamVar i)) :: (v_Vuna_dTypedCodegen_dparamMapAt
  rest (bi_add i 1))

let v_Vuna_dTypedCodegen_dparamMap = fun params -> v_Vuna_dTypedCodegen_dparamMapAt params 0

let rec v_Vuna_dTypedCodegen_dshowParamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, v_Vuna_dTypedCodegen_dshowParamVar i)) :: (v_Vuna_dTypedCodegen_dshowParamMapAt
  rest (bi_add i 1))

let v_Vuna_dTypedCodegen_dshowParamMap = fun params -> v_Vuna_dTypedCodegen_dshowParamMapAt params 0

let rec v_Vuna_dTypedCodegen_dlookupParam = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, v)) :: (rest)) -> if bi_eq n name then C_Vuna_dBase_dJust (v)
else v_Vuna_dTypedCodegen_dlookupParam name rest

let rec v_Vuna_dTypedCodegen_ddataDecls = fun decls -> (match decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (d) :: (v_Vuna_dTypedCodegen_ddataDecls rest)
  | _ -> v_Vuna_dTypedCodegen_ddataDecls rest))

let rec v_Vuna_dTypedCodegen_dlookupData = fun decls name -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dn, ps, cs) -> if bi_eq_str dn name then C_Vuna_dBase_dJust (d)
    else v_Vuna_dTypedCodegen_dlookupData rest name
  | _ -> v_Vuna_dTypedCodegen_dlookupData rest name))

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

let rec v_Vuna_dTypedCodegen_dsplitArrows = fun expr -> (match expr with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->"), (a) :: ((b) :: ([]))) -> (a) :: (v_Vuna_dTypedCodegen_dsplitArrows
    b)
  | _ -> [])

let rec v_Vuna_dTypedCodegen_drange = fun i n -> if bi_ge_int i n then []
else (i) :: (v_Vuna_dTypedCodegen_drange (bi_add i 1) n)

let rec v_Vuna_dTypedCodegen_dparamVarsAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (v_Vuna_dTypedCodegen_dparamVar i) :: (v_Vuna_dTypedCodegen_dparamVarsAt rest
  (bi_add i 1))

let v_Vuna_dTypedCodegen_dparamVars = fun params -> v_Vuna_dTypedCodegen_dparamVarsAt params 0

let v_Vuna_dTypedCodegen_ddataPrefix = fun params -> (match params with
  | [] -> ""
  | (p) :: ([]) -> ((v_Vuna_dTypedCodegen_dparamVar 0) ^ (" "))
  | _ -> (let vuna_cat0' = ("(") in
    (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " (v_Vuna_dTypedCodegen_dparamVars params))
      in
      (let vuna_cat2' = (") ") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dTypedCodegen_dpairSecond = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (_, v)) -> v

let rec v_Vuna_dTypedCodegen_dfoldStringLiterals = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dAst_dEStr (s)) :: (rest)) -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals rest with
  | (C_Vuna_dAst_dEStr (s2)) :: (rest2) -> (C_Vuna_dAst_dEStr (((s) ^ (s2)))) :: (rest2)
  | folded -> (C_Vuna_dAst_dEStr (s)) :: (folded))
  | ((e) :: (rest)) -> (e) :: (v_Vuna_dTypedCodegen_dfoldStringLiterals rest)

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
  | (_) -> C_Vuna_dBase_dNothing

let v_Vuna_dTypedCodegen_disVarPattern = fun p -> (match p with
  | C_Vuna_dAst_dPVar (_) -> true
  | C_Vuna_dAst_dPWild -> true
  | _ -> false)

let rec v_Vuna_dTypedCodegen_dallVarPatterns = fun a0 -> match a0 with
  | ([]) -> true
  | ((p) :: (rest)) -> (if (v_Vuna_dTypedCodegen_disVarPattern p) then (v_Vuna_dTypedCodegen_dallVarPatterns
    rest)
  else false)

let v_Vuna_dTypedCodegen_ddeclFunName = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> name
  | _ -> "")

let rec v_Vuna_dTypedCodegen_dfilterNames = fun pred names -> (match names with
  | [] -> []
  | (n) :: (rest) -> if pred n then (n) :: (v_Vuna_dTypedCodegen_dfilterNames pred rest)
  else v_Vuna_dTypedCodegen_dfilterNames pred rest)

let rec v_Vuna_dTypedCodegen_dneighborsOf = fun adj name -> (match adj with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, ns)) :: (rest) -> if bi_eq_str n name then ns
  else v_Vuna_dTypedCodegen_dneighborsOf rest name)

let v_Vuna_dTypedCodegen_druntimeCodeTyped = "
let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b
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
  with Sys_error msg -> failwith (\"readFile: \" ^ msg)
let bi_write_file path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)
let bi_print s = print_string s; flush stdout; String.length s
let bi_get_args () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
let show_ctor name args = if args = [] then name else \"(\" ^ name ^ \" \" ^ String.concat \" \" args ^ \")\"
let show_vbool b = if b then \"True\" else \"False\"
let show_vstring s =
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
let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =
  match v with
  | [] -> \"Nil\"
  | x :: xs -> \"(Cons \" ^ show_elem x ^ \" \" ^ show_vlist show_elem xs ^ \")\"
"

let v_Vuna_dTypedCodegen_dindentWidth = fun depth -> if bi_gt_int depth 12 then 24
else bi_mul depth 2

let rec v_Vuna_dTypedCodegen_dtrimTrailing = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if bi_eq_int c 32 then v_Vuna_dTypedCodegen_dtrimTrailing rest
else (c) :: (rest)

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

let rec v_Vuna_dTypecheck_dlookupSubst = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dBase_dNothing
  | (i, (C_Vuna_dBase_dPair (j, t)) :: (rest)) -> if bi_eq i j then C_Vuna_dBase_dJust (t)
else v_Vuna_dTypecheck_dlookupSubst i rest

let rec v_Vuna_dTypecheck_dmemInt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> false
  | (i, (x) :: (rest)) -> if bi_eq i x then true
else v_Vuna_dTypecheck_dmemInt i rest

let v_Vuna_dTypecheck_daddUnique = fun x xs -> if v_Vuna_dTypecheck_dmemInt x xs then xs
else (x) :: (xs)

let rec v_Vuna_dTypecheck_dunionInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> v_Vuna_dTypecheck_daddUnique x (v_Vuna_dTypecheck_dunionInts rest ys)

let rec v_Vuna_dTypecheck_ddiffInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> []
  | ((x) :: (rest), ys) -> if v_Vuna_dTypecheck_dmemInt x ys then v_Vuna_dTypecheck_ddiffInts rest ys

else (x) :: (v_Vuna_dTypecheck_ddiffInts rest ys)

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
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
and v_Vuna_dTypecheck_dshowTyArgs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((ty) :: ([])) -> v_Vuna_dTypecheck_dshowTy ty
  | ((ty) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dTypecheck_dshowTy ty) in
  (let vuna_cat1' = (" ") in
    (let vuna_cat2' = (v_Vuna_dTypecheck_dshowTyArgs rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dTypecheck_dnextVar = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s)) -> C_Vuna_dBase_dPair (n, C_Vuna_dTypecheck_dTC (bi_add n 1, s))

let v_Vuna_dTypecheck_dfreshTy = fun st -> (match v_Vuna_dTypecheck_dnextVar st with
  | C_Vuna_dBase_dPair (n, st2) -> C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTVar (n), st2))

let v_Vuna_dTypecheck_dbindVar = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, ty, C_Vuna_dTypecheck_dTC (n, s)) -> C_Vuna_dBase_dOk (C_Vuna_dTypecheck_dTC (n, (C_Vuna_dBase_dPair
      (i, ty)) :: (s)))

let rec v_Vuna_dTypecheck_dinstantiateVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((q) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st2) -> (match v_Vuna_dTypecheck_dinstantiateVars rest st2 with
  | C_Vuna_dBase_dPair (mapping, st3) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (q, ty)) :: (mapping),
      st3)))

let rec v_Vuna_dTypecheck_dfreeVarsTy = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: ([])
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_Vuna_dTypecheck_dfreeVarsArgs args
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsTy a) (v_Vuna_dTypecheck_dfreeVarsTy
    b))
and v_Vuna_dTypecheck_dfreeVarsArgs = fun a0 -> match a0 with
  | ([]) -> []
  | ((ty) :: (rest)) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsTy ty) (v_Vuna_dTypecheck_dfreeVarsArgs
  rest)

let v_Vuna_dTypecheck_dfreeVarsScheme = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dScheme (qs, ty)) -> v_Vuna_dTypecheck_ddiffInts (v_Vuna_dTypecheck_dfreeVarsTy
  ty) qs

let rec v_Vuna_dTypecheck_dfreeVarsEnv = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (n, sch)) :: (rest)) -> v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsScheme
  sch) (v_Vuna_dTypecheck_dfreeVarsEnv rest)

let v_Vuna_dTypecheck_disLowerName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (bi_ge_int c 97) then (bi_le_int c 122)
    else false))

let rec v_Vuna_dTypecheck_dlookupTyVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> if bi_eq n name then C_Vuna_dBase_dJust (ty)
else v_Vuna_dTypecheck_dlookupTyVar name rest

let rec v_Vuna_dTypecheck_dvarIds = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: (v_Vuna_dTypecheck_dvarIds rest)
  | _ -> v_Vuna_dTypecheck_dvarIds rest)

let rec v_Vuna_dTypecheck_dseedVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedVars rest st1 with
  | C_Vuna_dBase_dPair (vars, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, ty)) :: (vars), st2)))

let rec v_Vuna_dTypecheck_ddeclDataNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (name) :: (v_Vuna_dTypecheck_ddeclDataNames rest)
  | _ -> v_Vuna_dTypecheck_ddeclDataNames rest)

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
                        :: ([])))))))))))))))))))))

let v_Vuna_dTypecheck_dintCmpName = fun name -> if bi_eq_str name "==" then "bi_eq_int"
else if bi_eq_str name "/=" then "bi_neq_int"
else if bi_eq_str name "<" then "bi_lt_int"
else if bi_eq_str name "<=" then "bi_le_int"
else if bi_eq_str name ">" then "bi_gt_int"
else if bi_eq_str name ">=" then "bi_ge_int"
else name

let v_Vuna_dTypecheck_dstrCmpName = fun name -> if bi_eq_str name "==" then "bi_eq_str"
else if bi_eq_str name "/=" then "bi_neq_str"
else name

let v_Vuna_dTypecheck_dboolCmpName = fun name -> if bi_eq_str name "==" then "bi_eq_bool"
else if bi_eq_str name "/=" then "bi_neq_bool"
else name

let v_Vuna_dTypecheck_dfirstArgTy = fun argTys -> (match argTys with
  | (ty) :: (rest) -> ty
  | [] -> C_Vuna_dTypecheck_dTCon ("", []))

let v_Vuna_dTypecheck_disCmpName = fun name -> (if ((if ((if ((if ((if (bi_eq_str name "==") then true

                  else (bi_eq_str name "/="))) then true
              else (bi_eq_str name "<"))) then true
          else (bi_eq_str name "<="))) then true
      else (bi_eq_str name ">"))) then true
  else (bi_eq_str name ">="))

let v_Vuna_dTypecheck_delabAppExpr = fun fn fnElab args argTys argEls -> (match fn with
  | C_Vuna_dAst_dEVar (name) -> (match args with
  | (_) :: ((_) :: ([])) -> if v_Vuna_dTypecheck_disCmpName name then C_Vuna_dTypecheck_dXECmp (name,
      argEls, v_Vuna_dTypecheck_dfirstArgTy argTys)
    else C_Vuna_dTypecheck_dXEApp (fnElab, argEls)
  | _ -> C_Vuna_dTypecheck_dXEApp (fnElab, argEls))
  | _ -> C_Vuna_dTypecheck_dXEApp (fnElab, argEls))

let rec v_Vuna_dTypecheck_dlookupLocal = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, ty)) :: (rest)) -> if bi_eq n name then C_Vuna_dBase_dJust (ty)
else v_Vuna_dTypecheck_dlookupLocal name rest

let rec v_Vuna_dTypecheck_dlookupScheme = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (n, sch)) :: (rest)) -> if bi_eq_str n name then C_Vuna_dBase_dJust (sch)

else v_Vuna_dTypecheck_dlookupScheme name rest

let rec v_Vuna_dTypecheck_dfunArgs = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> (a) :: (v_Vuna_dTypecheck_dfunArgs b)
  | _ -> [])

let rec v_Vuna_dTypecheck_dfunResult = fun ty -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> v_Vuna_dTypecheck_dfunResult b
  | _ -> ty)

let rec v_Vuna_dTypecheck_dfoldFun = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((a) :: (rest), body) -> C_Vuna_dTypecheck_dTFun (a, v_Vuna_dTypecheck_dfoldFun rest body)

let rec v_Vuna_dTypecheck_dseedPatTypes = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((p) :: (rest), st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedPatTypes rest st1 with
  | C_Vuna_dBase_dPair (tys, st2) -> C_Vuna_dBase_dPair ((ty) :: (tys), st2)))

let rec v_Vuna_dTypecheck_dseedLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], locals, st) -> C_Vuna_dBase_dPair ([], C_Vuna_dBase_dPair (locals, st))
  | ((name) :: (rest), locals, st) -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedLocals rest ((C_Vuna_dBase_dPair (name,
          ty)) :: (locals)) st1 with
  | C_Vuna_dBase_dPair (tys, C_Vuna_dBase_dPair (locals2, st2)) -> C_Vuna_dBase_dPair ((ty) :: (tys),
      C_Vuna_dBase_dPair (locals2, st2))))

let v_Vuna_dTypecheck_ddeclFunName = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> name
  | _ -> "")

let rec v_Vuna_dTypecheck_dupdateScheme = fun name sch env -> (match env with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, s)) :: (rest) -> if bi_eq n name then (C_Vuna_dBase_dPair (n, sch)) :: (rest)

  else (C_Vuna_dBase_dPair (n, s)) :: (v_Vuna_dTypecheck_dupdateScheme name sch rest))

let rec v_Vuna_dTypecheck_dfreeVarsEnvExcept = fun name env -> (match env with
  | [] -> []
  | (C_Vuna_dBase_dPair (n, sch)) :: (rest) -> if bi_eq n name then v_Vuna_dTypecheck_dfreeVarsEnvExcept
  name rest
  else v_Vuna_dTypecheck_dunionInts (v_Vuna_dTypecheck_dfreeVarsScheme sch) (v_Vuna_dTypecheck_dfreeVarsEnvExcept
    name rest))

let v_Vuna_dTypecheck_dsubstOf = fun a0 -> match a0 with
  | (C_Vuna_dTypecheck_dTC (n, s)) -> s

let rec v_Vuna_dTypecheck_dreplaceElab = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clauses, []) -> []
  | (name, clauses, (C_Vuna_dBase_dPair (n, old)) :: (rest)) -> if bi_eq_str n name then (C_Vuna_dBase_dPair
  (n, clauses)) :: (rest)
else (C_Vuna_dBase_dPair (n, old)) :: (v_Vuna_dTypecheck_dreplaceElab name clauses rest)

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
                        :: ([])))))))))))))))))))))

let rec v_Vuna_dCodegen_dfindBuiltin = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) :: (rest)) -> if bi_eq_str vname
name then C_Vuna_dBase_dJust (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body))
else v_Vuna_dCodegen_dfindBuiltin name rest

let rec v_Vuna_dCodegen_djoinList = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (sep) in
    (let vuna_cat2' = (v_Vuna_dCodegen_djoinList sep rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCodegen_dheadOf = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: (rest)) -> x

let rec v_Vuna_dCodegen_dnthList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> ""
  | (n, (x) :: (rest)) -> if bi_eq_int n 0 then x
else v_Vuna_dCodegen_dnthList (bi_sub n 1) rest

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

let rec v_Vuna_dCodegen_dmakeParamsFrom = fun i n -> if bi_gt_int i n then []
else ((("a") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeParams = fun n -> v_Vuna_dCodegen_dmakeParamsFrom 1 n

let rec v_Vuna_dCodegen_dmakeCtorParamsFrom = fun i n -> if bi_gt_int i n then []
else ((("c") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeCtorParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeCtorParams = fun n -> v_Vuna_dCodegen_dmakeCtorParamsFrom 1 n

let v_Vuna_dEval_dexpectBoolValue = fun v -> (match v with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (v)
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (v)
  | _ -> C_Vuna_dBase_dErr ("expected a Bool"))

let v_Vuna_dEval_dintArg = fun v -> (match v with
  | C_Vuna_dEval_dVInt (n) -> C_Vuna_dBase_dOk (n)
  | _ -> C_Vuna_dBase_dErr ("expected an Int argument"))

let v_Vuna_dEval_dstringArg = fun v -> (match v with
  | C_Vuna_dEval_dVStr (s) -> C_Vuna_dBase_dOk (s)
  | _ -> C_Vuna_dBase_dErr ("expected a String argument"))

let v_Vuna_dEval_dvbool = fun b -> if b then C_Vuna_dEval_dVCon ("True", [])
else C_Vuna_dEval_dVCon ("False", [])

let rec v_Vuna_dEval_dcharsToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((c) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVInt (c)) :: ((v_Vuna_dEval_dcharsToValue
      rest) :: ([])))

let v_Vuna_dEval_dstringToValue = fun s -> v_Vuna_dEval_dcharsToValue (bi_str_unpack s)

let rec v_Vuna_dEval_dstrListToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((s) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVStr (s)) :: ((v_Vuna_dEval_dstrListToValue
      rest) :: ([])))

let v_Vuna_dEval_deqBuiltin = fun args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_eq_int a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_eq_str a b))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for =="))

let v_Vuna_dEval_dneqBuiltin = fun args -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_neq_int a b))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool
    (bi_neq_str a b))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for /="))

let v_Vuna_dEval_dandBuiltin = fun args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> C_Vuna_dBase_dErr ("expected a Bool"))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> C_Vuna_dBase_dErr ("expected a Bool"))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for &&"))

let v_Vuna_dEval_dorBuiltin = fun args -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> C_Vuna_dBase_dErr ("expected a Bool"))
  | _ -> C_Vuna_dBase_dErr ("expected a Bool"))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for ||"))

let rec v_Vuna_dEval_dshowStringChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> if bi_eq_int c 34 then (("\\\"") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 92 then (("\\\\") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 10 then (("\\n") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 9 then (("\\t") ^ (v_Vuna_dEval_dshowStringChars rest))
else if bi_eq_int c 13 then (("\\r") ^ (v_Vuna_dEval_dshowStringChars rest))
else ((bi_str_pack ((c) :: ([]))) ^ (v_Vuna_dEval_dshowStringChars rest))

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
  | (C_Vuna_dAst_dImport (name, isQualified, alias)) -> name

let v_Vuna_dLoader_dimportIsQualified = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias)) -> isQualified

let v_Vuna_dLoader_dimportAlias = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias)) -> alias

let rec v_Vuna_dLoader_dimportAliases = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> (match v_Vuna_dLoader_dimportAlias imp with
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dimportAliases rest
  | C_Vuna_dBase_dJust (alias) -> (C_Vuna_dBase_dPair (alias, v_Vuna_dLoader_dimportName imp)) :: (v_Vuna_dLoader_dimportAliases
      rest)))

let rec v_Vuna_dLoader_dopenModuleNames = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> if v_Vuna_dLoader_dimportIsQualified imp then v_Vuna_dLoader_dopenModuleNames rest

  else (v_Vuna_dLoader_dimportName imp) :: (v_Vuna_dLoader_dopenModuleNames rest))

let rec v_Vuna_dLoader_dfindImportPrefix = fun imports prefix -> (match imports with
  | [] -> C_Vuna_dBase_dNothing
  | (imp) :: (rest) -> if bi_eq_str (v_Vuna_dLoader_dimportName imp) prefix then C_Vuna_dBase_dJust (v_Vuna_dLoader_dimportName
    imp)
  else (match v_Vuna_dLoader_dimportAlias imp with
  | C_Vuna_dBase_dJust (alias) -> if bi_eq_str alias prefix then C_Vuna_dBase_dJust (v_Vuna_dLoader_dimportName
      imp)
    else v_Vuna_dLoader_dfindImportPrefix rest prefix
  | C_Vuna_dBase_dNothing -> v_Vuna_dLoader_dfindImportPrefix rest prefix))

let rec v_Vuna_dLoader_djoinNames = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (", ") in
    (let vuna_cat2' = (v_Vuna_dLoader_djoinNames rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dLoader_dfindModule = fun modules name -> (match modules with
  | [] -> C_Vuna_dBase_dNothing
  | (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) :: (rest) -> if bi_eq_str mname name then
  C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports))
  else v_Vuna_dLoader_dfindModule rest name)

let v_Vuna_dLoader_dmoduleDecls = fun modules name -> (match v_Vuna_dLoader_dfindModule modules name with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) -> decls
  | C_Vuna_dBase_dNothing -> [])

let v_Vuna_dLoader_dexportsOf = fun modules name -> (match v_Vuna_dLoader_dfindModule modules name with
  | C_Vuna_dBase_dJust (C_Vuna_dLoader_dModule (mname, imports, decls, exports)) -> exports
  | C_Vuna_dBase_dNothing -> [])

let v_Vuna_dLoader_dtyShape = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (n) -> (("var ") ^ (n))
  | C_Vuna_dAst_dEApp (f, a) -> "app"
  | C_Vuna_dAst_dEInt (n) -> "int"
  | C_Vuna_dAst_dEStr (s) -> "str"
  | C_Vuna_dAst_dELam (ps, b) -> "lam"
  | C_Vuna_dAst_dELet (bs, b) -> "let"
  | C_Vuna_dAst_dECase (s, alts) -> "case"
  | C_Vuna_dAst_dEIf (c, t, e) -> "if")

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
  | (_) -> C_Vuna_dBase_dNothing

let v_Vuna_dLoader_disBuiltinName = fun name -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dBase_dJust (arity) -> true
  | C_Vuna_dBase_dNothing -> false)

let v_Vuna_dParser_dposOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> p

let v_Vuna_dParser_dtokOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> t

let v_Vuna_dParser_dpeekTok = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (toks, last)) -> (match toks with
  | (t) :: (rest) -> t
  | [] -> C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, C_Vuna_dLexer_dPos (1, 1)))

let v_Vuna_dParser_dpeekPos = fun st -> v_Vuna_dParser_dposOf (v_Vuna_dParser_dpeekTok st)

let v_Vuna_dParser_dlastPos = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (toks, last)) -> last

let v_Vuna_dParser_dadvance = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (toks, last)) -> (match toks with
  | (t) :: (rest) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> C_Vuna_dParser_dPState (toks, last)
  | _ -> C_Vuna_dParser_dPState (rest, v_Vuna_dParser_dposOf t))
  | [] -> C_Vuna_dParser_dPState (toks, last))

let v_Vuna_dParser_disEof = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> true
  | _ -> false)

let v_Vuna_dParser_datSym = fun st s -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> bi_eq_str x s
  | _ -> false)

let v_Vuna_dParser_datKw = fun st k -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> bi_eq_str x k
  | _ -> false)

let v_Vuna_dParser_dcanContinue = fun st blockCol -> (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> (match v_Vuna_dParser_dlastPos st with
  | C_Vuna_dLexer_dPos (lastLine, lastCol) -> (if (bi_eq_int line lastLine) then true
      else (bi_gt_int col blockCol))))

let v_Vuna_dParser_dexpectSym = fun st s -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> if bi_eq_str x s then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
    (0, v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dErr ((("expected ") ^ (s)))
  | _ -> C_Vuna_dBase_dErr ((("expected ") ^ (s))))

let v_Vuna_dParser_dexpectKw = fun st k -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> if bi_eq_str x k then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
    (0, v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dErr ((("expected ") ^ (k)))
  | _ -> C_Vuna_dBase_dErr ((("expected ") ^ (k))))

let v_Vuna_dParser_dexpectIdent = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (x, v_Vuna_dParser_dadvance
      st))
  | _ -> C_Vuna_dBase_dErr ("expected identifier"))

let v_Vuna_dParser_dupperFirst = fun s -> (match bi_str_unpack s with
  | (c) :: (rest) -> (if (bi_ge_int c 65) then (bi_le_int c 90)
    else false)
  | [] -> false)

let v_Vuna_dParser_dstartsAtom = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("Type"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false)

let v_Vuna_dParser_dstartsPatternAtom = fun st -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false)

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

let v_Vuna_dParser_dopExpr = fun a0 -> match a0 with
  | ("::") -> C_Vuna_dAst_dEVar ("Cons")
  | (op) -> C_Vuna_dAst_dEVar (op)

let rec v_Vuna_dParser_dcountArrows = fun e -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->"), (x) :: ((rest) :: ([]))) -> bi_add 1 (v_Vuna_dParser_dcountArrows
    rest)
  | _ -> 0)

let v_Vuna_dParser_dterminatesExpression = fun tok -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (")"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("]"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (","), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("else"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("in"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("then"), p) -> true
  | _ -> false)

let v_Vuna_dParser_dbadCaseIndent = fun st altCol -> if v_Vuna_dParser_disEof st then false
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_gt_int col altCol then (match v_Vuna_dParser_dterminatesExpression
    (v_Vuna_dParser_dpeekTok st) with
  | true -> false
  | false -> true)
  else false)

let rec v_Vuna_dParser_dfoldCons = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dAst_dEVar ("Nil")
  | ((e) :: (rest)) -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("Cons"), (e) :: ((v_Vuna_dParser_dfoldCons
      rest) :: ([])))

let rec v_Vuna_dParser_dfoldPCon = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dAst_dPCon ("Nil", [])
  | ((p) :: (rest)) -> C_Vuna_dAst_dPCon ("Cons", (p) :: ((v_Vuna_dParser_dfoldPCon rest) :: ([])))

let v_Vuna_dLexer_dadvanceChar = fun a0 a1 -> match (a0, a1) with
  | (c, C_Vuna_dLexer_dPos (line, col)) -> if bi_eq_int c 10 then C_Vuna_dLexer_dPos (bi_add line 1, 1)

else C_Vuna_dLexer_dPos (line, bi_add col 1)

let v_Vuna_dLexer_disUpperChar = fun c -> (if (bi_ge_int c 65) then (bi_le_int c 90)
  else false)

let v_Vuna_dLexer_disLowerChar = fun c -> (if (bi_ge_int c 97) then (bi_le_int c 122)
  else false)

let v_Vuna_dLoader_disLowerTypeName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> v_Vuna_dLexer_disLowerChar c)

let v_Vuna_dLexer_disIdentStart = fun c -> (if ((if (v_Vuna_dLexer_disUpperChar c) then true
      else (v_Vuna_dLexer_disLowerChar c))) then true
  else (bi_eq_int c 95))

let v_Vuna_dLexer_disDigit = fun c -> (if (bi_ge_int c 48) then (bi_le_int c 57)
  else false)

let rec v_Vuna_dLoader_dallIdentChars = fun chars -> (match chars with
  | [] -> true
  | (c) :: (rest) -> if (if (v_Vuna_dLexer_disIdentStart c) then true
    else (v_Vuna_dLexer_disDigit c)) then v_Vuna_dLoader_dallIdentChars rest
  else false)

let v_Vuna_dLoader_dvalidSegment = fun seg -> (match bi_str_unpack seg with
  | [] -> false
  | (c) :: (rest) -> (if (v_Vuna_dLexer_disUpperChar c) then (v_Vuna_dLoader_dallIdentChars rest)
    else false))

let rec v_Vuna_dLoader_dallSegmentsValid = fun segs -> (match segs with
  | [] -> false
  | (seg) :: (rest) -> if v_Vuna_dLoader_dvalidSegment seg then (match rest with
  | [] -> true
  | _ -> v_Vuna_dLoader_dallSegmentsValid rest)
  else false)

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
        c p))))

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
  | C_Vuna_dBase_dOk (cs2) -> v_Vuna_dLexer_dskipTrivia cs2)
    else C_Vuna_dBase_dOk (cs)
  | [] -> C_Vuna_dBase_dOk (cs)))

let rec v_Vuna_dLexer_dcollectInt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disDigit c then v_Vuna_dLexer_dcollectInt
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) (bi_add (bi_mul acc 10) (bi_sub c 48))
else C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ((c) :: (rest), p))

let rec v_Vuna_dAst_dcollectClauses = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body) -> if bi_eq_str n name then (C_Vuna_dBase_dPair (pats, body)) ::
  (v_Vuna_dAst_dcollectClauses rest name)
  else v_Vuna_dAst_dcollectClauses rest name
  | _ -> v_Vuna_dAst_dcollectClauses rest name)

let v_Vuna_dAst_dclausesFor = fun decls name -> v_Vuna_dAst_dcollectClauses decls name

let v_Vuna_dAst_dctorName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity)) -> name

let v_Vuna_dAst_dctorType = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity)) -> ty

let rec v_Vuna_dAst_dtypeArity = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->"), (x) :: ((rest) :: ([]))) -> bi_add 1 (v_Vuna_dAst_dtypeArity
    rest)
  | _ -> 0)

let v_Vuna_dAst_dctorArityOf = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity)) -> arity

let rec v_Vuna_dCodegen_dctorPairs = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (C_Vuna_dBase_dPair (v_Vuna_dAst_dctorName c, v_Vuna_dAst_dctorArityOf c)) :: (v_Vuna_dCodegen_dctorPairs
  rest)

let rec v_Vuna_dAst_dlookupCtorArity = fun name ctors -> (match ctors with
  | [] -> C_Vuna_dBase_dNothing
  | (c) :: (rest) -> if bi_eq_str (v_Vuna_dAst_dctorName c) name then C_Vuna_dBase_dJust (v_Vuna_dAst_dctorArityOf
    c)
  else v_Vuna_dAst_dlookupCtorArity name rest)

let rec v_Vuna_dAst_dctorArity = fun name decls -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> (match v_Vuna_dAst_dlookupCtorArity name ctors with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dJust (arity)
  | C_Vuna_dBase_dNothing -> v_Vuna_dAst_dctorArity name rest)
  | _ -> v_Vuna_dAst_dctorArity name rest))

let rec v_Vuna_dCodegen_dcheckNoCtorFun = fun a0 a1 -> match (a0, a1) with
  | ([], decls) -> C_Vuna_dBase_dOk ([])
  | ((C_Vuna_dBase_dPair (name, clauses)) :: (rest), decls) -> (match v_Vuna_dAst_dctorArity name decls
  with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dErr ((("name is both a constructor and a function: ")
      ^ (name)))
  | C_Vuna_dBase_dNothing -> v_Vuna_dCodegen_dcheckNoCtorFun rest decls)

let v_Vuna_dAst_ddeclTypeNames = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (name) :: ([])
  | _ -> [])

let rec v_Vuna_dBase_dappend = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (xs), ys) -> (x) :: (v_Vuna_dBase_dappend xs ys)

let rec v_Vuna_dTypedCodegen_dconcatFlatten = fun e -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("++"), (a) :: ((b) :: ([]))) -> v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dconcatFlatten
    a) (v_Vuna_dTypedCodegen_dconcatFlatten b)
  | _ -> (e) :: ([]))

let rec v_Vuna_dCodegen_daddClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clause, []) -> (C_Vuna_dBase_dPair (name, (clause) :: ([]))) :: ([])
  | (name, clause, (C_Vuna_dBase_dPair (gname, clauses)) :: (rest)) -> if bi_eq_str gname name then (C_Vuna_dBase_dPair
  (gname, v_Vuna_dBase_dappend clauses ((clause) :: ([])))) :: (rest)
else (C_Vuna_dBase_dPair (gname, clauses)) :: (v_Vuna_dCodegen_daddClause name clause rest)

let rec v_Vuna_dCodegen_dgroupFunctionsLoop = fun a0 a1 -> match (a0, a1) with
  | ([], groups) -> groups
  | ((d) :: (rest), groups) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> v_Vuna_dCodegen_dgroupFunctionsLoop rest (v_Vuna_dCodegen_daddClause
    name (C_Vuna_dBase_dPair (pats, body)) groups)
  | _ -> v_Vuna_dCodegen_dgroupFunctionsLoop rest groups)

let v_Vuna_dCodegen_dgroupFunctions = fun decls -> v_Vuna_dCodegen_dgroupFunctionsLoop decls []

let rec v_Vuna_dCodegen_dallCtors = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> v_Vuna_dBase_dappend (v_Vuna_dCodegen_dctorPairs ctors)
  (v_Vuna_dCodegen_dallCtors rest)
  | _ -> v_Vuna_dCodegen_dallCtors rest)

let rec v_Vuna_dBase_dreverseOnto = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((x) :: (xs), acc) -> v_Vuna_dBase_dreverseOnto xs ((x) :: (acc))

let v_Vuna_dBase_dreverse = fun xs -> v_Vuna_dBase_dreverseOnto xs []

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
      p)))
else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
    p))

let rec v_Vuna_dLexer_dcollectOp = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc),
  C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disOpChar c then v_Vuna_dLexer_dcollectOp
(C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
else C_Vuna_dBase_dPair (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest),
    p))

let rec v_Vuna_dLexer_dscanString = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if bi_eq_int c 34 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
  (bi_str_pack (v_Vuna_dBase_dreverse acc), C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)))

else if bi_eq_int c 10 then C_Vuna_dBase_dErr ("unterminated string literal")
else if bi_eq_int c 92 then v_Vuna_dLexer_dscanEscape (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
    c p)) acc
else v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
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

let rec v_Vuna_dLexer_dlexChars = fun cs -> (match v_Vuna_dLexer_dskipTrivia cs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (cs2) -> (match cs2 with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p)) ::
      ([]))
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> v_Vuna_dLexer_dlexToken c rest p))
and v_Vuna_dLexer_dlexToken = fun c rest p -> if v_Vuna_dLexer_disIdentStart c then (match v_Vuna_dLexer_dcollectIdent
  (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (name, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (v_Vuna_dLexer_dclassifyIdent name,
          p)) :: (toks))))
else if v_Vuna_dLexer_disDigit c then (match v_Vuna_dLexer_dcollectInt (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) (bi_sub c 48) with
  | C_Vuna_dBase_dPair (n, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p)) ::
      (toks))))
else if bi_eq_int c 34 then (match v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) [] with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (s, cs2)) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p)) ::
      (toks))))
else if (if ((if ((if ((if (bi_eq_int c 40) then true
              else (bi_eq_int c 41))) then true
          else (bi_eq_int c 91))) then true
      else (bi_eq_int c 93))) then true
  else (bi_eq_int c 44)) then (match v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (bi_str_pack
          ((c) :: ([]))), p)) :: (toks)))
else if v_Vuna_dLexer_disOpChar c then (match v_Vuna_dLexer_dcollectOp (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar
      c p)) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (op, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (op), p)) ::
      (toks))))
else C_Vuna_dBase_dErr ("unexpected character")

let v_Vuna_dLexer_dlexSource = fun source -> v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (bi_str_unpack
    source, C_Vuna_dLexer_dPos (1, 1)))

let rec v_Vuna_dBase_dlength = fun a0 -> match a0 with
  | ([]) -> 0
  | ((x) :: (xs)) -> bi_add 1 (v_Vuna_dBase_dlength xs)

let rec v_Vuna_dCodegen_dcheckArities = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, expected, []) -> C_Vuna_dBase_dOk (expected)
  | (name, expected, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> if bi_eq_int (v_Vuna_dBase_dlength
  pats) expected then v_Vuna_dCodegen_dcheckArities name expected rest
else C_Vuna_dBase_dErr ((let vuna_cat0' = ("clauses for ") in
    (let vuna_cat1' = (name) in
      (let vuna_cat2' = (" have different arities") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dCodegen_darityOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("function ") in
    (let vuna_cat1' = (name) in
      (let vuna_cat2' = (" has no clauses") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (name, (C_Vuna_dBase_dPair (pats, body)) :: (rest)) -> v_Vuna_dCodegen_dcheckArities name (v_Vuna_dBase_dlength
  pats) rest

let v_Vuna_dEval_dapplyCtor = fun decls name args arg -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unknown constructor: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> if bi_ge_int (v_Vuna_dBase_dlength args) arity then C_Vuna_dBase_dErr
  ((let vuna_cat0' = ("constructor ") in
      (let vuna_cat1' = (name) in
        (let vuna_cat2' = (" cannot take more arguments") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  else C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, v_Vuna_dBase_dappend args ((arg) :: ([])))))

let rec v_Vuna_dEval_dmatchPatterns = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> C_Vuna_dBase_dJust ([])
  | ((p) :: (ps), (v) :: (vs)) -> (match v_Vuna_dEval_dmatchPattern p v with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs) -> (match v_Vuna_dEval_dmatchPatterns ps vs with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs2) -> C_Vuna_dBase_dJust (v_Vuna_dBase_dappend bs bs2)))
  | (_, _) -> C_Vuna_dBase_dNothing
and v_Vuna_dEval_dmatchPattern = fun p v -> (match p with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dJust ([])
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dJust ((C_Vuna_dBase_dPair (name, v)) :: ([]))
  | C_Vuna_dAst_dPInt (n) -> (match v with
  | C_Vuna_dEval_dVInt (m) -> if bi_eq_int n m then C_Vuna_dBase_dJust ([])
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing)
  | C_Vuna_dAst_dPStr (s) -> (match v with
  | C_Vuna_dEval_dVStr (t) -> if bi_eq_str s t then C_Vuna_dBase_dJust ([])
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing)
  | C_Vuna_dAst_dPCon (name, pats) -> (match v with
  | C_Vuna_dEval_dVCon (vname, vargs) -> if (if (bi_eq_str name vname) then (bi_eq_int (v_Vuna_dBase_dlength
          pats) (v_Vuna_dBase_dlength vargs))
      else false) then v_Vuna_dEval_dmatchPatterns pats vargs
    else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing))

let v_Vuna_dAst_dfunArity = fun name decls -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> C_Vuna_dBase_dNothing
  | (C_Vuna_dBase_dPair (pats, body)) :: (_) -> C_Vuna_dBase_dJust (v_Vuna_dBase_dlength pats))

let v_Vuna_dTypedCodegen_dzeroArgBody = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> (match v_Vuna_dAst_dclausesFor decls name with
  | (C_Vuna_dBase_dPair ([], body)) :: ([]) -> C_Vuna_dBase_dJust (body)
  | _ -> C_Vuna_dBase_dNothing)
  | _ -> C_Vuna_dBase_dNothing)

let rec v_Vuna_dBase_dmap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> (f x) :: (v_Vuna_dBase_dmap f xs)

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
  | _ -> v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc)))
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
  | _ -> v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc)))
else if (if (bi_eq_int c 32) then (bi_gt_int col 100)
  else false) then (let width = v_Vuna_dTypedCodegen_dindentWidth depth in
  v_Vuna_dTypedCodegen_dformatChars rest width depth false false 32 (v_Vuna_dTypedCodegen_demitStr ((("\n")
        ^ (v_Vuna_dTypedCodegen_dindentSpaces width))) (v_Vuna_dTypedCodegen_dtrimTrailing acc)))
else v_Vuna_dTypedCodegen_dformatChars rest (bi_add col 1) depth false false c ((c) :: (acc))

let v_Vuna_dTypedCodegen_dformatOutput = fun s -> bi_str_pack (v_Vuna_dBase_dreverse (v_Vuna_dTypedCodegen_dtrimTrailing
    (v_Vuna_dTypedCodegen_dformatChars (bi_str_unpack s) 0 0 false false 0 [])))

let rec v_Vuna_dTypecheck_dresolveTy = fun s ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match v_Vuna_dTypecheck_dlookupSubst i s with
  | C_Vuna_dBase_dJust (t) -> v_Vuna_dTypecheck_dresolveTy s t
  | C_Vuna_dBase_dNothing -> ty)
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dresolveTy
      s) args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dresolveTy s a, v_Vuna_dTypecheck_dresolveTy
    s b))

let rec v_Vuna_dTypecheck_doccursIn = fun i s ty -> (match v_Vuna_dTypecheck_dresolveTy s ty with
  | C_Vuna_dTypecheck_dTVar (j) -> bi_eq_int i j
  | C_Vuna_dTypecheck_dTCon (n, args) -> v_Vuna_dTypecheck_doccursInArgs i s args
  | C_Vuna_dTypecheck_dTFun (a, b) -> (if (v_Vuna_dTypecheck_doccursIn i s a) then true
    else (v_Vuna_dTypecheck_doccursIn i s b)))
and v_Vuna_dTypecheck_doccursInArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, s, []) -> false
  | (i, s, (ty) :: (rest)) -> (if (v_Vuna_dTypecheck_doccursIn i s ty) then true
  else (v_Vuna_dTypecheck_doccursInArgs i s rest))

let rec v_Vuna_dTypecheck_drenameTy = fun mapping ty -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match v_Vuna_dTypecheck_dlookupSubst i mapping with
  | C_Vuna_dBase_dJust (t) -> t
  | C_Vuna_dBase_dNothing -> ty)
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_drenameTy
      mapping) args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_drenameTy mapping a,
    v_Vuna_dTypecheck_drenameTy mapping b))

let v_Vuna_dTypecheck_dinstantiate = fun a0 a1 -> match (a0, a1) with
  | (st, C_Vuna_dTypecheck_dScheme (qs, ty)) -> (match v_Vuna_dTypecheck_dinstantiateVars qs st with
  | C_Vuna_dBase_dPair (mapping, st2) -> C_Vuna_dBase_dPair (v_Vuna_dTypecheck_drenameTy mapping ty, st2))

let v_Vuna_dTypecheck_dfinalizeScheme = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dTypecheck_dScheme (qs, ty)) -> C_Vuna_dTypecheck_dScheme (qs, v_Vuna_dTypecheck_dresolveTy
  subst ty)

let rec v_Vuna_dTypecheck_dfinalizeGlobals = fun subst globals -> (match globals with
  | [] -> []
  | (C_Vuna_dBase_dPair (name, sch)) :: (rest) -> (C_Vuna_dBase_dPair (name, v_Vuna_dTypecheck_dfinalizeScheme
      subst sch)) :: (v_Vuna_dTypecheck_dfinalizeGlobals subst rest))

let v_Vuna_dLoader_dimportModuleNames = fun imports -> v_Vuna_dBase_dmap v_Vuna_dLoader_dimportName imports

let v_Vuna_dAst_ddeclNames = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> (name) :: ([])
  | C_Vuna_dAst_dDSig (name, ty) -> (name) :: ([])
  | C_Vuna_dAst_dDData (dname, params, ctors) -> v_Vuna_dBase_dmap v_Vuna_dAst_dctorName ctors)

let v_Vuna_dAst_ddeclCtors = fun d -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> v_Vuna_dBase_dmap v_Vuna_dAst_dctorName ctors
  | _ -> [])

let rec v_Vuna_dBase_dtraverse = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (xs)) -> (match f x with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (y) -> (match v_Vuna_dBase_dtraverse f xs with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (ys) -> C_Vuna_dBase_dOk ((y) :: (ys))))

let v_Vuna_dBase_dandThen = fun r f -> (match r with
  | C_Vuna_dBase_dOk (x) -> f x
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e))

let rec v_Vuna_dTypedCodegen_dmapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (rest)) -> v_Vuna_dBase_dandThen (f x) (fun y -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
    f rest) (fun ys -> C_Vuna_dBase_dOk ((y) :: (ys))))

let rec v_Vuna_dEval_dvalueToChars = fun v -> (match v with
  | C_Vuna_dEval_dVCon ("Nil", []) -> C_Vuna_dBase_dOk ([])
  | C_Vuna_dEval_dVCon ("Cons", (head) :: ((tail) :: ([]))) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg
    head) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dvalueToChars tail) (fun rest -> C_Vuna_dBase_dOk
      ((n) :: (rest))))
  | _ -> C_Vuna_dBase_dErr ("strPack expects a List Int"))

let v_Vuna_dEval_dint2 = fun args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dintArg b) (fun y -> f x y))
  | _ -> C_Vuna_dBase_dErr ("bad arguments"))

let v_Vuna_dEval_dstr2 = fun args f -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dstringArg b) (fun y -> f x y))
  | _ -> C_Vuna_dBase_dErr ("bad arguments"))

let v_Vuna_dEval_ddivideBuiltin = fun args -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg a) (fun x -> v_Vuna_dBase_dandThen
    (v_Vuna_dEval_dintArg b) (fun y -> if bi_eq_int y 0 then C_Vuna_dBase_dErr ("division by zero")
      else C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_div x y))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for /"))

let v_Vuna_dEval_dcallBuiltin = fun name args -> (match name with
  | "+" -> v_Vuna_dEval_dint2 args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_add x y)))
  | "-" -> v_Vuna_dEval_dint2 args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_sub x y)))
  | "*" -> v_Vuna_dEval_dint2 args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_mul x y)))
  | "/" -> v_Vuna_dEval_ddivideBuiltin args
  | "==" -> v_Vuna_dEval_deqBuiltin args
  | "/=" -> v_Vuna_dEval_dneqBuiltin args
  | "<" -> v_Vuna_dEval_dint2 args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_lt_int x y)))
  | "<=" -> v_Vuna_dEval_dint2 args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_le_int x y)))
  | ">" -> v_Vuna_dEval_dint2 args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_gt_int x y)))
  | ">=" -> v_Vuna_dEval_dint2 args (fun x y -> C_Vuna_dBase_dOk (v_Vuna_dEval_dvbool (bi_ge_int x y)))
  | "&&" -> v_Vuna_dEval_dandBuiltin args
  | "||" -> v_Vuna_dEval_dorBuiltin args
  | "++" -> v_Vuna_dEval_dstr2 args (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr (((x) ^ (y)))))
  | "strLength" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_str_length s)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strLength"))
  | "strUnpack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg a) (fun s -> C_Vuna_dBase_dOk (v_Vuna_dEval_dstringToValue
        s))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strUnpack"))
  | "strPack" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dvalueToChars a) (fun cs -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (bi_str_pack cs)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strPack"))
  | "strFromInt" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dintArg a) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (bi_str_from_int n)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strFromInt"))
  | "readFile" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr
        (bi_read_file s)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for readFile"))
  | "writeFile" -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg a) (fun path -> v_Vuna_dBase_dandThen
      (v_Vuna_dEval_dstringArg b) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (bi_write_file path s))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for writeFile"))
  | "print" -> (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dstringArg a) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt
        (bi_print s)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for print"))
  | "getArgs" -> C_Vuna_dBase_dOk (v_Vuna_dEval_dstrListToValue (bi_get_args ()))
  | _ -> C_Vuna_dBase_dErr ((("unknown builtin: ") ^ (name))))

let v_Vuna_dEval_devalGlobalNonFun = fun decls name -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, []))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dBuiltins_dbuiltinArity name with
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then v_Vuna_dEval_dcallBuiltin name []
    else C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin (name, []))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unbound variable: ") ^ (name)))))

let v_Vuna_dEval_dapplyBuiltin = fun decls name args arg -> (match v_Vuna_dBuiltins_dbuiltinArity name
  with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unknown builtin: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (let args2 = v_Vuna_dBase_dappend args ((arg) :: ([])) in
    if bi_lt_int (v_Vuna_dBase_dlength args2) arity then C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin (name,
        args2))
    else if bi_eq_int (v_Vuna_dBase_dlength args2) arity then v_Vuna_dEval_dcallBuiltin name args2
    else C_Vuna_dBase_dErr ((("too many arguments for builtin ") ^ (name)))))

let v_Vuna_dBase_dstep = fun r k -> (match r with
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (x, st)) -> k x st
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e))

let v_Vuna_dParser_dparseImportAlias = fun st isQualified -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
  st) (fun name st1 -> if v_Vuna_dParser_datKw st1 "as" then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw
    st1 "as") (fun _u st2 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st2) (fun alias st3 -> C_Vuna_dBase_dOk
      (C_Vuna_dBase_dPair (C_Vuna_dAst_dImport (name, isQualified, C_Vuna_dBase_dJust (alias)), st3))))

  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dImport (name, isQualified, C_Vuna_dBase_dNothing),
      st1)))

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
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))

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
          ((rhs) :: ([]))), st2)))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st1)))
and v_Vuna_dParser_dparsePatternHead = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> if v_Vuna_dParser_dupperFirst name then v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparsePatternAtoms (v_Vuna_dParser_dadvance st) blockCol) (fun args st1 -> C_Vuna_dBase_dOk
    (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, args), st1)))
  else v_Vuna_dParser_dparsePatternAtom st blockCol
  | _ -> v_Vuna_dParser_dparsePatternAtom st blockCol)
and v_Vuna_dParser_dparsePatternAtoms = fun st blockCol -> if (if (v_Vuna_dParser_dstartsPatternAtom st)
  then (v_Vuna_dParser_dcanContinue st blockCol)
  else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternAtom st blockCol) (fun pat st1 -> v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparsePatternAtoms st1 blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
      ((pat) :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparsePatternAtom = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent ("_"), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild,
      v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> if v_Vuna_dParser_dupperFirst name then C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, []), v_Vuna_dParser_dadvance st))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPInt
      (n), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPStr
      (s), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    (v_Vuna_dParser_dadvance st) blockCol) (fun inner st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
      st1 ")") (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (inner, st2))))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> v_Vuna_dParser_dparseListPattern st blockCol
  | _ -> C_Vuna_dBase_dErr ("expected pattern"))
and v_Vuna_dParser_dparseListPattern = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
  st "[") (fun _u st1 -> if v_Vuna_dParser_datSym st1 "]" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon
      ("Nil", []), v_Vuna_dParser_dadvance st1))
  else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseListPatternElems st1 blockCol) (fun pats st2 -> C_Vuna_dBase_dOk
    (C_Vuna_dBase_dPair (v_Vuna_dParser_dfoldPCon pats, st2))))
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
            op, (lhs) :: ((rhs) :: ([]))))))
    else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st)))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st)))
and v_Vuna_dParser_dparseLhs = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("\\"), p) -> v_Vuna_dParser_dparseLambda st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("let"), p) -> v_Vuna_dParser_dparseLet st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("case"), p) -> v_Vuna_dParser_dparseCase st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("if"), p) -> v_Vuna_dParser_dparseIf st blockCol
  | _ -> v_Vuna_dParser_dparseApplication st blockCol)
and v_Vuna_dParser_dparseApplication = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAtom
  st blockCol) (fun first st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseArgs st1 blockCol) (fun args
    st2 -> (match args with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (first, st2))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEApp (first, args), st2)))))
and v_Vuna_dParser_dparseArgs = fun st blockCol -> if (if (v_Vuna_dParser_dstartsAtom st) then (v_Vuna_dParser_dcanContinue
    st blockCol)
  else false) then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAtom st blockCol) (fun arg st1 -> v_Vuna_dBase_dstep
  (v_Vuna_dParser_dparseArgs st1 blockCol) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((arg)
        :: (rest), st2))))
else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparseAtom = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar
      (name), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEInt
      (n), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEStr
      (s), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("Type"), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar
      ("Type"), v_Vuna_dParser_dadvance st))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr
    (v_Vuna_dParser_dadvance st) blockCol 0) (fun inner st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
      st1 ")") (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (inner, st2))))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> v_Vuna_dParser_dparseListExpr st blockCol
  | _ -> C_Vuna_dBase_dErr ("expected expression"))
and v_Vuna_dParser_dparseListExpr = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st
  "[") (fun _u st1 -> if v_Vuna_dParser_datSym st1 "]" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar
      ("Nil"), v_Vuna_dParser_dadvance st1))
  else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseListExprElems st1 blockCol) (fun elems st2 -> C_Vuna_dBase_dOk
    (C_Vuna_dBase_dPair (v_Vuna_dParser_dfoldCons elems, st2))))
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
          st5 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dELam (params, body), st5)))))))
and v_Vuna_dParser_dparseLet = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "let")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseLetBindings st1 blockCol) (fun binds st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dexpectKw st2 "in") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st3
        blockCol 0) (fun body st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dELet (binds, body),
            st4))))))
and v_Vuna_dParser_dparseLetBindings = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dErr
("expected a let binding")
else if v_Vuna_dParser_datKw st "in" then C_Vuna_dBase_dErr ("expected a let binding")
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_le_int col blockCol then C_Vuna_dBase_dErr ("let binding is not indented enough")

  else v_Vuna_dParser_dparseLetBindingsAt st col)
and v_Vuna_dParser_dparseLetBindingsAt = fun st declCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else if v_Vuna_dParser_datKw st "in" then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_eq_int col declCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    st declCol) (fun pat st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun _u st2 ->
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 declCol 0) (fun value st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dparseLetBindingsAt st3 declCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            ((C_Vuna_dBase_dPair (pat, value)) :: (rest), st4))))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))
and v_Vuna_dParser_dparseCase = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "case")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun scrut st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dexpectKw st2 "of") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseCaseAlts
        st3 blockCol) (fun alts st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dECase (scrut,
              alts), st4))))))
and v_Vuna_dParser_dparseCaseAlts = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dErr
("case expression needs an alternative")
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_le_int col blockCol then C_Vuna_dBase_dErr ("case alternative is not indented enough")

  else v_Vuna_dBase_dstep (v_Vuna_dParser_dparseAltList st col) (fun alts st2 -> if v_Vuna_dParser_dbadCaseIndent
    st2 col then C_Vuna_dBase_dErr ("unexpected indentation after case alternative")
    else (match alts with
  | [] -> C_Vuna_dBase_dErr ("case expression needs an alternative")
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (alts, st2)))))
and v_Vuna_dParser_dparseAltList = fun st altCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_eq_int col altCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparsePatternSingle
    st altCol) (fun pat st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=>") (fun _u st2 ->
      v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 altCol 0) (fun body st3 -> v_Vuna_dBase_dstep
        (v_Vuna_dParser_dparseAltList st3 altCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            ((C_Vuna_dBase_dPair (pat, body)) :: (rest), st4))))))
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))
and v_Vuna_dParser_dparseIf = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "if")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun cond st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dexpectKw st2 "then") (fun _u st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr
        st3 blockCol 0) (fun yes st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st4 "else") (fun
          _u st5 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st5 blockCol 0) (fun no st6 -> C_Vuna_dBase_dOk
            (C_Vuna_dBase_dPair (C_Vuna_dAst_dEIf (cond, yes, no), st6))))))))

let v_Vuna_dParser_dparseSignature = fun st blockCol name -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
  st ":") (fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st1 blockCol 0) (fun ty st2 ->
    C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDSig (name, ty), st2))))

let v_Vuna_dParser_dparseClause = fun st blockCol name -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseClausePatterns
  st blockCol) (fun pats st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 "=") (fun _u st2 ->
    v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st2 blockCol 0) (fun body st3 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dAst_dDFun (name, pats, body), st3)))))

let rec v_Vuna_dParser_dparseCtorList = fun st ctorCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_eq_int col ctorCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent
    st) (fun name st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym st1 ":") (fun _u st2 -> v_Vuna_dBase_dstep
      (v_Vuna_dParser_dparseExpr st2 ctorCol 0) (fun ty st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseCtorList
          st3 ctorCol) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dAst_dCtor (name,
                  ty, v_Vuna_dParser_dcountArrows ty)) :: (rest), st4))))))
  else if bi_gt_int col ctorCol then C_Vuna_dBase_dErr ("unexpected indentation in data block")
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))

let v_Vuna_dParser_dparseCtors = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_gt_int col blockCol then v_Vuna_dParser_dparseCtorList st
  col
  else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))

let v_Vuna_dParser_dparseData = fun st blockCol -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st "data")
(fun _u st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectIdent st1) (fun name st2 -> v_Vuna_dBase_dstep
    (v_Vuna_dParser_dparseParams st2) (fun params st3 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectSym
        st3 ":") (fun _u st4 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseExpr st4 blockCol 0) (fun ty
          st5 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dexpectKw st5 "where") (fun _u st6 -> v_Vuna_dBase_dstep
            (v_Vuna_dParser_dparseCtors st6 blockCol) (fun ctors st7 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
                (C_Vuna_dAst_dDData (name, params, ctors), st7)))))))))

let v_Vuna_dParser_dparseDecl = fun st blockCol -> (match v_Vuna_dParser_dpeekTok st with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("data"), p) -> v_Vuna_dParser_dparseData st blockCol
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = v_Vuna_dParser_dadvance st in
    if v_Vuna_dParser_datSym st1 ":" then v_Vuna_dParser_dparseSignature st1 blockCol name
    else v_Vuna_dParser_dparseClause st1 blockCol name)
  | _ -> C_Vuna_dBase_dErr ("expected a top-level declaration"))

let rec v_Vuna_dParser_dparseDecls = fun st blockCol -> if v_Vuna_dParser_disEof st then C_Vuna_dBase_dOk
(C_Vuna_dBase_dPair ([], st))
else (match v_Vuna_dParser_dpeekPos st with
  | C_Vuna_dLexer_dPos (line, col) -> if bi_eq_int col blockCol then v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecl
    st blockCol) (fun decl st1 -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecls st1 blockCol) (fun rest
      st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((decl) :: (rest), st2))))
  else C_Vuna_dBase_dErr ((("expected a declaration at column ") ^ (bi_str_from_int blockCol))))

let v_Vuna_dParser_dparseProgram = fun st -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseImports st) (fun
  imports st1 -> if v_Vuna_dParser_disEof st1 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, []))

  else (match v_Vuna_dParser_dpeekPos st1 with
  | C_Vuna_dLexer_dPos (line, col) -> v_Vuna_dBase_dstep (v_Vuna_dParser_dparseDecls st1 col) (fun decls
      st2 -> if v_Vuna_dParser_disEof st2 then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, decls))

      else C_Vuna_dBase_dErr ("expected end of input"))))

let v_Vuna_dParser_dparseSource = fun source -> v_Vuna_dBase_dandThen (v_Vuna_dLexer_dlexSource source)
(fun toks -> v_Vuna_dParser_dparseProgram (C_Vuna_dParser_dPState (toks, C_Vuna_dLexer_dPos (1, 0))))

let rec v_Vuna_dBase_dconcatMap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (rest)) -> v_Vuna_dBase_dappend (f x) (v_Vuna_dBase_dconcatMap f rest)

let rec v_Vuna_dTypedCodegen_dpatVars = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild -> []
  | C_Vuna_dAst_dPVar (name) -> (name) :: ([])
  | C_Vuna_dAst_dPInt (n) -> []
  | C_Vuna_dAst_dPStr (s) -> []
  | C_Vuna_dAst_dPCon (name, pats) -> v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats)

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
                  vuna_cat6'])))))))))

let v_Vuna_dTypedCodegen_dpatParam = fun p -> (match p with
  | C_Vuna_dAst_dPVar (name) -> v_Vuna_dCodegen_dsanitizeName name
  | _ -> "_")

let v_Vuna_dCodegen_docamlString = fun s -> (let vuna_cat0' = ("\"") in
  (let vuna_cat1' = (bi_str_pack (v_Vuna_dBase_dconcatMap v_Vuna_dCodegen_descapeChar (bi_str_unpack
          s))) in
    (let vuna_cat2' = ("\"") in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dTypedCodegen_dgenPat = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk ("_")
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dOk (v_Vuna_dCodegen_dsanitizeName name)
  | C_Vuna_dAst_dPInt (n) -> C_Vuna_dBase_dOk (bi_str_from_int n)
  | C_Vuna_dAst_dPStr (s) -> C_Vuna_dBase_dOk (v_Vuna_dCodegen_docamlString s)
  | C_Vuna_dAst_dPCon (name, pats) -> (match name with
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
  | _ -> C_Vuna_dBase_dErr ("typed codegen: Cons pattern arity"))
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
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))))

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

let rec v_Vuna_dCodegen_dgenCtorDefs = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ("")
  | ((c) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenCtor c) (fun def -> v_Vuna_dBase_dandThen
  (v_Vuna_dCodegen_dgenCtorDefs rest) (fun restDefs -> C_Vuna_dBase_dOk (((def) ^ (restDefs)))))

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

let rec v_Vuna_dTypedCodegen_dallPureExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, seen, []) -> true
  | (decls, seen, (e) :: (rest)) -> (if (v_Vuna_dTypedCodegen_dpureExpr decls seen e) then (v_Vuna_dTypedCodegen_dallPureExpr
    decls seen rest)
  else false)
and v_Vuna_dTypedCodegen_dpureExpr = fun decls seen e -> (match e with
  | C_Vuna_dAst_dEInt (n) -> true
  | C_Vuna_dAst_dEStr (s) -> true
  | C_Vuna_dAst_dEVar (name) -> if v_Vuna_dBase_dmemName name seen then false
  else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (0) -> true
  | _ -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls name with
  | C_Vuna_dBase_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: (seen)) body
  | C_Vuna_dBase_dNothing -> false))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar ("++") -> (match v_Vuna_dTypedCodegen_dfoldStringLiterals (v_Vuna_dTypedCodegen_dconcatFlatten
        e) with
  | (C_Vuna_dAst_dEStr (_)) :: ([]) -> true
  | _ -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args)
  | C_Vuna_dAst_dEVar (name) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (_) -> v_Vuna_dTypedCodegen_dallPureExpr decls seen args
  | C_Vuna_dBase_dNothing -> false)
  | _ -> false)
  | _ -> false)

let v_Vuna_dTypedCodegen_disPureZeroArg = fun decls name -> (match v_Vuna_dTypedCodegen_dzeroArgBody decls
  name with
  | C_Vuna_dBase_dJust (body) -> v_Vuna_dTypedCodegen_dpureExpr decls ((name) :: ([])) body
  | C_Vuna_dBase_dNothing -> false)

let v_Vuna_dTypedCodegen_disAtomicExpr = fun decls env e -> (match e with
  | C_Vuna_dAst_dEVar (name) -> if v_Vuna_dBase_dmemName name env then true
  else (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then true
    else false
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dbuiltinName name with
  | C_Vuna_dBase_dJust (ref) -> if bi_eq_str name "getArgs" then false
      else true
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dTypedCodegen_disPureZeroArg decls name
  | C_Vuna_dBase_dJust (_) -> true
  | C_Vuna_dBase_dNothing -> false)))
  | C_Vuna_dAst_dEInt (n) -> true
  | C_Vuna_dAst_dEStr (s) -> true
  | _ -> false)

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

let v_Vuna_dTypedCodegen_dreverseAdj = fun names adj -> v_Vuna_dBase_dmap (fun n -> C_Vuna_dBase_dPair
  (n, v_Vuna_dTypedCodegen_ddependentsOf n adj)) names

let rec v_Vuna_dTypedCodegen_dfoldNeighborsPost = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], visited, order) -> C_Vuna_dBase_dPair (visited, order)
  | (adj, (m) :: (rest), visited, order) -> if v_Vuna_dBase_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsPost
adj rest visited order
else (match v_Vuna_dTypedCodegen_ddfsPost adj m ((m) :: (visited)) order with
  | C_Vuna_dBase_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dfoldNeighborsPost adj rest visited2
  order2)
and v_Vuna_dTypedCodegen_ddfsPost = fun adj n visited order -> (match v_Vuna_dTypedCodegen_dfoldNeighborsPost
  adj (v_Vuna_dTypedCodegen_dneighborsOf adj n) visited order with
  | C_Vuna_dBase_dPair (visited2, order2) -> C_Vuna_dBase_dPair (visited2, (n) :: (order2)))

let rec v_Vuna_dTypedCodegen_dpostOrder = fun adj nodes visited order -> (match nodes with
  | [] -> C_Vuna_dBase_dPair (visited, order)
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n visited then v_Vuna_dTypedCodegen_dpostOrder adj rest
  visited order
  else (match v_Vuna_dTypedCodegen_ddfsPost adj n ((n) :: (visited)) order with
  | C_Vuna_dBase_dPair (visited2, order2) -> v_Vuna_dTypedCodegen_dpostOrder adj rest visited2 order2))

let rec v_Vuna_dTypedCodegen_dfoldNeighborsCollect = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (revAdj, [], visited, comp) -> C_Vuna_dBase_dPair (visited, comp)
  | (revAdj, (m) :: (rest), visited, comp) -> if v_Vuna_dBase_dmemName m visited then v_Vuna_dTypedCodegen_dfoldNeighborsCollect
revAdj rest visited comp
else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj m ((m) :: (visited)) comp with
  | C_Vuna_dBase_dPair (visited2, comp2) -> v_Vuna_dTypedCodegen_dfoldNeighborsCollect revAdj rest visited2
  comp2)
and v_Vuna_dTypedCodegen_ddfsCollect = fun revAdj n visited comp -> (match v_Vuna_dTypedCodegen_dfoldNeighborsCollect
  revAdj (v_Vuna_dTypedCodegen_dneighborsOf revAdj n) visited comp with
  | C_Vuna_dBase_dPair (visited2, comp2) -> C_Vuna_dBase_dPair (visited2, (n) :: (comp2)))

let rec v_Vuna_dTypedCodegen_dcollectComps = fun revAdj nodes visited comps -> (match nodes with
  | [] -> comps
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n visited then v_Vuna_dTypedCodegen_dcollectComps revAdj
  rest visited comps
  else (match v_Vuna_dTypedCodegen_ddfsCollect revAdj n ((n) :: (visited)) [] with
  | C_Vuna_dBase_dPair (visited2, comp) -> v_Vuna_dTypedCodegen_dcollectComps revAdj rest visited2 ((comp)
      :: (comps))))

let rec v_Vuna_dTypedCodegen_dcomponentOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> C_Vuna_dBase_dNothing
  | ((g) :: (rest), name) -> if v_Vuna_dBase_dmemName name g then C_Vuna_dBase_dJust (g)
else v_Vuna_dTypedCodegen_dcomponentOf rest name

let rec v_Vuna_dTypedCodegen_dgroupsFromCompsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (comps, allNames, [], emitted) -> []
  | (comps, allNames, (n) :: (rest), emitted) -> if v_Vuna_dBase_dmemName n emitted then v_Vuna_dTypedCodegen_dgroupsFromCompsGo
comps allNames rest emitted
else (match v_Vuna_dTypedCodegen_dcomponentOf comps n with
  | C_Vuna_dBase_dJust (g) -> (v_Vuna_dTypedCodegen_dfilterNames (fun m -> v_Vuna_dBase_dmemName m g)
    allNames) :: (v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest (v_Vuna_dBase_dappend g
      emitted))
  | C_Vuna_dBase_dNothing -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo comps allNames rest emitted)

let v_Vuna_dTypedCodegen_dgroupsFromComps = fun comps names -> v_Vuna_dTypedCodegen_dgroupsFromCompsGo
comps names names []

let v_Vuna_dTypedCodegen_dgroupDeps = fun adj group -> v_Vuna_dTypedCodegen_dfilterNames (fun n -> v_Vuna_dTypedCodegen_dnotIn
  n group) (v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dBase_dconcatMap (v_Vuna_dTypedCodegen_dneighborsOf
      adj) group))

let rec v_Vuna_dTypedCodegen_dallIn = fun names allowed -> (match names with
  | [] -> true
  | (n) :: (rest) -> if v_Vuna_dBase_dmemName n allowed then v_Vuna_dTypedCodegen_dallIn rest allowed

  else false)

let v_Vuna_dTypedCodegen_dgroupReady = fun adj group emitted -> v_Vuna_dTypedCodegen_dallIn (v_Vuna_dTypedCodegen_dgroupDeps
  adj group) emitted

let rec v_Vuna_dTypedCodegen_dpickReadyAcc = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], before, emitted) -> C_Vuna_dBase_dNothing
  | (adj, (g) :: (rest), before, emitted) -> if v_Vuna_dTypedCodegen_dgroupReady adj g emitted then C_Vuna_dBase_dJust
(C_Vuna_dBase_dPair (g, v_Vuna_dBase_dappend (v_Vuna_dBase_dreverse before) rest))
else v_Vuna_dTypedCodegen_dpickReadyAcc adj rest ((g) :: (before)) emitted

let v_Vuna_dTypedCodegen_dpickReady = fun adj groups emitted -> v_Vuna_dTypedCodegen_dpickReadyAcc adj
groups [] emitted

let rec v_Vuna_dTypedCodegen_dorderGroupsAcc = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, [], emitted) -> C_Vuna_dBase_dOk ([])
  | (adj, remaining, emitted) -> (match v_Vuna_dTypedCodegen_dpickReady adj remaining emitted with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: dependency cycle between groups")
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (g, rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dorderGroupsAcc
    adj rest (v_Vuna_dBase_dappend g emitted)) (fun tail -> C_Vuna_dBase_dOk ((g) :: (tail))))

let v_Vuna_dTypedCodegen_dorderGroups = fun adj groups -> v_Vuna_dTypedCodegen_dorderGroupsAcc adj groups
[]

let rec v_Vuna_dTypedCodegen_dunionNames = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> if v_Vuna_dBase_dmemName x ys then v_Vuna_dTypedCodegen_dunionNames rest ys

else (x) :: (v_Vuna_dTypedCodegen_dunionNames rest ys)

let rec v_Vuna_dTypedCodegen_dexprRefs = fun expr -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> (name) :: ([])
  | C_Vuna_dAst_dEInt (n) -> []
  | C_Vuna_dAst_dEStr (s) -> []
  | C_Vuna_dAst_dEApp (fn, args) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs fn)
  (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dexprRefs args)
  | C_Vuna_dAst_dELam (params, body) -> v_Vuna_dTypedCodegen_dexprRefs body
  | C_Vuna_dAst_dELet (binds, body) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dbindRefs
    binds) (v_Vuna_dTypedCodegen_dexprRefs body)
  | C_Vuna_dAst_dECase (scrut, alts) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs
    scrut) (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_daltRefs alts)
  | C_Vuna_dAst_dEIf (c, t, e) -> v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs c)
  (v_Vuna_dTypedCodegen_dunionNames (v_Vuna_dTypedCodegen_dexprRefs t) (v_Vuna_dTypedCodegen_dexprRefs
      e)))
and v_Vuna_dTypedCodegen_dbindRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pat, value)) -> v_Vuna_dTypedCodegen_dexprRefs value
and v_Vuna_dTypedCodegen_daltRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dTypedCodegen_dexprRefs body

let v_Vuna_dTypedCodegen_dclauseRefs = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dTypedCodegen_dexprRefs body

let v_Vuna_dTypedCodegen_dgenFunctionRefs = fun decls name -> v_Vuna_dTypedCodegen_duniqueNames (v_Vuna_dBase_dconcatMap
  v_Vuna_dTypedCodegen_dclauseRefs (v_Vuna_dAst_dclausesFor decls name))

let v_Vuna_dTypedCodegen_dgroupNeedsRec = fun decls group -> (match group with
  | [] -> false
  | (n) :: ([]) -> v_Vuna_dBase_dmemName n (v_Vuna_dTypedCodegen_dgenFunctionRefs decls n)
  | _ -> true)

let v_Vuna_dTypedCodegen_dtypedMainCall = fun decls showMain printResult body -> if printResult then (let
  vuna_cat0' = (body) in
  (let vuna_cat1' = ("let () = print_endline (") in
    (let vuna_cat2' = (showMain) in
      (let vuna_cat3' = (" (") in
        (let vuna_cat4' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in
          (let vuna_cat5' = ("))\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))

else (let vuna_cat0' = (body) in
  (let vuna_cat1' = ("let () = ignore (") in
    (let vuna_cat2' = (v_Vuna_dTypedCodegen_dzeroArgRef decls "main") in
      (let vuna_cat3' = (")\n") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

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
          (C_Vuna_dBase_dPair ((ty) :: (tys), vars2), st2))))))
and v_Vuna_dTypecheck_dconvertType = fun typeNames vars st expr -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> if v_Vuna_dTypecheck_dknownTypeName typeNames name then C_Vuna_dBase_dOk
  (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, []), vars), st))
  else if v_Vuna_dTypecheck_disLowerName name then (match v_Vuna_dTypecheck_dlookupTyVar name vars with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars), st))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, (C_Vuna_dBase_dPair
              (name, ty)) :: (vars)), st2))))
  else C_Vuna_dBase_dErr ((("unknown type: ") ^ (name)))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar ("->") -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames vars st a)
      (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ta, vars1), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType
            typeNames vars1 st1 b) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tb, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair
                  (C_Vuna_dTypecheck_dTFun (ta, tb), vars2), st2))))))
  | _ -> C_Vuna_dBase_dErr ("invalid arrow type"))
  | C_Vuna_dAst_dEVar (name) -> if v_Vuna_dTypecheck_dknownTypeName typeNames name then v_Vuna_dBase_dandThen
    (v_Vuna_dTypecheck_dconvertTypes typeNames vars args st) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tys, vars1), st1) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, tys), vars1), st1))))
    else C_Vuna_dBase_dErr ((("unknown type constructor: ") ^ (name)))
  | _ -> C_Vuna_dBase_dErr ("invalid type application"))
  | _ -> C_Vuna_dBase_dErr ("invalid type expression"))

let v_Vuna_dTypecheck_dschemeOfSig = fun typeNames ty st -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType
  typeNames [] st ty) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dScheme
        (v_Vuna_dTypecheck_dvarIds vars, ty2), st2))))

let v_Vuna_dTypecheck_dschemeOfCtor = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, st, C_Vuna_dAst_dCtor (name, ty, arity)) -> (match v_Vuna_dTypecheck_dseedVars
  params st with
  | C_Vuna_dBase_dPair (vars, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dconvertType typeNames
    vars st1 ty) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dBase_dPair (name, C_Vuna_dTypecheck_dScheme (v_Vuna_dTypecheck_dvarIds vars2, ty2)),
          st2)))))

let rec v_Vuna_dTypecheck_dcollectSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDSig (name, ty) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dschemeOfSig typeNames ty
    st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (sch, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectSigs typeNames rest
        st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (sigs, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name,
                  sch)) :: (sigs), st2))))))
  | _ -> v_Vuna_dTypecheck_dcollectSigs typeNames rest st)

let rec v_Vuna_dTypecheck_dcollectCtorList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, params, (c) :: (rest), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dschemeOfCtor typeNames
  params st c) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (cname, sch), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtorList
      typeNames params rest st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (cname,
                sch)) :: (ctors), st2))))))

let rec v_Vuna_dTypecheck_dcollectCtors = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtorList
    typeNames params ctors st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (newCtors, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcollectCtors typeNames
        rest st1) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors2, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dappend newCtors
              ctors2, st2))))))
  | _ -> v_Vuna_dTypecheck_dcollectCtors typeNames rest st)

let rec v_Vuna_dTypecheck_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if bi_eq_str name "" then v_Vuna_dTypecheck_duniqueNames rest
else if v_Vuna_dBase_dmemName name rest then v_Vuna_dTypecheck_duniqueNames rest
else (name) :: (v_Vuna_dTypecheck_duniqueNames rest)

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
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unbound variable: ") ^ (name))))))

let rec v_Vuna_dLoader_dhasDuplicateName = fun a0 -> match a0 with
  | ([]) -> false
  | ((x) :: (rest)) -> if v_Vuna_dBase_dmemName x rest then true
else v_Vuna_dLoader_dhasDuplicateName rest

let rec v_Vuna_dLoader_dmodulesExportingFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> if v_Vuna_dBase_dmemName name (v_Vuna_dLoader_dexportsOf modules m) then (m) :: (v_Vuna_dLoader_dmodulesExportingFrom
    modules rest name)
  else v_Vuna_dLoader_dmodulesExportingFrom modules rest name)

let v_Vuna_dLoader_dmodulesExporting = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dLoader_dmodulesExportingCtorFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> if v_Vuna_dBase_dmemName name (v_Vuna_dLoader_dmoduleCtors modules m) then (m) ::
  (v_Vuna_dLoader_dmodulesExportingCtorFrom modules rest name)
  else v_Vuna_dLoader_dmodulesExportingCtorFrom modules rest name)

let v_Vuna_dLoader_dmodulesExportingCtor = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingCtorFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dLoader_dmodulesExportingTypeFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> if v_Vuna_dBase_dmemName name (v_Vuna_dLoader_dtypeExportsOf modules m) then (m)
  :: (v_Vuna_dLoader_dmodulesExportingTypeFrom modules rest name)
  else v_Vuna_dLoader_dmodulesExportingTypeFrom modules rest name)

let v_Vuna_dLoader_dmodulesExportingType = fun modules imports name -> v_Vuna_dLoader_dmodulesExportingTypeFrom
modules (v_Vuna_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dBase_dlookupPair = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (C_Vuna_dBase_dPair (k, v)) :: (rest)) -> if bi_eq_str k name then C_Vuna_dBase_dJust (v)
else v_Vuna_dBase_dlookupPair name rest

let rec v_Vuna_dTypecheck_drebuildDecls = fun a0 a1 -> match (a0, a1) with
  | ([], elabMap) -> []
  | ((d) :: (rest), elabMap) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> (match v_Vuna_dBase_dlookupPair name elabMap with
  | C_Vuna_dBase_dJust ((C_Vuna_dBase_dPair (pats2, body2)) :: (restElab)) -> (C_Vuna_dAst_dDFun (name,
        pats2, body2)) :: (v_Vuna_dTypecheck_drebuildDecls rest (v_Vuna_dTypecheck_dreplaceElab name restElab
        elabMap))
  | _ -> (d) :: (v_Vuna_dTypecheck_drebuildDecls rest elabMap))
  | _ -> (d) :: (v_Vuna_dTypecheck_drebuildDecls rest elabMap))

let rec v_Vuna_dEval_dforceValue = fun decls v -> (match v with
  | C_Vuna_dEval_dVFun (name, []) -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (0) -> v_Vuna_dEval_dcallFunction decls name []
  | _ -> C_Vuna_dBase_dOk (v))
  | _ -> C_Vuna_dBase_dOk (v))
and v_Vuna_dEval_devalVar = fun decls env name -> (match v_Vuna_dBase_dlookupPair name env with
  | C_Vuna_dBase_dJust (v) -> v_Vuna_dEval_dforceValue decls v
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_devalGlobal decls name)
and v_Vuna_dEval_devalGlobal = fun decls name -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then v_Vuna_dEval_dcallFunction decls name []
  else C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun (name, []))
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_devalGlobalNonFun decls name)
and v_Vuna_dEval_devalExpr = fun decls env expr -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> v_Vuna_dEval_devalVar decls env name
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (n))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr (s))
  | C_Vuna_dAst_dELam (params, body) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (params, body, env))
  | C_Vuna_dAst_dEApp (fn, args) -> v_Vuna_dEval_devalApp decls env fn args
  | C_Vuna_dAst_dELet (binds, body) -> v_Vuna_dEval_devalLet decls env binds body
  | C_Vuna_dAst_dECase (scrut, alts) -> v_Vuna_dEval_devalCase decls env scrut alts
  | C_Vuna_dAst_dEIf (c, t, e) -> v_Vuna_dEval_devalIf decls env c t e)
and v_Vuna_dEval_devalApp = fun decls env fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("&&") -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalAndShort decls env a b
  | _ -> v_Vuna_dEval_devalApply decls env fn args)
  | C_Vuna_dAst_dEVar ("||") -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dEval_devalOrShort decls env a b
  | _ -> v_Vuna_dEval_devalApply decls env fn args)
  | _ -> v_Vuna_dEval_devalApply decls env fn args)
and v_Vuna_dEval_devalApply = fun decls env fn args -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls
  env fn) (fun fv -> v_Vuna_dEval_dfoldApply decls env fv args)
and v_Vuna_dEval_devalAndShort = fun decls env a b -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls
  env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (av)
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun
      bv -> v_Vuna_dEval_dexpectBoolValue bv)
  | _ -> C_Vuna_dBase_dErr ("expected a Bool")))
and v_Vuna_dEval_devalOrShort = fun decls env a b -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls
  env a) (fun av -> (match av with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (av)
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env b) (fun
      bv -> v_Vuna_dEval_dexpectBoolValue bv)
  | _ -> C_Vuna_dBase_dErr ("expected a Bool")))
and v_Vuna_dEval_dfoldApply = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, fv, []) -> C_Vuna_dBase_dOk (fv)
  | (decls, env, fv, (arg) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls env arg)
(fun av -> v_Vuna_dBase_dandThen (v_Vuna_dEval_dapplyValue decls fv av) (fun fv2 -> v_Vuna_dEval_dfoldApply
    decls env fv2 rest))
and v_Vuna_dEval_devalLet = fun decls env binds body -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalBindings
  decls env binds) (fun env2 -> v_Vuna_dEval_devalExpr decls env2 body)
and v_Vuna_dEval_devalBindings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, []) -> C_Vuna_dBase_dOk (env)
  | (decls, env, (C_Vuna_dBase_dPair (pat, valueExpr)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env valueExpr) (fun v -> (match v_Vuna_dEval_dmatchPattern pat v with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("let pattern match failure")
  | C_Vuna_dBase_dJust (bs) -> v_Vuna_dEval_devalBindings decls (v_Vuna_dBase_dappend bs env) rest))
and v_Vuna_dEval_devalCase = fun decls env scrut alts -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr
  decls env scrut) (fun v -> v_Vuna_dEval_dchooseAlt decls env v alts)
and v_Vuna_dEval_dchooseAlt = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, v, []) -> C_Vuna_dBase_dErr ("case pattern match failure")
  | (decls, env, v, (C_Vuna_dBase_dPair (pat, body)) :: (rest)) -> (match v_Vuna_dEval_dmatchPattern pat
  v with
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_dchooseAlt decls env v rest
  | C_Vuna_dBase_dJust (bs) -> v_Vuna_dEval_devalExpr decls (v_Vuna_dBase_dappend bs env) body)
and v_Vuna_dEval_devalIf = fun decls env c t e -> v_Vuna_dBase_dandThen (v_Vuna_dEval_devalExpr decls
  env c) (fun cv -> (match cv with
  | C_Vuna_dEval_dVCon ("True", []) -> v_Vuna_dEval_devalExpr decls env t
  | C_Vuna_dEval_dVCon ("False", []) -> v_Vuna_dEval_devalExpr decls env e
  | _ -> C_Vuna_dBase_dErr ("if condition is not a Bool")))
and v_Vuna_dEval_dapplyValue = fun decls v arg -> (match v with
  | C_Vuna_dEval_dVFun (name, bound) -> v_Vuna_dEval_dapplyFun decls name bound arg
  | C_Vuna_dEval_dVLam (params, body, env) -> v_Vuna_dEval_dapplyLambda decls params body env arg
  | C_Vuna_dEval_dVCon (name, args) -> v_Vuna_dEval_dapplyCtor decls name args arg
  | C_Vuna_dEval_dVBuiltin (name, args) -> v_Vuna_dEval_dapplyBuiltin decls name args arg
  | _ -> C_Vuna_dBase_dErr ("cannot apply a non-function"))
and v_Vuna_dEval_dapplyFun = fun decls name bound arg -> (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unknown function: ") ^ (name)))
  | C_Vuna_dBase_dJust (arity) -> (let bound2 = v_Vuna_dBase_dappend bound ((arg) :: ([])) in
    if bi_lt_int (v_Vuna_dBase_dlength bound2) arity then C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun (name,
        bound2))
    else if bi_eq_int (v_Vuna_dBase_dlength bound2) arity then v_Vuna_dEval_dcallFunction decls name bound2

    else C_Vuna_dBase_dErr ((("too many arguments for ") ^ (name)))))
and v_Vuna_dEval_dapplyLambda = fun decls params body env arg -> (match params with
  | [] -> C_Vuna_dBase_dErr ("lambda has no parameters")
  | (p) :: ([]) -> v_Vuna_dEval_devalExpr decls ((C_Vuna_dBase_dPair (p, arg)) :: (env)) body
  | (p) :: (rest) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (rest, body, (C_Vuna_dBase_dPair (p, arg)) ::
      (env))))
and v_Vuna_dEval_dcallFunction = fun decls name args -> v_Vuna_dEval_dtryClauses decls name (v_Vuna_dAst_dclausesFor
  decls name) args
and v_Vuna_dEval_dtryClauses = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, name, [], args) -> C_Vuna_dBase_dErr ((("no matching clause for ") ^ (name)))
  | (decls, name, (C_Vuna_dBase_dPair (pats, body)) :: (rest), args) -> if bi_eq_int (v_Vuna_dBase_dlength
  pats) (v_Vuna_dBase_dlength args) then v_Vuna_dEval_dtryMatch decls name pats body rest args
else v_Vuna_dEval_dtryClauses decls name rest args
and v_Vuna_dEval_dtryMatch = fun decls name pats body rest args -> (match v_Vuna_dEval_dmatchPatterns
  pats args with
  | C_Vuna_dBase_dJust (binds) -> v_Vuna_dEval_devalExpr decls binds body
  | C_Vuna_dBase_dNothing -> v_Vuna_dEval_dtryClauses decls name rest args)

let v_Vuna_dEval_dinterpretMain = fun decls -> (match v_Vuna_dAst_dfunArity "main" decls with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")
  | C_Vuna_dBase_dJust (arity) -> if bi_eq_int arity 0 then v_Vuna_dEval_dcallFunction decls "main" []

  else C_Vuna_dBase_dErr ("`main` must be a nullary definition"))

let v_Vuna_dBase_dfirstOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (a, b)) -> a

let rec v_Vuna_dTypedCodegen_dgenArgs = fun decls env args -> v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenExpr
  decls env) args
and v_Vuna_dTypedCodegen_dconcatBindings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, i, []) -> C_Vuna_dBase_dOk ([])
  | (decls, env, i, (e) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env e)
(fun code -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dconcatBindings decls env (bi_add i 1) rest)
  (fun binds -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (v_Vuna_dTypedCodegen_dconcatBindingName i, code))
      :: (binds))))
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
  | C_Vuna_dAst_dEVar (name) -> if v_Vuna_dBase_dmemName name env then C_Vuna_dBase_dOk (v_Vuna_dCodegen_dsanitizeName
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
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unbound variable ") ^ (name))))))
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk (bi_str_from_int n)
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dtypedString s)
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar (name) -> (match v_Vuna_dAst_dctorArity name decls with
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
  | _ -> C_Vuna_dBase_dErr ("typed codegen: Cons arity"))
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
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
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
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args)
      else if bi_eq_str name "||" then (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env a) (fun ga
          -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env b) (fun gb -> C_Vuna_dBase_dOk
            ((let vuna_cat0' = ("(if (") in
                (let vuna_cat1' = (ga) in
                  (let vuna_cat2' = (") then true else (") in
                    (let vuna_cat3' = (gb) in
                      (let vuna_cat4' = ("))") in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args)
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
  | pieces -> v_Vuna_dTypedCodegen_dgenConcatN decls env pieces)
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args)
      else v_Vuna_dTypedCodegen_dgenCall decls env fn args)
  | _ -> v_Vuna_dTypedCodegen_dgenCall decls env fn args)
  | C_Vuna_dAst_dELam (params, body) -> (let env2 = v_Vuna_dBase_dappend params env in
    v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env2 body) (fun b -> C_Vuna_dBase_dOk
      ((let vuna_cat0' = ("fun ") in
          (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith " " (v_Vuna_dBase_dmap v_Vuna_dCodegen_dsanitizeName
                params)) in
            (let vuna_cat2' = (" -> ") in
              (let vuna_cat3' = (b) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
  | C_Vuna_dAst_dELet (binds, body) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenBinds decls env
    binds body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
        (let vuna_cat1' = (b) in
          (let vuna_cat2' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | C_Vuna_dAst_dECase (scrut, alts) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env
    scrut) (fun s -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenAlt
        decls env) alts) (fun arms -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(match ") in
          (let vuna_cat1' = (s) in
            (let vuna_cat2' = (" with\n") in
              (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith "\n" arms) in
                (let vuna_cat4' = (")") in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | C_Vuna_dAst_dEIf (c, t, e) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env c) (fun
    gc -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env t) (fun gt -> v_Vuna_dBase_dandThen
      (v_Vuna_dTypedCodegen_dgenExpr decls env e) (fun ge -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("if ")
            in
            (let vuna_cat1' = (gc) in
              (let vuna_cat2' = (" then ") in
                (let vuna_cat3' = (gt) in
                  (let vuna_cat4' = (" else ") in
                    (let vuna_cat5' = (ge) in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                      vuna_cat5'])))))))))))
and v_Vuna_dTypedCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenPat
  pat) (fun p -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls (v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dpatVars
        pat) env) body) (fun b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | ") in
        (let vuna_cat1' = (p) in
          (let vuna_cat2' = (" -> ") in
            (let vuna_cat3' = (b) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))
and v_Vuna_dTypedCodegen_dgenBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], body) -> v_Vuna_dTypedCodegen_dgenExpr decls env body
  | (decls, env, (C_Vuna_dBase_dPair (pat, value)) :: (rest), body) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenPat
  pat) (fun p -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls env value) (fun v -> v_Vuna_dBase_dandThen
    (v_Vuna_dTypedCodegen_dgenBinds decls (v_Vuna_dBase_dappend (v_Vuna_dTypedCodegen_dpatVars pat) env)
      rest body) (fun r -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("let ") in
          (let vuna_cat1' = (p) in
            (let vuna_cat2' = (" = ") in
              (let vuna_cat3' = (v) in
                (let vuna_cat4' = (" in ") in
                  (let vuna_cat5' = (r) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))))

let v_Vuna_dTypedCodegen_dgenClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, C_Vuna_dBase_dPair (pats, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
  v_Vuna_dTypedCodegen_dgenPat pats) (fun ps -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenExpr decls
    (v_Vuna_dBase_dappend (v_Vuna_dBase_dconcatMap v_Vuna_dTypedCodegen_dpatVars pats) env) body) (fun
    b -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("  | (") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith ", " ps) in
          (let vuna_cat2' = (") -> ") in
            (let vuna_cat3' = (b) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))))

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
                      (let vuna_cat5' = (v_Vuna_dTypedCodegen_djoinWith "\n" arms) in
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
                      (let vuna_cat5' = (v_Vuna_dTypedCodegen_djoinWith "\n" arms) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5']))))))))))))

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
                -> C_Vuna_dBase_dOk (((v_Vuna_dTypedCodegen_djoinWith "\n\n" parts) ^ ("\n")))))))))))

let v_Vuna_dTypecheck_dhasSig = fun name sigs -> v_Vuna_dBase_dmemName name (v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
  sigs)

let rec v_Vuna_dTypecheck_dseedPlaceholders = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], sigs, st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), sigs, st) -> if v_Vuna_dTypecheck_dhasSig name sigs then v_Vuna_dTypecheck_dseedPlaceholders
rest sigs st
else (match v_Vuna_dTypecheck_dfreshTy st with
  | C_Vuna_dBase_dPair (ty, st1) -> (match v_Vuna_dTypecheck_dseedPlaceholders rest sigs st1 with
  | C_Vuna_dBase_dPair (ps, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, C_Vuna_dTypecheck_dScheme
          ([], ty))) :: (ps), st2)))

let rec v_Vuna_dCodegen_dvalidateCtors = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ([])
  | ((C_Vuna_dBase_dPair (name, arity)) :: (rest)) -> if v_Vuna_dBase_dmemName name (v_Vuna_dBase_dmap
  v_Vuna_dBase_dfirstOf rest) then C_Vuna_dBase_dErr ((("duplicate constructor: ") ^ (name)))
else v_Vuna_dCodegen_dvalidateCtors rest

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
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))

let v_Vuna_dLoader_dvalidateImports = fun label imports -> if v_Vuna_dLoader_dhasDuplicateName (v_Vuna_dLoader_dimportModuleNames
  imports) then C_Vuna_dBase_dErr (((label) ^ (": duplicate import")))
else v_Vuna_dLoader_dcheckImportAliases label (v_Vuna_dLoader_dimportModuleNames imports) (v_Vuna_dLoader_dimportAliases
  imports)

let v_Vuna_dBase_dsecondOf = fun a0 -> match a0 with
  | (C_Vuna_dBase_dPair (a, b)) -> b

let rec v_Vuna_dCodegen_dgenPattern = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ("_", []))
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((("x_") ^ (v_Vuna_dCodegen_dsanitizeName
          name)), (name) :: ([])))
  | C_Vuna_dAst_dPInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((let vuna_cat0' = ("VInt (") in
        (let vuna_cat1' = (bi_str_from_int n) in
          (let vuna_cat2' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), []))
  | C_Vuna_dAst_dPStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((("VStr ") ^ (v_Vuna_dCodegen_docamlString
          s)), []))
  | C_Vuna_dAst_dPCon (name, pats) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse v_Vuna_dCodegen_dgenPattern
    pats) (fun parts -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dCodegen_dpconPattern name (v_Vuna_dBase_dmap
          v_Vuna_dBase_dfirstOf parts), v_Vuna_dBase_dconcatMap v_Vuna_dBase_dsecondOf parts))))

let rec v_Vuna_dCodegen_dgenLambda = fun decls scope params body -> (match params with
  | [] -> v_Vuna_dCodegen_dgenExpr decls scope body
  | (p) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenLambda decls ((p) :: (scope)) rest body)
  (fun inner -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VFun (\"\", fun x_") in
        (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName p) in
          (let vuna_cat2' = (" -> ") in
            (let vuna_cat3' = (inner) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenPattern
  pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (patCode, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dBase_dappend
        bound scope) body) (fun bodyCode -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("| ") in
          (let vuna_cat1' = (patCode) in
            (let vuna_cat2' = (" -> ") in
              (let vuna_cat3' = (bodyCode) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))))
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
                        vuna_cat5'; vuna_cat6'])))))))))))))
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
  | C_Vuna_dAst_dEVar ("&&") -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCodegen_dgenAndShort decls scope a b
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args)
  | C_Vuna_dAst_dEVar ("||") -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCodegen_dgenOrShort decls scope a b
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args)
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args)
and v_Vuna_dCodegen_dgenExpr = fun decls scope expr -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> v_Vuna_dCodegen_dgenVar decls scope name
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("VInt (") in
      (let vuna_cat1' = (bi_str_from_int n) in
        (let vuna_cat2' = (")") in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk ((("VStr ") ^ (v_Vuna_dCodegen_docamlString s)))
  | C_Vuna_dAst_dELam (params, body) -> v_Vuna_dCodegen_dgenLambda decls scope params body
  | C_Vuna_dAst_dEApp (fn, args) -> v_Vuna_dCodegen_dgenEApp decls scope fn args
  | C_Vuna_dAst_dELet (binds, body) -> v_Vuna_dCodegen_dgenLet decls scope binds body
  | C_Vuna_dAst_dECase (scrut, alts) -> v_Vuna_dCodegen_dgenCase decls scope scrut alts
  | C_Vuna_dAst_dEIf (c, t, e) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenExpr decls scope c) (fun
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
                        vuna_cat5'; vuna_cat6']))))))))))))

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
            C_Vuna_dBase_dOk (v_Vuna_dCodegen_dwrapFun name params matchCode 0)))))))

let rec v_Vuna_dCodegen_dgenFunctions = fun a0 a1 -> match (a0, a1) with
  | (decls, []) -> C_Vuna_dBase_dOk ([])
  | (decls, (C_Vuna_dBase_dPair (name, clauses)) :: (rest)) -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunction
  decls name clauses) (fun def -> v_Vuna_dBase_dandThen (v_Vuna_dCodegen_dgenFunctions decls rest) (fun
    defs -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (name, def)) :: (defs))))

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
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")))))

let rec v_Vuna_dBase_dmemChar = fun c chars -> (match chars with
  | [] -> false
  | (x) :: (rest) -> if bi_eq_int x c then true
  else v_Vuna_dBase_dmemChar c rest)

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

let rec v_Vuna_dBase_dsplitCharsOnDot = fun chars acc seg -> (match chars with
  | [] -> v_Vuna_dBase_dreverse ((bi_str_pack (v_Vuna_dBase_dreverse seg)) :: (acc))
  | (c) :: (rest) -> if bi_eq_int c 46 then v_Vuna_dBase_dsplitCharsOnDot rest ((bi_str_pack (v_Vuna_dBase_dreverse
        seg)) :: (acc)) []
  else v_Vuna_dBase_dsplitCharsOnDot rest acc ((c) :: (seg)))

let v_Vuna_dBase_dsplitOnDot = fun s -> v_Vuna_dBase_dsplitCharsOnDot (bi_str_unpack s) [] []

let v_Vuna_dLoader_dvalidModuleName = fun name -> (match v_Vuna_dBase_dsplitOnDot name with
  | [] -> false
  | segs -> v_Vuna_dLoader_dallSegmentsValid segs)

let v_Vuna_dBase_dsplitLastDot = fun parts -> (match v_Vuna_dBase_dreverse parts with
  | [] -> C_Vuna_dBase_dPair ([], "")
  | (last) :: (rest) -> C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse rest, last))

let v_Vuna_dTypedCodegen_dlastName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> base)

let v_Vuna_dTypedCodegen_disBoolName = fun name -> bi_eq_str (v_Vuna_dTypedCodegen_dlastName name) "Bool"

let v_Vuna_dTypedCodegen_disListName = fun name -> bi_eq_str (v_Vuna_dTypedCodegen_dlastName name) "List"

let rec v_Vuna_dTypedCodegen_dnonSpecialData = fun decls -> (match v_Vuna_dTypedCodegen_ddataDecls decls
  with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> if (if (v_Vuna_dTypedCodegen_disBoolName name) then true

      else (v_Vuna_dTypedCodegen_disListName name)) then v_Vuna_dTypedCodegen_dnonSpecialData rest
    else (d) :: (v_Vuna_dTypedCodegen_dnonSpecialData rest)
  | _ -> v_Vuna_dTypedCodegen_dnonSpecialData rest))

let rec v_Vuna_dTypedCodegen_docamlType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> if bi_eq_str name "Int" then C_Vuna_dBase_dOk ("int")
  else if bi_eq_str name "String" then C_Vuna_dBase_dOk ("string")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("bool")
  else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dBase_dErr ("List type needs an argument")

  else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (ty)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dtypeNameOf name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown type ") ^ (name)))))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar ("->") -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls params a) (fun
        ta -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls params b) (fun tb -> C_Vuna_dBase_dOk
          ((let vuna_cat0' = ("(") in
              (let vuna_cat1' = (ta) in
                (let vuna_cat2' = (") -> (") in
                  (let vuna_cat3' = (tb) in
                    (let vuna_cat4' = (")") in
                      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid arrow type"))
  | C_Vuna_dAst_dEVar (name) -> if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_docamlType decls params a) (fun ta -> C_Vuna_dBase_dOk
        ((let vuna_cat0' = ("(") in
            (let vuna_cat1' = (ta) in
              (let vuna_cat2' = (") list") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid List type"))
    else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown type constructor ") ^ (name)))
  | C_Vuna_dBase_dJust (d) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_docamlType
          decls params) args) (fun tys -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dappType tys (v_Vuna_dTypedCodegen_dtypeNameOf
            name))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type application"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type expression"))

let v_Vuna_dTypedCodegen_dgenCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dAst_dCtor (name, ty, arity)) -> (match v_Vuna_dTypedCodegen_dsplitArrows ty
  with
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
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))

let v_Vuna_dTypedCodegen_dgenData = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult
  (v_Vuna_dTypedCodegen_dgenCtor decls (v_Vuna_dTypedCodegen_dparamMap params)) ctors) (fun cs -> C_Vuna_dBase_dOk
  ((let vuna_cat0' = ("  ") in
      (let vuna_cat1' = (v_Vuna_dTypedCodegen_ddataPrefix params) in
        (let vuna_cat2' = (v_Vuna_dTypedCodegen_dtypeNameOf name) in
          (let vuna_cat3' = (" =\n    ") in
            (let vuna_cat4' = (v_Vuna_dTypedCodegen_djoinWith "\n  | " cs) in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))

let v_Vuna_dTypedCodegen_dgenTypeDecls = fun decls -> (match v_Vuna_dTypedCodegen_dnonSpecialData decls
  with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenData decls)
    ds) (fun parts -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("type ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in
          (let vuna_cat2' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))

let rec v_Vuna_dTypedCodegen_dshowForType = fun decls params expr -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> if bi_eq_str name "Int" then C_Vuna_dBase_dOk ("string_of_int")
  else if bi_eq_str name "String" then C_Vuna_dBase_dOk ("show_vstring")
  else if v_Vuna_dTypedCodegen_disBoolName name then C_Vuna_dBase_dOk ("show_vbool")
  else if v_Vuna_dTypedCodegen_disListName name then C_Vuna_dBase_dErr ("typed codegen: List type needs an argument")

  else (match v_Vuna_dTypedCodegen_dlookupParam name params with
  | C_Vuna_dBase_dJust (s) -> C_Vuna_dBase_dOk (s)
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dshowNameOf name)
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown show type ") ^ (name)))))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar ("->") -> C_Vuna_dBase_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dAst_dEVar (name) -> if v_Vuna_dTypedCodegen_disListName name then (match args with
  | (a) :: ([]) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForType decls params a) (fun sa ->
        C_Vuna_dBase_dOk ((let vuna_cat0' = ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (")
            in
            (let vuna_cat1' = (sa) in
              (let vuna_cat2' = (") x ^ \" \" ^ go xs ^ \")\" in go v)") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid List show type"))
    else (match v_Vuna_dTypedCodegen_dlookupData decls name with
  | C_Vuna_dBase_dJust (d) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForType
          decls params) args) (fun ss -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
            (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
              (let vuna_cat2' = (" ") in
                (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in
                  (let vuna_cat4' = (")") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("typed codegen: unknown show type constructor ") ^ (name))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type application"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type"))

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
  | _ -> C_Vuna_dBase_dErr ("typed codegen: main List type must have one argument"))
  else v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dshowForTy decls)
    args) (fun ss -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("(") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_dshowNameOf name) in
          (let vuna_cat2' = (" ") in
            (let vuna_cat3' = (v_Vuna_dTypedCodegen_djoinWith " " ss) in
              (let vuna_cat4' = (")") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))

let rec v_Vuna_dTypedCodegen_dgenShowFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, pmap, [], []) -> C_Vuna_dBase_dOk ([])
  | (decls, pmap, (f) :: (fs), (v) :: (vs)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForType
  decls pmap f) (fun s -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenShowFields decls pmap fs vs)
  (fun ss -> C_Vuna_dBase_dOk (((let vuna_cat0' = ("(") in
          (let vuna_cat1' = (s) in
            (let vuna_cat2' = (") ") in
              (let vuna_cat3' = (v) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (ss))))

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
                        vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8']))))))))))))

let v_Vuna_dTypedCodegen_dgenShowCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, C_Vuna_dAst_dCtor (name, ty, arity)) -> v_Vuna_dTypedCodegen_dgenShowCtorWith decls
pmap name (v_Vuna_dTypedCodegen_dsplitArrows ty)

let v_Vuna_dTypedCodegen_dgenShowFuncWith = fun decls pmap params name ctors -> v_Vuna_dBase_dandThen
(v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowCtor decls pmap) ctors) (fun arms -> v_Vuna_dTypedCodegen_dgenShowBody
  pmap params name arms)

let v_Vuna_dTypedCodegen_dgenShowFunc = fun a0 a1 -> match (a0, a1) with
  | (decls, C_Vuna_dAst_dDData (name, params, ctors)) -> v_Vuna_dTypedCodegen_dgenShowFuncWith decls (v_Vuna_dTypedCodegen_dshowParamMap
  params) params name ctors

let v_Vuna_dTypedCodegen_dgenShowDecls = fun decls -> (match v_Vuna_dTypedCodegen_dnonSpecialData decls
  with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dmapResult (v_Vuna_dTypedCodegen_dgenShowFunc decls)
    ds) (fun parts -> C_Vuna_dBase_dOk ((let vuna_cat0' = ("let rec ") in
        (let vuna_cat1' = (v_Vuna_dTypedCodegen_djoinWith "\nand " parts) in
          (let vuna_cat2' = ("\n") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))))

let v_Vuna_dTypedCodegen_dgenerateProgramTyped = fun decls globals printResult -> (match v_Vuna_dTypecheck_dlookupScheme
  "main" globals with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: no main definition")
  | C_Vuna_dBase_dJust (C_Vuna_dTypecheck_dScheme (qs, ty)) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dBase_dErr ("typed codegen: main must be zero-arity")
  | _ -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dshowForTy decls ty) (fun showMain -> v_Vuna_dBase_dandThen
      (v_Vuna_dTypedCodegen_dgenTypeDecls decls) (fun types -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenShowDecls
          decls) (fun shows -> v_Vuna_dBase_dandThen (v_Vuna_dTypedCodegen_dgenTop decls) (fun tops ->
            C_Vuna_dBase_dOk (v_Vuna_dTypedCodegen_dformatOutput (v_Vuna_dTypedCodegen_dtypedMainCall
                decls showMain printResult ((let vuna_cat0' = (v_Vuna_dTypedCodegen_druntimeCodeTyped)
                    in
                    (let vuna_cat1' = ("\n") in
                      (let vuna_cat2' = (types) in
                        (let vuna_cat3' = ("\n") in
                        (let vuna_cat4' = (shows) in
                        (let vuna_cat5' = ("\n") in
                        (let vuna_cat6' = (tops) in
                        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4';
                        vuna_cat5'; vuna_cat6']))))))))))))))))

let v_Vuna_dTypecheck_dshortTyName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (rev, base) -> base)

let v_Vuna_dTypecheck_dspecializeCmp = fun name ty -> (match ty with
  | C_Vuna_dTypecheck_dTCon (n, args) -> if bi_eq_str (v_Vuna_dTypecheck_dshortTyName n) "Int" then v_Vuna_dTypecheck_dintCmpName
  name
  else if bi_eq_str (v_Vuna_dTypecheck_dshortTyName n) "String" then v_Vuna_dTypecheck_dstrCmpName name

  else if bi_eq_str (v_Vuna_dTypecheck_dshortTyName n) "Bool" then v_Vuna_dTypecheck_dboolCmpName name

  else name
  | _ -> name)

let rec v_Vuna_dTypecheck_dlowerExpr = fun subst expr -> (match expr with
  | C_Vuna_dTypecheck_dXEVar (name) -> C_Vuna_dAst_dEVar (name)
  | C_Vuna_dTypecheck_dXEInt (n) -> C_Vuna_dAst_dEInt (n)
  | C_Vuna_dTypecheck_dXEStr (s) -> C_Vuna_dAst_dEStr (s)
  | C_Vuna_dTypecheck_dXELam (params, body) -> C_Vuna_dAst_dELam (params, v_Vuna_dTypecheck_dlowerExpr
    subst body)
  | C_Vuna_dTypecheck_dXEApp (fn, args) -> C_Vuna_dAst_dEApp (v_Vuna_dTypecheck_dlowerExpr subst fn, v_Vuna_dBase_dmap
    (v_Vuna_dTypecheck_dlowerExpr subst) args)
  | C_Vuna_dTypecheck_dXECmp (name, args, ty) -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar (v_Vuna_dTypecheck_dspecializeCmp
      name (v_Vuna_dTypecheck_dresolveTy subst ty)), v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerExpr subst)
    args)
  | C_Vuna_dTypecheck_dXELet (binds, body) -> C_Vuna_dAst_dELet (v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerBind
      subst) binds, v_Vuna_dTypecheck_dlowerExpr subst body)
  | C_Vuna_dTypecheck_dXECase (scrut, alts) -> C_Vuna_dAst_dECase (v_Vuna_dTypecheck_dlowerExpr subst
    scrut, v_Vuna_dBase_dmap (v_Vuna_dTypecheck_dlowerAlt subst) alts)
  | C_Vuna_dTypecheck_dXEIf (c, t, e) -> C_Vuna_dAst_dEIf (v_Vuna_dTypecheck_dlowerExpr subst c, v_Vuna_dTypecheck_dlowerExpr
    subst t, v_Vuna_dTypecheck_dlowerExpr subst e))
and v_Vuna_dTypecheck_dlowerBind = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dBase_dPair (pat, value)) -> C_Vuna_dBase_dPair (pat, v_Vuna_dTypecheck_dlowerExpr
  subst value)
and v_Vuna_dTypecheck_dlowerAlt = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dBase_dPair (pat, body)) -> C_Vuna_dBase_dPair (pat, v_Vuna_dTypecheck_dlowerExpr subst
  body)

let v_Vuna_dTypecheck_dlowerClause = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dBase_dPair (pats, body)) -> C_Vuna_dBase_dPair (pats, v_Vuna_dTypecheck_dlowerExpr
  subst body)

let rec v_Vuna_dTypecheck_dlowerClauses = fun a0 a1 -> match (a0, a1) with
  | (subst, []) -> []
  | (subst, (clause) :: (rest)) -> (v_Vuna_dTypecheck_dlowerClause subst clause) :: (v_Vuna_dTypecheck_dlowerClauses
  subst rest)

let v_Vuna_dTypecheck_dsameBuiltinTy = fun a b -> (let sa = v_Vuna_dTypecheck_dshortTyName a in
  (if ((if (bi_eq_str sa "Bool") then true
        else (bi_eq_str sa "List"))) then (bi_eq_str sa (v_Vuna_dTypecheck_dshortTyName b))
    else false))

let rec v_Vuna_dTypecheck_dunifyLists = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], st) -> C_Vuna_dBase_dOk (st)
  | ((a) :: (ar), (b) :: (br), st) -> (match v_Vuna_dTypecheck_dunify a b st with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (st2) -> v_Vuna_dTypecheck_dunifyLists ar br st2)
  | (_, _, st) -> C_Vuna_dBase_dErr ("type mismatch: different number of arguments")
and v_Vuna_dTypecheck_dunify = fun a b st -> (match st with
  | C_Vuna_dTypecheck_dTC (n, s) -> (match v_Vuna_dTypecheck_dresolveTy s a with
  | ra -> (match v_Vuna_dTypecheck_dresolveTy s b with
  | rb -> (match ra with
  | C_Vuna_dTypecheck_dTVar (i) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if bi_eq_int i j then C_Vuna_dBase_dOk (st)
          else v_Vuna_dTypecheck_dbindVar i rb st
  | _ -> if v_Vuna_dTypecheck_doccursIn i s rb then C_Vuna_dBase_dErr ((("occurs check: ") ^ (v_Vuna_dTypecheck_dshowTy
                rb)))
          else v_Vuna_dTypecheck_dbindVar i rb st)
  | C_Vuna_dTypecheck_dTCon (tn, xs) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if v_Vuna_dTypecheck_doccursIn j s ra then C_Vuna_dBase_dErr ((("occurs check: ")
              ^ (v_Vuna_dTypecheck_dshowTy ra)))
          else v_Vuna_dTypecheck_dbindVar j ra st
  | C_Vuna_dTypecheck_dTCon (tn2, ys) -> if (if (bi_eq_str tn tn2) then true
            else (v_Vuna_dTypecheck_dsameBuiltinTy tn tn2)) then v_Vuna_dTypecheck_dunifyLists xs ys st

          else C_Vuna_dBase_dErr ((let vuna_cat0' = ("type mismatch: ") in
              (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy ra) in
                (let vuna_cat2' = (" vs ") in
                  (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy rb) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("type mismatch: ") in
              (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy ra) in
                (let vuna_cat2' = (" vs ") in
                  (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy rb) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | C_Vuna_dTypecheck_dTFun (x, y) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if v_Vuna_dTypecheck_doccursIn j s ra then C_Vuna_dBase_dErr ((("occurs check: ")
              ^ (v_Vuna_dTypecheck_dshowTy ra)))
          else v_Vuna_dTypecheck_dbindVar j ra st
  | C_Vuna_dTypecheck_dTFun (x2, y2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify x x2 st) (fun
            st2 -> v_Vuna_dTypecheck_dunify y y2 st2)
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("type mismatch: ") in
              (let vuna_cat1' = (v_Vuna_dTypecheck_dshowTy ra) in
                (let vuna_cat2' = (" vs ") in
                  (let vuna_cat3' = (v_Vuna_dTypecheck_dshowTy rb) in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))))))

let rec v_Vuna_dTypecheck_dinferPatterns = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, [], [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | (globals, locals, (p) :: (pr), (ty) :: (tr), st) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferPattern
  globals locals st p ty) (fun q -> (match q with
  | C_Vuna_dBase_dPair (locals2, st1) -> v_Vuna_dTypecheck_dinferPatterns globals locals2 pr tr st1))
  | (globals, locals, _, _, st) -> C_Vuna_dBase_dErr ("pattern arity mismatch")
and v_Vuna_dTypecheck_dinferPattern = fun globals locals st pat expected -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, expected))
      :: (locals), st))
  | C_Vuna_dAst_dPInt (n) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify expected v_Vuna_dTypecheck_dintTy
    st) (fun st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st2)))
  | C_Vuna_dAst_dPStr (s) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify expected v_Vuna_dTypecheck_dstrTy
    st) (fun st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st2)))
  | C_Vuna_dAst_dPCon (name, pats) -> (match v_Vuna_dTypecheck_dlookupScheme name globals with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unknown constructor: ") ^ (name)))
  | C_Vuna_dBase_dJust (sch) -> (match v_Vuna_dTypecheck_dinstantiate st sch with
  | C_Vuna_dBase_dPair (ctorTy, st1) -> (let argTys = v_Vuna_dTypecheck_dfunArgs ctorTy in
        if bi_eq_int (v_Vuna_dBase_dlength pats) (v_Vuna_dBase_dlength argTys) then v_Vuna_dBase_dandThen
        (v_Vuna_dTypecheck_dunify expected (v_Vuna_dTypecheck_dfunResult ctorTy) st1) (fun st2 -> v_Vuna_dTypecheck_dinferPatterns
          globals locals pats argTys st2)
        else C_Vuna_dBase_dErr ((let vuna_cat0' = ("constructor ") in
            (let vuna_cat1' = (name) in
              (let vuna_cat2' = (" expects ") in
                (let vuna_cat3' = (bi_str_from_int (v_Vuna_dBase_dlength argTys)) in
                  (let vuna_cat4' = (" arguments") in
                    String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))))

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
                  (finalTy, st4))))))))))
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
              ((C_Vuna_dBase_dPair (pat, valueElab)) :: (bindEls), C_Vuna_dBase_dPair (locals3, st3)))))))))
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
                      (pat, bodyElab)) :: (altsElab), C_Vuna_dBase_dPair (bodyTy, st4)))))))))))
and v_Vuna_dTypecheck_dinferExpr = fun globals locals st expr -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> (match v_Vuna_dTypecheck_dlookupLocal name locals with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEVar
          (name)), st))
  | C_Vuna_dBase_dNothing -> (match v_Vuna_dTypecheck_dlookupScheme name globals with
  | C_Vuna_dBase_dJust (sch) -> (match v_Vuna_dTypecheck_dinstantiate st sch with
  | C_Vuna_dBase_dPair (ty, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, C_Vuna_dTypecheck_dXEVar
              (name)), st2)))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("unbound variable: ") ^ (name)))))
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dintTy,
        C_Vuna_dTypecheck_dXEInt (n)), st))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dstrTy,
        C_Vuna_dTypecheck_dXEStr (s)), st))
  | C_Vuna_dAst_dEApp (fn, args) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals
    st fn) (fun pf -> (match pf with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (fnTy, fnElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferArgs
        globals locals fnTy args st1) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (argTys, C_Vuna_dBase_dPair (argEls, C_Vuna_dBase_dPair (resTy, st2))) -> C_Vuna_dBase_dOk
          (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (resTy, v_Vuna_dTypecheck_delabAppExpr fn fnElab args
                argTys argEls), st2))))))
  | C_Vuna_dAst_dELam (params, body) -> (match v_Vuna_dTypecheck_dseedLocals params locals st with
  | C_Vuna_dBase_dPair (paramTys, C_Vuna_dBase_dPair (locals2, st1)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
      globals locals2 st1 body) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
          (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfoldFun paramTys bodyTy, C_Vuna_dTypecheck_dXELam (params,
                bodyElab)), st2)))))
  | C_Vuna_dAst_dELet (binds, body) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferBinds globals locals
    binds st) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (bindEls, C_Vuna_dBase_dPair (locals2, st1)) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
        globals locals2 st1 body) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (bodyTy, C_Vuna_dTypecheck_dXELet (bindEls, bodyElab)), st2))))))
  | C_Vuna_dAst_dECase (scrut, alts) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals
    st scrut) (fun ps -> (match ps with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (scrutTy, scrutElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferAlts
        globals locals scrutTy alts st1) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (altsElab, C_Vuna_dBase_dPair (bodyTy, st2)) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (bodyTy, C_Vuna_dTypecheck_dXECase (scrutElab, altsElab)), st2))))))
  | C_Vuna_dAst_dEIf (c, t, e) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals st
    c) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (condTy, condElab), st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
        condTy v_Vuna_dTypecheck_dboolTy st1) (fun st2 -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
          globals locals st2 t) (fun pt -> (match pt with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (thenTy, thenElab), st3) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr
              globals locals st3 e) (fun pe -> (match pe with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (elseTy, elseElab), st4) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dunify
                  thenTy elseTy st4) (fun st5 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair
                      (thenTy, C_Vuna_dTypecheck_dXEIf (condElab, thenElab, elseElab)), st5)))))))))))

let v_Vuna_dTypecheck_dinferClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, st, C_Vuna_dBase_dPair (pats, body)) -> (match v_Vuna_dTypecheck_dseedPatTypes pats st with
  | C_Vuna_dBase_dPair (paramTys, st1) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferPatterns globals
    [] pats paramTys st1) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st2) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dinferExpr globals locals2
        st2 body) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (bodyTy, bodyElab), st3) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
            (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dfoldFun paramTys bodyTy, C_Vuna_dBase_dPair (pats,
                  bodyElab)), st3)))))))

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
                C_Vuna_dBase_dPair (ty, st3)))))))))

let v_Vuna_dTypecheck_dcheckFunction = fun globals decls sigs name st -> (match v_Vuna_dTypecheck_dlookupScheme
  name globals with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((("missing type signature: ") ^ (name)))
  | C_Vuna_dBase_dJust (sch) -> (match v_Vuna_dTypecheck_dinstantiate st sch with
  | C_Vuna_dBase_dPair (expected, st1) -> (match v_Vuna_dTypecheck_dinferClauses globals (v_Vuna_dAst_dclausesFor
        decls name) st1 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("in ") in
          (let vuna_cat1' = (name) in
            (let vuna_cat2' = (": ") in
              (let vuna_cat3' = (e) in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (clauseEls, C_Vuna_dBase_dPair (inferred, st2))) -> (match v_Vuna_dTypecheck_dunify
        inferred expected st2 with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((let vuna_cat0' = ("in ") in
            (let vuna_cat1' = (name) in
              (let vuna_cat2' = (": ") in
                (let vuna_cat3' = (e) in
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Vuna_dBase_dOk (st3) -> (let elabClauses = v_Vuna_dTypecheck_dlowerClauses (v_Vuna_dTypecheck_dsubstOf
            st3) clauseEls in
          if v_Vuna_dTypecheck_dhasSig name sigs then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elabClauses,
              C_Vuna_dBase_dPair (globals, st3)))
          else (let resolved = v_Vuna_dTypecheck_dresolveTy (v_Vuna_dTypecheck_dsubstOf st3) inferred
            in
            (let scheme = C_Vuna_dTypecheck_dScheme (v_Vuna_dTypecheck_ddiffInts (v_Vuna_dTypecheck_dfreeVarsTy
                  resolved) (v_Vuna_dTypecheck_dfreeVarsEnvExcept name globals), resolved) in
              C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (elabClauses, C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dupdateScheme
                    name scheme globals, st3))))))))))

let rec v_Vuna_dTypecheck_dcheckFunctions = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (globals, decls, sigs, [], st, elabMap) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dBase_dreverse
    elabMap, C_Vuna_dBase_dPair (globals, st)))
  | (globals, decls, sigs, (name) :: (rest), st, elabMap) -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckFunction
  globals decls sigs name st) (fun p -> (match p with
  | C_Vuna_dBase_dPair (clauseEls, C_Vuna_dBase_dPair (globals2, st1)) -> v_Vuna_dTypecheck_dcheckFunctions
    globals2 decls sigs rest st1 ((C_Vuna_dBase_dPair (name, clauseEls)) :: (elabMap))))

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
              v_Vuna_dTypecheck_drebuildDecls decls elabMap)))))))

let v_Vuna_dTypecheck_dcheckProgramInfo = fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab
  decls) (fun p -> C_Vuna_dBase_dOk (v_Vuna_dBase_dfirstOf p))

let v_Vuna_dTypecheck_dcheckProgram = fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfo
  decls) (fun _u -> C_Vuna_dBase_dOk ([]))

let v_Vuna_dEval_ddisplayName = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot
    name) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> base)

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
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
and v_Vuna_dEval_dshowValues = fun a0 -> match a0 with
  | ([]) -> ""
  | ((v) :: ([])) -> v_Vuna_dEval_dshowValue v
  | ((v) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dEval_dshowValue v) in
  (let vuna_cat1' = (" ") in
    (let vuna_cat2' = (v_Vuna_dEval_dshowValues rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dEval_drunDecls = fun decls -> (match v_Vuna_dEval_dinterpretMain decls with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (v) -> v_Vuna_dEval_dshowValue v)

let v_Vuna_dInterp_dinterpret = fun source -> (match v_Vuna_dParser_dparseSource source with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, decls)) -> (match imports with
  | [] -> v_Vuna_dEval_drunDecls decls
  | _ -> "error: imports are only supported by interpretFile"))

let v_Vuna_dInterp_dmain = fun () -> v_Vuna_dInterp_dinterpret v_Vuna_dInterp_ddemo

let rec v_Vuna_dBase_djoinDots = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (".") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinDots rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

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
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))))

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
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (m) :: ([]) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle m name)
  | ms -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": ambiguous name ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (" (imported from ") in
            (let vuna_cat4' = (v_Vuna_dLoader_djoinNames ms) in
              (let vuna_cat5' = ("); qualify it") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))

let v_Vuna_dLoader_dresolveCtor = fun modules label prefix ownCtors imports name -> if v_Vuna_dLoader_disGlobalCtor
name then C_Vuna_dBase_dOk (name)
else if v_Vuna_dBase_dcontainsDot name then v_Vuna_dLoader_dresolveQualified modules label imports name

else if v_Vuna_dBase_dmemName name ownCtors then C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle prefix name)

else (match v_Vuna_dLoader_dmodulesExportingCtor modules imports name with
  | [] -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": unknown constructor ") in
        (let vuna_cat2' = (name) in
          String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (m) :: ([]) -> C_Vuna_dBase_dOk (v_Vuna_dLoader_dmangle m name)
  | ms -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": ambiguous constructor ") in
        (let vuna_cat2' = (name) in
          (let vuna_cat3' = (" (imported from ") in
            (let vuna_cat4' = (v_Vuna_dLoader_djoinNames ms) in
              (let vuna_cat5' = ("); qualify it") in
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))

let rec v_Vuna_dLoader_dresolvePattern = fun modules label prefix ownCtors imports pat -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild, []))
  | C_Vuna_dAst_dPVar (name) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dcheckBinder label name) (fun _u
    -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name), (name) :: ([]))))
  | C_Vuna_dAst_dPInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPInt (n), []))
  | C_Vuna_dAst_dPStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPStr (s), []))
  | C_Vuna_dAst_dPCon (name, pats) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveCtor modules label
    prefix ownCtors imports name) (fun name2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolvePattern
        modules label prefix ownCtors imports) pats) (fun parts -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair
        (C_Vuna_dAst_dPCon (name2, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf parts), v_Vuna_dBase_dconcatMap
          v_Vuna_dBase_dsecondOf parts)))))

let rec v_Vuna_dLoader_dresolveAlt = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6,
  a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, C_Vuna_dBase_dPair (pat, body)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label
      prefix own ownCtors imports (v_Vuna_dBase_dappend bound scope) body) (fun body2 -> C_Vuna_dBase_dOk
      (C_Vuna_dBase_dPair (pat2, body2)))))
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
                    value2)) :: (binds2), body2))))))))
and v_Vuna_dLoader_dresolveExpr = fun modules label prefix own ownCtors imports scope expr -> (match expr
  with
  | C_Vuna_dAst_dEVar (name) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveGlobal modules label prefix
    own imports scope name) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (n)))
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEInt (n))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEStr (s))
  | C_Vuna_dAst_dELam (params, body) -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dcheckBinder
      label) params) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix
      own ownCtors imports (v_Vuna_dBase_dappend params scope) body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELam
        (params, b))))
  | C_Vuna_dAst_dEApp (fn, args) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix
    own ownCtors imports scope fn) (fun fn2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (fun a ->
        v_Vuna_dLoader_dresolveExpr modules label prefix own ownCtors imports scope a) args) (fun args2
      -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp (fn2, args2))))
  | C_Vuna_dAst_dELet (binds, body) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveLet modules label
    prefix own ownCtors imports scope binds body) (fun r -> (match r with
  | C_Vuna_dBase_dPair (binds2, body2) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELet (binds2, body2))))
  | C_Vuna_dAst_dECase (scrut, alts) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label
    prefix own ownCtors imports scope scrut) (fun scrut2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse
      (v_Vuna_dLoader_dresolveAlt modules label prefix own ownCtors imports scope) alts) (fun alts2 ->
      C_Vuna_dBase_dOk (C_Vuna_dAst_dECase (scrut2, alts2))))
  | C_Vuna_dAst_dEIf (c, t, e) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules label prefix
    own ownCtors imports scope c) (fun c2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr modules
      label prefix own ownCtors imports scope t) (fun t2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
        modules label prefix own ownCtors imports scope e) (fun e2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEIf
          (c2, t2, e2))))))

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
                  String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))))

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
                String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))))

let rec v_Vuna_dLoader_dresolveTypeExpr = fun modules label prefix ownTypes imports ty -> (match ty with
  | C_Vuna_dAst_dEVar (name) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeName modules label prefix
    ownTypes imports name) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (n)))
  | C_Vuna_dAst_dEApp (fn, args) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr modules label
    prefix ownTypes imports fn) (fun fn2 -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveTypeExpr
        modules label prefix ownTypes imports) args) (fun args2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp
        (fn2, args2))))
  | _ -> C_Vuna_dBase_dErr ((let vuna_cat0' = (label) in
      (let vuna_cat1' = (": invalid type expression (") in
        (let vuna_cat2' = (v_Vuna_dLoader_dtyShape ty) in
          (let vuna_cat3' = (")") in
            String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))

let v_Vuna_dLoader_dresolveCtorSpec = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Vuna_dAst_dCtor (ctor, ty, arity)) -> v_Vuna_dBase_dandThen
(v_Vuna_dLoader_dresolveCtorDecl label prefix ctor) (fun c2 -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr
    modules label prefix ownTypes imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dCtor (c2, ty2,
        arity))))

let v_Vuna_dLoader_dresolveDecl = fun modules label prefix own ownCtors ownTypes imports d -> (match d
  with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeTopName
    label prefix dname) (fun dn -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolveCtorSpec
        modules label prefix ownTypes imports) ctors) (fun ctors2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDData
        (dn, params, ctors2))))
  | C_Vuna_dAst_dDSig (name, ty) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTopName label prefix
    name) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTypeExpr modules label prefix ownTypes
      imports ty) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDSig (n, ty2))))
  | C_Vuna_dAst_dDFun (name, pats, body) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveTopName label
    prefix name) (fun n -> v_Vuna_dBase_dandThen (v_Vuna_dBase_dtraverse (v_Vuna_dLoader_dresolvePattern
        modules label prefix ownCtors imports) pats) (fun parts -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveExpr
        modules label prefix own ownCtors imports (v_Vuna_dBase_dconcatMap v_Vuna_dBase_dsecondOf parts)
        body) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDFun (n, v_Vuna_dBase_dmap v_Vuna_dBase_dfirstOf
            parts, b))))))

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
        d1 d2))))

let rec v_Vuna_dBase_djoinSlashes = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = ("/") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinSlashes rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dLoader_dmodulePath = fun root name -> (let vuna_cat0' = (root) in
  (let vuna_cat1' = ("/") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinSlashes (v_Vuna_dBase_dsplitOnDot name)) in
      (let vuna_cat3' = (".vuna") in
        String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let rec v_Vuna_dBase_djoinArrows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in
  (let vuna_cat1' = (" -> ") in
    (let vuna_cat2' = (v_Vuna_dBase_djoinArrows rest) in
      String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dLoader_dshowCycle = fun name stack -> v_Vuna_dBase_djoinArrows (v_Vuna_dBase_dreverse ((name)
    :: (stack)))

let rec v_Vuna_dLoader_dloadAll = fun root modules stack imports -> (match imports with
  | [] -> C_Vuna_dBase_dOk (modules)
  | (imp) :: (rest) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadModule root modules stack (v_Vuna_dLoader_dimportName
      imp)) (fun modules2 -> v_Vuna_dLoader_dloadAll root modules2 stack rest))
and v_Vuna_dLoader_dloadModule = fun root modules stack name -> (match v_Vuna_dLoader_dfindModule modules
  name with
  | C_Vuna_dBase_dJust (m) -> C_Vuna_dBase_dOk (modules)
  | C_Vuna_dBase_dNothing -> if v_Vuna_dBase_dmemName name stack then C_Vuna_dBase_dErr ((("import cycle: ")
      ^ (v_Vuna_dLoader_dshowCycle name stack)))
  else if v_Vuna_dLoader_dvalidModuleName name then v_Vuna_dBase_dandThen (v_Vuna_dParser_dparseSource
    (bi_read_file (v_Vuna_dLoader_dmodulePath root name))) (fun p -> (match p with
  | C_Vuna_dBase_dPair (imports, decls) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dvalidateImports name
        imports) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadAll root modules ((name) :: (stack))
          imports) (fun modules2 -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dModule (name, imports, decls, v_Vuna_dAst_dtopNames
                decls)) :: (modules2))))))
  else C_Vuna_dBase_dErr ((("invalid module name: ") ^ (name))))

let v_Vuna_dLoader_dloadProgram = fun root entry -> v_Vuna_dBase_dandThen (v_Vuna_dParser_dparseSource
  (bi_read_file entry)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (imports, decls) -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dvalidateImports "<entry>"
      imports) (fun _u -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadAll root [] [] imports) (fun modules
        -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveEntry modules imports decls) (fun entryDecls
          -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dresolveModules modules) (fun moduleDecls -> C_Vuna_dBase_dOk
            (v_Vuna_dBase_dappend entryDecls moduleDecls)))))))

let v_Vuna_dInterp_dinterpretFile = fun root entry -> (match v_Vuna_dLoader_dloadProgram root entry with
  | C_Vuna_dBase_dErr (e) -> (("error: ") ^ (e))
  | C_Vuna_dBase_dOk (decls) -> v_Vuna_dEval_drunDecls decls)

let v_Vuna_dInterp_dcompileFile = fun root entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  root entry) (fun decls -> (match decls with
  | ds -> v_Vuna_dCodegen_dgenerateProgram ds printResult))

let v_Vuna_dInterp_dcompileFileChecked = fun root entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  root entry) (fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgram decls) (fun _u -> v_Vuna_dCodegen_dgenerateProgram
    decls printResult))

let v_Vuna_dInterp_dcompileFileTyped = fun root entry printResult -> v_Vuna_dBase_dandThen (v_Vuna_dLoader_dloadProgram
  root entry) (fun decls -> v_Vuna_dBase_dandThen (v_Vuna_dTypecheck_dcheckProgramInfoElab decls) (fun
    p -> (match p with
  | C_Vuna_dBase_dPair (globals, elabDecls) -> v_Vuna_dTypedCodegen_dgenerateProgramTyped elabDecls globals
      printResult)))

let v_emit = fun printResult typeCheck typed root entry rest -> (let result = if typed then v_Vuna_dInterp_dcompileFileTyped
  root entry printResult
  else if typeCheck then v_Vuna_dInterp_dcompileFileChecked root entry printResult
  else v_Vuna_dInterp_dcompileFile root entry printResult in
  (match result with
  | C_Vuna_dBase_dOk (code) -> (match rest with
  | (out) :: ([]) -> (let _ = bi_write_file out code in
        0)
  | _ -> (let _ = bi_print code in
        0))
  | C_Vuna_dBase_dErr (e) -> (let _ = bi_print ((let vuna_cat0' = ("error: ") in
          (let vuna_cat1' = (e) in
            (let vuna_cat2' = ("\n") in
              String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) in
      1)))

let rec v_dispatch = fun printResult typeCheck typed root args -> (match args with
  | [] -> v_emitUsage ()
  | (a) :: (rest) -> if bi_eq_str a "--no-print" then v_dispatch false typeCheck typed root rest
  else if bi_eq_str a "--no-typecheck" then v_dispatch printResult false false root rest
  else if bi_eq_str a "--typecheck" then v_dispatch printResult true typed root rest
  else if bi_eq_str a "--typed" then v_dispatch printResult true true root rest
  else if bi_eq_str a "--root" then (match rest with
  | (dir) :: (rest2) -> v_dispatch printResult typeCheck typed dir rest2
  | [] -> v_emitUsage ())
  else v_emit printResult typeCheck typed root a rest)

let v_main = fun () -> v_dispatch true true true "lib" (bi_get_args ())
let () = ignore (v_main ())
