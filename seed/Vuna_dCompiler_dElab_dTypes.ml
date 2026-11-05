open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCommon_dSpan t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCommon_dSpan t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * (t_Vuna_dCompiler_dCommon_dSpan t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor of (string) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtData = C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtCtor t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal of (int) * (t_Vuna_dCompiler_dCommon_dSpan) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass of (string) * (string t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtDictGoal = C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dTypes_dEc = C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc of (int) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtData t_Base_dList_dList) * ((int, int) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDictGoal t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Base_dHashMap_dHashMap) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Base_dHashMap_dHashMap) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dIntMap_dIntMap) * (int t_Base_dIntMap_dIntMap) * (bool) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList t_Base_dHashMap_dHashMap) * (t_Vuna_dCompiler_dElab_dTypes_dDtCtor t_Base_dHashMap_dHashMap) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dHashMap_dHashMap)
and t_Vuna_dCompiler_dElab_dTypes_dCtx = C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx of ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtProgram = C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram of (t_Vuna_dCompiler_dElab_dTypes_dDtData t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDef t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal t_Base_dList_dList) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass t_Base_dList_dList) * (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Base_dHashMap_dHashMap) * ((int, int) t_Base_dPair_dPair t_Base_dList_dList)

let v_Vuna_dCompiler_dElab_dTypes_ddtDefName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__0, dtb__1, dtb__2, dtb__3) -> dtb__0
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__4, dtb__5, dtb__6) -> dtb__4
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__7, dtb__8, dtb__9, dtb__10) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__15, dtb__16, dtb__17) -> dtb__16
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__22, dtb__23, dtb__24, dtb__25) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__26, dtb__27, dtb__28) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__29, dtb__30, dtb__31, dtb__32) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__31))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__33, dtb__34, dtb__35, dtb__36) -> true
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__37, dtb__38, dtb__39) -> false
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__40, dtb__41, dtb__42, dtb__43) -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__44, dtb__45, dtb__46, dtb__47) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__46))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__52, dtb__53, dtb__54) -> dtb__54
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__55, dtb__56, dtb__57, dtb__58) -> dtb__58
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__59, dtb__60, dtb__61, dtb__62) -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__63, dtb__64, dtb__65, dtb__66) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__67, dtb__68, dtb__69, dtb__70) -> dtb__69
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__75, dtb__76, dtb__77, dtb__78) -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__79, dtb__80, dtb__81, dtb__82) -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__87, dtb__88, dtb__89, dtb__90) -> dtb__90
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__91, dtb__92, dtb__93, dtb__94) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__95, dtb__96, dtb__97, dtb__98) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__101
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__103, dtb__104, dtb__105, dtb__106) -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__107
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__117
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__123, dtb__124, dtb__125, dtb__126) -> dtb__123
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstTele = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__127, dtb__128, dtb__129, dtb__130) -> dtb__128
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__133
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__138
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutNext = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (mc1, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClausesTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> dtb__170
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, mc1, dtb__188, dtb__189))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> dtb__190
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> dtb__208
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> (v_Base_dList_dreverse dtb__226)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257) -> dtb__250
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274) -> dtb__268
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283, dtb__284, mc1, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__292, dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307, dtb__308) -> dtb__295
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325) -> dtb__321
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsComplete = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__326, dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342) -> dtb__339
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, dtb__354, dtb__355, mc1, dtb__357, dtb__358, dtb__359))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthOfMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__360, dtb__361, dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> dtb__364
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392, dtb__393) -> dtb__382
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> dtb__400
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422, dtb__423, dtb__424, dtb__425, dtb__426, dtb__427) -> dtb__418
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__428, dtb__429, dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__428, dtb__429, dtb__430, dtb__431, dtb__432, ((v_Base_dList_dappend dtb__433) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil))), dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__445, dtb__446) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__445) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__446))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__447, dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__447, dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, ((v_Base_dList_dappend dtb__453) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil))), dtb__454, dtb__455, dtb__456, dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i)))

