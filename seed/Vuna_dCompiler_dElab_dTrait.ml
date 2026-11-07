open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTrait_dInstSigInfo = C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo of (string) * ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup = C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup of (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (int Base_dList.t_Base_dList_dList)

let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__2) dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig (fun nm -> (Base_dMaybe.v_Base_dMaybe_disJust ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup nm) mc1)))) dtb__7) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__7)))) (fun p -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo mc0) mc1) dtb__11) dtb__5) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc4), mc2))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals ec paramsKinds methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx)) ec) methods) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__12)) dtb__13)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__14), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__15) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty))

let rec v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf dtb__16) mc1), ((v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds dtb__17) mc1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitParam_Vuna_dCompiler_dFrontend_dAst_dTraitParam (dtb__20, dtb__21) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__20, (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitParam_Vuna_dCompiler_dFrontend_dAst_dTraitParam (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__26) -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit mc0) mc1) dtb__26) dtb__23) mc3)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer mc0) mc1) dtb__24) dtb__23) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit = (fun globals ec kexpr rest methods -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) kexpr)) (fun pk -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28) -> (match dtb__28 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) dtb__30) rest) methods)) (fun pr -> (match pr with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__31, dtb__32) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__31)), dtb__32))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer = (fun globals ec pname rest methods -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) ec) rest) methods)) (fun pr -> (match pr with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods), dtb__33)), dtb__34))))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match dtb__35 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__37, dtb__38) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__37, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__38, ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis dtb__36) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__39, mc1)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs dtb__40) (mc1 - 1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf = (fun dname params -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dname))) ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs params) ((Base_dList.v_Base_dList_dlength params) - 1))))

let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__41), (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__43, dtb__44, dtb__45) -> dtb__44
  | _ -> failwith "DT: impossible branch"
))), (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__42)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjType = (fun tname params pKinds methodTy -> ((fun dictPi -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis ((Base_dList.v_Base_dList_dzip params) pKinds)) dictPi)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ("_", true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname)) params), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) methodTy)))))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (match dtb__46 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__49) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, ((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjType mc0) mc1) mc2) dtb__50))), ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) (mc3 + 1)) dtb__47) dtb__51)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname params pKinds methods fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) params) pKinds) 0) methods) fieldTys))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__52, dtb__53) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__52, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams dtb__53) mc1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames = (fun n -> (if (n = 1) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ("_p", Base_dList.C_Base_dList_dList_Base_dList_dNil)) else ((Base_dList.v_Base_dList_dmap (fun i -> ("_p" ^ ((Base_dInterp.v_Base_dInterp_dinterp (Base_dInterp.v_Interp_ua Base_dShow.v_Show_uInt)) i)))) ((Base_dList.v_Base_dList_drange 0) n))))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor fieldIdx rigs nFields nParams -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams (v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames nParams)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_d", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, lamArgs)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ("_d", dictIdx)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (alt, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (ctor, binders, applied)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((nFields - 1) - fieldIdx))))) arity)) (Base_dList.v_Base_dList_dlength rigs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> (if dtb__55 then (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__58) else (1 + (v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity dtb__58)))
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (match dtb__59 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBody mc0) mc4) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__63)) mc5) mc1))), ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo mc0) mc1) dtb__60) dtb__64) (mc4 + 1)) mc5)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname nParams methods fieldTys nFields -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) nParams) methods) fieldTys) 0) nFields))

let v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal = (fun globals ec tname paramNames methods methodsP pKinds fieldTys -> ((fun paramsKinds -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dd, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (projs, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (cls, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (projSpans, ec3))))))))))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData ec) dd)) cls))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (tname, paramNames, projs, fieldTys)))) (((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs tname) (Base_dList.v_Base_dList_dlength paramNames)) methodsP) fieldTys) (Base_dList.v_Base_dList_dlength methods)))) ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m))))) methods))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections tname) paramNames) pKinds) methodsP) fieldTys))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_Vuna_dCompiler_dElab_dTypes_dDtData (dname, tele, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtCtor_Vuna_dCompiler_dElab_dTypes_dDtCtor (cname, dname, tele, ctorTy)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))), false)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys fieldTys) dapp)))) ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf dname) paramNames))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds)))

let v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds = (fun globals ec tname params methods methodsP pKinds -> ((fun paramNames -> ((fun paramsKinds -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) paramsKinds) methodsP)) (fun p -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal globals) (Base_dPair.v_Base_dPair_dsecondOf p)) tname) paramNames) methods) methodsP) pKinds) (Base_dPair.v_Base_dPair_dfirstOf p))))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds))) (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames params)))

