open Vuna_runtime
open Vuna_builtins
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
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

let rec v_Vuna_dCompiler_dElab_dmemSig = (fun d4595 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__438, dtb__439) -> (match dtb__438 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__440, dtb__441) -> (if (((v_eq d4595) dtb__440) mc1) then true else (((v_Vuna_dCompiler_dElab_dmemSig d4595) dtb__439) mc1))
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
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__448, dtb__449, dtb__450) -> (if ((v_Base_dList_dmemName dtb__448) (v_Vuna_dCompiler_dDtPrelude_dpreludeNames ())) then ((v_Vuna_dCompiler_dElab_derrAt dtb__450) ((bi_concat "DT: cannot redefine builtin ") dtb__448)) else (if (((v_Vuna_dCompiler_dElab_dmemSig (v_Eq_uEq_uString ())) mc1) dtb__448) then ((v_Vuna_dCompiler_dElab_derrAt dtb__450) ((bi_concat "DT: duplicate signature for ") dtb__448)) else (((v_Vuna_dCompiler_dElab_dcollectSigsInto mc0) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__448, (((v_Vuna_dCompiler_dDtQuant_dquantifyTopSig mc0) dtb__449) dtb__450))), mc1))) dtb__447)))
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

let rec v_Vuna_dCompiler_dElab_dprependFamParams = (fun kindTerm -> (fun tyExpr -> (fun sp -> (match kindTerm with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__517, dtb__518, dtb__519, dtb__520, dtb__521) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__517, true, (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("Type", sp)), (((v_Vuna_dCompiler_dElab_dprependFamParams dtb__521) tyExpr) sp), sp))
  | _ -> tyExpr
))))

let rec v_Vuna_dCompiler_dElab_ddropParams = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__522, dtb__523, dtb__524, dtb__525, dtb__526) -> (v_Vuna_dCompiler_dElab_ddropParams dtb__526)
  | _ -> t
))

let rec v_Vuna_dCompiler_dElab_dctorGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__527, dtb__528) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtCtorName dtb__527), (v_Vuna_dCompiler_dElab_ddtCtorType dtb__527))), (v_Vuna_dCompiler_dElab_dctorGlobals dtb__528)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddataHeadName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__529, dtb__530, dtb__531) -> dtb__529
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddataHeadKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__532, dtb__533, dtb__534) -> dtb__533
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddataHeadArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__535, dtb__536, dtb__537) -> dtb__537
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dlookupDataHead = (fun name -> (fun heads -> (match heads with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__538, dtb__539) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddataHeadName dtb__538)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddataHeadKind dtb__538), (v_Vuna_dCompiler_dElab_ddataHeadArity dtb__538))))) else ((v_Vuna_dCompiler_dElab_dlookupDataHead name) dtb__539))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddictTypeName = (fun cname -> ((bi_concat "Dict_") cname))

let v_Vuna_dCompiler_dElab_ddictCtorName = (fun cname -> ((bi_concat "MkDict_") cname))

let rec v_Vuna_dCompiler_dElab_dcollectTraitDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__540, dtb__541) -> (match dtb__540 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__542, dtb__543, dtb__544, dtb__545) -> ((v_Vuna_dCompiler_dElab_dcollectTraitDecls dtb__541) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__540, dtb__545)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dcollectTraitDecls dtb__541) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dcollectInstDecls = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__546, dtb__547) -> (match dtb__546 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__548, dtb__549, dtb__550, dtb__551, dtb__552) -> ((v_Vuna_dCompiler_dElab_dcollectInstDecls dtb__547) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__546, dtb__552)), mc1)))
  | _ -> ((v_Vuna_dCompiler_dElab_dcollectInstDecls dtb__547) mc1)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dparamNameOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__553, dtb__554) -> dtb__553
  | C_Base_dList_dList_Nil -> "_"
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dbindClassParams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__555, dtb__556) -> (((v_Vuna_dCompiler_dElab_dbindClassParams dtb__556) mc1) (((v_Vuna_dCompiler_dElab_dctxBind dtb__555) ((v_Vuna_dCompiler_dDtKind_dclassParamKind dtb__555) mc1)) mc2))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dfoldlAddDef = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__557, dtb__558) -> ((v_Vuna_dCompiler_dElab_dfoldlAddDef ((v_Vuna_dCompiler_dElab_decAddDef mc0) dtb__557)) dtb__558)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfoldPiFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__559, dtb__560) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", false, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1, (((v_Vuna_dCompiler_dCore_dshift 0) mc1) dtb__559), (((v_Vuna_dCompiler_dElab_dfoldPiFieldTysGo dtb__560) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dfoldPiFieldTys = (fun fieldTys -> (fun ty -> (((v_Vuna_dCompiler_dElab_dfoldPiFieldTysGo fieldTys) 0) ty)))

let rec v_Vuna_dCompiler_dElab_dmethodArgTermsGo = (fun rigs -> (fun nFields -> (fun i -> (fun arity -> (match rigs with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__561, dtb__562) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (((bi_concat "x") (bi_strFromInt i)), ((bi_add nFields) ((bi_sub ((bi_sub arity) 1)) i)))), dtb__561)), ((((v_Vuna_dCompiler_dElab_dmethodArgTermsGo dtb__562) nFields) ((bi_add i) 1)) arity)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dmethodArgTerms = (fun rigs -> (fun nFields -> ((((v_Vuna_dCompiler_dElab_dmethodArgTermsGo rigs) nFields) 0) (v_Base_dList_dlength rigs))))

let rec v_Vuna_dCompiler_dElab_dmethodArgLams = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__563, dtb__564) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (((bi_concat "x") (bi_strFromInt mc1)), dtb__563, (((v_Vuna_dCompiler_dElab_dmethodArgLams dtb__564) ((bi_add mc1) 1)) mc2)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dfieldVarName = (fun i -> ((bi_concat "f") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dfieldBinderGo = (fun n -> (fun i -> (fun acc -> (if ((bi_ge_int i) n) then (v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dfieldBinderGo n) ((bi_add i) 1)) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dfieldVarName i), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), acc)))))))

let v_Vuna_dCompiler_dElab_dfieldBinderNames = (fun n -> (((v_Vuna_dCompiler_dElab_dfieldBinderGo n) 0) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dexplicitPiArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> (if dtb__566 then (v_Vuna_dCompiler_dElab_dexplicitPiArity dtb__569) else ((bi_add 1) (v_Vuna_dCompiler_dElab_dexplicitPiArity dtb__569)))
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dinstanceHeadName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__570, dtb__571) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__570))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__572, dtb__573, dtb__574) -> (match dtb__572 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__575, dtb__576) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__575))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_danonInstName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__577, dtb__578) -> ((v_Base_dString_dstartsWith "#") dtb__578)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dinstPrefixOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__579, dtb__580) -> (if ((bi_eq_generic dtb__579) C_Base_dList_dList_Nil) then "" else ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__579)) "."))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dexprNameFor = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__581, dtb__582) -> dtb__581
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__583, dtb__584) -> (bi_strFromInt dtb__583)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__585, dtb__586) -> dtb__585
  | _ -> "X"
))

let rec v_Vuna_dCompiler_dElab_dargSuffix = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__587, dtb__588) -> ((bi_concat "_") ((bi_concat (v_Vuna_dCompiler_dElab_dexprNameFor dtb__587)) (v_Vuna_dCompiler_dElab_dargSuffix dtb__588)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dderivedInstName = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__589, dtb__590, dtb__591) -> (match dtb__589 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__592, dtb__593) -> ((bi_concat dtb__592) (v_Vuna_dCompiler_dElab_dargSuffix dtb__590))
  | _ -> "Inst"
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__594, dtb__595) -> dtb__594
  | _ -> "Inst"
))

let v_Vuna_dCompiler_dElab_dinstanceName = (fun cname -> (fun mname -> (fun headExpr -> (match mname with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dderivedInstName headExpr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__596) -> (if (v_Vuna_dCompiler_dElab_danonInstName dtb__596) then ((bi_concat (v_Vuna_dCompiler_dElab_dinstPrefixOf dtb__596)) ((bi_concat cname) ((bi_concat "_") (v_Vuna_dCompiler_dElab_dderivedInstName headExpr)))) else dtb__596)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dargNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__597, dtb__598) -> dtb__597
  | _ -> "Int"
))

let v_Vuna_dCompiler_dElab_dinstanceHeadTerm = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__599, dtb__600, dtb__601) -> (match dtb__600 with
  | C_Base_dList_dList_Cons (dtb__602, dtb__603) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_dargNameOf dtb__602)))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__604, dtb__605) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__604))
  | _ -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dfindClass = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__606, dtb__607) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtClassName dtb__606)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__606)) else ((v_Vuna_dCompiler_dElab_dfindClass mc0) dtb__607))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dzipMethodFields = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__608, dtb__609) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__610, dtb__611) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__608), dtb__610)), ((v_Vuna_dCompiler_dElab_dzipMethodFields dtb__609) dtb__611)))
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
  | C_Base_dList_dList_Cons (dtb__612, dtb__613) -> (v_Vuna_dCompiler_dAst_dexprSpan (v_Base_dPair_dsecondOf dtb__612))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dunifyErr = fun () -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: this branch is impossible (index constraints are unsatisfiable)"))

let rec v_Vuna_dCompiler_dElab_doccursLevel = (fun lvl -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__614) -> (match dtb__614 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__615, dtb__616, dtb__617) -> (if ((bi_eq_int dtb__616) lvl) then true else ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__617))
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__618, dtb__619) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__619)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__620, dtb__621, dtb__622, dtb__623, dtb__624) -> (if ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__623) then true else ((v_Vuna_dCompiler_dElab_doccursLevelClo lvl) dtb__624))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVLam (dtb__625, dtb__626, dtb__627) -> ((v_Vuna_dCompiler_dElab_doccursLevelClo lvl) dtb__627)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__628, dtb__629) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__629)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__630, dtb__631) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__631)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCase (dtb__632, dtb__633) -> ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__632)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVIf (dtb__634, dtb__635, dtb__636) -> (if (if ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__634) then true else ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__635)) then true else ((v_Vuna_dCompiler_dElab_doccursLevel lvl) dtb__636))
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__637) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__638) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__639) -> false
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__640) -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_doccursLevelList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__641, dtb__642) -> (if ((v_Vuna_dCompiler_dElab_doccursLevel mc0) dtb__641) then true else ((v_Vuna_dCompiler_dElab_doccursLevelList mc0) dtb__642))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_doccursLevelClo = (fun lvl -> (fun clo -> (match clo with
  | C_Vuna_dCompiler_dCore_dClosure_Vuna_dCompiler_dCore_dClos (dtb__643, dtb__644) -> ((v_Vuna_dCompiler_dElab_doccursLevelList lvl) dtb__643)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dunifyIdxConv = (fun ec -> (fun acc -> (fun depth -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) depth) a) b) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__645) -> (C_Base_dResult_dResult_Base_dResult_dOk (acc))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__646) -> (v_Vuna_dCompiler_dElab_dunifyErr ())
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dunifyIdxList = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__647, dtb__648) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__649, dtb__650) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dunifyIdx mc0) mc1) mc2) ((bi_sub mc3) 1)) dtb__647) dtb__649)) (fun acc2 -> ((((((v_Vuna_dCompiler_dElab_dunifyIdxList mc0) acc2) mc2) ((bi_sub mc3) 1)) dtb__648) dtb__650)))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Base_dList_dList_Nil -> (match mc5 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dunifyIdx = (fun ec -> (fun acc -> (fun depth -> (fun fuel -> (fun a -> (fun b -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: index unification ran out of reduction fuel")) else ((fun a2 -> ((fun b2 -> (match a2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__651) -> (match dtb__651 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__652, dtb__653, dtb__654) -> (match dtb__654 with
  | C_Base_dList_dList_Nil -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__655) -> (match dtb__655 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__656, dtb__657, dtb__658) -> (match dtb__658 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_int dtb__653) dtb__657) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (if ((bi_lt_int dtb__653) dtb__657) then (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__657) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__657, a2)), acc))))) else (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__653) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__653, b2)), acc)))))))
  | _ -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__653) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__653, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__653) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__653, b2)), acc)))))
)
  | _ -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__653) b2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__653, b2)), acc)))))
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__659) -> (match dtb__659 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__660, dtb__661, dtb__662) -> (match dtb__662 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__661) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__661, a2)), acc)))))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__663) -> (match dtb__663 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__664, dtb__665, dtb__666) -> (match dtb__666 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__665) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__665, a2)), acc)))))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
)
  | _ -> (match b2 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__667) -> (match dtb__667 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__668, dtb__669, dtb__670) -> (match dtb__670 with
  | C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_doccursLevel dtb__669) a2) then (v_Vuna_dCompiler_dElab_dunifyErr ()) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__669, a2)), acc)))))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxRigid ec) acc) depth) a2) b2)
)
)) ((((v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) (((v_Vuna_dCompiler_dElab_drefineValue acc) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) b)))) ((((v_Vuna_dCompiler_dCore_dforce (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) (((v_Vuna_dCompiler_dElab_drefineValue acc) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) a))))))))))
and v_Vuna_dCompiler_dElab_dunifyIdxRigid = (fun ec -> (fun acc -> (fun depth -> (fun a -> (fun b -> (match a with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__671, dtb__672) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVCon (dtb__673, dtb__674) -> (if ((bi_eq_str dtb__671) dtb__673) then ((((((v_Vuna_dCompiler_dElab_dunifyIdxList ec) acc) depth) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) dtb__672) dtb__674) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__675) -> (match dtb__675 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__676, dtb__677) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__678) -> (match dtb__678 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__679, dtb__680) -> (if ((bi_eq_str dtb__676) dtb__679) then ((((((v_Vuna_dCompiler_dElab_dunifyIdxList ec) acc) depth) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) dtb__677) dtb__680) else (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b))
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__681) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__682) -> (if ((v_Vuna_dCompiler_dCore_dlevelEq dtb__681) dtb__682) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__683) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__684) -> (if ((bi_eq_int dtb__683) dtb__684) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__685) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVStr (dtb__686) -> (if ((bi_eq_str dtb__685) dtb__686) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__687) -> (match b with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVBool (dtb__688) -> (if ((bi_eq_generic dtb__687) dtb__688) then (C_Base_dResult_dResult_Base_dResult_dOk (acc)) else (v_Vuna_dCompiler_dElab_dunifyErr ()))
  | _ -> (v_Vuna_dCompiler_dElab_dunifyErr ())
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dunifyIdxConv ec) acc) depth) a) b)
))))))

let rec v_Vuna_dCompiler_dElab_dfreshTeleVals = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__689, dtb__690) -> (match dtb__689 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__691, dtb__692) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__691, ((bi_add mc1) mc2), C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dfreshTeleVals dtb__690) mc1) ((bi_add mc2) 1))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dctorResultTerms = (fun c -> (match (v_Vuna_dCompiler_dElab_dresultSpine (v_Vuna_dCompiler_dElab_ddtCtorType c)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__693, dtb__694) -> dtb__694
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dctorResultVals = (fun c -> (fun base -> ((fun tele -> ((fun env -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dCore_deval env) t))) (v_Vuna_dCompiler_dElab_dctorResultTerms c))) (v_Base_dList_dreverse (((v_Vuna_dCompiler_dElab_dfreshTeleVals tele) base) 0)))) (v_Vuna_dCompiler_dElab_ddtCtorTelescope c))))

let v_Vuna_dCompiler_dElab_dctorResultValsIn = (fun ctx -> (fun c -> ((v_Base_dList_dmap (fun t -> ((v_Vuna_dCompiler_dElab_devalCtx ctx) t))) (v_Vuna_dCompiler_dElab_dctorResultTerms c))))

let v_Vuna_dCompiler_dElab_dpendingPat = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (dtb__695, dtb__696) -> dtb__695
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dpendingName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (dtb__697, dtb__698) -> dtb__698
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dbaBinders = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc (dtb__699, dtb__700) -> dtb__699
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dbaPending = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc (dtb__701, dtb__702) -> dtb__702
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dfreshPatName = (fun i -> ((bi_concat "_np") (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dfoldPending = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__703, dtb__704) -> ((fun ps -> ((fun patAlt -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__705) -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dElab_dpendingName dtb__703), ps)), (C_Base_dList_dList_Cons (patAlt, (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (ps)), dtb__705)), C_Base_dList_dList_Nil)))), ps))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dElab_dpendingName dtb__703), ps)), (C_Base_dList_dList_Cons (patAlt, C_Base_dList_dList_Nil)), ps))
  | _ -> failwith "DT: impossible branch"
)) (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dpendingPat dtb__703), (((v_Vuna_dCompiler_dElab_dfoldPending mc0) dtb__704) mc2))))) (v_Vuna_dCompiler_dAst_dpatSpan (v_Vuna_dCompiler_dElab_dpendingPat dtb__703)))
  | C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_daltNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__706, dtb__707) -> (match dtb__706 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__708, dtb__709) -> (match dtb__708 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__710, dtb__711, dtb__712) -> (C_Base_dList_dList_Cons (dtb__710, (v_Vuna_dCompiler_dElab_daltNames dtb__707)))
  | _ -> (v_Vuna_dCompiler_dElab_daltNames dtb__707)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dhasCatchAll = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__713, dtb__714) -> (match dtb__713 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__715, dtb__716) -> (match dtb__715 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__717, dtb__718, dtb__719) -> (v_Vuna_dCompiler_dElab_dhasCatchAll dtb__714)
  | _ -> true
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dhasDupNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__720, dtb__721) -> (if ((v_Base_dList_dmemName dtb__720) dtb__721) then true else (v_Vuna_dCompiler_dElab_dhasDupNames dtb__721))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dcheckCovered = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc6 with
  | C_Base_dList_dList_Cons (dtb__722, dtb__723) -> ((fun written -> ((fun reachable -> (if reachable then (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_ddtCtorName dtb__722)) written) then (((((((v_Vuna_dCompiler_dElab_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) dtb__723) else (if (v_Vuna_dCompiler_dElab_decTrusted mc0) then (((((((v_Vuna_dCompiler_dElab_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) dtb__723) else ((v_Vuna_dCompiler_dElab_derrAt mc5) ((bi_concat "DT: case is not exhaustive: missing ") (v_Vuna_dCompiler_dElab_ddtCtorName dtb__722))))) else (((((((v_Vuna_dCompiler_dElab_dcheckCovered mc0) mc1) mc2) mc3) mc4) mc5) dtb__723))) (match ((((((v_Vuna_dCompiler_dElab_dunifyIdxList mc0) C_Base_dList_dList_Nil) mc1) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dElab_dctorResultVals dtb__722) mc1)) mc3) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__724) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__725) -> false
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dElab_daltNames mc4))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dcheckCoverage = (fun ec -> (fun depth -> (fun dd -> (fun idxs -> (fun alts -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dcheckCovered ec) depth) dd) idxs) alts) sp) (v_Vuna_dCompiler_dElab_ddtDataCtors dd))))))))

