open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
type   t_Vuna_dCompiler_dTypecheck_dTy =
    C_Vuna_dCompiler_dTypecheck_dTVar of (int)
  | C_Vuna_dCompiler_dTypecheck_dTCon of (string) * ((t_Vuna_dCompiler_dTypecheck_dTy) list)
  | C_Vuna_dCompiler_dTypecheck_dTFun of (t_Vuna_dCompiler_dTypecheck_dTy) * (t_Vuna_dCompiler_dTypecheck_dTy)
  | C_Vuna_dCompiler_dTypecheck_dTApp of (t_Vuna_dCompiler_dTypecheck_dTy) * ((t_Vuna_dCompiler_dTypecheck_dTy) list)
and   t_Vuna_dCompiler_dTypecheck_dScheme =
    C_Vuna_dCompiler_dTypecheck_dScheme of ((int) list) * (((string, t_Vuna_dCompiler_dTypecheck_dTy) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dTypecheck_dTy)
and   t_Vuna_dCompiler_dTypecheck_dRecordInfo =
    C_Vuna_dCompiler_dTypecheck_dRecordInfo of (string) * ((string) list) * (((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * ((string) list)
and   t_Vuna_dCompiler_dTypecheck_dRecConstraint =
    C_Vuna_dCompiler_dTypecheck_dFieldCon of (t_Vuna_dCompiler_dTypecheck_dTy) * (string) * (t_Vuna_dCompiler_dTypecheck_dTy) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dUpdateCon of (t_Vuna_dCompiler_dTypecheck_dTy) * (string) * (t_Vuna_dCompiler_dTypecheck_dTy) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dTypecheck_dTC =
    C_Vuna_dCompiler_dTypecheck_dTC of (int) * (t_Vuna_dCompiler_dTypecheck_dTySubst) * ((string) list) * ((t_Vuna_dCompiler_dTypecheck_dRecordInfo) list) * ((t_Vuna_dCompiler_dTypecheck_dRecConstraint) list) * ((t_Vuna_dCompiler_dTypecheck_dTraitMethodRef) list) * (t_Vuna_dCompiler_dTypecheck_dTraitCtx)
and   t_Vuna_dCompiler_dTypecheck_dTySubst =
    C_Vuna_dCompiler_dTypecheck_dTsLeaf
  | C_Vuna_dCompiler_dTypecheck_dTsNode of (int) * (t_Vuna_dCompiler_dTypecheck_dTy) * (int) * (t_Vuna_dCompiler_dTypecheck_dTySubst) * (t_Vuna_dCompiler_dTypecheck_dTySubst)
and   t_Vuna_dCompiler_dTypecheck_dEExpr =
    C_Vuna_dCompiler_dTypecheck_dXEVar of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEInt of (int) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEStr of (string) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXELam of ((string) list) * (t_Vuna_dCompiler_dTypecheck_dEExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEApp of (t_Vuna_dCompiler_dTypecheck_dEExpr) * ((t_Vuna_dCompiler_dTypecheck_dEExpr) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXELet of (((t_Vuna_dCompiler_dAst_dPat, t_Vuna_dCompiler_dTypecheck_dEExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dTypecheck_dEExpr) * (bool) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXECase of (t_Vuna_dCompiler_dTypecheck_dEExpr) * (t_Vuna_dCompiler_dTypecheck_dTy) * (((t_Vuna_dCompiler_dAst_dPat, t_Vuna_dCompiler_dTypecheck_dEExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEIf of (t_Vuna_dCompiler_dTypecheck_dEExpr) * (t_Vuna_dCompiler_dTypecheck_dEExpr) * (t_Vuna_dCompiler_dTypecheck_dEExpr) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEField of (t_Vuna_dCompiler_dTypecheck_dEExpr) * (string) * (t_Vuna_dCompiler_dTypecheck_dTy) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate of (t_Vuna_dCompiler_dTypecheck_dEExpr) * (t_Vuna_dCompiler_dTypecheck_dTy) * (((string, t_Vuna_dCompiler_dTypecheck_dEExpr) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEFun of (string) * (((string, t_Vuna_dCompiler_dTypecheck_dTy) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEMethod of (string) * (string) * (t_Vuna_dCompiler_dTypecheck_dTy) * (t_Vuna_dCompiler_dCommon_dSpan)
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst of (string) * (string) * (string) * (t_Vuna_dCompiler_dTypecheck_dTy) * (t_Vuna_dCompiler_dCommon_dSpan)
and   t_Vuna_dCompiler_dTypecheck_dDictParam =
    C_Vuna_dCompiler_dTypecheck_dDictParam of (string) * (int) * (string) * (string)
and   t_Vuna_dCompiler_dTypecheck_dTraitMethodInfo =
    C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo of (string) * (t_Vuna_dCompiler_dTypecheck_dScheme) * (t_Vuna_dCompiler_dAst_dExpr)
and   t_Vuna_dCompiler_dTypecheck_dTraitDecl =
    C_Vuna_dCompiler_dTypecheck_dTraitDecl of (string) * (string) * (int) * ((t_Vuna_dCompiler_dTypecheck_dTraitMethodInfo) list)
and   t_Vuna_dCompiler_dTypecheck_dTraitMethodRef =
    C_Vuna_dCompiler_dTypecheck_dTraitMethodRef of (string) * (string) * (t_Vuna_dCompiler_dTypecheck_dScheme) * (int)
and   t_Vuna_dCompiler_dTypecheck_dTraitInst =
    C_Vuna_dCompiler_dTypecheck_dTraitInst of (string) * ((string) t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dTypecheck_dTy) * (((string, string) t_Base_dPair_dPair) list)
and   t_Vuna_dCompiler_dTypecheck_dTraitCtx =
    C_Vuna_dCompiler_dTypecheck_dTraitCtx of ((t_Vuna_dCompiler_dTypecheck_dTraitDecl) list) * ((t_Vuna_dCompiler_dTypecheck_dTraitInst) list) * ((string) list) * ((string) list) * ((t_Vuna_dCompiler_dTypecheck_dTraitMethodRef) list)
and   t_Vuna_dCompiler_dTypecheck_dDataShape =
    C_Vuna_dCompiler_dTypecheck_dDataShape of (string) * ((string) list) * (((string, (t_Vuna_dCompiler_dAst_dExpr) list) t_Base_dPair_dPair) list)
let rec show_Vuna_dCompiler_dTypecheck_dTy v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTVar f0 -> show_ctor "TVar" [(string_of_int) f0]
  | C_Vuna_dCompiler_dTypecheck_dTCon (f0, f1) -> show_ctor "TCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dTy) x ^ " " ^ go xs ^ ")" in go v)) f1]
  | C_Vuna_dCompiler_dTypecheck_dTFun (f0, f1) -> show_ctor "TFun" [(show_Vuna_dCompiler_dTypecheck_dTy) f0; (show_Vuna_dCompiler_dTypecheck_dTy) f1]
  | C_Vuna_dCompiler_dTypecheck_dTApp (f0, f1) -> show_ctor "TApp" [(show_Vuna_dCompiler_dTypecheck_dTy) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dTy) x ^ " " ^ go xs ^ ")" in go v)) f1]
and show_Vuna_dCompiler_dTypecheck_dScheme v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dScheme (f0, f1, f2) -> show_ctor "Scheme" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dTypecheck_dTy)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dCompiler_dTypecheck_dTy) f2]
and show_Vuna_dCompiler_dTypecheck_dRecordInfo v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dRecordInfo (f0, f1, f2, f3) -> show_ctor "RecordInfo" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dCompiler_dTypecheck_dRecConstraint v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dFieldCon (f0, f1, f2, f3) -> show_ctor "FieldCon" [(show_Vuna_dCompiler_dTypecheck_dTy) f0; (show_vstring) f1; (show_Vuna_dCompiler_dTypecheck_dTy) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
  | C_Vuna_dCompiler_dTypecheck_dUpdateCon (f0, f1, f2, f3) -> show_ctor "UpdateCon" [(show_Vuna_dCompiler_dTypecheck_dTy) f0; (show_vstring) f1; (show_Vuna_dCompiler_dTypecheck_dTy) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
and show_Vuna_dCompiler_dTypecheck_dTC v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTC (f0, f1, f2, f3, f4, f5, f6) -> show_ctor "TC" [(string_of_int) f0; (show_Vuna_dCompiler_dTypecheck_dTySubst) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dRecordInfo) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dRecConstraint) x ^ " " ^ go xs ^ ")" in go v)) f4; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dTraitMethodRef) x ^ " " ^ go xs ^ ")" in go v)) f5; (show_Vuna_dCompiler_dTypecheck_dTraitCtx) f6]
and show_Vuna_dCompiler_dTypecheck_dTySubst v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTsLeaf -> "TsLeaf"
  | C_Vuna_dCompiler_dTypecheck_dTsNode (f0, f1, f2, f3, f4) -> show_ctor "TsNode" [(string_of_int) f0; (show_Vuna_dCompiler_dTypecheck_dTy) f1; (string_of_int) f2; (show_Vuna_dCompiler_dTypecheck_dTySubst) f3; (show_Vuna_dCompiler_dTypecheck_dTySubst) f4]
and show_Vuna_dCompiler_dTypecheck_dEExpr v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dXEVar (f0, f1) -> show_ctor "XEVar" [(show_vstring) f0; (show_Vuna_dCompiler_dCommon_dSpan) f1]
  | C_Vuna_dCompiler_dTypecheck_dXEInt (f0, f1) -> show_ctor "XEInt" [(string_of_int) f0; (show_Vuna_dCompiler_dCommon_dSpan) f1]
  | C_Vuna_dCompiler_dTypecheck_dXEStr (f0, f1) -> show_ctor "XEStr" [(show_vstring) f0; (show_Vuna_dCompiler_dCommon_dSpan) f1]
  | C_Vuna_dCompiler_dTypecheck_dXELam (f0, f1, f2) -> show_ctor "XELam" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dCompiler_dTypecheck_dEExpr) f1; (show_Vuna_dCompiler_dCommon_dSpan) f2]
  | C_Vuna_dCompiler_dTypecheck_dXEApp (f0, f1, f2) -> show_ctor "XEApp" [(show_Vuna_dCompiler_dTypecheck_dEExpr) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dEExpr) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dCompiler_dCommon_dSpan) f2]
  | C_Vuna_dCompiler_dTypecheck_dXELet (f0, f1, f2, f3) -> show_ctor "XELet" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_Vuna_dCompiler_dAst_dPat show_Vuna_dCompiler_dTypecheck_dEExpr)) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dCompiler_dTypecheck_dEExpr) f1; (show_vbool) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
  | C_Vuna_dCompiler_dTypecheck_dXECase (f0, f1, f2, f3) -> show_ctor "XECase" [(show_Vuna_dCompiler_dTypecheck_dEExpr) f0; (show_Vuna_dCompiler_dTypecheck_dTy) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_Vuna_dCompiler_dAst_dPat show_Vuna_dCompiler_dTypecheck_dEExpr)) x ^ " " ^ go xs ^ ")" in go v)) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
  | C_Vuna_dCompiler_dTypecheck_dXEIf (f0, f1, f2, f3) -> show_ctor "XEIf" [(show_Vuna_dCompiler_dTypecheck_dEExpr) f0; (show_Vuna_dCompiler_dTypecheck_dEExpr) f1; (show_Vuna_dCompiler_dTypecheck_dEExpr) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
  | C_Vuna_dCompiler_dTypecheck_dXEField (f0, f1, f2, f3) -> show_ctor "XEField" [(show_Vuna_dCompiler_dTypecheck_dEExpr) f0; (show_vstring) f1; (show_Vuna_dCompiler_dTypecheck_dTy) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate (f0, f1, f2, f3) -> show_ctor "XERecUpdate" [(show_Vuna_dCompiler_dTypecheck_dEExpr) f0; (show_Vuna_dCompiler_dTypecheck_dTy) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dTypecheck_dEExpr)) x ^ " " ^ go xs ^ ")" in go v)) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
  | C_Vuna_dCompiler_dTypecheck_dXEFun (f0, f1, f2) -> show_ctor "XEFun" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dTypecheck_dTy)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dCompiler_dCommon_dSpan) f2]
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (f0, f1, f2, f3) -> show_ctor "XEMethod" [(show_vstring) f0; (show_vstring) f1; (show_Vuna_dCompiler_dTypecheck_dTy) f2; (show_Vuna_dCompiler_dCommon_dSpan) f3]
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst (f0, f1, f2, f3, f4) -> show_ctor "XEMethodInst" [(show_vstring) f0; (show_vstring) f1; (show_vstring) f2; (show_Vuna_dCompiler_dTypecheck_dTy) f3; (show_Vuna_dCompiler_dCommon_dSpan) f4]
and show_Vuna_dCompiler_dTypecheck_dDictParam v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dDictParam (f0, f1, f2, f3) -> show_ctor "DictParam" [(show_vstring) f0; (string_of_int) f1; (show_vstring) f2; (show_vstring) f3]
and show_Vuna_dCompiler_dTypecheck_dTraitMethodInfo v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo (f0, f1, f2) -> show_ctor "TraitMethodInfo" [(show_vstring) f0; (show_Vuna_dCompiler_dTypecheck_dScheme) f1; (show_Vuna_dCompiler_dAst_dExpr) f2]
and show_Vuna_dCompiler_dTypecheck_dTraitDecl v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTraitDecl (f0, f1, f2, f3) -> show_ctor "TraitDecl" [(show_vstring) f0; (show_vstring) f1; (string_of_int) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dTraitMethodInfo) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dCompiler_dTypecheck_dTraitMethodRef v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTraitMethodRef (f0, f1, f2, f3) -> show_ctor "TraitMethodRef" [(show_vstring) f0; (show_vstring) f1; (show_Vuna_dCompiler_dTypecheck_dScheme) f2; (string_of_int) f3]
and show_Vuna_dCompiler_dTypecheck_dTraitInst v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTraitInst (f0, f1, f2, f3) -> show_ctor "TraitInst" [(show_vstring) f0; ((show_Base_dMaybe_dMaybe show_vstring)) f1; (show_Vuna_dCompiler_dTypecheck_dTy) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dCompiler_dTypecheck_dTraitCtx v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dTraitCtx (f0, f1, f2, f3, f4) -> show_ctor "TraitCtx" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dTraitDecl) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dTraitInst) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dTypecheck_dTraitMethodRef) x ^ " " ^ go xs ^ ")" in go v)) f4]
and show_Vuna_dCompiler_dTypecheck_dDataShape v =
  match v with
  | C_Vuna_dCompiler_dTypecheck_dDataShape (f0, f1, f2) -> show_ctor "DataShape" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring (fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dExpr) x ^ " " ^ go xs ^ ")" in go v))) x ^ " " ^ go xs ^ ")" in go v)) f2]
let v_Vuna_dCompiler_dTypecheck_dmkScheme = fun qs ty -> C_Vuna_dCompiler_dTypecheck_dScheme (qs, [], ty)

let v_Vuna_dCompiler_dTypecheck_dtsHeight = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTsLeaf) -> 0
  | (C_Vuna_dCompiler_dTypecheck_dTsNode (k, v, h, l, r)) -> h
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 47 1 ("no matching clause for Vuna.Compiler.Typecheck.tsHeight")

let v_Vuna_dCompiler_dTypecheck_dtsMax = fun a b -> if v_vuna_uge_ugeneric a b then a else b

let v_Vuna_dCompiler_dTypecheck_dtsMake = fun k v l r -> C_Vuna_dCompiler_dTypecheck_dTsNode (k, v, bi_add 1 (v_Vuna_dCompiler_dTypecheck_dtsMax (v_Vuna_dCompiler_dTypecheck_dtsHeight l) (v_Vuna_dCompiler_dTypecheck_dtsHeight r)), l, r)

let v_Vuna_dCompiler_dTypecheck_dtsRotRight = fun s -> (match s with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (k, v, h, C_Vuna_dCompiler_dTypecheck_dTsNode (lk, lv, lh, ll, lr), r) -> v_Vuna_dCompiler_dTypecheck_dtsMake lk lv ll (v_Vuna_dCompiler_dTypecheck_dtsMake k v lr r)
  | _ -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 54 16 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtsRotLeft = fun s -> (match s with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (k, v, h, l, C_Vuna_dCompiler_dTypecheck_dTsNode (rk, rv, rh, rl, rr)) -> v_Vuna_dCompiler_dTypecheck_dtsMake rk rv (v_Vuna_dCompiler_dTypecheck_dtsMake k v l rl) rr
  | _ -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 58 15 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtsBalanceLeft = fun s -> (match s with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (k, v, h, l, r) -> (match l with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (lk, lv, lh, ll, lr) -> if v_vuna_uge_uint (v_Vuna_dCompiler_dTypecheck_dtsHeight ll) (v_Vuna_dCompiler_dTypecheck_dtsHeight lr) then v_Vuna_dCompiler_dTypecheck_dtsRotRight s else v_Vuna_dCompiler_dTypecheck_dtsRotRight (v_Vuna_dCompiler_dTypecheck_dtsMake k v (v_Vuna_dCompiler_dTypecheck_dtsRotLeft l) r)
  | _ -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 72 23 ("case pattern match failure"))
  | _ -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 71 19 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtsBalanceRight = fun s -> (match s with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (k, v, h, l, r) -> (match r with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (rk, rv, rh, rl, rr) -> if v_vuna_uge_uint (v_Vuna_dCompiler_dTypecheck_dtsHeight rr) (v_Vuna_dCompiler_dTypecheck_dtsHeight rl) then v_Vuna_dCompiler_dTypecheck_dtsRotLeft s else v_Vuna_dCompiler_dTypecheck_dtsRotLeft (v_Vuna_dCompiler_dTypecheck_dtsMake k v l (v_Vuna_dCompiler_dTypecheck_dtsRotRight r))
  | _ -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 79 23 ("case pattern match failure"))
  | _ -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 78 20 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtsBalanceBy = fun bf s -> if v_vuna_ugt_uint bf 1 then v_Vuna_dCompiler_dTypecheck_dtsBalanceLeft s else if v_vuna_ult_uint bf (bi_sub 0 1) then v_Vuna_dCompiler_dTypecheck_dtsBalanceRight s else s

let v_Vuna_dCompiler_dTypecheck_dtsBalance = fun s -> (match s with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (k, v, h, l, r) -> (let bf = bi_sub (v_Vuna_dCompiler_dTypecheck_dtsHeight l) (v_Vuna_dCompiler_dTypecheck_dtsHeight r) in v_Vuna_dCompiler_dTypecheck_dtsBalanceBy bf s)
  | _ -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 62 15 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dtsPut = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, ty, C_Vuna_dCompiler_dTypecheck_dTsLeaf) -> C_Vuna_dCompiler_dTypecheck_dTsNode (i, ty, 1, C_Vuna_dCompiler_dTypecheck_dTsLeaf, C_Vuna_dCompiler_dTypecheck_dTsLeaf)
  | (i, ty, C_Vuna_dCompiler_dTypecheck_dTsNode (j, tj, h, l, r)) -> if v_vuna_ueq_uint i j then C_Vuna_dCompiler_dTypecheck_dTsNode (j, ty, h, l, r) else if v_vuna_ult_uint i j then v_Vuna_dCompiler_dTypecheck_dtsBalance (v_Vuna_dCompiler_dTypecheck_dtsMake j tj (v_Vuna_dCompiler_dTypecheck_dtsPut i ty l) r) else v_Vuna_dCompiler_dTypecheck_dtsBalance (v_Vuna_dCompiler_dTypecheck_dtsMake j tj l (v_Vuna_dCompiler_dTypecheck_dtsPut i ty r))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 86 1 ("no matching clause for Vuna.Compiler.Typecheck.tsPut")

let rec v_Vuna_dCompiler_dTypecheck_dtsGet = fun a0 a1 -> match (a0, a1) with
  | (i, C_Vuna_dCompiler_dTypecheck_dTsLeaf) -> C_Base_dMaybe_dNothing
  | (i, C_Vuna_dCompiler_dTypecheck_dTsNode (j, t, h, l, r)) -> if v_vuna_ueq_uint i j then C_Base_dMaybe_dJust (t) else if v_vuna_ult_uint i j then v_Vuna_dCompiler_dTypecheck_dtsGet i l else v_Vuna_dCompiler_dTypecheck_dtsGet i r
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 93 1 ("no matching clause for Vuna.Compiler.Typecheck.tsGet")

let v_Vuna_dCompiler_dTypecheck_deeSpan = fun e -> (match e with
  | C_Vuna_dCompiler_dTypecheck_dXEVar (n, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEInt (n, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEStr (s, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXELam (ps, b, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEApp (f, a, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXELet (bs, b, _, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXECase (s, ty, a, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEIf (c, t, e, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEField (b, f, ty, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate (b, ty, fs, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEFun (name, cons, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (tr, meth, ty, sp) -> sp
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst (tr, meth, inst, ty, sp) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 114 12 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dlookupSubst = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Base_dMaybe_dNothing
  | (i, (C_Base_dPair_dPair (j, t)) :: (rest)) -> if v_vuna_ueq_ugeneric i j then C_Base_dMaybe_dJust (t) else v_Vuna_dCompiler_dTypecheck_dlookupSubst i rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 132 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupSubst")

let rec v_Vuna_dCompiler_dTypecheck_dmemInt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> false
  | (i, (x) :: (rest)) -> if v_vuna_ueq_ugeneric i x then true else v_Vuna_dCompiler_dTypecheck_dmemInt i rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 135 1 ("no matching clause for Vuna.Compiler.Typecheck.memInt")

let v_Vuna_dCompiler_dTypecheck_daddUnique = fun x xs -> if v_Vuna_dCompiler_dTypecheck_dmemInt x xs then xs else (x) :: (xs)

let rec v_Vuna_dCompiler_dTypecheck_dunionInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> ys
  | ((x) :: (rest), ys) -> v_Vuna_dCompiler_dTypecheck_daddUnique x (v_Vuna_dCompiler_dTypecheck_dunionInts rest ys)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 140 1 ("no matching clause for Vuna.Compiler.Typecheck.unionInts")

let rec v_Vuna_dCompiler_dTypecheck_ddiffInts = fun a0 a1 -> match (a0, a1) with
  | ([], ys) -> []
  | ((x) :: (rest), ys) -> if v_Vuna_dCompiler_dTypecheck_dmemInt x ys then v_Vuna_dCompiler_dTypecheck_ddiffInts rest ys else (x) :: (v_Vuna_dCompiler_dTypecheck_ddiffInts rest ys)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 143 1 ("no matching clause for Vuna.Compiler.Typecheck.diffInts")

let rec v_Vuna_dCompiler_dTypecheck_dresolveTy = fun s ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (match v_Vuna_dCompiler_dTypecheck_dtsGet i s with
  | C_Base_dMaybe_dJust (t) -> v_Vuna_dCompiler_dTypecheck_dresolveTy s t
  | C_Base_dMaybe_dNothing -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 148 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> C_Vuna_dCompiler_dTypecheck_dTCon (n, v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dresolveTy s) args)
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dresolveTy s a, v_Vuna_dCompiler_dTypecheck_dresolveTy s b)
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> (match v_Vuna_dCompiler_dTypecheck_dresolveTy s head with
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, hargs) -> v_Vuna_dCompiler_dTypecheck_dresolveTy s (C_Vuna_dCompiler_dTypecheck_dTCon (n, v_Base_dList_dappend hargs (v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dresolveTy s) args)))
  | head2 -> C_Vuna_dCompiler_dTypecheck_dTApp (head2, v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dresolveTy s) args)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 153 21 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 147 18 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_doccursIn = fun i s ty -> (match v_Vuna_dCompiler_dTypecheck_dresolveTy s ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (j) -> v_vuna_ueq_uint i j
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> v_Vuna_dCompiler_dTypecheck_doccursInArgs i s args
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> (if (v_Vuna_dCompiler_dTypecheck_doccursIn i s a) then true else (v_Vuna_dCompiler_dTypecheck_doccursIn i s b))
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> (if (v_Vuna_dCompiler_dTypecheck_doccursIn i s head) then true else (v_Vuna_dCompiler_dTypecheck_doccursInArgs i s args))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 158 19 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_doccursInArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, s, []) -> false
  | (i, s, (ty) :: (rest)) -> (if (v_Vuna_dCompiler_dTypecheck_doccursIn i s ty) then true else (v_Vuna_dCompiler_dTypecheck_doccursInArgs i s rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 164 1 ("no matching clause for Vuna.Compiler.Typecheck.occursInArgs")

let rec v_Vuna_dCompiler_dTypecheck_dshowTy = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (("t") ^ (bi_str_from_int i))
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, []) -> n
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (n) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTyArgs args) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dshowTy a) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy b) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dshowTy head) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTyArgs args) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 168 13 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dshowTyArgs = fun a0 -> match a0 with
  | ([]) -> ""
  | ((ty) :: ([])) -> v_Vuna_dCompiler_dTypecheck_dshowTy ty
  | ((ty) :: (rest)) -> (let vuna_cat0' = (v_Vuna_dCompiler_dTypecheck_dshowTy ty) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypecheck_dshowTyArgs rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 175 1 ("no matching clause for Vuna.Compiler.Typecheck.showTyArgs")

let v_Vuna_dCompiler_dTypecheck_dnextVar = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Base_dPair_dPair (n, C_Vuna_dCompiler_dTypecheck_dTC (bi_add n 1, s, typeNames, records, cons, methods, tctx))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 180 1 ("no matching clause for Vuna.Compiler.Typecheck.nextVar")

let v_Vuna_dCompiler_dTypecheck_dfreshTy = fun st -> (match v_Vuna_dCompiler_dTypecheck_dnextVar st with
  | C_Base_dPair_dPair (n, st2) -> C_Base_dPair_dPair (C_Vuna_dCompiler_dTypecheck_dTVar (n), st2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 184 14 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dbindVar = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, ty, C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dTypecheck_dTC (n, v_Vuna_dCompiler_dTypecheck_dtsPut i ty s, typeNames, records, cons, methods, tctx))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 188 1 ("no matching clause for Vuna.Compiler.Typecheck.bindVar")

let rec v_Vuna_dCompiler_dTypecheck_dinstantiateVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Base_dPair_dPair ([], st)
  | ((q) :: (rest), st) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st2) -> (match v_Vuna_dCompiler_dTypecheck_dinstantiateVars rest st2 with
  | C_Base_dPair_dPair (mapping, st3) -> C_Base_dPair_dPair ((C_Base_dPair_dPair (q, ty)) :: (mapping), st3)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 229 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 228 34 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 227 1 ("no matching clause for Vuna.Compiler.Typecheck.instantiateVars")

let rec v_Vuna_dCompiler_dTypecheck_drenameTy = fun mapping ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (match v_Vuna_dCompiler_dTypecheck_dlookupSubst i mapping with
  | C_Base_dMaybe_dJust (t) -> t
  | C_Base_dMaybe_dNothing -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 233 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> C_Vuna_dCompiler_dTypecheck_dTCon (n, v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_drenameTy mapping) args)
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_drenameTy mapping a, v_Vuna_dCompiler_dTypecheck_drenameTy mapping b)
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> C_Vuna_dCompiler_dTypecheck_dTApp (v_Vuna_dCompiler_dTypecheck_drenameTy mapping head, v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_drenameTy mapping) args)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 232 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dinstantiateFull = fun a0 a1 -> match (a0, a1) with
  | (st, C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> (match v_Vuna_dCompiler_dTypecheck_dinstantiateVars qs st with
  | C_Base_dPair_dPair (mapping, st2) -> (let ty2 = v_Vuna_dCompiler_dTypecheck_drenameTy mapping ty in (let cons2 = v_Base_dList_dmap (fun c -> C_Base_dPair_dPair (v_Base_dPair_dfirstOf c, v_Vuna_dCompiler_dTypecheck_drenameTy mapping (v_Base_dPair_dsecondOf c))) cons in C_Base_dPair_dPair (C_Base_dPair_dPair (ty2, cons2), st2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 241 42 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 241 1 ("no matching clause for Vuna.Compiler.Typecheck.instantiateFull")

let v_Vuna_dCompiler_dTypecheck_dinstantiate = fun st sch -> (match v_Vuna_dCompiler_dTypecheck_dinstantiateFull st sch with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty, cons), st2) -> C_Base_dPair_dPair (ty, st2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 250 22 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dfreeVarsTy = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (i) :: ([])
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> v_Vuna_dCompiler_dTypecheck_dfreeVarsArgs args
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> v_Vuna_dCompiler_dTypecheck_dunionInts (v_Vuna_dCompiler_dTypecheck_dfreeVarsTy a) (v_Vuna_dCompiler_dTypecheck_dfreeVarsTy b)
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> v_Vuna_dCompiler_dTypecheck_dunionInts (v_Vuna_dCompiler_dTypecheck_dfreeVarsTy head) (v_Vuna_dCompiler_dTypecheck_dfreeVarsArgs args)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 253 17 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dfreeVarsArgs = fun a0 -> match a0 with
  | ([]) -> []
  | ((ty) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dunionInts (v_Vuna_dCompiler_dTypecheck_dfreeVarsTy ty) (v_Vuna_dCompiler_dTypecheck_dfreeVarsArgs rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 259 1 ("no matching clause for Vuna.Compiler.Typecheck.freeVarsArgs")

let v_Vuna_dCompiler_dTypecheck_dconsFreeVars = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (tr, ty)) -> v_Vuna_dCompiler_dTypecheck_dfreeVarsTy ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 265 1 ("no matching clause for Vuna.Compiler.Typecheck.consFreeVars")

let v_Vuna_dCompiler_dTypecheck_dfreeVarsScheme = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> v_Vuna_dCompiler_dTypecheck_ddiffInts (v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dfreeVarsTy ty) (v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypecheck_dconsFreeVars cons)) qs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 262 1 ("no matching clause for Vuna.Compiler.Typecheck.freeVarsScheme")

let rec v_Vuna_dCompiler_dTypecheck_dfreeVarsEnv = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Base_dPair_dPair (n, sch)) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dunionInts (v_Vuna_dCompiler_dTypecheck_dfreeVarsScheme sch) (v_Vuna_dCompiler_dTypecheck_dfreeVarsEnv rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 267 1 ("no matching clause for Vuna.Compiler.Typecheck.freeVarsEnv")

let v_Vuna_dCompiler_dTypecheck_disLowerName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 273 20 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dlookupTyVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ugeneric n name then C_Base_dMaybe_dJust (ty) else v_Vuna_dCompiler_dTypecheck_dlookupTyVar name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 277 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupTyVar")

let v_Vuna_dCompiler_dTypecheck_dknownTypeName = fun typeNames name -> (if ((if ((if (v_Base_dList_dmemName name typeNames) then true else (v_vuna_ueq_ustr name "Int"))) then true else (v_vuna_ueq_ustr name "String"))) then true else (v_vuna_ueq_ustr name "Bool"))

let rec v_Vuna_dCompiler_dTypecheck_dconvertTypes = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, vars, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair ([], vars), st))
  | (typeNames, vars, (e) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertType typeNames vars st e) (fun pa -> (match pa with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty, vars1), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertTypes typeNames vars1 rest st1) (fun pb -> (match pb with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (tys, vars2), st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair ((ty) :: (tys), vars2), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 285 87 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 284 96 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 283 1 ("no matching clause for Vuna.Compiler.Typecheck.convertTypes")
and v_Vuna_dCompiler_dTypecheck_dconvertType = fun typeNames vars st expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_Vuna_dCompiler_dTypecheck_dknownTypeName typeNames name then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (C_Vuna_dCompiler_dTypecheck_dTCon (name, []), vars), st)) else if v_Vuna_dCompiler_dTypecheck_disLowerName name then (match v_Vuna_dCompiler_dTypecheck_dlookupTyVar name vars with
  | C_Base_dMaybe_dJust (ty) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, vars), st))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, (C_Base_dPair_dPair (name, ty)) :: (vars)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 294 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 292 33 ("case pattern match failure")) else C_Base_dResult_dErr ((("unknown type: ") ^ (name)))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertType typeNames vars st a) (fun pa -> (match pa with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ta, vars1), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertType typeNames vars1 st1 b) (fun pb -> (match pb with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (tb, vars2), st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (C_Vuna_dCompiler_dTypecheck_dTFun (ta, tb), vars2), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 300 89 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 299 67 ("case pattern match failure")))
  | _ -> C_Base_dResult_dErr ("invalid arrow type")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 298 20 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEVar (name, _) -> if v_Vuna_dCompiler_dTypecheck_dknownTypeName typeNames name then v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertTypes typeNames vars args st) (fun pc -> (match pc with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (tys, vars1), st1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (C_Vuna_dCompiler_dTypecheck_dTCon (name, tys), vars1), st1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 305 111 ("case pattern match failure"))) else if v_Vuna_dCompiler_dTypecheck_disLowerName name then (match v_Vuna_dCompiler_dTypecheck_dlookupTyVar name vars with
  | C_Base_dMaybe_dJust (ty) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertTypes typeNames vars args st) (fun pc -> (match pc with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (tys, vars1), st1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (C_Vuna_dCompiler_dTypecheck_dTApp (ty, tys), vars1), st1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 310 72 ("case pattern match failure")))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertTypes typeNames ((C_Base_dPair_dPair (name, ty)) :: (vars)) args st2) (fun pc -> (match pc with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (tys, vars1), st3) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (C_Vuna_dCompiler_dTypecheck_dTApp (ty, tys), vars1), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 314 97 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 313 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 308 35 ("case pattern match failure")) else C_Base_dResult_dErr ((("unknown type constructor: ") ^ (name)))
  | _ -> C_Base_dResult_dErr ("invalid type application")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 297 21 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": dependent function type requires --dt")))
  | _ -> C_Base_dResult_dErr ("invalid type expression")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 290 38 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dvarIds = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Base_dPair_dPair (n, ty)) :: (rest)) -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (i) :: (v_Vuna_dCompiler_dTypecheck_dvarIds rest)
  | _ -> v_Vuna_dCompiler_dTypecheck_dvarIds rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 323 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 322 1 ("no matching clause for Vuna.Compiler.Typecheck.varIds")

let v_Vuna_dCompiler_dTypecheck_dschemeOfSig = fun typeNames ty st -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertType typeNames [] st ty) (fun p -> (match p with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty2, vars), st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dmkScheme (v_Vuna_dCompiler_dTypecheck_dvarIds vars) ty2, st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 327 79 ("case pattern match failure")))

