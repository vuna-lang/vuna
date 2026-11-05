open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder = C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder of (string) * (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dDriver_dDictSubst = C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst of (int) * (string) * (int)
and t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo of (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) * (string) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)

let rec v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then ((fun domVal -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__0) domVal) mc0)) dtb__4)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) dtb__3)) else mc0)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx = (fun ty0 -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty0))

let v_Vuna_dCompiler_dElab_dDriver_dsigDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ((v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, dtb__5, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) dtb__6) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder (v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2)) mc3) dtb__7) mc0)) dtb__8) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

let v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc2, mc1))))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc4) mc3)) (fun parts -> ((Base_dResult.v_Base_dResult_dandThen ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses mc1)) mc0) (v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx mc2)) parts) mc4) mc1)) (fun q -> ((fun doms -> ((fun ec1 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts mc2) doms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)), ec1))))) (Base_dPair.v_Base_dPair_dsecondOf q))) (Base_dPair.v_Base_dPair_dfirstOf q))))))
))

let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> (match dtb__9 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__15, dtb__16) -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__15)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders mc1) dtb__20) dtb__17) dtb__13) dtb__16)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__10) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, sigTy)), mc1))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__22) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__11) sigTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__22)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, sigTy)), mc3)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__22) 0) dtb__21))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Base_dList.v_Base_dList_dappend mc1) (Base_dList.v_Base_dList_dreverse mc3)), mc2))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun sigs globals ec -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (Base_dHashMap.v_Base_dHashMap_dfromList globals))) true)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (if dtb__24 then ((fun domVal -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__23) domVal) mc1)) dtb__27) acc2)) (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc0) domVal) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__23, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1), domVal)), mc3)) else mc3))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__26)) else (Base_dList.v_Base_dList_dreverse mc3))
  | _ -> (Base_dList.v_Base_dList_dreverse mc3)
))

let v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders = (fun ec ty -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo ec) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__28) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__29) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (if (((v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches mc0) (match dtb__30 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__32, dtb__33, dtb__34) -> dtb__34
  | _ -> failwith "DT: impossible branch"
)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__30)) else (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder mc0) dtb__31) mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo = (fun ec binders goals kept acc -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match dtb__35 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__37, dtb__38) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__37) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__36) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__35, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder ec) binders) dtb__38) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__36) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__35, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__40) -> ((fun q -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__37) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ((match dtb__40 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__41, dtb__42, dtb__43) -> dtb__41
  | _ -> failwith "DT: impossible branch"
), (match dtb__40 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__44, dtb__45, dtb__46) -> dtb__45
  | _ -> failwith "DT: impossible branch"
), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__47) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__47))) binders) dtb__36) kept) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__37, (match dtb__40 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__48, dtb__49, dtb__50) -> dtb__48
  | _ -> failwith "DT: impossible branch"
), q)), acc)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__51) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__36) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__35, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((match dtb__40 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder (dtb__52, dtb__53, dtb__54) -> dtb__53
  | _ -> failwith "DT: impossible branch"
) + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse acc), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals ec) (Base_dList.v_Base_dList_dreverse kept))))
  | _ -> failwith "DT: impossible branch"
)) goals))

let rec v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts dtb__56) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (match dtb__55 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__57, dtb__58, dtb__59) -> dtb__57
  | _ -> failwith "DT: impossible branch"
)) (match dtb__55 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__60, dtb__61, dtb__62) -> dtb__61
  | _ -> failwith "DT: impossible branch"
)) (match dtb__55 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_Vuna_dCompiler_dElab_dDriver_dDictSubst (dtb__63, dtb__64, dtb__65) -> dtb__65
  | _ -> failwith "DT: impossible branch"
)) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals = (fun ec ty body -> (match ((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders ec) ty) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (body, ec))
  | dtb__66 -> ((fun solved -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts (Base_dPair.v_Base_dPair_dfirstOf solved)) body), (Base_dPair.v_Base_dPair_dsecondOf solved)))) (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) dtb__66) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (match dtb__67 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__69, dtb__70, dtb__71, dtb__72) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__68) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__69) ((Base_dList.v_Base_dList_dappend cur) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))) mc1))) (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__69) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> dtb__73
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__68) mc1)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun decls -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun ec decls name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) (match ec with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> dtb__88
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> dtb__92
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun name ec -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__94) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__94))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun defs -> ((Base_dList.v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (match dtb__95 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__97, dtb__98, dtb__99, dtb__100) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__97, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__96)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__96)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dfutureBodyTbl = (fun decls instHeads -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll ((Base_dList.v_Base_dList_dmap (fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (n, true)))) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) instHeads)))) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__101, dtb__102, dtb__103) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__101)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__102)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__103)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__104) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__105) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__106) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__107, dtb__108) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__107)) ((Base_dList.v_Base_dList_dconcatMap (fun alt -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))) dtb__108))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__109, dtb__110) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs (Base_dPair.v_Base_dPair_dfirstOf p)))) dtb__110)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__111, dtb__112, dtb__113) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__111)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__112))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__114, dtb__115, dtb__116) -> (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__116)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__120)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__121))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__122) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__123) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__123, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__124) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__125, dtb__126) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe = (fun fuel future defs defvals self seen refs -> (if (fuel <= 0) then true else (match refs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> (if (dtb__127 = self) then true else (if (Base_dMaybe.v_Base_dMaybe_disJust ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__127) defvals)) then (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) seen) dtb__128) else (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__127) seen) then (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) seen) dtb__128) else (match ((Base_dHashMap.v_Base_dHashMap_dlookup dtb__127) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__127) true) seen)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs dtb__129)) dtb__128))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__127) future) then true else (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe (fuel - 1)) future) defs) defvals) self) seen) dtb__128))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_dmemoDefValue = (fun future ec name body -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) body) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) body) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (if (((((((v_Vuna_dCompiler_dElab_dDriver_dmemoUnsafe 4096) future) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)) name) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) (v_Vuna_dCompiler_dElab_dDriver_dtermGlobalRefs body)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (name, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))))))