let rec v_Vuna_dCompiler_dElab_danyNestedArg = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__726, dtb__727) -> (match dtb__726 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__728, dtb__729) -> (v_Vuna_dCompiler_dElab_danyNestedArg dtb__727)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__730) -> (v_Vuna_dCompiler_dElab_danyNestedArg dtb__727)
  | _ -> true
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dnestedInPat = (fun p -> (match p with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__731, dtb__732, dtb__733) -> (v_Vuna_dCompiler_dElab_danyNestedArg dtb__732)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_danyNestedPat = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__734, dtb__735) -> (match dtb__734 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__736, dtb__737) -> (if (v_Vuna_dCompiler_dElab_dnestedInPat dtb__736) then true else (v_Vuna_dCompiler_dElab_danyNestedPat dtb__735))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dhasVarCatchAll = (fun alts -> (match (v_Base_dList_dreverse alts) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__738, dtb__739) -> (match dtb__738 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__740, dtb__741) -> (match dtb__740 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__742, dtb__743) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dcatchAllNotLast = (fun alts -> (match alts with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__744, dtb__745) -> (match dtb__744 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__746, dtb__747) -> (match dtb__746 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__748, dtb__749, dtb__750) -> (v_Vuna_dCompiler_dElab_dcatchAllNotLast dtb__745)
  | _ -> (v_Vuna_dCompiler_dElab_dnonEmpty dtb__745)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dlitEqName = (fun tyName -> (if ((bi_eq_str tyName) "String") then "bi_eq_str" else "bi_eq_int"))

let v_Vuna_dCompiler_dElab_dcheckCaseDone = (fun ec -> (fun ctx -> (fun dd -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (fun scrutTerm -> (fun altTerms -> (if (v_Vuna_dCompiler_dElab_dhasCatchAll alts) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms)), ec)))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dcheckCoverage ec) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dd) idxs) alts) sp)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (scrutTerm, altTerms)), ec))))))))))))))))

let rec v_Vuna_dCompiler_dElab_dleadingImplicitCount = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__751, dtb__752, dtb__753, dtb__754, dtb__755) -> (if dtb__752 then ((bi_add 1) (v_Vuna_dCompiler_dElab_dleadingImplicitCount dtb__755)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dsolveLiftedMeta = (fun ec -> (fun name -> (fun m -> (match ((((((v_Vuna_dCompiler_dCore_dsolveMeta (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) 0) m) C_Base_dList_dList_Nil) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (name, 0, C_Base_dList_dList_Nil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__756) -> (match (((v_Vuna_dCompiler_dElab_dcheckSolsDelta ec) (v_Vuna_dCompiler_dElab_decSols ec)) dtb__756) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__757) -> ec
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__758) -> ((v_Vuna_dCompiler_dElab_decPutSols ec) dtb__756)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__759) -> ec
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dflattenTaggedApp = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__760, dtb__761, dtb__762) -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp dtb__760) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__763) -> (match dtb__763 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__764, dtb__765) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__764, ((v_Base_dList_dappend dtb__765) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__761, dtb__762)), C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__766) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__766, C_Base_dList_dList_Nil))))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dinsertArgAt = (fun n -> (fun x -> (fun xs -> ((v_Base_dList_dappend ((v_Base_dList_dappend ((v_Base_dList_dtake n) xs)) (C_Base_dList_dList_Cons (x, C_Base_dList_dList_Nil)))) ((v_Base_dList_ddrop n) xs)))))

let rec v_Vuna_dCompiler_dElab_dreplaceGlobalType = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__767, dtb__768) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf dtb__767)) mc0) then (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__768)) else (C_Base_dList_dList_Cons (dtb__767, (((v_Vuna_dCompiler_dElab_dreplaceGlobalType mc0) mc1) dtb__768))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dhasFunClause = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__769, dtb__770) -> (match dtb__769 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__771, dtb__772, dtb__773, dtb__774) -> (if ((bi_eq_str dtb__771) mc0) then true else ((v_Vuna_dCompiler_dElab_dhasFunClause mc0) dtb__770))
  | _ -> ((v_Vuna_dCompiler_dElab_dhasFunClause mc0) dtb__770)
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dcheckAllDefined = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__775, dtb__776) -> (match dtb__775 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__777, dtb__778) -> (if ((v_Vuna_dCompiler_dElab_dhasFunClause dtb__777) mc2) then (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__777) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: signature for ") ((bi_concat dtb__777) " has no definition"))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__779) -> (((v_Vuna_dCompiler_dElab_dcheckAllDefined dtb__776) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: signature for ") ((bi_concat dtb__777) " has no definition")))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_ddtProgDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__780, dtb__781, dtb__782, dtb__783, dtb__784, dtb__785, dtb__786, dtb__787) -> dtb__780
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__788, dtb__789, dtb__790, dtb__791, dtb__792, dtb__793, dtb__794, dtb__795) -> dtb__789
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__796, dtb__797, dtb__798, dtb__799, dtb__800, dtb__801, dtb__802, dtb__803) -> dtb__798
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__804, dtb__805, dtb__806, dtb__807, dtb__808, dtb__809, dtb__810, dtb__811) -> dtb__807
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__812, dtb__813, dtb__814, dtb__815, dtb__816, dtb__817, dtb__818, dtb__819) -> dtb__816
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__820, dtb__821, dtb__822, dtb__823, dtb__824, dtb__825, dtb__826, dtb__827) -> dtb__825
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__828, dtb__829, dtb__830, dtb__831, dtb__832, dtb__833, dtb__834, dtb__835) -> dtb__834
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtProgNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__836, dtb__837, dtb__838, dtb__839, dtb__840, dtb__841, dtb__842, dtb__843) -> dtb__843
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dcheckTerminationIf = (fun trusted -> (fun decls -> (if trusted then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (v_Vuna_dCompiler_dDtTerm_dcheckTerminationDecls decls))))

let rec v_Vuna_dCompiler_dElab_dfoldlAddInst = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__844, dtb__845) -> ((v_Vuna_dCompiler_dElab_dfoldlAddInst ((v_Vuna_dCompiler_dElab_decAddInst mc0) dtb__844)) dtb__845)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinstanceIsNamed = (fun mc0 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__846) -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_danonInstName dtb__846))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dheadsEqual = (fun ec -> (fun a -> (fun b -> (match (((((v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) 0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) a)) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) b)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__847) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__848) -> false
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dfindDefaultDup = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__849, dtb__850) -> (if mc1 then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (v_Vuna_dCompiler_dElab_ddtInstNamed dtb__849) then ((((v_Vuna_dCompiler_dElab_dfindDefaultDup mc0) mc1) mc2) dtb__850) else (if (((v_Vuna_dCompiler_dElab_dheadsEqual mc0) mc2) (v_Vuna_dCompiler_dElab_ddtInstHead dtb__849)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__849)) else ((((v_Vuna_dCompiler_dElab_dfindDefaultDup mc0) mc1) mc2) dtb__850))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dfindDuplicateInstance = (fun ec -> (fun name -> (fun named -> (fun ty -> (fun seen -> (if ((v_Vuna_dCompiler_dElab_dhasInstName name) seen) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (name, ty, named)))) else ((((v_Vuna_dCompiler_dElab_dfindDefaultDup ec) named) ty) seen)))))))

let v_Vuna_dCompiler_dElab_ddefBodyOf = (fun defs -> (fun name -> (match ((v_Vuna_dCompiler_dCore_ddefLookup name) defs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__851) -> dtb__851
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddefTypeOrDefault = (fun globals -> (fun name -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__852) -> dtb__852
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dextraDefsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__853, dtb__854) -> (if ((v_Base_dList_dmemName (v_Base_dPair_dfirstOf dtb__853)) mc1) then ((((v_Vuna_dCompiler_dElab_dextraDefsGo mc0) mc1) dtb__854) mc3) else ((((v_Vuna_dCompiler_dElab_dextraDefsGo mc0) mc1) dtb__854) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef ((v_Base_dPair_dfirstOf dtb__853), ((v_Vuna_dCompiler_dElab_ddefTypeOrDefault mc0) (v_Base_dPair_dfirstOf dtb__853)), (v_Base_dPair_dsecondOf dtb__853))), mc3))))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dextraDefsOf = (fun globals -> (fun ec -> (fun sourceDefs -> ((((v_Vuna_dCompiler_dElab_dextraDefsGo globals) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtDefName) sourceDefs)) (v_Vuna_dCompiler_dElab_decDefs ec)) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dElab_dctorFieldGo = (fun arity -> (fun t -> (fun acc -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__855, dtb__856, dtb__857, dtb__858, dtb__859) -> (if ((bi_gt_int arity) 0) then (((v_Vuna_dCompiler_dElab_dctorFieldGo ((bi_sub arity) 1)) dtb__859) acc) else (((v_Vuna_dCompiler_dElab_dctorFieldGo 0) dtb__859) (C_Base_dList_dList_Cons (dtb__858, acc))))
  | _ -> (v_Base_dList_dreverse acc)
))))

let v_Vuna_dCompiler_dElab_dctorFieldTerms = (fun arity -> (fun ty -> (((v_Vuna_dCompiler_dElab_dctorFieldGo arity) ty) C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dtermUsesVar = (fun depth -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__860, dtb__861) -> ((bi_eq_int dtb__861) depth)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__862) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__863) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__864) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__865, dtb__866, dtb__867, dtb__868, dtb__869) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__868) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar ((bi_add depth) 1)) dtb__869))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__870, dtb__871, dtb__872) -> ((v_Vuna_dCompiler_dElab_dtermUsesVar ((bi_add depth) 1)) dtb__872)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__873, dtb__874, dtb__875) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__873) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__874))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__876, dtb__877) -> ((v_Vuna_dCompiler_dElab_dtermUsesVarArgs depth) dtb__877)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__878, dtb__879) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__878) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVarAlts depth) dtb__879))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__880) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__881) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__882) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__883, dtb__884, dtb__885) -> (if (if ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__883) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__884)) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVar depth) dtb__885))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dtermUsesVarArgs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__886, dtb__887) -> (match dtb__886 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__888, dtb__889) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar mc0) dtb__888) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVarArgs mc0) dtb__887))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dtermUsesVarAlts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__890, dtb__891) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar ((bi_add mc0) (v_Base_dList_dlength (v_Vuna_dCompiler_dCore_dcaseAltBinders dtb__890)))) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__890)) then true else ((v_Vuna_dCompiler_dElab_dtermUsesVarAlts mc0) dtb__891))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dusedInTeleGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__892, dtb__893) -> (if ((v_Vuna_dCompiler_dElab_dtermUsesVar mc0) dtb__892) then true else ((v_Vuna_dCompiler_dElab_dusedInTeleGo mc0) dtb__893))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dusedInTele = (fun i -> (fun arity -> (fun k -> (fun ts -> ((v_Vuna_dCompiler_dElab_dusedInTeleGo ((bi_add k) arity)) ts)))))

let v_Vuna_dCompiler_dElab_dusedInCtor = (fun i -> (fun arity -> (fun c -> ((((v_Vuna_dCompiler_dElab_dusedInTele i) arity) 0) ((v_Vuna_dCompiler_dElab_dctorFieldTerms arity) (v_Vuna_dCompiler_dElab_ddtCtorType c))))))

let rec v_Vuna_dCompiler_dElab_dusedInCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__894, dtb__895) -> (if (((v_Vuna_dCompiler_dElab_dusedInCtor mc0) mc1) dtb__894) then true else (((v_Vuna_dCompiler_dElab_dusedInCtors mc0) mc1) dtb__895))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dparamUsedInFieldTys = (fun dd -> (fun i -> (((v_Vuna_dCompiler_dElab_dusedInCtors i) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtDataParams dd))) (v_Vuna_dCompiler_dElab_ddtDataCtors dd))))

let rec v_Vuna_dCompiler_dElab_deraseMaskGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__896, dtb__897) -> ((((v_Vuna_dCompiler_dElab_deraseMaskGo mc0) dtb__897) ((bi_add mc2) 1)) (C_Base_dList_dList_Cons ((v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dparamUsedInFieldTys mc0) mc2)), mc3)))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_deraseIndexMask = (fun dd -> ((((v_Vuna_dCompiler_dElab_deraseMaskGo dd) (v_Vuna_dCompiler_dElab_ddtDataParams dd)) 0) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dcandidateNames = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__898, dtb__899) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__900, dtb__901) -> (match dtb__898 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__902, dtb__903) -> (if dtb__900 then (C_Base_dList_dList_Cons (dtb__902, ((v_Vuna_dCompiler_dElab_dcandidateNames dtb__899) dtb__901))) else ((v_Vuna_dCompiler_dElab_dcandidateNames dtb__899) dtb__901))
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
  | C_Base_dList_dList_Cons (dtb__904, dtb__905) -> (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dcandidateOf dtb__904), (v_Vuna_dCompiler_dElab_dindexErasureCandidates dtb__905)))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dtermHasMeta = (fun m -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTMeta (dtb__906) -> ((bi_eq_int dtb__906) m)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dtb__907, dtb__908) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__909) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType (dtb__910) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__911, dtb__912, dtb__913, dtb__914, dtb__915) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__914) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__915))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__916, dtb__917, dtb__918) -> ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__918)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__919, dtb__920, dtb__921) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__919) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__920))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__922, dtb__923) -> ((v_Vuna_dCompiler_dElab_danyArgHasMeta m) dtb__923)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__924, dtb__925) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__924) then true else ((v_Vuna_dCompiler_dElab_danyAltHasMeta m) dtb__925))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__926) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__927) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (dtb__928) -> false
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__929, dtb__930, dtb__931) -> (if (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__929) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__930)) then true else ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__931))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_danyArgHasMeta = (fun m -> (fun args -> (match args with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__932, dtb__933) -> (match dtb__932 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__934, dtb__935) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__934) then true else ((v_Vuna_dCompiler_dElab_danyArgHasMeta m) dtb__933))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_danyAltHasMeta = (fun m -> (fun alts -> (match alts with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__936, dtb__937) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) (v_Vuna_dCompiler_dCore_dcaseAltBody dtb__936)) then true else ((v_Vuna_dCompiler_dElab_danyAltHasMeta m) dtb__937))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfindDefWithMeta = (fun defs -> (fun m -> (match defs with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__938, dtb__939) -> (match dtb__938 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__940, dtb__941) -> (if ((v_Vuna_dCompiler_dElab_dtermHasMeta m) dtb__941) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((bi_concat dtb__940) ((bi_concat " body=") (v_Vuna_dCompiler_dCore_dshowTerm dtb__941))))) else ((v_Vuna_dCompiler_dElab_dfindDefWithMeta dtb__939) m))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dmetaOwnerHint = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dfindDefWithMeta (v_Vuna_dCompiler_dElab_decDefs ec)) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__942) -> ((bi_concat " (in `") ((bi_concat dtb__942) "`)"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dctxDepthOf = (fun g -> (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtGoalCtx g)))

let rec v_Vuna_dCompiler_dElab_dfindGoal = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__943, dtb__944) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_ddtGoalMeta dtb__943)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__943)) else ((v_Vuna_dCompiler_dElab_dfindGoal mc0) dtb__944))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dunsolvedFromRelevant = (fun i -> (fun stop -> (fun sols -> (fun relevant -> (fun goals -> (if ((bi_ge_int i) stop) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match ((v_Vuna_dCompiler_dCore_dmetaLookup i) sols) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__945) -> (((((v_Vuna_dCompiler_dElab_dunsolvedFromRelevant ((bi_add i) 1)) stop) sols) relevant) goals)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dmemMetaId i) relevant) then true else (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dfindGoal i) goals))) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i)) else (((((v_Vuna_dCompiler_dElab_dunsolvedFromRelevant ((bi_add i) 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dunsolvedFromRelevant 0) (v_Vuna_dCompiler_dElab_decNext ec)) (v_Vuna_dCompiler_dElab_decSols ec)) (v_Vuna_dCompiler_dElab_drelevantMetas ec)) (v_Vuna_dCompiler_dElab_decGoals ec)))

let v_Vuna_dCompiler_dElab_dunsolvedMessage = (fun ec -> (fun m -> (match ((v_Vuna_dCompiler_dElab_dfindGoal m) (v_Vuna_dCompiler_dElab_decGoals ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__946) -> ((bi_concat "DT: unsolved hole ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dElab_ddtGoalSpan dtb__946))) ((bi_concat " with goal ") ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepthOf dtb__946)) (v_Vuna_dCompiler_dElab_ddtGoalType dtb__946)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((bi_concat "DT: unsolved metavariable ?") ((bi_concat (bi_strFromInt m)) ((v_Vuna_dCompiler_dElab_dmetaOwnerHint ec) m)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddtGoalInfoSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo (dtb__947, dtb__948, dtb__949) -> dtb__947
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalInfoGoal = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo (dtb__950, dtb__951, dtb__952) -> dtb__951
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_ddtGoalInfoCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo (dtb__953, dtb__954, dtb__955) -> dtb__955
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dzonkGoal = (fun sols -> (fun v -> ((((v_Vuna_dCompiler_dCore_dforce C_Base_dList_dList_Nil) sols) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) v)))

let rec v_Vuna_dCompiler_dElab_dctxEntriesAt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__956, dtb__957) -> (match dtb__956 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__958, dtb__959) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__958, ((v_Vuna_dCompiler_dCore_dshowValueAt mc2) ((v_Vuna_dCompiler_dCore_deval (((v_Vuna_dCompiler_dElab_dctxEnvAt (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__958, dtb__959)), dtb__957))) 0) mc2)) (((v_Vuna_dCompiler_dCore_dshift 0) ((bi_add mc1) 1)) dtb__959))))), (((v_Vuna_dCompiler_dElab_dctxEntriesAt dtb__957) ((bi_add mc1) 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dctxEntriesAt items) 0) (v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dgoalInfoOf = (fun sols -> (fun g -> (C_Vuna_dCompiler_dElab_dDtGoalInfo_Vuna_dCompiler_dElab_dDtGoalInfo ((v_Vuna_dCompiler_dElab_ddtGoalSpan g), ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dzonkGoal sols) (v_Vuna_dCompiler_dElab_ddtGoalType g))), (v_Vuna_dCompiler_dElab_dctxEntriesOf (v_Vuna_dCompiler_dElab_ddtGoalCtx g))))))