let rec v_Vuna_dCompiler_dTypecheck_dseedVars = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Base_dPair_dPair ([], st)
  | ((name) :: (rest), st) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st1) -> (match v_Vuna_dCompiler_dTypecheck_dseedVars rest st1 with
  | C_Base_dPair_dPair (vars, st2) -> C_Base_dPair_dPair ((C_Base_dPair_dPair (name, ty)) :: (vars), st2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 333 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 332 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 331 1 ("no matching clause for Vuna.Compiler.Typecheck.seedVars")

let v_Vuna_dCompiler_dTypecheck_dschemeOfCtor = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, st, C_Vuna_dCompiler_dAst_dCtor (name, ty, arity, _)) -> (match v_Vuna_dCompiler_dTypecheck_dseedVars params st with
  | C_Base_dPair_dPair (vars, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertType typeNames vars st1 ty) (fun p -> (match p with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty2, vars2), st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (name, v_Vuna_dCompiler_dTypecheck_dmkScheme (v_Vuna_dCompiler_dTypecheck_dvarIds vars2) ty2), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 337 71 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 336 59 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 336 1 ("no matching clause for Vuna.Compiler.Typecheck.schemeOfCtor")

let rec v_Vuna_dCompiler_dTypecheck_ddeclDataNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, _, _) -> (name) :: (v_Vuna_dCompiler_dTypecheck_ddeclDataNames rest)
  | _ -> v_Vuna_dCompiler_dTypecheck_ddeclDataNames rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 345 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 344 1 ("no matching clause for Vuna.Compiler.Typecheck.declDataNames")

let rec v_Vuna_dCompiler_dTypecheck_dcollectSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, _) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dschemeOfSig typeNames ty st) (fun p -> (match p with
  | C_Base_dPair_dPair (sch, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcollectSigs typeNames rest st1) (fun q -> (match q with
  | C_Base_dPair_dPair (sigs, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (name, sch)) :: (sigs), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 352 69 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 351 66 ("case pattern match failure")))
  | _ -> v_Vuna_dCompiler_dTypecheck_dcollectSigs typeNames rest st
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 350 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 349 1 ("no matching clause for Vuna.Compiler.Typecheck.collectSigs")

let rec v_Vuna_dCompiler_dTypecheck_dcollectCtorList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, params, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (typeNames, params, (c) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dschemeOfCtor typeNames params st c) (fun p -> (match p with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (cname, sch), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcollectCtorList typeNames params rest st1) (fun q -> (match q with
  | C_Base_dPair_dPair (ctors, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (cname, sch)) :: (ctors), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 369 91 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 368 103 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 367 1 ("no matching clause for Vuna.Compiler.Typecheck.collectCtorList")

let rec v_Vuna_dCompiler_dTypecheck_dcollectCtors = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (typeNames, (d) :: (rest), st) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, _, _) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcollectCtorList typeNames params ctors st) (fun p -> (match p with
  | C_Base_dPair_dPair (newCtors, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcollectCtors typeNames rest st1) (fun q -> (match q with
  | C_Base_dPair_dPair (ctors2, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dappend newCtors ctors2, st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 361 75 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 360 98 ("case pattern match failure")))
  | _ -> v_Vuna_dCompiler_dTypecheck_dcollectCtors typeNames rest st
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 359 41 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 358 1 ("no matching clause for Vuna.Compiler.Typecheck.collectCtors")

let v_Vuna_dCompiler_dTypecheck_dintTy = C_Vuna_dCompiler_dTypecheck_dTCon ("Int", [])

let v_Vuna_dCompiler_dTypecheck_dstrTy = C_Vuna_dCompiler_dTypecheck_dTCon ("String", [])

let v_Vuna_dCompiler_dTypecheck_dboolTy = C_Vuna_dCompiler_dTypecheck_dTCon ("Bool", [])

let v_Vuna_dCompiler_dTypecheck_dlistOf = fun ty -> C_Vuna_dCompiler_dTypecheck_dTCon ("List", (ty) :: ([]))

let v_Vuna_dCompiler_dTypecheck_dfun2 = fun a b c -> C_Vuna_dCompiler_dTypecheck_dTFun (a, C_Vuna_dCompiler_dTypecheck_dTFun (b, c))

let v_Vuna_dCompiler_dTypecheck_dbuiltinSchemes = fun () -> (C_Base_dPair_dPair ("True", v_Vuna_dCompiler_dTypecheck_dmkScheme [] v_Vuna_dCompiler_dTypecheck_dboolTy)) :: ((C_Base_dPair_dPair ("False", v_Vuna_dCompiler_dTypecheck_dmkScheme [] v_Vuna_dCompiler_dTypecheck_dboolTy)) :: ((C_Base_dPair_dPair ("Nil", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTCon ("List", (C_Vuna_dCompiler_dTypecheck_dTVar (0)) :: ([]))))) :: ((C_Base_dPair_dPair ("Cons", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dCompiler_dTypecheck_dfun2 (C_Vuna_dCompiler_dTypecheck_dTVar (0)) (C_Vuna_dCompiler_dTypecheck_dTCon ("List", (C_Vuna_dCompiler_dTypecheck_dTVar (0)) :: ([]))) (C_Vuna_dCompiler_dTypecheck_dTCon ("List", (C_Vuna_dCompiler_dTypecheck_dTVar (0)) :: ([])))))) :: ((C_Base_dPair_dPair ("+", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy))) :: ((C_Base_dPair_dPair ("-", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy))) :: ((C_Base_dPair_dPair ("*", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy))) :: ((C_Base_dPair_dPair ("/", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy))) :: ((C_Base_dPair_dPair ("bi_eq_int", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_neq_int", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_lt_int", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_le_int", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_gt_int", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_ge_int", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dintTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_eq_str", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_neq_str", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_eq_bool", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_neq_bool", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_show_string", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dstrTy)))) :: ((C_Base_dPair_dPair ("bi_eq_generic", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dCompiler_dTypecheck_dfun2 (C_Vuna_dCompiler_dTypecheck_dTVar (0)) (C_Vuna_dCompiler_dTypecheck_dTVar (0)) v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_neq_generic", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dCompiler_dTypecheck_dfun2 (C_Vuna_dCompiler_dTypecheck_dTVar (0)) (C_Vuna_dCompiler_dTypecheck_dTVar (0)) v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_lt_generic", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dCompiler_dTypecheck_dfun2 (C_Vuna_dCompiler_dTypecheck_dTVar (0)) (C_Vuna_dCompiler_dTypecheck_dTVar (0)) v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_le_generic", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dCompiler_dTypecheck_dfun2 (C_Vuna_dCompiler_dTypecheck_dTVar (0)) (C_Vuna_dCompiler_dTypecheck_dTVar (0)) v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_gt_generic", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dCompiler_dTypecheck_dfun2 (C_Vuna_dCompiler_dTypecheck_dTVar (0)) (C_Vuna_dCompiler_dTypecheck_dTVar (0)) v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("bi_ge_generic", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (v_Vuna_dCompiler_dTypecheck_dfun2 (C_Vuna_dCompiler_dTypecheck_dTVar (0)) (C_Vuna_dCompiler_dTypecheck_dTVar (0)) v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("&&", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("||", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy v_Vuna_dCompiler_dTypecheck_dboolTy))) :: ((C_Base_dPair_dPair ("++", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dstrTy))) :: ((C_Base_dPair_dPair ("strLength", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("strUnpack", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dlistOf v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("strPack", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dlistOf v_Vuna_dCompiler_dTypecheck_dintTy, v_Vuna_dCompiler_dTypecheck_dstrTy)))) :: ((C_Base_dPair_dPair ("strFromInt", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dintTy, v_Vuna_dCompiler_dTypecheck_dstrTy)))) :: ((C_Base_dPair_dPair ("readFile", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dstrTy)))) :: ((C_Base_dPair_dPair ("writeFile", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dintTy))) :: ((C_Base_dPair_dPair ("print", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("getArgs", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dlistOf v_Vuna_dCompiler_dTypecheck_dstrTy))) :: ((C_Base_dPair_dPair ("readLine", v_Vuna_dCompiler_dTypecheck_dmkScheme [] v_Vuna_dCompiler_dTypecheck_dstrTy)) :: ((C_Base_dPair_dPair ("readDir", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dlistOf v_Vuna_dCompiler_dTypecheck_dstrTy)))) :: ((C_Base_dPair_dPair ("isDirectory", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dboolTy)))) :: ((C_Base_dPair_dPair ("makeDir", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("removeFile", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("fileExists", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dboolTy)))) :: ((C_Base_dPair_dPair ("fileMtime", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("fileSize", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("exit", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dintTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("prim_readFile", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dstrTy)))) :: ((C_Base_dPair_dPair ("prim_writeFile", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dstrTy v_Vuna_dCompiler_dTypecheck_dintTy))) :: ((C_Base_dPair_dPair ("prim_print", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("prim_getArgs", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dlistOf v_Vuna_dCompiler_dTypecheck_dstrTy))) :: ((C_Base_dPair_dPair ("prim_readLine", v_Vuna_dCompiler_dTypecheck_dmkScheme [] v_Vuna_dCompiler_dTypecheck_dstrTy)) :: ((C_Base_dPair_dPair ("prim_readDir", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dlistOf v_Vuna_dCompiler_dTypecheck_dstrTy)))) :: ((C_Base_dPair_dPair ("prim_isDirectory", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dboolTy)))) :: ((C_Base_dPair_dPair ("prim_makeDir", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("prim_removeFile", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("prim_fileExists", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dboolTy)))) :: ((C_Base_dPair_dPair ("prim_fileMtime", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("prim_fileSize", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dstrTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("prim_exit", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (C_Vuna_dCompiler_dTypecheck_dTFun (v_Vuna_dCompiler_dTypecheck_dintTy, v_Vuna_dCompiler_dTypecheck_dintTy)))) :: ((C_Base_dPair_dPair ("prim_runIn", v_Vuna_dCompiler_dTypecheck_dmkScheme [] (v_Vuna_dCompiler_dTypecheck_dfun2 v_Vuna_dCompiler_dTypecheck_dstrTy (v_Vuna_dCompiler_dTypecheck_dlistOf v_Vuna_dCompiler_dTypecheck_dstrTy) v_Vuna_dCompiler_dTypecheck_dintTy))) :: ([])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dTypecheck_delabAppExpr = fun fn fnElab args argTys argEls sp -> C_Vuna_dCompiler_dTypecheck_dXEApp (fnElab, argEls, sp)

let v_Vuna_dCompiler_dTypecheck_dnoInstanceMsg = fun tctx tr ty -> (let vuna_cat0' = ("no instance ") in (let vuna_cat1' = (tr) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy ty) in (let vuna_cat4' = (" (M10.5 \233\157\153\230\128\129\230\180\190\229\143\145\239\188\154\232\176\131\231\148\168\231\130\185\231\177\187\229\158\139\229\191\133\233\161\187\231\161\174\229\174\154)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))

let v_Vuna_dCompiler_dTypecheck_dordGenericName = fun key -> (match key with
  | "lt" -> "vuna_lt_generic"
  | "le" -> "vuna_le_generic"
  | "gt" -> "vuna_gt_generic"
  | _ -> "vuna_ge_generic"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 532 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dordFallback = fun tctx ty key -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon ("Int", []) -> (match key with
  | "lt" -> C_Base_dResult_dOk ("vuna_lt_int")
  | "le" -> C_Base_dResult_dOk ("vuna_le_int")
  | "gt" -> C_Base_dResult_dOk ("vuna_gt_int")
  | _ -> C_Base_dResult_dOk ("vuna_ge_int")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 523 20 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTCon ("String", []) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dordGenericName key)
  | C_Vuna_dCompiler_dTypecheck_dTCon ("Bool", []) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dordGenericName key)
  | _ -> C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dnoInstanceMsg tctx "Ord" ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 522 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dgenericMethodName = fun tr key -> (match tr with
  | "Eq" -> if v_vuna_ueq_ustr key "neq" then C_Base_dMaybe_dJust ("vuna_neq_generic") else C_Base_dMaybe_dJust ("vuna_eq_generic")
  | "Ord" -> (match key with
  | "lt" -> C_Base_dMaybe_dJust ("vuna_lt_generic")
  | "le" -> C_Base_dMaybe_dJust ("vuna_le_generic")
  | "gt" -> C_Base_dMaybe_dJust ("vuna_gt_generic")
  | _ -> C_Base_dMaybe_dJust ("vuna_ge_generic")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 540 12 ("case pattern match failure"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 538 28 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_ddictParamTrait = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dDictParam (tr, vid, key, name)) -> tr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 600 1 ("no matching clause for Vuna.Compiler.Typecheck.dictParamTrait")

let v_Vuna_dCompiler_dTypecheck_ddictParamVar = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dDictParam (tr, vid, key, name)) -> vid
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 602 1 ("no matching clause for Vuna.Compiler.Typecheck.dictParamVar")

let v_Vuna_dCompiler_dTypecheck_ddictParamKey = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dDictParam (tr, vid, key, name)) -> key
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 604 1 ("no matching clause for Vuna.Compiler.Typecheck.dictParamKey")

let v_Vuna_dCompiler_dTypecheck_ddictParamName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dDictParam (tr, vid, key, name)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 606 1 ("no matching clause for Vuna.Compiler.Typecheck.dictParamName")

let v_Vuna_dCompiler_dTypecheck_disDictTrait = fun tr -> (if (v_vuna_uneq_ustr tr "Eq") then (v_vuna_uneq_ustr tr "Ord") else false)

let v_Vuna_dCompiler_dTypecheck_dheadVarOf = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTVar (v) -> C_Base_dMaybe_dJust (v)
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> (match head with
  | C_Vuna_dCompiler_dTypecheck_dTVar (v) -> C_Base_dMaybe_dJust (v)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 617 21 ("case pattern match failure"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 615 16 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dneedsHave = fun need needs -> v_Base_dList_dmemName need needs

let rec v_Vuna_dCompiler_dTypecheck_dhasNeed = fun a0 a1 -> match (a0, a1) with
  | (key, []) -> false
  | (key, (C_Base_dPair_dPair (tr, ty)) :: (rest)) -> if v_vuna_ueq_ustr ((let vuna_cat0' = (tr) in (let vuna_cat1' = ("|") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypecheck_dshowTy ty) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) key then true else v_Vuna_dCompiler_dTypecheck_dhasNeed key rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 631 1 ("no matching clause for Vuna.Compiler.Typecheck.hasNeed")

let v_Vuna_dCompiler_dTypecheck_daddNeed = fun tr ty needs -> (let key = (let vuna_cat0' = (tr) in (let vuna_cat1' = ("|") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypecheck_dshowTy ty) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in if v_Vuna_dCompiler_dTypecheck_dhasNeed key needs then needs else v_Base_dList_dappend needs ((C_Base_dPair_dPair (tr, ty)) :: ([])))

let rec v_Vuna_dCompiler_dTypecheck_dfoldNeeds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (C_Base_dPair_dPair (tr, ty)) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_disDictTrait tr then (match v_Vuna_dCompiler_dTypecheck_dheadVarOf (v_Vuna_dCompiler_dTypecheck_dresolveTy subst ty) with
  | C_Base_dMaybe_dJust (v) -> v_Vuna_dCompiler_dTypecheck_dfoldNeeds subst tctx (v_Vuna_dCompiler_dTypecheck_daddNeed tr (C_Vuna_dCompiler_dTypecheck_dTVar (v)) needs) rest
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dfoldNeeds subst tctx needs rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 672 76 ("case pattern match failure")) else v_Vuna_dCompiler_dTypecheck_dfoldNeeds subst tctx needs rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 671 1 ("no matching clause for Vuna.Compiler.Typecheck.foldNeeds")

let rec v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr = fun subst tctx needs expr -> (match expr with
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (tr, key, paramTy, sp) -> if v_Vuna_dCompiler_dTypecheck_disDictTrait tr then (match v_Vuna_dCompiler_dTypecheck_dheadVarOf (v_Vuna_dCompiler_dTypecheck_dresolveTy subst paramTy) with
  | C_Base_dMaybe_dJust (v) -> v_Vuna_dCompiler_dTypecheck_daddNeed tr (C_Vuna_dCompiler_dTypecheck_dTVar (v)) needs
  | C_Base_dMaybe_dNothing -> needs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 637 56 ("case pattern match failure")) else needs
  | C_Vuna_dCompiler_dTypecheck_dXEFun (name, cons, sp) -> v_Vuna_dCompiler_dTypecheck_dfoldNeeds subst tctx needs cons
  | C_Vuna_dCompiler_dTypecheck_dXEVar (n, sp) -> needs
  | C_Vuna_dCompiler_dTypecheck_dXEInt (n, sp) -> needs
  | C_Vuna_dCompiler_dTypecheck_dXEStr (s, sp) -> needs
  | C_Vuna_dCompiler_dTypecheck_dXELam (ps, b, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs b
  | C_Vuna_dCompiler_dTypecheck_dXEApp (f, args, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExprList subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs f) args
  | C_Vuna_dCompiler_dTypecheck_dXELet (binds, body, rec_u, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromBinds subst tctx needs binds) body
  | C_Vuna_dCompiler_dTypecheck_dXECase (scrut, ty, alts, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExprList subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs scrut) (v_Base_dList_dmap v_Base_dPair_dsecondOf alts)
  | C_Vuna_dCompiler_dTypecheck_dXEIf (c, t, e, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs c) t) e
  | C_Vuna_dCompiler_dTypecheck_dXEField (base, fname, baseTy, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs base
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate (base, baseTy, fields, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs base
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst (tr, key, instName, paramTy, sp) -> needs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 636 46 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExprList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (e) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExprList subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs e) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 661 1 ("no matching clause for Vuna.Compiler.Typecheck.collectNeedsFromExprList")
and v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (C_Base_dPair_dPair (pat, value)) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromBinds subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs value) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 666 1 ("no matching clause for Vuna.Compiler.Typecheck.collectNeedsFromBinds")

let rec v_Vuna_dCompiler_dTypecheck_dfoldClauseNeeds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, needs, []) -> needs
  | (subst, tctx, needs, (C_Base_dPair_dPair (pats, body)) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dfoldClauseNeeds subst tctx (v_Vuna_dCompiler_dTypecheck_dcollectNeedsFromExpr subst tctx needs body) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 681 1 ("no matching clause for Vuna.Compiler.Typecheck.foldClauseNeeds")

let v_Vuna_dCompiler_dTypecheck_dcollectNeedsClauses = fun subst tctx clauses -> v_Vuna_dCompiler_dTypecheck_dfoldClauseNeeds subst tctx [] clauses

let v_Vuna_dCompiler_dTypecheck_ddictParamNames = fun params -> v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_ddictParamName params

let rec v_Vuna_dCompiler_dTypecheck_dfindDictParam = fun params tr v key -> (match params with
  | [] -> C_Base_dMaybe_dNothing
  | (p) :: (rest) -> if (if ((if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypecheck_ddictParamTrait p) tr) then (v_vuna_ueq_uint (v_Vuna_dCompiler_dTypecheck_ddictParamVar p) v) else false)) then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypecheck_ddictParamKey p) key) else false) then C_Base_dMaybe_dJust (v_Vuna_dCompiler_dTypecheck_ddictParamName p) else v_Vuna_dCompiler_dTypecheck_dfindDictParam rest tr v key
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 702 33 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_drecFieldVarsAt = fun i n -> if v_vuna_uge_uint i n then [] else ((("vuna_rf") ^ (bi_str_from_int i))) :: (v_Vuna_dCompiler_dTypecheck_drecFieldVarsAt (bi_add i 1) n)

let v_Vuna_dCompiler_dTypecheck_drecFieldVars = fun n -> v_Vuna_dCompiler_dTypecheck_drecFieldVarsAt 0 n

let rec v_Vuna_dCompiler_dTypecheck_dnthNameAt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> ""
  | (i, (x) :: (rest)) -> if v_vuna_ueq_uint i 0 then x else v_Vuna_dCompiler_dTypecheck_dnthNameAt (bi_sub i 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 817 1 ("no matching clause for Vuna.Compiler.Typecheck.nthNameAt")

let v_Vuna_dCompiler_dTypecheck_dnthName = fun i vars -> v_Vuna_dCompiler_dTypecheck_dnthNameAt i vars

let rec v_Vuna_dCompiler_dTypecheck_drecFieldCount = fun a0 -> match a0 with
  | ([]) -> 0
  | ((C_Base_dPair_dPair (n, t)) :: (rest)) -> bi_add 1 (v_Vuna_dCompiler_dTypecheck_drecFieldCount rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 822 1 ("no matching clause for Vuna.Compiler.Typecheck.recFieldCount")

let v_Vuna_dCompiler_dTypecheck_drecordsOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> records
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 927 1 ("no matching clause for Vuna.Compiler.Typecheck.recordsOf")

let v_Vuna_dCompiler_dTypecheck_dtraitMethodsOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> methods
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 929 1 ("no matching clause for Vuna.Compiler.Typecheck.traitMethodsOf")

let v_Vuna_dCompiler_dTypecheck_dtraitCtxOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> tctx
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 931 1 ("no matching clause for Vuna.Compiler.Typecheck.traitCtxOf")

let v_Vuna_dCompiler_dTypecheck_dtypeNamesOfTC = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> typeNames
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 933 1 ("no matching clause for Vuna.Compiler.Typecheck.typeNamesOfTC")

let v_Vuna_dCompiler_dTypecheck_dconstraintsOfTC = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> cons
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 935 1 ("no matching clause for Vuna.Compiler.Typecheck.constraintsOfTC")

let v_Vuna_dCompiler_dTypecheck_daddRecConstraint = fun a0 a1 -> match (a0, a1) with
  | (c, C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, (c) :: (cons), methods, tctx)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 937 1 ("no matching clause for Vuna.Compiler.Typecheck.addRecConstraint")

let v_Vuna_dCompiler_dTypecheck_dclearRecConstraints = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, [], methods, tctx)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 940 1 ("no matching clause for Vuna.Compiler.Typecheck.clearRecConstraints")

let rec v_Vuna_dCompiler_dTypecheck_dlookupRecord = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Vuna_dCompiler_dTypecheck_dRecordInfo (rname, params, fields, derivings)) :: (rest)) -> if v_vuna_ueq_ustr rname name then C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dRecordInfo (rname, params, fields, derivings)) else v_Vuna_dCompiler_dTypecheck_dlookupRecord name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 943 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupRecord")

let rec v_Vuna_dCompiler_dTypecheck_dzipParamTys = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> []
  | ((p) :: (ps), (t) :: (ts)) -> (C_Base_dPair_dPair (p, t)) :: (v_Vuna_dCompiler_dTypecheck_dzipParamTys ps ts)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 947 1 ("no matching clause for Vuna.Compiler.Typecheck.zipParamTys")

let rec v_Vuna_dCompiler_dTypecheck_dfreshParamTys = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Base_dPair_dPair ([], st)
  | ((p) :: (ps), st) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st1) -> (match v_Vuna_dCompiler_dTypecheck_dfreshParamTys ps st1 with
  | C_Base_dPair_dPair (tys, st2) -> C_Base_dPair_dPair ((ty) :: (tys), st2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 952 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 951 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 950 1 ("no matching clause for Vuna.Compiler.Typecheck.freshParamTys")

let rec v_Vuna_dCompiler_dTypecheck_dfieldNamesOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Base_dPair_dPair (n, t)) :: (rest)) -> (n) :: (v_Vuna_dCompiler_dTypecheck_dfieldNamesOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 955 1 ("no matching clause for Vuna.Compiler.Typecheck.fieldNamesOf")

let rec v_Vuna_dCompiler_dTypecheck_dfieldIndexAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (fname, [], i) -> C_Base_dMaybe_dNothing
  | (fname, (C_Base_dPair_dPair (n, t)) :: (rest), i) -> if v_vuna_ueq_ugeneric n fname then C_Base_dMaybe_dJust (i) else v_Vuna_dCompiler_dTypecheck_dfieldIndexAt fname rest (bi_add i 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 958 1 ("no matching clause for Vuna.Compiler.Typecheck.fieldIndexAt")

let v_Vuna_dCompiler_dTypecheck_dfieldIndex = fun fname fields -> v_Vuna_dCompiler_dTypecheck_dfieldIndexAt fname fields 0

let rec v_Vuna_dCompiler_dTypecheck_dlookupProvided = fun a0 a1 -> match (a0, a1) with
  | (fname, []) -> C_Base_dMaybe_dNothing
  | (fname, (C_Base_dPair_dPair (n, e)) :: (rest)) -> if v_vuna_ueq_ustr n fname then C_Base_dMaybe_dJust (e) else v_Vuna_dCompiler_dTypecheck_dlookupProvided fname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 965 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupProvided")

let rec v_Vuna_dCompiler_dTypecheck_dhasDuplicateFieldNames = fun a0 -> match a0 with
  | ([]) -> false
  | ((C_Base_dPair_dPair (n, e)) :: (rest)) -> (match v_Vuna_dCompiler_dTypecheck_dlookupProvided n rest with
  | C_Base_dMaybe_dJust (_) -> true
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dhasDuplicateFieldNames rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 970 47 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 969 1 ("no matching clause for Vuna.Compiler.Typecheck.hasDuplicateFieldNames")

let v_Vuna_dCompiler_dTypecheck_dmissingFieldMsg = fun sp fname -> (let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": missing field ") in (let vuna_cat2' = (fname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dTypecheck_dunknownFieldMsg = fun sp fname -> (let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown field ") in (let vuna_cat2' = (fname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dTypecheck_dduplicateFieldMsg = fun sp -> ((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": duplicate field"))

let rec v_Vuna_dCompiler_dTypecheck_dhasUnknownFields = fun a0 a1 -> match (a0, a1) with
  | (fieldNames, []) -> false
  | (fieldNames, (C_Base_dPair_dPair (n, v)) :: (rest)) -> if v_Base_dList_dmemName n fieldNames then v_Vuna_dCompiler_dTypecheck_dhasUnknownFields fieldNames rest else true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 980 1 ("no matching clause for Vuna.Compiler.Typecheck.hasUnknownFields")

let rec v_Vuna_dCompiler_dTypecheck_dfirstUnknownFieldMsg = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (sp, fieldNames, []) -> v_Vuna_dCompiler_dTypecheck_dunknownFieldMsg sp ""
  | (sp, fieldNames, (C_Base_dPair_dPair (n, v)) :: (rest)) -> if v_Base_dList_dmemName n fieldNames then v_Vuna_dCompiler_dTypecheck_dfirstUnknownFieldMsg sp fieldNames rest else v_Vuna_dCompiler_dTypecheck_dunknownFieldMsg sp n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 984 1 ("no matching clause for Vuna.Compiler.Typecheck.firstUnknownFieldMsg")

let rec v_Vuna_dCompiler_dTypecheck_dcheckProvidedFields = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (fieldNames, [], sp) -> C_Base_dResult_dOk ([])
  | (fieldNames, (C_Base_dPair_dPair (n, v)) :: (rest), sp) -> if v_Base_dList_dmemName n fieldNames then v_Vuna_dCompiler_dTypecheck_dcheckProvidedFields fieldNames rest sp else C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dunknownFieldMsg sp n)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 988 1 ("no matching clause for Vuna.Compiler.Typecheck.checkProvidedFields")

let v_Vuna_dCompiler_dTypecheck_drecordFieldPair = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dField (fname, ty, sp)) -> C_Base_dPair_dPair (fname, ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1003 1 ("no matching clause for Vuna.Compiler.Typecheck.recordFieldPair")

let rec v_Vuna_dCompiler_dTypecheck_drecordParamNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> (p) :: (v_Vuna_dCompiler_dTypecheck_drecordParamNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1005 1 ("no matching clause for Vuna.Compiler.Typecheck.recordParamNames")

let v_Vuna_dCompiler_dTypecheck_drecordParamVarExprs = fun params sp -> v_Base_dList_dmap (fun p -> C_Vuna_dCompiler_dAst_dEVar (p, sp)) params

let v_Vuna_dCompiler_dTypecheck_drecordCtorFieldExprs = fun fields -> v_Base_dList_dmap v_Vuna_dCompiler_dAst_dfieldType fields

let v_Vuna_dCompiler_dTypecheck_drecordRetType = fun dname params sp -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (dname, sp), v_Vuna_dCompiler_dTypecheck_drecordParamVarExprs (v_Vuna_dCompiler_dTypecheck_drecordParamNames params) sp, sp)

let rec v_Vuna_dCompiler_dTypecheck_drecordArrowType = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], ret, sp) -> ret
  | ((f) :: (fs), ret, sp) -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", sp), (v_Vuna_dCompiler_dAst_dfieldType f) :: ((v_Vuna_dCompiler_dTypecheck_drecordArrowType fs ret sp) :: ([])), sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1015 1 ("no matching clause for Vuna.Compiler.Typecheck.recordArrowType")

let v_Vuna_dCompiler_dTypecheck_drecordDeclToData = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp)) -> C_Vuna_dCompiler_dAst_dDData (dname, params, C_Vuna_dCompiler_dAst_dEVar ("Type", sp), (C_Vuna_dCompiler_dAst_dCtor (dname, v_Vuna_dCompiler_dTypecheck_drecordArrowType fields (v_Vuna_dCompiler_dTypecheck_drecordRetType dname params sp) sp, v_Base_dList_dlength fields, sp)) :: ([]), derivings, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1018 1 ("no matching clause for Vuna.Compiler.Typecheck.recordDeclToData")

let rec v_Vuna_dCompiler_dTypecheck_dextractRecords = fun a0 -> match a0 with
  | ([]) -> C_Base_dPair_dPair ([], [])
  | ((d) :: (rest)) -> (match v_Vuna_dCompiler_dTypecheck_dextractRecords rest with
  | C_Base_dPair_dPair (recs, ds) -> (match d with
  | C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp) -> (let info = C_Vuna_dCompiler_dTypecheck_dRecordInfo (dname, params, v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_drecordFieldPair fields, derivings) in C_Base_dPair_dPair ((info) :: (recs), (v_Vuna_dCompiler_dTypecheck_drecordDeclToData d) :: (ds)))
  | _ -> C_Base_dPair_dPair (recs, (d) :: (ds))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 996 19 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 995 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 994 1 ("no matching clause for Vuna.Compiler.Typecheck.extractRecords")

let rec v_Vuna_dCompiler_dTypecheck_ddesugarPattern = fun records pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPWild (sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPWild (sp))
  | C_Vuna_dCompiler_dAst_dPVar (n, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPVar (n, sp))
  | C_Vuna_dCompiler_dAst_dPInt (n, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPInt (n, sp))
  | C_Vuna_dCompiler_dAst_dPStr (s, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPStr (s, sp))
  | C_Vuna_dCompiler_dAst_dPCon (name, pats, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarPattern records) pats) (fun ps -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPCon (name, ps, sp)))
  | C_Vuna_dCompiler_dAst_dPRecord (name, fields, sp) -> (match v_Vuna_dCompiler_dTypecheck_dlookupRecord name records with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown record: ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dRecordInfo (rname, params, fdefs, derivings)) -> if v_Vuna_dCompiler_dTypecheck_dhasDuplicateFieldNames fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dduplicateFieldMsg sp) else if v_Vuna_dCompiler_dTypecheck_dhasUnknownFields (v_Vuna_dCompiler_dTypecheck_dfieldNamesOf fdefs) fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dfirstUnknownFieldMsg sp (v_Vuna_dCompiler_dTypecheck_dfieldNamesOf fdefs) fields) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarRecordPatternFields records fdefs fields sp) (fun ps -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPCon (rname, ps, sp)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1047 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1040 30 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_ddesugarRecordPatternFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (records, [], provided, sp) -> C_Base_dResult_dOk ([])
  | (records, (C_Base_dPair_dPair (fname, fty)) :: (rest), provided, sp) -> (match v_Vuna_dCompiler_dTypecheck_dlookupProvided fname provided with
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarRecordPatternFields records rest provided sp) (fun ps -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPWild (sp)) :: (ps)))
  | C_Base_dMaybe_dJust (p) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarPattern records p) (fun p2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarRecordPatternFields records rest provided sp) (fun ps -> C_Base_dResult_dOk ((p2) :: (ps))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1055 77 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1054 1 ("no matching clause for Vuna.Compiler.Typecheck.desugarRecordPatternFields")

let rec v_Vuna_dCompiler_dTypecheck_ddesugarExpr = fun records e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> C_Base_dResult_dOk (e)
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Base_dResult_dOk (e)
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Base_dResult_dOk (e)
  | C_Vuna_dCompiler_dAst_dELam (ps, b, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records b) (fun b2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dELam (ps, b2, sp)))
  | C_Vuna_dCompiler_dAst_dEApp (f, args, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records f) (fun f2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records) args) (fun a2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (f2, a2, sp))))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarBind records) binds) (fun b2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records body) (fun body2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dELet (b2, body2, rec_u, sp))))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records scrut) (fun s2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarAlt records) alts) (fun a2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dECase (s2, a2, sp))))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, el, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records c) (fun c2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records t) (fun t2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records el) (fun e2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEIf (c2, t2, e2, sp)))))
  | C_Vuna_dCompiler_dAst_dEField (base, fname, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records base) (fun b -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEField (b, fname, sp)))
  | C_Vuna_dCompiler_dAst_dERecord (name, fields, sp) -> (match v_Vuna_dCompiler_dTypecheck_dlookupRecord name records with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown record: ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dRecordInfo (rname, params, fdefs, derivings)) -> if v_Vuna_dCompiler_dTypecheck_dhasDuplicateFieldNames fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dduplicateFieldMsg sp) else if v_Vuna_dCompiler_dTypecheck_dhasUnknownFields (v_Vuna_dCompiler_dTypecheck_dfieldNamesOf fdefs) fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dfirstUnknownFieldMsg sp (v_Vuna_dCompiler_dTypecheck_dfieldNamesOf fdefs) fields) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarRecordValues records fdefs fields sp) (fun vs -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (rname, sp), vs, sp)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1081 29 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records base) (fun b -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarFieldValue records) fields) (fun fs -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dERecUpdate (b, fs, sp))))
  | C_Vuna_dCompiler_dAst_dEInstSel (m, n, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records m) (fun m2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEInstSel (m2, n, sp)))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": dependent function type requires --dt")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1063 25 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_ddesugarRecordValues = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (records, [], provided, sp) -> C_Base_dResult_dOk ([])
  | (records, (C_Base_dPair_dPair (fname, fty)) :: (rest), provided, sp) -> (match v_Vuna_dCompiler_dTypecheck_dlookupProvided fname provided with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dmissingFieldMsg sp fname)
  | C_Base_dMaybe_dJust (v) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records v) (fun v2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarRecordValues records rest provided sp) (fun vs -> C_Base_dResult_dOk ((v2) :: (vs))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1095 70 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1094 1 ("no matching clause for Vuna.Compiler.Typecheck.desugarRecordValues")
and v_Vuna_dCompiler_dTypecheck_ddesugarFieldValue = fun a0 a1 -> match (a0, a1) with
  | (records, C_Base_dPair_dPair (fname, v)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records v) (fun v2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (fname, v2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1102 1 ("no matching clause for Vuna.Compiler.Typecheck.desugarFieldValue")
and v_Vuna_dCompiler_dTypecheck_ddesugarBind = fun a0 a1 -> match (a0, a1) with
  | (records, C_Base_dPair_dPair (pat, value)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarPattern records pat) (fun p2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records value) (fun v2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (p2, v2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1106 1 ("no matching clause for Vuna.Compiler.Typecheck.desugarBind")
and v_Vuna_dCompiler_dTypecheck_ddesugarAlt = fun a0 a1 -> match (a0, a1) with
  | (records, C_Base_dPair_dPair (pat, body)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarPattern records pat) (fun p2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records body) (fun b2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (p2, b2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1111 1 ("no matching clause for Vuna.Compiler.Typecheck.desugarAlt")

let rec v_Vuna_dCompiler_dTypecheck_ddesugarRecordDecl = fun records d -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarPattern records) pats) (fun pats2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_ddesugarExpr records body) (fun body2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDFun (name, pats2, body2, sp))))
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> C_Base_dResult_dOk (d)
  | C_Vuna_dCompiler_dAst_dDRecord (name, params, fields, derivings, sp) -> C_Base_dResult_dOk (d)
  | C_Vuna_dCompiler_dAst_dDTrait (name, params, methods, sp) -> C_Base_dResult_dOk (d)
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, methods, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarRecordDecl records) methods) (fun ms -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, ms, sp)))
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> C_Base_dResult_dOk (d)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1028 31 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_ddesugarRecords = fun records decls -> v_Base_dResult_dtraverse (v_Vuna_dCompiler_dTypecheck_ddesugarRecordDecl records) decls

