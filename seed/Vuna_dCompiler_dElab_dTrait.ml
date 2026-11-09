open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTrait_dInstSigInfo = C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_InstSigInfo of (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup = C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_DictGoalGroup of (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (int Base_dList.t_Base_dList_dList)

let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__2) dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (match dtb__4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__6, dtb__7) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig (fun nm -> (Base_dMaybe.v_Base_dMaybe_disJust ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup nm) mc1)))) dtb__7) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__7)))) (fun p -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__10, dtb__11) -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo mc0) mc1) dtb__11) dtb__5) (Base_dList.C_Base_dList_dList_Cons (dtb__8, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc4), mc2))))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitParam_TraitParam (dtb__20, dtb__21) -> (Base_dList.C_Base_dList_dList_Cons (dtb__20, (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitParam_TraitParam (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit mc0) mc1) dtb__26) dtb__23) mc3)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer mc0) mc1) dtb__24) dtb__23) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc1))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit = (fun globals ec kexpr rest methods -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) kexpr)) (fun pk -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__27, dtb__28) -> (match dtb__28 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__29, dtb__30) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) dtb__30) rest) methods)) (fun pr -> (match pr with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__31, dtb__32) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__31)), dtb__32))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer = (fun globals ec pname rest methods -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) ec) rest) methods)) (fun pr -> (match pr with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__33, dtb__34) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods), dtb__33)), dtb__34))))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match dtb__35 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__37, dtb__38) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__37, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__38, ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis dtb__36) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__39, mc1)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs dtb__40) (mc1 - 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf = (fun dname params -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dname))) ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs params) ((Base_dList.v_Base_dList_dlength params) - 1))))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__41), (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_TraitMethod (dtb__43, dtb__44, dtb__45) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))), (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__42)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjType = (fun tname params pKinds methodTy -> ((fun dictPi -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis ((Base_dList.v_Base_dList_dzip params) pKinds)) dictPi)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname)) params), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) methodTy)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match dtb__46 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__48, dtb__49) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__48, ((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjType mc0) mc1) mc2) dtb__50))), ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) (mc3 + 1)) dtb__47) dtb__51)))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__52, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams dtb__53) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames = (fun n -> (if (n = 1) then (Base_dList.C_Base_dList_dList_Cons ("_p", Base_dList.C_Base_dList_dList_Nil)) else ((Base_dList.v_Base_dList_dmap (fun i -> ("_p" ^ ((Base_dInterp.v_Base_dInterp_dinterp (Base_dInterp.v_Interp_ua Base_dInt.v_Show_uInt)) i)))) ((Base_dList.v_Base_dList_drange 0) n))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor fieldIdx rigs nFields nParams -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams (v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames nParams)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_d", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, lamArgs)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("_d", dictIdx)), (Base_dList.C_Base_dList_dList_Cons (alt, Base_dList.C_Base_dList_dList_Nil)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (ctor, binders, applied)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((nFields - 1) - fieldIdx))))) arity)) (Base_dList.v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> (if dtb__55 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__58) else (1 + (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__58)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match dtb__59 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__61, dtb__62) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__61, (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBody mc0) mc4) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__63)) mc5) mc1))), ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo mc0) mc1) dtb__60) dtb__64) (mc4 + 1)) mc5)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname nParams methods fieldTys nFields -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) nParams) methods) fieldTys) 0) nFields))

let v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal = (fun globals ec tname paramNames methods methodsP pKinds fieldTys -> ((fun paramsKinds -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dd, (Base_dPair.C_Base_dPair_dPair_Pair (projs, (Base_dPair.C_Base_dPair_dPair_Pair (cls, (Base_dPair.C_Base_dPair_dPair_Pair (projSpans, ec3))))))))))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData ec) dd)) cls))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (tname, paramNames, projs, fieldTys)))) (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs tname) (Base_dList.v_Base_dList_dlength paramNames)) methodsP) fieldTys) (Base_dList.v_Base_dList_dlength methods)))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m))))) methods))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections tname) paramNames) pKinds) methodsP) fieldTys))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dname, tele, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_DtCtor (cname, dname, tele, ctorTy)), Base_dList.C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))), Base_dList.C_Base_dList_dList_Nil, false)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys fieldTys) dapp)))) ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf dname) paramNames))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds)))