let v_Vuna_dCompiler_dElab_dbinderRig = (fun implicit -> (fun dom -> ((v_Vuna_dCompiler_dCore_drigOfBinder implicit) (v_Vuna_dCompiler_dCore_disTypeValue dom))))

let rec v_Vuna_dCompiler_dElab_dsplitKind = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__960, dtb__961, dtb__962, dtb__963, dtb__964) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__960, ((v_Vuna_dCompiler_dElab_dbinderRig dtb__961) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__963)))), (v_Vuna_dCompiler_dElab_dsplitKind dtb__964)))
  | _ -> C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dteleOf = (fun ty -> (fun env -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__965, dtb__966, dtb__967, dtb__968, dtb__969) -> ((fun domVal -> ((fun v -> ((fun rig -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__965, rig)), ((v_Vuna_dCompiler_dElab_dteleOf dtb__969) (C_Base_dList_dList_Cons (v, env)))))) ((v_Vuna_dCompiler_dElab_dbinderRig dtb__966) domVal))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__965, (v_Base_dList_dlength env), C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dCore_deval env) dtb__968))
  | _ -> C_Base_dList_dList_Nil
)))

let v_Vuna_dCompiler_dElab_dteleOfType = (fun ty -> ((v_Vuna_dCompiler_dElab_dteleOf ty) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dbindCtorGo = (fun ctx -> (fun ty -> (fun subpats -> (fun acc -> (match ty with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__970, dtb__971, dtb__972, dtb__973, dtb__974) -> ((fun domVal -> (if dtb__971 then ((fun famName -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) dtb__974) subpats) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (famName, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), (v_Vuna_dCompiler_dElab_dbaBinders acc))), (v_Vuna_dCompiler_dElab_dbaPending acc))))) (((v_Vuna_dCompiler_dElab_dctxBindValue famName) domVal) ctx))) ((bi_concat dtb__970) "#fam")) else (match subpats with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: case branch has too few arguments for its constructor"))
  | C_Base_dList_dList_Cons (dtb__975, dtb__976) -> (match dtb__975 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__977, dtb__978) -> ((((((v_Vuna_dCompiler_dElab_dbindCtorBinder ctx) domVal) dtb__974) dtb__977) dtb__976) acc)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__979) -> ((((((v_Vuna_dCompiler_dElab_dbindCtorBinder ctx) domVal) dtb__974) "_") dtb__976) acc)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__980, dtb__981, dtb__982) -> ((fun fresh -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) dtb__974) dtb__976) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fresh, ((v_Vuna_dCompiler_dElab_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dbaBinders acc))), ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dbaPending acc)) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (dtb__975, fresh)), C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dctxBindValue fresh) domVal) ctx))) (v_Vuna_dCompiler_dElab_dfreshPatName (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dbaPending acc))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__983, dtb__984) -> ((((((v_Vuna_dCompiler_dElab_dmkPendingBinder ctx) domVal) dtb__974) dtb__975) dtb__976) acc)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__985, dtb__986) -> ((((((v_Vuna_dCompiler_dElab_dmkPendingBinder ctx) domVal) dtb__974) dtb__975) dtb__976) acc)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__975)) "DT: nested patterns must be constructor patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__973))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (ctx, (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dbaBinders acc)), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dbaPending acc), subpats))))))))
)))))
and v_Vuna_dCompiler_dElab_dmkPendingBinder = (fun ctx -> (fun domVal -> (fun cod -> (fun p -> (fun rest -> (fun acc -> ((fun fresh -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) cod) rest) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (fresh, ((v_Vuna_dCompiler_dElab_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dbaBinders acc))), ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dbaPending acc)) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dPending_Vuna_dCompiler_dElab_dPending (p, fresh)), C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dctxBindValue fresh) domVal) ctx))) (v_Vuna_dCompiler_dElab_dfreshPatName (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dbaPending acc))))))))))
and v_Vuna_dCompiler_dElab_dbindCtorBinder = (fun ctx -> (fun domVal -> (fun cod -> (fun binderName -> (fun rest -> (fun acc -> ((fun ctx2 -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx2) cod) rest) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (binderName, ((v_Vuna_dCompiler_dElab_dbinderRig false) domVal))), (v_Vuna_dCompiler_dElab_dbaBinders acc))), (v_Vuna_dCompiler_dElab_dbaPending acc))))) (((v_Vuna_dCompiler_dElab_dctxBindValue binderName) domVal) ctx))))))))

let v_Vuna_dCompiler_dElab_dbindCtorTele = (fun ctx -> (fun ty -> (fun subpats -> ((((v_Vuna_dCompiler_dElab_dbindCtorGo ctx) ty) subpats) (C_Vuna_dCompiler_dElab_dBindAcc_Vuna_dCompiler_dElab_dBindAcc (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil))))))

let rec v_Vuna_dCompiler_dElab_disTypeLayerValue = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__987) -> true
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__988, dtb__989, dtb__990, dtb__991, dtb__992) -> (if (v_Vuna_dCompiler_dElab_disTypeLayerValue dtb__991) then (v_Vuna_dCompiler_dElab_disTypeLayerValue ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__992) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__988, 0, C_Base_dList_dList_Nil)))))) else false)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dtypeLayerRig = (fun implicit -> (fun dom -> (if implicit then C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 else (if (v_Vuna_dCompiler_dElab_disTypeLayerValue dom) then C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0 else C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))))

let v_Vuna_dCompiler_dElab_disDataHead = (fun datas -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__993) -> (match dtb__993 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__994, dtb__995) -> (match ((v_Vuna_dCompiler_dElab_ddtDataLookup dtb__994) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__996) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_disIndexDomain = (fun ec -> (fun dom -> (if (if (v_Vuna_dCompiler_dCore_disTypeValue dom) then true else (v_Vuna_dCompiler_dElab_disTypeLayerValue dom)) then true else ((v_Vuna_dCompiler_dElab_disDataHead (v_Vuna_dCompiler_dElab_decDatas ec)) ((v_Vuna_dCompiler_dElab_dforceVal ec) dom)))))

let rec v_Vuna_dCompiler_dElab_dinstantiateNullaryCtor = (fun ec -> (fun ctx -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__997, dtb__998, dtb__999, dtb__1000, dtb__1001) -> (if dtb__998 then (if ((v_Vuna_dCompiler_dElab_disIndexDomain ec) dtb__1000) then (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1002, dtb__1003) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dinstantiateNullaryCtor dtb__1003) ctx) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1001) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1002)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1004, dtb__1005) -> (match dtb__1005 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1006, dtb__1007) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1004, (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__1002, dtb__1006)), dtb__1007))))))
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
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1008, dtb__1009, dtb__1010) -> dtb__1008
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1011, dtb__1012) -> dtb__1011
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_disBoolGlobal = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1013, dtb__1014) -> ((bi_eq_str dtb__1014) "Bool")
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_disBoolType = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1015) -> (v_Vuna_dCompiler_dElab_disBoolGlobal (v_Vuna_dCompiler_dElab_dneutralHeadName dtb__1015))
  | _ -> false
))

let v_Vuna_dCompiler_dElab_disSortVal = (fun ec -> (fun v -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) v) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__1016) -> true
  | _ -> false
)))

let rec v_Vuna_dCompiler_dElab_dallImplicitPrefix = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1017, dtb__1018, dtb__1019, dtb__1020, dtb__1021) -> (if dtb__1018 then (v_Vuna_dCompiler_dElab_dallImplicitPrefix dtb__1021) else false)
  | _ -> true
))

let v_Vuna_dCompiler_dElab_dctorRefTerm = (fun datas -> (fun name -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup name) datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1022) -> (if (v_Vuna_dCompiler_dElab_disBoolBaseName (v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1022)) then (v_Vuna_dCompiler_dElab_dboolCtorTerm name) else (if ((bi_eq_generic (v_Vuna_dCompiler_dElab_ddtCtorTelescope dtb__1022)) C_Base_dList_dList_Nil) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (name, C_Base_dList_dList_Nil)) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinferCtorRef = (fun ec -> (fun ctx -> (fun name -> (fun tyTerm -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1023) -> (if (v_Vuna_dCompiler_dElab_disBoolBaseName (v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1023)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dboolCtorTerm name), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ((v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1023), C_Base_dList_dList_Nil)))), ec)))))) else ((fun ctorTy -> (if ((v_Vuna_dCompiler_dElab_dhasNoExplicitPi ec) ctorTy) then (match (((v_Vuna_dCompiler_dElab_dinstantiateNullaryCtor ec) ctx) ctorTy) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1024) -> (match dtb__1024 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1025, dtb__1026) -> (match dtb__1026 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1027, dtb__1028) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dnullaryCtorTerm dtb__1023) dtb__1027), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1025, dtb__1028))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1029) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1029))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (ctorTy, ec)))))))) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) tyTerm)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) tyTerm), ec))))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dfoldAppTerms = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1030, dtb__1031) -> (match dtb__1030 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1032, dtb__1033) -> ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (mc0, dtb__1032, dtb__1033))) dtb__1031)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dmethodProjZip = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__1034, dtb__1035) -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__1036, dtb__1037) -> (match dtb__1034 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1038, dtb__1039) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1038, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (mc1, true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, mc2, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi ("_", true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_ddictTypeName mc0)))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (mc1, 0)), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), C_Base_dList_dList_Nil))), (((v_Vuna_dCompiler_dCore_dshift 0) 1) dtb__1036))))))), ((((((v_Vuna_dCompiler_dElab_dmethodProjZip mc0) mc1) mc2) ((bi_add mc3) 1)) dtb__1035) dtb__1037)))
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
  | C_Base_dList_dList_Cons (dtb__1040, dtb__1041) -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__1042, dtb__1043) -> (match dtb__1040 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1044, dtb__1045) -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1044, ((((v_Vuna_dCompiler_dElab_dprojectionBody mc0) mc3) ((v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dbinderRig) dtb__1042)) mc4))), (((((v_Vuna_dCompiler_dElab_dprojectionDefsGo mc0) dtb__1041) dtb__1043) ((bi_add mc3) 1)) mc4)))
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
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1046, dtb__1047, dtb__1048) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1046, dtb__1047, (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) ((bi_add depth) 1)) dtb__1048)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1049, dtb__1050, dtb__1051, dtb__1052, dtb__1053) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (dtb__1049, dtb__1050, dtb__1051, (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1052), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) ((bi_add depth) 1)) dtb__1053)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp (dtb__1054, dtb__1055, dtb__1056) -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1057) -> (match dtb__1057 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1058, dtb__1059) -> ((((((v_Vuna_dCompiler_dElab_drewriteTaggedSpine defName) dName) appPos) depth) dtb__1058) dtb__1059)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1054), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1055), dtb__1056))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__1060, dtb__1061) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__1060, ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) dtb__1061)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase (dtb__1062, dtb__1063) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1062), ((v_Base_dList_dmap ((((v_Vuna_dCompiler_dElab_dinjectAltGo defName) dName) appPos) depth)) dtb__1063)))
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__1064, dtb__1065, dtb__1066) -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1064), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1065), (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) dtb__1066)))
  | _ -> t
))))))
and v_Vuna_dCompiler_dElab_dinjectAltGo = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun alt -> (match alt with
  | C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__1067, dtb__1068, dtb__1069) -> (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (dtb__1067, dtb__1068, (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) ((bi_add depth) (v_Base_dList_dlength dtb__1068))) dtb__1069)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_drewriteTaggedSpine = (fun defName -> (fun dName -> (fun appPos -> (fun depth -> (fun g -> (fun args -> ((fun args2 -> (if (if (if ((bi_eq_str g) defName) then ((bi_gt_int (v_Base_dList_dlength args2)) appPos) else false) then ((bi_gt_int depth) appPos) else false) then ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dinsertArgAt appPos) (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (dName, ((bi_sub ((bi_sub depth) appPos)) 1))), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))) args2)) else ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (g))) args2))) ((v_Base_dList_dmap (fun p -> (C_Base_dPair_dPair_Base_dPair_dPair ((((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) depth) (v_Base_dPair_dfirstOf p)), (v_Base_dPair_dsecondOf p))))) args))))))))

let v_Vuna_dCompiler_dElab_dinsertDictCalls = (fun defName -> (fun dName -> (fun appPos -> (fun t -> (((((v_Vuna_dCompiler_dElab_dinjectDictGo defName) dName) appPos) 0) t)))))

let rec v_Vuna_dCompiler_dElab_dliftFreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__1070, dtb__1071) -> (match dtb__1070 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1072, dtb__1073) -> ((fun dName -> ((fun argIdx -> ((fun quoteDepth -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun ec2 -> ((((((v_Vuna_dCompiler_dElab_dliftFreeDictGoalsGo mc0) ec2) ty2) body3) ((bi_add mc4) 1)) dtb__1071)) (((v_Vuna_dCompiler_dElab_dsolveLiftedMeta mc1) dName) dtb__1072))) ((((v_Vuna_dCompiler_dElab_dinsertDictCalls mc0) dName) ((bi_add argIdx) 1)) body2))) ((((v_Vuna_dCompiler_dCore_dsubstMetaVar dtb__1072) dName) ((bi_add argIdx) 2)) (((v_Vuna_dCompiler_dCore_dinsertLamBinder dName) argIdx) mc3)))) ((((v_Vuna_dCompiler_dCore_dinsertDictBinder dName) argIdx) dictDom) mc2))) (((v_Vuna_dCompiler_dCore_dsubstSolvedMetasAt quoteDepth) (v_Vuna_dCompiler_dElab_decSols mc1)) ((v_Vuna_dCompiler_dCore_dquote quoteDepth) dtb__1073)))) ((bi_add (v_Vuna_dCompiler_dElab_dleadingImplicitCount mc2)) mc4))) ((bi_add ((v_Vuna_dCompiler_dElab_dmaxInt 0) ((bi_sub (v_Vuna_dCompiler_dElab_dleadingImplicitCount mc2)) 1))) mc4))) ((bi_concat "d") (bi_strFromInt dtb__1072)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, (C_Base_dPair_dPair_Base_dPair_dPair (mc3, mc1))))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1074, dtb__1075) -> (match dtb__1074 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1076, dtb__1077) -> (match dtb__1076 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__1078, dtb__1079, dtb__1080, dtb__1081, dtb__1082) -> (match (v_Vuna_dCompiler_dElab_dinstanceHeadName dtb__1080) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1082) "DT: instance head must be an interface application (e.g. Show Int)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1083) -> (match ((v_Vuna_dCompiler_dElab_dfindClass dtb__1083) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1082) ((bi_concat "DT: unknown interface ") ((bi_concat dtb__1083) " in instance head")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1084) -> ((fun iname -> ((fun ty -> ((fun named -> (match (((((v_Vuna_dCompiler_dElab_dfindDuplicateInstance mc3) iname) named) ty) mc6) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1085) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1082) ((bi_concat "DT: duplicate instance ") iname))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo dtb__1075) mc1) mc2) mc3) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (iname, ty, named)), mc5))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (iname, ty, named)), mc6)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dinstanceIsNamed dtb__1078))) ((v_Vuna_dCompiler_dElab_dctorResultType dtb__1084) (v_Vuna_dCompiler_dElab_dinstanceHeadTerm dtb__1080)))) (((v_Vuna_dCompiler_dElab_dinstanceName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1084)) dtb__1078) dtb__1080))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo dtb__1075) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dfoldlAddInst mc3) (v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dcheckInstanceHeads = (fun decls -> (fun classes -> (fun globals -> (fun ec -> (((((((v_Vuna_dCompiler_dElab_dcheckInstanceHeadsGo decls) classes) globals) ec) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dElab_dinstantiateAllImplicit = (fun ctx -> (fun ec -> (fun head -> (fun ty -> (fun acc -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) ty) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1086, dtb__1087, dtb__1088, dtb__1089, dtb__1090) -> (if dtb__1087 then ((fun m -> (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1091, dtb__1092) -> (((((v_Vuna_dCompiler_dElab_dinstantiateAllImplicit ctx) dtb__1092) head) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1090) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (m, C_Base_dList_dList_Nil)))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1091, ((v_Vuna_dCompiler_dElab_dbinderRig true) dtb__1089))), acc)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decNext ec)) else (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec)))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec))))
))))))

let v_Vuna_dCompiler_dElab_dctorAppTerm = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1093) -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1093) mc0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1094) -> (if (v_Vuna_dCompiler_dElab_disBoolBaseName (v_Vuna_dCompiler_dElab_ddtCtorFamily dtb__1094)) then (v_Vuna_dCompiler_dElab_dboolCtorTerm dtb__1093) else (if ((bi_ge_int (v_Base_dList_dlength mc2)) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtCtorTelescope dtb__1094))) then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dtb__1093, mc2)) else ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1093))) mc2)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1093))) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dfoldAppTerms mc1) mc2)
))))

let v_Vuna_dCompiler_dElab_disDictFamily = (fun ec -> (fun g -> ((v_Base_dList_dmemName g) ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName c)))) (v_Vuna_dCompiler_dElab_decClasses ec)))))

