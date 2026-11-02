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
open Vuna_dCompiler_dToml
open Vuna_dCompiler_dManifest
open Vuna_dCompiler_dPkg
open Vuna_dCompiler_dAst
open Vuna_dCompiler_dLexer
open Vuna_dCompiler_dParser
open Vuna_dCompiler_dBuiltins
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dDtMatch
open Vuna_dCompiler_dDtTerm
open Vuna_dCompiler_dDtPrelude
open Vuna_dCompiler_dDtKind
open Vuna_dCompiler_dDtQuant
open Vuna_dCompiler_dDtDerive
open Vuna_dCompiler_dDtRecords
type t_Vuna_dCompiler_dElab_dDtDef = C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef of (string) * (t_Vuna_dCompiler_dCore_dTerm) * (t_Vuna_dCompiler_dCore_dTerm)
and t_Vuna_dCompiler_dElab_dDtCtor = C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor of (string) * (string) * ((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm)
and t_Vuna_dCompiler_dElab_dDtData = C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData of (string) * ((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtCtor t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDtGoal = C_Vuna_dCompiler_dElab_dDtGoal_Vuna_dCompiler_dElab_dDtGoal of (int) * (t_Vuna_dCompiler_dCommon_dSpan) * (t_Vuna_dCompiler_dCore_dValue) * ((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDtClass = C_Vuna_dCompiler_dElab_dDtClass_Vuna_dCompiler_dElab_dDtClass of (string) * (string t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDtInst = C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst of (string) * (t_Vuna_dCompiler_dCore_dTerm) * (bool)
and t_Vuna_dCompiler_dElab_dDtDictGoal = C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal of (int) * (t_Vuna_dCompiler_dCore_dValue)
and t_Vuna_dCompiler_dElab_dEc = C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc of (int) * ((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtData t_Base_dList_dList) * ((int, int) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtGoal t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtClass t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtDictGoal t_Base_dList_dList) * (bool)
and t_Vuna_dCompiler_dElab_dCtx = C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx of ((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * ((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDataHead = C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead of (string) * (t_Vuna_dCompiler_dCore_dTerm) * (int)
and t_Vuna_dCompiler_dElab_dPending = C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending of (t_Vuna_dCompiler_dAst_dPat) * (string)
and t_Vuna_dCompiler_dElab_dBindAcc = C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc of ((string, t_Vuna_dCompiler_dCore_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dPending t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDtProgram = C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram of (t_Vuna_dCompiler_dElab_dDtData t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtDef t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtGoal t_Base_dList_dList) * ((int, t_Vuna_dCompiler_dCore_dValue) t_Base_dPair_dPair t_Base_dList_dList) * ((string, t_Vuna_dCompiler_dCore_dTerm) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtInst t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dDtClass t_Base_dList_dList) * (int)
and t_Vuna_dCompiler_dElab_dDtGoalInfo = C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo of (t_Vuna_dCompiler_dCommon_dSpan) * (string) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList)

let v_Vuna_dCompiler_dElab_ddtDefName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef (dtb__0, dtb__1, dtb__2) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtDefType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef (dtb__3, dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtDefBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef (dtb__6, dtb__7, dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtCtorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (dtb__9, dtb__10, dtb__11, dtb__12) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtCtorFamily = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtCtorTelescope = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtCtorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtDataName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData (dtb__25, dtb__26, dtb__27) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtDataParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData (dtb__28, dtb__29, dtb__30) -> dtb__29
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtDataCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData (dtb__31, dtb__32, dtb__33) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoal_Vuna_dCompiler_dElab_dDtGoal (dtb__34, dtb__35, dtb__36, dtb__37) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoal_Vuna_dCompiler_dElab_dDtGoal (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoal_Vuna_dCompiler_dElab_dDtGoal (dtb__42, dtb__43, dtb__44, dtb__45) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoal_Vuna_dCompiler_dElab_dDtGoal (dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtClassName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtClass_Vuna_dCompiler_dElab_dDtClass (dtb__50, dtb__51, dtb__52, dtb__53) -> dtb__50
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtClassParams = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtClass_Vuna_dCompiler_dElab_dDtClass (dtb__54, dtb__55, dtb__56, dtb__57) -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtClassMethods = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtClass_Vuna_dCompiler_dElab_dDtClass (dtb__58, dtb__59, dtb__60, dtb__61) -> dtb__60
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtClassFieldTys = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtClass_Vuna_dCompiler_dElab_dDtClass (dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__65
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtInstName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (dtb__66, dtb__67, dtb__68) -> dtb__66
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtInstHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (dtb__69, dtb__70, dtb__71) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtInstNamed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (dtb__72, dtb__73, dtb__74) -> dtb__74
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> dtb__86
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__97
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decDepthOfMeta = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> dtb__119
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__130
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decAddGoal = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, ((v_Base_dList_dappend dtb__160) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__161, dtb__162, dtb__163, dtb__164))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dhasInstName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__165, dtb__166) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtInstName dtb__165)) mc0) then true else ((v_Vuna_dCompiler_dElab_dhasInstName mc0) dtb__166))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decAddInstRaw = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, ((v_Base_dList_dappend dtb__173) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__174, dtb__175, dtb__176))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decAddInst = (fun ec -> (fun i -> (if ((v_Vuna_dCompiler_dElab_dhasInstName (v_Vuna_dCompiler_dElab_ddtInstName i)) (v_Vuna_dCompiler_dElab_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_decAddInstRaw ec) i))))

let v_Vuna_dCompiler_dElab_decAddClass = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, ((v_Base_dList_dappend dtb__184) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__185, dtb__186))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decTrusted = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> dtb__196
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decWithTrust = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, mc0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decDictGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_decPutDictGoals = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, mc1, dtb__226))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decAddDictGoal = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, ((v_Base_dList_dappend dtb__235) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__236))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decEmpty = fun () -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (0, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, false))

let v_Vuna_dCompiler_dElab_decPutSols = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__237, mc1, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decAddDef = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__247, dtb__248, ((v_Base_dList_dappend dtb__249) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_decAddData = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266) -> (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__257, dtb__258, dtb__259, ((v_Base_dList_dappend dtb__260) (C_Base_dList_dList_Cons (mc1, C_Base_dList_dList_Nil))), dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dctxItems = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (dtb__267, dtb__268) -> dtb__267
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dctxDepth = (fun ctx -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dctxItems ctx)))

let v_Vuna_dCompiler_dElab_dctxBind = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (dtb__269, dtb__270) -> (C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__269)), dtb__270))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dctxBindValue = (fun name -> (fun dom -> (fun ctx -> (((v_Vuna_dCompiler_dElab_dctxBind name) ((v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dom)) ctx))))

let v_Vuna_dCompiler_dElab_dctxRefine = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (dtb__271, dtb__272) -> (C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (dtb__271, ((v_Base_dList_dappend dtb__272) mc1)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dctxLookupAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__273, dtb__274) -> (match dtb__273 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__275, dtb__276) -> (if ((bi_eq_str dtb__275) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (mc2, dtb__276)))) else (((v_Vuna_dCompiler_dElab_dctxLookupAt mc0) dtb__274) ((bi_add mc2) 1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dctxLookup = (fun name -> (fun ctx -> (((v_Vuna_dCompiler_dElab_dctxLookupAt name) (v_Vuna_dCompiler_dElab_dctxItems ctx)) 0)))

let rec v_Vuna_dCompiler_dElab_dctxEnvAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__277, dtb__278) -> (match dtb__277 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__280) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__279, ((bi_sub ((bi_sub mc2) mc1)) 1), C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dctxEnvAt dtb__278) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dctxEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (dtb__281, dtb__282) -> (((v_Vuna_dCompiler_dElab_dctxEnvAt dtb__281) 0) (v_Base_dList_dlength dtb__281))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_drefineLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__283, dtb__284) -> (match dtb__283 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__285, dtb__286) -> (if ((bi_eq_int dtb__285) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__286)) else ((v_Vuna_dCompiler_dElab_drefineLookup mc0) dtb__284))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_drefineValue = (fun refs -> (fun fuel -> (fun v -> (if ((bi_le_int fuel) 0) then v else (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__287) -> (match dtb__287 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__288, dtb__289, dtb__290) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_drefineLookup dtb__289) refs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__291) -> ((v_Vuna_dCompiler_dCore_dapplySpine (((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1)) dtb__291)) sp2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__288, dtb__289, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1))) dtb__290))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__292, dtb__293) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__292, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1))) dtb__293)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__294, dtb__295) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__294, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1))) dtb__295)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__296, dtb__297) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase ((((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1)) dtb__296), dtb__297))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__298, dtb__299, dtb__300) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf ((((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1)) dtb__298), (((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1)) dtb__299), (((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1)) dtb__300)))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__301, dtb__302) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__301, ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue refs) ((bi_sub fuel) 1))) dtb__302)))
  | _ -> v
)))))

let v_Vuna_dCompiler_dElab_devalCtx = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (dtb__303, dtb__304) -> ((v_Vuna_dCompiler_dCore_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue dtb__304) (v_Vuna_dCompiler_dCore_ddefaultFuel ()))) (((v_Vuna_dCompiler_dElab_dctxEnvAt dtb__303) 0) (v_Base_dList_dlength dtb__303)))) mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dvarTypeValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (dtb__305, dtb__306) -> ((v_Vuna_dCompiler_dCore_deval ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue dtb__306) (v_Vuna_dCompiler_dCore_ddefaultFuel ()))) (((v_Vuna_dCompiler_dElab_dctxEnvAt dtb__305) 0) (v_Base_dList_dlength dtb__305)))) (((v_Vuna_dCompiler_dCore_dshift 0) ((bi_add mc1) 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_demptyCtx = fun () -> (C_Vuna_dCompiler_dElab_dCtx_Vuna_dCompiler_dElab_dCtx (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_derrAt = (fun sp -> (fun msg -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": ") msg))))))

let v_Vuna_dCompiler_dElab_dnewMeta = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__307)), (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (((bi_add dtb__307) 1), dtb__308, dtb__309, dtb__310, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, (v_Vuna_dCompiler_dElab_dctxDepth mc0))), dtb__311)), dtb__312, dtb__313, dtb__314, dtb__315, dtb__316))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dnewHoleMeta = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> ((fun goal -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__317)), (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (((bi_add dtb__317) 1), dtb__318, dtb__319, dtb__320, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__317, (v_Vuna_dCompiler_dElab_dctxDepth mc0))), dtb__321)), ((v_Base_dList_dappend dtb__322) (C_Base_dList_dList_Cons (goal, C_Base_dList_dList_Nil))), dtb__323, dtb__324, dtb__325, dtb__326))))) (C_Vuna_dCompiler_dElab_dDtGoal_Vuna_dCompiler_dElab_dDtGoal (dtb__317, mc2, mc3, (v_Vuna_dCompiler_dElab_dctxItems mc0))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dforceVal = (fun ec -> (fun v -> ((((v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) v)))

let rec v_Vuna_dCompiler_dElab_dhasNoExplicitPi = (fun ec -> (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331) -> (if dtb__328 then ((v_Vuna_dCompiler_dElab_dhasNoExplicitPi ec) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__331) ((v_Vuna_dCompiler_dElab_dforceVal ec) dtb__330))) else false)
  | _ -> true
)) ((v_Vuna_dCompiler_dElab_dforceVal ec) v))))

let rec v_Vuna_dCompiler_dElab_dzipTeleRigs = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__332, dtb__333) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__334, dtb__335) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__332, (v_Base_dPair_dsecondOf dtb__334))), ((v_Vuna_dCompiler_dElab_dzipTeleRigs dtb__333) dtb__335)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dnullaryCtorTerm = (fun ctor -> (fun metas -> (if ((bi_eq_int (v_Base_dList_dlength metas)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtCtorTelescope ctor))) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon ((v_Vuna_dCompiler_dElab_ddtCtorName ctor), ((v_Vuna_dCompiler_dElab_dzipTeleRigs metas) (v_Vuna_dCompiler_dElab_ddtCtorTelescope ctor)))) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_ddtCtorName ctor))))))

let v_Vuna_dCompiler_dElab_dboolCtorValue = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__336, dtb__337) -> (if ((bi_eq_str dtb__337) "True") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else (if ((bi_eq_str dtb__337) "False") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dboolCtorTerm = (fun name -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__338) -> (if dtb__338 then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (true)) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (false)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dboolCtorValue name)))

let v_Vuna_dCompiler_dElab_disBoolBaseName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__339, dtb__340) -> ((bi_eq_str dtb__340) "Bool")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_disBoolTypeVal = (fun ec -> (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__341) -> (match dtb__341 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__342, dtb__343) -> (v_Vuna_dCompiler_dElab_disBoolBaseName dtb__342)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__344, dtb__345, dtb__346) -> (v_Vuna_dCompiler_dElab_disBoolBaseName dtb__344)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dElab_dforceVal ec) v))))

let v_Vuna_dCompiler_dElab_dboolTypedVal = (fun ec -> (fun v -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__347) -> (match dtb__347 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__348, dtb__349) -> (v_Vuna_dCompiler_dElab_disBoolBaseName dtb__348)
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__350, dtb__351, dtb__352) -> (v_Vuna_dCompiler_dElab_disBoolBaseName dtb__350)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dElab_dforceVal ec) v))))

let rec v_Vuna_dCompiler_dElab_dprefixUntilMetaId = (fun pid -> (fun cur -> (match cur with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__353, dtb__354) -> (match dtb__353 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__355, dtb__356) -> (if ((bi_eq_int dtb__355) pid) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__355, dtb__356)), ((v_Vuna_dCompiler_dElab_dprefixUntilMetaId pid) dtb__354))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dnewSolsSince = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__357, dtb__358) -> (match dtb__357 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__359, dtb__360) -> ((v_Vuna_dCompiler_dElab_dprefixUntilMetaId dtb__359) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dmetaDepthLookup = (fun m -> (fun lst -> (match lst with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (match dtb__361 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__363, dtb__364) -> (if ((bi_eq_int dtb__363) m) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__364)) else ((v_Vuna_dCompiler_dElab_dmetaDepthLookup m) dtb__362))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dmetaDepthOf = (fun ec -> (fun m -> ((v_Vuna_dCompiler_dElab_dmetaDepthLookup m) (v_Vuna_dCompiler_dElab_decDepthOfMeta ec))))

let rec v_Vuna_dCompiler_dElab_dcheckScopedValueList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__365, dtb__366) -> (match dtb__365 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__367, dtb__368) -> (match ((v_Vuna_dCompiler_dElab_dmetaDepthOf mc0) dtb__367) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dcheckScopedValueList mc0) dtb__366)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__369) -> (if (((v_Vuna_dCompiler_dCore_dlevelEscapes dtb__369) 0) dtb__368) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: cannot solve metavariable ?") ((bi_concat (bi_strFromInt dtb__367)) " (solution would escape its scope)")))) else ((v_Vuna_dCompiler_dElab_dcheckScopedValueList mc0) dtb__366))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dcheckSolsDelta = (fun ec -> (fun oldSols -> (fun newSols -> ((v_Vuna_dCompiler_dElab_dcheckScopedValueList ec) ((v_Vuna_dCompiler_dElab_dnewSolsSince oldSols) newSols)))))

let v_Vuna_dCompiler_dElab_dconvEc = (fun ec -> (fun depth -> (fun expected -> (fun actual -> (if (if ((v_Vuna_dCompiler_dElab_dboolTypedVal ec) expected) then ((v_Vuna_dCompiler_dElab_dboolTypedVal ec) actual) else false) then (C_Base_dResult_dResult_Base_dResult_dOk (ec)) else (match (((((v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) depth) expected) actual) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__370) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__370))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__371) -> (match (((v_Vuna_dCompiler_dElab_dcheckSolsDelta ec) (v_Vuna_dCompiler_dElab_decSols ec)) dtb__371) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__372) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__372))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__373) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_decPutSols ec) dtb__371)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dcheckScopedFrom = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__374, dtb__375) -> (match dtb__374 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__376, dtb__377) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__376) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dcheckScopedFrom mc0) dtb__375) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__378) -> (if (((v_Vuna_dCompiler_dCore_dlevelEscapes dtb__377) 0) dtb__378) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: cannot solve metavariable ?") ((bi_concat (bi_strFromInt dtb__376)) " (solution would escape its scope)")))) else (((v_Vuna_dCompiler_dElab_dcheckScopedFrom mc0) dtb__375) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dcheckSolsScoped = (fun ec -> (fun sols -> (((v_Vuna_dCompiler_dElab_dcheckScopedFrom ec) (v_Vuna_dCompiler_dElab_decDepthOfMeta ec)) sols)))

let rec v_Vuna_dCompiler_dElab_dunsolvedFrom = (fun i -> (fun stop -> (fun sols -> (if ((bi_ge_int i) stop) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dCore_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__379) -> (((v_Vuna_dCompiler_dElab_dunsolvedFrom ((bi_add i) 1)) stop) sols)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dmemMetaId = (fun i -> (fun ids -> (match ids with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__380, dtb__381) -> (if ((bi_eq_int dtb__380) i) then true else ((v_Vuna_dCompiler_dElab_dmemMetaId i) dtb__381))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dtermMetasAll = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__382) -> (C_Base_dList_dList_Cons (dtb__382, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__383, dtb__384) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__385) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__386) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__387, dtb__388, dtb__389, dtb__390, dtb__391) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__390)) (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__391))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__392, dtb__393, dtb__394) -> (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__394)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__395, dtb__396, dtb__397) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__395)) (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__396))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__398, dtb__399) -> ((v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dtermMetasAll (v_Base_dPair_dfirstOf p)))) dtb__399)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__400, dtb__401) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__400)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dtermMetasAll (v_Vuna_dCompiler_dCore_dcaseAltBody alt)))) dtb__401))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__402) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__403) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__404) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__405, dtb__406, dtb__407) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__405)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__406)) (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__407)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dtermMetasRuntime = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__408) -> (C_Base_dList_dList_Cons (dtb__408, C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__409, dtb__410) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__411) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__412) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__413, dtb__414, dtb__415, dtb__416, dtb__417) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__416)) (v_Vuna_dCompiler_dElab_dtermMetasAll dtb__417))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__418, dtb__419, dtb__420) -> (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__420)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__421, dtb__422, dtb__423) -> (if (v_Vuna_dCompiler_dCore_drigIsErased dtb__423) then (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__421) else ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__421)) (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__422)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__424, dtb__425) -> ((v_Base_dList_dconcatMap (fun p -> (if (v_Vuna_dCompiler_dCore_drigIsErased (v_Base_dPair_dsecondOf p)) then C_Base_dList_dList_Nil else (v_Vuna_dCompiler_dElab_dtermMetasRuntime (v_Base_dPair_dfirstOf p))))) dtb__425)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__426, dtb__427) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__426)) ((v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dtermMetasRuntime (v_Vuna_dCompiler_dCore_dcaseAltBody alt)))) dtb__427))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__428) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__429) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__430) -> C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__431, dtb__432, dtb__433) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__431)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__432)) (v_Vuna_dCompiler_dElab_dtermMetasRuntime dtb__433)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_drelevantMetas = (fun ec -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun d -> (v_Vuna_dCompiler_dElab_dtermMetasRuntime (v_Base_dPair_dsecondOf d)))) (v_Vuna_dCompiler_dElab_decDefs ec))) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dtermMetasAll) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtCtorType) (v_Vuna_dCompiler_dElab_ddtDataCtors d))))) (v_Vuna_dCompiler_dElab_decDatas ec))))

let v_Vuna_dCompiler_dElab_dmaxInt = (fun a -> (fun b -> (if ((bi_ge_int a) b) then a else b)))