let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun globals ec ds -> (match ds with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__65, dtb__66) -> (match dtb__65 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__67, dtb__68, dtb__69, dtb__70) -> (if ((Base_dList.v_Base_dList_dlength dtb__68) = 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__70) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInterfaceNoParam) else ((fun methodsP -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) ec) dtb__68) methodsP)) (fun pk -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds globals) (Base_dPair.v_Base_dPair_dsecondOf pk)) dtb__67) dtb__68) dtb__69) methodsP) (Base_dPair.v_Base_dPair_dfirstOf pk))))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__69)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__66) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__71, dtb__72, dtb__73) -> (match dtb__71 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__74, dtb__75) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__72))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__76, dtb__77) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__78, dtb__79) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__80, dtb__81, dtb__82) -> (match dtb__80 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__83, dtb__84) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__81))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__85) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc0) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__86)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__100
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> dtb__106
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> ((Base_dResult.v_Base_dResult_dandThen ((((((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind mc0) mc1) mc2) dtb__113) dtb__115) mc5)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc0) mc1) dtb__118) dtb__114) dtb__116) mc5)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__119)), dtb__120))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc2))))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__121, dtb__122, dtb__123) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__121) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__124) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__122) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__125) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__124) dtb__125)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__126, dtb__127) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__126))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__128, dtb__129) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__128) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__130) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__129) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__131))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__132) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__134) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms dtb__133) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (if (dtb__136 >= 97) then (dtb__136 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dseedKindOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> (match dtb__138 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> (if (dtb__140 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141)) else ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf mc0) dtb__139))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__142, dtb__143) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf dtb__142) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__143) mc1) mc2) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, dtb__146) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__144)), dtb__145)), dtb__146))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> (match dtb__147 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__149) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__143) mc1) dtb__148) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__149)))), dtb__150)), dtb__151))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__143) mc1) dtb__148) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__147)), dtb__152)), dtb__153))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc2))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__156, dtb__157) -> (match dtb__154 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__158, dtb__159) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__158) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__156))), ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__155) dtb__157))) else ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__155) dtb__157))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__155) dtb__157)
)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind = (fun combined v -> ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_darityFun ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

let v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__160) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__160) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161) -> ((fun q -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) q) then ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1) else q)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__161))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (match dtb__162 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__165) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, ((((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind mc0) dtb__164) dtb__165) mc2))), (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds mc0) dtb__163) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__166, dtb__167, dtb__168) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__166)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__167))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__172)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__173))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__175, dtb__176, dtb__177) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__175)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__176))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__178, dtb__179) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__178) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__178, Base_dList.C_Base_dList_dList_Base_dList_dNil)) else Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTrait_duniqNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__180, dtb__181) -> (if ((Base_dList.v_Base_dList_dmemName dtb__180) dtb__181) then (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__181) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__180, (v_Vuna_dCompiler_dElab_dTrait_duniqNames dtb__181))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__182) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__183) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__182, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__183))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas = (fun banned combined exprs seeds ec -> (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit (v_Vuna_dCompiler_dElab_dTrait_duniqNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))) seeds) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (match dtb__184 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__185) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__186) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__187)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__188))) mc0)) dtb__189) (mc2 + 1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> (match dtb__190 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__192, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__191)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body remaining k -> (if (remaining <= 0) then body else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (remaining - 1)) (k + 1))))))

let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body nCtx k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (nCtx - k)) k))

let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info ctor fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (ctor, ((Base_dList.v_Base_dList_dmap (fun t -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)))) fields)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__194, dtb__195) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__194), mc0))) dtb__195) (mc2 - 1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> (match dtb__196 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__198, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0, dtb__199, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__197)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) (nCtx - 1)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__200, dtb__201) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__200))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__202, dtb__203, dtb__204) -> (match dtb__203 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__205, dtb__206) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__205)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__207, dtb__208) -> (match dtb__207 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__209, dtb__210, dtb__211, dtb__212) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__209)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__208) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__209)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__208)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf m)))) (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__213, dtb__214, dtb__215, dtb__216) -> dtb__215
  | _ -> failwith "DT: impossible branch"
))) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__217, dtb__218) -> (match dtb__217 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__219, dtb__220, dtb__221, dtb__222) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__219) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__218))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__218)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__223, dtb__224) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__223))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__224) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.v_Base_dPair_dfirstOf dtb__223))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__225, dtb__226, dtb__227, dtb__228) -> dtb__227
  | _ -> failwith "DT: impossible branch"
)) methods))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__229, dtb__230) -> (match dtb__229 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__231, dtb__232) -> (match dtb__231 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__233, dtb__234, dtb__235, dtb__236) -> (if (dtb__233 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__231)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__230))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__230)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__237, dtb__238) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__237) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__237))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__238))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cname mname decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__239) -> (match dtb__239 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__240, dtb__241, dtb__242, dtb__243) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__242)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl cname) decls)))

