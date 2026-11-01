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
open Vuna_dCompiler_dTypecheck
open Vuna_dCompiler_dSplit
open Vuna_dCompiler_dTypedCodegen
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
type   t_Vuna_dCompiler_dDtRecords_dRecordInfo =
    C_Vuna_dCompiler_dDtRecords_dRecordInfo of (string) * ((string) list) * (((string, t_Vuna_dCompiler_dAst_dExpr) t_Base_dPair_dPair) list) * ((string) list) * (string)
let show_Vuna_dCompiler_dDtRecords_dRecordInfo v =
  match v with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo (f0, f1, f2, f3, f4) -> show_ctor "RecordInfo" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dAst_dExpr)) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f3; (show_vstring) f4]
let v_Vuna_dCompiler_dDtRecords_drecordInfoName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dDtRecords_dRecordInfo (name, params, fields, derivings, ctor)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 22 1 ("no matching clause for Vuna.Compiler.DtRecords.recordInfoName")

let v_Vuna_dCompiler_dDtRecords_drecordInfoParams = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dDtRecords_dRecordInfo (name, params, fields, derivings, ctor)) -> params
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 24 1 ("no matching clause for Vuna.Compiler.DtRecords.recordInfoParams")

let v_Vuna_dCompiler_dDtRecords_drecordInfoFields = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dDtRecords_dRecordInfo (name, params, fields, derivings, ctor)) -> fields
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 26 1 ("no matching clause for Vuna.Compiler.DtRecords.recordInfoFields")

let v_Vuna_dCompiler_dDtRecords_drecordInfoDerivings = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dDtRecords_dRecordInfo (name, params, fields, derivings, ctor)) -> derivings
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 28 1 ("no matching clause for Vuna.Compiler.DtRecords.recordInfoDerivings")

let v_Vuna_dCompiler_dDtRecords_drecordInfoCtor = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dDtRecords_dRecordInfo (name, params, fields, derivings, ctor)) -> ctor
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 30 1 ("no matching clause for Vuna.Compiler.DtRecords.recordInfoCtor")

let rec v_Vuna_dCompiler_dDtRecords_dlookupRecord = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Vuna_dCompiler_dDtRecords_dRecordInfo (rname, params, fields, derivings, ctor)) :: (rest)) -> if v_vuna_ueq_ustr rname name then C_Base_dMaybe_dJust (C_Vuna_dCompiler_dDtRecords_dRecordInfo (rname, params, fields, derivings, ctor)) else v_Vuna_dCompiler_dDtRecords_dlookupRecord name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 32 1 ("no matching clause for Vuna.Compiler.DtRecords.lookupRecord")