let rec v_Vuna_dCompiler_dElab_dglobalLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__434, dtb__435) -> (match dtb__434 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__436, dtb__437) -> (if ((bi_eq_str mc0) dtb__436) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__437)) else ((v_Vuna_dCompiler_dElab_dglobalLookup mc0) dtb__435))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dmemSig = (fun d4531 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__438, dtb__439) -> (match dtb__438 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__440, dtb__441) -> (if (((v_Base_dEq_deq d4531) dtb__440) mc1) then true else (((v_Vuna_dCompiler_dElab_dmemSig d4531) dtb__439) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dmemDefName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__442, dtb__443) -> (match dtb__442 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__444, dtb__445) -> (if ((bi_eq_str dtb__444) mc0) then true else ((v_Vuna_dCompiler_dElab_dmemDefName mc0) dtb__443))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dcollectSigsInto = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__446, dtb__447) -> (match dtb__446 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__448, dtb__449, dtb__450) -> (if ((v_Base_dList_dmemName dtb__448) (v_Vuna_dCompiler_dDtPrelude_dpreludeNames ())) then ((v_Vuna_dCompiler_dElab_derrAt dtb__450) ((bi_concat "DT: cannot redefine builtin ") dtb__448)) else (if (((v_Vuna_dCompiler_dElab_dmemSig (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) mc1) dtb__448) then ((v_Vuna_dCompiler_dElab_derrAt dtb__450) ((bi_concat "DT: duplicate signature for ") dtb__448)) else (((v_Vuna_dCompiler_dElab_dcollectSigsInto mc0) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__448, (((v_Vuna_dCompiler_dDtQuant_dquantifyTopSig mc0) dtb__449) dtb__450))), mc1))) dtb__447)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__451, dtb__452, dtb__453, dtb__454) -> (((v_Vuna_dCompiler_dElab_dcollectSigsInto mc0) mc1) dtb__447)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459, dtb__460) -> (((v_Vuna_dCompiler_dElab_dcollectSigsInto mc0) mc1) dtb__447)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__461, dtb__462, dtb__463, dtb__464, dtb__465) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__465) "DT: internal: record was not desugared")
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__466, dtb__467, dtb__468, dtb__469) -> (((v_Vuna_dCompiler_dElab_dcollectSigsInto mc0) mc1) dtb__447)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__470, dtb__471, dtb__472, dtb__473, dtb__474) -> (((v_Vuna_dCompiler_dElab_dcollectSigsInto mc0) mc1) dtb__447)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc1)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dcollectSigs = (fun decls -> (((v_Vuna_dCompiler_dElab_dcollectSigsInto (v_Vuna_dCompiler_dDtQuant_ddefinedNames decls)) C_Base_dList_dList_Nil) decls))

let rec v_Vuna_dCompiler_dElab_dcollectDataDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__475, dtb__476) -> (match dtb__475 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__477, dtb__478, dtb__479, dtb__480, dtb__481, dtb__482) -> ((v_Vuna_dCompiler_dElab_dcollectDataDecls dtb__476) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__475, dtb__482)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dcollectDataDecls dtb__476) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_ddataNamesOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__483, dtb__484) -> (match dtb__483 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490) -> (C_Base_dList_dList_Cons (dtb__485, (v_Vuna_dCompiler_dElab_ddataNamesOf dtb__484)))
  | _ -> (v_Vuna_dCompiler_dElab_ddataNamesOf dtb__484)
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dnonEmpty = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__491, dtb__492) -> true
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dkindWellFormed = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__493, dtb__494, dtb__495, dtb__496, dtb__497) -> (v_Vuna_dCompiler_dElab_dkindWellFormed dtb__497)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__498) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_ddtDataLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__499, dtb__500) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtDataName dtb__499)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__499)) else ((v_Vuna_dCompiler_dElab_ddtDataLookup mc0) dtb__500))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfindCtorIn = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__501, dtb__502) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtCtorName dtb__501)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__501)) else ((v_Vuna_dCompiler_dElab_dfindCtorIn mc0) dtb__502))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_ddtCtorLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__503, dtb__504) -> (match ((v_Vuna_dCompiler_dElab_dfindCtorIn mc0) (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__503)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__505) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__505))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_ddtCtorLookup mc0) dtb__504)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dspineOfType = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__506, dtb__507, dtb__508) -> (match (v_Vuna_dCompiler_dElab_dspineOfType dtb__506) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__509, dtb__510) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__509, ((v_Base_dList_dappend dtb__510) (C_Base_dList_dList_Cons (dtb__507, C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__511) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__511, C_Base_dList_dList_Nil))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair ("", C_Base_dList_dList_Nil))
))

let rec v_Vuna_dCompiler_dElab_dresultSpine = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516) -> (v_Vuna_dCompiler_dElab_dresultSpine dtb__516)
  | _ -> (v_Vuna_dCompiler_dElab_dspineOfType ty)
))

let rec v_Vuna_dCompiler_dElab_dhasOutOfScopeVar = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__517, dtb__518) -> ((bi_lt_int dtb__518) 0)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__519, dtb__520, dtb__521, dtb__522, dtb__523) -> (if (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__522) then true else (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__523))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__524, dtb__525, dtb__526) -> (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__526)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__527, dtb__528, dtb__529) -> (if (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__527) then true else (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__528))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__530, dtb__531) -> (v_Vuna_dCompiler_dElab_dhasOutOfScopeVarArgs dtb__531)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__532, dtb__533) -> (if (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__532) then true else (v_Vuna_dCompiler_dElab_dhasOutOfScopeVarAlts dtb__533))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__534, dtb__535, dtb__536) -> (if (if (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__534) then true else (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__535)) then true else (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__536))
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dhasOutOfScopeVarArgs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__537, dtb__538) -> (match dtb__537 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__539, dtb__540) -> (if (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__539) then true else (v_Vuna_dCompiler_dElab_dhasOutOfScopeVarArgs dtb__538))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dhasOutOfScopeVarAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__541, dtb__542) -> (match dtb__541 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__543, dtb__544, dtb__545) -> (if (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar dtb__545) then true else (v_Vuna_dCompiler_dElab_dhasOutOfScopeVarAlts dtb__542))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dinlineSolvedMetas = (fun ec -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__546) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__546) (v_Vuna_dCompiler_dElab_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__547) -> ((fun q -> (if (v_Vuna_dCompiler_dElab_dhasOutOfScopeVar q) then t else (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) q))) ((v_Vuna_dCompiler_dCore_dquote depth) dtb__547))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> t
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__548, dtb__549, dtb__550, dtb__551, dtb__552) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__548, dtb__549, dtb__550, (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) dtb__551), (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) ((bi_add depth) 1)) dtb__552)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__553, dtb__554, dtb__555) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__553, dtb__554, (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) ((bi_add depth) 1)) dtb__555)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__556, dtb__557, dtb__558) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) dtb__556), (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) dtb__557), dtb__558))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__559, dtb__560) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__559, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__560)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__561, dtb__562) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) dtb__561), ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dinlineSolvedMetaAlt ec) depth)) dtb__562)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__563, dtb__564, dtb__565) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) dtb__563), (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) dtb__564), (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas ec) depth) dtb__565)))
  | _ -> t
))))
and v_Vuna_dCompiler_dElab_dinlineSolvedMetaAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__566, dtb__567, dtb__568) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__566, dtb__567, (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas mc0) ((bi_add mc1) (v_Base_dList_dlength dtb__567))) dtb__568)))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dprependFamParams = (fun kindTerm -> (fun tyExpr -> (fun sp -> (match kindTerm with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__569, dtb__570, dtb__571, dtb__572, dtb__573) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__569, true, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Type", sp)), (((v_Vuna_dCompiler_dElab_dprependFamParams dtb__573) tyExpr) sp), sp))
  | _ -> tyExpr
))))

let rec v_Vuna_dCompiler_dElab_ddropParams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__574, dtb__575, dtb__576, dtb__577, dtb__578) -> (v_Vuna_dCompiler_dElab_ddropParams dtb__578)
  | _ -> t
))

let rec v_Vuna_dCompiler_dElab_dctorGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__579, dtb__580) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtCtorName dtb__579), (v_Vuna_dCompiler_dElab_ddtCtorType dtb__579))), (v_Vuna_dCompiler_dElab_dctorGlobals dtb__580)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddataHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__581, dtb__582, dtb__583) -> dtb__581
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddataHeadKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__584, dtb__585, dtb__586) -> dtb__585
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddataHeadArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__587, dtb__588, dtb__589) -> dtb__589
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dlookupDataHead = (fun name -> (fun heads -> (match heads with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__590, dtb__591) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddataHeadName dtb__590)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddataHeadKind dtb__590), (v_Vuna_dCompiler_dElab_ddataHeadArity dtb__590))))) else ((v_Vuna_dCompiler_dElab_dlookupDataHead name) dtb__591))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddictTypeName = (fun cname -> ((bi_concat "Dict_") cname))

let v_Vuna_dCompiler_dElab_ddictCtorName = (fun cname -> ((bi_concat "MkDict_") cname))

let rec v_Vuna_dCompiler_dElab_dcollectTraitDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__592, dtb__593) -> (match dtb__592 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__594, dtb__595, dtb__596, dtb__597) -> ((v_Vuna_dCompiler_dElab_dcollectTraitDecls dtb__593) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__592, dtb__597)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dcollectTraitDecls dtb__593) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dcollectInstDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__598, dtb__599) -> (match dtb__598 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__600, dtb__601, dtb__602, dtb__603, dtb__604) -> ((v_Vuna_dCompiler_dElab_dcollectInstDecls dtb__599) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__598, dtb__604)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dcollectInstDecls dtb__599) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dparamNameOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__605, dtb__606) -> dtb__605
  | C_Base_dList_dList_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dbindClassParams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__607, dtb__608) -> (((v_Vuna_dCompiler_dElab_dbindClassParams dtb__608) mc1) (((v_Vuna_dCompiler_dElab_dctxBind dtb__607) ((v_Vuna_dCompiler_dDtKind_dclassParamKind dtb__607) mc1)) mc2))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dfoldlAddDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__609, dtb__610) -> ((v_Vuna_dCompiler_dElab_dfoldlAddDef ((v_Vuna_dCompiler_dElab_decAddDef mc0) dtb__609)) dtb__610)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfoldPiFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__611, dtb__612) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (((v_Vuna_dCompiler_dCore_dshift 0) mc1) dtb__611), (((v_Vuna_dCompiler_dElab_dfoldPiFieldTysGo dtb__612) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dfoldPiFieldTys = (fun fieldTys -> (fun ty -> (((v_Vuna_dCompiler_dElab_dfoldPiFieldTysGo fieldTys) 0) ty)))

let rec v_Vuna_dCompiler_dElab_dmethodArgTermsGo = (fun rigs -> (fun nFields -> (fun i -> (fun arity -> (match rigs with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__613, dtb__614) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (((bi_concat "x") (bi_strFromInt i)), ((bi_add nFields) ((bi_sub ((bi_sub arity) 1)) i)))), dtb__613)), ((((v_Vuna_dCompiler_dElab_dmethodArgTermsGo dtb__614) nFields) ((bi_add i) 1)) arity)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dmethodArgTerms = (fun rigs -> (fun nFields -> ((((v_Vuna_dCompiler_dElab_dmethodArgTermsGo rigs) nFields) 0) (v_Base_dList_dlength rigs))))

let rec v_Vuna_dCompiler_dElab_dmethodArgLams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__615, dtb__616) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (((bi_concat "x") (bi_strFromInt mc1)), dtb__615, (((v_Vuna_dCompiler_dElab_dmethodArgLams dtb__616) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dfieldVarName = (fun i -> ((bi_concat "f") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dfieldBinderGo = (fun n -> (fun i -> (fun acc -> (if ((bi_ge_int i) n) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dfieldBinderGo n) ((bi_add i) 1)) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dfieldVarName i), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), acc)))))))

let v_Vuna_dCompiler_dElab_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dfieldBinderGo n) 0) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dexplicitPiArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__617, dtb__618, dtb__619, dtb__620, dtb__621) -> (if dtb__618 then (v_Vuna_dCompiler_dElab_dexplicitPiArity dtb__621) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dexplicitPiArity dtb__621)))
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dinstanceHeadName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__622, dtb__623) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__622))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__624, dtb__625, dtb__626) -> (match dtb__624 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__627, dtb__628) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__627))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_danonInstName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__629, dtb__630) -> ((v_Base_dString_dstartsWith "#") dtb__630)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dinstPrefixOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__631, dtb__632) -> (if ((bi_eq_generic dtb__631) C_Base_dList_dList_Nil) then "" else ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__631)) "."))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dexprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__633, dtb__634) -> dtb__633
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__635, dtb__636) -> (bi_strFromInt dtb__635)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__637, dtb__638) -> dtb__637
  | _ -> "X"
))

let rec v_Vuna_dCompiler_dElab_dargSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__639, dtb__640) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dElab_dexprNameFor dtb__639)) (v_Vuna_dCompiler_dElab_dargSuffix dtb__640)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dderivedInstName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__641, dtb__642, dtb__643) -> (match dtb__641 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__644, dtb__645) -> ((bi_concat dtb__644) (v_Vuna_dCompiler_dElab_dargSuffix dtb__642))
  | _ -> "Inst"
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__646, dtb__647) -> dtb__646
  | _ -> "Inst"
))

let v_Vuna_dCompiler_dElab_dinstanceName = (fun cname -> (fun mname -> (fun headExpr -> (match mname with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dderivedInstName headExpr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__648) -> (if (v_Vuna_dCompiler_dElab_danonInstName dtb__648) then ((bi_concat (v_Vuna_dCompiler_dElab_dinstPrefixOf dtb__648)) ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dderivedInstName headExpr)))) else dtb__648)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dargNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__649, dtb__650) -> dtb__649
  | _ -> "Int"
))

let v_Vuna_dCompiler_dElab_dinstanceHeadTerm = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__651, dtb__652, dtb__653) -> (match dtb__652 with
  | C_Base_dList_dList_Cons (dtb__654, dtb__655) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_dargNameOf dtb__654)))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__656, dtb__657) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__656))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dfindClass = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__658, dtb__659) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtClassName dtb__658)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__658)) else ((v_Vuna_dCompiler_dElab_dfindClass mc0) dtb__659))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dzipMethodFields = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__660, dtb__661) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__662, dtb__663) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__660), dtb__662)), ((v_Vuna_dCompiler_dElab_dzipMethodFields dtb__661) dtb__663)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dzipMethodFields (v_Vuna_dCompiler_dElab_ddtClassMethods cls)) (v_Vuna_dCompiler_dElab_ddtClassFieldTys cls)))

let v_Vuna_dCompiler_dElab_dsubstClassParam = (fun pname -> (fun arg -> (fun ty -> (((v_Vuna_dCompiler_dCore_dsubstVarAt 0) arg) ty))))

let v_Vuna_dCompiler_dElab_dclauseSpanOf = (fun clauses -> (match clauses with
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | C_Base_dList_dList_Cons (dtb__664, dtb__665) -> (v_Vuna_dCompiler_dAst_dexprSpan (v_Base_dPair_dsecondOf dtb__664))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dunifyErr = fun () -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: this branch is impossible (index constraints are unsatisfiable)"))

let rec v_Vuna_dCompiler_dElab_doccursLevel = (fun lvl -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__666) -> (match dtb__666 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__667, dtb__668, dtb__669) -> (if ((bi_eq_int dtb__668) lvl) then true else ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__669))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__670, dtb__671) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__671)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__672, dtb__673, dtb__674, dtb__675, dtb__676) -> (if ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__675) then true else ((v_Vuna_dCompiler_dElab_doccursLevelClo lvl) dtb__676))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__677, dtb__678, dtb__679) -> ((v_Vuna_dCompiler_dElab_doccursLevelClo lvl) dtb__679)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__680, dtb__681) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__681)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__682, dtb__683) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__683)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__684, dtb__685) -> ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__684)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__686, dtb__687, dtb__688) -> (if (if ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__686) then true else ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__687)) then true else ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__688))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__689) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__690) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__691) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__692) -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_doccursLevelList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__693, dtb__694) -> (if ((v_Vuna_dCompiler_dElab_doccursLevel mc0) dtb__693) then true else ((v_Vuna_dCompiler_dElab_doccursLevelList mc0) dtb__694))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_doccursLevelClo = (fun lvl -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__695, dtb__696) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__695)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dunifyIdxConv = (fun ec -> (fun acc -> (fun depth -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) depth) a) b) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__697) -> (C_Base_dResult_dResult_Base_dResult_dOk (acc))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__698) -> (v_Vuna_dCompiler_dElab_dunifyErr ())
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dunifyIdxList = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__699, dtb__700) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__701, dtb__702) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dunifyIdx mc0) mc1) mc2) ((bi_sub mc3) 1)) dtb__699) dtb__701)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dunifyIdxList mc0) acc2) mc2) ((bi_sub mc3) 1)) dtb__700) dtb__702)))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dunifyIdx = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: index unification ran out of reduction fuel")) else ((fun a2 -> ((fun b2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__703) -> (match dtb__703 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__704, dtb__705, dtb__706) -> (match dtb__706 with
  | C_Base_dList_dList_Nil -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__707) -> (match dtb__707 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__708, dtb__709, dtb__710) -> (match dtb__710 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_int dtb__705) dtb__709) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (if ((bi_lt_int dtb__705) dtb__709) then (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__709) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__709, a2)), acc))))) else (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__705) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__705, b2)), acc)))))))
  | _ -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__705) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__705, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__705) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__705, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__705) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__705, b2)), acc)))))
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__711) -> (match dtb__711 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__712, dtb__713, dtb__714) -> (match dtb__714 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__713) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__713, a2)), acc)))))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__715) -> (match dtb__715 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__716, dtb__717, dtb__718) -> (match dtb__718 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__717) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__717, a2)), acc)))))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__719) -> (match dtb__719 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__720, dtb__721, dtb__722) -> (match dtb__722 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__721) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__721, a2)), acc)))))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
)) ((((v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) (((v_Vuna_dCompiler_dElab_drefineValue acc) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) b)))) ((((v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) (((v_Vuna_dCompiler_dElab_drefineValue acc) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) a))))))))))
and v_Vuna_dCompiler_dElab_dunifyIdxRigid = (fun ec -> (fun acc -> (fun depth -> (fun a -> (fun b -> (match a with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__723, dtb__724) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__725, dtb__726) -> (if ((bi_eq_str dtb__723) dtb__725) then ((((((v_Vuna_dCompiler_dElab_dunifyIdxList ec) acc) depth) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) dtb__724) dtb__726) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__727) -> (match dtb__727 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__728, dtb__729) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__730) -> (match dtb__730 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__731, dtb__732) -> (if ((bi_eq_str dtb__728) dtb__731) then ((((((v_Vuna_dCompiler_dElab_dunifyIdxList ec) acc) depth) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) dtb__729) dtb__732) else (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__733) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__734) -> (if ((v_Vuna_dCompiler_dCore_dlevelEq dtb__733) dtb__734) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__735) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__736) -> (if ((bi_eq_int dtb__735) dtb__736) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__737) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__738) -> (if ((bi_eq_str dtb__737) dtb__738) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__739) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__740) -> (if (((v_Base_dEq_deq (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool ())) dtb__739) dtb__740) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
))))))

let rec v_Vuna_dCompiler_dElab_dfreshTeleVals = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__741, dtb__742) -> (match dtb__741 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__743, dtb__744) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__743, ((bi_add mc1) mc2), C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dfreshTeleVals dtb__742) mc1) ((bi_add mc2) 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dctorResultTerms = (fun c -> (match (v_Vuna_dCompiler_dElab_dresultSpine (v_Vuna_dCompiler_dElab_ddtCtorType c)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__745, dtb__746) -> dtb__746
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dctorResultVals = (fun c -> (fun base -> ((fun tele -> ((fun env -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dCore_deval env) t))) (v_Vuna_dCompiler_dElab_dctorResultTerms c))) (v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dfreshTeleVals tele) base) 0)))) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c))))

let v_Vuna_dCompiler_dElab_dctorResultValsIn = (fun ctx -> (fun c -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dElab_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dctorResultTerms c))))

let rec v_Vuna_dCompiler_dElab_dteleValsFrom = (fun low -> (fun k -> (if ((bi_le_int k) 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar ("_tele", low, C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dteleValsFrom ((bi_add low) 1)) ((bi_sub k) 1)))))))

let v_Vuna_dCompiler_dElab_dctorValueIn = (fun ctx -> (fun c -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon ((v_Vuna_dCompiler_dElab_ddtCtorName c), ((v_Vuna_dCompiler_dElab_dteleValsFrom ((bi_sub (v_Vuna_dCompiler_dElab_dctxDepth ctx)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtCtorTelescope c)))))))

let v_Vuna_dCompiler_dElab_dreflectScrutinee = (fun ec -> (fun depth -> (fun refs -> (fun ctorVal -> (fun scrutVal -> (match ((((v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) (((v_Vuna_dCompiler_dElab_drefineValue refs) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) scrutVal)) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__747) -> (match dtb__747 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__748, dtb__749, dtb__750) -> (match dtb__750 with
  | C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dunifyIdx ec) refs) depth) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__747))) ctorVal)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (refs))
))))))

