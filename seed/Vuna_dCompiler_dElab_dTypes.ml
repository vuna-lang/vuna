open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dDebug
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor of (string) * (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtData = C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData of (string) * ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtCtor t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal of (int) * (t_Vuna_dCompiler_dCommon_dSpan) * (t_Vuna_dCompiler_dCore_dTerm_dValue) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass of (string) * (string t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst of (string) * (t_Vuna_dCompiler_dCore_dTerm_dTerm) * (bool)
and t_Vuna_dCompiler_dElab_dTypes_dDtDictGoal = C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal of (int) * (t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dTypes_dEc = C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc of (int) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtData t_Base_dList_dList) * ((int, int) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDictGoal t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Vuna_dCompiler_dCommon_dHashTbl) * (t_Vuna_dCompiler_dCore_dTerm_dTerm t_Vuna_dCompiler_dCommon_dHashTbl) * (t_Vuna_dCompiler_dCore_dTerm_dValue t_Vuna_dCompiler_dCommon_dHashTbl) * (int t_Vuna_dCompiler_dCommon_dHashTbl) * (bool) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat t_Base_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) t_Base_dPair_dPair t_Base_dList_dList t_Vuna_dCompiler_dCommon_dHashTbl)
and t_Vuna_dCompiler_dElab_dTypes_dCtx = C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx of ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtProgram = C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram of (t_Vuna_dCompiler_dElab_dTypes_dDtData t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDef t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal t_Base_dList_dList) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass t_Base_dList_dList) * (int)

let v_Vuna_dCompiler_dElab_dTypes_ddtDefName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__0, dtb__1, dtb__2) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__3, dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__6, dtb__7, dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__9, dtb__10, dtb__11, dtb__12) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtCtorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__25, dtb__26, dtb__27) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__28, dtb__29, dtb__30) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__31, dtb__32, dtb__33) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__42, dtb__43, dtb__44, dtb__45) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtGoalCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__50, dtb__51, dtb__52, dtb__53) -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__54, dtb__55, dtb__56, dtb__57) -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassMethods = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__58, dtb__59, dtb__60, dtb__61) -> dtb__60
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__66, dtb__67, dtb__68) -> dtb__66
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__69, dtb__70, dtb__71) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstNamed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__72, dtb__73, dtb__74) -> dtb__74
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClausesTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__89
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> dtb__105
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> (v_Base_dList_dreverse dtb__137)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> dtb__175
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, mc1, dtb__191, dtb__192, dtb__193, dtb__194))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__198
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224) -> dtb__222
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsComplete = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239) -> dtb__238
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, mc1, dtb__254))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decDepthOfMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__255, dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266, dtb__267, dtb__268, dtb__269) -> dtb__259
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> dtb__275
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> dtb__291
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> dtb__307
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, ((v_Base_dList_dappend dtb__320) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__330, dtb__331) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__330)) mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__331))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, ((v_Base_dList_dappend dtb__338) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec -> (fun i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i))))

let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, ((v_Base_dList_dappend dtb__354) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decDictGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> dtb__370
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, mc1, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, ((v_Base_dList_dappend dtb__400) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decEmpty = fun () -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (0, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, (v_Vuna_dCompiler_dCommon_dtblEmpty ()), (v_Vuna_dCompiler_dCommon_dtblEmpty ()), (v_Vuna_dCompiler_dCommon_dtblEmpty ()), (v_Vuna_dCompiler_dCommon_dtblEmpty ()), false, (v_Vuna_dCompiler_dCommon_dtblEmpty ())))

let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__407, dtb__408, dtb__409, dtb__410, dtb__411, dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420, dtb__421) -> dtb__418
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> (C_Vuna_dCompiler_dCore_dTerm_dSols_Vuna_dCompiler_dCore_dTerm_dSols ((v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec), (v_Vuna_dCompiler_dElab_dTypes_decSols ec))))

let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__422, dtb__423, dtb__424, dtb__425, dtb__426, dtb__427, dtb__428, dtb__429, dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__422, mc1, dtb__424, dtb__425, dtb__426, dtb__427, dtb__428, dtb__429, dtb__430, dtb__431, dtb__432, mc2, dtb__434, dtb__435, dtb__436))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun pid -> (fun cur -> (match cur with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__437, dtb__438) -> (match dtb__437 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__439, dtb__440) -> (if ((bi_eq_int dtb__439) pid) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__439, dtb__440)), ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId pid) dtb__438))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun old -> (fun cur -> (match old with
  | C_Base_dList_dList_Nil -> cur
  | C_Base_dList_dList_Cons (dtb__441, dtb__442) -> (match dtb__441 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__443, dtb__444) -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__443) cur)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec -> (fun sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) delta)) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2))))

