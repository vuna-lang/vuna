open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
type   t_Vuna_dAst_dField =
    C_Vuna_dAst_dField of (string) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dPat =
    C_Vuna_dAst_dPVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPWild of (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPCon of (string) * ((t_Vuna_dAst_dPat) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPStr of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dPRecord of (string) * (((string, t_Vuna_dAst_dPat) t_Vuna_dPair_dPair) list) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dExpr =
    C_Vuna_dAst_dEVar of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEInt of (int) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEStr of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dELam of ((string) list) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEApp of (t_Vuna_dAst_dExpr) * ((t_Vuna_dAst_dExpr) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dELet of (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dPair_dPair) list) * (t_Vuna_dAst_dExpr) * (bool) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dECase of (t_Vuna_dAst_dExpr) * (((t_Vuna_dAst_dPat, t_Vuna_dAst_dExpr) t_Vuna_dPair_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEIf of (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEField of (t_Vuna_dAst_dExpr) * (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dERecord of (string) * (((string, t_Vuna_dAst_dExpr) t_Vuna_dPair_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dERecUpdate of (t_Vuna_dAst_dExpr) * (((string, t_Vuna_dAst_dExpr) t_Vuna_dPair_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEInstSel of (t_Vuna_dAst_dExpr) * (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dEDo of ((t_Vuna_dAst_dDoStmt) list) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dDoStmt =
    C_Vuna_dAst_dDBind of (t_Vuna_dAst_dPat) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDExpr of (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dCtor =
    C_Vuna_dAst_dCtor of (string) * (t_Vuna_dAst_dExpr) * (int) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dDecl =
    C_Vuna_dAst_dDData of (string) * ((string) list) * ((t_Vuna_dAst_dCtor) list) * ((string) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDSig of (string) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDFun of (string) * ((t_Vuna_dAst_dPat) list) * (t_Vuna_dAst_dExpr) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDRecord of (string) * ((string) list) * ((t_Vuna_dAst_dField) list) * ((string) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDTrait of (string) * ((string) list) * (((string, t_Vuna_dAst_dExpr) t_Vuna_dPair_dPair) list) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dDInstance of ((string) t_Vuna_dMaybe_dMaybe) * (bool) * (t_Vuna_dAst_dExpr) * ((t_Vuna_dAst_dDecl) list) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dExportItem =
    C_Vuna_dAst_dXBare of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dXTypeAll of (string) * (t_Vuna_dBase_dSpan)
  | C_Vuna_dAst_dXModule of (string) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dModDecl =
    C_Vuna_dAst_dModDecl of (string) * (bool) * ((t_Vuna_dAst_dExportItem) list) * (t_Vuna_dBase_dSpan)
and   t_Vuna_dAst_dSourceFile =
    C_Vuna_dAst_dSource of ((t_Vuna_dAst_dModDecl) t_Vuna_dMaybe_dMaybe) * ((t_Vuna_dAst_dImport) list) * ((t_Vuna_dAst_dDecl) list)
and   t_Vuna_dAst_dImport =
    C_Vuna_dAst_dImport of (string) * (bool) * ((string) t_Vuna_dMaybe_dMaybe) * (t_Vuna_dBase_dSpan)
let rec show_Vuna_dAst_dField v =
  match v with
  | C_Vuna_dAst_dField (f0, f1, f2) -> show_ctor "Field" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dBase_dSpan) f2]
and show_Vuna_dAst_dPat v =
  match v with
  | C_Vuna_dAst_dPVar (f0, f1) -> show_ctor "PVar" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPWild f0 -> show_ctor "PWild" [(show_Vuna_dBase_dSpan) f0]
  | C_Vuna_dAst_dPCon (f0, f1, f2) -> show_ctor "PCon" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dPInt (f0, f1) -> show_ctor "PInt" [(string_of_int) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPStr (f0, f1) -> show_ctor "PStr" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dPRecord (f0, f1, f2) -> show_ctor "PRecord" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dAst_dPat)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dBase_dSpan) f2]
and show_Vuna_dAst_dExpr v =
  match v with
  | C_Vuna_dAst_dEVar (f0, f1) -> show_ctor "EVar" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dEInt (f0, f1) -> show_ctor "EInt" [(string_of_int) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dEStr (f0, f1) -> show_ctor "EStr" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dELam (f0, f1, f2) -> show_ctor "ELam" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEApp (f0, f1, f2) -> show_ctor "EApp" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dExpr) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dELet (f0, f1, f2, f3) -> show_ctor "ELet" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dAst_dExpr) f1; (show_vbool) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dECase (f0, f1, f2) -> show_ctor "ECase" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_Vuna_dAst_dPat show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEIf (f0, f1, f2, f3) -> show_ctor "EIf" [(show_Vuna_dAst_dExpr) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dAst_dExpr) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dEField (f0, f1, f2) -> show_ctor "EField" [(show_Vuna_dAst_dExpr) f0; (show_vstring) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dERecord (f0, f1, f2) -> show_ctor "ERecord" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dERecUpdate (f0, f1, f2) -> show_ctor "ERecUpdate" [(show_Vuna_dAst_dExpr) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEInstSel (f0, f1, f2) -> show_ctor "EInstSel" [(show_Vuna_dAst_dExpr) f0; (show_vstring) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dEDo (f0, f1) -> show_ctor "EDo" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDoStmt) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dBase_dSpan) f1]
and show_Vuna_dAst_dDoStmt v =
  match v with
  | C_Vuna_dAst_dDBind (f0, f1, f2) -> show_ctor "DBind" [(show_Vuna_dAst_dPat) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dDExpr (f0, f1) -> show_ctor "DExpr" [(show_Vuna_dAst_dExpr) f0; (show_Vuna_dBase_dSpan) f1]
and show_Vuna_dAst_dCtor v =
  match v with
  | C_Vuna_dAst_dCtor (f0, f1, f2, f3) -> show_ctor "Ctor" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1; (string_of_int) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dAst_dDecl v =
  match v with
  | C_Vuna_dAst_dDData (f0, f1, f2, f3, f4) -> show_ctor "DData" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dCtor) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f3; (show_Vuna_dBase_dSpan) f4]
  | C_Vuna_dAst_dDSig (f0, f1, f2) -> show_ctor "DSig" [(show_vstring) f0; (show_Vuna_dAst_dExpr) f1; (show_Vuna_dBase_dSpan) f2]
  | C_Vuna_dAst_dDFun (f0, f1, f2, f3) -> show_ctor "DFun" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dPat) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dAst_dExpr) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dDRecord (f0, f1, f2, f3, f4) -> show_ctor "DRecord" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dField) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f3; (show_Vuna_dBase_dSpan) f4]
  | C_Vuna_dAst_dDTrait (f0, f1, f2, f3) -> show_ctor "DTrait" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f2; (show_Vuna_dBase_dSpan) f3]
  | C_Vuna_dAst_dDInstance (f0, f1, f2, f3, f4) -> show_ctor "DInstance" [((show_Vuna_dMaybe_dMaybe show_vstring)) f0; (show_vbool) f1; (show_Vuna_dAst_dExpr) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f3; (show_Vuna_dBase_dSpan) f4]
and show_Vuna_dAst_dExportItem v =
  match v with
  | C_Vuna_dAst_dXBare (f0, f1) -> show_ctor "XBare" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dXTypeAll (f0, f1) -> show_ctor "XTypeAll" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
  | C_Vuna_dAst_dXModule (f0, f1) -> show_ctor "XModule" [(show_vstring) f0; (show_Vuna_dBase_dSpan) f1]
and show_Vuna_dAst_dModDecl v =
  match v with
  | C_Vuna_dAst_dModDecl (f0, f1, f2, f3) -> show_ctor "ModDecl" [(show_vstring) f0; (show_vbool) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dExportItem) x ^ " " ^ go xs ^ ")" in go v)) f2; (show_Vuna_dBase_dSpan) f3]