let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) ((Base_dList.v_Base_dList_dmap (fun a -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)))) args)))

let rec v_Vuna_dCompiler_dElab_dTrait_dfindClass = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__244, dtb__245) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__244) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__244)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindClass mc0) dtb__245))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__246, dtb__247) -> (match dtb__246 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__248, dtb__249) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__248) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__247)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__250) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc1) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__250)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__247)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__251) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__249) dtb__251)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__247))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__252, dtb__253) -> (match dtb__252 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, dtb__255) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass dtb__254) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc4) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface (dtb__254))) dtb__254)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__256) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__256)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__257) -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength dtb__257) <> (Base_dList.v_Base_dList_dlength dtb__255)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dConstraintNotDict) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc1) mc2) mc5) dtb__255) dtb__257) mc4)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains mc0) mc1) mc2) dtb__253) mc4) dtb__259)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__260, dtb__261) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__256) dtb__258), dtb__260)), dtb__261))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["constraint-dom: "; dtb__254; " args="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__255)); " kinds="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__257))])) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes globals defined ec0 sp cls argExprs ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun kindMaybe -> (match kindMaybe with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__262) -> (if ((Base_dList.v_Base_dList_dlength dtb__262) <> (Base_dList.v_Base_dList_dlength argExprs)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp) else ((fun seeds -> ((fun init -> ((fun tele0 -> ((fun ec1 -> ((fun teleCtx0 -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__262) sp)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__263, dtb__264) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__264)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__265, dtb__266) -> ((fun tele -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_Vuna_dCompiler_dElab_dTrait_dInstSigInfo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls), tele, dtb__265, dtb__263, ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__263))), dtb__266))))) (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds combined) tele0) dtb__266))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele0))) (Base_dPair.v_Base_dPair_dsecondOf init))) (Base_dPair.v_Base_dPair_dfirstOf init))) (((((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas banned) combined) ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs)) seeds) ec0))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds argExprs) dtb__262)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds classes) ec0) ctxParts))))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("#inst", sp)), ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs), sp)))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((Base_dList.v_Base_dList_dconcatMap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) ctxParts)))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes globals defined ec0 sp headExpr ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__267) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (Base_dPair.v_Base_dPair_dfirstOf dtb__267)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownInterface ((Base_dPair.v_Base_dPair_dfirstOf dtb__267)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__267))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__268) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__267) with
  | dtb__269 -> (if ((Base_dList.v_Base_dList_dlength dtb__269) <> (Base_dList.v_Base_dList_dlength (match dtb__268 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__270, dtb__271, dtb__272, dtb__273) -> dtb__271
  | _ -> failwith "DT: impossible branch"
))) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp) else ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__268) dtb__269) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__274, dtb__275) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__276, dtb__277) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf dtb__274), dtb__276)), ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__275) dtb__277)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__278, dtb__279, dtb__280, dtb__281) -> dtb__280
  | _ -> failwith "DT: impossible branch"
)) (match cls with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__282, dtb__283, dtb__284, dtb__285) -> dtb__285
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinstArgAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__286, dtb__287) -> (if (mc0 <= 0) then dtb__286 else ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt (mc0 - 1)) dtb__287))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__288, dtb__289, dtb__290) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__288), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__289), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__290)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__291, dtb__292) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__291), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt mc0) mc1) mc2) alt))) dtb__292)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__293, dtb__294) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__293, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__294)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__295, dtb__296, dtb__297) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__295), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__296), dtb__297))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__298, dtb__299, dtb__300) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__298, dtb__299, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__300)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__301, dtb__302, dtb__303, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__304), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__305)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__306, dtb__307) -> (if (dtb__307 >= mc2) then (if ((dtb__307 - mc2) < mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt ((mc0 - 1) - (dtb__307 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__308, dtb__309, dtb__310) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__308, dtb__309, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__309))) dtb__310)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams = (fun args t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo (Base_dList.v_Base_dList_dlength args)) args) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__311, dtb__312) -> (match dtb__311 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__313, dtb__314, dtb__315, dtb__316) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__313) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__312) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__314, dtb__315)), mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__312) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__312) mc2)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__317) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__318) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__319, dtb__320) -> (if (mc4 >= mc1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__319 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__321, dtb__322) -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__322)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__320))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx nCtx dom ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__323, dtb__324) -> dtb__323
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__325, dtb__326) -> (match dtb__325 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__327, dtb__328) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__327) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__329) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__326) mc4) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__328) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__326) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__325, mc4))) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__330) -> ((fun k -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__327) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) - mc1) + k), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__331) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__331))) dtb__326) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__327, k)), mc5)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__332) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__326) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__330))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc2) (Base_dList.v_Base_dList_dreverse mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx nCtx nTele ec acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil) acc))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__333, dtb__334) -> (match dtb__333 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__335, dtb__336) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__334) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__335) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__336)) ((dtb__336 - mc0) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__337, dtb__338) -> (match dtb__337 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__339, dtb__340) -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__340) then ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__341) -> (match dtb__341 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__342, dtb__343) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__343)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__343)) 0) dtb__339) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__342)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__344) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__338) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__339, dtb__342)), mc5))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__343) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__344)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__345) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__338) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__339, dtb__342)), mc5))) dtb__343)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__346) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceContextMissing ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__340)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__340))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__340) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__338) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__337, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc6) (Base_dList.v_Base_dList_dreverse mc4))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals ctx sp goals acc ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) Base_dList.C_Base_dList_dList_Base_dList_dNil) acc) ec))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__347, dtb__348, dtb__349) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__347), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__348), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__349)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__350, dtb__351) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__350), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__351)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__352, dtb__353) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__352, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__353)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__354, dtb__355, dtb__356) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__354), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__355), dtb__356))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__357, dtb__358, dtb__359) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__357, dtb__358, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__359)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__360, dtb__361, dtb__362, dtb__363, dtb__364) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__360, dtb__361, dtb__362, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__363), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__364)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__365) -> (if (dtb__365 = mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__366, dtb__367, dtb__368) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__366, dtb__367, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__367))) dtb__368)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m rep t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__369, dtb__370) -> (match dtb__369 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__371, dtb__372) -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__370) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__371) dtb__372) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__373, dtb__374) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (Base_dPair.v_Base_dPair_dsecondOf dtb__373))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__375) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__376) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__377, dtb__378) -> (match dtb__377 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__379, dtb__380, dtb__381) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__380) mc2) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__379, dtb__380, (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, dtb__381)))), dtb__378)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__379, dtb__380, dtb__381)), ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__378))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (mc1, mc2, Base_dList.C_Base_dList_dList_Base_dList_dNil)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__382, dtb__383) -> (match dtb__382 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__384, dtb__385) -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__385) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__384) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__386) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__383) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__383) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__384) dtb__385) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__383) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__387, dtb__388, dtb__389, dtb__390, dtb__391) -> (if dtb__388 then (1 + (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__391)) else 0)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec name level m -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (name, level, Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__392) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__392))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__393) -> ec
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__394, dtb__395) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__395) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__394) mc0) mc1) mc3))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__396, dtb__397) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__396)) mc1) mc2) dtb__397)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n x xs -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dtake n) xs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (x, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) ((Base_dList.v_Base_dList_ddrop n) xs)))

