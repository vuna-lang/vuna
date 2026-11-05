open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCache_dCachedProgram = C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dDriver_dCache_dcachedDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixTerm = (fun tbl depth t -> (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl tbl) depth) t))

let v_Vuna_dCompiler_dDriver_dCache_dfixDef = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__25, dtb__26, dtb__27, dtb__28) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__25, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__26), dtb__27, dtb__28))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__29, dtb__30, dtb__31) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__29, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__30), dtb__31))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__32, dtb__33, dtb__34, dtb__35) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__32, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__33), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__34), dtb__35))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixCtor = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__36, dtb__37, dtb__38, dtb__39) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__36, dtb__37, dtb__38, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__39)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixData = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__40, dtb__41, dtb__42, dtb__43) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__40, dtb__41, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixCtor mc0)) dtb__42), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__43)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixClass = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__44, dtb__45, dtb__46, dtb__47) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__44, dtb__45, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__46), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 1)) dtb__47)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dfixTele = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (match dtb__48 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__50, dtb__51) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__50, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) mc1) dtb__51))), (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) (mc1 + 1)) dtb__49)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixInst = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__52, dtb__53, dtb__54, dtb__55) -> ((fun nTele -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__52, (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) 0) dtb__53), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele)) dtb__54), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele) dtb__55)))) (Base_dList.v_Base_dList_dlength dtb__53))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram = (fun prog -> ((fun tbl -> (C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixData tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixDef tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)), ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm tbl) 0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixInst tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixClass tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog))))) (Base_dIntMap.v_Base_dIntMap_dfromList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))))

let v_Vuna_dCompiler_dDriver_dCache_dtermValidAt = (fun depth t -> (if (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) = 0) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t)) else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

let rec v_Vuna_dCompiler_dDriver_dCache_dctorsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__56)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid dtb__57) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_ddatasValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__58)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__58)) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__59) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dbodyValid = (fun t -> (if (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) = 0) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t)) else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

let rec v_Vuna_dCompiler_dDriver_dCache_ddefsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__60) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__62) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__60)) then (v_Vuna_dCompiler_dDriver_dCache_dbodyValid dtb__62) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__61) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__60)) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__61) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64) -> (match dtb__63 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__65, dtb__66) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) dtb__66) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__64) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dteleValid = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__67 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__70) then ((v_Vuna_dCompiler_dDriver_dCache_dteleValid (mc0 + 1)) dtb__68) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__71) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt mc0) dtb__72) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dinstsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> ((fun nTele -> (if (if (if ((v_Vuna_dCompiler_dDriver_dCache_dteleValid 0) (match dtb__73 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__75, dtb__76, dtb__77, dtb__78) -> dtb__76
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt nTele) (match dtb__73 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__79, dtb__80, dtb__81, dtb__82) -> dtb__81
  | _ -> failwith "DT: impossible branch"
)) else false) then ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt nTele) (match dtb__73 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__86
  | _ -> failwith "DT: impossible branch"
)) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__74) else false)) (Base_dList.v_Base_dList_dlength (match dtb__73 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__87, dtb__88, dtb__89, dtb__90) -> dtb__88
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dclassesValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> ((fun projs -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt 0) projs) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt 1) (match dtb__91 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__93, dtb__94, dtb__95, dtb__96) -> dtb__96
  | _ -> failwith "DT: impossible branch"
)) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__92) else false)) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) (match dtb__91 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__97, dtb__98, dtb__99, dtb__100) -> dtb__99
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (if (if (if (if (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__101) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__102) else false) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__103) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__104) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__105) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt = (fun depth t -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t) then "free-var" else ""))))

let rec v_Vuna_dCompiler_dDriver_dCache_dctorIssues = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues dtb__107) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__106); " ctor:"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__106)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_ddataIssue = (fun d -> ((fun kindIssue -> (if (kindIssue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); " kind:"; kindIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind d))))

let rec v_Vuna_dCompiler_dDriver_dCache_ddatasIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__109) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddataIssue dtb__108))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt = (fun t -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t) then "free-var" else ""))))