let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__464, dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473, dtb__474, dtb__475, dtb__476, dtb__477, dtb__478, dtb__479, dtb__480) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__464, dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, ((v_Base_dList_dappend dtb__471) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil))), dtb__472, dtb__473, dtb__474, dtb__475, dtb__476, dtb__477, dtb__478, dtb__479, dtb__480))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDictGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__481, dtb__482, dtb__483, dtb__484, dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490, dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496, dtb__497) -> dtb__489
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__498, dtb__499, dtb__500, dtb__501, dtb__502, dtb__503, dtb__504, dtb__505, dtb__506, dtb__507, dtb__508, dtb__509, dtb__510, dtb__511, dtb__512, dtb__513, dtb__514) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__498, dtb__499, dtb__500, dtb__501, dtb__502, dtb__503, dtb__504, dtb__505, mc1, dtb__507, dtb__508, dtb__509, dtb__510, dtb__511, dtb__512, dtb__513, dtb__514))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__515, dtb__516, dtb__517, dtb__518, dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527, dtb__528, dtb__529, dtb__530, dtb__531) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__515, dtb__516, dtb__517, dtb__518, dtb__519, dtb__520, dtb__521, dtb__522, ((v_Base_dList_dappend dtb__523) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil))), dtb__524, dtb__525, dtb__526, dtb__527, dtb__528, dtb__529, dtb__530, dtb__531))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decEmpty = (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (0, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil), (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil), (v_Base_dIntMap_dfromList C_Base_dList_dList_Base_dList_dNil), (v_Base_dIntMap_dfromList C_Base_dList_dList_Base_dList_dNil), false, (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil), (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil), (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__532, dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539, dtb__540, dtb__541, dtb__542, dtb__543, dtb__544, dtb__545, dtb__546, dtb__547, dtb__548) -> dtb__543
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__549, dtb__550, dtb__551, dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, dtb__560, dtb__561, dtb__562, dtb__563, dtb__564, dtb__565) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__549, mc1, dtb__551, dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, mc2, dtb__561, dtb__562, dtb__563, dtb__564, dtb__565))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__566, dtb__567) -> (match dtb__566 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__568, dtb__569) -> (if (dtb__568 = mc0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__568, dtb__569)), ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId mc0) dtb__567))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__570, dtb__571) -> (match dtb__570 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__572, dtb__573) -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__572) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) ((v_Base_dIntMap_dinsertAll delta) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2)))

let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__574, dtb__575, dtb__576, dtb__577, dtb__578, dtb__579, dtb__580, dtb__581, dtb__582, dtb__583, dtb__584, dtb__585, dtb__586, dtb__587, dtb__588, dtb__589, dtb__590) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__574, dtb__575, (C_Base_dList_dList_Base_dList_dCons (mc1, dtb__576)), dtb__577, dtb__578, dtb__579, dtb__580, dtb__581, dtb__582, (((v_Base_dHashMap_dinsert (v_Base_dPair_dfirstOf mc1)) (v_Base_dPair_dsecondOf mc1)) dtb__583), dtb__584, dtb__585, dtb__586, dtb__587, dtb__588, dtb__589, dtb__590))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs = (fun d -> ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), c)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__591, dtb__592, dtb__593, dtb__594, dtb__595, dtb__596, dtb__597, dtb__598, dtb__599, dtb__600, dtb__601, dtb__602, dtb__603, dtb__604, dtb__605, dtb__606, dtb__607) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__591, dtb__592, dtb__593, ((v_Base_dList_dappend dtb__594) (C_Base_dList_dList_Base_dList_dCons (mc1, C_Base_dList_dList_Base_dList_dNil))), dtb__595, dtb__596, dtb__597, dtb__598, dtb__599, dtb__600, dtb__601, dtb__602, dtb__603, dtb__604, dtb__605, ((v_Base_dHashMap_dinsertAll (v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs mc1)) dtb__606), dtb__607))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas = (fun datas -> ((v_Base_dHashMap_dinsertAll ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs) datas)) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTypes_decCtorTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__608, dtb__609, dtb__610, dtb__611, dtb__612, dtb__613, dtb__614, dtb__615, dtb__616, dtb__617, dtb__618, dtb__619, dtb__620, dtb__621, dtb__622, dtb__623, dtb__624) -> dtb__623
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__625, dtb__626, dtb__627, dtb__628, dtb__629, dtb__630, dtb__631, dtb__632, dtb__633, dtb__634, dtb__635, dtb__636, dtb__637, dtb__638, dtb__639, dtb__640, dtb__641) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__625, dtb__626, dtb__627, dtb__628, dtb__629, dtb__630, dtb__631, dtb__632, dtb__633, dtb__634, dtb__635, dtb__636, dtb__637, dtb__638, dtb__639, mc1, dtb__641))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefVals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__642, dtb__643, dtb__644, dtb__645, dtb__646, dtb__647, dtb__648, dtb__649, dtb__650, dtb__651, dtb__652, dtb__653, dtb__654, dtb__655, dtb__656, dtb__657, dtb__658) -> dtb__658
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> ((((v_Vuna_dCompiler_dCore_dTerm_dsolsOf (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__659, dtb__660, dtb__661, dtb__662, dtb__663, dtb__664, dtb__665, dtb__666, dtb__667, dtb__668, dtb__669, dtb__670, dtb__671, dtb__672, dtb__673, dtb__674, dtb__675) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__659, dtb__660, dtb__661, dtb__662, dtb__663, dtb__664, dtb__665, dtb__666, dtb__667, dtb__668, dtb__669, dtb__670, dtb__671, dtb__672, dtb__673, dtb__674, mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxItems = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__676, dtb__677) -> dtb__676
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)))

let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__678, dtb__679) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__678)), dtb__679))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun name dom ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom)) ctx))

