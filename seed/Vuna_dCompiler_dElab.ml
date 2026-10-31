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
type   t_Vuna_dCompiler_dElab_dDtDef =
    C_Vuna_dCompiler_dElab_dDtDef of (string) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dElab_dDtCtor =
    C_Vuna_dCompiler_dElab_dDtCtor of (string) * (string) * (((string, bool) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dElab_dDtData =
    C_Vuna_dCompiler_dElab_dDtData of (string) * (((string, bool) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dElab_dDtCtor) list)
and   t_Vuna_dCompiler_dElab_dEc =
    C_Vuna_dCompiler_dElab_dEc of (int) * (((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list) * (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dElab_dDtData) list)
and   t_Vuna_dCompiler_dElab_dCtx =
    C_Vuna_dCompiler_dElab_dCtx of (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) * (((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list)
let rec show_Vuna_dCompiler_dElab_dDtDef v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtDef (f0, f1, f2) -> show_ctor "DtDef" [(show_vstring) f0; (show_Vuna_dCompiler_dCore_dTerm) f1; (show_Vuna_dCompiler_dCore_dTerm) f2]
and show_Vuna_dCompiler_dElab_dDtCtor v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtCtor (f0, f1, f2, f3) -> show_ctor "DtCtor" [(show_vstring) f0; (show_vstring) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vbool)) x ^ " " ^ go xs ^ ")" in go v)) f2; (show_Vuna_dCompiler_dCore_dTerm) f3]
and show_Vuna_dCompiler_dElab_dDtData v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtData (f0, f1, f2) -> show_ctor "DtData" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vbool)) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtCtor) x ^ " " ^ go xs ^ ")" in go v)) f2]
and show_Vuna_dCompiler_dElab_dEc v =
  match v with
  | C_Vuna_dCompiler_dElab_dEc (f0, f1, f2, f3) -> show_ctor "Ec" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair string_of_int show_Vuna_dCompiler_dCore_dValue)) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtData) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dCompiler_dElab_dCtx v =
  match v with
  | C_Vuna_dCompiler_dElab_dCtx (f0, f1) -> show_ctor "Ctx" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair string_of_int show_Vuna_dCompiler_dCore_dValue)) x ^ " " ^ go xs ^ ")" in go v)) f1]
let v_Vuna_dCompiler_dElab_ddtDefName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtDef (name, ty, body)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 19 1 ("no matching clause for Vuna.Compiler.Elab.dtDefName")

let v_Vuna_dCompiler_dElab_ddtDefType = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtDef (name, ty, body)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 21 1 ("no matching clause for Vuna.Compiler.Elab.dtDefType")

let v_Vuna_dCompiler_dElab_ddtDefBody = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtDef (name, ty, body)) -> body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 23 1 ("no matching clause for Vuna.Compiler.Elab.dtDefBody")

let v_Vuna_dCompiler_dElab_ddtCtorName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 30 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorName")

let v_Vuna_dCompiler_dElab_ddtCtorFamily = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> family
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 32 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorFamily")

let v_Vuna_dCompiler_dElab_ddtCtorTelescope = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> tele
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 34 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorTelescope")

let v_Vuna_dCompiler_dElab_ddtCtorType = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 36 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorType")

let v_Vuna_dCompiler_dElab_ddtDataName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtData (name, params, ctors)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 42 1 ("no matching clause for Vuna.Compiler.Elab.dtDataName")

let v_Vuna_dCompiler_dElab_ddtDataParams = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtData (name, params, ctors)) -> params
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 44 1 ("no matching clause for Vuna.Compiler.Elab.dtDataParams")

let v_Vuna_dCompiler_dElab_ddtDataCtors = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtData (name, params, ctors)) -> ctors
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 46 1 ("no matching clause for Vuna.Compiler.Elab.dtDataCtors")

let v_Vuna_dCompiler_dElab_decNext = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas)) -> next
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 53 1 ("no matching clause for Vuna.Compiler.Elab.ecNext")

let v_Vuna_dCompiler_dElab_decSols = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas)) -> sols
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 55 1 ("no matching clause for Vuna.Compiler.Elab.ecSols")

let v_Vuna_dCompiler_dElab_decDefs = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas)) -> defs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 57 1 ("no matching clause for Vuna.Compiler.Elab.ecDefs")

let v_Vuna_dCompiler_dElab_decDatas = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas)) -> datas
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 59 1 ("no matching clause for Vuna.Compiler.Elab.ecDatas")

let v_Vuna_dCompiler_dElab_decPutSols = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas), sols2) -> C_Vuna_dCompiler_dElab_dEc (next, sols2, defs, datas)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 62 1 ("no matching clause for Vuna.Compiler.Elab.ecPutSols")

let v_Vuna_dCompiler_dElab_decAddDef = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas), d) -> C_Vuna_dCompiler_dElab_dEc (next, sols, v_Base_dList_dappend defs ((d) :: ([])), datas)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 65 1 ("no matching clause for Vuna.Compiler.Elab.ecAddDef")

let v_Vuna_dCompiler_dElab_decAddData = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas), d) -> C_Vuna_dCompiler_dElab_dEc (next, sols, defs, v_Base_dList_dappend datas ((d) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 68 1 ("no matching clause for Vuna.Compiler.Elab.ecAddData")

let v_Vuna_dCompiler_dElab_dctxItems = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> items
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 77 1 ("no matching clause for Vuna.Compiler.Elab.ctxItems")

let v_Vuna_dCompiler_dElab_dctxRefs = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> refs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 79 1 ("no matching clause for Vuna.Compiler.Elab.ctxRefs")

let v_Vuna_dCompiler_dElab_dctxDepth = fun ctx -> v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dctxItems ctx)

let v_Vuna_dCompiler_dElab_dctxBind = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, ty, C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> C_Vuna_dCompiler_dElab_dCtx ((C_Base_dPair_dPair (name, ty)) :: (items), refs)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 85 1 ("no matching clause for Vuna.Compiler.Elab.ctxBind")

let v_Vuna_dCompiler_dElab_dctxBindValue = fun name dom ctx -> v_Vuna_dCompiler_dElab_dctxBind name (v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx) dom) ctx

let v_Vuna_dCompiler_dElab_dctxRefine = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs), more) -> C_Vuna_dCompiler_dElab_dCtx (items, v_Base_dList_dappend refs more)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 93 1 ("no matching clause for Vuna.Compiler.Elab.ctxRefine")

let rec v_Vuna_dCompiler_dElab_dctxLookupAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, [], idx) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest), idx) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (C_Base_dPair_dPair (idx, ty)) else v_Vuna_dCompiler_dElab_dctxLookupAt name rest (bi_add idx 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 96 1 ("no matching clause for Vuna.Compiler.Elab.ctxLookupAt")

let v_Vuna_dCompiler_dElab_dctxLookup = fun name ctx -> v_Vuna_dCompiler_dElab_dctxLookupAt name (v_Vuna_dCompiler_dElab_dctxItems ctx) 0

let rec v_Vuna_dCompiler_dElab_dctxEnvAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], idx, depth) -> []
  | ((C_Base_dPair_dPair (name, ty)) :: (rest), idx, depth) -> (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, bi_sub (bi_sub depth idx) 1, []))) :: (v_Vuna_dCompiler_dElab_dctxEnvAt rest (bi_add idx 1) depth)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 105 1 ("no matching clause for Vuna.Compiler.Elab.ctxEnvAt")

