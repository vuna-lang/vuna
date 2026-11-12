open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTrait_dInstSigInfo = { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass : string; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup = { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep : int; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras : int Base_dList.t_Base_dList_dList }

let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__2) dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig (fun nm -> (Base_dMaybe.v_Base_dMaybe_disJust ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup nm) mc1)))) dtb__7) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__7)))) (fun p -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (match dtb__9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo mc0) mc1) dtb__11) dtb__5) (Base_dList.C_Base_dList_dList_Cons (dtb__8, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals ec paramsKinds methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx)) ec) methods) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__12)) dtb__13)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__14), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__15) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf dtb__16) mc1), ((v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds dtb__17) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__20; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__21 } -> (Base_dList.C_Base_dList_dList_Cons (dtb__20, (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (match dtb__22 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__24; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__25 } -> (match dtb__25 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit mc0) mc1) dtb__26) dtb__23) mc3)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer mc0) mc1) dtb__24) dtb__23) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit = (fun globals ec kexpr rest methods -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) kexpr)) (fun pk -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__28 } -> (match dtb__28 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__30 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) dtb__30) rest) methods)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__31; Base_dPair.f_Base_dPair_dPair_second = dtb__32 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__31)); Base_dPair.f_Base_dPair_dPair_second = dtb__32 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer = (fun globals ec pname rest methods -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) ec) rest) methods)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__33; Base_dPair.f_Base_dPair_dPair_second = dtb__34 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods), dtb__33)); Base_dPair.f_Base_dPair_dPair_second = dtb__34 }))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match dtb__35 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = dtb__38 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__37, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__38, ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis dtb__36) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__39, mc1, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs dtb__40) (mc1 - 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf = (fun dname params -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dname))) ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs params) ((Base_dList.v_Base_dList_dlength params) - 1))))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__41); Base_dPair.f_Base_dPair_dPair_second = (dtb__41).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType }, (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__42)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjType = (fun tname params pKinds methodTy -> ((fun dictPi -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis ((Base_dList.v_Base_dList_dzip params) pKinds)) dictPi)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname)) params), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) methodTy)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (match dtb__43 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = dtb__46 } -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjType mc0) mc1) mc2) dtb__47) }, ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) (mc3 + 1)) dtb__44) dtb__48)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname params pKinds methods fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) params) pKinds) 0) methods) fieldTys))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__49, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams dtb__50) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames = (fun n -> (if (n = 1) then (Base_dList.C_Base_dList_dList_Cons ("_p", Base_dList.C_Base_dList_dList_Nil)) else ((Base_dList.v_Base_dList_dmap (fun i -> ("_p" ^ ((Base_dInterp.v_Base_dInterp_dinterp (Base_dInterp.v_Interp_ua Base_dInt.v_Show_uInt)) i)))) ((Base_dList.v_Base_dList_drange 0) n))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque = (fun fieldOpaque ctor fieldIdx rigs nFields nParams -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied0 -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams (v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames nParams)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_d", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, lamArgs)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("_d", dictIdx, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), (Base_dList.C_Base_dList_dList_Cons (alt, Base_dList.C_Base_dList_dList_Nil)))))) { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ctor; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = binders; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = applied })) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) (if fieldOpaque then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (((nFields - 1) - fieldIdx), Base_dList.C_Base_dList_dList_Nil))) applied0) else applied0))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((nFields - 1) - fieldIdx), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })))) arity)) (Base_dList.v_Base_dList_dlength rigs)))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor fieldIdx rigs nFields nParams -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque false) ctor) fieldIdx) rigs) nFields) nParams))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> (if dtb__52 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__55) else (1 + (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__55)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dflagAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (if (mc0 <= 0) then dtb__56 else ((v_Vuna_dCompiler_dElab_dTrait_dflagAt (mc0 - 1)) dtb__57))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (match dtb__58 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__61 } -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque ((v_Vuna_dCompiler_dElab_dTrait_dflagAt mc5) mc0)) mc1) mc5) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__62)) mc6) mc2) }, (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo mc0) mc1) mc2) dtb__59) dtb__63) (mc5 + 1)) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque = (fun flags tname nParams methods fieldTys nFields -> (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo flags) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) nParams) methods) fieldTys) 0) nFields))

let v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal = (fun globals ec tname paramNames methods methodsP pKinds fieldTys -> ((fun paramsKinds -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun fieldCtx -> ((fun opaqueFields -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dd; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = projs; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = cls; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = projSpans; Base_dPair.f_Base_dPair_dPair_second = ec3 } } } }))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData ec) dd)) cls))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = tname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = paramNames; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = projs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = fieldTys })) ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque opaqueFields) tname) (Base_dList.v_Base_dList_dlength paramNames)) methodsP) fieldTys) (Base_dList.v_Base_dList_dlength methods)))) ((Base_dList.v_Base_dList_dmap (fun t -> (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec) fieldCtx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv fieldCtx)) t)))) fieldTys))) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m) })) methods))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections tname) paramNames) pKinds) methodsP) fieldTys))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = cname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = ctorTy; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = false; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = false })) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys fieldTys) dapp)))) ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf dname) paramNames))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds)))

