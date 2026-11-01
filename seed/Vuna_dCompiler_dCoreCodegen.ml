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
open Vuna_dCompiler_dElab
type   t_Vuna_dCompiler_dCoreCodegen_dGenSt =
    C_Vuna_dCompiler_dCoreCodegen_dGenSt of ((string) list) * (((string, string) t_Base_dPair_dPair) list) * (int)
and   t_Vuna_dCompiler_dCoreCodegen_dAltEnv =
    C_Vuna_dCompiler_dCoreCodegen_dAltEnv of (((string, bool) t_Base_dPair_dPair) list) * ((string) list) * (t_Vuna_dCompiler_dCoreCodegen_dGenSt)
let rec show_Vuna_dCompiler_dCoreCodegen_dGenSt v =
  match v with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt (f0, f1, f2) -> show_ctor "GenSt" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f1; (string_of_int) f2]
and show_Vuna_dCompiler_dCoreCodegen_dAltEnv v =
  match v with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv (f0, f1, f2) -> show_ctor "AltEnv" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vbool)) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; (show_Vuna_dCompiler_dCoreCodegen_dGenSt) f2]
let rec v_Vuna_dCompiler_dCoreCodegen_dflattenConApp = fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> (match v_Vuna_dCompiler_dCoreCodegen_dflattenConApp f with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (c, args)) -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (c, v_Base_dList_dappend args ((C_Base_dPair_dPair (a, erased)) :: ([]))))
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 31 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (c, args))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 30 19 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_ddefTable = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtDefName d, v_Vuna_dCompiler_dElab_ddtDefBody d)) :: (v_Vuna_dCompiler_dCoreCodegen_ddefTable rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 41 1 ("no matching clause for Vuna.Compiler.CoreCodegen.defTable")

let rec v_Vuna_dCompiler_dCoreCodegen_dfindDtDef = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (d) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtDefName d) name then C_Base_dMaybe_dJust (d) else v_Vuna_dCompiler_dCoreCodegen_dfindDtDef name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 45 1 ("no matching clause for Vuna.Compiler.CoreCodegen.findDtDef")

let v_Vuna_dCompiler_dCoreCodegen_disTypeLevelDef = fun table d -> v_Vuna_dCompiler_dCore_disTypeValue (v_Vuna_dCompiler_dCore_dforce table [] v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dCore_deval [] (v_Vuna_dCompiler_dElab_ddtDefType d)))

let rec v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (table, [], runtime, typeNames) -> C_Base_dPair_dPair (v_Base_dList_dreverse runtime, v_Base_dList_dreverse typeNames)
  | (table, (d) :: (rest), runtime, typeNames) -> if v_Vuna_dCompiler_dCoreCodegen_disTypeLevelDef table d then v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo table rest runtime ((v_Vuna_dCompiler_dElab_ddtDefName d) :: (typeNames)) else v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo table rest ((d) :: (runtime)) typeNames
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 55 1 ("no matching clause for Vuna.Compiler.CoreCodegen.partitionDefsGo")

let v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs = fun table defs -> v_Vuna_dCompiler_dCoreCodegen_dpartitionDefsGo table defs [] []

let v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint = fun m -> ((" ?") ^ (bi_str_from_int m))