let v_Vuna_dCompiler_dElab_disDictValue = (fun ec -> (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1095) -> (match dtb__1095 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1096, dtb__1097) -> ((v_Vuna_dCompiler_dElab_disDictFamily ec) dtb__1096)
  | _ -> false
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_disDictDomain = (fun ec -> (fun dom -> ((v_Vuna_dCompiler_dElab_disDictValue ec) ((v_Vuna_dCompiler_dElab_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dsubstDictTerm = (fun ec -> (fun t -> ((v_Vuna_dCompiler_dCore_dsubstSolvedMetas (v_Vuna_dCompiler_dElab_decSols ec)) t)))

let v_Vuna_dCompiler_dElab_drezonkDefs = (fun ec -> (fun defs -> ((v_Base_dList_dmap (fun d -> (C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef ((v_Vuna_dCompiler_dElab_ddtDefName d), (v_Vuna_dCompiler_dElab_ddtDefType d), ((v_Vuna_dCompiler_dElab_dsubstDictTerm ec) (v_Vuna_dCompiler_dElab_ddtDefBody d)))))) defs)))

let v_Vuna_dCompiler_dElab_dinstanceDefsOf = (fun ecBefore -> (fun ecAfter -> (fun gs -> ((v_Base_dList_dmap (fun g -> (C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef ((v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_ddefTypeOrDefault gs) (v_Base_dPair_dfirstOf g)), ((v_Vuna_dCompiler_dElab_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_ddefBodyOf (v_Vuna_dCompiler_dElab_decDefs ecAfter)) (v_Base_dPair_dfirstOf g))))))) gs))))

let rec v_Vuna_dCompiler_dElab_dfilterInstances = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__1098, dtb__1099) -> ((fun hd -> (match (((((v_Vuna_dCompiler_dCore_dconv (v_Vuna_dCompiler_dElab_decDefs mc0)) mc3) 0) mc1) hd) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1100) -> ((((v_Vuna_dCompiler_dElab_dfilterInstances mc0) mc1) dtb__1099) mc3)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1101) -> (match ((((v_Vuna_dCompiler_dElab_dfilterInstances mc0) mc1) dtb__1099) mc3) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1102, dtb__1103) -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__1098, dtb__1102)), dtb__1101))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dforceVal mc0) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtInstHead dtb__1098))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc3))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1104, dtb__1105) -> ((bi_concat ", ") ((bi_concat (v_Vuna_dCompiler_dElab_ddtInstName dtb__1104)) (v_Vuna_dCompiler_dElab_djoinRestInstNames dtb__1105)))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_djoinInstNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1106, dtb__1107) -> ((bi_concat (v_Vuna_dCompiler_dElab_ddtInstName dtb__1106)) (v_Vuna_dCompiler_dElab_djoinRestInstNames dtb__1107))
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dsearchInstance = (fun ec -> (fun dom -> (fun sp -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1108, dtb__1109) -> (match dtb__1108 with
  | C_Base_dList_dList_Cons (dtb__1110, dtb__1111) -> (match dtb__1111 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_ddtInstName dtb__1110))), ((v_Vuna_dCompiler_dElab_decPutSols ec) dtb__1109)))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: ambiguous instance for ") ((bi_concat (v_Vuna_dCompiler_dCore_dshowValue dom)) ((bi_concat " (candidates: ") ((bi_concat (v_Vuna_dCompiler_dElab_djoinInstNames dtb__1108)) ")")))))
)
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: no instance found for ") (v_Vuna_dCompiler_dCore_dshowValue dom)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dfilterInstances ec) dom) ((v_Base_dList_dfilter (fun i -> (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_ddtInstNamed i)))) (v_Vuna_dCompiler_dElab_decInsts ec))) (v_Vuna_dCompiler_dElab_decSols ec))))))

let v_Vuna_dCompiler_dElab_dmethodNameOf = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1112, dtb__1113) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1112))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dinstNamedLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1114, dtb__1115) -> (if (if (v_Vuna_dCompiler_dElab_ddtInstNamed dtb__1114) then ((bi_eq_str (v_Vuna_dCompiler_dElab_ddtInstName dtb__1114)) mc0) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1114)) else ((v_Vuna_dCompiler_dElab_dinstNamedLookup mc0) dtb__1115))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinstDictName = (fun inst -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp (v_Vuna_dCompiler_dElab_ddtInstHead inst)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1116) -> (match dtb__1116 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1117, dtb__1118) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1117))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dinstHeadArg = (fun inst -> (match (v_Vuna_dCompiler_dElab_dflattenTaggedApp (v_Vuna_dCompiler_dElab_ddtInstHead inst)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1119) -> (match dtb__1119 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1120, dtb__1121) -> (match dtb__1121 with
  | C_Base_dList_dList_Cons (dtb__1122, dtb__1123) -> (v_Base_dPair_dfirstOf dtb__1122)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dfindClassByDict = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1124, dtb__1125) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_ddictTypeName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1124))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1124)) else ((v_Vuna_dCompiler_dElab_dfindClassByDict mc0) dtb__1125))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dinstClassOfDict = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1126) -> ((v_Vuna_dCompiler_dElab_dfindClassByDict dtb__1126) mc1)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dclassFieldTyAt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1127, dtb__1128) -> (if ((bi_le_int mc0) 0) then dtb__1127 else ((v_Vuna_dCompiler_dElab_dclassFieldTyAt ((bi_sub mc0) 1)) dtb__1128))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_ddictFamilyNameOf = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dom) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1129) -> (match dtb__1129 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1130, dtb__1131) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1130))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dElab_ddictArgKind = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictFamilyNameOf ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1132) -> (match ((v_Vuna_dCompiler_dElab_ddtDataLookup dtb__1132) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1133) -> (match (v_Vuna_dCompiler_dElab_ddtDataCtors dtb__1133) with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__1134, dtb__1135) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1134))) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1136, dtb__1137, dtb__1138, dtb__1139, dtb__1140) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1139))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dneutralHeadOrSelf = (fun v -> (match v with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1141) -> (match dtb__1141 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1142, dtb__1143) -> (match dtb__1143 with
  | C_Base_dList_dList_Cons (dtb__1144, dtb__1145) -> (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1142, C_Base_dList_dList_Nil))))
  | _ -> v
)
  | _ -> v
)
  | _ -> v
))

let v_Vuna_dCompiler_dElab_dargHeadMatchesKind = (fun globals -> (fun ec -> (fun ctx -> (fun forced -> (fun argKind -> (match (v_Vuna_dCompiler_dElab_dneutralHeadOrSelf forced) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1146) -> (match dtb__1146 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1147, dtb__1148) -> (match dtb__1148 with
  | C_Base_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1147) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1149) -> (match ((((v_Vuna_dCompiler_dElab_dconvEc ec) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) argKind) ((v_Vuna_dCompiler_dElab_dforceVal ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1149))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1150) -> true
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1151) -> false
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
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1152) -> (match dtb__1152 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1153, dtb__1154) -> (match dtb__1154 with
  | C_Base_dList_dList_Cons (dtb__1155, dtb__1156) -> (match dtb__1156 with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1155))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)))

let v_Vuna_dCompiler_dElab_dclassArgIndex = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1157) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dtb__1157) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1158) -> (match dtb__1158 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1159, dtb__1160, dtb__1161) -> dtb__1160
  | _ -> 0
)
  | _ -> 0
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> 0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dresolveDictGoals = (fun globals -> (fun ec -> (match (v_Vuna_dCompiler_dElab_decDictGoals ec) with
  | C_Base_dList_dList_Nil -> ec
  | C_Base_dList_dList_Cons (dtb__1162, dtb__1163) -> (match dtb__1162 with
  | C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (dtb__1164, dtb__1165) -> ((fun ec1 -> ((fun forced -> ((fun keep -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec1) forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1166) -> (if ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_decSols ec1)) dtb__1166) then keep else (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec1) forced) (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1167) -> (match dtb__1167 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1168, dtb__1169) -> (match ((((((v_Vuna_dCompiler_dCore_dsolveMeta (v_Vuna_dCompiler_dElab_decDefs dtb__1169)) (v_Vuna_dCompiler_dElab_decSols dtb__1169)) 0) dtb__1164) C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1168)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1170) -> (match (((v_Vuna_dCompiler_dElab_dcheckSolsDelta dtb__1169) (v_Vuna_dCompiler_dElab_decSols dtb__1169)) dtb__1170) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1171) -> keep
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1172) -> ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) ((v_Vuna_dCompiler_dElab_decPutSols dtb__1169) dtb__1170))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1173) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1174) -> keep
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> keep
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_decAddDictGoal ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) ec1)) (C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (dtb__1164, forced))))) ((v_Vuna_dCompiler_dElab_dforceVal ec1) dtb__1165))) ((v_Vuna_dCompiler_dElab_decPutDictGoals ec) dtb__1163))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dresolveDictGoalsFix = (fun globals -> (fun ec -> (fun n -> ((fun ec2 -> (if ((bi_le_int n) 0) then ec2 else (if ((bi_lt_int (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_decDictGoals ec2))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_decDictGoals ec))) then (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix globals) ec2) ((bi_sub n) 1)) else ec2))) ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) ec)))))

let v_Vuna_dCompiler_dElab_disRigidDictArg = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1175) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dtb__1175) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1176) -> (match dtb__1176 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNVar (dtb__1177, dtb__1178, dtb__1179) -> true
  | _ -> false
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfreeDictGoalsGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1180, dtb__1181) -> (match dtb__1180 with
  | C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (dtb__1182, dtb__1183) -> (if ((v_Vuna_dCompiler_dElab_disRigidDictArg mc0) dtb__1183) then (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__1182) (v_Vuna_dCompiler_dElab_decSols mc0)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1184) -> ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo mc0) dtb__1181)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1182, dtb__1183)), ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo mc0) dtb__1181)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo mc0) dtb__1181))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dfreeDictGoals = (fun ec -> ((v_Vuna_dCompiler_dElab_dfreeDictGoalsGo ec) (v_Vuna_dCompiler_dElab_decDictGoals ec)))

let v_Vuna_dCompiler_dElab_dliftFreeDictGoals = (fun defName -> (fun ec -> (fun ty -> (fun body -> ((((((v_Vuna_dCompiler_dElab_dliftFreeDictGoalsGo defName) ec) ty) body) 0) (v_Vuna_dCompiler_dElab_dfreeDictGoals ec))))))

let v_Vuna_dCompiler_dElab_dwhereBindingName = (fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1185, dtb__1186) -> dtb__1185
  | _ -> "_"
))

let rec v_Vuna_dCompiler_dElab_dcheckWhereSigs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1187, dtb__1188) -> (match (v_Base_dPair_dsecondOf dtb__1187) with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__1189, dtb__1190, dtb__1191) -> (v_Vuna_dCompiler_dElab_dcheckWhereSigs dtb__1188)
  | _ -> ((fun name -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan (v_Base_dPair_dfirstOf dtb__1187))) ((bi_concat "DT: where binding `") ((bi_concat name) ((bi_concat "` needs a type signature (write `") ((bi_concat name) " : <type>` before the clause)")))))) (v_Vuna_dCompiler_dElab_dwhereBindingName (v_Base_dPair_dfirstOf dtb__1187)))
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dgenericEqApp = (fun name -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> ((fun rt -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (rt)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1))) (if ((bi_eq_str name) "==") then "bi_eq_generic" else "bi_neq_generic"))))))

let v_Vuna_dCompiler_dElab_ddeferEqDict = (fun globals -> (fun ctx -> (fun mname -> (fun tyTerm -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun dictTy -> (fun ec -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1192, dtb__1193) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1192, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_decAddDictGoal dtb__1193) (C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (m, dictTy)))))))))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decNext ec)))))))))))

let v_Vuna_dCompiler_dElab_dcmpOps = fun () -> (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", C_Base_dList_dList_Nil))))))))

let v_Vuna_dCompiler_dElab_disCmpOp = (fun name -> ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dElab_dcmpOps ())))

let v_Vuna_dCompiler_dElab_dcmpMethodName = (fun name -> (if ((bi_eq_str name) "<") then "lt" else (if ((bi_eq_str name) "<=") then "le" else (if ((bi_eq_str name) ">") then "gt" else "ge"))))

let v_Vuna_dCompiler_dElab_dcmpGenericName = (fun name -> (if ((bi_eq_str name) "<") then "bi_lt_generic" else (if ((bi_eq_str name) "<=") then "bi_le_generic" else (if ((bi_eq_str name) ">") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dcmpRuntimeName = (fun name -> (fun tyName -> (if ((bi_eq_str tyName) "Int") then (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int"))))) else (if ((bi_eq_str tyName) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dcmpGenericName name))) else (if ((bi_eq_str tyName) "Bool") then (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dcmpGenericName name))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: `") ((bi_concat name) ((bi_concat "` is not defined for ") ((bi_concat tyName) " (Ord instance required)")))))))))))

let v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta = (fun ec -> (fun dom -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1194) -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) dtb__1194) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__1195, dtb__1196) -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__1195) (v_Vuna_dCompiler_dElab_decSols ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1197) -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dspecializeEqTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dDtPrelude_dbuiltinEqTyName ((v_Vuna_dCompiler_dElab_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1198) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtPrelude_deqRuntimeName name) dtb__1198)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec) dictTy) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1199) -> (match dtb__1199 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1200, dtb__1201) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1200, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__1201))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1202) -> (if ((v_Vuna_dCompiler_dElab_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dgenericEqApp name) tyTerm) aTerm) bTerm), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec)))))))))
  | _ -> failwith "DT: impossible branch"
))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ((v_Vuna_dCompiler_dElab_ddictTypeName "Eq"), (C_Base_dList_dList_Cons (aTy, C_Base_dList_dList_Nil)))))))) ((v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx)) aTy))) (if ((bi_eq_str name) "==") then "eq" else "neq"))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dspecializeCmpTy = (fun globals -> (fun ctx -> (fun name -> (fun aTerm -> (fun bTerm -> (fun sp -> (fun aTy -> (fun ec -> (match (v_Vuna_dCompiler_dDtPrelude_dbuiltinTyName ((v_Vuna_dCompiler_dElab_dforceVal ec) aTy)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1203) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dcmpRuntimeName name) dtb__1203)) (fun rt -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (rt)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), ec))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec) dictTy) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1204) -> (match dtb__1204 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1205, dtb__1206) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (mname)), tyTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1205, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), aTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), bTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__1206))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1207) -> (if ((v_Vuna_dCompiler_dElab_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1207)))
  | _ -> failwith "DT: impossible branch"
))) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ((v_Vuna_dCompiler_dElab_ddictTypeName "Ord"), (C_Base_dList_dList_Cons (aTy, C_Base_dList_dList_Nil)))))))) ((v_Vuna_dCompiler_dCore_dquote (v_Vuna_dCompiler_dElab_dctxDepth ctx)) aTy))) (v_Vuna_dCompiler_dElab_dcmpMethodName name))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dElab_dboolShortCircuit = (fun name -> (fun a -> (fun b -> (if ((bi_eq_str name) "&&") then (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (a, b, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (false)))) else (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (a, (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (true)), b))))))

let v_Vuna_dCompiler_dElab_dhasFamParams = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__1208, dtb__1209, dtb__1210, dtb__1211, dtb__1212) -> ((bi_neq_str dtb__1208) "_")
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dbaseNameOf = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1213, dtb__1214) -> dtb__1214
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1215, dtb__1216) -> (match dtb__1215 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1217, dtb__1218, dtb__1219, dtb__1220) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dbaseNameOf dtb__1217)) mc0) then ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo mc0) dtb__1216) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1217)))
  | _ -> ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo mc0) dtb__1216)
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethodGo ((v_Base_dList_dmap (fun m -> (v_Vuna_dCompiler_dElab_dbaseNameOf (v_Base_dPair_dfirstOf m)))) (v_Vuna_dCompiler_dElab_ddtClassMethods cls))) methods)))

let rec v_Vuna_dCompiler_dElab_dhasMethodClauses = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1221, dtb__1222) -> (match dtb__1221 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1223, dtb__1224, dtb__1225, dtb__1226) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf dtb__1223)) mc0) then true else ((v_Vuna_dCompiler_dElab_dhasMethodClauses mc0) dtb__1222))
  | _ -> ((v_Vuna_dCompiler_dElab_dhasMethodClauses mc0) dtb__1222)
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethodGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1227, dtb__1228) -> (if ((v_Vuna_dCompiler_dElab_dhasMethodClauses (v_Vuna_dCompiler_dElab_dbaseNameOf (v_Base_dPair_dfirstOf dtb__1227))) mc1) then ((v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethodGo dtb__1228) mc1) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Base_dPair_dfirstOf dtb__1227))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethod = (fun cls -> (fun methods -> ((v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethodGo (v_Vuna_dCompiler_dElab_ddtClassMethods cls)) methods)))

let rec v_Vuna_dCompiler_dElab_dmethodClausesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1229, dtb__1230) -> (match dtb__1229 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1231, dtb__1232, dtb__1233, dtb__1234) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf dtb__1231)) (v_Vuna_dCompiler_dElab_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dmethodClausesGo mc0) dtb__1230) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1232, dtb__1233)), mc2))) else (((v_Vuna_dCompiler_dElab_dmethodClausesGo mc0) dtb__1230) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dmethodClausesGo mc0) dtb__1230) mc2)
)
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dmethodClausesNamed = (fun mname -> (fun decls -> (((v_Vuna_dCompiler_dElab_dmethodClausesGo mname) decls) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dmethodNameMatches = (fun a -> (fun b -> (if ((bi_eq_str a) b) then true else ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf a)) (v_Vuna_dCompiler_dElab_dbaseNameOf b)))))

let rec v_Vuna_dCompiler_dElab_dclassMethodIndexGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__1235, dtb__1236) -> (if ((v_Vuna_dCompiler_dElab_dmethodNameMatches mc0) (v_Base_dPair_dfirstOf dtb__1235)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dElab_dclassMethodIndexGo mc0) dtb__1236) ((bi_add mc2) 1)))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dclassMethodIndex = (fun mname -> (fun methods -> (((v_Vuna_dCompiler_dElab_dclassMethodIndexGo mname) methods) 0)))