let v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds = (fun globals ec tname params methods methodsP pKinds -> ((fun paramNames -> ((fun paramsKinds -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) paramsKinds) methodsP)) (fun p -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal globals) (Base_dPair.v_Base_dPair_dsecondOf p)) tname) paramNames) methods) methodsP) pKinds) (Base_dPair.v_Base_dPair_dfirstOf p))))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds))) (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames params)))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__65, dtb__66) -> (match dtb__65 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__67, dtb__68, dtb__69, dtb__70) -> (if ((Base_dList.v_Base_dList_dlength dtb__68) = 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__70) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterfaceNoParam) else ((fun methodsP -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds mc0) mc1) dtb__68) methodsP)) (fun pk -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds mc0) (Base_dPair.v_Base_dPair_dsecondOf pk)) dtb__67) dtb__68) dtb__69) methodsP) (Base_dPair.v_Base_dPair_dfirstOf pk))))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__69)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__66) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddeclTopName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__71, dtb__72, dtb__73, dtb__74) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__92, dtb__93) -> (match (v_Vuna_dCompiler_dElab_dTrait_ddeclTopName dtb__92) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94) -> (if (if (dtb__94 = mc1) then ((match dtb__93 with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> dtb__95
  | _ -> failwith "DT: impossible branch"
) = mc2) else false) then true else (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__91) mc1) mc2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__91) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__100, dtb__101, dtb__102) -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__100)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__103, dtb__104) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__103))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (match (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__105) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> (Base_dList.C_Base_dList_dList_Cons (dtb__107, (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__106)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__106)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType = (fun n -> (if (if (if (if (if (if (if (n = "Int") then true else (n = "String")) then true else (n = "Float")) then true else (n = "IO")) then true else (n = "Array")) then true else (n = "IORef")) then true else (n = "MArray")) then true else (n = "Buffer")))

let rec v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile mc0) dtb__108) mc2) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile mc0) dtb__109) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (if (v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType dtb__110) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead dtb__111))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__112, dtb__113, dtb__114) -> (match dtb__112 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__115, dtb__116) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__115, dtb__113))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__117, dtb__118) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__117, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames = (fun headExpr -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> (match dtb__119 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__120, dtb__121) -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__121)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk = (fun allDecls sp cls headExpr -> ((fun file -> ((fun headNames -> (if (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile allDecls) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) file) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile allDecls) headNames) file)) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead headNames))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames headExpr))) (match sp with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> dtb__122
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__127, dtb__128) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__127, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__129, dtb__130, dtb__131) -> (match dtb__129 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__132, dtb__133) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__132, dtb__130))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__134) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc0) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__135)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__136, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_InstSigInfo (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> dtb__137
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_InstSigInfo (dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> dtb__143
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_InstSigInfo (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> dtb__149
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_InstSigInfo (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> dtb__155
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_InstSigInfo (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__162, dtb__163) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind mc0) mc1) mc2) dtb__162) dtb__164) mc5)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__166, dtb__167) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc0) mc1) dtb__167) dtb__163) dtb__165) mc5)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__168, dtb__169) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__166, dtb__168)), dtb__169))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc2))))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__170, dtb__171, dtb__172) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__170) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__173) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__171) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__173) dtb__174)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__175, dtb__176) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__175))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__177) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__178) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__180) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__179, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__180))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__181) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__183) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms dtb__182) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (if (dtb__185 >= 97) then (dtb__185 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dseedKindOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__187, dtb__188) -> (match dtb__187 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__189, dtb__190) -> (if (dtb__189 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__190)) else ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf mc0) dtb__188))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf dtb__191) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__193) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__192) mc1) mc2) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__194, dtb__195) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__191, dtb__193)), dtb__194)), dtb__195))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__196, dtb__197) -> (match dtb__196 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__198) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__192) mc1) dtb__197) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__199, dtb__200) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__191, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__198)))), dtb__199)), dtb__200))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__192) mc1) dtb__197) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__201, dtb__202) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__191, dtb__196)), dtb__201)), dtb__202))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc2))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__205, dtb__206) -> (match dtb__203 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__207, dtb__208) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__207) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__207, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__205))), ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__204) dtb__206))) else ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__204) dtb__206))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__204) dtb__206)
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind = (fun combined v -> ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_darityFun ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

let v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__209) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__209) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__210) -> ((fun q -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) q) then ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1) else q)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__210))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (match dtb__211 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__213, dtb__214) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__213, ((((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind mc0) dtb__213) dtb__214) mc2))), (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds mc0) dtb__212) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__215, dtb__216, dtb__217) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__215)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__216))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222, dtb__223) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__221)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__222))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__224, dtb__225, dtb__226) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__224)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__225))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__227, dtb__228) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__227) then (Base_dList.C_Base_dList_dList_Cons (dtb__227, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTrait_duniqNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (if ((Base_dList.v_Base_dList_dmemName dtb__229) dtb__230) then (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__230) else (Base_dList.C_Base_dList_dList_Cons (dtb__229, (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__230))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__231, dtb__232) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__231) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__232) else (Base_dList.C_Base_dList_dList_Cons (dtb__231, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__232))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas = (fun banned combined exprs seeds ec -> (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit (v_Vuna_dCompiler_dElab_dTrait_duniqNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))) seeds) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__233, dtb__234) -> (match dtb__233 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__235, dtb__236) -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__234) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__235) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__236)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__237))) mc0)) dtb__238) (mc2 + 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__239, dtb__240) -> (match dtb__239 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__241, dtb__242) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__241, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__240)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body remaining k -> (if (remaining <= 0) then body else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (remaining - 1)) (k + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body nCtx k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (nCtx - k)) k))

