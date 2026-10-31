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
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
open Vuna_dBuiltins
open Vuna_dLoader
open Vuna_dTypecheck
open Vuna_dSplit
open Vuna_dTypedCodegen
open Vuna_dCore
type   t_Vuna_dElab_dDtDef =
    C_Vuna_dElab_dDtDef of (string) * (t_Vuna_dCore_dTerm) * (t_Vuna_dCore_dTerm)
and   t_Vuna_dElab_dEc =
    C_Vuna_dElab_dEc of (int) * (((int, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list) * (((string, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list)
and   t_Vuna_dElab_dCtx =
    C_Vuna_dElab_dCtx of (((string, t_Vuna_dCore_dTerm) t_Vuna_dPair_dPair) list)
let show_Vuna_dElab_dDtDef v =
  match v with
  | C_Vuna_dElab_dDtDef (f0, f1, f2) -> show_ctor "DtDef" [(show_vstring) f0; (show_Vuna_dCore_dTerm) f1; (show_Vuna_dCore_dTerm) f2]
and show_Vuna_dElab_dEc v =
  match v with
  | C_Vuna_dElab_dEc (f0, f1, f2) -> show_ctor "Ec" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair string_of_int show_Vuna_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f2]
and show_Vuna_dElab_dCtx v =
  match v with
  | C_Vuna_dElab_dCtx f0 -> show_ctor "Ctx" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Vuna_dPair_dPair show_vstring show_Vuna_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f0]
let v_Vuna_dElab_ddtDefName = fun a0 -> match a0 with
  | (C_Vuna_dElab_dDtDef (name, ty, body)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 20 1 ("no matching clause for Vuna.Elab.dtDefName")

let v_Vuna_dElab_ddtDefType = fun a0 -> match a0 with
  | (C_Vuna_dElab_dDtDef (name, ty, body)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 22 1 ("no matching clause for Vuna.Elab.dtDefType")

let v_Vuna_dElab_ddtDefBody = fun a0 -> match a0 with
  | (C_Vuna_dElab_dDtDef (name, ty, body)) -> body
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 24 1 ("no matching clause for Vuna.Elab.dtDefBody")

let v_Vuna_dElab_decNext = fun a0 -> match a0 with
  | (C_Vuna_dElab_dEc (next, sols, defs)) -> next
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 30 1 ("no matching clause for Vuna.Elab.ecNext")

let v_Vuna_dElab_decSols = fun a0 -> match a0 with
  | (C_Vuna_dElab_dEc (next, sols, defs)) -> sols
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 32 1 ("no matching clause for Vuna.Elab.ecSols")

let v_Vuna_dElab_decDefs = fun a0 -> match a0 with
  | (C_Vuna_dElab_dEc (next, sols, defs)) -> defs
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 34 1 ("no matching clause for Vuna.Elab.ecDefs")

let v_Vuna_dElab_decPutSols = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dElab_dEc (next, sols, defs), sols2) -> C_Vuna_dElab_dEc (next, sols2, defs)
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 37 1 ("no matching clause for Vuna.Elab.ecPutSols")

let v_Vuna_dElab_decAddDef = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dElab_dEc (next, sols, defs), d) -> C_Vuna_dElab_dEc (next, sols, v_Vuna_dList_dappend defs ((d) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 40 1 ("no matching clause for Vuna.Elab.ecAddDef")

let v_Vuna_dElab_dctxItems = fun a0 -> match a0 with
  | (C_Vuna_dElab_dCtx (items)) -> items
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 46 1 ("no matching clause for Vuna.Elab.ctxItems")

let v_Vuna_dElab_dctxDepth = fun ctx -> v_Vuna_dList_dlength (v_Vuna_dElab_dctxItems ctx)

let v_Vuna_dElab_dctxBind = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, ty, C_Vuna_dElab_dCtx (items)) -> C_Vuna_dElab_dCtx ((C_Vuna_dPair_dPair (name, ty)) :: (items))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 52 1 ("no matching clause for Vuna.Elab.ctxBind")

let v_Vuna_dElab_dctxBindValue = fun name dom ctx -> v_Vuna_dElab_dctxBind name (v_Vuna_dCore_dquote (v_Vuna_dElab_dctxDepth ctx) dom) ctx

let rec v_Vuna_dElab_dctxLookupAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, [], idx) -> C_Vuna_dMaybe_dNothing
  | (name, (C_Vuna_dPair_dPair (n, ty)) :: (rest), idx) -> if v_vuna_ueq_ustr n name then C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (idx, ty)) else v_Vuna_dElab_dctxLookupAt name rest (bi_add idx 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 59 1 ("no matching clause for Vuna.Elab.ctxLookupAt")

let v_Vuna_dElab_dctxLookup = fun name ctx -> v_Vuna_dElab_dctxLookupAt name (v_Vuna_dElab_dctxItems ctx) 0

let rec v_Vuna_dElab_dctxEnvAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], idx, depth) -> []
  | ((C_Vuna_dPair_dPair (name, ty)) :: (rest), idx, depth) -> (C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNVar (name, bi_sub (bi_sub depth idx) 1, []))) :: (v_Vuna_dElab_dctxEnvAt rest (bi_add idx 1) depth)
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 68 1 ("no matching clause for Vuna.Elab.ctxEnvAt")