let v_Vuna_dCompiler_dElab_dinferInstSel = (fun globals -> (fun ctx -> (fun ec -> (fun meth -> (fun iname -> (fun sp -> (match (v_Vuna_dCompiler_dElab_dmethodNameOf meth) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: @instance can only be used with a trait method (write `method @instance`)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1237) -> (match ((v_Vuna_dCompiler_dElab_dinstNamedLookup iname) (v_Vuna_dCompiler_dElab_decInsts ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: unknown named instance ") iname))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1238) -> (match ((v_Vuna_dCompiler_dElab_dinstClassOfDict (v_Vuna_dCompiler_dElab_dinstDictName dtb__1238)) (v_Vuna_dCompiler_dElab_decClasses ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: instance ") ((bi_concat iname) " is not an instance of a trait")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1239) -> (match ((v_Vuna_dCompiler_dElab_dclassMethodIndex dtb__1237) (v_Vuna_dCompiler_dElab_ddtClassMethods dtb__1239)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: `") ((bi_concat dtb__1237) ((bi_concat "` is not a method of trait ") (v_Vuna_dCompiler_dElab_ddtClassName dtb__1239)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1240) -> ((fun nFields -> ((fun fty -> ((fun instTy -> ((fun rigs -> ((fun fieldVar -> ((fun applied -> ((fun alt -> ((fun proj -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (proj, (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) instTy), ec))))))) (((v_Vuna_dCompiler_dElab_dmethodArgLams rigs) 0) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCase ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (iname)), (C_Base_dList_dList_Cons (alt, C_Base_dList_dList_Nil))))))) (C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt ((v_Vuna_dCompiler_dElab_ddictCtorName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1239)), (v_Vuna_dCompiler_dElab_dfieldBinderNames nFields), applied)))) ((v_Vuna_dCompiler_dElab_dfoldAppTerms fieldVar) ((v_Vuna_dCompiler_dElab_dmethodArgTerms rigs) nFields)))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar ((v_Vuna_dCompiler_dElab_dfieldVarName dtb__1240), ((bi_sub ((bi_sub nFields) 1)) dtb__1240))))) ((v_Vuna_dCompiler_dDtKind_dmethodArgRigsOf v_Vuna_dCompiler_dElab_dbinderRig) fty))) (((v_Vuna_dCompiler_dElab_dsubstClassParam (v_Vuna_dCompiler_dElab_dparamNameOf (v_Vuna_dCompiler_dElab_ddtClassParams dtb__1239))) (v_Vuna_dCompiler_dElab_dinstHeadArg dtb__1238)) fty))) ((v_Vuna_dCompiler_dElab_dclassFieldTyAt dtb__1240) (v_Vuna_dCompiler_dElab_ddtClassFieldTys dtb__1239)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_ddtClassMethods dtb__1239)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dctorFamilyTable = (fun ec -> ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDataName d), ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_ddtCtorName) (v_Vuna_dCompiler_dElab_ddtDataCtors d)))))) (v_Vuna_dCompiler_dElab_decDatas ec)))

let rec v_Vuna_dCompiler_dElab_dfindCatchAllBody = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1241, dtb__1242) -> (match dtb__1241 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1243, dtb__1244) -> (match dtb__1243 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__1245, dtb__1246, dtb__1247) -> (v_Vuna_dCompiler_dElab_dfindCatchAllBody dtb__1242)
  | _ -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1244))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dfindBoolFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1248, dtb__1249) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dbaseNameOf (v_Vuna_dCompiler_dElab_ddtDataName dtb__1248))) "Bool") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_ddtDataName dtb__1248))) else (v_Vuna_dCompiler_dElab_dfindBoolFamily dtb__1249))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dshortBoolFamily = (fun ec -> (fun name -> (if ((bi_eq_str name) "Bool") then (v_Vuna_dCompiler_dElab_dfindBoolFamily (v_Vuna_dCompiler_dElab_decDatas ec)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))

let v_Vuna_dCompiler_dElab_dinferVarRef = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dctxLookup name) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1250) -> (match dtb__1250 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1251, dtb__1252) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (name, dtb__1251)), (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dvarTypeValue ctx) dtb__1251) dtb__1252), ec))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1253) -> ((((v_Vuna_dCompiler_dElab_dinferCtorRef ec) ctx) name) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1253))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dshortBoolFamily ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1254) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1254)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType ((v_Vuna_dCompiler_dCore_dlevelZero ()))), ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1255) -> (if (v_Vuna_dCompiler_dElab_dallImplicitPrefix dtb__1255) then ((fun inst -> (C_Base_dResult_dResult_Base_dResult_dOk (inst))) (((((v_Vuna_dCompiler_dElab_dinstantiateAllImplicit ctx) ec) ((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name)) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1255)) C_Base_dList_dList_Nil)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dctorRefTerm (v_Vuna_dCompiler_dElab_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1255), ec)))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: unknown name ") name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabConAlt = (fun fb -> (fun globals -> (fun ctx -> (fun ec -> (fun dd -> (fun idxs -> (fun expected -> (fun cname -> (fun args -> (fun psp -> (fun body -> (match ((v_Vuna_dCompiler_dElab_dfindCtorIn cname) (v_Vuna_dCompiler_dElab_ddtDataCtors dd)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt psp) ((bi_concat "DT: unknown constructor ") ((bi_concat cname) ((bi_concat " in case ") (v_Vuna_dCompiler_dElab_ddtDataName dd)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1256) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1256)) args)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1257, dtb__1258) -> (match dtb__1258 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1259, dtb__1260) -> (match dtb__1260 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1261, dtb__1262) -> (if (v_Vuna_dCompiler_dElab_dnonEmpty dtb__1262) then ((v_Vuna_dCompiler_dElab_derrAt psp) ((bi_concat "DT: branch for constructor ") ((bi_concat cname) " has too many arguments"))) else (match ((((((v_Vuna_dCompiler_dElab_dunifyIdxList ec) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dctxDepth dtb__1257)) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dElab_dctorResultValsIn dtb__1257) dtb__1256)) ((v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_drefineValue C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_ddefaultFuel ()))) idxs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1263) -> ((v_Vuna_dCompiler_dElab_derrAt psp) "DT: this branch is impossible (index constraints are unsatisfiable)")
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1264) -> ((fun refinedExpected -> ((fun branchCtx2 -> ((fun body2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) branchCtx2) ec) body2) refinedExpected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1265, dtb__1266) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt (cname, dtb__1259, dtb__1265)), dtb__1266))))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dfoldPending fb) dtb__1261) body))) ((v_Vuna_dCompiler_dElab_dctxRefine dtb__1257) dtb__1264))) (((v_Vuna_dCompiler_dElab_drefineValue dtb__1264) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) expected))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_delabCaseAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc7 with
  | C_Base_dList_dList_Cons (dtb__1267, dtb__1268) -> (match dtb__1267 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1269, dtb__1270) -> (match dtb__1269 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__1271, dtb__1272, dtb__1273) -> ((v_Base_dResult_dandThen (((((((((((v_Vuna_dCompiler_dElab_delabConAlt (v_Vuna_dCompiler_dElab_dfindCatchAllBody dtb__1268)) mc0) mc1) mc2) mc4) mc5) mc6) dtb__1271) dtb__1272) dtb__1273) dtb__1270)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1274, dtb__1275) -> (((((((((v_Vuna_dCompiler_dElab_delabCaseAlts mc0) mc1) dtb__1275) mc3) mc4) mc5) mc6) dtb__1268) (C_Base_dList_dList_Cons (dtb__1274, mc8)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1276, dtb__1277) -> ((((((((((((v_Vuna_dCompiler_dElab_delabCatchAll mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__1268) mc8) dtb__1270) dtb__1276) dtb__1277)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1278) -> ((((((((((((v_Vuna_dCompiler_dElab_delabCatchAll mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__1268) mc8) dtb__1270) "_") dtb__1278)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1269)) "DT: only constructor patterns are supported in case (M14)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc8), mc2))))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dElab_delabCatchAll = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTy -> (fun dd -> (fun idxs -> (fun expected -> (fun rest -> (fun acc -> (fun body -> (fun pname -> (fun psp -> ((fun ctx2 -> (if (v_Vuna_dCompiler_dElab_dnonEmpty rest) then ((v_Vuna_dCompiler_dElab_derrAt psp) "DT: the catch-all branch must be the last one") else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1279, dtb__1280) -> ((fun binds -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dCore_dCaseAlt_Vuna_dCompiler_dCore_dCaseAlt ("", binds, dtb__1279)), acc))), dtb__1280))))) (if ((bi_eq_str pname) "_") then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (pname, ((v_Vuna_dCompiler_dElab_dbinderRig false) scrutTy))), C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))))) (if ((bi_eq_str pname) "_") then ctx else (((v_Vuna_dCompiler_dElab_dctxBindValue pname) scrutTy) ctx)))))))))))))))
and v_Vuna_dCompiler_dElab_dcheckCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dhasDupNames (v_Vuna_dCompiler_dElab_daltNames alts)) then (((((((v_Vuna_dCompiler_dElab_dcheckCaseDedup globals) ctx) ec) scrut) alts) expected) sp) else (if (if (v_Vuna_dCompiler_dElab_danyNestedPat alts) then (v_Vuna_dCompiler_dElab_dhasVarCatchAll alts) else false) then (((((((v_Vuna_dCompiler_dElab_dcheckCaseDedup globals) ctx) ec) scrut) alts) expected) sp) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) scrut)) (fun ps -> (match ps with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1281, dtb__1282) -> (match dtb__1282 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1283, dtb__1284) -> ((((((((v_Vuna_dCompiler_dElab_dcheckCaseFam globals) ctx) dtb__1284) dtb__1281) dtb__1283) alts) expected) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dcheckCaseDedup = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun expected -> (fun sp -> (if (v_Vuna_dCompiler_dElab_dcatchAllNotLast alts) then ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: the catch-all branch must be the last one") else ((fun name -> ((fun clauses -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dDtMatch_dmultiToCaseExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (name, sp)), scrut)), C_Base_dList_dList_Nil)), bodyExpr, false, sp))) expected)))) ((v_Base_dList_dmap (fun alt -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((v_Base_dPair_dfirstOf alt), C_Base_dList_dList_Nil)), (v_Base_dPair_dsecondOf alt))))) alts))) "nd_scrut")))))))))
and v_Vuna_dCompiler_dElab_dcheckCaseFam = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun alts -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dforceVal ec) scrutTy) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral (dtb__1285) -> (match dtb__1285 with
  | C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (dtb__1286, dtb__1287) -> (if (if (v_Vuna_dCompiler_dElab_disBoolBaseName dtb__1286) then ((bi_eq_generic dtb__1287) C_Base_dList_dList_Nil) else false) then (((((((v_Vuna_dCompiler_dElab_dcheckBoolCase globals) ctx) ec) scrutTerm) alts) expected) sp) else (if ((bi_eq_str dtb__1286) "Int") then ((((((((v_Vuna_dCompiler_dElab_dcheckLitCase globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if ((bi_eq_str dtb__1286) "String") then ((((((((v_Vuna_dCompiler_dElab_dcheckLitCase globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else ((((((((((v_Vuna_dCompiler_dElab_dcheckCaseOf globals) ctx) ec) scrutTerm) scrutTy) dtb__1286) dtb__1287) alts) expected) sp))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case scrutinee is not an inductive family")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case scrutinee is not an inductive family")
)))))))))
and v_Vuna_dCompiler_dElab_dcheckBoolCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun alts -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dboolAlt globals) ctx) ec) alts) "True") expected) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1288, dtb__1289) -> (match dtb__1289 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1290, dtb__1291) -> (match dtb__1290 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1292) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (scrutTerm, dtb__1288, dtb__1292)), dtb__1291))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dboolAlt globals) ctx) ec) alts) "False") expected) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1293, dtb__1294) -> (match dtb__1294 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1295, dtb__1296) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (scrutTerm, dtb__1288, dtb__1293)), dtb__1296))))
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
  | C_Base_dList_dList_Cons (dtb__1297, dtb__1298) -> (match dtb__1297 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1299, dtb__1300) -> (match dtb__1299 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__1301, dtb__1302, dtb__1303) -> (if ((bi_eq_str dtb__1301) mc4) then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1300) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1304, dtb__1305) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1304, (C_Base_dPair_dPair_Base_dPair_dPair (mc7, dtb__1305))))))
  | _ -> failwith "DT: impossible branch"
))) else ((((((((v_Vuna_dCompiler_dElab_dboolAltGo mc0) mc1) mc2) dtb__1298) mc4) mc5) mc6) mc7))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1306, dtb__1307) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1300) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1308, dtb__1309) -> ((((((((v_Vuna_dCompiler_dElab_dboolAltGo mc0) mc1) mc2) dtb__1298) mc4) mc5) mc6) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1308)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1310) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1300) mc5)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1311, dtb__1312) -> ((((((((v_Vuna_dCompiler_dElab_dboolAltGo mc0) mc1) mc2) dtb__1298) mc4) mc5) mc6) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1311)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1299)) "DT: case on Bool only accepts True / False / variable patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1313) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1313, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc2))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dElab_decTrusted mc2) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0)), (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc2)))))) else ((v_Vuna_dCompiler_dElab_derrAt mc6) ((bi_concat "DT: case is not exhaustive: missing ") mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dcheckLitCase = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun alts -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLitAlts globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1314, dtb__1315) -> (match dtb__1315 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1316, dtb__1317) -> (if dtb__1316 then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1314, dtb__1317)))) else ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case on Int / String needs a variable or wildcard branch as fallback (M19)"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dcheckLitAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__1318, dtb__1319) -> (match dtb__1318 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1320, dtb__1321) -> (match dtb__1320 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__1322, dtb__1323) -> ((((((((((v_Vuna_dCompiler_dElab_dlitAltStep mc0) mc1) mc2) mc3) mc4) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__1322))) dtb__1321) dtb__1319) mc6) mc7)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__1324, dtb__1325) -> ((((((((((v_Vuna_dCompiler_dElab_dlitAltStep mc0) mc1) mc2) mc3) mc4) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__1324))) dtb__1321) dtb__1319) mc6) mc7)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1326, dtb__1327) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dcheckLitBoundVar mc0) mc1) mc2) mc3) mc4) dtb__1326) dtb__1321) mc6) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1328, dtb__1329) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1328, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__1329))))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1330) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) dtb__1321) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1331, dtb__1332) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1331, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__1332))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1320)) "DT: case on Int / String only accepts literals / variable patterns (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTBool (false)), (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0)), (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (0)))), (C_Base_dPair_dPair_Base_dPair_dPair (false, mc2))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dlitAltStep = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun litTerm -> (fun body -> (fun rest -> (fun expected -> (fun sp -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1333, dtb__1334) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLitAlts globals) ctx) dtb__1334) scrutTerm) tyName) rest) expected) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1335, dtb__1336) -> (match dtb__1336 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1337, dtb__1338) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal ((v_Vuna_dCompiler_dElab_dlitEqName tyName))), scrutTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), litTerm, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), dtb__1333, dtb__1335)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1337, dtb__1338))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dcheckLitBoundVar = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun tyName -> (fun name -> (fun body -> (fun expected -> (fun sp -> ((fun ctx2 -> ((fun rig -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1339, dtb__1340) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (name, rig, dtb__1339)), scrutTerm, rig)), dtb__1340))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig false) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (tyName, C_Base_dList_dList_Nil))))))) (((v_Vuna_dCompiler_dElab_dctxBindValue name) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal (tyName, C_Base_dList_dList_Nil))))) ctx)))))))))))
and v_Vuna_dCompiler_dElab_dcheckCaseOf = (fun globals -> (fun ctx -> (fun ec -> (fun scrutTerm -> (fun scrutTy -> (fun fam -> (fun idxs -> (fun alts -> (fun expected -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_ddtDataLookup fam) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: case scrutinee is not an inductive family")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1341) -> (if (v_Vuna_dCompiler_dElab_dhasDupNames (v_Vuna_dCompiler_dElab_daltNames alts)) then ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: duplicate constructor in case") else ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_delabCaseAlts globals) ctx) ec) scrutTy) dtb__1341) idxs) expected) alts) C_Base_dList_dList_Nil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1342, dtb__1343) -> (((((((((v_Vuna_dCompiler_dElab_dcheckCaseDone dtb__1343) ctx) dtb__1341) idxs) alts) expected) sp) scrutTerm) dtb__1342)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dinferCaseE = (fun globals -> (fun ctx -> (fun ec -> (fun scrut -> (fun alts -> (fun sp -> ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1344, dtb__1345) -> ((fun metaTy -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckCase globals) ctx) dtb__1345) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1346, dtb__1347) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1346, (C_Base_dPair_dPair_Base_dPair_dPair (metaTy, dtb__1347))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_devalCtx ctx) dtb__1344))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec))))))))
and v_Vuna_dCompiler_dElab_dcheckCondBool = (fun globals -> (fun ctx -> (fun ec -> (fun c -> (fun sp -> (match (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) c) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1348) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1348))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1349) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) c)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1350, dtb__1351) -> (match dtb__1351 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1352, dtb__1353) -> (if (v_Vuna_dCompiler_dElab_disBoolType dtb__1352) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1350, dtb__1353)))) else ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "if condition must be Bool (got ") ((bi_concat ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1352)) ")"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dinferE = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1354, dtb__1355) -> (if ((bi_eq_str dtb__1354) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ()))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType ((v_Vuna_dCompiler_dCore_dlevelSucc (v_Vuna_dCompiler_dCore_dlevelZero ())))), ec)))))) else (if ((bi_eq_str dtb__1354) "_") then ((v_Vuna_dCompiler_dElab_derrAt dtb__1355) "DT: cannot infer the type of a hole; give it an expected type") else (((((v_Vuna_dCompiler_dElab_dinferVarRef globals) ctx) ec) dtb__1354) dtb__1355)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__1356, dtb__1357) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTInt (dtb__1356)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Int", C_Base_dList_dList_Nil)))), ec))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__1358, dtb__1359) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTStr (dtb__1358)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("String", C_Base_dList_dList_Nil)))), ec))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__1360, dtb__1361, dtb__1362, dtb__1363, dtb__1364) -> ((((((((v_Vuna_dCompiler_dElab_dinferPi globals) ctx) ec) dtb__1360) dtb__1361) dtb__1362) dtb__1363) dtb__1364)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__1365, dtb__1366, dtb__1367) -> ((((((v_Vuna_dCompiler_dElab_dinferApp globals) ctx) ec) dtb__1365) dtb__1366) dtb__1367)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__1368, dtb__1369, dtb__1370) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1370) "DT: cannot infer the type of a lambda; add a signature")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__1371, dtb__1372, dtb__1373, dtb__1374) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckCondBool globals) ctx) ec) dtb__1371) dtb__1374)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1375, dtb__1376) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1376) dtb__1372)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1377, dtb__1378) -> (match dtb__1378 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1379, dtb__1380) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1380) dtb__1373)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1381, dtb__1382) -> (match dtb__1382 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1383, dtb__1384) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1384) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1379) dtb__1383)) (fun ec4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTIf (dtb__1375, dtb__1377, dtb__1381)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1379, ec4))))))))
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
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__1385, dtb__1386, dtb__1387, dtb__1388) -> (((((((v_Vuna_dCompiler_dElab_dinferLet globals) ctx) ec) dtb__1385) dtb__1386) dtb__1387) dtb__1388)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__1389, dtb__1390, dtb__1391) -> ((((((v_Vuna_dCompiler_dElab_dinferCaseE globals) ctx) ec) dtb__1389) dtb__1390) dtb__1391)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__1392, dtb__1393, dtb__1394) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1394) "DT: record field access is not supported yet (M15)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__1395, dtb__1396, dtb__1397) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1397) "DT: records are not supported yet (M15)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__1398, dtb__1399, dtb__1400) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1400) "DT: record update is not supported yet (M15)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__1401, dtb__1402, dtb__1403) -> ((((((v_Vuna_dCompiler_dElab_dinferInstSel globals) ctx) ec) dtb__1401) dtb__1402) dtb__1403)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__1404, dtb__1405) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1405) "DT: do blocks are not supported yet (M19)")
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__1406, dtb__1407, dtb__1408) -> ((((((v_Vuna_dCompiler_dElab_dinferAnn globals) ctx) ec) dtb__1406) dtb__1407) dtb__1408)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dinferAnn = (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun ty -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx) ec) ty)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1409, dtb__1410) -> (match dtb__1410 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1411, dtb__1412) -> ((fun tyVal -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) dtb__1412) value) tyVal)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1413, dtb__1414) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1413, (C_Base_dPair_dPair_Base_dPair_dPair (tyVal, dtb__1414))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1409))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dinferPi = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun implicit -> (fun dom -> (fun cod -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx) ec) dom)) (fun pd -> (match pd with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1415, dtb__1416) -> (match dtb__1416 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1417, dtb__1418) -> ((fun lvl -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx2) dtb__1418) cod)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1419, dtb__1420) -> (match dtb__1420 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1421, dtb__1422) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (name, implicit, ((v_Vuna_dCompiler_dElab_dbinderRig implicit) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1415)), dtb__1415, dtb__1419)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (((v_Vuna_dCompiler_dCore_dlevelMax dtb__1417) dtb__1421))), dtb__1422))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dctxBind name) dtb__1415) ctx))) (v_Vuna_dCompiler_dElab_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dinferApp = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1423, dtb__1424) -> (if ((bi_eq_str dtb__1423) "->") then (match args with
  | C_Base_dList_dList_Cons (dtb__1425, dtb__1426) -> (match dtb__1426 with
  | C_Base_dList_dList_Cons (dtb__1427, dtb__1428) -> (match dtb__1428 with
  | C_Base_dList_dList_Nil -> ((((((((v_Vuna_dCompiler_dElab_dinferPi globals) ctx) ec) "_") false) dtb__1425) dtb__1427) sp)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: invalid arrow type")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: invalid arrow type")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: invalid arrow type")
) else (if ((bi_eq_str dtb__1423) "Type") then (match args with
  | C_Base_dList_dList_Cons (dtb__1429, dtb__1430) -> (match dtb__1429 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__1431, dtb__1432) -> (match dtb__1430 with
  | C_Base_dList_dList_Nil -> (if ((bi_lt_int dtb__1431) 0) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1432) "DT: universe level must be non-negative") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelOfInt dtb__1431))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType ((v_Vuna_dCompiler_dCore_dlevelSucc (v_Vuna_dCompiler_dCore_dlevelOfInt dtb__1431)))), ec)))))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1424) "DT: Type needs exactly one non-negative level (or none)")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1424) "DT: Type needs exactly one non-negative level (or none)")
)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1424) "DT: Type needs exactly one non-negative level (or none)")
) else (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1433, dtb__1434) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1433) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1435) -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneral globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1433) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1436) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1436))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1437, dtb__1438) -> (match dtb__1438 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1439, dtb__1440) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1440)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1433))) dtb__1437), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1439, dtb__1440))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1433) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1441) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1433) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1442) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1442))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1441)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1443, dtb__1444) -> (match dtb__1444 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1445, dtb__1446) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1446)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1433))) dtb__1443), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1445, dtb__1446))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1434) ((bi_concat "DT: unknown name ") dtb__1433))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneral globals) ctx) ec) fn) args) sp)
)))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1447, dtb__1448) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1447) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1449) -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneral globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1447) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1450) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1450))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1451, dtb__1452) -> (match dtb__1452 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1453, dtb__1454) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1454)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1447))) dtb__1451), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1453, dtb__1454))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1447) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1455) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1447) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1456) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1456))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1455)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1457, dtb__1458) -> (match dtb__1458 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1459, dtb__1460) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1460)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1447))) dtb__1457), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1459, dtb__1460))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1448) ((bi_concat "DT: unknown name ") dtb__1447))
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
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1461, dtb__1462) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1461) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1463) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1463))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneralGo globals) ctx) ec) fn) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dinferAppGeneralGo globals) ctx) ec) fn) args) sp)
)))))))
and v_Vuna_dCompiler_dElab_dinferAppGeneralGo = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) fn)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1464, dtb__1465) -> (match dtb__1465 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1466, dtb__1467) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) dtb__1467) dtb__1466) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1468, dtb__1469) -> (match dtb__1469 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1470, dtb__1471) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1471)) dtb__1464) dtb__1468), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1470, dtb__1471))))))
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
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1472, dtb__1473, dtb__1474, dtb__1475, dtb__1476) -> (if dtb__1473 then (if ((v_Vuna_dCompiler_dElab_disDictDomain ec) dtb__1475) then (if ((v_Vuna_dCompiler_dElab_ddictArgUnsolvedMeta ec) dtb__1475) then (((((((v_Vuna_dCompiler_dElab_ddeferDictBinder globals) ctx) ec) dtb__1475) dtb__1476) args) sp) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dconstrainDictDom globals) ec) ctx) dtb__1475) args) sp)) (fun ec0 -> (match (((v_Vuna_dCompiler_dElab_dsearchInstance ec0) ((v_Vuna_dCompiler_dElab_dforceVal ec0) dtb__1475)) sp) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1477) -> (match dtb__1477 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1478, dtb__1479) -> ((fun ty2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) dtb__1479) ty2) args) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1480, dtb__1481) -> (match dtb__1481 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1482, dtb__1483) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1478, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), dtb__1480)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1482, dtb__1483))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1476) ((v_Vuna_dCompiler_dElab_devalCtx ctx) dtb__1478)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1484) -> (if ((v_Vuna_dCompiler_dCore_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_decSols ec0)) ((v_Vuna_dCompiler_dElab_dforceVal ec0) dtb__1475)) then (((((((v_Vuna_dCompiler_dElab_ddeferDictBinder globals) ctx) ec0) dtb__1475) dtb__1476) args) sp) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1484)))
  | _ -> failwith "DT: impossible branch"
)))) else (if ((v_Vuna_dCompiler_dElab_disIndexDomain ec) dtb__1475) then (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1485, dtb__1486) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) dtb__1486) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1476) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1485))) args) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1487, dtb__1488) -> (match dtb__1488 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1489, dtb__1490) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1485, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), dtb__1487)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1489, dtb__1490))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: implicit parameters must be types or inductive families (M15)"))) else (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Cons (dtb__1491, dtb__1492) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) dtb__1491) dtb__1475)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1493, dtb__1494) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) dtb__1494) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1476) ((v_Vuna_dCompiler_dElab_devalCtx ctx) dtb__1493))) dtb__1492) sp)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1495, dtb__1496) -> (match dtb__1496 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1497, dtb__1498) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1493, ((v_Vuna_dCompiler_dElab_dtypeLayerRig false) dtb__1475))), dtb__1495)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1497, dtb__1498))))))
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
  | C_Base_dList_dList_Cons (dtb__1499, dtb__1500) -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan dtb__1499)) "DT: too many arguments (not a function)")
  | _ -> failwith "DT: impossible branch"
)
)) ((v_Vuna_dCompiler_dElab_dforceVal ec) ty))))))))
and v_Vuna_dCompiler_dElab_ddeferDictBinder = (fun globals -> (fun ctx -> (fun ec -> (fun dom -> (fun clo -> (fun args -> (fun sp -> ((fun m -> (match ((v_Vuna_dCompiler_dElab_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1501, dtb__1502) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgsGo globals) ctx) ((v_Vuna_dCompiler_dElab_decAddDictGoal dtb__1502) (C_Vuna_dCompiler_dElab_dDtDictGoal_Vuna_dCompiler_dElab_dDtDictGoal (m, ((v_Vuna_dCompiler_dElab_dforceVal dtb__1502) dom))))) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1501))) args) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1503, dtb__1504) -> (match dtb__1504 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1505, dtb__1506) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1501, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), dtb__1503)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1505, dtb__1506))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decNext ec)))))))))
and v_Vuna_dCompiler_dElab_dconstrainDictDom = (fun globals -> (fun ec -> (fun ctx -> (fun dom -> (fun args -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1507) -> (match ((v_Vuna_dCompiler_dElab_ddictArgKind ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1508) -> (match dtb__1507 with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVMeta (dtb__1509, dtb__1510) -> (match dtb__1510 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) ec) ctx) dtb__1507) dtb__1508) args) sp)) (fun ecProbe -> (match ((v_Vuna_dCompiler_dCore_dmetaLookup dtb__1509) (v_Vuna_dCompiler_dElab_decSols ecProbe)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1511) -> (match ((((((v_Vuna_dCompiler_dCore_dsolveMeta (v_Vuna_dCompiler_dElab_decDefs ec)) (v_Vuna_dCompiler_dElab_decSols ec)) 0) dtb__1509) C_Base_dList_dList_Nil) dtb__1511) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1512) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_decPutSols ec) dtb__1512)))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1513) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) ec) ctx) dtb__1507) dtb__1508) args) sp)
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) ec) ctx) dtb__1507) dtb__1508) args) sp)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dconstrainDictDomGoK = (fun globals -> (fun ec -> (fun ctx -> (fun argTy -> (fun argKind -> (fun args -> (fun sp -> (match args with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dList_dList_Cons (dtb__1514, dtb__1515) -> (match ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) dtb__1514) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1516) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1517) -> (match dtb__1517 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1518, dtb__1519) -> (match dtb__1519 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1520, dtb__1521) -> ((fun forced -> (if (v_Vuna_dCompiler_dCore_disTypeValue forced) then (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) dtb__1521) ctx) argTy) argKind) dtb__1515) sp) else (if (((((v_Vuna_dCompiler_dElab_dargHeadMatchesKind globals) dtb__1521) ctx) forced) argKind) then (match ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1521) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) argTy) (v_Vuna_dCompiler_dElab_dneutralHeadOrSelf forced)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1522) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1522))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1523) -> (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) dtb__1521) ctx) argTy) argKind) dtb__1515) sp)
  | _ -> failwith "DT: impossible branch"
) else (((((((v_Vuna_dCompiler_dElab_dconstrainDictDomGoK globals) dtb__1521) ctx) argTy) argKind) dtb__1515) sp)))) ((v_Vuna_dCompiler_dElab_dforceVal dtb__1521) dtb__1520))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dcheckE = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__1524, dtb__1525, dtb__1526) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) ctx) ec) dtb__1525)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1527, dtb__1528) -> (match dtb__1528 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1529, dtb__1530) -> (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) dtb__1530) dtb__1524) ((v_Vuna_dCompiler_dCore_deval (v_Vuna_dCompiler_dElab_dctxEnv ctx)) dtb__1527))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__1531, dtb__1532, dtb__1533, dtb__1534) -> ((((((((v_Vuna_dCompiler_dElab_dcheckLet globals) ctx) ec) dtb__1531) dtb__1532) dtb__1533) expected) dtb__1534)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__1535, dtb__1536, dtb__1537) -> (((((((v_Vuna_dCompiler_dElab_dcheckCase globals) ctx) ec) dtb__1535) dtb__1536) expected) dtb__1537)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__1538, dtb__1539, dtb__1540, dtb__1541) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__1542, dtb__1543, dtb__1544, dtb__1545, dtb__1546) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__1547, dtb__1548, dtb__1549) -> (match dtb__1547 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1550, dtb__1551) -> (if ((bi_eq_str dtb__1550) "->") then (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected) else (if ((bi_eq_str dtb__1550) "Type") then (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected) else (((((((v_Vuna_dCompiler_dElab_dcheckApp globals) ctx) ec) dtb__1547) dtb__1548) expected) dtb__1549)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dcheckApp globals) ctx) ec) dtb__1547) dtb__1548) expected) dtb__1549)
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__1552, dtb__1553, dtb__1554) -> (((((((v_Vuna_dCompiler_dElab_dcheckLam globals) ctx) ec) dtb__1552) dtb__1553) expected) dtb__1554)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__1555, dtb__1556) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__1557, dtb__1558) -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1559, dtb__1560) -> (if ((bi_eq_str dtb__1559) "_") then ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1561, dtb__1562) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1561, dtb__1562))))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dnewHoleMeta ctx) ec) dtb__1560) expected)) else (((((((v_Vuna_dCompiler_dElab_dcheckApp globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1559, dtb__1560))) C_Base_dList_dList_Nil) expected) dtb__1560))
  | _ -> (((((v_Vuna_dCompiler_dElab_dcheckByInfer globals) ctx) ec) expr) expected)
)) expr))))))
and v_Vuna_dCompiler_dElab_dcheckLet = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (if rec_u then ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckWhereSigs binds)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx) ec) binds) body) rec_u) expected) sp))) else ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx) ec) binds) body) rec_u) expected) sp))))))))))
and v_Vuna_dCompiler_dElab_dcheckLetGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1563, dtb__1564) -> (((((((((v_Vuna_dCompiler_dElab_dcheckLetOne mc0) mc1) mc2) dtb__1563) dtb__1564) mc4) mc5) mc6) mc7)
  | C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) mc4) mc6)
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dcheckLetOne = (fun globals -> (fun ctx -> (fun ec -> (fun bind -> (fun rest -> (fun body -> (fun rec_u -> (fun expected -> (fun sp -> (match (v_Base_dPair_dfirstOf bind) with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1565, dtb__1566) -> ((fun value -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1567, dtb__1568) -> (match dtb__1568 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1569, dtb__1570) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx2) dtb__1570) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1571, dtb__1572) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1565, rig, dtb__1571)), dtb__1567, rig)), dtb__1572))))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dctxBindValue dtb__1565) dtb__1569) ctx))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1569))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf bind))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1573) -> ((fun value -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1574, dtb__1575) -> (match dtb__1575 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1576, dtb__1577) -> ((fun rig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dcheckLetGo globals) ctx) dtb__1577) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1578, dtb__1579) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dshift 0) 1) dtb__1578))), dtb__1574, rig)), dtb__1579))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1576))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf bind))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan (v_Base_dPair_dfirstOf bind))) "DT: let bindings must be simple names or wildcards (M19)")
))))))))))
and v_Vuna_dCompiler_dElab_dinferLet = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (if rec_u then ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcheckWhereSigs binds)) (fun _u -> (((((((v_Vuna_dCompiler_dElab_dinferLetGo globals) ctx) ec) binds) body) rec_u) sp))) else (((((((v_Vuna_dCompiler_dElab_dinferLetGo globals) ctx) ec) binds) body) rec_u) sp)))))))))
and v_Vuna_dCompiler_dElab_dinferLetGo = (fun globals -> (fun ctx -> (fun ec -> (fun binds -> (fun body -> (fun rec_u -> (fun sp -> (match binds with
  | C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) body)
  | C_Base_dList_dList_Cons (dtb__1580, dtb__1581) -> (match dtb__1580 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1582, dtb__1583) -> (match dtb__1582 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1584, dtb__1585) -> (((((((((v_Vuna_dCompiler_dElab_dinferLetBound globals) ctx) ec) dtb__1584) dtb__1583) dtb__1581) body) rec_u) sp)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1586) -> ((((((((v_Vuna_dCompiler_dElab_dinferLetIgnored globals) ctx) ec) dtb__1583) dtb__1581) body) rec_u) sp)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1582)) "DT: let bindings must be simple names or wildcards (M19)")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dinferLetBound = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1587, dtb__1588) -> (match dtb__1588 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1589, dtb__1590) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dinferLet globals) ctx2) dtb__1590) rest) body) rec_u) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1591, dtb__1592) -> (match dtb__1592 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1593, dtb__1594) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (name, rig, dtb__1591)), dtb__1587, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1593, dtb__1594))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dctxBindValue name) dtb__1589) ctx))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1589))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dinferLetIgnored = (fun globals -> (fun ctx -> (fun ec -> (fun value -> (fun rest -> (fun body -> (fun rec_u -> (fun sp -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) value)) (fun pv -> (match pv with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1595, dtb__1596) -> (match dtb__1596 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1597, dtb__1598) -> ((fun rig -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dinferLet globals) ctx) dtb__1598) rest) body) rec_u) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1599, dtb__1600) -> (match dtb__1600 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1601, dtb__1602) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTApp ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dshift 0) 1) dtb__1599))), dtb__1595, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1601, dtb__1602))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig false) dtb__1597))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dcheckByInfer = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (fun expected -> (match ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) expr) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1603) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1603))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1604) -> (match dtb__1604 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1605, dtb__1606) -> (match dtb__1606 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1607, dtb__1608) -> (match ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1608) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) dtb__1607) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1609) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dAst_dexprSpan expr))) ((bi_concat ": ") dtb__1609))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1610) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1605, ((v_Vuna_dCompiler_dElab_dresolveDictGoals globals) dtb__1610)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dcheckLam = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1611, dtb__1612) -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1613, dtb__1614, dtb__1615, dtb__1616, dtb__1617) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((fun lamRig -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckLam mc0) ctx2) mc2) dtb__1612) mc4) expected2) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1618, dtb__1619) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (dtb__1611, lamRig, dtb__1618)), dtb__1619))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dbinderRig dtb__1614) dtb__1616))) ((v_Vuna_dCompiler_dCore_dapplyClosure dtb__1617) v))) (((v_Vuna_dCompiler_dElab_dctxBindValue dtb__1611) dtb__1616) mc1))) ((v_Vuna_dCompiler_dElab_dfreshVarValue dtb__1613) lvl))) (v_Vuna_dCompiler_dElab_dctxDepth mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: lambda has more parameters than the expected function type")
)) ((v_Vuna_dCompiler_dElab_dforceVal mc2) mc5))
  | C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dcheckType = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1620, dtb__1621) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1620) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1622) -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1620) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1623) -> (match (v_Vuna_dCompiler_dCore_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dforceVal ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1623))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1624) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dtb__1620)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1624, ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__1625, dtb__1626, dtb__1627) -> (match dtb__1625 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1628, dtb__1629) -> (if (if ((bi_eq_str dtb__1628) "->") then true else ((bi_eq_str dtb__1628) "Type")) then ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr) else (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1628) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1630) -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((((v_Vuna_dCompiler_dElab_dinferAppUnderType globals) ctx) ec) dtb__1628) dtb__1626) dtb__1629) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1631) -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1632) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1632))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dcheckTypeInfer globals) ctx) ec) expr)
)))))
and v_Vuna_dCompiler_dElab_dcheckTypeInfer = (fun globals -> (fun ctx -> (fun ec -> (fun expr -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) expr)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1633, dtb__1634) -> (match dtb__1634 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1635, dtb__1636) -> ((fun forced -> (match (v_Vuna_dCompiler_dCore_dtypeLevelOf forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1637) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1633, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1637, dtb__1636))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan expr)) ((bi_concat "DT: expected a type, but this expression has type ") ((v_Vuna_dCompiler_dCore_dshowValueAt (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1635)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dforceVal dtb__1636) dtb__1635))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dElab_dcheckApp = (fun globals -> (fun ctx -> (fun ec -> (fun fn -> (fun args -> (fun expected -> (fun sp -> (match fn with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1638, dtb__1639) -> (match ((v_Vuna_dCompiler_dElab_dctxLookup dtb__1638) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1640) -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_disSortVal ec) expected) then (((((((v_Vuna_dCompiler_dElab_dcheckAppUnderType globals) ctx) ec) dtb__1638) args) expected) dtb__1639) else (match ((v_Vuna_dCompiler_dElab_ddtCtorLookup dtb__1638) (v_Vuna_dCompiler_dElab_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1641) -> (((((((v_Vuna_dCompiler_dElab_dcheckAppCtor globals) ctx) ec) dtb__1638) args) expected) dtb__1639)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) fn) args) expected) sp)
))))))))
and v_Vuna_dCompiler_dElab_dcheckAppUnderType = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun expected -> (fun sp -> (match ((((((v_Vuna_dCompiler_dElab_dinferAppUnderType globals) ctx) ec) name) args) sp) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1642) -> (((((((v_Vuna_dCompiler_dElab_dcheckAppGeneral globals) ctx) ec) (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (name, sp))) args) expected) sp)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1643) -> (match dtb__1643 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1644, dtb__1645) -> (match dtb__1645 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1646, dtb__1647) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1647) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVType (dtb__1646)))) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1644, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dinferAppUnderType = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: unknown name ") name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1648) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1648)) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1649, dtb__1650) -> (match dtb__1650 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1651, dtb__1652) -> (match (v_Vuna_dCompiler_dCore_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dforceVal dtb__1652) dtb__1651)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1653) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))) dtb__1649), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1653, dtb__1652))))))
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
  | C_Base_dList_dList_Cons (dtb__1654, dtb__1655) -> (match dtb__1655 with
  | C_Base_dList_dList_Cons (dtb__1656, dtb__1657) -> (match dtb__1657 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) dtb__1654)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1658, dtb__1659) -> (match dtb__1659 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1660, dtb__1661) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1661) dtb__1656)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1662, dtb__1663) -> (match dtb__1663 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1664, dtb__1665) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1665) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1660) dtb__1664)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dspecializeEqTy globals) ctx) name) dtb__1658) dtb__1662) sp) dtb__1660) ec3)))
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
  | C_Base_dList_dList_Cons (dtb__1666, dtb__1667) -> (match dtb__1667 with
  | C_Base_dList_dList_Cons (dtb__1668, dtb__1669) -> (match dtb__1669 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) ec) dtb__1666)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1670, dtb__1671) -> (match dtb__1671 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1672, dtb__1673) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE globals) ctx) dtb__1673) dtb__1668)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1674, dtb__1675) -> (match dtb__1675 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1676, dtb__1677) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1677) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) dtb__1672) dtb__1676)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dspecializeCmpTy globals) ctx) name) dtb__1670) dtb__1674) sp) dtb__1672) ec3)))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1678) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1678))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeCmpApp globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1679) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1679))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dspecializeBoolApp globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dElab_dspecializeBoolApp = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun args -> (fun sp -> (if (if ((bi_eq_str name) "&&") then true else ((bi_eq_str name) "||")) then (match args with
  | C_Base_dList_dList_Cons (dtb__1680, dtb__1681) -> (match dtb__1681 with
  | C_Base_dList_dList_Cons (dtb__1682, dtb__1683) -> (match dtb__1683 with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) dtb__1680) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))))) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1684, dtb__1685) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) dtb__1685) dtb__1682) (C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))))) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1686, dtb__1687) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dboolShortCircuit name) dtb__1684) dtb__1686), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVNeutral ((C_Vuna_dCompiler_dCore_dNeutral_Vuna_dCompiler_dCore_dNGlobal ("Bool", C_Base_dList_dList_Nil)))), dtb__1687))))))))
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
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__1688, dtb__1689) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dspecializeOpApp globals) ctx) ec) dtb__1688) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1690) -> (match dtb__1690 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1691, dtb__1692) -> (match dtb__1692 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1693, dtb__1694) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1694) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) dtb__1693)) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1691, ec2))))))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1695) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dinferArgs globals) ctx) ec) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_ddtCtorType dtb__1695))) args) sp)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1696, dtb__1697) -> (match dtb__1697 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1698, dtb__1699) -> (match ((((v_Vuna_dCompiler_dElab_dconvEc dtb__1699) (v_Vuna_dCompiler_dElab_dctxDepth ctx)) expected) dtb__1698) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1700) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dctorAppTerm (v_Vuna_dCompiler_dElab_decDatas dtb__1700)) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (name))) dtb__1696), dtb__1700))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1701) -> ((v_Vuna_dCompiler_dElab_derrAt sp) ((bi_concat "DT: constructor ") ((bi_concat name) ((bi_concat ": ") dtb__1701))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_delabCtor = (fun globals -> (fun fam -> (fun arity -> (fun ec -> (fun c -> (match c with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__1702, dtb__1703, dtb__1704, dtb__1705) -> ((fun famKind -> ((fun tyExpr2 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec) tyExpr2)) (fun pk -> (match pk with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1706, dtb__1707) -> (match dtb__1707 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1708, dtb__1709) -> (match (v_Vuna_dCompiler_dElab_dresultSpine (v_Vuna_dCompiler_dElab_ddropParams dtb__1706)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1710, dtb__1711) -> (if ((bi_neq_str dtb__1710) fam) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1705) ((bi_concat "DT: constructor ") ((bi_concat dtb__1702) ((bi_concat " does not return ") fam)))) else (if ((bi_neq_int (v_Base_dList_dlength dtb__1711)) arity) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1705) ((bi_concat "DT: constructor ") ((bi_concat dtb__1702) ((bi_concat " has the wrong number of indices for ") fam)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (dtb__1702, fam, (v_Vuna_dCompiler_dElab_dteleOfType dtb__1706), dtb__1706)), dtb__1709))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (if (v_Vuna_dCompiler_dElab_dhasFamParams dtb__1703) then dtb__1703 else (((v_Vuna_dCompiler_dElab_dprependFamParams famKind) dtb__1703) dtb__1705)))) (match ((v_Vuna_dCompiler_dElab_dglobalLookup fam) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1712) -> dtb__1712
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTType ((v_Vuna_dCompiler_dCore_dlevelZero ())))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabCtors = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__1713, dtb__1714) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabCtor mc0) mc1) mc2) mc3) dtb__1713)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1715, dtb__1716) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabCtors mc0) mc1) mc2) dtb__1716) dtb__1714)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1717, dtb__1718) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__1715, dtb__1717)), dtb__1718))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc3))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_delabDataHead = (fun globals -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1719, dtb__1720) -> (match dtb__1719 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__1721, dtb__1722, dtb__1723, dtb__1724, dtb__1725, dtb__1726) -> (if ((v_Base_dList_dmemName dtb__1721) (v_Vuna_dCompiler_dDtPrelude_dpreludeNames ())) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1726) ((bi_concat "DT: cannot redefine builtin ") dtb__1721)) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType globals) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec) dtb__1723)) (fun pk -> (match pk with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1727, dtb__1728) -> (match dtb__1728 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1729, dtb__1730) -> ((fun fullKind -> ((fun tele -> ((fun arity -> (if (v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dkindWellFormed fullKind)) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1726) "DT: the kind of a data declaration must be a chain of arrows ending in Type") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dDataHead_Vuna_dCompiler_dElab_dDataHead (dtb__1721, fullKind, arity)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1721, fullKind)), C_Base_dList_dList_Nil)), dtb__1730)))))))) (v_Base_dList_dlength tele))) (v_Vuna_dCompiler_dElab_dsplitKind fullKind))) ((v_Vuna_dCompiler_dDtPrelude_dprependParams dtb__1722) dtb__1727))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1720) "DT: internal: expected a data declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_delabDataHeadsRound = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (fun failed -> (match pending with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (heads, (C_Base_dPair_dPair_Base_dPair_dPair (globals, (C_Base_dPair_dPair_Base_dPair_dPair (ec, (v_Base_dList_dreverse failed)))))))
  | C_Base_dList_dList_Cons (dtb__1731, dtb__1732) -> (match (((v_Vuna_dCompiler_dElab_delabDataHead globals) ec) dtb__1731) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1733) -> (((((v_Vuna_dCompiler_dElab_delabDataHeadsRound dtb__1732) globals) ec) heads) (C_Base_dList_dList_Cons (dtb__1731, failed)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1734) -> (match dtb__1734 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1735, dtb__1736) -> (match dtb__1736 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1737, dtb__1738) -> (((((v_Vuna_dCompiler_dElab_delabDataHeadsRound dtb__1732) ((v_Base_dList_dappend globals) dtb__1737)) dtb__1738) (C_Base_dList_dList_Cons (dtb__1735, heads))) failed)
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
  | C_Base_dList_dList_Cons (dtb__1739, dtb__1740) -> (match (((v_Vuna_dCompiler_dElab_delabDataHead globals) ec) dtb__1739) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__1741) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__1741))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1742) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: data head registration made no progress"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_delabDataHeads = (fun pending -> (fun globals -> (fun ec -> (fun heads -> (match pending with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse heads), (C_Base_dPair_dPair_Base_dPair_dPair (globals, ec))))))
  | _ -> (match (((((v_Vuna_dCompiler_dElab_delabDataHeadsRound pending) globals) ec) heads) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1743, dtb__1744) -> (match dtb__1744 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1745, dtb__1746) -> (match dtb__1746 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1747, dtb__1748) -> (match dtb__1748 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__1743), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1745, dtb__1747))))))
  | _ -> (if ((bi_eq_int (v_Base_dList_dlength dtb__1748)) (v_Base_dList_dlength pending)) then (((v_Vuna_dCompiler_dElab_delabDataHeadsNoProgress globals) ec) dtb__1748) else ((((v_Vuna_dCompiler_dElab_delabDataHeads dtb__1748) dtb__1745) dtb__1747) dtb__1743))
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
  | C_Base_dList_dList_Cons (dtb__1749, dtb__1750) -> (match dtb__1749 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1751, dtb__1752) -> (match dtb__1751 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__1753, dtb__1754, dtb__1755, dtb__1756, dtb__1757, dtb__1758) -> (match ((v_Vuna_dCompiler_dElab_dlookupDataHead dtb__1753) heads) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1758) ((bi_concat "DT: internal: missing data head for ") dtb__1753))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1759) -> (match dtb__1759 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1760, dtb__1761) -> ((fun tele -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabCtors globals) dtb__1753) dtb__1761) ec) dtb__1756)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1762, dtb__1763) -> ((fun dd -> (((((v_Vuna_dCompiler_dElab_delabDataBodies dtb__1750) heads) ((v_Base_dList_dappend globals) (v_Vuna_dCompiler_dElab_dctorGlobals dtb__1762))) ((v_Vuna_dCompiler_dElab_decAddData dtb__1763) dd)) (C_Base_dList_dList_Cons (dd, acc)))) (C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData (dtb__1753, tele, dtb__1762)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dsplitKind dtb__1760))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_delabDataBodies dtb__1750) heads) globals) ec) acc)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_delabDatas = (fun decls -> (fun globals -> (fun ec -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_delabDataHeads decls) globals) ec) C_Base_dList_dList_Nil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1764, dtb__1765) -> (match dtb__1765 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1766, dtb__1767) -> (((((v_Vuna_dCompiler_dElab_delabDataBodies decls) dtb__1764) dtb__1766) dtb__1767) C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dclassFieldTysGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1768, dtb__1769) -> (match dtb__1768 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1770, dtb__1771) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType mc0) mc1) mc2) (((v_Vuna_dCompiler_dDtQuant_dquantifyTraitSig (fun nm -> (v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dctxLookup nm) mc1)))) dtb__1771) (v_Vuna_dCompiler_dAst_dexprSpan dtb__1771)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1772, dtb__1773) -> (match dtb__1773 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1774, dtb__1775) -> (((((v_Vuna_dCompiler_dElab_dclassFieldTysGo mc0) mc1) dtb__1775) dtb__1769) (C_Base_dList_dList_Cons (dtb__1772, mc4)))
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
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1776, dtb__1777) -> (match dtb__1776 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__1778, dtb__1779, dtb__1780, dtb__1781) -> (if ((bi_neq_int (v_Base_dList_dlength dtb__1779)) 1) then ((v_Vuna_dCompiler_dElab_derrAt dtb__1781) "DT: interfaces must have exactly one parameter (M15 limitation)") else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dclassFieldTys globals) ec) dtb__1779) dtb__1780)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1782, dtb__1783) -> ((fun pname -> ((fun pKind -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dd, (C_Base_dPair_dPair_Base_dPair_dPair (projs, (C_Base_dPair_dPair_Base_dPair_dPair (cls, ec3))))))))) ((v_Vuna_dCompiler_dElab_dfoldlAddDef ec2) projBodies))) ((v_Vuna_dCompiler_dElab_decAddClass ((v_Vuna_dCompiler_dElab_decAddData dtb__1783) dd)) cls))) (C_Vuna_dCompiler_dElab_dDtClass_Vuna_dCompiler_dElab_dDtClass (dtb__1778, dtb__1779, projs, dtb__1782)))) (((((v_Vuna_dCompiler_dElab_dprojectionDefs dtb__1778) pname) dtb__1780) dtb__1782) (v_Base_dList_dlength dtb__1780)))) (((((v_Vuna_dCompiler_dElab_dmethodProjections dtb__1778) pname) pKind) dtb__1780) dtb__1782))) (C_Vuna_dCompiler_dElab_dDtData_Vuna_dCompiler_dElab_dDtData (dname, tele, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtCtor_Vuna_dCompiler_dElab_dDtCtor (cname, dname, tele, ctorTy)), C_Base_dList_dList_Nil)))))) (v_Vuna_dCompiler_dElab_dteleOfType ctorTy))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTPi (pname, true, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, pKind, ((v_Vuna_dCompiler_dElab_dfoldPiFieldTys dtb__1782) dapp))))) ((v_Vuna_dCompiler_dElab_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTGlobal (dname))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTVar (pname, 0)), C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0)), C_Base_dList_dList_Nil))))) (v_Vuna_dCompiler_dElab_ddictCtorName dtb__1778))) (v_Vuna_dCompiler_dElab_ddictTypeName dtb__1778))) ((v_Vuna_dCompiler_dDtKind_dclassParamKind pname) dtb__1780))) (v_Vuna_dCompiler_dElab_dparamNameOf dtb__1779))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1777) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_delabSigs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1784, dtb__1785) -> (match dtb__1784 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1786, dtb__1787) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckType mc1) (v_Vuna_dCompiler_dElab_demptyCtx ())) mc2) dtb__1787)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1788, dtb__1789) -> (match dtb__1789 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1790, dtb__1791) -> (((v_Vuna_dCompiler_dElab_delabSigs dtb__1785) ((v_Base_dList_dappend mc1) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1786, dtb__1788)), C_Base_dList_dList_Nil)))) dtb__1791)
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
  | C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (dtb__1792, dtb__1793, dtb__1794, dtb__1795, dtb__1796, dtb__1797, dtb__1798, dtb__1799) -> ((fun ec0 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dinferE dtb__1796) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec0) expr)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1800, dtb__1801) -> (match dtb__1801 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1802, dtb__1803) -> ((fun ec2 -> ((fun sols2 -> (match (((v_Vuna_dCompiler_dElab_dunsolvedFrom dtb__1799) (v_Vuna_dCompiler_dElab_decNext ec2)) sols2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1804) -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dexprSpan expr)) ((bi_concat "DT: cannot infer a type for this expression (unsolved metavariable ?") ((bi_concat (bi_strFromInt dtb__1804)) "); add a type annotation")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dCore_dnormalize ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName d), (v_Vuna_dCompiler_dElab_ddtDefBody d))))) dtb__1793)) sols2) (v_Vuna_dCompiler_dCore_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1800)) with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVInt (dtb__1805) -> (C_Base_dResult_dResult_Base_dResult_dOk ((bi_strFromInt dtb__1805)))
  | dtb__1806 -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dshowValue dtb__1806)))
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_decSols ec2))) (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix dtb__1796) dtb__1803) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (C_Vuna_dCompiler_dElab_dEc_Vuna_dCompiler_dElab_dEc (dtb__1799, dtb__1795, ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtDefName d), (v_Vuna_dCompiler_dElab_ddtDefBody d))))) dtb__1793), dtb__1792, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, dtb__1797, dtb__1798, C_Base_dList_dList_Nil, false)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_delabTraitsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1807, dtb__1808) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabTrait mc1) mc2) dtb__1807)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1809, dtb__1810) -> (match dtb__1810 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1811, dtb__1812) -> (match dtb__1812 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1813, dtb__1814) -> ((((((v_Vuna_dCompiler_dElab_delabTraitsGo dtb__1808) ((v_Base_dList_dappend mc1) dtb__1811)) dtb__1814) (C_Base_dList_dList_Cons (dtb__1809, mc3))) ((v_Base_dList_dappend dtb__1811) mc4)) (C_Base_dList_dList_Cons (dtb__1813, mc5)))
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
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__1815, dtb__1816, dtb__1817) -> (((((v_Vuna_dCompiler_dElab_dcheckE globals) ctx) ec) body) expected)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: definition has fewer parameters than its signature")
)))))))

