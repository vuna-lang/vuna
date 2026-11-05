open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTypes_dDtDef = C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe) | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dElab_dTypes_dDtCtor = C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor of (string) * (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtData = C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData of (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (bool)
and t_Vuna_dCompiler_dElab_dTypes_dDtGoal = C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtClass = C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass of (string) * (string Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtInst = C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst of (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTypes_dDtDictGoal = C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal of (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dTypes_dEc = C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc of (int) * ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * ((int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDictGoal Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dHashMap.t_Base_dHashMap_dHashMap) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dHashMap.t_Base_dHashMap_dHashMap) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dIntMap.t_Base_dIntMap_dIntMap) * (int Base_dIntMap.t_Base_dIntMap_dIntMap) * (bool) * ((Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList Base_dHashMap.t_Base_dHashMap_dHashMap) * (t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dHashMap.t_Base_dHashMap_dHashMap) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dHashMap.t_Base_dHashMap_dHashMap) * (bool)
and t_Vuna_dCompiler_dElab_dTypes_dCtx = C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx of ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTypes_dDtProgram = C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram of (t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dList.t_Base_dList_dList) * ((int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList) * (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dHashMap.t_Base_dHashMap_dHashMap) * ((int, int) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)

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
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__22, dtb__23, dtb__24, dtb__25) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__26, dtb__27, dtb__28) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__29, dtb__30, dtb__31, dtb__32) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__31))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__33, dtb__34, dtb__35, dtb__36) -> true
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__37, dtb__38, dtb__39) -> false
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__40, dtb__41, dtb__42, dtb__43) -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__44, dtb__45, dtb__46, dtb__47) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__46))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
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
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> dtb__75
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> dtb__82
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtClassName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__95, dtb__96, dtb__97, dtb__98) -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtInstName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__99
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutNext = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (mc1, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, mc1, dtb__136, dtb__137, dtb__138))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> dtb__139
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> (Base_dList.v_Base_dList_dreverse dtb__177)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228) -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, mc1, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> dtb__250
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDepthTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__265, dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> dtb__277
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293, dtb__294, dtb__295, mc1, dtb__297, dtb__298, dtb__299, dtb__300))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> dtb__306
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> dtb__325
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> dtb__344
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddGoal = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, ((Base_dList.v_Base_dList_dappend dtb__360) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))), dtb__361, dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dhasInstName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__373, dtb__374) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__373) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName mc0) dtb__374))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, ((Base_dList.v_Base_dList_dappend dtb__381) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))), dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddInst = (fun ec i -> (if ((v_Vuna_dCompiler_dElab_dTypes_dhasInstName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName i)) (v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) then ec else ((v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw ec) i)))

let v_Vuna_dCompiler_dElab_dTypes_decAddClass = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, ((Base_dList.v_Base_dList_dappend dtb__400) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))), dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDictGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422, dtb__423, dtb__424, dtb__425, dtb__426, dtb__427, dtb__428) -> dtb__419
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, mc1, dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__447, dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463, dtb__464) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__447, dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, ((Base_dList.v_Base_dList_dappend dtb__455) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))), dtb__456, dtb__457, dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463, dtb__464))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decEmpty = (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (0, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), false, (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), false))

