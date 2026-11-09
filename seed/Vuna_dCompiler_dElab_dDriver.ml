open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder = C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_DeclDictBinder of (string) * (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dDriver_dDictSubst = C_Vuna_dCompiler_dElab_dDriver_dDictSubst_DictSubst of (int) * (string) * (int)
and t_Vuna_dCompiler_dElab_dDriver_dElabCore = C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_DtGoalInfo of (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) * (string) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string)

let rec v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then ((fun domVal -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__0) domVal) mc0)) dtb__4)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) dtb__3)) else mc0)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx = (fun ty0 -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty0))

let v_Vuna_dCompiler_dElab_dDriver_dsigDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, dtb__5, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) dtb__6) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder (v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2)) mc3) dtb__7) mc0)) dtb__8) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

let v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (mc2, mc1))))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc4) mc3)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses mc1)) mc0) (v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx mc2)) parts) mc4) mc1)) (fun q -> ((fun doms -> ((fun ec1 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts mc2) doms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)), ec1))))) (Base_dPair.v_Base_dPair_dsecondOf q))) (Base_dPair.v_Base_dPair_dfirstOf q))))))
))

let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (match dtb__9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__11, dtb__12) -> (match dtb__12 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__15, dtb__16) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__15)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__19, dtb__20) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders mc1) dtb__20) dtb__17) dtb__13) dtb__16)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__21, dtb__22) -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__10) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__11, sigTy)), mc1))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__22) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__11) sigTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__22)))) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__11, sigTy)), mc3)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__22) 0) dtb__21))
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
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dappend mc1) (Base_dList.v_Base_dList_dreverse mc3)), mc2))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun sigs globals ec -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf globals))) true)) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (if dtb__24 then ((fun domVal -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__23) domVal) mc1)) dtb__27) acc2)) (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc0) domVal) then (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_DeclDictBinder (dtb__23, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1), domVal)), mc3)) else mc3))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__26)) else (Base_dList.v_Base_dList_dreverse mc3))
  | _ -> (Base_dList.v_Base_dList_dreverse mc3)
))

let v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders = (fun ec ty -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo ec) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__28) -> true
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__29) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (((v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches mc0) (match dtb__30 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_DeclDictBinder (dtb__32, dtb__33, dtb__34) -> dtb__34
  | _ -> failwith "DT: impossible branch"
)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30)) else (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder mc0) dtb__31) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo = (fun ec binders goals kept acc -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match dtb__35 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraint_Constraint (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__39) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__43) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__36) (Base_dList.C_Base_dList_dList_Cons (dtb__35, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder ec) binders) dtb__40) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__36) (Base_dList.C_Base_dList_dList_Cons (dtb__35, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__44) -> ((fun q -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__39) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((match dtb__44 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_DeclDictBinder (dtb__45, dtb__46, dtb__47) -> dtb__45
  | _ -> failwith "DT: impossible branch"
), (match dtb__44 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_DeclDictBinder (dtb__48, dtb__49, dtb__50) -> dtb__49
  | _ -> failwith "DT: impossible branch"
), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__51) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__51))) binders) dtb__36) kept) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDriver_dDictSubst_DictSubst (dtb__39, (match dtb__44 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_DeclDictBinder (dtb__52, dtb__53, dtb__54) -> dtb__52
  | _ -> failwith "DT: impossible branch"
), q)), acc)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__55) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__36) (Base_dList.C_Base_dList_dList_Cons (dtb__35, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((match dtb__44 with
  | C_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_DeclDictBinder (dtb__56, dtb__57, dtb__58) -> dtb__57
  | _ -> failwith "DT: impossible branch"
) + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) (Base_dList.v_Base_dList_dreverse kept))))
  | _ -> failwith "DT: impossible branch"
)) goals))

let rec v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts dtb__60) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (match dtb__59 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_DictSubst (dtb__61, dtb__62, dtb__63) -> dtb__61
  | _ -> failwith "DT: impossible branch"
)) (match dtb__59 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_DictSubst (dtb__64, dtb__65, dtb__66) -> dtb__65
  | _ -> failwith "DT: impossible branch"
)) (match dtb__59 with
  | C_Vuna_dCompiler_dElab_dDriver_dDictSubst_DictSubst (dtb__67, dtb__68, dtb__69) -> dtb__69
  | _ -> failwith "DT: impossible branch"
)) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals = (fun ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (body, ec))
  | _ -> (match ((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders ec) ty) with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (body, ec))
  | dtb__70 -> ((fun solved -> (Base_dPair.C_Base_dPair_dPair_Pair (((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts (Base_dPair.v_Base_dPair_dfirstOf solved)) body), (Base_dPair.v_Base_dPair_dsecondOf solved)))) (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) dtb__70) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))
)
))

