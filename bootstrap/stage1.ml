
let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith "division by zero" else a / b
let bi_eq a b = a = b
let bi_neq a b = a <> b
let bi_lt a b = a < b
let bi_le a b = a <= b
let bi_gt a b = a > b
let bi_ge a b = a >= b
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
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
let show_ctor name args = if args = [] then name else "(" ^ name ^ " " ^ String.concat " " args ^ ")"
let show_vbool b = if b then "True" else "False"
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
and   t_Vuna_dCodegen_dBuiltinInfo =
    C_Vuna_dCodegen_dBuiltinInfo of (string) * (string) * (int) * (string)
and   t_Vuna_dEval_dValue =
    C_Vuna_dEval_dVInt of (int)
  | C_Vuna_dEval_dVStr of (string)
  | C_Vuna_dEval_dVCon of (string) * ((t_Vuna_dEval_dValue) list)
  | C_Vuna_dEval_dVFun of (string) * ((t_Vuna_dEval_dValue) list)
  | C_Vuna_dEval_dVLam of ((string) list) * (t_Vuna_dAst_dExpr) * (((string, t_Vuna_dEval_dValue) t_Vuna_dBase_dPair) list)
  | C_Vuna_dEval_dVBuiltin of (string) * ((t_Vuna_dEval_dValue) list)
and   t_Vuna_dLoader_dModule =
    C_Vuna_dLoader_dModule of (string) * ((t_Vuna_dAst_dImport) list) * ((t_Vuna_dAst_dDecl) list) * ((string) list)
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
  | C_Vuna_dAst_dECase of (t_Vuna_dAst_dExpr) * (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dBase_dPair) list)
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
  | C_Vuna_dTypecheck_dTCon (f0, f1) -> show_ctor "TCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dTypecheck_dTy) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dTypecheck_dTFun (f0, f1) -> show_ctor "TFun" [(show_Vuna_dTypecheck_dTy) f0; (show_Vuna_dTypecheck_dTy) f1]
and show_Vuna_dTypecheck_dScheme v =
  match v with
  | C_Vuna_dTypecheck_dScheme (f0, f1) -> show_ctor "Scheme" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dTypecheck_dTy) f1]
and show_Vuna_dTypecheck_dTC v =
  match v with
  | C_Vuna_dTypecheck_dTC (f0, f1) -> show_ctor "TC" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair string_of_int show_Vuna_dTypecheck_dTy)) x ^ " " ^ go xs ^ ")" in go v)) f1]
and show_Vuna_dCodegen_dBuiltinInfo v =
  match v with
  | C_Vuna_dCodegen_dBuiltinInfo (f0, f1, f2, f3) -> show_ctor "BuiltinInfo" [(show_vstring) f0; (show_vstring) f1; (string_of_int) f2; (show_vstring) f3]
and show_Vuna_dEval_dValue v =
  match v with
  | C_Vuna_dEval_dVInt f0 -> show_ctor "VInt" [(string_of_int) f0]
  | C_Vuna_dEval_dVStr f0 -> show_ctor "VStr" [(show_vstring) f0]
  | C_Vuna_dEval_dVCon (f0, f1) -> show_ctor "VCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dEval_dVFun (f0, f1) -> show_ctor "VFun" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dEval_dVLam (f0, f1, f2) -> show_ctor "VLam" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dAst_dExpr) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_vstring show_Vuna_dEval_dValue)) x ^ " " ^ go xs ^ ")" in go v)) f2]
  | C_Vuna_dEval_dVBuiltin (f0, f1) -> show_ctor "VBuiltin" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dEval_dValue) x ^ " " ^ go xs ^ ")" in go v)) f1]
and show_Vuna_dLoader_dModule v =
  match v with
  | C_Vuna_dLoader_dModule (f0, f1, f2, f3) -> show_ctor "Module" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dImport) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dParser_dPState v =
  match v with
  | C_Vuna_dParser_dPState (f0, f1) -> show_ctor "PState" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dLexer_dPTok) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dLexer_dPos) f1]
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
  | C_Vuna_dLexer_dPTok (f0, f1) -> show_ctor "PTok" [(show_Vuna_dLexer_dTok) f0; (show_Vuna_dLexer_dPos) f1]
and show_Vuna_dLexer_dChars v =
  match v with
  | C_Vuna_dLexer_dChars (f0, f1) -> show_ctor "Chars" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dLexer_dPos) f1]
and show_Vuna_dAst_dPat v =
  match v with
  | C_Vuna_dAst_dPVar f0 -> show_ctor "PVar" [(show_vstring) f0]
  | C_Vuna_dAst_dPWild -> "PWild"
  | C_Vuna_dAst_dPCon (f0, f1) -> show_ctor "PCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dAst_dPInt f0 -> show_ctor "PInt" [(string_of_int) f0]
  | C_Vuna_dAst_dPStr f0 -> show_ctor "PStr" [(show_vstring) f0]
and show_Vuna_dAst_dExpr v =
  match v with
  | C_Vuna_dAst_dEVar f0 -> show_ctor "EVar" [(show_vstring) f0]
  | C_Vuna_dAst_dEInt f0 -> show_ctor "EInt" [(string_of_int) f0]
  | C_Vuna_dAst_dEStr f0 -> show_ctor "EStr" [(show_vstring) f0]
  | C_Vuna_dAst_dELam (f0, f1) -> show_ctor "ELam" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dAst_dExpr) f1]
  | C_Vuna_dAst_dEApp (f0, f1) -> show_ctor "EApp" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dExpr) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dAst_dELet (f0, f1) -> show_ctor "ELet" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dAst_dExpr) f1]
  | C_Vuna_dAst_dECase (f0, f1) -> show_ctor "ECase" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dBase_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dAst_dEIf (f0, f1, f2) -> show_ctor "EIf" [(show_Vuna_dAst_dExpr) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dAst_dExpr) f2]
and show_Vuna_dAst_dCtor v =
  match v with
  | C_Vuna_dAst_dCtor (f0, f1, f2) -> show_ctor "Ctor" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1; (string_of_int) f2]
and show_Vuna_dAst_dDecl v =
  match v with
  | C_Vuna_dAst_dDData (f0, f1, f2) -> show_ctor "DData" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dCtor) x ^ " " ^ go xs ^ ")" in go v)) f2]
  | C_Vuna_dAst_dDSig (f0, f1) -> show_ctor "DSig" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1]
  | C_Vuna_dAst_dDFun (f0, f1, f2) -> show_ctor "DFun" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dAst_dExpr) f2]
and show_Vuna_dAst_dImport v =
  match v with
  | C_Vuna_dAst_dImport (f0, f1, f2) -> show_ctor "Import" [(show_vstring) f0; (show_vbool) f1; ((show_Vuna_dBase_dMaybe show_vstring)) f2]
and show_Vuna_dBase_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dBase_dResult -> string = fun s0 v -> match v with
  | C_Vuna_dBase_dOk f0 -> show_ctor "Ok" [(s0) f0]
  | C_Vuna_dBase_dErr f0 -> show_ctor "Err" [(show_vstring) f0]
and show_Vuna_dBase_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dBase_dMaybe -> string = fun s0 v -> match v with
  | C_Vuna_dBase_dNothing -> "Nothing"
  | C_Vuna_dBase_dJust f0 -> show_ctor "Just" [(s0) f0]
and show_Vuna_dBase_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dBase_dPair -> string = fun s0 s1 v -> match v with
  | C_Vuna_dBase_dPair (f0, f1) -> show_ctor "Pair" [(s0) f0; (s1) f1]

let rec v_usage = fun () -> "usage: vuna [--no-print] [--no-typecheck] [--typed] [--root DIR] <entry.vuna> [out.ml]"

let rec v_emitUsage = fun () -> (let _ = (bi_print) ((bi_concat) (v_usage ()) ("\n")) in 1)

let rec v_Vuna_dInterp_ddemo = fun () -> "main = 40 + 2"

let rec v_Vuna_dTypedCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (bi_concat) (x) ((bi_concat) (sep) ((v_Vuna_dTypedCodegen_djoinWith) (sep) (rest)))

let rec v_Vuna_dTypedCodegen_dparamVar = fun a0 -> match a0 with
  | (i) -> (bi_concat) ("'p") ((bi_str_from_int) (i))

let rec v_Vuna_dTypedCodegen_dshowParamVar = fun a0 -> match a0 with
  | (i) -> (bi_concat) ("s") ((bi_str_from_int) (i))

let rec v_Vuna_dTypedCodegen_dparamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, (v_Vuna_dTypedCodegen_dparamVar) (i))) :: ((v_Vuna_dTypedCodegen_dparamMapAt) (rest) ((bi_add) (i) (1)))

let rec v_Vuna_dTypedCodegen_dparamMap = fun a0 -> match a0 with
  | (params) -> (v_Vuna_dTypedCodegen_dparamMapAt) (params) (0)

let rec v_Vuna_dTypedCodegen_dshowParamMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> (C_Vuna_dBase_dPair (p, (v_Vuna_dTypedCodegen_dshowParamVar) (i))) :: ((v_Vuna_dTypedCodegen_dshowParamMapAt) (rest) ((bi_add) (i) (1)))

let rec v_Vuna_dTypedCodegen_dshowParamMap = fun a0 -> match a0 with
  | (params) -> (v_Vuna_dTypedCodegen_dshowParamMapAt) (params) (0)

let rec v_Vuna_dTypedCodegen_dlookupParam = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (n, v) -> if (bi_eq) (n) (name) then C_Vuna_dBase_dJust (v) else (v_Vuna_dTypedCodegen_dlookupParam) (name) (rest))

let rec v_Vuna_dTypedCodegen_ddataDecls = fun a0 -> match a0 with
  | (decls) -> (match decls with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (d) :: ((v_Vuna_dTypedCodegen_ddataDecls) (rest))
  | _ -> (v_Vuna_dTypedCodegen_ddataDecls) (rest)))

let rec v_Vuna_dTypedCodegen_dlookupData = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dn, ps, cs) -> if (bi_eq) (dn) (name) then C_Vuna_dBase_dJust (d) else (v_Vuna_dTypedCodegen_dlookupData) (rest) (name)
  | _ -> (v_Vuna_dTypedCodegen_dlookupData) (rest) (name)))

let rec v_Vuna_dTypedCodegen_dappType = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> name
  | ((x) :: ([]), name) -> (bi_concat) ("(") ((bi_concat) (x) ((bi_concat) (") ") (name)))
  | (args, name) -> (bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (", ") (args)) ((bi_concat) (") ") (name)))

let rec v_Vuna_dTypedCodegen_dsplitArrows = fun a0 -> match a0 with
  | (expr) -> (match expr with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->"), (a) :: ((b) :: ([]))) -> (a) :: ((v_Vuna_dTypedCodegen_dsplitArrows) (b))
  | _ -> [])

let rec v_Vuna_dTypedCodegen_drange = fun a0 a1 -> match (a0, a1) with
  | (i, n) -> if (bi_ge) (i) (n) then [] else (i) :: ((v_Vuna_dTypedCodegen_drange) ((bi_add) (i) (1)) (n))

let rec v_Vuna_dTypedCodegen_dparamVarsAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((p) :: (rest), i) -> ((v_Vuna_dTypedCodegen_dparamVar) (i)) :: ((v_Vuna_dTypedCodegen_dparamVarsAt) (rest) ((bi_add) (i) (1)))

let rec v_Vuna_dTypedCodegen_dparamVars = fun a0 -> match a0 with
  | (params) -> (v_Vuna_dTypedCodegen_dparamVarsAt) (params) (0)

let rec v_Vuna_dTypedCodegen_ddataPrefix = fun a0 -> match a0 with
  | (params) -> (match params with
  | [] -> ""
  | (p) :: ([]) -> (bi_concat) ((v_Vuna_dTypedCodegen_dparamVar) (0)) (" ")
  | _ -> (bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (", ") ((v_Vuna_dTypedCodegen_dparamVars) (params))) (") ")))

let rec v_Vuna_dTypedCodegen_dpairSecond = fun a0 -> match a0 with
  | (p) -> (match p with
  | C_Vuna_dBase_dPair (_, v) -> v)

let rec v_Vuna_dTypedCodegen_dbuiltinName = fun a0 -> match a0 with
  | (name) -> if (bi_eq) (name) ("+") then C_Vuna_dBase_dJust ("bi_add") else if (bi_eq) (name) ("-") then C_Vuna_dBase_dJust ("bi_sub") else if (bi_eq) (name) ("*") then C_Vuna_dBase_dJust ("bi_mul") else if (bi_eq) (name) ("/") then C_Vuna_dBase_dJust ("bi_div") else if (bi_eq) (name) ("==") then C_Vuna_dBase_dJust ("bi_eq") else if (bi_eq) (name) ("/=") then C_Vuna_dBase_dJust ("bi_neq") else if (bi_eq) (name) ("<") then C_Vuna_dBase_dJust ("bi_lt") else if (bi_eq) (name) ("<=") then C_Vuna_dBase_dJust ("bi_le") else if (bi_eq) (name) (">") then C_Vuna_dBase_dJust ("bi_gt") else if (bi_eq) (name) (">=") then C_Vuna_dBase_dJust ("bi_ge") else if (bi_eq) (name) ("&&") then C_Vuna_dBase_dJust ("bi_and") else if (bi_eq) (name) ("||") then C_Vuna_dBase_dJust ("bi_or") else if (bi_eq) (name) ("++") then C_Vuna_dBase_dJust ("bi_concat") else if (bi_eq) (name) ("strLength") then C_Vuna_dBase_dJust ("bi_str_length") else if (bi_eq) (name) ("strUnpack") then C_Vuna_dBase_dJust ("bi_str_unpack") else if (bi_eq) (name) ("strPack") then C_Vuna_dBase_dJust ("bi_str_pack") else if (bi_eq) (name) ("strFromInt") then C_Vuna_dBase_dJust ("bi_str_from_int") else if (bi_eq) (name) ("readFile") then C_Vuna_dBase_dJust ("bi_read_file") else if (bi_eq) (name) ("writeFile") then C_Vuna_dBase_dJust ("bi_write_file") else if (bi_eq) (name) ("print") then C_Vuna_dBase_dJust ("bi_print") else if (bi_eq) (name) ("getArgs") then C_Vuna_dBase_dJust ("bi_get_args") else C_Vuna_dBase_dNothing

let rec v_Vuna_dTypedCodegen_ddeclFunName = fun a0 -> match a0 with
  | (d) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> name
  | _ -> "")

let rec v_Vuna_dTypedCodegen_dqidMapAt = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((q) :: (rest), i) -> (C_Vuna_dBase_dPair (q, (bi_concat) ("'q") ((bi_str_from_int) (i)))) :: ((v_Vuna_dTypedCodegen_dqidMapAt) (rest) ((bi_add) (i) (1)))

let rec v_Vuna_dTypedCodegen_dqidMap = fun a0 -> match a0 with
  | (qs) -> (v_Vuna_dTypedCodegen_dqidMapAt) (qs) (0)