let v_Vuna_dElab_dctxEnv = fun ctx -> v_Vuna_dElab_dctxEnvAt (v_Vuna_dElab_dctxItems ctx) 0 (v_Vuna_dElab_dctxDepth ctx)

let v_Vuna_dElab_devalCtx = fun ctx ty -> v_Vuna_dCore_deval (v_Vuna_dElab_dctxEnv ctx) ty

let v_Vuna_dElab_dvarTypeValue = fun ctx idx ty -> v_Vuna_dCore_deval (v_Vuna_dElab_dctxEnv ctx) (v_Vuna_dCore_dshift 0 (bi_add idx 1) ty)

let v_Vuna_dElab_demptyCtx = C_Vuna_dElab_dCtx ([])

let v_Vuna_dElab_derrAt = fun sp msg -> C_Vuna_dResult_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc sp) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (msg) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dElab_dnewMeta = fun a0 -> match a0 with
  | (C_Vuna_dElab_dEc (next, sols, defs)) -> C_Vuna_dPair_dPair (C_Vuna_dCore_dTMeta (next), C_Vuna_dElab_dEc (bi_add next 1, sols, defs))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 93 1 ("no matching clause for Vuna.Elab.newMeta")

let v_Vuna_dElab_dforceVal = fun ec v -> v_Vuna_dCore_dforce (v_Vuna_dElab_decDefs ec) (v_Vuna_dElab_decSols ec) v_Vuna_dCore_ddefaultFuel v

let v_Vuna_dElab_dconvEc = fun ec depth expected actual -> (match v_Vuna_dCore_dconv (v_Vuna_dElab_decDefs ec) (v_Vuna_dElab_decSols ec) depth expected actual with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (sols2) -> C_Vuna_dResult_dOk (v_Vuna_dElab_decPutSols ec sols2)
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 100 3 ("case pattern match failure"))

let rec v_Vuna_dElab_dunsolvedFrom = fun i stop sols -> if v_vuna_uge_uint i stop then C_Vuna_dMaybe_dNothing else (match v_Vuna_dCore_dmetaLookup i sols with
  | C_Vuna_dMaybe_dJust (_) -> v_Vuna_dElab_dunsolvedFrom (bi_add i 1) stop sols
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dMaybe_dJust (i)
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 109 5 ("case pattern match failure"))

let v_Vuna_dElab_dunsolvedMeta = fun a0 -> match a0 with
  | (C_Vuna_dElab_dEc (next, sols, defs)) -> v_Vuna_dElab_dunsolvedFrom 0 next sols
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 114 1 ("no matching clause for Vuna.Elab.unsolvedMeta")

let v_Vuna_dElab_dmaxInt = fun a b -> if v_vuna_uge_uint a b then a else b

let v_Vuna_dElab_dpreludeNames = ("Int") :: (("String") :: (("Bool") :: (("True") :: (("False") :: (("+") :: (("-") :: (("*") :: (("/") :: (("==") :: (("/=") :: (("<") :: (("<=") :: ((">") :: ((">=") :: (("++") :: (("&&") :: (("||") :: ([]))))))))))))))))))

let v_Vuna_dElab_dintTy = C_Vuna_dCore_dTGlobal ("Int")

let v_Vuna_dElab_dstrTy = C_Vuna_dCore_dTGlobal ("String")

let v_Vuna_dElab_dboolTy = C_Vuna_dCore_dTGlobal ("Bool")