let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel defName dName appPos depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__398, dtb__399, dtb__400) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__398, dtb__399, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__400)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__401, dtb__402, dtb__403, dtb__404, dtb__405) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__401, dtb__402, dtb__403, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__404), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__405)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__406, dtb__407, dtb__408) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__406), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__407), dtb__408))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__409) -> (match dtb__409 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__410, dtb__411) -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__410) dtb__411)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__412, dtb__413) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__412, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__413)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__414, dtb__415) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__414), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__415)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__416, dtb__417, dtb__418) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__416), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__417), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__418)))
  | _ -> t
)))
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel defName dName appPos depth alt -> (if (fuel <= 0) then alt else (match alt with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__419, dtb__420, dtb__421) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__419, dtb__420, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (Base_dList.v_Base_dList_dlength dtb__420))) dtb__421)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel defName dName appPos depth g args -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((Base_dList.v_Base_dList_dlength args2) > appPos) else false) then (depth > appPos) else false) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dName, ((depth - appPos) - 1))), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega))) args2)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (g))) args2))) ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) args))))

let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName dName appPos depth t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))

let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName dName appPos t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t))

let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName ec ty body baseIdx nGroups k groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__422, dtb__423) -> (match dtb__422 with
  | C_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup (dtb__424, dtb__425, dtb__426) -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__423)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__426))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__424))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) (baseIdx + 2)) dtb__426) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__424) dName) (baseIdx + 2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) finalPos) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote finalPos) dtb__425)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__424)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (ty, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (body, ec))))
  | _ -> failwith "DT: impossible branch"
)) groups))