let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__680, dtb__681) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__680, ((v_Base_dList_dappend dtb__681) mc1)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__682, dtb__683) -> (match dtb__682 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__684, dtb__685) -> (if (dtb__684 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (mc2, dtb__685)))) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__683) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)) 0))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__686, dtb__687) -> (match dtb__686 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__688, dtb__689) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__688, ((mc2 - mc1) - 1), C_Base_dList_dList_Base_dList_dNil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__687) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__690, dtb__691) -> (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__690) 0) (v_Base_dList_dlength dtb__690))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__692, dtb__693) -> (match dtb__692 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__694, dtb__695) -> (if (dtb__694 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__695)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__693))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs fuel v -> (if (fuel <= 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__696) -> (match dtb__696 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__697, dtb__698, dtb__699) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__698) refs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__700) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__700)) sp2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__697, dtb__698, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__699))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__701, dtb__702) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__701, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__702)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__703, dtb__704) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__703, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__704)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__705, dtb__706) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__705), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__706)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__707, dtb__708) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__707), dtb__708))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__709, dtb__710, dtb__711) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__709), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__710), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__711)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__712, dtb__713) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__712, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__713)))
  | _ -> v
)))

let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__714, dtb__715) -> ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__715) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__714) 0) (v_Base_dList_dlength dtb__714)))) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__716, dtb__717) -> ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__717) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__716) 0) (v_Base_dList_dlength dtb__716)))) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp msg -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": "; msg]))))

let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__718, dtb__719, dtb__720, dtb__721, dtb__722, dtb__723, dtb__724, dtb__725, dtb__726, dtb__727, dtb__728, dtb__729, dtb__730, dtb__731, dtb__732, dtb__733, dtb__734) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__718)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc ((dtb__718 + 1), dtb__719, dtb__720, dtb__721, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__718, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__722)), dtb__723, dtb__724, dtb__725, dtb__726, dtb__727, dtb__728, dtb__729, (((v_Base_dIntMap_dinsert dtb__718) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__730), dtb__731, dtb__732, dtb__733, dtb__734))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__735, dtb__736, dtb__737, dtb__738, dtb__739, dtb__740, dtb__741, dtb__742, dtb__743, dtb__744, dtb__745, dtb__746, dtb__747, dtb__748, dtb__749, dtb__750, dtb__751) -> ((fun goal -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__735)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc ((dtb__735 + 1), dtb__736, dtb__737, dtb__738, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__735, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__739)), ((v_Base_dList_dappend dtb__740) (C_Base_dList_dList_Base_dList_dCons (goal, C_Base_dList_dList_Base_dList_dNil))), dtb__741, dtb__742, dtb__743, dtb__744, dtb__745, dtb__746, (((v_Base_dIntMap_dinsert dtb__735) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__747), dtb__748, dtb__749, dtb__750, dtb__751))))) (C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__735, mc2, mc3, (v_Vuna_dCompiler_dElab_dTypes_dctxItems mc0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec v -> ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__752, dtb__753, dtb__754, dtb__755, dtb__756, dtb__757, dtb__758, dtb__759, dtb__760, dtb__761) -> dtb__752
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__762, dtb__763, dtb__764, dtb__765, dtb__766, dtb__767, dtb__768, dtb__769, dtb__770, dtb__771) -> dtb__763
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefVals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__772, dtb__773, dtb__774, dtb__775, dtb__776, dtb__777, dtb__778, dtb__779, dtb__780, dtb__781) -> dtb__780
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__782, dtb__783, dtb__784, dtb__785, dtb__786, dtb__787, dtb__788, dtb__789, dtb__790, dtb__791) -> dtb__784
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__792, dtb__793, dtb__794, dtb__795, dtb__796, dtb__797, dtb__798, dtb__799, dtb__800, dtb__801) -> dtb__795
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__802, dtb__803, dtb__804, dtb__805, dtb__806, dtb__807, dtb__808, dtb__809, dtb__810, dtb__811) -> dtb__806
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__812, dtb__813, dtb__814, dtb__815, dtb__816, dtb__817, dtb__818, dtb__819, dtb__820, dtb__821) -> dtb__817
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__822, dtb__823, dtb__824, dtb__825, dtb__826, dtb__827, dtb__828, dtb__829, dtb__830, dtb__831) -> dtb__828
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__832, dtb__833, dtb__834, dtb__835, dtb__836, dtb__837, dtb__838, dtb__839, dtb__840, dtb__841) -> dtb__839
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> ((v_Base_dIntMap_dinsertAll sols) (v_Base_dIntMap_dfromList C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDepths = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__842, dtb__843, dtb__844, dtb__845, dtb__846, dtb__847, dtb__848, dtb__849, dtb__850, dtb__851) -> dtb__851
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__852, dtb__853, dtb__854, dtb__855, dtb__856, dtb__857, dtb__858, dtb__859, dtb__860, dtb__861, dtb__862, dtb__863, dtb__864, dtb__865, dtb__866, dtb__867, dtb__868) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__852, dtb__853, dtb__854, dtb__855, dtb__856, dtb__857, dtb__858, dtb__859, dtb__860, mc1, dtb__862, dtb__863, dtb__864, dtb__865, dtb__866, dtb__867, dtb__868))
  | _ -> failwith "DT: impossible branch"
))