and show_Vuna_dAst_dSourceFile v =
  match v with
  | C_Vuna_dAst_dSource (f0, f1, f2) -> show_ctor "Source" [((show_Vuna_dMaybe_dMaybe show_Vuna_dAst_dModDecl)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dImport) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f2]
and show_Vuna_dAst_dImport v =
  match v with
  | C_Vuna_dAst_dImport (f0, f1, f2, f3) -> show_ctor "Import" [(show_vstring) f0; (show_vbool) f1; ((show_Vuna_dMaybe_dMaybe show_vstring)) f2; (show_Vuna_dBase_dSpan) f3]
let v_Vuna_dAst_dpatSpan = fun pat -> (match pat with
  | C_Vuna_dAst_dPVar (name, sp) -> sp
  | C_Vuna_dAst_dPWild (sp) -> sp
  | C_Vuna_dAst_dPCon (name, pats, sp) -> sp
  | C_Vuna_dAst_dPInt (n, sp) -> sp
  | C_Vuna_dAst_dPStr (s, sp) -> sp
  | C_Vuna_dAst_dPRecord (name, fields, sp) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 67 3 ("case pattern match failure"))

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
  | C_Vuna_dAst_dEDo (stmts, sp) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 76 3 ("case pattern match failure"))

let v_Vuna_dAst_ddoStmtSpan = fun stmt -> (match stmt with
  | C_Vuna_dAst_dDBind (pat, expr, sp) -> sp
  | C_Vuna_dAst_dDExpr (expr, sp) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 92 3 ("case pattern match failure"))