let v_Vuna_dElab_dfun2 = fun a b c -> C_Vuna_dCore_dTPi ("_", false, a, C_Vuna_dCore_dTPi ("_", false, b, c))

let v_Vuna_dElab_dpreludeGlobals = fun () -> (C_Vuna_dPair_dPair ("Int", C_Vuna_dCore_dTType (0))) :: ((C_Vuna_dPair_dPair ("String", C_Vuna_dCore_dTType (0))) :: ((C_Vuna_dPair_dPair ("Bool", C_Vuna_dCore_dTType (0))) :: ((C_Vuna_dPair_dPair ("True", v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair ("False", v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair ("+", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy)) :: ((C_Vuna_dPair_dPair ("-", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy)) :: ((C_Vuna_dPair_dPair ("*", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy)) :: ((C_Vuna_dPair_dPair ("/", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy)) :: ((C_Vuna_dPair_dPair ("==", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair ("/=", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair ("<", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair ("<=", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair (">", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair (">=", v_Vuna_dElab_dfun2 v_Vuna_dElab_dintTy v_Vuna_dElab_dintTy v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair ("++", v_Vuna_dElab_dfun2 v_Vuna_dElab_dstrTy v_Vuna_dElab_dstrTy v_Vuna_dElab_dstrTy)) :: ((C_Vuna_dPair_dPair ("&&", v_Vuna_dElab_dfun2 v_Vuna_dElab_dboolTy v_Vuna_dElab_dboolTy v_Vuna_dElab_dboolTy)) :: ((C_Vuna_dPair_dPair ("||", v_Vuna_dElab_dfun2 v_Vuna_dElab_dboolTy v_Vuna_dElab_dboolTy v_Vuna_dElab_dboolTy)) :: ([]))))))))))))))))))