let v_Vuna_dCompiler_dElab_dctxEnv = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> v_Vuna_dCompiler_dElab_dctxEnvAt items 0 (v_Base_dList_dlength items)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 110 1 ("no matching clause for Vuna.Compiler.Elab.ctxEnv")

let rec v_Vuna_dCompiler_dElab_drefineLookup = fun a0 a1 -> match (a0, a1) with
  | (lvl, []) -> C_Base_dMaybe_dNothing
  | (lvl, (C_Base_dPair_dPair (l, v)) :: (rest)) -> if v_vuna_ueq_uint l lvl then C_Base_dMaybe_dJust (v) else v_Vuna_dCompiler_dElab_drefineLookup lvl rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 135 1 ("no matching clause for Vuna.Compiler.Elab.refineLookup")

let rec v_Vuna_dCompiler_dElab_drefineValue = fun refs fuel v -> if v_vuna_ule_uint fuel 0 then v else (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, lvl, sp) -> (let sp2 = v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) sp in (match v_Vuna_dCompiler_dElab_drefineLookup lvl refs with
  | C_Base_dMaybe_dJust (r) -> v_Vuna_dCompiler_dCore_dapplySpine (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) r) sp2
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, lvl, sp2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 122 10 ("case pattern match failure")))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 118 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> C_Vuna_dCompiler_dCore_dVCon (c, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) args)
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> C_Vuna_dCompiler_dCore_dVCase (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) scrut, alts)
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> C_Vuna_dCompiler_dCore_dVIf (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) c, v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) th, v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) el)
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> C_Vuna_dCompiler_dCore_dVMeta (m, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) sp)
  | _ -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 117 6 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_devalCtx = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs), ty) -> v_Vuna_dCompiler_dElab_drefineValue refs v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnvAt items 0 (v_Base_dList_dlength items)) ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 140 1 ("no matching clause for Vuna.Compiler.Elab.evalCtx")

let v_Vuna_dCompiler_dElab_dvarTypeValue = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs), idx, ty) -> v_Vuna_dCompiler_dElab_drefineValue refs v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnvAt items 0 (v_Base_dList_dlength items)) (v_Vuna_dCompiler_dCore_dshift 0 (bi_add idx 1) ty))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 145 1 ("no matching clause for Vuna.Compiler.Elab.varTypeValue")

let v_Vuna_dCompiler_dElab_demptyCtx = C_Vuna_dCompiler_dElab_dCtx ([], [])

let v_Vuna_dCompiler_dElab_derrAt = fun sp msg -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (msg) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dCompiler_dElab_dnewMeta = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas)) -> C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTMeta (next), C_Vuna_dCompiler_dElab_dEc (bi_add next 1, sols, defs, datas))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 158 1 ("no matching clause for Vuna.Compiler.Elab.newMeta")

let v_Vuna_dCompiler_dElab_dforceVal = fun ec v -> v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) v_Vuna_dCompiler_dCore_ddefaultFuel v

let v_Vuna_dCompiler_dElab_dconvEc = fun ec depth expected actual -> (match v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) depth expected actual with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (sols2) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dElab_decPutSols ec sols2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 164 35 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dunsolvedFrom = fun i stop sols -> if v_vuna_uge_uint i stop then C_Base_dMaybe_dNothing else (match v_Vuna_dCompiler_dCore_dmetaLookup i sols with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dunsolvedFrom (bi_add i 1) stop sols
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dJust (i)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 171 6 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dunsolvedMeta = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas)) -> v_Vuna_dCompiler_dElab_dunsolvedFrom 0 next sols
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 176 1 ("no matching clause for Vuna.Compiler.Elab.unsolvedMeta")

let v_Vuna_dCompiler_dElab_dmaxInt = fun a b -> if v_vuna_uge_uint a b then a else b

let v_Vuna_dCompiler_dElab_dpreludeNames = ("Int") :: (("String") :: (("Bool") :: (("True") :: (("False") :: (("+") :: (("-") :: (("*") :: (("/") :: (("==") :: (("/=") :: (("<") :: (("<=") :: ((">") :: ((">=") :: (("++") :: (("&&") :: (("||") :: ([]))))))))))))))))))

let v_Vuna_dCompiler_dElab_dintTy = C_Vuna_dCompiler_dCore_dTGlobal ("Int")

let v_Vuna_dCompiler_dElab_dstrTy = C_Vuna_dCompiler_dCore_dTGlobal ("String")

let v_Vuna_dCompiler_dElab_dboolTy = C_Vuna_dCompiler_dCore_dTGlobal ("Bool")

let v_Vuna_dCompiler_dElab_dfun2 = fun a b c -> C_Vuna_dCompiler_dCore_dTPi ("_", false, a, C_Vuna_dCompiler_dCore_dTPi ("_", false, b, c))

let v_Vuna_dCompiler_dElab_dpreludeGlobals = fun () -> (C_Base_dPair_dPair ("Int", C_Vuna_dCompiler_dCore_dTType (0))) :: ((C_Base_dPair_dPair ("String", C_Vuna_dCompiler_dCore_dTType (0))) :: ((C_Base_dPair_dPair ("Bool", C_Vuna_dCompiler_dCore_dTType (0))) :: ((C_Base_dPair_dPair ("True", v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair ("False", v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair ("+", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy)) :: ((C_Base_dPair_dPair ("-", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy)) :: ((C_Base_dPair_dPair ("*", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy)) :: ((C_Base_dPair_dPair ("/", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy)) :: ((C_Base_dPair_dPair ("==", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair ("/=", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair ("<", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair ("<=", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair (">", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair (">=", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dintTy v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair ("++", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dstrTy v_Vuna_dCompiler_dElab_dstrTy v_Vuna_dCompiler_dElab_dstrTy)) :: ((C_Base_dPair_dPair ("&&", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dboolTy v_Vuna_dCompiler_dElab_dboolTy v_Vuna_dCompiler_dElab_dboolTy)) :: ((C_Base_dPair_dPair ("||", v_Vuna_dCompiler_dElab_dfun2 v_Vuna_dCompiler_dElab_dboolTy v_Vuna_dCompiler_dElab_dboolTy v_Vuna_dCompiler_dElab_dboolTy)) :: ([]))))))))))))))))))

let rec v_Vuna_dCompiler_dElab_dglobalLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ustr name n then C_Base_dMaybe_dJust (ty) else v_Vuna_dCompiler_dElab_dglobalLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 242 1 ("no matching clause for Vuna.Compiler.Elab.globalLookup")

let rec v_Vuna_dCompiler_dElab_dmemSig = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> false
  | ((C_Base_dPair_dPair (n, ty)) :: (rest), name) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dCompiler_dElab_dmemSig rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 264 1 ("no matching clause for Vuna.Compiler.Elab.memSig")