let rec v_Vuna_dCompiler_dTypecheck_dlookupLocal = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ugeneric n name then C_Base_dMaybe_dJust (ty) else v_Vuna_dCompiler_dTypecheck_dlookupLocal name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1118 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupLocal")

let rec v_Vuna_dCompiler_dTypecheck_dlookupScheme = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, sch)) :: (rest)) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (sch) else v_Vuna_dCompiler_dTypecheck_dlookupScheme name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1121 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupScheme")

let rec v_Vuna_dCompiler_dTypecheck_dfunArgs = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> (a) :: (v_Vuna_dCompiler_dTypecheck_dfunArgs b)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1124 14 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dfunResult = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> v_Vuna_dCompiler_dTypecheck_dfunResult b
  | _ -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1128 16 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dfoldFun = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((a) :: (rest), body) -> C_Vuna_dCompiler_dTypecheck_dTFun (a, v_Vuna_dCompiler_dTypecheck_dfoldFun rest body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1132 1 ("no matching clause for Vuna.Compiler.Typecheck.foldFun")

let rec v_Vuna_dCompiler_dTypecheck_dseedPatTypes = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Base_dPair_dPair ([], st)
  | ((p) :: (rest), st) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st1) -> (match v_Vuna_dCompiler_dTypecheck_dseedPatTypes rest st1 with
  | C_Base_dPair_dPair (tys, st2) -> C_Base_dPair_dPair ((ty) :: (tys), st2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1137 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1136 31 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1135 1 ("no matching clause for Vuna.Compiler.Typecheck.seedPatTypes")

let rec v_Vuna_dCompiler_dTypecheck_dseedLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], locals, st) -> C_Base_dPair_dPair ([], C_Base_dPair_dPair (locals, st))
  | ((name) :: (rest), locals, st) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st1) -> (match v_Vuna_dCompiler_dTypecheck_dseedLocals rest ((C_Base_dPair_dPair (name, ty)) :: (locals)) st1 with
  | C_Base_dPair_dPair (tys, C_Base_dPair_dPair (locals2, st2)) -> C_Base_dPair_dPair ((ty) :: (tys), C_Base_dPair_dPair (locals2, st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1173 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1172 39 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1171 1 ("no matching clause for Vuna.Compiler.Typecheck.seedLocals")

let rec v_Vuna_dCompiler_dTypecheck_dseedRecNames = fun a0 a1 -> match (a0, a1) with
  | ([], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | ((C_Base_dPair_dPair (pat, value)) :: (rest), st) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPVar (name, _) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st1) -> (match v_Vuna_dCompiler_dTypecheck_dseedRecNames rest st1 with
  | C_Base_dResult_dOk (C_Base_dPair_dPair (tail, st2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (C_Base_dPair_dPair (name, ty), C_Base_dPair_dPair (pat, value))) :: (tail), st2))
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1202 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1201 18 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ("recursive let bindings must be simple names")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1200 46 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1199 1 ("no matching clause for Vuna.Compiler.Typecheck.seedRecNames")

let rec v_Vuna_dCompiler_dTypecheck_drecExtendLocals = fun a0 a1 -> match (a0, a1) with
  | (locals, []) -> locals
  | (locals, (C_Base_dPair_dPair (C_Base_dPair_dPair (name, ty), _)) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_drecExtendLocals ((C_Base_dPair_dPair (name, ty)) :: (locals)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1207 1 ("no matching clause for Vuna.Compiler.Typecheck.recExtendLocals")

let v_Vuna_dCompiler_dTypecheck_dinstantiateForParam = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (st, C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty), pid) -> (match v_Vuna_dCompiler_dTypecheck_dinstantiateVars qs st with
  | C_Base_dPair_dPair (mapping, st2) -> (let ty2 = v_Vuna_dCompiler_dTypecheck_drenameTy mapping ty in (let paramTy = (match v_Vuna_dCompiler_dTypecheck_dlookupSubst pid mapping with
  | C_Base_dMaybe_dJust (t) -> t
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dTypecheck_dTVar (pid)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1237 17 ("case pattern match failure")) in C_Base_dPair_dPair (C_Base_dPair_dPair (ty2, paramTy), st2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1232 50 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1232 1 ("no matching clause for Vuna.Compiler.Typecheck.instantiateForParam")

let v_Vuna_dCompiler_dTypecheck_dtcNoSpan = C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)

let v_Vuna_dCompiler_dTypecheck_dboolTrueExpr = C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("bi_eq_int", v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (C_Vuna_dCompiler_dAst_dEInt (0, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dCompiler_dAst_dEInt (0, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan)

let v_Vuna_dCompiler_dTypecheck_dboolFalseExpr = C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("bi_eq_int", v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (C_Vuna_dCompiler_dAst_dEInt (0, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dCompiler_dAst_dEInt (1, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan)

let rec v_Vuna_dCompiler_dTypecheck_dprependClauseParam = fun a0 a1 -> match (a0, a1) with
  | (pname, []) -> []
  | (pname, (C_Base_dPair_dPair (pats, body)) :: (rest)) -> (C_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPVar (pname, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: (pats), body)) :: (v_Vuna_dCompiler_dTypecheck_dprependClauseParam pname rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 916 1 ("no matching clause for Vuna.Compiler.Typecheck.prependClauseParam")

let rec v_Vuna_dCompiler_dTypecheck_dprependClauseParams = fun a0 a1 -> match (a0, a1) with
  | ([], clauses) -> clauses
  | ((pname) :: (prest), clauses) -> v_Vuna_dCompiler_dTypecheck_dprependClauseParams prest (v_Vuna_dCompiler_dTypecheck_dprependClauseParam pname clauses)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 920 1 ("no matching clause for Vuna.Compiler.Typecheck.prependClauseParams")

let rec v_Vuna_dCompiler_dTypecheck_dnthFieldTy = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dCompiler_dAst_dEInt (0, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)
  | (i, (C_Base_dPair_dPair (n, t)) :: (rest)) -> if v_vuna_ueq_uint i 0 then t else v_Vuna_dCompiler_dTypecheck_dnthFieldTy (bi_sub i 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1321 1 ("no matching clause for Vuna.Compiler.Typecheck.nthFieldTy")

let v_Vuna_dCompiler_dTypecheck_drecConstraintFailMsg = fun a0 -> match a0 with
  | ([]) -> "cannot resolve record type; add a type signature"
  | ((c) :: (rest)) -> (match c with
  | C_Vuna_dCompiler_dTypecheck_dFieldCon (baseTy, fname, resTy, sp) -> (let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": cannot resolve record type for field access .") in (let vuna_cat2' = (fname) in (let vuna_cat3' = ("; add a type signature") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Vuna_dCompiler_dTypecheck_dUpdateCon (baseTy, fname, valTy, sp) -> (let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": cannot resolve record type for record update {") in (let vuna_cat2' = (fname) in (let vuna_cat3' = (" = ...}; add a type signature") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1334 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1333 1 ("no matching clause for Vuna.Compiler.Typecheck.recConstraintFailMsg")

let v_Vuna_dCompiler_dTypecheck_ddeclFunName = fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, _) -> name
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1389 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_vuna_ueq_ustr name "" then v_Vuna_dCompiler_dTypecheck_duniqueNames rest else if v_Base_dList_dmemName name rest then v_Vuna_dCompiler_dTypecheck_duniqueNames rest else (name) :: (v_Vuna_dCompiler_dTypecheck_duniqueNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1393 1 ("no matching clause for Vuna.Compiler.Typecheck.uniqueNames")

let v_Vuna_dCompiler_dTypecheck_dfunctionNames = fun decls -> v_Vuna_dCompiler_dTypecheck_duniqueNames (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_ddeclFunName decls)

let v_Vuna_dCompiler_dTypecheck_dhasSig = fun name sigs -> v_Base_dList_dmemName name (v_Base_dList_dmap v_Base_dPair_dfirstOf sigs)

let rec v_Vuna_dCompiler_dTypecheck_dseedPlaceholders = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], sigs, st) -> C_Base_dPair_dPair ([], st)
  | ((name) :: (rest), sigs, st) -> if v_Vuna_dCompiler_dTypecheck_dhasSig name sigs then v_Vuna_dCompiler_dTypecheck_dseedPlaceholders rest sigs st else (match v_Vuna_dCompiler_dTypecheck_dfreshTy st with
  | C_Base_dPair_dPair (ty, st1) -> (match v_Vuna_dCompiler_dTypecheck_dseedPlaceholders rest sigs st1 with
  | C_Base_dPair_dPair (ps, st2) -> C_Base_dPair_dPair ((C_Base_dPair_dPair (name, v_Vuna_dCompiler_dTypecheck_dmkScheme [] ty)) :: (ps), st2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1403 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1402 6 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1400 1 ("no matching clause for Vuna.Compiler.Typecheck.seedPlaceholders")

let rec v_Vuna_dCompiler_dTypecheck_dupdateScheme = fun name sch env -> (match env with
  | [] -> []
  | (C_Base_dPair_dPair (n, s)) :: (rest) -> if v_vuna_ueq_ugeneric n name then (C_Base_dPair_dPair (n, sch)) :: (rest) else (C_Base_dPair_dPair (n, s)) :: (v_Vuna_dCompiler_dTypecheck_dupdateScheme name sch rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1406 29 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dvarInScheme = fun v sch -> (match sch with
  | C_Vuna_dCompiler_dTypecheck_dScheme ([], [], C_Vuna_dCompiler_dTypecheck_dTVar (k)) -> v_vuna_ueq_uint v k
  | _ -> v_Vuna_dCompiler_dTypecheck_dmemInt v (v_Vuna_dCompiler_dTypecheck_dfreeVarsScheme sch)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1413 21 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dvarInEnvExcept = fun v name env -> (match env with
  | [] -> false
  | (C_Base_dPair_dPair (n, sch)) :: (rest) -> if v_vuna_ueq_ugeneric n name then v_Vuna_dCompiler_dTypecheck_dvarInEnvExcept v name rest else if v_Vuna_dCompiler_dTypecheck_dvarInScheme v sch then true else v_Vuna_dCompiler_dTypecheck_dvarInEnvExcept v name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1417 29 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dgeneralizableVars = fun name env ty -> v_Base_dList_dfilter (fun v -> v_Base_dBool_dnot (v_Vuna_dCompiler_dTypecheck_dvarInEnvExcept v name env)) (v_Vuna_dCompiler_dTypecheck_dfreeVarsTy ty)

let v_Vuna_dCompiler_dTypecheck_dsubstOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTC (n, s, typeNames, records, cons, methods, tctx)) -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1426 1 ("no matching clause for Vuna.Compiler.Typecheck.substOf")

let v_Vuna_dCompiler_dTypecheck_dfunLoc = fun name decls -> (match v_Vuna_dCompiler_dAst_dclausesFor decls name with
  | [] -> ""
  | (C_Base_dPair_dPair (pats, body)) :: (_) -> (let sp = v_Vuna_dCompiler_dAst_dexprSpan body in if v_vuna_ueq_uint (v_Vuna_dCompiler_dCommon_dspanStartLine sp) 0 then "" else ((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": ")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1429 21 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dfilterNeeds = fun a0 a1 -> match (a0, a1) with
  | (genVars, []) -> []
  | (genVars, (C_Base_dPair_dPair (tr, ty)) :: (rest)) -> (match v_Vuna_dCompiler_dTypecheck_dheadVarOf ty with
  | C_Base_dMaybe_dJust (v) -> if v_Vuna_dCompiler_dTypecheck_dmemInt v genVars then (C_Base_dPair_dPair (tr, ty)) :: (v_Vuna_dCompiler_dTypecheck_dfilterNeeds genVars rest) else v_Vuna_dCompiler_dTypecheck_dfilterNeeds genVars rest
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dfilterNeeds genVars rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1437 46 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1436 1 ("no matching clause for Vuna.Compiler.Typecheck.filterNeeds")

let v_Vuna_dCompiler_dTypecheck_dfinishFunctionScheme = fun globals name inferred needs elab st -> (let resolved = v_Vuna_dCompiler_dTypecheck_dresolveTy (v_Vuna_dCompiler_dTypecheck_dsubstOf st) inferred in (let qs = v_Vuna_dCompiler_dTypecheck_dgeneralizableVars name globals resolved in (let scheme = C_Vuna_dCompiler_dTypecheck_dScheme (qs, needs, resolved) in C_Base_dResult_dOk (C_Base_dPair_dPair (elab, C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dupdateScheme name scheme globals, st))))))

let rec v_Vuna_dCompiler_dTypecheck_dreplaceElab = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clauses, []) -> []
  | (name, clauses, (C_Base_dPair_dPair (n, old)) :: (rest)) -> if v_vuna_ueq_ustr n name then (C_Base_dPair_dPair (n, clauses)) :: (rest) else (C_Base_dPair_dPair (n, old)) :: (v_Vuna_dCompiler_dTypecheck_dreplaceElab name clauses rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1516 1 ("no matching clause for Vuna.Compiler.Typecheck.replaceElab")

let rec v_Vuna_dCompiler_dTypecheck_drebuildDecls = fun a0 a1 -> match (a0, a1) with
  | ([], elabMap) -> []
  | ((d) :: (rest), elabMap) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> (match v_Base_dList_dlookupPair name elabMap with
  | C_Base_dMaybe_dJust ((C_Base_dPair_dPair (pats2, body2)) :: (restElab)) -> (C_Vuna_dCompiler_dAst_dDFun (name, pats2, body2, sp)) :: (v_Vuna_dCompiler_dTypecheck_drebuildDecls rest (v_Vuna_dCompiler_dTypecheck_dreplaceElab name restElab elabMap))
  | _ -> (d) :: (v_Vuna_dCompiler_dTypecheck_drebuildDecls rest elabMap)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1510 29 ("case pattern match failure"))
  | _ -> (d) :: (v_Vuna_dCompiler_dTypecheck_drebuildDecls rest elabMap)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1509 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1508 1 ("no matching clause for Vuna.Compiler.Typecheck.rebuildDecls")

let rec v_Vuna_dCompiler_dTypecheck_dtcJoin = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Vuna_dCompiler_dTypecheck_dtcJoin sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1525 1 ("no matching clause for Vuna.Compiler.Typecheck.tcJoin")

let v_Vuna_dCompiler_dTypecheck_dsanitizeSymChar = fun c -> if (if (v_vuna_ueq_uint c 46) then true else (v_vuna_ueq_uint c 35)) then 95 else c

let v_Vuna_dCompiler_dTypecheck_dsanitizeSym = fun name -> bi_str_pack (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_dsanitizeSymChar (bi_str_unpack name))

let v_Vuna_dCompiler_dTypecheck_dlastSeg = fun name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (rev, base) -> base
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1533 16 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dmodulePrefixOf = fun name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (rev, base) -> v_Vuna_dCompiler_dCommon_djoinDots rev
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1536 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtcQuoteChar = fun c -> if v_vuna_ueq_uint c 34 then "\\\"" else if v_vuna_ueq_uint c 92 then "\\\\" else if v_vuna_ueq_uint c 10 then "\\n" else if v_vuna_ueq_uint c 9 then "\\t" else if v_vuna_ueq_uint c 13 then "\\r" else bi_str_pack ((c) :: ([]))

let rec v_Vuna_dCompiler_dTypecheck_dtcQuoteChars = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> ((v_Vuna_dCompiler_dTypecheck_dtcQuoteChar c) ^ (v_Vuna_dCompiler_dTypecheck_dtcQuoteChars rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1544 1 ("no matching clause for Vuna.Compiler.Typecheck.tcQuoteChars")

let v_Vuna_dCompiler_dTypecheck_dtcQuote = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dtcQuoteChars (bi_str_unpack s)) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let rec v_Vuna_dCompiler_dTypecheck_drenderTyExpr = fun ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> n
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", sp), (a) :: ((b) :: ([])), _) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_drenderTyExpr a) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_drenderTyExpr b) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dCompiler_dAst_dEApp (f, args, sp) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_drenderTyExpr f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dtcJoin " " (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_drenderTyExpr args)) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> "Int"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1549 19 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtraitDeclName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitDecl (n, p, a, ms)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1572 1 ("no matching clause for Vuna.Compiler.Typecheck.traitDeclName")

let v_Vuna_dCompiler_dTypecheck_dtraitDeclParam = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitDecl (n, p, a, ms)) -> p
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1574 1 ("no matching clause for Vuna.Compiler.Typecheck.traitDeclParam")

let v_Vuna_dCompiler_dTypecheck_dtraitDeclArity = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitDecl (n, p, a, ms)) -> a
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1576 1 ("no matching clause for Vuna.Compiler.Typecheck.traitDeclArity")

let v_Vuna_dCompiler_dTypecheck_dtraitDeclMethods = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitDecl (n, p, a, ms)) -> ms
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1578 1 ("no matching clause for Vuna.Compiler.Typecheck.traitDeclMethods")

let v_Vuna_dCompiler_dTypecheck_dmethodInfoName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo (n, s, t)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1584 1 ("no matching clause for Vuna.Compiler.Typecheck.methodInfoName")

let v_Vuna_dCompiler_dTypecheck_dmethodInfoScheme = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo (n, s, t)) -> s
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1586 1 ("no matching clause for Vuna.Compiler.Typecheck.methodInfoScheme")

let v_Vuna_dCompiler_dTypecheck_dmethodInfoSig = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo (n, s, t)) -> t
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1588 1 ("no matching clause for Vuna.Compiler.Typecheck.methodInfoSig")

let v_Vuna_dCompiler_dTypecheck_dinstTraitName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitInst (t, n, h, impls)) -> t
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1590 1 ("no matching clause for Vuna.Compiler.Typecheck.instTraitName")

let v_Vuna_dCompiler_dTypecheck_dinstNameOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitInst (t, n, h, impls)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1592 1 ("no matching clause for Vuna.Compiler.Typecheck.instNameOf")

let v_Vuna_dCompiler_dTypecheck_dinstHeadTy = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitInst (t, n, h, impls)) -> h
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1594 1 ("no matching clause for Vuna.Compiler.Typecheck.instHeadTy")

let v_Vuna_dCompiler_dTypecheck_dinstImpls = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitInst (t, n, h, impls)) -> impls
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1596 1 ("no matching clause for Vuna.Compiler.Typecheck.instImpls")

let v_Vuna_dCompiler_dTypecheck_dtraitCtxDecls = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> ds
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1598 1 ("no matching clause for Vuna.Compiler.Typecheck.traitCtxDecls")

let v_Vuna_dCompiler_dTypecheck_dtraitCtxInsts = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> is
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1600 1 ("no matching clause for Vuna.Compiler.Typecheck.traitCtxInsts")

let v_Vuna_dCompiler_dTypecheck_dtraitCtxSupported = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> sup
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1602 1 ("no matching clause for Vuna.Compiler.Typecheck.traitCtxSupported")

let v_Vuna_dCompiler_dTypecheck_dtraitCtxEqSupported = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> eqsup
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1604 1 ("no matching clause for Vuna.Compiler.Typecheck.traitCtxEqSupported")

let v_Vuna_dCompiler_dTypecheck_dtraitCtxRefs = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dTraitCtx (ds, is, sup, eqsup, refs)) -> refs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1606 1 ("no matching clause for Vuna.Compiler.Typecheck.traitCtxRefs")

let rec v_Vuna_dCompiler_dTypecheck_dlookupTraitDecl = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Vuna_dCompiler_dTypecheck_dTraitDecl (n, p, a, ms)) :: (rest)) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dTraitDecl (n, p, a, ms)) else v_Vuna_dCompiler_dTypecheck_dlookupTraitDecl name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1608 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupTraitDecl")

let v_Vuna_dCompiler_dTypecheck_dtraitMethodKeys = fun tctx tr -> (match v_Vuna_dCompiler_dTypecheck_dlookupTraitDecl tr (v_Vuna_dCompiler_dTypecheck_dtraitCtxDecls tctx) with
  | C_Base_dMaybe_dNothing -> []
  | C_Base_dMaybe_dJust (td) -> v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_dmethodInfoName (v_Vuna_dCompiler_dTypecheck_dtraitDeclMethods td)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 608 27 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_ddictParamsForGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (tctx, [], acc, idx) -> v_Base_dList_dreverse acc
  | (tctx, (C_Base_dPair_dPair (tr, ty)) :: (rest), acc, idx) -> (match v_Vuna_dCompiler_dTypecheck_dheadVarOf ty with
  | C_Base_dMaybe_dJust (v) -> v_Vuna_dCompiler_dTypecheck_ddictParamsForMethods tctx tr v (v_Vuna_dCompiler_dTypecheck_dtraitMethodKeys tctx tr) acc idx rest
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_ddictParamsForGo tctx rest acc idx
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 690 55 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 689 1 ("no matching clause for Vuna.Compiler.Typecheck.dictParamsForGo")
and v_Vuna_dCompiler_dTypecheck_ddictParamsForMethods = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (tctx, tr, v, [], acc, idx, rest) -> v_Vuna_dCompiler_dTypecheck_ddictParamsForGo tctx rest acc idx
  | (tctx, tr, v, (key) :: (keys), acc, idx, rest) -> (let pname = (("vuna_dict") ^ (bi_str_from_int idx)) in v_Vuna_dCompiler_dTypecheck_ddictParamsForMethods tctx tr v keys ((C_Vuna_dCompiler_dTypecheck_dDictParam (tr, v, key, pname)) :: (acc)) (bi_add idx 1) rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 694 1 ("no matching clause for Vuna.Compiler.Typecheck.dictParamsForMethods")

let v_Vuna_dCompiler_dTypecheck_ddictParamsFor = fun tctx needs -> v_Vuna_dCompiler_dTypecheck_ddictParamsForGo tctx needs [] 0

let v_Vuna_dCompiler_dTypecheck_dtraitArityOf = fun tctx tr -> (match v_Vuna_dCompiler_dTypecheck_dlookupTraitDecl tr (v_Vuna_dCompiler_dTypecheck_dtraitCtxDecls tctx) with
  | C_Base_dMaybe_dJust (td) -> v_Vuna_dCompiler_dTypecheck_dtraitDeclArity td
  | C_Base_dMaybe_dNothing -> 0
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1580 24 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dlookupMethodRef = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Vuna_dCompiler_dTypecheck_dTraitMethodRef (key, tr, sch, pid)) :: (rest)) -> if v_vuna_ueq_ustr key name then C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dTraitMethodRef (key, tr, sch, pid)) else v_Vuna_dCompiler_dTypecheck_dlookupMethodRef name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1612 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupMethodRef")

let rec v_Vuna_dCompiler_dTypecheck_dlookupImpl = fun a0 a1 -> match (a0, a1) with
  | (meth, []) -> C_Base_dMaybe_dNothing
  | (meth, (C_Base_dPair_dPair (m, fn)) :: (rest)) -> if v_vuna_ueq_ustr m meth then C_Base_dMaybe_dJust (fn) else v_Vuna_dCompiler_dTypecheck_dlookupImpl meth rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1616 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupImpl")

let rec v_Vuna_dCompiler_dTypecheck_dlookupNamedInst = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (inst) :: (rest)) -> (match v_Vuna_dCompiler_dTypecheck_dinstNameOf inst with
  | C_Base_dMaybe_dJust (n) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (inst) else v_Vuna_dCompiler_dTypecheck_dlookupNamedInst name rest
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dlookupNamedInst name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1620 39 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1619 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupNamedInst")

let rec v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern = fun pattern ty -> (match pattern with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> true
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, ps) -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon (m, args) -> (if (v_vuna_ueq_ustr n m) then (v_Vuna_dCompiler_dTypecheck_dtyListMatches ps args) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1626 16 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTFun (x, y) -> (if (v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern a x) then (v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern b y) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1629 15 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTApp (head2, args2) -> (if (v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern head head2) then (v_Vuna_dCompiler_dTypecheck_dtyListMatches args args2) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1632 21 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1624 31 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dtyListMatches = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> true
  | ((p) :: (ps), (t) :: (ts)) -> if v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern p t then v_Vuna_dCompiler_dTypecheck_dtyListMatches ps ts else false
  | (_, _) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1636 1 ("no matching clause for Vuna.Compiler.Typecheck.tyListMatches")

let rec v_Vuna_dCompiler_dTypecheck_dtyEqual = fun a b -> (match a with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (match b with
  | C_Vuna_dCompiler_dTypecheck_dTVar (j) -> v_vuna_ueq_uint i j
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1652 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, xs) -> (match b with
  | C_Vuna_dCompiler_dTypecheck_dTCon (m, ys) -> (if (v_vuna_ueq_ustr n m) then (v_Vuna_dCompiler_dTypecheck_dtyListEqual xs ys) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1655 16 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTFun (x, y) -> (match b with
  | C_Vuna_dCompiler_dTypecheck_dTFun (x2, y2) -> (if (v_Vuna_dCompiler_dTypecheck_dtyEqual x x2) then (v_Vuna_dCompiler_dTypecheck_dtyEqual y y2) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1658 15 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTApp (h, xs) -> (match b with
  | C_Vuna_dCompiler_dTypecheck_dTApp (h2, ys) -> (if (v_Vuna_dCompiler_dTypecheck_dtyEqual h h2) then (v_Vuna_dCompiler_dTypecheck_dtyListEqual xs ys) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1661 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1651 15 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dtyListEqual = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> true
  | ((a) :: (xs), (b) :: (ys)) -> (if (v_Vuna_dCompiler_dTypecheck_dtyEqual a b) then (v_Vuna_dCompiler_dTypecheck_dtyListEqual xs ys) else false)
  | (_, _) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1665 1 ("no matching clause for Vuna.Compiler.Typecheck.tyListEqual")

let v_Vuna_dCompiler_dTypecheck_dbuiltinA = C_Vuna_dCompiler_dAst_dEVar ("a", v_Vuna_dCompiler_dTypecheck_dtcNoSpan)

let v_Vuna_dCompiler_dTypecheck_dbuiltinArrow = fun a b -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (a) :: ((b) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan)

let v_Vuna_dCompiler_dTypecheck_dbuiltinShowTrait = fun () -> C_Vuna_dCompiler_dTypecheck_dTraitDecl ("Show", "a", 0, (C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo ("show", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dstrTy)), v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (C_Vuna_dCompiler_dAst_dEVar ("String", v_Vuna_dCompiler_dTypecheck_dtcNoSpan)))) :: ([]))

let v_Vuna_dCompiler_dTypecheck_dbuiltinEqTrait = fun () -> C_Vuna_dCompiler_dTypecheck_dTraitDecl ("Eq", "a", 0, (C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo ("eq", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (C_Vuna_dCompiler_dAst_dEVar ("Bool", v_Vuna_dCompiler_dTypecheck_dtcNoSpan))))) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo ("neq", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (C_Vuna_dCompiler_dAst_dEVar ("Bool", v_Vuna_dCompiler_dTypecheck_dtcNoSpan))))) :: ([])))

let v_Vuna_dCompiler_dTypecheck_dbuiltinOrdTrait = fun () -> C_Vuna_dCompiler_dTypecheck_dTraitDecl ("Ord", "a", 0, (C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo ("lt", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (C_Vuna_dCompiler_dAst_dEVar ("Bool", v_Vuna_dCompiler_dTypecheck_dtcNoSpan))))) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo ("le", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (C_Vuna_dCompiler_dAst_dEVar ("Bool", v_Vuna_dCompiler_dTypecheck_dtcNoSpan))))) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo ("gt", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (C_Vuna_dCompiler_dAst_dEVar ("Bool", v_Vuna_dCompiler_dTypecheck_dtcNoSpan))))) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo ("ge", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (v_Vuna_dCompiler_dTypecheck_dbuiltinArrow v_Vuna_dCompiler_dTypecheck_dbuiltinA (C_Vuna_dCompiler_dAst_dEVar ("Bool", v_Vuna_dCompiler_dTypecheck_dtcNoSpan))))) :: ([])))))

let v_Vuna_dCompiler_dTypecheck_dbuiltinTraitDecls = fun () -> (v_Vuna_dCompiler_dTypecheck_dbuiltinShowTrait ()) :: ((v_Vuna_dCompiler_dTypecheck_dbuiltinEqTrait ()) :: ((v_Vuna_dCompiler_dTypecheck_dbuiltinOrdTrait ()) :: ([])))

let v_Vuna_dCompiler_dTypecheck_dbuiltinMethodRefs = fun () -> (C_Vuna_dCompiler_dTypecheck_dTraitMethodRef ("show", "Show", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dstrTy)), 0)) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodRef ("eq", "Eq", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), 0)) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodRef ("neq", "Eq", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), 0)) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodRef ("lt", "Ord", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), 0)) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodRef ("le", "Ord", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), 0)) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodRef ("gt", "Ord", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), 0)) :: ((C_Vuna_dCompiler_dTypecheck_dTraitMethodRef ("ge", "Ord", v_Vuna_dCompiler_dTypecheck_dmkScheme ((0) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), C_Vuna_dCompiler_dTypecheck_dTFun (C_Vuna_dCompiler_dTypecheck_dTVar (0), v_Vuna_dCompiler_dTypecheck_dboolTy))), 0)) :: ([])))))))