let rec v_Vuna_dTypedCodegen_dlookupQid = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dBase_dNothing
  | (i, (p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (j, v) -> if (bi_eq) (i) (j) then C_Vuna_dBase_dJust (v) else (v_Vuna_dTypedCodegen_dlookupQid) (i) (rest))

let rec v_Vuna_dTypedCodegen_dfilterNames = fun a0 a1 -> match (a0, a1) with
  | (pred, names) -> (match names with
  | [] -> []
  | (n) :: (rest) -> if (pred) (n) then (n) :: ((v_Vuna_dTypedCodegen_dfilterNames) (pred) (rest)) else (v_Vuna_dTypedCodegen_dfilterNames) (pred) (rest))

let rec v_Vuna_dTypedCodegen_dneighborsOf = fun a0 a1 -> match (a0, a1) with
  | (adj, name) -> (match adj with
  | [] -> []
  | (p) :: (rest) -> (match p with
  | C_Vuna_dBase_dPair (n, ns) -> if (bi_eq) (n) (name) then ns else (v_Vuna_dTypedCodegen_dneighborsOf) (rest) (name)))

let rec v_Vuna_dTypedCodegen_druntimeCodeTyped = fun () -> (bi_concat) ("\n") ((bi_concat) ("let bi_add a b = a + b\n") ((bi_concat) ("let bi_sub a b = a - b\n") ((bi_concat) ("let bi_mul a b = a * b\n") ((bi_concat) ("let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n") ((bi_concat) ("let bi_eq a b = a = b\n") ((bi_concat) ("let bi_neq a b = a <> b\n") ((bi_concat) ("let bi_lt a b = a < b\n") ((bi_concat) ("let bi_le a b = a <= b\n") ((bi_concat) ("let bi_gt a b = a > b\n") ((bi_concat) ("let bi_ge a b = a >= b\n") ((bi_concat) ("let bi_and a b = a && b\n") ((bi_concat) ("let bi_or a b = a || b\n") ((bi_concat) ("let bi_concat a b = a ^ b\n") ((bi_concat) ("let bi_str_length a = String.length a\n") ((bi_concat) ("let bi_str_unpack s =\n") ((bi_concat) ("  let rec go i acc =\n") ((bi_concat) ("    if i < 0 then acc\n") ((bi_concat) ("    else go (i - 1) (Char.code s.[i] :: acc)\n") ((bi_concat) ("  in\n") ((bi_concat) ("  go (String.length s - 1) []\n") ((bi_concat) ("let bi_str_pack cs =\n") ((bi_concat) ("  let buf = Buffer.create 16 in\n") ((bi_concat) ("  let rec go = function\n") ((bi_concat) ("    | [] -> ()\n") ((bi_concat) ("    | c :: rest -> Buffer.add_char buf (Char.chr c); go rest\n") ((bi_concat) ("  in\n") ((bi_concat) ("  go cs;\n") ((bi_concat) ("  Buffer.contents buf\n") ((bi_concat) ("let bi_str_from_int n = string_of_int n\n") ((bi_concat) ("let bi_read_file path =\n") ((bi_concat) ("  try\n") ((bi_concat) ("    let ch = open_in_bin path in\n") ((bi_concat) ("    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n") ((bi_concat) ("      (fun () -> really_input_string ch (in_channel_length ch))\n") ((bi_concat) ("  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n") ((bi_concat) ("let bi_write_file path contents =\n") ((bi_concat) ("  try\n") ((bi_concat) ("    let ch = open_out_bin path in\n") ((bi_concat) ("    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n") ((bi_concat) ("      (fun () -> output_string ch contents);\n") ((bi_concat) ("    String.length contents\n") ((bi_concat) ("  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n") ((bi_concat) ("let bi_print s = print_string s; flush stdout; String.length s\n") ((bi_concat) ("let bi_get_args () =\n") ((bi_concat) ("  let argv = Sys.argv in\n") ((bi_concat) ("  let n = Array.length argv in\n") ((bi_concat) ("  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n") ((bi_concat) ("let show_ctor name args = if args = [] then name else \"(\" ^ name ^ \" \" ^ String.concat \" \" args ^ \")\"\n") ((bi_concat) ("let show_vbool b = if b then \"True\" else \"False\"\n") ((bi_concat) ("let show_vstring s =\n") ((bi_concat) ("  let buf = Buffer.create 16 in\n") ((bi_concat) ("  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat) ("  String.iter (fun c ->\n") ((bi_concat) ("    let n = Char.code c in\n") ((bi_concat) ("    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n") ((bi_concat) ("    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n") ((bi_concat) ("    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n") ((bi_concat) ("    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n") ((bi_concat) ("    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n") ((bi_concat) ("    else Buffer.add_char buf c) s;\n") ((bi_concat) ("  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat) ("  Buffer.contents buf\n") ((bi_concat) ("let rec show_vlist (show_elem : 'a -> string) (v : 'a list) : string =\n") ((bi_concat) ("  match v with\n") ((bi_concat) ("  | [] -> \"Nil\"\n") ("  | x :: xs -> \"(Cons \" ^ show_elem x ^ \" \" ^ show_vlist show_elem xs ^ \")\"\n"))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dTypecheck_dlookupSubst = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dBase_dNothing
  | (i, (p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (j, t) -> if (bi_eq) (i) (j) then C_Vuna_dBase_dJust (t) else (v_Vuna_dTypecheck_dlookupSubst) (i) (rest))

let rec v_Vuna_dTypecheck_dmemInt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> false
  | (i, (x) :: (rest)) -> if (bi_eq) (i) (x) then true else (v_Vuna_dTypecheck_dmemInt) (i) (rest)

let rec v_Vuna_dTypecheck_daddUnique = fun a0 a1 -> match (a0, a1) with
  | (x, xs) -> if (v_Vuna_dTypecheck_dmemInt) (x) (xs) then xs else (x) :: (xs)

let rec v_Vuna_dTypecheck_dunionInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> (v_Vuna_dTypecheck_daddUnique) (x) ((v_Vuna_dTypecheck_dunionInts) (rest) (ys))

let rec v_Vuna_dTypecheck_ddiffInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> []
  | ((x) :: (rest), ys) -> if (v_Vuna_dTypecheck_dmemInt) (x) (ys) then (v_Vuna_dTypecheck_ddiffInts) (rest) (ys) else (x) :: ((v_Vuna_dTypecheck_ddiffInts) (rest) (ys))

let rec v_Vuna_dTypecheck_dshowTy = fun a0 -> match a0 with
  | (ty) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (bi_concat) ("t") ((bi_str_from_int) (i))
  | C_Vuna_dTypecheck_dTCon (n, []) -> n
  | C_Vuna_dTypecheck_dTCon (n, args) -> (bi_concat) ("(") ((bi_concat) (n) ((bi_concat) (" ") ((bi_concat) ((v_Vuna_dTypecheck_dshowTyArgs) (args)) (")"))))
  | C_Vuna_dTypecheck_dTFun (a, b) -> (bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypecheck_dshowTy) (a)) ((bi_concat) (" -> ") ((bi_concat) ((v_Vuna_dTypecheck_dshowTy) (b)) (")")))))
and v_Vuna_dTypecheck_dshowTyArgs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((ty) :: ([])) -> (v_Vuna_dTypecheck_dshowTy) (ty)
  | ((ty) :: (rest)) -> (bi_concat) ((v_Vuna_dTypecheck_dshowTy) (ty)) ((bi_concat) (" ") ((v_Vuna_dTypecheck_dshowTyArgs) (rest)))

let rec v_Vuna_dTypecheck_dnextVar = fun a0 -> match a0 with
  | (st) -> (match st with
  | C_Vuna_dTypecheck_dTC (n, s) -> C_Vuna_dBase_dPair (n, C_Vuna_dTypecheck_dTC ((bi_add) (n) (1), s)))

let rec v_Vuna_dTypecheck_dfreshTy = fun a0 -> match a0 with
  | (st) -> (match (v_Vuna_dTypecheck_dnextVar) (st) with
  | C_Vuna_dBase_dPair (n, st2) -> C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTVar (n), st2))

let rec v_Vuna_dTypecheck_dbindVar = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, ty, st) -> (match st with
  | C_Vuna_dTypecheck_dTC (n, s) -> C_Vuna_dBase_dOk (C_Vuna_dTypecheck_dTC (n, (C_Vuna_dBase_dPair (i, ty)) :: (s))))

let rec v_Vuna_dTypecheck_dinstantiateVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((q) :: (rest), st) -> (match (v_Vuna_dTypecheck_dfreshTy) (st) with
  | C_Vuna_dBase_dPair (ty, st2) -> (match (v_Vuna_dTypecheck_dinstantiateVars) (rest) (st2) with
  | C_Vuna_dBase_dPair (mapping, st3) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (q, ty)) :: (mapping), st3)))

let rec v_Vuna_dTypecheck_dfreeVarsTy = fun a0 -> match a0 with
  | (ty) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: ([])
  | C_Vuna_dTypecheck_dTCon (n, args) -> (v_Vuna_dTypecheck_dfreeVarsArgs) (args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> (v_Vuna_dTypecheck_dunionInts) ((v_Vuna_dTypecheck_dfreeVarsTy) (a)) ((v_Vuna_dTypecheck_dfreeVarsTy) (b)))
and v_Vuna_dTypecheck_dfreeVarsArgs = fun a0 -> match a0 with
  | ([]) -> []
  | ((ty) :: (rest)) -> (v_Vuna_dTypecheck_dunionInts) ((v_Vuna_dTypecheck_dfreeVarsTy) (ty)) ((v_Vuna_dTypecheck_dfreeVarsArgs) (rest))

let rec v_Vuna_dTypecheck_dfreeVarsScheme = fun a0 -> match a0 with
  | (sch) -> (match sch with
  | C_Vuna_dTypecheck_dScheme (qs, ty) -> (v_Vuna_dTypecheck_ddiffInts) ((v_Vuna_dTypecheck_dfreeVarsTy) (ty)) (qs))

let rec v_Vuna_dTypecheck_dfreeVarsEnv = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (n, sch) -> (v_Vuna_dTypecheck_dunionInts) ((v_Vuna_dTypecheck_dfreeVarsScheme) (sch)) ((v_Vuna_dTypecheck_dfreeVarsEnv) (rest)))

let rec v_Vuna_dTypecheck_disLowerName = fun a0 -> match a0 with
  | (name) -> (match (bi_str_unpack) (name) with
  | [] -> false
  | (c) :: (rest) -> (bi_and) ((bi_ge) (c) (97)) ((bi_le) (c) (122)))

let rec v_Vuna_dTypecheck_dlookupTyVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (n, ty) -> if (bi_eq) (n) (name) then C_Vuna_dBase_dJust (ty) else (v_Vuna_dTypecheck_dlookupTyVar) (name) (rest))

let rec v_Vuna_dTypecheck_dvarIds = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (n, ty) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (i) :: ((v_Vuna_dTypecheck_dvarIds) (rest))
  | _ -> (v_Vuna_dTypecheck_dvarIds) (rest)))

let rec v_Vuna_dTypecheck_dseedVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), st) -> (match (v_Vuna_dTypecheck_dfreshTy) (st) with
  | C_Vuna_dBase_dPair (ty, st1) -> (match (v_Vuna_dTypecheck_dseedVars) (rest) (st1) with
  | C_Vuna_dBase_dPair (vars, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, ty)) :: (vars), st2)))

let rec v_Vuna_dTypecheck_ddeclDataNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (name) :: ((v_Vuna_dTypecheck_ddeclDataNames) (rest))
  | _ -> (v_Vuna_dTypecheck_ddeclDataNames) (rest))

let rec v_Vuna_dTypecheck_dintTy = fun () -> C_Vuna_dTypecheck_dTCon ("Int", [])

let rec v_Vuna_dTypecheck_dstrTy = fun () -> C_Vuna_dTypecheck_dTCon ("String", [])

let rec v_Vuna_dTypecheck_dboolTy = fun () -> C_Vuna_dTypecheck_dTCon ("Bool", [])

let rec v_Vuna_dTypecheck_dlistOf = fun a0 -> match a0 with
  | (ty) -> C_Vuna_dTypecheck_dTCon ("List", (ty) :: ([]))

let rec v_Vuna_dTypecheck_dfun2 = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (a, b, c) -> C_Vuna_dTypecheck_dTFun (a, C_Vuna_dTypecheck_dTFun (b, c))

let rec v_Vuna_dTypecheck_dbuiltinSchemes = fun () -> (C_Vuna_dBase_dPair ("+", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ())))) :: ((C_Vuna_dBase_dPair ("-", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ())))) :: ((C_Vuna_dBase_dPair ("*", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ())))) :: ((C_Vuna_dBase_dPair ("/", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ())))) :: ((C_Vuna_dBase_dPair ("==", C_Vuna_dTypecheck_dScheme ((0) :: ([]), (v_Vuna_dTypecheck_dfun2) (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar (0)) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair ("/=", C_Vuna_dTypecheck_dScheme ((0) :: ([]), (v_Vuna_dTypecheck_dfun2) (C_Vuna_dTypecheck_dTVar (0)) (C_Vuna_dTypecheck_dTVar (0)) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair ("<", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair ("<=", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair (">", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair (">=", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dintTy ()) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair ("&&", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dboolTy ()) (v_Vuna_dTypecheck_dboolTy ()) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair ("||", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dboolTy ()) (v_Vuna_dTypecheck_dboolTy ()) (v_Vuna_dTypecheck_dboolTy ())))) :: ((C_Vuna_dBase_dPair ("++", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dstrTy ()) (v_Vuna_dTypecheck_dstrTy ()) (v_Vuna_dTypecheck_dstrTy ())))) :: ((C_Vuna_dBase_dPair ("strLength", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy (), v_Vuna_dTypecheck_dintTy ())))) :: ((C_Vuna_dBase_dPair ("strUnpack", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy (), (v_Vuna_dTypecheck_dlistOf) (v_Vuna_dTypecheck_dintTy ()))))) :: ((C_Vuna_dBase_dPair ("strPack", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun ((v_Vuna_dTypecheck_dlistOf) (v_Vuna_dTypecheck_dintTy ()), v_Vuna_dTypecheck_dstrTy ())))) :: ((C_Vuna_dBase_dPair ("strFromInt", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dintTy (), v_Vuna_dTypecheck_dstrTy ())))) :: ((C_Vuna_dBase_dPair ("readFile", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy (), v_Vuna_dTypecheck_dstrTy ())))) :: ((C_Vuna_dBase_dPair ("writeFile", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dfun2) (v_Vuna_dTypecheck_dstrTy ()) (v_Vuna_dTypecheck_dstrTy ()) (v_Vuna_dTypecheck_dintTy ())))) :: ((C_Vuna_dBase_dPair ("print", C_Vuna_dTypecheck_dScheme ([], C_Vuna_dTypecheck_dTFun (v_Vuna_dTypecheck_dstrTy (), v_Vuna_dTypecheck_dintTy ())))) :: ((C_Vuna_dBase_dPair ("getArgs", C_Vuna_dTypecheck_dScheme ([], (v_Vuna_dTypecheck_dlistOf) (v_Vuna_dTypecheck_dstrTy ())))) :: ([])))))))))))))))))))))

let rec v_Vuna_dTypecheck_dlookupLocal = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (n, ty) -> if (bi_eq) (n) (name) then C_Vuna_dBase_dJust (ty) else (v_Vuna_dTypecheck_dlookupLocal) (name) (rest))

let rec v_Vuna_dTypecheck_dlookupScheme = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (n, sch) -> if (bi_eq) (n) (name) then C_Vuna_dBase_dJust (sch) else (v_Vuna_dTypecheck_dlookupScheme) (name) (rest))

let rec v_Vuna_dTypecheck_dfunArgs = fun a0 -> match a0 with
  | (ty) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> (a) :: ((v_Vuna_dTypecheck_dfunArgs) (b))
  | _ -> [])

let rec v_Vuna_dTypecheck_dfunResult = fun a0 -> match a0 with
  | (ty) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> (v_Vuna_dTypecheck_dfunResult) (b)
  | _ -> ty)

let rec v_Vuna_dTypecheck_dfoldFun = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((a) :: (rest), body) -> C_Vuna_dTypecheck_dTFun (a, (v_Vuna_dTypecheck_dfoldFun) (rest) (body))

let rec v_Vuna_dTypecheck_dseedPatTypes = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Vuna_dBase_dPair ([], st)
  | ((p) :: (rest), st) -> (match (v_Vuna_dTypecheck_dfreshTy) (st) with
  | C_Vuna_dBase_dPair (ty, st1) -> (match (v_Vuna_dTypecheck_dseedPatTypes) (rest) (st1) with
  | C_Vuna_dBase_dPair (tys, st2) -> C_Vuna_dBase_dPair ((ty) :: (tys), st2)))

let rec v_Vuna_dTypecheck_dseedLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], locals, st) -> C_Vuna_dBase_dPair ([], C_Vuna_dBase_dPair (locals, st))
  | ((name) :: (rest), locals, st) -> (match (v_Vuna_dTypecheck_dfreshTy) (st) with
  | C_Vuna_dBase_dPair (ty, st1) -> (match (v_Vuna_dTypecheck_dseedLocals) (rest) ((C_Vuna_dBase_dPair (name, ty)) :: (locals)) (st1) with
  | C_Vuna_dBase_dPair (tys, C_Vuna_dBase_dPair (locals2, st2)) -> C_Vuna_dBase_dPair ((ty) :: (tys), C_Vuna_dBase_dPair (locals2, st2))))

let rec v_Vuna_dTypecheck_ddeclFunName = fun a0 -> match a0 with
  | (d) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> name
  | _ -> "")

let rec v_Vuna_dTypecheck_dupdateScheme = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, sch, env) -> (match env with
  | [] -> []
  | (p) :: (rest) -> (match p with
  | C_Vuna_dBase_dPair (n, s) -> if (bi_eq) (n) (name) then (C_Vuna_dBase_dPair (n, sch)) :: (rest) else (C_Vuna_dBase_dPair (n, s)) :: ((v_Vuna_dTypecheck_dupdateScheme) (name) (sch) (rest))))

let rec v_Vuna_dTypecheck_dfreeVarsEnvExcept = fun a0 a1 -> match (a0, a1) with
  | (name, env) -> (match env with
  | [] -> []
  | (p) :: (rest) -> (match p with
  | C_Vuna_dBase_dPair (n, sch) -> if (bi_eq) (n) (name) then (v_Vuna_dTypecheck_dfreeVarsEnvExcept) (name) (rest) else (v_Vuna_dTypecheck_dunionInts) ((v_Vuna_dTypecheck_dfreeVarsScheme) (sch)) ((v_Vuna_dTypecheck_dfreeVarsEnvExcept) (name) (rest))))

let rec v_Vuna_dTypecheck_dsubstOf = fun a0 -> match a0 with
  | (st) -> (match st with
  | C_Vuna_dTypecheck_dTC (n, s) -> s)

let rec v_Vuna_dTypecheck_dcollectData = fun a0 -> match a0 with
  | (decls) -> C_Vuna_dBase_dPair ((v_Vuna_dTypecheck_ddeclDataNames) (decls), decls)

let rec v_Vuna_dCodegen_druntimeCode = fun () -> "\ntype value =\n  | VInt of int\n  | VStr of string\n  | VCon of string * value list\n  | VFun of string * (value -> value)\n\nlet fail (msg : string) : 'a = failwith msg\n\nlet apply (fn : value) (arg : value) : value =\n  match fn with\n  | VFun (_, f) -> f arg\n  | _ -> fail \"cannot apply a non-function\"\n\nlet expect_int (name : string) (v : value) : int =\n  match v with VInt n -> n | _ -> fail (name ^ \": expected an Int argument\")\n\nlet expect_str (name : string) (v : value) : string =\n  match v with VStr s -> s | _ -> fail (name ^ \": expected a String argument\")\n\nlet vbool (b : bool) : value = VCon ((if b then \"True\" else \"False\"), [])\n\nlet expect_bool (name : string) (v : value) : bool =\n  match v with\n  | VCon (\"True\", []) -> true\n  | VCon (\"False\", []) -> false\n  | _ -> fail (name ^ \": expected a Bool argument\")\n\nlet rec string_to_value (s : string) : value =\n  let n = String.length s in\n  let rec go i acc =\n    if i < 0 then acc\n    else go (i - 1) (VCon (\"Cons\", [ VInt (Char.code s.[i]); acc ]))\n  in\n  go (n - 1) (VCon (\"Nil\", []))\n\nlet value_to_string (v : value) : string =\n  let buf = Buffer.create 16 in\n  let rec go (v : value) =\n    match v with\n    | VCon (\"Nil\", []) -> ()\n    | VCon (\"Cons\", [ VInt c; rest ]) ->\n        if c < 0 || c > 255 then fail \"strPack: character code out of range\";\n        Buffer.add_char buf (Char.chr c);\n        go rest\n    | _ -> fail \"strPack expects a List Int\"\n  in\n  go v;\n  Buffer.contents buf\n\nlet list_of_strings (strings : string list) : value =\n  List.fold_right\n    (fun s acc -> VCon (\"Cons\", [ VStr s; acc ]))\n    strings (VCon (\"Nil\", []))\n\nlet read_file (path : string) : string =\n  try\n    let channel = open_in_bin path in\n    Fun.protect\n      ~finally:(fun () -> close_in_noerr channel)\n      (fun () -> really_input_string channel (in_channel_length channel))\n  with Sys_error message -> fail (\"readFile: \" ^ message)\n\nlet write_file (path : string) (contents : string) : int =\n  try\n    let channel = open_out_bin path in\n    Fun.protect\n      ~finally:(fun () -> close_out_noerr channel)\n      (fun () -> output_string channel contents);\n    String.length contents\n  with Sys_error message -> fail (\"writeFile: \" ^ message)\n\nlet print_stdout (text : string) : int =\n  print_string text;\n  flush stdout;\n  String.length text\n\nlet get_args () : value =\n  let argv = Sys.argv in\n  let count = Array.length argv in\n  let args =\n    if count <= 1 then [] else Array.to_list (Array.sub argv 1 (count - 1))\n  in\n  list_of_strings args\n\nlet bi_add =\n  fun a -> VFun (\"+\", fun b -> VInt (expect_int \"+\" a + expect_int \"+\" b))\n\nlet bi_sub =\n  fun a -> VFun (\"-\", fun b -> VInt (expect_int \"-\" a - expect_int \"-\" b))\n\nlet bi_mul =\n  fun a -> VFun (\"*\", fun b -> VInt (expect_int \"*\" a * expect_int \"*\" b))\n\nlet bi_div =\n  fun a ->\n    VFun\n      ( \"/\",\n        fun b ->\n          let x = expect_int \"/\" a in\n          let y = expect_int \"/\" b in\n          if y = 0 then fail \"division by zero\" else VInt (x / y) )\n\nlet bi_eq =\n  fun a ->\n    VFun\n      ( \"==\",\n        fun b ->\n          match (a, b) with\n          | VInt x, VInt y -> vbool (x = y)\n          | VStr x, VStr y -> vbool (x = y)\n          | _ -> fail \"bad arguments for ==\" )\n\nlet bi_neq =\n  fun a ->\n    VFun\n      ( \"/=\",\n        fun b ->\n          match (a, b) with\n          | VInt x, VInt y -> vbool (x <> y)\n          | VStr x, VStr y -> vbool (x <> y)\n          | _ -> fail \"bad arguments for /=\" )\n\nlet bi_lt =\n  fun a -> VFun (\"<\", fun b -> vbool (expect_int \"<\" a < expect_int \"<\" b))\n\nlet bi_le =\n  fun a -> VFun (\"<=\", fun b -> vbool (expect_int \"<=\" a <= expect_int \"<=\" b))\n\nlet bi_gt =\n  fun a -> VFun (\">\", fun b -> vbool (expect_int \">\" a > expect_int \">\" b))\n\nlet bi_ge =\n  fun a -> VFun (\">=\", fun b -> vbool (expect_int \">=\" a >= expect_int \">=\" b))\n\nlet bi_and =\n  fun a ->\n    VFun\n      (\"&&\", fun b -> vbool (expect_bool \"&&\" a && expect_bool \"&&\" b))\n\nlet bi_or =\n  fun a ->\n    VFun (\"||\", fun b -> vbool (expect_bool \"||\" a || expect_bool \"||\" b))\n\nlet bi_concat =\n  fun a -> VFun (\"++\", fun b -> VStr (expect_str \"++\" a ^ expect_str \"++\" b))\n\nlet bi_str_length = fun a -> VInt (String.length (expect_str \"strLength\" a))\n\nlet bi_str_unpack =\n  fun a -> string_to_value (expect_str \"strUnpack\" a)\n\nlet bi_str_pack = fun a -> VStr (value_to_string a)\n\nlet bi_str_from_int =\n  fun a -> VStr (string_of_int (expect_int \"strFromInt\" a))\n\nlet display_name (name : string) : string =\n  match String.rindex_opt name '.' with\n  | Some index -> String.sub name (index + 1) (String.length name - index - 1)\n  | None -> name\n\nlet rec show_value (v : value) : string =\n  match v with\n  | VInt n -> string_of_int n\n  | VStr s -> \"\\\"\" ^ show_chars s 0 (String.length s) ^ \"\\\"\"\n  | VCon (name, []) -> display_name name\n  | VCon (name, args) ->\n      \"(\" ^ display_name name ^ \" \"\n      ^ String.concat \" \" (List.map show_value args)\n      ^ \")\"\n  | VFun (\"\", _) -> \"<lambda>\"\n  | VFun (name, _) -> \"<function \" ^ display_name name ^ \">\"\n\nand show_chars (s : string) (i : int) (n : int) : string =\n  if i >= n then \"\"\n  else\n    let rest = show_chars s (i + 1) n in\n    match s.[i] with\n    | '\"' -> \"\\\\\\\"\" ^ rest\n    | '\\\\' -> \"\\\\\\\\\" ^ rest\n    | '\\n' -> \"\\\\n\" ^ rest\n    | '\\t' -> \"\\\\t\" ^ rest\n    | '\\r' -> \"\\\\r\" ^ rest\n    | '\\b' -> \"\\\\b\" ^ rest\n    | c ->\n        let code = Char.code c in\n        if code >= 32 && code <= 126 then String.make 1 c ^ rest\n        else Printf.sprintf \"\\\\%03d\" code ^ rest\n"

let rec v_Vuna_dCodegen_dbuiltinInfos = fun () -> (C_Vuna_dCodegen_dBuiltinInfo ("+", "bi_add", 2, "VInt (expect_int \"+\" a + expect_int \"+\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("-", "bi_sub", 2, "VInt (expect_int \"-\" a - expect_int \"-\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("*", "bi_mul", 2, "VInt (expect_int \"*\" a * expect_int \"*\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("/", "bi_div", 2, "let x = expect_int \"/\" a in let y = expect_int \"/\" b in if y = 0 then fail \"division by zero\" else VInt (x / y)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("==", "bi_eq", 2, "match (a, b) with VInt x, VInt y -> vbool (x = y) | VStr x, VStr y -> vbool (x = y) | _ -> fail \"bad arguments for ==\"")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("/=", "bi_neq", 2, "match (a, b) with VInt x, VInt y -> vbool (x <> y) | VStr x, VStr y -> vbool (x <> y) | _ -> fail \"bad arguments for /=\"")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("<", "bi_lt", 2, "vbool (expect_int \"<\" a < expect_int \"<\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("<=", "bi_le", 2, "vbool (expect_int \"<=\" a <= expect_int \"<=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo (">", "bi_gt", 2, "vbool (expect_int \">\" a > expect_int \">\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo (">=", "bi_ge", 2, "vbool (expect_int \">=\" a >= expect_int \">=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("&&", "bi_and", 2, "vbool (expect_bool \"&&\" a && expect_bool \"&&\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("||", "bi_or", 2, "vbool (expect_bool \"||\" a || expect_bool \"||\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("++", "bi_concat", 2, "VStr (expect_str \"++\" a ^ expect_str \"++\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strLength", "bi_str_length", 1, "VInt (String.length (expect_str \"strLength\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strUnpack", "bi_str_unpack", 1, "string_to_value (expect_str \"strUnpack\" a)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strPack", "bi_str_pack", 1, "VStr (value_to_string a)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strFromInt", "bi_str_from_int", 1, "VStr (string_of_int (expect_int \"strFromInt\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("readFile", "bi_read_file", 1, "VStr (read_file (expect_str \"readFile\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("writeFile", "bi_write_file", 2, "VInt (write_file (expect_str \"writeFile\" a) (expect_str \"writeFile\" b))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("print", "bi_print", 1, "let text = expect_str \"print\" a in VInt (print_stdout text)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("getArgs", "bi_get_args", 0, "get_args ()")) :: ([])))))))))))))))))))))

let rec v_Vuna_dCodegen_dfindBuiltin = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (b) :: (rest)) -> (match b with
  | C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body) -> if (bi_eq) (vname) (name) then C_Vuna_dBase_dJust (b) else (v_Vuna_dCodegen_dfindBuiltin) (name) (rest))

let rec v_Vuna_dCodegen_djoinList = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (bi_concat) (x) ((bi_concat) (sep) ((v_Vuna_dCodegen_djoinList) (sep) (rest)))

let rec v_Vuna_dCodegen_dheadOf = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: (rest)) -> x

let rec v_Vuna_dCodegen_dnthList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> ""
  | (n, (x) :: (rest)) -> if (bi_eq) (n) (0) then x else (v_Vuna_dCodegen_dnthList) ((bi_sub) (n) (1)) (rest)

let rec v_Vuna_dCodegen_dsanitizeChar = fun a0 -> match a0 with
  | (c) -> if (bi_eq) (c) (46) then (95) :: ((100) :: ([])) else if (bi_eq) (c) (95) then (95) :: ((117) :: ([])) else if (bi_eq) (c) (39) then (95) :: ((112) :: ([])) else (c) :: ([])

let rec v_Vuna_dCodegen_dpad3 = fun a0 -> match a0 with
  | (s) -> if (bi_eq) ((bi_str_length) (s)) (1) then (bi_concat) ("00") (s) else if (bi_eq) ((bi_str_length) (s)) (2) then (bi_concat) ("0") (s) else s

let rec v_Vuna_dCodegen_descapeChar = fun a0 -> match a0 with
  | (c) -> if (bi_eq) (c) (34) then (92) :: ((34) :: ([])) else if (bi_eq) (c) (92) then (92) :: ((92) :: ([])) else if (bi_eq) (c) (10) then (92) :: ((110) :: ([])) else if (bi_eq) (c) (9) then (92) :: ((116) :: ([])) else if (bi_eq) (c) (13) then (92) :: ((114) :: ([])) else if (bi_and) ((bi_ge) (c) (32)) ((bi_le) (c) (126)) then (c) :: ([]) else (bi_str_unpack) ((bi_concat) ("\\") ((v_Vuna_dCodegen_dpad3) ((bi_str_from_int) (c))))

let rec v_Vuna_dCodegen_dcgApplyFold = fun a0 a1 -> match (a0, a1) with
  | (acc, []) -> acc
  | (acc, (a) :: (rest)) -> (v_Vuna_dCodegen_dcgApplyFold) ((bi_concat) ("(apply (") ((bi_concat) (acc) ((bi_concat) (") (") ((bi_concat) (a) ("))"))))) (rest)

let rec v_Vuna_dCodegen_dmakeParamsFrom = fun a0 a1 -> match (a0, a1) with
  | (i, n) -> if (bi_gt) (i) (n) then [] else ((bi_concat) ("a") ((bi_str_from_int) (i))) :: ((v_Vuna_dCodegen_dmakeParamsFrom) ((bi_add) (i) (1)) (n))

let rec v_Vuna_dCodegen_dmakeParams = fun a0 -> match a0 with
  | (n) -> (v_Vuna_dCodegen_dmakeParamsFrom) (1) (n)

let rec v_Vuna_dCodegen_dmakeCtorParamsFrom = fun a0 a1 -> match (a0, a1) with
  | (i, n) -> if (bi_gt) (i) (n) then [] else ((bi_concat) ("c") ((bi_str_from_int) (i))) :: ((v_Vuna_dCodegen_dmakeCtorParamsFrom) ((bi_add) (i) (1)) (n))

let rec v_Vuna_dCodegen_dmakeCtorParams = fun a0 -> match a0 with
  | (n) -> (v_Vuna_dCodegen_dmakeCtorParamsFrom) (1) (n)

let rec v_Vuna_dEval_dintArg = fun a0 -> match a0 with
  | (v) -> (match v with
  | C_Vuna_dEval_dVInt (n) -> C_Vuna_dBase_dOk (n)
  | _ -> C_Vuna_dBase_dErr ("expected an Int argument"))

let rec v_Vuna_dEval_dstringArg = fun a0 -> match a0 with
  | (v) -> (match v with
  | C_Vuna_dEval_dVStr (s) -> C_Vuna_dBase_dOk (s)
  | _ -> C_Vuna_dBase_dErr ("expected a String argument"))

let rec v_Vuna_dEval_dvbool = fun a0 -> match a0 with
  | (b) -> if b then C_Vuna_dEval_dVCon ("True", []) else C_Vuna_dEval_dVCon ("False", [])

let rec v_Vuna_dEval_dcharsToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((c) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVInt (c)) :: (((v_Vuna_dEval_dcharsToValue) (rest)) :: ([])))

let rec v_Vuna_dEval_dstringToValue = fun a0 -> match a0 with
  | (s) -> (v_Vuna_dEval_dcharsToValue) ((bi_str_unpack) (s))

let rec v_Vuna_dEval_dstrListToValue = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dEval_dVCon ("Nil", [])
  | ((s) :: (rest)) -> C_Vuna_dEval_dVCon ("Cons", (C_Vuna_dEval_dVStr (s)) :: (((v_Vuna_dEval_dstrListToValue) (rest)) :: ([])))

let rec v_Vuna_dEval_deqBuiltin = fun a0 -> match a0 with
  | (args) -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_eq) (a) (b)))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_eq) (a) (b)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for =="))

let rec v_Vuna_dEval_dneqBuiltin = fun a0 -> match a0 with
  | (args) -> (match args with
  | (C_Vuna_dEval_dVInt (a)) :: ((C_Vuna_dEval_dVInt (b)) :: ([])) -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_neq) (a) (b)))
  | (C_Vuna_dEval_dVStr (a)) :: ((C_Vuna_dEval_dVStr (b)) :: ([])) -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_neq) (a) (b)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for /="))

let rec v_Vuna_dEval_dandBuiltin = fun a0 -> match a0 with
  | (args) -> (match args with
  | (a) :: ((b) :: ([])) -> (match a with
  | C_Vuna_dEval_dVCon ("True", []) -> (match b with
  | C_Vuna_dEval_dVCon ("True", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("True", []))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> C_Vuna_dBase_dErr ("expected a Bool"))
  | C_Vuna_dEval_dVCon ("False", []) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon ("False", []))
  | _ -> C_Vuna_dBase_dErr ("expected a Bool"))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for &&"))

let rec v_Vuna_dEval_dorBuiltin = fun a0 -> match a0 with
  | (args) -> (match args with
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
  | ((c) :: (rest)) -> if (bi_eq) (c) (34) then (bi_concat) ("\\\"") ((v_Vuna_dEval_dshowStringChars) (rest)) else if (bi_eq) (c) (92) then (bi_concat) ("\\\\") ((v_Vuna_dEval_dshowStringChars) (rest)) else if (bi_eq) (c) (10) then (bi_concat) ("\\n") ((v_Vuna_dEval_dshowStringChars) (rest)) else if (bi_eq) (c) (9) then (bi_concat) ("\\t") ((v_Vuna_dEval_dshowStringChars) (rest)) else if (bi_eq) (c) (13) then (bi_concat) ("\\r") ((v_Vuna_dEval_dshowStringChars) (rest)) else (bi_concat) ((bi_str_pack) ((c) :: ([]))) ((v_Vuna_dEval_dshowStringChars) (rest))

let rec v_Vuna_dEval_dshowString = fun a0 -> match a0 with
  | (s) -> (bi_concat) ("\"") ((bi_concat) ((v_Vuna_dEval_dshowStringChars) ((bi_str_unpack) (s))) ("\""))

let rec v_Vuna_dLoader_disGlobalCtor = fun a0 -> match a0 with
  | (name) -> (bi_or) ((bi_or) ((bi_or) ((bi_eq) (name) ("True")) ((bi_eq) (name) ("False"))) ((bi_eq) (name) ("Cons"))) ((bi_eq) (name) ("Nil"))

let rec v_Vuna_dLoader_dmangle = fun a0 a1 -> match (a0, a1) with
  | (prefix, name) -> if (bi_eq) (prefix) ("") then name else (bi_concat) (prefix) ((bi_concat) (".") (name))

let rec v_Vuna_dLoader_dimportName = fun a0 -> match a0 with
  | (imp) -> (match imp with
  | C_Vuna_dAst_dImport (name, isQualified, alias) -> name)

let rec v_Vuna_dLoader_dimportIsQualified = fun a0 -> match a0 with
  | (imp) -> (match imp with
  | C_Vuna_dAst_dImport (name, isQualified, alias) -> isQualified)

let rec v_Vuna_dLoader_dimportAlias = fun a0 -> match a0 with
  | (imp) -> (match imp with
  | C_Vuna_dAst_dImport (name, isQualified, alias) -> alias)

let rec v_Vuna_dLoader_dimportAliases = fun a0 -> match a0 with
  | (imports) -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> (match (v_Vuna_dLoader_dimportAlias) (imp) with
  | C_Vuna_dBase_dNothing -> (v_Vuna_dLoader_dimportAliases) (rest)
  | C_Vuna_dBase_dJust (alias) -> (C_Vuna_dBase_dPair (alias, (v_Vuna_dLoader_dimportName) (imp))) :: ((v_Vuna_dLoader_dimportAliases) (rest))))

let rec v_Vuna_dLoader_dopenModuleNames = fun a0 -> match a0 with
  | (imports) -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> if (v_Vuna_dLoader_dimportIsQualified) (imp) then (v_Vuna_dLoader_dopenModuleNames) (rest) else ((v_Vuna_dLoader_dimportName) (imp)) :: ((v_Vuna_dLoader_dopenModuleNames) (rest)))

let rec v_Vuna_dLoader_dfindImportPrefix = fun a0 a1 -> match (a0, a1) with
  | (imports, prefix) -> (match imports with
  | [] -> C_Vuna_dBase_dNothing
  | (imp) :: (rest) -> if (bi_eq) ((v_Vuna_dLoader_dimportName) (imp)) (prefix) then C_Vuna_dBase_dJust ((v_Vuna_dLoader_dimportName) (imp)) else (match (v_Vuna_dLoader_dimportAlias) (imp) with
  | C_Vuna_dBase_dJust (alias) -> if (bi_eq) (alias) (prefix) then C_Vuna_dBase_dJust ((v_Vuna_dLoader_dimportName) (imp)) else (v_Vuna_dLoader_dfindImportPrefix) (rest) (prefix)
  | C_Vuna_dBase_dNothing -> (v_Vuna_dLoader_dfindImportPrefix) (rest) (prefix)))

let rec v_Vuna_dLoader_djoinNames = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (bi_concat) (x) ((bi_concat) (", ") ((v_Vuna_dLoader_djoinNames) (rest)))

let rec v_Vuna_dLoader_dfindModule = fun a0 a1 -> match (a0, a1) with
  | (modules, name) -> (match modules with
  | [] -> C_Vuna_dBase_dNothing
  | (m) :: (rest) -> (match m with
  | C_Vuna_dLoader_dModule (mname, imports, decls, exports) -> if (bi_eq) (mname) (name) then C_Vuna_dBase_dJust (m) else (v_Vuna_dLoader_dfindModule) (rest) (name)))

let rec v_Vuna_dLoader_dmoduleDecls = fun a0 a1 -> match (a0, a1) with
  | (modules, name) -> (match (v_Vuna_dLoader_dfindModule) (modules) (name) with
  | C_Vuna_dBase_dJust (m) -> (match m with
  | C_Vuna_dLoader_dModule (mname, imports, decls, exports) -> decls)
  | C_Vuna_dBase_dNothing -> [])

let rec v_Vuna_dLoader_dexportsOf = fun a0 a1 -> match (a0, a1) with
  | (modules, name) -> (match (v_Vuna_dLoader_dfindModule) (modules) (name) with
  | C_Vuna_dBase_dJust (m) -> (match m with
  | C_Vuna_dLoader_dModule (mname, imports, decls, exports) -> exports)
  | C_Vuna_dBase_dNothing -> [])

let rec v_Vuna_dLoader_dtyShape = fun a0 -> match a0 with
  | (ty) -> (match ty with
  | C_Vuna_dAst_dEVar (n) -> (bi_concat) ("var ") (n)
  | C_Vuna_dAst_dEApp (f, a) -> "app"
  | C_Vuna_dAst_dEInt (n) -> "int"
  | C_Vuna_dAst_dEStr (s) -> "str"
  | C_Vuna_dAst_dELam (ps, b) -> "lam"
  | C_Vuna_dAst_dELet (bs, b) -> "let"
  | C_Vuna_dAst_dECase (s, alts) -> "case"
  | C_Vuna_dAst_dEIf (c, t, e) -> "if")

let rec v_Vuna_dBuiltins_dbuiltinArity = fun a0 -> match a0 with
  | (name) -> if (bi_eq) (name) ("+") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("-") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("*") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("/") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("==") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("/=") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("<") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("<=") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) (">") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) (">=") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("&&") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("||") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("++") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("strLength") then C_Vuna_dBase_dJust (1) else if (bi_eq) (name) ("strUnpack") then C_Vuna_dBase_dJust (1) else if (bi_eq) (name) ("strPack") then C_Vuna_dBase_dJust (1) else if (bi_eq) (name) ("strFromInt") then C_Vuna_dBase_dJust (1) else if (bi_eq) (name) ("readFile") then C_Vuna_dBase_dJust (1) else if (bi_eq) (name) ("writeFile") then C_Vuna_dBase_dJust (2) else if (bi_eq) (name) ("print") then C_Vuna_dBase_dJust (1) else if (bi_eq) (name) ("getArgs") then C_Vuna_dBase_dJust (0) else C_Vuna_dBase_dNothing

let rec v_Vuna_dLoader_disBuiltinName = fun a0 -> match a0 with
  | (name) -> (match (v_Vuna_dBuiltins_dbuiltinArity) (name) with
  | C_Vuna_dBase_dJust (arity) -> true
  | C_Vuna_dBase_dNothing -> false)

let rec v_Vuna_dParser_dposOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> p

let rec v_Vuna_dParser_dtokOf = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dPTok (t, p)) -> t

let rec v_Vuna_dParser_dpeekTok = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (toks, last)) -> (match toks with
  | (t) :: (rest) -> t
  | [] -> C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, C_Vuna_dLexer_dPos (1, 1)))

let rec v_Vuna_dParser_dpeekPos = fun a0 -> match a0 with
  | (st) -> (v_Vuna_dParser_dposOf) ((v_Vuna_dParser_dpeekTok) (st))

let rec v_Vuna_dParser_dlastPos = fun a0 -> match a0 with
  | (C_Vuna_dParser_dPState (toks, last)) -> last

let rec v_Vuna_dParser_dadvance = fun a0 -> match a0 with
  | (st) -> (match st with
  | C_Vuna_dParser_dPState (toks, last) -> (match toks with
  | (t) :: (rest) -> (match t with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> st
  | _ -> C_Vuna_dParser_dPState (rest, (v_Vuna_dParser_dposOf) (t)))
  | [] -> st))

let rec v_Vuna_dParser_disEof = fun a0 -> match a0 with
  | (st) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p) -> true
  | _ -> false)

let rec v_Vuna_dParser_datSym = fun a0 a1 -> match (a0, a1) with
  | (st, s) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> (bi_eq) (x) (s)
  | _ -> false)

let rec v_Vuna_dParser_datKw = fun a0 a1 -> match (a0, a1) with
  | (st, k) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> (bi_eq) (x) (k)
  | _ -> false)

let rec v_Vuna_dParser_dcanContinue = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> (match (v_Vuna_dParser_dlastPos) (st) with
  | C_Vuna_dLexer_dPos (lastLine, lastCol) -> (bi_or) ((bi_eq) (line) (lastLine)) ((bi_gt) (col) (blockCol))))

let rec v_Vuna_dParser_dexpectSym = fun a0 a1 -> match (a0, a1) with
  | (st, s) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (x), p) -> if (bi_eq) (x) (s) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (0, (v_Vuna_dParser_dadvance) (st))) else C_Vuna_dBase_dErr ((bi_concat) ("expected ") (s))
  | _ -> C_Vuna_dBase_dErr ((bi_concat) ("expected ") (s)))