let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__445, dtb__446, (C_Base_dList_dList_Cons (mc1, dtb__447)), dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, (((v_Vuna_dCompiler_dCommon_dtblInsert (v_Base_dPair_dfirstOf mc1)) (v_Base_dPair_dsecondOf mc1)) dtb__454), dtb__455, dtb__456, dtb__457, dtb__458, dtb__459))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__460, dtb__461, dtb__462, dtb__463, dtb__464, dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473, dtb__474) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__460, dtb__461, dtb__462, ((v_Base_dList_dappend dtb__463) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__464, dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473, dtb__474))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dctxItems = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__475, dtb__476) -> dtb__475
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)))

let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__477, dtb__478) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__477)), dtb__478))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun name -> (fun dom -> (fun ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom)) ctx))))

let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__479, dtb__480) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__479, ((v_Base_dList_dappend dtb__480) mc1)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__481, dtb__482) -> (match dtb__481 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__483, dtb__484) -> (if ((bi_eq_str dtb__483) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (mc2, dtb__484)))) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__482) ((bi_add mc2) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name -> (fun ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)) 0)))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__485, dtb__486) -> (match dtb__485 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__487, dtb__488) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__487, ((bi_sub ((bi_sub mc2) mc1)) 1), C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__486) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__489, dtb__490) -> (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__489) 0) (v_Base_dList_dlength dtb__489))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__491, dtb__492) -> (match dtb__491 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__493, dtb__494) -> (if ((bi_eq_int dtb__493) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__494)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__492))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__495) -> (match dtb__495 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__496, dtb__497, dtb__498) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__497) refs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__499) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__499)) sp2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__496, dtb__497, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__498))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__500, dtb__501) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__500, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__501)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__502, dtb__503) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__502, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__503)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__504, dtb__505) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__504), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__505)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__506, dtb__507) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__506), dtb__507))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__508, dtb__509, dtb__510) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__508), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__509), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__510)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__511, dtb__512) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__511, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__512)))
  | _ -> v
)))))

let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__513, dtb__514) -> ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__514) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ()))) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__513) 0) (v_Base_dList_dlength dtb__513)))) mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__515, dtb__516) -> ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__516) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ()))) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__515) 0) (v_Base_dList_dlength dtb__515)))) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) ((bi_add mc1) 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = fun () -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp -> (fun msg -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": ") msg))))))

let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__517, dtb__518, dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527, dtb__528, dtb__529, dtb__530, dtb__531) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__517)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (((bi_add dtb__517) 1), dtb__518, dtb__519, dtb__520, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__517, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__521)), dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527, dtb__528, (((v_Vuna_dCompiler_dCommon_dtblInsert (bi_strFromInt dtb__517)) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__529), dtb__530, dtb__531))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__532, dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539, dtb__540, dtb__541, dtb__542, dtb__543, dtb__544, dtb__545, dtb__546) -> ((fun goal -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__532)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (((bi_add dtb__532) 1), dtb__533, dtb__534, dtb__535, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__532, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__536)), ((v_Base_dList_dappend dtb__537) (C_Base_dList_dList_Cons (goal, C_Base_dList_dList_Nil))), dtb__538, dtb__539, dtb__540, dtb__541, dtb__542, dtb__543, (((v_Vuna_dCompiler_dCommon_dtblInsert (bi_strFromInt dtb__532)) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__544), dtb__545, dtb__546))))) (C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__532, mc2, mc3, (v_Vuna_dCompiler_dElab_dTypes_dctxItems mc0))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec -> (fun v -> ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) v)))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__547, dtb__548, dtb__549, dtb__550, dtb__551, dtb__552, dtb__553, dtb__554) -> dtb__547
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, dtb__560, dtb__561, dtb__562) -> dtb__556
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567, dtb__568, dtb__569, dtb__570) -> dtb__565
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__571, dtb__572, dtb__573, dtb__574, dtb__575, dtb__576, dtb__577, dtb__578) -> dtb__574
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__579, dtb__580, dtb__581, dtb__582, dtb__583, dtb__584, dtb__585, dtb__586) -> dtb__583
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__587, dtb__588, dtb__589, dtb__590, dtb__591, dtb__592, dtb__593, dtb__594) -> dtb__592
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__595, dtb__596, dtb__597, dtb__598, dtb__599, dtb__600, dtb__601, dtb__602) -> dtb__601
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__603, dtb__604, dtb__605, dtb__606, dtb__607, dtb__608, dtb__609, dtb__610) -> dtb__610
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) sols)) (v_Vuna_dCompiler_dCommon_dtblEmpty ())))