let rec v_Vuna_dCompiler_dDtRecords_dfieldNamesOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Base_dPair_dPair (n, t)) :: (rest)) -> (n) :: (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 37 1 ("no matching clause for Vuna.Compiler.DtRecords.fieldNamesOf")

let rec v_Vuna_dCompiler_dDtRecords_dfieldIndexAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (fname, [], i) -> C_Base_dMaybe_dNothing
  | (fname, (C_Base_dPair_dPair (n, t)) :: (rest), i) -> if v_vuna_ueq_ugeneric n fname then C_Base_dMaybe_dJust (i) else v_Vuna_dCompiler_dDtRecords_dfieldIndexAt fname rest (bi_add i 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 40 1 ("no matching clause for Vuna.Compiler.DtRecords.fieldIndexAt")

let v_Vuna_dCompiler_dDtRecords_dfieldIndex = fun fname fields -> v_Vuna_dCompiler_dDtRecords_dfieldIndexAt fname fields 0

let rec v_Vuna_dCompiler_dDtRecords_dlookupProvided = fun a0 a1 -> match (a0, a1) with
  | (fname, []) -> C_Base_dMaybe_dNothing
  | (fname, (C_Base_dPair_dPair (n, e)) :: (rest)) -> if v_vuna_ueq_ustr n fname then C_Base_dMaybe_dJust (e) else v_Vuna_dCompiler_dDtRecords_dlookupProvided fname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 47 1 ("no matching clause for Vuna.Compiler.DtRecords.lookupProvided")

let rec v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames = fun a0 -> match a0 with
  | ([]) -> false
  | ((C_Base_dPair_dPair (n, e)) :: (rest)) -> (match v_Vuna_dCompiler_dDtRecords_dlookupProvided n rest with
  | C_Base_dMaybe_dJust (_) -> true
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 52 47 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 51 1 ("no matching clause for Vuna.Compiler.DtRecords.hasDuplicateFieldNames")

let v_Vuna_dCompiler_dDtRecords_dmissingFieldMsg = fun sp fname -> (let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": missing field ") in (let vuna_cat2' = (fname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg = fun sp fname -> (let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown field ") in (let vuna_cat2' = (fname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg = fun sp -> ((v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) ^ (": duplicate field"))

let rec v_Vuna_dCompiler_dDtRecords_dhasUnknownFields = fun a0 a1 -> match (a0, a1) with
  | (fieldNames, []) -> false
  | (fieldNames, (C_Base_dPair_dPair (n, v)) :: (rest)) -> if v_Base_dList_dmemName n fieldNames then v_Vuna_dCompiler_dDtRecords_dhasUnknownFields fieldNames rest else true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 62 1 ("no matching clause for Vuna.Compiler.DtRecords.hasUnknownFields")

let rec v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (sp, fieldNames, []) -> v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg sp ""
  | (sp, fieldNames, (C_Base_dPair_dPair (n, v)) :: (rest)) -> if v_Base_dList_dmemName n fieldNames then v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg sp fieldNames rest else v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg sp n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 66 1 ("no matching clause for Vuna.Compiler.DtRecords.firstUnknownFieldMsg")

let rec v_Vuna_dCompiler_dDtRecords_dcheckProvidedFields = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (fieldNames, [], sp) -> C_Base_dResult_dOk ([])
  | (fieldNames, (C_Base_dPair_dPair (n, v)) :: (rest), sp) -> if v_Base_dList_dmemName n fieldNames then v_Vuna_dCompiler_dDtRecords_dcheckProvidedFields fieldNames rest sp else C_Base_dResult_dErr (v_Vuna_dCompiler_dDtRecords_dunknownFieldMsg sp n)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 70 1 ("no matching clause for Vuna.Compiler.DtRecords.checkProvidedFields")

let v_Vuna_dCompiler_dDtRecords_drecordFieldPair = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dField (fname, ty, sp)) -> C_Base_dPair_dPair (fname, ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 86 1 ("no matching clause for Vuna.Compiler.DtRecords.recordFieldPair")

let v_Vuna_dCompiler_dDtRecords_drecordParamVarExprs = fun params sp -> v_Base_dList_dmap (fun p -> C_Vuna_dCompiler_dAst_dEVar (p, sp)) params

let v_Vuna_dCompiler_dDtRecords_drecordRetType = fun dname params sp -> C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (dname, sp), v_Vuna_dCompiler_dDtRecords_drecordParamVarExprs params sp, sp)

let rec v_Vuna_dCompiler_dDtRecords_drecordArrowType = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], ret, sp) -> ret
  | ((f) :: (fs), ret, sp) -> C_Vuna_dCompiler_dAst_dEPi ("_", false, v_Vuna_dCompiler_dAst_dfieldType f, v_Vuna_dCompiler_dDtRecords_drecordArrowType fs ret sp, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 96 1 ("no matching clause for Vuna.Compiler.DtRecords.recordArrowType")

let v_Vuna_dCompiler_dDtRecords_drecordDeclToData = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp), ctor) -> C_Vuna_dCompiler_dAst_dDData (dname, params, C_Vuna_dCompiler_dAst_dEVar ("Type", sp), (C_Vuna_dCompiler_dAst_dCtor (ctor, v_Vuna_dCompiler_dDtRecords_drecordArrowType fields (v_Vuna_dCompiler_dDtRecords_drecordRetType dname params sp) sp, v_Base_dList_dlength fields, sp)) :: ([]), derivings, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 99 1 ("no matching clause for Vuna.Compiler.DtRecords.recordDeclToData")

let rec v_Vuna_dCompiler_dDtRecords_drecordsOfDecls = fun a0 a1 -> match (a0, a1) with
  | (ctorOf, []) -> C_Base_dPair_dPair ([], [])
  | (ctorOf, (d) :: (rest)) -> (match v_Vuna_dCompiler_dDtRecords_drecordsOfDecls ctorOf rest with
  | C_Base_dPair_dPair (recs, ds) -> (match d with
  | C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp) -> (let info = C_Vuna_dCompiler_dDtRecords_dRecordInfo (dname, params, v_Base_dList_dmap v_Vuna_dCompiler_dDtRecords_drecordFieldPair fields, derivings, ctorOf dname) in C_Base_dPair_dPair ((info) :: (recs), (v_Vuna_dCompiler_dDtRecords_drecordDeclToData d (ctorOf dname)) :: (ds)))
  | _ -> C_Base_dPair_dPair (recs, (d) :: (ds))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 79 19 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 78 37 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 77 1 ("no matching clause for Vuna.Compiler.DtRecords.recordsOfDecls")

let rec v_Vuna_dCompiler_dDtRecords_ddesugarPattern = fun records pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPWild (sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPWild (sp))
  | C_Vuna_dCompiler_dAst_dPVar (n, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPVar (n, sp))
  | C_Vuna_dCompiler_dAst_dPInt (n, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPInt (n, sp))
  | C_Vuna_dCompiler_dAst_dPStr (s, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPStr (s, sp))
  | C_Vuna_dCompiler_dAst_dPCon (name, pats, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarPattern records) pats) (fun ps -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPCon (name, ps, sp)))
  | C_Vuna_dCompiler_dAst_dPRecord (name, fields, sp) -> (match v_Vuna_dCompiler_dDtRecords_dlookupRecord name records with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown record: ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dDtRecords_dRecordInfo (rname, params, fdefs, derivings, ctor)) -> if v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg sp) else if v_Vuna_dCompiler_dDtRecords_dhasUnknownFields (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf fdefs) fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg sp (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf fdefs) fields) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields records fdefs fields sp) (fun ps -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dPCon (ctor, ps, sp)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 128 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 121 30 ("case pattern match failure"))