let v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds = (fun globals ec tname params methods methodsP pKinds -> ((fun paramNames -> ((fun paramsKinds -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) paramsKinds) methodsP)) (fun p -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal globals) (Base_dPair.v_Base_dPair_dsecondOf p)) tname) paramNames) methods) methodsP) pKinds) (Base_dPair.v_Base_dPair_dfirstOf p))))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds))) (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames params)))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__64; Base_dPair.f_Base_dPair_dPair_second = dtb__65 } -> (match dtb__64 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__66, dtb__67, dtb__68, dtb__69) -> (if ((Base_dList.v_Base_dList_dlength dtb__67) = 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__69) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterfaceNoParam) else ((fun methodsP -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds mc0) mc1) dtb__67) methodsP)) (fun pk -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds mc0) (Base_dPair.v_Base_dPair_dsecondOf pk)) dtb__66) dtb__67) dtb__68) methodsP) (Base_dPair.v_Base_dPair_dfirstOf pk))))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__68)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__65) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname nParams methods fieldTys nFields -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque ((Base_dList.v_Base_dList_dmap (fun _u -> false)) fieldTys)) tname) nParams) methods) fieldTys) nFields))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun ctor nParams methods fieldTys idx nFields -> (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo ((Base_dList.v_Base_dList_dmap (fun _u -> false)) fieldTys)) ctor) nParams) methods) fieldTys) idx) nFields))

