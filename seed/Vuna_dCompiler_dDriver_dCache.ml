open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCache_dCachedProgram = C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dDriver_dCache_dcachedDatas = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedDefs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedInsts = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedClasses = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixTerm = (fun tbl depth t -> (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl tbl) depth) t))

let v_Vuna_dCompiler_dDriver_dCache_dfixDef = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__25, dtb__26, dtb__27, dtb__28) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__25, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__26), dtb__27, dtb__28))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__29, dtb__30, dtb__31) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__29, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__30), dtb__31))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__32, dtb__33, dtb__34, dtb__35) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__32, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__33), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__34), dtb__35))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixCtor = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__36, dtb__37, dtb__38, dtb__39) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__36, dtb__37, dtb__38, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__39)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixData = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__40, dtb__41, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixCtor mc0)) dtb__42), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) dtb__43), dtb__44, dtb__45))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixClass = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__46, dtb__47, dtb__48, dtb__49) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__46, dtb__47, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) 0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__48), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) (Base_dList.v_Base_dList_dlength dtb__47))) dtb__49)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dfixTele = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match dtb__50 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__52, dtb__53) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__52, (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) mc1) dtb__53))), (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) (mc1 + 1)) dtb__51)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dfixInst = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__54, dtb__55, dtb__56, dtb__57) -> ((fun nTele -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__54, (((v_Vuna_dCompiler_dDriver_dCache_dfixTele mc0) 0) dtb__55), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele)) dtb__56), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm mc0) nTele) dtb__57)))) (Base_dList.v_Base_dList_dlength dtb__55))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith = (fun tbl prog -> (C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixData tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixDef tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)), ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), (((v_Vuna_dCompiler_dDriver_dCache_dfixTerm tbl) 0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixInst tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dfixClass tbl)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))))

let v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram = (fun prog -> ((v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) prog))

let v_Vuna_dCompiler_dDriver_dCache_dtermValidAt = (fun depth t -> (if (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) = 0) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t)) else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

let rec v_Vuna_dCompiler_dDriver_dCache_dctorsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__58)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid dtb__59) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_ddatasValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind dtb__60)) then (v_Vuna_dCompiler_dDriver_dCache_dctorsValid (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__60)) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__61) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dbodyValid = (fun t -> (if (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) = 0) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t)) else false) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t)) else false))

let rec v_Vuna_dCompiler_dDriver_dCache_ddefsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__62) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__62)) then (v_Vuna_dCompiler_dDriver_dCache_dbodyValid dtb__64) else false) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__63) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__62)) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__63) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> (match dtb__65 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__67, dtb__68) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt 0) dtb__68) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__66) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dteleValid = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match dtb__69 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__71, dtb__72) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__72) then ((v_Vuna_dCompiler_dDriver_dCache_dteleValid (mc0 + 1)) dtb__70) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt mc0) dtb__73) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt mc0) dtb__74) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dinstsValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> ((fun nTele -> (if (if (if ((v_Vuna_dCompiler_dDriver_dCache_dteleValid 0) (match dtb__75 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__78
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt nTele) (match dtb__75 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__81, dtb__82, dtb__83, dtb__84) -> dtb__83
  | _ -> failwith "DT: impossible branch"
)) else false) then ((v_Vuna_dCompiler_dDriver_dCache_dtermValidAt nTele) (match dtb__75 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__85, dtb__86, dtb__87, dtb__88) -> dtb__88
  | _ -> failwith "DT: impossible branch"
)) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__76) else false)) (Base_dList.v_Base_dList_dlength (match dtb__75 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__89, dtb__90, dtb__91, dtb__92) -> dtb__90
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dclassesValid = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> ((fun projs -> (if (if ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt 0) projs) then ((v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt (Base_dList.v_Base_dList_dlength (match dtb__93 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__95, dtb__96, dtb__97, dtb__98) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))) (match dtb__93 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__102
  | _ -> failwith "DT: impossible branch"
)) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__94) else false)) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) (match dtb__93 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__103, dtb__104, dtb__105, dtb__106) -> dtb__105
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> (if (if (if (if (v_Vuna_dCompiler_dDriver_dCache_ddatasValid dtb__107) then (v_Vuna_dCompiler_dDriver_dCache_ddefsValid dtb__108) else false) then (v_Vuna_dCompiler_dDriver_dCache_dglobalsValid dtb__109) else false) then (v_Vuna_dCompiler_dDriver_dCache_dinstsValid dtb__110) else false) then (v_Vuna_dCompiler_dDriver_dCache_dclassesValid dtb__111) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt = (fun depth t -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar depth) t) then "free-var" else ""))))

let rec v_Vuna_dCompiler_dDriver_dCache_dctorIssues = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues dtb__113) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__112); " ctor:"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__112)))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_ddataIssue = (fun d -> ((fun kindIssue -> (if (kindIssue = "") then (v_Vuna_dCompiler_dDriver_dCache_dctorIssues (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); " kind:"; kindIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataKind d))))

let rec v_Vuna_dCompiler_dDriver_dCache_ddatasIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__115) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddataIssue dtb__114))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt = (fun t -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime t)) > 0) then "meta" else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar t) then "negative-index" else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) t) then "free-var" else ""))))

let v_Vuna_dCompiler_dDriver_dCache_ddefIssue = (fun d -> ((fun typeIssue -> (if (typeIssue = "") then (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116) -> ((fun bodyIssue -> (if (bodyIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " body:"; bodyIssue]))) (v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt dtb__116))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
) else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); " type:"; typeIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d))))

