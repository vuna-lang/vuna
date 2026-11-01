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
and t_Vuna_dCompiler_dElab_dDtInst
and t_Vuna_dCompiler_dElab_dEc
and t_Vuna_dCompiler_dElab_dCtx
and t_Vuna_dCompiler_dElab_dPending
and t_Vuna_dCompiler_dElab_dBindAcc
and   t_Vuna_dCompiler_dElab_dDtProgram =
    C_Vuna_dCompiler_dElab_dDtProgram of ((t_Vuna_dCompiler_dElab_dDtData) list) * ((t_Vuna_dCompiler_dElab_dDtDef) list) * ((t_Vuna_dCompiler_dElab_dDtGoal) list) * (((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list)
and   t_Vuna_dCompiler_dElab_dDtGoalInfo =
    C_Vuna_dCompiler_dElab_dDtGoalInfo of (t_Vuna_dCompiler_dCommon_dSpan) * (string) * (((string, string) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtDefName : (t_Vuna_dCompiler_dElab_dDtDef) -> (string)
val v_Vuna_dCompiler_dElab_ddtDefType : (t_Vuna_dCompiler_dElab_dDtDef) -> (t_Vuna_dCompiler_dCore_dTerm)
val v_Vuna_dCompiler_dElab_ddtDefBody : (t_Vuna_dCompiler_dElab_dDtDef) -> (t_Vuna_dCompiler_dCore_dTerm)
val v_Vuna_dCompiler_dElab_ddtCtorName : (t_Vuna_dCompiler_dElab_dDtCtor) -> (string)
val v_Vuna_dCompiler_dElab_ddtCtorFamily : (t_Vuna_dCompiler_dElab_dDtCtor) -> (string)
val v_Vuna_dCompiler_dElab_ddtCtorTelescope : (t_Vuna_dCompiler_dElab_dDtCtor) -> (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtCtorType : (t_Vuna_dCompiler_dElab_dDtCtor) -> (t_Vuna_dCompiler_dCore_dTerm)
val v_Vuna_dCompiler_dElab_ddtDataName : (t_Vuna_dCompiler_dElab_dDtData) -> (string)
val v_Vuna_dCompiler_dElab_ddtDataParams : (t_Vuna_dCompiler_dElab_dDtData) -> (((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtDataCtors : (t_Vuna_dCompiler_dElab_dDtData) -> ((t_Vuna_dCompiler_dElab_dDtCtor) list)
val v_Vuna_dCompiler_dElab_ddtClassName : (t_Vuna_dCompiler_dElab_dDtClass) -> (string)
val v_Vuna_dCompiler_dElab_ddtClassParams : (t_Vuna_dCompiler_dElab_dDtClass) -> ((string) list)
val v_Vuna_dCompiler_dElab_ddtClassMethods : (t_Vuna_dCompiler_dElab_dDtClass) -> (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtClassFieldTys : (t_Vuna_dCompiler_dElab_dDtClass) -> ((t_Vuna_dCompiler_dCore_dTerm) list)
val v_Vuna_dCompiler_dElab_ddtGoalMeta : (t_Vuna_dCompiler_dElab_dDtGoal) -> (int)
val v_Vuna_dCompiler_dElab_ddtGoalSpan : (t_Vuna_dCompiler_dElab_dDtGoal) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dElab_ddtGoalType : (t_Vuna_dCompiler_dElab_dDtGoal) -> (t_Vuna_dCompiler_dCore_dValue)
val v_Vuna_dCompiler_dElab_ddtGoalCtx : (t_Vuna_dCompiler_dElab_dDtGoal) -> (((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtProgDatas : (t_Vuna_dCompiler_dElab_dDtProgram) -> ((t_Vuna_dCompiler_dElab_dDtData) list)
val v_Vuna_dCompiler_dElab_ddtProgDefs : (t_Vuna_dCompiler_dElab_dDtProgram) -> ((t_Vuna_dCompiler_dElab_dDtDef) list)
val v_Vuna_dCompiler_dElab_ddtProgGoals : (t_Vuna_dCompiler_dElab_dDtProgram) -> ((t_Vuna_dCompiler_dElab_dDtGoal) list)
val v_Vuna_dCompiler_dElab_ddtProgSols : (t_Vuna_dCompiler_dElab_dDtProgram) -> (((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_ddtGoalInfoSpan : (t_Vuna_dCompiler_dElab_dDtGoalInfo) -> (t_Vuna_dCompiler_dCommon_dSpan)
val v_Vuna_dCompiler_dElab_ddtGoalInfoGoal : (t_Vuna_dCompiler_dElab_dDtGoalInfo) -> (string)
val v_Vuna_dCompiler_dElab_ddtGoalInfoCtx : (t_Vuna_dCompiler_dElab_dDtGoalInfo) -> (((string, string) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dElab_delabProgram : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((((t_Vuna_dCompiler_dElab_dDtData) list, (t_Vuna_dCompiler_dElab_dDtDef) list) t_Base_dPair_dPair) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dElab_delabProgramFull : ((t_Vuna_dCompiler_dAst_dDecl) list) -> ((t_Vuna_dCompiler_dElab_dDtProgram) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dElab_dgoalsOfProgram : ((t_Vuna_dCompiler_dAst_dDecl) list) -> (((t_Vuna_dCompiler_dElab_dDtGoalInfo) list) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dElab_dcheckInstanceHeads : (((t_Vuna_dCompiler_dAst_dDecl, t_Vuna_dCompiler_dCommon_dSpan) t_Base_dPair_dPair) list) -> (((t_Vuna_dCompiler_dElab_dDtClass) list) -> ((((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) -> ((t_Vuna_dCompiler_dElab_dEc) -> (((((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list, t_Vuna_dCompiler_dElab_dEc) t_Base_dPair_dPair) t_Base_dResult_dResult))))
val v_Vuna_dCompiler_dElab_delabInstanceBodies : (((t_Vuna_dCompiler_dAst_dDecl, t_Vuna_dCompiler_dCommon_dSpan) t_Base_dPair_dPair) list) -> (((t_Vuna_dCompiler_dElab_dDtClass) list) -> (((t_Vuna_dCompiler_dElab_dDtData) list) -> ((((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair) list) -> ((t_Vuna_dCompiler_dElab_dEc) -> ((((t_Vuna_dCompiler_dElab_dDtDef) list, t_Vuna_dCompiler_dElab_dEc) t_Base_dPair_dPair) t_Base_dResult_dResult)))))
val v_Vuna_dCompiler_dElab_ddictTypeName : (string) -> (string)
val v_Vuna_dCompiler_dElab_ddictCtorName : (string) -> (string)
val v_Vuna_dCompiler_dElab_deraseIndexMask : (t_Vuna_dCompiler_dElab_dDtData) -> ((bool) list)
val v_Vuna_dCompiler_dElab_dindexErasureCandidates : ((t_Vuna_dCompiler_dElab_dDtData) list) -> (((string, (string) list) t_Base_dPair_dPair) list)
val v_vuna_ueq_uVuna_uCompiler_uElab_uPending : (t_Vuna_dCompiler_dElab_dPending) -> ((t_Vuna_dCompiler_dElab_dPending) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uElab_uPending : (t_Vuna_dCompiler_dElab_dPending) -> ((t_Vuna_dCompiler_dElab_dPending) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uElab_uBindAcc : (t_Vuna_dCompiler_dElab_dBindAcc) -> ((t_Vuna_dCompiler_dElab_dBindAcc) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uElab_uBindAcc : (t_Vuna_dCompiler_dElab_dBindAcc) -> ((t_Vuna_dCompiler_dElab_dBindAcc) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uElab_uDtGoalInfo : (t_Vuna_dCompiler_dElab_dDtGoalInfo) -> ((t_Vuna_dCompiler_dElab_dDtGoalInfo) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uElab_uDtGoalInfo : (t_Vuna_dCompiler_dElab_dDtGoalInfo) -> ((t_Vuna_dCompiler_dElab_dDtGoalInfo) -> (bool))
val show_Vuna_dCompiler_dElab_dDtDef : t_Vuna_dCompiler_dElab_dDtDef -> string
val show_Vuna_dCompiler_dElab_dDtCtor : t_Vuna_dCompiler_dElab_dDtCtor -> string
val show_Vuna_dCompiler_dElab_dDtData : t_Vuna_dCompiler_dElab_dDtData -> string
val show_Vuna_dCompiler_dElab_dDtGoal : t_Vuna_dCompiler_dElab_dDtGoal -> string
val show_Vuna_dCompiler_dElab_dDtClass : t_Vuna_dCompiler_dElab_dDtClass -> string
val show_Vuna_dCompiler_dElab_dDtInst : t_Vuna_dCompiler_dElab_dDtInst -> string
val show_Vuna_dCompiler_dElab_dEc : t_Vuna_dCompiler_dElab_dEc -> string
val show_Vuna_dCompiler_dElab_dCtx : t_Vuna_dCompiler_dElab_dCtx -> string
val show_Vuna_dCompiler_dElab_dPending : t_Vuna_dCompiler_dElab_dPending -> string
val show_Vuna_dCompiler_dElab_dBindAcc : t_Vuna_dCompiler_dElab_dBindAcc -> string
val show_Vuna_dCompiler_dElab_dDtProgram : t_Vuna_dCompiler_dElab_dDtProgram -> string
val show_Vuna_dCompiler_dElab_dDtGoalInfo : t_Vuna_dCompiler_dElab_dDtGoalInfo -> string