and v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (records, [], provided, sp) -> C_Base_dResult_dOk ([])
  | (records, (C_Base_dPair_dPair (fname, fty)) :: (rest), provided, sp) -> (match v_Vuna_dCompiler_dDtRecords_dlookupProvided fname provided with
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields records rest provided sp) (fun ps -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dPWild (sp)) :: (ps)))
  | C_Base_dMaybe_dJust (p) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarPattern records p) (fun p2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarRecordPatternFields records rest provided sp) (fun ps -> C_Base_dResult_dOk ((p2) :: (ps))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 136 77 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 135 1 ("no matching clause for Vuna.Compiler.DtRecords.desugarRecordPatternFields")

let rec v_Vuna_dCompiler_dDtRecords_drecordsWithField = fun a0 a1 -> match (a0, a1) with
  | (fname, []) -> []
  | (fname, (r) :: (rest)) -> (match r with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo (rname, params, fdefs, derivings, ctor) -> if v_Base_dList_dmemName fname (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf fdefs) then (r) :: (v_Vuna_dCompiler_dDtRecords_drecordsWithField fname rest) else v_Vuna_dCompiler_dDtRecords_drecordsWithField fname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 206 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 205 1 ("no matching clause for Vuna.Compiler.DtRecords.recordsWithField")

let rec v_Vuna_dCompiler_dDtRecords_dfieldAccessPats = fun a0 a1 -> match (a0, a1) with
  | (fname, []) -> []
  | (fname, (C_Base_dPair_dPair (f, alt)) :: (rest)) -> (if v_vuna_ueq_ustr f fname then C_Vuna_dCompiler_dAst_dPVar (f, v_Vuna_dCompiler_dAst_dexprSpan alt) else C_Vuna_dCompiler_dAst_dPWild (v_Vuna_dCompiler_dAst_dexprSpan alt)) :: (v_Vuna_dCompiler_dDtRecords_dfieldAccessPats fname rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 223 1 ("no matching clause for Vuna.Compiler.DtRecords.fieldAccessPats")

let v_Vuna_dCompiler_dDtRecords_dfieldAccessExpr = fun info fname b sp -> (match info with
  | C_Vuna_dCompiler_dDtRecords_dRecordInfo (rname, params, fdefs, derivings, ctor) -> (let pats = v_Vuna_dCompiler_dDtRecords_dfieldAccessPats fname fdefs in let body = C_Vuna_dCompiler_dAst_dEVar (fname, sp) in let alt = C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (ctor, pats, sp), body) in C_Vuna_dCompiler_dAst_dECase (b, (alt) :: ([]), sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 213 35 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dDtRecords_ddesugarExpr = fun records e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> C_Base_dResult_dOk (e)
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Base_dResult_dOk (e)
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Base_dResult_dOk (e)
  | C_Vuna_dCompiler_dAst_dELam (ps, b, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records b) (fun b2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dELam (ps, b2, sp)))
  | C_Vuna_dCompiler_dAst_dEApp (f, args, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records f) (fun f2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records) args) (fun a2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (f2, a2, sp))))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarBind records) binds) (fun b2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records body) (fun body2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dELet (b2, body2, rec_u, sp))))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records scrut) (fun s2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarAlt records) alts) (fun a2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dECase (s2, a2, sp))))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, el, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records c) (fun c2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records t) (fun t2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records el) (fun e2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEIf (c2, t2, e2, sp)))))
  | C_Vuna_dCompiler_dAst_dEField (base, fname, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records base) (fun b -> (match v_Vuna_dCompiler_dDtRecords_drecordsWithField fname records with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown field ") in (let vuna_cat2' = (fname) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (one) :: ([]) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dDtRecords_dfieldAccessExpr one fname b sp)
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": ambiguous field ") in (let vuna_cat2' = (fname) in (let vuna_cat3' = (" (declared by multiple records)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 161 69 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dERecord (name, fields, sp) -> (match v_Vuna_dCompiler_dDtRecords_dlookupRecord name records with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": unknown record: ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dDtRecords_dRecordInfo (rname, params, fdefs, derivings, ctor)) -> if v_Vuna_dCompiler_dDtRecords_dhasDuplicateFieldNames fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dDtRecords_dduplicateFieldMsg sp) else if v_Vuna_dCompiler_dDtRecords_dhasUnknownFields (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf fdefs) fields then C_Base_dResult_dErr (v_Vuna_dCompiler_dDtRecords_dfirstUnknownFieldMsg sp (v_Vuna_dCompiler_dDtRecords_dfieldNamesOf fdefs) fields) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarRecordValues records fdefs fields sp) (fun vs -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar (ctor, sp), vs, sp)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 166 29 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records base) (fun b -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarFieldValue records) fields) (fun fs -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dERecUpdate (b, fs, sp))))
  | C_Vuna_dCompiler_dAst_dEInstSel (m, n, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records m) (fun m2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEInstSel (m2, n, sp)))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records dom) (fun d2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records cod) (fun c2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEPi (name, implicit, d2, c2, sp))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 144 25 ("case pattern match failure"))