let rec v_Vuna_dCompiler_dCoreCodegen_dbinderAt = fun a0 a1 -> match (a0, a1) with
  | (i, []) -> C_Base_dMaybe_dNothing
  | (i, (b) :: (rest)) -> if v_vuna_ule_uint i 0 then C_Base_dMaybe_dJust (b) else v_Vuna_dCompiler_dCoreCodegen_dbinderAt (bi_sub i 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 123 1 ("no matching clause for Vuna.Compiler.CoreCodegen.binderAt")

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckErasure = fun typeNames binders t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> (match v_Vuna_dCompiler_dCoreCodegen_dbinderAt i binders with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (n, erased)) -> if erased then C_Base_dResult_dErr ((let vuna_cat0' = ("DT: type-level binding `") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("` is used at runtime (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Base_dResult_dOk (0)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("DT: internal: unbound runtime variable ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 77 18 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTGlobal (name) -> if v_Base_dList_dmemName name typeNames then C_Base_dResult_dErr ((let vuna_cat0' = ("DT: type-level name `") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("` is used at runtime (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Base_dResult_dOk (0)
  | C_Vuna_dCompiler_dCore_dTType (n) -> C_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> C_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> C_Base_dResult_dErr ((("DT: unsolved metavariable in runtime code") ^ (v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint m)))
  | C_Vuna_dCompiler_dCore_dTLam (name, erased, body) -> v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames ((C_Base_dPair_dPair (name, erased)) :: (binders)) body
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> (match v_Vuna_dCompiler_dCoreCodegen_dflattenConApp t with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (c, args)) -> v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames binders args
  | C_Base_dMaybe_dNothing -> if erased then v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders f else v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders f) (fun _u -> v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders a)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 89 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames binders args
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders scrut) (fun _u -> v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure typeNames binders alts)
  | C_Vuna_dCompiler_dCore_dTInt (n) -> C_Base_dResult_dOk (0)
  | C_Vuna_dCompiler_dCore_dTStr (s) -> C_Base_dResult_dOk (0)
  | C_Vuna_dCompiler_dCore_dTBool (b) -> C_Base_dResult_dOk (0)
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders c) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders th) (fun _u -> v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders el))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 76 36 ("case pattern match failure"))
and v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, binders, []) -> C_Base_dResult_dOk (0)
  | (typeNames, binders, (C_Base_dPair_dPair (arg, erased)) :: (rest)) -> if erased then v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames binders rest else v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames binders arg) (fun _u -> v_Vuna_dCompiler_dCoreCodegen_dcheckConArgsErasure typeNames binders rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 108 1 ("no matching clause for Vuna.Compiler.CoreCodegen.checkConArgsErasure")
and v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (typeNames, binders, []) -> C_Base_dResult_dOk (0)
  | (typeNames, binders, (alt) :: (rest)) -> (let altBinders = v_Vuna_dCompiler_dCore_dcaseAltBinders alt in let env = v_Base_dList_dappend (v_Base_dList_dreverse altBinders) binders in v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames env (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) (fun _u -> v_Vuna_dCompiler_dCoreCodegen_dcheckAltErasure typeNames binders rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 114 1 ("no matching clause for Vuna.Compiler.CoreCodegen.checkAltErasure")

let v_Vuna_dCompiler_dCoreCodegen_dcheckOneErasure = fun typeNames d -> (match v_Vuna_dCompiler_dCoreCodegen_dcheckErasure typeNames [] (v_Vuna_dCompiler_dElab_ddtDefBody d) with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = ("in `") in (let vuna_cat1' = (v_Vuna_dCompiler_dElab_ddtDefName d) in (let vuna_cat2' = ("`: ") in (let vuna_cat3' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Base_dResult_dOk (n) -> C_Base_dResult_dOk (n)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 67 31 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure = fun a0 a1 -> match (a0, a1) with
  | (typeNames, []) -> C_Base_dResult_dOk (0)
  | (typeNames, (d) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckOneErasure typeNames d) (fun _u -> v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure typeNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 61 1 ("no matching clause for Vuna.Compiler.CoreCodegen.checkAllErasure")

let rec v_Vuna_dCompiler_dCoreCodegen_daddName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> (name) :: ([])
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then (x) :: (rest) else (x) :: (v_Vuna_dCompiler_dCoreCodegen_daddName name rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 160 1 ("no matching clause for Vuna.Compiler.CoreCodegen.addName")

let rec v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto = fun runtimeNames acc t -> (match t with
  | C_Vuna_dCompiler_dCore_dTGlobal (name) -> if v_Base_dList_dmemName name runtimeNames then v_Vuna_dCompiler_dCoreCodegen_daddName name acc else acc
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> acc
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> acc
  | C_Vuna_dCompiler_dCore_dTType (n) -> acc
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> acc
  | C_Vuna_dCompiler_dCore_dTLam (name, erased, body) -> v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames acc body
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> (match v_Vuna_dCompiler_dCoreCodegen_dflattenConApp t with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (c, args)) -> v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames acc args
  | C_Base_dMaybe_dNothing -> if erased then v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames acc f else v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames (v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames acc f) a
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 135 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames acc args
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts runtimeNames (v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames acc scrut) alts
  | C_Vuna_dCompiler_dCore_dTInt (n) -> acc
  | C_Vuna_dCompiler_dCore_dTStr (s) -> acc
  | C_Vuna_dCompiler_dCore_dTBool (b) -> acc
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames (v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames (v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames acc c) th) el
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 128 35 ("case pattern match failure"))
and v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (runtimeNames, acc, []) -> acc
  | (runtimeNames, acc, (C_Base_dPair_dPair (arg, erased)) :: (rest)) -> if erased then v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames acc rest else v_Vuna_dCompiler_dCoreCodegen_dtermDepsArgs runtimeNames (v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames acc arg) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 149 1 ("no matching clause for Vuna.Compiler.CoreCodegen.termDepsArgs")
and v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (runtimeNames, acc, []) -> acc
  | (runtimeNames, acc, (alt) :: (rest)) -> v_Vuna_dCompiler_dCoreCodegen_dtermDepsAlts runtimeNames (v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto runtimeNames acc (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 155 1 ("no matching clause for Vuna.Compiler.CoreCodegen.termDepsAlts")

let rec v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (v_Vuna_dCompiler_dElab_ddtDefName d) :: (v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 164 1 ("no matching clause for Vuna.Compiler.CoreCodegen.runtimeNamesOf")

let v_Vuna_dCompiler_dCoreCodegen_dlookupDtDef = fun defs name -> v_Vuna_dCompiler_dCoreCodegen_dfindDtDef name defs

let rec v_Vuna_dCompiler_dCoreCodegen_dneighborsOf = fun adj name -> (match adj with
  | [] -> []
  | (C_Base_dPair_dPair (n, ns)) :: (rest) -> if v_vuna_ueq_ustr n name then ns else v_Vuna_dCompiler_dCoreCodegen_dneighborsOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 178 24 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_ddependentsOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> []
  | (name, (C_Base_dPair_dPair (n, ns)) :: (rest)) -> (let dep = v_Vuna_dCompiler_dCoreCodegen_ddependentsOf name rest in if v_Base_dList_dmemName name ns then (n) :: (dep) else dep)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 183 1 ("no matching clause for Vuna.Compiler.CoreCodegen.dependentsOf")

let v_Vuna_dCompiler_dCoreCodegen_dreverseAdj = fun names adj -> v_Base_dList_dmap (fun n -> C_Base_dPair_dPair (n, v_Vuna_dCompiler_dCoreCodegen_ddependentsOf n adj)) names

let rec v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], visited, order) -> C_Base_dPair_dPair (visited, order)
  | (adj, (m) :: (rest), visited, order) -> if v_Base_dList_dmemName m visited then v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost adj rest visited order else (match v_Vuna_dCompiler_dCoreCodegen_ddfsPost adj m ((m) :: (visited)) order with
  | C_Base_dPair_dPair (visited2, order2) -> v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost adj rest visited2 order2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 195 6 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 193 1 ("no matching clause for Vuna.Compiler.CoreCodegen.foldNeighborsPost")
and v_Vuna_dCompiler_dCoreCodegen_ddfsPost = fun adj n visited order -> (match v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsPost adj (v_Vuna_dCompiler_dCoreCodegen_dneighborsOf adj n) visited order with
  | C_Base_dPair_dPair (visited2, order2) -> C_Base_dPair_dPair (visited2, (n) :: (order2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 199 31 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_dpostOrder = fun adj nodes visited order -> (match nodes with
  | [] -> C_Base_dPair_dPair (visited, order)
  | (n) :: (rest) -> if v_Base_dList_dmemName n visited then v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj rest visited order else (match v_Vuna_dCompiler_dCoreCodegen_ddfsPost adj n ((n) :: (visited)) order with
  | C_Base_dPair_dPair (visited2, order2) -> v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj rest visited2 order2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 206 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 203 37 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (revAdj, [], visited, comp) -> C_Base_dPair_dPair (visited, comp)
  | (revAdj, (m) :: (rest), visited, comp) -> if v_Base_dList_dmemName m visited then v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect revAdj rest visited comp else (match v_Vuna_dCompiler_dCoreCodegen_ddfsCollect revAdj m ((m) :: (visited)) comp with
  | C_Base_dPair_dPair (visited2, comp2) -> v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect revAdj rest visited2 comp2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 212 6 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 210 1 ("no matching clause for Vuna.Compiler.CoreCodegen.foldNeighborsCollect")
and v_Vuna_dCompiler_dCoreCodegen_ddfsCollect = fun revAdj n visited comp -> (match v_Vuna_dCompiler_dCoreCodegen_dfoldNeighborsCollect revAdj (v_Vuna_dCompiler_dCoreCodegen_dneighborsOf revAdj n) visited comp with
  | C_Base_dPair_dPair (visited2, comp2) -> C_Base_dPair_dPair (visited2, (n) :: (comp2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 216 36 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_dcollectComps = fun revAdj nodes visited comps -> (match nodes with
  | [] -> comps
  | (n) :: (rest) -> if v_Base_dList_dmemName n visited then v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj rest visited comps else (match v_Vuna_dCompiler_dCoreCodegen_ddfsCollect revAdj n ((n) :: (visited)) [] with
  | C_Base_dPair_dPair (visited2, comp) -> v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj rest visited2 ((comp) :: (comps))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 223 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 220 43 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_dcomponentOf = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> C_Base_dMaybe_dNothing
  | ((g) :: (rest), name) -> if v_Base_dList_dmemName name g then C_Base_dMaybe_dJust (g) else v_Vuna_dCompiler_dCoreCodegen_dcomponentOf rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 227 1 ("no matching clause for Vuna.Compiler.CoreCodegen.componentOf")

let rec v_Vuna_dCompiler_dCoreCodegen_dfilterNames = fun pred names -> (match names with
  | [] -> []
  | (n) :: (rest) -> if pred n then (n) :: (v_Vuna_dCompiler_dCoreCodegen_dfilterNames pred rest) else v_Vuna_dCompiler_dCoreCodegen_dfilterNames pred rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 244 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (comps, allNames, [], emitted) -> []
  | (comps, allNames, (n) :: (rest), emitted) -> if v_Base_dList_dmemName n emitted then v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo comps allNames rest emitted else (match v_Vuna_dCompiler_dCoreCodegen_dcomponentOf comps n with
  | C_Base_dMaybe_dJust (g) -> (v_Vuna_dCompiler_dCoreCodegen_dfilterNames (fun m -> v_Base_dList_dmemName m g) allNames) :: (v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo comps allNames rest (v_Base_dList_dappend g emitted))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo comps allNames rest emitted
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 237 6 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 235 1 ("no matching clause for Vuna.Compiler.CoreCodegen.groupsFromCompsGo")

let v_Vuna_dCompiler_dCoreCodegen_dgroupsFromComps = fun comps names -> v_Vuna_dCompiler_dCoreCodegen_dgroupsFromCompsGo comps names names []

let v_Vuna_dCompiler_dCoreCodegen_dnotIn = fun name names -> if v_Base_dList_dmemName name names then false else true

let rec v_Vuna_dCompiler_dCoreCodegen_duniqueNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((name) :: (rest)) -> if v_vuna_ueq_ustr name "" then v_Vuna_dCompiler_dCoreCodegen_duniqueNames rest else if v_Base_dList_dmemName name rest then v_Vuna_dCompiler_dCoreCodegen_duniqueNames rest else (name) :: (v_Vuna_dCompiler_dCoreCodegen_duniqueNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 252 1 ("no matching clause for Vuna.Compiler.CoreCodegen.uniqueNames")

let v_Vuna_dCompiler_dCoreCodegen_dgroupDeps = fun adj group -> v_Vuna_dCompiler_dCoreCodegen_dfilterNames (fun n -> v_Vuna_dCompiler_dCoreCodegen_dnotIn n group) (v_Vuna_dCompiler_dCoreCodegen_duniqueNames (v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCoreCodegen_dneighborsOf adj) group))

let rec v_Vuna_dCompiler_dCoreCodegen_dallIn = fun names allowed -> (match names with
  | [] -> true
  | (n) :: (rest) -> if v_Base_dList_dmemName n allowed then v_Vuna_dCompiler_dCoreCodegen_dallIn rest allowed else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 262 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dCoreCodegen_dgroupReady = fun adj group emitted -> v_Vuna_dCompiler_dCoreCodegen_dallIn (v_Vuna_dCompiler_dCoreCodegen_dgroupDeps adj group) emitted

let rec v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (adj, [], before, emitted) -> C_Base_dMaybe_dNothing
  | (adj, (g) :: (rest), before, emitted) -> if v_Vuna_dCompiler_dCoreCodegen_dgroupReady adj g emitted then C_Base_dMaybe_dJust (C_Base_dPair_dPair (g, v_Base_dList_dappend (v_Base_dList_dreverse before) rest)) else v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc adj rest ((g) :: (before)) emitted
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 273 1 ("no matching clause for Vuna.Compiler.CoreCodegen.pickReadyAcc")

let v_Vuna_dCompiler_dCoreCodegen_dpickReady = fun adj groups emitted -> v_Vuna_dCompiler_dCoreCodegen_dpickReadyAcc adj groups [] emitted

let rec v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, [], emitted) -> C_Base_dResult_dOk ([])
  | (adj, remaining, emitted) -> (match v_Vuna_dCompiler_dCoreCodegen_dpickReady adj remaining emitted with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("DT: dependency cycle between runtime definitions")
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (g, rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc adj rest (v_Base_dList_dappend g emitted)) (fun tail -> C_Base_dResult_dOk ((g) :: (tail)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 283 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 282 1 ("no matching clause for Vuna.Compiler.CoreCodegen.orderGroupsAcc")

let v_Vuna_dCompiler_dCoreCodegen_dorderGroups = fun adj groups -> v_Vuna_dCompiler_dCoreCodegen_dorderGroupsAcc adj groups []

let v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency = fun defs -> (let names = v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf defs in v_Base_dList_dmap (fun d -> C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtDefName d, v_Vuna_dCompiler_dCoreCodegen_dtermDepsInto names [] (v_Vuna_dCompiler_dElab_ddtDefBody d))) defs)

let rec v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf = fun a0 a1 -> match (a0, a1) with
  | (defs, []) -> []
  | (defs, (n) :: (rest)) -> (match v_Vuna_dCompiler_dCoreCodegen_dlookupDtDef defs n with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf defs rest
  | C_Base_dMaybe_dJust (d) -> (d) :: (v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf defs rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 310 32 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 309 1 ("no matching clause for Vuna.Compiler.CoreCodegen.groupDefsOf")

let v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs = fun defs -> (let names = v_Vuna_dCompiler_dCoreCodegen_druntimeNamesOf defs in let adj = v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency defs in let revAdj = v_Vuna_dCompiler_dCoreCodegen_dreverseAdj names adj in (match v_Vuna_dCompiler_dCoreCodegen_dpostOrder adj names [] [] with
  | C_Base_dPair_dPair (_, order) -> (let comps = v_Vuna_dCompiler_dCoreCodegen_dcollectComps revAdj order [] [] in let groups = v_Vuna_dCompiler_dCoreCodegen_dgroupsFromComps comps names in v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dorderGroups adj groups) (fun ordered -> C_Base_dResult_dOk (v_Base_dList_dmap (v_Vuna_dCompiler_dCoreCodegen_dgroupDefsOf defs) ordered)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 301 6 ("case pattern match failure")))

let v_Vuna_dCompiler_dCoreCodegen_dprepareDtProgram = fun program -> (let datas = v_Base_dPair_dfirstOf program in let defs = v_Base_dPair_dsecondOf program in let table = v_Vuna_dCompiler_dCoreCodegen_ddefTable defs in let familyNames = v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName datas in (match v_Vuna_dCompiler_dCoreCodegen_dpartitionDefs table defs with
  | C_Base_dPair_dPair (runtime, typeNames) -> (let allTypeNames = v_Base_dList_dappend typeNames familyNames in v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dcheckAllErasure allTypeNames runtime) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgroupRuntimeDefs runtime) (fun groups -> C_Base_dResult_dOk (C_Base_dPair_dPair (runtime, groups)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 323 6 ("case pattern match failure")))

let v_Vuna_dCompiler_dCoreCodegen_dsanitizeChar = fun c -> if v_vuna_ueq_uint c 46 then (95) :: ((100) :: ([])) else if v_vuna_ueq_uint c 95 then (95) :: ((117) :: ([])) else if v_vuna_ueq_uint c 39 then (95) :: ((112) :: ([])) else (c) :: ([])

let v_Vuna_dCompiler_dCoreCodegen_dsanitizeName = fun name -> bi_str_pack (v_Base_dList_dconcatMap v_Vuna_dCompiler_dCoreCodegen_dsanitizeChar (bi_str_unpack name))

let v_Vuna_dCompiler_dCoreCodegen_docamlPad3 = fun s -> if v_vuna_ueq_uint (bi_str_length s) 1 then (("00") ^ (s)) else if v_vuna_ueq_uint (bi_str_length s) 2 then (("0") ^ (s)) else s

let v_Vuna_dCompiler_dCoreCodegen_docamlEscapeChar = fun c -> if v_vuna_ueq_uint c 34 then (92) :: ((34) :: ([])) else if v_vuna_ueq_uint c 92 then (92) :: ((92) :: ([])) else if v_vuna_ueq_uint c 10 then (92) :: ((110) :: ([])) else if v_vuna_ueq_uint c 9 then (92) :: ((116) :: ([])) else if v_vuna_ueq_uint c 13 then (92) :: ((114) :: ([])) else if (if (v_vuna_uge_uint c 32) then (v_vuna_ule_uint c 126) else false) then (c) :: ([]) else bi_str_unpack ((("\\") ^ (v_Vuna_dCompiler_dCoreCodegen_docamlPad3 (bi_str_from_int c))))

let v_Vuna_dCompiler_dCoreCodegen_docamlString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (bi_str_pack (v_Base_dList_dconcatMap v_Vuna_dCompiler_dCoreCodegen_docamlEscapeChar (bi_str_unpack s))) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dCoreCodegen_dvalueName = fun name -> (("v_") ^ (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName name))

let v_Vuna_dCompiler_dCoreCodegen_dboolText = fun b -> if b then "true" else "false"

let v_Vuna_dCompiler_dCoreCodegen_dtypeName = fun name -> (("t_") ^ (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName name))

let v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName = fun family ctor -> (let vuna_cat0' = ("C_") in (let vuna_cat1' = (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName family) in (let vuna_cat2' = ("_") in (let vuna_cat3' = (v_Vuna_dCompiler_dCoreCodegen_dsanitizeName ctor) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let v_Vuna_dCompiler_dCoreCodegen_ddtRuntime = "let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b
let bi_eq_int (a : int) (b : int) = a = b
let bi_neq_int (a : int) (b : int) = a <> b
let bi_lt_int (a : int) (b : int) = a < b
let bi_le_int (a : int) (b : int) = a <= b
let bi_gt_int (a : int) (b : int) = a > b
let bi_ge_int (a : int) (b : int) = a >= b
let bi_concat a b = a ^ b
let bi_and a b = a && b
let bi_or a b = a || b
let dt_show_bool b = if b then \"True\" else \"False\"
let dt_show_string s =
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
"

let v_Vuna_dCompiler_dCoreCodegen_dglobalRef = fun name -> (match name with
  | "True" -> C_Base_dResult_dOk ("true")
  | "False" -> C_Base_dResult_dOk ("false")
  | "+" -> C_Base_dResult_dOk ("bi_add")
  | "-" -> C_Base_dResult_dOk ("bi_sub")
  | "*" -> C_Base_dResult_dOk ("bi_mul")
  | "/" -> C_Base_dResult_dOk ("bi_div")
  | "==" -> C_Base_dResult_dOk ("bi_eq_int")
  | "/=" -> C_Base_dResult_dOk ("bi_neq_int")
  | "<" -> C_Base_dResult_dOk ("bi_lt_int")
  | "<=" -> C_Base_dResult_dOk ("bi_le_int")
  | ">" -> C_Base_dResult_dOk ("bi_gt_int")
  | ">=" -> C_Base_dResult_dOk ("bi_ge_int")
  | "++" -> C_Base_dResult_dOk ("bi_concat")
  | "&&" -> C_Base_dResult_dOk ("bi_and")
  | "||" -> C_Base_dResult_dOk ("bi_or")
  | _ -> C_Base_dResult_dOk (v_Vuna_dCompiler_dCoreCodegen_dvalueName name)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 402 18 ("case pattern match failure"))

let v_Vuna_dCompiler_dCoreCodegen_docamlFieldTy = fun families v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> if v_vuna_ueq_ustr g "Int" then "int" else if v_vuna_ueq_ustr g "String" then "string" else if v_vuna_ueq_ustr g "Bool" then "bool" else if v_Base_dList_dmemName g families then (("'a ") ^ (v_Vuna_dCompiler_dCoreCodegen_dtypeName g)) else "'a"
  | _ -> "'a"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 439 17 ("case pattern match failure"))
  | _ -> "'a"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 438 27 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dCoreCodegen_dctorFieldTys = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (families, [], lvl, v) -> []
  | (families, (C_Base_dPair_dPair (name, erased)) :: (rest), lvl, v) -> (match v with
  | C_Vuna_dCompiler_dCore_dVPi (pname, implicit, dom, clo) -> (let next = v_Vuna_dCompiler_dCore_dapplyClosure clo (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (pname, lvl, []))) in if erased then v_Vuna_dCompiler_dCoreCodegen_dctorFieldTys families rest (bi_add lvl 1) next else (v_Vuna_dCompiler_dCoreCodegen_docamlFieldTy families dom) :: (v_Vuna_dCompiler_dCoreCodegen_dctorFieldTys families rest (bi_add lvl 1) next))
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 450 60 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 449 1 ("no matching clause for Vuna.Compiler.CoreCodegen.ctorFieldTys")

let v_Vuna_dCompiler_dCoreCodegen_dgsCtors = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCoreCodegen_dGenSt (families, ctors, next)) -> ctors
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 494 1 ("no matching clause for Vuna.Compiler.CoreCodegen.gsCtors")

let v_Vuna_dCompiler_dCoreCodegen_dgenGlobalRef = fun st name -> (match v_Base_dList_dlookupPair name (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st) with
  | C_Base_dMaybe_dJust (family) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName family name, st))
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dglobalRef name) (fun r -> C_Base_dResult_dOk (C_Base_dPair_dPair (r, st)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 423 24 ("case pattern match failure"))

let v_Vuna_dCompiler_dCoreCodegen_dgsNext = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCoreCodegen_dGenSt (families, ctors, next)) -> next
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 496 1 ("no matching clause for Vuna.Compiler.CoreCodegen.gsNext")

let v_Vuna_dCompiler_dCoreCodegen_dgsPutNext = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dCoreCodegen_dGenSt (families, ctors, next), n) -> C_Vuna_dCompiler_dCoreCodegen_dGenSt (families, ctors, n)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 498 1 ("no matching clause for Vuna.Compiler.CoreCodegen.gsPutNext")

let v_Vuna_dCompiler_dCoreCodegen_dctorTableOfData = fun d -> v_Base_dList_dmap (fun c -> C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtCtorName c, v_Vuna_dCompiler_dElab_ddtCtorFamily c)) (v_Vuna_dCompiler_dElab_ddtDataCtors d)

let rec v_Vuna_dCompiler_dCoreCodegen_dctorTableOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> v_Base_dList_dappend (v_Vuna_dCompiler_dCoreCodegen_dctorTableOfData d) (v_Vuna_dCompiler_dCoreCodegen_dctorTableOf rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 504 1 ("no matching clause for Vuna.Compiler.CoreCodegen.ctorTableOf")

let v_Vuna_dCompiler_dCoreCodegen_dmkGenSt = fun datas -> C_Vuna_dCompiler_dCoreCodegen_dGenSt (v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName datas, v_Vuna_dCompiler_dCoreCodegen_dctorTableOf datas, 0)

let v_Vuna_dCompiler_dCoreCodegen_daeEnv = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCoreCodegen_dAltEnv (env, pats, st)) -> env
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 515 1 ("no matching clause for Vuna.Compiler.CoreCodegen.aeEnv")

let v_Vuna_dCompiler_dCoreCodegen_daePats = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCoreCodegen_dAltEnv (env, pats, st)) -> pats
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 517 1 ("no matching clause for Vuna.Compiler.CoreCodegen.aePats")

let v_Vuna_dCompiler_dCoreCodegen_daeSt = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dCoreCodegen_dAltEnv (env, pats, st)) -> st
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 519 1 ("no matching clause for Vuna.Compiler.CoreCodegen.aeSt")

let rec v_Vuna_dCompiler_dCoreCodegen_daltEnvGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (st, env, [], pats) -> C_Vuna_dCompiler_dCoreCodegen_dAltEnv (env, v_Base_dList_dreverse pats, st)
  | (st, env, (C_Base_dPair_dPair (name, erased)) :: (rest), pats) -> if erased then v_Vuna_dCompiler_dCoreCodegen_daltEnvGo st ((C_Base_dPair_dPair ("", true)) :: (env)) rest pats else (let fresh = v_Vuna_dCompiler_dCoreCodegen_dgsNext st in let nm = (("dtb__") ^ (bi_str_from_int fresh)) in v_Vuna_dCompiler_dCoreCodegen_daltEnvGo (v_Vuna_dCompiler_dCoreCodegen_dgsPutNext st (bi_add fresh 1)) ((C_Base_dPair_dPair (nm, false)) :: (env)) rest ((nm) :: (pats)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 522 1 ("no matching clause for Vuna.Compiler.CoreCodegen.altEnvGo")

let v_Vuna_dCompiler_dCoreCodegen_daltEnv = fun st outer tele -> v_Vuna_dCompiler_dCoreCodegen_daltEnvGo st outer tele []

let rec v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt = fun a0 -> match a0 with
  | ([]) -> false
  | ((alt) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dCore_dcaseAltName alt) "" then true else v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 604 1 ("no matching clause for Vuna.Compiler.CoreCodegen.hasFallbackAlt")

let rec v_Vuna_dCompiler_dCoreCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Vuna_dCompiler_dCoreCodegen_djoinWith sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 654 1 ("no matching clause for Vuna.Compiler.CoreCodegen.joinWith")

let v_Vuna_dCompiler_dCoreCodegen_dctorDeclText = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> name
  | (name, (t) :: ([])) -> (let vuna_cat0' = (name) in (let vuna_cat1' = (" of ") in (let vuna_cat2' = (t) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | (name, ts) -> (let vuna_cat0' = (name) in (let vuna_cat1' = (" of ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCoreCodegen_djoinWith " * " ts) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 459 1 ("no matching clause for Vuna.Compiler.CoreCodegen.ctorDeclText")

let v_Vuna_dCompiler_dCoreCodegen_dgenCtorDecl = fun families c -> C_Base_dResult_dOk (v_Vuna_dCompiler_dCoreCodegen_dctorDeclText (v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName (v_Vuna_dCompiler_dElab_ddtCtorFamily c) (v_Vuna_dCompiler_dElab_ddtCtorName c)) (v_Vuna_dCompiler_dCoreCodegen_dctorFieldTys families (v_Vuna_dCompiler_dElab_ddtCtorTelescope c) 0 (v_Vuna_dCompiler_dCore_deval [] (v_Vuna_dCompiler_dElab_ddtCtorType c))))

let v_Vuna_dCompiler_dCoreCodegen_dctorBodyText = fun a0 -> match a0 with
  | ([]) -> "|"
  | (cs) -> v_Vuna_dCompiler_dCoreCodegen_djoinWith " | " cs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 474 1 ("no matching clause for Vuna.Compiler.CoreCodegen.ctorBodyText")

let v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl = fun families d -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dCoreCodegen_dgenCtorDecl families) (v_Vuna_dCompiler_dElab_ddtDataCtors d)) (fun cs -> C_Base_dResult_dOk ((let vuna_cat0' = ("'a ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCoreCodegen_dtypeName (v_Vuna_dCompiler_dElab_ddtDataName d)) in (let vuna_cat2' = (" = ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCoreCodegen_dctorBodyText cs) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))

let v_Vuna_dCompiler_dCoreCodegen_dgenTypeDecls = fun datas -> (match datas with
  | [] -> C_Base_dResult_dOk ("")
  | _ -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dCoreCodegen_dgenDataDecl (v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDataName datas)) datas) (fun parts -> C_Base_dResult_dOk ((let vuna_cat0' = ("type ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand " parts) in (let vuna_cat2' = ("\n\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 479 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dCoreCodegen_dconAppText = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> name
  | (name, (a) :: ([])) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (a) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | (name, args) -> (let vuna_cat0' = ("(") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (v_Vuna_dCompiler_dCoreCodegen_djoinWith ", " args) in (let vuna_cat4' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 583 1 ("no matching clause for Vuna.Compiler.CoreCodegen.conAppText")

let v_Vuna_dCompiler_dCoreCodegen_darmPatternText = fun a0 a1 -> match (a0, a1) with
  | (cname, []) -> cname
  | (cname, pats) -> (let vuna_cat0' = (cname) in (let vuna_cat1' = (" (") in (let vuna_cat2' = (v_Vuna_dCompiler_dCoreCodegen_djoinWith ", " pats) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 608 1 ("no matching clause for Vuna.Compiler.CoreCodegen.armPatternText")

let rec v_Vuna_dCompiler_dCoreCodegen_dgenTerm = fun st binders t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (name, i) -> (match v_Vuna_dCompiler_dCoreCodegen_dbinderAt i binders with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (oc, erased)) -> if erased then C_Base_dResult_dErr ((let vuna_cat0' = ("DT: type-level binding `") in (let vuna_cat1' = (name) in (let vuna_cat2' = ("` is used at runtime (M13 limitation)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Base_dResult_dOk (C_Base_dPair_dPair (oc, st))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("DT: internal: unbound runtime variable")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 535 18 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTGlobal (name) -> v_Vuna_dCompiler_dCoreCodegen_dgenGlobalRef st name
  | C_Vuna_dCompiler_dCore_dTInt (n) -> C_Base_dResult_dOk (C_Base_dPair_dPair (bi_str_from_int n, st))
  | C_Vuna_dCompiler_dCore_dTStr (s) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dCoreCodegen_docamlString s, st))
  | C_Vuna_dCompiler_dCore_dTBool (b) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dCoreCodegen_dboolText b, st))
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st binders c) (fun pc -> (match pc with
  | C_Base_dPair_dPair (gc, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st1 binders th) (fun pt -> (match pt with
  | C_Base_dPair_dPair (gt, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st2 binders el) (fun pe -> (match pe with
  | C_Base_dPair_dPair (ge, st3) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = ("(if ") in (let vuna_cat1' = (gc) in (let vuna_cat2' = (" then ") in (let vuna_cat3' = (gt) in (let vuna_cat4' = (" else ") in (let vuna_cat5' = (ge) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 546 63 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 545 61 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 544 57 ("case pattern match failure")))
  | C_Vuna_dCompiler_dCore_dTLam (name, erased, body) -> if erased then v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st ((C_Base_dPair_dPair ("", true)) :: (binders)) body) (fun p -> (match p with
  | C_Base_dPair_dPair (b, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (b, st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 551 102 ("case pattern match failure"))) else (let ocName = v_Vuna_dCompiler_dCoreCodegen_dsanitizeName name in v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st ((C_Base_dPair_dPair (ocName, false)) :: (binders)) body) (fun p -> (match p with
  | C_Base_dPair_dPair (b, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = ("(fun ") in (let vuna_cat1' = (ocName) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 557 72 ("case pattern match failure"))))
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> v_Vuna_dCompiler_dCoreCodegen_dgenApp st binders f a erased
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> v_Vuna_dCompiler_dCoreCodegen_dgenConApp st binders c args
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> v_Vuna_dCompiler_dCoreCodegen_dgenCase st binders scrut alts
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, dom, cod) -> C_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCompiler_dCore_dTType (n) -> C_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)")
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> C_Base_dResult_dErr ((("DT: unsolved metavariable in runtime code") ^ (v_Vuna_dCompiler_dCoreCodegen_dshowMetaHint m)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 534 24 ("case pattern match failure"))
and v_Vuna_dCompiler_dCoreCodegen_dgenApp = fun st binders f a erased -> if erased then v_Vuna_dCompiler_dCoreCodegen_dgenTerm st binders f else (match v_Vuna_dCompiler_dCoreCodegen_dflattenConApp (C_Vuna_dCompiler_dCore_dTApp (f, a, erased)) with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (c, args)) -> v_Vuna_dCompiler_dCoreCodegen_dgenConApp st binders c args
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st binders f) (fun pf -> (match pf with
  | C_Base_dPair_dPair (fs, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st1 binders a) (fun pa -> (match pa with
  | C_Base_dPair_dPair (at, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = ("(") in (let vuna_cat1' = (fs) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (at) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 575 60 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 574 53 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 572 6 ("case pattern match failure"))
and v_Vuna_dCompiler_dCoreCodegen_dgenConArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (st, binders, []) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (st, binders, (C_Base_dPair_dPair (arg, erased)) :: (rest)) -> if erased then v_Vuna_dCompiler_dCoreCodegen_dgenConArgs st binders rest else v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st binders arg) (fun p -> (match p with
  | C_Base_dPair_dPair (text, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenConArgs st2 binders rest) (fun q -> (match q with
  | C_Base_dPair_dPair (texts, st3) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((text) :: (texts), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 591 65 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 590 46 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 588 1 ("no matching clause for Vuna.Compiler.CoreCodegen.genConArgs")
and v_Vuna_dCompiler_dCoreCodegen_dgenConApp = fun st binders c args -> (match v_Base_dList_dlookupPair c (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st) with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("DT: internal: unknown constructor ") ^ (c)))
  | C_Base_dMaybe_dJust (family) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenConArgs st binders args) (fun p -> (match p with
  | C_Base_dPair_dPair (argTexts, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dCoreCodegen_dconAppText (v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName family c) argTexts, st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 599 62 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 597 31 ("case pattern match failure"))
and v_Vuna_dCompiler_dCoreCodegen_dgenArm = fun st outer alt -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dCore_dcaseAltName alt) "" then (let bound = v_Vuna_dCompiler_dCoreCodegen_daltEnv st outer (v_Vuna_dCompiler_dCore_dcaseAltBinders alt) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm (v_Vuna_dCompiler_dCoreCodegen_daeSt bound) (v_Vuna_dCompiler_dCoreCodegen_daeEnv bound) (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) (fun p -> (match p with
  | C_Base_dPair_dPair (b, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = ("  | _ -> ") in (let vuna_cat1' = (b) in (let vuna_cat2' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 615 76 ("case pattern match failure")))) else (match v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dcaseAltName alt) (v_Vuna_dCompiler_dCoreCodegen_dgsCtors st) with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((("DT: internal: unknown constructor ") ^ (v_Vuna_dCompiler_dCore_dcaseAltName alt)))
  | C_Base_dMaybe_dJust (family) -> (let bound = v_Vuna_dCompiler_dCoreCodegen_daltEnv st outer (v_Vuna_dCompiler_dCore_dcaseAltBinders alt) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm (v_Vuna_dCompiler_dCoreCodegen_daeSt bound) (v_Vuna_dCompiler_dCoreCodegen_daeEnv bound) (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) (fun p -> (match p with
  | C_Base_dPair_dPair (b, st2) -> (let cname = v_Vuna_dCompiler_dCoreCodegen_dctorOcamlName family (v_Vuna_dCompiler_dCore_dcaseAltName alt) in let patText = v_Vuna_dCompiler_dCoreCodegen_darmPatternText cname (v_Vuna_dCompiler_dCoreCodegen_daePats bound) in C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = ("  | ") in (let vuna_cat1' = (patText) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))), st2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 623 78 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 618 6 ("case pattern match failure"))
and v_Vuna_dCompiler_dCoreCodegen_dgenArms = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (st, binders, []) -> C_Base_dResult_dOk (C_Base_dPair_dPair ("", st))
  | (st, binders, (alt) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenArm st binders alt) (fun p -> (match p with
  | C_Base_dPair_dPair (arm, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenArms st2 binders rest) (fun q -> (match q with
  | C_Base_dPair_dPair (arms, st3) -> C_Base_dResult_dOk (C_Base_dPair_dPair (((arm) ^ (arms)), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 634 61 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 633 75 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 632 1 ("no matching clause for Vuna.Compiler.CoreCodegen.genArms")
and v_Vuna_dCompiler_dCoreCodegen_dgenCase = fun st binders scrut alts -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st binders scrut) (fun p -> (match p with
  | C_Base_dPair_dPair (scrutText, st1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenArms st1 binders alts) (fun q -> (match q with
  | C_Base_dPair_dPair (arms, st2) -> (let fallback = if v_Vuna_dCompiler_dCoreCodegen_dhasFallbackAlt alts then "" else "  | _ -> failwith \"DT: impossible branch\"\n" in C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = ("(match ") in (let vuna_cat1' = (scrutText) in (let vuna_cat2' = (" with\n") in (let vuna_cat3' = (arms) in (let vuna_cat4' = (fallback) in (let vuna_cat5' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))), st2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 641 67 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 640 75 ("case pattern match failure")))

let v_Vuna_dCompiler_dCoreCodegen_dgenGroupDef = fun st d -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTerm st [] (v_Vuna_dCompiler_dElab_ddtDefBody d)) (fun p -> (match p with
  | C_Base_dPair_dPair (body, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = (v_Vuna_dCompiler_dCoreCodegen_dvalueName (v_Vuna_dCompiler_dElab_ddtDefName d)) in (let vuna_cat1' = (" = ") in (let vuna_cat2' = (body) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 659 65 ("case pattern match failure")))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies = fun a0 a1 -> match (a0, a1) with
  | (st, []) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (st, (d) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenGroupDef st d) (fun p -> (match p with
  | C_Base_dPair_dPair (def, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies st2 rest) (fun q -> (match q with
  | C_Base_dPair_dPair (defs, st3) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((def) :: (defs), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 666 60 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 665 67 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 664 1 ("no matching clause for Vuna.Compiler.CoreCodegen.genGroupBodies")

let v_Vuna_dCompiler_dCoreCodegen_dgroupNeedsRec = fun a0 a1 -> match (a0, a1) with
  | (adj, []) -> false
  | (adj, (d) :: ([])) -> v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtDefName d) (v_Vuna_dCompiler_dCoreCodegen_dneighborsOf adj (v_Vuna_dCompiler_dElab_ddtDefName d))
  | (adj, group) -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 673 1 ("no matching clause for Vuna.Compiler.CoreCodegen.groupNeedsRec")

let v_Vuna_dCompiler_dCoreCodegen_dgenGroup = fun adj st group -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenGroupBodies st group) (fun p -> (match p with
  | C_Base_dPair_dPair (defs, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (((if v_Vuna_dCompiler_dCoreCodegen_dgroupNeedsRec adj group then "let rec " else "let ") ^ (v_Vuna_dCompiler_dCoreCodegen_djoinWith "\nand " defs)), st2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 678 66 ("case pattern match failure")))

let rec v_Vuna_dCompiler_dCoreCodegen_dgenGroups = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (adj, st, []) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], st))
  | (adj, st, (g) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenGroup adj st g) (fun p -> (match p with
  | C_Base_dPair_dPair (text, st2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenGroups adj st2 rest) (fun q -> (match q with
  | C_Base_dPair_dPair (texts, st3) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((text) :: (texts), st3))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 687 60 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 686 67 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 685 1 ("no matching clause for Vuna.Compiler.CoreCodegen.genGroups")

let v_Vuna_dCompiler_dCoreCodegen_dmainShowErr = C_Base_dResult_dErr ("DT: main must return Int, String or Bool (M13 limitation)")

let v_Vuna_dCompiler_dCoreCodegen_dmainShowForName = fun g -> (match g with
  | "Int" -> C_Base_dResult_dOk (C_Base_dPair_dPair ("string_of_int", "int"))
  | "String" -> C_Base_dResult_dOk (C_Base_dPair_dPair ("dt_show_string", "string"))
  | "Bool" -> C_Base_dResult_dOk (C_Base_dPair_dPair ("dt_show_bool", "bool"))
  | _ -> v_Vuna_dCompiler_dCoreCodegen_dmainShowErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 701 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dCoreCodegen_dmainShow = fun table tyTerm -> (match v_Vuna_dCompiler_dCore_dforce table [] v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dCore_deval [] tyTerm) with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, []) -> v_Vuna_dCompiler_dCoreCodegen_dmainShowForName g
  | _ -> v_Vuna_dCompiler_dCoreCodegen_dmainShowErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 695 17 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dCoreCodegen_dmainShowErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 694 25 ("case pattern match failure"))

let v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody = fun program -> (let datas = v_Base_dPair_dfirstOf program in let defs = v_Base_dPair_dsecondOf program in v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dprepareDtProgram program) (fun p -> (match p with
  | C_Base_dPair_dPair (runtime, groups) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenTypeDecls datas) (fun typeText -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenGroups (v_Vuna_dCompiler_dCoreCodegen_ddepAdjacency runtime) (v_Vuna_dCompiler_dCoreCodegen_dmkGenSt datas) groups) (fun q -> (match q with
  | C_Base_dPair_dPair (bodies, st2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((let vuna_cat0' = (v_Vuna_dCompiler_dCoreCodegen_ddtRuntime) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (typeText) in (let vuna_cat3' = (v_Vuna_dCompiler_dCoreCodegen_djoinWith "\n\n" bodies) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))), C_Base_dPair_dPair (runtime, v_Vuna_dCompiler_dCoreCodegen_ddefTable defs)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 718 144 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 717 48 ("case pattern match failure"))))

let v_Vuna_dCompiler_dCoreCodegen_dgenerateDtProgram = fun program printResult -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody program) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyText, C_Base_dPair_dPair (runtime, table)) -> (match v_Vuna_dCompiler_dCoreCodegen_dfindDtDef "main" runtime with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("DT: no main definition")
  | C_Base_dMaybe_dJust (mainDef) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dmainShow table (v_Vuna_dCompiler_dElab_ddtDefType mainDef)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair (showFn, kind) -> (let mainRef = v_Vuna_dCompiler_dCoreCodegen_dvalueName "main" in let hook = if printResult then (let vuna_cat0' = ("let () = print_endline (") in (let vuna_cat1' = (showFn) in (let vuna_cat2' = (" (") in (let vuna_cat3' = (mainRef) in (let vuna_cat4' = ("))\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("let () = ignore (") in (let vuna_cat1' = (mainRef) in (let vuna_cat2' = (")\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in C_Base_dResult_dOk ((let vuna_cat0' = (bodyText) in (let vuna_cat1' = ("\n") in (let vuna_cat2' = (hook) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 730 80 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 728 41 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/CoreCodegen.vuna" 727 81 ("case pattern match failure")))

let v_Vuna_dCompiler_dCoreCodegen_dcheckDtProgram = fun program -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dCoreCodegen_dgenProgramBody program) (fun _u -> C_Base_dResult_dOk (0))

let v_vuna_ueq_uVuna_uCompiler_uCoreCodegen_uGenSt = fun x y -> (match x with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dCoreCodegen_dGenSt (w0, w1, w2) -> (if ((if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)) then (v_vuna_ueq_uint v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 3 47 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 2 47 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uCoreCodegen_uGenSt = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uCoreCodegen_uGenSt x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uCoreCodegen_uAltEnv = fun x y -> (match x with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dCoreCodegen_dAltEnv (w0, w1, w2) -> (if ((if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uCoreCodegen_uGenSt v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 12 48 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 11 48 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uCoreCodegen_uAltEnv = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uCoreCodegen_uAltEnv x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