let v_Vuna_dCompiler_dElab_dpendingPat = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (dtb__751, dtb__752) -> dtb__751
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dpendingName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (dtb__753, dtb__754) -> dtb__754
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dbaBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc (dtb__755, dtb__756) -> dtb__755
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dbaPending = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc (dtb__757, dtb__758) -> dtb__758
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dfreshPatName = (fun i -> ((bi_concat "_np") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dfoldPending = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__759, dtb__760) -> ((fun ps -> ((fun patAlt -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__761) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dElab_dpendingName dtb__759), ps)), (C_Base_dList_dList_Cons (patAlt, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (ps)), dtb__761)), C_Base_dList_dList_Nil)))), ps))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dElab_dpendingName dtb__759), ps)), (C_Base_dList_dList_Cons (patAlt, C_Base_dList_dList_Nil)), ps))
  | _ -> failwith "DT: impossible branch"
)) (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dpendingPat dtb__759), (((v_Vuna_dCompiler_dElab_dfoldPending mc0) dtb__760) mc2))))) (v_Vuna_dCompiler_dAst_dpatSpan (v_Vuna_dCompiler_dElab_dpendingPat dtb__759)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_daltNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__762, dtb__763) -> (match dtb__762 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__764, dtb__765) -> (match dtb__764 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__766, dtb__767, dtb__768) -> (C_Base_dList_dList_Cons (dtb__766, (v_Vuna_dCompiler_dElab_daltNames dtb__763)))
  | _ -> (v_Vuna_dCompiler_dElab_daltNames dtb__763)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dhasCatchAll = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__769, dtb__770) -> (match dtb__769 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__771, dtb__772) -> (match dtb__771 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__773, dtb__774, dtb__775) -> (v_Vuna_dCompiler_dElab_dhasCatchAll dtb__770)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dhasDupNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__776, dtb__777) -> (if ((v_Base_dList_dmemName dtb__776) dtb__777) then true else (v_Vuna_dCompiler_dElab_dhasDupNames dtb__777))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dwildArgs = (fun n -> (if ((bi_le_int n) 0) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild ((C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (v_Vuna_dCompiler_dElab_dwildArgs ((bi_sub n) 1))))))

let rec v_Vuna_dCompiler_dElab_dctorExplicitArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__778, dtb__779, dtb__780, dtb__781, dtb__782) -> (if dtb__779 then (v_Vuna_dCompiler_dElab_dctorExplicitArity dtb__782) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dctorExplicitArity dtb__782)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_drigidIdxVals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__783, dtb__784) -> (if (v_Vuna_dCompiler_dElab_disRigidVal dtb__783) then (v_Vuna_dCompiler_dElab_drigidIdxVals dtb__784) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_disRigidVal = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__785, dtb__786) -> (v_Vuna_dCompiler_dElab_drigidIdxVals dtb__786)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__787) -> true
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__788) -> true
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__789) -> true
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__790) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dallCtorsUnsatisfiableGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__791, dtb__792) -> (match ((((((v_Vuna_dCompiler_dElab_dunifyIdxList mc0) C_Base_dList_dList_Nil) mc3) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dElab_dctorResultVals dtb__791) mc3)) mc2) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__793) -> false
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__794) -> ((((v_Vuna_dCompiler_dElab_dallCtorsUnsatisfiableGo mc0) dtb__792) mc2) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dallCtorsUnsatisfiable = (fun ec -> (fun dd -> (fun idxs -> (fun depth -> ((((v_Vuna_dCompiler_dElab_dallCtorsUnsatisfiableGo ec) (v_Vuna_dCompiler_dElab_ddtDataCtors dd)) idxs) depth)))))

let v_Vuna_dCompiler_dElab_disEmptyFamilyValue = (fun ec -> (fun depth -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__795) -> (match dtb__795 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__796, dtb__797) -> (if (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_drigidIdxVals dtb__797)) then false else (match ((v_Vuna_dCompiler_dElab_ddtDataLookup dtb__796) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__798) -> ((((v_Vuna_dCompiler_dElab_dallCtorsUnsatisfiable ec) dtb__798) dtb__797) depth)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))
  | _ -> false
)
  | _ -> false
))))

let rec v_Vuna_dCompiler_dElab_dctxHasEmptyBinderAt = (fun ec -> (fun ctx -> (fun idx -> (fun items -> (match items with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__799, dtb__800) -> (match dtb__799 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__801, dtb__802) -> (if (((v_Vuna_dCompiler_dElab_disEmptyFamilyValue ec) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) (((v_Vuna_dCompiler_dElab_dvarTypeValue ctx) idx) dtb__802)) then true else ((((v_Vuna_dCompiler_dElab_dctxHasEmptyBinderAt ec) ctx) ((bi_add idx) 1)) dtb__800))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dctxHasEmptyBinder = (fun ec -> (fun ctx -> ((((v_Vuna_dCompiler_dElab_dctxHasEmptyBinderAt ec) ctx) 0) (v_Vuna_dCompiler_dElab_dctxItems ctx))))

let rec v_Vuna_dCompiler_dElab_danyNestedArg = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__803, dtb__804) -> (match dtb__803 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__805, dtb__806) -> (v_Vuna_dCompiler_dElab_danyNestedArg dtb__804)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__807) -> (v_Vuna_dCompiler_dElab_danyNestedArg dtb__804)
  | _ -> true
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dnestedInPat = (fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__808, dtb__809, dtb__810) -> (v_Vuna_dCompiler_dElab_danyNestedArg dtb__809)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_danyNestedPat = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__811, dtb__812) -> (match dtb__811 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__813, dtb__814) -> (if (v_Vuna_dCompiler_dElab_dnestedInPat dtb__813) then true else (v_Vuna_dCompiler_dElab_danyNestedPat dtb__812))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dhasVarCatchAll = (fun alts -> (match (v_Base_dList_dreverse alts) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__815, dtb__816) -> (match dtb__815 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__817, dtb__818) -> (match dtb__817 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__819, dtb__820) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dcatchAllNotLast = (fun alts -> (match alts with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__821, dtb__822) -> (match dtb__821 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__823, dtb__824) -> (match dtb__823 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__825, dtb__826, dtb__827) -> (v_Vuna_dCompiler_dElab_dcatchAllNotLast dtb__822)
  | _ -> (v_Vuna_dCompiler_dElab_dnonEmpty dtb__822)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dlitEqName = (fun tyName -> (if ((bi_eq_str tyName) "String") then "bi_eq_str" else "bi_eq_int"))

let rec v_Vuna_dCompiler_dElab_dleadingImplicitCount = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__828, dtb__829, dtb__830, dtb__831, dtb__832) -> (if dtb__829 then ((bi_add 1) (v_Vuna_dCompiler_dElab_dleadingImplicitCount dtb__832)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dsolveLiftedMeta = (fun ec -> (fun name -> (fun m -> (match ((((((v_Vuna_dCompiler_dCore_dsolveMeta (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) 0) m) C_Base_dList_dList_Nil) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (name, 0, C_Base_dList_dList_Nil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__833) -> (match (((v_Vuna_dCompiler_dElab_dcheckSolsDelta ec) (v_Vuna_dCompiler_dElab_decSols ec)) dtb__833) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__834) -> ec
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__835) -> ((v_Vuna_dCompiler_dElab_decPutSols ec) dtb__833)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__836) -> ec
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dflattenTaggedApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__837, dtb__838, dtb__839) -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp dtb__837) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__840) -> (match dtb__840 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__841, dtb__842) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__841, ((v_Base_dList_dappend dtb__842) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__838, dtb__839)), C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__843) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__843, C_Base_dList_dList_Nil))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dinsertArgAt = (fun n -> (fun x -> (fun xs -> ((v_Base_dList_dappend ((v_Base_dList_dappend ((v_Base_dList_dtake n) xs)) (C_Base_dList_dList_Cons (x, C_Base_dList_dList_Nil)))) ((v_Base_dList_ddrop n) xs)))))

let rec v_Vuna_dCompiler_dElab_dreplaceGlobalType = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__844, dtb__845) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__844)) mc0) then (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__845)) else (C_Base_dList_dList_Cons (dtb__844, (((v_Vuna_dCompiler_dElab_dreplaceGlobalType mc0) mc1) dtb__845))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dhasFunClause = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__846, dtb__847) -> (match dtb__846 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__848, dtb__849, dtb__850, dtb__851) -> (if ((bi_eq_str dtb__848) mc0) then true else ((v_Vuna_dCompiler_dElab_dhasFunClause mc0) dtb__847))
  | _ -> ((v_Vuna_dCompiler_dElab_dhasFunClause mc0) dtb__847)
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dcheckAllDefined = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__852, dtb__853) -> (match dtb__852 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__854, dtb__855) -> (if ((v_Vuna_dCompiler_dElab_dhasFunClause dtb__854) mc2) then (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__854) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: signature for ") ((bi_concat dtb__854) " has no definition"))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__856) -> (((v_Vuna_dCompiler_dElab_dcheckAllDefined dtb__853) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: signature for ") ((bi_concat dtb__854) " has no definition")))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_ddtProgDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__857, dtb__858, dtb__859, dtb__860, dtb__861, dtb__862, dtb__863, dtb__864) -> dtb__857
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__865, dtb__866, dtb__867, dtb__868, dtb__869, dtb__870, dtb__871, dtb__872) -> dtb__866
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__873, dtb__874, dtb__875, dtb__876, dtb__877, dtb__878, dtb__879, dtb__880) -> dtb__875
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__881, dtb__882, dtb__883, dtb__884, dtb__885, dtb__886, dtb__887, dtb__888) -> dtb__884
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__889, dtb__890, dtb__891, dtb__892, dtb__893, dtb__894, dtb__895, dtb__896) -> dtb__893
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__897, dtb__898, dtb__899, dtb__900, dtb__901, dtb__902, dtb__903, dtb__904) -> dtb__902
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__905, dtb__906, dtb__907, dtb__908, dtb__909, dtb__910, dtb__911, dtb__912) -> dtb__911
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__913, dtb__914, dtb__915, dtb__916, dtb__917, dtb__918, dtb__919, dtb__920) -> dtb__920
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dcheckTerminationIf = (fun trusted -> (fun decls -> (if trusted then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (v_Vuna_dCompiler_dDtTerm_dcheckTerminationDecls decls))))

let rec v_Vuna_dCompiler_dElab_dfoldlAddInst = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__921, dtb__922) -> ((v_Vuna_dCompiler_dElab_dfoldlAddInst ((v_Vuna_dCompiler_dElab_decAddInst mc0) dtb__921)) dtb__922)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinstanceIsNamed = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__923) -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_danonInstName dtb__923))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dheadsEqual = (fun ec -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) a)) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__924) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__925) -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dfindDefaultDup = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__926, dtb__927) -> (if mc1 then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (v_Vuna_dCompiler_dElab_ddtInstNamed dtb__926) then ((((v_Vuna_dCompiler_dElab_dfindDefaultDup mc0) mc1) mc2) dtb__927) else (if (((v_Vuna_dCompiler_dElab_dheadsEqual mc0) mc2) (v_Vuna_dCompiler_dElab_ddtInstHead dtb__926)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__926)) else ((((v_Vuna_dCompiler_dElab_dfindDefaultDup mc0) mc1) mc2) dtb__927))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dfindDuplicateInstance = (fun ec -> (fun name -> (fun named -> (fun ty -> (fun seen -> (if ((v_Vuna_dCompiler_dElab_dhasInstName name) seen) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (name, ty, named)))) else ((((v_Vuna_dCompiler_dElab_dfindDefaultDup ec) named) ty) seen)))))))

let v_Vuna_dCompiler_dElab_ddefBodyOf = (fun defs -> (fun name -> (match ((v_Vuna_dCompiler_dCore_ddefLookup name) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__928) -> dtb__928
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddefTypeOrDefault = (fun globals -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__929) -> dtb__929
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dextraDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__930, dtb__931) -> (if ((v_Base_dList_dmemName (v_Base_dPair_dfirstOf dtb__930)) mc1) then ((((v_Vuna_dCompiler_dElab_dextraDefsGo mc0) mc1) dtb__931) mc3) else ((((v_Vuna_dCompiler_dElab_dextraDefsGo mc0) mc1) dtb__931) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef ((v_Base_dPair_dfirstOf dtb__930), ((v_Vuna_dCompiler_dElab_ddefTypeOrDefault mc0) (v_Base_dPair_dfirstOf dtb__930)), (v_Base_dPair_dsecondOf dtb__930))), mc3))))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dextraDefsOf = (fun globals -> (fun ec -> (fun sourceDefs -> ((((v_Vuna_dCompiler_dElab_dextraDefsGo globals) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDefName) sourceDefs)) (v_Vuna_dCompiler_dElab_decDefs ec)) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dElab_dctorFieldGo = (fun arity -> (fun t -> (fun acc -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__932, dtb__933, dtb__934, dtb__935, dtb__936) -> (if ((bi_gt_int arity) 0) then (((v_Vuna_dCompiler_dElab_dctorFieldGo ((bi_sub arity) 1)) dtb__936) acc) else (((v_Vuna_dCompiler_dElab_dctorFieldGo 0) dtb__936) (C_Base_dList_dList_Cons (dtb__935, acc))))
  | _ -> (v_Base_dList_dreverse acc)
))))

let v_Vuna_dCompiler_dElab_dctorFieldTerms = (fun arity -> (fun ty -> (((v_Vuna_dCompiler_dElab_dctorFieldGo arity) ty) C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dtermUsesVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__937, dtb__938) -> ((bi_eq_int dtb__938) depth)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__939) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__940) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__941) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__942, dtb__943, dtb__944, dtb__945, dtb__946) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__945) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar ((bi_add depth) 1)) dtb__946))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__947, dtb__948, dtb__949) -> ((v_Vuna_dCompiler_dElab_dtermUsesVar ((bi_add depth) 1)) dtb__949)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__950, dtb__951, dtb__952) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__950) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__951))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__953, dtb__954) -> ((v_Vuna_dCompiler_dElab_dtermUsesVarArgs depth) dtb__954)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__955, dtb__956) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__955) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVarAlts depth) dtb__956))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__957) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__958) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__959) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__960, dtb__961, dtb__962) -> (if (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__960) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__961)) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__962))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dtermUsesVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__963, dtb__964) -> (match dtb__963 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__965, dtb__966) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar mc0) dtb__965) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVarArgs mc0) dtb__964))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dtermUsesVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__967, dtb__968) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__967)))) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__967)) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVarAlts mc0) dtb__968))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dusedInTeleGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__969, dtb__970) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar mc0) dtb__969) then true else ((v_Vuna_dCompiler_dElab_dusedInTeleGo mc0) dtb__970))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dusedInTele = (fun i -> (fun arity -> (fun k -> (fun ts -> ((v_Vuna_dCompiler_dElab_dusedInTeleGo ((bi_add k) arity)) ts)))))

let v_Vuna_dCompiler_dElab_dusedInCtor = (fun i -> (fun arity -> (fun c -> ((((v_Vuna_dCompiler_dElab_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dctorFieldTerms arity) (v_Vuna_dCompiler_dElab_ddtCtorType c))))))

let rec v_Vuna_dCompiler_dElab_dusedInCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__971, dtb__972) -> (if (((v_Vuna_dCompiler_dElab_dusedInCtor mc0) mc1) dtb__971) then true else (((v_Vuna_dCompiler_dElab_dusedInCtors mc0) mc1) dtb__972))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dparamUsedInFieldTys = (fun dd -> (fun i -> (((v_Vuna_dCompiler_dElab_dusedInCtors i) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtDataParams dd))) (v_Vuna_dCompiler_dElab_ddtDataCtors dd))))

let rec v_Vuna_dCompiler_dElab_deraseMaskGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__973, dtb__974) -> ((((v_Vuna_dCompiler_dElab_deraseMaskGo mc0) dtb__974) ((bi_add mc2) 1)) (C_Base_dList_dList_Cons ((v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_deraseMaskGo dd) (v_Vuna_dCompiler_dElab_ddtDataParams dd)) 0) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dcandidateNames = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__975, dtb__976) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__977, dtb__978) -> (match dtb__975 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__979, dtb__980) -> (if dtb__977 then (C_Base_dList_dList_Cons (dtb__979, ((v_Vuna_dCompiler_dElab_dcandidateNames dtb__976) dtb__978))) else ((v_Vuna_dCompiler_dElab_dcandidateNames dtb__976) dtb__978))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dcandidateOf = (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), ((v_Vuna_dCompiler_dElab_dcandidateNames (v_Vuna_dCompiler_dElab_ddtDataParams d)) (v_Vuna_dCompiler_dElab_deraseIndexMask d)))))

let rec v_Vuna_dCompiler_dElab_dindexErasureCandidates = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__981, dtb__982) -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dcandidateOf dtb__981), (v_Vuna_dCompiler_dElab_dindexErasureCandidates dtb__982)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dtermHasMeta = (fun m -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__983) -> ((bi_eq_int dtb__983) m)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__984, dtb__985) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__986) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__987) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__988, dtb__989, dtb__990, dtb__991, dtb__992) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__991) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__992))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__993, dtb__994, dtb__995) -> ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__995)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__996, dtb__997, dtb__998) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__996) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__997))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__999, dtb__1000) -> ((v_Vuna_dCompiler_dElab_danyArgHasMeta m) dtb__1000)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__1001, dtb__1002) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__1001) then true else ((v_Vuna_dCompiler_dElab_danyAltHasMeta m) dtb__1002))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__1003) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__1004) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__1005) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__1006, dtb__1007, dtb__1008) -> (if (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__1006) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__1007)) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__1008))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_danyArgHasMeta = (fun m -> (fun args -> (match args with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__1009, dtb__1010) -> (match dtb__1009 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1011, dtb__1012) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__1011) then true else ((v_Vuna_dCompiler_dElab_danyArgHasMeta m) dtb__1010))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_danyAltHasMeta = (fun m -> (fun alts -> (match alts with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__1013, dtb__1014) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__1013)) then true else ((v_Vuna_dCompiler_dElab_danyAltHasMeta m) dtb__1014))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfindDefWithMeta = (fun defs -> (fun m -> (match defs with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__1015, dtb__1016) -> (match dtb__1015 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1017, dtb__1018) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__1018) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((bi_concat dtb__1017) ((bi_concat " body=") (v_Vuna_dCompiler_dCore_dshowTerm dtb__1018))))) else ((v_Vuna_dCompiler_dElab_dfindDefWithMeta dtb__1016) m))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dmetaOwnerHint = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dfindDefWithMeta (v_Vuna_dCompiler_dElab_decDefs ec)) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1019) -> ((bi_concat " (in `") ((bi_concat dtb__1019) "`)"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dctxDepthOf = (fun g -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtGoalCtx g)))

let rec v_Vuna_dCompiler_dElab_dfindGoal = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1020, dtb__1021) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_ddtGoalMeta dtb__1020)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1020)) else ((v_Vuna_dCompiler_dElab_dfindGoal mc0) dtb__1021))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dunsolvedFromRelevant = (fun i -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (if ((bi_ge_int i) stop) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dCore_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1022) -> (((((v_Vuna_dCompiler_dElab_dunsolvedFromRelevant ((bi_add i) 1)) stop) sols) relevant) goals)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dmemMetaId i) relevant) then true else (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dfindGoal i) goals))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i)) else (((((v_Vuna_dCompiler_dElab_dunsolvedFromRelevant ((bi_add i) 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dunsolvedFromRelevant 0) (v_Vuna_dCompiler_dElab_decNext ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dElab_drelevantMetas ec)) (v_Vuna_dCompiler_dElab_decGoals ec)))

let v_Vuna_dCompiler_dElab_dunsolvedMessage = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dfindGoal m) (v_Vuna_dCompiler_dElab_decGoals ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1023) -> ((bi_concat "DT: unsolved hole ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dElab_ddtGoalSpan dtb__1023))) ((bi_concat " with goal ") ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepthOf dtb__1023)) (v_Vuna_dCompiler_dElab_ddtGoalType dtb__1023)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat "DT: unsolved metavariable ?") ((bi_concat (bi_strFromInt m)) ((v_Vuna_dCompiler_dElab_dmetaOwnerHint ec) m)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddtGoalInfoSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo (dtb__1024, dtb__1025, dtb__1026) -> dtb__1024
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalInfoGoal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo (dtb__1027, dtb__1028, dtb__1029) -> dtb__1028
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalInfoCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo (dtb__1030, dtb__1031, dtb__1032) -> dtb__1032
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dzonkGoal = (fun sols -> (fun v -> ((((v_Vuna_dCompiler_dCore_dforce C_Base_dList_dList_Nil) sols) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) v)))

let rec v_Vuna_dCompiler_dElab_dctxEntriesAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1033, dtb__1034) -> (match dtb__1033 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1035, dtb__1036) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1035, ((v_Vuna_dCompiler_dCore_dshowValueAt mc2) ((v_Vuna_dCompiler_dCore_deval (((v_Vuna_dCompiler_dElab_dctxEnvAt (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1035, dtb__1036)), dtb__1034))) 0) mc2)) (((v_Vuna_dCompiler_dCore_dshift 0) ((bi_add mc1) 1)) dtb__1036))))), (((v_Vuna_dCompiler_dElab_dctxEntriesAt dtb__1034) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dctxEntriesAt items) 0) (v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dgoalInfoOf = (fun sols -> (fun g -> (C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo ((v_Vuna_dCompiler_dElab_ddtGoalSpan g), ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dzonkGoal sols) (v_Vuna_dCompiler_dElab_ddtGoalType g))), (v_Vuna_dCompiler_dElab_dctxEntriesOf (v_Vuna_dCompiler_dElab_ddtGoalCtx g))))))

let v_Vuna_dCompiler_dElab_dbinderRig = (fun implicit -> (fun dom -> ((v_Vuna_dCompiler_dCore_drigOfBinder implicit) (v_Vuna_dCompiler_dCore_disTypeValue dom))))