let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (match dtb__71 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__73, dtb__74, dtb__75, dtb__76) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__72) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__73) ((Base_dList.v_Base_dList_dappend cur) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__74, dtb__75)), Base_dList.C_Base_dList_dList_Nil)))) mc1))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__73) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> dtb__77
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__72) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun decls -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun ec decls name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (match ec with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> dtb__92
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> dtb__96
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun name ec -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), dtb__98))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun defs -> ((Base_dList.v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (match dtb__99 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__101, dtb__102, dtb__103, dtb__104) -> (Base_dList.C_Base_dList_dList_Cons (dtb__101, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__100)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__100)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (match dtb__105 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__107, dtb__108) -> (match dtb__108 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__109, dtb__110) -> (match dtb__110 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__111, dtb__112) -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__107) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__107) mc2) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__113) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AxiomWithDefinition (dtb__107))) dtb__107) else ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__106) mc1) mc2) mc3))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__107) mc2) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__107) mc1) then ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__106) mc1) mc2) mc3) else (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__107))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__107, Base_dVec.C_Base_dVec_dVec_Nil)))))) else (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__107))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__107, Base_dVec.C_Base_dVec_dVec_Nil))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl = (fun decls -> (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)))

let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__114 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__116, dtb__117, dtb__118) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__116, dtb__118)), (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__115)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__119, dtb__120, dtb__121, dtb__122) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__119, dtb__122)), (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__115)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__115)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl = (fun decls -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs decls)))

let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs globals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) globals))) (v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl decls)) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl decls)))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (match dtb__123 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__125, dtb__126, dtb__127, dtb__128) -> (if (dtb__125 = mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__124))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__124)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match dtb__129 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__131, dtb__132, dtb__133) -> (if (dtb__131 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__133)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__130))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__134, dtb__135, dtb__136, dtb__137) -> (if (dtb__134 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__130))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__130)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__138) -> (match dtb__138 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__139, dtb__140) -> (if (if (if (dtb__139 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__139 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__139 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (("Array " ^ dtb__139)))) dtb__139))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__141) -> (match dtb__141 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__142, dtb__143) -> (if (if (if (dtb__142 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__142 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__142 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (if (dtb__142 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match dtb__145 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem mc0) dtb__144)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__143) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (dtb__142))) dtb__142)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

let rec v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__147 then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) dtb__149)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__150) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__146, mc2, Base_dList.C_Base_dList_dList_Nil))))))))))
  | _ -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) mc3))
))

let v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy = (fun sp tyTerm -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue sp) 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)))

let rec v_Vuna_dCompiler_dElab_dDriver_dallReplCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__151)) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors dtb__152))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dreplShortName = (fun g -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot g))))

let v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm = (fun xs x -> ((Base_dList.v_Base_dList_dappend xs) (Base_dList.C_Base_dList_dList_Cons (x, Base_dList.C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dElab_dDriver_dspineOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__153, dtb__154, dtb__155) -> (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf dtb__153) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__156, dtb__157) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__156, ((v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm dtb__157) dtb__154)))
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__153, dtb__154, dtb__155)), Base_dList.C_Base_dList_dList_Nil))
)
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair (mc0, Base_dList.C_Base_dList_dList_Nil))
))

let v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName = "Base.Nat.Nat.Zero"

let v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName = "Base.Nat.Nat.Succ"

let rec v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (match dtb__160 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__162, dtb__163) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__158)) then ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__159) dtb__161) else (Base_dList.C_Base_dList_dList_Cons (dtb__162, ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__159) dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs = (fun ctors c args -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn c) ctors) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) args)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__164) -> ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__164)) args)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dreplNatValue = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__165, dtb__166) -> (if (dtb__165 = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0)) else (if (dtb__165 = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match dtb__168 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__167) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__169 + 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__165) dtb__166)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

let v_Vuna_dCompiler_dElab_dDriver_dreplListNilName = "Base.List.List.Nil"