let rec v_Vuna_dParser_dexpectKw = fun a0 a1 -> match (a0, a1) with
  | (st, k) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw (x), p) -> if (bi_eq) (x) (k) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (0, (v_Vuna_dParser_dadvance) (st))) else C_Vuna_dBase_dErr ((bi_concat) ("expected ") (k))
  | _ -> C_Vuna_dBase_dErr ((bi_concat) ("expected ") (k)))

let rec v_Vuna_dParser_dexpectIdent = fun a0 -> match a0 with
  | (st) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (x, (v_Vuna_dParser_dadvance) (st)))
  | _ -> C_Vuna_dBase_dErr ("expected identifier"))

let rec v_Vuna_dParser_dupperFirst = fun a0 -> match a0 with
  | (s) -> (match (bi_str_unpack) (s) with
  | (c) :: (rest) -> (bi_and) ((bi_ge) (c) (65)) ((bi_le) (c) (90))
  | [] -> false)

let rec v_Vuna_dParser_dstartsAtom = fun a0 -> match a0 with
  | (st) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("Type"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false)

let rec v_Vuna_dParser_dstartsPatternAtom = fun a0 -> match a0 with
  | (st) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (x), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> true
  | _ -> false)

let rec v_Vuna_dParser_dinfixInfo = fun a0 -> match a0 with
  | (op) -> if (bi_eq) (op) ("->") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (1, 1)) else if (bi_eq) (op) ("||") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (2, 0)) else if (bi_eq) (op) ("&&") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (3, 0)) else if (bi_eq) (op) ("==") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0)) else if (bi_eq) (op) ("/=") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0)) else if (bi_eq) (op) ("<") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0)) else if (bi_eq) (op) ("<=") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0)) else if (bi_eq) (op) (">") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0)) else if (bi_eq) (op) (">=") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (4, 0)) else if (bi_eq) (op) ("++") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (5, 1)) else if (bi_eq) (op) ("+") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (6, 0)) else if (bi_eq) (op) ("-") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (6, 0)) else if (bi_eq) (op) ("*") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (7, 0)) else if (bi_eq) (op) ("/") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (7, 0)) else if (bi_eq) (op) ("::") then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (8, 1)) else C_Vuna_dBase_dNothing

let rec v_Vuna_dParser_dopExpr = fun a0 -> match a0 with
  | (op) -> if (bi_eq) (op) ("::") then C_Vuna_dAst_dEVar ("Cons") else C_Vuna_dAst_dEVar (op)

let rec v_Vuna_dParser_dcountArrows = fun a0 -> match a0 with
  | (e) -> (match e with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->"), (x) :: ((rest) :: ([]))) -> (bi_add) (1) ((v_Vuna_dParser_dcountArrows) (rest))
  | _ -> 0)

let rec v_Vuna_dParser_dterminatesExpression = fun a0 -> match a0 with
  | (tok) -> (match tok with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (")"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("]"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (","), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("else"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("in"), p) -> true
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("then"), p) -> true
  | _ -> false)

let rec v_Vuna_dParser_dbadCaseIndent = fun a0 a1 -> match (a0, a1) with
  | (st, altCol) -> if (v_Vuna_dParser_disEof) (st) then false else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_gt) (col) (altCol) then (match (v_Vuna_dParser_dterminatesExpression) ((v_Vuna_dParser_dpeekTok) (st)) with
  | true -> false
  | false -> true) else false)

let rec v_Vuna_dParser_dfoldCons = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dAst_dEVar ("Nil")
  | ((e) :: (rest)) -> C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("Cons"), (e) :: (((v_Vuna_dParser_dfoldCons) (rest)) :: ([])))

let rec v_Vuna_dParser_dfoldPCon = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dAst_dPCon ("Nil", [])
  | ((p) :: (rest)) -> C_Vuna_dAst_dPCon ("Cons", (p) :: (((v_Vuna_dParser_dfoldPCon) (rest)) :: ([])))

let rec v_Vuna_dLexer_dadvanceChar = fun a0 a1 -> match (a0, a1) with
  | (c, C_Vuna_dLexer_dPos (line, col)) -> if (bi_eq) (c) (10) then C_Vuna_dLexer_dPos ((bi_add) (line) (1), 1) else C_Vuna_dLexer_dPos (line, (bi_add) (col) (1))

let rec v_Vuna_dLexer_disUpperChar = fun a0 -> match a0 with
  | (c) -> (bi_and) ((bi_ge) (c) (65)) ((bi_le) (c) (90))

let rec v_Vuna_dLexer_disLowerChar = fun a0 -> match a0 with
  | (c) -> (bi_and) ((bi_ge) (c) (97)) ((bi_le) (c) (122))

let rec v_Vuna_dLoader_disLowerTypeName = fun a0 -> match a0 with
  | (name) -> (match (bi_str_unpack) (name) with
  | [] -> false
  | (c) :: (rest) -> (v_Vuna_dLexer_disLowerChar) (c))

let rec v_Vuna_dLexer_disIdentStart = fun a0 -> match a0 with
  | (c) -> (bi_or) ((bi_or) ((v_Vuna_dLexer_disUpperChar) (c)) ((v_Vuna_dLexer_disLowerChar) (c))) ((bi_eq) (c) (95))

let rec v_Vuna_dLexer_disDigit = fun a0 -> match a0 with
  | (c) -> (bi_and) ((bi_ge) (c) (48)) ((bi_le) (c) (57))

let rec v_Vuna_dLoader_dallIdentChars = fun a0 -> match a0 with
  | (chars) -> (match chars with
  | [] -> true
  | (c) :: (rest) -> if (bi_or) ((v_Vuna_dLexer_disIdentStart) (c)) ((v_Vuna_dLexer_disDigit) (c)) then (v_Vuna_dLoader_dallIdentChars) (rest) else false)

let rec v_Vuna_dLoader_dvalidSegment = fun a0 -> match a0 with
  | (seg) -> (match (bi_str_unpack) (seg) with
  | [] -> false
  | (c) :: (rest) -> (bi_and) ((v_Vuna_dLexer_disUpperChar) (c)) ((v_Vuna_dLoader_dallIdentChars) (rest)))

let rec v_Vuna_dLoader_dallSegmentsValid = fun a0 -> match a0 with
  | (segs) -> (match segs with
  | [] -> false
  | (seg) :: (rest) -> if (v_Vuna_dLoader_dvalidSegment) (seg) then (match rest with
  | [] -> true
  | _ -> (v_Vuna_dLoader_dallSegmentsValid) (rest)) else false)

let rec v_Vuna_dLexer_disIdentChar = fun a0 -> match a0 with
  | (c) -> (bi_or) ((bi_or) ((v_Vuna_dLexer_disIdentStart) (c)) ((v_Vuna_dLexer_disDigit) (c))) ((bi_eq) (c) (39))

let rec v_Vuna_dLexer_disSpace = fun a0 -> match a0 with
  | (c) -> (bi_or) ((bi_or) ((bi_or) ((bi_eq) (c) (32)) ((bi_eq) (c) (9))) ((bi_eq) (c) (10))) ((bi_eq) (c) (13))

let rec v_Vuna_dLexer_disOpChar = fun a0 -> match a0 with
  | (c) -> (bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_eq) (c) (33)) ((bi_eq) (c) (36))) ((bi_eq) (c) (37))) ((bi_eq) (c) (38))) ((bi_eq) (c) (42))) ((bi_eq) (c) (43))) ((bi_eq) (c) (45))) ((bi_eq) (c) (47))) ((bi_eq) (c) (60))) ((bi_eq) (c) (61))) ((bi_eq) (c) (62))) ((bi_eq) (c) (63))) ((bi_eq) (c) (64))) ((bi_eq) (c) (92))) ((bi_eq) (c) (94))) ((bi_eq) (c) (124))) ((bi_eq) (c) (126))) ((bi_eq) (c) (58))

let rec v_Vuna_dLexer_disKeyword = fun a0 -> match a0 with
  | (s) -> (bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_eq) (s) ("data")) ((bi_eq) (s) ("case"))) ((bi_eq) (s) ("of"))) ((bi_eq) (s) ("let"))) ((bi_eq) (s) ("in"))) ((bi_eq) (s) ("if"))) ((bi_eq) (s) ("then"))) ((bi_eq) (s) ("else"))) ((bi_eq) (s) ("where"))) ((bi_eq) (s) ("Type"))) ((bi_eq) (s) ("import"))) ((bi_eq) (s) ("qualified"))) ((bi_eq) (s) ("as"))

let rec v_Vuna_dLexer_dclassifyIdent = fun a0 -> match a0 with
  | (s) -> if (v_Vuna_dLexer_disKeyword) (s) then C_Vuna_dLexer_dTKw (s) else C_Vuna_dLexer_dTIdent (s)

let rec v_Vuna_dLexer_dskipLineComment = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dChars ([], p)) -> C_Vuna_dLexer_dChars ([], p)
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p)) -> if (bi_eq) (c) (10) then C_Vuna_dLexer_dChars ((c) :: (rest), p) else (v_Vuna_dLexer_dskipLineComment) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p)))

let rec v_Vuna_dLexer_dskipBlockComment = fun a0 a1 -> match (a0, a1) with
  | (depth, cs) -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dErr ("unterminated block comment")
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> (match rest with
  | (c2) :: (rest2) -> if (bi_and) ((bi_eq) (c) (123)) ((bi_eq) (c2) (45)) then (v_Vuna_dLexer_dskipBlockComment) ((bi_add) (depth) (1)) (C_Vuna_dLexer_dChars (rest2, (v_Vuna_dLexer_dadvanceChar) (c2) ((v_Vuna_dLexer_dadvanceChar) (c) (p)))) else if (bi_and) ((bi_eq) (c) (45)) ((bi_eq) (c2) (125)) then if (bi_eq) (depth) (1) then C_Vuna_dBase_dOk (C_Vuna_dLexer_dChars (rest2, (v_Vuna_dLexer_dadvanceChar) (c2) ((v_Vuna_dLexer_dadvanceChar) (c) (p)))) else (v_Vuna_dLexer_dskipBlockComment) ((bi_sub) (depth) (1)) (C_Vuna_dLexer_dChars (rest2, (v_Vuna_dLexer_dadvanceChar) (c2) ((v_Vuna_dLexer_dadvanceChar) (c) (p)))) else (v_Vuna_dLexer_dskipBlockComment) (depth) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p)))
  | [] -> (v_Vuna_dLexer_dskipBlockComment) (depth) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p)))))

let rec v_Vuna_dLexer_dskipTrivia = fun a0 -> match a0 with
  | (cs) -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dOk (cs)
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> if (v_Vuna_dLexer_disSpace) (c) then (v_Vuna_dLexer_dskipTrivia) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) else (match rest with
  | (c2) :: (rest2) -> if (bi_and) ((bi_eq) (c) (45)) ((bi_eq) (c2) (45)) then (v_Vuna_dLexer_dskipTrivia) ((v_Vuna_dLexer_dskipLineComment) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p)))) else if (bi_and) ((bi_eq) (c) (123)) ((bi_eq) (c2) (45)) then (match (v_Vuna_dLexer_dskipBlockComment) (1) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (cs2) -> (v_Vuna_dLexer_dskipTrivia) (cs2)) else C_Vuna_dBase_dOk (cs)
  | [] -> C_Vuna_dBase_dOk (cs)))

let rec v_Vuna_dLexer_dcollectInt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if (v_Vuna_dLexer_disDigit) (c) then (v_Vuna_dLexer_dcollectInt) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((bi_add) ((bi_mul) (acc) (10)) ((bi_sub) (c) (48))) else C_Vuna_dBase_dPair (acc, C_Vuna_dLexer_dChars ((c) :: (rest), p))

let rec v_Vuna_dAst_dcollectClauses = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body) -> if (bi_eq) (n) (name) then (C_Vuna_dBase_dPair (pats, body)) :: ((v_Vuna_dAst_dcollectClauses) (rest) (name)) else (v_Vuna_dAst_dcollectClauses) (rest) (name)
  | _ -> (v_Vuna_dAst_dcollectClauses) (rest) (name))

let rec v_Vuna_dAst_dclausesFor = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (v_Vuna_dAst_dcollectClauses) (decls) (name)

let rec v_Vuna_dAst_dctorName = fun a0 -> match a0 with
  | (c) -> (match c with
  | C_Vuna_dAst_dCtor (name, ty, arity) -> name)

let rec v_Vuna_dAst_dctorType = fun a0 -> match a0 with
  | (c) -> (match c with
  | C_Vuna_dAst_dCtor (name, ty, arity) -> ty)

let rec v_Vuna_dAst_dtypeArity = fun a0 -> match a0 with
  | (ty) -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->"), (x) :: ((rest) :: ([]))) -> (bi_add) (1) ((v_Vuna_dAst_dtypeArity) (rest))
  | _ -> 0)

let rec v_Vuna_dAst_dctorArityOf = fun a0 -> match a0 with
  | (c) -> (match c with
  | C_Vuna_dAst_dCtor (name, ty, arity) -> arity)

let rec v_Vuna_dCodegen_dctorPairs = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (C_Vuna_dBase_dPair ((v_Vuna_dAst_dctorName) (c), (v_Vuna_dAst_dctorArityOf) (c))) :: ((v_Vuna_dCodegen_dctorPairs) (rest))

let rec v_Vuna_dAst_dlookupCtorArity = fun a0 a1 -> match (a0, a1) with
  | (name, ctors) -> (match ctors with
  | [] -> C_Vuna_dBase_dNothing
  | (c) :: (rest) -> if (bi_eq) ((v_Vuna_dAst_dctorName) (c)) (name) then C_Vuna_dBase_dJust ((v_Vuna_dAst_dctorArityOf) (c)) else (v_Vuna_dAst_dlookupCtorArity) (name) (rest))

let rec v_Vuna_dAst_dctorArity = fun a0 a1 -> match (a0, a1) with
  | (name, decls) -> (match decls with
  | [] -> C_Vuna_dBase_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> (match (v_Vuna_dAst_dlookupCtorArity) (name) (ctors) with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dJust (arity)
  | C_Vuna_dBase_dNothing -> (v_Vuna_dAst_dctorArity) (name) (rest))
  | _ -> (v_Vuna_dAst_dctorArity) (name) (rest)))

let rec v_Vuna_dCodegen_dcheckNoCtorFun = fun a0 a1 -> match (a0, a1) with
  | ([], decls) -> C_Vuna_dBase_dOk ([])
  | ((g) :: (rest), decls) -> (match g with
  | C_Vuna_dBase_dPair (name, clauses) -> (match (v_Vuna_dAst_dctorArity) (name) (decls) with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dErr ((bi_concat) ("name is both a constructor and a function: ") (name))
  | C_Vuna_dBase_dNothing -> (v_Vuna_dCodegen_dcheckNoCtorFun) (rest) (decls)))

let rec v_Vuna_dAst_ddeclTypeNames = fun a0 -> match a0 with
  | (d) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (name) :: ([])
  | _ -> [])

let rec v_Vuna_dBase_dappend = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (xs), ys) -> (x) :: ((v_Vuna_dBase_dappend) (xs) (ys))

let rec v_Vuna_dCodegen_daddClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clause, []) -> (C_Vuna_dBase_dPair (name, (clause) :: ([]))) :: ([])
  | (name, clause, (g) :: (rest)) -> (match g with
  | C_Vuna_dBase_dPair (gname, clauses) -> if (bi_eq) (gname) (name) then (C_Vuna_dBase_dPair (gname, (v_Vuna_dBase_dappend) (clauses) ((clause) :: ([])))) :: (rest) else (g) :: ((v_Vuna_dCodegen_daddClause) (name) (clause) (rest)))

let rec v_Vuna_dCodegen_dgroupFunctionsLoop = fun a0 a1 -> match (a0, a1) with
  | ([], groups) -> groups
  | ((d) :: (rest), groups) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> (v_Vuna_dCodegen_dgroupFunctionsLoop) (rest) ((v_Vuna_dCodegen_daddClause) (name) (C_Vuna_dBase_dPair (pats, body)) (groups))
  | _ -> (v_Vuna_dCodegen_dgroupFunctionsLoop) (rest) (groups))

let rec v_Vuna_dCodegen_dgroupFunctions = fun a0 -> match a0 with
  | (decls) -> (v_Vuna_dCodegen_dgroupFunctionsLoop) (decls) ([])

let rec v_Vuna_dCodegen_dallCtors = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> (v_Vuna_dBase_dappend) ((v_Vuna_dCodegen_dctorPairs) (ctors)) ((v_Vuna_dCodegen_dallCtors) (rest))
  | _ -> (v_Vuna_dCodegen_dallCtors) (rest))

let rec v_Vuna_dBase_dreverseOnto = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> acc
  | ((x) :: (xs), acc) -> (v_Vuna_dBase_dreverseOnto) (xs) ((x) :: (acc))

let rec v_Vuna_dBase_dreverse = fun a0 -> match a0 with
  | (xs) -> (v_Vuna_dBase_dreverseOnto) (xs) ([])

let rec v_Vuna_dLexer_dcollectIdent = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair ((bi_str_pack) ((v_Vuna_dBase_dreverse) (acc)), C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if (v_Vuna_dLexer_disIdentChar) (c) then (v_Vuna_dLexer_dcollectIdent) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((c) :: (acc)) else if (bi_eq) (c) (46) then (match rest with
  | (c2) :: (rest2) -> if (v_Vuna_dLexer_disIdentStart) (c2) then (v_Vuna_dLexer_dcollectIdent) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((c) :: (acc)) else C_Vuna_dBase_dPair ((bi_str_pack) ((v_Vuna_dBase_dreverse) (acc)), C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | [] -> C_Vuna_dBase_dPair ((bi_str_pack) ((v_Vuna_dBase_dreverse) (acc)), C_Vuna_dLexer_dChars ((c) :: (rest), p))) else C_Vuna_dBase_dPair ((bi_str_pack) ((v_Vuna_dBase_dreverse) (acc)), C_Vuna_dLexer_dChars ((c) :: (rest), p))

let rec v_Vuna_dLexer_dcollectOp = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dPair ((bi_str_pack) ((v_Vuna_dBase_dreverse) (acc)), C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if (v_Vuna_dLexer_disOpChar) (c) then (v_Vuna_dLexer_dcollectOp) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((c) :: (acc)) else C_Vuna_dBase_dPair ((bi_str_pack) ((v_Vuna_dBase_dreverse) (acc)), C_Vuna_dLexer_dChars ((c) :: (rest), p))

let rec v_Vuna_dLexer_dscanString = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if (bi_eq) (c) (34) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((bi_str_pack) ((v_Vuna_dBase_dreverse) (acc)), C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p)))) else if (bi_eq) (c) (10) then C_Vuna_dBase_dErr ("unterminated string literal") else if (bi_eq) (c) (92) then (v_Vuna_dLexer_dscanEscape) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) (acc) else (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((c) :: (acc))
and v_Vuna_dLexer_dscanEscape = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dBase_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if (bi_eq) (c) (110) then (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((10) :: (acc)) else if (bi_eq) (c) (116) then (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((9) :: (acc)) else if (bi_eq) (c) (114) then (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((13) :: (acc)) else if (bi_eq) (c) (34) then (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((34) :: (acc)) else if (bi_eq) (c) (92) then (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((92) :: (acc)) else if (bi_eq) (c) (39) then (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((39) :: (acc)) else C_Vuna_dBase_dErr ("unknown escape sequence")

let rec v_Vuna_dLexer_dlexChars = fun a0 -> match a0 with
  | (cs) -> (match (v_Vuna_dLexer_dskipTrivia) (cs) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (cs2) -> (match cs2 with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p)) :: ([]))
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> (v_Vuna_dLexer_dlexToken) (c) (rest) (p)))
and v_Vuna_dLexer_dlexToken = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (c, rest, p) -> if (v_Vuna_dLexer_disIdentStart) (c) then (match (v_Vuna_dLexer_dcollectIdent) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (name, cs2) -> (match (v_Vuna_dLexer_dlexChars) (cs2) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok ((v_Vuna_dLexer_dclassifyIdent) (name), p)) :: (toks)))) else if (v_Vuna_dLexer_disDigit) (c) then (match (v_Vuna_dLexer_dcollectInt) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((bi_sub) (c) (48)) with
  | C_Vuna_dBase_dPair (n, cs2) -> (match (v_Vuna_dLexer_dlexChars) (cs2) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p)) :: (toks)))) else if (bi_eq) (c) (34) then (match (v_Vuna_dLexer_dscanString) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ([]) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (p2) -> (match p2 with
  | C_Vuna_dBase_dPair (s, cs2) -> (match (v_Vuna_dLexer_dlexChars) (cs2) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p)) :: (toks))))) else if (bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_eq) (c) (40)) ((bi_eq) (c) (41))) ((bi_eq) (c) (91))) ((bi_eq) (c) (93))) ((bi_eq) (c) (44)) then (match (v_Vuna_dLexer_dlexChars) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ((bi_str_pack) ((c) :: ([]))), p)) :: (toks))) else if (v_Vuna_dLexer_disOpChar) (c) then (match (v_Vuna_dLexer_dcollectOp) (C_Vuna_dLexer_dChars (rest, (v_Vuna_dLexer_dadvanceChar) (c) (p))) ((c) :: ([])) with
  | C_Vuna_dBase_dPair (op, cs2) -> (match (v_Vuna_dLexer_dlexChars) (cs2) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (toks) -> C_Vuna_dBase_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (op), p)) :: (toks)))) else C_Vuna_dBase_dErr ("unexpected character")

let rec v_Vuna_dLexer_dlexSource = fun a0 -> match a0 with
  | (source) -> (v_Vuna_dLexer_dlexChars) (C_Vuna_dLexer_dChars ((bi_str_unpack) (source), C_Vuna_dLexer_dPos (1, 1)))

let rec v_Vuna_dBase_dlength = fun a0 -> match a0 with
  | ([]) -> 0
  | ((x) :: (xs)) -> (bi_add) (1) ((v_Vuna_dBase_dlength) (xs))

let rec v_Vuna_dCodegen_dcheckArities = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, expected, []) -> C_Vuna_dBase_dOk (expected)
  | (name, expected, (c) :: (rest)) -> (match c with
  | C_Vuna_dBase_dPair (pats, body) -> if (bi_eq) ((v_Vuna_dBase_dlength) (pats)) (expected) then (v_Vuna_dCodegen_dcheckArities) (name) (expected) (rest) else C_Vuna_dBase_dErr ((bi_concat) ("clauses for ") ((bi_concat) (name) (" have different arities"))))

let rec v_Vuna_dCodegen_darityOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dErr ((bi_concat) ("function ") ((bi_concat) (name) (" has no clauses")))
  | (name, (c) :: (rest)) -> (match c with
  | C_Vuna_dBase_dPair (pats, body) -> (v_Vuna_dCodegen_dcheckArities) (name) ((v_Vuna_dBase_dlength) (pats)) (rest))

let rec v_Vuna_dEval_dapplyCtor = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, name, args, arg) -> (match (v_Vuna_dAst_dctorArity) (name) (decls) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("unknown constructor: ") (name))
  | C_Vuna_dBase_dJust (arity) -> if (bi_ge) ((v_Vuna_dBase_dlength) (args)) (arity) then C_Vuna_dBase_dErr ((bi_concat) ("constructor ") ((bi_concat) (name) (" cannot take more arguments"))) else C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, (v_Vuna_dBase_dappend) (args) ((arg) :: ([])))))

let rec v_Vuna_dEval_dmatchPatterns = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> C_Vuna_dBase_dJust ([])
  | ((p) :: (ps), (v) :: (vs)) -> (match (v_Vuna_dEval_dmatchPattern) (p) (v) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs) -> (match (v_Vuna_dEval_dmatchPatterns) (ps) (vs) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dNothing
  | C_Vuna_dBase_dJust (bs2) -> C_Vuna_dBase_dJust ((v_Vuna_dBase_dappend) (bs) (bs2))))
  | (_, _) -> C_Vuna_dBase_dNothing
and v_Vuna_dEval_dmatchPattern = fun a0 a1 -> match (a0, a1) with
  | (p, v) -> (match p with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dJust ([])
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dJust ((C_Vuna_dBase_dPair (name, v)) :: ([]))
  | C_Vuna_dAst_dPInt (n) -> (match v with
  | C_Vuna_dEval_dVInt (m) -> if (bi_eq) (n) (m) then C_Vuna_dBase_dJust ([]) else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing)
  | C_Vuna_dAst_dPStr (s) -> (match v with
  | C_Vuna_dEval_dVStr (t) -> if (bi_eq) (s) (t) then C_Vuna_dBase_dJust ([]) else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing)
  | C_Vuna_dAst_dPCon (name, pats) -> (match v with
  | C_Vuna_dEval_dVCon (vname, vargs) -> if (bi_and) ((bi_eq) (name) (vname)) ((bi_eq) ((v_Vuna_dBase_dlength) (pats)) ((v_Vuna_dBase_dlength) (vargs))) then (v_Vuna_dEval_dmatchPatterns) (pats) (vargs) else C_Vuna_dBase_dNothing
  | _ -> C_Vuna_dBase_dNothing))

let rec v_Vuna_dAst_dfunArity = fun a0 a1 -> match (a0, a1) with
  | (name, decls) -> (match (v_Vuna_dAst_dclausesFor) (decls) (name) with
  | [] -> C_Vuna_dBase_dNothing
  | (c) :: (rest) -> (match c with
  | C_Vuna_dBase_dPair (pats, body) -> C_Vuna_dBase_dJust ((v_Vuna_dBase_dlength) (pats))))

let rec v_Vuna_dTypedCodegen_darityOf = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (match (v_Vuna_dAst_dfunArity) (name) (decls) with
  | C_Vuna_dBase_dJust (n) -> n
  | C_Vuna_dBase_dNothing -> 0)