let rec v_Vuna_dCompiler_dElab_dsplitKind = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1037, dtb__1038, dtb__1039, dtb__1040, dtb__1041) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1037, ((v_Vuna_dCompiler_dElab_dbinderRig dtb__1038) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1040)))), (v_Vuna_dCompiler_dElab_dsplitKind dtb__1041)))
  | _ -> C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dteleOf = (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1042, dtb__1043, dtb__1044, dtb__1045, dtb__1046) -> ((fun domVal -> ((fun v -> ((fun rig -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1042, rig)), ((v_Vuna_dCompiler_dElab_dteleOf dtb__1046) (C_Base_dList_dList_Cons (v, env)))))) ((v_Vuna_dCompiler_dElab_dbinderRig dtb__1043) domVal))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1042, (v_Base_dList_dlength env), C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dCore_deval env) dtb__1045))
  | _ -> C_Base_dList_dList_Nil
)))

let v_Vuna_dCompiler_dElab_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dteleOf ty) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dbindCtorGo = (fun ctx -> (fun ty -> (fun subpats -> (fun acc -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1047, dtb__1048, dtb__1049, dtb__1050, dtb__1051) -> ((fun domVal -> (if dtb__1048 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) dtb__1051) subpats) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (famName, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), (v_Vuna_dCompiler_dElab_dbaBinders acc))), (v_Vuna_dCompiler_dElab_dbaPending acc))))) (((v_Vuna_dCompiler_dElab_dctxBindValue famName) domVal) ctx))) ((bi_concat dtb__1047) "#fam")) else (match subpats with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: case branch has too few arguments for its constructor"))
  | C_Base_dList_dList_Cons (dtb__1052, dtb__1053) -> (match dtb__1052 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1054, dtb__1055) -> ((((((v_Vuna_dCompiler_dElab_dbindCtorBinder ctx) domVal) dtb__1051) dtb__1054) dtb__1053) acc)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1056) -> ((((((v_Vuna_dCompiler_dElab_dbindCtorBinder ctx) domVal) dtb__1051) "_") dtb__1053) acc)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__1057, dtb__1058, dtb__1059) -> ((fun fresh -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) dtb__1051) dtb__1053) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fresh, ((v_Vuna_dCompiler_dElab_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dbaBinders acc))), ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dbaPending acc)) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (dtb__1052, fresh)), C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dctxBindValue fresh) domVal) ctx))) (v_Vuna_dCompiler_dElab_dfreshPatName (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dbaPending acc))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__1060, dtb__1061) -> ((((((v_Vuna_dCompiler_dElab_dmkPendingBinder ctx) domVal) dtb__1051) dtb__1052) dtb__1053) acc)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__1062, dtb__1063) -> ((((((v_Vuna_dCompiler_dElab_dmkPendingBinder ctx) domVal) dtb__1051) dtb__1052) dtb__1053) acc)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1052)) "DT: nested patterns must be constructor patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1050))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (ctx, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dbaBinders acc)), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dbaPending acc), subpats))))))))
)))))
and v_Vuna_dCompiler_dElab_dmkPendingBinder = (fun ctx -> (fun domVal -> (fun cod -> (fun p -> (fun rest -> (fun acc -> ((fun fresh -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) cod) rest) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fresh, ((v_Vuna_dCompiler_dElab_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dbaBinders acc))), ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dbaPending acc)) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (p, fresh)), C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dctxBindValue fresh) domVal) ctx))) (v_Vuna_dCompiler_dElab_dfreshPatName (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dbaPending acc))))))))))
and v_Vuna_dCompiler_dElab_dbindCtorBinder = (fun ctx -> (fun domVal -> (fun cod -> (fun binderName -> (fun rest -> (fun acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) cod) rest) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (binderName, ((v_Vuna_dCompiler_dElab_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dbaBinders acc))), (v_Vuna_dCompiler_dElab_dbaPending acc))))) (((v_Vuna_dCompiler_dElab_dctxBindValue binderName) domVal) ctx))))))))

let v_Vuna_dCompiler_dElab_dbindCtorTele = (fun ctx -> (fun ty -> (fun subpats -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx) ty) subpats) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_dbranchReachable = (fun ctx -> (fun ec -> (fun idxs -> (fun ctor -> (match (((v_Vuna_dCompiler_dElab_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_ddtCtorType ctor)) (v_Vuna_dCompiler_dElab_dwildArgs (v_Vuna_dCompiler_dElab_dctorExplicitArity (v_Vuna_dCompiler_dElab_ddtCtorType ctor)))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1064) -> true
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1065) -> (match dtb__1065 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1066, dtb__1067) -> (match dtb__1067 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1068, dtb__1069) -> (match dtb__1069 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1070, dtb__1071) -> (if (v_Vuna_dCompiler_dElab_dnonEmpty dtb__1071) then true else (match ((((((v_Vuna_dCompiler_dElab_dunifyIdxList ec) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dctxDepth dtb__1066)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dElab_dctorResultValsIn dtb__1066) ctor)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ()))) idxs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1072) -> false
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1073) -> (v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dctxHasEmptyBinder ec) ((v_Vuna_dCompiler_dElab_dctxRefine dtb__1066) dtb__1073)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dcheckCovered = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dList_dList_Cons (dtb__1074, dtb__1075) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtCtorName dtb__1074)) mc4) then ((((((((v_Vuna_dCompiler_dElab_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__1075) else (if (v_Vuna_dCompiler_dElab_decTrusted mc1) then ((((((((v_Vuna_dCompiler_dElab_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__1075) else (if ((((v_Vuna_dCompiler_dElab_dbranchReachable mc0) mc1) mc3) dtb__1074) then ((v_Vuna_dCompiler_dElab_derrAt mc6) ((bi_concat "DT: case is not exhaustive: missing ") (v_Vuna_dCompiler_dElab_ddtCtorName dtb__1074))) else ((((((((v_Vuna_dCompiler_dElab_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__1075))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dcheckCoverage = (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun alts -> (fun sp -> ((((((((v_Vuna_dCompiler_dElab_dcheckCovered ctx) ec) dd) idxs) (v_Vuna_dCompiler_dElab_daltNames alts)) alts) sp) (v_Vuna_dCompiler_dElab_ddtDataCtors dd))))))))

let v_Vuna_dCompiler_dElab_dcheckCaseDone = (fun ec -> (fun ctx -> (fun dd -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (fun scrutTerm -> (fun altTerms -> (if (v_Vuna_dCompiler_dElab_dhasCatchAll alts) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms)), ec)))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dcheckCoverage ctx) ec) dd) idxs) alts) sp)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms)), ec))))))))))))))))

let rec v_Vuna_dCompiler_dElab_disTypeLayerValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__1076) -> true
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1077, dtb__1078, dtb__1079, dtb__1080, dtb__1081) -> (if (v_Vuna_dCompiler_dElab_disTypeLayerValue dtb__1080) then (v_Vuna_dCompiler_dElab_disTypeLayerValue ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1081) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1077, 0, C_Base_dList_dList_Nil)))))) else false)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dtypeLayerRig = (fun implicit -> (fun dom -> (if implicit then C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 else (if (v_Vuna_dCompiler_dElab_disTypeLayerValue dom) then C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 else C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))))

let v_Vuna_dCompiler_dElab_disDataHead = (fun datas -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1082) -> (match dtb__1082 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1083, dtb__1084) -> (match ((v_Vuna_dCompiler_dElab_ddtDataLookup dtb__1083) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1085) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_disIndexDomain = (fun ec -> (fun dom -> (if (if (v_Vuna_dCompiler_dCore_disTypeValue dom) then true else (v_Vuna_dCompiler_dElab_disTypeLayerValue dom)) then true else ((v_Vuna_dCompiler_dElab_disDataHead (v_Vuna_dCompiler_dElab_decDatas ec)) ((v_Vuna_dCompiler_dElab_dforceVal ec) dom)))))

let rec v_Vuna_dCompiler_dElab_dinstantiateNullaryCtor = (fun ec -> (fun ctx -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1086, dtb__1087, dtb__1088, dtb__1089, dtb__1090) -> (if dtb__1087 then (if ((v_Vuna_dCompiler_dElab_disIndexDomain ec) dtb__1089) then (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1091, dtb__1092) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dinstantiateNullaryCtor dtb__1092) ctx) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1090) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1091)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1093, dtb__1094) -> (match dtb__1094 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1095, dtb__1096) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1093, (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__1091, dtb__1095)), dtb__1096))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, ec))))))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, ec)))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (v, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, ec))))))
))))

let v_Vuna_dCompiler_dElab_dfreshVarValue = (fun name -> (fun level -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (name, level, C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_dneutralHeadName = (fun n -> (match n with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1097, dtb__1098, dtb__1099) -> dtb__1097
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1100, dtb__1101) -> dtb__1100
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_disBoolGlobal = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1102, dtb__1103) -> ((bi_eq_str dtb__1103) "Bool")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_disBoolType = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1104) -> (v_Vuna_dCompiler_dElab_disBoolGlobal (v_Vuna_dCompiler_dElab_dneutralHeadName dtb__1104))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_disSortVal = (fun ec -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__1105) -> true
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dallImplicitPrefix = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1106, dtb__1107, dtb__1108, dtb__1109, dtb__1110) -> (if dtb__1107 then (v_Vuna_dCompiler_dElab_dallImplicitPrefix dtb__1110) else false)
  | _ -> true
))

let v_Vuna_dCompiler_dElab_dctorRefTerm = (fun datas -> (fun name -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup name) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1111) -> (if (v_Vuna_dCompiler_dElab_disBoolBaseName (v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1111)) then (v_Vuna_dCompiler_dElab_dboolCtorTerm name) else (if ((bi_eq_generic (v_Vuna_dCompiler_dElab_ddtCtorTelescope dtb__1111)) C_Base_dList_dList_Nil) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (name, C_Base_dList_dList_Nil)) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinferCtorRef = (fun ec -> (fun ctx -> (fun name -> (fun tyTerm -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1112) -> (if (v_Vuna_dCompiler_dElab_disBoolBaseName (v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1112)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dboolCtorTerm name), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ((v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1112), C_Base_dList_dList_Nil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dhasNoExplicitPi ec) ctorTy) then (match (((v_Vuna_dCompiler_dElab_dinstantiateNullaryCtor ec) ctx) ctorTy) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1113) -> (match dtb__1113 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1114, dtb__1115) -> (match dtb__1115 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1116, dtb__1117) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dnullaryCtorTerm dtb__1112) dtb__1116), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1114, dtb__1117))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1118) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1118))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (ctorTy, ec)))))))) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) tyTerm)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dfoldAppTerms = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1119, dtb__1120) -> (match dtb__1119 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1121, dtb__1122) -> ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (mc0, dtb__1121, dtb__1122))) dtb__1120)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dmethodProjZip = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__1123, dtb__1124) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__1125, dtb__1126) -> (match dtb__1123 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1127, dtb__1128) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1127, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (mc1, true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, mc2, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_ddictTypeName mc0)))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (mc1, 0)), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), C_Base_dList_dList_Nil))), (((v_Vuna_dCompiler_dCore_dshift 0) 1) dtb__1125))))))), ((((((v_Vuna_dCompiler_dElab_dmethodProjZip mc0) mc1) mc2) ((bi_add mc3) 1)) dtb__1124) dtb__1126)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dmethodProjections = (fun tname -> (fun pname -> (fun pKind -> (fun methods -> (fun fieldTys -> ((((((v_Vuna_dCompiler_dElab_dmethodProjZip tname) pname) pKind) 0) methods) fieldTys))))))

let v_Vuna_dCompiler_dElab_dprojectionBody = (fun ctor -> (fun fieldIdx -> (fun rigs -> (fun nFields -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam ("_p", C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam ("_d", C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, lamArgs))))) (((v_Vuna_dCompiler_dElab_dmethodArgLams rigs) 0) caseTerm))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar ("_d", dictIdx)), (C_Base_dList_dList_Cons (alt, C_Base_dList_dList_Nil)))))) (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (ctor, binders, applied)))) (v_Vuna_dCompiler_dElab_dfieldBinderNames nFields))) ((v_Vuna_dCompiler_dElab_dfoldAppTerms fieldVar) argPairs))) ((v_Vuna_dCompiler_dElab_dmethodArgTerms rigs) nFields))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar ((v_Vuna_dCompiler_dElab_dfieldVarName fieldIdx), ((bi_sub ((bi_sub nFields) 1)) fieldIdx))))) arity)) (v_Base_dList_dlength rigs))))))

let rec v_Vuna_dCompiler_dElab_dprojectionDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1129, dtb__1130) -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__1131, dtb__1132) -> (match dtb__1129 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1133, dtb__1134) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1133, ((((v_Vuna_dCompiler_dElab_dprojectionBody mc0) mc3) ((v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dbinderRig) dtb__1131)) mc4))), (((((v_Vuna_dCompiler_dElab_dprojectionDefsGo mc0) dtb__1130) dtb__1132) ((bi_add mc3) 1)) mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dprojectionDefs = (fun tname -> (fun pname -> (fun methods -> (fun fieldTys -> (fun nFields -> (((((v_Vuna_dCompiler_dElab_dprojectionDefsGo (v_Vuna_dCompiler_dElab_ddictCtorName tname)) methods) fieldTys) 0) nFields))))))

let v_Vuna_dCompiler_dElab_dctorResultType = (fun cls -> (fun arg -> ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName cls))))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (arg, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dElab_dinjectDictGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1135, dtb__1136, dtb__1137) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1135, dtb__1136, (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) ((bi_add depth) 1)) dtb__1137)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1138, dtb__1139, dtb__1140, dtb__1141, dtb__1142) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1138, dtb__1139, dtb__1140, (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1141), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) ((bi_add depth) 1)) dtb__1142)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__1143, dtb__1144, dtb__1145) -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1146) -> (match dtb__1146 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1147, dtb__1148) -> ((((((v_Vuna_dCompiler_dElab_drewriteTaggedSpine defName) dName) appPos) depth) dtb__1147) dtb__1148)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1143), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1144), dtb__1145))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__1149, dtb__1150) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__1149, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__1150)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__1151, dtb__1152) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1151), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dElab_dinjectAltGo defName) dName) appPos) depth)) dtb__1152)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__1153, dtb__1154, dtb__1155) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1153), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1154), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1155)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dElab_dinjectAltGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__1156, dtb__1157, dtb__1158) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__1156, dtb__1157, (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) ((bi_add depth) (v_Base_dList_dlength dtb__1157))) dtb__1158)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_drewriteTaggedSpine = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun g -> (fun args -> ((fun args2 -> (if (if (if ((bi_eq_str g) defName) then ((bi_gt_int (v_Base_dList_dlength args2)) appPos) else false) then ((bi_gt_int depth) appPos) else false) then ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dinsertArgAt appPos) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dName, ((bi_sub ((bi_sub depth) appPos)) 1))), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))) args2)) else ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (g))) args2))) ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) args))))))))

let v_Vuna_dCompiler_dElab_dinsertDictCalls = (fun defName -> (fun dName -> (fun appPos -> (fun t -> (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) 0) t)))))

let rec v_Vuna_dCompiler_dElab_dliftFreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__1159, dtb__1160) -> (match dtb__1159 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1161, dtb__1162) -> ((fun dName -> ((fun argIdx -> ((fun quoteDepth -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun ec2 -> ((((((v_Vuna_dCompiler_dElab_dliftFreeDictGoalsGo mc0) ec2) ty2) body3) ((bi_add mc4) 1)) dtb__1160)) (((v_Vuna_dCompiler_dElab_dsolveLiftedMeta mc1) dName) dtb__1161))) ((((v_Vuna_dCompiler_dElab_dinsertDictCalls mc0) dName) ((bi_add argIdx) 1)) body2))) ((((v_Vuna_dCompiler_dCore_dsubstMetaVar dtb__1161) dName) ((bi_add argIdx) 2)) (((v_Vuna_dCompiler_dCore_dinsertLamBinder dName) argIdx) mc3)))) ((((v_Vuna_dCompiler_dCore_dinsertDictBinder dName) argIdx) dictDom) mc2))) (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAt quoteDepth) (v_Vuna_dCompiler_dElab_decSols mc1)) ((v_Vuna_dCompiler_dCore_dquote quoteDepth) dtb__1162)))) ((bi_add (v_Vuna_dCompiler_dElab_dleadingImplicitCount mc2)) mc4))) ((bi_add ((v_Vuna_dCompiler_dElab_dmaxInt 0) ((bi_sub (v_Vuna_dCompiler_dElab_dleadingImplicitCount mc2)) 1))) mc4))) ((bi_concat "d") (bi_strFromInt dtb__1161)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, (C_Base_dPair_dPair_Base_dPair_dPair (mc3, mc1))))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1163, dtb__1164) -> (match dtb__1163 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1165, dtb__1166) -> (match dtb__1165 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__1167, dtb__1168, dtb__1169, dtb__1170, dtb__1171) -> (match (v_Vuna_dCompiler_dElab_dinstanceHeadName dtb__1169) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1171) "DT: instance head must be an interface application (e.g. Show Int)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1172) -> (match ((v_Vuna_dCompiler_dElab_dfindClass dtb__1172) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1171) ((bi_concat "DT: unknown interface ") ((bi_concat dtb__1172) " in instance head")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1173) -> ((fun iname -> ((fun ty -> ((fun named -> (match (((((v_Vuna_dCompiler_dElab_dfindDuplicateInstance mc3) iname) named) ty) mc6) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1174) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1171) ((bi_concat "DT: duplicate instance ") iname))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo dtb__1164) mc1) mc2) mc3) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (iname, ty, named)), mc5))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (iname, ty, named)), mc6)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dinstanceIsNamed dtb__1167))) ((v_Vuna_dCompiler_dElab_dctorResultType dtb__1173) (v_Vuna_dCompiler_dElab_dinstanceHeadTerm dtb__1169)))) (((v_Vuna_dCompiler_dElab_dinstanceName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1173)) dtb__1167) dtb__1169))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo dtb__1164) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dfoldlAddInst mc3) (v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dcheckInstanceHeads = (fun decls -> (fun classes -> (fun globals -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo decls) classes) globals) ec) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dElab_dinstantiateAllImplicit = (fun ctx -> (fun ec -> (fun head -> (fun ty -> (fun acc -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) ty) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1175, dtb__1176, dtb__1177, dtb__1178, dtb__1179) -> (if dtb__1176 then ((fun m -> (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1180, dtb__1181) -> (((((v_Vuna_dCompiler_dElab_dinstantiateAllImplicit ctx) dtb__1181) head) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1179) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (m, C_Base_dList_dList_Nil)))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1180, ((v_Vuna_dCompiler_dElab_dbinderRig true) dtb__1178))), acc)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decNext ec)) else (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec)))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec))))
))))))

let v_Vuna_dCompiler_dElab_dctorAppTerm = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1182) -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1182) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1183) -> (if (v_Vuna_dCompiler_dElab_disBoolBaseName (v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1183)) then (v_Vuna_dCompiler_dElab_dboolCtorTerm dtb__1182) else (if ((bi_ge_int (v_Base_dList_dlength mc2)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtCtorTelescope dtb__1183))) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__1182, mc2)) else ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1182))) mc2)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1182))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dfoldAppTerms mc1) mc2)
))))

let v_Vuna_dCompiler_dElab_disDictFamily = (fun ec -> (fun g -> ((v_Base_dList_dmemName g) ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName c)))) (v_Vuna_dCompiler_dElab_decClasses ec)))))