let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info ctor fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (ctor, ((Base_dList.v_Base_dList_dmap (fun t -> (Base_dPair.C_Base_dPair_dPair_Pair (t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) fields)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__243), mc0))) dtb__244) (mc2 - 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (match dtb__245 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__247, dtb__248) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__247, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__248, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__246)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) (nCtx - 1)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__249, dtb__250) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__249))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__251, dtb__252, dtb__253) -> (match dtb__252 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__254, dtb__255) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__254)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__256, dtb__257) -> (match dtb__256 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__258, dtb__259, dtb__260, dtb__261) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__258)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__257) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__258)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__257)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf m)))) (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__262, dtb__263, dtb__264, dtb__265) -> dtb__264
  | _ -> failwith "DT: impossible branch"
))) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__266, dtb__267) -> (match dtb__266 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__268, dtb__269, dtb__270, dtb__271) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__268) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__267))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__267)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__272, dtb__273) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__272))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__273) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__272))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__274, dtb__275, dtb__276, dtb__277) -> dtb__276
  | _ -> failwith "DT: impossible branch"
)) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__278, dtb__279) -> (match dtb__278 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__280, dtb__281) -> (match dtb__280 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__282, dtb__283, dtb__284, dtb__285) -> (if (dtb__282 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__280)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__279))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__279)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__286, dtb__287) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__286) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__286))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__287))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cname mname decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> (match dtb__288 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__289, dtb__290, dtb__291, dtb__292) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__291)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl cname) decls)))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) ((Base_dList.v_Base_dList_dmap (fun a -> (Base_dPair.C_Base_dPair_dPair_Pair (a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) args)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__293, dtb__294) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__293) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__293)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__294))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__295, dtb__296) -> (match dtb__295 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__297, dtb__298) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__297) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__296)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__299) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc1) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__299)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__296)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__300) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__298) dtb__300)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__296))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__301, dtb__302) -> (match dtb__301 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__303, dtb__304) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__303) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc4) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownInterface (dtb__303))) dtb__303)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__305) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__305)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__306) -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength dtb__306) <> (Base_dList.v_Base_dList_dlength dtb__304)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc1) mc2) mc5) dtb__304) dtb__306) mc4)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__307, dtb__308) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains mc0) mc1) mc2) dtb__302) mc4) dtb__308)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__309, dtb__310) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__305) dtb__307), dtb__309)), dtb__310))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["constraint-dom: "; dtb__303; " args="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__304)); " kinds="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__306))])) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes globals defined ec0 sp cls argExprs ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun kindMaybe -> (match kindMaybe with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__311) -> (if ((Base_dList.v_Base_dList_dlength dtb__311) <> (Base_dList.v_Base_dList_dlength argExprs)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((fun seeds -> ((fun init -> ((fun tele0 -> ((fun ec1 -> ((fun teleCtx0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__311) sp)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__312, dtb__313) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__313)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__314, dtb__315) -> ((fun tele -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_InstSigInfo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls), tele, dtb__314, dtb__312, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__312))), dtb__315))))) (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds combined) tele0) dtb__315))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele0))) (Base_dPair.v_Base_dPair_dsecondOf init))) (Base_dPair.v_Base_dPair_dfirstOf init))) (((((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas banned) combined) ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs)) seeds) ec0))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds argExprs) dtb__311)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds classes) ec0) ctxParts))))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)), Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("#inst", sp)), ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs), sp)))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((Base_dList.v_Base_dList_dconcatMap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) ctxParts)))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes globals defined ec0 sp headExpr ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__316) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (Base_dPair.v_Base_dPair_dfirstOf dtb__316)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownInterface ((Base_dPair.v_Base_dPair_dfirstOf dtb__316)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__316))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__317) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__316) with
  | dtb__318 -> (if ((Base_dList.v_Base_dList_dlength dtb__318) <> (Base_dList.v_Base_dList_dlength (match dtb__317 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__319, dtb__320, dtb__321, dtb__322) -> dtb__320
  | _ -> failwith "DT: impossible branch"
))) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__317) dtb__318) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__323, dtb__324) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__325, dtb__326) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf dtb__323), dtb__325)), ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__324) dtb__326)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__327, dtb__328, dtb__329, dtb__330) -> dtb__329
  | _ -> failwith "DT: impossible branch"
)) (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_DtClass (dtb__331, dtb__332, dtb__333, dtb__334) -> dtb__334
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstArgAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__335, dtb__336) -> (if (mc0 <= 0) then dtb__335 else ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt (mc0 - 1)) dtb__336))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__337, dtb__338, dtb__339) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__337), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__338), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__339)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__340, dtb__341) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__340), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt mc0) mc1) mc2) alt))) dtb__341)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__342, dtb__343) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__342, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__343)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__344, dtb__345, dtb__346) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__344), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__345), dtb__346))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__347, dtb__348, dtb__349) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__347, dtb__348, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__349)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__350, dtb__351, dtb__352, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__353), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__354)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__355, dtb__356) -> (if (dtb__356 >= mc2) then (if ((dtb__356 - mc2) < mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt ((mc0 - 1) - (dtb__356 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__357, dtb__358, dtb__359) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__357, dtb__358, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__358))) dtb__359)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams = (fun args t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo (Base_dList.v_Base_dList_dlength args)) args) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__360, dtb__361) -> (match dtb__360 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__362, dtb__363, dtb__364, dtb__365) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__362) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__361) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__363, dtb__364)), mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__361) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__361) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__366) -> true
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__367) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__368, dtb__369) -> (if (mc4 >= mc1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__368 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__370, dtb__371) -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__371)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__369))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx nCtx dom ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__372, dtb__373) -> dtb__372
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__374, dtb__375) -> (match dtb__374 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraint_Constraint (dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, dtb__381) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__378) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__382) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__375) mc4) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__379) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__375) (Base_dList.C_Base_dList_dList_Cons (dtb__374, mc4))) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__383) -> ((fun k -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__378) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) - mc1) + k), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__384) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__384))) dtb__375) mc4) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__378, k)), mc5)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__385) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__375) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__383))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc5), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc2) (Base_dList.v_Base_dList_dreverse mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx nCtx nTele ec acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) acc))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__386, dtb__387) -> (match dtb__386 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__388, dtb__389) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__387) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__388) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__389)) ((dtb__389 - mc0) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__390, dtb__391) -> (match dtb__390 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraint_Constraint (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397) -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__395) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__398) -> (match dtb__398 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__399, dtb__400) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__400)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__400)) 0) dtb__394) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__399)) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__401) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__391) mc4) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__394, dtb__399)), mc5))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__400) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__401)))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__402) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__391) mc4) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__394, dtb__399)), mc5))) dtb__400)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__403) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceContextMissing ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__395)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__395))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__395) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__391) (Base_dList.C_Base_dList_dList_Cons (dtb__390, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc5), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc6) (Base_dList.v_Base_dList_dreverse mc4))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals ctx sp goals acc ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) Base_dList.C_Base_dList_dList_Nil) acc) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__404, dtb__405, dtb__406) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__404), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__405), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__406)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__407, dtb__408) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__407), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__408)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__409, dtb__410) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__409, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__410)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__411, dtb__412, dtb__413) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__411), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__412), dtb__413))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__414, dtb__415, dtb__416) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__414, dtb__415, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__416)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__417, dtb__418, dtb__419, dtb__420, dtb__421) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__417, dtb__418, dtb__419, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__420), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__421)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__422) -> (if (dtb__422 = mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__423, dtb__424, dtb__425) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__423, dtb__424, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__424))) dtb__425)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m rep t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__426, dtb__427) -> (match dtb__426 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__428, dtb__429) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__427) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__428) dtb__429) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__430, dtb__431) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (Base_dPair.v_Base_dPair_dsecondOf dtb__430))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__432) -> true
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__433) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__434, dtb__435) -> (match dtb__434 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_DictGoalGroup (dtb__436, dtb__437, dtb__438) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__437) mc2) then (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_DictGoalGroup (dtb__436, dtb__437, (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__438)))), dtb__435)) else (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_DictGoalGroup (dtb__436, dtb__437, dtb__438)), ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__435))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_DictGoalGroup (mc1, mc2, Base_dList.C_Base_dList_dList_Nil)), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__439, dtb__440) -> (match dtb__439 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraint_Constraint (dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446) -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__444) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__443) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__447) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__440) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__440) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__443) dtb__444) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__440) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__448, dtb__449, dtb__450, dtb__451, dtb__452) -> (if dtb__449 then (1 + (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__452)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec name level m -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__453) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__453))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__454) -> ec
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__455, dtb__456) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__456) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__455) mc0) mc1) mc3))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__457, dtb__458) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__457)) mc1) mc2) dtb__458)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n x xs -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dtake n) xs)) (Base_dList.C_Base_dList_dList_Cons (x, Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_ddrop n) xs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel defName dName appPos depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__459, dtb__460, dtb__461) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__459, dtb__460, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__461)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__462, dtb__463, dtb__464, dtb__465, dtb__466) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__462, dtb__463, dtb__464, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__465), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__466)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__467, dtb__468, dtb__469) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__467), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__468), dtb__469))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__470) -> (match dtb__470 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__471, dtb__472) -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__471) dtb__472)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__473, dtb__474) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__473, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__474)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__475, dtb__476) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__475), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__476)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__477, dtb__478, dtb__479) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__477), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__478), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__479)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel defName dName appPos depth alt -> (if (fuel <= 0) then alt else (match alt with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__480, dtb__481, dtb__482) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__480, dtb__481, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (Base_dList.v_Base_dList_dlength dtb__481))) dtb__482)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel defName dName appPos depth g args -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((Base_dList.v_Base_dList_dlength args2) > appPos) else false) then (depth > appPos) else false) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dName, ((depth - appPos) - 1))), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega))) args2)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) args2))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) args))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName dName appPos depth t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName dName appPos t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName ec ty body baseIdx nGroups k groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__483, dtb__484) -> (match dtb__483 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_DictGoalGroup (dtb__485, dtb__486, dtb__487) -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__484)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__487))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__485))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) (baseIdx + 2)) dtb__487) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__485) dName) (baseIdx + 2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) finalPos) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote finalPos) dtb__486)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__485)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (ty, (Base_dPair.C_Base_dPair_dPair_Pair (body, ec))))
  | _ -> failwith "DT: impossible branch"
)) groups))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (ty, (Base_dPair.C_Base_dPair_dPair_Pair (body, ec))))
  | _ -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty) - 1)))) (Base_dList.v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))
))