let rec v_Vuna_dCompiler_dElab_dcheckBinders = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__1818, dtb__1819) -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1820, dtb__1821, dtb__1822, dtb__1823, dtb__1824) -> (if dtb__1821 then (if ((v_Vuna_dCompiler_dElab_disIndexDomain mc2) dtb__1823) then (((((((((v_Vuna_dCompiler_dElab_dbindIndexBinder mc0) mc1) mc2) dtb__1820) dtb__1823) dtb__1824) (C_Base_dList_dList_Cons (dtb__1818, dtb__1819))) mc4) mc6) else ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: implicit parameters must be types or inductive families (M14)")) else (match dtb__1818 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__1825, dtb__1826) -> (((((((((v_Vuna_dCompiler_dElab_dbindOnePattern mc0) mc1) mc2) dtb__1825) dtb__1819) mc4) dtb__1823) dtb__1824) mc6)
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__1827) -> (((((((((v_Vuna_dCompiler_dElab_dbindOnePattern mc0) mc1) mc2) "_") dtb__1819) mc4) dtb__1823) dtb__1824) mc6)
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt (v_Vuna_dCompiler_dAst_dpatSpan dtb__1818)) "DT: definition parameters must be variables (M13)")
))
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: definition has more parameters than its signature")
)) ((v_Vuna_dCompiler_dElab_dforceVal mc2) mc5))
  | C_Base_dList_dList_Nil -> ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dValue_Vuna_dCompiler_dCore_dVPi (dtb__1828, dtb__1829, dtb__1830, dtb__1831, dtb__1832) -> (if dtb__1829 then (if ((v_Vuna_dCompiler_dElab_disIndexDomain mc2) dtb__1831) then (((((((((v_Vuna_dCompiler_dElab_dbindIndexBinder mc0) mc1) mc2) dtb__1828) dtb__1831) dtb__1832) C_Base_dList_dList_Nil) mc4) mc6) else ((v_Vuna_dCompiler_dElab_derrAt mc6) "DT: implicit parameters must be types or inductive families (M14)")) else ((((((v_Vuna_dCompiler_dElab_dcheckBodyAtEnd mc0) mc1) mc2) mc4) mc5) mc6))
  | _ -> (((((v_Vuna_dCompiler_dElab_dcheckE mc0) mc1) mc2) mc4) mc5)
)) ((v_Vuna_dCompiler_dElab_dforceVal mc2) mc5))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dElab_dbindIndexBinder = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun dom -> (fun clo -> (fun pats -> (fun body -> (fun sp -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckBinders globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1833, dtb__1834) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (name, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig0, dtb__1833)), dtb__1834))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) v))) (((v_Vuna_dCompiler_dElab_dctxBindValue name) dom) ctx))) ((v_Vuna_dCompiler_dElab_dfreshVarValue name) lvl))) (v_Vuna_dCompiler_dElab_dctxDepth ctx)))))))))))
and v_Vuna_dCompiler_dElab_dbindOnePattern = (fun globals -> (fun ctx -> (fun ec -> (fun pname -> (fun pats -> (fun body -> (fun dom -> (fun clo -> (fun sp -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun erasure -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dcheckBinders globals) ctx2) ec) pats) body) ((v_Vuna_dCompiler_dCore_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1835, dtb__1836) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTLam (pname, erasure, dtb__1835)), dtb__1836))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dtypeLayerRig false) dom))) (((v_Vuna_dCompiler_dElab_dctxBindValue pname) dom) ctx))) ((v_Vuna_dCompiler_dElab_dfreshVarValue pname) lvl))) (v_Vuna_dCompiler_dElab_dctxDepth ctx)))))))))))