let v_Vuna_dAst_ddoStmtExpr = fun stmt -> (match stmt with
  | C_Vuna_dAst_dDBind (pat, expr, sp) -> expr
  | C_Vuna_dAst_dDExpr (expr, sp) -> expr
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 97 3 ("case pattern match failure"))

let v_Vuna_dAst_ddeclSpan = fun decl -> (match decl with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> sp
  | C_Vuna_dAst_dDSig (name, ty, sp) -> sp
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> sp
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> sp
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> sp
  | C_Vuna_dAst_dDInstance (name, isDefault, head, methods, sp) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 102 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, sp)) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 110 1 ("no matching clause for Vuna.Ast.ctorSpan")

let v_Vuna_dAst_dfieldSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (name, ty, sp)) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 112 1 ("no matching clause for Vuna.Ast.fieldSpan")

let v_Vuna_dAst_dfieldName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (name, ty, sp)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 114 1 ("no matching clause for Vuna.Ast.fieldName")

let v_Vuna_dAst_dfieldType = fun a0 -> match a0 with
  | (C_Vuna_dAst_dField (name, ty, sp)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 116 1 ("no matching clause for Vuna.Ast.fieldType")

let v_Vuna_dAst_dimportSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dImport (name, isQualified, alias, sp)) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 121 1 ("no matching clause for Vuna.Ast.importSpan")

let v_Vuna_dAst_dmodDeclSpan = fun a0 -> match a0 with
  | (C_Vuna_dAst_dModDecl (name, explicit, items, sp)) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 123 1 ("no matching clause for Vuna.Ast.modDeclSpan")

let v_Vuna_dAst_dexportItemSpan = fun item -> (match item with
  | C_Vuna_dAst_dXBare (name, sp) -> sp
  | C_Vuna_dAst_dXTypeAll (name, sp) -> sp
  | C_Vuna_dAst_dXModule (name, sp) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 126 3 ("case pattern match failure"))

let rec v_Vuna_dAst_dcollectClauses = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> []
  | ((d) :: (rest), name) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, _) -> if v_vuna_ueq_ustr n name then (C_Vuna_dPair_dPair (pats, body)) :: (v_Vuna_dAst_dcollectClauses rest name) else v_Vuna_dAst_dcollectClauses rest name
  | _ -> v_Vuna_dAst_dcollectClauses rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 133 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 131 1 ("no matching clause for Vuna.Ast.collectClauses")

let v_Vuna_dAst_dclausesFor = fun decls name -> v_Vuna_dAst_dcollectClauses decls name

let v_Vuna_dAst_dfunArity = fun name decls -> (match v_Vuna_dAst_dclausesFor decls name with
  | [] -> C_Vuna_dMaybe_dNothing
  | (C_Vuna_dPair_dPair (pats, body)) :: (_) -> C_Vuna_dMaybe_dJust (v_Vuna_dList_dlength pats)
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 142 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorName = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 146 1 ("no matching clause for Vuna.Ast.ctorName")

let v_Vuna_dAst_dctorType = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 148 1 ("no matching clause for Vuna.Ast.ctorType")

let rec v_Vuna_dAst_dtypeArity = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (x) :: ((rest) :: ([])), _) -> bi_add 1 (v_Vuna_dAst_dtypeArity rest)
  | _ -> 0
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 151 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorArityOf = fun a0 -> match a0 with
  | (C_Vuna_dAst_dCtor (name, ty, arity, _)) -> arity
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 155 1 ("no matching clause for Vuna.Ast.ctorArityOf")

let rec v_Vuna_dAst_dlookupCtorArity = fun name ctors -> (match ctors with
  | [] -> C_Vuna_dMaybe_dNothing
  | (c) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dAst_dctorName c) name then C_Vuna_dMaybe_dJust (v_Vuna_dAst_dctorArityOf c) else v_Vuna_dAst_dlookupCtorArity name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 158 3 ("case pattern match failure"))

let rec v_Vuna_dAst_dctorArity = fun name decls -> (match decls with
  | [] -> C_Vuna_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> (match v_Vuna_dAst_dlookupCtorArity name ctors with
  | C_Vuna_dMaybe_dJust (arity) -> C_Vuna_dMaybe_dJust (arity)
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dAst_dctorArity name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 169 11 ("case pattern match failure"))
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_vuna_ueq_ustr name dname then C_Vuna_dMaybe_dJust (v_Vuna_dList_dlength fields) else v_Vuna_dAst_dctorArity name rest
  | _ -> v_Vuna_dAst_dctorArity name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 167 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 164 3 ("case pattern match failure"))