let v_Vuna_dCompiler_dElab_disDictValue = (fun ec -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1184) -> (match dtb__1184 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1185, dtb__1186) -> ((v_Vuna_dCompiler_dElab_disDictFamily ec) dtb__1185)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_disDictDomain = (fun ec -> (fun dom -> ((v_Vuna_dCompiler_dElab_disDictValue ec) ((v_Vuna_dCompiler_dElab_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dsubstDictTerm = (fun ec -> (fun t -> ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas (v_Vuna_dCompiler_dElab_decSols ec)) t)))

let v_Vuna_dCompiler_dElab_drezonkDefs = (fun ec -> (fun defs -> ((v_Base_dList_dmap (fun d -> (C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef ((v_Vuna_dCompiler_dElab_ddtDefName d), (v_Vuna_dCompiler_dElab_ddtDefType d), ((v_Vuna_dCompiler_dElab_dsubstDictTerm ec) (v_Vuna_dCompiler_dElab_ddtDefBody d)))))) defs)))

let v_Vuna_dCompiler_dElab_dinstanceDefsOf = (fun ecBefore -> (fun ecAfter -> (fun gs -> ((v_Base_dList_dmap (fun g -> (C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef ((v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_ddefTypeOrDefault gs) (v_Base_dPair_dfirstOf g)), ((v_Vuna_dCompiler_dElab_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_ddefBodyOf (v_Vuna_dCompiler_dElab_decDefs ecAfter)) (v_Base_dPair_dfirstOf g))))))) gs))))

let rec v_Vuna_dCompiler_dElab_dfilterInstances = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__1187, dtb__1188) -> ((fun hd -> (match (((((v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs mc0)) mc3) 0) mc1) hd) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1189) -> ((((v_Vuna_dCompiler_dElab_dfilterInstances mc0) mc1) dtb__1188) mc3)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1190) -> (match ((((v_Vuna_dCompiler_dElab_dfilterInstances mc0) mc1) dtb__1188) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1191, dtb__1192) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__1187, dtb__1191)), dtb__1190))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dforceVal mc0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtInstHead dtb__1187))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc3))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1193, dtb__1194) -> ((bi_concat ", ") ((bi_concat (v_Vuna_dCompiler_dElab_ddtInstName dtb__1193)) (v_Vuna_dCompiler_dElab_djoinRestInstNames dtb__1194)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_djoinInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1195, dtb__1196) -> ((bi_concat (v_Vuna_dCompiler_dElab_ddtInstName dtb__1195)) (v_Vuna_dCompiler_dElab_djoinRestInstNames dtb__1196))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dsearchInstance = (fun ec -> (fun dom -> (fun sp -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1197, dtb__1198) -> (match dtb__1197 with
  | C_Base_dList_dList_Cons (dtb__1199, dtb__1200) -> (match dtb__1200 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_ddtInstName dtb__1199))), ((v_Vuna_dCompiler_dElab_decPutSols ec) dtb__1198)))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: ambiguous instance for ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowValue dom)) ((bi_concat " (candidates: ") ((bi_concat (v_Vuna_dCompiler_dElab_djoinInstNames dtb__1197)) ")")))))
)
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: no instance found for ") (v_Vuna_dCompiler_dCore_dshowValue dom)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dfilterInstances ec) dom) ((v_Base_dList_dfilter (fun i -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_ddtInstNamed i)))) (v_Vuna_dCompiler_dElab_decInsts ec))) (v_Vuna_dCompiler_dElab_decSols ec))))))

let v_Vuna_dCompiler_dElab_dmethodNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1201, dtb__1202) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1201))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dinstNamedLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1203, dtb__1204) -> (if (if (v_Vuna_dCompiler_dElab_ddtInstNamed dtb__1203) then ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtInstName dtb__1203)) mc0) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1203)) else ((v_Vuna_dCompiler_dElab_dinstNamedLookup mc0) dtb__1204))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinstDictName = (fun inst -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp (v_Vuna_dCompiler_dElab_ddtInstHead inst)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1205) -> (match dtb__1205 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1206, dtb__1207) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1206))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dinstHeadArg = (fun inst -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp (v_Vuna_dCompiler_dElab_ddtInstHead inst)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1208) -> (match dtb__1208 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1209, dtb__1210) -> (match dtb__1210 with
  | C_Base_dList_dList_Cons (dtb__1211, dtb__1212) -> (v_Base_dPair_dfirstOf dtb__1211)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dfindClassByDict = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1213, dtb__1214) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1213))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1213)) else ((v_Vuna_dCompiler_dElab_dfindClassByDict mc0) dtb__1214))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinstClassOfDict = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1215) -> ((v_Vuna_dCompiler_dElab_dfindClassByDict dtb__1215) mc1)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dclassFieldTyAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1216, dtb__1217) -> (if ((bi_le_int mc0) 0) then dtb__1216 else ((v_Vuna_dCompiler_dElab_dclassFieldTyAt ((bi_sub mc0) 1)) dtb__1217))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddictFamilyNameOf = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dom) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1218) -> (match dtb__1218 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1219, dtb__1220) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1219))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dElab_ddictArgKind = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictFamilyNameOf ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1221) -> (match ((v_Vuna_dCompiler_dElab_ddtDataLookup dtb__1221) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1222) -> (match (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__1222) with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__1223, dtb__1224) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1223))) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1225, dtb__1226, dtb__1227, dtb__1228, dtb__1229) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1228))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dneutralHeadOrSelf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1230) -> (match dtb__1230 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1231, dtb__1232) -> (match dtb__1232 with
  | C_Base_dList_dList_Cons (dtb__1233, dtb__1234) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1231, C_Base_dList_dList_Nil))))
  | _ -> v
)
  | _ -> v
)
  | _ -> v
))

let v_Vuna_dCompiler_dElab_dargHeadMatchesKind = (fun globals -> (fun ec -> (fun ctx -> (fun forced -> (fun argKind -> (match (v_Vuna_dCompiler_dElab_dneutralHeadOrSelf forced) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1235) -> (match dtb__1235 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1236, dtb__1237) -> (match dtb__1237 with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1236) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1238) -> (match ((((v_Vuna_dCompiler_dElab_dconvEc ec) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) argKind) ((v_Vuna_dCompiler_dElab_dforceVal ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1238))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1239) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1240) -> false
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))))))

let v_Vuna_dCompiler_dElab_ddictClassArg = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dom) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1241) -> (match dtb__1241 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1242, dtb__1243) -> (match dtb__1243 with
  | C_Base_dList_dList_Cons (dtb__1244, dtb__1245) -> (match dtb__1245 with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1244))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dElab_dclassArgIndex = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1246) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dtb__1246) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1247) -> (match dtb__1247 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1248, dtb__1249, dtb__1250) -> dtb__1249
  | _ -> 0
)
  | _ -> 0
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> 0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dresolveDictGoals = (fun globals -> (fun ec -> (match (v_Vuna_dCompiler_dElab_decDictGoals ec) with
  | C_Base_dList_dList_Nil -> ec
  | C_Base_dList_dList_Cons (dtb__1251, dtb__1252) -> (match dtb__1251 with
  | C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (dtb__1253, dtb__1254) -> ((fun ec1 -> ((fun forced -> ((fun keep -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec1) forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1255) -> (if ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_decSols ec1)) dtb__1255) then keep else (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec1) forced) (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1256) -> (match dtb__1256 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1257, dtb__1258) -> (match ((((((v_Vuna_dCompiler_dCore_dsolveMeta (v_Vuna_dCompiler_dElab_decDefs dtb__1258)) (v_Vuna_dCompiler_dElab_decSols dtb__1258)) 0) dtb__1253) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1257)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1259) -> (match (((v_Vuna_dCompiler_dElab_dcheckSolsDelta dtb__1258) (v_Vuna_dCompiler_dElab_decSols dtb__1258)) dtb__1259) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1260) -> keep
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1261) -> ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) ((v_Vuna_dCompiler_dElab_decPutSols dtb__1258) dtb__1259))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1262) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1263) -> keep
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> keep
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_decAddDictGoal ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) ec1)) (C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (dtb__1253, forced))))) ((v_Vuna_dCompiler_dElab_dforceVal ec1) dtb__1254))) ((v_Vuna_dCompiler_dElab_decPutDictGoals ec) dtb__1252))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dresolveDictGoalsFix = (fun globals -> (fun ec -> (fun n -> ((fun ec2 -> (if ((bi_le_int n) 0) then ec2 else (if ((bi_lt_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_decDictGoals ec2))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_decDictGoals ec))) then (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix globals) ec2) ((bi_sub n) 1)) else ec2))) ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) ec)))))

let v_Vuna_dCompiler_dElab_disRigidDictArg = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1264) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dtb__1264) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1265) -> (match dtb__1265 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1266, dtb__1267, dtb__1268) -> true
  | _ -> false
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1269, dtb__1270) -> (match dtb__1269 with
  | C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (dtb__1271, dtb__1272) -> (if ((v_Vuna_dCompiler_dElab_disRigidDictArg mc0) dtb__1272) then (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__1271) (v_Vuna_dCompiler_dElab_decSols mc0)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1273) -> ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo mc0) dtb__1270)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1271, dtb__1272)), ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo mc0) dtb__1270)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo mc0) dtb__1270))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dfreeDictGoals = (fun ec -> ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo ec) (v_Vuna_dCompiler_dElab_decDictGoals ec)))

let v_Vuna_dCompiler_dElab_dliftFreeDictGoals = (fun defName -> (fun ec -> (fun ty -> (fun body -> ((((((v_Vuna_dCompiler_dElab_dliftFreeDictGoalsGo defName) ec) ty) body) 0) (v_Vuna_dCompiler_dElab_dfreeDictGoals ec))))))

let v_Vuna_dCompiler_dElab_dwhereBindingName = (fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1274, dtb__1275) -> dtb__1274
  | _ -> "_"
))

let rec v_Vuna_dCompiler_dElab_dcheckWhereSigs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1276, dtb__1277) -> (match (v_Base_dPair_dsecondOf dtb__1276) with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__1278, dtb__1279, dtb__1280) -> (v_Vuna_dCompiler_dElab_dcheckWhereSigs dtb__1277)
  | _ -> ((fun name -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan (v_Base_dPair_dfirstOf dtb__1276))) ((bi_concat "DT: where binding `") ((bi_concat name) ((bi_concat "` needs a type signature (write `") ((bi_concat name) " : <type>` before the clause)")))))) (v_Vuna_dCompiler_dElab_dwhereBindingName (v_Base_dPair_dfirstOf dtb__1276)))
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dgenericEqApp = (fun name -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> ((fun rt -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (rt)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))) (if ((bi_eq_str name) "==") then "bi_eq_generic" else "bi_neq_generic"))))))

let v_Vuna_dCompiler_dElab_ddeferEqDict = (fun globals -> (fun ctx -> (fun mname -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun dictTy -> (fun ec -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1281, dtb__1282) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1281, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_decAddDictGoal dtb__1282) (C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (m, dictTy)))))))))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decNext ec)))))))))))

let v_Vuna_dCompiler_dElab_dcmpOps = fun () -> (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", C_Base_dList_dList_Nil))))))))

let v_Vuna_dCompiler_dElab_disCmpOp = (fun name -> ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dElab_dcmpOps ())))

let v_Vuna_dCompiler_dElab_dcmpMethodName = (fun name -> (if ((bi_eq_str name) "<") then "lt" else (if ((bi_eq_str name) "<=") then "le" else (if ((bi_eq_str name) ">") then "gt" else "ge"))))

let v_Vuna_dCompiler_dElab_dcmpGenericName = (fun name -> (if ((bi_eq_str name) "<") then "bi_lt_generic" else (if ((bi_eq_str name) "<=") then "bi_le_generic" else (if ((bi_eq_str name) ">") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dcmpRuntimeName = (fun name -> (fun tyName -> (if ((bi_eq_str tyName) "Int") then (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int"))))) else (if ((bi_eq_str tyName) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dcmpGenericName name))) else (if ((bi_eq_str tyName) "Bool") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dcmpGenericName name))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: `") ((bi_concat name) ((bi_concat "` is not defined for ") ((bi_concat tyName) " (Ord instance required)")))))))))))

let v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1283) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dtb__1283) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__1284, dtb__1285) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__1284) (v_Vuna_dCompiler_dElab_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1286) -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dboolShortCircuit = (fun name -> (fun a -> (fun b -> (if ((bi_eq_str name) "&&") then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (a, b, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (false)))) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (a, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (true)), b))))))

let v_Vuna_dCompiler_dElab_dhasFamParams = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__1287, dtb__1288, dtb__1289, dtb__1290, dtb__1291) -> ((bi_neq_str dtb__1287) "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1292, dtb__1293) -> dtb__1293
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1294, dtb__1295) -> (match dtb__1294 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1296, dtb__1297, dtb__1298, dtb__1299) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dbaseNameOf dtb__1296)) mc0) then ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo mc0) dtb__1295) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1296)))
  | _ -> ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo mc0) dtb__1295)
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo ((v_Base_dList_dmap (fun m -> (v_Vuna_dCompiler_dElab_dbaseNameOf (v_Base_dPair_dfirstOf m)))) (v_Vuna_dCompiler_dElab_ddtClassMethods cls))) methods)))

let rec v_Vuna_dCompiler_dElab_dhasMethodClauses = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1300, dtb__1301) -> (match dtb__1300 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1302, dtb__1303, dtb__1304, dtb__1305) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf dtb__1302)) mc0) then true else ((v_Vuna_dCompiler_dElab_dhasMethodClauses mc0) dtb__1301))
  | _ -> ((v_Vuna_dCompiler_dElab_dhasMethodClauses mc0) dtb__1301)
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1306, dtb__1307) -> (if ((v_Vuna_dCompiler_dElab_dhasMethodClauses (v_Vuna_dCompiler_dElab_dbaseNameOf (v_Base_dPair_dfirstOf dtb__1306))) mc1) then ((v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethodGo dtb__1307) mc1) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dfirstOf dtb__1306))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethodGo (v_Vuna_dCompiler_dElab_ddtClassMethods cls)) methods)))

let rec v_Vuna_dCompiler_dElab_dfindClassByShortName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1308, dtb__1309) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf (v_Vuna_dCompiler_dElab_ddtClassName dtb__1308))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1308)) else ((v_Vuna_dCompiler_dElab_dfindClassByShortName mc0) dtb__1309))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dmethodClausesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1310, dtb__1311) -> (match dtb__1310 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1312, dtb__1313, dtb__1314, dtb__1315) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf dtb__1312)) (v_Vuna_dCompiler_dElab_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dmethodClausesGo mc0) dtb__1311) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1313, dtb__1314)), mc2))) else (((v_Vuna_dCompiler_dElab_dmethodClausesGo mc0) dtb__1311) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dmethodClausesGo mc0) dtb__1311) mc2)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dmethodClausesNamed = (fun mname -> (fun decls -> (((v_Vuna_dCompiler_dElab_dmethodClausesGo mname) decls) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dmethodNameMatches = (fun a -> (fun b -> (if ((bi_eq_str a) b) then true else ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf a)) (v_Vuna_dCompiler_dElab_dbaseNameOf b)))))

let rec v_Vuna_dCompiler_dElab_dclassMethodIndexGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1316, dtb__1317) -> (if ((v_Vuna_dCompiler_dElab_dmethodNameMatches mc0) (v_Base_dPair_dfirstOf dtb__1316)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dElab_dclassMethodIndexGo mc0) dtb__1317) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dclassMethodIndex = (fun mname -> (fun methods -> (((v_Vuna_dCompiler_dElab_dclassMethodIndexGo mname) methods) 0)))

let v_Vuna_dCompiler_dElab_dinferInstSel = (fun globals -> (fun ctx -> (fun ec -> (fun meth -> (fun iname -> (fun sp -> (match (v_Vuna_dCompiler_dElab_dmethodNameOf meth) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: @instance can only be used with a trait method (write `method @instance`)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1318) -> (match ((v_Vuna_dCompiler_dElab_dinstNamedLookup iname) (v_Vuna_dCompiler_dElab_decInsts ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: unknown named instance ") iname))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1319) -> (match ((v_Vuna_dCompiler_dElab_dinstClassOfDict (v_Vuna_dCompiler_dElab_dinstDictName dtb__1319)) (v_Vuna_dCompiler_dElab_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: instance ") ((bi_concat iname) " is not an instance of a trait")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1320) -> (match ((v_Vuna_dCompiler_dElab_dclassMethodIndex dtb__1318) (v_Vuna_dCompiler_dElab_ddtClassMethods dtb__1320)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: `") ((bi_concat dtb__1318) ((bi_concat "` is not a method of trait ") (v_Vuna_dCompiler_dElab_ddtClassName dtb__1320)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1321) -> ((fun nFields -> ((fun fty -> ((fun instTy -> ((fun rigs -> ((fun fieldVar -> ((fun applied -> ((fun alt -> ((fun proj -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (proj, (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) instTy), ec))))))) (((v_Vuna_dCompiler_dElab_dmethodArgLams rigs) 0) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (iname)), (C_Base_dList_dList_Cons (alt, C_Base_dList_dList_Nil))))))) (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt ((v_Vuna_dCompiler_dElab_ddictCtorName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1320)), (v_Vuna_dCompiler_dElab_dfieldBinderNames nFields), applied)))) ((v_Vuna_dCompiler_dElab_dfoldAppTerms fieldVar) ((v_Vuna_dCompiler_dElab_dmethodArgTerms rigs) nFields)))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar ((v_Vuna_dCompiler_dElab_dfieldVarName dtb__1321), ((bi_sub ((bi_sub nFields) 1)) dtb__1321))))) ((v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dbinderRig) fty))) (((v_Vuna_dCompiler_dElab_dsubstClassParam (v_Vuna_dCompiler_dElab_dparamNameOf (v_Vuna_dCompiler_dElab_ddtClassParams dtb__1320))) (v_Vuna_dCompiler_dElab_dinstHeadArg dtb__1319)) fty))) ((v_Vuna_dCompiler_dElab_dclassFieldTyAt dtb__1321) (v_Vuna_dCompiler_dElab_ddtClassFieldTys dtb__1320)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtClassMethods dtb__1320)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dspecializeEqTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dDtPrelude_dbuiltinEqTyName ((v_Vuna_dCompiler_dElab_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1322) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtPrelude_deqRuntimeName name) dtb__1322)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dfindClassByShortName "Eq") (v_Vuna_dCompiler_dElab_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dgenericEqApp name) ((v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx)) aTy)) aTerm) bTerm), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1323) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec) dictTy) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1324) -> (match dtb__1324 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1325, dtb__1326) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1325, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__1326))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1327) -> (if ((v_Vuna_dCompiler_dElab_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dgenericEqApp name) tyTerm) aTerm) bTerm), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec)))))))))
  | _ -> failwith "DT: impossible branch"
))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ((v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1323)), (C_Base_dList_dList_Cons (aTy, C_Base_dList_dList_Nil)))))))) ((v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dDtPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_ddtClassMethods dtb__1323)) (if ((bi_eq_str name) "==") then "eq" else "neq")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dspecializeCmpTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dDtPrelude_dcmpBuiltinTyName ((v_Vuna_dCompiler_dElab_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1328) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dcmpRuntimeName name) dtb__1328)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dfindClassByShortName "Ord") (v_Vuna_dCompiler_dElab_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_dcmpGenericName name))), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1329) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec) dictTy) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1330) -> (match dtb__1330 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1331, dtb__1332) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1331, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__1332))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1333) -> (if ((v_Vuna_dCompiler_dElab_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1333)))
  | _ -> failwith "DT: impossible branch"
))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ((v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1329)), (C_Base_dList_dList_Cons (aTy, C_Base_dList_dList_Nil)))))))) ((v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx)) aTy))) ((v_Vuna_dCompiler_dDtPrelude_dclassMethodProjection (v_Vuna_dCompiler_dElab_ddtClassMethods dtb__1329)) (v_Vuna_dCompiler_dElab_dcmpMethodName name)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dctorFamilyTable = (fun ec -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtCtorName) (v_Vuna_dCompiler_dElab_ddtDataCtors d)))))) (v_Vuna_dCompiler_dElab_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1334, dtb__1335) -> (match dtb__1334 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1336, dtb__1337) -> (match dtb__1336 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__1338, dtb__1339, dtb__1340) -> (v_Vuna_dCompiler_dElab_dfindCatchAllBody dtb__1335)
  | _ -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1337))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dfindBoolFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1341, dtb__1342) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf (v_Vuna_dCompiler_dElab_ddtDataName dtb__1341))) "Bool") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_ddtDataName dtb__1341))) else (v_Vuna_dCompiler_dElab_dfindBoolFamily dtb__1342))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dshortBoolFamily = (fun ec -> (fun name -> (if ((bi_eq_str name) "Bool") then (v_Vuna_dCompiler_dElab_dfindBoolFamily (v_Vuna_dCompiler_dElab_decDatas ec)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dElab_dinferVarRef = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dctxLookup name) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1343) -> (match dtb__1343 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1344, dtb__1345) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (name, dtb__1344)), (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dvarTypeValue ctx) dtb__1344) dtb__1345), ec))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1346) -> ((((v_Vuna_dCompiler_dElab_dinferCtorRef ec) ctx) name) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1346))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dshortBoolFamily ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1347) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1347)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType ((v_Vuna_dCompiler_dCore_dlevelZero ()))), ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1348) -> (if (v_Vuna_dCompiler_dElab_dallImplicitPrefix dtb__1348) then ((fun inst -> (C_Base_dResult_dResult_Base_dResult_dOk (inst))) (((((v_Vuna_dCompiler_dElab_dinstantiateAllImplicit ctx) ec) ((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name)) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1348)) C_Base_dList_dList_Nil)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1348), ec)))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: unknown name ") name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabConAlt = (fun fb -> (fun globals -> (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun scrutVal -> (fun expected -> (fun cname -> (fun args -> (fun psp -> (fun body -> (match ((v_Vuna_dCompiler_dElab_dfindCtorIn cname) (v_Vuna_dCompiler_dElab_ddtDataCtors dd)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt psp) ((bi_concat "DT: unknown constructor ") ((bi_concat cname) ((bi_concat " in case ") (v_Vuna_dCompiler_dElab_ddtDataName dd)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1349) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1349)) args)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1350, dtb__1351) -> (match dtb__1351 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1352, dtb__1353) -> (match dtb__1353 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1354, dtb__1355) -> (if (v_Vuna_dCompiler_dElab_dnonEmpty dtb__1355) then ((v_Vuna_dCompiler_dElab_derrAt psp) ((bi_concat "DT: branch for constructor ") ((bi_concat cname) " has too many arguments"))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dunifyIdxList ec) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dctxDepth dtb__1350)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dElab_dctorResultValsIn dtb__1350) dtb__1349)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ()))) idxs))) (fun refsIdx -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dreflectScrutinee ec) (v_Vuna_dCompiler_dElab_dctxDepth dtb__1350)) refsIdx) ((v_Vuna_dCompiler_dElab_dctorValueIn dtb__1350) dtb__1349)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((fun body2 -> (match (((((v_Vuna_dCompiler_dElab_dcheckE globals) branchCtx2) ec) body2) refinedExpected) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1356) -> (if ((v_Vuna_dCompiler_dElab_dctxHasEmptyBinder ec) branchCtx2) then ((v_Vuna_dCompiler_dElab_derrAt psp) "DT: this branch is impossible (its context contains an empty inductive family)") else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1356)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1357) -> (match dtb__1357 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1358, dtb__1359) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (cname, dtb__1352, dtb__1358)), dtb__1359))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dfoldPending fb) dtb__1354) body))) ((v_Vuna_dCompiler_dElab_dctxRefine dtb__1350) refs2))) (((v_Vuna_dCompiler_dElab_drefineValue refs2) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) expected)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_delabCaseAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Cons (dtb__1360, dtb__1361) -> (match dtb__1360 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1362, dtb__1363) -> (match dtb__1362 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__1364, dtb__1365, dtb__1366) -> ((v_Base_dResult_dandThen ((((((((((((v_Vuna_dCompiler_dElab_delabConAlt (v_Vuna_dCompiler_dElab_dfindCatchAllBody dtb__1361)) mc0) mc1) mc2) mc4) mc5) mc6) mc7) dtb__1364) dtb__1365) dtb__1366) dtb__1363)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1367, dtb__1368) -> ((((((((((v_Vuna_dCompiler_dElab_delabCaseAlts mc0) mc1) dtb__1368) mc3) mc4) mc5) mc6) mc7) dtb__1361) (C_Base_dList_dList_Cons (dtb__1367, mc9)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1369, dtb__1370) -> ((((((((((((v_Vuna_dCompiler_dElab_delabCatchAll mc0) mc1) mc2) mc3) mc4) mc5) mc7) dtb__1361) mc9) dtb__1363) dtb__1369) dtb__1370)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1371) -> ((((((((((((v_Vuna_dCompiler_dElab_delabCatchAll mc0) mc1) mc2) mc3) mc4) mc5) mc7) dtb__1361) mc9) dtb__1363) "_") dtb__1371)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1362)) "DT: only constructor patterns are supported in case (M14)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc9), mc2))))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_delabCatchAll = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTy -> (fun dd -> (fun idxs -> (fun expected -> (fun rest -> (fun acc -> (fun body -> (fun pname -> (fun psp -> ((fun ctx2 -> (if (v_Vuna_dCompiler_dElab_dnonEmpty rest) then ((v_Vuna_dCompiler_dElab_derrAt psp) "DT: the catch-all branch must be the last one") else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1372, dtb__1373) -> ((fun binds -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt ("", binds, dtb__1372)), acc))), dtb__1373))))) (if ((bi_eq_str pname) "_") then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pname, ((v_Vuna_dCompiler_dElab_dbinderRig false) scrutTy))), C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))))) (if ((bi_eq_str pname) "_") then ctx else (((v_Vuna_dCompiler_dElab_dctxBindValue pname) scrutTy) ctx)))))))))))))))