let v_Vuna_dCompiler_dElab_dTrait_ddeclTopName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__70, dtb__71, dtb__72, dtb__73) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (match dtb__91 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__93; Base_dPair.f_Base_dPair_dPair_second = dtb__94 } -> (match (v_Vuna_dCompiler_dElab_dTrait_ddeclTopName dtb__93) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> (if (if (dtb__95 = mc1) then ((dtb__94).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = mc2) else false) then true else (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__92) mc1) mc2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__92) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__96, dtb__97, dtb__98) -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__96)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__99, dtb__100) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (match (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__101) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103) -> (Base_dList.C_Base_dList_dList_Cons (dtb__103, (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__102)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__102)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType = (fun n -> (if (if (if (if (n = "Int") then true else (n = "String")) then true else (n = "Float")) then true else (n = "Array")) then true else (n = "IORef")))

let rec v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile mc0) dtb__104) mc2) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile mc0) dtb__105) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if (v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType dtb__106) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead dtb__107))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__108, dtb__109, dtb__110) -> (match dtb__108 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__111, dtb__112) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__111; Base_dPair.f_Base_dPair_dPair_second = dtb__109 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__113, dtb__114) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__113; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames = (fun headExpr -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> (match dtb__115 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__116; Base_dPair.f_Base_dPair_dPair_second = dtb__117 } -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__117)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk = (fun allDecls sp cls headExpr -> ((fun file -> ((fun headNames -> (if (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile allDecls) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) file) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile allDecls) headNames) file)) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead headNames))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames headExpr))) (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__118, dtb__119) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__120, dtb__121, dtb__122) -> (match dtb__120 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__123, dtb__124) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__121 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__125) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc0) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__126)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__127, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__128; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__129; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__130; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__131; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__132 } -> dtb__128
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__133; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__134; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__135; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__136; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__137 } -> dtb__134
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__138; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__139; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__140; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__141; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__142 } -> dtb__140
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__143; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__144; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__145; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__146; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__147 } -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__148; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__149; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__150; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__151; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__152 } -> dtb__152
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind mc0) mc1) mc2) dtb__153) dtb__155) mc5)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__157; Base_dPair.f_Base_dPair_dPair_second = dtb__158 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc0) mc1) dtb__158) dtb__154) dtb__156) mc5)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__159; Base_dPair.f_Base_dPair_dPair_second = dtb__160 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__157, dtb__159)); Base_dPair.f_Base_dPair_dPair_second = dtb__160 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__161, dtb__162, dtb__163) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__161) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__164) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__162) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__164) dtb__165)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__166, dtb__167) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__166))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__168) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__169) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__171))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__172, dtb__173) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__172) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms dtb__173) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__175) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__174, dtb__175))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (if (dtb__176 >= 97) then (dtb__176 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dseedKindOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (match dtb__178 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__180; Base_dPair.f_Base_dPair_dPair_second = dtb__181 } -> (if (dtb__180 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181)) else ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf mc0) dtb__179))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf dtb__182) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__183) mc1) mc2) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__185; Base_dPair.f_Base_dPair_dPair_second = dtb__186 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__184 }, dtb__185)); Base_dPair.f_Base_dPair_dPair_second = dtb__186 }
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> (match dtb__187 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__189) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__183) mc1) dtb__188) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__190; Base_dPair.f_Base_dPair_dPair_second = dtb__191 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__189)) }, dtb__190)); Base_dPair.f_Base_dPair_dPair_second = dtb__191 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__183) mc1) dtb__188) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__187 }, dtb__192)); Base_dPair.f_Base_dPair_dPair_second = dtb__193 }
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__194, dtb__195) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (match dtb__194 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__198, dtb__199) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__198) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__198; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__196) }, ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__195) dtb__197))) else ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__195) dtb__197))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__195) dtb__197)
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind = (fun combined v -> ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_darityFun ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

let v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__200) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__200) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__201) -> ((fun q -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) q) then ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1) else q)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__201))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__202, dtb__203) -> (match dtb__202 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__204; Base_dPair.f_Base_dPair_dPair_second = dtb__205 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__204; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind mc0) dtb__204) dtb__205) mc2) }, (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds mc0) dtb__203) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__206, dtb__207, dtb__208) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__206)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__207))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__212)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__213))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__215, dtb__216, dtb__217) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__215)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__216))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__218, dtb__219) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__218) then (Base_dList.C_Base_dList_dList_Cons (dtb__218, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTrait_duniqNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (if ((Base_dList.v_Base_dList_dmemName dtb__220) dtb__221) then (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__221) else (Base_dList.C_Base_dList_dList_Cons (dtb__220, (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__221))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__222) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__223) else (Base_dList.C_Base_dList_dList_Cons (dtb__222, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__223))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas = (fun banned combined exprs seeds ec -> (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit (v_Vuna_dCompiler_dElab_dTrait_duniqNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))) seeds) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__224, dtb__225) -> (match dtb__224 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__226; Base_dPair.f_Base_dPair_dPair_second = dtb__227 } -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__225) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__226) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__227)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__228))) mc0)) dtb__229) (mc2 + 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__230, dtb__231) -> (match dtb__230 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__232; Base_dPair.f_Base_dPair_dPair_second = dtb__233 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__232, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__231)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body remaining k -> (if (remaining <= 0) then body else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (remaining - 1)) (k + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body nCtx k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (nCtx - k)) k))