let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (ty, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (body, ec))))
  | _ -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty) - 1)))) (Base_dList.v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))
))

let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName dName appPos depth alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))

let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName dName appPos depth g args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__427, dtb__428) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__427) = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__428)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__427, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__428))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__429, dtb__430) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__429)) dtb__430)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__431, dtb__432) -> (match dtb__431 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__433, dtb__434) -> (match dtb__433 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__435, dtb__436, dtb__437, dtb__438) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__431, dtb__432))))) mc3) dtb__438) dtb__436) dtb__435)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__439, dtb__440) -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__441, dtb__442) -> (match dtb__441 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__432) mc1) mc2) dtb__442) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (iname, ty)), mc4))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (inst, mc5))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (inst, mc6)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__443) -> (match dtb__443 with
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_Vuna_dCompiler_dElab_dInstCoherence_dClashOverlap -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__438) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOverlappingInstances (iname))) iname)
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_Vuna_dCompiler_dElab_dInstCoherence_dClashDuplicate -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__438) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dInstCoherence.v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash dtb__440) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__439)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__439)) mc6))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (iname, (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__439), (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__439), (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__439))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__439))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__439)) dtb__436))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__432) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc4), ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (Base_dList.v_Base_dList_dreverse mc5))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls classes globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs name -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__444) -> dtb__444
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__445, dtb__446) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__445)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__447, dtb__448) -> (match dtb__448 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__449, dtb__450) -> (match dtb__450 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__451, dtb__452) -> (match dtb__452 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__453, dtb__454) -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__446) ((Base_dList.v_Base_dList_dappend mc1) dtb__449)) dtb__454) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__447, mc3))) ((Base_dList.v_Base_dList_dappend dtb__449) mc4)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__451, mc5))) ((Base_dList.v_Base_dList_dappend dtb__453) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc3), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc4), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc6), mc2))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__455, dtb__456) -> (match dtb__455 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__457, dtb__458) -> (if (dtb__457 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__458)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__456))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl = (fun tbl name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__459) -> dtb__459
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore ecAfter srcSpan gs -> ((Base_dList.v_Base_dList_dmap (fun g -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((Base_dPair.v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl (Base_dHashMap.v_Base_dHashMap_dfromList gs)) (Base_dPair.v_Base_dPair_dfirstOf g)), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (Base_dPair.v_Base_dPair_dfirstOf g))), srcSpan)))) gs))

let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__460, dtb__461) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember (Base_dPair.v_Base_dPair_dfirstOf dtb__460)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__461) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__461) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_Vuna_dCompiler_dElab_dTypes_dDtDef ((Base_dPair.v_Base_dPair_dfirstOf dtb__460), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__460)), (Base_dPair.v_Base_dPair_dsecondOf dtb__460), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (Base_dPair.v_Base_dPair_dfirstOf dtb__460)) mc2))), mc4))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals ec srcSpans sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__462, dtb__463) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__464, dtb__465, dtb__466, dtb__467, dtb__468) -> (if dtb__465 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__467) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__466) dtb__464) dtb__467) dtb__468) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__462, dtb__463))) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__467) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__466) dtb__464) dtb__467) dtb__468) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__462, dtb__463))) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (match dtb__462 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__469, dtb__470) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__466) dtb__469) dtb__463) mc5) dtb__467) dtb__468) mc7)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__471) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__466) "_") dtb__463) mc5) dtb__467) dtb__468) mc7)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__462)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefParamsMustBeVars)
))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDefMoreParams)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (if dtb__473 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__475) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__474) dtb__472) dtb__475) dtb__476) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__475) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__474) dtb__472) dtb__475) dtb__476) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)) (fun p -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2)))))))))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)) (fun p -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2))))))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__477, dtb__478) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__477)), dtb__478))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__479, dtb__480) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__479)), dtb__480))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel globals ctx ec body expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else (match body with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__481, dtb__482, dtb__483) -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2))))))))
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488) -> (if dtb__485 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__487) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__486) dtb__484) dtb__487) dtb__488) Base_dList.C_Base_dList_dList_Base_dList_dNil) body) sp) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__487) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__486) dtb__484) dtb__487) dtb__488) Base_dList.C_Base_dList_dList_Base_dList_dNil) body) sp) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) etaName) dtb__486) dtb__487)) (fun etaRig -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__488) v)) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__489, dtb__490) -> ((fun inner2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (etaName, etaRig, inner2)), dtb__490))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__490) ctx) dtb__487) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Base_dList_dCons (0, Base_dList.C_Base_dList_dList_Base_dList_dNil))) dtb__489) else dtb__489))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (body, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (etaName, sp)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), sp)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__487) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ec2))))))))
)
)))
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel globals ctx ec rig pname pats body dom clo sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: binder check fuel exhausted")) else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) pname) rig) dom)) (fun erasure -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__491, dtb__492) -> ((fun inner2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (pname, erasure, inner2)), dtb__492))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__492) ctx) dom) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Base_dList_dCons (0, Base_dList.C_Base_dList_dList_Base_dList_dNil))) dtb__491) else dtb__491))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))