let v_Vuna_dCompiler_dElab_dDriver_dreplListConsName = "Base.List.List.Cons"

let v_Vuna_dCompiler_dElab_dDriver_dreplPairName = "Base.Pair.Pair"

let v_Vuna_dCompiler_dElab_dDriver_dreplJustName = "Base.Maybe.Maybe.Just"

let v_Vuna_dCompiler_dElab_dDriver_dreplNothingName = "Base.Maybe.Maybe.Nothing"

let v_Vuna_dCompiler_dElab_dDriver_disReplAtom = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__170, dtb__171) -> (if (if (if (dtb__170 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then true else (dtb__170 = v_Vuna_dCompiler_dElab_dDriver_dreplPairName)) then true else (dtb__170 = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName)) then true else ((Base_dList.v_Base_dList_dlength (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs mc0) dtb__170) dtb__171)) = 0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__172) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__173) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__174) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__175, dtb__176) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__177) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__178) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__179) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__180) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__181, dtb__182) -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor (fuel - 1)) ctors) dtb__181) dtb__182)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__183, dtb__184, dtb__185) -> "<\229\135\189\230\149\176>"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__186) -> "_"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__187) -> (v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__187)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__188, dtb__189, dtb__190) -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplApp (fuel - 1)) ctors) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__188, dtb__189, dtb__190)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplApp = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf t) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__191, dtb__192) -> (match dtb__191 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__193) -> ((v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__193) ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) dtb__192))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor = (fun fuel ctors c args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun kept -> (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then "0" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__194, dtb__195) -> (match dtb__195 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__194) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__196) -> (bi_strFromInt (dtb__196 + 1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then "[]" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplList (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplPairName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplPair (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplJustName) then ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary (fuel - 1)) ctors) "Just") kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName) then "Nothing" else ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) (v_Vuna_dCompiler_dElab_dDriver_dreplShortName c)) kept))))))))) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) c) args))))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplList = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__197, dtb__198) -> (if (mc0 <= 0) then "[]" else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> (match dtb__200 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (mc0 - 1)) mc1) dtb__199) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__201) -> (String.concat "" ["["; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__197); dtb__201])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__197, (Base_dList.C_Base_dList_dList_Cons (dtb__199, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__197, dtb__198)))
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__197, dtb__198)))
)) dtb__198))
  | Base_dList.C_Base_dList_dList_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__202, dtb__203) -> (if (dtb__202 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("]")) else (if (dtb__202 = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__204, dtb__205) -> (match dtb__205 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__206, dtb__207) -> (match dtb__207 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (fuel - 1)) ctors) dtb__206) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__208) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__204); dtb__208])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__202) dtb__203)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplPair = (fun fuel ctors args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (match dtb__210 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (match dtb__212 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__209); ", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__211); ")"])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)) args)))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__213, dtb__214) -> (match dtb__214 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [label; " "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__213)])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)) args)))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else (label ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) args))))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (if (mc0 <= 0) then "" else (String.concat "" [" "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__215); (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (mc0 - 1)) mc1) dtb__216)]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArg = (fun fuel ctors t -> (if (fuel <= 0) then "<\229\128\188>" else (if ((v_Vuna_dCompiler_dElab_dDriver_disReplAtom ctors) t) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t) else (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t); ")"]))))

let v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl = (fun datas ec v -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm 512) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors datas)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) v))))

