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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
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
and t_Vuna_dCompiler_dElab_dTypes_dEc = C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc of (int) * ((int, t_Vuna_dCompiler_dCore_dTerm_dValue) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtData t_Base_dList_dList) * ((int, int) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDictGoal t_Base_dList_dList) * (bool)
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

let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> dtb__86
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthOfMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> dtb__119
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__130
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, ((v_Base_dList_dappend dtb__160) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__161, dtb__162, dtb__163, dtb__164))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__165, dtb__166) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__165)) mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__166))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, ((v_Base_dList_dappend dtb__173) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__174, dtb__175, dtb__176))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec -> (fun i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i))))

let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, ((v_Base_dList_dappend dtb__184) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__185, dtb__186))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decTrusted = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> dtb__196
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decWithTrust = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, mc0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decDictGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, mc1, dtb__226))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, ((v_Base_dList_dappend dtb__235) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__236))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decEmpty = fun () -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (0, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, false))

let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__237, mc1, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__247, dtb__248, ((v_Base_dList_dappend dtb__249) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__257, dtb__258, dtb__259, ((v_Base_dList_dappend dtb__260) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dctxItems = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__267, dtb__268) -> dtb__267
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)))

let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__269, dtb__270) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__269)), dtb__270))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun name -> (fun dom -> (fun ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) ((v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom)) ctx))))

let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__271, dtb__272) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__271, ((v_Base_dList_dappend dtb__272) mc1)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__273, dtb__274) -> (match dtb__273 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__275, dtb__276) -> (if ((bi_eq_str dtb__275) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (mc2, dtb__276)))) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__274) ((bi_add mc2) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name -> (fun ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (v_Vuna_dCompiler_dElab_dTypes_dctxItems ctx)) 0)))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__277, dtb__278) -> (match dtb__277 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__280) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__279, ((bi_sub ((bi_sub mc2) mc1)) 1), C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__278) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__281, dtb__282) -> (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__281) 0) (v_Base_dList_dlength dtb__281))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__283, dtb__284) -> (match dtb__283 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__285, dtb__286) -> (if ((bi_eq_int dtb__285) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__286)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__284))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__287) -> (match dtb__287 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__288, dtb__289, dtb__290) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__289) refs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__291) -> ((v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__291)) sp2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__288, dtb__289, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__290))
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__292, dtb__293) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__292, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__293)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__294, dtb__295) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__294, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__295)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__296, dtb__297) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__296), dtb__297))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__298, dtb__299, dtb__300) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__298), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__299), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1)) dtb__300)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__301, dtb__302) -> (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__301, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) ((bi_sub fuel) 1))) dtb__302)))
  | _ -> v
)))))

let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__303, dtb__304) -> ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__304) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ()))) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__303) 0) (v_Base_dList_dlength dtb__303)))) mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__305, dtb__306) -> ((v_Vuna_dCompiler_dCore_dEval_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__306) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ()))) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__305) 0) (v_Base_dList_dlength dtb__305)))) (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) ((bi_add mc1) 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = fun () -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp -> (fun msg -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": ") msg))))))

let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__307)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (((bi_add dtb__307) 1), dtb__308, dtb__309, dtb__310, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__311)), dtb__312, dtb__313, dtb__314, dtb__315, dtb__316))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> ((fun goal -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__317)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (((bi_add dtb__317) 1), dtb__318, dtb__319, dtb__320, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__317, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__321)), ((v_Base_dList_dappend dtb__322) (C_Base_dList_dList_Cons (goal, C_Base_dList_dList_Nil))), dtb__323, dtb__324, dtb__325, dtb__326))))) (C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__317, mc2, mc3, (v_Vuna_dCompiler_dElab_dTypes_dctxItems mc0))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec -> (fun v -> ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) v)))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> dtb__327
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342) -> dtb__336
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350) -> dtb__345
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__351, dtb__352, dtb__353, dtb__354, dtb__355, dtb__356, dtb__357, dtb__358) -> dtb__354
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__359, dtb__360, dtb__361, dtb__362, dtb__363, dtb__364, dtb__365, dtb__366) -> dtb__363
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373, dtb__374) -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382) -> dtb__381
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390) -> dtb__390
  | _ -> failwith "DT: impossible branch"
))