let rec v_Vuna_dBase_dmap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (xs)) -> ((f) (x)) :: ((v_Vuna_dBase_dmap) (f) (xs))

let rec v_Vuna_dTypedCodegen_dgenParams = fun a0 -> match a0 with
  | (n) -> (v_Vuna_dBase_dmap) (fun i -> (bi_concat) ("a") ((bi_str_from_int) (i))) ((v_Vuna_dTypedCodegen_drange) (0) (n))

let rec v_Vuna_dTypedCodegen_dfieldVars = fun a0 -> match a0 with
  | (n) -> (v_Vuna_dBase_dmap) (fun i -> (bi_concat) ("f") ((bi_str_from_int) (i))) ((v_Vuna_dTypedCodegen_drange) (0) (n))

let rec v_Vuna_dTypedCodegen_dgenApp = fun a0 a1 -> match (a0, a1) with
  | (f, args) -> (bi_concat) ("(") ((bi_concat) (f) ((bi_concat) (") ") ((v_Vuna_dTypedCodegen_djoinWith) (" ") ((v_Vuna_dBase_dmap) (fun a -> (bi_concat) ("(") ((bi_concat) (a) (")"))) (args)))))

let rec v_Vuna_dTypecheck_dresolveTy = fun a0 a1 -> match (a0, a1) with
  | (s, ty) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match (v_Vuna_dTypecheck_dlookupSubst) (i) (s) with
  | C_Vuna_dBase_dJust (t) -> (v_Vuna_dTypecheck_dresolveTy) (s) (t)
  | C_Vuna_dBase_dNothing -> ty)
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, (v_Vuna_dBase_dmap) ((v_Vuna_dTypecheck_dresolveTy) (s)) (args))
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun ((v_Vuna_dTypecheck_dresolveTy) (s) (a), (v_Vuna_dTypecheck_dresolveTy) (s) (b)))

let rec v_Vuna_dTypecheck_doccursIn = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, s, ty) -> (match (v_Vuna_dTypecheck_dresolveTy) (s) (ty) with
  | C_Vuna_dTypecheck_dTVar (j) -> (bi_eq) (i) (j)
  | C_Vuna_dTypecheck_dTCon (n, args) -> (v_Vuna_dTypecheck_doccursInArgs) (i) (s) (args)
  | C_Vuna_dTypecheck_dTFun (a, b) -> (bi_or) ((v_Vuna_dTypecheck_doccursIn) (i) (s) (a)) ((v_Vuna_dTypecheck_doccursIn) (i) (s) (b)))
and v_Vuna_dTypecheck_doccursInArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, s, []) -> false
  | (i, s, (ty) :: (rest)) -> (bi_or) ((v_Vuna_dTypecheck_doccursIn) (i) (s) (ty)) ((v_Vuna_dTypecheck_doccursInArgs) (i) (s) (rest))

let rec v_Vuna_dTypecheck_drenameTy = fun a0 a1 -> match (a0, a1) with
  | (mapping, ty) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match (v_Vuna_dTypecheck_dlookupSubst) (i) (mapping) with
  | C_Vuna_dBase_dJust (t) -> t
  | C_Vuna_dBase_dNothing -> ty)
  | C_Vuna_dTypecheck_dTCon (n, args) -> C_Vuna_dTypecheck_dTCon (n, (v_Vuna_dBase_dmap) ((v_Vuna_dTypecheck_drenameTy) (mapping)) (args))
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dTypecheck_dTFun ((v_Vuna_dTypecheck_drenameTy) (mapping) (a), (v_Vuna_dTypecheck_drenameTy) (mapping) (b)))

let rec v_Vuna_dTypecheck_dinstantiate = fun a0 a1 -> match (a0, a1) with
  | (st, sch) -> (match sch with
  | C_Vuna_dTypecheck_dScheme (qs, ty) -> (match (v_Vuna_dTypecheck_dinstantiateVars) (qs) (st) with
  | C_Vuna_dBase_dPair (mapping, st2) -> C_Vuna_dBase_dPair ((v_Vuna_dTypecheck_drenameTy) (mapping) (ty), st2)))

let rec v_Vuna_dTypecheck_dfinalizeScheme = fun a0 a1 -> match (a0, a1) with
  | (subst, sch) -> (match sch with
  | C_Vuna_dTypecheck_dScheme (qs, ty) -> C_Vuna_dTypecheck_dScheme (qs, (v_Vuna_dTypecheck_dresolveTy) (subst) (ty)))

let rec v_Vuna_dTypecheck_dfinalizeGlobals = fun a0 a1 -> match (a0, a1) with
  | (subst, globals) -> (match globals with
  | [] -> []
  | (p) :: (rest) -> (match p with
  | C_Vuna_dBase_dPair (name, sch) -> (C_Vuna_dBase_dPair (name, (v_Vuna_dTypecheck_dfinalizeScheme) (subst) (sch))) :: ((v_Vuna_dTypecheck_dfinalizeGlobals) (subst) (rest))))

let rec v_Vuna_dLoader_dimportModuleNames = fun a0 -> match a0 with
  | (imports) -> (v_Vuna_dBase_dmap) (v_Vuna_dLoader_dimportName) (imports)

let rec v_Vuna_dAst_ddeclNames = fun a0 -> match a0 with
  | (d) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body) -> (name) :: ([])
  | C_Vuna_dAst_dDSig (name, ty) -> (name) :: ([])
  | C_Vuna_dAst_dDData (dname, params, ctors) -> (v_Vuna_dBase_dmap) (v_Vuna_dAst_dctorName) (ctors))

let rec v_Vuna_dAst_ddeclCtors = fun a0 -> match a0 with
  | (d) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> (v_Vuna_dBase_dmap) (v_Vuna_dAst_dctorName) (ctors)
  | _ -> [])

let rec v_Vuna_dBase_dtraverse = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (xs)) -> (match (f) (x) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (y) -> (match (v_Vuna_dBase_dtraverse) (f) (xs) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (ys) -> C_Vuna_dBase_dOk ((y) :: (ys))))

let rec v_Vuna_dBase_dandThen = fun a0 a1 -> match (a0, a1) with
  | (r, f) -> (match r with
  | C_Vuna_dBase_dOk (x) -> (f) (x)
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e))

let rec v_Vuna_dTypedCodegen_dmapResult = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> C_Vuna_dBase_dOk ([])
  | (f, (x) :: (rest)) -> (v_Vuna_dBase_dandThen) ((f) (x)) (fun y -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) (f) (rest)) (fun ys -> C_Vuna_dBase_dOk ((y) :: (ys))))

let rec v_Vuna_dEval_dvalueToChars = fun a0 -> match a0 with
  | (v) -> (match v with
  | C_Vuna_dEval_dVCon ("Nil", []) -> C_Vuna_dBase_dOk ([])
  | C_Vuna_dEval_dVCon ("Cons", (head) :: ((tail) :: ([]))) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dintArg) (head)) (fun n -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dvalueToChars) (tail)) (fun rest -> C_Vuna_dBase_dOk ((n) :: (rest))))
  | _ -> C_Vuna_dBase_dErr ("strPack expects a List Int"))

let rec v_Vuna_dEval_dint2 = fun a0 a1 -> match (a0, a1) with
  | (args, f) -> (match args with
  | (a) :: ((b) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dintArg) (a)) (fun x -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dintArg) (b)) (fun y -> (f) (x) (y)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments"))

let rec v_Vuna_dEval_dstr2 = fun a0 a1 -> match (a0, a1) with
  | (args, f) -> (match args with
  | (a) :: ((b) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (a)) (fun x -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (b)) (fun y -> (f) (x) (y)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments"))

let rec v_Vuna_dEval_ddivideBuiltin = fun a0 -> match a0 with
  | (args) -> (match args with
  | (a) :: ((b) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dintArg) (a)) (fun x -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dintArg) (b)) (fun y -> if (bi_eq) (y) (0) then C_Vuna_dBase_dErr ("division by zero") else C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt ((bi_div) (x) (y)))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for /"))

let rec v_Vuna_dEval_dcallBuiltin = fun a0 a1 -> match (a0, a1) with
  | (name, args) -> if (bi_eq) (name) ("+") then (v_Vuna_dEval_dint2) (args) (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt ((bi_add) (x) (y)))) else if (bi_eq) (name) ("-") then (v_Vuna_dEval_dint2) (args) (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt ((bi_sub) (x) (y)))) else if (bi_eq) (name) ("*") then (v_Vuna_dEval_dint2) (args) (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt ((bi_mul) (x) (y)))) else if (bi_eq) (name) ("/") then (v_Vuna_dEval_ddivideBuiltin) (args) else if (bi_eq) (name) ("==") then (v_Vuna_dEval_deqBuiltin) (args) else if (bi_eq) (name) ("/=") then (v_Vuna_dEval_dneqBuiltin) (args) else if (bi_eq) (name) ("<") then (v_Vuna_dEval_dint2) (args) (fun x y -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_lt) (x) (y)))) else if (bi_eq) (name) ("<=") then (v_Vuna_dEval_dint2) (args) (fun x y -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_le) (x) (y)))) else if (bi_eq) (name) (">") then (v_Vuna_dEval_dint2) (args) (fun x y -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_gt) (x) (y)))) else if (bi_eq) (name) (">=") then (v_Vuna_dEval_dint2) (args) (fun x y -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dvbool) ((bi_ge) (x) (y)))) else if (bi_eq) (name) ("&&") then (v_Vuna_dEval_dandBuiltin) (args) else if (bi_eq) (name) ("||") then (v_Vuna_dEval_dorBuiltin) (args) else if (bi_eq) (name) ("++") then (v_Vuna_dEval_dstr2) (args) (fun x y -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr ((bi_concat) (x) (y)))) else if (bi_eq) (name) ("strLength") then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (a)) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt ((bi_str_length) (s))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strLength")) else if (bi_eq) (name) ("strUnpack") then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (a)) (fun s -> C_Vuna_dBase_dOk ((v_Vuna_dEval_dstringToValue) (s)))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strUnpack")) else if (bi_eq) (name) ("strPack") then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dvalueToChars) (a)) (fun cs -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr ((bi_str_pack) (cs))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strPack")) else if (bi_eq) (name) ("strFromInt") then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dintArg) (a)) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr ((bi_str_from_int) (n))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for strFromInt")) else if (bi_eq) (name) ("readFile") then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (a)) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr ((bi_read_file) (s))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for readFile")) else if (bi_eq) (name) ("writeFile") then (match args with
  | (a) :: ((b) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (a)) (fun path -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (b)) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt ((bi_write_file) (path) (s)))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for writeFile")) else if (bi_eq) (name) ("print") then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dstringArg) (a)) (fun s -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt ((bi_print) (s))))
  | _ -> C_Vuna_dBase_dErr ("bad arguments for print")) else if (bi_eq) (name) ("getArgs") then C_Vuna_dBase_dOk ((v_Vuna_dEval_dstrListToValue) (bi_get_args ())) else C_Vuna_dBase_dErr ((bi_concat) ("unknown builtin: ") (name))

let rec v_Vuna_dEval_devalGlobalNonFun = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (match (v_Vuna_dAst_dctorArity) (name) (decls) with
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVCon (name, []))
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dBuiltins_dbuiltinArity) (name) with
  | C_Vuna_dBase_dJust (arity) -> if (bi_eq) (arity) (0) then (v_Vuna_dEval_dcallBuiltin) (name) ([]) else C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin (name, []))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("unbound variable: ") (name))))

let rec v_Vuna_dEval_dapplyBuiltin = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, name, args, arg) -> (match (v_Vuna_dBuiltins_dbuiltinArity) (name) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("unknown builtin: ") (name))
  | C_Vuna_dBase_dJust (arity) -> (let args2 = (v_Vuna_dBase_dappend) (args) ((arg) :: ([])) in if (bi_lt) ((v_Vuna_dBase_dlength) (args2)) (arity) then C_Vuna_dBase_dOk (C_Vuna_dEval_dVBuiltin (name, args2)) else if (bi_eq) ((v_Vuna_dBase_dlength) (args2)) (arity) then (v_Vuna_dEval_dcallBuiltin) (name) (args2) else C_Vuna_dBase_dErr ((bi_concat) ("too many arguments for builtin ") (name))))

let rec v_Vuna_dBase_dstep = fun a0 a1 -> match (a0, a1) with
  | (r, k) -> (match r with
  | C_Vuna_dBase_dOk (p) -> (match p with
  | C_Vuna_dBase_dPair (x, st) -> (k) (x) (st))
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e))

let rec v_Vuna_dParser_dparseImportAlias = fun a0 a1 -> match (a0, a1) with
  | (st, isQualified) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectIdent) (st)) (fun name st1 -> if (v_Vuna_dParser_datKw) (st1) ("as") then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st1) ("as")) (fun _u st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectIdent) (st2)) (fun alias st3 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dImport (name, isQualified, C_Vuna_dBase_dJust (alias)), st3)))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dImport (name, isQualified, C_Vuna_dBase_dNothing), st1)))

let rec v_Vuna_dParser_dparseImportSpec = fun a0 -> match a0 with
  | (st) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st) ("import")) (fun _u st1 -> if (v_Vuna_dParser_datKw) (st1) ("qualified") then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st1) ("qualified")) (fun _u st2 -> (v_Vuna_dParser_dparseImportAlias) (st2) (true)) else (v_Vuna_dParser_dparseImportAlias) (st1) (false))

let rec v_Vuna_dParser_dparseImports = fun a0 -> match a0 with
  | (st) -> if (v_Vuna_dParser_datKw) (st) ("import") then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseImportSpec) (st)) (fun imp st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseImports) (st1)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((imp) :: (rest), st2)))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))

let rec v_Vuna_dParser_dparseParams = fun a0 -> match a0 with
  | (st) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseParams) ((v_Vuna_dParser_dadvance) (st))) (fun rest st1 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((name) :: (rest), st1)))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))

let rec v_Vuna_dParser_dparseLambdaParams = fun a0 a1 -> match (a0, a1) with
  | (st, acc) -> if (v_Vuna_dParser_datSym) (st) (",") then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectIdent) ((v_Vuna_dParser_dadvance) (st))) (fun name st1 -> (v_Vuna_dParser_dparseLambdaParams) (st1) ((v_Vuna_dBase_dappend) (acc) ((name) :: ([])))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (acc, st))

let rec v_Vuna_dParser_dparsePatternSingle = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dParser_dparsePatternCons) (st) (blockCol)
and v_Vuna_dParser_dparsePatternCons = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternHead) (st) (blockCol)) (fun lhs st1 -> if (bi_and) ((v_Vuna_dParser_datSym) (st1) ("::")) ((v_Vuna_dParser_dcanContinue) (st1) (blockCol)) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternCons) ((v_Vuna_dParser_dadvance) (st1)) (blockCol)) (fun rhs st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Cons", (lhs) :: ((rhs) :: ([]))), st2))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st1)))
and v_Vuna_dParser_dparsePatternHead = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> if (v_Vuna_dParser_dupperFirst) (name) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternAtoms) ((v_Vuna_dParser_dadvance) (st)) (blockCol)) (fun args st1 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, args), st1))) else (v_Vuna_dParser_dparsePatternAtom) (st) (blockCol)
  | _ -> (v_Vuna_dParser_dparsePatternAtom) (st) (blockCol))
and v_Vuna_dParser_dparsePatternAtoms = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> if (bi_and) ((v_Vuna_dParser_dstartsPatternAtom) (st)) ((v_Vuna_dParser_dcanContinue) (st) (blockCol)) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternAtom) (st) (blockCol)) (fun pat st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternAtoms) (st1) (blockCol)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((pat) :: (rest), st2)))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparsePatternAtom = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent ("_"), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild, (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> if (v_Vuna_dParser_dupperFirst) (name) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name, []), (v_Vuna_dParser_dadvance) (st))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name), (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPInt (n), (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPStr (s), (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternSingle) ((v_Vuna_dParser_dadvance) (st)) (blockCol)) (fun inner st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st1) (")")) (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (inner, st2))))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> (v_Vuna_dParser_dparseListPattern) (st) (blockCol)
  | _ -> C_Vuna_dBase_dErr ("expected pattern"))
and v_Vuna_dParser_dparseListPattern = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st) ("[")) (fun _u st1 -> if (v_Vuna_dParser_datSym) (st1) ("]") then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon ("Nil", []), (v_Vuna_dParser_dadvance) (st1))) else (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseListPatternElems) (st1) (blockCol)) (fun pats st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((v_Vuna_dParser_dfoldPCon) (pats), st2))))
and v_Vuna_dParser_dparseListPatternElems = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternSingle) (st) (blockCol)) (fun pat st1 -> if (v_Vuna_dParser_datSym) (st1) (",") then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseListPatternElems) ((v_Vuna_dParser_dadvance) (st1)) (blockCol)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((pat) :: (rest), st2))) else if (v_Vuna_dParser_datSym) (st1) ("]") then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((pat) :: ([]), (v_Vuna_dParser_dadvance) (st1))) else C_Vuna_dBase_dErr ("expected , or ]"))

let rec v_Vuna_dParser_dparseClausePatterns = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> if (bi_and) ((v_Vuna_dParser_dstartsPatternAtom) (st)) ((v_Vuna_dParser_dcanContinue) (st) (blockCol)) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternAtom) (st) (blockCol)) (fun pat st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseClausePatterns) (st1) (blockCol)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((pat) :: (rest), st2)))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))

let rec v_Vuna_dParser_dparseExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (st, blockCol, minPrec) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dErr ("unexpected end of input") else if (v_Vuna_dParser_dcanContinue) (st) (blockCol) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseLhs) (st) (blockCol)) (fun lhs st1 -> (v_Vuna_dParser_dparseInfix) (st1) (blockCol) (minPrec) (lhs)) else C_Vuna_dBase_dErr ("expression is not indented enough")
and v_Vuna_dParser_dparseInfix = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (st, blockCol, minPrec, lhs) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (op), p) -> (match (v_Vuna_dParser_dinfixInfo) (op) with
  | C_Vuna_dBase_dJust (pr) -> (match pr with
  | C_Vuna_dBase_dPair (prec, assoc) -> if (bi_and) ((bi_ge) (prec) (minPrec)) ((v_Vuna_dParser_dcanContinue) (st) (blockCol)) then (let rhsPrec = if (bi_eq) (assoc) (0) then (bi_add) (prec) (1) else prec in (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) ((v_Vuna_dParser_dadvance) (st)) (blockCol) (rhsPrec)) (fun rhs st2 -> (v_Vuna_dParser_dparseInfix) (st2) (blockCol) (minPrec) (C_Vuna_dAst_dEApp ((v_Vuna_dParser_dopExpr) (op), (lhs) :: ((rhs) :: ([])))))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st)))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st)))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (lhs, st)))
and v_Vuna_dParser_dparseLhs = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("\\"), p) -> (v_Vuna_dParser_dparseLambda) (st) (blockCol)
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("let"), p) -> (v_Vuna_dParser_dparseLet) (st) (blockCol)
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("case"), p) -> (v_Vuna_dParser_dparseCase) (st) (blockCol)
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("if"), p) -> (v_Vuna_dParser_dparseIf) (st) (blockCol)
  | _ -> (v_Vuna_dParser_dparseApplication) (st) (blockCol))
and v_Vuna_dParser_dparseApplication = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseAtom) (st) (blockCol)) (fun first st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseArgs) (st1) (blockCol)) (fun args st2 -> (match args with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (first, st2))
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEApp (first, args), st2)))))
and v_Vuna_dParser_dparseArgs = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> if (bi_and) ((v_Vuna_dParser_dstartsAtom) (st)) ((v_Vuna_dParser_dcanContinue) (st) (blockCol)) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseAtom) (st) (blockCol)) (fun arg st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseArgs) (st1) (blockCol)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((arg) :: (rest), st2)))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
and v_Vuna_dParser_dparseAtom = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar (name), (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEInt (n), (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEStr (s), (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("Type"), p) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar ("Type"), (v_Vuna_dParser_dadvance) (st)))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("("), p) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) ((v_Vuna_dParser_dadvance) (st)) (blockCol) (0)) (fun inner st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st1) (")")) (fun _u st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (inner, st2))))
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym ("["), p) -> (v_Vuna_dParser_dparseListExpr) (st) (blockCol)
  | _ -> C_Vuna_dBase_dErr ("expected expression"))
and v_Vuna_dParser_dparseListExpr = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st) ("[")) (fun _u st1 -> if (v_Vuna_dParser_datSym) (st1) ("]") then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEVar ("Nil"), (v_Vuna_dParser_dadvance) (st1))) else (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseListExprElems) (st1) (blockCol)) (fun elems st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((v_Vuna_dParser_dfoldCons) (elems), st2))))
and v_Vuna_dParser_dparseListExprElems = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st) (blockCol) (0)) (fun e st1 -> if (v_Vuna_dParser_datSym) (st1) (",") then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseListExprElems) ((v_Vuna_dParser_dadvance) (st1)) (blockCol)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((e) :: (rest), st2))) else if (v_Vuna_dParser_datSym) (st1) ("]") then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((e) :: ([]), (v_Vuna_dParser_dadvance) (st1))) else C_Vuna_dBase_dErr ("expected , or ]"))
and v_Vuna_dParser_dparseLambda = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st) ("\\")) (fun _u st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectIdent) (st1)) (fun first st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseLambdaParams) (st2) ((first) :: ([]))) (fun params st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st3) ("=>")) (fun _u st4 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st4) (blockCol) (0)) (fun body st5 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dELam (params, body), st5)))))))
and v_Vuna_dParser_dparseLet = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st) ("let")) (fun _u st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseLetBindings) (st1) (blockCol)) (fun binds st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st2) ("in")) (fun _u st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st3) (blockCol) (0)) (fun body st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dELet (binds, body), st4))))))
and v_Vuna_dParser_dparseLetBindings = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dErr ("expected a let binding") else if (v_Vuna_dParser_datKw) (st) ("in") then C_Vuna_dBase_dErr ("expected a let binding") else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_le) (col) (blockCol) then C_Vuna_dBase_dErr ("let binding is not indented enough") else (v_Vuna_dParser_dparseLetBindingsAt) (st) (col))
and v_Vuna_dParser_dparseLetBindingsAt = fun a0 a1 -> match (a0, a1) with
  | (st, declCol) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)) else if (v_Vuna_dParser_datKw) (st) ("in") then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)) else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_eq) (col) (declCol) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternSingle) (st) (declCol)) (fun pat st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st1) ("=")) (fun _u st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st2) (declCol) (0)) (fun value st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseLetBindingsAt) (st3) (declCol)) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (pat, value)) :: (rest), st4)))))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))
and v_Vuna_dParser_dparseCase = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st) ("case")) (fun _u st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st1) (blockCol) (0)) (fun scrut st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st2) ("of")) (fun _u st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseCaseAlts) (st3) (blockCol)) (fun alts st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dECase (scrut, alts), st4))))))
and v_Vuna_dParser_dparseCaseAlts = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dErr ("case expression needs an alternative") else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_le) (col) (blockCol) then C_Vuna_dBase_dErr ("case alternative is not indented enough") else (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseAltList) (st) (col)) (fun alts st2 -> if (v_Vuna_dParser_dbadCaseIndent) (st2) (col) then C_Vuna_dBase_dErr ("unexpected indentation after case alternative") else (match alts with
  | [] -> C_Vuna_dBase_dErr ("case expression needs an alternative")
  | _ -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (alts, st2)))))
and v_Vuna_dParser_dparseAltList = fun a0 a1 -> match (a0, a1) with
  | (st, altCol) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)) else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_eq) (col) (altCol) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparsePatternSingle) (st) (altCol)) (fun pat st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st1) ("=>")) (fun _u st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st2) (altCol) (0)) (fun body st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseAltList) (st3) (altCol)) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (pat, body)) :: (rest), st4)))))) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))
and v_Vuna_dParser_dparseIf = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st) ("if")) (fun _u st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st1) (blockCol) (0)) (fun cond st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st2) ("then")) (fun _u st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st3) (blockCol) (0)) (fun yes st4 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st4) ("else")) (fun _u st5 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st5) (blockCol) (0)) (fun no st6 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dEIf (cond, yes, no), st6))))))))

let rec v_Vuna_dParser_dparseSignature = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (st, blockCol, name) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st) (":")) (fun _u st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st1) (blockCol) (0)) (fun ty st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDSig (name, ty), st2))))

let rec v_Vuna_dParser_dparseClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (st, blockCol, name) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseClausePatterns) (st) (blockCol)) (fun pats st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st1) ("=")) (fun _u st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st2) (blockCol) (0)) (fun body st3 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDFun (name, pats, body), st3)))))

let rec v_Vuna_dParser_dparseCtorList = fun a0 a1 -> match (a0, a1) with
  | (st, ctorCol) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)) else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_eq) (col) (ctorCol) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectIdent) (st)) (fun name st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st1) (":")) (fun _u st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st2) (ctorCol) (0)) (fun ty st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseCtorList) (st3) (ctorCol)) (fun rest st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dAst_dCtor (name, ty, (v_Vuna_dParser_dcountArrows) (ty))) :: (rest), st4)))))) else if (bi_gt) (col) (ctorCol) then C_Vuna_dBase_dErr ("unexpected indentation in data block") else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))

let rec v_Vuna_dParser_dparseCtors = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)) else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_gt) (col) (blockCol) then (v_Vuna_dParser_dparseCtorList) (st) (col) else C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)))

let rec v_Vuna_dParser_dparseData = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st) ("data")) (fun _u st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectIdent) (st1)) (fun name st2 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseParams) (st2)) (fun params st3 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectSym) (st3) (":")) (fun _u st4 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseExpr) (st4) (blockCol) (0)) (fun ty st5 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dexpectKw) (st5) ("where")) (fun _u st6 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseCtors) (st6) (blockCol)) (fun ctors st7 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dDData (name, params, ctors), st7)))))))))

let rec v_Vuna_dParser_dparseDecl = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> (match (v_Vuna_dParser_dpeekTok) (st) with
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTKw ("data"), p) -> (v_Vuna_dParser_dparseData) (st) (blockCol)
  | C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTIdent (name), p) -> (let st1 = (v_Vuna_dParser_dadvance) (st) in if (v_Vuna_dParser_datSym) (st1) (":") then (v_Vuna_dParser_dparseSignature) (st1) (blockCol) (name) else (v_Vuna_dParser_dparseClause) (st1) (blockCol) (name))
  | _ -> C_Vuna_dBase_dErr ("expected a top-level declaration"))

let rec v_Vuna_dParser_dparseDecls = fun a0 a1 -> match (a0, a1) with
  | (st, blockCol) -> if (v_Vuna_dParser_disEof) (st) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st)) else (match (v_Vuna_dParser_dpeekPos) (st) with
  | C_Vuna_dLexer_dPos (line, col) -> if (bi_eq) (col) (blockCol) then (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseDecl) (st) (blockCol)) (fun decl st1 -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseDecls) (st1) (blockCol)) (fun rest st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((decl) :: (rest), st2)))) else C_Vuna_dBase_dErr ((bi_concat) ("expected a declaration at column ") ((bi_str_from_int) (blockCol))))

let rec v_Vuna_dParser_dparseProgram = fun a0 -> match a0 with
  | (st) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseImports) (st)) (fun imports st1 -> if (v_Vuna_dParser_disEof) (st1) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, [])) else (match (v_Vuna_dParser_dpeekPos) (st1) with
  | C_Vuna_dLexer_dPos (line, col) -> (v_Vuna_dBase_dstep) ((v_Vuna_dParser_dparseDecls) (st1) (col)) (fun decls st2 -> if (v_Vuna_dParser_disEof) (st2) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (imports, decls)) else C_Vuna_dBase_dErr ("expected end of input"))))

let rec v_Vuna_dParser_dparseSource = fun a0 -> match a0 with
  | (source) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLexer_dlexSource) (source)) (fun toks -> (v_Vuna_dParser_dparseProgram) (C_Vuna_dParser_dPState (toks, C_Vuna_dLexer_dPos (1, 0))))

let rec v_Vuna_dBase_dconcatMap = fun a0 a1 -> match (a0, a1) with
  | (f, []) -> []
  | (f, (x) :: (rest)) -> (v_Vuna_dBase_dappend) ((f) (x)) ((v_Vuna_dBase_dconcatMap) (f) (rest))