let v_Vuna_dCompiler_dElab_dTypes_decSolTbl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473, dtb__474, dtb__475, dtb__476, dtb__477, dtb__478, dtb__479, dtb__480, dtb__481, dtb__482) -> dtb__476
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490, dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__483, mc1, dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490, dtb__491, dtb__492, dtb__493, mc2, dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__501, dtb__502) -> (match dtb__501 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__503, dtb__504) -> (if (dtb__503 = mc0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__503, dtb__504)), ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId mc0) dtb__502))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsDelta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__505, dtb__506) -> (match dtb__505 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__507, dtb__508) -> ((v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId dtb__507) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutSols = (fun ec sols2 -> ((fun delta -> ((fun soltbl2 -> (((v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw ec) sols2) soltbl2)) ((Base_dIntMap.v_Base_dIntMap_dinsertAll delta) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)))) ((v_Vuna_dCompiler_dElab_dTypes_dsolsDelta (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) sols2)))

let v_Vuna_dCompiler_dElab_dTypes_decAddDef = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__509, dtb__510, dtb__511, dtb__512, dtb__513, dtb__514, dtb__515, dtb__516, dtb__517, dtb__518, dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__509, dtb__510, (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, dtb__511)), dtb__512, dtb__513, dtb__514, dtb__515, dtb__516, dtb__517, (((Base_dHashMap.v_Base_dHashMap_dinsert (Base_dPair.v_Base_dPair_dfirstOf mc1)) (Base_dPair.v_Base_dPair_dsecondOf mc1)) dtb__518), dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), c)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let v_Vuna_dCompiler_dElab_dTypes_decAddData = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__527, dtb__528, dtb__529, dtb__530, dtb__531, dtb__532, dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539, dtb__540, dtb__541, dtb__542, dtb__543, dtb__544) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__527, dtb__528, dtb__529, ((Base_dList.v_Base_dList_dappend dtb__530) (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))), dtb__531, dtb__532, dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539, dtb__540, dtb__541, ((Base_dHashMap.v_Base_dHashMap_dinsertAll (v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs mc1)) dtb__542), dtb__543, (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear mc1) then true else dtb__544)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas = (fun datas -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs) datas)) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__545, dtb__546, dtb__547, dtb__548, dtb__549, dtb__550, dtb__551, dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, dtb__560, dtb__561, dtb__562) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__545, dtb__546, dtb__547, dtb__548, dtb__549, dtb__550, dtb__551, dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, mc1, dtb__561, dtb__562))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decDefVals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567, dtb__568, dtb__569, dtb__570, dtb__571, dtb__572, dtb__573, dtb__574, dtb__575, dtb__576, dtb__577, dtb__578, dtb__579, dtb__580) -> dtb__579
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decSolsP = (fun ec -> ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsOf (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSols ec)) (v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))

let v_Vuna_dCompiler_dElab_dTypes_decHasLinear = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__581, dtb__582, dtb__583, dtb__584, dtb__585, dtb__586, dtb__587, dtb__588, dtb__589, dtb__590, dtb__591, dtb__592, dtb__593, dtb__594, dtb__595, dtb__596, dtb__597, dtb__598) -> dtb__598
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__599, dtb__600) -> (if (v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__599) then true else (v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__600))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefVals = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605, dtb__606, dtb__607, dtb__608, dtb__609, dtb__610, dtb__611, dtb__612, dtb__613, dtb__614, dtb__615, dtb__616, dtb__617, dtb__618) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605, dtb__606, dtb__607, dtb__608, dtb__609, dtb__610, dtb__611, dtb__612, dtb__613, dtb__614, dtb__615, dtb__616, mc1, dtb__618))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxDepth = (fun ctx -> (Base_dList.v_Base_dList_dlength (match ctx with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__619, dtb__620) -> dtb__619
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTypes_dctxBind = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__621, dtb__622) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__621)), dtb__622))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxBindValue = (fun name dom ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom)) ctx))

let v_Vuna_dCompiler_dElab_dTypes_dctxRefine = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__623, dtb__624) -> (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__623, ((Base_dList.v_Base_dList_dappend dtb__624) mc1)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__625, dtb__626) -> (match dtb__625 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__627, dtb__628) -> (if (dtb__627 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc2, dtb__628)))) else (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt mc0) dtb__626) (mc2 + 1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxLookup = (fun name ctx -> (((v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt name) (match ctx with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__629, dtb__630) -> dtb__629
  | _ -> failwith "DT: impossible branch"
)) 0))

let rec v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__631, dtb__632) -> (match dtb__631 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__633, dtb__634) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__633, ((mc2 - mc1) - 1), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__632) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dctxEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__635, dtb__636) -> (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__635) 0) (Base_dList.v_Base_dList_dlength dtb__635))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineLookup = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__637, dtb__638) -> (match dtb__637 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__639, dtb__640) -> (if (dtb__639 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__640)) else ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup mc0) dtb__638))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTypes_drefineValue = (fun refs fuel v -> (if (fuel <= 0) then v else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__641) -> (match dtb__641 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__642, dtb__643, dtb__644) -> ((fun sp2 -> (match ((v_Vuna_dCompiler_dElab_dTypes_drefineLookup dtb__643) refs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__645) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__645)) sp2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__642, dtb__643, sp2))))
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__644))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__646, dtb__647) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__646, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__647)))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__648, dtb__649) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__648, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__649)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__650, dtb__651) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__650), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__651)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__652, dtb__653) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__652), dtb__653))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__654, dtb__655, dtb__656) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf ((((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__654), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__655), (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1)) dtb__656)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__657, dtb__658) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__657, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs) (fuel - 1))) dtb__658)))
  | _ -> v
)))