let v_Vuna_dCompiler_dElab_dDriver_dmemoizeDef = (fun future ec name body -> (match ((((v_Vuna_dCompiler_dElab_dDriver_dmemoDefValue future) ec) name) body) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__130) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDefVals ec) (((Base_dHashMap.v_Base_dHashMap_dinsert name) dtb__130) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefVals ec)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ec
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__131, dtb__132) -> (match dtb__131 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__133, dtb__134, dtb__135, dtb__136) -> (if (dtb__133 = mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__132))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__132)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (match dtb__137 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__139, dtb__140, dtb__141) -> (if (dtb__139 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__138))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__142, dtb__143, dtb__144, dtb__145) -> (if (dtb__142 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__145)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__138))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__138)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__146, dtb__147) -> (match dtb__146 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> (match dtb__149 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (match dtb__151 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (match ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf dtb__148) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__154) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__148) mc2) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__154) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAxiomWithDefinition (dtb__148))) dtb__148) else (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__147) mc1) mc2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause dtb__148) mc2) then (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup dtb__148) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dSignatureNoDef (dtb__148))) (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (dtb__148, Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__155) -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__147) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dSignatureNoDef (dtb__148))) (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (dtb__148, Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs globals decls -> (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) globals) decls))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__156) -> (match dtb__156 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__157, dtb__158) -> (if (if (if (dtb__157 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__157 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__157 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported (("Array " ^ dtb__157)))) dtb__157))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__159) -> (match dtb__159 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__160, dtb__161) -> (if (if (if (dtb__160 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__160 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__160 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0)) else (if (dtb__160 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (match dtb__163 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem mc0) dtb__162)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__161) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported (dtb__160))) dtb__160)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("non-basic type"))) "non-basic")
))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__165 then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) dtb__167)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__168) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__164, mc2, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))
  | _ -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) mc3))
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy = (fun sp tyTerm -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue sp) 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) tyTerm)))