let rec v_Vuna_dCompiler_dElab_dcollectSigsInto = fun a0 a1 -> match (a0, a1) with
  | (acc, []) -> C_Base_dResult_dOk (v_Base_dList_dreverse acc)
  | (acc, (d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> if v_Base_dList_dmemName name v_Vuna_dCompiler_dElab_dpreludeNames then v_Vuna_dCompiler_dElab_derrAt sp ((("DT: cannot redefine builtin ") ^ (name))) else if v_Vuna_dCompiler_dElab_dmemSig acc name then v_Vuna_dCompiler_dElab_derrAt sp ((("DT: duplicate signature for ") ^ (name))) else v_Vuna_dCompiler_dElab_dcollectSigsInto ((C_Base_dPair_dPair (name, ty)) :: (acc)) rest
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dCompiler_dElab_dcollectSigsInto acc rest
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> v_Vuna_dCompiler_dElab_dcollectSigsInto acc rest
  | C_Vuna_dCompiler_dAst_dDRecord (name, params, fields, derivings, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: record declarations are not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dDTrait (name, params, methods, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: trait declarations are not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dDInstance (mname, isDefault, head, methods, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: instance declarations are not supported yet (M15)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 250 35 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 249 1 ("no matching clause for Vuna.Compiler.Elab.collectSigsInto")

let rec v_Vuna_dCompiler_dElab_dmemDefName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dCompiler_dElab_dmemDefName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 268 1 ("no matching clause for Vuna.Compiler.Elab.memDefName")

let v_Vuna_dCompiler_dElab_dcollectSigs = fun decls -> v_Vuna_dCompiler_dElab_dcollectSigsInto [] decls

let rec v_Vuna_dCompiler_dElab_dcollectDataDecls = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> v_Base_dList_dreverse acc
  | ((d) :: (rest), acc) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, params, kind, ctors, derivings, sp) -> v_Vuna_dCompiler_dElab_dcollectDataDecls rest ((C_Base_dPair_dPair (d, sp)) :: (acc))
  | _ -> v_Vuna_dCompiler_dElab_dcollectDataDecls rest acc
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 290 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 289 1 ("no matching clause for Vuna.Compiler.Elab.collectDataDecls")

let v_Vuna_dCompiler_dElab_dnonEmpty = fun a0 -> match a0 with
  | ([]) -> false
  | ((_) :: (_)) -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 295 1 ("no matching clause for Vuna.Compiler.Elab.nonEmpty")

let rec v_Vuna_dCompiler_dElab_dkindWellFormed = fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> v_Vuna_dCompiler_dElab_dkindWellFormed cod
  | C_Vuna_dCompiler_dCore_dTType (n) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 300 21 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dsplitKind = fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> (C_Base_dPair_dPair (name, v_Vuna_dCompiler_dCore_disTypeValue (v_Vuna_dCompiler_dCore_deval [] dom))) :: (v_Vuna_dCompiler_dElab_dsplitKind cod)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 307 16 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_ddtDataLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (d) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtDataName d) name then C_Base_dMaybe_dJust (d) else v_Vuna_dCompiler_dElab_ddtDataLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 312 1 ("no matching clause for Vuna.Compiler.Elab.dtDataLookup")

let rec v_Vuna_dCompiler_dElab_dfindCtorIn = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (c) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtCtorName c) name then C_Base_dMaybe_dJust (c) else v_Vuna_dCompiler_dElab_dfindCtorIn name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 316 1 ("no matching clause for Vuna.Compiler.Elab.findCtorIn")

let rec v_Vuna_dCompiler_dElab_ddtCtorLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (d) :: (rest)) -> (match v_Vuna_dCompiler_dElab_dfindCtorIn name (v_Vuna_dCompiler_dElab_ddtDataCtors d) with
  | C_Base_dMaybe_dJust (c) -> C_Base_dMaybe_dJust (c)
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_ddtCtorLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 321 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 320 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorLookup")

let rec v_Vuna_dCompiler_dElab_dteleOf = fun ty env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> (let domVal = v_Vuna_dCompiler_dCore_deval env dom in let v = C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, v_Base_dList_dlength env, [])) in let erased = (if (implicit) then true else (v_Vuna_dCompiler_dCore_disTypeValue domVal)) in (C_Base_dPair_dPair (name, erased)) :: (v_Vuna_dCompiler_dElab_dteleOf cod ((v) :: (env))))
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 331 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dteleOfType = fun ty -> v_Vuna_dCompiler_dElab_dteleOf ty []