let rec v_Vuna_dTypedCodegen_dpatVars = fun a0 -> match a0 with
  | (pat) -> (match pat with
  | C_Vuna_dAst_dPWild -> []
  | C_Vuna_dAst_dPVar (name) -> (name) :: ([])
  | C_Vuna_dAst_dPInt (n) -> []
  | C_Vuna_dAst_dPStr (s) -> []
  | C_Vuna_dAst_dPCon (name, pats) -> (v_Vuna_dBase_dconcatMap) (v_Vuna_dTypedCodegen_dpatVars) (pats))

let rec v_Vuna_dCodegen_dsanitizeName = fun a0 -> match a0 with
  | (name) -> (bi_str_pack) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dCodegen_dsanitizeChar) ((bi_str_unpack) (name)))

let rec v_Vuna_dTypedCodegen_dtypeNameOf = fun a0 -> match a0 with
  | (name) -> (bi_concat) ("t_") ((v_Vuna_dCodegen_dsanitizeName) (name))

let rec v_Vuna_dTypedCodegen_dctorNameOf = fun a0 -> match a0 with
  | (name) -> (bi_concat) ("C_") ((v_Vuna_dCodegen_dsanitizeName) (name))

let rec v_Vuna_dTypedCodegen_dvalueName = fun a0 -> match a0 with
  | (name) -> (bi_concat) ("v_") ((v_Vuna_dCodegen_dsanitizeName) (name))

let rec v_Vuna_dTypedCodegen_dshowNameOf = fun a0 -> match a0 with
  | (name) -> (bi_concat) ("show_") ((v_Vuna_dCodegen_dsanitizeName) (name))

let rec v_Vuna_dTypedCodegen_dshowAnnotation = fun a0 a1 -> match (a0, a1) with
  | (params, name) -> (let vars = (v_Vuna_dTypedCodegen_dparamVars) (params) in (bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (" ") (vars)) ((bi_concat) (". ") ((v_Vuna_dTypedCodegen_djoinWith) (" -> ") ((v_Vuna_dBase_dappend) ((v_Vuna_dBase_dmap) (fun v -> (bi_concat) ("(") ((bi_concat) (v) (" -> string)"))) (vars)) (((v_Vuna_dTypedCodegen_dappType) (vars) ((v_Vuna_dTypedCodegen_dtypeNameOf) (name))) :: (("string") :: ([])))))))

let rec v_Vuna_dTypedCodegen_dgenShowBody = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (pmap, params, name, arms) -> (match (v_Vuna_dBase_dmap) (v_Vuna_dTypedCodegen_dpairSecond) (pmap) with
  | [] -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dshowNameOf) (name)) ((bi_concat) (" v =\n  match v with\n") ((v_Vuna_dTypedCodegen_djoinWith) ("\n") (arms))))
  | pvars -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dshowNameOf) (name)) ((bi_concat) (" : ") ((bi_concat) ((v_Vuna_dTypedCodegen_dshowAnnotation) (params) (name)) ((bi_concat) (" = fun ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (" ") ((v_Vuna_dBase_dappend) (pvars) (("v") :: ([])))) ((bi_concat) (" -> match v with\n") ((v_Vuna_dTypedCodegen_djoinWith) ("\n") (arms)))))))))

let rec v_Vuna_dCodegen_docamlString = fun a0 -> match a0 with
  | (s) -> (bi_concat) ("\"") ((bi_concat) ((bi_str_pack) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dCodegen_descapeChar) ((bi_str_unpack) (s)))) ("\""))

let rec v_Vuna_dTypedCodegen_dgenPat = fun a0 -> match a0 with
  | (pat) -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk ("_")
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dOk ((v_Vuna_dCodegen_dsanitizeName) (name))
  | C_Vuna_dAst_dPInt (n) -> C_Vuna_dBase_dOk ((bi_str_from_int) (n))
  | C_Vuna_dAst_dPStr (s) -> C_Vuna_dBase_dOk ((v_Vuna_dCodegen_docamlString) (s))
  | C_Vuna_dAst_dPCon (name, pats) -> if (bi_eq) (name) ("Nil") then C_Vuna_dBase_dOk ("[]") else if (bi_eq) (name) ("True") then C_Vuna_dBase_dOk ("true") else if (bi_eq) (name) ("False") then C_Vuna_dBase_dOk ("false") else if (bi_eq) (name) ("Cons") then (match pats with
  | (h) :: ((t) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenPat) (h)) (fun ph -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenPat) (t)) (fun pt -> C_Vuna_dBase_dOk ((bi_concat) ("(") ((bi_concat) (ph) ((bi_concat) (") :: (") ((bi_concat) (pt) (")")))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: Cons pattern arity")) else (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) (v_Vuna_dTypedCodegen_dgenPat) (pats)) (fun ps -> (match ps with
  | [] -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dctorNameOf) (name))
  | (p) :: ([]) -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" ") ((bi_concat) ("(") ((bi_concat) (p) (")")))))
  | _ -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" (") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (", ") (ps)) (")")))))))

let rec v_Vuna_dCodegen_dpconPattern = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> (bi_concat) ("VCon (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) (", [])"))
  | (name, pats) -> (bi_concat) ("VCon (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) ((bi_concat) (", [") ((bi_concat) ((v_Vuna_dCodegen_djoinList) ("; ") (pats)) ("])"))))

let rec v_Vuna_dCodegen_dwrapFun = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (name, params, matchCode, k) -> if (bi_eq) (k) ((bi_sub) ((v_Vuna_dBase_dlength) (params)) (1)) then (bi_concat) ("(fun ") ((bi_concat) ((v_Vuna_dCodegen_dnthList) (k) (params)) ((bi_concat) (" -> ") ((bi_concat) (matchCode) (")")))) else (bi_concat) ("(fun ") ((bi_concat) ((v_Vuna_dCodegen_dnthList) (k) (params)) ((bi_concat) (" -> VFun (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) ((bi_concat) (", ") ((bi_concat) ((v_Vuna_dCodegen_dwrapFun) (name) (params) (matchCode) ((bi_add) (k) (1))) ("))"))))))

let rec v_Vuna_dCodegen_dwrapCtor = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (name, params, body, k) -> if (bi_eq) (k) ((bi_sub) ((v_Vuna_dBase_dlength) (params)) (1)) then (bi_concat) ("(fun ") ((bi_concat) ((v_Vuna_dCodegen_dnthList) (k) (params)) ((bi_concat) (" -> ") ((bi_concat) (body) (")")))) else (bi_concat) ("(fun ") ((bi_concat) ((v_Vuna_dCodegen_dnthList) (k) (params)) ((bi_concat) (" -> VFun (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) ((bi_concat) (", ") ((bi_concat) ((v_Vuna_dCodegen_dwrapCtor) (name) (params) (body) ((bi_add) (k) (1))) ("))"))))))

let rec v_Vuna_dCodegen_dgenCtor = fun a0 -> match a0 with
  | (c) -> (match c with
  | C_Vuna_dBase_dPair (name, arity) -> if (bi_eq) (arity) (0) then C_Vuna_dBase_dOk ("") else (let params = (v_Vuna_dCodegen_dmakeCtorParams) (arity) in (let body = (bi_concat) ("VCon (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) ((bi_concat) (", [") ((bi_concat) ((v_Vuna_dCodegen_djoinList) ("; ") (params)) ("])")))) in C_Vuna_dBase_dOk ((bi_concat) ("let mk_") ((bi_concat) ((v_Vuna_dCodegen_dsanitizeName) (name)) ((bi_concat) (" = ") ((bi_concat) ((v_Vuna_dCodegen_dwrapCtor) (name) (params) (body) (0)) ("\n"))))))))

let rec v_Vuna_dCodegen_dgenCtorDefs = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ("")
  | ((c) :: (rest)) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenCtor) (c)) (fun def -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenCtorDefs) (rest)) (fun restDefs -> C_Vuna_dBase_dOk ((bi_concat) (def) (restDefs))))

let rec v_Vuna_dCodegen_dgenBuiltinDef = fun a0 -> match a0 with
  | ([]) -> ""
  | ((b) :: (rest)) -> (match b with
  | C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body) -> (let def = if (bi_eq) (arity) (0) then (bi_concat) ("let ") ((bi_concat) (ocname) ((bi_concat) (" = fun () -> ") ((bi_concat) (body) ("\n")))) else if (bi_eq) (arity) (1) then (bi_concat) ("let ") ((bi_concat) (ocname) ((bi_concat) (" = fun a -> ") ((bi_concat) (body) ("\n")))) else (bi_concat) ("let ") ((bi_concat) (ocname) ((bi_concat) (" = fun a -> VFun (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (vname)) ((bi_concat) (", fun b -> ") ((bi_concat) (body) (")\n")))))) in (bi_concat) (def) ((v_Vuna_dCodegen_dgenBuiltinDef) (rest))))

let rec v_Vuna_dAst_dtopNames = fun a0 -> match a0 with
  | (decls) -> (v_Vuna_dBase_dconcatMap) (v_Vuna_dAst_ddeclNames) (decls)

let rec v_Vuna_dAst_dctorsOf = fun a0 -> match a0 with
  | (decls) -> (v_Vuna_dBase_dconcatMap) (v_Vuna_dAst_ddeclCtors) (decls)

let rec v_Vuna_dLoader_dmoduleCtors = fun a0 a1 -> match (a0, a1) with
  | (modules, name) -> (v_Vuna_dAst_dctorsOf) ((v_Vuna_dLoader_dmoduleDecls) (modules) (name))

let rec v_Vuna_dAst_dtypeNamesOf = fun a0 -> match a0 with
  | (decls) -> (v_Vuna_dBase_dconcatMap) (v_Vuna_dAst_ddeclTypeNames) (decls)

let rec v_Vuna_dLoader_dtypeExportsOf = fun a0 a1 -> match (a0, a1) with
  | (modules, name) -> (v_Vuna_dAst_dtypeNamesOf) ((v_Vuna_dLoader_dmoduleDecls) (modules) (name))

let rec v_Vuna_dBase_dmemName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (x) :: (rest)) -> if (bi_eq) (x) (name) then true else (v_Vuna_dBase_dmemName) (name) (rest)

let rec v_Vuna_dTypedCodegen_dgenArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, args) -> (v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env)) (args)
and v_Vuna_dTypedCodegen_dgenExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> if (v_Vuna_dBase_dmemName) (name) (env) then C_Vuna_dBase_dOk ((v_Vuna_dCodegen_dsanitizeName) (name)) else (match (v_Vuna_dAst_dctorArity) (name) (decls) with
  | C_Vuna_dBase_dJust (arity) -> if (bi_eq) (name) ("Nil") then C_Vuna_dBase_dOk ("[]") else if (bi_eq) (name) ("True") then C_Vuna_dBase_dOk ("true") else if (bi_eq) (name) ("False") then C_Vuna_dBase_dOk ("false") else if (bi_eq) (arity) (0) then C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) else C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: constructor ") ((bi_concat) (name) (" used without arguments")))
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dTypedCodegen_dbuiltinName) (name) with
  | C_Vuna_dBase_dJust (ref) -> if (bi_eq) (name) ("getArgs") then C_Vuna_dBase_dOk ("bi_get_args ()") else C_Vuna_dBase_dOk (ref)
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dAst_dfunArity) (name) (decls) with
  | C_Vuna_dBase_dJust (0) -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dvalueName) (name)) (" ()"))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dvalueName) (name))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: unbound variable ") (name)))))
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk ((bi_str_from_int) (n))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk ((v_Vuna_dCodegen_docamlString) (s))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar (name) -> (match (v_Vuna_dAst_dctorArity) (name) (decls) with
  | C_Vuna_dBase_dJust (arity) -> if (bi_or) ((bi_or) ((bi_eq) (name) ("Nil")) ((bi_eq) (name) ("True"))) ((bi_eq) (name) ("False")) then C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: constructor ") ((bi_concat) (name) (" cannot take arguments"))) else if (bi_eq) (name) ("Cons") then (match args with
  | (h) :: ((t) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (h)) (fun ph -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (t)) (fun pt -> C_Vuna_dBase_dOk ((bi_concat) ("(") ((bi_concat) (ph) ((bi_concat) (") :: (") ((bi_concat) (pt) (")")))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: Cons arity")) else if (bi_eq) ((v_Vuna_dBase_dlength) (args)) (arity) then (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenArgs) (decls) (env) (args)) (fun as2 -> (match as2 with
  | (a) :: ([]) -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" (") ((bi_concat) (a) (")"))))
  | _ -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" (") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (", ") (as2)) (")")))))) else C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: partial constructor ") (name))
  | C_Vuna_dBase_dNothing -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (fn)) (fun f -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenArgs) (decls) (env) (args)) (fun as2 -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dgenApp) (f) (as2)))))
  | _ -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (fn)) (fun f -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenArgs) (decls) (env) (args)) (fun as2 -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dgenApp) (f) (as2)))))
  | C_Vuna_dAst_dELam (params, body) -> (let env2 = (v_Vuna_dBase_dappend) (params) (env) in (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env2) (body)) (fun b -> C_Vuna_dBase_dOk ((bi_concat) ("fun ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (" ") ((v_Vuna_dBase_dmap) (v_Vuna_dCodegen_dsanitizeName) (params))) ((bi_concat) (" -> ") (b))))))
  | C_Vuna_dAst_dELet (binds, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenBinds) (decls) (env) (binds) (body)) (fun b -> C_Vuna_dBase_dOk ((bi_concat) ("(") ((bi_concat) (b) (")"))))
  | C_Vuna_dAst_dECase (scrut, alts) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (scrut)) (fun s -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenAlt) (decls) (env)) (alts)) (fun arms -> C_Vuna_dBase_dOk ((bi_concat) ("(match ") ((bi_concat) (s) ((bi_concat) (" with\n") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) ("\n") (arms)) (")")))))))
  | C_Vuna_dAst_dEIf (c, t, e) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (c)) (fun gc -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (t)) (fun gt -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (e)) (fun ge -> C_Vuna_dBase_dOk ((bi_concat) ("if ") ((bi_concat) (gc) ((bi_concat) (" then ") ((bi_concat) (gt) ((bi_concat) (" else ") (ge))))))))))
and v_Vuna_dTypedCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, alt) -> (match alt with
  | C_Vuna_dBase_dPair (pat, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenPat) (pat)) (fun p -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) ((v_Vuna_dBase_dappend) ((v_Vuna_dTypedCodegen_dpatVars) (pat)) (env)) (body)) (fun b -> C_Vuna_dBase_dOk ((bi_concat) ("  | ") ((bi_concat) (p) ((bi_concat) (" -> ") (b)))))))
and v_Vuna_dTypedCodegen_dgenBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, [], body) -> (v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (body)
  | (decls, env, (b) :: (rest), body) -> (match b with
  | C_Vuna_dBase_dPair (pat, value) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenPat) (pat)) (fun p -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) (env) (value)) (fun v -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenBinds) (decls) ((v_Vuna_dBase_dappend) ((v_Vuna_dTypedCodegen_dpatVars) (pat)) (env)) (rest) (body)) (fun r -> C_Vuna_dBase_dOk ((bi_concat) ("let ") ((bi_concat) (p) ((bi_concat) (" = ") ((bi_concat) (v) ((bi_concat) (" in ") (r))))))))))

let rec v_Vuna_dTypedCodegen_dgenClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, clause) -> (match clause with
  | C_Vuna_dBase_dPair (pats, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) (v_Vuna_dTypedCodegen_dgenPat) (pats)) (fun ps -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) ((v_Vuna_dBase_dappend) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dTypedCodegen_dpatVars) (pats)) (env)) (body)) (fun b -> C_Vuna_dBase_dOk ((bi_concat) ("  | (") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (", ") (ps)) ((bi_concat) (") -> ") (b)))))))

let rec v_Vuna_dTypedCodegen_dgenFunction = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (match (v_Vuna_dAst_dfunArity) (name) (decls) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: unknown function ") (name))
  | C_Vuna_dBase_dJust (arity) -> (match (v_Vuna_dAst_dclausesFor) (decls) (name) with
  | [] -> C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: no clauses for ") (name))
  | (first) :: (rest) -> (let params = (v_Vuna_dTypedCodegen_dgenParams) (arity) in if (bi_eq) (arity) (0) then (match first with
  | C_Vuna_dBase_dPair (pats, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenExpr) (decls) ([]) (body)) (fun b -> C_Vuna_dBase_dOk ((bi_concat) ("fun () -> ") (b)))) else (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenClause) (decls) ([])) ((v_Vuna_dAst_dclausesFor) (decls) (name))) (fun arms -> (let matched = if (bi_eq) (arity) (1) then "a0" else (bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (", ") (params)) (")")) in C_Vuna_dBase_dOk ((bi_concat) ("fun ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (" ") (params)) ((bi_concat) (" -> match ") ((bi_concat) (matched) ((bi_concat) (" with\n") ((v_Vuna_dTypedCodegen_djoinWith) ("\n") (arms))))))))))))

let rec v_Vuna_dTypedCodegen_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if (bi_eq) (name) ("") then (v_Vuna_dTypedCodegen_duniqueNames) (rest) else if (v_Vuna_dBase_dmemName) (name) (rest) then (v_Vuna_dTypedCodegen_duniqueNames) (rest) else (name) :: ((v_Vuna_dTypedCodegen_duniqueNames) (rest))

let rec v_Vuna_dTypedCodegen_dfunctionNames = fun a0 -> match a0 with
  | (decls) -> (v_Vuna_dTypedCodegen_duniqueNames) ((v_Vuna_dBase_dmap) (v_Vuna_dTypedCodegen_ddeclFunName) (decls))

let rec v_Vuna_dTypedCodegen_dnotIn = fun a0 a1 -> match (a0, a1) with
  | (name, names) -> if (v_Vuna_dBase_dmemName) (name) (names) then false else true

let rec v_Vuna_dTypedCodegen_ddfsReach = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, pending, visited) -> (match pending with
  | [] -> visited
  | (n) :: (rest) -> if (v_Vuna_dBase_dmemName) (n) (visited) then (v_Vuna_dTypedCodegen_ddfsReach) (adj) (rest) (visited) else (v_Vuna_dTypedCodegen_ddfsReach) (adj) ((v_Vuna_dBase_dappend) ((v_Vuna_dTypedCodegen_dneighborsOf) (adj) (n)) (rest)) ((n) :: (visited)))

let rec v_Vuna_dTypedCodegen_dreachable = fun a0 a1 -> match (a0, a1) with
  | (adj, start) -> (v_Vuna_dTypedCodegen_ddfsReach) (adj) ((start) :: ([])) ([])

let rec v_Vuna_dTypedCodegen_dsameGroup = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, a, b) -> (bi_and) ((v_Vuna_dBase_dmemName) (b) ((v_Vuna_dTypedCodegen_dreachable) (adj) (a))) ((v_Vuna_dBase_dmemName) (a) ((v_Vuna_dTypedCodegen_dreachable) (adj) (b)))

let rec v_Vuna_dTypedCodegen_dmakeGroups = fun a0 a1 -> match (a0, a1) with
  | (adj, names) -> (match names with
  | [] -> []
  | (n) :: (rest) -> (let same = (v_Vuna_dTypedCodegen_dfilterNames) (fun m -> (v_Vuna_dTypedCodegen_dsameGroup) (adj) (n) (m)) (rest) in (let group = (n) :: (same) in (group) :: ((v_Vuna_dTypedCodegen_dmakeGroups) (adj) ((v_Vuna_dTypedCodegen_dfilterNames) (fun m -> (v_Vuna_dTypedCodegen_dnotIn) (m) (group)) (rest))))))

let rec v_Vuna_dTypedCodegen_dgroupDeps = fun a0 a1 -> match (a0, a1) with
  | (adj, group) -> (v_Vuna_dTypedCodegen_dfilterNames) (fun n -> (v_Vuna_dTypedCodegen_dnotIn) (n) (group)) ((v_Vuna_dTypedCodegen_duniqueNames) ((v_Vuna_dBase_dconcatMap) ((v_Vuna_dTypedCodegen_dneighborsOf) (adj)) (group)))

let rec v_Vuna_dTypedCodegen_dallIn = fun a0 a1 -> match (a0, a1) with
  | (names, allowed) -> (match names with
  | [] -> true
  | (n) :: (rest) -> if (v_Vuna_dBase_dmemName) (n) (allowed) then (v_Vuna_dTypedCodegen_dallIn) (rest) (allowed) else false)

let rec v_Vuna_dTypedCodegen_dgroupReady = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, group, emitted) -> (v_Vuna_dTypedCodegen_dallIn) ((v_Vuna_dTypedCodegen_dgroupDeps) (adj) (group)) (emitted)

let rec v_Vuna_dTypedCodegen_dpickReadyAcc = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], before, emitted) -> C_Vuna_dBase_dNothing
  | (adj, (g) :: (rest), before, emitted) -> if (v_Vuna_dTypedCodegen_dgroupReady) (adj) (g) (emitted) then C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (g, (v_Vuna_dBase_dappend) ((v_Vuna_dBase_dreverse) (before)) (rest))) else (v_Vuna_dTypedCodegen_dpickReadyAcc) (adj) (rest) ((g) :: (before)) (emitted)

let rec v_Vuna_dTypedCodegen_dpickReady = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, groups, emitted) -> (v_Vuna_dTypedCodegen_dpickReadyAcc) (adj) (groups) ([]) (emitted)

let rec v_Vuna_dTypedCodegen_dorderGroupsAcc = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, [], emitted) -> C_Vuna_dBase_dOk ([])
  | (adj, remaining, emitted) -> (match (v_Vuna_dTypedCodegen_dpickReady) (adj) (remaining) (emitted) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: dependency cycle between groups")
  | C_Vuna_dBase_dJust (C_Vuna_dBase_dPair (g, rest)) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dorderGroupsAcc) (adj) (rest) ((v_Vuna_dBase_dappend) (g) (emitted))) (fun tail -> C_Vuna_dBase_dOk ((g) :: (tail))))

let rec v_Vuna_dTypedCodegen_dorderGroups = fun a0 a1 -> match (a0, a1) with
  | (adj, groups) -> (v_Vuna_dTypedCodegen_dorderGroupsAcc) (adj) (groups) ([])

let rec v_Vuna_dTypedCodegen_dgenGroupDef = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenFunction) (decls) (name)) (fun body -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dvalueName) (name)) ((bi_concat) (" = ") (body))))

let rec v_Vuna_dTypedCodegen_dgenGroup = fun a0 a1 -> match (a0, a1) with
  | (decls, group) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenGroupDef) (decls)) (group)) (fun defs -> C_Vuna_dBase_dOk ((bi_concat) ("let rec ") ((v_Vuna_dTypedCodegen_djoinWith) ("\nand ") (defs))))

let rec v_Vuna_dTypedCodegen_dunionNames = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> if (v_Vuna_dBase_dmemName) (x) (ys) then (v_Vuna_dTypedCodegen_dunionNames) (rest) (ys) else (x) :: ((v_Vuna_dTypedCodegen_dunionNames) (rest) (ys))

let rec v_Vuna_dTypedCodegen_dexprRefs = fun a0 -> match a0 with
  | (expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> (name) :: ([])
  | C_Vuna_dAst_dEInt (n) -> []
  | C_Vuna_dAst_dEStr (s) -> []
  | C_Vuna_dAst_dEApp (fn, args) -> (v_Vuna_dTypedCodegen_dunionNames) ((v_Vuna_dTypedCodegen_dexprRefs) (fn)) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dTypedCodegen_dexprRefs) (args))
  | C_Vuna_dAst_dELam (params, body) -> (v_Vuna_dTypedCodegen_dexprRefs) (body)
  | C_Vuna_dAst_dELet (binds, body) -> (v_Vuna_dTypedCodegen_dunionNames) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dTypedCodegen_dbindRefs) (binds)) ((v_Vuna_dTypedCodegen_dexprRefs) (body))
  | C_Vuna_dAst_dECase (scrut, alts) -> (v_Vuna_dTypedCodegen_dunionNames) ((v_Vuna_dTypedCodegen_dexprRefs) (scrut)) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dTypedCodegen_daltRefs) (alts))
  | C_Vuna_dAst_dEIf (c, t, e) -> (v_Vuna_dTypedCodegen_dunionNames) ((v_Vuna_dTypedCodegen_dexprRefs) (c)) ((v_Vuna_dTypedCodegen_dunionNames) ((v_Vuna_dTypedCodegen_dexprRefs) (t)) ((v_Vuna_dTypedCodegen_dexprRefs) (e))))
and v_Vuna_dTypedCodegen_dbindRefs = fun a0 -> match a0 with
  | (b) -> (match b with
  | C_Vuna_dBase_dPair (pat, value) -> (v_Vuna_dTypedCodegen_dexprRefs) (value))
and v_Vuna_dTypedCodegen_daltRefs = fun a0 -> match a0 with
  | (a) -> (match a with
  | C_Vuna_dBase_dPair (pat, body) -> (v_Vuna_dTypedCodegen_dexprRefs) (body))

let rec v_Vuna_dTypedCodegen_dclauseRefs = fun a0 -> match a0 with
  | (clause) -> (match clause with
  | C_Vuna_dBase_dPair (pats, body) -> (v_Vuna_dTypedCodegen_dexprRefs) (body))

let rec v_Vuna_dTypedCodegen_dgenFunctionRefs = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (v_Vuna_dTypedCodegen_duniqueNames) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dTypedCodegen_dclauseRefs) ((v_Vuna_dAst_dclausesFor) (decls) (name)))

let rec v_Vuna_dTypedCodegen_dgenTop = fun a0 -> match a0 with
  | (decls) -> (match (v_Vuna_dTypedCodegen_dfunctionNames) (decls) with
  | [] -> C_Vuna_dBase_dErr ("typed codegen: no definitions")
  | names -> (let adj = (v_Vuna_dBase_dmap) (fun n -> C_Vuna_dBase_dPair (n, (v_Vuna_dTypedCodegen_dfilterNames) (fun r -> (v_Vuna_dBase_dmemName) (r) (names)) ((v_Vuna_dTypedCodegen_dgenFunctionRefs) (decls) (n)))) (names) in (let groups = (v_Vuna_dTypedCodegen_dmakeGroups) (adj) (names) in (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dorderGroups) (adj) (groups)) (fun ordered -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenGroup) (decls)) (ordered)) (fun parts -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) ("\n\n") (parts)) ("\n")))))))

let rec v_Vuna_dTypecheck_dknownTypeName = fun a0 a1 -> match (a0, a1) with
  | (typeNames, name) -> (bi_or) ((bi_or) ((bi_or) ((v_Vuna_dBase_dmemName) (name) (typeNames)) ((bi_eq) (name) ("Int"))) ((bi_eq) (name) ("String"))) ((bi_eq) (name) ("Bool"))

let rec v_Vuna_dTypecheck_dconvertTypes = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, vars, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair ([], vars), st))
  | (typeNames, vars, (e) :: (rest), st) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dconvertType) (typeNames) (vars) (st) (e)) (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars1), st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dconvertTypes) (typeNames) (vars1) (rest) (st1)) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tys, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair ((ty) :: (tys), vars2), st2))))))
and v_Vuna_dTypecheck_dconvertType = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, vars, st, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> if (v_Vuna_dTypecheck_dknownTypeName) (typeNames) (name) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, []), vars), st)) else if (v_Vuna_dTypecheck_disLowerName) (name) then (match (v_Vuna_dTypecheck_dlookupTyVar) (name) (vars) with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, vars), st))
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dTypecheck_dfreshTy) (st) with
  | C_Vuna_dBase_dPair (ty, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty, (C_Vuna_dBase_dPair (name, ty)) :: (vars)), st2)))) else C_Vuna_dBase_dErr ((bi_concat) ("unknown type: ") (name))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar ("->") -> (match args with
  | (a) :: ((b) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dconvertType) (typeNames) (vars) (st) (a)) (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ta, vars1), st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dconvertType) (typeNames) (vars1) (st1) (b)) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tb, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTFun (ta, tb), vars2), st2))))))
  | _ -> C_Vuna_dBase_dErr ("invalid arrow type"))
  | C_Vuna_dAst_dEVar (name) -> if (v_Vuna_dTypecheck_dknownTypeName) (typeNames) (name) then (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dconvertTypes) (typeNames) (vars) (args) (st)) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (tys, vars1), st1) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dTCon (name, tys), vars1), st1)))) else C_Vuna_dBase_dErr ((bi_concat) ("unknown type constructor: ") (name))
  | _ -> C_Vuna_dBase_dErr ("invalid type application"))
  | _ -> C_Vuna_dBase_dErr ("invalid type expression"))

