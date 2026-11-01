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
open Vuna_dCompiler_dDtRecords
type   t_Vuna_dCompiler_dElab_dDtDef =
    C_Vuna_dCompiler_dElab_dDtDef of (string) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dElab_dDtCtor =
    C_Vuna_dCompiler_dElab_dDtCtor of (string) * (string) * (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dElab_dDtData =
    C_Vuna_dCompiler_dElab_dDtData of (string) * (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dElab_dDtCtor) list)
and   t_Vuna_dCompiler_dElab_dDtGoal =
    C_Vuna_dCompiler_dElab_dDtGoal of (int) * (t_Vuna_dCompiler_dCommon_dSpan) * (t_Vuna_dCompiler_dCore_dValue) * (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list)
and   t_Vuna_dCompiler_dElab_dDtClass =
    C_Vuna_dCompiler_dElab_dDtClass of (string) * ((string) list) * (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dCore_dTerm) list)
and   t_Vuna_dCompiler_dElab_dDtInst =
    C_Vuna_dCompiler_dElab_dDtInst of (string) * (t_Vuna_dCompiler_dCore_dTerm)
and   t_Vuna_dCompiler_dElab_dEc =
    C_Vuna_dCompiler_dElab_dEc of (int) * (((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list) * (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dElab_dDtData) list) * (((int, int) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dElab_dDtGoal) list) * ((t_Vuna_dCompiler_dElab_dDtInst) list) * ((t_Vuna_dCompiler_dElab_dDtClass) list)
and   t_Vuna_dCompiler_dElab_dCtx =
    C_Vuna_dCompiler_dElab_dCtx of (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) * (((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list)
and   t_Vuna_dCompiler_dElab_dPending =
    C_Vuna_dCompiler_dElab_dPending of (t_Vuna_dCompiler_dAst_dPat) * (string)
and   t_Vuna_dCompiler_dElab_dBindAcc =
    C_Vuna_dCompiler_dElab_dBindAcc of (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list) * ((t_Vuna_dCompiler_dElab_dPending) list)
and   t_Vuna_dCompiler_dElab_dDtProgram =
    C_Vuna_dCompiler_dElab_dDtProgram of ((t_Vuna_dCompiler_dElab_dDtData) list) * ((t_Vuna_dCompiler_dElab_dDtDef) list) * ((t_Vuna_dCompiler_dElab_dDtGoal) list) * (((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list)
and   t_Vuna_dCompiler_dElab_dDtGoalInfo =
    C_Vuna_dCompiler_dElab_dDtGoalInfo of (t_Vuna_dCompiler_dCommon_dSpan) * (string) * (((string, string) t_Base_dPair_dPair) list)
let rec show_Vuna_dCompiler_dElab_dDtDef v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtDef (f0, f1, f2) -> show_ctor "DtDef" [(show_vstring) f0; (show_Vuna_dCompiler_dCore_dTerm) f1; (show_Vuna_dCompiler_dCore_dTerm) f2]
and show_Vuna_dCompiler_dElab_dDtCtor v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtCtor (f0, f1, f2, f3) -> show_ctor "DtCtor" [(show_vstring) f0; (show_vstring) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dRig)) x ^ " " ^ go xs ^ ")" in go v)) f2; (show_Vuna_dCompiler_dCore_dTerm) f3]
and show_Vuna_dCompiler_dElab_dDtData v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtData (f0, f1, f2) -> show_ctor "DtData" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dRig)) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtCtor) x ^ " " ^ go xs ^ ")" in go v)) f2]
and show_Vuna_dCompiler_dElab_dDtGoal v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtGoal (f0, f1, f2, f3) -> show_ctor "DtGoal" [(string_of_int) f0; (show_Vuna_dCompiler_dCommon_dSpan) f1; (show_Vuna_dCompiler_dCore_dValue) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dCompiler_dElab_dDtClass v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtClass (f0, f1, f2, f3) -> show_ctor "DtClass" [(show_vstring) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dCore_dTerm) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dCompiler_dElab_dDtInst v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtInst (f0, f1) -> show_ctor "DtInst" [(show_vstring) f0; (show_Vuna_dCompiler_dCore_dTerm) f1]
and show_Vuna_dCompiler_dElab_dEc v =
  match v with
  | C_Vuna_dCompiler_dElab_dEc (f0, f1, f2, f3, f4, f5, f6, f7) -> show_ctor "Ec" [(string_of_int) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair string_of_int show_Vuna_dCompiler_dCore_dValue)) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtData) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair string_of_int string_of_int)) x ^ " " ^ go xs ^ ")" in go v)) f4; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtGoal) x ^ " " ^ go xs ^ ")" in go v)) f5; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtInst) x ^ " " ^ go xs ^ ")" in go v)) f6; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtClass) x ^ " " ^ go xs ^ ")" in go v)) f7]
and show_Vuna_dCompiler_dElab_dCtx v =
  match v with
  | C_Vuna_dCompiler_dElab_dCtx (f0, f1) -> show_ctor "Ctx" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dTerm)) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair string_of_int show_Vuna_dCompiler_dCore_dValue)) x ^ " " ^ go xs ^ ")" in go v)) f1]
and show_Vuna_dCompiler_dElab_dPending v =
  match v with
  | C_Vuna_dCompiler_dElab_dPending (f0, f1) -> show_ctor "Pending" [(show_Vuna_dCompiler_dAst_dPat) f0; (show_vstring) f1]
and show_Vuna_dCompiler_dElab_dBindAcc v =
  match v with
  | C_Vuna_dCompiler_dElab_dBindAcc (f0, f1) -> show_ctor "BindAcc" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_Vuna_dCompiler_dCore_dRig)) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dPending) x ^ " " ^ go xs ^ ")" in go v)) f1]
and show_Vuna_dCompiler_dElab_dDtProgram v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtProgram (f0, f1, f2, f3) -> show_ctor "DtProgram" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtData) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtDef) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dElab_dDtGoal) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair string_of_int show_Vuna_dCompiler_dCore_dValue)) x ^ " " ^ go xs ^ ")" in go v)) f3]
and show_Vuna_dCompiler_dElab_dDtGoalInfo v =
  match v with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo (f0, f1, f2) -> show_ctor "DtGoalInfo" [(show_Vuna_dCompiler_dCommon_dSpan) f0; (show_vstring) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ ((show_Base_dPair_dPair show_vstring show_vstring)) x ^ " " ^ go xs ^ ")" in go v)) f2]
let v_Vuna_dCompiler_dElab_ddtDefName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtDef (name, ty, body)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 24 1 ("no matching clause for Vuna.Compiler.Elab.dtDefName")

let v_Vuna_dCompiler_dElab_ddtDefType = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtDef (name, ty, body)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 26 1 ("no matching clause for Vuna.Compiler.Elab.dtDefType")

let v_Vuna_dCompiler_dElab_ddtDefBody = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtDef (name, ty, body)) -> body
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 28 1 ("no matching clause for Vuna.Compiler.Elab.dtDefBody")

let v_Vuna_dCompiler_dElab_ddtCtorName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 35 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorName")

let v_Vuna_dCompiler_dElab_ddtCtorFamily = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> family
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 37 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorFamily")

let v_Vuna_dCompiler_dElab_ddtCtorTelescope = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> tele
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 39 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorTelescope")

let v_Vuna_dCompiler_dElab_ddtCtorType = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtCtor (name, family, tele, ty)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 41 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorType")

let v_Vuna_dCompiler_dElab_ddtDataName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtData (name, params, ctors)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 47 1 ("no matching clause for Vuna.Compiler.Elab.dtDataName")

let v_Vuna_dCompiler_dElab_ddtDataParams = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtData (name, params, ctors)) -> params
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 49 1 ("no matching clause for Vuna.Compiler.Elab.dtDataParams")

let v_Vuna_dCompiler_dElab_ddtDataCtors = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtData (name, params, ctors)) -> ctors
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 51 1 ("no matching clause for Vuna.Compiler.Elab.dtDataCtors")

let v_Vuna_dCompiler_dElab_ddtGoalMeta = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtGoal (m, sp, ty, ctx)) -> m
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 57 1 ("no matching clause for Vuna.Compiler.Elab.dtGoalMeta")

let v_Vuna_dCompiler_dElab_ddtGoalSpan = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtGoal (m, sp, ty, ctx)) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 59 1 ("no matching clause for Vuna.Compiler.Elab.dtGoalSpan")

let v_Vuna_dCompiler_dElab_ddtGoalType = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtGoal (m, sp, ty, ctx)) -> ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 61 1 ("no matching clause for Vuna.Compiler.Elab.dtGoalType")

let v_Vuna_dCompiler_dElab_ddtGoalCtx = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtGoal (m, sp, ty, ctx)) -> ctx
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 63 1 ("no matching clause for Vuna.Compiler.Elab.dtGoalCtx")

let v_Vuna_dCompiler_dElab_ddtClassName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtClass (name, params, projs, fieldTys)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 69 1 ("no matching clause for Vuna.Compiler.Elab.dtClassName")

let v_Vuna_dCompiler_dElab_ddtClassParams = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtClass (name, params, projs, fieldTys)) -> params
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 71 1 ("no matching clause for Vuna.Compiler.Elab.dtClassParams")

let v_Vuna_dCompiler_dElab_ddtClassMethods = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtClass (name, params, projs, fieldTys)) -> projs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 73 1 ("no matching clause for Vuna.Compiler.Elab.dtClassMethods")

let v_Vuna_dCompiler_dElab_ddtClassFieldTys = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtClass (name, params, projs, fieldTys)) -> fieldTys
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 75 1 ("no matching clause for Vuna.Compiler.Elab.dtClassFieldTys")

let v_Vuna_dCompiler_dElab_ddtInstName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtInst (name, head)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 81 1 ("no matching clause for Vuna.Compiler.Elab.dtInstName")

let v_Vuna_dCompiler_dElab_ddtInstHead = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtInst (name, head)) -> head
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 83 1 ("no matching clause for Vuna.Compiler.Elab.dtInstHead")

let v_Vuna_dCompiler_dElab_decNext = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> next
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 90 1 ("no matching clause for Vuna.Compiler.Elab.ecNext")

let v_Vuna_dCompiler_dElab_decSols = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> sols
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 92 1 ("no matching clause for Vuna.Compiler.Elab.ecSols")

let v_Vuna_dCompiler_dElab_decDefs = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> defs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 94 1 ("no matching clause for Vuna.Compiler.Elab.ecDefs")

let v_Vuna_dCompiler_dElab_decDatas = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> datas
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 96 1 ("no matching clause for Vuna.Compiler.Elab.ecDatas")

let v_Vuna_dCompiler_dElab_decDepthOfMeta = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> depths
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 98 1 ("no matching clause for Vuna.Compiler.Elab.ecDepthOfMeta")

let v_Vuna_dCompiler_dElab_decGoals = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> goals
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 100 1 ("no matching clause for Vuna.Compiler.Elab.ecGoals")

let v_Vuna_dCompiler_dElab_decInsts = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> insts
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 102 1 ("no matching clause for Vuna.Compiler.Elab.ecInsts")

let v_Vuna_dCompiler_dElab_decClasses = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> classes
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 104 1 ("no matching clause for Vuna.Compiler.Elab.ecClasses")

let v_Vuna_dCompiler_dElab_decAddGoal = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes), g) -> C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, v_Base_dList_dappend goals ((g) :: ([])), insts, classes)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 107 1 ("no matching clause for Vuna.Compiler.Elab.ecAddGoal")

let v_Vuna_dCompiler_dElab_decAddInst = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes), i) -> C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, v_Base_dList_dappend insts ((i) :: ([])), classes)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 111 1 ("no matching clause for Vuna.Compiler.Elab.ecAddInst")

let v_Vuna_dCompiler_dElab_decAddClass = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes), c) -> C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, v_Base_dList_dappend classes ((c) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 115 1 ("no matching clause for Vuna.Compiler.Elab.ecAddClass")

let v_Vuna_dCompiler_dElab_decEmpty = C_Vuna_dCompiler_dElab_dEc (0, [], [], [], [], [], [], [])

let v_Vuna_dCompiler_dElab_decPutSols = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes), sols2) -> C_Vuna_dCompiler_dElab_dEc (next, sols2, defs, datas, depths, goals, insts, classes)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 122 1 ("no matching clause for Vuna.Compiler.Elab.ecPutSols")

let v_Vuna_dCompiler_dElab_decAddDef = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes), d) -> C_Vuna_dCompiler_dElab_dEc (next, sols, v_Base_dList_dappend defs ((d) :: ([])), datas, depths, goals, insts, classes)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 126 1 ("no matching clause for Vuna.Compiler.Elab.ecAddDef")

let v_Vuna_dCompiler_dElab_decAddData = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes), d) -> C_Vuna_dCompiler_dElab_dEc (next, sols, defs, v_Base_dList_dappend datas ((d) :: ([])), depths, goals, insts, classes)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 130 1 ("no matching clause for Vuna.Compiler.Elab.ecAddData")

let v_Vuna_dCompiler_dElab_dctxItems = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> items
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 140 1 ("no matching clause for Vuna.Compiler.Elab.ctxItems")

let v_Vuna_dCompiler_dElab_dctxRefs = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> refs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 142 1 ("no matching clause for Vuna.Compiler.Elab.ctxRefs")

let v_Vuna_dCompiler_dElab_dctxDepth = fun ctx -> v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dctxItems ctx)

let v_Vuna_dCompiler_dElab_dctxBind = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, ty, C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> C_Vuna_dCompiler_dElab_dCtx ((C_Base_dPair_dPair (name, ty)) :: (items), refs)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 148 1 ("no matching clause for Vuna.Compiler.Elab.ctxBind")

let v_Vuna_dCompiler_dElab_dctxBindValue = fun name dom ctx -> v_Vuna_dCompiler_dElab_dctxBind name (v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx) dom) ctx

let v_Vuna_dCompiler_dElab_dctxRefine = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs), more) -> C_Vuna_dCompiler_dElab_dCtx (items, v_Base_dList_dappend refs more)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 156 1 ("no matching clause for Vuna.Compiler.Elab.ctxRefine")

let rec v_Vuna_dCompiler_dElab_dctxLookupAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, [], idx) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest), idx) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (C_Base_dPair_dPair (idx, ty)) else v_Vuna_dCompiler_dElab_dctxLookupAt name rest (bi_add idx 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 159 1 ("no matching clause for Vuna.Compiler.Elab.ctxLookupAt")

let v_Vuna_dCompiler_dElab_dctxLookup = fun name ctx -> v_Vuna_dCompiler_dElab_dctxLookupAt name (v_Vuna_dCompiler_dElab_dctxItems ctx) 0

let rec v_Vuna_dCompiler_dElab_dctxEnvAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], idx, depth) -> []
  | ((C_Base_dPair_dPair (name, ty)) :: (rest), idx, depth) -> (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, bi_sub (bi_sub depth idx) 1, []))) :: (v_Vuna_dCompiler_dElab_dctxEnvAt rest (bi_add idx 1) depth)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 168 1 ("no matching clause for Vuna.Compiler.Elab.ctxEnvAt")

let v_Vuna_dCompiler_dElab_dctxEnv = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs)) -> v_Vuna_dCompiler_dElab_dctxEnvAt items 0 (v_Base_dList_dlength items)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 173 1 ("no matching clause for Vuna.Compiler.Elab.ctxEnv")

let rec v_Vuna_dCompiler_dElab_drefineLookup = fun a0 a1 -> match (a0, a1) with
  | (lvl, []) -> C_Base_dMaybe_dNothing
  | (lvl, (C_Base_dPair_dPair (l, v)) :: (rest)) -> if v_vuna_ueq_uint l lvl then C_Base_dMaybe_dJust (v) else v_Vuna_dCompiler_dElab_drefineLookup lvl rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 198 1 ("no matching clause for Vuna.Compiler.Elab.refineLookup")

let rec v_Vuna_dCompiler_dElab_drefineValue = fun refs fuel v -> if v_vuna_ule_uint fuel 0 then v else (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, lvl, sp) -> (let sp2 = v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) sp in (match v_Vuna_dCompiler_dElab_drefineLookup lvl refs with
  | C_Base_dMaybe_dJust (r) -> v_Vuna_dCompiler_dCore_dapplySpine (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) r) sp2
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, lvl, sp2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 185 10 ("case pattern match failure")))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 181 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> C_Vuna_dCompiler_dCore_dVCon (c, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) args)
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> C_Vuna_dCompiler_dCore_dVCase (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) scrut, alts)
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> C_Vuna_dCompiler_dCore_dVIf (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) c, v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) th, v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1) el)
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> C_Vuna_dCompiler_dCore_dVMeta (m, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs (bi_sub fuel 1)) sp)
  | _ -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 180 6 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_devalCtx = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs), ty) -> v_Vuna_dCompiler_dCore_deval (v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs v_Vuna_dCompiler_dCore_ddefaultFuel) (v_Vuna_dCompiler_dElab_dctxEnvAt items 0 (v_Base_dList_dlength items))) ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 203 1 ("no matching clause for Vuna.Compiler.Elab.evalCtx")

let v_Vuna_dCompiler_dElab_dvarTypeValue = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (C_Vuna_dCompiler_dElab_dCtx (items, refs), idx, ty) -> v_Vuna_dCompiler_dCore_deval (v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue refs v_Vuna_dCompiler_dCore_ddefaultFuel) (v_Vuna_dCompiler_dElab_dctxEnvAt items 0 (v_Base_dList_dlength items))) (v_Vuna_dCompiler_dCore_dshift 0 (bi_add idx 1) ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 208 1 ("no matching clause for Vuna.Compiler.Elab.varTypeValue")

let v_Vuna_dCompiler_dElab_demptyCtx = C_Vuna_dCompiler_dElab_dCtx ([], [])

let v_Vuna_dCompiler_dElab_derrAt = fun sp msg -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (msg) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))

let v_Vuna_dCompiler_dElab_dnewMeta = fun a0 a1 -> match (a0, a1) with
  | (ctx, C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTMeta (next), C_Vuna_dCompiler_dElab_dEc (bi_add next 1, sols, defs, datas, (C_Base_dPair_dPair (next, v_Vuna_dCompiler_dElab_dctxDepth ctx)) :: (depths), goals, insts, classes))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 222 1 ("no matching clause for Vuna.Compiler.Elab.newMeta")

let v_Vuna_dCompiler_dElab_dnewHoleMeta = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (ctx, C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes), sp, ty) -> (let goal = C_Vuna_dCompiler_dElab_dDtGoal (next, sp, ty, v_Vuna_dCompiler_dElab_dctxItems ctx) in C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTMeta (next), C_Vuna_dCompiler_dElab_dEc (bi_add next 1, sols, defs, datas, (C_Base_dPair_dPair (next, v_Vuna_dCompiler_dElab_dctxDepth ctx)) :: (depths), v_Base_dList_dappend goals ((goal) :: ([])), insts, classes)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 228 1 ("no matching clause for Vuna.Compiler.Elab.newHoleMeta")

let v_Vuna_dCompiler_dElab_dforceVal = fun ec v -> v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) v_Vuna_dCompiler_dCore_ddefaultFuel v