let v_Vuna_dCompiler_dDriver_dCache_ddefIssue = (fun d -> ((fun typeIssue -> (if (typeIssue = "") then (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110) -> ((fun bodyIssue -> (if (bodyIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " body:"; bodyIssue]))) (v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt dtb__110))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " type:"; typeIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))

let rec v_Vuna_dCompiler_dDriver_dCache_ddefsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__111, dtb__112) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__112) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddefIssue dtb__111))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match dtb__113 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__114) else (String.concat "" [dtb__115; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) dtb__116))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (match dtb__117 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo (mc0 + 1)) dtb__118) else (String.concat "" [dtb__119; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__120))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dctxIssues = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues mc0) dtb__122) else issue)) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__121))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dinstIssue = (fun i -> ((fun nTele -> ((fun teleIssue -> (if (teleIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " tele:"; teleIssue]) else ((fun ctxIssue -> (if (ctxIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " ctx:"; ctxIssue]) else ((fun headIssue -> (if (headIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " head:"; headIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt nTele) (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__123, dtb__124, dtb__125, dtb__126) -> dtb__126
  | _ -> failwith "DT: impossible branch"
))))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues nTele) (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__127, dtb__128, dtb__129, dtb__130) -> dtb__129
  | _ -> failwith "DT: impossible branch"
))))) ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo 0) (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__132
  | _ -> failwith "DT: impossible branch"
)))) (Base_dList.v_Base_dList_dlength (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__136
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dCache_dinstsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__140) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dinstIssue dtb__139))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dclassIssue = (fun c -> ((fun projIssue -> (if (projIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " proj:"; projIssue]) else ((fun fieldIssue -> (if (fieldIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " field:"; fieldIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues 1) (match c with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__141, dtb__142, dtb__143, dtb__144) -> dtb__144
  | _ -> failwith "DT: impossible branch"
))))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues 0) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) (match c with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__145, dtb__146, dtb__147, dtb__148) -> dtb__147
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dCache_dclassesIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__149, dtb__150) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__150) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dclassIssue dtb__149))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> ((fun datasI -> ((fun defsI -> ((fun globalsI -> ((fun instsI -> ((fun classesI -> (if (datasI <> "") then ("datas " ^ datasI) else (if (defsI <> "") then ("defs " ^ defsI) else (if (globalsI <> "") then ("globals " ^ globalsI) else (if (instsI <> "") then ("insts " ^ instsI) else (if (classesI <> "") then ("classes " ^ classesI) else "")))))) (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__155))) (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__154))) (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__153))) (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__152))) (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__151))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment = 1073741824

let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel = (fun fuel off t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__156) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta ((dtb__156 + off)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__157, dtb__158, dtb__159, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__160), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__161)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__162, dtb__163, dtb__164) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__162, dtb__163, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__164)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__165, dtb__166, dtb__167) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__165), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__166), dtb__167))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__168, dtb__169) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__168, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__169)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__170, dtb__171) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__170), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dshiftAltFuel (fuel - 1)) off)) dtb__171)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__172, dtb__173, dtb__174) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__172), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__173), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__174)))
  | _ -> t
)))
and v_Vuna_dCompiler_dDriver_dCache_dshiftAltFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__175, dtb__176, dtb__177) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__175, dtb__176, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__177)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftTerm = (fun off t -> (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel 128) off) t))

let v_Vuna_dCompiler_dDriver_dCache_dshiftDef = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__178, dtb__179, dtb__180, dtb__181) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__178, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__179), dtb__180, dtb__181))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__182, dtb__183, dtb__184) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__182, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__183), dtb__184))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__185, dtb__186, dtb__187, dtb__188) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__185, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__186), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__187), dtb__188))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCtor = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__189, dtb__190, dtb__191, dtb__192) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (dtb__189, dtb__190, dtb__191, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__192)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftData = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__193, dtb__194, dtb__195, dtb__196) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dtb__193, dtb__194, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftCtor mc0)) dtb__195), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__196)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftClass = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__197, dtb__198, dtb__199, dtb__200) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__197, dtb__198, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__199), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__200)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftInst = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__201, dtb__202, dtb__203, dtb__204) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__201, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__202), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__203), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__204)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> (C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_Vuna_dCompiler_dDriver_dCache_dCachedProgram (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftData mc0)) dtb__205), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftDef mc0)) dtb__206), ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__207), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftInst mc0)) dtb__208), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftClass mc0)) dtb__209)))
  | _ -> failwith "DT: impossible branch"
))