let v_Vuna_dCompiler_dElab_dcheckDef = (fun globals -> (fun ec -> (fun pats -> (fun body -> (fun expected -> (fun sp -> (((((((v_Vuna_dCompiler_dElab_dcheckBinders globals) (v_Vuna_dCompiler_dElab_demptyCtx ())) ec) pats) body) expected) sp)))))))

let v_Vuna_dCompiler_dElab_delabFunDef = (fun globals -> (fun ec -> (fun clauses -> (fun expected -> (fun sp -> (match clauses with
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_derrAt sp) "DT: function has no clauses")
  | C_Base_dList_dList_Cons (dtb__1837, dtb__1838) -> (match dtb__1837 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1839, dtb__1840) -> (match dtb__1838 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dDtMatch_dallVarPats dtb__1839) then ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) dtb__1839) dtb__1840) expected) sp) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp))))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
)
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
)
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDtMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dcheckDef globals) ec) C_Base_dList_dList_Nil) bodyExpr) expected) sp)))
))))))

let v_Vuna_dCompiler_dElab_delabInstanceMethod = (fun globals -> (fun ec -> (fun mty -> (fun clauses -> (((((v_Vuna_dCompiler_dElab_delabFunDef globals) ec) clauses) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) mty)) (v_Vuna_dCompiler_dElab_dclauseSpanOf clauses))))))