let v_Vuna_dCompiler_dTypecheck_doperatorMethod = fun name -> (match name with
  | "==" -> C_Base_dMaybe_dJust (C_Base_dPair_dPair ("Eq", "eq"))
  | "/=" -> C_Base_dMaybe_dJust (C_Base_dPair_dPair ("Eq", "neq"))
  | "<" -> C_Base_dMaybe_dJust (C_Base_dPair_dPair ("Ord", "lt"))
  | "<=" -> C_Base_dMaybe_dJust (C_Base_dPair_dPair ("Ord", "le"))
  | ">" -> C_Base_dMaybe_dJust (C_Base_dPair_dPair ("Ord", "gt"))
  | ">=" -> C_Base_dMaybe_dJust (C_Base_dPair_dPair ("Ord", "ge"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1698 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dmethodRefForName = fun name refs -> (match v_Vuna_dCompiler_dTypecheck_dlookupMethodRef name refs with
  | C_Base_dMaybe_dJust (r) -> C_Base_dMaybe_dJust (r)
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypecheck_doperatorMethod name with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (tr, key)) -> v_Vuna_dCompiler_dTypecheck_dlookupMethodRef key refs
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1709 14 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1707 30 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtraitMethodScheme = fun typeNames paramName sigTy -> v_Vuna_dCompiler_dTypecheck_dconvertType typeNames ((C_Base_dPair_dPair (paramName, C_Vuna_dCompiler_dTypecheck_dTVar (0))) :: ([])) (C_Vuna_dCompiler_dTypecheck_dTC (1, C_Vuna_dCompiler_dTypecheck_dTsLeaf, typeNames, [], [], [], C_Vuna_dCompiler_dTypecheck_dTraitCtx ([], [], [], [], []))) sigTy

let v_Vuna_dCompiler_dTypecheck_dmaxInt = fun a b -> if v_vuna_ugt_uint a b then a else b

let rec v_Vuna_dCompiler_dTypecheck_dtyExprParamArity = fun paramName ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (n, sp), args, _) -> if v_vuna_ueq_ustr n paramName then v_Base_dList_dlength args else v_Vuna_dCompiler_dTypecheck_dtyListParamArity paramName args
  | C_Vuna_dCompiler_dAst_dEApp (f, args, _) -> v_Vuna_dCompiler_dTypecheck_dmaxInt (v_Vuna_dCompiler_dTypecheck_dtyExprParamArity paramName f) (v_Vuna_dCompiler_dTypecheck_dtyListParamArity paramName args)
  | _ -> 0
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1719 33 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dtyListParamArity = fun a0 a1 -> match (a0, a1) with
  | (paramName, []) -> 0
  | (paramName, (ty) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dmaxInt (v_Vuna_dCompiler_dTypecheck_dtyExprParamArity paramName ty) (v_Vuna_dCompiler_dTypecheck_dtyListParamArity paramName rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1724 1 ("no matching clause for Vuna.Compiler.Typecheck.tyListParamArity")

let rec v_Vuna_dCompiler_dTypecheck_dtraitParamArityCheck = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (paramName, [], arity) -> C_Base_dPair_dPair (arity, C_Base_dMaybe_dNothing)
  | (paramName, (C_Base_dPair_dPair (mname, sigTy)) :: (rest), arity) -> (match v_Vuna_dCompiler_dTypecheck_dtraitParamArityCheck paramName rest arity with
  | C_Base_dPair_dPair (arity2, conflict) -> (let a = v_Vuna_dCompiler_dTypecheck_dtyExprParamArity paramName sigTy in if (if (v_vuna_ueq_uint a 0) then true else (v_vuna_ueq_uint a arity2)) then C_Base_dPair_dPair (arity2, conflict) else if v_vuna_ueq_uint arity2 0 then C_Base_dPair_dPair (a, conflict) else C_Base_dPair_dPair (arity2, C_Base_dMaybe_dJust (a)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1731 69 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1730 1 ("no matching clause for Vuna.Compiler.Typecheck.traitParamArityCheck")

let rec v_Vuna_dCompiler_dTypecheck_dtraitMethodInfos = fun typeNames tname paramName methods infos refs sp -> (match methods with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse infos, v_Base_dList_dreverse refs))
  | (C_Base_dPair_dPair (mname, sigTy)) :: (rest) -> if v_Base_dList_dmemName (v_Vuna_dCompiler_dTypecheck_dlastSeg mname) (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_dmethodInfoName infos) then C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": duplicate trait method ") in (let vuna_cat2' = (mname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else (match v_Vuna_dCompiler_dTypecheck_dtraitMethodScheme typeNames paramName sigTy with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": in trait ") in (let vuna_cat2' = (tname) in (let vuna_cat3' = (" method ") in (let vuna_cat4' = (mname) in (let vuna_cat5' = (": ") in (let vuna_cat6' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, vars), st)) -> (match v_Vuna_dCompiler_dTypecheck_dlookupTyVar paramName vars with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dTVar (pid)) -> v_Vuna_dCompiler_dTypecheck_dtraitMethodInfos typeNames tname paramName rest ((C_Vuna_dCompiler_dTypecheck_dTraitMethodInfo (v_Vuna_dCompiler_dTypecheck_dlastSeg mname, v_Vuna_dCompiler_dTypecheck_dmkScheme (v_Vuna_dCompiler_dTypecheck_dvarIds vars) ty, sigTy)) :: (infos)) ((C_Vuna_dCompiler_dTypecheck_dTraitMethodRef (mname, tname, v_Vuna_dCompiler_dTypecheck_dmkScheme (v_Vuna_dCompiler_dTypecheck_dvarIds vars) ty, pid)) :: (refs)) sp
  | _ -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": internal trait parameter error")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1763 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1761 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1758 68 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dcollectTraitDeclsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (typeNames, [], acc, refs) -> C_Base_dResult_dOk (C_Base_dPair_dPair (acc, refs))
  | (typeNames, (d) :: (rest), acc, refs) -> (match d with
  | C_Vuna_dCompiler_dAst_dDTrait (tname, params, methods, sp) -> (match params with
  | (p) :: ([]) -> if v_Base_dList_dmemName tname (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_dtraitDeclName acc) then C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": duplicate trait ") in (let vuna_cat2' = (tname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else (match v_Vuna_dCompiler_dTypecheck_dtraitParamArityCheck p methods 0 with
  | C_Base_dPair_dPair (arity, conflict) -> (match conflict with
  | C_Base_dMaybe_dJust (other) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": trait ") in (let vuna_cat2' = (tname) in (let vuna_cat3' = (" uses its type parameter both as a type and as a type constructor") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypecheck_dtraitMethodInfos typeNames tname p methods [] [] sp with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (infos, newRefs)) -> v_Vuna_dCompiler_dTypecheck_dcollectTraitDeclsGo typeNames rest (v_Base_dList_dappend acc ((C_Vuna_dCompiler_dTypecheck_dTraitDecl (tname, p, arity, infos)) :: ([]))) (v_Base_dList_dappend refs newRefs)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1750 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1746 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1745 10 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": trait ") in (let vuna_cat2' = (tname) in (let vuna_cat3' = (" must have exactly one type parameter") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1743 37 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dTypecheck_dcollectTraitDeclsGo typeNames rest acc refs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1742 54 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1741 1 ("no matching clause for Vuna.Compiler.Typecheck.collectTraitDeclsGo")

let v_Vuna_dCompiler_dTypecheck_dcollectTraitDecls = fun typeNames decls -> v_Vuna_dCompiler_dTypecheck_dcollectTraitDeclsGo typeNames decls (v_Vuna_dCompiler_dTypecheck_dbuiltinTraitDecls ()) (v_Vuna_dCompiler_dTypecheck_dbuiltinMethodRefs ())

let v_Vuna_dCompiler_dTypecheck_dshapeName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dDataShape (n, p, cs)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1774 1 ("no matching clause for Vuna.Compiler.Typecheck.shapeName")

let v_Vuna_dCompiler_dTypecheck_dshapeParams = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dDataShape (n, p, cs)) -> p
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1776 1 ("no matching clause for Vuna.Compiler.Typecheck.shapeParams")

let v_Vuna_dCompiler_dTypecheck_dshapeCtors = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dDataShape (n, p, cs)) -> cs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1778 1 ("no matching clause for Vuna.Compiler.Typecheck.shapeCtors")

let rec v_Vuna_dCompiler_dTypecheck_dsplitTyFields = fun ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", _), (a) :: ((b) :: ([])), _) -> (a) :: (v_Vuna_dCompiler_dTypecheck_dsplitTyFields b)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1780 20 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dshapeOfCtor = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dCtor (cname, ty, arity, sp)) -> C_Base_dPair_dPair (cname, v_Vuna_dCompiler_dTypecheck_dsplitTyFields ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1784 1 ("no matching clause for Vuna.Compiler.Typecheck.shapeOfCtor")

let rec v_Vuna_dCompiler_dTypecheck_dcollectDataShapes = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> (C_Vuna_dCompiler_dTypecheck_dDataShape (name, params, v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_dshapeOfCtor ctors)) :: (v_Vuna_dCompiler_dTypecheck_dcollectDataShapes rest)
  | _ -> v_Vuna_dCompiler_dTypecheck_dcollectDataShapes rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1787 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1786 1 ("no matching clause for Vuna.Compiler.Typecheck.collectDataShapes")

let rec v_Vuna_dCompiler_dTypecheck_dlookupDataShape = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (sh) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypecheck_dshapeName sh) name then C_Base_dMaybe_dJust (sh) else v_Vuna_dCompiler_dTypecheck_dlookupDataShape name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1792 1 ("no matching clause for Vuna.Compiler.Typecheck.lookupDataShape")

let v_Vuna_dCompiler_dTypecheck_dfieldTypeSupported = fun supported ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEVar ("Int", sp) -> true
  | C_Vuna_dCompiler_dAst_dEVar ("String", sp) -> true
  | C_Vuna_dCompiler_dAst_dEVar ("Bool", sp) -> true
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> v_Base_dList_dmemName n supported
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1796 35 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dfieldTypesSupported = fun a0 a1 -> match (a0, a1) with
  | (supported, []) -> true
  | (supported, (ty) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_dfieldTypeSupported supported ty then v_Vuna_dCompiler_dTypecheck_dfieldTypesSupported supported rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1803 1 ("no matching clause for Vuna.Compiler.Typecheck.fieldTypesSupported")

let rec v_Vuna_dCompiler_dTypecheck_dctorsSupported = fun a0 a1 -> match (a0, a1) with
  | (supported, []) -> true
  | (supported, (C_Base_dPair_dPair (cname, ftypes)) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_dfieldTypesSupported supported ftypes then v_Vuna_dCompiler_dTypecheck_dctorsSupported supported rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1810 1 ("no matching clause for Vuna.Compiler.Typecheck.ctorsSupported")

let v_Vuna_dCompiler_dTypecheck_dshapeSupported = fun a0 a1 -> match (a0, a1) with
  | (supported, C_Vuna_dCompiler_dTypecheck_dDataShape (n, params, ctors)) -> if v_vuna_ueq_uBase_uList_uList params [] then v_Vuna_dCompiler_dTypecheck_dctorsSupported supported ctors else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1807 1 ("no matching clause for Vuna.Compiler.Typecheck.shapeSupported")

let rec v_Vuna_dCompiler_dTypecheck_daddSupportedShapes = fun a0 a1 -> match (a0, a1) with
  | ([], supported) -> C_Base_dPair_dPair (supported, 0)
  | ((sh) :: (shapes), supported) -> (match v_Vuna_dCompiler_dTypecheck_daddSupportedShapes shapes supported with
  | C_Base_dPair_dPair (supported2, cnt) -> if v_Base_dList_dmemName (v_Vuna_dCompiler_dTypecheck_dshapeName sh) supported2 then C_Base_dPair_dPair (supported2, cnt) else if v_Vuna_dCompiler_dTypecheck_dshapeSupported ((v_Vuna_dCompiler_dTypecheck_dshapeName sh) :: (supported2)) sh then C_Base_dPair_dPair (v_Base_dList_dappend supported2 ((v_Vuna_dCompiler_dTypecheck_dshapeName sh) :: ([])), bi_add cnt 1) else C_Base_dPair_dPair (supported2, cnt)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1815 47 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1814 1 ("no matching clause for Vuna.Compiler.Typecheck.addSupportedShapes")

let rec v_Vuna_dCompiler_dTypecheck_dsupportedShapesLoop = fun shapes supported -> (match v_Vuna_dCompiler_dTypecheck_daddSupportedShapes shapes supported with
  | C_Base_dPair_dPair (supported2, cnt) -> if v_vuna_ueq_uint cnt 0 then supported2 else v_Vuna_dCompiler_dTypecheck_dsupportedShapesLoop shapes supported2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1821 40 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dsupportedShapes = fun shapes -> v_Vuna_dCompiler_dTypecheck_dsupportedShapesLoop shapes []

let rec v_Vuna_dCompiler_dTypecheck_deqFieldSupported = fun eqsup params ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> if v_Base_dList_dmemName n params then true else if (if ((if (v_vuna_ueq_ustr n "Int") then true else (v_vuna_ueq_ustr n "String"))) then true else (v_vuna_ueq_ustr n "Bool")) then true else v_Base_dList_dmemName n eqsup
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (n, sp), args, _) -> (if (v_Base_dList_dmemName n eqsup) then (v_Vuna_dCompiler_dTypecheck_deqArgsSupported eqsup params args) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1827 36 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_deqArgsSupported = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (eqsup, params, []) -> true
  | (eqsup, params, (ty) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_deqFieldSupported eqsup params ty then v_Vuna_dCompiler_dTypecheck_deqArgsSupported eqsup params rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1834 1 ("no matching clause for Vuna.Compiler.Typecheck.eqArgsSupported")

let rec v_Vuna_dCompiler_dTypecheck_dfieldsEqSupported = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (eqsup, params, []) -> true
  | (eqsup, params, (ty) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_deqFieldSupported eqsup params ty then v_Vuna_dCompiler_dTypecheck_dfieldsEqSupported eqsup params rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1844 1 ("no matching clause for Vuna.Compiler.Typecheck.fieldsEqSupported")

let rec v_Vuna_dCompiler_dTypecheck_deqCtorsSupported = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (eqsup, params, []) -> true
  | (eqsup, params, (C_Base_dPair_dPair (cname, ftypes)) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_dfieldsEqSupported eqsup params ftypes then v_Vuna_dCompiler_dTypecheck_deqCtorsSupported eqsup params rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1840 1 ("no matching clause for Vuna.Compiler.Typecheck.eqCtorsSupported")

let v_Vuna_dCompiler_dTypecheck_deqShapeSupported = fun a0 a1 -> match (a0, a1) with
  | (eqsup, C_Vuna_dCompiler_dTypecheck_dDataShape (n, params, ctors)) -> v_Vuna_dCompiler_dTypecheck_deqCtorsSupported eqsup params ctors
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1838 1 ("no matching clause for Vuna.Compiler.Typecheck.eqShapeSupported")

let rec v_Vuna_dCompiler_dTypecheck_daddEqSupportedShapes = fun a0 a1 -> match (a0, a1) with
  | ([], eqsup) -> C_Base_dPair_dPair (eqsup, 0)
  | ((sh) :: (shapes), eqsup) -> (match v_Vuna_dCompiler_dTypecheck_daddEqSupportedShapes shapes eqsup with
  | C_Base_dPair_dPair (eqsup2, cnt) -> if v_Base_dList_dmemName (v_Vuna_dCompiler_dTypecheck_dshapeName sh) eqsup2 then C_Base_dPair_dPair (eqsup2, cnt) else if v_Vuna_dCompiler_dTypecheck_deqShapeSupported ((v_Vuna_dCompiler_dTypecheck_dshapeName sh) :: (eqsup2)) sh then C_Base_dPair_dPair (v_Base_dList_dappend eqsup2 ((v_Vuna_dCompiler_dTypecheck_dshapeName sh) :: ([])), bi_add cnt 1) else C_Base_dPair_dPair (eqsup2, cnt)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1849 45 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1848 1 ("no matching clause for Vuna.Compiler.Typecheck.addEqSupportedShapes")

let rec v_Vuna_dCompiler_dTypecheck_deqSupportedLoop = fun shapes eqsup -> (match v_Vuna_dCompiler_dTypecheck_daddEqSupportedShapes shapes eqsup with
  | C_Base_dPair_dPair (eqsup2, cnt) -> if v_vuna_ueq_uint cnt 0 then eqsup2 else v_Vuna_dCompiler_dTypecheck_deqSupportedLoop shapes eqsup2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1855 32 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_deqSupportedShapes = fun shapes -> v_Vuna_dCompiler_dTypecheck_deqSupportedLoop shapes []

let v_Vuna_dCompiler_dTypecheck_dshowFnName = fun tyName -> (("vuna_show_") ^ (v_Vuna_dCompiler_dTypecheck_dsanitizeSym tyName))

let v_Vuna_dCompiler_dTypecheck_dshowFallback = fun tctx ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon ("Int", []) -> C_Base_dResult_dOk ("vuna_show_int")
  | C_Vuna_dCompiler_dTypecheck_dTCon ("String", []) -> C_Base_dResult_dOk ("vuna_show_string")
  | C_Vuna_dCompiler_dTypecheck_dTCon ("Bool", []) -> C_Base_dResult_dOk ("vuna_show_bool")
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, []) -> if v_Base_dList_dmemName n (v_Vuna_dCompiler_dTypecheck_dtraitCtxSupported tctx) then C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dshowFnName n) else C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dnoInstanceMsg tctx "Show" ty)
  | _ -> C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dnoInstanceMsg tctx "Show" ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 455 24 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_deqFnName = fun tyName -> (("vuna_eq_") ^ (v_Vuna_dCompiler_dTypecheck_dsanitizeSym tyName))

let v_Vuna_dCompiler_dTypecheck_dneqFnName = fun tyName -> (("vuna_neq_") ^ (v_Vuna_dCompiler_dTypecheck_dsanitizeSym tyName))

let v_Vuna_dCompiler_dTypecheck_deqFallback = fun tctx ty key -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon ("Int", []) -> if v_vuna_ueq_ustr key "neq" then C_Base_dResult_dOk ("vuna_neq_int") else C_Base_dResult_dOk ("vuna_eq_int")
  | C_Vuna_dCompiler_dTypecheck_dTCon ("Bool", []) -> if v_vuna_ueq_ustr key "neq" then C_Base_dResult_dOk ("vuna_neq_bool") else C_Base_dResult_dOk ("vuna_eq_bool")
  | C_Vuna_dCompiler_dTypecheck_dTCon ("String", []) -> if v_vuna_ueq_ustr key "neq" then C_Base_dResult_dOk ("vuna_neq_str") else C_Base_dResult_dOk ("vuna_eq_str")
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> if v_Base_dList_dmemName n (v_Vuna_dCompiler_dTypecheck_dtraitCtxEqSupported tctx) then if v_vuna_ueq_ustr key "neq" then C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dneqFnName n) else C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_deqFnName n) else C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dnoInstanceMsg tctx "Eq" ty)
  | _ -> C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dnoInstanceMsg tctx "Eq" ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 513 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dvarNamesAt = fun prefix i n -> if v_vuna_uge_uint i n then [] else (((prefix) ^ (bi_str_from_int i))) :: (v_Vuna_dCompiler_dTypecheck_dvarNamesAt prefix (bi_add i 1) n)

let v_Vuna_dCompiler_dTypecheck_dvarNames = fun prefix n -> v_Vuna_dCompiler_dTypecheck_dvarNamesAt prefix 0 n

let v_Vuna_dCompiler_dTypecheck_dctorPatternSrc = fun cname vars -> (match vars with
  | [] -> cname
  | _ -> (let vuna_cat0' = (cname) in (let vuna_cat1' = (" ") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypecheck_dtcJoin " " vars) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1871 29 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dshowArgParts = fun a0 -> match a0 with
  | ([]) -> []
  | ((v) :: (rest)) -> (v_Vuna_dCompiler_dTypecheck_dtcQuote " ") :: (((let vuna_cat0' = ("(show ") in (let vuna_cat1' = (v) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) :: (v_Vuna_dCompiler_dTypecheck_dshowArgParts rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1875 1 ("no matching clause for Vuna.Compiler.Typecheck.showArgParts")

let v_Vuna_dCompiler_dTypecheck_dshowCtorBody = fun cname n -> if v_vuna_ueq_uint n 0 then v_Vuna_dCompiler_dTypecheck_dtcQuote (v_Vuna_dCompiler_dTypecheck_dlastSeg cname) else (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dtcJoin " ++ " (v_Base_dList_dappend ((v_Vuna_dCompiler_dTypecheck_dtcQuote "(") :: ((v_Vuna_dCompiler_dTypecheck_dtcQuote (v_Vuna_dCompiler_dTypecheck_dlastSeg cname)) :: (v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dshowArgParts (v_Vuna_dCompiler_dTypecheck_dvarNames "v" n)) ((v_Vuna_dCompiler_dTypecheck_dtcQuote ")") :: ([]))))) [])) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dTypecheck_dstructuralShowClause = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (cname, ftypes)) -> (let vuna_cat0' = ("  ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dctorPatternSrc cname (v_Vuna_dCompiler_dTypecheck_dvarNames "v" (v_Base_dList_dlength ftypes))) in (let vuna_cat2' = (" => ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowCtorBody cname (v_Base_dList_dlength ftypes)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1884 1 ("no matching clause for Vuna.Compiler.Typecheck.structuralShowClause")

let v_Vuna_dCompiler_dTypecheck_dstructuralShowSrc = fun sh -> (let tyName = v_Vuna_dCompiler_dTypecheck_dshapeName sh in (let vuna_cat0' = (v_Vuna_dCompiler_dTypecheck_dshowFnName tyName) in (let vuna_cat1' = (" : ") in (let vuna_cat2' = (tyName) in (let vuna_cat3' = (" -> String\n") in (let vuna_cat4' = (v_Vuna_dCompiler_dTypecheck_dshowFnName tyName) in (let vuna_cat5' = (" x = case x of\n") in (let vuna_cat6' = (v_Vuna_dCompiler_dTypecheck_dtcJoin "\n" (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_dstructuralShowClause (v_Vuna_dCompiler_dTypecheck_dshapeCtors sh))) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))

let rec v_Vuna_dCompiler_dTypecheck_deqCondAt = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> "(0 == 0)"
  | ((v) :: (vs), (w) :: (ws)) -> (match v_Vuna_dCompiler_dTypecheck_deqCondAt vs ws with
  | "(0 == 0)" -> (let vuna_cat0' = ("((") in (let vuna_cat1' = (v) in (let vuna_cat2' = (") == (") in (let vuna_cat3' = (w) in (let vuna_cat4' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | rest -> (let vuna_cat0' = ("((") in (let vuna_cat1' = (v) in (let vuna_cat2' = (") == (") in (let vuna_cat3' = (w) in (let vuna_cat4' = (")) && ") in (let vuna_cat5' = (rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1902 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1901 1 ("no matching clause for Vuna.Compiler.Typecheck.eqCondAt")

let v_Vuna_dCompiler_dTypecheck_deqFieldFnSource = fun params ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> if v_Base_dList_dmemName n params then "vuna_eq_generic" else if v_vuna_ueq_ustr n "Int" then "vuna_eq_int" else if v_vuna_ueq_ustr n "String" then "vuna_eq_str" else if v_vuna_ueq_ustr n "Bool" then "vuna_eq_bool" else v_Vuna_dCompiler_dTypecheck_deqFnName n
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (n, sp), args, _) -> v_Vuna_dCompiler_dTypecheck_deqFnName n
  | _ -> "vuna_eq_generic"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1906 29 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dandThenListPair = fun fn v rest -> ((let vuna_cat0' = (fn) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (v) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (rest)

let rec v_Vuna_dCompiler_dTypecheck_deqPairConds = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], params) -> []
  | ((fty) :: (frest), (v) :: (rest), params) -> v_Vuna_dCompiler_dTypecheck_dandThenListPair (v_Vuna_dCompiler_dTypecheck_deqFieldFnSource params fty) v (v_Vuna_dCompiler_dTypecheck_deqPairConds frest rest params)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1914 1 ("no matching clause for Vuna.Compiler.Typecheck.eqPairConds")

let rec v_Vuna_dCompiler_dTypecheck_deqCondJoin = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> "(0 == 0)"
  | ((f) :: (rest), (w) :: (wrest)) -> (match v_Vuna_dCompiler_dTypecheck_deqCondJoin rest wrest with
  | "(0 == 0)" -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (w) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | more -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (w) in (let vuna_cat4' = (") && ") in (let vuna_cat5' = (more) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1923 39 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1922 1 ("no matching clause for Vuna.Compiler.Typecheck.eqCondJoin")

let v_Vuna_dCompiler_dTypecheck_deqCondSrc = fun params ftypes vvars wvars -> v_Vuna_dCompiler_dTypecheck_deqCondJoin (v_Vuna_dCompiler_dTypecheck_deqPairConds ftypes vvars params) wvars

let v_Vuna_dCompiler_dTypecheck_dstructuralEqClause = fun a0 a1 -> match (a0, a1) with
  | (params, C_Base_dPair_dPair (cname, ftypes)) -> (let n = v_Base_dList_dlength ftypes in (let vuna_cat0' = ("  ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dctorPatternSrc cname (v_Vuna_dCompiler_dTypecheck_dvarNames "v" n)) in (let vuna_cat2' = (" => case y of\n    ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dctorPatternSrc cname (v_Vuna_dCompiler_dTypecheck_dvarNames "w" n)) in (let vuna_cat4' = (" => ") in (let vuna_cat5' = (v_Vuna_dCompiler_dTypecheck_deqCondSrc params ftypes (v_Vuna_dCompiler_dTypecheck_dvarNames "v" n) (v_Vuna_dCompiler_dTypecheck_dvarNames "w" n)) in (let vuna_cat6' = ("\n    _ => (0 == 1)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1927 1 ("no matching clause for Vuna.Compiler.Typecheck.structuralEqClause")

let v_Vuna_dCompiler_dTypecheck_deqSigTypeSrc = fun sh -> (let tyName = v_Vuna_dCompiler_dTypecheck_dshapeName sh in (let params = v_Vuna_dCompiler_dTypecheck_dshapeParams sh in (match params with
  | [] -> tyName
  | _ -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (tyName) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dtcJoin " " params) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1945 6 ("case pattern match failure"))))

let v_Vuna_dCompiler_dTypecheck_dstructuralEqSrc = fun sh -> (let tyName = v_Vuna_dCompiler_dTypecheck_dshapeName sh in (let params = v_Vuna_dCompiler_dTypecheck_dshapeParams sh in (let vuna_cat0' = (v_Vuna_dCompiler_dTypecheck_deqFnName tyName) in (let vuna_cat1' = (" : ") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypecheck_deqSigTypeSrc sh) in (let vuna_cat3' = (" -> ") in (let vuna_cat4' = (v_Vuna_dCompiler_dTypecheck_deqSigTypeSrc sh) in (let vuna_cat5' = (" -> Bool\n") in (let vuna_cat6' = (v_Vuna_dCompiler_dTypecheck_deqFnName tyName) in (let vuna_cat7' = (" x y = case x of\n") in (let vuna_cat8' = (v_Vuna_dCompiler_dTypecheck_dtcJoin "\n" (v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dstructuralEqClause params) (v_Vuna_dCompiler_dTypecheck_dshapeCtors sh))) in (let vuna_cat9' = ("\n  _ => (0 == 1)\n") in (let vuna_cat10' = (v_Vuna_dCompiler_dTypecheck_dneqFnName tyName) in (let vuna_cat11' = (" : ") in (let vuna_cat12' = (v_Vuna_dCompiler_dTypecheck_deqSigTypeSrc sh) in (let vuna_cat13' = (" -> ") in (let vuna_cat14' = (v_Vuna_dCompiler_dTypecheck_deqSigTypeSrc sh) in (let vuna_cat15' = (" -> Bool\n") in (let vuna_cat16' = (v_Vuna_dCompiler_dTypecheck_dneqFnName tyName) in (let vuna_cat17' = (" x y = if ") in (let vuna_cat18' = (v_Vuna_dCompiler_dTypecheck_deqFnName tyName) in (let vuna_cat19' = (" x y then (0 == 1) else (0 == 0)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'; vuna_cat9'; vuna_cat10'; vuna_cat11'; vuna_cat12'; vuna_cat13'; vuna_cat14'; vuna_cat15'; vuna_cat16'; vuna_cat17'; vuna_cat18'; vuna_cat19']))))))))))))))))))))))

let v_Vuna_dCompiler_dTypecheck_dstructuralSrcs = fun shapes supported eqSupported -> v_Base_dList_dconcatMap (fun sh -> v_Base_dList_dappend (if v_Base_dList_dmemName (v_Vuna_dCompiler_dTypecheck_dshapeName sh) supported then (v_Vuna_dCompiler_dTypecheck_dstructuralShowSrc sh) :: ([]) else []) (if v_Base_dList_dmemName (v_Vuna_dCompiler_dTypecheck_dshapeName sh) eqSupported then (v_Vuna_dCompiler_dTypecheck_dstructuralEqSrc sh) :: ([]) else [])) shapes

let v_Vuna_dCompiler_dTypecheck_dbuiltinHelperSrc = "vuna_show_int n = strFromInt n
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

let v_Vuna_dCompiler_dTypecheck_dparseGenerated = fun src -> (match v_Vuna_dCompiler_dParser_dparseSource "<generated>" src with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((("internal generated source error: ") ^ (e)))
  | C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dSource (hdr, imports, decls)) -> (match hdr with
  | C_Base_dMaybe_dJust (h) -> C_Base_dResult_dErr ("internal generated source error: unexpected module header")
  | C_Base_dMaybe_dNothing -> (match imports with
  | [] -> C_Base_dResult_dOk (decls)
  | _ -> C_Base_dResult_dErr ("internal generated source error: unexpected imports")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2005 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2003 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2001 22 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dmethodClauses = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then (C_Base_dPair_dPair (pats, body)) :: (v_Vuna_dCompiler_dTypecheck_dmethodClauses name rest) else v_Vuna_dCompiler_dTypecheck_dmethodClauses name rest
  | _ -> v_Vuna_dCompiler_dTypecheck_dmethodClauses name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2011 34 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2010 1 ("no matching clause for Vuna.Compiler.Typecheck.methodClauses")

let rec v_Vuna_dCompiler_dTypecheck_dsubstTyParam = fun paramName headTy ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> if v_vuna_ueq_ustr n paramName then headTy else C_Vuna_dCompiler_dAst_dEVar (n, sp)
  | C_Vuna_dCompiler_dAst_dEApp (f, args, sp) -> C_Vuna_dCompiler_dAst_dEApp (v_Vuna_dCompiler_dTypecheck_dsubstTyParam paramName headTy f, v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dsubstTyParam paramName headTy) args, sp)
  | _ -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2016 36 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dinstanceHeadParts = fun headExpr -> (match headExpr with
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (traitName, sp), (headTy) :: ([]), _) -> C_Base_dResult_dOk (C_Base_dPair_dPair (traitName, headTy))
  | _ -> C_Base_dResult_dErr ("invalid instance head (expected `instance Trait Type`)")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2022 30 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dinstanceNameFor = fun isDefault iname -> (match iname with
  | C_Base_dMaybe_dJust (n) -> if isDefault then C_Base_dMaybe_dNothing else C_Base_dMaybe_dJust (n)
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2026 35 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dinstKeyOf = fun isDefault iname headTy -> if isDefault then (("d_") ^ (v_Vuna_dCompiler_dTypecheck_dsanitizeSym (v_Vuna_dCompiler_dTypecheck_drenderTyExpr headTy))) else (match iname with
  | C_Base_dMaybe_dJust (n) -> v_Vuna_dCompiler_dTypecheck_dsanitizeSym n
  | C_Base_dMaybe_dNothing -> (("d_") ^ (v_Vuna_dCompiler_dTypecheck_dsanitizeSym (v_Vuna_dCompiler_dTypecheck_drenderTyExpr headTy)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2031 6 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dimplNameOf = fun instKey methodShort -> (let vuna_cat0' = ("vuna_inst_") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dsanitizeSym instKey) in (let vuna_cat2' = ("_") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dsanitizeSym methodShort) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let rec v_Vuna_dCompiler_dTypecheck_dunknownMethodNames = fun a0 a1 -> match (a0, a1) with
  | (known, []) -> []
  | (known, (d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> if v_Base_dList_dmemName n known then v_Vuna_dCompiler_dTypecheck_dunknownMethodNames known rest else (n) :: (v_Vuna_dCompiler_dTypecheck_dunknownMethodNames known rest)
  | C_Vuna_dCompiler_dAst_dDSig (n, ty, sp) -> v_Vuna_dCompiler_dTypecheck_dunknownMethodNames known rest
  | _ -> v_Vuna_dCompiler_dTypecheck_dunknownMethodNames known rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2039 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2038 1 ("no matching clause for Vuna.Compiler.Typecheck.unknownMethodNames")

let v_Vuna_dCompiler_dTypecheck_dclauseDecl = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (implName, C_Base_dPair_dPair (pats, body), sp) -> C_Vuna_dCompiler_dAst_dDFun (implName, pats, body, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2045 1 ("no matching clause for Vuna.Compiler.Typecheck.clauseDecl")

let rec v_Vuna_dCompiler_dTypecheck_dinstanceImplsGo = fun a0 a1 a2 a3 a4 a5 a6 a7 a8 -> match (a0, a1, a2, a3, a4, a5, a6, a7, a8) with
  | (typeNames, traitDecl, headTyExpr, methods, instKey, sp, [], decls, impls) -> (match v_Vuna_dCompiler_dTypecheck_dunknownMethodNames (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_dmethodInfoName (v_Vuna_dCompiler_dTypecheck_dtraitDeclMethods traitDecl)) methods with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse impls, v_Base_dList_dreverse decls))
  | (bad) :: (rest) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": instance has unknown method ") in (let vuna_cat2' = (bad) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2051 84 ("case pattern match failure"))
  | (typeNames, traitDecl, headTyExpr, methods, instKey, sp, (info) :: (rest), decls, impls) -> (let short = v_Vuna_dCompiler_dTypecheck_dmethodInfoName info in (let clauses = v_Vuna_dCompiler_dTypecheck_dmethodClauses short methods in (match clauses with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": instance is missing method ") in (let vuna_cat2' = (short) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> (let implName = v_Vuna_dCompiler_dTypecheck_dimplNameOf instKey short in (let sigTy = v_Vuna_dCompiler_dTypecheck_dsubstTyParam (v_Vuna_dCompiler_dTypecheck_dtraitDeclParam traitDecl) headTyExpr (v_Vuna_dCompiler_dTypecheck_dmethodInfoSig info) in (let sigDecl = C_Vuna_dCompiler_dAst_dDSig (implName, sigTy, sp) in (let funDecls = v_Base_dList_dmap (fun c -> v_Vuna_dCompiler_dTypecheck_dclauseDecl implName c sp) clauses in v_Vuna_dCompiler_dTypecheck_dinstanceImplsGo typeNames traitDecl headTyExpr methods instKey sp rest (v_Base_dList_dappend ((sigDecl) :: (v_Base_dList_dappend funDecls [])) decls) ((C_Base_dPair_dPair (short, implName)) :: (impls))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2059 6 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2051 1 ("no matching clause for Vuna.Compiler.Typecheck.instanceImplsGo")

let v_Vuna_dCompiler_dTypecheck_dinstanceImpls = fun typeNames traitDecl headTyExpr methods instKey sp -> v_Vuna_dCompiler_dTypecheck_dinstanceImplsGo typeNames traitDecl headTyExpr methods instKey sp (v_Vuna_dCompiler_dTypecheck_dtraitDeclMethods traitDecl) [] []

let v_Vuna_dCompiler_dTypecheck_dpreludeModule = "<prelude>"

let v_Vuna_dCompiler_dTypecheck_disBuiltinTypeName = fun name -> (if ((if ((if (v_vuna_ueq_ustr name "Int") then true else (v_vuna_ueq_ustr name "String"))) then true else (v_vuna_ueq_ustr name "Bool"))) then true else (v_vuna_ueq_ustr name "List"))

let v_Vuna_dCompiler_dTypecheck_dtyOuterName = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> v_Vuna_dCompiler_dTypecheck_dmodulePrefixOf n
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2087 18 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dtyOuterTypeName = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon (n, args) -> n
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2091 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dorphanAllowed = fun instModule traitName headTy -> (let traitModule = if v_Base_dList_dmemName traitName (("Show") :: (("Eq") :: (("Ord") :: ([])))) then v_Vuna_dCompiler_dTypecheck_dpreludeModule else v_Vuna_dCompiler_dTypecheck_dmodulePrefixOf traitName in (let outerName = v_Vuna_dCompiler_dTypecheck_dtyOuterTypeName headTy in (let headModule = if v_Vuna_dCompiler_dTypecheck_disBuiltinTypeName outerName then v_Vuna_dCompiler_dTypecheck_dpreludeModule else v_Vuna_dCompiler_dTypecheck_dmodulePrefixOf outerName in (if (v_vuna_ueq_ustr instModule traitModule) then true else (v_vuna_ueq_ustr instModule headModule)))))

let rec v_Vuna_dCompiler_dTypecheck_dtypeArityOf = fun decls name -> (match decls with
  | [] -> 0
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dn, params, kind, ctors, derivings, sp) -> if v_vuna_ueq_ustr dn name then v_Base_dList_dlength params else v_Vuna_dCompiler_dTypecheck_dtypeArityOf rest name
  | C_Vuna_dCompiler_dAst_dDRecord (dn, params, fields, derivings, sp) -> if v_vuna_ueq_ustr dn name then v_Base_dList_dlength params else v_Vuna_dCompiler_dTypecheck_dtypeArityOf rest name
  | _ -> v_Vuna_dCompiler_dTypecheck_dtypeArityOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2098 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2096 26 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_ddeclDefName = fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> name
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> name
  | _ -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2106 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_ddeclNamesOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match v_Vuna_dCompiler_dTypecheck_ddeclDefName d with
  | "" -> v_Vuna_dCompiler_dTypecheck_ddeclNamesOf rest
  | n -> (n) :: (v_Vuna_dCompiler_dTypecheck_ddeclNamesOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2112 27 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2111 1 ("no matching clause for Vuna.Compiler.Typecheck.declNamesOf")

let v_Vuna_dCompiler_dTypecheck_ddeclOwners = fun owner decls -> v_Base_dList_dmap (fun n -> C_Base_dPair_dPair (n, owner)) (v_Vuna_dCompiler_dTypecheck_ddeclNamesOf decls)

let v_Vuna_dCompiler_dTypecheck_dinstanceOwnerOf = fun iname -> (match iname with
  | C_Base_dMaybe_dJust (n) -> v_Vuna_dCompiler_dTypecheck_dmodulePrefixOf n
  | C_Base_dMaybe_dNothing -> ""
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2118 25 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_ddefaultInstanceAllowed = fun derivedType derivings traitName supported sp -> if v_Base_dList_dmemName (v_Vuna_dCompiler_dTypecheck_dtyOuterTypeName (C_Vuna_dCompiler_dTypecheck_dTCon (derivedType, []))) supported then if v_Base_dList_dmemName traitName (("Show") :: (("Eq") :: ([]))) then C_Base_dResult_dOk ([]) else C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": deriving only supports Show/Eq in M10.5 (got ") in (let vuna_cat2' = (traitName) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": deriving ") in (let vuna_cat2' = (traitName) in (let vuna_cat3' = (" is not supported for type ") in (let vuna_cat4' = (derivedType) in (let vuna_cat5' = (" (fields must be Int/String/Bool or data types built from them)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))

let v_Vuna_dCompiler_dTypecheck_dderivingImpls = fun traitName tyName -> (match traitName with
  | "Show" -> (C_Base_dPair_dPair ("show", v_Vuna_dCompiler_dTypecheck_dshowFnName tyName)) :: ([])
  | "Eq" -> (C_Base_dPair_dPair ("eq", v_Vuna_dCompiler_dTypecheck_deqFnName tyName)) :: ((C_Base_dPair_dPair ("neq", v_Vuna_dCompiler_dTypecheck_dneqFnName tyName)) :: ([]))
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2179 34 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_ddataHeadTy = fun a0 a1 -> match (a0, a1) with
  | (tyName, []) -> C_Vuna_dCompiler_dTypecheck_dTCon (tyName, [])
  | (tyName, params) -> C_Vuna_dCompiler_dTypecheck_dTCon (tyName, v_Base_dList_dmap (fun p -> C_Vuna_dCompiler_dTypecheck_dTVar (0)) params)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2207 1 ("no matching clause for Vuna.Compiler.Typecheck.dataHeadTy")

let rec v_Vuna_dCompiler_dTypecheck_dcollectDerivingsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (supported, eqSupported, [], insts) -> C_Base_dResult_dOk (v_Base_dList_dreverse insts)
  | (supported, eqSupported, (d) :: (rest), insts) -> (match v_Vuna_dCompiler_dAst_ddeclDerivings d with
  | [] -> v_Vuna_dCompiler_dTypecheck_dcollectDerivingsGo supported eqSupported rest insts
  | derivings -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (tyName, params, kind, ctors, derivings2, sp) -> v_Vuna_dCompiler_dTypecheck_dcollectDerivingNames supported eqSupported tyName params derivings sp insts rest
  | _ -> v_Vuna_dCompiler_dTypecheck_dcollectDerivingsGo supported eqSupported rest insts
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2189 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2187 62 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2186 1 ("no matching clause for Vuna.Compiler.Typecheck.collectDerivingsGo")
and v_Vuna_dCompiler_dTypecheck_dcollectDerivingNames = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (supported, eqSupported, tyName, params, [], sp, insts, rest) -> v_Vuna_dCompiler_dTypecheck_dcollectDerivingsGo supported eqSupported rest insts
  | (supported, eqSupported, tyName, params, (traitName) :: (drest), sp, insts, rest) -> if (if (v_vuna_ueq_ustr traitName "Show") then ((fun vuna_uneq_ula vuna_uneq_ulb -> if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_ustr vuna_ueq_ulh vuna_ueq_ulh2) then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2) else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in vuna_ueq_ulist_ugo)) vuna_uneq_ula vuna_uneq_ulb then bi_eq_int 0 1 else bi_eq_int 0 0) params []) else false) then C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": deriving Show is only supported for non-parameterized data types"))) else (let allowedSet = if v_vuna_ueq_ustr traitName "Eq" then eqSupported else supported in (match v_Vuna_dCompiler_dTypecheck_ddefaultInstanceAllowed tyName drest traitName allowedSet sp with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (_) -> v_Vuna_dCompiler_dTypecheck_dcollectDerivingNames supported eqSupported tyName params drest sp ((C_Vuna_dCompiler_dTypecheck_dTraitInst (traitName, C_Base_dMaybe_dNothing, v_Vuna_dCompiler_dTypecheck_ddataHeadTy tyName params, v_Vuna_dCompiler_dTypecheck_dderivingImpls traitName tyName)) :: (insts)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2200 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2194 1 ("no matching clause for Vuna.Compiler.Typecheck.collectDerivingNames")

let v_Vuna_dCompiler_dTypecheck_dcollectDerivings = fun supported eqSupported decls -> v_Vuna_dCompiler_dTypecheck_dcollectDerivingsGo supported eqSupported decls []

let v_Vuna_dCompiler_dTypecheck_dinstUniqueKey = fun inst -> (match v_Vuna_dCompiler_dTypecheck_dinstNameOf inst with
  | C_Base_dMaybe_dJust (n) -> (("named|") ^ (n))
  | C_Base_dMaybe_dNothing -> (let vuna_cat0' = ("default|") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dinstTraitName inst) in (let vuna_cat2' = ("|") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy (v_Vuna_dCompiler_dTypecheck_dinstHeadTy inst)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2210 22 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dcheckInstUniqueness = fun a0 a1 -> match (a0, a1) with
  | ([], seen) -> C_Base_dResult_dOk ([])
  | ((inst) :: (rest), seen) -> (let key = v_Vuna_dCompiler_dTypecheck_dinstUniqueKey inst in if v_Base_dList_dmemName key seen then C_Base_dResult_dErr ((let vuna_cat0' = ("duplicate instance: ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dinstTraitName inst) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy (v_Vuna_dCompiler_dTypecheck_dinstHeadTy inst)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else v_Vuna_dCompiler_dTypecheck_dcheckInstUniqueness rest ((key) :: (seen)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2214 1 ("no matching clause for Vuna.Compiler.Typecheck.checkInstUniqueness")

let rec v_Vuna_dCompiler_dTypecheck_dstripTraitDecls = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDTrait (n, p, ms, sp) -> v_Vuna_dCompiler_dTypecheck_dstripTraitDecls rest
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, methods, sp) -> v_Vuna_dCompiler_dTypecheck_dstripTraitDecls rest
  | _ -> (d) :: (v_Vuna_dCompiler_dTypecheck_dstripTraitDecls rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2222 31 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2221 1 ("no matching clause for Vuna.Compiler.Typecheck.stripTraitDecls")

let v_Vuna_dCompiler_dTypecheck_dstructuralOwnersOf = fun supported eqSupported sh -> (let tyName = v_Vuna_dCompiler_dTypecheck_dshapeName sh in (let owner = v_Vuna_dCompiler_dTypecheck_dmodulePrefixOf tyName in v_Base_dList_dappend (if v_Base_dList_dmemName tyName supported then (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dshowFnName tyName, owner)) :: ([]) else []) (if v_Base_dList_dmemName tyName eqSupported then (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_deqFnName tyName, owner)) :: ((C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dneqFnName tyName, owner)) :: ([])) else [])))

let v_Vuna_dCompiler_dTypecheck_dstructuralOwners = fun shapes supported eqSupported -> v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypecheck_dstructuralOwnersOf supported eqSupported) shapes

let rec v_Vuna_dCompiler_dTypecheck_dtotalConstraints = fun a0 -> match a0 with
  | ([]) -> 0
  | ((C_Base_dPair_dPair (name, C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty))) :: (rest)) -> bi_add (v_Base_dList_dlength cons) (v_Vuna_dCompiler_dTypecheck_dtotalConstraints rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2266 1 ("no matching clause for Vuna.Compiler.Typecheck.totalConstraints")

let rec v_Vuna_dCompiler_dTypecheck_dfirstArityMismatch = fun a0 a1 -> match (a0, a1) with
  | (expected, []) -> C_Base_dMaybe_dNothing
  | (expected, (C_Base_dPair_dPair (pats, body)) :: (rest)) -> if v_vuna_ueq_uint (v_Base_dList_dlength pats) expected then v_Vuna_dCompiler_dTypecheck_dfirstArityMismatch expected rest else C_Base_dMaybe_dJust (v_Vuna_dCompiler_dAst_dexprSpan body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2281 1 ("no matching clause for Vuna.Compiler.Typecheck.firstArityMismatch")

let rec v_Vuna_dCompiler_dTypecheck_dcheckClauseAritiesFor = fun a0 a1 -> match (a0, a1) with
  | ([], decls) -> C_Base_dResult_dOk ([])
  | ((name) :: (rest), decls) -> (match v_Vuna_dCompiler_dAst_dclausesFor decls name with
  | [] -> v_Vuna_dCompiler_dTypecheck_dcheckClauseAritiesFor rest decls
  | (C_Base_dPair_dPair (pats, body)) :: (_) -> (match v_Vuna_dCompiler_dTypecheck_dfirstArityMismatch (v_Base_dList_dlength pats) (v_Vuna_dCompiler_dAst_dclausesFor decls name) with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dcheckClauseAritiesFor rest decls
  | C_Base_dMaybe_dJust (sp) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": clauses for ") in (let vuna_cat2' = (name) in (let vuna_cat3' = (" have different arities") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2277 28 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2275 46 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2274 1 ("no matching clause for Vuna.Compiler.Typecheck.checkClauseAritiesFor")

let v_Vuna_dCompiler_dTypecheck_dcheckClauseArities = fun decls -> v_Vuna_dCompiler_dTypecheck_dcheckClauseAritiesFor (v_Vuna_dCompiler_dTypecheck_dfunctionNames decls) decls

let rec v_Vuna_dCompiler_dTypecheck_dpatVarsTy = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dAst_dPVar (n, _), ty) -> (C_Base_dPair_dPair (n, ty)) :: ([])
  | (C_Vuna_dCompiler_dAst_dPCon (_, subpats, _), ty) -> v_Vuna_dCompiler_dTypecheck_dsubPatsVarNames subpats ty
  | (_, ty) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2388 1 ("no matching clause for Vuna.Compiler.Typecheck.patVarsTy")
and v_Vuna_dCompiler_dTypecheck_dsubPatsVarNames = fun a0 a1 -> match (a0, a1) with
  | ([], ty) -> []
  | ((p) :: (rest), ty) -> v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dpatVarsTy p ty) (v_Vuna_dCompiler_dTypecheck_dsubPatsVarNames rest ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2392 1 ("no matching clause for Vuna.Compiler.Typecheck.subPatsVarNames")

let v_Vuna_dCompiler_dTypecheck_dbindWarnings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, decls, C_Base_dPair_dPair (pat, value)) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPVar (n, _) -> []
  | C_Vuna_dCompiler_dAst_dPWild (_) -> []
  | _ -> (((v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dpatSpan pat)) ^ (": non-exhaustive let pattern"))) :: ([])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2395 47 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2395 1 ("no matching clause for Vuna.Compiler.Typecheck.bindWarnings")

let v_Vuna_dCompiler_dTypecheck_dfirstPat = fun a0 -> match a0 with
  | ((p) :: (rest)) -> p
  | ([]) -> C_Vuna_dCompiler_dAst_dPWild (C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2439 1 ("no matching clause for Vuna.Compiler.Typecheck.firstPat")

let rec v_Vuna_dCompiler_dTypecheck_dnthOrWild = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Vuna_dCompiler_dAst_dPWild (C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | (0, (p) :: (rest)) -> p
  | (i, (p) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dnthOrWild (bi_sub i 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2442 1 ("no matching clause for Vuna.Compiler.Typecheck.nthOrWild")

let v_Vuna_dCompiler_dTypecheck_dclausePatAt = fun a0 a1 -> match (a0, a1) with
  | (i, C_Base_dPair_dPair (pats, body)) -> v_Vuna_dCompiler_dTypecheck_dnthOrWild i pats
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2423 1 ("no matching clause for Vuna.Compiler.Typecheck.clausePatAt")

let v_Vuna_dCompiler_dTypecheck_ddropFirstPat = fun a0 -> match a0 with
  | (C_Base_dPair_dPair (pats, body)) -> (match pats with
  | [] -> C_Base_dPair_dPair ([], body)
  | (p) :: (pr) -> C_Base_dPair_dPair (pr, body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2446 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2446 1 ("no matching clause for Vuna.Compiler.Typecheck.dropFirstPat")

let rec v_Vuna_dCompiler_dTypecheck_dctorNamesOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dn, params, kind, ctors, _, _) -> if v_vuna_ueq_ustr dn name then v_Base_dList_dmap v_Vuna_dCompiler_dAst_dctorName ctors else v_Vuna_dCompiler_dTypecheck_dctorNamesOf rest name
  | _ -> v_Vuna_dCompiler_dTypecheck_dctorNamesOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2455 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2454 1 ("no matching clause for Vuna.Compiler.Typecheck.ctorNamesOf")

let v_Vuna_dCompiler_dTypecheck_dtyCtorNames = fun decls ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon (name, _) -> v_Vuna_dCompiler_dTypecheck_dctorNamesOf decls name
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2450 24 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dpatCoversCtor = fun c p -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (n, _) -> true
  | C_Vuna_dCompiler_dAst_dPWild (_) -> true
  | C_Vuna_dCompiler_dAst_dPCon (pn, subpats, _) -> v_vuna_ueq_ustr pn c
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2465 21 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dctorCovered = fun a0 a1 -> match (a0, a1) with
  | (c, []) -> false
  | (c, (p) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_dpatCoversCtor c p then true else v_Vuna_dCompiler_dTypecheck_dctorCovered c rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2462 1 ("no matching clause for Vuna.Compiler.Typecheck.ctorCovered")

let rec v_Vuna_dCompiler_dTypecheck_dallCtorsCovered = fun a0 a1 -> match (a0, a1) with
  | (pats, []) -> true
  | (pats, (c) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_dctorCovered c pats then v_Vuna_dCompiler_dTypecheck_dallCtorsCovered pats rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2459 1 ("no matching clause for Vuna.Compiler.Typecheck.allCtorsCovered")

let rec v_Vuna_dCompiler_dTypecheck_dhasCatchAll = fun a0 -> match a0 with
  | ([]) -> false
  | ((p) :: (rest)) -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (n, _) -> true
  | C_Vuna_dCompiler_dAst_dPWild (_) -> true
  | _ -> v_Vuna_dCompiler_dTypecheck_dhasCatchAll rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2472 27 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2471 1 ("no matching clause for Vuna.Compiler.Typecheck.hasCatchAll")

let v_Vuna_dCompiler_dTypecheck_dsubsumes = fun earlier p -> (match earlier with
  | C_Vuna_dCompiler_dAst_dPVar (n, _) -> true
  | C_Vuna_dCompiler_dAst_dPWild (_) -> true
  | C_Vuna_dCompiler_dAst_dPCon (en, subpats, _) -> (match p with
  | C_Vuna_dCompiler_dAst_dPCon (pn, ps2, _) -> v_vuna_ueq_ustr en pn
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2491 24 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2488 22 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_danySubsumes = fun a0 a1 -> match (a0, a1) with
  | (p, []) -> false
  | (p, (earlier) :: (rest)) -> if v_Vuna_dCompiler_dTypecheck_dsubsumes earlier p then true else v_Vuna_dCompiler_dTypecheck_danySubsumes p rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2485 1 ("no matching clause for Vuna.Compiler.Typecheck.anySubsumes")

let rec v_Vuna_dCompiler_dTypecheck_dredWarn = fun a0 a1 -> match (a0, a1) with
  | (prefix, []) -> []
  | (prefix, (p) :: (rest)) -> (let more = v_Vuna_dCompiler_dTypecheck_dredWarn (v_Base_dList_dappend prefix ((p) :: ([]))) rest in if v_Vuna_dCompiler_dTypecheck_danySubsumes p prefix then (((v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dpatSpan p)) ^ (": redundant pattern"))) :: (more) else more)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2479 1 ("no matching clause for Vuna.Compiler.Typecheck.redWarn")

let v_Vuna_dCompiler_dTypecheck_dredundantWarnings = fun pats -> v_Vuna_dCompiler_dTypecheck_dredWarn [] pats

let v_Vuna_dCompiler_dTypecheck_dcoverageWarnings = fun decls ty posPats -> (let ctors = v_Vuna_dCompiler_dTypecheck_dtyCtorNames decls ty in if v_vuna_ueq_ugeneric ctors [] then [] else if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uVuna_uCompiler_uAst_uPat vuna_ueq_ulh vuna_ueq_ulh2) then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2) else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in vuna_ueq_ulist_ugo)) posPats [] then [] else (let exhaustive = (if (v_Vuna_dCompiler_dTypecheck_dhasCatchAll posPats) then true else (v_Vuna_dCompiler_dTypecheck_dallCtorsCovered posPats ctors)) in (let nonEx = if exhaustive then [] else (((v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dpatSpan (v_Vuna_dCompiler_dTypecheck_dfirstPat posPats))) ^ (": non-exhaustive function clauses"))) :: ([]) in v_Base_dList_dappend nonEx (v_Vuna_dCompiler_dTypecheck_dredundantWarnings posPats))))

let rec v_Vuna_dCompiler_dTypecheck_dfunCoverageWarnings = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, [], clauses) -> []
  | (decls, (ty) :: (rest), clauses) -> (let posPats = v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dclausePatAt 0) clauses in (let w1 = v_Vuna_dCompiler_dTypecheck_dcoverageWarnings decls ty posPats in v_Base_dList_dappend w1 (v_Vuna_dCompiler_dTypecheck_dfunCoverageWarnings decls rest (v_Base_dList_dmap v_Vuna_dCompiler_dTypecheck_ddropFirstPat clauses))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2415 1 ("no matching clause for Vuna.Compiler.Typecheck.funCoverageWarnings")

let rec v_Vuna_dCompiler_dTypecheck_dpatVarNames = fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (n, _) -> (n) :: ([])
  | C_Vuna_dCompiler_dAst_dPCon (_, subpats, _) -> v_Base_dList_dconcatMap v_Vuna_dCompiler_dTypecheck_dpatVarNames subpats
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2499 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dpatsVarNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dpatVarNames p) (v_Vuna_dCompiler_dTypecheck_dpatsVarNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2496 1 ("no matching clause for Vuna.Compiler.Typecheck.patsVarNames")

let rec v_Vuna_dCompiler_dTypecheck_dzipLocals = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> []
  | ((n) :: (ns), (t) :: (ts)) -> (C_Base_dPair_dPair (n, t)) :: (v_Vuna_dCompiler_dTypecheck_dzipLocals ns ts)
  | (_, _) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2504 1 ("no matching clause for Vuna.Compiler.Typecheck.zipLocals")

let v_Vuna_dCompiler_dTypecheck_dschemeTy = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2508 1 ("no matching clause for Vuna.Compiler.Typecheck.schemeTy")

let rec v_Vuna_dCompiler_dTypecheck_dflattenFun = fun ty -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTFun (a, b) -> (a) :: (v_Vuna_dCompiler_dTypecheck_dflattenFun b)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2510 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dcollectData = fun decls -> C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_ddeclDataNames decls, decls)

let v_Vuna_dCompiler_dTypecheck_dshortTyName = fun name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (rev, base) -> base
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2516 20 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dheadCtorMatches = fun patternTy ty -> (match patternTy with
  | C_Vuna_dCompiler_dTypecheck_dTCon (pn, pargs) -> if v_vuna_ueq_uBase_uList_uList pargs [] then (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon (tn, targs) -> v_vuna_ueq_ugeneric (v_Vuna_dCompiler_dTypecheck_dshortTyName pn) (v_Vuna_dCompiler_dTypecheck_dshortTyName tn)
  | C_Vuna_dCompiler_dTypecheck_dTApp (head, args) -> (match head with
  | C_Vuna_dCompiler_dTypecheck_dTCon (tn, hargs) -> v_vuna_ueq_ugeneric (v_Vuna_dCompiler_dTypecheck_dshortTyName pn) (v_Vuna_dCompiler_dTypecheck_dshortTyName tn)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 576 23 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 574 40 ("case pattern match failure")) else v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern patternTy ty
  | _ -> v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern patternTy ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 573 32 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dinstHeadMatches = fun arity headTy ty -> if v_vuna_ugt_uint arity 0 then v_Vuna_dCompiler_dTypecheck_dheadCtorMatches headTy ty else v_Vuna_dCompiler_dTypecheck_dtyMatchesPattern headTy ty

let rec v_Vuna_dCompiler_dTypecheck_dfindDefaultInst = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (arity, tr, ty, []) -> C_Base_dMaybe_dNothing
  | (arity, tr, ty, (inst) :: (rest)) -> (match v_Vuna_dCompiler_dTypecheck_dinstNameOf inst with
  | C_Base_dMaybe_dNothing -> if (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypecheck_dinstTraitName inst) tr) then (v_Vuna_dCompiler_dTypecheck_dinstHeadMatches arity (v_Vuna_dCompiler_dTypecheck_dinstHeadTy inst) ty) else false) then C_Base_dMaybe_dJust (inst) else v_Vuna_dCompiler_dTypecheck_dfindDefaultInst arity tr ty rest
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dTypecheck_dfindDefaultInst arity tr ty rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1642 46 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1641 1 ("no matching clause for Vuna.Compiler.Typecheck.findDefaultInst")

let v_Vuna_dCompiler_dTypecheck_dconcreteMethodName = fun tctx ty tr key -> (let arity = v_Vuna_dCompiler_dTypecheck_dtraitArityOf tctx tr in (match v_Vuna_dCompiler_dTypecheck_dfindDefaultInst arity tr ty (v_Vuna_dCompiler_dTypecheck_dtraitCtxInsts tctx) with
  | C_Base_dMaybe_dJust (inst) -> (match v_Vuna_dCompiler_dTypecheck_dlookupImpl (v_Vuna_dCompiler_dTypecheck_dlastSeg key) (v_Vuna_dCompiler_dTypecheck_dinstImpls inst) with
  | C_Base_dMaybe_dJust (fn) -> C_Base_dResult_dOk (fn)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("instance ") in (let vuna_cat1' = (tr) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy ty) in (let vuna_cat4' = (" does not implement ") in (let vuna_cat5' = (key) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 587 18 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> (match tr with
  | "Show" -> v_Vuna_dCompiler_dTypecheck_dshowFallback tctx ty
  | "Eq" -> v_Vuna_dCompiler_dTypecheck_deqFallback tctx ty key
  | "Ord" -> v_Vuna_dCompiler_dTypecheck_dordFallback tctx ty key
  | _ -> C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dnoInstanceMsg tctx tr ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 590 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 586 6 ("case pattern match failure")))

let rec v_Vuna_dCompiler_dTypecheck_deqMethodExprFor = fun tctx ty -> (match v_Vuna_dCompiler_dTypecheck_dtraitMethodExpr tctx ty "Eq" "eq" with
  | C_Base_dResult_dOk (e) -> e
  | C_Base_dResult_dErr (_) -> C_Vuna_dCompiler_dAst_dEVar ("vuna_eq_generic", v_Vuna_dCompiler_dTypecheck_dtcNoSpan)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 468 27 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_deqListExpr = fun tctx elemTy -> (let goName = "vuna_eq_list_go" in (let x = "vuna_eq_lx" in (let y = "vuna_eq_ly" in (let h = "vuna_eq_lh" in (let t = "vuna_eq_lt" in (let h2 = "vuna_eq_lh2" in (let t2 = "vuna_eq_lt2" in (let elemEq = v_Vuna_dCompiler_dTypecheck_deqMethodExprFor tctx elemTy in (let recCall = C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (goName, v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (C_Vuna_dCompiler_dAst_dEVar (t, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dCompiler_dAst_dEVar (t2, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan) in (let consBody = C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("&&", v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (C_Vuna_dCompiler_dAst_dEApp (elemEq, (C_Vuna_dCompiler_dAst_dEVar (h, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dCompiler_dAst_dEVar (h2, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((recCall) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan) in (let consCase = C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar (y, v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon ("Cons", (C_Vuna_dCompiler_dAst_dPVar (h2, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dCompiler_dAst_dPVar (t2, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan), consBody)) :: ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPWild (v_Vuna_dCompiler_dTypecheck_dtcNoSpan), v_Vuna_dCompiler_dTypecheck_dboolFalseExpr)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan) in (let nilCase = C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar (y, v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon ("Nil", [], v_Vuna_dCompiler_dTypecheck_dtcNoSpan), v_Vuna_dCompiler_dTypecheck_dboolTrueExpr)) :: ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPWild (v_Vuna_dCompiler_dTypecheck_dtcNoSpan), v_Vuna_dCompiler_dTypecheck_dboolFalseExpr)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan) in (let goBody = C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar (x, v_Vuna_dCompiler_dTypecheck_dtcNoSpan), (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon ("Nil", [], v_Vuna_dCompiler_dTypecheck_dtcNoSpan), nilCase)) :: ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon ("Cons", (C_Vuna_dCompiler_dAst_dPVar (h, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dCompiler_dAst_dPVar (t, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan), consCase)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan) in C_Vuna_dCompiler_dAst_dELet ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPVar (goName, v_Vuna_dCompiler_dTypecheck_dtcNoSpan), C_Vuna_dCompiler_dAst_dELam ((x) :: ((y) :: ([])), goBody, v_Vuna_dCompiler_dTypecheck_dtcNoSpan))) :: ([]), C_Vuna_dCompiler_dAst_dEVar (goName, v_Vuna_dCompiler_dTypecheck_dtcNoSpan), true, v_Vuna_dCompiler_dTypecheck_dtcNoSpan))))))))))))))
and v_Vuna_dCompiler_dTypecheck_dlistNeqExpr = fun tctx elemTy -> (let eqExpr = v_Vuna_dCompiler_dTypecheck_deqListExpr tctx elemTy in (let a = "vuna_neq_la" in (let b = "vuna_neq_lb" in (let cond = C_Vuna_dCompiler_dAst_dEApp (eqExpr, (C_Vuna_dCompiler_dAst_dEVar (a, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ((C_Vuna_dCompiler_dAst_dEVar (b, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)) :: ([])), v_Vuna_dCompiler_dTypecheck_dtcNoSpan) in C_Vuna_dCompiler_dAst_dELam ((a) :: ((b) :: ([])), C_Vuna_dCompiler_dAst_dEIf (cond, v_Vuna_dCompiler_dTypecheck_dboolFalseExpr, v_Vuna_dCompiler_dTypecheck_dboolTrueExpr, v_Vuna_dCompiler_dTypecheck_dtcNoSpan), v_Vuna_dCompiler_dTypecheck_dtcNoSpan)))))
and v_Vuna_dCompiler_dTypecheck_dtraitMethodExpr = fun tctx ty tr key -> if v_vuna_ugt_uint (v_Vuna_dCompiler_dTypecheck_dtraitArityOf tctx tr) 0 then v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconcreteMethodName tctx ty tr key) (fun fn -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEVar (fn, v_Vuna_dCompiler_dTypecheck_dtcNoSpan))) else if (fun vuna_uneq_ula vuna_uneq_ulb -> if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uint vuna_ueq_ulh vuna_ueq_ulh2) then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2) else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in vuna_ueq_ulist_ugo)) vuna_uneq_ula vuna_uneq_ulb then bi_eq_int 0 1 else bi_eq_int 0 0) (v_Vuna_dCompiler_dTypecheck_dfreeVarsTy ty) [] then (match v_Vuna_dCompiler_dTypecheck_dgenericMethodName tr key with
  | C_Base_dMaybe_dJust (fn) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEVar (fn, v_Vuna_dCompiler_dTypecheck_dtcNoSpan))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("trait method ") in (let vuna_cat1' = (key) in (let vuna_cat2' = (" used at a polymorphic type (only Eq/Ord have a generic fallback in M10.5)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 559 34 ("case pattern match failure")) else (match tr with
  | "Eq" -> (match ty with
  | C_Vuna_dCompiler_dTypecheck_dTCon ("List", (elemTy) :: ([])) -> if v_vuna_ueq_ustr key "neq" then C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dlistNeqExpr tctx elemTy) else C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_deqListExpr tctx elemTy)
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconcreteMethodName tctx ty tr key) (fun fn -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEVar (fn, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 566 11 ("case pattern match failure"))
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconcreteMethodName tctx ty tr key) (fun fn -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEVar (fn, v_Vuna_dCompiler_dTypecheck_dtcNoSpan)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 565 6 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_ddictMethodExpr = fun tctx subst params tr key paramTy -> (let ty = v_Vuna_dCompiler_dTypecheck_dresolveTy subst paramTy in (match v_Vuna_dCompiler_dTypecheck_dheadVarOf ty with
  | C_Base_dMaybe_dJust (v) -> (match v_Vuna_dCompiler_dTypecheck_dfindDictParam params tr v (v_Vuna_dCompiler_dTypecheck_dlastSeg key) with
  | C_Base_dMaybe_dJust (p) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEVar (p, v_Vuna_dCompiler_dTypecheck_dtcNoSpan))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dtraitMethodExpr tctx ty tr key
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 713 15 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dtraitMethodExpr tctx ty tr key
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 712 6 ("case pattern match failure")))

let v_Vuna_dCompiler_dTypecheck_ddictMethodArg = fun tctx subst params tr key ty -> (match v_Vuna_dCompiler_dTypecheck_ddictMethodExpr tctx subst params tr key ty with
  | C_Base_dResult_dOk (e) -> e
  | C_Base_dResult_dErr (_) -> C_Vuna_dCompiler_dAst_dEVar ("vuna_missing_dict", v_Vuna_dCompiler_dTypecheck_dtcNoSpan)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 729 45 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_ddictMethodArgs = fun tctx subst params tr ty -> (match v_Vuna_dCompiler_dTypecheck_dtraitMethodKeys tctx tr with
  | [] -> []
  | keys -> v_Base_dList_dmap (fun key -> v_Vuna_dCompiler_dTypecheck_ddictMethodArg tctx subst params tr (v_Vuna_dCompiler_dTypecheck_dlastSeg key) ty) keys
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 725 42 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dfoldDictArgs = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (tctx, subst, params, acc, []) -> v_Base_dList_dreverse acc
  | (tctx, subst, params, acc, (C_Base_dPair_dPair (tr, ty)) :: (rest)) -> v_Vuna_dCompiler_dTypecheck_dfoldDictArgs tctx subst params (v_Base_dList_dappend acc (v_Vuna_dCompiler_dTypecheck_ddictMethodArgs tctx subst params tr ty)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 721 1 ("no matching clause for Vuna.Compiler.Typecheck.foldDictArgs")

let v_Vuna_dCompiler_dTypecheck_ddictArgsFor = fun tctx subst params cons -> v_Vuna_dCompiler_dTypecheck_dfoldDictArgs tctx subst params [] cons

let rec v_Vuna_dCompiler_dTypecheck_dvalidateFunDictKeys = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, tctx, params, tr, [], ty) -> C_Base_dResult_dOk (0)
  | (subst, tctx, params, tr, (key) :: (keys), ty) -> (match v_Vuna_dCompiler_dTypecheck_ddictMethodExpr tctx subst params tr key ty with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (ex) -> v_Vuna_dCompiler_dTypecheck_dvalidateFunDictKeys subst tctx params tr keys ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 784 61 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 783 1 ("no matching clause for Vuna.Compiler.Typecheck.validateFunDictKeys")

let rec v_Vuna_dCompiler_dTypecheck_dvalidateFunDicts = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Base_dResult_dOk (0)
  | (subst, tctx, params, (C_Base_dPair_dPair (tr, ty)) :: (rest)) -> (match v_Vuna_dCompiler_dTypecheck_dtraitMethodKeys tctx tr with
  | [] -> v_Vuna_dCompiler_dTypecheck_dvalidateFunDicts subst tctx params rest
  | keys -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateFunDictKeys subst tctx params tr keys ty) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateFunDicts subst tctx params rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 777 61 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 776 1 ("no matching clause for Vuna.Compiler.Typecheck.validateFunDicts")

let rec v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesList = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Base_dResult_dOk (0)
  | (subst, tctx, params, (e) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params e) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesList subst tctx params rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 734 1 ("no matching clause for Vuna.Compiler.Typecheck.validateTraitUsesList")
and v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses = fun subst tctx params expr -> (match expr with
  | C_Vuna_dCompiler_dTypecheck_dXEVar (n, sp) -> C_Base_dResult_dOk (0)
  | C_Vuna_dCompiler_dTypecheck_dXEInt (n, sp) -> C_Base_dResult_dOk (0)
  | C_Vuna_dCompiler_dTypecheck_dXEStr (s, sp) -> C_Base_dResult_dOk (0)
  | C_Vuna_dCompiler_dTypecheck_dXELam (ps, b, sp) -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params b
  | C_Vuna_dCompiler_dTypecheck_dXEApp (f, args, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params f) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesList subst tctx params args)
  | C_Vuna_dCompiler_dTypecheck_dXELet (binds, body, rec_u, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesBinds subst tctx params binds) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params body)
  | C_Vuna_dCompiler_dTypecheck_dXECase (scrut, ty, alts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params scrut) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesAlts subst tctx params alts)
  | C_Vuna_dCompiler_dTypecheck_dXEIf (c, t, e, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params c) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params t) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params e))
  | C_Vuna_dCompiler_dTypecheck_dXEField (base, fname, baseTy, sp) -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params base
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate (base, baseTy, fields, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params base) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesFields subst tctx params fields)
  | C_Vuna_dCompiler_dTypecheck_dXEFun (name, cons, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateFunDicts subst tctx params cons) (fun _u -> C_Base_dResult_dOk (0))
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (tr, key, paramTy, sp) -> (match v_Vuna_dCompiler_dTypecheck_ddictMethodExpr tctx subst params tr key paramTy with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dResult_dOk (ex) -> C_Base_dResult_dOk (0)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 762 33 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst (tr, key, instName, paramTy, sp) -> (let ty = v_Vuna_dCompiler_dTypecheck_dresolveTy subst paramTy in (match v_Vuna_dCompiler_dTypecheck_dlookupNamedInst instName (v_Vuna_dCompiler_dTypecheck_dtraitCtxInsts tctx) with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown named instance ") in (let vuna_cat2' = (instName) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (inst) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dTypecheck_dinstTraitName inst) tr then if v_Vuna_dCompiler_dTypecheck_dtyEqual (v_Vuna_dCompiler_dTypecheck_dinstHeadTy inst) ty then C_Base_dResult_dOk (0) else C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": instance ") in (let vuna_cat2' = (instName) in (let vuna_cat3' = (" expects ") in (let vuna_cat4' = (v_Vuna_dCompiler_dTypecheck_dshowTy (v_Vuna_dCompiler_dTypecheck_dinstHeadTy inst)) in (let vuna_cat5' = (" but method is used at ") in (let vuna_cat6' = (v_Vuna_dCompiler_dTypecheck_dshowTy ty) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))) else C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": instance ") in (let vuna_cat2' = (instName) in (let vuna_cat3' = (" is not an instance of ") in (let vuna_cat4' = (tr) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 768 8 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 740 44 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Base_dResult_dOk (0)
  | (subst, tctx, params, (C_Base_dPair_dPair (pat, value)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params value) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesBinds subst tctx params rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 795 1 ("no matching clause for Vuna.Compiler.Typecheck.validateTraitUsesBinds")
and v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesAlts = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Base_dResult_dOk (0)
  | (subst, tctx, params, (C_Base_dPair_dPair (pat, body)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params body) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesAlts subst tctx params rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 801 1 ("no matching clause for Vuna.Compiler.Typecheck.validateTraitUsesAlts")
and v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Base_dResult_dOk (0)
  | (subst, tctx, params, (C_Base_dPair_dPair (fname, value)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params value) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesFields subst tctx params rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 807 1 ("no matching clause for Vuna.Compiler.Typecheck.validateTraitUsesFields")

let rec v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesClauses = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (subst, tctx, params, []) -> C_Base_dResult_dOk (0)
  | (subst, tctx, params, (C_Base_dPair_dPair (pats, body)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUses subst tctx params body) (fun _u -> v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesClauses subst tctx params rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 789 1 ("no matching clause for Vuna.Compiler.Typecheck.validateTraitUsesClauses")

let rec v_Vuna_dCompiler_dTypecheck_dlowerFieldAccess = fun subst typeNames records tctx params base fname baseTy sp -> (match v_Vuna_dCompiler_dTypecheck_dresolveTy subst baseTy with
  | C_Vuna_dCompiler_dTypecheck_dTCon (rname, args) -> (match v_Vuna_dCompiler_dTypecheck_dlookupRecord rname records with
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dAst_dEInt (0, sp)
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dRecordInfo (rname2, rparams, fdefs, derivings)) -> (match v_Vuna_dCompiler_dTypecheck_dfieldIndex fname fdefs with
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dAst_dEInt (0, sp)
  | C_Base_dMaybe_dJust (k) -> (let n = v_Vuna_dCompiler_dTypecheck_drecFieldCount fdefs in (let names = v_Vuna_dCompiler_dTypecheck_drecFieldVars n in (let pats = v_Base_dList_dmap (fun nm -> C_Vuna_dCompiler_dAst_dPVar (nm, sp)) names in C_Vuna_dCompiler_dAst_dECase (v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params base, (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (rname, pats, sp), C_Vuna_dCompiler_dAst_dEVar (v_Vuna_dCompiler_dTypecheck_dnthName k names, sp))) :: ([]), sp))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 828 57 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 826 22 ("case pattern match failure"))
  | _ -> C_Vuna_dCompiler_dAst_dEInt (0, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 825 77 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_drecUpdateArgs = fun subst typeNames records tctx params fields provided vars i sp -> (match fields with
  | [] -> []
  | (C_Base_dPair_dPair (fname, fty)) :: (rest) -> (match v_Vuna_dCompiler_dTypecheck_dlookupProvided fname provided with
  | C_Base_dMaybe_dJust (e) -> (v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params e) :: (v_Vuna_dCompiler_dTypecheck_drecUpdateArgs subst typeNames records tctx params rest provided vars (bi_add i 1) sp)
  | C_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dAst_dEVar (v_Vuna_dCompiler_dTypecheck_dnthName i vars, sp)) :: (v_Vuna_dCompiler_dTypecheck_drecUpdateArgs subst typeNames records tctx params rest provided vars (bi_add i 1) sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 843 31 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 841 79 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dlowerRecUpdate = fun subst typeNames records tctx params base baseTy fields sp -> (match v_Vuna_dCompiler_dTypecheck_dresolveTy subst baseTy with
  | C_Vuna_dCompiler_dTypecheck_dTCon (rname, args) -> (match v_Vuna_dCompiler_dTypecheck_dlookupRecord rname records with
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dAst_dEInt (0, sp)
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dRecordInfo (rname2, rparams, fdefs, derivings)) -> (let n = v_Vuna_dCompiler_dTypecheck_drecFieldCount fdefs in (let names = v_Vuna_dCompiler_dTypecheck_drecFieldVars n in (let pats = v_Base_dList_dmap (fun nm -> C_Vuna_dCompiler_dAst_dPVar (nm, sp)) names in (let args2 = v_Vuna_dCompiler_dTypecheck_drecUpdateArgs subst typeNames records tctx params fdefs fields names 0 sp in C_Vuna_dCompiler_dAst_dECase (v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params base, (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (rname, pats, sp), C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (rname, sp), args2, sp))) :: ([]), sp)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 852 22 ("case pattern match failure"))
  | _ -> C_Vuna_dCompiler_dAst_dEInt (0, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 851 76 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dlowerExpr = fun subst typeNames records tctx params expr -> (match expr with
  | C_Vuna_dCompiler_dTypecheck_dXEVar (name, sp) -> C_Vuna_dCompiler_dAst_dEVar (name, sp)
  | C_Vuna_dCompiler_dTypecheck_dXEInt (n, sp) -> C_Vuna_dCompiler_dAst_dEInt (n, sp)
  | C_Vuna_dCompiler_dTypecheck_dXEStr (s, sp) -> C_Vuna_dCompiler_dAst_dEStr (s, sp)
  | C_Vuna_dCompiler_dTypecheck_dXELam (ps, b, sp) -> C_Vuna_dCompiler_dAst_dELam (ps, v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params b, sp)
  | C_Vuna_dCompiler_dTypecheck_dXEApp (fn, args, sp) -> C_Vuna_dCompiler_dAst_dEApp (v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params fn, v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params) args, sp)
  | C_Vuna_dCompiler_dTypecheck_dXELet (binds, body, rec_u, sp) -> C_Vuna_dCompiler_dAst_dELet (v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dlowerBind subst typeNames records tctx params) binds, v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params body, rec_u, sp)
  | C_Vuna_dCompiler_dTypecheck_dXECase (scrut, ty, alts, sp) -> C_Vuna_dCompiler_dAst_dECase (v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params scrut, v_Base_dList_dmap (v_Vuna_dCompiler_dTypecheck_dlowerAlt subst typeNames records tctx params) alts, sp)
  | C_Vuna_dCompiler_dTypecheck_dXEIf (c, t, e, sp) -> C_Vuna_dCompiler_dAst_dEIf (v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params c, v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params t, v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params e, sp)
  | C_Vuna_dCompiler_dTypecheck_dXEField (base, fname, baseTy, sp) -> v_Vuna_dCompiler_dTypecheck_dlowerFieldAccess subst typeNames records tctx params base fname baseTy sp
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate (base, baseTy, fields, sp) -> v_Vuna_dCompiler_dTypecheck_dlowerRecUpdate subst typeNames records tctx params base baseTy fields sp
  | C_Vuna_dCompiler_dTypecheck_dXEFun (name, cons, sp) -> (match v_Vuna_dCompiler_dTypecheck_ddictArgsFor tctx subst params cons with
  | [] -> C_Vuna_dCompiler_dAst_dEVar (name, sp)
  | args -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (name, sp), args, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 889 25 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (tr, key, paramTy, sp) -> (match v_Vuna_dCompiler_dTypecheck_ddictMethodExpr tctx subst params tr key paramTy with
  | C_Base_dResult_dOk (ex) -> ex
  | C_Base_dResult_dErr (_) -> C_Vuna_dCompiler_dAst_dEVar ("vuna_missing_instance", sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 892 33 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst (tr, key, instName, paramTy, sp) -> (match v_Vuna_dCompiler_dTypecheck_dlookupNamedInst instName (v_Vuna_dCompiler_dTypecheck_dtraitCtxInsts tctx) with
  | C_Base_dMaybe_dJust (inst) -> (match v_Vuna_dCompiler_dTypecheck_dlookupImpl (v_Vuna_dCompiler_dTypecheck_dlastSeg key) (v_Vuna_dCompiler_dTypecheck_dinstImpls inst) with
  | C_Base_dMaybe_dJust (fn) -> C_Vuna_dCompiler_dAst_dEVar (fn, sp)
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dAst_dEVar ("vuna_missing_instance", sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 896 18 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dAst_dEVar ("vuna_missing_instance", sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 895 46 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 867 54 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dlowerBind = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, C_Base_dPair_dPair (pat, value)) -> C_Base_dPair_dPair (pat, v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params value)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 901 1 ("no matching clause for Vuna.Compiler.Typecheck.lowerBind")
and v_Vuna_dCompiler_dTypecheck_dlowerAlt = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, C_Base_dPair_dPair (pat, body)) -> C_Base_dPair_dPair (pat, v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 904 1 ("no matching clause for Vuna.Compiler.Typecheck.lowerAlt")

let v_Vuna_dCompiler_dTypecheck_dlowerClause = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, C_Base_dPair_dPair (pats, body)) -> C_Base_dPair_dPair (pats, v_Vuna_dCompiler_dTypecheck_dlowerExpr subst typeNames records tctx params body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 907 1 ("no matching clause for Vuna.Compiler.Typecheck.lowerClause")

let rec v_Vuna_dCompiler_dTypecheck_dlowerClauses = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (subst, typeNames, records, tctx, params, []) -> []
  | (subst, typeNames, records, tctx, params, (clause) :: (rest)) -> (v_Vuna_dCompiler_dTypecheck_dlowerClause subst typeNames records tctx params clause) :: (v_Vuna_dCompiler_dTypecheck_dlowerClauses subst typeNames records tctx params rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 910 1 ("no matching clause for Vuna.Compiler.Typecheck.lowerClauses")

let v_Vuna_dCompiler_dTypecheck_dfinishFunctionLower = fun globals name inferred needs params clauses2 st -> (let elab = v_Vuna_dCompiler_dTypecheck_dlowerClauses (v_Vuna_dCompiler_dTypecheck_dsubstOf st) (v_Vuna_dCompiler_dTypecheck_dtypeNamesOfTC st) (v_Vuna_dCompiler_dTypecheck_drecordsOf st) (v_Vuna_dCompiler_dTypecheck_dtraitCtxOf st) params clauses2 in v_Vuna_dCompiler_dTypecheck_dfinishFunctionScheme globals name inferred needs elab st)

let v_Vuna_dCompiler_dTypecheck_dfinishFunctionCheck = fun globals name inferred needs params clauses st -> (match v_Vuna_dCompiler_dTypecheck_dprependClauseParams (v_Vuna_dCompiler_dTypecheck_ddictParamNames params) clauses with
  | clauses2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dvalidateTraitUsesClauses (v_Vuna_dCompiler_dTypecheck_dsubstOf st) (v_Vuna_dCompiler_dTypecheck_dtraitCtxOf st) params clauses2) (fun _u -> v_Vuna_dCompiler_dTypecheck_dfinishFunctionLower globals name inferred needs params clauses2 st)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1463 69 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dfinishFunction = fun globals decls sigs name inferred needs genVars clauses st -> (let params = v_Vuna_dCompiler_dTypecheck_ddictParamsFor (v_Vuna_dCompiler_dTypecheck_dtraitCtxOf st) needs in v_Vuna_dCompiler_dTypecheck_dfinishFunctionCheck globals name inferred needs params clauses st)

let rec v_Vuna_dCompiler_dTypecheck_dcollectUserInstancesGo = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (typeNames, traitDecls, allDecls, [], insts, declsOut, ownersOut) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse insts, C_Base_dPair_dPair (v_Base_dList_dreverse declsOut, v_Base_dList_dreverse ownersOut)))
  | (typeNames, traitDecls, allDecls, (d) :: (rest), insts, declsOut, ownersOut) -> (match d with
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, headExpr, methods, sp) -> (match v_Vuna_dCompiler_dTypecheck_dinstanceHeadParts headExpr with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dResult_dOk (C_Base_dPair_dPair (traitName, headTyExpr)) -> (match v_Vuna_dCompiler_dTypecheck_dlookupTraitDecl traitName traitDecls with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown trait ") in (let vuna_cat2' = (traitName) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (traitDecl) -> (match v_Vuna_dCompiler_dTypecheck_dconvertType typeNames [] (C_Vuna_dCompiler_dTypecheck_dTC (0, C_Vuna_dCompiler_dTypecheck_dTsLeaf, typeNames, [], [], [], C_Vuna_dCompiler_dTypecheck_dTraitCtx ([], [], [], [], []))) headTyExpr with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": in instance head: ") in (let vuna_cat2' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (headTy, vars), st)) -> if v_vuna_ugt_uint (v_Vuna_dCompiler_dTypecheck_dtraitDeclArity traitDecl) 0 then (match headTyExpr with
  | C_Vuna_dCompiler_dAst_dEVar (tcName, sp2) -> if v_vuna_ueq_uint (v_Vuna_dCompiler_dTypecheck_dtypeArityOf allDecls tcName) (v_Vuna_dCompiler_dTypecheck_dtraitDeclArity traitDecl) then v_Vuna_dCompiler_dTypecheck_dfinishInstanceKinded typeNames traitDecls allDecls traitDecl traitName iname isDefault headTyExpr headTy methods sp insts declsOut ownersOut rest else C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": instance head ") in (let vuna_cat2' = (v_Vuna_dCompiler_dTypecheck_dshortTyName tcName) in (let vuna_cat3' = (" has kind * but trait ") in (let vuna_cat4' = (traitName) in (let vuna_cat5' = (" expects a type constructor of arity ") in (let vuna_cat6' = (bi_str_from_int (v_Vuna_dCompiler_dTypecheck_dtraitDeclArity traitDecl)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))
  | _ -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": instance head for higher-kinded trait must be a type constructor name")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2134 81 ("case pattern match failure")) else if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uBase_uPair_uPair vuna_ueq_ulh vuna_ueq_ulh2) then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2) else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in vuna_ueq_ulist_ugo)) vars [] then (match iname with
  | C_Base_dMaybe_dJust (internalName) -> if isDefault then if v_Vuna_dCompiler_dTypecheck_dorphanAllowed (v_Vuna_dCompiler_dTypecheck_dmodulePrefixOf internalName) traitName headTy then v_Vuna_dCompiler_dTypecheck_dfinishInstance typeNames traitDecls allDecls traitDecl traitName iname isDefault headTyExpr headTy methods sp insts declsOut ownersOut rest else C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": orphan default instance ") in (let vuna_cat2' = (traitName) in (let vuna_cat3' = (" ") in (let vuna_cat4' = (v_Vuna_dCompiler_dTypecheck_dtyOuterTypeName headTy) in (let vuna_cat5' = ("; name it with `as`") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))) else v_Vuna_dCompiler_dTypecheck_dfinishInstance typeNames traitDecls allDecls traitDecl traitName iname isDefault headTyExpr headTy methods sp insts declsOut ownersOut rest
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dTypecheck_dfinishInstance typeNames traitDecls allDecls traitDecl traitName iname isDefault headTyExpr headTy methods sp insts declsOut ownersOut rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2143 33 ("case pattern match failure")) else C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": instance head must be a concrete type")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2132 25 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2130 39 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2128 52 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dTypecheck_dcollectUserInstancesGo typeNames traitDecls allDecls rest insts declsOut ownersOut
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2127 93 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2125 1 ("no matching clause for Vuna.Compiler.Typecheck.collectUserInstancesGo")
and v_Vuna_dCompiler_dTypecheck_dfinishInstanceKinded = fun typeNames traitDecls allDecls traitDecl traitName iname isDefault headTyExpr headTy methods sp insts declsOut ownersOut rest -> (let headTy2 = C_Vuna_dCompiler_dTypecheck_dTCon (v_Vuna_dCompiler_dTypecheck_dtyOuterTypeName headTy, []) in v_Vuna_dCompiler_dTypecheck_dfinishInstance typeNames traitDecls allDecls traitDecl traitName iname isDefault headTyExpr headTy2 methods sp insts declsOut ownersOut rest)
and v_Vuna_dCompiler_dTypecheck_dfinishInstance = fun typeNames traitDecls allDecls traitDecl traitName iname isDefault headTyExpr headTy methods sp insts declsOut ownersOut rest -> (let instKey = v_Vuna_dCompiler_dTypecheck_dinstKeyOf isDefault iname headTyExpr in (match v_Vuna_dCompiler_dTypecheck_dinstanceImpls typeNames traitDecl headTyExpr methods instKey sp with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (impls, newDecls)) -> v_Vuna_dCompiler_dTypecheck_dcollectUserInstancesGo typeNames traitDecls allDecls rest ((C_Vuna_dCompiler_dTypecheck_dTraitInst (traitName, v_Vuna_dCompiler_dTypecheck_dinstanceNameFor isDefault iname, headTy, impls)) :: (insts)) (v_Base_dList_dappend newDecls declsOut) (v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_ddeclOwners (v_Vuna_dCompiler_dTypecheck_dinstanceOwnerOf iname) newDecls) ownersOut)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2166 6 ("case pattern match failure")))

let v_Vuna_dCompiler_dTypecheck_dcollectUserInstances = fun typeNames traitDecls decls -> v_Vuna_dCompiler_dTypecheck_dcollectUserInstancesGo typeNames traitDecls decls decls [] [] []

let v_Vuna_dCompiler_dTypecheck_dprepareTraits = fun typeNames decls -> (match v_Vuna_dCompiler_dTypecheck_dcollectTraitDecls typeNames decls with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (traitDecls, methodRefs)) -> (match v_Vuna_dCompiler_dTypecheck_dcollectUserInstances typeNames traitDecls decls with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (userInsts, C_Base_dPair_dPair (instanceDecls, instanceOwners))) -> (let shapes = v_Vuna_dCompiler_dTypecheck_dcollectDataShapes decls in (let supported = v_Vuna_dCompiler_dTypecheck_dsupportedShapes shapes in (let eqSupported = v_Vuna_dCompiler_dTypecheck_deqSupportedShapes shapes in (match v_Vuna_dCompiler_dTypecheck_dcollectDerivings supported eqSupported decls with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (derivedInsts) -> (match v_Vuna_dCompiler_dTypecheck_dcheckInstUniqueness (v_Base_dList_dappend userInsts derivedInsts) [] with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (_) -> (match v_Vuna_dCompiler_dTypecheck_dparseGenerated v_Vuna_dCompiler_dTypecheck_dbuiltinHelperSrc with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (builtinDecls) -> (match v_Vuna_dCompiler_dTypecheck_dparseGenerated (v_Vuna_dCompiler_dTypecheck_dtcJoin "\n\n" (v_Vuna_dCompiler_dTypecheck_dstructuralSrcs shapes supported eqSupported)) with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (structDecls) -> (let owners = v_Base_dList_dappend (v_Base_dList_dappend instanceOwners (v_Vuna_dCompiler_dTypecheck_ddeclOwners "" builtinDecls)) (v_Vuna_dCompiler_dTypecheck_dstructuralOwners shapes supported eqSupported) in C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dTypecheck_dTraitCtx (traitDecls, v_Base_dList_dappend userInsts derivedInsts, supported, eqSupported, methodRefs), C_Base_dPair_dPair (v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dstripTraitDecls decls) (v_Base_dList_dappend instanceDecls (v_Base_dList_dappend builtinDecls structDecls)), owners))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2256 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2254 19 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2252 28 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2250 10 ("case pattern match failure")))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2241 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2239 33 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dsameBuiltinTy = fun a b -> (let sa = v_Vuna_dCompiler_dTypecheck_dshortTyName a in (if ((if (v_vuna_ueq_ustr sa "Bool") then true else (v_vuna_ueq_ustr sa "List"))) then (v_vuna_ueq_ustr sa (v_Vuna_dCompiler_dTypecheck_dshortTyName b)) else false))

let rec v_Vuna_dCompiler_dTypecheck_dunifyLists = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], [], st) -> C_Base_dResult_dOk (st)
  | ((a) :: (ar), (b) :: (br), st) -> (match v_Vuna_dCompiler_dTypecheck_dunify a b st with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (st2) -> v_Vuna_dCompiler_dTypecheck_dunifyLists ar br st2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 193 37 ("case pattern match failure"))
  | (_, _, st) -> C_Base_dResult_dErr ("type mismatch: different number of arguments")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 192 1 ("no matching clause for Vuna.Compiler.Typecheck.unifyLists")
and v_Vuna_dCompiler_dTypecheck_dunify = fun a b st -> (match v_Vuna_dCompiler_dTypecheck_dresolveTy (v_Vuna_dCompiler_dTypecheck_dsubstOf st) a with
  | ra -> (match v_Vuna_dCompiler_dTypecheck_dresolveTy (v_Vuna_dCompiler_dTypecheck_dsubstOf st) b with
  | rb -> v_Vuna_dCompiler_dTypecheck_dunifyResolved ra rb st
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 200 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 199 16 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dunifyResolved = fun ra rb st -> (match ra with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> (match rb with
  | C_Vuna_dCompiler_dTypecheck_dTVar (j) -> if v_vuna_ueq_uint i j then C_Base_dResult_dOk (st) else v_Vuna_dCompiler_dTypecheck_dbindVar i rb st
  | _ -> if v_Vuna_dCompiler_dTypecheck_doccursIn i (v_Vuna_dCompiler_dTypecheck_dsubstOf st) rb then C_Base_dResult_dErr ((("occurs check: ") ^ (v_Vuna_dCompiler_dTypecheck_dshowTy rb))) else v_Vuna_dCompiler_dTypecheck_dbindVar i rb st
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 204 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTCon (tn, xs) -> (match rb with
  | C_Vuna_dCompiler_dTypecheck_dTVar (j) -> if v_Vuna_dCompiler_dTypecheck_doccursIn j (v_Vuna_dCompiler_dTypecheck_dsubstOf st) ra then C_Base_dResult_dErr ((("occurs check: ") ^ (v_Vuna_dCompiler_dTypecheck_dshowTy ra))) else v_Vuna_dCompiler_dTypecheck_dbindVar j ra st
  | C_Vuna_dCompiler_dTypecheck_dTCon (tn2, ys) -> if (if (v_vuna_ueq_ustr tn tn2) then true else (v_Vuna_dCompiler_dTypecheck_dsameBuiltinTy tn tn2)) then v_Vuna_dCompiler_dTypecheck_dunifyLists xs ys st else C_Base_dResult_dErr ((let vuna_cat0' = ("type mismatch: expected ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dshowTy rb) in (let vuna_cat2' = (" but got ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy ra) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Vuna_dCompiler_dTypecheck_dTApp (h, ys) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify (C_Vuna_dCompiler_dTypecheck_dTCon (tn, [])) h st) (fun st2 -> v_Vuna_dCompiler_dTypecheck_dunifyLists xs ys st2)
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("type mismatch: expected ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dshowTy rb) in (let vuna_cat2' = (" but got ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy ra) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 207 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTFun (x, y) -> (match rb with
  | C_Vuna_dCompiler_dTypecheck_dTVar (j) -> if v_Vuna_dCompiler_dTypecheck_doccursIn j (v_Vuna_dCompiler_dTypecheck_dsubstOf st) ra then C_Base_dResult_dErr ((("occurs check: ") ^ (v_Vuna_dCompiler_dTypecheck_dshowTy ra))) else v_Vuna_dCompiler_dTypecheck_dbindVar j ra st
  | C_Vuna_dCompiler_dTypecheck_dTFun (x2, y2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify x x2 st) (fun st2 -> v_Vuna_dCompiler_dTypecheck_dunify y y2 st2)
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("type mismatch: expected ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dshowTy rb) in (let vuna_cat2' = (" but got ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy ra) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 215 15 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTApp (h, xs) -> (match rb with
  | C_Vuna_dCompiler_dTypecheck_dTVar (j) -> if v_Vuna_dCompiler_dTypecheck_doccursIn j (v_Vuna_dCompiler_dTypecheck_dsubstOf st) ra then C_Base_dResult_dErr ((("occurs check: ") ^ (v_Vuna_dCompiler_dTypecheck_dshowTy ra))) else v_Vuna_dCompiler_dTypecheck_dbindVar j ra st
  | C_Vuna_dCompiler_dTypecheck_dTApp (h2, ys) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify h h2 st) (fun st2 -> v_Vuna_dCompiler_dTypecheck_dunifyLists xs ys st2)
  | C_Vuna_dCompiler_dTypecheck_dTCon (tn2, ys) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify h (C_Vuna_dCompiler_dTypecheck_dTCon (tn2, [])) st) (fun st2 -> v_Vuna_dCompiler_dTypecheck_dunifyLists xs ys st2)
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("type mismatch: expected ") in (let vuna_cat1' = (v_Vuna_dCompiler_dTypecheck_dshowTy rb) in (let vuna_cat2' = (" but got ") in (let vuna_cat3' = (v_Vuna_dCompiler_dTypecheck_dshowTy ra) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 220 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 203 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dinferPatterns = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, [], [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair (locals, st))
  | (globals, locals, (p) :: (pr), (ty) :: (tr), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferPattern globals locals st p ty) (fun q -> (match q with
  | C_Base_dPair_dPair (locals2, st1) -> v_Vuna_dCompiler_dTypecheck_dinferPatterns globals locals2 pr tr st1
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1141 109 ("case pattern match failure")))
  | (globals, locals, _, _, st) -> C_Base_dResult_dErr ("pattern arity mismatch")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1140 1 ("no matching clause for Vuna.Compiler.Typecheck.inferPatterns")
and v_Vuna_dCompiler_dTypecheck_dinferPattern = fun globals locals st pat expected -> (match pat with
  | C_Vuna_dCompiler_dAst_dPWild (_) -> C_Base_dResult_dOk (C_Base_dPair_dPair (locals, st))
  | C_Vuna_dCompiler_dAst_dPVar (name, _) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (name, expected)) :: (locals), st))
  | C_Vuna_dCompiler_dAst_dPInt (n, _) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify v_Vuna_dCompiler_dTypecheck_dintTy expected st) (fun st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (locals, st2)))
  | C_Vuna_dCompiler_dAst_dPStr (s, _) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify v_Vuna_dCompiler_dTypecheck_dstrTy expected st) (fun st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (locals, st2)))
  | C_Vuna_dCompiler_dAst_dPCon (name, pats, _) -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme name globals with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("unknown constructor: ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dsuggest name (v_Base_dList_dmap v_Base_dPair_dfirstOf globals)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (sch) -> (match v_Vuna_dCompiler_dTypecheck_dinstantiate st sch with
  | C_Base_dPair_dPair (ctorTy, st1) -> (let argTys = v_Vuna_dCompiler_dTypecheck_dfunArgs ctorTy in if v_vuna_ueq_uint (v_Base_dList_dlength pats) (v_Base_dList_dlength argTys) then v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify (v_Vuna_dCompiler_dTypecheck_dfunResult ctorTy) expected st1) (fun st2 -> v_Vuna_dCompiler_dTypecheck_dinferPatterns globals locals pats argTys st2) else C_Base_dResult_dErr ((let vuna_cat0' = ("constructor ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" expects ") in (let vuna_cat3' = (bi_str_from_int (v_Base_dList_dlength argTys)) in (let vuna_cat4' = (" arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1153 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1151 23 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1146 47 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dinferArgs = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, fnTy, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair ([], C_Base_dPair_dPair (fnTy, st))))
  | (globals, locals, fnTy, (arg) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st arg) (fun pa -> (match pa with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (argTy, argElab), st1) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st1 with
  | C_Base_dPair_dPair (resTy, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify fnTy (C_Vuna_dCompiler_dTypecheck_dTFun (argTy, resTy)) st2) (fun st3 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferArgs globals locals resTy rest st3) (fun pr -> (match pr with
  | C_Base_dPair_dPair (argTys, C_Base_dPair_dPair (argEls, C_Base_dPair_dPair (finalTy, st4))) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((argTy) :: (argTys), C_Base_dPair_dPair ((argElab) :: (argEls), C_Base_dPair_dPair (finalTy, st4))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1164 134 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1163 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1162 100 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1161 1 ("no matching clause for Vuna.Compiler.Typecheck.inferArgs")
and v_Vuna_dCompiler_dTypecheck_dinferBinds = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, locals, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair (locals, st)))
  | (globals, locals, (C_Base_dPair_dPair (pat, value)) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st value) (fun pv -> (match pv with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (valueTy, valueElab), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferPattern globals locals st1 pat valueTy) (fun pp -> (match pp with
  | C_Base_dPair_dPair (locals2, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferBinds globals locals2 rest st2) (fun pr -> (match pr with
  | C_Base_dPair_dPair (bindEls, C_Base_dPair_dPair (locals3, st3)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (pat, valueElab)) :: (bindEls), C_Base_dPair_dPair (locals3, st3)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1179 79 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1178 102 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1177 111 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1176 1 ("no matching clause for Vuna.Compiler.Typecheck.inferBinds")
and v_Vuna_dCompiler_dTypecheck_dinferRecLet = fun globals locals binds body sp st -> (match v_Vuna_dCompiler_dTypecheck_dseedRecNames binds st with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (recPairs, st1)) -> (let locals2 = v_Vuna_dCompiler_dTypecheck_drecExtendLocals locals recPairs in (match v_Vuna_dCompiler_dTypecheck_dcheckRecValues globals locals2 recPairs st1 with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (recElabs, st2)) -> (match v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals2 st2 body with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, bodyElab), st3)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, C_Vuna_dCompiler_dTypecheck_dXELet (recElabs, bodyElab, true, sp)), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1194 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1192 8 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1187 47 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dcheckRecValues = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, locals, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (globals, locals, (C_Base_dPair_dPair (C_Base_dPair_dPair (_, ty), C_Base_dPair_dPair (pat, value))) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st value) (fun pv -> (match pv with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (valueTy, valueElab), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify ty valueTy st1) (fun st2 -> (match v_Vuna_dCompiler_dTypecheck_dcheckRecValues globals locals rest st2 with
  | C_Base_dResult_dOk (C_Base_dPair_dPair (tail, st3)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (pat, valueElab)) :: (tail), st3))
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1213 80 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1212 134 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1211 1 ("no matching clause for Vuna.Compiler.Typecheck.checkRecValues")
and v_Vuna_dCompiler_dTypecheck_dinferAlts = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, locals, scrutTy, [], st) -> C_Base_dResult_dErr ("empty case")
  | (globals, locals, scrutTy, (C_Base_dPair_dPair (pat, body)) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferPattern globals locals st pat scrutTy) (fun pp -> (match pp with
  | C_Base_dPair_dPair (locals2, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals2 st1 body) (fun pb -> (match pb with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, bodyElab), st2) -> (match rest with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (pat, bodyElab)) :: ([]), C_Base_dPair_dPair (bodyTy, st2)))
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferAlts globals locals scrutTy rest st2) (fun pr -> (match pr with
  | C_Base_dPair_dPair (altsElab, C_Base_dPair_dPair (restTy, st3)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify bodyTy restTy st3) (fun st4 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (pat, bodyElab)) :: (altsElab), C_Base_dPair_dPair (bodyTy, st4))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1224 72 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1222 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1221 76 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1220 126 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1219 1 ("no matching clause for Vuna.Compiler.Typecheck.inferAlts")
and v_Vuna_dCompiler_dTypecheck_dinferExpr = fun globals locals st expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, sp) -> (match v_Vuna_dCompiler_dTypecheck_dlookupLocal name locals with
  | C_Base_dMaybe_dJust (ty) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, C_Vuna_dCompiler_dTypecheck_dXEVar (name, sp)), st))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme name globals with
  | C_Base_dMaybe_dJust (sch) -> (match v_Vuna_dCompiler_dTypecheck_dinstantiateFull st sch with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty, cons), st2) -> if v_vuna_ueq_uBase_uList_uList cons [] then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, C_Vuna_dCompiler_dTypecheck_dXEVar (name, sp)), st2)) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, C_Vuna_dCompiler_dTypecheck_dXEFun (name, cons, sp)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1246 19 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dTypecheck_dmethodRefForName name (v_Vuna_dCompiler_dTypecheck_dtraitMethodsOf st) with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dTraitMethodRef (key, tr, sch, pid)) -> (match v_Vuna_dCompiler_dTypecheck_dinstantiateForParam st sch pid with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty, paramTy), st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, C_Vuna_dCompiler_dTypecheck_dXEMethod (tr, key, paramTy, sp)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1251 49 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("unbound variable: ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dsuggest name (v_Base_dList_dmap v_Base_dPair_dfirstOf globals)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1250 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1245 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1243 19 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dintTy, C_Vuna_dCompiler_dTypecheck_dXEInt (n, sp)), st))
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dstrTy, C_Vuna_dCompiler_dTypecheck_dXEStr (s, sp)), st))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st fn) (fun pf -> (match pf with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (fnTy, fnElab), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferArgs globals locals fnTy args st1) (fun pr -> (match pr with
  | C_Base_dPair_dPair (argTys, C_Base_dPair_dPair (argEls, C_Base_dPair_dPair (resTy, st2))) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (resTy, v_Vuna_dCompiler_dTypecheck_delabAppExpr fn fnElab args argTys argEls sp), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1257 93 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1256 71 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dELam (params, body, sp) -> (match v_Vuna_dCompiler_dTypecheck_dseedLocals params locals st with
  | C_Base_dPair_dPair (paramTys, C_Base_dPair_dPair (locals2, st1)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals2 st1 body) (fun pb -> (match pb with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, bodyElab), st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dfoldFun paramTys bodyTy, C_Vuna_dCompiler_dTypecheck_dXELam (params, bodyElab, sp)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1263 94 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1262 26 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> if rec_u then v_Vuna_dCompiler_dTypecheck_dinferRecLet globals locals binds body sp st else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferBinds globals locals binds st) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bindEls, C_Base_dPair_dPair (locals2, st1)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals2 st1 body) (fun pr -> (match pr with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, bodyElab), st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, C_Vuna_dCompiler_dTypecheck_dXELet (bindEls, bodyElab, false, sp)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1269 93 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1268 61 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st scrut) (fun ps -> (match ps with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (scrutTy, scrutElab), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferAlts globals locals scrutTy alts st1) (fun pr -> (match pr with
  | C_Base_dPair_dPair (altsElab, C_Base_dPair_dPair (bodyTy, st2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, C_Vuna_dCompiler_dTypecheck_dXECase (scrutElab, scrutTy, altsElab, sp)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1275 102 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1274 78 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st c) (fun pc -> (match pc with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (condTy, condElab), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify condTy v_Vuna_dCompiler_dTypecheck_dboolTy st1) (fun st2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st2 t) (fun pt -> (match pt with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (thenTy, thenElab), st3) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st3 e) (fun pe -> (match pe with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (elseTy, elseElab), st4) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify thenTy elseTy st4) (fun st5 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (thenTy, C_Vuna_dCompiler_dTypecheck_dXEIf (condElab, thenElab, elseElab, sp)), st5)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1282 91 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1281 132 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1280 67 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dEField (base, fname, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st base) (fun pb -> (match pb with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (baseTy, baseElab), st1) -> (match v_Vuna_dCompiler_dTypecheck_dfreshTy st1 with
  | C_Base_dPair_dPair (resTy, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (resTy, C_Vuna_dCompiler_dTypecheck_dXEField (baseElab, fname, baseTy, sp)), v_Vuna_dCompiler_dTypecheck_daddRecConstraint (C_Vuna_dCompiler_dTypecheck_dFieldCon (baseTy, fname, resTy, sp)) st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1291 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1290 78 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st base) (fun pb -> (match pb with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (baseTy, baseElab), st1) -> if v_Vuna_dCompiler_dTypecheck_dhasDuplicateFieldNames fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_dduplicateFieldMsg sp) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferUpdateValues globals locals baseTy sp fields st1) (fun p -> (match p with
  | C_Base_dPair_dPair (vals, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (baseTy, C_Vuna_dCompiler_dTypecheck_dXERecUpdate (baseElab, baseTy, vals, sp)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1298 81 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1296 83 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dERecord (rname, fields, sp) -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": internal: record expression should be desugared before inference")))
  | C_Vuna_dCompiler_dAst_dEInstSel (inner, iname, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st inner) (fun p -> (match p with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty, elab), st1) -> (match elab with
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (tr, key, paramTy, msp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, C_Vuna_dCompiler_dTypecheck_dXEMethodInst (tr, key, iname, paramTy, sp)), st1))
  | _ -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": @instance \229\143\170\232\131\189\231\148\168\228\186\142 trait \230\150\185\230\179\149")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1305 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1304 81 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": dependent function type requires --dt")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1242 36 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_dinferUpdateValues = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (globals, locals, baseTy, sp, [], st) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (globals, locals, baseTy, sp, (C_Base_dPair_dPair (fname, e)) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals st e) (fun p -> (match p with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (vty, velab), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferUpdateValues globals locals baseTy sp rest st1) (fun r -> (match r with
  | C_Base_dPair_dPair (vs, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (fname, velab)) :: (vs), v_Vuna_dCompiler_dTypecheck_daddRecConstraint (C_Vuna_dCompiler_dTypecheck_dUpdateCon (baseTy, fname, vty, sp)) st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1313 101 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1312 121 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1311 1 ("no matching clause for Vuna.Compiler.Typecheck.inferUpdateValues")

let v_Vuna_dCompiler_dTypecheck_dsolveFieldConstraint = fun typeNames records baseTy fname targetTy sp st -> (match v_Vuna_dCompiler_dTypecheck_dresolveTy (v_Vuna_dCompiler_dTypecheck_dsubstOf st) baseTy with
  | C_Vuna_dCompiler_dTypecheck_dTVar (i) -> C_Base_dResult_dOk (C_Base_dPair_dPair (false, st))
  | C_Vuna_dCompiler_dTypecheck_dTCon (rname, args) -> (match v_Vuna_dCompiler_dTypecheck_dlookupRecord rname records with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": not a record type: ") in (let vuna_cat2' = (rname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dTypecheck_dRecordInfo (rname2, params, fdefs, derivings)) -> (match v_Vuna_dCompiler_dTypecheck_dfieldIndex fname fdefs with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown field ") in (let vuna_cat2' = (fname) in (let vuna_cat3' = (" for record ") in (let vuna_cat4' = (rname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Base_dMaybe_dJust (k) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dconvertType typeNames (v_Vuna_dCompiler_dTypecheck_dzipParamTys params args) st (v_Vuna_dCompiler_dTypecheck_dnthFieldTy k fdefs)) (fun p -> (match p with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (fty, vars), st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify targetTy fty st1) (fun st2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (true, st2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1364 106 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1362 56 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1360 22 ("case pattern match failure"))
  | _ -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": not a record type in field access/update")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1358 70 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dsolveOneConstraint = fun typeNames records c st -> (match c with
  | C_Vuna_dCompiler_dTypecheck_dFieldCon (baseTy, fname, targetTy, sp) -> v_Vuna_dCompiler_dTypecheck_dsolveFieldConstraint typeNames records baseTy fname targetTy sp st
  | C_Vuna_dCompiler_dTypecheck_dUpdateCon (baseTy, fname, valTy, sp) -> v_Vuna_dCompiler_dTypecheck_dsolveFieldConstraint typeNames records baseTy fname valTy sp st
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1353 45 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dsolveRecPass = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (typeNames, records, [], st, acc) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, st))
  | (typeNames, records, (c) :: (rest), st, acc) -> (match v_Vuna_dCompiler_dTypecheck_dsolveOneConstraint typeNames records c st with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (solved, st1)) -> (match solved with
  | true -> v_Vuna_dCompiler_dTypecheck_dsolveRecPass typeNames records rest st1 acc
  | false -> v_Vuna_dCompiler_dTypecheck_dsolveRecPass typeNames records rest st1 ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1349 27 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1347 53 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1346 1 ("no matching clause for Vuna.Compiler.Typecheck.solveRecPass")

let rec v_Vuna_dCompiler_dTypecheck_dsolveRecConstraints = fun typeNames records cons st -> (match v_Vuna_dCompiler_dTypecheck_dsolveRecPass typeNames records cons st [] with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (remaining, st2)) -> (match remaining with
  | [] -> C_Base_dResult_dOk (v_Vuna_dCompiler_dTypecheck_dclearRecConstraints st2)
  | _ -> if v_vuna_ueq_uint (v_Base_dList_dlength remaining) (v_Base_dList_dlength cons) then C_Base_dResult_dErr (v_Vuna_dCompiler_dTypecheck_drecConstraintFailMsg remaining) else v_Vuna_dCompiler_dTypecheck_dsolveRecConstraints typeNames records remaining st2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1327 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1325 49 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dinferClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, st, C_Base_dPair_dPair (pats, body)) -> (match v_Vuna_dCompiler_dTypecheck_dseedPatTypes pats st with
  | C_Base_dPair_dPair (paramTys, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferPatterns globals [] pats paramTys st1) (fun pp -> (match pp with
  | C_Base_dPair_dPair (locals2, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals2 st2 body) (fun pb -> (match pb with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (bodyTy, bodyElab), st3) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dfoldFun paramTys bodyTy, C_Base_dPair_dPair (pats, bodyElab)), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1371 78 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1370 85 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1369 43 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1369 1 ("no matching clause for Vuna.Compiler.Typecheck.inferClause")

let rec v_Vuna_dCompiler_dTypecheck_dinferClauses = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, [], st) -> C_Base_dResult_dErr ("function has no clauses")
  | (globals, (clause) :: (rest), st) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferClause globals st clause) (fun pc -> (match pc with
  | C_Base_dPair_dPair (C_Base_dPair_dPair (ty, clauseElab), st1) -> (match rest with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair ((clauseElab) :: ([]), C_Base_dPair_dPair (ty, st1)))
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dinferClauses globals rest st1) (fun pr -> (match pr with
  | C_Base_dPair_dPair (clauseEls, C_Base_dPair_dPair (restTy, st2)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dunify ty restTy st2) (fun st3 -> C_Base_dResult_dOk (C_Base_dPair_dPair ((clauseElab) :: (clauseEls), C_Base_dPair_dPair (ty, st3))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1381 58 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1379 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1378 92 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1377 1 ("no matching clause for Vuna.Compiler.Typecheck.inferClauses")

let v_Vuna_dCompiler_dTypecheck_dcheckFunctionOnce = fun globals decls sigs name st -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme name globals with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("missing type signature: ") ^ (name)))
  | C_Base_dMaybe_dJust (sch) -> (match v_Vuna_dCompiler_dTypecheck_dinstantiate st sch with
  | C_Base_dPair_dPair (expected, st1) -> (match v_Vuna_dCompiler_dTypecheck_dinferClauses globals (v_Vuna_dCompiler_dAst_dclausesFor decls name) st1 with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dTypecheck_dfunLoc name decls) in (let vuna_cat1' = ("in ") in (let vuna_cat2' = (name) in (let vuna_cat3' = (": ") in (let vuna_cat4' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Base_dResult_dOk (C_Base_dPair_dPair (clauseEls, C_Base_dPair_dPair (inferred, st2))) -> (match v_Vuna_dCompiler_dTypecheck_dunify inferred expected st2 with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dTypecheck_dfunLoc name decls) in (let vuna_cat1' = ("in ") in (let vuna_cat2' = (name) in (let vuna_cat3' = (": ") in (let vuna_cat4' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Base_dResult_dOk (st3) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dsolveRecConstraints (v_Vuna_dCompiler_dTypecheck_dtypeNamesOfTC st3) (v_Vuna_dCompiler_dTypecheck_drecordsOf st3) (v_Vuna_dCompiler_dTypecheck_dconstraintsOfTC st3) st3) (fun st4 -> (let resolved = v_Vuna_dCompiler_dTypecheck_dresolveTy (v_Vuna_dCompiler_dTypecheck_dsubstOf st4) inferred in (let genVars = v_Vuna_dCompiler_dTypecheck_dgeneralizableVars name globals resolved in (let needs = v_Vuna_dCompiler_dTypecheck_dcollectNeedsClauses (v_Vuna_dCompiler_dTypecheck_dsubstOf st4) (v_Vuna_dCompiler_dTypecheck_dtraitCtxOf st4) clauseEls in C_Base_dResult_dOk (C_Base_dPair_dPair (clauseEls, C_Base_dPair_dPair (inferred, C_Base_dPair_dPair (needs, C_Base_dPair_dPair (genVars, st4)))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1447 50 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1445 26 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1444 15 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1442 48 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dcheckFunction = fun globals decls sigs name st -> (match v_Vuna_dCompiler_dTypecheck_dcheckFunctionOnce globals decls sigs name st with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (clauses, C_Base_dPair_dPair (inferred, C_Base_dPair_dPair (needs, C_Base_dPair_dPair (genVars, st1))))) -> (let needs1 = v_Vuna_dCompiler_dTypecheck_dfilterNeeds genVars needs in if ((let rec vuna_ueq_ulist_ugo = fun vuna_ueq_ulx vuna_ueq_uly -> (match vuna_ueq_ulx with
  | [] -> (match vuna_ueq_uly with
  | [] -> bi_eq_int 0 0
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | (vuna_ueq_ulh) :: (vuna_ueq_ult) -> (match vuna_ueq_uly with
  | (vuna_ueq_ulh2) :: (vuna_ueq_ult2) -> (if (v_vuna_ueq_uBase_uPair_uPair vuna_ueq_ulh vuna_ueq_ulh2) then (vuna_ueq_ulist_ugo vuna_ueq_ult vuna_ueq_ult2) else false)
  | _ -> bi_eq_int 0 1
  | _ -> vuna_fail "" 0 0 ("case pattern match failure"))
  | _ -> vuna_fail "" 0 0 ("case pattern match failure")) in vuna_ueq_ulist_ugo)) needs1 [] then v_Vuna_dCompiler_dTypecheck_dfinishFunction globals decls sigs name inferred [] genVars clauses st1 else (let resolved = v_Vuna_dCompiler_dTypecheck_dresolveTy (v_Vuna_dCompiler_dTypecheck_dsubstOf st1) inferred in (let scheme1 = C_Vuna_dCompiler_dTypecheck_dScheme (genVars, needs1, resolved) in (let globals2 = v_Vuna_dCompiler_dTypecheck_dupdateScheme name scheme1 globals in (match v_Vuna_dCompiler_dTypecheck_dcheckFunctionOnce globals2 decls sigs name st1 with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (clauses2, C_Base_dPair_dPair (inferred2, C_Base_dPair_dPair (needs2, C_Base_dPair_dPair (genVars2, st2))))) -> v_Vuna_dCompiler_dTypecheck_dfinishFunction globals2 decls sigs name inferred2 (v_Vuna_dCompiler_dTypecheck_dfilterNeeds genVars2 needs2) genVars2 clauses2 st2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1496 10 ("case pattern match failure"))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1483 44 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dcheckFunctions = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (globals, decls, sigs, [], st, elabMap) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse elabMap, C_Base_dPair_dPair (globals, st)))
  | (globals, decls, sigs, (name) :: (rest), st, elabMap) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcheckFunction globals decls sigs name st) (fun p -> (match p with
  | C_Base_dPair_dPair (clauseEls, C_Base_dPair_dPair (globals2, st1)) -> v_Vuna_dCompiler_dTypecheck_dcheckFunctions globals2 decls sigs rest st1 ((C_Base_dPair_dPair (name, clauseEls)) :: (elabMap))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1503 121 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 1502 1 ("no matching clause for Vuna.Compiler.Typecheck.checkFunctions")

let v_Vuna_dCompiler_dTypecheck_dpatternLocals = fun globals locals pat value -> (match v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals (C_Vuna_dCompiler_dTypecheck_dTC (0, C_Vuna_dCompiler_dTypecheck_dTsLeaf, [], [], [], [], C_Vuna_dCompiler_dTypecheck_dTraitCtx ([], [], [], [], []))) value with
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, _), _)) -> v_Vuna_dCompiler_dTypecheck_dpatVarsTy pat ty
  | C_Base_dResult_dErr (_) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2384 42 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dletLocals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (globals, locals, []) -> []
  | (globals, locals, (C_Base_dPair_dPair (pat, value)) :: (rest)) -> (let patTys = v_Vuna_dCompiler_dTypecheck_dpatternLocals globals locals pat value in v_Base_dList_dappend patTys (v_Vuna_dCompiler_dTypecheck_dletLocals globals locals rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2378 1 ("no matching clause for Vuna.Compiler.Typecheck.letLocals")

let v_Vuna_dCompiler_dTypecheck_dcaseWarnings = fun globals decls locals scrut alts sp -> (match v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals (C_Vuna_dCompiler_dTypecheck_dTC (0, C_Vuna_dCompiler_dTypecheck_dTsLeaf, [], [], [], [], C_Vuna_dCompiler_dTypecheck_dTraitCtx ([], [], [], [], []))) scrut with
  | C_Base_dResult_dErr (_) -> []
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, _), _)) -> (let ctors = v_Vuna_dCompiler_dTypecheck_dtyCtorNames decls ty in if v_vuna_ueq_ugeneric ctors [] then [] else (let pats = v_Base_dList_dmap v_Base_dPair_dfirstOf alts in (let exhaustive = (if (v_Vuna_dCompiler_dTypecheck_dhasCatchAll pats) then true else (v_Vuna_dCompiler_dTypecheck_dallCtorsCovered pats ctors)) in (let nonEx = if exhaustive then [] else (((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": non-exhaustive case"))) :: ([]) in v_Base_dList_dappend nonEx (v_Vuna_dCompiler_dTypecheck_dredundantWarnings pats)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2400 51 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dTypecheck_dexprWarnings = fun globals decls locals e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> []
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> []
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> []
  | C_Vuna_dCompiler_dAst_dELam (ps, body, sp) -> (match v_Vuna_dCompiler_dTypecheck_dinferExpr globals locals (C_Vuna_dCompiler_dTypecheck_dTC (0, C_Vuna_dCompiler_dTypecheck_dTsLeaf, [], [], [], [], C_Vuna_dCompiler_dTypecheck_dTraitCtx ([], [], [], [], []))) e with
  | C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (ty, _), _)) -> (let pty = v_Vuna_dCompiler_dTypecheck_dflattenFun ty in v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls (v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dzipLocals ps pty) locals) body)
  | C_Base_dResult_dErr (_) -> v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls locals body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2359 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls locals) ((fn) :: (args))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, _, sp) -> (let locals2 = v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dletLocals globals locals binds) locals in v_Base_dList_dappend (v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypecheck_dbindWarnings globals decls) binds) (v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls locals2 body))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dcaseWarnings globals decls locals scrut alts sp) (v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls locals scrut) (v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypecheck_daltWarnings globals decls locals) alts))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, sp) -> v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls locals) ((c) :: ((t) :: ((e) :: ([]))))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2355 39 ("case pattern match failure"))
and v_Vuna_dCompiler_dTypecheck_daltWarnings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, decls, locals, C_Base_dPair_dPair (pat, body)) -> v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls locals body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2376 1 ("no matching clause for Vuna.Compiler.Typecheck.altWarnings")

let v_Vuna_dCompiler_dTypecheck_dclauseBodyWarnings = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, decls, paramTys, C_Base_dPair_dPair (pats, body)) -> (let locals = v_Vuna_dCompiler_dTypecheck_dzipLocals (v_Vuna_dCompiler_dTypecheck_dpatsVarNames pats) paramTys in v_Vuna_dCompiler_dTypecheck_dexprWarnings globals decls locals body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2350 1 ("no matching clause for Vuna.Compiler.Typecheck.clauseBodyWarnings")

let v_Vuna_dCompiler_dTypecheck_dfunWarnings = fun globals decls name -> (match v_Vuna_dCompiler_dTypecheck_dlookupScheme name globals with
  | C_Base_dMaybe_dNothing -> []
  | C_Base_dMaybe_dJust (sch) -> (let clauses = v_Vuna_dCompiler_dAst_dclausesFor decls name in (let paramTys = v_Vuna_dCompiler_dTypecheck_dflattenFun (v_Vuna_dCompiler_dTypecheck_dschemeTy sch) in (let bodyWarn = v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypecheck_dclauseBodyWarnings globals decls paramTys) clauses in v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dfunCoverageWarnings decls paramTys clauses) bodyWarn)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2339 34 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dprogramWarnings = fun globals decls -> v_Base_dList_dconcatMap (v_Vuna_dCompiler_dTypecheck_dfunWarnings globals decls) (v_Vuna_dCompiler_dTypecheck_dfunctionNames decls)

let v_Vuna_dCompiler_dTypecheck_dexhaustiveWarningsFor = fun globals decls -> v_Vuna_dCompiler_dTypecheck_dprogramWarnings globals decls

let v_Vuna_dCompiler_dTypecheck_dfinalizeScheme = fun a0 a1 -> match (a0, a1) with
  | (subst, C_Vuna_dCompiler_dTypecheck_dScheme (qs, cons, ty)) -> C_Vuna_dCompiler_dTypecheck_dScheme (qs, v_Base_dList_dmap (fun c -> C_Base_dPair_dPair (v_Base_dPair_dfirstOf c, v_Vuna_dCompiler_dTypecheck_dresolveTy subst (v_Base_dPair_dsecondOf c))) cons, v_Vuna_dCompiler_dTypecheck_dresolveTy subst ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2524 1 ("no matching clause for Vuna.Compiler.Typecheck.finalizeScheme")

let rec v_Vuna_dCompiler_dTypecheck_dfinalizeGlobals = fun subst globals -> (match globals with
  | [] -> []
  | (C_Base_dPair_dPair (name, sch)) :: (rest) -> (C_Base_dPair_dPair (name, v_Vuna_dCompiler_dTypecheck_dfinalizeScheme subst sch)) :: (v_Vuna_dCompiler_dTypecheck_dfinalizeGlobals subst rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2527 33 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElabImpl = fun decls0 -> (match v_Vuna_dCompiler_dTypecheck_dextractRecords decls0 with
  | C_Base_dPair_dPair (records, decls1) -> (let typeNames = v_Vuna_dCompiler_dAst_dtypeNamesOf decls1 in (match v_Vuna_dCompiler_dTypecheck_dprepareTraits typeNames decls1 with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (tctx, C_Base_dPair_dPair (declsT, owners))) -> (match v_Vuna_dCompiler_dTypecheck_ddesugarRecords records declsT with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (decls2) -> (let freshTC = C_Vuna_dCompiler_dTypecheck_dTC (0, C_Vuna_dCompiler_dTypecheck_dTsLeaf, typeNames, records, [], v_Vuna_dCompiler_dTypecheck_dtraitCtxRefs tctx, tctx) in (match v_Vuna_dCompiler_dTypecheck_dcollectSigs typeNames decls2 freshTC with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (sigs, st1)) -> (match v_Vuna_dCompiler_dTypecheck_dcollectCtors typeNames decls2 st1 with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (ctors, st2)) -> (match v_Vuna_dCompiler_dTypecheck_dseedPlaceholders (v_Vuna_dCompiler_dTypecheck_dfunctionNames decls2) sigs st2 with
  | C_Base_dPair_dPair (placeholders, st3) -> (let names = v_Vuna_dCompiler_dTypecheck_dfunctionNames decls2 in (let env0 = v_Base_dList_dappend (v_Vuna_dCompiler_dTypecheck_dbuiltinSchemes ()) (v_Base_dList_dappend ctors (v_Base_dList_dappend sigs placeholders)) in (match v_Vuna_dCompiler_dTypecheck_dcheckFunctions env0 decls2 sigs names st3 [] with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (elab1, C_Base_dPair_dPair (g1, stA))) -> if v_vuna_ueq_uint (v_Vuna_dCompiler_dTypecheck_dtotalConstraints g1) 0 then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dfinalizeGlobals (v_Vuna_dCompiler_dTypecheck_dsubstOf stA) g1, v_Vuna_dCompiler_dTypecheck_drebuildDecls decls2 elab1), owners)) else (match v_Vuna_dCompiler_dTypecheck_dcheckFunctions g1 decls2 sigs names freshTC [] with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (elab2, C_Base_dPair_dPair (g2, stB))) -> if v_vuna_ule_uint (v_Vuna_dCompiler_dTypecheck_dtotalConstraints g2) (v_Vuna_dCompiler_dTypecheck_dtotalConstraints g1) then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dfinalizeGlobals (v_Vuna_dCompiler_dTypecheck_dsubstOf stB) g2, v_Vuna_dCompiler_dTypecheck_drebuildDecls decls2 elab2), owners)) else (match v_Vuna_dCompiler_dTypecheck_dcheckFunctions g2 decls2 sigs names freshTC [] with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (elab3, C_Base_dPair_dPair (g3, stC))) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (v_Vuna_dCompiler_dTypecheck_dfinalizeGlobals (v_Vuna_dCompiler_dTypecheck_dsubstOf stC) g3, v_Vuna_dCompiler_dTypecheck_drebuildDecls decls2 elab3), owners))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2324 28 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2320 26 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2316 22 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2310 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2308 35 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2306 14 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2301 46 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2299 8 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Typecheck.vuna" 2295 35 ("case pattern match failure"))

let v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElab = fun decls0 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcheckClauseArities decls0) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElabImpl decls0) (fun p -> C_Base_dResult_dOk (v_Base_dPair_dfirstOf p)))

let v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElabOwners = fun decls0 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dTypecheck_dcheckClauseArities decls0) (fun _u -> v_Vuna_dCompiler_dTypecheck_dcheckProgramInfoElabImpl decls0)

let rec v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dTVar (v0) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTVar (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 34 38 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTCon (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTCon (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 37 41 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTFun (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTFun (w0, w1) -> (if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 40 41 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTApp (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTApp (w0, w1) -> (if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 43 41 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 33 42 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTy = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uTypecheck_uScheme = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dScheme (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dScheme (w0, w1, w2) -> (if ((if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 52 46 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 51 46 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uScheme = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uScheme x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uTypecheck_uRecConstraint = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dFieldCon (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dFieldCon (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 61 51 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dUpdateCon (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dUpdateCon (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 64 52 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 60 53 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uRecConstraint = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uRecConstraint x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let rec v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTySubst = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dTsLeaf -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTsLeaf -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 73 37 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dTsNode (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTsNode (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v1 w1) else false)) then (v_vuna_ueq_uint v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTySubst v3 w3) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTySubst v4 w4) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 76 52 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 72 47 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTySubst = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTySubst x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let rec v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dXEVar (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEVar (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 85 42 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEInt (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEInt (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 88 42 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEStr (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEStr (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 91 42 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXELam (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXELam (w0, w1, w2) -> (if ((if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 94 45 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEApp (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEApp (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 97 45 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXELet (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXELet (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v1 w1) else false)) then (v_vuna_ueq_ubool v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 100 48 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXECase (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXECase (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v1 w1) else false)) then (v_vuna_ueq_uBase_uList_uList v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 103 49 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEIf (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEIf (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 106 47 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEField (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEField (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 109 50 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXERecUpdate (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr v0 w0) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v1 w1) else false)) then (v_vuna_ueq_uBase_uList_uList v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 112 54 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEFun (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEFun (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 115 45 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEMethod (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 118 51 ("case pattern match failure"))
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst (v0, v1, v2, v3, v4) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dXEMethodInst (w0, w1, w2, w3, w4) -> (if ((if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v3 w3) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v4 w4) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 121 58 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 84 45 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uEExpr = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uEExpr x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uCompiler_uTypecheck_uDictParam = fun x -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dDictParam (v0, v1, v2, v3) -> (let vuna_cat0' = ("(DictParam ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uint v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_ustring v2) in (let vuna_cat6' = (" ") in (let vuna_cat7' = (v_vuna_ushow_ustring v3) in (let vuna_cat8' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "<generated>" 129 49 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uTypecheck_uDictParam = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dDictParam (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dDictParam (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uint v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)) then (v_vuna_ueq_ustr v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 134 52 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 133 49 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uDictParam = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uDictParam x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTraitMethodRef = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dTraitMethodRef (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTraitMethodRef (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uScheme v2 w2) else false)) then (v_vuna_ueq_uint v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 143 57 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 142 54 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTraitMethodRef = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTraitMethodRef x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTraitInst = fun x y -> (match x with
  | C_Vuna_dCompiler_dTypecheck_dTraitInst (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dTypecheck_dTraitInst (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uBase_uMaybe_uMaybe v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTy v2 w2) else false)) then (v_vuna_ueq_uBase_uList_uList v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 152 52 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 151 49 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uTypecheck_uTraitInst = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uTypecheck_uTraitInst x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