let rec v_Vuna_dTypecheck_dschemeOfSig = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, ty, st) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dconvertType) (typeNames) ([]) (st) (ty)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dTypecheck_dScheme ((v_Vuna_dTypecheck_dvarIds) (vars), ty2), st2))))

let rec v_Vuna_dTypecheck_dschemeOfCtor = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, st, ctor) -> (match ctor with
  | C_Vuna_dAst_dCtor (name, ty, arity) -> (match (v_Vuna_dTypecheck_dseedVars) (params) (st) with
  | C_Vuna_dBase_dPair (vars, st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dconvertType) (typeNames) (vars) (st1) (ty)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (ty2, vars2), st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (name, C_Vuna_dTypecheck_dScheme ((v_Vuna_dTypecheck_dvarIds) (vars2), ty2)), st2))))))

let rec v_Vuna_dTypecheck_dcollectSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDSig (name, ty) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dschemeOfSig) (typeNames) (ty) (st)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (sch, st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcollectSigs) (typeNames) (rest) (st1)) (fun q -> (match q with
  | C_Vuna_dBase_dPair (sigs, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, sch)) :: (sigs), st2))))))
  | _ -> (v_Vuna_dTypecheck_dcollectSigs) (typeNames) (rest) (st))

let rec v_Vuna_dTypecheck_dcollectCtorList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, params, (c) :: (rest), st) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dschemeOfCtor) (typeNames) (params) (st) (c)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (C_Vuna_dBase_dPair (cname, sch), st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcollectCtorList) (typeNames) (params) (rest) (st1)) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (cname, sch)) :: (ctors), st2))))))

let rec v_Vuna_dTypecheck_dcollectCtors = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcollectCtorList) (typeNames) (params) (ctors) (st)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (newCtors, st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcollectCtors) (typeNames) (rest) (st1)) (fun q -> (match q with
  | C_Vuna_dBase_dPair (ctors2, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((v_Vuna_dBase_dappend) (newCtors) (ctors2), st2))))))
  | _ -> (v_Vuna_dTypecheck_dcollectCtors) (typeNames) (rest) (st))

let rec v_Vuna_dTypecheck_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if (bi_eq) (name) ("") then (v_Vuna_dTypecheck_duniqueNames) (rest) else if (v_Vuna_dBase_dmemName) (name) (rest) then (v_Vuna_dTypecheck_duniqueNames) (rest) else (name) :: ((v_Vuna_dTypecheck_duniqueNames) (rest))

let rec v_Vuna_dTypecheck_dfunctionNames = fun a0 -> match a0 with
  | (decls) -> (v_Vuna_dTypecheck_duniqueNames) ((v_Vuna_dBase_dmap) (v_Vuna_dTypecheck_ddeclFunName) (decls))

let rec v_Vuna_dCodegen_dgenVar = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, name) -> if (v_Vuna_dBase_dmemName) (name) (scope) then C_Vuna_dBase_dOk ((bi_concat) ("x_") ((v_Vuna_dCodegen_dsanitizeName) (name))) else (match (v_Vuna_dAst_dfunArity) (name) (decls) with
  | C_Vuna_dBase_dJust (0) -> C_Vuna_dBase_dOk ((bi_concat) ("v_") ((bi_concat) ((v_Vuna_dCodegen_dsanitizeName) (name)) (" ()")))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk ((bi_concat) ("VFun (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) ((bi_concat) (", v_") ((bi_concat) ((v_Vuna_dCodegen_dsanitizeName) (name)) (")")))))
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dAst_dctorArity) (name) (decls) with
  | C_Vuna_dBase_dJust (0) -> C_Vuna_dBase_dOk ((bi_concat) ("VCon (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) (", [])")))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dOk ((bi_concat) ("VFun (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) ((bi_concat) (", mk_") ((bi_concat) ((v_Vuna_dCodegen_dsanitizeName) (name)) (")")))))
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dCodegen_dfindBuiltin) (name) (v_Vuna_dCodegen_dbuiltinInfos ()) with
  | C_Vuna_dBase_dJust (b) -> (match b with
  | C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body) -> if (bi_eq) (arity) (0) then C_Vuna_dBase_dOk ((bi_concat) (ocname) (" ()")) else C_Vuna_dBase_dOk ((bi_concat) ("VFun (") ((bi_concat) ((v_Vuna_dCodegen_docamlString) (name)) ((bi_concat) (", ") ((bi_concat) (ocname) (")"))))))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("unbound variable: ") (name)))))

let rec v_Vuna_dLoader_dhasDuplicateName = fun a0 -> match a0 with
  | ([]) -> false
  | ((x) :: (rest)) -> if (v_Vuna_dBase_dmemName) (x) (rest) then true else (v_Vuna_dLoader_dhasDuplicateName) (rest)

let rec v_Vuna_dLoader_dmodulesExportingFrom = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (modules, names, name) -> (match names with
  | [] -> []
  | (m) :: (rest) -> if (v_Vuna_dBase_dmemName) (name) ((v_Vuna_dLoader_dexportsOf) (modules) (m)) then (m) :: ((v_Vuna_dLoader_dmodulesExportingFrom) (modules) (rest) (name)) else (v_Vuna_dLoader_dmodulesExportingFrom) (modules) (rest) (name))

let rec v_Vuna_dLoader_dmodulesExporting = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (modules, imports, name) -> (v_Vuna_dLoader_dmodulesExportingFrom) (modules) ((v_Vuna_dLoader_dopenModuleNames) (imports)) (name)

let rec v_Vuna_dLoader_dmodulesExportingCtorFrom = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (modules, names, name) -> (match names with
  | [] -> []
  | (m) :: (rest) -> if (v_Vuna_dBase_dmemName) (name) ((v_Vuna_dLoader_dmoduleCtors) (modules) (m)) then (m) :: ((v_Vuna_dLoader_dmodulesExportingCtorFrom) (modules) (rest) (name)) else (v_Vuna_dLoader_dmodulesExportingCtorFrom) (modules) (rest) (name))

let rec v_Vuna_dLoader_dmodulesExportingCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (modules, imports, name) -> (v_Vuna_dLoader_dmodulesExportingCtorFrom) (modules) ((v_Vuna_dLoader_dopenModuleNames) (imports)) (name)

let rec v_Vuna_dLoader_dmodulesExportingTypeFrom = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (modules, names, name) -> (match names with
  | [] -> []
  | (m) :: (rest) -> if (v_Vuna_dBase_dmemName) (name) ((v_Vuna_dLoader_dtypeExportsOf) (modules) (m)) then (m) :: ((v_Vuna_dLoader_dmodulesExportingTypeFrom) (modules) (rest) (name)) else (v_Vuna_dLoader_dmodulesExportingTypeFrom) (modules) (rest) (name))

let rec v_Vuna_dLoader_dmodulesExportingType = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (modules, imports, name) -> (v_Vuna_dLoader_dmodulesExportingTypeFrom) (modules) ((v_Vuna_dLoader_dopenModuleNames) (imports)) (name)

let rec v_Vuna_dBase_dlookupPair = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dBase_dNothing
  | (name, (p) :: (rest)) -> (match p with
  | C_Vuna_dBase_dPair (k, v) -> if (bi_eq) (k) (name) then C_Vuna_dBase_dJust (v) else (v_Vuna_dBase_dlookupPair) (name) (rest))

let rec v_Vuna_dEval_dforceValue = fun a0 a1 -> match (a0, a1) with
  | (decls, v) -> (match v with
  | C_Vuna_dEval_dVFun (name, []) -> (match (v_Vuna_dAst_dfunArity) (name) (decls) with
  | C_Vuna_dBase_dJust (0) -> (v_Vuna_dEval_dcallFunction) (decls) (name) ([])
  | _ -> C_Vuna_dBase_dOk (v))
  | _ -> C_Vuna_dBase_dOk (v))
and v_Vuna_dEval_devalVar = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, name) -> (match (v_Vuna_dBase_dlookupPair) (name) (env) with
  | C_Vuna_dBase_dJust (v) -> (v_Vuna_dEval_dforceValue) (decls) (v)
  | C_Vuna_dBase_dNothing -> (v_Vuna_dEval_devalGlobal) (decls) (name))
and v_Vuna_dEval_devalGlobal = fun a0 a1 -> match (a0, a1) with
  | (decls, name) -> (match (v_Vuna_dAst_dfunArity) (name) (decls) with
  | C_Vuna_dBase_dJust (arity) -> if (bi_eq) (arity) (0) then (v_Vuna_dEval_dcallFunction) (decls) (name) ([]) else C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun (name, []))
  | C_Vuna_dBase_dNothing -> (v_Vuna_dEval_devalGlobalNonFun) (decls) (name))
and v_Vuna_dEval_devalExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> (v_Vuna_dEval_devalVar) (decls) (env) (name)
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVInt (n))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVStr (s))
  | C_Vuna_dAst_dELam (params, body) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (params, body, env))
  | C_Vuna_dAst_dEApp (fn, args) -> (v_Vuna_dEval_devalApp) (decls) (env) (fn) (args)
  | C_Vuna_dAst_dELet (binds, body) -> (v_Vuna_dEval_devalLet) (decls) (env) (binds) (body)
  | C_Vuna_dAst_dECase (scrut, alts) -> (v_Vuna_dEval_devalCase) (decls) (env) (scrut) (alts)
  | C_Vuna_dAst_dEIf (c, t, e) -> (v_Vuna_dEval_devalIf) (decls) (env) (c) (t) (e))
and v_Vuna_dEval_devalApp = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, fn, args) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_devalExpr) (decls) (env) (fn)) (fun fv -> (v_Vuna_dEval_dfoldApply) (decls) (env) (fv) (args))
and v_Vuna_dEval_dfoldApply = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, fv, []) -> C_Vuna_dBase_dOk (fv)
  | (decls, env, fv, (arg) :: (rest)) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_devalExpr) (decls) (env) (arg)) (fun av -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_dapplyValue) (decls) (fv) (av)) (fun fv2 -> (v_Vuna_dEval_dfoldApply) (decls) (env) (fv2) (rest)))
and v_Vuna_dEval_devalLet = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, binds, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_devalBindings) (decls) (env) (binds)) (fun env2 -> (v_Vuna_dEval_devalExpr) (decls) (env2) (body))
and v_Vuna_dEval_devalBindings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, env, []) -> C_Vuna_dBase_dOk (env)
  | (decls, env, (b) :: (rest)) -> (match b with
  | C_Vuna_dBase_dPair (pat, valueExpr) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_devalExpr) (decls) (env) (valueExpr)) (fun v -> (match (v_Vuna_dEval_dmatchPattern) (pat) (v) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("let pattern match failure")
  | C_Vuna_dBase_dJust (bs) -> (v_Vuna_dEval_devalBindings) (decls) ((v_Vuna_dBase_dappend) (bs) (env)) (rest))))
and v_Vuna_dEval_devalCase = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, scrut, alts) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_devalExpr) (decls) (env) (scrut)) (fun v -> (v_Vuna_dEval_dchooseAlt) (decls) (env) (v) (alts))
and v_Vuna_dEval_dchooseAlt = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, env, v, []) -> C_Vuna_dBase_dErr ("case pattern match failure")
  | (decls, env, v, (alt) :: (rest)) -> (match alt with
  | C_Vuna_dBase_dPair (pat, body) -> (match (v_Vuna_dEval_dmatchPattern) (pat) (v) with
  | C_Vuna_dBase_dNothing -> (v_Vuna_dEval_dchooseAlt) (decls) (env) (v) (rest)
  | C_Vuna_dBase_dJust (bs) -> (v_Vuna_dEval_devalExpr) (decls) ((v_Vuna_dBase_dappend) (bs) (env)) (body)))
and v_Vuna_dEval_devalIf = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, env, c, t, e) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dEval_devalExpr) (decls) (env) (c)) (fun cv -> (match cv with
  | C_Vuna_dEval_dVCon ("True", []) -> (v_Vuna_dEval_devalExpr) (decls) (env) (t)
  | C_Vuna_dEval_dVCon ("False", []) -> (v_Vuna_dEval_devalExpr) (decls) (env) (e)
  | _ -> C_Vuna_dBase_dErr ("if condition is not a Bool")))
and v_Vuna_dEval_dapplyValue = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, v, arg) -> (match v with
  | C_Vuna_dEval_dVFun (name, bound) -> (v_Vuna_dEval_dapplyFun) (decls) (name) (bound) (arg)
  | C_Vuna_dEval_dVLam (params, body, env) -> (v_Vuna_dEval_dapplyLambda) (decls) (params) (body) (env) (arg)
  | C_Vuna_dEval_dVCon (name, args) -> (v_Vuna_dEval_dapplyCtor) (decls) (name) (args) (arg)
  | C_Vuna_dEval_dVBuiltin (name, args) -> (v_Vuna_dEval_dapplyBuiltin) (decls) (name) (args) (arg)
  | _ -> C_Vuna_dBase_dErr ("cannot apply a non-function"))
and v_Vuna_dEval_dapplyFun = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, name, bound, arg) -> (match (v_Vuna_dAst_dfunArity) (name) (decls) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("unknown function: ") (name))
  | C_Vuna_dBase_dJust (arity) -> (let bound2 = (v_Vuna_dBase_dappend) (bound) ((arg) :: ([])) in if (bi_lt) ((v_Vuna_dBase_dlength) (bound2)) (arity) then C_Vuna_dBase_dOk (C_Vuna_dEval_dVFun (name, bound2)) else if (bi_eq) ((v_Vuna_dBase_dlength) (bound2)) (arity) then (v_Vuna_dEval_dcallFunction) (decls) (name) (bound2) else C_Vuna_dBase_dErr ((bi_concat) ("too many arguments for ") (name))))
and v_Vuna_dEval_dapplyLambda = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, params, body, env, arg) -> (match params with
  | [] -> C_Vuna_dBase_dErr ("lambda has no parameters")
  | (p) :: ([]) -> (v_Vuna_dEval_devalExpr) (decls) ((C_Vuna_dBase_dPair (p, arg)) :: (env)) (body)
  | (p) :: (rest) -> C_Vuna_dBase_dOk (C_Vuna_dEval_dVLam (rest, body, (C_Vuna_dBase_dPair (p, arg)) :: (env))))
and v_Vuna_dEval_dcallFunction = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, name, args) -> (v_Vuna_dEval_dtryClauses) (decls) (name) ((v_Vuna_dAst_dclausesFor) (decls) (name)) (args)
and v_Vuna_dEval_dtryClauses = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, name, [], args) -> C_Vuna_dBase_dErr ((bi_concat) ("no matching clause for ") (name))
  | (decls, name, (c) :: (rest), args) -> (match c with
  | C_Vuna_dBase_dPair (pats, body) -> if (bi_eq) ((v_Vuna_dBase_dlength) (pats)) ((v_Vuna_dBase_dlength) (args)) then (v_Vuna_dEval_dtryMatch) (decls) (name) (pats) (body) (rest) (args) else (v_Vuna_dEval_dtryClauses) (decls) (name) (rest) (args))
and v_Vuna_dEval_dtryMatch = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (decls, name, pats, body, rest, args) -> (match (v_Vuna_dEval_dmatchPatterns) (pats) (args) with
  | C_Vuna_dBase_dJust (binds) -> (v_Vuna_dEval_devalExpr) (decls) (binds) (body)
  | C_Vuna_dBase_dNothing -> (v_Vuna_dEval_dtryClauses) (decls) (name) (rest) (args))

let rec v_Vuna_dEval_dinterpretMain = fun a0 -> match a0 with
  | (decls) -> (match (v_Vuna_dAst_dfunArity) ("main") (decls) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")
  | C_Vuna_dBase_dJust (arity) -> if (bi_eq) (arity) (0) then (v_Vuna_dEval_dcallFunction) (decls) ("main") ([]) else C_Vuna_dBase_dErr ("`main` must be a nullary definition"))

let rec v_Vuna_dBase_dfirstOf = fun a0 -> match a0 with
  | (p) -> (match p with
  | C_Vuna_dBase_dPair (a, b) -> a)

let rec v_Vuna_dTypecheck_dhasSig = fun a0 a1 -> match (a0, a1) with
  | (name, sigs) -> (v_Vuna_dBase_dmemName) (name) ((v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (sigs))

let rec v_Vuna_dTypecheck_dseedPlaceholders = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], sigs, st) -> C_Vuna_dBase_dPair ([], st)
  | ((name) :: (rest), sigs, st) -> if (v_Vuna_dTypecheck_dhasSig) (name) (sigs) then (v_Vuna_dTypecheck_dseedPlaceholders) (rest) (sigs) (st) else (match (v_Vuna_dTypecheck_dfreshTy) (st) with
  | C_Vuna_dBase_dPair (ty, st1) -> (match (v_Vuna_dTypecheck_dseedPlaceholders) (rest) (sigs) (st1) with
  | C_Vuna_dBase_dPair (ps, st2) -> C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, C_Vuna_dTypecheck_dScheme ([], ty))) :: (ps), st2)))

let rec v_Vuna_dCodegen_dvalidateCtors = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dBase_dOk ([])
  | ((c) :: (rest)) -> (match c with
  | C_Vuna_dBase_dPair (name, arity) -> if (v_Vuna_dBase_dmemName) (name) ((v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (rest)) then C_Vuna_dBase_dErr ((bi_concat) ("duplicate constructor: ") (name)) else (v_Vuna_dCodegen_dvalidateCtors) (rest))

let rec v_Vuna_dLoader_dcheckImportAliases = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (label, moduleNames, aliases) -> (match aliases with
  | [] -> C_Vuna_dBase_dOk ([])
  | (p) :: (rest) -> (match p with
  | C_Vuna_dBase_dPair (alias, m) -> if (v_Vuna_dLoader_dvalidSegment) (alias) then if (v_Vuna_dBase_dmemName) (alias) ((v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (rest)) then C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": duplicate module alias ") (alias))) else if (v_Vuna_dBase_dmemName) (alias) (moduleNames) then if (bi_eq) (alias) (m) then (v_Vuna_dLoader_dcheckImportAliases) (label) (moduleNames) (rest) else C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": module alias ") ((bi_concat) (alias) (" conflicts with an imported module")))) else (v_Vuna_dLoader_dcheckImportAliases) (label) (moduleNames) (rest) else C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": invalid module alias ") (alias)))))

let rec v_Vuna_dLoader_dvalidateImports = fun a0 a1 -> match (a0, a1) with
  | (label, imports) -> if (v_Vuna_dLoader_dhasDuplicateName) ((v_Vuna_dLoader_dimportModuleNames) (imports)) then C_Vuna_dBase_dErr ((bi_concat) (label) (": duplicate import")) else (v_Vuna_dLoader_dcheckImportAliases) (label) ((v_Vuna_dLoader_dimportModuleNames) (imports)) ((v_Vuna_dLoader_dimportAliases) (imports))

let rec v_Vuna_dBase_dsecondOf = fun a0 -> match a0 with
  | (p) -> (match p with
  | C_Vuna_dBase_dPair (a, b) -> b)

let rec v_Vuna_dCodegen_dgenPattern = fun a0 -> match a0 with
  | (pat) -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ("_", []))
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((bi_concat) ("x_") ((v_Vuna_dCodegen_dsanitizeName) (name)), (name) :: ([])))
  | C_Vuna_dAst_dPInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((bi_concat) ("VInt (") ((bi_concat) ((bi_str_from_int) (n)) (")")), []))
  | C_Vuna_dAst_dPStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((bi_concat) ("VStr ") ((v_Vuna_dCodegen_docamlString) (s)), []))
  | C_Vuna_dAst_dPCon (name, pats) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) (v_Vuna_dCodegen_dgenPattern) (pats)) (fun parts -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((v_Vuna_dCodegen_dpconPattern) (name) ((v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (parts)), (v_Vuna_dBase_dconcatMap) (v_Vuna_dBase_dsecondOf) (parts)))))

let rec v_Vuna_dCodegen_dgenLambda = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, scope, params, body) -> (match params with
  | [] -> (v_Vuna_dCodegen_dgenExpr) (decls) (scope) (body)
  | (p) :: (rest) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenLambda) (decls) ((p) :: (scope)) (rest) (body)) (fun inner -> C_Vuna_dBase_dOk ((bi_concat) ("VFun (\"\", fun x_") ((bi_concat) ((v_Vuna_dCodegen_dsanitizeName) (p)) ((bi_concat) (" -> ") ((bi_concat) (inner) (")")))))))
and v_Vuna_dCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, alt) -> (match alt with
  | C_Vuna_dBase_dPair (pat, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenPattern) (pat)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (patCode, bound) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) ((v_Vuna_dBase_dappend) (bound) (scope)) (body)) (fun bodyCode -> C_Vuna_dBase_dOk ((bi_concat) ("| ") ((bi_concat) (patCode) ((bi_concat) (" -> ") (bodyCode))))))))
and v_Vuna_dCodegen_dgenCase = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, scope, scrut, alts) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) (scope) (scrut)) (fun scrutCode -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) ((v_Vuna_dCodegen_dgenAlt) (decls) (scope)) (alts)) (fun branches -> C_Vuna_dBase_dOk ((bi_concat) ("(match (") ((bi_concat) (scrutCode) ((bi_concat) (") with\n    ") ((bi_concat) ((v_Vuna_dCodegen_djoinList) ("\n    ") (branches)) ("\n    | _ -> fail \"case pattern match failure\")")))))))
and v_Vuna_dCodegen_dgenLet = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, scope, binds, body) -> (match binds with
  | [] -> (v_Vuna_dCodegen_dgenExpr) (decls) (scope) (body)
  | (b) :: (rest) -> (match b with
  | C_Vuna_dBase_dPair (pat, value) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) (scope) (value)) (fun valueCode -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenPattern) (pat)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (patCode, bound) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenLet) (decls) ((v_Vuna_dBase_dappend) (bound) (scope)) (rest) (body)) (fun bodyCode -> C_Vuna_dBase_dOk ((bi_concat) ("(let ") ((bi_concat) (patCode) ((bi_concat) (" = (") ((bi_concat) (valueCode) ((bi_concat) (") in ") ((bi_concat) (bodyCode) (")")))))))))))))
and v_Vuna_dCodegen_dgenExpr = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> (v_Vuna_dCodegen_dgenVar) (decls) (scope) (name)
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk ((bi_concat) ("VInt (") ((bi_concat) ((bi_str_from_int) (n)) (")")))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk ((bi_concat) ("VStr ") ((v_Vuna_dCodegen_docamlString) (s)))
  | C_Vuna_dAst_dELam (params, body) -> (v_Vuna_dCodegen_dgenLambda) (decls) (scope) (params) (body)
  | C_Vuna_dAst_dEApp (fn, args) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) (scope) (fn)) (fun fnCode -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) (fun a -> (v_Vuna_dCodegen_dgenExpr) (decls) (scope) (a)) (args)) (fun argCodes -> C_Vuna_dBase_dOk ((v_Vuna_dCodegen_dcgApplyFold) (fnCode) (argCodes))))
  | C_Vuna_dAst_dELet (binds, body) -> (v_Vuna_dCodegen_dgenLet) (decls) (scope) (binds) (body)
  | C_Vuna_dAst_dECase (scrut, alts) -> (v_Vuna_dCodegen_dgenCase) (decls) (scope) (scrut) (alts)
  | C_Vuna_dAst_dEIf (c, t, e) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) (scope) (c)) (fun cc -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) (scope) (t)) (fun tc -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) (scope) (e)) (fun ec -> C_Vuna_dBase_dOk ((bi_concat) ("(match (") ((bi_concat) (cc) ((bi_concat) (") with VCon (\"True\", []) -> ") ((bi_concat) (tc) ((bi_concat) (" | VCon (\"False\", []) -> ") ((bi_concat) (ec) (" | _ -> fail \"if condition is not a Bool\")")))))))))))

let rec v_Vuna_dCodegen_dgenBranches = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, arity, []) -> C_Vuna_dBase_dOk ([])
  | (decls, arity, (c) :: (rest)) -> (match c with
  | C_Vuna_dBase_dPair (pats, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) (v_Vuna_dCodegen_dgenPattern) (pats)) (fun parts -> (let patternCode = if (bi_eq) (arity) (1) then (v_Vuna_dCodegen_dheadOf) ((v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (parts)) else (bi_concat) ("(") ((bi_concat) ((v_Vuna_dCodegen_djoinList) (", ") ((v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (parts))) (")")) in (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dBase_dsecondOf) (parts)) (body)) (fun b -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenBranches) (decls) (arity) (rest)) (fun restBranches -> C_Vuna_dBase_dOk (((bi_concat) ("| ") ((bi_concat) (patternCode) ((bi_concat) (" -> ") (b)))) :: (restBranches)))))))

let rec v_Vuna_dCodegen_dgenFunction = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, name, clauses) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_darityOf) (name) (clauses)) (fun arity -> (match clauses with
  | [] -> C_Vuna_dBase_dErr ((bi_concat) ("function ") ((bi_concat) (name) (" has no clauses")))
  | (first) :: (rest) -> if (bi_eq) (arity) (0) then (match first with
  | C_Vuna_dBase_dPair (pats, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenExpr) (decls) ([]) (body)) (fun b -> C_Vuna_dBase_dOk ((bi_concat) ("(fun () -> ") ((bi_concat) (b) (")"))))) else (let params = (v_Vuna_dCodegen_dmakeParams) (arity) in (let scrutinee = if (bi_eq) (arity) (1) then (v_Vuna_dCodegen_dheadOf) (params) else (bi_concat) ("(") ((bi_concat) ((v_Vuna_dCodegen_djoinList) (", ") (params)) (")")) in (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenBranches) (decls) (arity) (clauses)) (fun branches -> (let matchCode = (bi_concat) ("(match (") ((bi_concat) (scrutinee) ((bi_concat) (") with\n    ") ((bi_concat) ((v_Vuna_dCodegen_djoinList) ("\n    ") (branches)) ((bi_concat) ("\n    | _ -> fail \"no matching clause for ") ((bi_concat) (name) ("\")")))))) in C_Vuna_dBase_dOk ((v_Vuna_dCodegen_dwrapFun) (name) (params) (matchCode) (0))))))))

let rec v_Vuna_dCodegen_dgenFunctions = fun a0 a1 -> match (a0, a1) with
  | (decls, []) -> C_Vuna_dBase_dOk ([])
  | (decls, (g) :: (rest)) -> (match g with
  | C_Vuna_dBase_dPair (name, clauses) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenFunction) (decls) (name) (clauses)) (fun def -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenFunctions) (decls) (rest)) (fun defs -> C_Vuna_dBase_dOk ((C_Vuna_dBase_dPair (name, def)) :: (defs)))))

let rec v_Vuna_dCodegen_drenderRecsFrom = fun a0 a1 -> match (a0, a1) with
  | ([], index) -> ""
  | ((f) :: (rest), index) -> (let prefix = if (bi_eq) (index) (0) then "let rec " else "and " in (bi_concat) (prefix) ((bi_concat) ("v_") ((bi_concat) ((v_Vuna_dCodegen_dsanitizeName) ((v_Vuna_dBase_dfirstOf) (f))) ((bi_concat) (" = ") ((bi_concat) ((v_Vuna_dBase_dsecondOf) (f)) ((bi_concat) ("\n") ((v_Vuna_dCodegen_drenderRecsFrom) (rest) ((bi_add) (index) (1)))))))))

let rec v_Vuna_dCodegen_dgenerateProgram = fun a0 a1 -> match (a0, a1) with
  | (decls, printResult) -> (match (v_Vuna_dCodegen_dallCtors) (decls) with
  | ctors -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dvalidateCtors) (ctors)) (fun _u -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dcheckNoCtorFun) ((v_Vuna_dCodegen_dgroupFunctions) (decls)) (decls)) (fun _u -> (match (v_Vuna_dAst_dfunArity) ("main") (decls) with
  | C_Vuna_dBase_dJust (0) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenFunctions) (decls) ((v_Vuna_dCodegen_dgroupFunctions) (decls))) (fun defs -> (v_Vuna_dBase_dandThen) ((v_Vuna_dCodegen_dgenCtorDefs) (ctors)) (fun ctorDefs -> C_Vuna_dBase_dOk ((bi_concat) (v_Vuna_dCodegen_druntimeCode ()) ((bi_concat) (ctorDefs) ((bi_concat) ((v_Vuna_dCodegen_dgenBuiltinDef) (v_Vuna_dCodegen_dbuiltinInfos ())) ((bi_concat) ((v_Vuna_dCodegen_drenderRecsFrom) (defs) (0)) (if printResult then "let () = print_endline (show_value (v_main ()))\n" else "let () = ignore (v_main ())\n")))))))
  | C_Vuna_dBase_dJust (arity) -> C_Vuna_dBase_dErr ("`main` must be a nullary definition")
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("no `main` definition")))))