and v_Vuna_dCompiler_dDtRecords_ddesugarRecordValues = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (records, [], provided, sp) -> C_Base_dResult_dOk ([])
  | (records, (C_Base_dPair_dPair (fname, fty)) :: (rest), provided, sp) -> (match v_Vuna_dCompiler_dDtRecords_dlookupProvided fname provided with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr (v_Vuna_dCompiler_dDtRecords_dmissingFieldMsg sp fname)
  | C_Base_dMaybe_dJust (v) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records v) (fun v2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarRecordValues records rest provided sp) (fun vs -> C_Base_dResult_dOk ((v2) :: (vs))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 183 70 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 182 1 ("no matching clause for Vuna.Compiler.DtRecords.desugarRecordValues")
and v_Vuna_dCompiler_dDtRecords_ddesugarFieldValue = fun a0 a1 -> match (a0, a1) with
  | (records, C_Base_dPair_dPair (fname, v)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records v) (fun v2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (fname, v2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 190 1 ("no matching clause for Vuna.Compiler.DtRecords.desugarFieldValue")
and v_Vuna_dCompiler_dDtRecords_ddesugarBind = fun a0 a1 -> match (a0, a1) with
  | (records, C_Base_dPair_dPair (pat, value)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarPattern records pat) (fun p2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records value) (fun v2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (p2, v2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 194 1 ("no matching clause for Vuna.Compiler.DtRecords.desugarBind")
and v_Vuna_dCompiler_dDtRecords_ddesugarAlt = fun a0 a1 -> match (a0, a1) with
  | (records, C_Base_dPair_dPair (pat, body)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarPattern records pat) (fun p2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records body) (fun b2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (p2, b2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 199 1 ("no matching clause for Vuna.Compiler.DtRecords.desugarAlt")

let rec v_Vuna_dCompiler_dDtRecords_ddesugarRecordDecl = fun records d -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarPattern records) pats) (fun pats2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_ddesugarExpr records body) (fun body2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDFun (name, pats2, body2, sp))))
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> C_Base_dResult_dOk (d)
  | C_Vuna_dCompiler_dAst_dDRecord (name, params, fields, derivings, sp) -> C_Base_dResult_dOk (d)
  | C_Vuna_dCompiler_dAst_dDTrait (name, params, methods, sp) -> C_Base_dResult_dOk (d)
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, methods, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarRecordDecl records) methods) (fun ms -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, ms, sp)))
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> C_Base_dResult_dOk (d)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/DtRecords.vuna" 109 31 ("case pattern match failure"))

let v_Vuna_dCompiler_dDtRecords_ddesugarRecords = fun records decls -> v_Base_dResult_dtraverse (v_Vuna_dCompiler_dDtRecords_ddesugarRecordDecl records) decls

let v_Vuna_dCompiler_dDtRecords_dctorName = fun dname -> (("Mk") ^ (dname))

let v_Vuna_dCompiler_dDtRecords_dprepareDecls = fun decls0 -> (let split = v_Vuna_dCompiler_dDtRecords_drecordsOfDecls v_Vuna_dCompiler_dDtRecords_dctorName decls0 in let records = v_Base_dPair_dfirstOf split in let decls = v_Base_dPair_dsecondOf split in v_Vuna_dCompiler_dDtRecords_ddesugarRecords records decls)