let rec v_Vuna_dElab_dglobalLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dMaybe_dNothing
  | (name, (C_Vuna_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ustr name n then C_Vuna_dMaybe_dJust (ty) else v_Vuna_dElab_dglobalLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 165 1 ("no matching clause for Vuna.Elab.globalLookup")

let rec v_Vuna_dElab_dmemSig = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> false
  | ((C_Vuna_dPair_dPair (n, ty)) :: (rest), name) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dElab_dmemSig rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 192 1 ("no matching clause for Vuna.Elab.memSig")

let rec v_Vuna_dElab_dcollectSigsInto = fun a0 a1 -> match (a0, a1) with
  | (acc, []) -> C_Vuna_dResult_dOk (v_Vuna_dList_dreverse acc)
  | (acc, (d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDSig (name, ty, sp) -> if v_Vuna_dList_dmemName name v_Vuna_dElab_dpreludeNames then v_Vuna_dElab_derrAt sp ((("DT: cannot redefine builtin ") ^ (name))) else if v_Vuna_dElab_dmemSig acc name then v_Vuna_dElab_derrAt sp ((("DT: duplicate signature for ") ^ (name))) else v_Vuna_dElab_dcollectSigsInto ((C_Vuna_dPair_dPair (name, ty)) :: (acc)) rest
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dElab_dcollectSigsInto acc rest
  | C_Vuna_dAst_dDData (name, params, ctors, derivings, sp) -> v_Vuna_dElab_derrAt sp "DT: data declarations are not supported yet (M14)"
  | C_Vuna_dAst_dDRecord (name, params, fields, derivings, sp) -> v_Vuna_dElab_derrAt sp "DT: record declarations are not supported yet (M15)"
  | C_Vuna_dAst_dDTrait (name, params, methods, sp) -> v_Vuna_dElab_derrAt sp "DT: trait declarations are not supported yet (M15)"
  | C_Vuna_dAst_dDInstance (mname, isDefault, head, methods, sp) -> v_Vuna_dElab_derrAt sp "DT: instance declarations are not supported yet (M15)"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 176 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 174 1 ("no matching clause for Vuna.Elab.collectSigsInto")

let rec v_Vuna_dElab_dmemDefName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (C_Vuna_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dElab_dmemDefName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 196 1 ("no matching clause for Vuna.Elab.memDefName")

let v_Vuna_dElab_dcollectSigs = fun decls -> v_Vuna_dElab_dcollectSigsInto [] decls

let rec v_Vuna_dElab_dhasFunClause = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dElab_dhasFunClause name rest
  | _ -> v_Vuna_dElab_dhasFunClause name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 246 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 244 1 ("no matching clause for Vuna.Elab.hasFunClause")

let rec v_Vuna_dElab_dcheckAllDefined = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, decls) -> C_Vuna_dResult_dOk ([])
  | ((C_Vuna_dPair_dPair (name, tyExpr)) :: (rest), globals, decls) -> if v_Vuna_dElab_dhasFunClause name decls then (match v_Vuna_dElab_dglobalLookup name globals with
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("DT: signature for ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no definition") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dMaybe_dJust (ty) -> v_Vuna_dElab_dcheckAllDefined rest globals decls
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 238 5 ("case pattern match failure")) else C_Vuna_dResult_dErr ((let vuna_cat0' = ("DT: signature for ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no definition") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 235 1 ("no matching clause for Vuna.Elab.checkAllDefined")

let v_Vuna_dElab_dfreshVarValue = fun name level -> C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNVar (name, level, []))

let rec v_Vuna_dElab_dfoldAppTerms = fun a0 a1 -> match (a0, a1) with
  | (fn, []) -> fn
  | (fn, (C_Vuna_dPair_dPair (arg, erased)) :: (rest)) -> v_Vuna_dElab_dfoldAppTerms (C_Vuna_dCore_dTApp (fn, arg, erased)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 414 1 ("no matching clause for Vuna.Elab.foldAppTerms")

let rec v_Vuna_dElab_dinferE = fun globals ctx ec expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> if v_vuna_ueq_ustr name "Type" then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTType (0), C_Vuna_dPair_dPair (C_Vuna_dCore_dVType (1), ec))) else if v_vuna_ueq_ustr name "_" then v_Vuna_dElab_derrAt sp "DT: cannot infer the type of a hole; give it an expected type" else (match v_Vuna_dElab_dctxLookup name ctx with
  | C_Vuna_dMaybe_dJust (C_Vuna_dPair_dPair (idx, tyTerm)) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTVar (name, idx), C_Vuna_dPair_dPair (v_Vuna_dElab_dvarTypeValue ctx idx tyTerm, ec)))
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dElab_dglobalLookup name globals with
  | C_Vuna_dMaybe_dJust (tyTerm) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTGlobal (name), C_Vuna_dPair_dPair (v_Vuna_dCore_deval [] tyTerm, ec)))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dElab_derrAt sp ((("DT: unknown name ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 349 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 345 9 ("case pattern match failure"))
  | C_Vuna_dAst_dEInt (n, sp) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTInt (n), C_Vuna_dPair_dPair (C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNGlobal ("Int", [])), ec)))
  | C_Vuna_dAst_dEStr (s, sp) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTStr (s), C_Vuna_dPair_dPair (C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNGlobal ("String", [])), ec)))
  | C_Vuna_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dElab_dinferPi globals ctx ec name implicit dom cod sp
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dElab_dinferApp globals ctx ec fn args sp
  | C_Vuna_dAst_dELam (names, body, sp) -> v_Vuna_dElab_derrAt sp "DT: cannot infer the type of a lambda; add a signature"
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckE globals ctx ec c (C_Vuna_dCore_dVNeutral (C_Vuna_dCore_dNGlobal ("Bool", [])))) (fun p -> (match p with
  | C_Vuna_dPair_dPair (cTerm, ec1) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dinferE globals ctx ec1 t) (fun pt -> (match pt with
  | C_Vuna_dPair_dPair (tTerm, C_Vuna_dPair_dPair (tTy, ec2)) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dinferE globals ctx ec2 e) (fun pe -> (match pe with
  | C_Vuna_dPair_dPair (eTerm, C_Vuna_dPair_dPair (eTy, ec3)) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dconvEc ec3 (v_Vuna_dElab_dctxDepth ctx) tTy eTy) (fun ec4 -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTIf (cTerm, tTerm, eTerm), C_Vuna_dPair_dPair (tTy, ec4))))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 366 21 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 363 15 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 360 9 ("case pattern match failure")))
  | C_Vuna_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dElab_derrAt sp "DT: let expressions are not supported yet (M13)"
  | C_Vuna_dAst_dECase (scrut, alts, sp) -> v_Vuna_dElab_derrAt sp "DT: case expressions are not supported yet (M14)"
  | C_Vuna_dAst_dEField (base, fname, sp) -> v_Vuna_dElab_derrAt sp "DT: record field access is not supported yet (M15)"
  | C_Vuna_dAst_dERecord (rname, fields, sp) -> v_Vuna_dElab_derrAt sp "DT: records are not supported yet (M15)"
  | C_Vuna_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dElab_derrAt sp "DT: record update is not supported yet (M15)"
  | C_Vuna_dAst_dEInstSel (meth, iname, sp) -> v_Vuna_dElab_derrAt sp "DT: instance selection is not supported yet (M15)"
  | C_Vuna_dAst_dEDo (stmts, sp) -> v_Vuna_dElab_derrAt sp "DT: do blocks are not supported yet (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 340 3 ("case pattern match failure"))