let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName dName appPos depth alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))

let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName dName appPos depth g args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__488, dtb__489) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__488) = mc0) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, mc1)), dtb__489)) else (Base_dList.C_Base_dList_dList_Cons (dtb__488, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__489))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__490, dtb__491) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__490)) dtb__491)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__492, dtb__493) -> (match dtb__492 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__494, dtb__495) -> (match dtb__494 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__496, dtb__497, dtb__498, dtb__499) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__492, dtb__493))))) mc3) dtb__499) dtb__497) dtb__496)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__500, dtb__501) -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__502, dtb__503) -> (match dtb__502 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__493) mc1) mc2) dtb__503) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (iname, ty)), mc4))) (Base_dList.C_Base_dList_dList_Cons (inst, mc5))) (Base_dList.C_Base_dList_dList_Cons (inst, mc6)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__504) -> (match dtb__504 with
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__499) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OverlappingInstances (iname))) iname)
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__499) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dInstCoherence.v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash dtb__501) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__500)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__500)) mc6))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_DtInst (iname, (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__500), (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__500), (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__500))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__500))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__500)) dtb__497))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__493) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (Base_dList.v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls classes globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs name -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__505) -> dtb__505
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__506, dtb__507) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__506)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__508, dtb__509) -> (match dtb__509 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__510, dtb__511) -> (match dtb__511 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__512, dtb__513) -> (match dtb__513 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__514, dtb__515) -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__507) ((Base_dList.v_Base_dList_dappend mc1) dtb__510)) dtb__515) (Base_dList.C_Base_dList_dList_Cons (dtb__508, mc3))) ((Base_dList.v_Base_dList_dappend dtb__510) mc4)) (Base_dList.C_Base_dList_dList_Cons (dtb__512, mc5))) ((Base_dList.v_Base_dList_dappend dtb__514) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc3), (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc4), (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc5), (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc6), mc2))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__516, dtb__517) -> (match dtb__516 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__518, dtb__519) -> (if (dtb__518 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__519)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__517))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__520) -> dtb__520
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore ecAfter srcSpan gs -> ((Base_dList.v_Base_dList_dmap (fun g -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) gs)) (Base_dPair.v_Base_dPair_dfirstOf g)), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (Base_dPair.v_Base_dPair_dfirstOf g))), srcSpan)))) gs))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__521, dtb__522) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf dtb__521)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__522) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__522) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf dtb__521), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__521)), (Base_dPair.v_Base_dPair_dsecondOf dtb__521), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (Base_dPair.v_Base_dPair_dfirstOf dtb__521)) mc2))), mc4))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals ec srcSpans sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__523, dtb__524) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__525, dtb__526, dtb__527, dtb__528, dtb__529) -> (if dtb__526 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__528) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__527) dtb__525) dtb__528) dtb__529) (Base_dList.C_Base_dList_dList_Cons (dtb__523, dtb__524))) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__528) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__527) dtb__525) dtb__528) dtb__529) (Base_dList.C_Base_dList_dList_Cons (dtb__523, dtb__524))) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else (match dtb__523 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__530, dtb__531) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__527) dtb__530) dtb__524) mc5) dtb__528) dtb__529) mc7)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__532) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__527) "_") dtb__524) mc5) dtb__528) dtb__529) mc7)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__523)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DefParamsMustBeVars)
))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DefMoreParams)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537) -> (if dtb__534 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__536) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__535) dtb__533) dtb__536) dtb__537) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__536) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__535) dtb__533) dtb__536) dtb__537) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2)))))))))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2))))))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__538, dtb__539) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__538)), dtb__539))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__540, dtb__541) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__540)), dtb__541))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel globals ctx ec body expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: binder check fuel exhausted")) else (match body with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__542, dtb__543, dtb__544) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2))))))))
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__545, dtb__546, dtb__547, dtb__548, dtb__549) -> (if dtb__546 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__548) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__547) dtb__545) dtb__548) dtb__549) Base_dList.C_Base_dList_dList_Nil) body) sp) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__548) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__547) dtb__545) dtb__548) dtb__549) Base_dList.C_Base_dList_dList_Nil) body) sp) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) etaName) dtb__547) dtb__548)) (fun etaRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__549) v)) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__550, dtb__551) -> ((fun inner2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (etaName, etaRig, inner2)), dtb__551))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__551) ctx) dtb__548) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__550) else dtb__550))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (body, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (etaName, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__548) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2))))))))
)
)))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel globals ctx ec rig pname pats body dom clo sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) pname) rig) dom)) (fun erasure -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__552, dtb__553) -> ((fun inner2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (pname, erasure, inner2)), dtb__553))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__553) ctx) dom) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__552) else dtb__552))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals ctx0 ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun globals ctx0 ec clauses expected sp -> ((fun key -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__554, dtb__555) -> (match dtb__554 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__556, dtb__557) -> (match dtb__555 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__556) then (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) dtb__556) dtb__557) expected) sp) else ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats ec) ctx0) expected) clauses)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__558, dtb__559) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__559)) dtb__558)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) dtb__559) Base_dList.C_Base_dList_dList_Nil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI")))
  | _ -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats ec) ctx0) expected) clauses)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__560, dtb__561) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__561)) dtb__560)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) dtb__561) Base_dList.C_Base_dList_dList_Nil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI"))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
)) clauses)) (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine sp))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals ctx ec mty clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__562, dtb__563) -> (match dtb__562 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__564, dtb__565) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc9) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__566, dtb__567) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__567) dtb__563) mc5) mc6) (Base_dList.C_Base_dList_dList_Cons (dtb__566, mc7))) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__566, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams mc5) dtb__565)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__564) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc7), (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc8), mc3))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals cls ctx nCtx headArgs ec methods sp -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) headArgs) methods) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass = (fun globals allDecls cls info ec0 headExpr methods msp -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__568) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 msp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceUnknownMethod (dtb__568))) dtb__568)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__569) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) dtb__569) allDecls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__570) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__570) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 msp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs info)) ec0) methods) msp)) (fun q -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__571, dtb__572) -> (match dtb__572 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__573, dtb__574) -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) msp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) Base_dList.C_Base_dList_dList_Nil) ec2)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__575, dtb__576) -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (iname, dictTyTerm)), Base_dList.C_Base_dList_dList_Nil)), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__576) (Base_dPair.C_Base_dPair_dPair_Pair (iname, dictTerm)))))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf info) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))) fields2))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) headExpr))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__575)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__571))) (Base_dPair.v_Base_dPair_dsecondOf solvedCtx))) (Base_dPair.v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__574) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (bi_natAdd nTele nCtx))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx info))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__577, dtb__578) -> (match dtb__577 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__579, dtb__580, dtb__581, dtb__582) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc3) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) mc0))) mc5) dtb__582) dtb__580) dtb__579)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__583, dtb__584) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__583)) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__582) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__585) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk mc1) dtb__582) dtb__585) dtb__580) then ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass mc2) mc1) dtb__585) dtb__583) dtb__584) dtb__580) dtb__581) dtb__582) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__582) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__578) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals ec mty clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__586, dtb__587) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Cons (dtb__586, dtb__587))) mc1) mc4) mc2) mc3) mc5) dtb__586)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__588, dtb__589) -> ((fun newDefs -> ((fun ecTbl -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__587) mc1) mc2) mc3) ((Base_dList.v_Base_dList_dappend mc4) dtb__588)) ecTbl) ((Base_dList.v_Base_dList_dappend newDefs) mc6))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__589) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) dtb__588) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__589))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc5) dtb__589) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__586)))) dtb__588))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc6), mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun allDecls classes datas globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) Base_dList.C_Base_dList_dList_Nil)) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Pair (d, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d))))) allDecls)) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__590, dtb__591) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Cons (dtb__590, dtb__591))) Base_dList.C_Base_dList_dList_Nil) mc3) mc1) mc2) mc4) dtb__590)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__592, dtb__593) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__591) mc1) mc2) ((Base_dList.v_Base_dList_dappend mc3) dtb__592)) dtb__593) ((Base_dList.v_Base_dList_dappend dtb__592) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls classes datas globals ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals ec clauses expected sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))