let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info ctor fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (ctor, ((Base_dList.v_Base_dList_dmap (fun t -> { Base_dPair.f_Base_dPair_dPair_first = t; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega })) fields)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__234), mc0))) dtb__235) (mc2 - 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__236, dtb__237) -> (match dtb__236 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__238; Base_dPair.f_Base_dPair_dPair_second = dtb__239 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__238, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__239, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__237)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) (nCtx - 1)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__240, dtb__241) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__240))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__242, dtb__243, dtb__244) -> (match dtb__243 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__245)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (match dtb__247 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__249, dtb__250, dtb__251, dtb__252) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__249)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__248) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__249)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__248)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf m)))) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods)) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__253, dtb__254) -> (match dtb__253 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__255, dtb__256, dtb__257, dtb__258) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__255) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__254))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__254)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__259, dtb__260) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__259))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__260) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__259))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__261, dtb__262) -> (match dtb__261 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__263; Base_dPair.f_Base_dPair_dPair_second = dtb__264 } -> (match dtb__263 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__265, dtb__266, dtb__267, dtb__268) -> (if (dtb__265 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__262))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__262)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__269, dtb__270) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__269) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__269))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__270))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cname mname decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__271) -> (match dtb__271 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__272, dtb__273, dtb__274, dtb__275) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__274)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl cname) decls)))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) ((Base_dList.v_Base_dList_dmap (fun a -> { Base_dPair.f_Base_dPair_dPair_first = a; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 })) args)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__276, dtb__277) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__276) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__276)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__277))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__278, dtb__279) -> (match dtb__278 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__280) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__279)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__282) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc1) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__282)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__279)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__283) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__281) dtb__283)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__279))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__284, dtb__285) -> (match dtb__284 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__286; Base_dPair.f_Base_dPair_dPair_second = dtb__287 } -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__286) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc4) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownInterface (dtb__286))) dtb__286)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__288)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__289) -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength dtb__289) <> (Base_dList.v_Base_dList_dlength dtb__287)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc1) mc2) mc5) dtb__287) dtb__289) mc4)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__290; Base_dPair.f_Base_dPair_dPair_second = dtb__291 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains mc0) mc1) mc2) dtb__285) mc4) dtb__291)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__292; Base_dPair.f_Base_dPair_dPair_second = dtb__293 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__288) dtb__290), dtb__292)); Base_dPair.f_Base_dPair_dPair_second = dtb__293 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["constraint-dom: "; dtb__286; " args="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__287)); " kinds="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__289))])) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes globals defined ec0 sp cls argExprs ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun kindMaybe -> (match kindMaybe with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__294) -> (if ((Base_dList.v_Base_dList_dlength dtb__294) <> (Base_dList.v_Base_dList_dlength argExprs)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((fun seeds -> ((fun init -> ((fun tele0 -> ((fun ec1 -> ((fun teleCtx0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__294) sp)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__295; Base_dPair.f_Base_dPair_dPair_second = dtb__296 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__296)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__297; Base_dPair.f_Base_dPair_dPair_second = dtb__298 } -> ((fun tele -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls); f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = tele; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__297; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__295; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__295) }; Base_dPair.f_Base_dPair_dPair_second = dtb__298 }))) (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds combined) tele0) dtb__298))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele0))) (Base_dPair.v_Base_dPair_dsecondOf init))) (Base_dPair.v_Base_dPair_dfirstOf init))) (((((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas banned) combined) ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs)) seeds) ec0))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds argExprs) dtb__294)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds classes) ec0) ctxParts))))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)), Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("#inst", sp)), ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs), sp)))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((Base_dList.v_Base_dList_dconcatMap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) ctxParts)))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes globals defined ec0 sp headExpr ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__299) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (Base_dPair.v_Base_dPair_dfirstOf dtb__299)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownInterface ((Base_dPair.v_Base_dPair_dfirstOf dtb__299)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__299))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__300) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__299) with
  | dtb__301 -> (if ((Base_dList.v_Base_dList_dlength dtb__301) <> (Base_dList.v_Base_dList_dlength (dtb__300).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__300) dtb__301) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__302, dtb__303) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__304, dtb__305) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__302); Base_dPair.f_Base_dPair_dPair_second = dtb__304 }, ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__303) dtb__305)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstArgAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__306, dtb__307) -> (if (mc0 <= 0) then dtb__306 else ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt (mc0 - 1)) dtb__307))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__308, dtb__309, dtb__310) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__308), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__309), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__310)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__311, dtb__312) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__311), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt mc0) mc1) mc2) alt))) dtb__312)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__313, dtb__314) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__313, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__314)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__315, dtb__316) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__315, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__316)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__317, dtb__318, dtb__319) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__317), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__318), dtb__319))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__320, dtb__321, dtb__322) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__320, dtb__321, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__322)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__323, dtb__324, dtb__325, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__326), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__327)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__328, dtb__329, dtb__330) -> (if (dtb__329 >= mc2) then (if ((dtb__329 - mc2) < mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt ((mc0 - 1) - (dtb__329 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__331; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__332; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__333 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__331; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__332; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__332))) dtb__333) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams = (fun args t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo (Base_dList.v_Base_dList_dlength args)) args) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__334, dtb__335) -> (match dtb__334 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__336, dtb__337, dtb__338, dtb__339) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__336) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__335) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__337; Base_dPair.f_Base_dPair_dPair_second = dtb__338 }, mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__335) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__335) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__340) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__341) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__342, dtb__343) -> (if (mc4 >= mc1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__342 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__344; Base_dPair.f_Base_dPair_dPair_second = dtb__345 } -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__345)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__343))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx nCtx dom ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__346, dtb__347) -> (match dtb__346 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__348; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__349; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__350; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__351; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__352; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__353 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__350) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__354) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__347) mc4) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__351) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__347) (Base_dList.C_Base_dList_dList_Cons (dtb__346, mc4))) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__355) -> ((fun k -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__350) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) - mc1) + k), Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__356) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__356))) dtb__347) mc4) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__350; Base_dPair.f_Base_dPair_dPair_second = k }, mc5)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__357) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__347) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__355))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc2) (Base_dList.v_Base_dList_dreverse mc4)) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx nCtx nTele ec acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) acc))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__358, dtb__359) -> (match dtb__358 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__360; Base_dPair.f_Base_dPair_dPair_second = dtb__361 } -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__359) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__360) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__361)) ((dtb__361 - mc0) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__362, dtb__363) -> (match dtb__362 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__364; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__365; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__366; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__367; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__368; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__369 } -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__367) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__370) -> (match dtb__370 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__371; Base_dPair.f_Base_dPair_dPair_second = dtb__372 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__372)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__372)) 0) dtb__366) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__371)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__373) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__363) mc4) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = dtb__371 }, mc5))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__372) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__373)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__374) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__363) mc4) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = dtb__371 }, mc5))) dtb__372)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__375) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceContextMissing ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__367)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__367))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__367) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__363) (Base_dList.C_Base_dList_dList_Cons (dtb__362, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc6) (Base_dList.v_Base_dList_dreverse mc4)) }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals ctx sp goals acc ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) Base_dList.C_Base_dList_dList_Nil) acc) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__376, dtb__377, dtb__378) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__376), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__377), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__378)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__379, dtb__380) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__379), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__380)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__381, dtb__382) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__381, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__382)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__383, dtb__384) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__383, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__384)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__385, dtb__386) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__385, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__386)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__387, dtb__388, dtb__389) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__387), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__388), dtb__389))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__390, dtb__391, dtb__392) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__390, dtb__391, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__392)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__393, dtb__394, dtb__395, dtb__396, dtb__397) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__393, dtb__394, dtb__395, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__396), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__397)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__398) -> (if (dtb__398 = mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__399; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__400; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__401 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__399; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__400; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__400))) dtb__401) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m rep t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__402, dtb__403) -> (match dtb__402 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__404; Base_dPair.f_Base_dPair_dPair_second = dtb__405 } -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__403) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__404) dtb__405) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__406, dtb__407) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (Base_dPair.v_Base_dPair_dsecondOf dtb__406))
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__408) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__409) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__410, dtb__411) -> (match dtb__410 with
  | { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__412; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__413; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__414 } -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__413) mc2) then (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__412; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__413; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__414)) }, dtb__411)) else (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__412; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__413; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__414 }, ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__411))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = mc1; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = mc2; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = Base_dList.C_Base_dList_dList_Nil }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__415, dtb__416) -> (match dtb__415 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__417; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__418; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__419; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__420; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__421; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__422 } -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__420) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__419) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__423) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__416) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__416) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__419) dtb__420) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__416) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__424, dtb__425, dtb__426, dtb__427, dtb__428) -> (if dtb__425 then (1 + (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__428)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec name level m -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__429) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__429))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__430) -> ec
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__431, dtb__432) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__432) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__431) mc0) mc1) mc3))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__433, dtb__434) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__433)) mc1) mc2) dtb__434)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n x xs -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dtake n) xs)) (Base_dList.C_Base_dList_dList_Cons (x, Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_ddrop n) xs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel defName dName appPos depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__435, dtb__436, dtb__437) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__435, dtb__436, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__437)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__438, dtb__439, dtb__440, dtb__441, dtb__442) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__438, dtb__439, dtb__440, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__441), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__442)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__443, dtb__444, dtb__445) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__443), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__444), dtb__445))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__446) -> (match dtb__446 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__447; Base_dPair.f_Base_dPair_dPair_second = dtb__448 } -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__447) dtb__448)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__449, dtb__450) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__449, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__450)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__451, dtb__452) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__451, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__452)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__453, dtb__454) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__453, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__454)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__455, dtb__456) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__455), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__456)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__457, dtb__458, dtb__459) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__457), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__458), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__459)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel defName dName appPos depth alt -> (if (fuel <= 0) then alt else (match alt with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__460; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__461; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__462 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__460; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__461; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (Base_dList.v_Base_dList_dlength dtb__461))) dtb__462) }
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel defName dName appPos depth g args -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((Base_dList.v_Base_dList_dlength args2) > appPos) else false) then (depth > appPos) else false) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dName, ((depth - appPos) - 1), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }) args2)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) args2))) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) args))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName dName appPos depth t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName dName appPos t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName ec ty body baseIdx nGroups k groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__463, dtb__464) -> (match dtb__463 with
  | { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__465; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__466; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__467 } -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__464)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__467))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__465))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) (baseIdx + 2)) dtb__467) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__465) dName) (baseIdx + 2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (baseIdx + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (baseIdx + 1)) dtb__466)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__465)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec } }
  | _ -> failwith "DT: impossible branch"
)) groups))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec } }
  | _ -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty) - 1)))) (Base_dList.v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))
))