and v_Vuna_dCompiler_dElab_dcheckCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dhasDupNames (v_Vuna_dCompiler_dElab_daltNames alts)) then (((((((v_Vuna_dCompiler_dElab_dcheckCaseDedup globals) ctx) ec) scrut) alts) expected) sp) else (if (if (v_Vuna_dCompiler_dElab_danyNestedPat alts) then (v_Vuna_dCompiler_dElab_dhasVarCatchAll alts) else false) then (((((((v_Vuna_dCompiler_dElab_dcheckCaseDedup globals) ctx) ec) scrut) alts) expected) sp) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) scrut)) (fun ps -> (match ps with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1374, dtb__1375) -> (match dtb__1375 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1376, dtb__1377) -> ((((((((v_Vuna_dCompiler_dElab_dcheckCaseFam globals) ctx) dtb__1377) dtb__1374) dtb__1376) alts) expected) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dcheckCaseDedup = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dcatchAllNotLast alts) then ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: the catch-all branch must be the last one") else ((fun name -> ((fun clauses -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDtMatch_dmultiToCaseExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (name, sp)), scrut)), C_Base_dList_dList_Nil)), bodyExpr, false, sp))) expected)))) ((v_Base_dList_dmap (fun alt -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((v_Base_dPair_dfirstOf alt), C_Base_dList_dList_Nil)), (v_Base_dPair_dsecondOf alt))))) alts))) "nd_scrut")))))))))
and v_Vuna_dCompiler_dElab_dcheckCaseFam = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun alts -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) scrutTy) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1378) -> (match dtb__1378 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1379, dtb__1380) -> (if (if (v_Vuna_dCompiler_dElab_disBoolBaseName dtb__1379) then ((bi_eq_generic dtb__1380) C_Base_dList_dList_Nil) else false) then (((((((v_Vuna_dCompiler_dElab_dcheckBoolCase globals) ctx) ec) scrutTerm) alts) expected) sp) else (if ((bi_eq_str dtb__1379) "Int") then ((((((((v_Vuna_dCompiler_dElab_dcheckLitCase globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if ((bi_eq_str dtb__1379) "String") then ((((((((v_Vuna_dCompiler_dElab_dcheckLitCase globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else ((((((((((v_Vuna_dCompiler_dElab_dcheckCaseOf globals) ctx) ec) scrutTerm) scrutTy) dtb__1379) dtb__1380) alts) expected) sp))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case scrutinee is not an inductive family")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case scrutinee is not an inductive family")
)))))))))
and v_Vuna_dCompiler_dElab_dcheckBoolCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun alts -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dboolAlt globals) ctx) ec) alts) "True") expected) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1381, dtb__1382) -> (match dtb__1382 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1383, dtb__1384) -> (match dtb__1383 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1385) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (scrutTerm, dtb__1381, dtb__1385)), dtb__1384))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dboolAlt globals) ctx) ec) alts) "False") expected) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1386, dtb__1387) -> (match dtb__1387 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1388, dtb__1389) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (scrutTerm, dtb__1381, dtb__1386)), dtb__1389))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_dboolAlt = (fun globals -> (fun ctx -> (fun ec -> (fun alts -> (fun target -> (fun expected -> (fun sp -> ((((((((v_Vuna_dCompiler_dElab_dboolAltGo globals) ctx) ec) alts) target) expected) sp) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))
and v_Vuna_dCompiler_dElab_dboolAltGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1390, dtb__1391) -> (match dtb__1390 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1392, dtb__1393) -> (match dtb__1392 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__1394, dtb__1395, dtb__1396) -> (if ((bi_eq_str dtb__1394) mc4) then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1393) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1397, dtb__1398) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1397, (C_Base_dPair_dPair_Base_dPair_dPair (mc7, dtb__1398))))))
  | _ -> failwith "DT: impossible branch"
))) else ((((((((v_Vuna_dCompiler_dElab_dboolAltGo mc0) mc1) mc2) dtb__1391) mc4) mc5) mc6) mc7))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1399, dtb__1400) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1393) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1401, dtb__1402) -> ((((((((v_Vuna_dCompiler_dElab_dboolAltGo mc0) mc1) mc2) dtb__1391) mc4) mc5) mc6) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1401)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1403) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1393) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1404, dtb__1405) -> ((((((((v_Vuna_dCompiler_dElab_dboolAltGo mc0) mc1) mc2) dtb__1391) mc4) mc5) mc6) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1404)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1392)) "DT: case on Bool only accepts True / False / variable patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1406) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1406, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc2))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dElab_decTrusted mc2) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0)), (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc2)))))) else ((v_Vuna_dCompiler_dElab_derrAt mc6) ((bi_concat "DT: case is not exhaustive: missing ") mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dcheckLitCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun alts -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLitAlts globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1407, dtb__1408) -> (match dtb__1408 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1409, dtb__1410) -> (if dtb__1409 then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1407, dtb__1410)))) else ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case on Int / String needs a variable or wildcard branch as fallback (M19)"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dcheckLitAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__1411, dtb__1412) -> (match dtb__1411 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1413, dtb__1414) -> (match dtb__1413 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__1415, dtb__1416) -> ((((((((((v_Vuna_dCompiler_dElab_dlitAltStep mc0) mc1) mc2) mc3) mc4) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__1415))) dtb__1414) dtb__1412) mc6) mc7)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__1417, dtb__1418) -> ((((((((((v_Vuna_dCompiler_dElab_dlitAltStep mc0) mc1) mc2) mc3) mc4) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__1417))) dtb__1414) dtb__1412) mc6) mc7)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1419, dtb__1420) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dcheckLitBoundVar mc0) mc1) mc2) mc3) mc4) dtb__1419) dtb__1414) mc6) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1421, dtb__1422) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1421, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__1422))))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1423) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1414) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1424, dtb__1425) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1424, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__1425))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1413)) "DT: case on Int / String only accepts literals / variable patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (false)), (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0)), (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0)))), (C_Base_dPair_dPair_Base_dPair_dPair (false, mc2))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dlitAltStep = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun litTerm -> (fun body -> (fun rest -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1426, dtb__1427) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLitAlts globals) ctx) dtb__1427) scrutTerm) tyName) rest) expected) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1428, dtb__1429) -> (match dtb__1429 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1430, dtb__1431) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_dlitEqName tyName))), scrutTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), litTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), dtb__1426, dtb__1428)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1430, dtb__1431))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dcheckLitBoundVar = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun name -> (fun body -> (fun expected -> (fun sp -> ((fun ctx2 -> ((fun rig -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1432, dtb__1433) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (name, rig, dtb__1432)), scrutTerm, rig)), dtb__1433))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig false) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (tyName, C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dctxBindValue name) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (tyName, C_Base_dList_dList_Nil))))) ctx)))))))))))
and v_Vuna_dCompiler_dElab_dcheckCaseOf = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun fam -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_ddtDataLookup fam) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case scrutinee is not an inductive family")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1434) -> (if (v_Vuna_dCompiler_dElab_dhasDupNames (v_Vuna_dCompiler_dElab_daltNames alts)) then ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: duplicate constructor in case") else ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dElab_delabCaseAlts globals) ctx) ec) scrutTy) dtb__1434) idxs) ((v_Vuna_dCompiler_dElab_devalCtx ctx) scrutTerm)) expected) alts) C_Base_dList_dList_Nil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1435, dtb__1436) -> (((((((((v_Vuna_dCompiler_dElab_dcheckCaseDone dtb__1436) ctx) dtb__1434) idxs) alts) expected) sp) scrutTerm) dtb__1435)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dinferCaseE = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun sp -> ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1437, dtb__1438) -> ((fun metaTy -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckCase globals) ctx) dtb__1438) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1439, dtb__1440) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1439, (C_Base_dPair_dPair_Base_dPair_dPair (metaTy, dtb__1440))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_devalCtx ctx) dtb__1437))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec))))))))
and v_Vuna_dCompiler_dElab_dcheckCondBool = (fun globals -> (fun ctx -> (fun ec -> (fun c -> (fun sp -> (match (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) c) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1441) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1441))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1442) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) c)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1443, dtb__1444) -> (match dtb__1444 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1445, dtb__1446) -> (if (v_Vuna_dCompiler_dElab_disBoolType dtb__1445) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1443, dtb__1446)))) else ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "if condition must be Bool (got ") ((bi_concat ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1445)) ")"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dinferE = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1447, dtb__1448) -> (if ((bi_eq_str dtb__1447) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType ((v_Vuna_dCompiler_dCore_dlevelSucc (v_Vuna_dCompiler_dCore_dlevelZero ())))), ec)))))) else (if ((bi_eq_str dtb__1447) "_") then ((v_Vuna_dCompiler_dElab_derrAt dtb__1448) "DT: cannot infer the type of a hole; give it an expected type") else (((((v_Vuna_dCompiler_dElab_dinferVarRef globals) ctx) ec) dtb__1447) dtb__1448)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__1449, dtb__1450) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__1449)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Int", C_Base_dList_dList_Nil)))), ec))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__1451, dtb__1452) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__1451)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("String", C_Base_dList_dList_Nil)))), ec))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__1453, dtb__1454, dtb__1455, dtb__1456, dtb__1457) -> ((((((((v_Vuna_dCompiler_dElab_dinferPi globals) ctx) ec) dtb__1453) dtb__1454) dtb__1455) dtb__1456) dtb__1457)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__1458, dtb__1459, dtb__1460) -> ((((((v_Vuna_dCompiler_dElab_dinferApp globals) ctx) ec) dtb__1458) dtb__1459) dtb__1460)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__1461, dtb__1462, dtb__1463) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1463) "DT: cannot infer the type of a lambda; add a signature")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__1464, dtb__1465, dtb__1466, dtb__1467) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckCondBool globals) ctx) ec) dtb__1464) dtb__1467)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1468, dtb__1469) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1469) dtb__1465)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1470, dtb__1471) -> (match dtb__1471 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1472, dtb__1473) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1473) dtb__1466)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1474, dtb__1475) -> (match dtb__1475 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1476, dtb__1477) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1477) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1472) dtb__1476)) (fun ec4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__1468, dtb__1470, dtb__1474)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1472, ec4))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__1478, dtb__1479, dtb__1480, dtb__1481) -> (((((((v_Vuna_dCompiler_dElab_dinferLet globals) ctx) ec) dtb__1478) dtb__1479) dtb__1480) dtb__1481)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__1482, dtb__1483, dtb__1484) -> ((((((v_Vuna_dCompiler_dElab_dinferCaseE globals) ctx) ec) dtb__1482) dtb__1483) dtb__1484)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__1485, dtb__1486, dtb__1487) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1487) "DT: record field access is not supported yet (M15)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__1488, dtb__1489, dtb__1490) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1490) "DT: records are not supported yet (M15)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__1491, dtb__1492, dtb__1493) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1493) "DT: record update is not supported yet (M15)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__1494, dtb__1495, dtb__1496) -> ((((((v_Vuna_dCompiler_dElab_dinferInstSel globals) ctx) ec) dtb__1494) dtb__1495) dtb__1496)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__1497, dtb__1498) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1498) "DT: do blocks are not supported yet (M19)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__1499, dtb__1500, dtb__1501) -> ((((((v_Vuna_dCompiler_dElab_dinferAnn globals) ctx) ec) dtb__1499) dtb__1500) dtb__1501)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dinferAnn = (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun ty -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx) ec) ty)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1502, dtb__1503) -> (match dtb__1503 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1504, dtb__1505) -> ((fun tyVal -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) dtb__1505) value) tyVal)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1506, dtb__1507) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1506, (C_Base_dPair_dPair_Base_dPair_dPair (tyVal, dtb__1507))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1502))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dinferPi = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun implicit -> (fun dom -> (fun cod -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx) ec) dom)) (fun pd -> (match pd with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1508, dtb__1509) -> (match dtb__1509 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1510, dtb__1511) -> ((fun lvl -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx2) dtb__1511) cod)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1512, dtb__1513) -> (match dtb__1513 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1514, dtb__1515) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (name, implicit, ((v_Vuna_dCompiler_dElab_dbinderRig implicit) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1508)), dtb__1508, dtb__1512)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (((v_Vuna_dCompiler_dCore_dlevelMax dtb__1510) dtb__1514))), dtb__1515))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dctxBind name) dtb__1508) ctx))) (v_Vuna_dCompiler_dElab_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dinferApp = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1516, dtb__1517) -> (if ((bi_eq_str dtb__1516) "->") then (match args with
  | C_Base_dList_dList_Cons (dtb__1518, dtb__1519) -> (match dtb__1519 with
  | C_Base_dList_dList_Cons (dtb__1520, dtb__1521) -> (match dtb__1521 with
  | C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dElab_dinferPi globals) ctx) ec) "_") false) dtb__1518) dtb__1520) sp)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: invalid arrow type")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: invalid arrow type")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: invalid arrow type")
) else (if ((bi_eq_str dtb__1516) "Type") then (match args with
  | C_Base_dList_dList_Cons (dtb__1522, dtb__1523) -> (match dtb__1522 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__1524, dtb__1525) -> (match dtb__1523 with
  | C_Base_dList_dList_Nil -> (if ((bi_lt_int dtb__1524) 0) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1525) "DT: universe level must be non-negative") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelOfInt dtb__1524))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType ((v_Vuna_dCompiler_dCore_dlevelSucc (v_Vuna_dCompiler_dCore_dlevelOfInt dtb__1524)))), ec)))))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1517) "DT: Type needs exactly one non-negative level (or none)")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1517) "DT: Type needs exactly one non-negative level (or none)")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1517) "DT: Type needs exactly one non-negative level (or none)")
) else (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1526, dtb__1527) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1526) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1528) -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneral globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1526) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1529) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1529))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1530, dtb__1531) -> (match dtb__1531 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1532, dtb__1533) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1533)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1526))) dtb__1530), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1532, dtb__1533))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1526) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1534) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1526) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1535) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1535))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1534)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1536, dtb__1537) -> (match dtb__1537 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1538, dtb__1539) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1539)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1526))) dtb__1536), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1538, dtb__1539))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1527) ((bi_concat "DT: unknown name ") dtb__1526))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneral globals) ctx) ec) fn) args) sp)
)))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1540, dtb__1541) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1540) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1542) -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneral globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1540) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1543) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1543))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1544, dtb__1545) -> (match dtb__1545 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1546, dtb__1547) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1547)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1540))) dtb__1544), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1546, dtb__1547))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1540) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1548) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1540) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1549) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1549))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1548)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1550, dtb__1551) -> (match dtb__1551 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1552, dtb__1553) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1553)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1540))) dtb__1550), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1552, dtb__1553))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1541) ((bi_concat "DT: unknown name ") dtb__1540))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneral globals) ctx) ec) fn) args) sp)
)
)) fn)))))))
and v_Vuna_dCompiler_dElab_dinferAppGeneral = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1554, dtb__1555) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1554) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1556) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1556))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneralGo globals) ctx) ec) fn) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneralGo globals) ctx) ec) fn) args) sp)
)))))))
and v_Vuna_dCompiler_dElab_dinferAppGeneralGo = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) fn)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1557, dtb__1558) -> (match dtb__1558 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1559, dtb__1560) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) dtb__1560) dtb__1559) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1561, dtb__1562) -> (match dtb__1562 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1563, dtb__1564) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1564)) dtb__1557) dtb__1561), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1563, dtb__1564))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dinferArgs = (fun globals -> (fun ctx -> (fun ec -> (fun ty -> (fun args -> (fun sp -> ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) ec) ty) args) sp)))))))
and v_Vuna_dCompiler_dElab_dinferArgsGo = (fun globals -> (fun ctx -> (fun ec -> (fun ty -> (fun args -> (fun sp -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1565, dtb__1566, dtb__1567, dtb__1568, dtb__1569) -> (if dtb__1566 then (if ((v_Vuna_dCompiler_dElab_disDictDomain ec) dtb__1568) then (if ((v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta ec) dtb__1568) then (((((((v_Vuna_dCompiler_dElab_ddeferDictBinder globals) ctx) ec) dtb__1568) dtb__1569) args) sp) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dconstrainDictDom globals) ec) ctx) dtb__1568) args) sp)) (fun ec0 -> (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec0) ((v_Vuna_dCompiler_dElab_dforceVal ec0) dtb__1568)) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1570) -> (match dtb__1570 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1571, dtb__1572) -> ((fun ty2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) dtb__1572) ty2) args) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1573, dtb__1574) -> (match dtb__1574 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1575, dtb__1576) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1571, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), dtb__1573)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1575, dtb__1576))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1569) ((v_Vuna_dCompiler_dElab_devalCtx ctx) dtb__1571)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1577) -> (if ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_decSols ec0)) ((v_Vuna_dCompiler_dElab_dforceVal ec0) dtb__1568)) then (((((((v_Vuna_dCompiler_dElab_ddeferDictBinder globals) ctx) ec0) dtb__1568) dtb__1569) args) sp) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1577)))
  | _ -> failwith "DT: impossible branch"
)))) else (if ((v_Vuna_dCompiler_dElab_disIndexDomain ec) dtb__1568) then (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1578, dtb__1579) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) dtb__1579) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1569) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1578))) args) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1580, dtb__1581) -> (match dtb__1581 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1582, dtb__1583) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1578, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1580)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1582, dtb__1583))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: implicit parameters must be types or inductive families (M15)"))) else (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Cons (dtb__1584, dtb__1585) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) dtb__1584) dtb__1568)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1586, dtb__1587) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) dtb__1587) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1569) ((v_Vuna_dCompiler_dElab_devalCtx ctx) dtb__1586))) dtb__1585) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1588, dtb__1589) -> (match dtb__1589 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1590, dtb__1591) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1586, ((v_Vuna_dCompiler_dElab_dtypeLayerRig false) dtb__1568))), dtb__1588)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1590, dtb__1591))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Cons (dtb__1592, dtb__1593) -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan dtb__1592)) "DT: too many arguments (not a function)")
  | _ -> failwith "DT: impossible branch"
)
)) ((v_Vuna_dCompiler_dElab_dforceVal ec) ty))))))))
and v_Vuna_dCompiler_dElab_ddeferDictBinder = (fun globals -> (fun ctx -> (fun ec -> (fun dom -> (fun clo -> (fun args -> (fun sp -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1594, dtb__1595) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) ((v_Vuna_dCompiler_dElab_decAddDictGoal dtb__1595) (C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (m, ((v_Vuna_dCompiler_dElab_dforceVal dtb__1595) dom))))) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1594))) args) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1596, dtb__1597) -> (match dtb__1597 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1598, dtb__1599) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1594, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), dtb__1596)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1598, dtb__1599))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decNext ec)))))))))
and v_Vuna_dCompiler_dElab_dconstrainDictDom = (fun globals -> (fun ec -> (fun ctx -> (fun dom -> (fun args -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1600) -> (match ((v_Vuna_dCompiler_dElab_ddictArgKind ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1601) -> (match dtb__1600 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__1602, dtb__1603) -> (match dtb__1603 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) ec) ctx) dtb__1600) dtb__1601) args) sp)) (fun ecProbe -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__1602) (v_Vuna_dCompiler_dElab_decSols ecProbe)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1604) -> (match ((((((v_Vuna_dCompiler_dCore_dsolveMeta (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) 0) dtb__1602) C_Base_dList_dList_Nil) dtb__1604) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1605) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_decPutSols ec) dtb__1605)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1606) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) ec) ctx) dtb__1600) dtb__1601) args) sp)
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) ec) ctx) dtb__1600) dtb__1601) args) sp)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dconstrainDictDomGoK = (fun globals -> (fun ec -> (fun ctx -> (fun argTy -> (fun argKind -> (fun args -> (fun sp -> (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dList_dList_Cons (dtb__1607, dtb__1608) -> (match ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) dtb__1607) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1609) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1610) -> (match dtb__1610 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1611, dtb__1612) -> (match dtb__1612 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1613, dtb__1614) -> ((fun forced -> (if (v_Vuna_dCompiler_dCore_disTypeValue forced) then (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) dtb__1614) ctx) argTy) argKind) dtb__1608) sp) else (if (((((v_Vuna_dCompiler_dElab_dargHeadMatchesKind globals) dtb__1614) ctx) forced) argKind) then (match ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1614) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) argTy) (v_Vuna_dCompiler_dElab_dneutralHeadOrSelf forced)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1615) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1615))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1616) -> (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) dtb__1614) ctx) argTy) argKind) dtb__1608) sp)
  | _ -> failwith "DT: impossible branch"
) else (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) dtb__1614) ctx) argTy) argKind) dtb__1608) sp)))) ((v_Vuna_dCompiler_dElab_dforceVal dtb__1614) dtb__1613))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dcheckE = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__1617, dtb__1618, dtb__1619) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx) ec) dtb__1618)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1620, dtb__1621) -> (match dtb__1621 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1622, dtb__1623) -> (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) dtb__1623) dtb__1617) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1620))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__1624, dtb__1625, dtb__1626, dtb__1627) -> ((((((((v_Vuna_dCompiler_dElab_dcheckLet globals) ctx) ec) dtb__1624) dtb__1625) dtb__1626) expected) dtb__1627)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__1628, dtb__1629, dtb__1630) -> (((((((v_Vuna_dCompiler_dElab_dcheckCase globals) ctx) ec) dtb__1628) dtb__1629) expected) dtb__1630)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__1631, dtb__1632, dtb__1633, dtb__1634) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__1635, dtb__1636, dtb__1637, dtb__1638, dtb__1639) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__1640, dtb__1641, dtb__1642) -> (match dtb__1640 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1643, dtb__1644) -> (if ((bi_eq_str dtb__1643) "->") then (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected) else (if ((bi_eq_str dtb__1643) "Type") then (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected) else (((((((v_Vuna_dCompiler_dElab_dcheckApp globals) ctx) ec) dtb__1640) dtb__1641) expected) dtb__1642)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dcheckApp globals) ctx) ec) dtb__1640) dtb__1641) expected) dtb__1642)
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__1645, dtb__1646, dtb__1647) -> (((((((v_Vuna_dCompiler_dElab_dcheckLam globals) ctx) ec) dtb__1645) dtb__1646) expected) dtb__1647)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__1648, dtb__1649) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__1650, dtb__1651) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1652, dtb__1653) -> (if ((bi_eq_str dtb__1652) "_") then ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1654, dtb__1655) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1654, dtb__1655))))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dnewHoleMeta ctx) ec) dtb__1653) expected)) else (((((((v_Vuna_dCompiler_dElab_dcheckApp globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1652, dtb__1653))) C_Base_dList_dList_Nil) expected) dtb__1653))
  | _ -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
)) expr))))))
and v_Vuna_dCompiler_dElab_dcheckLet = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (if rec_u then ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckWhereSigs binds)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx) ec) binds) body) rec_u) expected) sp))) else ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx) ec) binds) body) rec_u) expected) sp))))))))))
and v_Vuna_dCompiler_dElab_dcheckLetGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1656, dtb__1657) -> (((((((((v_Vuna_dCompiler_dElab_dcheckLetOne mc0) mc1) mc2) dtb__1656) dtb__1657) mc4) mc5) mc6) mc7)
  | C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) mc4) mc6)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dcheckLetOne = (fun globals -> (fun ctx -> (fun ec -> (fun bind -> (fun rest -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (match (v_Base_dPair_dfirstOf bind) with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1658, dtb__1659) -> ((fun value -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1660, dtb__1661) -> (match dtb__1661 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1662, dtb__1663) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx2) dtb__1663) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1664, dtb__1665) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1658, rig, dtb__1664)), dtb__1660, rig)), dtb__1665))))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dctxBindValue dtb__1658) dtb__1662) ctx))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1662))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf bind))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1666) -> ((fun value -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1667, dtb__1668) -> (match dtb__1668 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1669, dtb__1670) -> ((fun rig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx) dtb__1670) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1671, dtb__1672) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dshift 0) 1) dtb__1671))), dtb__1667, rig)), dtb__1672))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1669))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf bind))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan (v_Base_dPair_dfirstOf bind))) "DT: let bindings must be simple names or wildcards (M19)")
))))))))))
and v_Vuna_dCompiler_dElab_dinferLet = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (if rec_u then ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckWhereSigs binds)) (fun _u -> (((((((v_Vuna_dCompiler_dElab_dinferLetGo globals) ctx) ec) binds) body) rec_u) sp))) else (((((((v_Vuna_dCompiler_dElab_dinferLetGo globals) ctx) ec) binds) body) rec_u) sp)))))))))
and v_Vuna_dCompiler_dElab_dinferLetGo = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (match binds with
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) body)
  | C_Base_dList_dList_Cons (dtb__1673, dtb__1674) -> (match dtb__1673 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1675, dtb__1676) -> (match dtb__1675 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1677, dtb__1678) -> (((((((((v_Vuna_dCompiler_dElab_dinferLetBound globals) ctx) ec) dtb__1677) dtb__1676) dtb__1674) body) rec_u) sp)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1679) -> ((((((((v_Vuna_dCompiler_dElab_dinferLetIgnored globals) ctx) ec) dtb__1676) dtb__1674) body) rec_u) sp)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1675)) "DT: let bindings must be simple names or wildcards (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dinferLetBound = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1680, dtb__1681) -> (match dtb__1681 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1682, dtb__1683) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dinferLet globals) ctx2) dtb__1683) rest) body) rec_u) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1684, dtb__1685) -> (match dtb__1685 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1686, dtb__1687) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (name, rig, dtb__1684)), dtb__1680, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1686, dtb__1687))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dctxBindValue name) dtb__1682) ctx))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1682))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dinferLetIgnored = (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1688, dtb__1689) -> (match dtb__1689 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1690, dtb__1691) -> ((fun rig -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dinferLet globals) ctx) dtb__1691) rest) body) rec_u) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1692, dtb__1693) -> (match dtb__1693 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1694, dtb__1695) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dshift 0) 1) dtb__1692))), dtb__1688, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1694, dtb__1695))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1690))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dcheckByInfer = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> (match ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) expr) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1696) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1696))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1697) -> (match dtb__1697 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1698, dtb__1699) -> (match dtb__1699 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1700, dtb__1701) -> (match ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1701) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) dtb__1700) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1702) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dexprSpan expr))) ((bi_concat ": ") dtb__1702))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1703) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1698, ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) dtb__1703)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dcheckLam = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1704, dtb__1705) -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1706, dtb__1707, dtb__1708, dtb__1709, dtb__1710) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((fun lamRig -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckLam mc0) ctx2) mc2) dtb__1705) mc4) expected2) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1711, dtb__1712) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1704, lamRig, dtb__1711)), dtb__1712))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig dtb__1707) dtb__1709))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1710) v))) (((v_Vuna_dCompiler_dElab_dctxBindValue dtb__1704) dtb__1709) mc1))) ((v_Vuna_dCompiler_dElab_dfreshVarValue dtb__1706) lvl))) (v_Vuna_dCompiler_dElab_dctxDepth mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: lambda has more parameters than the expected function type")
)) ((v_Vuna_dCompiler_dElab_dforceVal mc2) mc5))
  | C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dcheckType = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1713, dtb__1714) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1713) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1715) -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1713) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1716) -> (match (v_Vuna_dCompiler_dCore_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dforceVal ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1716))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1717) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1713)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1717, ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__1718, dtb__1719, dtb__1720) -> (match dtb__1718 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1721, dtb__1722) -> (if (if ((bi_eq_str dtb__1721) "->") then true else ((bi_eq_str dtb__1721) "Type")) then ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr) else (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1721) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1723) -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((((v_Vuna_dCompiler_dElab_dinferAppUnderType globals) ctx) ec) dtb__1721) dtb__1719) dtb__1722) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1724) -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1725) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1725))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
)))))
and v_Vuna_dCompiler_dElab_dcheckTypeInfer = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) expr)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1726, dtb__1727) -> (match dtb__1727 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1728, dtb__1729) -> ((fun forced -> (match (v_Vuna_dCompiler_dCore_dtypeLevelOf forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1730) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1726, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1730, dtb__1729))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan expr)) ((bi_concat "DT: expected a type, but this expression has type ") ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1728)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dforceVal dtb__1729) dtb__1728))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dcheckApp = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1731, dtb__1732) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1731) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1733) -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_disSortVal ec) expected) then (((((((v_Vuna_dCompiler_dElab_dcheckAppUnderType globals) ctx) ec) dtb__1731) args) expected) dtb__1732) else (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1731) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1734) -> (((((((v_Vuna_dCompiler_dElab_dcheckAppCtor globals) ctx) ec) dtb__1731) args) expected) dtb__1732)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
))))))))
and v_Vuna_dCompiler_dElab_dcheckAppUnderType = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (match ((((((v_Vuna_dCompiler_dElab_dinferAppUnderType globals) ctx) ec) name) args) sp) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1735) -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (name, sp))) args) expected) sp)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1736) -> (match dtb__1736 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1737, dtb__1738) -> (match dtb__1738 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1739, dtb__1740) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1740) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__1739)))) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1737, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dinferAppUnderType = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: unknown name ") name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1741) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1741)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1742, dtb__1743) -> (match dtb__1743 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1744, dtb__1745) -> (match (v_Vuna_dCompiler_dCore_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dforceVal dtb__1745) dtb__1744)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1746) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))) dtb__1742), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1746, dtb__1745))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: expected a type, but ") ((bi_concat name) " applied to these arguments is not a type")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dspecializeEqApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if (v_Vuna_dCompiler_dDtPrelude_disEqOp name) then (match args with
  | C_Base_dList_dList_Cons (dtb__1747, dtb__1748) -> (match dtb__1748 with
  | C_Base_dList_dList_Cons (dtb__1749, dtb__1750) -> (match dtb__1750 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) dtb__1747)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1751, dtb__1752) -> (match dtb__1752 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1753, dtb__1754) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1754) dtb__1749)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1755, dtb__1756) -> (match dtb__1756 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1757, dtb__1758) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1758) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1753) dtb__1757)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dspecializeEqTy globals) ctx) name) dtb__1751) dtb__1755) sp) dtb__1753) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))