let rec v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__217, dtb__218, dtb__219) -> (v_Vuna_dCompiler_dElab_dDriver_danyInterpHasFloat dtb__218)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__220, dtb__221, dtb__222) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__220) then true else (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__221))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__223, dtb__224, dtb__225) -> (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__223)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__226, dtb__227, dtb__228) -> (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__227)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__229, dtb__230) -> false
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__231, dtb__232, dtb__233, dtb__234) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__232) then true else (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__233))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__235, dtb__236, dtb__237, dtb__238) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__236) then true else (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__237))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__239, dtb__240) -> (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__239)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__241, dtb__242) -> (v_Vuna_dCompiler_dElab_dDriver_danyDoHasFloat dtb__241)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__243, dtb__244, dtb__245) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__243) then true else (v_Vuna_dCompiler_dElab_dDriver_danyNamedHasFloat dtb__244))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__246, dtb__247, dtb__248) -> (v_Vuna_dCompiler_dElab_dDriver_danyNamedHasFloat dtb__247)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__249, dtb__250, dtb__251) -> (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__249)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__252, dtb__253, dtb__254, dtb__255) -> (if (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__252) then true else (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__253)) then true else (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__254))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__256, dtb__257, dtb__258) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__256) then true else (v_Vuna_dCompiler_dElab_dDriver_danyBindHasFloat dtb__257))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__259, dtb__260) -> (v_Vuna_dCompiler_dElab_dDriver_danyClauseHasFloat dtb__259)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__261, dtb__262, dtb__263, dtb__264) -> (if (v_Vuna_dCompiler_dElab_dDriver_danyBindHasFloat dtb__261) then true else (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__262))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__265, dtb__266, dtb__267, dtb__268, dtb__269, dtb__270) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__268) then true else (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__269))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__271, dtb__272, dtb__273) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__271) then true else (v_Vuna_dCompiler_dElab_dDriver_danyExprHasFloat dtb__272))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__274, dtb__275, dtb__276) -> (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__275)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__277, dtb__278) -> false
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__279, dtb__280) -> false
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__281, dtb__282) -> ((Base_dList.v_Base_dList_dmemName dtb__281) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatIntrinsicNames)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__283, dtb__284) -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyExprHasFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__285, dtb__286) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__285) then true else (v_Vuna_dCompiler_dElab_dDriver_danyExprHasFloat dtb__286))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyBindHasFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__287, dtb__288) -> (match dtb__287 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__289, dtb__290) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__290) then true else (v_Vuna_dCompiler_dElab_dDriver_danyBindHasFloat dtb__288))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyNamedHasFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__291, dtb__292) -> (match dtb__291 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__293, dtb__294) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__294) then true else (v_Vuna_dCompiler_dElab_dDriver_danyNamedHasFloat dtb__292))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyClauseHasFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__295, dtb__296) -> (match dtb__295 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__297, dtb__298) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__298) then true else (v_Vuna_dCompiler_dElab_dDriver_danyClauseHasFloat dtb__296))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyDoHasFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__299, dtb__300) -> (match dtb__299 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__301, dtb__302) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__301) then true else (v_Vuna_dCompiler_dElab_dDriver_danyDoHasFloat dtb__300))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__303, dtb__304, dtb__305) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__304) then true else (v_Vuna_dCompiler_dElab_dDriver_danyDoHasFloat dtb__300))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyInterpHasFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__306, dtb__307) -> (match dtb__306 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__308) -> (v_Vuna_dCompiler_dElab_dDriver_danyInterpHasFloat dtb__307)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__309) -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat dtb__309) then true else (v_Vuna_dCompiler_dElab_dDriver_danyInterpHasFloat dtb__307))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__310, dtb__311) -> (match dtb__310 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__312, dtb__313, dtb__314, dtb__315) -> (if (if (dtb__312 = "Base.Record.HasField") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__312) = "HasField")) then true else (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__311))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__311)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dshortRecordInfos = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__316, dtb__317) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (match dtb__316 with
  | Vuna_dCompiler_dElab_dRecords.C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323) -> dtb__318
  | _ -> failwith "DT: impossible branch"
)) = (match dtb__316 with
  | Vuna_dCompiler_dElab_dRecords.C_Vuna_dCompiler_dElab_dRecords_dRecordInfo_RecordInfo (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> dtb__324
  | _ -> failwith "DT: impossible branch"
)) then (Base_dList.C_Base_dList_dList_Cons (dtb__316, (v_Vuna_dCompiler_dElab_dDriver_dshortRecordInfos dtb__317))) else (v_Vuna_dCompiler_dElab_dDriver_dshortRecordInfos dtb__317))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls = (fun decls -> (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances (v_Vuna_dCompiler_dElab_dDriver_dshortRecordInfos (Base_dPair.v_Base_dPair_dfirstOf ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls (fun n -> n)) decls)))))

let rec v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__330, dtb__331) -> (match dtb__330 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__332, dtb__333, dtb__334, dtb__335) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__336, dtb__337) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__336) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__331))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__338, dtb__339, dtb__340) -> (match dtb__338 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__341, dtb__342) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__341) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__331))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__331)
)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__331)
)) dtb__333)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__331)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances = (fun globals decls -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance decls) then decls else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup "Base.Record.getField") globals) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__343) -> ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls decls) then ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls)) else decls)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo = (fun globals ec n -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) < (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec2) (n - 1)) else ec2))) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))