let rec v_Vuna_dCompiler_dElab_dlevelEscapes = fun limit depth v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, lvl, sp) -> (if (v_vuna_uge_uint lvl limit) then true else (v_Vuna_dCompiler_dElab_dlevelEscapesList limit sp))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> v_Vuna_dCompiler_dElab_dlevelEscapesList limit sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 260 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, clo) -> (if (v_Vuna_dCompiler_dElab_dlevelEscapes limit depth dom) then true else (v_Vuna_dCompiler_dElab_dlevelEscapesClo limit clo))
  | C_Vuna_dCompiler_dCore_dVLam (name, rig, clo) -> v_Vuna_dCompiler_dElab_dlevelEscapesClo limit clo
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> v_Vuna_dCompiler_dElab_dlevelEscapesList limit sp
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> v_Vuna_dCompiler_dElab_dlevelEscapesList limit args
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> v_Vuna_dCompiler_dElab_dlevelEscapes limit depth scrut
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> (if ((if (v_Vuna_dCompiler_dElab_dlevelEscapes limit depth c) then true else (v_Vuna_dCompiler_dElab_dlevelEscapes limit depth th))) then true else (v_Vuna_dCompiler_dElab_dlevelEscapes limit depth el))
  | C_Vuna_dCompiler_dCore_dVType (l) -> false
  | C_Vuna_dCompiler_dCore_dVInt (n) -> false
  | C_Vuna_dCompiler_dCore_dVStr (s) -> false
  | C_Vuna_dCompiler_dCore_dVBool (b) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 259 30 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dlevelEscapesList = fun a0 a1 -> match (a0, a1) with
  | (limit, []) -> false
  | (limit, (v) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dlevelEscapes limit 0 v) then true else (v_Vuna_dCompiler_dElab_dlevelEscapesList limit rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 276 1 ("no matching clause for Vuna.Compiler.Elab.levelEscapesList")
and v_Vuna_dCompiler_dElab_dlevelEscapesClo = fun limit clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClos (env, body) -> v_Vuna_dCompiler_dElab_dlevelEscapesList limit env
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 280 29 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dcheckScopedFrom = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (ec, [], sols) -> C_Base_dResult_dOk (0)
  | (ec, (C_Base_dPair_dPair (m, created)) :: (rest), sols) -> (match v_Vuna_dCompiler_dCore_dmetaLookup m sols with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dcheckScopedFrom ec rest sols
  | C_Base_dMaybe_dJust (v) -> if v_Vuna_dCompiler_dElab_dlevelEscapes created 0 v then C_Base_dResult_dErr ((let vuna_cat0' = ("DT: cannot solve metavariable ?") in (let vuna_cat1' = (bi_str_from_int m) in (let vuna_cat2' = (" (solution would escape its scope)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else v_Vuna_dCompiler_dElab_dcheckScopedFrom ec rest sols
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 251 54 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 250 1 ("no matching clause for Vuna.Compiler.Elab.checkScopedFrom")

let v_Vuna_dCompiler_dElab_dcheckSolsScoped = fun ec sols -> v_Vuna_dCompiler_dElab_dcheckScopedFrom ec (v_Vuna_dCompiler_dElab_decDepthOfMeta ec) sols

let v_Vuna_dCompiler_dElab_dconvEc = fun ec depth expected actual -> (match v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) depth expected actual with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (sols2) -> (match v_Vuna_dCompiler_dElab_dcheckSolsScoped ec sols2 with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (_) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dElab_decPutSols ec sols2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 240 15 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 238 35 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dunsolvedFrom = fun i stop sols -> if v_vuna_uge_uint i stop then C_Base_dMaybe_dNothing else (match v_Vuna_dCompiler_dCore_dmetaLookup i sols with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dunsolvedFrom (bi_add i 1) stop sols
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dJust (i)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 286 6 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dunsolvedMeta = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dEc (next, sols, defs, datas, depths, goals, insts, classes)) -> v_Vuna_dCompiler_dElab_dunsolvedFrom 0 next sols
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 291 1 ("no matching clause for Vuna.Compiler.Elab.unsolvedMeta")

let v_Vuna_dCompiler_dElab_dmaxInt = fun a b -> if v_vuna_uge_uint a b then a else b

let rec v_Vuna_dCompiler_dElab_dglobalLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ustr name n then C_Base_dMaybe_dJust (ty) else v_Vuna_dCompiler_dElab_dglobalLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 297 1 ("no matching clause for Vuna.Compiler.Elab.globalLookup")

let rec v_Vuna_dCompiler_dElab_dmemSig = fun a0 a1 -> match (a0, a1) with
  | ([], name) -> false
  | ((C_Base_dPair_dPair (n, ty)) :: (rest), name) -> if v_vuna_ueq_ugeneric n name then true else v_Vuna_dCompiler_dElab_dmemSig rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 301 1 ("no matching clause for Vuna.Compiler.Elab.memSig")

let rec v_Vuna_dCompiler_dElab_dmemDefName = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (C_Base_dPair_dPair (n, ty)) :: (rest)) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dCompiler_dElab_dmemDefName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 305 1 ("no matching clause for Vuna.Compiler.Elab.memDefName")

let rec v_Vuna_dCompiler_dElab_dcollectSigsInto = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (allDefs, acc, []) -> C_Base_dResult_dOk (v_Base_dList_dreverse acc)
  | (allDefs, acc, (d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> if v_Base_dList_dmemName name v_Vuna_dCompiler_dDtPrelude_dpreludeNames then v_Vuna_dCompiler_dElab_derrAt sp ((("DT: cannot redefine builtin ") ^ (name))) else if v_Vuna_dCompiler_dElab_dmemSig acc name then v_Vuna_dCompiler_dElab_derrAt sp ((("DT: duplicate signature for ") ^ (name))) else v_Vuna_dCompiler_dElab_dcollectSigsInto allDefs ((C_Base_dPair_dPair (name, v_Vuna_dCompiler_dDtQuant_dquantifyTopSig allDefs ty sp)) :: (acc)) rest
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> v_Vuna_dCompiler_dElab_dcollectSigsInto allDefs acc rest
  | C_Vuna_dCompiler_dAst_dDData (name, params, kind, ctors, derivings, sp) -> v_Vuna_dCompiler_dElab_dcollectSigsInto allDefs acc rest
  | C_Vuna_dCompiler_dAst_dDRecord (name, params, fields, derivings, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: internal: record was not desugared"
  | C_Vuna_dCompiler_dAst_dDTrait (name, params, methods, sp) -> v_Vuna_dCompiler_dElab_dcollectSigsInto allDefs acc rest
  | C_Vuna_dCompiler_dAst_dDInstance (mname, isDefault, head, methods, sp) -> v_Vuna_dCompiler_dElab_dcollectSigsInto allDefs acc rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 315 43 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 314 1 ("no matching clause for Vuna.Compiler.Elab.collectSigsInto")

let v_Vuna_dCompiler_dElab_dcollectSigs = fun decls -> v_Vuna_dCompiler_dElab_dcollectSigsInto (v_Vuna_dCompiler_dDtQuant_ddefinedNames decls) [] decls

let rec v_Vuna_dCompiler_dElab_dcollectDataDecls = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> v_Base_dList_dreverse acc
  | ((d) :: (rest), acc) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, params, kind, ctors, derivings, sp) -> v_Vuna_dCompiler_dElab_dcollectDataDecls rest ((C_Base_dPair_dPair (d, sp)) :: (acc))
  | _ -> v_Vuna_dCompiler_dElab_dcollectDataDecls rest acc
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 331 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 330 1 ("no matching clause for Vuna.Compiler.Elab.collectDataDecls")

let v_Vuna_dCompiler_dElab_dnonEmpty = fun a0 -> match a0 with
  | ([]) -> false
  | ((_) :: (_)) -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 336 1 ("no matching clause for Vuna.Compiler.Elab.nonEmpty")

let rec v_Vuna_dCompiler_dElab_dkindWellFormed = fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> v_Vuna_dCompiler_dElab_dkindWellFormed cod
  | C_Vuna_dCompiler_dCore_dTType (l) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 341 21 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_ddtDataLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (d) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtDataName d) name then C_Base_dMaybe_dJust (d) else v_Vuna_dCompiler_dElab_ddtDataLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 353 1 ("no matching clause for Vuna.Compiler.Elab.dtDataLookup")

let rec v_Vuna_dCompiler_dElab_dfindCtorIn = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (c) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtCtorName c) name then C_Base_dMaybe_dJust (c) else v_Vuna_dCompiler_dElab_dfindCtorIn name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 357 1 ("no matching clause for Vuna.Compiler.Elab.findCtorIn")

let rec v_Vuna_dCompiler_dElab_ddtCtorLookup = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (d) :: (rest)) -> (match v_Vuna_dCompiler_dElab_dfindCtorIn name (v_Vuna_dCompiler_dElab_ddtDataCtors d) with
  | C_Base_dMaybe_dJust (c) -> C_Base_dMaybe_dJust (c)
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_ddtCtorLookup name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 362 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 361 1 ("no matching clause for Vuna.Compiler.Elab.dtCtorLookup")

let rec v_Vuna_dCompiler_dElab_dspineOfType = fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> (match v_Vuna_dCompiler_dElab_dspineOfType f with
  | C_Base_dPair_dPair (h, args) -> C_Base_dPair_dPair (h, v_Base_dList_dappend args ((a) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 384 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> C_Base_dPair_dPair (g, [])
  | _ -> C_Base_dPair_dPair ("", [])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 383 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dresultSpine = fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> v_Vuna_dCompiler_dElab_dresultSpine cod
  | _ -> v_Vuna_dCompiler_dElab_dspineOfType ty
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 390 18 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dprependFamParams = fun kindTerm tyExpr sp -> (match kindTerm with
  | C_Vuna_dCompiler_dCore_dTPi (n, implicit, rigB, dom, cod) -> C_Vuna_dCompiler_dAst_dEPi (n, true, C_Vuna_dCompiler_dAst_dEVar ("Type", sp), v_Vuna_dCompiler_dElab_dprependFamParams cod tyExpr sp, sp)
  | _ -> tyExpr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 415 39 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_ddropParams = fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTPi (n, implicit, rigB, dom, cod) -> v_Vuna_dCompiler_dElab_ddropParams cod
  | _ -> t
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 421 16 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dctorGlobals = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtCtorName c, v_Vuna_dCompiler_dElab_ddtCtorType c)) :: (v_Vuna_dCompiler_dElab_dctorGlobals rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 434 1 ("no matching clause for Vuna.Compiler.Elab.ctorGlobals")

let v_Vuna_dCompiler_dElab_ddictTypeName = fun cname -> (("Dict_") ^ (cname))

let v_Vuna_dCompiler_dElab_ddictCtorName = fun cname -> (("MkDict_") ^ (cname))

let rec v_Vuna_dCompiler_dElab_dcollectTraitDecls = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> v_Base_dList_dreverse acc
  | ((d) :: (rest), acc) -> (match d with
  | C_Vuna_dCompiler_dAst_dDTrait (tname, params, methods, sp) -> v_Vuna_dCompiler_dElab_dcollectTraitDecls rest ((C_Base_dPair_dPair (d, sp)) :: (acc))
  | _ -> v_Vuna_dCompiler_dElab_dcollectTraitDecls rest acc
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 489 37 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 488 1 ("no matching clause for Vuna.Compiler.Elab.collectTraitDecls")

let rec v_Vuna_dCompiler_dElab_dcollectInstDecls = fun a0 a1 -> match (a0, a1) with
  | ([], acc) -> v_Base_dList_dreverse acc
  | ((d) :: (rest), acc) -> (match d with
  | C_Vuna_dCompiler_dAst_dDInstance (mname, isDefault, head, methods, sp) -> v_Vuna_dCompiler_dElab_dcollectInstDecls rest ((C_Base_dPair_dPair (d, sp)) :: (acc))
  | _ -> v_Vuna_dCompiler_dElab_dcollectInstDecls rest acc
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 495 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 494 1 ("no matching clause for Vuna.Compiler.Elab.collectInstDecls")

let v_Vuna_dCompiler_dElab_dparamNameOf = fun a0 -> match a0 with
  | ([]) -> "_"
  | ((p) :: (rest)) -> p
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 501 1 ("no matching clause for Vuna.Compiler.Elab.paramNameOf")

let rec v_Vuna_dCompiler_dElab_dbindClassParams = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], methods, ctx) -> ctx
  | ((p) :: (rest), methods, ctx) -> v_Vuna_dCompiler_dElab_dbindClassParams rest methods (v_Vuna_dCompiler_dElab_dctxBind p (v_Vuna_dCompiler_dDtKind_dclassParamKind p methods) ctx)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 510 1 ("no matching clause for Vuna.Compiler.Elab.bindClassParams")

let rec v_Vuna_dCompiler_dElab_dfoldlAddDef = fun a0 a1 -> match (a0, a1) with
  | (ec, []) -> ec
  | (ec, (d) :: (rest)) -> v_Vuna_dCompiler_dElab_dfoldlAddDef (v_Vuna_dCompiler_dElab_decAddDef ec d) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 529 1 ("no matching clause for Vuna.Compiler.Elab.foldlAddDef")

let rec v_Vuna_dCompiler_dElab_dfoldPiFieldTys = fun a0 a1 -> match (a0, a1) with
  | ([], ty) -> ty
  | ((f) :: (rest), ty) -> C_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig1, f, v_Vuna_dCompiler_dElab_dfoldPiFieldTys rest ty)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 533 1 ("no matching clause for Vuna.Compiler.Elab.foldPiFieldTys")

let rec v_Vuna_dCompiler_dElab_dmethodArgTermsGo = fun rigs nFields i arity -> (match rigs with
  | [] -> []
  | (rig) :: (rest) -> (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTVar ((("x") ^ (bi_str_from_int i)), bi_add nFields (bi_sub (bi_sub arity 1) i)), rig)) :: (v_Vuna_dCompiler_dElab_dmethodArgTermsGo rest nFields (bi_add i 1) arity)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 608 41 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dmethodArgTerms = fun rigs nFields -> v_Vuna_dCompiler_dElab_dmethodArgTermsGo rigs nFields 0 (v_Base_dList_dlength rigs)

let rec v_Vuna_dCompiler_dElab_dmethodArgLams = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], i, body) -> body
  | ((rig) :: (rest), i, body) -> C_Vuna_dCompiler_dCore_dTLam ((("x") ^ (bi_str_from_int i)), rig, v_Vuna_dCompiler_dElab_dmethodArgLams rest (bi_add i 1) body)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 616 1 ("no matching clause for Vuna.Compiler.Elab.methodArgLams")

let v_Vuna_dCompiler_dElab_dfieldVarName = fun i -> (("f") ^ (bi_str_from_int i))

let rec v_Vuna_dCompiler_dElab_dfieldBinderGo = fun n i acc -> if v_vuna_uge_uint i n then v_Base_dList_dreverse acc else v_Vuna_dCompiler_dElab_dfieldBinderGo n (bi_add i 1) ((C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dfieldVarName i, C_Vuna_dCompiler_dCore_dRig1)) :: (acc))

let v_Vuna_dCompiler_dElab_dfieldBinderNames = fun n -> v_Vuna_dCompiler_dElab_dfieldBinderGo n 0 []

let rec v_Vuna_dCompiler_dElab_dexplicitPiArity = fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTPi (n, implicit, rig, dom, cod) -> if implicit then v_Vuna_dCompiler_dElab_dexplicitPiArity cod else bi_add 1 (v_Vuna_dCompiler_dElab_dexplicitPiArity cod)
  | _ -> 0
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 632 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dinstanceHeadName = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> C_Base_dMaybe_dJust (n)
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (n, fsp) -> C_Base_dMaybe_dJust (n)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 653 22 ("case pattern match failure"))
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 651 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dexprNameFor = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> n
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> bi_str_from_int n
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> s
  | _ -> "X"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 676 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dargSuffix = fun a0 -> match a0 with
  | ([]) -> ""
  | ((a) :: (rest)) -> (let vuna_cat0' = ("_") in (let vuna_cat1' = (v_Vuna_dCompiler_dElab_dexprNameFor a) in (let vuna_cat2' = (v_Vuna_dCompiler_dElab_dargSuffix rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 672 1 ("no matching clause for Vuna.Compiler.Elab.argSuffix")

let v_Vuna_dCompiler_dElab_dderivedInstName = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (n, fsp) -> ((n) ^ (v_Vuna_dCompiler_dElab_dargSuffix args))
  | _ -> "Inst"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 665 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> n
  | _ -> "Inst"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 664 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dinstanceName = fun mname headExpr -> v_Vuna_dCompiler_dDtPrelude_dinstanceDefName mname (v_Vuna_dCompiler_dElab_dderivedInstName headExpr) (v_Vuna_dCompiler_dElab_dderivedInstName headExpr)

let v_Vuna_dCompiler_dElab_dargNameOf = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> n
  | _ -> "Int"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 684 15 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dinstanceHeadTerm = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEApp (fn, (a) :: (rest), sp) -> C_Vuna_dCompiler_dCore_dTGlobal (v_Vuna_dCompiler_dElab_dargNameOf a)
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> C_Vuna_dCompiler_dCore_dTGlobal (n)
  | _ -> C_Vuna_dCompiler_dCore_dTGlobal ("Int")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 712 22 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dfindClass = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (c) :: (rest)) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dElab_ddtClassName c) name then C_Base_dMaybe_dJust (c) else v_Vuna_dCompiler_dElab_dfindClass name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 722 1 ("no matching clause for Vuna.Compiler.Elab.findClass")

let rec v_Vuna_dCompiler_dElab_dsubstVarAt = fun idx arg t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (n, i) -> if v_vuna_ueq_uint i idx then arg else t
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> t
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> t
  | C_Vuna_dCompiler_dCore_dTType (l) -> t
  | C_Vuna_dCompiler_dCore_dTPi (n, implicit, rig, dom, cod) -> C_Vuna_dCompiler_dCore_dTPi (n, implicit, rig, v_Vuna_dCompiler_dElab_dsubstVarAt idx arg dom, v_Vuna_dCompiler_dElab_dsubstVarAt (bi_add idx 1) arg cod)
  | C_Vuna_dCompiler_dCore_dTLam (n, erased, body) -> C_Vuna_dCompiler_dCore_dTLam (n, erased, v_Vuna_dCompiler_dElab_dsubstVarAt (bi_add idx 1) arg body)
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> C_Vuna_dCompiler_dCore_dTApp (v_Vuna_dCompiler_dElab_dsubstVarAt idx arg f, v_Vuna_dCompiler_dElab_dsubstVarAt idx arg a, erased)
  | C_Vuna_dCompiler_dCore_dTCon (c, cargs) -> C_Vuna_dCompiler_dCore_dTCon (c, v_Base_dList_dmap (fun p -> C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dsubstVarAt idx arg (v_Base_dPair_dfirstOf p), v_Base_dPair_dsecondOf p)) cargs)
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> C_Vuna_dCompiler_dCore_dTCase (v_Vuna_dCompiler_dElab_dsubstVarAt idx arg scrut, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dsubstAltAt idx arg) alts)
  | C_Vuna_dCompiler_dCore_dTInt (n) -> t
  | C_Vuna_dCompiler_dCore_dTStr (s) -> t
  | C_Vuna_dCompiler_dCore_dTBool (b) -> t
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> C_Vuna_dCompiler_dCore_dTIf (v_Vuna_dCompiler_dElab_dsubstVarAt idx arg c, v_Vuna_dCompiler_dElab_dsubstVarAt idx arg th, v_Vuna_dCompiler_dElab_dsubstVarAt idx arg el)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 756 24 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dsubstAltAt = fun idx arg alt -> C_Vuna_dCompiler_dCore_dCaseAlt (v_Vuna_dCompiler_dCore_dcaseAltName alt, v_Vuna_dCompiler_dCore_dcaseAltBinders alt, v_Vuna_dCompiler_dElab_dsubstVarAt (bi_add idx (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders alt))) arg (v_Vuna_dCompiler_dCore_dcaseAltBody alt))

let v_Vuna_dCompiler_dElab_dsubstClassParam = fun pname arg ty -> v_Vuna_dCompiler_dElab_dsubstVarAt 0 arg ty

let rec v_Vuna_dCompiler_dElab_dmethodClauses = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> (C_Base_dPair_dPair (name, C_Base_dPair_dPair (pats, C_Base_dPair_dPair (body, sp)))) :: (v_Vuna_dCompiler_dElab_dmethodClauses rest)
  | _ -> v_Vuna_dCompiler_dElab_dmethodClauses rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 785 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 784 1 ("no matching clause for Vuna.Compiler.Elab.methodClauses")