let rec v_Vuna_dCompiler_dElab_delabInstanceMethodsGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__1841, dtb__1842) -> (match dtb__1841 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1843, dtb__1844) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_derrAt mc8) "DT: instance is missing an implementation for an interface method")
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_delabInstanceMethod mc0) mc1) instTy) clauses)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1845, dtb__1846) -> (((((((((v_Vuna_dCompiler_dElab_delabInstanceMethodsGo mc0) dtb__1846) dtb__1842) mc3) mc4) mc5) (C_Base_dList_dList_Cons (dtb__1845, mc6))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1845, C_Vuna_dCompiler_dCore_dRig_Vuna_dCompiler_dCore_dRig1)), mc7))) mc8)
  | _ -> failwith "DT: impossible branch"
)))
)) (((v_Vuna_dCompiler_dElab_dsubstClassParam mc3) mc4) dtb__1844))) ((v_Vuna_dCompiler_dElab_dmethodClausesNamed dtb__1843) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc6), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc7), mc1))))))
  | _ -> failwith "DT: impossible branch"
))))))))))

let v_Vuna_dCompiler_dElab_delabInstanceMethods = (fun globals -> (fun cls -> (fun headArg -> (fun ec -> (fun methods -> (fun sp -> (((((((((v_Vuna_dCompiler_dElab_delabInstanceMethodsGo globals) ec) (v_Vuna_dCompiler_dElab_dzipClassFields cls)) (v_Vuna_dCompiler_dElab_dparamNameOf (v_Vuna_dCompiler_dElab_ddtClassParams cls))) headArg) methods) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) sp)))))))

let v_Vuna_dCompiler_dElab_delabInstance = (fun globals -> (fun classes -> (fun datas -> (fun ec -> (fun ds -> (match ds with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1847, dtb__1848) -> (match dtb__1847 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__1849, dtb__1850, dtb__1851, dtb__1852, dtb__1853) -> (match (v_Vuna_dCompiler_dElab_dinstanceHeadName dtb__1851) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1853) "DT: instance head must be an interface application (e.g. Show Int)")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1854) -> (match ((v_Vuna_dCompiler_dElab_dfindClass dtb__1854) classes) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1853) ((bi_concat "DT: unknown interface ") ((bi_concat dtb__1854) " in instance head")))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1855) -> (match ((v_Vuna_dCompiler_dElab_dfirstUnknownInstanceMethod dtb__1855) dtb__1852) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1856) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1853) ((bi_concat "DT: instance has unknown method ") dtb__1856))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dfirstMissingInstanceMethod dtb__1855) dtb__1852) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1857) -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1853) "DT: instance is missing an implementation for an interface method")
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_delabInstanceMethods globals) dtb__1855) (v_Vuna_dCompiler_dElab_dinstanceHeadTerm dtb__1851)) ec) dtb__1852) dtb__1853)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1858, dtb__1859) -> (match dtb__1859 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1860, dtb__1861) -> ((fun iname -> ((fun headTerm -> ((fun dctor -> ((fun dictTerm -> ((fun dictTyTerm -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_decAddDef ((v_Vuna_dCompiler_dElab_decAddInst dtb__1861) (C_Vuna_dCompiler_dElab_dDtInst_Vuna_dCompiler_dElab_dDtInst (iname, dictTyTerm, (v_Vuna_dCompiler_dElab_dinstanceIsNamed dtb__1849))))) (C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) ((v_Vuna_dCompiler_dElab_dctorResultType dtb__1855) headTerm))) (C_Vuna_dCompiler_dCore_dTerm_Vuna_dCompiler_dCore_dTCon (dctor, dtb__1860)))) (v_Vuna_dCompiler_dElab_ddictCtorName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1855)))) (v_Vuna_dCompiler_dElab_dinstanceHeadTerm dtb__1851))) (((v_Vuna_dCompiler_dElab_dinstanceName (v_Vuna_dCompiler_dElab_ddtClassName dtb__1855)) dtb__1849) dtb__1851))
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
  | _ -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1848) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabBodies = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1862, dtb__1863) -> (match dtb__1862 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__1864, dtb__1865, dtb__1866, dtb__1867) -> (match ((v_Vuna_dCompiler_dElab_dglobalLookup dtb__1864) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_derrAt dtb__1867) ((bi_concat "DT: expected a type signature for ") dtb__1864))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1868) -> (if ((v_Vuna_dCompiler_dElab_dmemDefName dtb__1864) mc2) then (((((v_Vuna_dCompiler_dElab_delabBodies dtb__1863) mc1) mc2) mc3) mc4) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabFunDef mc1) mc4) ((v_Vuna_dCompiler_dAst_dclausesFor (C_Base_dList_dList_Cons (dtb__1862, dtb__1863))) dtb__1864)) ((v_Vuna_dCompiler_dCore_deval C_Base_dList_dList_Nil) dtb__1868)) dtb__1867)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1869, dtb__1870) -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun globals2 -> (((((v_Vuna_dCompiler_dElab_delabBodies dtb__1863) globals2) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__1864, liftedTy)), mc2))) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDtDef_Vuna_dCompiler_dElab_dDtDef (dtb__1864, liftedTy, cleanTerm)), mc3))) ((v_Vuna_dCompiler_dElab_decAddDef liftedEc) (C_Base_dPair_dPair_Base_dPair_dPair (dtb__1864, cleanTerm))))) (((v_Vuna_dCompiler_dElab_dreplaceGlobalType dtb__1864) liftedTy) mc1))) ((v_Vuna_dCompiler_dElab_dsubstDictTerm liftedEc) liftedBody))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf lifted)))) (v_Base_dPair_dfirstOf lifted))) ((((v_Vuna_dCompiler_dElab_dliftFreeDictGoals dtb__1864) dtb__1870) dtb__1868) dtb__1869))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_delabBodies dtb__1863) mc1) mc2) mc3) mc4)
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), mc4))))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_delabInstanceBodiesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__1871, dtb__1872) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabInstance mc3) mc1) mc2) mc4) dtb__1871)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1873, dtb__1874) -> ((fun newDefs -> ((((((v_Vuna_dCompiler_dElab_delabInstanceBodiesGo dtb__1872) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__1873)) dtb__1874) ((v_Base_dList_dappend newDefs) mc5))) (((v_Vuna_dCompiler_dElab_dinstanceDefsOf mc4) dtb__1874) dtb__1873))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_delabInstanceBodies = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_delabInstanceBodiesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_delabProgramGo = (fun trusted -> (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dcollectSigs decls)) (fun sigs -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabDatas ((v_Vuna_dCompiler_dElab_dcollectDataDecls decls) C_Base_dList_dList_Nil)) (v_Vuna_dCompiler_dDtPrelude_dpreludeGlobalsFor (v_Vuna_dCompiler_dDtPrelude_dpickListFamily (v_Vuna_dCompiler_dElab_ddataNamesOf decls)))) ((v_Vuna_dCompiler_dElab_decWithTrust trusted) (v_Vuna_dCompiler_dElab_decEmpty ())))) (fun pd -> (match pd with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1875, dtb__1876) -> (match dtb__1876 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1877, dtb__1878) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabTraits ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dcollectTraitDecls (v_Vuna_dCompiler_dDtDerive_dbuiltinTraitDecls ())) C_Base_dList_dList_Nil)) ((v_Vuna_dCompiler_dElab_dcollectTraitDecls decls) C_Base_dList_dList_Nil))) dtb__1877) dtb__1878)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1879, dtb__1880) -> (match dtb__1880 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1881, dtb__1882) -> (match dtb__1882 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1883, dtb__1884) -> ((fun globals1 -> ((fun datas1 -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dcheckInstanceHeads ((v_Vuna_dCompiler_dElab_dcollectInstDecls ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtDerive_dbuiltinShowInstances ())) ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtDerive_dbuiltinEqInstances ())) ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtDerive_dbuiltinOrdInstances ())) decls)))) C_Base_dList_dList_Nil)) dtb__1883) globals1) dtb__1884)) (fun pih -> (match pih with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1885, dtb__1886) -> ((fun globals2 -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_delabSigs sigs) globals2) dtb__1886)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1887, dtb__1888) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dcheckAllDefined sigs) dtb__1887) decls)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabBodies decls) dtb__1887) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) dtb__1888)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1889, dtb__1890) -> ((fun ec3 -> ((fun defs -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabInstanceBodies ((v_Vuna_dCompiler_dElab_dcollectInstDecls ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtDerive_dbuiltinShowInstances ())) ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtDerive_dbuiltinEqInstances ())) ((v_Base_dList_dappend (v_Vuna_dCompiler_dDtDerive_dbuiltinOrdInstances ())) decls)))) C_Base_dList_dList_Nil)) dtb__1883) datas1) dtb__1887) ec3)) (fun pi -> (match pi with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1891, dtb__1892) -> ((fun ec4 -> ((fun instDefs -> (match (v_Vuna_dCompiler_dElab_dunsolvedMeta ec4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1893) -> (C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dunsolvedMessage ec4) dtb__1893)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun extra -> ((fun allDefs -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dcheckTerminationIf trusted) decls)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dElab_dDtProgram_Vuna_dCompiler_dElab_dDtProgram (datas1, allDefs, (v_Vuna_dCompiler_dElab_decGoals ec4), (v_Vuna_dCompiler_dElab_decSols ec4), dtb__1887, (v_Vuna_dCompiler_dElab_decInsts ec4), (v_Vuna_dCompiler_dElab_decClasses ec4), (v_Vuna_dCompiler_dElab_decNext ec4)))))))) ((v_Vuna_dCompiler_dElab_drezonkDefs ec4) ((v_Base_dList_dappend instDefs) ((v_Base_dList_dappend extra) defs))))) (((v_Vuna_dCompiler_dElab_dextraDefsOf dtb__1887) ec4) ((v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_drezonkDefs ec4) dtb__1891))) (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix dtb__1887) dtb__1892) 8))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_drezonkDefs ec3) dtb__1889))) (((v_Vuna_dCompiler_dElab_dresolveDictGoalsFix dtb__1887) dtb__1890) 8))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dappend globals1) dtb__1885))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dappend dtb__1875) dtb__1879))) ((v_Base_dList_dappend dtb__1877) dtb__1881))
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
  | C_Base_dList_dList_Cons (dtb__1894, dtb__1895) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_delabInstance mc3) mc1) mc2) mc4) dtb__1894)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__1896, dtb__1897) -> ((((((v_Vuna_dCompiler_dElab_delabInstancesGo dtb__1895) mc1) mc2) ((v_Base_dList_dappend mc3) dtb__1896)) dtb__1897) ((v_Base_dList_dappend dtb__1896) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_delabInstances = (fun decls -> (fun classes -> (fun datas -> (fun globals -> (fun ec -> ((((((v_Vuna_dCompiler_dElab_delabInstancesGo decls) classes) datas) globals) ec) C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_dgoalsOfProgram = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_delabProgramFull decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dgoalInfoOf (v_Vuna_dCompiler_dElab_ddtProgSols prog))) (v_Vuna_dCompiler_dElab_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_delabProgramWith = (fun trusted -> (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_delabProgramFullWith trusted) decls)) (fun prog -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_ddtProgDatas prog), (v_Vuna_dCompiler_dElab_ddtProgDefs prog)))))))))

let v_Vuna_dCompiler_dElab_delabProgram = (fun decls -> ((v_Vuna_dCompiler_dElab_delabProgramWith false) decls))