let v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals ec n -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> ec
  | _ -> (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec) n)
))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore = (fun prog expr -> (match prog with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> ((fun bodies -> ((fun ec0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__348) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__354, dtb__355) -> (match dtb__355 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__356, dtb__357) -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__358) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__359) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__359) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__358))) dtb__358)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__358))) dtb__358)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__351) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__360) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedMetavarInfer ((bi_strFromInt dtb__360)))) (bi_strFromInt dtb__360))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__354)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__361) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((bi_strFromInt dtb__361), tyText))))
  | dtb__362 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl dtb__344) ec2) dtb__362), tyText))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec2) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__356)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__348) dtb__357) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dEc_Ec (dtb__351, dtb__347, (Base_dList.v_Base_dList_dreverse bodies), dtb__344, Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__349), dtb__350, Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dcsEmpty, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies), (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__348), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__347), ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil), true, ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__344), dtb__352, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__344))))) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__345))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun prog expr -> (if (v_Vuna_dCompiler_dElab_dDriver_dexprHasFloat expr) then (Base_dResult.C_Base_dResult_dResult_Err ("vuna interp: Float is not supported by the interpreter (use vuna compile / vuna run; see docs/reference/floats.md)")) else ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore prog) expr)))

let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog expr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.v_Base_dPair_dfirstOf p))))))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__363, dtb__364, dtb__365) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__363) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__364)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__365))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__366) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__367) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__368) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__369) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__370, dtb__371) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__370) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__371))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__372, dtb__373) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__373)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__374, dtb__375, dtb__376) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__374) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__375))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__377, dtb__378, dtb__379) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__379)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__380, dtb__381, dtb__382, dtb__383, dtb__384) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__383) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__384))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__385) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__386) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__387, dtb__388) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__389) -> (dtb__389 = mc0)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__390, dtb__391) -> (match dtb__390 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__392, dtb__393) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__392) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__391))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__394, dtb__395) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__394)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__395))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__396, dtb__397) -> (match dtb__396 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__398, dtb__399) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc1) dtb__399) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [dtb__398; " body="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__399)]))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__397) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__400) -> (String.concat "" [" (in `"; dtb__400; "`)"])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__401, dtb__402, dtb__403) -> (if (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__401) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__402)) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__403))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__404) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__405) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__406) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__407) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__408, dtb__409) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__408) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__409))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__410, dtb__411) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__411)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__412, dtb__413, dtb__414) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__412) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__413))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__415, dtb__416, dtb__417) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__417)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__418, dtb__419, dtb__420, dtb__421, dtb__422) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__421) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__422))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__423) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__424) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__425, dtb__426) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__427) -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__428, dtb__429) -> (match dtb__428 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__430, dtb__431) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__430) then true else (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__429))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__432, dtb__433) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__432)) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__433))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__434, dtb__435) -> (match dtb__434 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__436, dtb__437, dtb__438, dtb__439) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__436) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__439) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__436))) dtb__436)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__440) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__436) mc4) then (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__435) mc1) mc2) mc3) mc4) else ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc1) mc4) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__434, dtb__435))) dtb__436)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__440)) dtb__439)) (fun p -> ((fun _u -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__441, dtb__442) -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__435) mc1) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__436, liftedTy)), mc2))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__436, liftedTy, cleanTerm, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__439)))), mc3))) ecWithDef)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) (Base_dPair.C_Base_dPair_dPair_Pair (dtb__436, cleanTerm))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__436) liftedTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta liftedBody) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody) else liftedBody))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf lifted))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__436) ec1b) dtb__440) bodyTerm1))) (Base_dPair.v_Base_dPair_dsecondOf solvedDecl))) (Base_dPair.v_Base_dPair_dfirstOf solvedDecl))) (((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals dtb__442) dtb__440) dtb__441))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine dtb__439))) ("FUN " ^ dtb__436)))))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine dtb__439))) ("DEF " ^ dtb__436))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__443, dtb__444, dtb__445) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__443) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__445) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__443))) dtb__443)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__446) -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__435) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__443, dtb__446, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__445)))), mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__447, dtb__448, dtb__449, dtb__450) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__447) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__450) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__447))) dtb__447)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__451) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy dtb__450) dtb__451)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__435) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__447, dtb__451, dtb__448, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__450)))), mc3))) mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__435) mc1) mc2) mc3) mc4)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc3), mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec defs -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__452) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__452) then (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__452), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))) else d)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux = (fun startEc startGlobals decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dElab_dData.v_Vuna_dCompiler_dElab_dData_delabDatas ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) Base_dList.C_Base_dList_dList_Nil)) startGlobals) startEc)) (fun pd -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__453, dtb__454) -> (match dtb__454 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__455, dtb__456) -> ((fun ec0b -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabTraits ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) Base_dList.C_Base_dList_dList_Nil)) dtb__455) ec0b)) (fun pt -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__457, dtb__458) -> (match dtb__458 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__459, dtb__460) -> (match dtb__460 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__461, dtb__462) -> (match dtb__462 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__463, dtb__464) -> ((fun globals1 -> ((fun datas1 -> ((fun classesAll -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) Base_dList.C_Base_dList_dList_Nil)) classesAll) globals1) dtb__464)) (fun pih -> (match pih with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__465, dtb__466) -> ((fun globals2 -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__466)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__467, dtb__468) -> ((fun ec2b -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__467) decls)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies decls) dtb__467) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) ec2b)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__469, dtb__470) -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies decls) classesAll) datas1) dtb__467) ec3)) (fun pi -> (match pi with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__471, dtb__472) -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (datas1, ec4, defs, instDefs, dtb__467, dtb__463))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "instbodies-done"))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__471))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__467) dtb__472) 8))
  | _ -> failwith "DT: impossible branch"
)))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsAudit dtb__470) then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "inst-index=ok") else (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote "inst-index=MISMATCH")) else 0))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp (String.concat "" ["bodies-done g="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__467)); " sols="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols dtb__470))); " defs="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__470))); " metas="; (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext dtb__470)); " dgoals="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending dtb__470))); " datas="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__470))); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__470))); " classes="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__470)))])))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__469))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__467) dtb__470) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "sigs-elab-done"))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__468) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__467))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "instheads-done"))) ((Base_dList.v_Base_dList_dappend globals1) dtb__465))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "traits-done"))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__464))) ((Base_dList.v_Base_dList_dappend dtb__453) dtb__457))) ((Base_dList.v_Base_dList_dappend dtb__455) dtb__459))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "datas-done"))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__456) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__456))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "collectSigs-done")))))