let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName dName appPos depth alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))

let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName dName appPos depth g args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__468, dtb__469) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__468) = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__469)) else (Base_dList.C_Base_dList_dList_Cons (dtb__468, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__469))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__470, dtb__471) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__470)) dtb__471)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__472, dtb__473) -> (match dtb__472 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__474; Base_dPair.f_Base_dPair_dPair_second = dtb__475 } -> (match dtb__474 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__476, dtb__477, dtb__478, dtb__479) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__472, dtb__473))))) mc3) dtb__479) dtb__477) dtb__476)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__480; Base_dPair.f_Base_dPair_dPair_second = dtb__481 } -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__482; Base_dPair.f_Base_dPair_dPair_second = dtb__483 } -> (match dtb__482 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__473) mc1) mc2) dtb__483) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = ty }, mc4))) (Base_dList.C_Base_dList_dList_Cons (inst, mc5))) (Base_dList.C_Base_dList_dList_Cons (inst, mc6)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__484) -> (match dtb__484 with
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__479) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OverlappingInstances (iname))) iname)
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__479) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dInstCoherence.v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash dtb__481) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__480)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__480)) mc6))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = iname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__480); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__480); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__480); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__479)) })) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__480))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__480)) dtb__477))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__473) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (Base_dList.v_Base_dList_dreverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls classes globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs name -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__485) -> dtb__485
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__486, dtb__487) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__486)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__488; Base_dPair.f_Base_dPair_dPair_second = dtb__489 } -> (match dtb__489 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__490; Base_dPair.f_Base_dPair_dPair_second = dtb__491 } -> (match dtb__491 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__492; Base_dPair.f_Base_dPair_dPair_second = dtb__493 } -> (match dtb__493 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__494; Base_dPair.f_Base_dPair_dPair_second = dtb__495 } -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__487) ((Base_dList.v_Base_dList_dappend mc1) dtb__490)) dtb__495) (Base_dList.C_Base_dList_dList_Cons (dtb__488, mc3))) ((Base_dList.v_Base_dList_dappend dtb__490) mc4)) (Base_dList.C_Base_dList_dList_Cons (dtb__492, mc5))) ((Base_dList.v_Base_dList_dappend dtb__494) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc6); Base_dPair.f_Base_dPair_dPair_second = mc2 } } } }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__496, dtb__497) -> (match dtb__496 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__498; Base_dPair.f_Base_dPair_dPair_second = dtb__499 } -> (if (dtb__498 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__499)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__497))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__500) -> dtb__500
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore ecAfter srcSpan gs -> ((Base_dList.v_Base_dList_dmap (fun g -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) gs)) (Base_dPair.v_Base_dPair_dfirstOf g)), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (Base_dPair.v_Base_dPair_dfirstOf g))), srcSpan)))) gs))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__501, dtb__502) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf dtb__501)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__502) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__502) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf dtb__501), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__501)), (Base_dPair.v_Base_dPair_dsecondOf dtb__501), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (Base_dPair.v_Base_dPair_dfirstOf dtb__501)) mc2))), mc4))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals ec srcSpans sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__503, dtb__504) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__505, dtb__506, dtb__507, dtb__508, dtb__509) -> (if dtb__506 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__508) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__507) dtb__505) dtb__508) dtb__509) (Base_dList.C_Base_dList_dList_Cons (dtb__503, dtb__504))) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__508) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__507) dtb__505) dtb__508) dtb__509) (Base_dList.C_Base_dList_dList_Cons (dtb__503, dtb__504))) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else (match dtb__503 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__510, dtb__511) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__507) dtb__510) dtb__504) mc5) dtb__508) dtb__509) mc7)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__512) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__507) "_") dtb__504) mc5) dtb__508) dtb__509) mc7)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__503)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DefParamsMustBeVars)
))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DefMoreParams)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__513, dtb__514, dtb__515, dtb__516, dtb__517) -> (if dtb__514 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__516) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__515) dtb__513) dtb__516) dtb__517) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__516) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__515) dtb__513) dtb__516) dtb__517) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 })))))))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__518; Base_dPair.f_Base_dPair_dPair_second = dtb__519 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__518)); Base_dPair.f_Base_dPair_dPair_second = dtb__519 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__520; Base_dPair.f_Base_dPair_dPair_second = dtb__521 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__520)); Base_dPair.f_Base_dPair_dPair_second = dtb__521 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel globals ctx ec body expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else (match body with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__522, dtb__523, dtb__524) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__525, dtb__526, dtb__527, dtb__528, dtb__529) -> (if dtb__526 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__528) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__527) dtb__525) dtb__528) dtb__529) Base_dList.C_Base_dList_dList_Nil) body) sp) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__528) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__527) dtb__525) dtb__528) dtb__529) Base_dList.C_Base_dList_dList_Nil) body) sp) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) etaName) dtb__527) dtb__528)) (fun etaRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__529) v)) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__530; Base_dPair.f_Base_dPair_dPair_second = dtb__531 } -> ((fun inner2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (etaName, etaRig, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__531 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__531) ctx) dtb__528) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__530) else dtb__530))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (body, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (etaName, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__528) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
)
)))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel globals ctx ec rig pname pats body dom clo sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) pname) rig) dom)) (fun erasure -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__532; Base_dPair.f_Base_dPair_dPair_second = dtb__533 } -> ((fun inner2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (pname, erasure, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__533 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__533) ctx) dom) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__532) else dtb__532))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals ctx0 ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun globals ctx0 ec clauses expected sp -> ((fun key -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__534, dtb__535) -> (match dtb__534 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__536; Base_dPair.f_Base_dPair_dPair_second = dtb__537 } -> (match dtb__535 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__536) then (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) dtb__536) dtb__537) expected) sp) else ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats ec) ctx0) expected) clauses)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__538; Base_dPair.f_Base_dPair_dPair_second = dtb__539 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__539)) dtb__538)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) dtb__539) Base_dList.C_Base_dList_dList_Nil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI")))
  | _ -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats ec) ctx0) expected) clauses)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__540; Base_dPair.f_Base_dPair_dPair_second = dtb__541 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__541)) dtb__540)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) dtb__541) Base_dList.C_Base_dList_dList_Nil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI"))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
)) clauses)) (bi_strFromInt (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals ctx ec mty clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__542, dtb__543) -> (match dtb__542 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__544; Base_dPair.f_Base_dPair_dPair_second = dtb__545 } -> ((fun clauses -> ((fun instTy -> (match clauses with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc9) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__546; Base_dPair.f_Base_dPair_dPair_second = dtb__547 } -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__547) dtb__543) mc5) mc6) (Base_dList.C_Base_dList_dList_Cons (dtb__546, mc7))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__546; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams mc5) dtb__545)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__544) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc8); Base_dPair.f_Base_dPair_dPair_second = mc3 } }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals cls ctx nCtx headArgs ec methods sp -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) headArgs) methods) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass = (fun globals allDecls cls info ec0 headExpr methods msp -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__548) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 msp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceUnknownMethod (dtb__548))) dtb__548)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__549) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) dtb__549) allDecls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__550) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__550) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 msp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs info)) ec0) methods) msp)) (fun q -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__551; Base_dPair.f_Base_dPair_dPair_second = dtb__552 } -> (match dtb__552 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__553; Base_dPair.f_Base_dPair_dPair_second = dtb__554 } -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) msp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) Base_dList.C_Base_dList_dList_Nil) ec2)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__555; Base_dPair.f_Base_dPair_dPair_second = dtb__556 } -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = dictTyTerm }, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__556) { Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = dictTerm }) }))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf info) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))) fields2))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) headExpr))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__555)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__551))) (Base_dPair.v_Base_dPair_dsecondOf solvedCtx))) (Base_dPair.v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__554) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (bi_natAdd nTele nCtx))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx info))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__557; Base_dPair.f_Base_dPair_dPair_second = dtb__558 } -> (match dtb__557 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__559, dtb__560, dtb__561, dtb__562) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc3) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) mc0))) mc5) dtb__562) dtb__560) dtb__559)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = dtb__564 } -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__563)) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__562) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__565) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk mc1) dtb__562) dtb__565) dtb__560) then ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass mc2) mc1) dtb__565) dtb__563) dtb__564) dtb__560) dtb__561) dtb__562) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__562) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__558) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals ec mty clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__566, dtb__567) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Cons (dtb__566, dtb__567))) mc1) mc4) mc2) mc3) mc5) dtb__566)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__568; Base_dPair.f_Base_dPair_dPair_second = dtb__569 } -> ((fun newDefs -> ((fun ecTbl -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__567) mc1) mc2) mc3) ((Base_dList.v_Base_dList_dappend mc4) dtb__568)) ecTbl) ((Base_dList.v_Base_dList_dappend newDefs) mc6))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__569) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) dtb__568) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__569))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc5) dtb__569) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__566)))) dtb__568))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc6); Base_dPair.f_Base_dPair_dPair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun allDecls classes datas globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) Base_dList.C_Base_dList_dList_Nil)) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = d; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d) })) allDecls)) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__570, dtb__571) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Cons (dtb__570, dtb__571))) Base_dList.C_Base_dList_dList_Nil) mc3) mc1) mc2) mc4) dtb__570)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__572; Base_dPair.f_Base_dPair_dPair_second = dtb__573 } -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__571) mc1) mc2) ((Base_dList.v_Base_dList_dappend mc3) dtb__572)) dtb__573) ((Base_dList.v_Base_dList_dappend dtb__572) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls classes datas globals ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals ec clauses expected sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))