and v_Vuna_dElab_dinferPi = fun globals ctx ec name implicit dom cod sp -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckType globals ctx ec dom) (fun pd -> (match pd with
  | C_Vuna_dPair_dPair (domTerm, C_Vuna_dPair_dPair (domSort, ec1)) -> (let lvl = v_Vuna_dElab_dctxDepth ctx in let ctx2 = v_Vuna_dElab_dctxBind name domTerm ctx in v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckType globals ctx2 ec1 cod) (fun pc -> (match pc with
  | C_Vuna_dPair_dPair (codTerm, C_Vuna_dPair_dPair (codSort, ec2)) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTPi (name, implicit, domTerm, codTerm), C_Vuna_dPair_dPair (C_Vuna_dCore_dVType (v_Vuna_dElab_dmaxInt domSort codSort), ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 386 14 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 381 5 ("case pattern match failure")))
and v_Vuna_dElab_dinferApp = fun globals ctx ec fn args sp -> (match fn with
  | C_Vuna_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dElab_dinferPi globals ctx ec "_" false a b sp
  | _ -> v_Vuna_dElab_derrAt sp "DT: invalid arrow type"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 395 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar ("Type", tsp) -> (match args with
  | (C_Vuna_dAst_dEInt (n, nsp)) :: ([]) -> if v_vuna_ult_uint n 0 then v_Vuna_dElab_derrAt nsp "DT: universe level must be non-negative" else C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTType (n), C_Vuna_dPair_dPair (C_Vuna_dCore_dVType (bi_add n 1), ec)))
  | _ -> v_Vuna_dElab_derrAt tsp "DT: Type needs exactly one non-negative level (or none)"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 399 7 ("case pattern match failure"))
  | _ -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dinferE globals ctx ec fn) (fun pf -> (match pf with
  | C_Vuna_dPair_dPair (fnTerm, C_Vuna_dPair_dPair (fnTy, ec1)) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dinferArgs globals ctx ec1 fnTy args sp) (fun pa -> (match pa with
  | C_Vuna_dPair_dPair (argTerms, C_Vuna_dPair_dPair (resTy, ec2)) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (v_Vuna_dElab_dfoldAppTerms fnTerm argTerms, C_Vuna_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 409 15 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 406 9 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 393 3 ("case pattern match failure"))
and v_Vuna_dElab_dinferArgs = fun globals ctx ec ty args sp -> (let forced = v_Vuna_dElab_dforceVal ec ty in (match forced with
  | C_Vuna_dCore_dVPi (name, implicit, dom, clo) -> if implicit then if v_Vuna_dCore_disTypeValue dom then (let pmeta = v_Vuna_dElab_dnewMeta ec in (match pmeta with
  | C_Vuna_dPair_dPair (metaTerm, ec1) -> (let metaVal = v_Vuna_dCore_deval (v_Vuna_dElab_dctxEnv ctx) metaTerm in let erased = v_Vuna_dCore_disTypeValue dom in let ty2 = v_Vuna_dCore_dapplyClosure clo metaVal in v_Vuna_dResult_dandThen (v_Vuna_dElab_dinferArgs globals ctx ec1 ty2 args sp) (fun p -> (match p with
  | C_Vuna_dPair_dPair (argTerms, C_Vuna_dPair_dPair (resTy, ec2)) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ((C_Vuna_dPair_dPair (metaTerm, erased)) :: (argTerms), C_Vuna_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 431 26 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 425 17 ("case pattern match failure"))) else v_Vuna_dElab_derrAt sp "DT: implicit parameters must be types in M13" else (match args with
  | [] -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ([], C_Vuna_dPair_dPair (forced, ec)))
  | (a) :: (rest) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckE globals ctx ec a dom) (fun p -> (match p with
  | C_Vuna_dPair_dPair (aTerm, ec1) -> (let erased = v_Vuna_dCore_disTypeValue dom in let ty2 = v_Vuna_dCore_dapplyClosure clo (v_Vuna_dElab_devalCtx ctx aTerm) in v_Vuna_dResult_dandThen (v_Vuna_dElab_dinferArgs globals ctx ec1 ty2 rest sp) (fun q -> (match q with
  | C_Vuna_dPair_dPair (argTerms, C_Vuna_dPair_dPair (resTy, ec2)) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ((C_Vuna_dPair_dPair (aTerm, erased)) :: (argTerms), C_Vuna_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 445 27 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 440 18 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 436 12 ("case pattern match failure"))
  | _ -> (match args with
  | [] -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ([], C_Vuna_dPair_dPair (forced, ec)))
  | (a) :: (rest) -> v_Vuna_dElab_derrAt (v_Vuna_dAst_dexprSpan a) "DT: too many arguments (not a function)"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 449 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 420 6 ("case pattern match failure")))
and v_Vuna_dElab_dcheckE = fun globals ctx ec expr expected -> (match expr with
  | C_Vuna_dAst_dEVar (name, sp) -> if v_vuna_ueq_ustr name "_" then (let pmeta = v_Vuna_dElab_dnewMeta ec in (match pmeta with
  | C_Vuna_dPair_dPair (metaTerm, ec1) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (metaTerm, ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 459 12 ("case pattern match failure"))) else v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dAst_dEInt (n, sp) -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dAst_dEStr (s, sp) -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dAst_dELam (names, body, sp) -> v_Vuna_dElab_dcheckLam globals ctx ec names body expected sp
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), args, sp) -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("Type", _), args, sp) -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dAst_dEApp (fn, args, sp) -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dAst_dEIf (c, t, e, sp) -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | _ -> v_Vuna_dElab_dcheckByInfer globals ctx ec expr expected
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 455 3 ("case pattern match failure"))
and v_Vuna_dElab_dcheckByInfer = fun globals ctx ec expr expected -> (match v_Vuna_dElab_dinferE globals ctx ec expr with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (term, C_Vuna_dPair_dPair (actual, ec1))) -> (match v_Vuna_dElab_dconvEc ec1 (v_Vuna_dElab_dctxDepth ctx) expected actual with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr ((let vuna_cat0' = (v_Vuna_dBase_dshowSpanLoc (v_Vuna_dAst_dexprSpan expr)) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dResult_dOk (ec2) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (term, ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 477 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 474 3 ("case pattern match failure"))
and v_Vuna_dElab_dcheckLam = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (globals, ctx, ec, [], body, expected, sp) -> v_Vuna_dElab_dcheckE globals ctx ec body expected
  | (globals, ctx, ec, (name) :: (rest), body, expected, sp) -> (let forced = v_Vuna_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCore_dVPi (pname, implicit, dom, clo) -> (let lvl = v_Vuna_dElab_dctxDepth ctx in let v = v_Vuna_dElab_dfreshVarValue pname lvl in let ctx2 = v_Vuna_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCore_dapplyClosure clo v in let erased = v_Vuna_dCore_disTypeValue dom in v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckLam globals ctx2 ec rest body expected2 sp) (fun p -> (match p with
  | C_Vuna_dPair_dPair (inner, ec1) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTLam (name, erased, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 494 15 ("case pattern match failure"))))
  | _ -> v_Vuna_dElab_derrAt sp "DT: lambda has more parameters than the expected function type"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 486 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 482 1 ("no matching clause for Vuna.Elab.checkLam")
and v_Vuna_dElab_dcheckType = fun globals ctx ec expr -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dinferE globals ctx ec expr) (fun p -> (match p with
  | C_Vuna_dPair_dPair (term, C_Vuna_dPair_dPair (ty, ec1)) -> (let forced = v_Vuna_dElab_dforceVal ec1 ty in (match v_Vuna_dCore_dtypeLevelOf forced with
  | C_Vuna_dMaybe_dJust (lvl) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (term, C_Vuna_dPair_dPair (lvl, ec1)))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dElab_derrAt (v_Vuna_dAst_dexprSpan expr) ((("DT: expected a type, but this expression has type ") ^ (v_Vuna_dCore_dshowValueAt (v_Vuna_dElab_dctxDepth ctx) ty)))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 504 12 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 501 5 ("case pattern match failure")))

let rec v_Vuna_dElab_delabSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, ec) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (globals, ec))
  | ((C_Vuna_dPair_dPair (name, tyExpr)) :: (rest), globals, ec) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckType globals v_Vuna_dElab_demptyCtx ec tyExpr) (fun p -> (match p with
  | C_Vuna_dPair_dPair (tyTerm, C_Vuna_dPair_dPair (sortLvl, ec1)) -> v_Vuna_dElab_delabSigs rest (v_Vuna_dList_dappend globals ((C_Vuna_dPair_dPair (name, tyTerm)) :: ([]))) ec1
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 211 5 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 208 1 ("no matching clause for Vuna.Elab.elabSigs")

let v_Vuna_dElab_dcheckBodyAtEnd = fun globals ctx ec body expected sp -> (match body with
  | C_Vuna_dAst_dELam (names, lambdaBody, lambdaSp) -> v_Vuna_dElab_dcheckE globals ctx ec body expected
  | _ -> v_Vuna_dElab_derrAt sp "DT: definition has fewer parameters than its signature"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 294 3 ("case pattern match failure"))

let rec v_Vuna_dElab_dcheckBinders = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (globals, ctx, ec, [], body, expected, sp) -> (let forced = v_Vuna_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCore_dVPi (name, implicit, dom, clo) -> if implicit then if v_Vuna_dCore_disTypeValue dom then (let lvl = v_Vuna_dElab_dctxDepth ctx in let v = v_Vuna_dElab_dfreshVarValue name lvl in let ctx2 = v_Vuna_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCore_dapplyClosure clo v in let erased = v_Vuna_dCore_disTypeValue dom in v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckBinders globals ctx2 ec [] body expected2 sp) (fun p -> (match p with
  | C_Vuna_dPair_dPair (inner, ec1) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTLam (name, erased, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 285 19 ("case pattern match failure")))) else v_Vuna_dElab_derrAt sp "DT: implicit parameters must be types in M13" else v_Vuna_dElab_dcheckBodyAtEnd globals ctx ec body expected sp
  | _ -> v_Vuna_dElab_dcheckE globals ctx ec body expected
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 275 6 ("case pattern match failure")))
  | (globals, ctx, ec, (pat) :: (rest), body, expected, sp) -> (let forced = v_Vuna_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCore_dVPi (name, implicit, dom, clo) -> if implicit then if v_Vuna_dCore_disTypeValue dom then (let lvl = v_Vuna_dElab_dctxDepth ctx in let v = v_Vuna_dElab_dfreshVarValue name lvl in let ctx2 = v_Vuna_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCore_dapplyClosure clo v in let erased = v_Vuna_dCore_disTypeValue dom in v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckBinders globals ctx2 ec ((pat) :: (rest)) body expected2 sp) (fun p -> (match p with
  | C_Vuna_dPair_dPair (inner, ec1) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTLam (name, erased, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 309 19 ("case pattern match failure")))) else v_Vuna_dElab_derrAt sp "DT: implicit parameters must be types in M13" else (match pat with
  | C_Vuna_dAst_dPVar (pname, psp) -> v_Vuna_dElab_dbindOnePattern globals ctx ec pname rest body dom clo sp
  | C_Vuna_dAst_dPWild (psp) -> v_Vuna_dElab_dbindOnePattern globals ctx ec "_" rest body dom clo sp
  | _ -> v_Vuna_dElab_derrAt (v_Vuna_dAst_dpatSpan pat) "DT: definition parameters must be variables (M13)"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 313 12 ("case pattern match failure"))
  | _ -> v_Vuna_dElab_derrAt sp "DT: definition has more parameters than its signature"
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 299 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 273 1 ("no matching clause for Vuna.Elab.checkBinders")
and v_Vuna_dElab_dbindOnePattern = fun globals ctx ec pname pats body dom clo sp -> (let lvl = v_Vuna_dElab_dctxDepth ctx in let v = v_Vuna_dElab_dfreshVarValue pname lvl in let ctx2 = v_Vuna_dElab_dctxBindValue pname dom ctx in let erasure = v_Vuna_dCore_disTypeValue dom in v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckBinders globals ctx2 ec pats body (v_Vuna_dCore_dapplyClosure clo v) sp) (fun p -> (match p with
  | C_Vuna_dPair_dPair (inner, ec1) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (C_Vuna_dCore_dTLam (pname, erasure, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 328 8 ("case pattern match failure"))))

let v_Vuna_dElab_dcheckDef = fun globals ec pats body expected sp -> v_Vuna_dElab_dcheckBinders globals v_Vuna_dElab_demptyCtx ec pats body expected sp

let rec v_Vuna_dElab_delabBodies = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | ([], globals, doneDefs, acc, ec) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (v_Vuna_dList_dreverse acc, ec))
  | ((d) :: (rest), globals, doneDefs, acc, ec) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, sp) -> (match v_Vuna_dElab_dglobalLookup name globals with
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dElab_derrAt sp ((("DT: expected a type signature for ") ^ (name)))
  | C_Vuna_dMaybe_dJust (tyTerm) -> if v_Vuna_dElab_dmemDefName name doneDefs then v_Vuna_dElab_derrAt sp "DT: multiple clauses are not supported yet (M14)" else v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckDef globals ec pats body (v_Vuna_dCore_deval [] tyTerm) sp) (fun p -> (match p with
  | C_Vuna_dPair_dPair (bodyTerm, ec1) -> v_Vuna_dElab_delabBodies rest globals ((C_Vuna_dPair_dPair (name, tyTerm)) :: (doneDefs)) ((C_Vuna_dElab_dDtDef (name, tyTerm, bodyTerm)) :: (acc)) (v_Vuna_dElab_decAddDef ec1 (C_Vuna_dPair_dPair (name, bodyTerm)))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 227 15 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 221 7 ("case pattern match failure"))
  | _ -> v_Vuna_dElab_delabBodies rest globals doneDefs acc ec
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 219 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 217 1 ("no matching clause for Vuna.Elab.elabBodies")

let v_Vuna_dElab_delabProgram = fun decls -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dcollectSigs decls) (fun sigs -> v_Vuna_dResult_dandThen (v_Vuna_dElab_delabSigs sigs (v_Vuna_dElab_dpreludeGlobals ()) (C_Vuna_dElab_dEc (0, [], []))) (fun p -> (match p with
  | C_Vuna_dPair_dPair (globals, ec1) -> v_Vuna_dResult_dandThen (v_Vuna_dElab_dcheckAllDefined sigs globals decls) (fun _u -> v_Vuna_dResult_dandThen (v_Vuna_dElab_delabBodies decls globals [] [] ec1) (fun q -> (match q with
  | C_Vuna_dPair_dPair (defs, ec2) -> (match v_Vuna_dElab_dunsolvedMeta ec2 with
  | C_Vuna_dMaybe_dJust (m) -> C_Vuna_dResult_dErr ((("DT: unsolved metavariable ?") ^ (bi_str_from_int m)))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dOk (defs)
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 260 19 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 258 15 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Elab.vuna" 254 7 ("case pattern match failure"))))

let v_vuna_ushow_uVuna_uElab_uDtDef = fun x -> (match x with
  | C_Vuna_dElab_dDtDef (v0, v1, v2) -> (let vuna_cat0' = ("(DtDef ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uVuna_uCore_uTerm v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uVuna_uCore_uTerm v2) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | _ -> vuna_fail "<generated>" 2 31 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uElab_uDtDef = fun x y -> (match x with
  | C_Vuna_dElab_dDtDef (v0, v1, v2) -> (match y with
  | C_Vuna_dElab_dDtDef (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_uVuna_uCore_uTerm v1 w1) else false)) then (v_vuna_ueq_uVuna_uCore_uTerm v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 7 31 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 6 31 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uElab_uDtDef = fun x y -> if v_vuna_ueq_uVuna_uElab_uDtDef x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uElab_uEc = fun x y -> (match x with
  | C_Vuna_dElab_dEc (v0, v1, v2) -> (match y with
  | C_Vuna_dElab_dEc (w0, w1, w2) -> (if ((if (v_vuna_ueq_uint v0 w0) then (v_vuna_ueq_uVuna_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uList_uList v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 16 28 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 15 28 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uElab_uEc = fun x y -> if v_vuna_ueq_uVuna_uElab_uEc x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uElab_uCtx = fun x y -> (match x with
  | C_Vuna_dElab_dCtx (v0) -> (match y with
  | C_Vuna_dElab_dCtx (w0) -> v_vuna_ueq_uVuna_uList_uList v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 25 23 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 24 29 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uElab_uCtx = fun x y -> if v_vuna_ueq_uVuna_uElab_uCtx x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