let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (Base_dList.v_Base_dList_dlength (match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__473, dtb__474, dtb__475, dtb__476, dtb__477) -> dtb__476
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__478, dtb__479) -> (if ((match dtb__478 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__480, dtb__481, dtb__482, dtb__483, dtb__484) -> dtb__480
  | _ -> failwith "DT: impossible branch"
) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__478)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__479))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining stop sols relevant goals -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__485) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (Base_dMaybe.v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i stop sols relevant goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__486) -> ((fun loc -> ((fun spot -> ((fun detail -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedHole (detail))) (Base_dVec.C_Base_dVec_dVec_Cons (detail, Base_dVec.C_Base_dVec_dVec_Nil)))) (String.concat "" [spot; " with goal "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__486)) (match dtb__486 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__487, dtb__488, dtb__489, dtb__490, dtb__491) -> dtb__489
  | _ -> failwith "DT: impossible branch"
))]))) (if ((match dtb__486 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__492, dtb__493, dtb__494, dtb__495, dtb__496) -> dtb__496
  | _ -> failwith "DT: impossible branch"
) = "") then loc else (String.concat "" [(match dtb__486 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__497, dtb__498, dtb__499, dtb__500, dtb__501) -> dtb__501
  | _ -> failwith "DT: impossible branch"
); " ("; loc; ")"])))) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc (match dtb__486 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> dtb__503
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun num -> ((fun hint -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedMetavar (num, hint))) (Base_dVec.C_Base_dVec_dVec_Cons (num, (Base_dVec.C_Base_dVec_dVec_Cons (hint, Base_dVec.C_Base_dVec_dVec_Nil)))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dfinishCore = (fun termAux decls core -> ((fun ec4 -> ((fun datas1 -> ((fun defs -> ((fun instDefs -> ((fun globals -> ((fun projSpans -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__507) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__508) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__508) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__507))) dtb__507)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__507))) dtb__507)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__509) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__510) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__510) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__509))) dtb__509)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__509))) dtb__509)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__511) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__512) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__513) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__513) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__512))) dtb__512)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__512))) dtb__512)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__511)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun extra -> ((fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage ec4) allDefs)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTermination.v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((Base_dList.v_Base_dList_dappend termAux) decls))) (fun _u -> ((fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (datas1, allDefs, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec4), globalsOut, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec4), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefVals ec4), ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dInt.v_Eq_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec4))))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "termination-done"))))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "extradefs-done"))) ((Base_dList.v_Base_dList_dmap (fun g -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf g)) defsTblOut) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__514) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf g), dtb__514))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> g
  | _ -> failwith "DT: impossible branch"
))) globals))) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun x -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName x), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType x))))) allDefs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((Base_dList.v_Base_dList_dappend instDefs) ((Base_dList.v_Base_dList_dappend extra) defs))))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf globals) ec4) projSpans) ((Base_dList.v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__515, dtb__516, dtb__517, dtb__518, dtb__519, dtb__520) -> dtb__520
  | _ -> failwith "DT: impossible branch"
))) (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526) -> dtb__525
  | _ -> failwith "DT: impossible branch"
))) (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__527, dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> dtb__530
  | _ -> failwith "DT: impossible branch"
))) (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538) -> dtb__535
  | _ -> failwith "DT: impossible branch"
))) (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__539, dtb__540, dtb__541, dtb__542, dtb__543, dtb__544) -> dtb__539
  | _ -> failwith "DT: impossible branch"
))) (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__545, dtb__546, dtb__547, dtb__548, dtb__549, dtb__550) -> dtb__546
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux = (fun startEc startGlobals termAux decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux startEc) startGlobals) decls)) (fun core -> (((v_Vuna_dCompiler_dElab_dDriver_dfinishCore termAux) decls) core))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux = (fun startEc startGlobals termAux decls -> ((fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) decls2)) (fun ds -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls termAux)) (fun ads -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ads)) (fun ads2 -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) ads2) ds2)))))))))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls)))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith = (fun startEc startGlobals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux startEc) startGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith = (fun startEc startGlobals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> (((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls))

let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls2)) (fun ds -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> (v_Vuna_dCompiler_dElab_dDriver_delabProgramGo ds2)))))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls)))