let rec v_Vuna_dCompiler_dElab_dpickAt = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> C_Base_dMaybe_dNothing
  | (n, (x) :: (rest)) -> if v_vuna_ule_uint n 0 then C_Base_dMaybe_dJust (x) else v_Vuna_dCompiler_dElab_dpickAt (bi_sub n 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 790 1 ("no matching clause for Vuna.Compiler.Elab.pickAt")

let v_Vuna_dCompiler_dElab_dfindMethodAt = fun n decls -> (match v_Vuna_dCompiler_dElab_dmethodClauses decls with
  | [] -> C_Base_dMaybe_dNothing
  | _ -> v_Vuna_dCompiler_dElab_dpickAt n (v_Vuna_dCompiler_dElab_dmethodClauses decls)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 779 24 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dfindMethodClause = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (C_Base_dPair_dPair (pats, C_Base_dPair_dPair (body, sp))) else v_Vuna_dCompiler_dElab_dfindMethodClause name rest
  | _ -> v_Vuna_dCompiler_dElab_dfindMethodClause name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 795 37 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 794 1 ("no matching clause for Vuna.Compiler.Elab.findMethodClause")

let v_Vuna_dCompiler_dElab_dunifyErr = C_Base_dResult_dErr ("DT: this branch is impossible (index constraints are unsatisfiable)")

let rec v_Vuna_dCompiler_dElab_doccursLevel = fun lvl v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, l, sp) -> (if (v_vuna_ueq_uint l lvl) then true else (v_Vuna_dCompiler_dElab_doccursLevelList lvl sp))
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 848 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, clo) -> (if (v_Vuna_dCompiler_dElab_doccursLevel lvl dom) then true else (v_Vuna_dCompiler_dElab_doccursLevelClo lvl clo))
  | C_Vuna_dCompiler_dCore_dVLam (name, rig, clo) -> v_Vuna_dCompiler_dElab_doccursLevelClo lvl clo
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl sp
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl args
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> v_Vuna_dCompiler_dElab_doccursLevel lvl scrut
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> (if ((if (v_Vuna_dCompiler_dElab_doccursLevel lvl c) then true else (v_Vuna_dCompiler_dElab_doccursLevel lvl th))) then true else (v_Vuna_dCompiler_dElab_doccursLevel lvl el))
  | C_Vuna_dCompiler_dCore_dVType (l) -> false
  | C_Vuna_dCompiler_dCore_dVInt (n) -> false
  | C_Vuna_dCompiler_dCore_dVStr (s) -> false
  | C_Vuna_dCompiler_dCore_dVBool (b) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 847 21 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_doccursLevelList = fun a0 a1 -> match (a0, a1) with
  | (lvl, []) -> false
  | (lvl, (v) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_doccursLevel lvl v) then true else (v_Vuna_dCompiler_dElab_doccursLevelList lvl rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 863 1 ("no matching clause for Vuna.Compiler.Elab.occursLevelList")
and v_Vuna_dCompiler_dElab_doccursLevelClo = fun lvl clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClos (env, body) -> v_Vuna_dCompiler_dElab_doccursLevelList lvl env
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 867 26 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dunifyIdxConv = fun ec acc depth a b -> (match v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) depth a b with
  | C_Base_dResult_dOk (sols2) -> C_Base_dResult_dOk (acc)
  | C_Base_dResult_dErr (e) -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 897 33 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dunifyIdxList = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (ec, acc, depth, fuel, [], []) -> C_Base_dResult_dOk (acc)
  | (ec, acc, depth, fuel, (x) :: (xs), (y) :: (ys)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dunifyIdx ec acc depth (bi_sub fuel 1) x y) (fun acc2 -> v_Vuna_dCompiler_dElab_dunifyIdxList ec acc2 depth (bi_sub fuel 1) xs ys)
  | (ec, acc, depth, fuel, _, _) -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 822 1 ("no matching clause for Vuna.Compiler.Elab.unifyIdxList")
and v_Vuna_dCompiler_dElab_dunifyIdx = fun ec acc depth fuel a b -> if v_vuna_ule_uint fuel 0 then C_Base_dResult_dErr ("DT: index unification ran out of reduction fuel") else (let a2 = v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_drefineValue acc v_Vuna_dCompiler_dCore_ddefaultFuel a) in let b2 = v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec) (v_Vuna_dCompiler_dElab_decSols ec) v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_drefineValue acc v_Vuna_dCompiler_dCore_ddefaultFuel b) in (match a2 with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (an, al, [])) -> (match b2 with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (bn, bl, [])) -> if v_vuna_ueq_uint al bl then C_Base_dResult_dOk (acc) else if v_vuna_ult_uint al bl then if v_Vuna_dCompiler_dElab_doccursLevel bl a2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (bl, a2)) :: (acc)) else if v_Vuna_dCompiler_dElab_doccursLevel al b2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (al, b2)) :: (acc))
  | _ -> if v_Vuna_dCompiler_dElab_doccursLevel al b2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (al, b2)) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 835 33 ("case pattern match failure"))
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (bn, bl, [])) -> if v_Vuna_dCompiler_dElab_doccursLevel bl a2 then v_Vuna_dCompiler_dElab_dunifyErr else C_Base_dResult_dOk ((C_Base_dPair_dPair (bl, a2)) :: (acc))
  | _ -> v_Vuna_dCompiler_dElab_dunifyIdxRigid ec acc depth a2 b2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 841 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 834 6 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dunifyIdxRigid = fun ec acc depth a b -> (match a with
  | C_Vuna_dCompiler_dCore_dVCon (c, xs) -> (match b with
  | C_Vuna_dCompiler_dCore_dVCon (c2, ys) -> if v_vuna_ueq_ustr c c2 then v_Vuna_dCompiler_dElab_dunifyIdxList ec acc depth v_Vuna_dCompiler_dCore_ddefaultFuel xs ys else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 873 16 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, sp)) -> (match b with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g2, sp2)) -> if v_vuna_ueq_ustr g g2 then v_Vuna_dCompiler_dElab_dunifyIdxList ec acc depth v_Vuna_dCompiler_dCore_ddefaultFuel sp sp2 else v_Vuna_dCompiler_dElab_dunifyIdxConv ec acc depth a b
  | _ -> v_Vuna_dCompiler_dElab_dunifyIdxConv ec acc depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 876 30 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVType (i) -> (match b with
  | C_Vuna_dCompiler_dCore_dVType (j) -> if v_Vuna_dCompiler_dCore_dlevelEq i j then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 881 14 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVInt (n) -> (match b with
  | C_Vuna_dCompiler_dCore_dVInt (m) -> if v_vuna_ueq_uint n m then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 884 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVStr (s) -> (match b with
  | C_Vuna_dCompiler_dCore_dVStr (s2) -> if v_vuna_ueq_ustr s s2 then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 887 13 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVBool (x) -> (match b with
  | C_Vuna_dCompiler_dCore_dVBool (y) -> if v_vuna_ueq_ubool x y then C_Base_dResult_dOk (acc) else v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> v_Vuna_dCompiler_dElab_dunifyErr
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 890 14 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dunifyIdxConv ec acc depth a b
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 872 34 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dfreshTeleVals = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], base, i) -> []
  | ((C_Base_dPair_dPair (name, erased)) :: (rest), base, i) -> (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, bi_add base i, []))) :: (v_Vuna_dCompiler_dElab_dfreshTeleVals rest base (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 903 1 ("no matching clause for Vuna.Compiler.Elab.freshTeleVals")

let v_Vuna_dCompiler_dElab_dctorResultTerms = fun c -> (match v_Vuna_dCompiler_dElab_dresultSpine (v_Vuna_dCompiler_dElab_ddtCtorType c) with
  | C_Base_dPair_dPair (head, args) -> args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 921 21 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dctorResultVals = fun c base -> (let tele = v_Vuna_dCompiler_dElab_ddtCtorTelescope c in let env = v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dfreshTeleVals tele base 0) in v_Base_dList_dmap (fun t -> v_Vuna_dCompiler_dCore_deval env t) (v_Vuna_dCompiler_dElab_dctorResultTerms c))

let v_Vuna_dCompiler_dElab_dctorResultValsIn = fun ctx c -> v_Base_dList_dmap (fun t -> v_Vuna_dCompiler_dElab_devalCtx ctx t) (v_Vuna_dCompiler_dElab_dctorResultTerms c)

let v_Vuna_dCompiler_dElab_dpendingPat = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dPending (p, n)) -> p
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 938 1 ("no matching clause for Vuna.Compiler.Elab.pendingPat")

let v_Vuna_dCompiler_dElab_dpendingName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dPending (p, n)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 940 1 ("no matching clause for Vuna.Compiler.Elab.pendingName")

let v_Vuna_dCompiler_dElab_dbaBinders = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dBindAcc (bs, ps)) -> bs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 946 1 ("no matching clause for Vuna.Compiler.Elab.baBinders")

let v_Vuna_dCompiler_dElab_dbaPending = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dBindAcc (bs, ps)) -> ps
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 948 1 ("no matching clause for Vuna.Compiler.Elab.baPending")

let v_Vuna_dCompiler_dElab_dfreshPatName = fun i -> (("_np") ^ (bi_str_from_int i))

let rec v_Vuna_dCompiler_dElab_dfoldPending = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((p) :: (rest), body) -> (let ps = v_Vuna_dCompiler_dAst_dpatSpan (v_Vuna_dCompiler_dElab_dpendingPat p) in C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar (v_Vuna_dCompiler_dElab_dpendingName p, ps), (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dpendingPat p, v_Vuna_dCompiler_dElab_dfoldPending rest body)) :: ([]), ps))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 990 1 ("no matching clause for Vuna.Compiler.Elab.foldPending")

let rec v_Vuna_dCompiler_dElab_daltNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((alt) :: (rest)) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> (cname) :: (v_Vuna_dCompiler_dElab_daltNames rest)
  | _ -> v_Vuna_dCompiler_dElab_daltNames rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1037 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1036 26 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1035 1 ("no matching clause for Vuna.Compiler.Elab.altNames")

let rec v_Vuna_dCompiler_dElab_dhasCatchAll = fun a0 -> match a0 with
  | ([]) -> false
  | ((alt) :: (rest)) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> v_Vuna_dCompiler_dElab_dhasCatchAll rest
  | _ -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1044 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1043 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1042 1 ("no matching clause for Vuna.Compiler.Elab.hasCatchAll")

let rec v_Vuna_dCompiler_dElab_dhasDupNames = fun a0 -> match a0 with
  | ([]) -> false
  | ((x) :: (rest)) -> (if (v_Base_dList_dmemName x rest) then true else (v_Vuna_dCompiler_dElab_dhasDupNames rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1049 1 ("no matching clause for Vuna.Compiler.Elab.hasDupNames")

let rec v_Vuna_dCompiler_dElab_dcheckCovered = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (ec, depth, dd, idxs, alts, sp, []) -> C_Base_dResult_dOk (0)
  | (ec, depth, dd, idxs, alts, sp, (ctor) :: (rest)) -> (let written = v_Vuna_dCompiler_dElab_daltNames alts in let reachable = (match v_Vuna_dCompiler_dElab_dunifyIdxList ec [] depth v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_dctorResultVals ctor depth) idxs with
  | C_Base_dResult_dOk (refs) -> true
  | C_Base_dResult_dErr (e) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1061 17 ("case pattern match failure")) in if reachable then if v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtCtorName ctor) written then v_Vuna_dCompiler_dElab_dcheckCovered ec depth dd idxs alts sp rest else C_Base_dResult_dErr ((("DT: case is not exhaustive: missing ") ^ (v_Vuna_dCompiler_dElab_ddtCtorName ctor))) else v_Vuna_dCompiler_dElab_dcheckCovered ec depth dd idxs alts sp rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1057 1 ("no matching clause for Vuna.Compiler.Elab.checkCovered")

let v_Vuna_dCompiler_dElab_dcheckCoverage = fun ec depth dd idxs alts sp -> v_Vuna_dCompiler_dElab_dcheckCovered ec depth dd idxs alts sp (v_Vuna_dCompiler_dElab_ddtDataCtors dd)

let v_Vuna_dCompiler_dElab_dcheckCaseDone = fun ec ctx dd idxs alts expected sp scrutTerm altTerms -> if v_Vuna_dCompiler_dElab_dhasCatchAll alts then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms), ec)) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckCoverage ec (v_Vuna_dCompiler_dElab_dctxDepth ctx) dd idxs alts sp) (fun _u -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms), ec)))

let rec v_Vuna_dCompiler_dElab_dhasFunClause = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then true else v_Vuna_dCompiler_dElab_dhasFunClause name rest
  | _ -> v_Vuna_dCompiler_dElab_dhasFunClause name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1211 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1210 1 ("no matching clause for Vuna.Compiler.Elab.hasFunClause")

let rec v_Vuna_dCompiler_dElab_dcheckAllDefined = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, decls) -> C_Base_dResult_dOk ([])
  | ((C_Base_dPair_dPair (name, tyExpr)) :: (rest), globals, decls) -> if v_Vuna_dCompiler_dElab_dhasFunClause name decls then (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = ("DT: signature for ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no definition") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (ty) -> v_Vuna_dCompiler_dElab_dcheckAllDefined rest globals decls
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1204 94 ("case pattern match failure")) else C_Base_dResult_dErr ((let vuna_cat0' = ("DT: signature for ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no definition") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1203 1 ("no matching clause for Vuna.Compiler.Elab.checkAllDefined")

let v_Vuna_dCompiler_dElab_ddtProgDatas = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtProgram (datas, defs, goals, sols)) -> datas
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1219 1 ("no matching clause for Vuna.Compiler.Elab.dtProgDatas")

let v_Vuna_dCompiler_dElab_ddtProgDefs = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtProgram (datas, defs, goals, sols)) -> defs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1221 1 ("no matching clause for Vuna.Compiler.Elab.dtProgDefs")

let v_Vuna_dCompiler_dElab_ddtProgGoals = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtProgram (datas, defs, goals, sols)) -> goals
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1223 1 ("no matching clause for Vuna.Compiler.Elab.dtProgGoals")

let v_Vuna_dCompiler_dElab_ddtProgSols = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtProgram (datas, defs, goals, sols)) -> sols
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1225 1 ("no matching clause for Vuna.Compiler.Elab.dtProgSols")

let rec v_Vuna_dCompiler_dElab_dfoldlAddInst = fun a0 a1 -> match (a0, a1) with
  | (ec, []) -> ec
  | (ec, (i) :: (rest)) -> v_Vuna_dCompiler_dElab_dfoldlAddInst (v_Vuna_dCompiler_dElab_decAddInst ec i) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1264 1 ("no matching clause for Vuna.Compiler.Elab.foldlAddInst")