let rec v_Vuna_dCompiler_dElab_dspineOfType = fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> (match v_Vuna_dCompiler_dElab_dspineOfType f with
  | C_Base_dPair_dPair (h, args) -> C_Base_dPair_dPair (h, v_Base_dList_dappend args ((a) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 343 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> C_Base_dPair_dPair (g, [])
  | _ -> C_Base_dPair_dPair ("", [])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 342 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dresultSpine = fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> v_Vuna_dCompiler_dElab_dresultSpine cod
  | _ -> v_Vuna_dCompiler_dElab_dspineOfType ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 349 18 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dctorGlobals = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtCtorName c, v_Vuna_dCompiler_dElab_ddtCtorType c)) :: (v_Vuna_dCompiler_dElab_dctorGlobals rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 373 1 ("no matching clause for Vuna.Compiler.Elab.ctorGlobals")

let v_Vuna_dCompiler_dElab_dunifyErr = C_Base_dResult_dErr ("DT: this branch is impossible (index constraints are unsatisfiable)")

let rec v_Vuna_dCompiler_dElab_doccursLevel = fun lvl v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, l, sp) -> (if (v_vuna_ueq_uint l lvl) then true else (v_Vuna_dCompiler_dElab_doccursLevelList lvl sp))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 447 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, dom, clo) -> (if (v_Vuna_dCompiler_dElab_doccursLevel lvl dom) then true else (v_Vuna_dCompiler_dElab_doccursLevelClo lvl clo))
  | C_Vuna_dCompiler_dCore_dVLam (name, erased, clo) -> v_Vuna_dCompiler_dElab_doccursLevelClo lvl clo
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl sp
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl args
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> v_Vuna_dCompiler_dElab_doccursLevel lvl scrut
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> (if ((if (v_Vuna_dCompiler_dElab_doccursLevel lvl c) then true else (v_Vuna_dCompiler_dElab_doccursLevel lvl th))) then true else (v_Vuna_dCompiler_dElab_doccursLevel lvl el))
  | C_Vuna_dCompiler_dCore_dVType (n) -> false
  | C_Vuna_dCompiler_dCore_dVInt (n) -> false
  | C_Vuna_dCompiler_dCore_dVStr (s) -> false
  | C_Vuna_dCompiler_dCore_dVBool (b) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 446 21 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_doccursLevelList = fun a0 a1 -> match (a0, a1) with
  | (lvl, []) -> false
  | (lvl, (v) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_doccursLevel lvl v) then true else (v_Vuna_dCompiler_dElab_doccursLevelList lvl rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 462 1 ("no matching clause for Vuna.Compiler.Elab.occursLevelList")
and v_Vuna_dCompiler_dElab_doccursLevelClo = fun lvl clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClos (env, body) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl env
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 466 26 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dunifyIdxConv = fun ec acc depth a b -> (match v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) depth a b with
  | C_Base_dResult_dOk (sols2) -> C_Base_dResult_dOk (acc)
  | C_Base_dResult_dErr (e) -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 496 33 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dunifyIdxList = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (ec, acc, depth, fuel, [], []) -> C_Base_dResult_dOk (acc)
  | (ec, acc, depth, fuel, (x) :: (xs), (y) :: (ys)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dunifyIdx ec acc depth (bi_sub fuel 1) x y) (fun acc2 -> v_Vuna_dCompiler_dElab_dunifyIdxList ec acc2 depth (bi_sub fuel 1) xs ys)
  | (ec, acc, depth, fuel, _, _) -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 421 1 ("no matching clause for Vuna.Compiler.Elab.unifyIdxList")
and v_Vuna_dCompiler_dElab_dunifyIdx = fun ec acc depth fuel a b -> if v_vuna_ule_uint fuel 0 then C_Base_dResult_dOk (acc) else (let a2 = v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_drefineValue acc v_Vuna_dCompiler_dCore_ddefaultFuel a) in let b2 = v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_drefineValue acc v_Vuna_dCompiler_dCore_ddefaultFuel b) in (match a2 with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (an, al, [])) -> (match b2 with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (bn, bl, [])) -> if v_vuna_ueq_uint al bl then C_Base_dResult_dOk (acc) else if v_vuna_ult_uint al bl then if v_Vuna_dCompiler_dElab_doccursLevel bl a2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (bl, a2)) :: (acc)) else if v_Vuna_dCompiler_dElab_doccursLevel al b2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (al, b2)) :: (acc))
  | _ -> if v_Vuna_dCompiler_dElab_doccursLevel al b2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (al, b2)) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 434 33 ("case pattern match failure"))
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (bn, bl, [])) -> if v_Vuna_dCompiler_dElab_doccursLevel bl a2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (bl, a2)) :: (acc))
  | _ -> v_Vuna_dCompiler_dElab_dunifyIdxRigid ec acc depth a2 b2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 440 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 433 6 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dunifyIdxRigid = fun ec acc depth a b -> (match a with
  | C_Vuna_dCompiler_dCore_dVCon (c, xs) -> (match b with
  | C_Vuna_dCompiler_dCore_dVCon (c2, ys) -> if v_vuna_ueq_ustr c c2 then v_Vuna_dCompiler_dElab_dunifyIdxList ec acc depth v_Vuna_dCompiler_dCore_ddefaultFuel xs ys else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 472 16 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, sp)) -> (match b with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g2, sp2)) -> if v_vuna_ueq_ustr g g2 then v_Vuna_dCompiler_dElab_dunifyIdxList ec acc depth v_Vuna_dCompiler_dCore_ddefaultFuel sp sp2 else v_Vuna_dCompiler_dElab_dunifyIdxConv ec acc depth a b
  | _ -> v_Vuna_dCompiler_dElab_dunifyIdxConv ec acc depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 475 30 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVType (i) -> (match b with
  | C_Vuna_dCompiler_dCore_dVType (j) -> if v_vuna_ueq_uint i j then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 480 14 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVInt (n) -> (match b with
  | C_Vuna_dCompiler_dCore_dVInt (m) -> if v_vuna_ueq_uint n m then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 483 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVStr (s) -> (match b with
  | C_Vuna_dCompiler_dCore_dVStr (s2) -> if v_vuna_ueq_ustr s s2 then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 486 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVBool (x) -> (match b with
  | C_Vuna_dCompiler_dCore_dVBool (y) -> if v_vuna_ueq_ubool x y then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 489 14 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dunifyIdxConv ec acc depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 471 34 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dfreshTeleVals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], base, i) -> []
  | ((C_Base_dPair_dPair (name, erased)) :: (rest), base, i) -> (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, bi_add base i, []))) :: (v_Vuna_dCompiler_dElab_dfreshTeleVals rest base (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 502 1 ("no matching clause for Vuna.Compiler.Elab.freshTeleVals")

let v_Vuna_dCompiler_dElab_dctorResultTerms = fun c -> (match v_Vuna_dCompiler_dElab_dresultSpine (v_Vuna_dCompiler_dElab_ddtCtorType c) with
  | C_Base_dPair_dPair (head, args) -> args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 520 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dctorResultVals = fun c base -> (let tele = v_Vuna_dCompiler_dElab_ddtCtorTelescope c in let env = v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dfreshTeleVals tele base 0) in v_Base_dList_dmap (fun t -> v_Vuna_dCompiler_dCore_deval env t) (v_Vuna_dCompiler_dElab_dctorResultTerms c))

let v_Vuna_dCompiler_dElab_dctorResultValsIn = fun ctx c -> v_Base_dList_dmap (fun t -> v_Vuna_dCompiler_dElab_devalCtx ctx t) (v_Vuna_dCompiler_dElab_dctorResultTerms c)

let rec v_Vuna_dCompiler_dElab_dbindCtorGo = fun ctx ty subpats acc -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> (let domVal = v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx) dom in if implicit then (let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name domVal ctx in v_Vuna_dCompiler_dElab_dbindCtorGo ctx2 cod subpats ((C_Base_dPair_dPair (name, true)) :: (acc))) else (match subpats with
  | [] -> C_Base_dResult_dErr ("DT: case branch has too few arguments for its constructor")
  | (p) :: (rest) -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Vuna_dCompiler_dElab_dbindCtorBinder ctx domVal cod pname rest acc
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_dbindCtorBinder ctx domVal cod "_" rest acc
  | _ -> C_Base_dResult_dErr ("DT: nested patterns are not supported yet (M14 limitation)")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 542 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 540 10 ("case pattern match failure")))
  | _ -> C_Base_dResult_dOk (C_Base_dPair_dPair (ctx, C_Base_dPair_dPair (v_Base_dList_dreverse acc, subpats)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 532 33 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dbindCtorBinder = fun ctx domVal cod binderName rest acc -> (let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue binderName domVal ctx in v_Vuna_dCompiler_dElab_dbindCtorGo ctx2 cod rest ((C_Base_dPair_dPair (binderName, v_Vuna_dCompiler_dCore_disTypeValue domVal)) :: (acc)))

let v_Vuna_dCompiler_dElab_dbindCtorTele = fun ctx ty subpats -> v_Vuna_dCompiler_dElab_dbindCtorGo ctx ty subpats []

let rec v_Vuna_dCompiler_dElab_daltNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((alt) :: (rest)) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> (cname) :: (v_Vuna_dCompiler_dElab_daltNames rest)
  | _ -> v_Vuna_dCompiler_dElab_daltNames rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 593 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 592 26 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 591 1 ("no matching clause for Vuna.Compiler.Elab.altNames")

let rec v_Vuna_dCompiler_dElab_dhasCatchAll = fun a0 -> match a0 with
  | ([]) -> false
  | ((alt) :: (rest)) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> v_Vuna_dCompiler_dElab_dhasCatchAll rest
  | _ -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 600 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 599 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 598 1 ("no matching clause for Vuna.Compiler.Elab.hasCatchAll")

let rec v_Vuna_dCompiler_dElab_dhasDupNames = fun a0 -> match a0 with
  | ([]) -> false
  | ((x) :: (rest)) -> (if (v_Base_dList_dmemName x rest) then true else (v_Vuna_dCompiler_dElab_dhasDupNames rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 605 1 ("no matching clause for Vuna.Compiler.Elab.hasDupNames")

let rec v_Vuna_dCompiler_dElab_dcheckCovered = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (ec, depth, dd, idxs, alts, sp, []) -> C_Base_dResult_dOk (0)
  | (ec, depth, dd, idxs, alts, sp, (ctor) :: (rest)) -> (let written = v_Vuna_dCompiler_dElab_daltNames alts in let reachable = (match v_Vuna_dCompiler_dElab_dunifyIdxList ec [] depth v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_dctorResultVals ctor depth) idxs with
  | C_Base_dResult_dOk (refs) -> true
  | C_Base_dResult_dErr (e) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 617 17 ("case pattern match failure")) in if reachable then if v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtCtorName ctor) written then v_Vuna_dCompiler_dElab_dcheckCovered ec depth dd idxs alts sp rest else C_Base_dResult_dErr ((("DT: case is not exhaustive: missing ") ^ (v_Vuna_dCompiler_dElab_ddtCtorName ctor))) else v_Vuna_dCompiler_dElab_dcheckCovered ec depth dd idxs alts sp rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 613 1 ("no matching clause for Vuna.Compiler.Elab.checkCovered")

let v_Vuna_dCompiler_dElab_dcheckCoverage = fun ec depth dd idxs alts sp -> v_Vuna_dCompiler_dElab_dcheckCovered ec depth dd idxs alts sp (v_Vuna_dCompiler_dElab_ddtDataCtors dd)

let v_Vuna_dCompiler_dElab_dcheckCaseDone = fun ec ctx dd idxs alts expected sp scrutTerm altTerms -> if v_Vuna_dCompiler_dElab_dhasCatchAll alts then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms), ec)) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckCoverage ec (v_Vuna_dCompiler_dElab_dctxDepth ctx) dd idxs alts sp) (fun _u -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms), ec)))