let rec v_Vuna_dCompiler_dDriver_dCache_ddefsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__117, dtb__118) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__118) else issue)) (v_Vuna_dCompiler_dDriver_dCache_ddefIssue dtb__117))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__119, dtb__120) -> (match dtb__119 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__121, dtb__122) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__120) else (String.concat "" [dtb__121; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt 0) dtb__122))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__123 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__125, dtb__126) -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo (mc0 + 1)) dtb__124) else (String.concat "" [dtb__125; ":"; issue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__126))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCache_dctxIssues = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> ((fun issue -> (if (issue = "") then ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues mc0) dtb__128) else issue)) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt mc0) dtb__127))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dinstIssue = (fun i -> ((fun nTele -> ((fun teleIssue -> (if (teleIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " tele:"; teleIssue]) else ((fun ctxIssue -> (if (ctxIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " ctx:"; ctxIssue]) else ((fun headIssue -> (if (headIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); " head:"; headIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt nTele) (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__132
  | _ -> failwith "DT: impossible branch"
))))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues nTele) (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__133, dtb__134, dtb__135, dtb__136) -> dtb__135
  | _ -> failwith "DT: impossible branch"
))))) ((v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo 0) (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__137, dtb__138, dtb__139, dtb__140) -> dtb__138
  | _ -> failwith "DT: impossible branch"
)))) (Base_dList.v_Base_dList_dlength (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__141, dtb__142, dtb__143, dtb__144) -> dtb__142
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dCache_dinstsIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__146) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dinstIssue dtb__145))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dclassIssue = (fun c -> ((fun projIssue -> (if (projIssue <> "") then (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " proj:"; projIssue]) else ((fun fieldIssue -> (if (fieldIssue = "") then "" else (String.concat "" [(Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c); " field:"; fieldIssue]))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues (Base_dList.v_Base_dList_dlength (match c with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__147, dtb__148, dtb__149, dtb__150) -> dtb__148
  | _ -> failwith "DT: impossible branch"
))) (match c with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__151, dtb__152, dtb__153, dtb__154) -> dtb__154
  | _ -> failwith "DT: impossible branch"
))))) ((v_Vuna_dCompiler_dDriver_dCache_dctxIssues 0) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) (match c with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__155, dtb__156, dtb__157, dtb__158) -> dtb__157
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dCache_dclassesIssue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__159, dtb__160) -> ((fun issue -> (if (issue = "") then (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__160) else issue)) (v_Vuna_dCompiler_dDriver_dCache_dclassIssue dtb__159))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> ((fun datasI -> ((fun defsI -> ((fun globalsI -> ((fun instsI -> ((fun classesI -> (if (datasI <> "") then ("datas " ^ datasI) else (if (defsI <> "") then ("defs " ^ defsI) else (if (globalsI <> "") then ("globals " ^ globalsI) else (if (instsI <> "") then ("insts " ^ instsI) else (if (classesI <> "") then ("classes " ^ classesI) else "")))))) (v_Vuna_dCompiler_dDriver_dCache_dclassesIssue dtb__165))) (v_Vuna_dCompiler_dDriver_dCache_dinstsIssue dtb__164))) (v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue dtb__163))) (v_Vuna_dCompiler_dDriver_dCache_ddefsIssue dtb__162))) (v_Vuna_dCompiler_dDriver_dCache_ddatasIssue dtb__161))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment = 1073741824

let rec v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel = (fun fuel off t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__166) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta ((dtb__166 + off)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__167, dtb__168, dtb__169, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__170), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__171)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__172, dtb__173, dtb__174) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__172, dtb__173, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__174)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__175, dtb__176, dtb__177) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__175), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__176), dtb__177))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__178, dtb__179) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__178, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__179)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__180, dtb__181) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__180), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dDriver_dCache_dshiftAltFuel (fuel - 1)) off)) dtb__181)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__182, dtb__183, dtb__184) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__182), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__183), (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel (fuel - 1)) off) dtb__184)))
  | _ -> t
)))
and v_Vuna_dCompiler_dDriver_dCache_dshiftAltFuel = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__185, dtb__186, dtb__187) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__185, dtb__186, (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel mc0) mc1) dtb__187)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftTerm = (fun off t -> (((v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel 128) off) t))

let v_Vuna_dCompiler_dDriver_dCache_dshiftDef = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__188, dtb__189, dtb__190, dtb__191) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__188, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__189), dtb__190, dtb__191))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__192, dtb__193, dtb__194) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__192, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__193), dtb__194))
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__195, dtb__196, dtb__197, dtb__198) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__195, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__196), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__197), dtb__198))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCtor = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__199, dtb__200, dtb__201, dtb__202) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (dtb__199, dtb__200, dtb__201, ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__202)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftData = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__203, dtb__204, ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftCtor mc0)) dtb__205), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__206), dtb__207, dtb__208))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftClass = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__209, dtb__210, dtb__211, dtb__212) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__209, dtb__210, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__211), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__212)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftInst = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__213, dtb__214, dtb__215, dtb__216) -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (dtb__213, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__214), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0)) dtb__215), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) dtb__216)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221) -> (C_Vuna_dCompiler_dDriver_dCache_dCachedProgram_CachedProgram (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftData mc0)) dtb__217), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftDef mc0)) dtb__218), ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dDriver_dCache_dshiftTerm mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))))) dtb__219), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftInst mc0)) dtb__220), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCache_dshiftClass mc0)) dtb__221)))
  | _ -> failwith "DT: impossible branch"
))