let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals ec n -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2)) < (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix globals) ec2) (n - 1)) else ec2))) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun prog expr -> (match prog with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178) -> ((fun bodies -> ((fun ec0 -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__173) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180) -> (match dtb__180 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, dtb__182) -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInterpNoInstance (dtb__183))) dtb__183)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__176) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__184) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedMetavarInfer ((bi_strFromInt dtb__184)))) (bi_strFromInt dtb__184))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize (Base_dHashMap.v_Base_dHashMap_dfromList bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__179)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__185) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__185), tyText))))
  | dtb__186 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__186), tyText))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Base_dHashMap.v_Base_dHashMap_dfromList bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__181))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__173) dtb__182) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Vuna_dCompiler_dElab_dTypes_dEc (dtb__176, dtb__172, (Base_dList.v_Base_dList_dreverse bodies), dtb__169, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__174, dtb__175, Base_dList.C_Base_dList_dList_Base_dList_dNil, (Base_dHashMap.v_Base_dHashMap_dfromList bodies), (Base_dHashMap.v_Base_dHashMap_dfromList dtb__173), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__172), (Base_dIntMap.v_Base_dIntMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), true, (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__169), dtb__177, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__169))))) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__170))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog expr -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.v_Base_dPair_dfirstOf p))))))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__187, dtb__188, dtb__189) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__187) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__188)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__189))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__190) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__191) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__192) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__193, dtb__194) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__193) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__194))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__195, dtb__196) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__196)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__197, dtb__198, dtb__199) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__197) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__198))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__200, dtb__201, dtb__202) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__202)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__206) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__207))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__208) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__209) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__210, dtb__211) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__212) -> (dtb__212 = mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__213, dtb__214) -> (match dtb__213 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__215, dtb__216) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__215) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__214))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__217, dtb__218) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__217)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__218))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__219, dtb__220) -> (match dtb__219 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__221, dtb__222) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc1) dtb__222) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" [dtb__221; " body="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__222)]))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__220) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__223) -> (String.concat "" [" (in `"; dtb__223; "`)"])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__224, dtb__225, dtb__226) -> (if (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__224) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__225)) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__226))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__227) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__228) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__229) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__230, dtb__231) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__230) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__231))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__232, dtb__233) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__233)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__234, dtb__235, dtb__236) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__234) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__235))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__237, dtb__238, dtb__239) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__239)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__243) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__244))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__245) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__246) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__247, dtb__248) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__249) -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__250, dtb__251) -> (match dtb__250 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__252, dtb__253) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__252) then true else (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__254, dtb__255) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__254)) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__255))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__256, dtb__257) -> (match dtb__256 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__258, dtb__259, dtb__260, dtb__261) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__258) mc2) mc5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__261) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__258))) dtb__258)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__262) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__258) mc5) then ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__257) mc2) mc3) mc4) mc5) else ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc2) mc5) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc5) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__256, dtb__257))) dtb__258)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__262)) dtb__261)) (fun p -> ((fun _u -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__263, dtb__264) -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> ((fun ecNext2 -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__257) mc2) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, liftedTy)), mc3))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef (dtb__258, liftedTy, cleanTerm, (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__261)))), mc4))) ecNext2)) ((((v_Vuna_dCompiler_dElab_dDriver_dmemoizeDef mc0) ecWithDef) dtb__258) cleanTerm))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, cleanTerm))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) (((Base_dHashMap.v_Base_dHashMap_dinsert dtb__258) liftedTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta liftedBody) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody) else liftedBody))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf lifted))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__258) ec1b) dtb__262) bodyTerm1))) (Base_dPair.v_Base_dPair_dsecondOf solvedDecl))) (Base_dPair.v_Base_dPair_dfirstOf solvedDecl))) (((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals dtb__264) dtb__262) dtb__263))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine dtb__261))) ("FUN " ^ dtb__258)))))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine dtb__261))) ("DEF " ^ dtb__258))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__265, dtb__266, dtb__267) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__265) mc2) mc5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__267) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__265))) dtb__265)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__268) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__257) mc2) mc3) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtAxiom (dtb__265, dtb__268, (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__267)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__269, dtb__270, dtb__271, dtb__272) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__269) mc2) mc5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__272) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedSignature (dtb__269))) dtb__269)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__273) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy dtb__272) dtb__273)) (fun _u -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__257) mc2) mc3) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtExtern (dtb__269, dtb__273, dtb__270, (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__272)))), mc4))) mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__257) mc2) mc3) mc4) mc5)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc4), mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec defs -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__274) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__274) then (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__274), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))) else d)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (Base_dList.v_Base_dList_dlength (match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__275, dtb__276, dtb__277, dtb__278) -> dtb__278
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__279, dtb__280) -> (if ((match dtb__279 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__281, dtb__282, dtb__283, dtb__284) -> dtb__281
  | _ -> failwith "DT: impossible branch"
) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__279)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__280))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining stop sols relevant goals -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__285) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (Base_dMaybe.v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i stop sols relevant goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__286) -> ((fun detail -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedHole (detail))) (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (detail, Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))) (String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc (match dtb__286 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__287, dtb__288, dtb__289, dtb__290) -> dtb__288
  | _ -> failwith "DT: impossible branch"
)); " with goal "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__286)) (match dtb__286 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__291, dtb__292, dtb__293, dtb__294) -> dtb__293
  | _ -> failwith "DT: impossible branch"
))]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun num -> ((fun hint -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnsolvedMetavar (num, hint))) (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (num, (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (hint, Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux = (fun startEc startGlobals termAux decls -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dElab_dData.v_Vuna_dCompiler_dElab_dData_delabDatas ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) Base_dList.C_Base_dList_dList_Base_dList_dNil)) startGlobals) startEc)) (fun pd -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__295, dtb__296) -> (match dtb__296 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__297, dtb__298) -> ((fun ec0b -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabTraits ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) Base_dList.C_Base_dList_dList_Base_dList_dNil)) dtb__297) ec0b)) (fun pt -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__299, dtb__300) -> (match dtb__300 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__301, dtb__302) -> (match dtb__302 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__303, dtb__304) -> (match dtb__304 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__305, dtb__306) -> ((fun globals1 -> ((fun datas1 -> ((fun classesAll -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) Base_dList.C_Base_dList_dList_Base_dList_dNil)) classesAll) globals1) dtb__306)) (fun pih -> (match pih with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, dtb__308) -> ((fun globals2 -> ((fun future -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__308)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__309, dtb__310) -> ((fun ec2b -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__309) decls)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies future) decls) dtb__309) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) ec2b)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__311, dtb__312) -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies decls) classesAll) datas1) dtb__309) ec3)) (fun pi -> (match pi with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__313, dtb__314) -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__315) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInterpNoInstance (dtb__315))) dtb__315)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__316) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__316)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun extra -> ((fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage ec4) allDefs)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dTermination.v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((Base_dList.v_Base_dList_dappend termAux) decls))) (fun _u -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (datas1, allDefs, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec4), globalsOut, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefVals ec4), (Base_dIntMap.v_Base_dIntMap_dtoList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec4))))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "termination-done"))))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "extradefs-done"))) ((Base_dList.v_Base_dList_dmap (fun g -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup (Base_dPair.v_Base_dPair_dfirstOf g)) defsTblOut) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__317) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf g), dtb__317))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> g
  | _ -> failwith "DT: impossible branch"
))) dtb__309))) ((Base_dHashMap.v_Base_dHashMap_dinsertAll ((Base_dList.v_Base_dList_dmap (fun x -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName x), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType x))))) allDefs)) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((Base_dList.v_Base_dList_dappend instDefs) ((Base_dList.v_Base_dList_dappend extra) defs))))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf dtb__309) ec4) dtb__305) ((Base_dList.v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "instbodies-done"))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__313))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__309) dtb__314) 8))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp (String.concat "" ["bodies-done g="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__309)); " sols="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols dtb__312))); " defs="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__312))); " metas="; (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext dtb__312)); " dgoals="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals dtb__312))); " datas="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__312))); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__312))); " classes="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__312)))])))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__311))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__309) dtb__312) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "sigs-elab-done"))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__310) (Base_dHashMap.v_Base_dHashMap_dfromList dtb__309))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "instheads-done"))) ((v_Vuna_dCompiler_dElab_dDriver_dfutureBodyTbl decls) dtb__307))) ((Base_dList.v_Base_dList_dappend globals1) dtb__307))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "traits-done"))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__306))) ((Base_dList.v_Base_dList_dappend dtb__295) dtb__299))) ((Base_dList.v_Base_dList_dappend dtb__297) dtb__301))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "datas-done"))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__298) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__298))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "collectSigs-done")))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux = (fun startEc startGlobals termAux decls -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) decls)) (fun ds -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls termAux)) (fun ads -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ads)) (fun ads2 -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) ads2) ds2))))))))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith = (fun startEc startGlobals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux startEc) startGlobals) Base_dList.C_Base_dList_dList_Base_dList_dNil) decls))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith = (fun startEc startGlobals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) Base_dList.C_Base_dList_dList_Base_dList_dNil) decls))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> (((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun ds -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> (v_Vuna_dCompiler_dElab_dDriver_delabProgramGo ds2))))))