let rec v_Vuna_dCompiler_dElab_dhasFunClause = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dCompiler_dElab_dhasFunClause name rest
  | _ -> v_Vuna_dCompiler_dElab_dhasFunClause name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 684 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 683 1 ("no matching clause for Vuna.Compiler.Elab.hasFunClause")

let rec v_Vuna_dCompiler_dElab_dcheckAllDefined = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, decls) -> C_Base_dResult_dOk ([])
  | ((C_Base_dPair_dPair (name, tyExpr)) :: (rest), globals, decls) -> if v_Vuna_dCompiler_dElab_dhasFunClause name decls then (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("DT: signature for ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no definition") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (ty) -> v_Vuna_dCompiler_dElab_dcheckAllDefined rest globals decls
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 677 94 ("case pattern match failure")) else C_Base_dResult_dErr ((let vuna_cat0' = ("DT: signature for ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no definition") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 676 1 ("no matching clause for Vuna.Compiler.Elab.checkAllDefined")

let v_Vuna_dCompiler_dElab_disDataHead = fun datas v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> (match v_Vuna_dCompiler_dElab_ddtDataLookup g datas with
  | C_Base_dMaybe_dJust (_) -> true
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 772 21 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 771 17 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 770 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_disIndexDomain = fun ec dom -> (if (v_Vuna_dCompiler_dCore_disTypeValue dom) then true else (v_Vuna_dCompiler_dElab_disDataHead (v_Vuna_dCompiler_dElab_decDatas ec) (v_Vuna_dCompiler_dElab_dforceVal ec dom)))

let v_Vuna_dCompiler_dElab_dfreshVarValue = fun name level -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, level, []))

let v_Vuna_dCompiler_dElab_dinferCaseE = fun globals ctx ec scrut alts sp -> v_Vuna_dCompiler_dElab_derrAt sp "DT: cannot infer the type of a case expression; give it an expected type"

let v_Vuna_dCompiler_dElab_dctorRefTerm = fun datas name -> (match v_Vuna_dCompiler_dElab_ddtCtorLookup name datas with
  | C_Base_dMaybe_dJust (ctor) -> if v_vuna_ueq_uBase_uList_uList (v_Vuna_dCompiler_dElab_ddtCtorTelescope ctor) [] then C_Vuna_dCompiler_dCore_dTCon (name, []) else C_Vuna_dCompiler_dCore_dTGlobal (name)
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dTGlobal (name)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 864 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dfoldAppTerms = fun a0 a1 -> match (a0, a1) with
  | (fn, []) -> fn
  | (fn, (C_Base_dPair_dPair (arg, erased)) :: (rest)) -> v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTApp (fn, arg, erased)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 879 1 ("no matching clause for Vuna.Compiler.Elab.foldAppTerms")

let v_Vuna_dCompiler_dElab_dctorAppTerm = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (datas, C_Vuna_dCompiler_dCore_dTGlobal (g), args) -> (match v_Vuna_dCompiler_dElab_ddtCtorLookup g datas with
  | C_Base_dMaybe_dJust (ctor) -> if v_vuna_uge_uint (v_Base_dList_dlength args) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtCtorTelescope ctor)) then C_Vuna_dCompiler_dCore_dTCon (g, args) else v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTGlobal (g)) args
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTGlobal (g)) args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 871 38 ("case pattern match failure"))
  | (datas, fn, args) -> v_Vuna_dCompiler_dElab_dfoldAppTerms fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 871 1 ("no matching clause for Vuna.Compiler.Elab.ctorAppTerm")