and v_Vuna_dCompiler_dElab_dspecializeCmpApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if (v_Vuna_dCompiler_dElab_disCmpOp name) then (match args with
  | C_Base_dList_dList_Cons (dtb__1759, dtb__1760) -> (match dtb__1760 with
  | C_Base_dList_dList_Cons (dtb__1761, dtb__1762) -> (match dtb__1762 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) dtb__1759)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1763, dtb__1764) -> (match dtb__1764 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1765, dtb__1766) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1766) dtb__1761)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1767, dtb__1768) -> (match dtb__1768 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1769, dtb__1770) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1770) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1765) dtb__1769)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dspecializeCmpTy globals) ctx) name) dtb__1763) dtb__1767) sp) dtb__1765) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))
and v_Vuna_dCompiler_dElab_dspecializeOpApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeEqApp globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1771) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1771))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeCmpApp globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1772) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1772))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dspecializeBoolApp globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dspecializeBoolApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if (if ((bi_eq_str name) "&&") then true else ((bi_eq_str name) "||")) then (match args with
  | C_Base_dList_dList_Cons (dtb__1773, dtb__1774) -> (match dtb__1774 with
  | C_Base_dList_dList_Cons (dtb__1775, dtb__1776) -> (match dtb__1776 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) dtb__1773) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))))) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1777, dtb__1778) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) dtb__1778) dtb__1775) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))))) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1779, dtb__1780) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dboolShortCircuit name) dtb__1777) dtb__1779), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__1780))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: `") ((bi_concat name) "` needs exactly two arguments")))
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: `") ((bi_concat name) "` needs exactly two arguments")))
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: `") ((bi_concat name) "` needs exactly two arguments")))
) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))))))
and v_Vuna_dCompiler_dElab_dcheckAppGeneral = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1781, dtb__1782) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1781) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1783) -> (match dtb__1783 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1784, dtb__1785) -> (match dtb__1785 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1786, dtb__1787) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1787) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) dtb__1786)) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1784, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn, args, sp))) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn, args, sp))) expected)
))))))))
and v_Vuna_dCompiler_dElab_dcheckAppCtor = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: unknown name ") name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1788) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1788))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1789, dtb__1790) -> (match dtb__1790 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1791, dtb__1792) -> (match ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1792) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) dtb__1791) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1793) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1793)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))) dtb__1789), dtb__1793))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1794) -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: constructor ") ((bi_concat name) ((bi_concat ": ") dtb__1794))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_delabCtor = (fun globals -> (fun fam -> (fun arity -> (fun ec -> (fun c -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__1795, dtb__1796, dtb__1797, dtb__1798) -> ((fun famKind -> ((fun tyExpr2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec) tyExpr2)) (fun pk -> (match pk with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1799, dtb__1800) -> (match dtb__1800 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1801, dtb__1802) -> ((fun tyTerm -> (match (v_Vuna_dCompiler_dElab_dresultSpine (v_Vuna_dCompiler_dElab_ddropParams tyTerm)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1803, dtb__1804) -> (if ((bi_neq_str dtb__1803) fam) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1798) ((bi_concat "DT: constructor ") ((bi_concat dtb__1795) ((bi_concat " does not return ") fam)))) else (if ((bi_neq_int (v_Base_dList_dlength dtb__1804)) arity) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1798) ((bi_concat "DT: constructor ") ((bi_concat dtb__1795) ((bi_concat " has the wrong number of indices for ") fam)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (dtb__1795, fam, (v_Vuna_dCompiler_dElab_dteleOfType tyTerm), tyTerm)), dtb__1802))))))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas dtb__1802) 0) dtb__1799))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (v_Vuna_dCompiler_dElab_dhasFamParams dtb__1796) then dtb__1796 else (((v_Vuna_dCompiler_dElab_dprependFamParams famKind) dtb__1796) dtb__1798)))) (match ((v_Vuna_dCompiler_dElab_dglobalLookup fam) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1805) -> dtb__1805
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ())))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__1806, dtb__1807) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabCtor mc0) mc1) mc2) mc3) dtb__1806)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1808, dtb__1809) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabCtors mc0) mc1) mc2) dtb__1809) dtb__1807)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1810, dtb__1811) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__1808, dtb__1810)), dtb__1811))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc3))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_delabDataHead = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1812, dtb__1813) -> (match dtb__1812 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__1814, dtb__1815, dtb__1816, dtb__1817, dtb__1818, dtb__1819) -> (if ((v_Base_dList_dmemName dtb__1814) (v_Vuna_dCompiler_dDtPrelude_dpreludeNames ())) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1819) ((bi_concat "DT: cannot redefine builtin ") dtb__1814)) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec) dtb__1816)) (fun pk -> (match pk with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1820, dtb__1821) -> (match dtb__1821 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1822, dtb__1823) -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dkindWellFormed fullKind)) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1819) "DT: the kind of a data declaration must be a chain of arrows ending in Type") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__1814, fullKind, arity)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1814, fullKind)), C_Base_dList_dList_Nil)), dtb__1823)))))))) (v_Base_dList_dlength tele))) (v_Vuna_dCompiler_dElab_dsplitKind fullKind))) ((v_Vuna_dCompiler_dDtPrelude_dprependParams dtb__1815) (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas dtb__1823) 0) dtb__1820)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1813) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_delabDataHeadsRound = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (fun failed -> (match pending with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (heads, (C_Base_dPair_dPair_Base_dPair_dPair (globals, (C_Base_dPair_dPair_Base_dPair_dPair (ec, (v_Base_dList_dreverse failed)))))))
  | C_Base_dList_dList_Cons (dtb__1824, dtb__1825) -> (match (((v_Vuna_dCompiler_dElab_delabDataHead globals) ec) dtb__1824) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1826) -> (((((v_Vuna_dCompiler_dElab_delabDataHeadsRound dtb__1825) globals) ec) heads) (C_Base_dList_dList_Cons (dtb__1824, failed)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1827) -> (match dtb__1827 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1828, dtb__1829) -> (match dtb__1829 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1830, dtb__1831) -> (((((v_Vuna_dCompiler_dElab_delabDataHeadsRound dtb__1825) ((v_Base_dList_dappend globals) dtb__1830)) dtb__1831) (C_Base_dList_dList_Cons (dtb__1828, heads))) failed)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_delabDataHeadsNoProgress = (fun globals -> (fun ec -> (fun failed -> (match failed with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: no failed data declarations"))
  | C_Base_dList_dList_Cons (dtb__1832, dtb__1833) -> (match (((v_Vuna_dCompiler_dElab_delabDataHead globals) ec) dtb__1832) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1834) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1834))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1835) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration made no progress"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_delabDataHeads = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (match pending with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse heads), (C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | _ -> (match (((((v_Vuna_dCompiler_dElab_delabDataHeadsRound pending) globals) ec) heads) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1836, dtb__1837) -> (match dtb__1837 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1838, dtb__1839) -> (match dtb__1839 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1840, dtb__1841) -> (match dtb__1841 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__1836), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1838, dtb__1840))))))
  | _ -> (if ((bi_eq_int (v_Base_dList_dlength dtb__1841)) (v_Base_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_delabDataHeadsNoProgress globals) ec) dtb__1841) else ((((v_Vuna_dCompiler_dElab_delabDataHeads dtb__1841) dtb__1838) dtb__1840) dtb__1836))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)))))