let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__551, dtb__552) -> (match dtb__551 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__553, dtb__554) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__553, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__553, dtb__554)), dtb__552))) 0) mc2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) dtb__554))))), (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__552) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (Base_dList.v_Base_dList_dlength items)))

let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols g -> (C_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_DtGoalInfo ((match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__555, dtb__556, dtb__557, dtb__558, dtb__559) -> dtb__556
  | _ -> failwith "DT: impossible branch"
), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__560, dtb__561, dtb__562, dtb__563, dtb__564) -> dtb__562
  | _ -> failwith "DT: impossible branch"
))), (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> dtb__568
  | _ -> failwith "DT: impossible branch"
)), (match g with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtGoal_DtGoal (dtb__570, dtb__571, dtb__572, dtb__573, dtb__574) -> dtb__574
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun ds -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings ds)) (fun ds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) ds2)) (fun core -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__575, dtb__576, dtb__577, dtb__578, dtb__579, dtb__580) -> dtb__576
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals (match core with
  | C_Vuna_dCompiler_dElab_dDriver_dElabCore_ElabCore (dtb__581, dtb__582, dtb__583, dtb__584, dtb__585, dtb__586) -> dtb__582
  | _ -> failwith "DT: impossible branch"
))))))))))))

let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))))))))

let rec v_Vuna_dCompiler_dElab_dDriver_daddDatasEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__587, dtb__588) -> ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData mc0) dtb__587)) dtb__588)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_daddInstsEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__589, dtb__590) -> ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__589)) dtb__590)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDriver_daddClassesEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__591, dtb__592) -> ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass mc0) dtb__591)) dtb__592)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDriver_decOfProgram = (fun prog -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> ((fun ec7 -> (Base_dPair.C_Base_dPair_dPair_Pair (ec7, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec6) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec5) (match prog with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtProgram_DtProgram (dtb__593, dtb__594, dtb__595, dtb__596, dtb__597, dtb__598, dtb__599, dtb__600, dtb__601, dtb__602) -> dtb__600
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec4) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl ec3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty))