let v_Vuna_dCompiler_dElab_dTypes_devalCtx = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__659, dtb__660) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__660) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__659) 0) (Base_dList.v_Base_dList_dlength dtb__659)))) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__661, dtb__662) -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTypes_drefineValue dtb__662) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__661) 0) (Base_dList.v_Base_dList_dlength dtb__661)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_demptyCtx = (C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTypes_derrAt = (fun sp msg -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": "; msg]))))

let v_Vuna_dCompiler_dElab_dTypes_dnewMeta = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__663, dtb__664, dtb__665, dtb__666, dtb__667, dtb__668, dtb__669, dtb__670, dtb__671, dtb__672, dtb__673, dtb__674, dtb__675, dtb__676, dtb__677, dtb__678, dtb__679, dtb__680) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__663)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc ((dtb__663 + 1), dtb__664, dtb__665, dtb__666, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__663, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__667)), dtb__668, dtb__669, dtb__670, dtb__671, dtb__672, dtb__673, dtb__674, (((Base_dIntMap.v_Base_dIntMap_dinsert dtb__663) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__675), dtb__676, dtb__677, dtb__678, dtb__679, dtb__680))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__681, dtb__682, dtb__683, dtb__684, dtb__685, dtb__686, dtb__687, dtb__688, dtb__689, dtb__690, dtb__691, dtb__692, dtb__693, dtb__694, dtb__695, dtb__696, dtb__697, dtb__698) -> ((fun goal -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__681)), (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc ((dtb__681 + 1), dtb__682, dtb__683, dtb__684, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__681, (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0))), dtb__685)), ((Base_dList.v_Base_dList_dappend dtb__686) (Base_dList.C_Base_dList_dList_Base_dList_dCons (goal, Base_dList.C_Base_dList_dList_Base_dList_dNil))), dtb__687, dtb__688, dtb__689, dtb__690, dtb__691, dtb__692, (((Base_dIntMap.v_Base_dIntMap_dinsert dtb__681) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) dtb__693), dtb__694, dtb__695, dtb__696, dtb__697, dtb__698))))) (C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__681, mc2, mc3, (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__699, dtb__700) -> dtb__699
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dforceVal = (fun ec v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__701, dtb__702, dtb__703, dtb__704, dtb__705, dtb__706, dtb__707, dtb__708, dtb__709, dtb__710) -> dtb__701
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__711, dtb__712, dtb__713, dtb__714, dtb__715, dtb__716, dtb__717, dtb__718, dtb__719, dtb__720) -> dtb__712
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__721, dtb__722, dtb__723, dtb__724, dtb__725, dtb__726, dtb__727, dtb__728, dtb__729, dtb__730) -> dtb__723
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgSols = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__731, dtb__732, dtb__733, dtb__734, dtb__735, dtb__736, dtb__737, dtb__738, dtb__739, dtb__740) -> dtb__734
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__741, dtb__742, dtb__743, dtb__744, dtb__745, dtb__746, dtb__747, dtb__748, dtb__749, dtb__750) -> dtb__745
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__751, dtb__752, dtb__753, dtb__754, dtb__755, dtb__756, dtb__757, dtb__758, dtb__759, dtb__760) -> dtb__756
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__761, dtb__762, dtb__763, dtb__764, dtb__765, dtb__766, dtb__767, dtb__768, dtb__769, dtb__770) -> dtb__767
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl = (fun sols -> ((Base_dIntMap.v_Base_dIntMap_dinsertAll sols) (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__771, dtb__772, dtb__773, dtb__774, dtb__775, dtb__776, dtb__777, dtb__778, dtb__779, dtb__780, dtb__781, dtb__782, dtb__783, dtb__784, dtb__785, dtb__786, dtb__787, dtb__788) -> (C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__771, dtb__772, dtb__773, dtb__774, dtb__775, dtb__776, dtb__777, dtb__778, dtb__779, mc1, dtb__781, dtb__782, dtb__783, dtb__784, dtb__785, dtb__786, dtb__787, dtb__788))
  | _ -> failwith "DT: impossible branch"
))