let v_Vuna_dCompiler_dElab_ddefBodyOf = fun defs name -> (match v_Vuna_dCompiler_dCore_ddefLookup name defs with
  | C_Base_dMaybe_dJust (body) -> body
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dTInt (0)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1310 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_ddefTypeOrDefault = fun globals name -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dJust (ty) -> ty
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dTGlobal ("Int")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1349 33 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dinstanceDefsOf = fun ecBefore ecAfter gs -> v_Base_dList_dmap (fun g -> C_Vuna_dCompiler_dElab_dDtDef (v_Base_dPair_dfirstOf g, v_Vuna_dCompiler_dElab_ddefTypeOrDefault gs (v_Base_dPair_dfirstOf g), v_Vuna_dCompiler_dElab_ddefBodyOf (v_Vuna_dCompiler_dElab_decDefs ecAfter) (v_Base_dPair_dfirstOf g))) gs

let rec v_Vuna_dCompiler_dElab_dextraDefsGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (globals, sourceNames, [], acc) -> v_Base_dList_dreverse acc
  | (globals, sourceNames, (d) :: (rest), acc) -> if v_Base_dList_dmemName (v_Base_dPair_dfirstOf d) sourceNames then v_Vuna_dCompiler_dElab_dextraDefsGo globals sourceNames rest acc else v_Vuna_dCompiler_dElab_dextraDefsGo globals sourceNames rest ((C_Vuna_dCompiler_dElab_dDtDef (v_Base_dPair_dfirstOf d, v_Vuna_dCompiler_dElab_ddefTypeOrDefault globals (v_Base_dPair_dfirstOf d), v_Base_dPair_dsecondOf d)) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1342 1 ("no matching clause for Vuna.Compiler.Elab.extraDefsGo")

let v_Vuna_dCompiler_dElab_dextraDefsOf = fun globals ec sourceDefs -> v_Vuna_dCompiler_dElab_dextraDefsGo globals (v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDefName sourceDefs) (v_Vuna_dCompiler_dElab_decDefs ec) []

let rec v_Vuna_dCompiler_dElab_dctorFieldGo = fun arity t acc -> (match t with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> if v_vuna_ugt_uint arity 0 then v_Vuna_dCompiler_dElab_dctorFieldGo (bi_sub arity 1) cod acc else v_Vuna_dCompiler_dElab_dctorFieldGo 0 cod ((dom) :: (acc))
  | _ -> v_Base_dList_dreverse acc
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1388 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dctorFieldTerms = fun arity ty -> v_Vuna_dCompiler_dElab_dctorFieldGo arity ty []

let rec v_Vuna_dCompiler_dElab_dtermUsesVar = fun depth t -> (match t with
  | C_Vuna_dCompiler_dCore_dTVar (n, i) -> v_vuna_ueq_uint i depth
  | C_Vuna_dCompiler_dCore_dTMeta (m) -> false
  | C_Vuna_dCompiler_dCore_dTGlobal (g) -> false
  | C_Vuna_dCompiler_dCore_dTType (l) -> false
  | C_Vuna_dCompiler_dCore_dTPi (n, implicit, rig, dom, cod) -> (if (v_Vuna_dCompiler_dElab_dtermUsesVar depth dom) then true else (v_Vuna_dCompiler_dElab_dtermUsesVar (bi_add depth 1) cod))
  | C_Vuna_dCompiler_dCore_dTLam (n, erased, body) -> v_Vuna_dCompiler_dElab_dtermUsesVar (bi_add depth 1) body
  | C_Vuna_dCompiler_dCore_dTApp (f, a, erased) -> (if (v_Vuna_dCompiler_dElab_dtermUsesVar depth f) then true else (v_Vuna_dCompiler_dElab_dtermUsesVar depth a))
  | C_Vuna_dCompiler_dCore_dTCon (c, args) -> v_Vuna_dCompiler_dElab_dtermUsesVarArgs depth args
  | C_Vuna_dCompiler_dCore_dTCase (scrut, alts) -> (if (v_Vuna_dCompiler_dElab_dtermUsesVar depth scrut) then true else (v_Vuna_dCompiler_dElab_dtermUsesVarAlts depth alts))
  | C_Vuna_dCompiler_dCore_dTInt (n) -> false
  | C_Vuna_dCompiler_dCore_dTStr (s) -> false
  | C_Vuna_dCompiler_dCore_dTBool (b) -> false
  | C_Vuna_dCompiler_dCore_dTIf (c, th, el) -> (if ((if (v_Vuna_dCompiler_dElab_dtermUsesVar depth c) then true else (v_Vuna_dCompiler_dElab_dtermUsesVar depth th))) then true else (v_Vuna_dCompiler_dElab_dtermUsesVar depth el))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1401 23 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dtermUsesVarArgs = fun a0 a1 -> match (a0, a1) with
  | (depth, []) -> false
  | (depth, (C_Base_dPair_dPair (a, erased)) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dtermUsesVar depth a) then true else (v_Vuna_dCompiler_dElab_dtermUsesVarArgs depth rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1417 1 ("no matching clause for Vuna.Compiler.Elab.termUsesVarArgs")
and v_Vuna_dCompiler_dElab_dtermUsesVarAlts = fun a0 a1 -> match (a0, a1) with
  | (depth, []) -> false
  | (depth, (alt) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dtermUsesVar (bi_add depth (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders alt))) (v_Vuna_dCompiler_dCore_dcaseAltBody alt)) then true else (v_Vuna_dCompiler_dElab_dtermUsesVarAlts depth rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1421 1 ("no matching clause for Vuna.Compiler.Elab.termUsesVarAlts")

let rec v_Vuna_dCompiler_dElab_dusedInTeleGo = fun a0 a1 -> match (a0, a1) with
  | (depth, []) -> false
  | (depth, (t) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dtermUsesVar depth t) then true else (v_Vuna_dCompiler_dElab_dusedInTeleGo depth rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1397 1 ("no matching clause for Vuna.Compiler.Elab.usedInTeleGo")

let v_Vuna_dCompiler_dElab_dusedInTele = fun i arity k ts -> v_Vuna_dCompiler_dElab_dusedInTeleGo (bi_add k arity) ts

let v_Vuna_dCompiler_dElab_dusedInCtor = fun i arity c -> v_Vuna_dCompiler_dElab_dusedInTele i arity 0 (v_Vuna_dCompiler_dElab_dctorFieldTerms arity (v_Vuna_dCompiler_dElab_ddtCtorType c))

let rec v_Vuna_dCompiler_dElab_dusedInCtors = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (i, arity, []) -> false
  | (i, arity, (c) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dusedInCtor i arity c) then true else (v_Vuna_dCompiler_dElab_dusedInCtors i arity rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1377 1 ("no matching clause for Vuna.Compiler.Elab.usedInCtors")

let v_Vuna_dCompiler_dElab_dparamUsedInFieldTys = fun dd i -> v_Vuna_dCompiler_dElab_dusedInCtors i (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtDataParams dd)) (v_Vuna_dCompiler_dElab_ddtDataCtors dd)

let rec v_Vuna_dCompiler_dElab_deraseMaskGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (dd, [], i, acc) -> v_Base_dList_dreverse acc
  | (dd, (p) :: (rest), i, acc) -> v_Vuna_dCompiler_dElab_deraseMaskGo dd rest (bi_add i 1) ((v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dparamUsedInFieldTys dd i)) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1369 1 ("no matching clause for Vuna.Compiler.Elab.eraseMaskGo")

let v_Vuna_dCompiler_dElab_deraseIndexMask = fun dd -> v_Vuna_dCompiler_dElab_deraseMaskGo dd (v_Vuna_dCompiler_dElab_ddtDataParams dd) 0 []

let rec v_Vuna_dCompiler_dElab_dcandidateNames = fun a0 a1 -> match (a0, a1) with
  | ([], ms) -> []
  | ((p) :: (rest), []) -> []
  | ((p) :: (rest), (m) :: (ms)) -> (match p with
  | C_Base_dPair_dPair (n, e) -> if m then (n) :: (v_Vuna_dCompiler_dElab_dcandidateNames rest ms) else v_Vuna_dCompiler_dElab_dcandidateNames rest ms
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1436 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1434 1 ("no matching clause for Vuna.Compiler.Elab.candidateNames")

let v_Vuna_dCompiler_dElab_dcandidateOf = fun d -> C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtDataName d, v_Vuna_dCompiler_dElab_dcandidateNames (v_Vuna_dCompiler_dElab_ddtDataParams d) (v_Vuna_dCompiler_dElab_deraseIndexMask d))

let rec v_Vuna_dCompiler_dElab_dindexErasureCandidates = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (v_Vuna_dCompiler_dElab_dcandidateOf d) :: (v_Vuna_dCompiler_dElab_dindexErasureCandidates rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1427 1 ("no matching clause for Vuna.Compiler.Elab.indexErasureCandidates")

let rec v_Vuna_dCompiler_dElab_dfunDefsOf = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> (C_Base_dPair_dPair (name, C_Base_dPair_dPair (pats, body))) :: (v_Vuna_dCompiler_dElab_dfunDefsOf rest)
  | _ -> v_Vuna_dCompiler_dElab_dfunDefsOf rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1458 25 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1457 1 ("no matching clause for Vuna.Compiler.Elab.funDefsOf")

let rec v_Vuna_dCompiler_dElab_dfunMentions = fun name e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> v_vuna_ueq_ustr n name
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> false
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> false
  | C_Vuna_dCompiler_dAst_dELam (ns, b, sp) -> v_Vuna_dCompiler_dElab_dfunMentions name b
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> (if (v_Vuna_dCompiler_dElab_dfunMentions name fn) then true else (v_Vuna_dCompiler_dElab_dfunMentionsList name args))
  | C_Vuna_dCompiler_dAst_dEPi (n, implicit, dom, cod, sp) -> (if (v_Vuna_dCompiler_dElab_dfunMentions name dom) then true else (v_Vuna_dCompiler_dElab_dfunMentions name cod))
  | C_Vuna_dCompiler_dAst_dELet (binds, b, rec_u, sp) -> v_Vuna_dCompiler_dElab_dfunMentions name b
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> (if (v_Vuna_dCompiler_dElab_dfunMentions name scrut) then true else (v_Vuna_dCompiler_dElab_dfunMentionsAlts name alts))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, el, sp) -> (if ((if (v_Vuna_dCompiler_dElab_dfunMentions name c) then true else (v_Vuna_dCompiler_dElab_dfunMentions name t))) then true else (v_Vuna_dCompiler_dElab_dfunMentions name el))
  | C_Vuna_dCompiler_dAst_dEField (base, f, sp) -> v_Vuna_dCompiler_dElab_dfunMentions name base
  | C_Vuna_dCompiler_dAst_dERecord (rn, fields, sp) -> v_Vuna_dCompiler_dElab_dfunMentionsFields name fields
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dCompiler_dElab_dfunMentions name base
  | C_Vuna_dCompiler_dAst_dEInstSel (meth, iname, sp) -> v_Vuna_dCompiler_dElab_dfunMentions name meth
  | C_Vuna_dCompiler_dAst_dEDo (stmts, sp) -> v_Vuna_dCompiler_dElab_dfunMentionsStmts name stmts
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1471 22 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dfunMentionsList = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (e) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dfunMentions name e) then true else (v_Vuna_dCompiler_dElab_dfunMentionsList name rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1488 1 ("no matching clause for Vuna.Compiler.Elab.funMentionsList")
and v_Vuna_dCompiler_dElab_dfunMentionsAlts = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (a) :: (rest)) -> (match a with
  | C_Base_dPair_dPair (p, b) -> (if (v_Vuna_dCompiler_dElab_dfunMentions name b) then true else (v_Vuna_dCompiler_dElab_dfunMentionsAlts name rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1493 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1492 1 ("no matching clause for Vuna.Compiler.Elab.funMentionsAlts")
and v_Vuna_dCompiler_dElab_dfunMentionsFields = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (f) :: (rest)) -> (match f with
  | C_Base_dPair_dPair (fn, fe) -> (if (v_Vuna_dCompiler_dElab_dfunMentions name fe) then true else (v_Vuna_dCompiler_dElab_dfunMentionsFields name rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1498 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1497 1 ("no matching clause for Vuna.Compiler.Elab.funMentionsFields")
and v_Vuna_dCompiler_dElab_dfunMentionsStmts = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> false
  | (name, (s) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dfunMentions name (v_Vuna_dCompiler_dAst_ddoStmtExpr s)) then true else (v_Vuna_dCompiler_dElab_dfunMentionsStmts name rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1502 1 ("no matching clause for Vuna.Compiler.Elab.funMentionsStmts")

let rec v_Vuna_dCompiler_dElab_dpatNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((p) :: (rest)) -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (n, sp) -> (n) :: (v_Vuna_dCompiler_dElab_dpatNames rest)
  | C_Vuna_dCompiler_dAst_dPWild (sp) -> ("_") :: (v_Vuna_dCompiler_dElab_dpatNames rest)
  | _ -> ("_") :: (v_Vuna_dCompiler_dElab_dpatNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1511 24 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1510 1 ("no matching clause for Vuna.Compiler.Elab.patNames")

let rec v_Vuna_dCompiler_dElab_dinitialSizesGo = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> []
  | ((n) :: (rest), i) -> (C_Base_dPair_dPair (n, C_Base_dPair_dPair (i, 0))) :: (v_Vuna_dCompiler_dElab_dinitialSizesGo rest (bi_add i 1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1520 1 ("no matching clause for Vuna.Compiler.Elab.initialSizesGo")

let v_Vuna_dCompiler_dElab_dinitialSizes = fun names -> v_Vuna_dCompiler_dElab_dinitialSizesGo names 0

let rec v_Vuna_dCompiler_dElab_drangeIntGo = fun n i -> if v_vuna_uge_uint i n then [] else (i) :: (v_Vuna_dCompiler_dElab_drangeIntGo n (bi_add i 1))

let v_Vuna_dCompiler_dElab_drangeInt = fun n -> v_Vuna_dCompiler_dElab_drangeIntGo n 0

let v_Vuna_dCompiler_dElab_dcallIndexes = fun fname fn args -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> if v_vuna_ueq_ustr n fname then C_Base_dMaybe_dJust (v_Vuna_dCompiler_dElab_drangeInt (v_Base_dList_dlength args)) else C_Base_dMaybe_dNothing
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1555 29 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dnthExpr = fun a0 a1 -> match (a0, a1) with
  | ([], i) -> C_Base_dMaybe_dNothing
  | ((e) :: (rest), i) -> if v_vuna_ule_uint i 0 then C_Base_dMaybe_dJust (e) else v_Vuna_dCompiler_dElab_dnthExpr rest (bi_sub i 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1581 1 ("no matching clause for Vuna.Compiler.Elab.nthExpr")

let rec v_Vuna_dCompiler_dElab_dsubSizeGo = fun a0 a1 -> match (a0, a1) with
  | (base, []) -> []
  | (base, (p) :: (rest)) -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (n, sp) -> (match base with
  | C_Base_dPair_dPair (b, d) -> (C_Base_dPair_dPair (n, C_Base_dPair_dPair (b, bi_add d 1))) :: (v_Vuna_dCompiler_dElab_dsubSizeGo base rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1600 16 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dsubSizeGo base rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1599 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1598 1 ("no matching clause for Vuna.Compiler.Elab.subSizeGo")

let v_Vuna_dCompiler_dElab_dsubSizeEntries = fun base subpats -> v_Vuna_dCompiler_dElab_dsubSizeGo base subpats

let rec v_Vuna_dCompiler_dElab_dsizeOfVar = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Base_dMaybe_dNothing
  | (name, (s) :: (rest)) -> (match s with
  | C_Base_dPair_dPair (n, sz) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (sz) else v_Vuna_dCompiler_dElab_dsizeOfVar name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1606 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1605 1 ("no matching clause for Vuna.Compiler.Elab.sizeOfVar")

let v_Vuna_dCompiler_dElab_dargDescendsAt = fun i a sizes -> (match a with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> (match v_Vuna_dCompiler_dElab_dsizeOfVar n sizes with
  | C_Base_dMaybe_dJust (sz) -> (match sz with
  | C_Base_dPair_dPair (base, depth) -> (if (v_vuna_ueq_uint base i) then (v_vuna_ugt_uint depth 0) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1575 16 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1574 16 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1573 27 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_danyDescends = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], args, sizes) -> false
  | ((i) :: (rest), args, sizes) -> (match v_Vuna_dCompiler_dElab_dnthExpr args i with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_danyDescends rest args sizes
  | C_Base_dMaybe_dJust (a) -> if v_Vuna_dCompiler_dElab_dargDescendsAt i a sizes then true else v_Vuna_dCompiler_dElab_danyDescends rest args sizes
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1568 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1567 1 ("no matching clause for Vuna.Compiler.Elab.anyDescends")

let v_Vuna_dCompiler_dElab_dextendSizes = fun sizes scrut pat -> (match scrut with
  | C_Vuna_dCompiler_dAst_dEVar (vname, vsp) -> (match v_Vuna_dCompiler_dElab_dsizeOfVar vname sizes with
  | C_Base_dMaybe_dNothing -> sizes
  | C_Base_dMaybe_dJust (base) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, subpats, psp) -> v_Base_dList_dappend sizes (v_Vuna_dCompiler_dElab_dsubSizeEntries base subpats)
  | _ -> sizes
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1589 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1587 21 ("case pattern match failure"))
  | _ -> sizes
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1586 31 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dcheckTermBody = fun fname sizes e -> (match e with
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> (match v_Vuna_dCompiler_dElab_dcallIndexes fname fn args with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes fn
  | C_Base_dMaybe_dJust (idxs) -> if v_Vuna_dCompiler_dElab_danyDescends idxs args sizes then v_Vuna_dCompiler_dElab_dcheckTermArgs fname sizes args else C_Base_dResult_dErr ((let vuna_cat0' = ("DT: cannot prove termination of ") in (let vuna_cat1' = (fname) in (let vuna_cat2' = (" (recursive call does not structurally decrease)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1526 22 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes scrut) (fun _u -> v_Vuna_dCompiler_dElab_dcheckTermAlts fname sizes scrut alts)
  | C_Vuna_dCompiler_dAst_dEIf (c, t, el, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes c) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes t) (fun _u -> v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes el))
  | C_Vuna_dCompiler_dAst_dELam (ns, b, sp) -> v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes b
  | C_Vuna_dCompiler_dAst_dELet (binds, b, rec_u, sp) -> v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes b
  | _ -> C_Base_dResult_dOk (0)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1525 31 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckTermArgs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (fname, sizes, []) -> C_Base_dResult_dOk (0)
  | (fname, sizes, (a) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckTermBody fname sizes a) (fun _u -> v_Vuna_dCompiler_dElab_dcheckTermArgs fname sizes rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1542 1 ("no matching clause for Vuna.Compiler.Elab.checkTermArgs")
and v_Vuna_dCompiler_dElab_dcheckTermAlts = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (fname, sizes, scrut, []) -> C_Base_dResult_dOk (0)
  | (fname, sizes, scrut, (a) :: (rest)) -> (match a with
  | C_Base_dPair_dPair (pat, body) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckTermBody fname (v_Vuna_dCompiler_dElab_dextendSizes sizes scrut pat) body) (fun _u -> v_Vuna_dCompiler_dElab_dcheckTermAlts fname sizes scrut rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1548 47 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1547 1 ("no matching clause for Vuna.Compiler.Elab.checkTermAlts")

let v_Vuna_dCompiler_dElab_dcheckTermOne = fun fname pats body -> v_Vuna_dCompiler_dElab_dcheckTermBody fname (v_Vuna_dCompiler_dElab_dinitialSizes (v_Vuna_dCompiler_dElab_dpatNames pats)) body

let rec v_Vuna_dCompiler_dElab_dcheckTermDeclsGo = fun a0 -> match a0 with
  | ([]) -> C_Base_dResult_dOk (0)
  | ((fd) :: (rest)) -> (match fd with
  | C_Base_dPair_dPair (name, C_Base_dPair_dPair (pats, body)) -> if v_Vuna_dCompiler_dElab_dfunMentions name body then v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckTermOne name pats body) (fun _u -> v_Vuna_dCompiler_dElab_dcheckTermDeclsGo rest) else v_Vuna_dCompiler_dElab_dcheckTermDeclsGo rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1464 33 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1463 1 ("no matching clause for Vuna.Compiler.Elab.checkTermDeclsGo")

let v_Vuna_dCompiler_dElab_dcheckTerminationDecls = fun decls -> v_Vuna_dCompiler_dElab_dcheckTermDeclsGo (v_Vuna_dCompiler_dElab_dfunDefsOf decls)

let v_Vuna_dCompiler_dElab_dctxDepthOf = fun g -> v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtGoalCtx g)

let rec v_Vuna_dCompiler_dElab_dfindGoal = fun a0 a1 -> match (a0, a1) with
  | (m, []) -> C_Base_dMaybe_dNothing
  | (m, (g) :: (rest)) -> if v_vuna_ueq_uint (v_Vuna_dCompiler_dElab_ddtGoalMeta g) m then C_Base_dMaybe_dJust (g) else v_Vuna_dCompiler_dElab_dfindGoal m rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1624 1 ("no matching clause for Vuna.Compiler.Elab.findGoal")

let v_Vuna_dCompiler_dElab_dunsolvedMessage = fun ec m -> (match v_Vuna_dCompiler_dElab_dfindGoal m (v_Vuna_dCompiler_dElab_decGoals ec) with
  | C_Base_dMaybe_dJust (g) -> (let vuna_cat0' = ("DT: unsolved hole ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dElab_ddtGoalSpan g)) in (let vuna_cat2' = (" with goal ") in (let vuna_cat3' = (v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepthOf g) (v_Vuna_dCompiler_dElab_ddtGoalType g)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))
  | C_Base_dMaybe_dNothing -> (("DT: unsolved metavariable ?") ^ (bi_str_from_int m))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1611 24 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_ddtGoalInfoSpan = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtGoalInfo (sp, goal, ctx)) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1631 1 ("no matching clause for Vuna.Compiler.Elab.dtGoalInfoSpan")

let v_Vuna_dCompiler_dElab_ddtGoalInfoGoal = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtGoalInfo (sp, goal, ctx)) -> goal
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1633 1 ("no matching clause for Vuna.Compiler.Elab.dtGoalInfoGoal")

let v_Vuna_dCompiler_dElab_ddtGoalInfoCtx = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dElab_dDtGoalInfo (sp, goal, ctx)) -> ctx
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1635 1 ("no matching clause for Vuna.Compiler.Elab.dtGoalInfoCtx")

let v_Vuna_dCompiler_dElab_dzonkGoal = fun sols v -> v_Vuna_dCompiler_dCore_dforce [] sols v_Vuna_dCompiler_dCore_ddefaultFuel v

let rec v_Vuna_dCompiler_dElab_dctxEntriesAt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], idx, depth) -> []
  | ((C_Base_dPair_dPair (name, ty)) :: (rest), idx, depth) -> (C_Base_dPair_dPair (name, v_Vuna_dCompiler_dCore_dshowValueAt depth (v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnvAt ((C_Base_dPair_dPair (name, ty)) :: (rest)) 0 depth) (v_Vuna_dCompiler_dCore_dshift 0 (bi_add idx 1) ty)))) :: (v_Vuna_dCompiler_dElab_dctxEntriesAt rest (bi_add idx 1) depth)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1651 1 ("no matching clause for Vuna.Compiler.Elab.ctxEntriesAt")

let v_Vuna_dCompiler_dElab_dctxEntriesOf = fun items -> v_Vuna_dCompiler_dElab_dctxEntriesAt items 0 (v_Base_dList_dlength items)

let v_Vuna_dCompiler_dElab_dgoalInfoOf = fun sols g -> C_Vuna_dCompiler_dElab_dDtGoalInfo (v_Vuna_dCompiler_dElab_ddtGoalSpan g, v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepthOf g) (v_Vuna_dCompiler_dElab_dzonkGoal sols (v_Vuna_dCompiler_dElab_ddtGoalType g)), v_Vuna_dCompiler_dElab_dctxEntriesOf (v_Vuna_dCompiler_dElab_ddtGoalCtx g))

let v_Vuna_dCompiler_dElab_dbinderRig = fun implicit dom -> v_Vuna_dCompiler_dCore_drigOfBinder implicit (v_Vuna_dCompiler_dCore_disTypeValue dom)

let rec v_Vuna_dCompiler_dElab_dsplitKind = fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, _, dom, cod) -> (C_Base_dPair_dPair (name, v_Vuna_dCompiler_dElab_dbinderRig implicit (v_Vuna_dCompiler_dCore_deval [] dom))) :: (v_Vuna_dCompiler_dElab_dsplitKind cod)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 348 16 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dteleOf = fun ty env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> (let domVal = v_Vuna_dCompiler_dCore_deval env dom in let v = C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, v_Base_dList_dlength env, [])) in let rig = v_Vuna_dCompiler_dElab_dbinderRig implicit domVal in (C_Base_dPair_dPair (name, rig)) :: (v_Vuna_dCompiler_dElab_dteleOf cod ((v) :: (env))))
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 372 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dteleOfType = fun ty -> v_Vuna_dCompiler_dElab_dteleOf ty []

let rec v_Vuna_dCompiler_dElab_dbindCtorGo = fun ctx ty subpats acc -> (match ty with
  | C_Vuna_dCompiler_dCore_dTPi (name, implicit, rig, dom, cod) -> (let domVal = v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx) dom in if implicit then (let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name domVal ctx in v_Vuna_dCompiler_dElab_dbindCtorGo ctx2 cod subpats (C_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dPair_dPair (name, C_Vuna_dCompiler_dCore_dRig0)) :: (v_Vuna_dCompiler_dElab_dbaBinders acc), v_Vuna_dCompiler_dElab_dbaPending acc))) else (match subpats with
  | [] -> C_Base_dResult_dErr ("DT: case branch has too few arguments for its constructor")
  | (p) :: (rest) -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Vuna_dCompiler_dElab_dbindCtorBinder ctx domVal cod pname rest acc
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_dbindCtorBinder ctx domVal cod "_" rest acc
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> (let fresh = v_Vuna_dCompiler_dElab_dfreshPatName (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dbaPending acc)) in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue fresh domVal ctx in v_Vuna_dCompiler_dElab_dbindCtorGo ctx2 cod rest (C_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dPair_dPair (fresh, v_Vuna_dCompiler_dElab_dbinderRig false domVal)) :: (v_Vuna_dCompiler_dElab_dbaBinders acc), v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dbaPending acc) ((C_Vuna_dCompiler_dElab_dPending (p, fresh)) :: ([])))))
  | _ -> C_Base_dResult_dErr ("DT: nested patterns must be constructor patterns (M19)")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 964 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 962 10 ("case pattern match failure")))
  | _ -> C_Base_dResult_dOk (C_Base_dPair_dPair (ctx, C_Base_dPair_dPair (v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dbaBinders acc), C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dbaPending acc, subpats))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 954 33 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dbindCtorBinder = fun ctx domVal cod binderName rest acc -> (let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue binderName domVal ctx in v_Vuna_dCompiler_dElab_dbindCtorGo ctx2 cod rest (C_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dPair_dPair (binderName, v_Vuna_dCompiler_dElab_dbinderRig false domVal)) :: (v_Vuna_dCompiler_dElab_dbaBinders acc), v_Vuna_dCompiler_dElab_dbaPending acc)))

let v_Vuna_dCompiler_dElab_dbindCtorTele = fun ctx ty subpats -> v_Vuna_dCompiler_dElab_dbindCtorGo ctx ty subpats (C_Vuna_dCompiler_dElab_dBindAcc ([], []))

let rec v_Vuna_dCompiler_dElab_disTypeLayerValue = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVType (l) -> true
  | C_Vuna_dCompiler_dCore_dVPi (pname, implicit, rig, dom, clo) -> (if (v_Vuna_dCompiler_dElab_disTypeLayerValue dom) then (v_Vuna_dCompiler_dElab_disTypeLayerValue (v_Vuna_dCompiler_dCore_dapplyClosure clo (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (pname, 0, []))))) else false)
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1759 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dtypeLayerRig = fun implicit dom -> if implicit then C_Vuna_dCompiler_dCore_dRig0 else if v_Vuna_dCompiler_dElab_disTypeLayerValue dom then C_Vuna_dCompiler_dCore_dRig0 else C_Vuna_dCompiler_dCore_dRig1

let v_Vuna_dCompiler_dElab_disDataHead = fun datas v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> (match v_Vuna_dCompiler_dElab_ddtDataLookup g datas with
  | C_Base_dMaybe_dJust (_) -> true
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1768 21 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1767 17 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1766 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_disIndexDomain = fun ec dom -> (if ((if (v_Vuna_dCompiler_dCore_disTypeValue dom) then true else (v_Vuna_dCompiler_dElab_disTypeLayerValue dom))) then true else (v_Vuna_dCompiler_dElab_disDataHead (v_Vuna_dCompiler_dElab_decDatas ec) (v_Vuna_dCompiler_dElab_dforceVal ec dom)))

let v_Vuna_dCompiler_dElab_dfreshVarValue = fun name level -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNVar (name, level, []))

let v_Vuna_dCompiler_dElab_dctorRefTerm = fun datas name -> (match v_Vuna_dCompiler_dElab_ddtCtorLookup name datas with
  | C_Base_dMaybe_dJust (ctor) -> if v_vuna_ueq_uBase_uList_uList (v_Vuna_dCompiler_dElab_ddtCtorTelescope ctor) [] then C_Vuna_dCompiler_dCore_dTCon (name, []) else C_Vuna_dCompiler_dCore_dTGlobal (name)
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dTGlobal (name)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1878 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dfoldAppTerms = fun a0 a1 -> match (a0, a1) with
  | (fn, []) -> fn
  | (fn, (C_Base_dPair_dPair (arg, erased)) :: (rest)) -> v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTApp (fn, arg, erased)) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1893 1 ("no matching clause for Vuna.Compiler.Elab.foldAppTerms")

let rec v_Vuna_dCompiler_dElab_dmethodProjZip = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (tname, pname, pKind, idx, [], fieldTys) -> []
  | (tname, pname, pKind, idx, (m) :: (rest), []) -> []
  | (tname, pname, pKind, idx, (m) :: (rest), (t) :: (rest2)) -> (match m with
  | C_Base_dPair_dPair (mname, mexpr) -> (C_Base_dPair_dPair (mname, C_Vuna_dCompiler_dCore_dTPi (pname, true, C_Vuna_dCompiler_dCore_dRig0, pKind, C_Vuna_dCompiler_dCore_dTPi ("_", true, C_Vuna_dCompiler_dCore_dRig0, v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTGlobal (v_Vuna_dCompiler_dElab_ddictTypeName tname)) ((C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTVar (pname, 0), C_Vuna_dCompiler_dCore_dRig0)) :: ([])), v_Vuna_dCompiler_dCore_dshift 0 1 t)))) :: (v_Vuna_dCompiler_dElab_dmethodProjZip tname pname pKind (bi_add idx 1) rest rest2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 576 64 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 574 1 ("no matching clause for Vuna.Compiler.Elab.methodProjZip")

let v_Vuna_dCompiler_dElab_dmethodProjections = fun tname pname pKind methods fieldTys -> v_Vuna_dCompiler_dElab_dmethodProjZip tname pname pKind 0 methods fieldTys

let v_Vuna_dCompiler_dElab_dprojectionBody = fun ctor fieldIdx rigs nFields -> (let arity = v_Base_dList_dlength rigs in let dictIdx = arity in let fieldVar = C_Vuna_dCompiler_dCore_dTVar (v_Vuna_dCompiler_dElab_dfieldVarName fieldIdx, bi_sub (bi_sub nFields 1) fieldIdx) in let argPairs = v_Vuna_dCompiler_dElab_dmethodArgTerms rigs nFields in let applied = v_Vuna_dCompiler_dElab_dfoldAppTerms fieldVar argPairs in let binders = v_Vuna_dCompiler_dElab_dfieldBinderNames nFields in let alt = C_Vuna_dCompiler_dCore_dCaseAlt (ctor, binders, applied) in let caseTerm = C_Vuna_dCompiler_dCore_dTCase (C_Vuna_dCompiler_dCore_dTVar ("_d", dictIdx), (alt) :: ([])) in let lamArgs = v_Vuna_dCompiler_dElab_dmethodArgLams rigs 0 caseTerm in C_Vuna_dCompiler_dCore_dTLam ("_p", C_Vuna_dCompiler_dCore_dRig0, C_Vuna_dCompiler_dCore_dTLam ("_d", C_Vuna_dCompiler_dCore_dRig1, lamArgs)))

let rec v_Vuna_dCompiler_dElab_dprojectionDefsGo = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (ctor, [], fieldTys, idx, nFields) -> []
  | (ctor, (m) :: (rest), [], idx, nFields) -> []
  | (ctor, (m) :: (rest), (t) :: (rest2), idx, nFields) -> (match m with
  | C_Base_dPair_dPair (mname, mexpr) -> (C_Base_dPair_dPair (mname, v_Vuna_dCompiler_dElab_dprojectionBody ctor idx (v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dbinderRig t) nFields)) :: (v_Vuna_dCompiler_dElab_dprojectionDefsGo ctor rest rest2 (bi_add idx 1) nFields)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 644 62 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 642 1 ("no matching clause for Vuna.Compiler.Elab.projectionDefsGo")

let v_Vuna_dCompiler_dElab_dprojectionDefs = fun tname pname methods fieldTys nFields -> v_Vuna_dCompiler_dElab_dprojectionDefsGo (v_Vuna_dCompiler_dElab_ddictCtorName tname) methods fieldTys 0 nFields

let v_Vuna_dCompiler_dElab_dctorResultType = fun cls arg -> v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTGlobal (v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName cls))) ((C_Base_dPair_dPair (arg, C_Vuna_dCompiler_dCore_dRig0)) :: ([]))

let rec v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | ([], classes, globals, ec, acc, insts) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, v_Vuna_dCompiler_dElab_dfoldlAddInst ec (v_Base_dList_dreverse insts)))
  | ((d) :: (rest), classes, globals, ec, acc, insts) -> (match d with
  | C_Base_dPair_dPair (decl, dsp) -> (match decl with
  | C_Vuna_dCompiler_dAst_dDInstance (mname, isDefault, headExpr, methods, msp) -> (match v_Vuna_dCompiler_dElab_dinstanceHeadName headExpr with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt msp "DT: instance head must be an interface application (e.g. Show Int)"
  | C_Base_dMaybe_dJust (cname) -> (match v_Vuna_dCompiler_dElab_dfindClass cname classes with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt msp ((let vuna_cat0' = ("DT: unknown interface ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" in instance head") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (cls) -> (let iname = v_Vuna_dCompiler_dElab_dinstanceName mname headExpr in let ty = v_Vuna_dCompiler_dElab_dctorResultType cls (v_Vuna_dCompiler_dElab_dinstanceHeadTerm headExpr) in v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo rest classes globals ec ((C_Base_dPair_dPair (iname, ty)) :: (acc)) ((C_Vuna_dCompiler_dElab_dDtInst (iname, ty)) :: (insts)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1278 21 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1276 55 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo rest classes globals ec acc insts
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1275 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1274 65 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1272 1 ("no matching clause for Vuna.Compiler.Elab.checkInstanceHeadsGo")

let v_Vuna_dCompiler_dElab_dcheckInstanceHeads = fun decls classes globals ec -> v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo decls classes globals ec [] []

let v_Vuna_dCompiler_dElab_dctorAppTerm = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (datas, C_Vuna_dCompiler_dCore_dTGlobal (g), args) -> (match v_Vuna_dCompiler_dElab_ddtCtorLookup g datas with
  | C_Base_dMaybe_dJust (ctor) -> if v_vuna_uge_uint (v_Base_dList_dlength args) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtCtorTelescope ctor)) then C_Vuna_dCompiler_dCore_dTCon (g, args) else v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTGlobal (g)) args
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTGlobal (g)) args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1885 38 ("case pattern match failure"))
  | (datas, fn, args) -> v_Vuna_dCompiler_dElab_dfoldAppTerms fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1885 1 ("no matching clause for Vuna.Compiler.Elab.ctorAppTerm")

let v_Vuna_dCompiler_dElab_disDictFamily = fun ec g -> v_Base_dList_dmemName g (v_Base_dList_dmap (fun c -> v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName c)) (v_Vuna_dCompiler_dElab_decClasses ec))

let v_Vuna_dCompiler_dElab_disDictValue = fun ec v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> v_Vuna_dCompiler_dElab_disDictFamily ec g
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1945 17 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1944 20 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_disDictDomain = fun ec dom -> v_Vuna_dCompiler_dElab_disDictValue ec (v_Vuna_dCompiler_dElab_dforceVal ec dom)

let rec v_Vuna_dCompiler_dElab_dfilterInstances = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (ec, dom, [], sols) -> C_Base_dPair_dPair ([], sols)
  | (ec, dom, (i) :: (rest), sols) -> (let hd = v_Vuna_dCompiler_dElab_dforceVal ec (v_Vuna_dCompiler_dCore_deval [] (v_Vuna_dCompiler_dElab_ddtInstHead i)) in (match v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec) sols 0 dom hd with
  | C_Base_dResult_dErr (e) -> v_Vuna_dCompiler_dElab_dfilterInstances ec dom rest sols
  | C_Base_dResult_dOk (sols2) -> (match v_Vuna_dCompiler_dElab_dfilterInstances ec dom rest sols with
  | C_Base_dPair_dPair (more, final) -> C_Base_dPair_dPair ((i) :: (more), sols2)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1973 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1971 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1967 1 ("no matching clause for Vuna.Compiler.Elab.filterInstances")

let rec v_Vuna_dCompiler_dElab_djoinRestInstNames = fun a0 -> match a0 with
  | ([]) -> ""
  | ((i) :: (rest)) -> (let vuna_cat0' = (", ") in (let vuna_cat1' = (v_Vuna_dCompiler_dElab_ddtInstName i) in (let vuna_cat2' = (v_Vuna_dCompiler_dElab_djoinRestInstNames rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1981 1 ("no matching clause for Vuna.Compiler.Elab.joinRestInstNames")

let v_Vuna_dCompiler_dElab_djoinInstNames = fun a0 -> match a0 with
  | ([]) -> ""
  | ((i) :: (rest)) -> ((v_Vuna_dCompiler_dElab_ddtInstName i) ^ (v_Vuna_dCompiler_dElab_djoinRestInstNames rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1977 1 ("no matching clause for Vuna.Compiler.Elab.joinInstNames")

let v_Vuna_dCompiler_dElab_dsearchInstance = fun ec dom sp -> (match v_Vuna_dCompiler_dElab_dfilterInstances ec dom (v_Vuna_dCompiler_dElab_decInsts ec) (v_Vuna_dCompiler_dElab_decSols ec) with
  | C_Base_dPair_dPair ([], sols) -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: no instance found for ") ^ (v_Vuna_dCompiler_dCore_dshowValue dom)))
  | C_Base_dPair_dPair ((i) :: ([]), sols) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTGlobal (v_Vuna_dCompiler_dElab_ddtInstName i), v_Vuna_dCompiler_dElab_decPutSols ec sols))
  | C_Base_dPair_dPair (cands, sols) -> v_Vuna_dCompiler_dElab_derrAt sp ((let vuna_cat0' = ("DT: ambiguous instance for ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCore_dshowValue dom) in (let vuna_cat2' = (" (candidates: ") in (let vuna_cat3' = (v_Vuna_dCompiler_dElab_djoinInstNames cands) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1955 28 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_ddictFamilyNameOf = fun ec dom -> (match v_Vuna_dCompiler_dElab_dforceVal ec dom with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, sp)) -> C_Base_dMaybe_dJust (g)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2008 27 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_ddictArgKind = fun ec dom -> (match v_Vuna_dCompiler_dElab_ddictFamilyNameOf ec dom with
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust (fam) -> (match v_Vuna_dCompiler_dElab_ddtDataLookup fam (v_Vuna_dCompiler_dElab_decDatas ec) with
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust (dd) -> (match v_Vuna_dCompiler_dElab_ddtDataCtors dd with
  | [] -> C_Base_dMaybe_dNothing
  | (c) :: (_) -> (match v_Vuna_dCompiler_dElab_dforceVal ec (v_Vuna_dCompiler_dCore_deval [] (v_Vuna_dCompiler_dElab_ddtCtorType c)) with
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, domK, clo) -> C_Base_dMaybe_dJust (domK)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2003 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2001 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1999 15 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1997 22 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dneutralHeadOrSelf = fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, (_) :: (_))) -> C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, []))
  | _ -> v
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2039 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dargHeadMatchesKind = fun globals ec ctx forced argKind -> (match v_Vuna_dCompiler_dElab_dneutralHeadOrSelf forced with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, [])) -> (match v_Vuna_dCompiler_dElab_dglobalLookup g globals with
  | C_Base_dMaybe_dJust (dictSig) -> (match v_Vuna_dCompiler_dElab_dconvEc ec (v_Vuna_dCompiler_dElab_dctxDepth ctx) argKind (v_Vuna_dCompiler_dElab_dforceVal ec (v_Vuna_dCompiler_dCore_deval [] dictSig)) with
  | C_Base_dResult_dOk (ec2) -> true
  | C_Base_dResult_dErr (e) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2031 21 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2030 30 ("case pattern match failure"))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2029 52 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_ddictClassArg = fun ec dom -> (match v_Vuna_dCompiler_dElab_dforceVal ec dom with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (g, (arg) :: ([]))) -> C_Base_dMaybe_dJust (arg)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2044 23 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue = fun ec v -> (match v with
  | C_Vuna_dCompiler_dCore_dVMeta (m, sp) -> (match v_Vuna_dCompiler_dCore_dmetaLookup m (v_Vuna_dCompiler_dElab_decSols ec) with
  | C_Base_dMaybe_dJust (solved) -> v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec solved
  | C_Base_dMaybe_dNothing -> true
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2051 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVNeutral (n) -> (match n with
  | C_Vuna_dCompiler_dCore_dNVar (name, lvl, sp) -> v_Vuna_dCompiler_dElab_dhasUnsolvedMetaList ec sp
  | C_Vuna_dCompiler_dCore_dNGlobal (g, sp) -> v_Vuna_dCompiler_dElab_dhasUnsolvedMetaList ec sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2054 17 ("case pattern match failure"))
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, clo) -> (if (v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec dom) then true else (v_Vuna_dCompiler_dElab_dhasUnsolvedMetaClo ec clo))
  | C_Vuna_dCompiler_dCore_dVLam (name, rig, clo) -> v_Vuna_dCompiler_dElab_dhasUnsolvedMetaClo ec clo
  | C_Vuna_dCompiler_dCore_dVCon (c, args) -> v_Vuna_dCompiler_dElab_dhasUnsolvedMetaList ec args
  | C_Vuna_dCompiler_dCore_dVCase (scrut, alts) -> v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec scrut
  | C_Vuna_dCompiler_dCore_dVIf (c, th, el) -> (if ((if (v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec c) then true else (v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec th))) then true else (v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec el))
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2050 29 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dhasUnsolvedMetaList = fun a0 a1 -> match (a0, a1) with
  | (ec, []) -> false
  | (ec, (v) :: (rest)) -> (if (v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec v) then true else (v_Vuna_dCompiler_dElab_dhasUnsolvedMetaList ec rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2066 1 ("no matching clause for Vuna.Compiler.Elab.hasUnsolvedMetaList")
and v_Vuna_dCompiler_dElab_dhasUnsolvedMetaClo = fun ec clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClos (env, body) -> v_Vuna_dCompiler_dElab_dhasUnsolvedMetaList ec env
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2070 29 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dspecializeEqTy = fun name aTerm bTerm sp aTy ec -> (match v_Vuna_dCompiler_dDtPrelude_dbuiltinEqTyName (v_Vuna_dCompiler_dElab_dforceVal ec aTy) with
  | C_Base_dMaybe_dJust (tyName) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtPrelude_deqRuntimeName name tyName) (fun rt -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTGlobal (rt), aTerm, C_Vuna_dCompiler_dCore_dRig1), bTerm, C_Vuna_dCompiler_dCore_dRig1), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Bool", [])), ec)))))
  | C_Base_dMaybe_dNothing -> (let mname = if v_vuna_ueq_ustr name "==" then "eq" else "neq" in let tyTerm = v_Vuna_dCompiler_dCore_dquote 0 aTy in let dictTy = C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (v_Vuna_dCompiler_dElab_ddictTypeName "Eq", (v_Vuna_dCompiler_dCore_deval [] tyTerm) :: ([]))) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dsearchInstance ec dictTy sp) (fun p -> (match p with
  | C_Base_dPair_dPair (dictTerm, ec1) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTGlobal (mname), tyTerm, C_Vuna_dCompiler_dCore_dRig0), dictTerm, C_Vuna_dCompiler_dCore_dRig1), aTerm, C_Vuna_dCompiler_dCore_dRig1), bTerm, C_Vuna_dCompiler_dCore_dRig1), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Bool", [])), ec1))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2249 53 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2239 45 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabConAlt = fun globals ctx ec dd idxs expected cname args psp body -> (match v_Vuna_dCompiler_dElab_dfindCtorIn cname (v_Vuna_dCompiler_dElab_ddtDataCtors dd) with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt psp ((let vuna_cat0' = ("DT: unknown constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" in case ") in (let vuna_cat3' = (v_Vuna_dCompiler_dElab_ddtDataName dd) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Base_dMaybe_dJust (ctor) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbindCtorTele ctx (v_Vuna_dCompiler_dElab_ddtCtorType ctor) args) (fun p -> (match p with
  | C_Base_dPair_dPair (branchCtx, C_Base_dPair_dPair (binders, C_Base_dPair_dPair (pending, leftover))) -> if v_Vuna_dCompiler_dElab_dnonEmpty leftover then v_Vuna_dCompiler_dElab_derrAt psp ((let vuna_cat0' = ("DT: branch for constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" has too many arguments") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else (match v_Vuna_dCompiler_dElab_dunifyIdxList ec [] (v_Vuna_dCompiler_dElab_dctxDepth branchCtx) v_Vuna_dCompiler_dCore_ddefaultFuel (v_Vuna_dCompiler_dElab_dctorResultValsIn branchCtx ctor) (v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drefineValue [] v_Vuna_dCompiler_dCore_ddefaultFuel) idxs) with
  | C_Base_dResult_dErr (e) -> v_Vuna_dCompiler_dElab_derrAt psp "DT: this branch is impossible (index constraints are unsatisfiable)"
  | C_Base_dResult_dOk (refs2) -> (let refinedExpected = v_Vuna_dCompiler_dElab_drefineValue refs2 v_Vuna_dCompiler_dCore_ddefaultFuel expected in let branchCtx2 = v_Vuna_dCompiler_dElab_dctxRefine branchCtx refs2 in let body2 = v_Vuna_dCompiler_dElab_dfoldPending pending body in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals branchCtx2 ec body2 refinedExpected) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dCaseAlt (cname, binders, bodyTerm), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1010 81 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1003 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1001 73 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 999 66 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_delabCaseAlts = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (globals, ctx, ec, dd, idxs, expected, [], acc) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, ec))
  | (globals, ctx, ec, dd, idxs, expected, (alt) :: (rest), acc) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabConAlt globals ctx ec dd idxs expected cname args psp body) (fun p -> (match p with
  | C_Base_dPair_dPair (altTerm, ec1) -> v_Vuna_dCompiler_dElab_delabCaseAlts globals ctx ec1 dd idxs expected rest ((altTerm) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1019 108 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Vuna_dCompiler_dElab_delabCatchAll globals ctx ec dd idxs expected rest acc body psp
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_delabCatchAll globals ctx ec dd idxs expected rest acc body psp
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan pat) "DT: only constructor patterns are supported in case (M14)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1018 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1017 66 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1016 1 ("no matching clause for Vuna.Compiler.Elab.elabCaseAlts")
and v_Vuna_dCompiler_dElab_delabCatchAll = fun globals ctx ec dd idxs expected rest acc body psp -> if v_Vuna_dCompiler_dElab_dnonEmpty rest then v_Vuna_dCompiler_dElab_derrAt psp "DT: the catch-all branch must be the last one" else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse ((C_Vuna_dCompiler_dCore_dCaseAlt ("", [], bodyTerm)) :: (acc)), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1030 60 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckCase = fun globals ctx ec scrut alts expected sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec scrut) (fun ps -> (match ps with
  | C_Base_dPair_dPair (scrutTerm, C_Base_dPair_dPair (scrutTy, ec1)) -> v_Vuna_dCompiler_dElab_dcheckCaseFam globals ctx ec1 scrutTerm scrutTy alts expected sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1070 97 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckCaseFam = fun globals ctx ec scrutTerm scrutTy alts expected sp -> (match v_Vuna_dCompiler_dElab_dforceVal ec scrutTy with
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Bool", [])) -> v_Vuna_dCompiler_dElab_dcheckBoolCase globals ctx ec scrutTerm alts expected sp
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Int", [])) -> v_Vuna_dCompiler_dElab_dcheckLitCase globals ctx ec scrutTerm "Int" alts expected sp
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("String", [])) -> v_Vuna_dCompiler_dElab_dcheckLitCase globals ctx ec scrutTerm "String" alts expected sp
  | C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal (fam, idxs)) -> v_Vuna_dCompiler_dElab_dcheckCaseOf globals ctx ec scrutTerm fam idxs alts expected sp
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: case scrutinee is not an inductive family"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1076 66 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckBoolCase = fun globals ctx ec scrutTerm alts expected sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dboolAlt globals ctx ec alts "True" expected sp) (fun p -> (match p with
  | C_Base_dPair_dPair (trueBody, C_Base_dPair_dPair (catchAll, ec1)) -> (match catchAll with
  | C_Base_dMaybe_dJust (falseBody) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTIf (scrutTerm, trueBody, falseBody), ec1))
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dboolAlt globals ctx ec alts "False" expected sp) (fun q -> (match q with
  | C_Base_dPair_dPair (falseBody, C_Base_dPair_dPair (_, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTIf (scrutTerm, trueBody, falseBody), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1088 81 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1086 40 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1085 123 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dboolAlt = fun globals ctx ec alts target expected sp -> v_Vuna_dCompiler_dElab_dboolAltGo globals ctx ec alts target expected sp C_Base_dMaybe_dNothing
and v_Vuna_dCompiler_dElab_dboolAltGo = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (globals, ctx, ec, [], target, expected, sp, catchAll) -> (match catchAll with
  | C_Base_dMaybe_dJust (t) -> C_Base_dResult_dOk (C_Base_dPair_dPair (t, C_Base_dPair_dPair (C_Base_dMaybe_dNothing, ec)))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: case is not exhaustive: missing ") ^ (target)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1099 59 ("case pattern match failure"))
  | (globals, ctx, ec, (alt) :: (rest), target, expected, sp, catchAll) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPCon (cname, args, psp) -> if v_vuna_ueq_ustr cname target then v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (bodyTerm, C_Base_dPair_dPair (catchAll, ec1)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1104 105 ("case pattern match failure"))) else v_Vuna_dCompiler_dElab_dboolAltGo globals ctx ec rest target expected sp catchAll
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> v_Vuna_dCompiler_dElab_dboolAltGo globals ctx ec rest target expected sp (C_Base_dMaybe_dJust (bodyTerm))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1108 76 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> v_Vuna_dCompiler_dElab_dboolAltGo globals ctx ec rest target expected sp (C_Base_dMaybe_dJust (bodyTerm))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1111 71 ("case pattern match failure")))
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan pat) "DT: case on Bool only accepts True / False / variable patterns (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1103 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1102 70 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1099 1 ("no matching clause for Vuna.Compiler.Elab.boolAltGo")
and v_Vuna_dCompiler_dElab_dcheckLitCase = fun globals ctx ec scrutTerm tyName alts expected sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLitAlts globals ctx ec scrutTerm tyName alts expected sp) (fun p -> (match p with
  | C_Base_dPair_dPair (term, C_Base_dPair_dPair (hasDefault, ec1)) -> if hasDefault then C_Base_dResult_dOk (C_Base_dPair_dPair (term, ec1)) else v_Vuna_dCompiler_dElab_derrAt sp "DT: case on Int / String needs a variable or wildcard branch as fallback (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1119 144 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckLitAlts = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (globals, ctx, ec, scrutTerm, tyName, [], expected, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTIf (C_Vuna_dCompiler_dCore_dTBool (false), C_Vuna_dCompiler_dCore_dTInt (0), C_Vuna_dCompiler_dCore_dTInt (0)), C_Base_dPair_dPair (false, ec)))
  | (globals, ctx, ec, scrutTerm, tyName, (alt) :: (rest), expected, sp) -> (match alt with
  | C_Base_dPair_dPair (pat, body) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPInt (n, psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLitAlts globals ctx ec1 scrutTerm tyName rest expected sp) (fun q -> (match q with
  | C_Base_dPair_dPair (restTerm, C_Base_dPair_dPair (hasDefault, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTIf (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTGlobal ("=="), scrutTerm, C_Vuna_dCompiler_dCore_dRig1), C_Vuna_dCompiler_dCore_dTInt (n), C_Vuna_dCompiler_dCore_dRig1), bodyTerm, restTerm), C_Base_dPair_dPair (hasDefault, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1133 108 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1132 72 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dPStr (s, psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLitAlts globals ctx ec1 scrutTerm tyName rest expected sp) (fun q -> (match q with
  | C_Base_dPair_dPair (restTerm, C_Base_dPair_dPair (hasDefault, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTIf (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTGlobal ("=="), scrutTerm, C_Vuna_dCompiler_dCore_dRig1), C_Vuna_dCompiler_dCore_dTStr (s), C_Vuna_dCompiler_dCore_dRig1), bodyTerm, restTerm), C_Base_dPair_dPair (hasDefault, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1140 108 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1139 72 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLitBoundVar globals ctx ec scrutTerm tyName pname body expected sp) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (bodyTerm, C_Base_dPair_dPair (true, ec1)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1146 112 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (bodyTerm, C_Base_dPair_dPair (true, ec1)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1149 71 ("case pattern match failure")))
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan pat) "DT: case on Int / String only accepts literals / variable patterns (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1131 20 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1130 74 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1128 1 ("no matching clause for Vuna.Compiler.Elab.checkLitAlts")
and v_Vuna_dCompiler_dElab_dcheckLitBoundVar = fun globals ctx ec scrutTerm tyName name body expected sp -> (let scrutVal = v_Vuna_dCompiler_dElab_devalCtx ctx scrutTerm in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name scrutVal ctx in v_Vuna_dCompiler_dElab_dcheckE globals ctx2 ec body expected)
and v_Vuna_dCompiler_dElab_dcheckCaseOf = fun globals ctx ec scrutTerm fam idxs alts expected sp -> (match v_Vuna_dCompiler_dElab_ddtDataLookup fam (v_Vuna_dCompiler_dElab_decDatas ec) with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp "DT: case scrutinee is not an inductive family"
  | C_Base_dMaybe_dJust (dd) -> if v_Vuna_dCompiler_dElab_dhasDupNames (v_Vuna_dCompiler_dElab_daltNames alts) then v_Vuna_dCompiler_dElab_derrAt sp "DT: duplicate constructor in case" else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCaseAlts globals ctx ec dd idxs expected alts []) (fun p -> (match p with
  | C_Base_dPair_dPair (altTerms, ec2) -> v_Vuna_dCompiler_dElab_dcheckCaseDone ec2 ctx dd idxs alts expected sp scrutTerm altTerms
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1167 78 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1164 66 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferCaseE = fun globals ctx ec scrut alts sp -> (let pmeta = v_Vuna_dCompiler_dElab_dnewMeta ctx ec in (match pmeta with
  | C_Base_dPair_dPair (metaTerm, ec1) -> (let metaTy = v_Vuna_dCompiler_dElab_devalCtx ctx metaTerm in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckCase globals ctx ec1 scrut alts metaTy sp) (fun p -> (match p with
  | C_Base_dPair_dPair (term, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (term, C_Base_dPair_dPair (metaTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1787 74 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1783 6 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dinferE = fun globals ctx ec expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, sp) -> if v_vuna_ueq_ustr name "Type" then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVType (v_Vuna_dCompiler_dCore_dlevelSucc v_Vuna_dCompiler_dCore_dlevelZero), ec))) else if v_vuna_ueq_ustr name "_" then v_Vuna_dCompiler_dElab_derrAt sp "DT: cannot infer the type of a hole; give it an expected type" else (match v_Vuna_dCompiler_dElab_dctxLookup name ctx with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (idx, tyTerm)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTVar (name, idx), C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dvarTypeValue ctx idx tyTerm, ec)))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dJust (tyTerm) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec) name, C_Base_dPair_dPair (v_Vuna_dCompiler_dCore_deval [] tyTerm, ec)))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: unknown name ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1800 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1798 8 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTInt (n), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Int", [])), ec)))
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTStr (s), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("String", [])), ec)))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dCompiler_dElab_dinferPi globals ctx ec name implicit dom cod sp
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Vuna_dCompiler_dElab_dinferApp globals ctx ec fn args sp
  | C_Vuna_dCompiler_dAst_dELam (names, body, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: cannot infer the type of a lambda; add a signature"
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec c (C_Vuna_dCompiler_dCore_dVNeutral (C_Vuna_dCompiler_dCore_dNGlobal ("Bool", [])))) (fun p -> (match p with
  | C_Base_dPair_dPair (cTerm, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec1 t) (fun pt -> (match pt with
  | C_Base_dPair_dPair (tTerm, C_Base_dPair_dPair (tTy, ec2)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec2 e) (fun pe -> (match pe with
  | C_Base_dPair_dPair (eTerm, C_Base_dPair_dPair (eTy, ec3)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dconvEc ec3 (v_Vuna_dCompiler_dElab_dctxDepth ctx) tTy eTy) (fun ec4 -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTIf (cTerm, tTerm, eTerm), C_Base_dPair_dPair (tTy, ec4))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1810 79 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1809 66 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1808 91 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dCompiler_dElab_dinferLet globals ctx ec binds body rec_u sp
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Vuna_dCompiler_dElab_dinferCaseE globals ctx ec scrut alts sp
  | C_Vuna_dCompiler_dAst_dEField (base, fname, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: record field access is not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dERecord (rname, fields, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: records are not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: record update is not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dEInstSel (meth, iname, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: instance selection is not supported yet (M15)"
  | C_Vuna_dCompiler_dAst_dEDo (stmts, sp) -> v_Vuna_dCompiler_dElab_derrAt sp "DT: do blocks are not supported yet (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1795 30 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferPi = fun globals ctx ec name implicit dom cod sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals ctx ec dom) (fun pd -> (match pd with
  | C_Base_dPair_dPair (domTerm, C_Base_dPair_dPair (domSort, ec1)) -> (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let ctx2 = v_Vuna_dCompiler_dElab_dctxBind name domTerm ctx in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals ctx2 ec1 cod) (fun pc -> (match pc with
  | C_Base_dPair_dPair (codTerm, C_Base_dPair_dPair (codSort, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTPi (name, implicit, v_Vuna_dCompiler_dCore_drigOfBinder implicit false, domTerm, codTerm), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVType (v_Vuna_dCompiler_dCore_dlevelMax domSort codSort), ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1831 57 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1826 98 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dinferApp = fun globals ctx ec fn args sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar ("->", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCompiler_dElab_dinferPi globals ctx ec "_" false a b sp
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: invalid arrow type"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1841 18 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dEVar ("Type", tsp) -> (match args with
  | (C_Vuna_dCompiler_dAst_dEInt (n, nsp)) :: ([]) -> if v_vuna_ult_uint n 0 then v_Vuna_dCompiler_dElab_derrAt nsp "DT: universe level must be non-negative" else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelOfInt n), C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dVType (v_Vuna_dCompiler_dCore_dlevelSucc (v_Vuna_dCompiler_dCore_dlevelOfInt n)), ec)))
  | _ -> v_Vuna_dCompiler_dElab_derrAt tsp "DT: Type needs exactly one non-negative level (or none)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1844 22 ("case pattern match failure"))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (name, vsp) -> (match v_Vuna_dCompiler_dElab_dctxLookup name ctx with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dinferAppGeneral globals ctx ec fn args sp
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dJust (tyTerm) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec (v_Vuna_dCompiler_dCore_deval [] tyTerm) args sp) (fun pa -> (match pa with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas ec2) (C_Vuna_dCompiler_dCore_dTGlobal (name)) argTerms, C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1853 92 ("case pattern match failure")))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt vsp ((("DT: unknown name ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1852 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1850 22 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dinferAppGeneral globals ctx ec fn args sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1849 8 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1840 38 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferAppGeneral = fun globals ctx ec fn args sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (name, vsp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dspecializeEqApp globals ctx ec name args sp) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dJust (pair) -> C_Base_dResult_dOk (pair)
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dinferAppGeneralGo globals ctx ec fn args sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1862 85 ("case pattern match failure")))
  | _ -> v_Vuna_dCompiler_dElab_dinferAppGeneralGo globals ctx ec fn args sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1861 45 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferAppGeneralGo = fun globals ctx ec fn args sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec fn) (fun pf -> (match pf with
  | C_Base_dPair_dPair (fnTerm, C_Base_dPair_dPair (fnTy, ec1)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec1 fnTy args sp) (fun pa -> (match pa with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas ec2) fnTerm argTerms, C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1870 91 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1869 90 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dinferArgs = fun globals ctx ec ty args sp -> v_Vuna_dCompiler_dElab_dinferArgsGo globals ctx ec ty args sp
and v_Vuna_dCompiler_dElab_dinferArgsGo = fun globals ctx ec ty args sp -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec ty in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, clo) -> if implicit then if v_Vuna_dCompiler_dElab_disDictDomain ec dom then v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dconstrainDictDom globals ec ctx dom args sp) (fun ec0 -> (match v_Vuna_dCompiler_dElab_dsearchInstance ec0 (v_Vuna_dCompiler_dElab_dforceVal ec0 dom) sp with
  | C_Base_dResult_dOk (C_Base_dPair_dPair (instTerm, ec1)) -> (let ty2 = v_Vuna_dCompiler_dCore_dapplyClosure clo (v_Vuna_dCompiler_dElab_devalCtx ctx instTerm) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgsGo globals ctx ec1 ty2 args sp) (fun q -> (match q with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (instTerm, C_Vuna_dCompiler_dCore_dRig1)) :: (argTerms), C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1908 69 ("case pattern match failure"))))
  | C_Base_dResult_dErr (e) -> if v_Vuna_dCompiler_dElab_dhasUnsolvedMetaValue ec0 (v_Vuna_dCompiler_dElab_dforceVal ec0 dom) then (match v_Vuna_dCompiler_dElab_dnewMeta ctx ec0 with
  | C_Base_dPair_dPair (metaTerm, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgsGo globals ctx ec1 (v_Vuna_dCompiler_dCore_dapplyClosure clo (v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx) metaTerm)) args sp) (fun p -> (match p with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (metaTerm, C_Vuna_dCompiler_dCore_dRig1)) :: (argTerms), C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1915 131 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1912 68 ("case pattern match failure")) else C_Base_dResult_dErr (e)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1904 146 ("case pattern match failure"))) else if v_Vuna_dCompiler_dElab_disIndexDomain ec dom then (match v_Vuna_dCompiler_dElab_dnewMeta ctx ec with
  | C_Base_dPair_dPair (metaTerm, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgsGo globals ctx ec1 (v_Vuna_dCompiler_dCore_dapplyClosure clo (v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx) metaTerm)) args sp) (fun p -> (match p with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (metaTerm, C_Vuna_dCompiler_dCore_dRig0)) :: (argTerms), C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1922 129 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1921 39 ("case pattern match failure")) else v_Vuna_dCompiler_dElab_derrAt sp "DT: implicit parameters must be types or inductive families (M15)" else (match args with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair (forced, ec)))
  | (a) :: (rest) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckE globals ctx ec a dom) (fun p -> (match p with
  | C_Base_dPair_dPair (aTerm, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgsGo globals ctx ec1 (v_Vuna_dCompiler_dCore_dapplyClosure clo (v_Vuna_dCompiler_dElab_devalCtx ctx aTerm)) rest sp) (fun q -> (match q with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (aTerm, v_Vuna_dCompiler_dElab_dtypeLayerRig false dom)) :: (argTerms), C_Base_dPair_dPair (resTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1930 119 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1929 65 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1927 10 ("case pattern match failure"))
  | _ -> (match args with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair (forced, ec)))
  | (a) :: (rest) -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan a) "DT: too many arguments (not a function)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1935 10 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1903 6 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dconstrainDictDom = fun globals ec ctx dom args sp -> (match v_Vuna_dCompiler_dElab_ddictClassArg ec dom with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (ec)
  | C_Base_dMaybe_dJust (argTy) -> (match v_Vuna_dCompiler_dElab_ddictArgKind ec dom with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (ec)
  | C_Base_dMaybe_dJust (argKind) -> v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals ec ctx argTy argKind args sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1990 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1988 47 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dconstrainDictDomGoK = fun globals ec ctx argTy argKind args sp -> (match args with
  | [] -> C_Base_dResult_dOk (ec)
  | (a) :: (rest) -> (match v_Vuna_dCompiler_dElab_dinferE globals ctx ec a with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dOk (ec)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (aTerm, C_Base_dPair_dPair (aTy, ec1))) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec1 aTy in if v_Vuna_dCompiler_dCore_disTypeValue forced then v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals ec1 ctx argTy argKind rest sp else if v_Vuna_dCompiler_dElab_dargHeadMatchesKind globals ec1 ctx forced argKind then (match v_Vuna_dCompiler_dElab_dconvEc ec1 (v_Vuna_dCompiler_dElab_dctxDepth ctx) argTy (v_Vuna_dCompiler_dElab_dneutralHeadOrSelf forced) with
  | C_Base_dResult_dOk (ec2) -> C_Base_dResult_dOk (ec2)
  | C_Base_dResult_dErr (e) -> v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals ec1 ctx argTy argKind rest sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2021 70 ("case pattern match failure")) else v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals ec1 ctx argTy argKind rest sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2015 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2013 60 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckE = fun globals ctx ec expr expected -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, sp) -> if v_vuna_ueq_ustr name "_" then (let pmeta = v_Vuna_dCompiler_dElab_dnewHoleMeta ctx ec sp expected in (match pmeta with
  | C_Base_dPair_dPair (metaTerm, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (metaTerm, ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2078 8 ("case pattern match failure"))) else v_Vuna_dCompiler_dElab_dcheckApp globals ctx ec (C_Vuna_dCompiler_dAst_dEVar (name, sp)) [] expected sp
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dELam (names, body, sp) -> v_Vuna_dCompiler_dElab_dcheckLam globals ctx ec names body expected sp
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("->", _), args, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("Type", _), args, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Vuna_dCompiler_dElab_dcheckApp globals ctx ec fn args expected sp
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, sp) -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, csp) -> v_Vuna_dCompiler_dElab_dcheckCase globals ctx ec scrut alts expected csp
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dCompiler_dElab_dcheckLet globals ctx ec binds body rec_u expected sp
  | _ -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec expr expected
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2074 39 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckLet = fun globals ctx ec binds body rec_u expected sp -> v_Vuna_dCompiler_dElab_dcheckLetGo globals ctx ec binds body rec_u expected sp
and v_Vuna_dCompiler_dElab_dcheckLetGo = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (globals, ctx, ec, [], body, rec_u, expected, sp) -> v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected
  | (globals, ctx, ec, (bind) :: (rest), body, rec_u, expected, sp) -> v_Vuna_dCompiler_dElab_dcheckLetOne globals ctx ec bind rest body rec_u expected sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2104 1 ("no matching clause for Vuna.Compiler.Elab.checkLetGo")
and v_Vuna_dCompiler_dElab_dcheckLetOne = fun globals ctx ec bind rest body rec_u expected sp -> (match v_Base_dPair_dfirstOf bind with
  | C_Vuna_dCompiler_dAst_dPVar (name, psp) -> (let value = v_Base_dPair_dsecondOf bind in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec value) (fun pv -> (match pv with
  | C_Base_dPair_dPair (valueTerm, C_Base_dPair_dPair (valueTy, ec1)) -> (let rig = v_Vuna_dCompiler_dElab_dbinderRig false valueTy in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name valueTy ctx in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLetGo globals ctx2 ec1 rest body rec_u expected sp) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTLam (name, rig, bodyTerm), valueTerm, rig), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2118 85 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2113 54 ("case pattern match failure"))))
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> (let value = v_Base_dPair_dsecondOf bind in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec value) (fun pv -> (match pv with
  | C_Base_dPair_dPair (valueTerm, C_Base_dPair_dPair (valueTy, ec1)) -> (let rig = v_Vuna_dCompiler_dElab_dbinderRig false valueTy in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLetGo globals ctx ec1 rest body rec_u expected sp) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTLam ("_", rig, bodyTerm), valueTerm, rig), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2129 84 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2125 54 ("case pattern match failure"))))
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan (v_Base_dPair_dfirstOf bind)) "DT: let bindings must be simple names or wildcards (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2109 62 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferLet = fun globals ctx ec binds body rec_u sp -> (match binds with
  | [] -> v_Vuna_dCompiler_dElab_dinferE globals ctx ec body
  | (C_Base_dPair_dPair (pat, value)) :: (rest) -> (match pat with
  | C_Vuna_dCompiler_dAst_dPVar (name, psp) -> v_Vuna_dCompiler_dElab_dinferLetBound globals ctx ec name value rest body rec_u sp
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_dinferLetIgnored globals ctx ec value rest body rec_u sp
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan pat) "DT: let bindings must be simple names or wildcards (M19)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2139 31 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2137 46 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dinferLetBound = fun globals ctx ec name value rest body rec_u sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec value) (fun pv -> (match pv with
  | C_Base_dPair_dPair (valueTerm, C_Base_dPair_dPair (valueTy, ec1)) -> (let rig = v_Vuna_dCompiler_dElab_dbinderRig false valueTy in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name valueTy ctx in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferLet globals ctx2 ec1 rest body rec_u sp) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, C_Base_dPair_dPair (bodyTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTLam (name, rig, bodyTerm), valueTerm, rig), C_Base_dPair_dPair (bodyTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2150 70 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2145 107 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dinferLetIgnored = fun globals ctx ec value rest body rec_u sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec value) (fun pv -> (match pv with
  | C_Base_dPair_dPair (valueTerm, C_Base_dPair_dPair (valueTy, ec1)) -> (let rig = v_Vuna_dCompiler_dElab_dbinderRig false valueTy in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferLet globals ctx ec1 rest body rec_u sp) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bodyTerm, C_Base_dPair_dPair (bodyTy, ec2)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTApp (C_Vuna_dCompiler_dCore_dTLam ("_", rig, bodyTerm), valueTerm, rig), C_Base_dPair_dPair (bodyTy, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2161 69 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2157 104 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckByInfer = fun globals ctx ec expr expected -> (match v_Vuna_dCompiler_dElab_dinferE globals ctx ec expr with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (term, C_Base_dPair_dPair (actual, ec1))) -> (match v_Vuna_dCompiler_dElab_dconvEc ec1 (v_Vuna_dCompiler_dElab_dctxDepth ctx) expected actual with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dexprSpan expr)) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dResult_dOk (ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (term, ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2170 39 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2168 45 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckLam = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (globals, ctx, ec, [], body, expected, sp) -> v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected
  | (globals, ctx, ec, (name) :: (rest), body, expected, sp) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (pname, implicit, rig, dom, clo) -> (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue pname lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCompiler_dCore_dapplyClosure clo v in let lamRig = v_Vuna_dCompiler_dElab_dbinderRig implicit dom in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckLam globals ctx2 ec rest body expected2 sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (name, lamRig, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2191 75 ("case pattern match failure"))))
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: lambda has more parameters than the expected function type"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2179 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2175 1 ("no matching clause for Vuna.Compiler.Elab.checkLam")
and v_Vuna_dCompiler_dElab_dcheckType = fun globals ctx ec expr -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec expr) (fun p -> (match p with
  | C_Base_dPair_dPair (term, C_Base_dPair_dPair (ty, ec1)) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec1 ty in (match v_Vuna_dCompiler_dCore_dtypeLevelOf forced with
  | C_Base_dMaybe_dJust (lvl) -> C_Base_dResult_dOk (C_Base_dPair_dPair (term, C_Base_dPair_dPair (lvl, ec1)))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan expr) ((("DT: expected a type, but this expression has type ") ^ (v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepth ctx) ty)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2201 8 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2197 77 ("case pattern match failure")))
and v_Vuna_dCompiler_dElab_dcheckApp = fun globals ctx ec fn args expected sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (name, vsp) -> (match v_Vuna_dCompiler_dElab_dctxLookup name ctx with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dcheckAppGeneral globals ctx ec fn args expected sp
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dElab_ddtCtorLookup name (v_Vuna_dCompiler_dElab_decDatas ec) with
  | C_Base_dMaybe_dJust (_) -> v_Vuna_dCompiler_dElab_dcheckAppCtor globals ctx ec name args expected vsp
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dcheckAppGeneral globals ctx ec fn args expected sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2214 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2212 20 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_dcheckAppGeneral globals ctx ec fn args expected sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2211 47 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dspecializeEqApp = fun globals ctx ec name args sp -> if v_Vuna_dCompiler_dDtPrelude_disEqOp name then (match args with
  | (a) :: ((b) :: ([])) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec a) (fun pa -> (match pa with
  | C_Base_dPair_dPair (aTerm, C_Base_dPair_dPair (aTy, ec1)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferE globals ctx ec1 b) (fun pb -> (match pb with
  | C_Base_dPair_dPair (bTerm, C_Base_dPair_dPair (bTy, ec2)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dconvEc ec2 (v_Vuna_dCompiler_dElab_dctxDepth ctx) aTy bTy) (fun ec3 -> v_Vuna_dCompiler_dElab_dspecializeEqTy name aTerm bTerm sp aTy ec3)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2226 77 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2225 55 ("case pattern match failure")))
  | _ -> C_Base_dResult_dOk (C_Base_dMaybe_dNothing)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2224 67 ("case pattern match failure")) else C_Base_dResult_dOk (C_Base_dMaybe_dNothing)
and v_Vuna_dCompiler_dElab_dcheckAppGeneral = fun globals ctx ec fn args expected sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dEVar (name, vsp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dspecializeEqApp globals ctx ec name args sp) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (term, C_Base_dPair_dPair (termTy, ec1))) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dconvEc ec1 (v_Vuna_dCompiler_dElab_dctxDepth ctx) expected termTy) (fun ec2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (term, ec2)))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec (C_Vuna_dCompiler_dAst_dEApp (fn, args, sp)) expected
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2256 85 ("case pattern match failure")))
  | _ -> v_Vuna_dCompiler_dElab_dcheckByInfer globals ctx ec (C_Vuna_dCompiler_dAst_dEApp (fn, args, sp)) expected
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2255 54 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dcheckAppCtor = fun globals ctx ec name args expected sp -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: unknown name ") ^ (name)))
  | C_Base_dMaybe_dJust (tyTerm) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dinferArgs globals ctx ec (v_Vuna_dCompiler_dCore_deval [] tyTerm) args sp) (fun pa -> (match pa with
  | C_Base_dPair_dPair (argTerms, C_Base_dPair_dPair (resTy, ec1)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dconvEc ec1 (v_Vuna_dCompiler_dElab_dctxDepth ctx) expected resTy) (fun ec2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas ec2) (C_Vuna_dCompiler_dCore_dTGlobal (name)) argTerms, ec2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2267 86 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2265 53 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dclassFieldTysGo = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, ctx, ec, [], acc) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, ec))
  | (globals, ctx, ec, (m) :: (rest), acc) -> (match m with
  | C_Base_dPair_dPair (mname, mexpr) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals ctx ec (v_Vuna_dCompiler_dDtQuant_dquantifyTraitSig (fun nm -> v_Base_dMaybe_disJust (v_Vuna_dCompiler_dElab_dctxLookup nm ctx)) mexpr (v_Vuna_dCompiler_dAst_dexprSpan mexpr))) (fun p -> (match p with
  | C_Base_dPair_dPair (tyTerm, C_Base_dPair_dPair (sort, ec1)) -> v_Vuna_dCompiler_dElab_dclassFieldTysGo globals ctx ec1 rest ((tyTerm) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 522 142 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 521 50 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 520 1 ("no matching clause for Vuna.Compiler.Elab.classFieldTysGo")

let v_Vuna_dCompiler_dElab_dclassFieldTys = fun globals ec params methods -> v_Vuna_dCompiler_dElab_dclassFieldTysGo globals (v_Vuna_dCompiler_dElab_dbindClassParams params methods v_Vuna_dCompiler_dElab_demptyCtx) ec methods []

let v_Vuna_dCompiler_dElab_delabTrait = fun globals ec ds -> (match ds with
  | C_Base_dPair_dPair (d, dsp) -> (match d with
  | C_Vuna_dCompiler_dAst_dDTrait (tname, params, methods, sp) -> if v_vuna_uneq_uint (v_Base_dList_dlength params) 1 then v_Vuna_dCompiler_dElab_derrAt sp "DT: interfaces must have exactly one parameter (M15 limitation)" else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dclassFieldTys globals ec params methods) (fun p -> (match p with
  | C_Base_dPair_dPair (fieldTys, ec1) -> (let pname = v_Vuna_dCompiler_dElab_dparamNameOf params in let pKind = v_Vuna_dCompiler_dDtKind_dclassParamKind pname methods in let dname = v_Vuna_dCompiler_dElab_ddictTypeName tname in let cname = v_Vuna_dCompiler_dElab_ddictCtorName tname in let dapp = v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTGlobal (dname)) ((C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTVar (pname, 0), C_Vuna_dCompiler_dCore_dRig0)) :: ([])) in let ctorTy = C_Vuna_dCompiler_dCore_dTPi (pname, true, C_Vuna_dCompiler_dCore_dRig0, pKind, v_Vuna_dCompiler_dElab_dfoldPiFieldTys fieldTys dapp) in let tele = v_Vuna_dCompiler_dElab_dteleOfType ctorTy in let dd = C_Vuna_dCompiler_dElab_dDtData (dname, tele, (C_Vuna_dCompiler_dElab_dDtCtor (cname, dname, tele, ctorTy)) :: ([])) in let projs = v_Vuna_dCompiler_dElab_dmethodProjections tname pname pKind methods fieldTys in let projBodies = v_Vuna_dCompiler_dElab_dprojectionDefs tname pname methods fieldTys (v_Base_dList_dlength methods) in let cls = C_Vuna_dCompiler_dElab_dDtClass (tname, params, projs, fieldTys) in let ec2 = v_Vuna_dCompiler_dElab_decAddClass (v_Vuna_dCompiler_dElab_decAddData ec1 dd) cls in let ec3 = v_Vuna_dCompiler_dElab_dfoldlAddDef ec2 projBodies in C_Base_dResult_dOk (C_Base_dPair_dPair (dd, C_Base_dPair_dPair (projs, C_Base_dPair_dPair (cls, ec3)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 541 67 ("case pattern match failure")))
  | _ -> v_Vuna_dCompiler_dElab_derrAt dsp "DT: internal: expected a trait declaration"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 539 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 538 27 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabSigs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, ec) -> C_Base_dResult_dOk (C_Base_dPair_dPair (globals, ec))
  | ((C_Base_dPair_dPair (name, tyExpr)) :: (rest), globals, ec) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals v_Vuna_dCompiler_dElab_demptyCtx ec tyExpr) (fun p -> (match p with
  | C_Base_dPair_dPair (tyTerm, C_Base_dPair_dPair (sortLvl, ec1)) -> v_Vuna_dCompiler_dElab_delabSigs rest (v_Base_dList_dappend globals ((C_Base_dPair_dPair (name, tyTerm)) :: ([]))) ec1
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1183 106 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1182 1 ("no matching clause for Vuna.Compiler.Elab.elabSigs")

let rec v_Vuna_dCompiler_dElab_delabTraitsGo = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | ([], globals, ec, ds, gs, cs) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse ds, C_Base_dPair_dPair (v_Base_dList_dreverse gs, C_Base_dPair_dPair (v_Base_dList_dreverse cs, ec))))
  | ((d) :: (rest), globals, ec, ds, gs, cs) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabTrait globals ec d) (fun p -> (match p with
  | C_Base_dPair_dPair (dd, C_Base_dPair_dPair (projs, C_Base_dPair_dPair (cls, ec1))) -> v_Vuna_dCompiler_dElab_delabTraitsGo rest (v_Base_dList_dappend globals projs) ec1 ((dd) :: (ds)) (v_Base_dList_dappend projs gs) ((cls) :: (cs))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1321 88 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1319 1 ("no matching clause for Vuna.Compiler.Elab.elabTraitsGo")

let v_Vuna_dCompiler_dElab_delabTraits = fun decls globals ec -> v_Vuna_dCompiler_dElab_delabTraitsGo decls globals ec [] [] []

let v_Vuna_dCompiler_dElab_dcheckBodyAtEnd = fun globals ctx ec body expected sp -> (match body with
  | C_Vuna_dCompiler_dAst_dELam (names, lambdaBody, lambdaSp) -> v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: definition has fewer parameters than its signature"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1692 50 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dcheckBinders = fun a0 a1 a2 a3 a4 a5 a6 -> match (a0, a1, a2, a3, a4, a5, a6) with
  | (globals, ctx, ec, [], body, expected, sp) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, clo) -> if implicit then if v_Vuna_dCompiler_dElab_disIndexDomain ec dom then (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue name lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCompiler_dCore_dapplyClosure clo v in let bRig = C_Vuna_dCompiler_dCore_dRig0 in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckBinders globals ctx2 ec [] body expected2 sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (name, bRig, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1683 77 ("case pattern match failure")))) else v_Vuna_dCompiler_dElab_derrAt sp "DT: implicit parameters must be types or inductive families (M14)" else v_Vuna_dCompiler_dElab_dcheckBodyAtEnd globals ctx ec body expected sp
  | _ -> v_Vuna_dCompiler_dElab_dcheckE globals ctx ec body expected
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1675 6 ("case pattern match failure")))
  | (globals, ctx, ec, (pat) :: (rest), body, expected, sp) -> (let forced = v_Vuna_dCompiler_dElab_dforceVal ec expected in (match forced with
  | C_Vuna_dCompiler_dCore_dVPi (name, implicit, rig, dom, clo) -> if implicit then if v_Vuna_dCompiler_dElab_disIndexDomain ec dom then (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue name lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue name dom ctx in let expected2 = v_Vuna_dCompiler_dCore_dapplyClosure clo v in let bRig = C_Vuna_dCompiler_dCore_dRig0 in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckBinders globals ctx2 ec ((pat) :: (rest)) body expected2 sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (name, bRig, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1707 88 ("case pattern match failure")))) else v_Vuna_dCompiler_dElab_derrAt sp "DT: implicit parameters must be types or inductive families (M14)" else (match pat with
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Vuna_dCompiler_dElab_dbindOnePattern globals ctx ec pname rest body dom clo sp
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_dbindOnePattern globals ctx ec "_" rest body dom clo sp
  | _ -> v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan pat) "DT: definition parameters must be variables (M13)"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1711 10 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_derrAt sp "DT: definition has more parameters than its signature"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1699 6 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1672 1 ("no matching clause for Vuna.Compiler.Elab.checkBinders")
and v_Vuna_dCompiler_dElab_dbindOnePattern = fun globals ctx ec pname pats body dom clo sp -> (let lvl = v_Vuna_dCompiler_dElab_dctxDepth ctx in let v = v_Vuna_dCompiler_dElab_dfreshVarValue pname lvl in let ctx2 = v_Vuna_dCompiler_dElab_dctxBindValue pname dom ctx in let erasure = v_Vuna_dCompiler_dElab_dtypeLayerRig false dom in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckBinders globals ctx2 ec pats body (v_Vuna_dCompiler_dCore_dapplyClosure clo v) sp) (fun p -> (match p with
  | C_Base_dPair_dPair (inner, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dCore_dTLam (pname, erasure, inner), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1724 86 ("case pattern match failure"))))

let v_Vuna_dCompiler_dElab_delabInstanceMethod = fun globals ec mty pats body sp -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckBinders globals v_Vuna_dCompiler_dElab_demptyCtx ec pats body (v_Vuna_dCompiler_dCore_deval [] mty) sp) (fun p -> (match p with
  | C_Base_dPair_dPair (term, ec1) -> C_Base_dResult_dOk (C_Base_dPair_dPair (term, ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 802 127 ("case pattern match failure")))

let rec v_Vuna_dCompiler_dElab_delabInstanceMethodsGo = fun a0 a1 a2 a3 a4 a5 a6 a7 a8 -> match (a0, a1, a2, a3, a4, a5, a6, a7, a8) with
  | (globals, ec, [], pname, headArg, decls, terms, args, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse terms, C_Base_dPair_dPair (v_Base_dList_dreverse args, ec)))
  | (globals, ec, (fty) :: (rest), pname, headArg, decls, terms, args, sp) -> (match v_Vuna_dCompiler_dElab_dfindMethodAt (v_Base_dList_dlength terms) decls with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp "DT: instance is missing an implementation for an interface method"
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (mname, C_Base_dPair_dPair (pats, C_Base_dPair_dPair (body, msp)))) -> (let instTy = v_Vuna_dCompiler_dElab_dsubstClassParam pname headArg fty in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabInstanceMethod globals ec instTy pats body msp) (fun p -> (match p with
  | C_Base_dPair_dPair (term, ec1) -> v_Vuna_dCompiler_dElab_delabInstanceMethodsGo globals ec1 rest pname headArg decls ((term) :: (terms)) ((C_Base_dPair_dPair (term, C_Vuna_dCompiler_dCore_dRig1)) :: (args)) sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 741 76 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 736 84 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 734 1 ("no matching clause for Vuna.Compiler.Elab.elabInstanceMethodsGo")

let v_Vuna_dCompiler_dElab_delabInstanceMethods = fun globals cls headArg ec methods sp -> v_Vuna_dCompiler_dElab_delabInstanceMethodsGo globals ec (v_Vuna_dCompiler_dElab_ddtClassFieldTys cls) (v_Vuna_dCompiler_dElab_dparamNameOf (v_Vuna_dCompiler_dElab_ddtClassParams cls)) headArg methods [] [] sp

let v_Vuna_dCompiler_dElab_delabInstance = fun globals classes datas ec ds -> (match ds with
  | C_Base_dPair_dPair (d, dsp) -> (match d with
  | C_Vuna_dCompiler_dAst_dDInstance (mname, isDefault, headExpr, methods, msp) -> (match v_Vuna_dCompiler_dElab_dinstanceHeadName headExpr with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt msp "DT: instance head must be an interface application (e.g. Show Int)"
  | C_Base_dMaybe_dJust (cname) -> (match v_Vuna_dCompiler_dElab_dfindClass cname classes with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt msp ((let vuna_cat0' = ("DT: unknown interface ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" in instance head") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dJust (cls) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabInstanceMethods globals cls (v_Vuna_dCompiler_dElab_dinstanceHeadTerm headExpr) ec methods msp) (fun p -> (match p with
  | C_Base_dPair_dPair (fieldTerms, C_Base_dPair_dPair (fieldArgs, ec1)) -> (let iname = v_Vuna_dCompiler_dElab_dinstanceName mname headExpr in let headTerm = v_Vuna_dCompiler_dElab_dinstanceHeadTerm headExpr in let dctor = v_Vuna_dCompiler_dElab_ddictCtorName (v_Vuna_dCompiler_dElab_ddtClassName cls) in let dictTerm = C_Vuna_dCompiler_dCore_dTCon (dctor, fieldArgs) in let dictTyTerm = v_Vuna_dCompiler_dElab_dctorResultType cls headTerm in C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (iname, dictTyTerm)) :: ([]), v_Vuna_dCompiler_dElab_decAddDef (v_Vuna_dCompiler_dElab_decAddInst ec1 (C_Vuna_dCompiler_dElab_dDtInst (iname, dictTyTerm))) (C_Base_dPair_dPair (iname, dictTerm)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 696 113 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 694 21 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 692 55 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_derrAt dsp "DT: internal: expected an instance declaration"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 691 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 690 44 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabInstanceBodiesGo = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | ([], classes, datas, globals, ec, acc) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, ec))
  | ((d) :: (rest), classes, datas, globals, ec, acc) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabInstance globals classes datas ec d) (fun p -> (match p with
  | C_Base_dPair_dPair (gs, ec1) -> (let newDefs = v_Vuna_dCompiler_dElab_dinstanceDefsOf ec ec1 gs in v_Vuna_dCompiler_dElab_delabInstanceBodiesGo rest classes datas (v_Base_dList_dappend globals gs) ec1 (v_Base_dList_dappend newDefs acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1295 122 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1294 1 ("no matching clause for Vuna.Compiler.Elab.elabInstanceBodiesGo")

let v_Vuna_dCompiler_dElab_delabInstanceBodies = fun decls classes datas globals ec -> v_Vuna_dCompiler_dElab_delabInstanceBodiesGo decls classes datas globals ec []

let rec v_Vuna_dCompiler_dElab_delabInstancesGo = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | ([], classes, datas, globals, ec, acc) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, ec))
  | ((d) :: (rest), classes, datas, globals, ec, acc) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabInstance globals classes datas ec d) (fun p -> (match p with
  | C_Base_dPair_dPair (gs, ec1) -> v_Vuna_dCompiler_dElab_delabInstancesGo rest classes datas (v_Base_dList_dappend globals gs) ec1 (v_Base_dList_dappend gs acc)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1332 117 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1331 1 ("no matching clause for Vuna.Compiler.Elab.elabInstancesGo")

let v_Vuna_dCompiler_dElab_delabInstances = fun decls classes datas globals ec -> v_Vuna_dCompiler_dElab_delabInstancesGo decls classes datas globals ec []

let v_Vuna_dCompiler_dElab_dcheckDef = fun globals ec pats body expected sp -> v_Vuna_dCompiler_dElab_dcheckBinders globals v_Vuna_dCompiler_dElab_demptyCtx ec pats body expected sp

let v_Vuna_dCompiler_dElab_darityOf = fun a0 -> match a0 with
  | ([]) -> C_Base_dMaybe_dNothing
  | ((c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair (pats, body) -> C_Base_dMaybe_dJust (v_Base_dList_dlength pats)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2296 23 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2295 1 ("no matching clause for Vuna.Compiler.Elab.arityOf")

let rec v_Vuna_dCompiler_dElab_dparamNamesGo = fun i n acc -> if v_vuna_uge_uint i n then v_Base_dList_dreverse acc else v_Vuna_dCompiler_dElab_dparamNamesGo (bi_add i 1) n (((("mc") ^ (bi_str_from_int i))) :: (acc))

let v_Vuna_dCompiler_dElab_dparamNames = fun n -> v_Vuna_dCompiler_dElab_dparamNamesGo 0 n []

let rec v_Vuna_dCompiler_dElab_dwrapLambdas = fun a0 a1 -> match (a0, a1) with
  | ([], body) -> body
  | ((n) :: (rest), body) -> C_Vuna_dCompiler_dAst_dELam ((n) :: ([]), v_Vuna_dCompiler_dElab_dwrapLambdas rest body, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2307 1 ("no matching clause for Vuna.Compiler.Elab.wrapLambdas")

let v_Vuna_dCompiler_dElab_dlitPatExpr = fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPInt (n, sp) -> C_Vuna_dCompiler_dAst_dEInt (n, sp)
  | C_Vuna_dCompiler_dAst_dPStr (s, sp) -> C_Vuna_dCompiler_dAst_dEStr (s, sp)
  | _ -> C_Vuna_dCompiler_dAst_dEInt (0, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2332 16 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dallCtorHeads = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ((p) :: (ps), body) -> (match p with
  | C_Vuna_dCompiler_dAst_dPCon (cname, subpats, psp) -> v_Vuna_dCompiler_dElab_dallCtorHeads rest
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2353 26 ("case pattern match failure"))
  | C_Base_dPair_dPair ([], body) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2352 28 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2351 1 ("no matching clause for Vuna.Compiler.Elab.allCtorHeads")

let rec v_Vuna_dCompiler_dElab_dallEmptyPats = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ([], body) -> v_Vuna_dCompiler_dElab_dallEmptyPats rest
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2360 28 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2359 1 ("no matching clause for Vuna.Compiler.Elab.allEmptyPats")

let v_Vuna_dCompiler_dElab_dbodyOfFirst = fun clauses -> (match clauses with
  | (C_Base_dPair_dPair (pats, body)) :: (rest) -> body
  | [] -> C_Vuna_dCompiler_dAst_dEInt (0, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2365 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_disVarPatD = fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (n, sp) -> true
  | C_Vuna_dCompiler_dAst_dPWild (sp) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2370 15 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dallVarHeads = fun a0 -> match a0 with
  | ([]) -> true
  | ((c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ((p) :: (ps), body) -> (if (v_Vuna_dCompiler_dElab_disVarPatD p) then (v_Vuna_dCompiler_dElab_dallVarHeads rest) else false)
  | C_Base_dPair_dPair ([], body) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2377 27 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2376 1 ("no matching clause for Vuna.Compiler.Elab.allVarHeads")

let rec v_Vuna_dCompiler_dElab_dstripFirstCol = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ([], body) -> (c) :: (v_Vuna_dCompiler_dElab_dstripFirstCol rest)
  | C_Base_dPair_dPair ((p) :: (ps), body) -> (C_Base_dPair_dPair (ps, body)) :: (v_Vuna_dCompiler_dElab_dstripFirstCol rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2383 29 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2382 1 ("no matching clause for Vuna.Compiler.Elab.stripFirstCol")

let rec v_Vuna_dCompiler_dElab_dpatNamesOf = fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (n, sp) -> (n) :: ([])
  | C_Vuna_dCompiler_dAst_dPWild (sp) -> []
  | C_Vuna_dCompiler_dAst_dPCon (cn, ps, sp) -> v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dpatNamesOf ps
  | C_Vuna_dCompiler_dAst_dPInt (n, sp) -> []
  | C_Vuna_dCompiler_dAst_dPStr (s, sp) -> []
  | C_Vuna_dCompiler_dAst_dPRecord (rn, fields, sp) -> v_Base_dList_dconcatMap (fun f -> v_Vuna_dCompiler_dElab_dpatNamesOf (v_Base_dPair_dsecondOf f)) fields
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2429 16 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dbindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((b) :: (rest)) -> v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dpatNamesOf (v_Base_dPair_dfirstOf b)) (v_Vuna_dCompiler_dElab_dbindNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2425 1 ("no matching clause for Vuna.Compiler.Elab.bindNames")

let rec v_Vuna_dCompiler_dElab_drenameExpr = fun oldName newName e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (nm, sp) -> if v_vuna_ueq_ustr nm oldName then C_Vuna_dCompiler_dAst_dEVar (newName, sp) else e
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Vuna_dCompiler_dAst_dEInt (n, sp)
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Vuna_dCompiler_dAst_dEStr (s, sp)
  | C_Vuna_dCompiler_dAst_dELam (names, body, sp) -> C_Vuna_dCompiler_dAst_dELam (names, v_Vuna_dCompiler_dElab_drenameExprUnless oldName newName names body, sp)
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> C_Vuna_dCompiler_dAst_dEApp (v_Vuna_dCompiler_dElab_drenameExpr oldName newName fn, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drenameExpr oldName newName) args, sp)
  | C_Vuna_dCompiler_dAst_dEPi (nm, implicit, dom, cod, sp) -> C_Vuna_dCompiler_dAst_dEPi (nm, implicit, v_Vuna_dCompiler_dElab_drenameExpr oldName newName dom, v_Vuna_dCompiler_dElab_drenameExprUnless oldName newName ((nm) :: ([])) cod, sp)
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> C_Vuna_dCompiler_dAst_dELet (v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drenameBind oldName newName) binds, v_Vuna_dCompiler_dElab_drenameExprUnless oldName newName (v_Vuna_dCompiler_dElab_dbindNames binds) body, rec_u, sp)
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> C_Vuna_dCompiler_dAst_dECase (v_Vuna_dCompiler_dElab_drenameExpr oldName newName scrut, v_Base_dList_dmap (v_Vuna_dCompiler_dElab_drenameAlt oldName newName) alts, sp)
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e2, sp) -> C_Vuna_dCompiler_dAst_dEIf (v_Vuna_dCompiler_dElab_drenameExpr oldName newName c, v_Vuna_dCompiler_dElab_drenameExpr oldName newName t, v_Vuna_dCompiler_dElab_drenameExpr oldName newName e2, sp)
  | C_Vuna_dCompiler_dAst_dEField (b, f, sp) -> C_Vuna_dCompiler_dAst_dEField (v_Vuna_dCompiler_dElab_drenameExpr oldName newName b, f, sp)
  | C_Vuna_dCompiler_dAst_dEDo (stmts, sp) -> C_Vuna_dCompiler_dAst_dEDo (stmts, sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2398 32 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_drenameExprUnless = fun oldName newName names body -> if v_Base_dList_dmemName oldName names then body else v_Vuna_dCompiler_dElab_drenameExpr oldName newName body
and v_Vuna_dCompiler_dElab_drenameBind = fun oldName newName bind -> C_Base_dPair_dPair (v_Base_dPair_dfirstOf bind, v_Vuna_dCompiler_dElab_drenameExpr oldName newName (v_Base_dPair_dsecondOf bind))
and v_Vuna_dCompiler_dElab_drenameAlt = fun oldName newName alt -> (let p = v_Base_dPair_dfirstOf alt in C_Base_dPair_dPair (p, v_Vuna_dCompiler_dElab_drenameExprUnless oldName newName (v_Vuna_dCompiler_dElab_dpatNamesOf p) (v_Base_dPair_dsecondOf alt)))

let rec v_Vuna_dCompiler_dElab_drenameFirstVars = fun clauses pos inner -> (match clauses with
  | [] -> inner
  | (C_Base_dPair_dPair ((p) :: (ps), body)) :: (rest) -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (nm, psp) -> v_Vuna_dCompiler_dElab_drenameFirstVars rest pos (v_Vuna_dCompiler_dElab_drenameExpr nm pos inner)
  | _ -> v_Vuna_dCompiler_dElab_drenameFirstVars rest pos inner
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2392 36 ("case pattern match failure"))
  | (C_Base_dPair_dPair ([], body)) :: (rest) -> v_Vuna_dCompiler_dElab_drenameFirstVars rest pos inner
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2390 37 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_dctorSubPatCount = fun a0 a1 -> match (a0, a1) with
  | ([], cname) -> 0
  | ((c) :: (rest), cname) -> (match c with
  | C_Base_dPair_dPair ((p) :: (ps), body) -> (match p with
  | C_Vuna_dCompiler_dAst_dPCon (cn, subpats, psp) -> if v_vuna_ueq_ustr cn cname then v_Base_dList_dlength subpats else v_Vuna_dCompiler_dElab_dctorSubPatCount rest cname
  | _ -> v_Vuna_dCompiler_dElab_dctorSubPatCount rest cname
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2467 26 ("case pattern match failure"))
  | C_Base_dPair_dPair ([], body) -> v_Vuna_dCompiler_dElab_dctorSubPatCount rest cname
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2466 37 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2465 1 ("no matching clause for Vuna.Compiler.Elab.ctorSubPatCount")

let rec v_Vuna_dCompiler_dElab_dsubNamesGo = fun i n acc -> if v_vuna_uge_uint i n then v_Base_dList_dreverse acc else v_Vuna_dCompiler_dElab_dsubNamesGo (bi_add i 1) n (((("_sc") ^ (bi_str_from_int i))) :: (acc))

let v_Vuna_dCompiler_dElab_dsubNames = fun n -> v_Vuna_dCompiler_dElab_dsubNamesGo 0 n []

let rec v_Vuna_dCompiler_dElab_daddNameDistinct = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> (name) :: ([])
  | (name, (x) :: (rest)) -> if v_vuna_ueq_ustr x name then (x) :: (rest) else (x) :: (v_Vuna_dCompiler_dElab_daddNameDistinct name rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2488 1 ("no matching clause for Vuna.Compiler.Elab.addNameDistinct")

let rec v_Vuna_dCompiler_dElab_dctorHeads = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ((p) :: (ps), body) -> (match p with
  | C_Vuna_dCompiler_dAst_dPCon (cname, subpats, psp) -> v_Vuna_dCompiler_dElab_daddNameDistinct cname (v_Vuna_dCompiler_dElab_dctorHeads rest)
  | _ -> v_Vuna_dCompiler_dElab_dctorHeads rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2482 26 ("case pattern match failure"))
  | C_Base_dPair_dPair ([], body) -> v_Vuna_dCompiler_dElab_dctorHeads rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2481 25 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2480 1 ("no matching clause for Vuna.Compiler.Elab.ctorHeads")

let rec v_Vuna_dCompiler_dElab_dfirstCtorPats = fun a0 a1 -> match (a0, a1) with
  | (cname, []) -> []
  | (cname, (c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ((p) :: (ps), body) -> (match p with
  | C_Vuna_dCompiler_dAst_dPCon (cn, subpats, psp) -> if v_vuna_ueq_ustr cn cname then subpats else v_Vuna_dCompiler_dElab_dfirstCtorPats cname rest
  | _ -> v_Vuna_dCompiler_dElab_dfirstCtorPats cname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2494 26 ("case pattern match failure"))
  | C_Base_dPair_dPair ([], body) -> v_Vuna_dCompiler_dElab_dfirstCtorPats cname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2493 35 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2492 1 ("no matching clause for Vuna.Compiler.Elab.firstCtorPats")

let rec v_Vuna_dCompiler_dElab_dclausesForCtor = fun a0 a1 -> match (a0, a1) with
  | (cname, []) -> []
  | (cname, (c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ((p) :: (ps), body) -> (match p with
  | C_Vuna_dCompiler_dAst_dPCon (cn, subpats, psp) -> if v_vuna_ueq_ustr cn cname then (C_Base_dPair_dPair (v_Base_dList_dappend subpats ps, body)) :: (v_Vuna_dCompiler_dElab_dclausesForCtor cname rest) else v_Vuna_dCompiler_dElab_dclausesForCtor cname rest
  | _ -> v_Vuna_dCompiler_dElab_dclausesForCtor cname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2502 26 ("case pattern match failure"))
  | C_Base_dPair_dPair ([], body) -> v_Vuna_dCompiler_dElab_dclausesForCtor cname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2501 36 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2500 1 ("no matching clause for Vuna.Compiler.Elab.clausesForCtor")

let rec v_Vuna_dCompiler_dElab_dfilterFallback = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (match c with
  | C_Base_dPair_dPair ((p) :: (ps), body) -> if v_Vuna_dCompiler_dElab_disVarPatD p then (c) :: (v_Vuna_dCompiler_dElab_dfilterFallback rest) else v_Vuna_dCompiler_dElab_dfilterFallback rest
  | C_Base_dPair_dPair ([], body) -> v_Vuna_dCompiler_dElab_dfilterFallback rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2511 30 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2510 1 ("no matching clause for Vuna.Compiler.Elab.filterFallback")

let rec v_Vuna_dCompiler_dElab_dlitAltExpr = fun clauses pos restParams fuel -> v_Vuna_dCompiler_dElab_dlitAltExprGo clauses pos restParams fuel
and v_Vuna_dCompiler_dElab_dlitAltExprGo = fun clauses pos restParams fuel -> (match clauses with
  | [] -> C_Base_dResult_dErr ("DT: case on Int / String needs a variable or wildcard branch as fallback (M19)")
  | (C_Base_dPair_dPair ((p) :: (ps), body)) :: (rest) -> (match p with
  | C_Vuna_dCompiler_dAst_dPVar (pname, psp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbuildColumnExpr (v_Vuna_dCompiler_dElab_dstripFirstCol clauses) restParams (bi_sub fuel 1)) (fun inner -> C_Base_dResult_dOk (v_Vuna_dCompiler_dElab_drenameExpr pname pos inner))
  | C_Vuna_dCompiler_dAst_dPWild (psp) -> v_Vuna_dCompiler_dElab_dbuildColumnExpr (v_Vuna_dCompiler_dElab_dstripFirstCol clauses) restParams (bi_sub fuel 1)
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dlitAltExprGo rest pos restParams (bi_sub fuel 1)) (fun restExpr -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbuildColumnExpr ((C_Base_dPair_dPair (ps, body)) :: ([])) restParams (bi_sub fuel 1)) (fun bodyExpr -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEIf (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("==", C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)), (C_Vuna_dCompiler_dAst_dEVar (pos, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))) :: ((v_Vuna_dCompiler_dElab_dlitPatExpr p) :: ([])), v_Vuna_dCompiler_dAst_dpatSpan p), bodyExpr, restExpr, v_Vuna_dCompiler_dAst_dpatSpan p))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2320 36 ("case pattern match failure"))
  | (C_Base_dPair_dPair ([], body)) :: (rest) -> C_Base_dResult_dErr ("DT: clause has more patterns than the function arity")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2318 44 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dbuildColumnExpr = fun clauses params fuel -> if v_vuna_ule_uint fuel 0 then C_Base_dResult_dErr ("DT: pattern matrix recursion ran out of fuel") else if v_Vuna_dCompiler_dElab_dallEmptyPats clauses then C_Base_dResult_dOk (v_Vuna_dCompiler_dElab_dbodyOfFirst clauses) else (match params with
  | [] -> C_Base_dResult_dErr ("DT: clause has more patterns than the function arity")
  | (pos) :: (restParams) -> if v_Vuna_dCompiler_dElab_dallVarHeads clauses then v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbuildColumnExpr (v_Vuna_dCompiler_dElab_dstripFirstCol clauses) restParams (bi_sub fuel 1)) (fun inner -> C_Base_dResult_dOk (v_Vuna_dCompiler_dElab_drenameFirstVars clauses pos inner)) else if v_Vuna_dCompiler_dElab_dallCtorHeads clauses then v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dctorAltList clauses restParams (bi_sub fuel 1)) (fun alts -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dfallbackAltList clauses restParams (bi_sub fuel 1)) (fun fb -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dECase (C_Vuna_dCompiler_dAst_dEVar (pos, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)), v_Base_dList_dappend alts fb, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))) else v_Vuna_dCompiler_dElab_dlitAltExpr clauses pos restParams (bi_sub fuel 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2340 6 ("case pattern match failure"))
and v_Vuna_dCompiler_dElab_dctorAltList = fun clauses restParams fuel -> v_Vuna_dCompiler_dElab_dctorAltListGo clauses (v_Vuna_dCompiler_dElab_dctorHeads clauses) restParams fuel
and v_Vuna_dCompiler_dElab_dctorAltListGo = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (clauses, [], restParams, fuel) -> C_Base_dResult_dOk ([])
  | (clauses, (cname) :: (rest), restParams, fuel) -> (let subpatCount = v_Vuna_dCompiler_dElab_dctorSubPatCount clauses cname in let freshSubs = v_Vuna_dCompiler_dElab_dsubNames subpatCount in let expanded = v_Vuna_dCompiler_dElab_dclausesForCtor cname clauses in let subParams = v_Base_dList_dappend freshSubs restParams in let branchPats = v_Base_dList_dmap (fun n -> C_Vuna_dCompiler_dAst_dPVar (n, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))) freshSubs in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbuildColumnExpr expanded subParams (bi_sub fuel 1)) (fun bodyExpr -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dctorAltListGo clauses rest restParams (bi_sub fuel 1)) (fun tail -> C_Base_dResult_dOk ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (cname, branchPats, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)), bodyExpr)) :: (tail)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2452 1 ("no matching clause for Vuna.Compiler.Elab.ctorAltListGo")
and v_Vuna_dCompiler_dElab_dfallbackAltList = fun clauses restParams fuel -> (match v_Vuna_dCompiler_dElab_dfilterFallback clauses with
  | [] -> C_Base_dResult_dOk ([])
  | fbs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbuildColumnExpr (v_Vuna_dCompiler_dElab_dstripFirstCol fbs) restParams (bi_sub fuel 1)) (fun bodyExpr -> C_Base_dResult_dOk ((C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPWild (C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)), bodyExpr)) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2516 43 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_dmultiToExpr = fun clauses -> (match v_Vuna_dCompiler_dElab_darityOf clauses with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ("DT: function has no clauses")
  | C_Base_dMaybe_dJust (n) -> (let names = v_Vuna_dCompiler_dElab_dparamNames n in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dbuildColumnExpr clauses names 200) (fun body -> C_Base_dResult_dOk (v_Vuna_dCompiler_dElab_dwrapLambdas names body)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2287 23 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_delabFunDef = fun globals ec clauses expected sp -> (match clauses with
  | [] -> v_Vuna_dCompiler_dElab_derrAt sp "DT: function has no clauses"
  | (C_Base_dPair_dPair (pats, body)) :: ([]) -> v_Vuna_dCompiler_dElab_dcheckDef globals ec pats body expected sp
  | _ -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dmultiToExpr clauses) (fun bodyExpr -> v_Vuna_dCompiler_dElab_dcheckDef globals ec [] bodyExpr expected sp)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2281 45 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabBodies = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | ([], globals, doneDefs, acc, ec) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse acc, ec))
  | ((d) :: (rest), globals, doneDefs, acc, ec) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> (match v_Vuna_dCompiler_dElab_dglobalLookup name globals with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dElab_derrAt sp ((("DT: expected a type signature for ") ^ (name)))
  | C_Base_dMaybe_dJust (tyTerm) -> if v_Vuna_dCompiler_dElab_dmemDefName name doneDefs then v_Vuna_dCompiler_dElab_delabBodies rest globals doneDefs acc ec else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabFunDef globals ec (v_Vuna_dCompiler_dAst_dclausesFor ((d) :: (rest)) name) (v_Vuna_dCompiler_dCore_deval [] tyTerm) sp) (fun p -> (match p with
  | C_Base_dPair_dPair (bodyTerm, ec1) -> v_Vuna_dCompiler_dElab_delabBodies rest globals ((C_Base_dPair_dPair (name, tyTerm)) :: (doneDefs)) ((C_Vuna_dCompiler_dElab_dDtDef (name, tyTerm, bodyTerm)) :: (acc)) (v_Vuna_dCompiler_dElab_decAddDef ec1 (C_Base_dPair_dPair (name, bodyTerm)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1194 99 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1191 29 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dElab_delabBodies rest globals doneDefs acc ec
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1190 50 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1189 1 ("no matching clause for Vuna.Compiler.Elab.elabBodies")

let v_Vuna_dCompiler_dElab_dhasFamParams = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEPi (n, implicit, dom, cod, sp) -> true
  | _ -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 2524 18 ("case pattern match failure"))

let v_Vuna_dCompiler_dElab_delabCtor = fun globals fam arity ec c -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor (cname, tyExpr, arityHint, csp) -> (let famKind = (match v_Vuna_dCompiler_dElab_dglobalLookup fam globals with
  | C_Base_dMaybe_dJust (k) -> k
  | C_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dCore_dTType (v_Vuna_dCompiler_dCore_dlevelZero)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 401 17 ("case pattern match failure")) in let tyExpr2 = if v_Vuna_dCompiler_dElab_dhasFamParams tyExpr then tyExpr else v_Vuna_dCompiler_dElab_dprependFamParams famKind tyExpr csp in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals v_Vuna_dCompiler_dElab_demptyCtx ec tyExpr2) (fun pk -> (match pk with
  | C_Base_dPair_dPair (tyTerm, C_Base_dPair_dPair (sort, ec1)) -> (match v_Vuna_dCompiler_dElab_dresultSpine (v_Vuna_dCompiler_dElab_ddropParams tyTerm) with
  | C_Base_dPair_dPair (head, args) -> if v_vuna_uneq_ustr head fam then v_Vuna_dCompiler_dElab_derrAt csp ((let vuna_cat0' = ("DT: constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" does not return ") in (let vuna_cat3' = (fam) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else if v_vuna_uneq_uint (v_Base_dList_dlength args) arity then v_Vuna_dCompiler_dElab_derrAt csp ((let vuna_cat0' = ("DT: constructor ") in (let vuna_cat1' = (cname) in (let vuna_cat2' = (" has the wrong number of indices for ") in (let vuna_cat3' = (fam) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dElab_dDtCtor (cname, fam, v_Vuna_dCompiler_dElab_dteleOfType tyTerm, tyTerm), ec1))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 406 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 405 64 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 396 35 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabCtors = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (globals, fam, arity, ec, []) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], ec))
  | (globals, fam, arity, ec, (c) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCtor globals fam arity ec c) (fun p -> (match p with
  | C_Base_dPair_dPair (dc, ec1) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCtors globals fam arity ec1 rest) (fun q -> (match q with
  | C_Base_dPair_dPair (dcs, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((dc) :: (dcs), ec2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 428 72 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 427 95 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 426 1 ("no matching clause for Vuna.Compiler.Elab.elabCtors")

let v_Vuna_dCompiler_dElab_delabData = fun globals ec ds -> (match ds with
  | C_Base_dPair_dPair (d, dsp) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, writtenParams, kindExpr, ctors, derivings, dsp2) -> if v_Base_dList_dmemName dname v_Vuna_dCompiler_dDtPrelude_dpreludeNames then v_Vuna_dCompiler_dElab_derrAt dsp2 ((("DT: cannot redefine builtin ") ^ (dname))) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckType globals v_Vuna_dCompiler_dElab_demptyCtx ec kindExpr) (fun pk -> (match pk with
  | C_Base_dPair_dPair (kindTerm, C_Base_dPair_dPair (kindSort, ec1)) -> (let fullKind = v_Vuna_dCompiler_dDtPrelude_dprependParams writtenParams kindTerm in let tele = v_Vuna_dCompiler_dElab_dsplitKind fullKind in let arity = v_Base_dList_dlength tele in if v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dkindWellFormed fullKind) then v_Vuna_dCompiler_dElab_derrAt dsp2 "DT: the kind of a data declaration must be a chain of arrows ending in Type" else (let globals2 = v_Base_dList_dappend globals ((C_Base_dPair_dPair (dname, fullKind)) :: ([])) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabCtors globals2 dname arity ec1 ctors) (fun q -> (match q with
  | C_Base_dPair_dPair (dctors, ec2) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dElab_dDtData (dname, tele, dctors), C_Base_dPair_dPair (v_Base_dList_dappend globals2 (v_Vuna_dCompiler_dElab_dctorGlobals dctors), v_Vuna_dCompiler_dElab_decAddData ec2 (C_Vuna_dCompiler_dElab_dDtData (dname, tele, dctors)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 454 72 ("case pattern match failure")))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 442 67 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 440 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 439 26 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dElab_delabDatas = fun a0 a1 a2 -> match (a0, a1, a2) with
  | ([], globals, ec) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], C_Base_dPair_dPair (globals, ec)))
  | ((ds) :: (rest), globals, ec) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabData globals ec ds) (fun p -> (match p with
  | C_Base_dPair_dPair (dd, C_Base_dPair_dPair (globals2, ec2)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabDatas rest globals2 ec2) (fun q -> (match q with
  | C_Base_dPair_dPair (dds, C_Base_dPair_dPair (globals3, ec3)) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((dd) :: (dds), C_Base_dPair_dPair (globals3, ec3)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 465 79 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 464 77 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 463 1 ("no matching clause for Vuna.Compiler.Elab.elabDatas")

let v_Vuna_dCompiler_dElab_delabProgramGo = fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcollectSigs decls) (fun sigs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabDatas (v_Vuna_dCompiler_dElab_dcollectDataDecls decls []) (v_Vuna_dCompiler_dDtPrelude_dpreludeGlobals ()) v_Vuna_dCompiler_dElab_decEmpty) (fun pd -> (match pd with
  | C_Base_dPair_dPair (datas, C_Base_dPair_dPair (globals0, ec0)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabTraits (v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dcollectTraitDecls (v_Vuna_dCompiler_dDtDerive_dbuiltinTraitDecls ()) []) (v_Vuna_dCompiler_dElab_dcollectTraitDecls decls [])) globals0 ec0) (fun pt -> (match pt with
  | C_Base_dPair_dPair (classDatas, C_Base_dPair_dPair (projGlobals, C_Base_dPair_dPair (classes, ec1))) -> (let globals1 = v_Base_dList_dappend globals0 projGlobals in let datas1 = v_Base_dList_dappend datas classDatas in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckInstanceHeads (v_Vuna_dCompiler_dElab_dcollectInstDecls decls []) classes globals1 ec1) (fun pih -> (match pih with
  | C_Base_dPair_dPair (instHeads, ec1b) -> (let globals2 = v_Base_dList_dappend globals1 instHeads in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabSigs sigs globals2 ec1b) (fun p -> (match p with
  | C_Base_dPair_dPair (globals, ec2) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckAllDefined sigs globals decls) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabBodies decls globals [] [] ec2) (fun q -> (match q with
  | C_Base_dPair_dPair (defs, ec3) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabInstanceBodies (v_Vuna_dCompiler_dElab_dcollectInstDecls (v_Base_dList_dappend (v_Vuna_dCompiler_dDtDerive_dbuiltinShowInstances ()) decls) []) classes datas1 globals ec3) (fun pi -> (match pi with
  | C_Base_dPair_dPair (instDefs, ec4) -> (match v_Vuna_dCompiler_dElab_dunsolvedMeta ec4 with
  | C_Base_dMaybe_dJust (m) -> C_Base_dResult_dErr (v_Vuna_dCompiler_dElab_dunsolvedMessage ec4 m)
  | C_Base_dMaybe_dNothing -> (let extra = v_Vuna_dCompiler_dElab_dextraDefsOf globals ec4 (v_Base_dList_dappend instDefs defs) in v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckTerminationDecls decls) (fun _u -> C_Base_dResult_dOk (C_Vuna_dCompiler_dElab_dDtProgram (datas1, v_Base_dList_dappend instDefs (v_Base_dList_dappend extra defs), v_Vuna_dCompiler_dElab_decGoals ec4, v_Vuna_dCompiler_dElab_decSols ec4))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1246 38 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1245 154 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1244 137 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1243 59 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1239 97 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1234 158 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Elab.vuna" 1233 140 ("case pattern match failure"))))

let v_Vuna_dCompiler_dElab_delabProgramFull = fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_dprepareDecls decls) (fun ds -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dexpandDerivings ds) (fun ds2 -> v_Vuna_dCompiler_dElab_delabProgramGo ds2))

let v_Vuna_dCompiler_dElab_dgoalsOfProgram = fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgramFull decls) (fun prog -> C_Base_dResult_dOk (v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dgoalInfoOf (v_Vuna_dCompiler_dElab_ddtProgSols prog)) (v_Vuna_dCompiler_dElab_ddtProgGoals prog)))

let v_Vuna_dCompiler_dElab_delabProgram = fun decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgramFull decls) (fun prog -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dElab_ddtProgDatas prog, v_Vuna_dCompiler_dElab_ddtProgDefs prog)))

let v_vuna_ueq_uVuna_uCompiler_uElab_uPending = fun x y -> (match x with
  | C_Vuna_dCompiler_dElab_dPending (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dElab_dPending (w0, w1) -> (if (v_vuna_ueq_uVuna_uCompiler_uAst_uPat v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 21 39 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 20 42 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uElab_uPending = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uElab_uPending x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uElab_uBindAcc = fun x y -> (match x with
  | C_Vuna_dCompiler_dElab_dBindAcc (v0, v1) -> (match y with
  | C_Vuna_dCompiler_dElab_dBindAcc (w0, w1) -> (if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_uBase_uList_uList v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 30 39 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 29 42 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uElab_uBindAcc = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uElab_uBindAcc x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uElab_uDtGoalInfo = fun x y -> (match x with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uCompiler_uCommon_uSpan v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uBase_uList_uList v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 39 45 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 38 45 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uElab_uDtGoalInfo = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uElab_uDtGoalInfo x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