let rec v_Vuna_dCompiler_dElab_delabConAlt = fun globals ctx ec dd idxs expected cname args psp body -> (match v_Vuna_dCompiler_dElab_dfindCtorIn cname (v_Vuna_dCompiler_dElab_ddtDataCtors dd) with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt psp ((let vuna_cat0' = ("DT: unknown constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" in case ") in (let vuna_cat3' = (v_Vuna_dCompiler_dElab_ddtDataName dd) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Base_dMaybe_dJust (ctor) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbindCtorTele ctx (v_Vuna_dCompiler_dElab_ddtCtorType ctor) args) (fun p -> (match p with
  | C_Base_dPair_dPair (branchCtx, C_Base_dPair_dPair (binders, leftover)) -> if v_Vuna_dCompiler_dElab_dnonEmpty leftover then v_Vuna_dCompiler_dElab_derrAt psp ((let vuna_cat0' = ("DT: branch for constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" has too many arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else (match v_Vuna_dCompiler_dElab_dunifyIdxList ec [] (v_Vuna_dCompiler_dElab_dctxDepth branchCtx) v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_dctorResultValsIn branchCtx ctor) (v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue [] v_Vuna_dCompiler_dCore_ddefaultFuel) idxs) with
  | C_Base_dResult_dErr (e) -> v_Vuna_dCompiler_dElab_derrAt psp "DT: this branch is impossible (index constraints are unsatisfiable)"
  | C_Base_dResult_dOk (refs2) -> (let refinedExpected = v_Vuna_dCompiler_dElab_drefineValue refs2 v_Vuna_dCompiler_dCore_ddefaultFuel expected in let branchCtx2 = v_Vuna_dCompiler_dElab_dctxRefine branchCtx refs2 in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals branchCtx2 ec body refinedExpected) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dCaseAlt (cname, binders, bodyTerm), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 566 80 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 560 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 558 73 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 556 66 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_delabCaseAlts = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (globals, ctx, ec, dd, idxs, expected, [], acc) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, ec))
  | (globals, ctx, ec, dd, idxs, expected, (alt) :: (rest), acc) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabConAlt globals ctx ec dd idxs expected cname args psp body) (fun p -> (match p with
  | C_Base_dPair_dPair (altTerm, ec1) -> v_Vuna_dCompiler_dElab_delabCaseAlts globals ctx ec1 dd idxs expected rest ((altTerm) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 575 108 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Vuna_dCompiler_dElab_delabCatchAll globals ctx ec dd idxs expected rest acc body psp
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_delabCatchAll globals ctx ec dd idxs expected rest acc body psp
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan pat) "DT: only constructor patterns are supported in case (M14)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 574 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 573 66 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 572 1 ("no matching clause for Vuna.Compiler.Elab.elabCaseAlts")
and v_Vuna_dCompiler_dElab_delabCatchAll = fun globals ctx ec dd idxs expected rest acc body psp -> if v_Vuna_dCompiler_dElab_dnonEmpty rest then v_Vuna_dCompiler_dElab_derrAt psp "DT: the catch-all branch must be the last one" else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse ((C_Vuna_dCompiler_dCore_dCaseAlt ("", [], bodyTerm)) :: (acc)), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 586 60 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckCase = fun globals ctx ec scrut alts expected sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec scrut) (fun ps -> (match ps with
  | C_Base_dPair_dPair (scrutTerm, C_Base_dPair_dPair (scrutTy, ec1)) -> v_Vuna_dCompiler_dElab_dcheckCaseFam globals ctx ec1 scrutTerm scrutTy alts expected sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 626 97 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckCaseFam = fun globals ctx ec scrutTerm scrutTy alts expected sp -> (match v_Vuna_dCompiler_dElab_dforceVal ec scrutTy with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (fam, idxs)) -> v_Vuna_dCompiler_dElab_dcheckCaseOf globals ctx ec scrutTerm fam idxs alts expected sp
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: case scrutinee is not an inductive family"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 632 66 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckCaseOf = fun globals ctx ec scrutTerm fam idxs alts expected sp -> (match v_Vuna_dCompiler_dElab_ddtDataLookup fam (v_Vuna_dCompiler_dElab_decDatas ec) with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp "DT: case scrutinee is not an inductive family"
  | C_Base_dMaybe_dJust (dd) -> if v_Vuna_dCompiler_dElab_dhasDupNames (v_Vuna_dCompiler_dElab_daltNames alts) then v_Vuna_dCompiler_dElab_derrAt sp "DT: duplicate constructor in case" else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCaseAlts globals ctx ec dd idxs expected alts []) (fun p -> (match p with
  | C_Base_dPair_dPair (altTerms, ec2) -> v_Vuna_dCompiler_dElab_dcheckCaseDone ec2 ctx dd idxs alts expected sp scrutTerm altTerms
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 640 78 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 637 66 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferE = fun globals ctx ec expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, sp) -> if v_vuna_ueq_ustr name "Type" then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTType (0), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVType (1), ec))) else if v_vuna_ueq_ustr name "_" then v_Vuna_dCompiler_dElab_derrAt sp "DT: cannot infer the type of a hole; give it an expected type" else (match v_Vuna_dCompiler_dElab_dctxLookup name ctx with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (idx, tyTerm)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTVar (name, idx), C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dvarTypeValue ctx idx tyTerm, ec)))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dJust (tyTerm) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec) name, C_Base_dPair_dPair (v_Vuna_dCompiler_dCore_deval [] tyTerm, ec)))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: unknown name ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 795 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 793 8 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTInt (n), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Int", [])), ec)))
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTStr (s), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("String", [])), ec)))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dCompiler_dElab_dinferPi globals ctx ec name implicit dom cod sp
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Vuna_dCompiler_dElab_dinferApp globals ctx ec fn args sp
  | C_Vuna_dCompiler_dAst_dELam (names, body, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: cannot infer the type of a lambda; add a signature"
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec c (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Bool", [])))) (fun p -> (match p with
  | C_Base_dPair_dPair (cTerm, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec1 t) (fun pt -> (match pt with
  | C_Base_dPair_dPair (tTerm, C_Base_dPair_dPair (tTy, ec2)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec2 e) (fun pe -> (match pe with
  | C_Base_dPair_dPair (eTerm, C_Base_dPair_dPair (eTy, ec3)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dconvEc ec3 (v_Vuna_dCompiler_dElab_dctxDepth ctx) tTy eTy) (fun ec4 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTIf (cTerm, tTerm, eTerm), C_Base_dPair_dPair (tTy, ec4))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 805 79 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 804 66 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 803 91 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: let expressions are not supported yet (M13)"
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Vuna_dCompiler_dElab_dinferCaseE globals ctx ec scrut alts sp
  | C_Vuna_dCompiler_dAst_dEField (base, fname, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: record field access is not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dERecord (rname, fields, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: records are not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: record update is not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dEInstSel (meth, iname, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: instance selection is not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dEDo (stmts, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: do blocks are not supported yet (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 790 30 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferPi = fun globals ctx ec name implicit dom cod sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals ctx ec dom) (fun pd -> (match pd with
  | C_Base_dPair_dPair (domTerm, C_Base_dPair_dPair (domSort, ec1)) -> (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let ctx2 = v_Vuna_dCompiler_dElab_dctxBind name domTerm ctx in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals ctx2 ec1 cod) (fun pc -> (match pc with
  | C_Base_dPair_dPair (codTerm, C_Base_dPair_dPair (codSort, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTPi (name, implicit, domTerm, codTerm), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVType (v_Vuna_dCompiler_dElab_dmaxInt domSort codSort), ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 826 57 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 821 98 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dinferApp = fun globals ctx ec fn args sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCompiler_dElab_dinferPi globals ctx ec "_" false a b sp
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: invalid arrow type"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 835 18 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEVar ("Type", tsp) -> (match args with
  | (C_Vuna_dCompiler_dAst_dEInt (n, nsp)) :: ([]) -> if v_vuna_ult_uint n 0 then v_Vuna_dCompiler_dElab_derrAt nsp "DT: universe level must be non-negative" else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTType (n), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVType (bi_add n 1), ec)))
  | _ -> v_Vuna_dCompiler_dElab_derrAt tsp "DT: Type needs exactly one non-negative level (or none)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 838 22 ("case pattern match failure"))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (name, vsp) -> (match v_Vuna_dCompiler_dElab_dctxLookup name ctx with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dinferAppGeneral globals ctx ec fn args sp
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dJust (tyTerm) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec (v_Vuna_dCompiler_dCore_deval [] tyTerm) args sp) (fun pa -> (match pa with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas ec2) (C_Vuna_dCompiler_dCore_dTGlobal (name)) argTerms, C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 847 92 ("case pattern match failure")))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt vsp ((("DT: unknown name ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 846 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 844 22 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dinferAppGeneral globals ctx ec fn args sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 843 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 834 38 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferAppGeneral = fun globals ctx ec fn args sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec fn) (fun pf -> (match pf with
  | C_Base_dPair_dPair (fnTerm, C_Base_dPair_dPair (fnTy, ec1)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec1 fnTy args sp) (fun pa -> (match pa with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas ec2) fnTerm argTerms, C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 856 91 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 855 88 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dinferArgs = fun globals ctx ec ty args sp -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec ty in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, dom, clo) -> if implicit then if v_Vuna_dCompiler_dElab_disIndexDomain ec dom then (let pmeta = v_Vuna_dCompiler_dElab_dnewMeta ec in (match pmeta with
  | C_Base_dPair_dPair (metaTerm, ec1) -> (let metaVal = v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx) metaTerm in let erased = true in let ty2 = v_Vuna_dCompiler_dCore_dapplyClosure clo metaVal in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec1 ty2 args sp) (fun p -> (match p with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (metaTerm, erased)) :: (argTerms), C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 896 69 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 890 10 ("case pattern match failure"))) else v_Vuna_dCompiler_dElab_derrAt sp "DT: implicit parameters must be types or inductive families (M14)" else (match args with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair (forced, ec)))
  | (a) :: (rest) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec a dom) (fun p -> (match p with
  | C_Base_dPair_dPair (aTerm, ec1) -> (let erased = v_Vuna_dCompiler_dCore_disTypeValue dom in let ty2 = v_Vuna_dCompiler_dCore_dapplyClosure clo (v_Vuna_dCompiler_dElab_devalCtx ctx aTerm) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec1 ty2 rest sp) (fun q -> (match q with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (aTerm, erased)) :: (argTerms), C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 908 69 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 903 65 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 901 10 ("case pattern match failure"))
  | _ -> (match args with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair (forced, ec)))
  | (a) :: (rest) -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan a) "DT: too many arguments (not a function)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 913 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 886 6 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckE = fun globals ctx ec expr expected -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, sp) -> if v_vuna_ueq_ustr name "_" then (let pmeta = v_Vuna_dCompiler_dElab_dnewMeta ec in (match pmeta with
  | C_Base_dPair_dPair (metaTerm, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (metaTerm, ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 922 8 ("case pattern match failure"))) else v_Vuna_dCompiler_dElab_dcheckApp globals ctx ec (C_Vuna_dCompiler_dAst_dEVar (name, sp)) [] expected sp
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dELam (names, body, sp) -> v_Vuna_dCompiler_dElab_dcheckLam globals ctx ec names body expected sp
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", _), args, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("Type", _), args, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Vuna_dCompiler_dElab_dcheckApp globals ctx ec fn args expected sp
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, csp) -> v_Vuna_dCompiler_dElab_dcheckCase globals ctx ec scrut alts expected csp
  | _ -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 918 39 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckByInfer = fun globals ctx ec expr expected -> (match v_Vuna_dCompiler_dElab_dinferE globals ctx ec expr with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (term, C_Base_dPair_dPair (actual, ec1))) -> (match v_Vuna_dCompiler_dElab_dconvEc ec1 (v_Vuna_dCompiler_dElab_dctxDepth ctx) expected actual with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dexprSpan expr)) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dResult_dOk (ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (term, ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 939 39 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 937 45 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckLam = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (globals, ctx, ec, [], body, expected, sp) -> v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected
  | (globals, ctx, ec, (name) :: (rest), body, expected, sp) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (pname, implicit, dom, clo) -> (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue pname lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCompiler_dCore_dapplyClosure clo v in let erased = true in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLam globals ctx2 ec rest body expected2 sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (name, erased, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 956 75 ("case pattern match failure"))))
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: lambda has more parameters than the expected function type"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 948 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 944 1 ("no matching clause for Vuna.Compiler.Elab.checkLam")
and v_Vuna_dCompiler_dElab_dcheckType = fun globals ctx ec expr -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec expr) (fun p -> (match p with
  | C_Base_dPair_dPair (term, C_Base_dPair_dPair (ty, ec1)) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec1 ty in (match v_Vuna_dCompiler_dCore_dtypeLevelOf forced with
  | C_Base_dMaybe_dJust (lvl) -> C_Base_dResult_dOk (C_Base_dPair_dPair (term, C_Base_dPair_dPair (lvl, ec1)))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan expr) ((("DT: expected a type, but this expression has type ") ^ (v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepth ctx) ty)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 966 8 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 962 77 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckApp = fun globals ctx ec fn args expected sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (name, vsp) -> (match v_Vuna_dCompiler_dElab_dctxLookup name ctx with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dcheckAppGeneral globals ctx ec fn args expected sp
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dElab_ddtCtorLookup name (v_Vuna_dCompiler_dElab_decDatas ec) with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dcheckAppCtor globals ctx ec name args expected vsp
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dcheckAppGeneral globals ctx ec fn args expected sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 979 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 977 20 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dcheckAppGeneral globals ctx ec fn args expected sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 976 47 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckAppGeneral = fun globals ctx ec fn args expected sp -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec (C_Vuna_dCompiler_dAst_dEApp (fn, args, sp)) expected
and v_Vuna_dCompiler_dElab_dcheckAppCtor = fun globals ctx ec name args expected sp -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: unknown name ") ^ (name)))
  | C_Base_dMaybe_dJust (tyTerm) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec (v_Vuna_dCompiler_dCore_deval [] tyTerm) args sp) (fun pa -> (match pa with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec1)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dconvEc ec1 (v_Vuna_dCompiler_dElab_dctxDepth ctx) expected resTy) (fun ec2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas ec2) (C_Vuna_dCompiler_dCore_dTGlobal (name)) argTerms, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 992 86 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 990 53 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_delabCtor = fun globals fam arity ec c -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor (cname, tyExpr, arityHint, csp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals v_Vuna_dCompiler_dElab_demptyCtx ec tyExpr) (fun pk -> (match pk with
  | C_Base_dPair_dPair (tyTerm, C_Base_dPair_dPair (sort, ec1)) -> (match v_Vuna_dCompiler_dElab_dresultSpine tyTerm with
  | C_Base_dPair_dPair (head, args) -> if v_vuna_uneq_ustr head fam then v_Vuna_dCompiler_dElab_derrAt csp ((let vuna_cat0' = ("DT: constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" does not return ") in (let vuna_cat3' = (fam) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else if v_vuna_uneq_uint (v_Base_dList_dlength args) arity then v_Vuna_dCompiler_dElab_derrAt csp ((let vuna_cat0' = ("DT: constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" has the wrong number of indices for ") in (let vuna_cat3' = (fam) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dElab_dDtCtor (cname, fam, v_Vuna_dCompiler_dElab_dteleOfType tyTerm, tyTerm), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 357 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 356 93 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 355 35 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabCtors = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, fam, arity, ec, []) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], ec))
  | (globals, fam, arity, ec, (c) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCtor globals fam arity ec c) (fun p -> (match p with
  | C_Base_dPair_dPair (dc, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCtors globals fam arity ec1 rest) (fun q -> (match q with
  | C_Base_dPair_dPair (dcs, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((dc) :: (dcs), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 367 72 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 366 95 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 365 1 ("no matching clause for Vuna.Compiler.Elab.elabCtors")

let v_Vuna_dCompiler_dElab_delabData = fun globals ec ds -> (match ds with
  | C_Base_dPair_dPair (d, dsp) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, writtenParams, kindExpr, ctors, derivings, dsp2) -> if v_Base_dList_dmemName dname v_Vuna_dCompiler_dElab_dpreludeNames then v_Vuna_dCompiler_dElab_derrAt dsp2 ((("DT: cannot redefine builtin ") ^ (dname))) else if v_Vuna_dCompiler_dElab_dnonEmpty derivings then v_Vuna_dCompiler_dElab_derrAt dsp2 "DT: deriving is not supported yet (M15)" else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals v_Vuna_dCompiler_dElab_demptyCtx ec kindExpr) (fun pk -> (match pk with
  | C_Base_dPair_dPair (kindTerm, C_Base_dPair_dPair (kindSort, ec1)) -> if v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dkindWellFormed kindTerm) then v_Vuna_dCompiler_dElab_derrAt dsp2 "DT: the kind of a data declaration must be a chain of arrows ending in Type" else (let tele = v_Vuna_dCompiler_dElab_dsplitKind kindTerm in let arity = v_Base_dList_dlength tele in let globals2 = v_Base_dList_dappend globals ((C_Base_dPair_dPair (dname, kindTerm)) :: ([])) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCtors globals2 dname arity ec1 ctors) (fun q -> (match q with
  | C_Base_dPair_dPair (dctors, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dElab_dDtData (dname, tele, dctors), C_Base_dPair_dPair (v_Base_dList_dappend globals2 (v_Vuna_dCompiler_dElab_dctorGlobals dctors), v_Vuna_dCompiler_dElab_decAddData ec2 (C_Vuna_dCompiler_dElab_dDtData (dname, tele, dctors)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 389 70 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 382 67 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 379 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 378 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabDatas = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, ec) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair (globals, ec)))
  | ((ds) :: (rest), globals, ec) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabData globals ec ds) (fun p -> (match p with
  | C_Base_dPair_dPair (dd, C_Base_dPair_dPair (globals2, ec2)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabDatas rest globals2 ec2) (fun q -> (match q with
  | C_Base_dPair_dPair (dds, C_Base_dPair_dPair (globals3, ec3)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((dd) :: (dds), C_Base_dPair_dPair (globals3, ec3)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 400 79 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 399 77 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 398 1 ("no matching clause for Vuna.Compiler.Elab.elabDatas")

let rec v_Vuna_dCompiler_dElab_delabSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, ec) -> C_Base_dResult_dOk (C_Base_dPair_dPair (globals, ec))
  | ((C_Base_dPair_dPair (name, tyExpr)) :: (rest), globals, ec) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals v_Vuna_dCompiler_dElab_demptyCtx ec tyExpr) (fun p -> (match p with
  | C_Base_dPair_dPair (tyTerm, C_Base_dPair_dPair (sortLvl, ec1)) -> v_Vuna_dCompiler_dElab_delabSigs rest (v_Base_dList_dappend globals ((C_Base_dPair_dPair (name, tyTerm)) :: ([]))) ec1
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 656 106 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 655 1 ("no matching clause for Vuna.Compiler.Elab.elabSigs")

let v_Vuna_dCompiler_dElab_dcheckBodyAtEnd = fun globals ctx ec body expected sp -> (match body with
  | C_Vuna_dCompiler_dAst_dELam (names, lambdaBody, lambdaSp) -> v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: definition has fewer parameters than its signature"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 728 50 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dcheckBinders = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (globals, ctx, ec, [], body, expected, sp) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, dom, clo) -> if implicit then if v_Vuna_dCompiler_dElab_disIndexDomain ec dom then (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue name lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCompiler_dCore_dapplyClosure clo v in let erased = true in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckBinders globals ctx2 ec [] body expected2 sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (name, erased, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 719 77 ("case pattern match failure")))) else v_Vuna_dCompiler_dElab_derrAt sp "DT: implicit parameters must be types or inductive families (M14)" else v_Vuna_dCompiler_dElab_dcheckBodyAtEnd globals ctx ec body expected sp
  | _ -> v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 711 6 ("case pattern match failure")))
  | (globals, ctx, ec, (pat) :: (rest), body, expected, sp) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, dom, clo) -> if implicit then if v_Vuna_dCompiler_dElab_disIndexDomain ec dom then (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue name lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCompiler_dCore_dapplyClosure clo v in let erased = true in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckBinders globals ctx2 ec ((pat) :: (rest)) body expected2 sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (name, erased, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 743 88 ("case pattern match failure")))) else v_Vuna_dCompiler_dElab_derrAt sp "DT: implicit parameters must be types or inductive families (M14)" else (match pat with
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Vuna_dCompiler_dElab_dbindOnePattern globals ctx ec pname rest body dom clo sp
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_dbindOnePattern globals ctx ec "_" rest body dom clo sp
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan pat) "DT: definition parameters must be variables (M13)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 747 10 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: definition has more parameters than its signature"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 735 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 708 1 ("no matching clause for Vuna.Compiler.Elab.checkBinders")
and v_Vuna_dCompiler_dElab_dbindOnePattern = fun globals ctx ec pname pats body dom clo sp -> (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue pname lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue pname dom ctx in let erasure = v_Vuna_dCompiler_dCore_disTypeValue dom in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckBinders globals ctx2 ec pats body (v_Vuna_dCompiler_dCore_dapplyClosure clo v) sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (pname, erasure, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 760 86 ("case pattern match failure"))))

let v_Vuna_dCompiler_dElab_dcheckDef = fun globals ec pats body expected sp -> v_Vuna_dCompiler_dElab_dcheckBinders globals v_Vuna_dCompiler_dElab_demptyCtx ec pats body expected sp

let rec v_Vuna_dCompiler_dElab_delabBodies = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | ([], globals, doneDefs, acc, ec) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, ec))
  | ((d) :: (rest), globals, doneDefs, acc, ec) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: expected a type signature for ") ^ (name)))
  | C_Base_dMaybe_dJust (tyTerm) -> if v_Vuna_dCompiler_dElab_dmemDefName name doneDefs then v_Vuna_dCompiler_dElab_derrAt sp "DT: multiple clauses are not supported yet (use a single equation; M16)" else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckDef globals ec pats body (v_Vuna_dCompiler_dCore_deval [] tyTerm) sp) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> v_Vuna_dCompiler_dElab_delabBodies rest globals ((C_Base_dPair_dPair (name, tyTerm)) :: (doneDefs)) ((C_Vuna_dCompiler_dElab_dDtDef (name, tyTerm, bodyTerm)) :: (acc)) (v_Vuna_dCompiler_dElab_decAddDef ec1 (C_Base_dPair_dPair (name, bodyTerm)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 667 77 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 664 29 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_delabBodies rest globals doneDefs acc ec
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 663 50 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 662 1 ("no matching clause for Vuna.Compiler.Elab.elabBodies")

let v_Vuna_dCompiler_dElab_delabProgram = fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcollectSigs decls) (fun sigs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabDatas (v_Vuna_dCompiler_dElab_dcollectDataDecls decls []) (v_Vuna_dCompiler_dElab_dpreludeGlobals ()) (C_Vuna_dCompiler_dElab_dEc (0, [], [], []))) (fun pd -> (match pd with
  | C_Base_dPair_dPair (datas, C_Base_dPair_dPair (globals0, ec0)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabSigs sigs globals0 ec0) (fun p -> (match p with
  | C_Base_dPair_dPair (globals, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckAllDefined sigs globals decls) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabBodies decls globals [] [] ec1) (fun q -> (match q with
  | C_Base_dPair_dPair (defs, ec2) -> (match v_Vuna_dCompiler_dElab_dunsolvedMeta ec2 with
  | C_Base_dMaybe_dJust (m) -> C_Base_dResult_dErr ((("DT: unsolved metavariable ?") ^ (bi_str_from_int m)))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (C_Base_dPair_dPair (datas, defs))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 692 24 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 691 129 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 690 81 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 689 146 ("case pattern match failure"))))