let rec v_Vuna_dBase_dmemChar = fun a0 a1 -> match (a0, a1) with
  | (c, chars) -> (match chars with
  | [] -> false
  | (x) :: (rest) -> if (bi_eq) (x) (c) then true else (v_Vuna_dBase_dmemChar) (c) (rest))

let rec v_Vuna_dBase_dcontainsDot = fun a0 -> match a0 with
  | (s) -> (v_Vuna_dBase_dmemChar) (46) ((bi_str_unpack) (s))

let rec v_Vuna_dLoader_dcheckBinder = fun a0 a1 -> match (a0, a1) with
  | (label, name) -> if (v_Vuna_dBase_dcontainsDot) (name) then C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": invalid variable name ") (name))) else C_Vuna_dBase_dOk (name)

let rec v_Vuna_dLoader_dcheckTopName = fun a0 a1 -> match (a0, a1) with
  | (label, name) -> if (v_Vuna_dBase_dcontainsDot) (name) then C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": invalid top-level name ") (name))) else C_Vuna_dBase_dOk (name)

let rec v_Vuna_dLoader_dresolveTopName = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (label, prefix, name) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dcheckTopName) (label) (name)) (fun _u -> C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (prefix) (name)))

let rec v_Vuna_dLoader_dresolveCtorDecl = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (label, prefix, ctor) -> if (v_Vuna_dLoader_disGlobalCtor) (ctor) then C_Vuna_dBase_dOk (ctor) else (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dcheckTopName) (label) (ctor)) (fun _u -> C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (prefix) (ctor)))

let rec v_Vuna_dLoader_dresolveTypeTopName = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (label, prefix, name) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dcheckTopName) (label) (name)) (fun _u -> C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (prefix) (name)))

let rec v_Vuna_dBase_dsplitCharsOnDot = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (chars, acc, seg) -> (match chars with
  | [] -> (v_Vuna_dBase_dreverse) (((bi_str_pack) ((v_Vuna_dBase_dreverse) (seg))) :: (acc))
  | (c) :: (rest) -> if (bi_eq) (c) (46) then (v_Vuna_dBase_dsplitCharsOnDot) (rest) (((bi_str_pack) ((v_Vuna_dBase_dreverse) (seg))) :: (acc)) ([]) else (v_Vuna_dBase_dsplitCharsOnDot) (rest) (acc) ((c) :: (seg)))

let rec v_Vuna_dBase_dsplitOnDot = fun a0 -> match a0 with
  | (s) -> (v_Vuna_dBase_dsplitCharsOnDot) ((bi_str_unpack) (s)) ([]) ([])

let rec v_Vuna_dLoader_dvalidModuleName = fun a0 -> match a0 with
  | (name) -> (match (v_Vuna_dBase_dsplitOnDot) (name) with
  | [] -> false
  | segs -> (v_Vuna_dLoader_dallSegmentsValid) (segs))

let rec v_Vuna_dBase_dsplitLastDot = fun a0 -> match a0 with
  | (parts) -> (match (v_Vuna_dBase_dreverse) (parts) with
  | [] -> C_Vuna_dBase_dPair ([], "")
  | (last) :: (rest) -> C_Vuna_dBase_dPair ((v_Vuna_dBase_dreverse) (rest), last))

let rec v_Vuna_dTypedCodegen_dlastName = fun a0 -> match a0 with
  | (name) -> (match (v_Vuna_dBase_dsplitLastDot) ((v_Vuna_dBase_dsplitOnDot) (name)) with
  | C_Vuna_dBase_dPair (rev, base) -> base)

let rec v_Vuna_dTypedCodegen_disBoolName = fun a0 -> match a0 with
  | (name) -> (bi_eq) ((v_Vuna_dTypedCodegen_dlastName) (name)) ("Bool")

let rec v_Vuna_dTypedCodegen_disListName = fun a0 -> match a0 with
  | (name) -> (bi_eq) ((v_Vuna_dTypedCodegen_dlastName) (name)) ("List")

let rec v_Vuna_dTypedCodegen_dnonSpecialData = fun a0 -> match a0 with
  | (decls) -> (match (v_Vuna_dTypedCodegen_ddataDecls) (decls) with
  | [] -> []
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> if (bi_or) ((v_Vuna_dTypedCodegen_disBoolName) (name)) ((v_Vuna_dTypedCodegen_disListName) (name)) then (v_Vuna_dTypedCodegen_dnonSpecialData) (rest) else (d) :: ((v_Vuna_dTypedCodegen_dnonSpecialData) (rest))
  | _ -> (v_Vuna_dTypedCodegen_dnonSpecialData) (rest)))

let rec v_Vuna_dTypedCodegen_docamlType = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, params, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> if (bi_eq) (name) ("Int") then C_Vuna_dBase_dOk ("int") else if (bi_eq) (name) ("String") then C_Vuna_dBase_dOk ("string") else if (v_Vuna_dTypedCodegen_disBoolName) (name) then C_Vuna_dBase_dOk ("bool") else if (v_Vuna_dTypedCodegen_disListName) (name) then C_Vuna_dBase_dErr ("List type needs an argument") else (match (v_Vuna_dTypedCodegen_dlookupParam) (name) (params) with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (ty)
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dTypedCodegen_dlookupData) (decls) (name) with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dtypeNameOf) (name))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: unknown type ") (name))))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar ("->") -> (match args with
  | (a) :: ((b) :: ([])) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_docamlType) (decls) (params) (a)) (fun ta -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_docamlType) (decls) (params) (b)) (fun tb -> C_Vuna_dBase_dOk ((bi_concat) ("(") ((bi_concat) (ta) ((bi_concat) (") -> (") ((bi_concat) (tb) (")")))))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid arrow type"))
  | C_Vuna_dAst_dEVar (name) -> if (v_Vuna_dTypedCodegen_disListName) (name) then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_docamlType) (decls) (params) (a)) (fun ta -> C_Vuna_dBase_dOk ((bi_concat) ("(") ((bi_concat) (ta) (") list"))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid List type")) else (match (v_Vuna_dTypedCodegen_dlookupData) (decls) (name) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: unknown type constructor ") (name))
  | C_Vuna_dBase_dJust (d) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_docamlType) (decls) (params)) (args)) (fun tys -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dappType) (tys) ((v_Vuna_dTypedCodegen_dtypeNameOf) (name)))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type application"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid type expression"))

let rec v_Vuna_dTypedCodegen_dgenCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, c) -> (match c with
  | C_Vuna_dAst_dCtor (name, ty, arity) -> (match (v_Vuna_dTypedCodegen_dsplitArrows) (ty) with
  | [] -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dctorNameOf) (name))
  | (only) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_docamlType) (decls) (pmap) (only)) (fun t -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" of (") ((bi_concat) (t) (")")))))
  | fields -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_docamlType) (decls) (pmap)) (fields)) (fun ts -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" of ") ((v_Vuna_dTypedCodegen_djoinWith) (" * ") ((v_Vuna_dBase_dmap) (fun t -> (bi_concat) ("(") ((bi_concat) (t) (")"))) (ts))))))))

let rec v_Vuna_dTypedCodegen_dgenData = fun a0 a1 -> match (a0, a1) with
  | (decls, d) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenCtor) (decls) ((v_Vuna_dTypedCodegen_dparamMap) (params))) (ctors)) (fun cs -> C_Vuna_dBase_dOk ((bi_concat) ("  ") ((bi_concat) ((v_Vuna_dTypedCodegen_ddataPrefix) (params)) ((bi_concat) ((v_Vuna_dTypedCodegen_dtypeNameOf) (name)) ((bi_concat) (" =\n    ") ((v_Vuna_dTypedCodegen_djoinWith) ("\n  | ") (cs))))))))

let rec v_Vuna_dTypedCodegen_dgenTypeDecls = fun a0 -> match a0 with
  | (decls) -> (match (v_Vuna_dTypedCodegen_dnonSpecialData) (decls) with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenData) (decls)) (ds)) (fun parts -> C_Vuna_dBase_dOk ((bi_concat) ("type ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) ("\nand ") (parts)) ("\n")))))

let rec v_Vuna_dTypedCodegen_dshowForType = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, params, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> if (bi_eq) (name) ("Int") then C_Vuna_dBase_dOk ("string_of_int") else if (bi_eq) (name) ("String") then C_Vuna_dBase_dOk ("show_vstring") else if (v_Vuna_dTypedCodegen_disBoolName) (name) then C_Vuna_dBase_dOk ("show_vbool") else if (v_Vuna_dTypedCodegen_disListName) (name) then C_Vuna_dBase_dErr ("typed codegen: List type needs an argument") else (match (v_Vuna_dTypedCodegen_dlookupParam) (name) (params) with
  | C_Vuna_dBase_dJust (s) -> C_Vuna_dBase_dOk (s)
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dTypedCodegen_dlookupData) (decls) (name) with
  | C_Vuna_dBase_dJust (d) -> C_Vuna_dBase_dOk ((v_Vuna_dTypedCodegen_dshowNameOf) (name))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: unknown show type ") (name))))
  | C_Vuna_dAst_dEApp (fn, args) -> (match fn with
  | C_Vuna_dAst_dEVar ("->") -> C_Vuna_dBase_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dAst_dEVar (name) -> if (v_Vuna_dTypedCodegen_disListName) (name) then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dshowForType) (decls) (params) (a)) (fun sa -> C_Vuna_dBase_dOk ((bi_concat) ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (") ((bi_concat) (sa) (") x ^ \" \" ^ go xs ^ \")\" in go v)"))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid List show type")) else (match (v_Vuna_dTypedCodegen_dlookupData) (decls) (name) with
  | C_Vuna_dBase_dJust (d) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dshowForType) (decls) (params)) (args)) (fun ss -> C_Vuna_dBase_dOk ((bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypedCodegen_dshowNameOf) (name)) ((bi_concat) (" ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (" ") (ss)) (")"))))))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("typed codegen: unknown show type constructor ") (name)))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type application"))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: invalid show type"))

let rec v_Vuna_dTypedCodegen_dshowForTy = fun a0 a1 -> match (a0, a1) with
  | (decls, ty) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> C_Vuna_dBase_dOk ("(fun _ -> \"<value>\")")
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dBase_dOk ("(fun _ -> \"<function>\")")
  | C_Vuna_dTypecheck_dTCon (name, args) -> if (bi_eq) (name) ("Int") then C_Vuna_dBase_dOk ("string_of_int") else if (bi_eq) (name) ("String") then C_Vuna_dBase_dOk ("show_vstring") else if (v_Vuna_dTypedCodegen_disBoolName) (name) then C_Vuna_dBase_dOk ("show_vbool") else if (v_Vuna_dTypedCodegen_disListName) (name) then (match args with
  | (a) :: ([]) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dshowForTy) (decls) (a)) (fun sa -> C_Vuna_dBase_dOk ((bi_concat) ("(fun v -> let rec go = function [] -> \"Nil\" | x :: xs -> \"(Cons \" ^ (") ((bi_concat) (sa) (") x ^ \" \" ^ go xs ^ \")\" in go v)"))))
  | _ -> C_Vuna_dBase_dErr ("typed codegen: main List type must have one argument")) else (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dshowForTy) (decls)) (args)) (fun ss -> C_Vuna_dBase_dOk ((bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypedCodegen_dshowNameOf) (name)) ((bi_concat) (" ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (" ") (ss)) (")")))))))

let rec v_Vuna_dTypedCodegen_dgenShowFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, pmap, [], []) -> C_Vuna_dBase_dOk ([])
  | (decls, pmap, (f) :: (fs), (v) :: (vs)) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dshowForType) (decls) (pmap) (f)) (fun s -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenShowFields) (decls) (pmap) (fs) (vs)) (fun ss -> C_Vuna_dBase_dOk (((bi_concat) ("(") ((bi_concat) (s) ((bi_concat) (") ") (v)))) :: (ss))))

let rec v_Vuna_dTypedCodegen_dgenShowCtorWith = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (decls, pmap, name, fields) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenShowFields) (decls) (pmap) (fields) ((v_Vuna_dTypedCodegen_dfieldVars) ((v_Vuna_dBase_dlength) (fields)))) (fun shows -> (match (v_Vuna_dTypedCodegen_dfieldVars) ((v_Vuna_dBase_dlength) (fields)) with
  | [] -> C_Vuna_dBase_dOk ((bi_concat) ("  | ") ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" -> ") ((v_Vuna_dCodegen_docamlString) ((v_Vuna_dTypedCodegen_dlastName) (name))))))
  | (v) :: ([]) -> C_Vuna_dBase_dOk ((bi_concat) ("  | ") ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" ") ((bi_concat) (v) ((bi_concat) (" -> show_ctor ") ((bi_concat) ((v_Vuna_dCodegen_docamlString) ((v_Vuna_dTypedCodegen_dlastName) (name))) ((bi_concat) (" [") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) ("; ") (shows)) ("]")))))))))
  | vars -> C_Vuna_dBase_dOk ((bi_concat) ("  | ") ((bi_concat) ((v_Vuna_dTypedCodegen_dctorNameOf) (name)) ((bi_concat) (" (") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (", ") (vars)) ((bi_concat) (") -> show_ctor ") ((bi_concat) ((v_Vuna_dCodegen_docamlString) ((v_Vuna_dTypedCodegen_dlastName) (name))) ((bi_concat) (" [") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) ("; ") (shows)) ("]")))))))))))

let rec v_Vuna_dTypedCodegen_dgenShowCtor = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, pmap, c) -> (match c with
  | C_Vuna_dAst_dCtor (name, ty, arity) -> (v_Vuna_dTypedCodegen_dgenShowCtorWith) (decls) (pmap) (name) ((v_Vuna_dTypedCodegen_dsplitArrows) (ty)))

let rec v_Vuna_dTypedCodegen_dgenShowFuncWith = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (decls, pmap, params, name, ctors) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenShowCtor) (decls) (pmap)) (ctors)) (fun arms -> (v_Vuna_dTypedCodegen_dgenShowBody) (pmap) (params) (name) (arms))

let rec v_Vuna_dTypedCodegen_dgenShowFunc = fun a0 a1 -> match (a0, a1) with
  | (decls, d) -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors) -> (v_Vuna_dTypedCodegen_dgenShowFuncWith) (decls) ((v_Vuna_dTypedCodegen_dshowParamMap) (params)) (params) (name) (ctors))

let rec v_Vuna_dTypedCodegen_dgenShowDecls = fun a0 -> match a0 with
  | (decls) -> (match (v_Vuna_dTypedCodegen_dnonSpecialData) (decls) with
  | [] -> C_Vuna_dBase_dOk ("")
  | ds -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dmapResult) ((v_Vuna_dTypedCodegen_dgenShowFunc) (decls)) (ds)) (fun parts -> C_Vuna_dBase_dOk ((bi_concat) ("let rec ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) ("\nand ") (parts)) ("\n")))))

let rec v_Vuna_dTypedCodegen_docamlTy = fun a0 a1 -> match (a0, a1) with
  | (qmap, ty) -> (match ty with
  | C_Vuna_dTypecheck_dTVar (i) -> (match (v_Vuna_dTypedCodegen_dlookupQid) (i) (qmap) with
  | C_Vuna_dBase_dJust (v) -> v
  | C_Vuna_dBase_dNothing -> (bi_concat) ("'q") ((bi_str_from_int) (i)))
  | C_Vuna_dTypecheck_dTCon (name, args) -> if (bi_eq) (name) ("Int") then "int" else if (bi_eq) (name) ("String") then "string" else if (bi_eq) (name) ("Unit") then "unit" else if (v_Vuna_dTypedCodegen_disBoolName) (name) then "bool" else if (v_Vuna_dTypedCodegen_disListName) (name) then (match args with
  | (a) :: ([]) -> (bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypedCodegen_docamlTy) (qmap) (a)) (") list"))
  | _ -> "unit") else (v_Vuna_dTypedCodegen_dappType) ((v_Vuna_dBase_dmap) ((v_Vuna_dTypedCodegen_docamlTy) (qmap)) (args)) ((v_Vuna_dTypedCodegen_dtypeNameOf) (name))
  | C_Vuna_dTypecheck_dTFun (a, b) -> (bi_concat) ("(") ((bi_concat) ((v_Vuna_dTypedCodegen_docamlTy) (qmap) (a)) ((bi_concat) (") -> (") ((bi_concat) ((v_Vuna_dTypedCodegen_docamlTy) (qmap) (b)) (")")))))

let rec v_Vuna_dTypedCodegen_dschemeAnnotation = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, name, arity) -> (match (v_Vuna_dTypecheck_dlookupScheme) (name) (globals) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dOk ("")
  | C_Vuna_dBase_dJust (sch) -> (match sch with
  | C_Vuna_dTypecheck_dScheme (qs, ty) -> (match qs with
  | [] -> C_Vuna_dBase_dOk ("")
  | _ -> (let vars = (v_Vuna_dBase_dmap) (fun p -> (match p with
  | C_Vuna_dBase_dPair (_, v) -> v)) ((v_Vuna_dTypedCodegen_dqidMap) (qs)) in (let qmap = (v_Vuna_dTypedCodegen_dqidMap) (qs) in (let fullTy = if (bi_eq) (arity) (0) then C_Vuna_dTypecheck_dTFun (C_Vuna_dTypecheck_dTCon ("Unit", []), ty) else ty in C_Vuna_dBase_dOk ((bi_concat) (" : ") ((bi_concat) ((v_Vuna_dTypedCodegen_djoinWith) (" ") (vars)) ((bi_concat) (". ") ((v_Vuna_dTypedCodegen_docamlTy) (qmap) (fullTy)))))))))))

let rec v_Vuna_dTypedCodegen_dgenTopDef = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, globals, name) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenFunction) (decls) (name)) (fun body -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dschemeAnnotation) (globals) (name) ((v_Vuna_dTypedCodegen_darityOf) (decls) (name))) (fun ann -> C_Vuna_dBase_dOk ((bi_concat) ((v_Vuna_dTypedCodegen_dvalueName) (name)) ((bi_concat) (ann) ((bi_concat) (" = ") (body))))))

let rec v_Vuna_dTypedCodegen_dgenerateProgramTyped = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, globals, printResult) -> (match (v_Vuna_dTypecheck_dlookupScheme) ("main") (globals) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ("typed codegen: no main definition")
  | C_Vuna_dBase_dJust (sch) -> (match sch with
  | C_Vuna_dTypecheck_dScheme (qs, ty) -> (match ty with
  | C_Vuna_dTypecheck_dTFun (a, b) -> C_Vuna_dBase_dErr ("typed codegen: main must be zero-arity")
  | _ -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dshowForTy) (decls) (ty)) (fun showMain -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenTypeDecls) (decls)) (fun types -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenShowDecls) (decls)) (fun shows -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypedCodegen_dgenTop) (decls)) (fun tops -> (let output = (bi_concat) (v_Vuna_dTypedCodegen_druntimeCodeTyped ()) ((bi_concat) ("\n") ((bi_concat) (types) ((bi_concat) ("\n") ((bi_concat) (shows) ((bi_concat) ("\n") (tops)))))) in if printResult then C_Vuna_dBase_dOk ((bi_concat) (output) ((bi_concat) ("let () = print_endline (") ((bi_concat) (showMain) ((bi_concat) (" (") ((bi_concat) ((v_Vuna_dTypedCodegen_dvalueName) ("main")) (" ()))\n")))))) else C_Vuna_dBase_dOk ((bi_concat) (output) ((bi_concat) ("let () = ignore (") ((bi_concat) ((v_Vuna_dTypedCodegen_dvalueName) ("main")) (" ())\n"))))))))))))

let rec v_Vuna_dTypecheck_dshortTyName = fun a0 -> match a0 with
  | (name) -> (match (v_Vuna_dBase_dsplitLastDot) ((v_Vuna_dBase_dsplitOnDot) (name)) with
  | C_Vuna_dBase_dPair (rev, base) -> base)

let rec v_Vuna_dTypecheck_dsameBuiltinTy = fun a0 a1 -> match (a0, a1) with
  | (a, b) -> (let sa = (v_Vuna_dTypecheck_dshortTyName) (a) in (bi_and) ((bi_or) ((bi_eq) (sa) ("Bool")) ((bi_eq) (sa) ("List"))) ((bi_eq) (sa) ((v_Vuna_dTypecheck_dshortTyName) (b))))

let rec v_Vuna_dTypecheck_dunifyLists = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], st) -> C_Vuna_dBase_dOk (st)
  | ((a) :: (ar), (b) :: (br), st) -> (match (v_Vuna_dTypecheck_dunify) (a) (b) (st) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (st2) -> (v_Vuna_dTypecheck_dunifyLists) (ar) (br) (st2))
  | (_, _, st) -> C_Vuna_dBase_dErr ("type mismatch: different number of arguments")
and v_Vuna_dTypecheck_dunify = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (a, b, st) -> (match st with
  | C_Vuna_dTypecheck_dTC (n, s) -> (match (v_Vuna_dTypecheck_dresolveTy) (s) (a) with
  | ra -> (match (v_Vuna_dTypecheck_dresolveTy) (s) (b) with
  | rb -> (match ra with
  | C_Vuna_dTypecheck_dTVar (i) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if (bi_eq) (i) (j) then C_Vuna_dBase_dOk (st) else (v_Vuna_dTypecheck_dbindVar) (i) (rb) (st)
  | _ -> if (v_Vuna_dTypecheck_doccursIn) (i) (s) (rb) then C_Vuna_dBase_dErr ((bi_concat) ("occurs check: ") ((v_Vuna_dTypecheck_dshowTy) (rb))) else (v_Vuna_dTypecheck_dbindVar) (i) (rb) (st))
  | C_Vuna_dTypecheck_dTCon (tn, xs) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if (v_Vuna_dTypecheck_doccursIn) (j) (s) (ra) then C_Vuna_dBase_dErr ((bi_concat) ("occurs check: ") ((v_Vuna_dTypecheck_dshowTy) (ra))) else (v_Vuna_dTypecheck_dbindVar) (j) (ra) (st)
  | C_Vuna_dTypecheck_dTCon (tn2, ys) -> if (bi_or) ((bi_eq) (tn) (tn2)) ((v_Vuna_dTypecheck_dsameBuiltinTy) (tn) (tn2)) then (v_Vuna_dTypecheck_dunifyLists) (xs) (ys) (st) else C_Vuna_dBase_dErr ((bi_concat) ("type mismatch: ") ((bi_concat) ((v_Vuna_dTypecheck_dshowTy) (ra)) ((bi_concat) (" vs ") ((v_Vuna_dTypecheck_dshowTy) (rb)))))
  | _ -> C_Vuna_dBase_dErr ((bi_concat) ("type mismatch: ") ((bi_concat) ((v_Vuna_dTypecheck_dshowTy) (ra)) ((bi_concat) (" vs ") ((v_Vuna_dTypecheck_dshowTy) (rb))))))
  | C_Vuna_dTypecheck_dTFun (x, y) -> (match rb with
  | C_Vuna_dTypecheck_dTVar (j) -> if (v_Vuna_dTypecheck_doccursIn) (j) (s) (ra) then C_Vuna_dBase_dErr ((bi_concat) ("occurs check: ") ((v_Vuna_dTypecheck_dshowTy) (ra))) else (v_Vuna_dTypecheck_dbindVar) (j) (ra) (st)
  | C_Vuna_dTypecheck_dTFun (x2, y2) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (x) (x2) (st)) (fun st2 -> (v_Vuna_dTypecheck_dunify) (y) (y2) (st2))
  | _ -> C_Vuna_dBase_dErr ((bi_concat) ("type mismatch: ") ((bi_concat) ((v_Vuna_dTypecheck_dshowTy) (ra)) ((bi_concat) (" vs ") ((v_Vuna_dTypecheck_dshowTy) (rb))))))))))

let rec v_Vuna_dTypecheck_dinferPatterns = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, [], [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | (globals, locals, (p) :: (pr), (ty) :: (tr), st) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferPattern) (globals) (locals) (st) (p) (ty)) (fun q -> (match q with
  | C_Vuna_dBase_dPair (locals2, st1) -> (v_Vuna_dTypecheck_dinferPatterns) (globals) (locals2) (pr) (tr) (st1)))
  | (globals, locals, _, _, st) -> C_Vuna_dBase_dErr ("pattern arity mismatch")
and v_Vuna_dTypecheck_dinferPattern = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, st, pat, expected) -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | C_Vuna_dAst_dPVar (name) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (name, expected)) :: (locals), st))
  | C_Vuna_dAst_dPInt (n) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (expected) (v_Vuna_dTypecheck_dintTy ()) (st)) (fun st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st2)))
  | C_Vuna_dAst_dPStr (s) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (expected) (v_Vuna_dTypecheck_dstrTy ()) (st)) (fun st2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st2)))
  | C_Vuna_dAst_dPCon (name, pats) -> (match (v_Vuna_dTypecheck_dlookupScheme) (name) (globals) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("unknown constructor: ") (name))
  | C_Vuna_dBase_dJust (sch) -> (match (v_Vuna_dTypecheck_dinstantiate) (st) (sch) with
  | C_Vuna_dBase_dPair (ctorTy, st1) -> (let argTys = (v_Vuna_dTypecheck_dfunArgs) (ctorTy) in if (bi_eq) ((v_Vuna_dBase_dlength) (pats)) ((v_Vuna_dBase_dlength) (argTys)) then (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (expected) ((v_Vuna_dTypecheck_dfunResult) (ctorTy)) (st1)) (fun st2 -> (v_Vuna_dTypecheck_dinferPatterns) (globals) (locals) (pats) (argTys) (st2)) else C_Vuna_dBase_dErr ((bi_concat) ("constructor ") ((bi_concat) (name) ((bi_concat) (" expects ") ((bi_concat) ((bi_str_from_int) ((v_Vuna_dBase_dlength) (argTys))) (" arguments")))))))))

let rec v_Vuna_dTypecheck_dinferArgs = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, fnTy, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (fnTy, st))
  | (globals, locals, fnTy, (arg) :: (rest), st) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals) (st) (arg)) (fun pa -> (match pa with
  | C_Vuna_dBase_dPair (argTy, st1) -> (match (v_Vuna_dTypecheck_dfreshTy) (st1) with
  | C_Vuna_dBase_dPair (resTy, st2) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (fnTy) (C_Vuna_dTypecheck_dTFun (argTy, resTy)) (st2)) (fun st3 -> (v_Vuna_dTypecheck_dinferArgs) (globals) (locals) (resTy) (rest) (st3)))))
and v_Vuna_dTypecheck_dinferBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, locals, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (locals, st))
  | (globals, locals, (b) :: (rest), st) -> (match b with
  | C_Vuna_dBase_dPair (pat, value) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals) (st) (value)) (fun pv -> (match pv with
  | C_Vuna_dBase_dPair (valueTy, st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferPattern) (globals) (locals) (st1) (pat) (valueTy)) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st2) -> (v_Vuna_dTypecheck_dinferBinds) (globals) (locals2) (rest) (st2))))))
and v_Vuna_dTypecheck_dinferAlts = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, scrutTy, [], st) -> C_Vuna_dBase_dErr ("empty case")
  | (globals, locals, scrutTy, (alt) :: (rest), st) -> (match alt with
  | C_Vuna_dBase_dPair (pat, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferPattern) (globals) (locals) (st) (pat) (scrutTy)) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals2) (st1) (body)) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (bodyTy, st2) -> (match rest with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (bodyTy, st2))
  | _ -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferAlts) (globals) (locals) (scrutTy) (rest) (st2)) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (restTy, st3) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (bodyTy) (restTy) (st3)) (fun st4 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (bodyTy, st4)))))))))))