let rec v_Vuna_dCompiler_dElab_delabDataBodies = (fun decls -> (fun heads -> (fun globals -> (fun ec -> (fun acc -> (match decls with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse acc), (C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | C_Base_dList_dList_Cons (dtb__1842, dtb__1843) -> (match dtb__1842 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1844, dtb__1845) -> (match dtb__1844 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__1846, dtb__1847, dtb__1848, dtb__1849, dtb__1850, dtb__1851) -> (match ((v_Vuna_dCompiler_dElab_dlookupDataHead dtb__1846) heads) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1851) ((bi_concat "DT: internal: missing data head for ") dtb__1846))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1852) -> (match dtb__1852 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1853, dtb__1854) -> ((fun tele -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabCtors globals) dtb__1846) dtb__1854) ec) dtb__1849)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1855, dtb__1856) -> ((fun dd -> (((((v_Vuna_dCompiler_dElab_delabDataBodies dtb__1843) heads) ((v_Base_dList_dappend globals) (v_Vuna_dCompiler_dElab_dctorGlobals dtb__1855))) ((v_Vuna_dCompiler_dElab_decAddData dtb__1856) dd)) (C_Base_dList_dList_Cons (dd, acc)))) (C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData (dtb__1846, tele, dtb__1855)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dsplitKind dtb__1853))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_delabDataBodies dtb__1843) heads) globals) ec) acc)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_delabDatas = (fun decls -> (fun globals -> (fun ec -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_delabDataHeads decls) globals) ec) C_Base_dList_dList_Nil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1857, dtb__1858) -> (match dtb__1858 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1859, dtb__1860) -> (((((v_Vuna_dCompiler_dElab_delabDataBodies decls) dtb__1857) dtb__1859) dtb__1860) C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dclassFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1861, dtb__1862) -> (match dtb__1861 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1863, dtb__1864) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType mc0) mc1) mc2) (((v_Vuna_dCompiler_dDtQuant_dquantifyTraitSig (fun nm -> (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dctxLookup nm) mc1)))) dtb__1864) (v_Vuna_dCompiler_dAst_dexprSpan dtb__1864)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1865, dtb__1866) -> (match dtb__1866 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1867, dtb__1868) -> (((((v_Vuna_dCompiler_dElab_dclassFieldTysGo mc0) mc1) dtb__1868) dtb__1862) (C_Base_dList_dList_Cons (dtb__1865, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), mc2))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dclassFieldTys = (fun globals -> (fun ec -> (fun params -> (fun methods -> (((((v_Vuna_dCompiler_dElab_dclassFieldTysGo globals) (((v_Vuna_dCompiler_dElab_dbindClassParams params) methods) (v_Vuna_dCompiler_dElab_demptyCtx ()))) ec) methods) C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dElab_delabTrait = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1869, dtb__1870) -> (match dtb__1869 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__1871, dtb__1872, dtb__1873, dtb__1874) -> (if ((bi_neq_int (v_Base_dList_dlength dtb__1872)) 1) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1874) "DT: interfaces must have exactly one parameter (M15 limitation)") else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dclassFieldTys globals) ec) dtb__1872) dtb__1873)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1875, dtb__1876) -> ((fun pname -> ((fun pKind -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dd, (C_Base_dPair_dPair_Base_dPair_dPair (projs, (C_Base_dPair_dPair_Base_dPair_dPair (cls, ec3))))))))) ((v_Vuna_dCompiler_dElab_dfoldlAddDef ec2) projBodies))) ((v_Vuna_dCompiler_dElab_decAddClass ((v_Vuna_dCompiler_dElab_decAddData dtb__1876) dd)) cls))) (C_Vuna_dCompiler_dElab_dDtClass_Vuna_dCompiler_dElab_dDtClass (dtb__1871, dtb__1872, projs, dtb__1875)))) (((((v_Vuna_dCompiler_dElab_dprojectionDefs dtb__1871) pname) dtb__1873) dtb__1875) (v_Base_dList_dlength dtb__1873)))) (((((v_Vuna_dCompiler_dElab_dmethodProjections dtb__1871) pname) pKind) dtb__1873) dtb__1875))) (C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData (dname, tele, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (cname, dname, tele, ctorTy)), C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dElab_dteleOfType ctorTy))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (pname, true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, pKind, ((v_Vuna_dCompiler_dElab_dfoldPiFieldTys dtb__1875) dapp))))) ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dname))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (pname, 0)), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), C_Base_dList_dList_Nil))))) (v_Vuna_dCompiler_dElab_ddictCtorName dtb__1871))) (v_Vuna_dCompiler_dElab_ddictTypeName dtb__1871))) ((v_Vuna_dCompiler_dDtKind_dclassParamKind pname) dtb__1873))) (v_Vuna_dCompiler_dElab_dparamNameOf dtb__1872))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1870) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_delabSigs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1877, dtb__1878) -> (match dtb__1877 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1879, dtb__1880) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType mc1) (v_Vuna_dCompiler_dElab_demptyCtx ())) mc2) dtb__1880)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1881, dtb__1882) -> (match dtb__1882 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1883, dtb__1884) -> (((v_Vuna_dCompiler_dElab_delabSigs dtb__1878) ((v_Base_dList_dappend mc1) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1879, (((v_Vuna_dCompiler_dElab_dinlineSolvedMetas dtb__1884) 0) dtb__1881))), C_Base_dList_dList_Nil)))) dtb__1884)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (mc1, mc2))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_ddtEvalExprIn = (fun prog -> (fun expr -> (match prog with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__1885, dtb__1886, dtb__1887, dtb__1888, dtb__1889, dtb__1890, dtb__1891, dtb__1892) -> ((fun ec0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE dtb__1889) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec0) expr)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1893, dtb__1894) -> (match dtb__1894 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1895, dtb__1896) -> ((fun ec2 -> ((fun sols2 -> (match (((v_Vuna_dCompiler_dElab_dunsolvedFrom dtb__1892) (v_Vuna_dCompiler_dElab_decNext ec2)) sols2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1897) -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan expr)) ((bi_concat "DT: cannot infer a type for this expression (unsolved metavariable ?") ((bi_concat (bi_strFromInt dtb__1897)) "); add a type annotation")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dnormalize ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName d), (v_Vuna_dCompiler_dElab_ddtDefBody d))))) dtb__1886)) sols2) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1893)) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__1898) -> (C_Base_dResult_dResult_Base_dResult_dOk ((bi_strFromInt dtb__1898)))
  | dtb__1899 -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dshowValue dtb__1899)))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decSols ec2))) (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix dtb__1889) dtb__1896) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__1892, dtb__1888, ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName d), (v_Vuna_dCompiler_dElab_ddtDefBody d))))) dtb__1886), dtb__1885, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, dtb__1890, dtb__1891, C_Base_dList_dList_Nil, false)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_delabTraitsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1900, dtb__1901) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabTrait mc1) mc2) dtb__1900)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1902, dtb__1903) -> (match dtb__1903 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1904, dtb__1905) -> (match dtb__1905 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1906, dtb__1907) -> ((((((v_Vuna_dCompiler_dElab_delabTraitsGo dtb__1901) ((v_Base_dList_dappend mc1) dtb__1904)) dtb__1907) (C_Base_dList_dList_Cons (dtb__1902, mc3))) ((v_Base_dList_dappend dtb__1904) mc4)) (C_Base_dList_dList_Cons (dtb__1906, mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc2))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_delabTraits = (fun decls -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_delabTraitsGo decls) globals) ec) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dcheckBodyAtEnd = (fun globals -> (fun ctx -> (fun ec -> (fun body -> (fun expected -> (fun sp -> (match body with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__1908, dtb__1909, dtb__1910) -> (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) body) expected)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: definition has fewer parameters than its signature")
)))))))

let rec v_Vuna_dCompiler_dElab_dcheckBinders = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1911, dtb__1912) -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1913, dtb__1914, dtb__1915, dtb__1916, dtb__1917) -> (if dtb__1914 then (if ((v_Vuna_dCompiler_dElab_disIndexDomain mc2) dtb__1916) then (((((((((v_Vuna_dCompiler_dElab_dbindIndexBinder mc0) mc1) mc2) dtb__1913) dtb__1916) dtb__1917) (C_Base_dList_dList_Cons (dtb__1911, dtb__1912))) mc4) mc6) else ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: implicit parameters must be types or inductive families (M14)")) else (match dtb__1911 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1918, dtb__1919) -> (((((((((v_Vuna_dCompiler_dElab_dbindOnePattern mc0) mc1) mc2) dtb__1918) dtb__1912) mc4) dtb__1916) dtb__1917) mc6)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1920) -> (((((((((v_Vuna_dCompiler_dElab_dbindOnePattern mc0) mc1) mc2) "_") dtb__1912) mc4) dtb__1916) dtb__1917) mc6)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1911)) "DT: definition parameters must be variables (M13)")
))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: definition has more parameters than its signature")
)) ((v_Vuna_dCompiler_dElab_dforceVal mc2) mc5))
  | C_Base_dList_dList_Nil -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1921, dtb__1922, dtb__1923, dtb__1924, dtb__1925) -> (if dtb__1922 then (if ((v_Vuna_dCompiler_dElab_disIndexDomain mc2) dtb__1924) then (((((((((v_Vuna_dCompiler_dElab_dbindIndexBinder mc0) mc1) mc2) dtb__1921) dtb__1924) dtb__1925) C_Base_dList_dList_Nil) mc4) mc6) else ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: implicit parameters must be types or inductive families (M14)")) else ((((((v_Vuna_dCompiler_dElab_dcheckBodyAtEnd mc0) mc1) mc2) mc4) mc5) mc6))
  | _ -> (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) mc4) mc5)
)) ((v_Vuna_dCompiler_dElab_dforceVal mc2) mc5))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dbindIndexBinder = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun dom -> (fun clo -> (fun pats -> (fun body -> (fun sp -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckBinders globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1926, dtb__1927) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (name, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, dtb__1926)), dtb__1927))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) v))) (((v_Vuna_dCompiler_dElab_dctxBindValue name) dom) ctx))) ((v_Vuna_dCompiler_dElab_dfreshVarValue name) lvl))) (v_Vuna_dCompiler_dElab_dctxDepth ctx)))))))))))
and v_Vuna_dCompiler_dElab_dbindOnePattern = (fun globals -> (fun ctx -> (fun ec -> (fun pname -> (fun pats -> (fun body -> (fun dom -> (fun clo -> (fun sp -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun erasure -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckBinders globals) ctx2) ec) pats) body) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1928, dtb__1929) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (pname, erasure, dtb__1928)), dtb__1929))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dtypeLayerRig false) dom))) (((v_Vuna_dCompiler_dElab_dctxBindValue pname) dom) ctx))) ((v_Vuna_dCompiler_dElab_dfreshVarValue pname) lvl))) (v_Vuna_dCompiler_dElab_dctxDepth ctx)))))))))))

let v_Vuna_dCompiler_dElab_dcheckDef = (fun globals -> (fun ec -> (fun pats -> (fun body -> (fun expected -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dcheckBinders globals) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec) pats) body) expected) sp)))))))

let v_Vuna_dCompiler_dElab_delabFunDef = (fun globals -> (fun ec -> (fun clauses -> (fun expected -> (fun sp -> (match clauses with
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: function has no clauses")
  | C_Base_dList_dList_Cons (dtb__1930, dtb__1931) -> (match dtb__1930 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1932, dtb__1933) -> (match dtb__1931 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dDtMatch_dallVarPats dtb__1932) then ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) dtb__1932) dtb__1933) expected) sp) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp))))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
)
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
)
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
))))))

let v_Vuna_dCompiler_dElab_delabInstanceMethod = (fun globals -> (fun ec -> (fun mty -> (fun clauses -> (((((v_Vuna_dCompiler_dElab_delabFunDef globals) ec) clauses) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) mty)) (v_Vuna_dCompiler_dElab_dclauseSpanOf clauses))))))

let rec v_Vuna_dCompiler_dElab_delabInstanceMethodsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__1934, dtb__1935) -> (match dtb__1934 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1936, dtb__1937) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_derrAt mc8) "DT: instance is missing an implementation for an interface method")
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_delabInstanceMethod mc0) mc1) instTy) clauses)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1938, dtb__1939) -> (((((((((v_Vuna_dCompiler_dElab_delabInstanceMethodsGo mc0) dtb__1939) dtb__1935) mc3) mc4) mc5) (C_Base_dList_dList_Cons (dtb__1938, mc6))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1938, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), mc7))) mc8)
  | _ -> failwith "DT: impossible branch"
)))
)) (((v_Vuna_dCompiler_dElab_dsubstClassParam mc3) mc4) dtb__1937))) ((v_Vuna_dCompiler_dElab_dmethodClausesNamed dtb__1936) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc6), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc7), mc1))))))
  | _ -> failwith "DT: impossible branch"
))))))))))

let v_Vuna_dCompiler_dElab_delabInstanceMethods = (fun globals -> (fun cls -> (fun headArg -> (fun ec -> (fun methods -> (fun sp -> (((((((((v_Vuna_dCompiler_dElab_delabInstanceMethodsGo globals) ec) (v_Vuna_dCompiler_dElab_dzipClassFields cls)) (v_Vuna_dCompiler_dElab_dparamNameOf (v_Vuna_dCompiler_dElab_ddtClassParams cls))) headArg) methods) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) sp)))))))

let v_Vuna_dCompiler_dElab_delabInstance = (fun globals -> (fun classes -> (fun datas -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1940, dtb__1941) -> (match dtb__1940 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__1942, dtb__1943, dtb__1944, dtb__1945, dtb__1946) -> (match (v_Vuna_dCompiler_dElab_dinstanceHeadName dtb__1944) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1946) "DT: instance head must be an interface application (e.g. Show Int)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1947) -> (match ((v_Vuna_dCompiler_dElab_dfindClass dtb__1947) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1946) ((bi_concat "DT: unknown interface ") ((bi_concat dtb__1947) " in instance head")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1948) -> (match ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethod dtb__1948) dtb__1945) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1949) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1946) ((bi_concat "DT: instance has unknown method ") dtb__1949))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethod dtb__1948) dtb__1945) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1950) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1946) "DT: instance is missing an implementation for an interface method")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_delabInstanceMethods globals) dtb__1948) (v_Vuna_dCompiler_dElab_dinstanceHeadTerm dtb__1944)) ec) dtb__1945) dtb__1946)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1951, dtb__1952) -> (match dtb__1952 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1953, dtb__1954) -> ((fun iname -> ((fun headTerm -> ((fun dctor -> ((fun dictTerm -> ((fun dictTyTerm -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_decAddDef ((v_Vuna_dCompiler_dElab_decAddInst dtb__1954) (C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (iname, dictTyTerm, (v_Vuna_dCompiler_dElab_dinstanceIsNamed dtb__1942))))) (C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) ((v_Vuna_dCompiler_dElab_dctorResultType dtb__1948) headTerm))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dctor, dtb__1953)))) (v_Vuna_dCompiler_dElab_ddictCtorName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1948)))) (v_Vuna_dCompiler_dElab_dinstanceHeadTerm dtb__1944))) (((v_Vuna_dCompiler_dElab_dinstanceName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1948)) dtb__1942) dtb__1944))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1941) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabBodies = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1955, dtb__1956) -> (match dtb__1955 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1957, dtb__1958, dtb__1959, dtb__1960) -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1957) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1960) ((bi_concat "DT: expected a type signature for ") dtb__1957))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1961) -> (if ((v_Vuna_dCompiler_dElab_dmemDefName dtb__1957) mc2) then (((((v_Vuna_dCompiler_dElab_delabBodies dtb__1956) mc1) mc2) mc3) mc4) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabFunDef mc1) mc4) ((v_Vuna_dCompiler_dAst_dclausesFor (C_Base_dList_dList_Cons (dtb__1955, dtb__1956))) dtb__1957)) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1961)) dtb__1960)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1962, dtb__1963) -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun globals2 -> (((((v_Vuna_dCompiler_dElab_delabBodies dtb__1956) globals2) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1957, liftedTy)), mc2))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef (dtb__1957, liftedTy, cleanTerm)), mc3))) ((v_Vuna_dCompiler_dElab_decAddDef liftedEc) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1957, cleanTerm))))) (((v_Vuna_dCompiler_dElab_dreplaceGlobalType dtb__1957) liftedTy) mc1))) ((v_Vuna_dCompiler_dElab_dsubstDictTerm liftedEc) liftedBody))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf lifted))) ((((v_Vuna_dCompiler_dElab_dliftFreeDictGoals dtb__1957) dtb__1963) dtb__1961) dtb__1962))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_delabBodies dtb__1956) mc1) mc2) mc3) mc4)
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), mc4))))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabInstanceBodiesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1964, dtb__1965) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabInstance mc3) mc1) mc2) mc4) dtb__1964)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1966, dtb__1967) -> ((fun newDefs -> ((((((v_Vuna_dCompiler_dElab_delabInstanceBodiesGo dtb__1965) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__1966)) dtb__1967) ((v_Base_dList_dappend newDefs) mc5))) (((v_Vuna_dCompiler_dElab_dinstanceDefsOf mc4) dtb__1967) dtb__1966))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_delabInstanceBodies = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_delabInstanceBodiesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_delabProgramGo = (fun trusted -> (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcollectSigs decls)) (fun sigs -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabDatas ((v_Vuna_dCompiler_dElab_dcollectDataDecls decls) C_Base_dList_dList_Nil)) (v_Vuna_dCompiler_dDtPrelude_dpreludeGlobalsFor (v_Vuna_dCompiler_dDtPrelude_dpickListFamily (v_Vuna_dCompiler_dElab_ddataNamesOf decls)))) ((v_Vuna_dCompiler_dElab_decWithTrust trusted) (v_Vuna_dCompiler_dElab_decEmpty ())))) (fun pd -> (match pd with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1968, dtb__1969) -> (match dtb__1969 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1970, dtb__1971) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabTraits ((v_Vuna_dCompiler_dElab_dcollectTraitDecls decls) C_Base_dList_dList_Nil)) dtb__1970) dtb__1971)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1972, dtb__1973) -> (match dtb__1973 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1974, dtb__1975) -> (match dtb__1975 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1976, dtb__1977) -> ((fun globals1 -> ((fun datas1 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckInstanceHeads ((v_Vuna_dCompiler_dElab_dcollectInstDecls decls) C_Base_dList_dList_Nil)) dtb__1976) globals1) dtb__1977)) (fun pih -> (match pih with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1978, dtb__1979) -> ((fun globals2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabSigs sigs) globals2) dtb__1979)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1980, dtb__1981) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dcheckAllDefined sigs) dtb__1980) decls)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabBodies decls) dtb__1980) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) dtb__1981)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1982, dtb__1983) -> ((fun ec3 -> ((fun defs -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabInstanceBodies ((v_Vuna_dCompiler_dElab_dcollectInstDecls decls) C_Base_dList_dList_Nil)) dtb__1976) datas1) dtb__1980) ec3)) (fun pi -> (match pi with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1984, dtb__1985) -> ((fun ec4 -> ((fun instDefs -> (match (v_Vuna_dCompiler_dElab_dunsolvedMeta ec4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1986) -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dunsolvedMessage ec4) dtb__1986)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun extra -> ((fun allDefs -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dcheckTerminationIf trusted) decls)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (datas1, allDefs, (v_Vuna_dCompiler_dElab_decGoals ec4), (v_Vuna_dCompiler_dElab_decSols ec4), dtb__1980, (v_Vuna_dCompiler_dElab_decInsts ec4), (v_Vuna_dCompiler_dElab_decClasses ec4), (v_Vuna_dCompiler_dElab_decNext ec4)))))))) ((v_Vuna_dCompiler_dElab_drezonkDefs ec4) ((v_Base_dList_dappend instDefs) ((v_Base_dList_dappend extra) defs))))) (((v_Vuna_dCompiler_dElab_dextraDefsOf dtb__1980) ec4) ((v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_drezonkDefs ec4) dtb__1984))) (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix dtb__1980) dtb__1985) 8))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_drezonkDefs ec3) dtb__1982))) (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix dtb__1980) dtb__1983) 8))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dappend globals1) dtb__1978))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dappend dtb__1968) dtb__1972))) ((v_Base_dList_dappend dtb__1970) dtb__1974))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_delabProgramFullWith = (fun trusted -> (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtRecords_dprepareDecls decls)) (fun ds -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDtDerive_dexpandDerivings ds)) (fun ds2 -> ((v_Vuna_dCompiler_dElab_delabProgramGo trusted) ds2)))))))

let v_Vuna_dCompiler_dElab_delabProgramFull = (fun decls -> ((v_Vuna_dCompiler_dElab_delabProgramFullWith false) decls))

let rec v_Vuna_dCompiler_dElab_delabInstancesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1987, dtb__1988) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabInstance mc3) mc1) mc2) mc4) dtb__1987)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1989, dtb__1990) -> ((((((v_Vuna_dCompiler_dElab_delabInstancesGo dtb__1988) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__1989)) dtb__1990) ((v_Base_dList_dappend dtb__1989) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_delabInstances = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_delabInstancesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_dgoalsOfProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dgoalInfoOf (v_Vuna_dCompiler_dElab_ddtProgSols prog))) (v_Vuna_dCompiler_dElab_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_delabProgramWith = (fun trusted -> (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_delabProgramFullWith trusted) decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtProgDatas prog), (v_Vuna_dCompiler_dElab_ddtProgDefs prog)))))))))

let v_Vuna_dCompiler_dElab_delabProgram = (fun decls -> ((v_Vuna_dCompiler_dElab_delabProgramWith false) decls))