let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals ctx0 ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun globals ctx0 ec clauses expected sp -> ((fun key -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__493, dtb__494) -> (match dtb__493 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__495, dtb__496) -> (match dtb__494 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__495) then (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) dtb__495) dtb__496) expected) sp) else ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI")))
  | _ -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses)) (fun bodyExpr -> ((fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) bodyExpr) expected) sp)) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "CHECKDEF"))))) ((Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstampSample key) "MULTI"))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
)) clauses)) (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine sp))))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals ctx ec mty clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__497, dtb__498) -> (match dtb__497 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__499, dtb__500) -> ((fun clauses -> ((fun instTy -> (match clauses with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc9) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__501, dtb__502) -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__502) dtb__498) mc5) mc6) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__501, mc7))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__501, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams mc5) dtb__500)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__499) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc7), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc8), mc3))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals cls ctx nCtx headArgs ec methods sp -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) headArgs) methods) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) sp))

let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun instDecls allDecls globals classes datas ec ds -> (match ds with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__503, dtb__504) -> (match dtb__503 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__505, dtb__506, dtb__507, dtb__508) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig classes) globals) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) instDecls))) ec) dtb__508) dtb__506) dtb__505)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__509, dtb__510) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__509)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__508) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__511) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod dtb__511) dtb__507) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__512) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__508) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceUnknownMethod (dtb__512))) dtb__512)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod dtb__511) dtb__507) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__513) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__511)) dtb__513) allDecls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__514) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__514) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__508) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) dtb__511) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs dtb__509)) dtb__510) dtb__507) dtb__508)) (fun q -> ((fun nd_uscrut29 -> (match nd_uscrut29 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__515, dtb__516) -> (match dtb__516 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__517, dtb__518) -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) dtb__508) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec2)) Base_dList.C_Base_dList_dList_Base_dList_dNil) ec2)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__519, dtb__520) -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTyTerm)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__520) (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (iname, dictTerm)))))))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__509))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf dtb__509) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__511))) fields2))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__511)) dtb__506))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__519)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__515))) (Base_dPair.v_Base_dPair_dsecondOf solvedCtx))) (Base_dPair.v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__518) Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (bi_natAdd nTele nCtx))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__509)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__509)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx dtb__509))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__504) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals ec mty clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__521, dtb__522) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__521, dtb__522))) mc1) mc4) mc2) mc3) mc5) dtb__521)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__523, dtb__524) -> ((fun newDefs -> ((fun ecTbl -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo dtb__522) mc1) mc2) mc3) ((Base_dList.v_Base_dList_dappend mc4) dtb__523)) ecTbl) ((Base_dList.v_Base_dList_dappend newDefs) mc6))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__524) ((Base_dHashMap.v_Base_dHashMap_dinsertAll dtb__523) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__524))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc5) dtb__524) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.v_Base_dPair_dsecondOf dtb__521)))) dtb__523))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc6), mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun allDecls classes datas globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) Base_dList.C_Base_dList_dList_Base_dList_dNil)) ((Base_dList.v_Base_dList_dmap (fun d -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (d, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d))))) allDecls)) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__525, dtb__526) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__525, dtb__526))) Base_dList.C_Base_dList_dList_Base_dList_dNil) mc3) mc1) mc2) mc4) dtb__525)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__527, dtb__528) -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__526) mc1) mc2) ((Base_dList.v_Base_dList_dappend mc3) dtb__527)) dtb__528) ((Base_dList.v_Base_dList_dappend dtb__527) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), mc4))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls classes datas globals ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals ec clauses expected sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))

let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))