and v_Vuna_dTypecheck_dinferExpr = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, locals, st, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> (match (v_Vuna_dTypecheck_dlookupLocal) (name) (locals) with
  | C_Vuna_dBase_dJust (ty) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (ty, st))
  | C_Vuna_dBase_dNothing -> (match (v_Vuna_dTypecheck_dlookupScheme) (name) (globals) with
  | C_Vuna_dBase_dJust (sch) -> (match (v_Vuna_dTypecheck_dinstantiate) (st) (sch) with
  | C_Vuna_dBase_dPair (ty, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (ty, st2)))
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("unbound variable: ") (name))))
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dintTy (), st))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (v_Vuna_dTypecheck_dstrTy (), st))
  | C_Vuna_dAst_dEApp (fn, args) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals) (st) (fn)) (fun pf -> (match pf with
  | C_Vuna_dBase_dPair (fnTy, st1) -> (v_Vuna_dTypecheck_dinferArgs) (globals) (locals) (fnTy) (args) (st1)))
  | C_Vuna_dAst_dELam (params, body) -> (match (v_Vuna_dTypecheck_dseedLocals) (params) (locals) (st) with
  | C_Vuna_dBase_dPair (paramTys, C_Vuna_dBase_dPair (locals2, st1)) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals2) (st1) (body)) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (bodyTy, st2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((v_Vuna_dTypecheck_dfoldFun) (paramTys) (bodyTy), st2)))))
  | C_Vuna_dAst_dELet (binds, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferBinds) (globals) (locals) (binds) (st)) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (locals2, st1) -> (v_Vuna_dTypecheck_dinferExpr) (globals) (locals2) (st1) (body)))
  | C_Vuna_dAst_dECase (scrut, alts) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals) (st) (scrut)) (fun ps -> (match ps with
  | C_Vuna_dBase_dPair (scrutTy, st1) -> (v_Vuna_dTypecheck_dinferAlts) (globals) (locals) (scrutTy) (alts) (st1)))
  | C_Vuna_dAst_dEIf (c, t, e) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals) (st) (c)) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (condTy, st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (condTy) (v_Vuna_dTypecheck_dboolTy ()) (st1)) (fun st2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals) (st2) (t)) (fun pt -> (match pt with
  | C_Vuna_dBase_dPair (thenTy, st3) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals) (st3) (e)) (fun pe -> (match pe with
  | C_Vuna_dBase_dPair (elseTy, st4) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (thenTy) (elseTy) (st4)) (fun st5 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (thenTy, st5)))))))))))

let rec v_Vuna_dTypecheck_dinferClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, st, clause) -> (match clause with
  | C_Vuna_dBase_dPair (pats, body) -> (match (v_Vuna_dTypecheck_dseedPatTypes) (pats) (st) with
  | C_Vuna_dBase_dPair (paramTys, st1) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferPatterns) (globals) ([]) (pats) (paramTys) (st1)) (fun pp -> (match pp with
  | C_Vuna_dBase_dPair (locals2, st2) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferExpr) (globals) (locals2) (st2) (body)) (fun pb -> (match pb with
  | C_Vuna_dBase_dPair (bodyTy, st3) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((v_Vuna_dTypecheck_dfoldFun) (paramTys) (bodyTy), st3))))))))

let rec v_Vuna_dTypecheck_dinferClauses = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, [], st) -> C_Vuna_dBase_dErr ("function has no clauses")
  | (globals, (clause) :: (rest), st) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferClause) (globals) (st) (clause)) (fun pc -> (match pc with
  | C_Vuna_dBase_dPair (ty, st1) -> (match rest with
  | [] -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (ty, st1))
  | _ -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dinferClauses) (globals) (rest) (st1)) (fun pr -> (match pr with
  | C_Vuna_dBase_dPair (restTy, st2) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dunify) (ty) (restTy) (st2)) (fun st3 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (ty, st3))))))))

let rec v_Vuna_dTypecheck_dcheckFunction = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, decls, sigs, name, st) -> (match (v_Vuna_dTypecheck_dlookupScheme) (name) (globals) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) ("missing type signature: ") (name))
  | C_Vuna_dBase_dJust (sch) -> (match (v_Vuna_dTypecheck_dinstantiate) (st) (sch) with
  | C_Vuna_dBase_dPair (expected, st1) -> (match (v_Vuna_dTypecheck_dinferClauses) (globals) ((v_Vuna_dAst_dclausesFor) (decls) (name)) (st1) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((bi_concat) ("in ") ((bi_concat) (name) ((bi_concat) (": ") (e))))
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (inferred, st2)) -> (match (v_Vuna_dTypecheck_dunify) (inferred) (expected) (st2) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr ((bi_concat) ("in ") ((bi_concat) (name) ((bi_concat) (": ") (e))))
  | C_Vuna_dBase_dOk (st3) -> if (v_Vuna_dTypecheck_dhasSig) (name) (sigs) then C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (globals, st3)) else (let resolved = (v_Vuna_dTypecheck_dresolveTy) ((v_Vuna_dTypecheck_dsubstOf) (st3)) (inferred) in (let scheme = C_Vuna_dTypecheck_dScheme ((v_Vuna_dTypecheck_ddiffInts) ((v_Vuna_dTypecheck_dfreeVarsTy) (resolved)) ((v_Vuna_dTypecheck_dfreeVarsEnvExcept) (name) (globals)), resolved) in C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((v_Vuna_dTypecheck_dupdateScheme) (name) (scheme) (globals), st3))))))))

let rec v_Vuna_dTypecheck_dcheckFunctions = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, decls, sigs, [], st) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (globals, st))
  | (globals, decls, sigs, (name) :: (rest), st) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcheckFunction) (globals) (decls) (sigs) (name) (st)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (globals2, st1) -> (v_Vuna_dTypecheck_dcheckFunctions) (globals2) (decls) (sigs) (rest) (st1)))

let rec v_Vuna_dTypecheck_dcheckProgramInfo = fun a0 -> match a0 with
  | (decls) -> (match (v_Vuna_dTypecheck_dcollectData) (decls) with
  | C_Vuna_dBase_dPair (typeNames, dataDecls) -> (match (v_Vuna_dTypecheck_dcollectSigs) (typeNames) (decls) (C_Vuna_dTypecheck_dTC (0, [])) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (sigs, st1)) -> (match (v_Vuna_dTypecheck_dcollectCtors) (typeNames) (decls) (st1) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (ctors, st2)) -> (match (v_Vuna_dTypecheck_dseedPlaceholders) ((v_Vuna_dTypecheck_dfunctionNames) (decls)) (sigs) (st2) with
  | C_Vuna_dBase_dPair (placeholders, st3) -> (match (v_Vuna_dTypecheck_dcheckFunctions) ((v_Vuna_dBase_dappend) (v_Vuna_dTypecheck_dbuiltinSchemes ()) ((v_Vuna_dBase_dappend) (ctors) ((v_Vuna_dBase_dappend) (sigs) (placeholders)))) (decls) (sigs) ((v_Vuna_dTypecheck_dfunctionNames) (decls)) (st3) with
  | C_Vuna_dBase_dErr (e) -> C_Vuna_dBase_dErr (e)
  | C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (globals, st4)) -> C_Vuna_dBase_dOk ((v_Vuna_dTypecheck_dfinalizeGlobals) ((v_Vuna_dTypecheck_dsubstOf) (st4)) (globals)))))))

let rec v_Vuna_dTypecheck_dcheckProgram = fun a0 -> match a0 with
  | (decls) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcheckProgramInfo) (decls)) (fun _u -> C_Vuna_dBase_dOk ([]))

let rec v_Vuna_dEval_ddisplayName = fun a0 -> match a0 with
  | (name) -> (match (v_Vuna_dBase_dsplitLastDot) ((v_Vuna_dBase_dsplitOnDot) (name)) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> base)

let rec v_Vuna_dEval_dshowValue = fun a0 -> match a0 with
  | (v) -> (match v with
  | C_Vuna_dEval_dVInt (n) -> (bi_str_from_int) (n)
  | C_Vuna_dEval_dVStr (s) -> (v_Vuna_dEval_dshowString) (s)
  | C_Vuna_dEval_dVCon (name, []) -> (v_Vuna_dEval_ddisplayName) (name)
  | C_Vuna_dEval_dVCon (name, args) -> (bi_concat) ("(") ((bi_concat) ((v_Vuna_dEval_ddisplayName) (name)) ((bi_concat) (" ") ((bi_concat) ((v_Vuna_dEval_dshowValues) (args)) (")"))))
  | C_Vuna_dEval_dVFun (name, args) -> (bi_concat) ("<function ") ((bi_concat) ((v_Vuna_dEval_ddisplayName) (name)) (">"))
  | C_Vuna_dEval_dVLam (params, body, env) -> "<lambda>"
  | C_Vuna_dEval_dVBuiltin (name, args) -> (bi_concat) ("<builtin ") ((bi_concat) (name) (">")))
and v_Vuna_dEval_dshowValues = fun a0 -> match a0 with
  | ([]) -> ""
  | ((v) :: ([])) -> (v_Vuna_dEval_dshowValue) (v)
  | ((v) :: (rest)) -> (bi_concat) ((v_Vuna_dEval_dshowValue) (v)) ((bi_concat) (" ") ((v_Vuna_dEval_dshowValues) (rest)))

let rec v_Vuna_dEval_drunDecls = fun a0 -> match a0 with
  | (decls) -> (match (v_Vuna_dEval_dinterpretMain) (decls) with
  | C_Vuna_dBase_dErr (e) -> (bi_concat) ("error: ") (e)
  | C_Vuna_dBase_dOk (v) -> (v_Vuna_dEval_dshowValue) (v))

let rec v_Vuna_dInterp_dinterpret = fun a0 -> match a0 with
  | (source) -> (match (v_Vuna_dParser_dparseSource) (source) with
  | C_Vuna_dBase_dErr (e) -> (bi_concat) ("error: ") (e)
  | C_Vuna_dBase_dOk (p) -> (match p with
  | C_Vuna_dBase_dPair (imports, decls) -> (match imports with
  | [] -> (v_Vuna_dEval_drunDecls) (decls)
  | _ -> "error: imports are only supported by interpretFile")))

let rec v_Vuna_dInterp_dmain = fun () -> (v_Vuna_dInterp_dinterpret) (v_Vuna_dInterp_ddemo ())

let rec v_Vuna_dBase_djoinDots = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (bi_concat) (x) ((bi_concat) (".") ((v_Vuna_dBase_djoinDots) (rest)))

let rec v_Vuna_dLoader_dresolveQualified = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (modules, label, imports, name) -> (match (v_Vuna_dBase_dsplitLastDot) ((v_Vuna_dBase_dsplitOnDot) (name)) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (let prefix = (v_Vuna_dBase_djoinDots) (revPrefix) in (match (v_Vuna_dLoader_dfindImportPrefix) (imports) (prefix) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": module ") ((bi_concat) (prefix) (" is not imported"))))
  | C_Vuna_dBase_dJust (m) -> if (v_Vuna_dLoader_disGlobalCtor) (base) then C_Vuna_dBase_dOk (base) else if (v_Vuna_dBase_dmemName) (base) ((v_Vuna_dLoader_dexportsOf) (modules) (m)) then C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (m) (base)) else C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": ") ((bi_concat) (base) ((bi_concat) (" is not exported by ") (m))))))))

let rec v_Vuna_dLoader_dresolveGlobal = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (modules, label, prefix, own, imports, scope, name) -> if (v_Vuna_dBase_dmemName) (name) (scope) then C_Vuna_dBase_dOk (name) else if (v_Vuna_dLoader_disGlobalCtor) (name) then C_Vuna_dBase_dOk (name) else if (v_Vuna_dBase_dcontainsDot) (name) then (v_Vuna_dLoader_dresolveQualified) (modules) (label) (imports) (name) else if (v_Vuna_dBase_dmemName) (name) (own) then C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (prefix) (name)) else if (v_Vuna_dLoader_disBuiltinName) (name) then C_Vuna_dBase_dOk (name) else (match (v_Vuna_dLoader_dmodulesExporting) (modules) (imports) (name) with
  | [] -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": unbound variable ") (name)))
  | (m) :: ([]) -> C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (m) (name))
  | ms -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": ambiguous name ") ((bi_concat) (name) ((bi_concat) (" (imported from ") ((bi_concat) ((v_Vuna_dLoader_djoinNames) (ms)) ("); qualify it")))))))

let rec v_Vuna_dLoader_dresolveCtor = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownCtors, imports, name) -> if (v_Vuna_dLoader_disGlobalCtor) (name) then C_Vuna_dBase_dOk (name) else if (v_Vuna_dBase_dcontainsDot) (name) then (v_Vuna_dLoader_dresolveQualified) (modules) (label) (imports) (name) else if (v_Vuna_dBase_dmemName) (name) (ownCtors) then C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (prefix) (name)) else (match (v_Vuna_dLoader_dmodulesExportingCtor) (modules) (imports) (name) with
  | [] -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": unknown constructor ") (name)))
  | (m) :: ([]) -> C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (m) (name))
  | ms -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": ambiguous constructor ") ((bi_concat) (name) ((bi_concat) (" (imported from ") ((bi_concat) ((v_Vuna_dLoader_djoinNames) (ms)) ("); qualify it")))))))

let rec v_Vuna_dLoader_dresolvePattern = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownCtors, imports, pat) -> (match pat with
  | C_Vuna_dAst_dPWild -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPWild, []))
  | C_Vuna_dAst_dPVar (name) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dcheckBinder) (label) (name)) (fun _u -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPVar (name), (name) :: ([]))))
  | C_Vuna_dAst_dPInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPInt (n), []))
  | C_Vuna_dAst_dPStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPStr (s), []))
  | C_Vuna_dAst_dPCon (name, pats) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveCtor) (modules) (label) (prefix) (ownCtors) (imports) (name)) (fun name2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) ((v_Vuna_dLoader_dresolvePattern) (modules) (label) (prefix) (ownCtors) (imports)) (pats)) (fun parts -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (C_Vuna_dAst_dPCon (name2, (v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (parts)), (v_Vuna_dBase_dconcatMap) (v_Vuna_dBase_dsecondOf) (parts))))))

let rec v_Vuna_dLoader_dresolveAlt = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, alt) -> (match alt with
  | C_Vuna_dBase_dPair (pat, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolvePattern) (modules) (label) (prefix) (ownCtors) (imports) (pat)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) ((v_Vuna_dBase_dappend) (bound) (scope)) (body)) (fun body2 -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair (pat2, body2))))))
and v_Vuna_dLoader_dresolveLet = fun a0 a1 a2 a3 a4 a5 a6 a7 a8 -> match (a0, a1, a2, a3, a4, a5, a6, a7, a8) with
  | (modules, label, prefix, own, ownCtors, imports, scope, binds, body) -> (match binds with
  | [] -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (body)) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ([], b)))
  | (b) :: (rest) -> (match b with
  | C_Vuna_dBase_dPair (pat, value) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (value)) (fun value2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolvePattern) (modules) (label) (prefix) (ownCtors) (imports) (pat)) (fun p -> (match p with
  | C_Vuna_dBase_dPair (pat2, bound) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveLet) (modules) (label) (prefix) (own) (ownCtors) (imports) ((v_Vuna_dBase_dappend) (bound) (scope)) (rest) (body)) (fun r -> (match r with
  | C_Vuna_dBase_dPair (binds2, body2) -> C_Vuna_dBase_dOk (C_Vuna_dBase_dPair ((C_Vuna_dBase_dPair (pat2, value2)) :: (binds2), body2)))))))))
and v_Vuna_dLoader_dresolveExpr = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, expr) -> (match expr with
  | C_Vuna_dAst_dEVar (name) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveGlobal) (modules) (label) (prefix) (own) (imports) (scope) (name)) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (n)))
  | C_Vuna_dAst_dEInt (n) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEInt (n))
  | C_Vuna_dAst_dEStr (s) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEStr (s))
  | C_Vuna_dAst_dELam (params, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) ((v_Vuna_dLoader_dcheckBinder) (label)) (params)) (fun _u -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) ((v_Vuna_dBase_dappend) (params) (scope)) (body)) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELam (params, b))))
  | C_Vuna_dAst_dEApp (fn, args) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (fn)) (fun fn2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) (fun a -> (v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (a)) (args)) (fun args2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp (fn2, args2))))
  | C_Vuna_dAst_dELet (binds, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveLet) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (binds) (body)) (fun r -> (match r with
  | C_Vuna_dBase_dPair (binds2, body2) -> C_Vuna_dBase_dOk (C_Vuna_dAst_dELet (binds2, body2))))
  | C_Vuna_dAst_dECase (scrut, alts) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (scrut)) (fun scrut2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) ((v_Vuna_dLoader_dresolveAlt) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope)) (alts)) (fun alts2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dECase (scrut2, alts2))))
  | C_Vuna_dAst_dEIf (c, t, e) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (c)) (fun c2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (t)) (fun t2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) (scope) (e)) (fun e2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEIf (c2, t2, e2))))))

let rec v_Vuna_dLoader_dresolveTypeName = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, name) -> if (bi_or) ((bi_or) ((bi_or) ((bi_or) ((bi_eq) (name) ("Int")) ((bi_eq) (name) ("String"))) ((bi_eq) (name) ("Bool"))) ((bi_eq) (name) ("Type"))) ((bi_eq) (name) ("->")) then C_Vuna_dBase_dOk (name) else if (v_Vuna_dLoader_disLowerTypeName) (name) then C_Vuna_dBase_dOk (name) else if (v_Vuna_dBase_dcontainsDot) (name) then (match (v_Vuna_dBase_dsplitLastDot) ((v_Vuna_dBase_dsplitOnDot) (name)) with
  | C_Vuna_dBase_dPair (revPrefix, base) -> (let typePrefix = (v_Vuna_dBase_djoinDots) (revPrefix) in (match (v_Vuna_dLoader_dfindImportPrefix) (imports) (typePrefix) with
  | C_Vuna_dBase_dNothing -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": module ") ((bi_concat) (typePrefix) (" is not imported"))))
  | C_Vuna_dBase_dJust (m) -> if (v_Vuna_dBase_dmemName) (base) ((v_Vuna_dLoader_dtypeExportsOf) (modules) (m)) then C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (m) (base)) else C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": type ") ((bi_concat) (base) ((bi_concat) (" is not exported by ") (m)))))))) else if (v_Vuna_dBase_dmemName) (name) (ownTypes) then C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (prefix) (name)) else (match (v_Vuna_dLoader_dmodulesExportingType) (modules) (imports) (name) with
  | [] -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": unknown type ") (name)))
  | (m) :: ([]) -> C_Vuna_dBase_dOk ((v_Vuna_dLoader_dmangle) (m) (name))
  | ms -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": ambiguous type ") ((bi_concat) (name) ((bi_concat) (" (imported from ") ((bi_concat) ((v_Vuna_dLoader_djoinNames) (ms)) (")")))))))

let rec v_Vuna_dLoader_dresolveTypeExpr = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, ty) -> (match ty with
  | C_Vuna_dAst_dEVar (name) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveTypeName) (modules) (label) (prefix) (ownTypes) (imports) (name)) (fun n -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEVar (n)))
  | C_Vuna_dAst_dEApp (fn, args) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveTypeExpr) (modules) (label) (prefix) (ownTypes) (imports) (fn)) (fun fn2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) ((v_Vuna_dLoader_dresolveTypeExpr) (modules) (label) (prefix) (ownTypes) (imports)) (args)) (fun args2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dEApp (fn2, args2))))
  | _ -> C_Vuna_dBase_dErr ((bi_concat) (label) ((bi_concat) (": invalid type expression (") ((bi_concat) ((v_Vuna_dLoader_dtyShape) (ty)) (")")))))

let rec v_Vuna_dLoader_dresolveCtorSpec = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, c) -> (match c with
  | C_Vuna_dAst_dCtor (ctor, ty, arity) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveCtorDecl) (label) (prefix) (ctor)) (fun c2 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveTypeExpr) (modules) (label) (prefix) (ownTypes) (imports) (ty)) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dCtor (c2, ty2, arity)))))

let rec v_Vuna_dLoader_dresolveDecl = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (modules, label, prefix, own, ownCtors, ownTypes, imports, d) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveTypeTopName) (label) (prefix) (dname)) (fun dn -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) ((v_Vuna_dLoader_dresolveCtorSpec) (modules) (label) (prefix) (ownTypes) (imports)) (ctors)) (fun ctors2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDData (dn, params, ctors2))))
  | C_Vuna_dAst_dDSig (name, ty) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveTopName) (label) (prefix) (name)) (fun n -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveTypeExpr) (modules) (label) (prefix) (ownTypes) (imports) (ty)) (fun ty2 -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDSig (n, ty2))))
  | C_Vuna_dAst_dDFun (name, pats, body) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveTopName) (label) (prefix) (name)) (fun n -> (v_Vuna_dBase_dandThen) ((v_Vuna_dBase_dtraverse) ((v_Vuna_dLoader_dresolvePattern) (modules) (label) (prefix) (ownCtors) (imports)) (pats)) (fun parts -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveExpr) (modules) (label) (prefix) (own) (ownCtors) (imports) ((v_Vuna_dBase_dconcatMap) (v_Vuna_dBase_dsecondOf) (parts)) (body)) (fun b -> C_Vuna_dBase_dOk (C_Vuna_dAst_dDFun (n, (v_Vuna_dBase_dmap) (v_Vuna_dBase_dfirstOf) (parts), b))))))

let rec v_Vuna_dLoader_dresolveProgram = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (modules, label, prefix, own, ownCtors, ownTypes, imports, decls) -> (v_Vuna_dBase_dtraverse) ((v_Vuna_dLoader_dresolveDecl) (modules) (label) (prefix) (own) (ownCtors) (ownTypes) (imports)) (decls)

let rec v_Vuna_dLoader_dresolveEntry = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (modules, imports, decls) -> (v_Vuna_dLoader_dresolveProgram) (modules) ("<entry>") ("") ((v_Vuna_dAst_dtopNames) (decls)) ((v_Vuna_dAst_dctorsOf) (decls)) ((v_Vuna_dAst_dtypeNamesOf) (decls)) (imports) (decls)

let rec v_Vuna_dLoader_dresolveModules = fun a0 -> match a0 with
  | (modules) -> (match modules with
  | [] -> C_Vuna_dBase_dOk ([])
  | (m) :: (rest) -> (match m with
  | C_Vuna_dLoader_dModule (name, imports, decls, exports) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveProgram) (modules) (name) (name) (exports) ((v_Vuna_dAst_dctorsOf) (decls)) ((v_Vuna_dAst_dtypeNamesOf) (decls)) (imports) (decls)) (fun d1 -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveModules) (rest)) (fun d2 -> C_Vuna_dBase_dOk ((v_Vuna_dBase_dappend) (d1) (d2))))))

let rec v_Vuna_dBase_djoinSlashes = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (bi_concat) (x) ((bi_concat) ("/") ((v_Vuna_dBase_djoinSlashes) (rest)))

let rec v_Vuna_dLoader_dmodulePath = fun a0 a1 -> match (a0, a1) with
  | (root, name) -> (bi_concat) (root) ((bi_concat) ("/") ((bi_concat) ((v_Vuna_dBase_djoinSlashes) ((v_Vuna_dBase_dsplitOnDot) (name))) (".vuna")))

let rec v_Vuna_dBase_djoinArrows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (bi_concat) (x) ((bi_concat) (" -> ") ((v_Vuna_dBase_djoinArrows) (rest)))

let rec v_Vuna_dLoader_dshowCycle = fun a0 a1 -> match (a0, a1) with
  | (name, stack) -> (v_Vuna_dBase_djoinArrows) ((v_Vuna_dBase_dreverse) ((name) :: (stack)))

let rec v_Vuna_dLoader_dloadAll = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (root, modules, stack, imports) -> (match imports with
  | [] -> C_Vuna_dBase_dOk (modules)
  | (imp) :: (rest) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dloadModule) (root) (modules) (stack) ((v_Vuna_dLoader_dimportName) (imp))) (fun modules2 -> (v_Vuna_dLoader_dloadAll) (root) (modules2) (stack) (rest)))
and v_Vuna_dLoader_dloadModule = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (root, modules, stack, name) -> (match (v_Vuna_dLoader_dfindModule) (modules) (name) with
  | C_Vuna_dBase_dJust (m) -> C_Vuna_dBase_dOk (modules)
  | C_Vuna_dBase_dNothing -> if (v_Vuna_dBase_dmemName) (name) (stack) then C_Vuna_dBase_dErr ((bi_concat) ("import cycle: ") ((v_Vuna_dLoader_dshowCycle) (name) (stack))) else if (v_Vuna_dLoader_dvalidModuleName) (name) then (v_Vuna_dBase_dandThen) ((v_Vuna_dParser_dparseSource) ((bi_read_file) ((v_Vuna_dLoader_dmodulePath) (root) (name)))) (fun p -> (match p with
  | C_Vuna_dBase_dPair (imports, decls) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dvalidateImports) (name) (imports)) (fun _u -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dloadAll) (root) (modules) ((name) :: (stack)) (imports)) (fun modules2 -> C_Vuna_dBase_dOk ((C_Vuna_dLoader_dModule (name, imports, decls, (v_Vuna_dAst_dtopNames) (decls))) :: (modules2)))))) else C_Vuna_dBase_dErr ((bi_concat) ("invalid module name: ") (name)))

let rec v_Vuna_dLoader_dloadProgram = fun a0 a1 -> match (a0, a1) with
  | (root, entry) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dParser_dparseSource) ((bi_read_file) (entry))) (fun p -> (match p with
  | C_Vuna_dBase_dPair (imports, decls) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dvalidateImports) ("<entry>") (imports)) (fun _u -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dloadAll) (root) ([]) ([]) (imports)) (fun modules -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveEntry) (modules) (imports) (decls)) (fun entryDecls -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dresolveModules) (modules)) (fun moduleDecls -> C_Vuna_dBase_dOk ((v_Vuna_dBase_dappend) (entryDecls) (moduleDecls))))))))

let rec v_Vuna_dInterp_dinterpretFile = fun a0 a1 -> match (a0, a1) with
  | (root, entry) -> (match (v_Vuna_dLoader_dloadProgram) (root) (entry) with
  | C_Vuna_dBase_dErr (e) -> (bi_concat) ("error: ") (e)
  | C_Vuna_dBase_dOk (decls) -> (v_Vuna_dEval_drunDecls) (decls))

let rec v_Vuna_dInterp_dcompileFile = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (root, entry, printResult) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dloadProgram) (root) (entry)) (fun decls -> (match decls with
  | ds -> (v_Vuna_dCodegen_dgenerateProgram) (ds) (printResult)))

let rec v_Vuna_dInterp_dcompileFileChecked = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (root, entry, printResult) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dloadProgram) (root) (entry)) (fun decls -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcheckProgram) (decls)) (fun _u -> (v_Vuna_dCodegen_dgenerateProgram) (decls) (printResult)))

let rec v_Vuna_dInterp_dcompileFileTyped = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (root, entry, printResult) -> (v_Vuna_dBase_dandThen) ((v_Vuna_dLoader_dloadProgram) (root) (entry)) (fun decls -> (v_Vuna_dBase_dandThen) ((v_Vuna_dTypecheck_dcheckProgramInfo) (decls)) (fun globals -> (v_Vuna_dTypedCodegen_dgenerateProgramTyped) (decls) (globals) (printResult)))

let rec v_emit = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (printResult, typeCheck, typed, root, entry, rest) -> (let result = if typed then (v_Vuna_dInterp_dcompileFileTyped) (root) (entry) (printResult) else if typeCheck then (v_Vuna_dInterp_dcompileFileChecked) (root) (entry) (printResult) else (v_Vuna_dInterp_dcompileFile) (root) (entry) (printResult) in (match result with
  | C_Vuna_dBase_dOk (code) -> (match rest with
  | (out) :: ([]) -> (let _ = (bi_write_file) (out) (code) in 0)
  | _ -> (let _ = (bi_print) (code) in 0))
  | C_Vuna_dBase_dErr (e) -> (let _ = (bi_print) ((bi_concat) ("error: ") ((bi_concat) (e) ("\n"))) in 1)))

let rec v_dispatch = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (printResult, typeCheck, typed, root, args) -> (match args with
  | [] -> v_emitUsage ()
  | (a) :: (rest) -> if (bi_eq) (a) ("--no-print") then (v_dispatch) (false) (typeCheck) (typed) (root) (rest) else if (bi_eq) (a) ("--no-typecheck") then (v_dispatch) (printResult) (false) (false) (root) (rest) else if (bi_eq) (a) ("--typecheck") then (v_dispatch) (printResult) (true) (typed) (root) (rest) else if (bi_eq) (a) ("--typed") then (v_dispatch) (printResult) (true) (true) (root) (rest) else if (bi_eq) (a) ("--root") then (match rest with
  | (dir) :: (rest2) -> (v_dispatch) (printResult) (typeCheck) (typed) (dir) (rest2)
  | [] -> v_emitUsage ()) else (v_emit) (printResult) (typeCheck) (typed) (root) (a) (rest))

let rec v_main = fun () -> (v_dispatch) (true) (true) (true) ("lib") (bi_get_args ())
let () = ignore (v_main ())