let v_Vuna_dAst_ddeclNames = fun d -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> (name) :: ([])
  | C_Vuna_dAst_dDSig (name, ty, _) -> (name) :: ([])
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, _) -> v_Vuna_dList_dmap v_Vuna_dAst_dctorName ctors
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, _) -> (dname) :: ([])
  | C_Vuna_dAst_dDTrait (tname, params, methods, _) -> v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf methods
  | C_Vuna_dAst_dDInstance (name, isDefault, head, methods, _) -> (match name with
  | C_Vuna_dMaybe_dNothing -> []
  | C_Vuna_dMaybe_dJust (n) -> (n) :: ([])
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 184 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 177 3 ("case pattern match failure"))

let v_Vuna_dAst_dtopNames = fun decls -> v_Vuna_dList_dconcatMap v_Vuna_dAst_ddeclNames decls

let v_Vuna_dAst_d_udeclCtors = fun d -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, _) -> v_Vuna_dList_dmap v_Vuna_dAst_dctorName ctors
  | C_Vuna_dAst_dDRecord (dname, params, fields, derivings, _) -> (dname) :: ([])
  | C_Vuna_dAst_dDTrait (tname, params, methods, _) -> v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf methods
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 191 3 ("case pattern match failure"))

let v_Vuna_dAst_dctorsOf = fun decls -> v_Vuna_dList_dconcatMap v_Vuna_dAst_d_udeclCtors decls

let v_Vuna_dAst_ddeclTypeNames = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, _) -> (name) :: ([])
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, _) -> (name) :: ([])
  | C_Vuna_dAst_dDTrait (name, params, methods, _) -> (name) :: ([])
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 200 3 ("case pattern match failure"))

let v_Vuna_dAst_dtypeNamesOf = fun decls -> v_Vuna_dList_dconcatMap v_Vuna_dAst_ddeclTypeNames decls

let v_Vuna_dAst_ddeclDerivings = fun d -> (match d with
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, _) -> derivings
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, _) -> derivings
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Ast.vuna" 209 3 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uAst_uPat = fun x y -> (match x with
  | C_Vuna_dAst_dPVar (v0, v1) -> (match y with
  | C_Vuna_dAst_dPVar (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 276 26 ("case pattern match failure"))
  | C_Vuna_dAst_dPWild (v0) -> (match y with
  | C_Vuna_dAst_dPWild (w0) -> v_vuna_ueq_uVuna_uBase_uSpan v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 279 24 ("case pattern match failure"))
  | C_Vuna_dAst_dPCon (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dPCon (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 282 29 ("case pattern match failure"))
  | C_Vuna_dAst_dPInt (v0, v1) -> (match y with
  | C_Vuna_dAst_dPInt (w0, w1) -> (if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 285 26 ("case pattern match failure"))
  | C_Vuna_dAst_dPStr (v0, v1) -> (match y with
  | C_Vuna_dAst_dPStr (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 288 26 ("case pattern match failure"))
  | C_Vuna_dAst_dPRecord (v0, v1, v2) -> (match y with
  | C_Vuna_dAst_dPRecord (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 291 32 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 275 28 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uPat = fun x y -> if v_vuna_ueq_uVuna_uAst_uPat x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uAst_uExportItem = fun x -> (match x with
  | C_Vuna_dAst_dXBare (v0, v1) -> (let vuna_cat0' = ("(XBare ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uSpan v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dAst_dXTypeAll (v0, v1) -> (let vuna_cat0' = ("(XTypeAll ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uSpan v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | C_Vuna_dAst_dXModule (v0, v1) -> (let vuna_cat0' = ("(XModule ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uSpan v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 299 35 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uAst_uExportItem = fun x y -> (match x with
  | C_Vuna_dAst_dXBare (v0, v1) -> (match y with
  | C_Vuna_dAst_dXBare (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 306 27 ("case pattern match failure"))
  | C_Vuna_dAst_dXTypeAll (v0, v1) -> (match y with
  | C_Vuna_dAst_dXTypeAll (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 309 30 ("case pattern match failure"))
  | C_Vuna_dAst_dXModule (v0, v1) -> (match y with
  | C_Vuna_dAst_dXModule (w0, w1) -> (if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uBase_uSpan v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 312 29 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 305 35 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uExportItem = fun x y -> if v_vuna_ueq_uVuna_uAst_uExportItem x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uModDecl = fun x y -> (match x with
  | C_Vuna_dAst_dModDecl (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dModDecl (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ubool v1 w1) else false)) then (v_vuna_ueq_uVuna_uList_uList v2 w2) else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 321 35 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 320 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uModDecl = fun x y -> if v_vuna_ueq_uVuna_uAst_uModDecl x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uAst_uImport = fun x y -> (match x with
  | C_Vuna_dAst_dImport (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dAst_dImport (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ubool v1 w1) else false)) then (v_vuna_ueq_uVuna_uMaybe_uMaybe v2 w2) else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 330 34 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 329 31 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uAst_uImport = fun x y -> if v_vuna_ueq_uVuna_uAst_uImport x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