let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__318, dtb__319) -> (match dtb__318 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__320, dtb__321) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__320, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__320, dtb__321)), dtb__319))) 0) mc2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) dtb__321))))), (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__319) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (Base_dList.v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols g -> (C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo ((match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__322, dtb__323, dtb__324, dtb__325) -> dtb__323
  | _ -> failwith "DT: impossible branch"
), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__326, dtb__327, dtb__328, dtb__329) -> dtb__328
  | _ -> failwith "DT: impossible branch"
))), (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_Vuna_dCompiler_dElab_dTypes_dDtGoal (dtb__330, dtb__331, dtb__332, dtb__333) -> dtb__333
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))))))))

let rec v_Vuna_dCompiler_dElab_dDriver_daddDatasEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__334, dtb__335) -> ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData mc0) dtb__334)) dtb__335)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_daddInstsEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__336, dtb__337) -> ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__336)) dtb__337)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_daddClassesEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__338, dtb__339) -> ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass mc0) dtb__338)) dtb__339)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_decOfProgram = (fun prog -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> ((fun ec7 -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (ec7, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec6) (Base_dHashMap.v_Base_dHashMap_dfromList (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec5) (match prog with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_Vuna_dCompiler_dElab_dTypes_dDtProgram (dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349) -> dtb__347
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec4) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl ec3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty))
