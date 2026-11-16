open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTrait_dInstSigInfo = { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass : string; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup = { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep : int; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras : int Base_dList.t_Base_dList_dList }

# 26 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__2) dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Elab/Trait.vuna"
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

# 31 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals ec paramsKinds methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx)) ec) methods) Base_dList.C_Base_dList_dList_Nil))

# 44 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__12)) dtb__13)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__14), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__15) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty))

# 110 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf dtb__16) mc1), ((v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds dtb__17) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__20; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__21 } -> (Base_dList.C_Base_dList_dList_Cons (dtb__20, (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Elab/Trait.vuna"
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
# 125 "Vuna/Compiler/Elab/Trait.vuna"
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
# 132 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer = (fun globals ec pname rest methods -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) ec) rest) methods)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__33; Base_dPair.f_Base_dPair_dPair_second = dtb__34 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods), dtb__33)); Base_dPair.f_Base_dPair_dPair_second = dtb__34 }))
  | _ -> failwith "DT: impossible branch"
))))

# 138 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match dtb__35 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = dtb__38 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__37, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__38, ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis dtb__36) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__39, mc1, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs dtb__40) (mc1 - 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf = (fun dname params -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dname))) ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs params) ((Base_dList.v_Base_dList_dlength params) - 1))))

# 151 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__41); Base_dPair.f_Base_dPair_dPair_second = (dtb__41).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType }, (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__42)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmethodProjType = (fun tname params pKinds methodTy -> ((fun dictPi -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis ((Base_dList.v_Base_dList_dzip params) pKinds)) dictPi)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname)) params), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) methodTy)))))

# 166 "Vuna/Compiler/Elab/Trait.vuna"
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

# 162 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname params pKinds methods fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) params) pKinds) 0) methods) fieldTys))

# 212 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__49, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams dtb__50) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames = (fun n -> (if (n = 1) then (Base_dList.C_Base_dList_dList_Cons ("_p", Base_dList.C_Base_dList_dList_Nil)) else ((Base_dList.v_Base_dList_dmap (fun i -> ("_p" ^ ((Base_dInterp.v_Base_dInterp_dinterp (Base_dInterp.v_Interp_ua Base_dInt.v_Show_uInt)) i)))) ((Base_dList.v_Base_dList_drange 0) n))))

# 195 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque = (fun fieldOpaque ctor fieldIdx rigs nFields nParams -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied0 -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams (v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames nParams)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_d", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, lamArgs)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("_d", dictIdx, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), (Base_dList.C_Base_dList_dList_Cons (alt, Base_dList.C_Base_dList_dList_Nil)))))) { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ctor; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = binders; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = applied })) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields))) (if fieldOpaque then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (((nFields - 1) - fieldIdx), Base_dList.C_Base_dList_dList_Nil))) applied0) else applied0))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((nFields - 1) - fieldIdx), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })))) arity)) (Base_dList.v_Base_dList_dlength rigs)))

# 187 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor fieldIdx rigs nFields nParams -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque false) ctor) fieldIdx) rigs) nFields) nParams))

# 236 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dflagAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if (mc0 <= 0) then dtb__51 else ((v_Vuna_dCompiler_dElab_dTrait_dflagAt (mc0 - 1)) dtb__52))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (match dtb__53 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = dtb__56 } -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque ((v_Vuna_dCompiler_dElab_dTrait_dflagAt mc5) mc0)) mc1) mc5) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__57)) mc6) mc2) }, (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo mc0) mc1) mc2) dtb__54) dtb__58) (mc5 + 1)) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque = (fun flags tname nParams methods fieldTys nFields -> (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo flags) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) nParams) methods) fieldTys) 0) nFields))

# 83 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal = (fun globals ec tname paramNames methods methodsP pKinds fieldTys -> ((fun paramsKinds -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun fieldCtx -> ((fun opaqueFields -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dd; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = projs; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = cls; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = projSpans; Base_dPair.f_Base_dPair_dPair_second = ec3 } } } }))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData ec) dd)) cls))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = tname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = paramNames; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = projs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = fieldTys; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = projSpans })) ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque opaqueFields) tname) (Base_dList.v_Base_dList_dlength paramNames)) methodsP) fieldTys) (Base_dList.v_Base_dList_dlength methods)))) ((Base_dList.v_Base_dList_dmap (fun t -> (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec) fieldCtx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv fieldCtx)) t)))) fieldTys))) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m) })) methods))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections tname) paramNames) pKinds) methodsP) fieldTys))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = cname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = ctorTy; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = false; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = false })) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys fieldTys) dapp)))) ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf dname) paramNames))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds)))

# 75 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds = (fun globals ec tname params methods methodsP pKinds -> ((fun paramNames -> ((fun paramsKinds -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) paramsKinds) methodsP)) (fun p -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal globals) (Base_dPair.v_Base_dPair_dsecondOf p)) tname) paramNames) methods) methodsP) pKinds) (Base_dPair.v_Base_dPair_dfirstOf p))))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds))) (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames params)))

# 63 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__59; Base_dPair.f_Base_dPair_dPair_second = dtb__60 } -> (match dtb__59 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__61, dtb__62, dtb__63, dtb__64) -> (if ((Base_dList.v_Base_dList_dlength dtb__62) = 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__64) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterfaceNoParam) else ((fun methodsP -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds mc0) mc1) dtb__62) methodsP)) (fun pk -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds mc0) (Base_dPair.v_Base_dPair_dsecondOf pk)) dtb__61) dtb__62) dtb__63) methodsP) (Base_dPair.v_Base_dPair_dfirstOf pk))))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__63)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__60) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname nParams methods fieldTys nFields -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque ((Base_dList.v_Base_dList_dmap (fun _u -> false)) fieldTys)) tname) nParams) methods) fieldTys) nFields))

# 240 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun ctor nParams methods fieldTys idx nFields -> (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo ((Base_dList.v_Base_dList_dmap (fun _u -> false)) fieldTys)) ctor) nParams) methods) fieldTys) idx) nFields))

# 250 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddeclTopName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__65, dtb__66, dtb__67, dtb__68) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 256 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (match dtb__86 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__88; Base_dPair.f_Base_dPair_dPair_second = dtb__89 } -> (match (v_Vuna_dCompiler_dElab_dTrait_ddeclTopName dtb__88) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__90) -> (if (if (dtb__90 = mc1) then ((dtb__89).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = mc2) else false) then true else (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__87) mc1) mc2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__87) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__91, dtb__92, dtb__93) -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__91)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__94, dtb__95) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__94))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 267 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__96) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__98) -> (Base_dList.C_Base_dList_dList_Cons (dtb__98, (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__97)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__97)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType = (fun n -> (if (if (if (if (n = "Int") then true else (n = "String")) then true else (n = "Float")) then true else (n = "Array")) then true else (n = "IORef")))

# 284 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile mc0) dtb__99) mc2) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile mc0) dtb__100) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType dtb__101) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead dtb__102))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__103, dtb__104, dtb__105) -> (match dtb__103 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__106, dtb__107) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__106; Base_dPair.f_Base_dPair_dPair_second = dtb__104 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__108, dtb__109) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__108; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 279 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames = (fun headExpr -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> (match dtb__110 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__111; Base_dPair.f_Base_dPair_dPair_second = dtb__112 } -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__112)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr)))

# 293 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk = (fun allDecls sp cls headExpr -> ((fun file -> ((fun headNames -> (if (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile allDecls) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) file) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile allDecls) headNames) file)) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead headNames))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames headExpr))) (sp).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile))

# 367 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__113, dtb__114) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__113; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__115, dtb__116, dtb__117) -> (match dtb__115 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__118, dtb__119) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = dtb__116 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 360 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__120) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc0) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__121)) (fun ps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__122, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__123; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__124; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__125; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__126; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__127 } -> dtb__123
  | _ -> failwith "DT: impossible branch"
))

# 385 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__128; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__129; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__130; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__131; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__132 } -> dtb__129
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__133; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__134; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__135; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__136; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__137 } -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__138; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__139; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__140; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__141; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__142 } -> dtb__141
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__143; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__144; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__145; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__146; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__147 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind mc0) mc1) mc2) dtb__148) dtb__150) mc5)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__152; Base_dPair.f_Base_dPair_dPair_second = dtb__153 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc0) mc1) dtb__153) dtb__149) dtb__151) mc5)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__154; Base_dPair.f_Base_dPair_dPair_second = dtb__155 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__152, dtb__154)); Base_dPair.f_Base_dPair_dPair_second = dtb__155 }))
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

# 475 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__156, dtb__157, dtb__158) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__156) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__159) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__157) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__159) dtb__160)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__161, dtb__162) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__161))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
# 484 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__163, dtb__164) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__163) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__164) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__166) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__165; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__166))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__167, dtb__168) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__167) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__169) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms dtb__168) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__169, dtb__170))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__171, dtb__172) -> (if (dtb__171 >= 97) then (dtb__171 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dseedKindOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__174) -> (match dtb__173 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__175; Base_dPair.f_Base_dPair_dPair_second = dtb__176 } -> (if (dtb__175 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__176)) else ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf mc0) dtb__174))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf dtb__177) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__178) mc1) mc2) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__180; Base_dPair.f_Base_dPair_dPair_second = dtb__181 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = dtb__179 }, dtb__180)); Base_dPair.f_Base_dPair_dPair_second = dtb__181 }
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 } -> (match dtb__182 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__184) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__178) mc1) dtb__183) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__185; Base_dPair.f_Base_dPair_dPair_second = dtb__186 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__184)) }, dtb__185)); Base_dPair.f_Base_dPair_dPair_second = dtb__186 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__178) mc1) dtb__183) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = dtb__182 }, dtb__187)); Base_dPair.f_Base_dPair_dPair_second = dtb__188 }
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

# 528 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (match dtb__189 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__193, dtb__194) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__193) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__193; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__191) }, ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__190) dtb__192))) else ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__190) dtb__192))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__190) dtb__192)
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__195 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__197; Base_dPair.f_Base_dPair_dPair_second = dtb__198 } -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass dtb__197) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__196)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__199) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc1) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__199)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__196)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__200) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__198) dtb__200)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__196))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind = (fun combined v -> ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_darityFun ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

# 551 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__201) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__201) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__202) -> ((fun q -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) q) then ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1) else q)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__202))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 546 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (match dtb__203 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = dtb__206 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__205; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind mc0) dtb__205) dtb__206) mc2) }, (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds mc0) dtb__204) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__207, dtb__208, dtb__209) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__207)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__208))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__213)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__214))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__216, dtb__217, dtb__218) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__216)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__217))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__219, dtb__220) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__219) then (Base_dList.C_Base_dList_dList_Cons (dtb__219, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 493 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

# 571 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__221, dtb__222) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__221) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__222) else (Base_dList.C_Base_dList_dList_Cons (dtb__221, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__222))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas = (fun banned combined exprs seeds ec -> (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit (Base_dList.v_Base_dList_dnubNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))) seeds) ec))

# 581 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (match dtb__223 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__225; Base_dPair.f_Base_dPair_dPair_second = dtb__226 } -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__224) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__225) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__226)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

# 612 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

# 607 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__227))) mc0)) dtb__228) (mc2 + 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

# 622 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (match dtb__229 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__231; Base_dPair.f_Base_dPair_dPair_second = dtb__232 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__231, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__230)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 629 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body remaining k -> (if (remaining <= 0) then body else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (remaining - 1)) (k + 1))))))

# 626 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body nCtx k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (nCtx - k)) k))

# 616 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info ctor fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (ctor, ((Base_dList.v_Base_dList_dmap (fun t -> { Base_dPair.f_Base_dPair_dPair_first = t; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega })) fields)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))

# 643 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__233, dtb__234) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__233), mc0))) dtb__234) (mc2 - 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 648 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__235, dtb__236) -> (match dtb__235 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__237; Base_dPair.f_Base_dPair_dPair_second = dtb__238 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__237, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__238, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__236)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) (nCtx - 1)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

# 654 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__239, dtb__240) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__239))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__241, dtb__242, dtb__243) -> (match dtb__242 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__244)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
))

# 664 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__246, dtb__247) -> (match dtb__246 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__248, dtb__249, dtb__250, dtb__251) -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__248)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__247) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__248)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__247)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 660 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf m)))) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods)) methods))

# 682 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__252, dtb__253) -> (match dtb__252 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__254, dtb__255, dtb__256, dtb__257) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__254) = mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__253))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__253)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 676 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__258, dtb__259) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__258))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__259) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__258))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 673 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) methods))

# 692 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__260, dtb__261) -> (match dtb__260 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__262; Base_dPair.f_Base_dPair_dPair_second = dtb__263 } -> (match dtb__262 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__264, dtb__265, dtb__266, dtb__267) -> (if (dtb__264 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__261))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__261)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 698 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__268, dtb__269) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__268) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__268))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__269))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 703 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cls mname decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__270) -> (match dtb__270 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__271, dtb__272, dtb__273, dtb__274) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__273)
  | _ -> ((Base_dList.v_Base_dList_dlookupPair mname) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans)
)
  | _ -> ((Base_dList.v_Base_dList_dlookupPair mname) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans)
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) decls)))

# 709 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) ((Base_dList.v_Base_dList_dmap (fun a -> { Base_dPair.f_Base_dPair_dPair_first = a; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 })) args)))

# 587 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__275, dtb__276) -> (match dtb__275 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__277; Base_dPair.f_Base_dPair_dPair_second = dtb__278 } -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass dtb__277) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc4) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownInterface (dtb__277))) dtb__277)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__279)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__280) -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength dtb__280) <> (Base_dList.v_Base_dList_dlength dtb__278)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ConstraintNotDict) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc1) mc2) mc5) dtb__278) dtb__280) mc4)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__281; Base_dPair.f_Base_dPair_dPair_second = dtb__282 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains mc0) mc1) mc2) dtb__276) mc4) dtb__282)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__283; Base_dPair.f_Base_dPair_dPair_second = dtb__284 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__279) dtb__281), dtb__283)); Base_dPair.f_Base_dPair_dPair_second = dtb__284 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["constraint-dom: "; dtb__277; " args="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__278)); " kinds="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__280))])) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes globals defined ec0 sp cls argExprs ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun kindMaybe -> (match kindMaybe with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__285) -> (if ((Base_dList.v_Base_dList_dlength dtb__285) <> (Base_dList.v_Base_dList_dlength argExprs)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((fun seeds -> ((fun init -> ((fun tele0 -> ((fun ec1 -> ((fun teleCtx0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__285) sp)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__286; Base_dPair.f_Base_dPair_dPair_second = dtb__287 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__287)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__288; Base_dPair.f_Base_dPair_dPair_second = dtb__289 } -> ((fun tele -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls); f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = tele; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__288; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__286; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__286) }; Base_dPair.f_Base_dPair_dPair_second = dtb__289 }))) (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds combined) tele0) dtb__289))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele0))) (Base_dPair.v_Base_dPair_dsecondOf init))) (Base_dPair.v_Base_dPair_dfirstOf init))) (((((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas banned) combined) ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs)) seeds) ec0))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds argExprs) dtb__285)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds classes) ec0) ctxParts))))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)), Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("#inst", sp)), ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs), sp)))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((Base_dList.v_Base_dList_dconcatMap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) ctxParts)))

# 402 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes globals defined ec0 sp headExpr ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__290) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass (Base_dPair.v_Base_dPair_dfirstOf dtb__290)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownInterface ((Base_dPair.v_Base_dPair_dfirstOf dtb__290)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__290))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__291) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__290) with
  | dtb__292 -> (if ((Base_dList.v_Base_dList_dlength dtb__292) <> (Base_dList.v_Base_dList_dlength (dtb__291).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__291) dtb__292) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 725 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__293, dtb__294) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__295, dtb__296) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__293); Base_dPair.f_Base_dPair_dPair_second = dtb__295 }, ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__294) dtb__296)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys))

# 763 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstArgAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__297, dtb__298) -> (if (mc0 <= 0) then dtb__297 else ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt (mc0 - 1)) dtb__298))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 737 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__299, dtb__300, dtb__301) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__299), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__300), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__301)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__302, dtb__303) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__302), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt mc0) mc1) mc2) alt))) dtb__303)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__304, dtb__305) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__304, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__305)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__306, dtb__307) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__306, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__307)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__308, dtb__309, dtb__310) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__308), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__309), dtb__310))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__311, dtb__312, dtb__313) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__311, dtb__312, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__313)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__314, dtb__315, dtb__316, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__317), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__318)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__319, dtb__320, dtb__321) -> (if (dtb__320 >= mc2) then (if ((dtb__320 - mc2) < mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt ((mc0 - 1) - (dtb__320 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
# 759 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__322; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__323; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__324 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__322; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__323; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__323))) dtb__324) }
  | _ -> failwith "DT: impossible branch"
))

# 734 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams = (fun args t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo (Base_dList.v_Base_dList_dlength args)) args) 0) t))

# 787 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__325, dtb__326) -> (match dtb__325 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__327, dtb__328, dtb__329, dtb__330) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__327) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf mc0)) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__326) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__328; Base_dPair.f_Base_dPair_dPair_second = dtb__329 }, mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__326) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__326) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 784 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) Base_dList.C_Base_dList_dList_Nil))

# 840 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__331) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__332) -> false
  | _ -> failwith "DT: impossible branch"
))

# 832 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__333, dtb__334) -> (if (mc4 >= mc1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__333 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__335; Base_dPair.f_Base_dPair_dPair_second = dtb__336 } -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__336)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__334))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 829 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx nCtx dom ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems))

# 815 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__337, dtb__338) -> (match dtb__337 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__339; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__340; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__341; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__342; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__343; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__344 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__341) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__345) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__338) mc4) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__342) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__338) (Base_dList.C_Base_dList_dList_Cons (dtb__337, mc4))) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__346) -> ((fun k -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__341) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) - mc1) + k), Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__347) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__347))) dtb__338) mc4) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__341; Base_dPair.f_Base_dPair_dPair_second = k }, mc5)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__348) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__338) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__346))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc2) (Base_dList.v_Base_dList_dreverse mc4)) }
  | _ -> failwith "DT: impossible branch"
))

# 812 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx nCtx nTele ec acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) acc))

# 847 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__349, dtb__350) -> (match dtb__349 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__351; Base_dPair.f_Base_dPair_dPair_second = dtb__352 } -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__350) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__351) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__352)) ((dtb__352 - mc0) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 857 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__353, dtb__354) -> (match dtb__353 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__356; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__357; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__358; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__359; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__360 } -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__358) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__361) -> (match dtb__361 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__362; Base_dPair.f_Base_dPair_dPair_second = dtb__363 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__363)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__363)) 0) dtb__357) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__362)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__364) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__354) mc4) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__357; Base_dPair.f_Base_dPair_dPair_second = dtb__362 }, mc5))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__363) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__364)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__365) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__354) mc4) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__357; Base_dPair.f_Base_dPair_dPair_second = dtb__362 }, mc5))) dtb__363)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__366) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceContextMissing ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__358)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__358))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__358) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__354) (Base_dList.C_Base_dList_dList_Cons (dtb__353, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc6) (Base_dList.v_Base_dList_dreverse mc4)) }))
  | _ -> failwith "DT: impossible branch"
))

# 854 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals ctx sp goals acc ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) Base_dList.C_Base_dList_dList_Nil) acc) ec))

# 878 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__367, dtb__368, dtb__369) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__367), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__368), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__369)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__370, dtb__371) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__370), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__371)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__372, dtb__373) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__372, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__373)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__374, dtb__375) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__374, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__375)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__376, dtb__377) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__376, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__377)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__378, dtb__379, dtb__380) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__378), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__379), dtb__380))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__381, dtb__382, dtb__383) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__381, dtb__382, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__383)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__384, dtb__385, dtb__386, dtb__387, dtb__388) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__384, dtb__385, dtb__386, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__387), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__388)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__389) -> (if (dtb__389 = mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
# 898 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__390; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__391; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__392 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__390; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__391; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__391))) dtb__392) }
  | _ -> failwith "DT: impossible branch"
))

# 875 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m rep t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))

# 870 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__393, dtb__394) -> (match dtb__393 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__395; Base_dPair.f_Base_dPair_dPair_second = dtb__396 } -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__394) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__395) dtb__396) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 902 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__397, dtb__398) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (Base_dPair.v_Base_dPair_dsecondOf dtb__397))
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 940 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__399) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__400) -> false
  | _ -> failwith "DT: impossible branch"
))

# 934 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__401, dtb__402) -> (match dtb__401 with
  | { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__403; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__404; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__405 } -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__404) mc2) then (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__403; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__404; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__405)) }, dtb__402)) else (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__403; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__404; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__405 }, ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__402))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = mc1; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = mc2; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = Base_dList.C_Base_dList_dList_Nil }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 923 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__406, dtb__407) -> (match dtb__406 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__408; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__409; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__410; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__411; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__412; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__413 } -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__411) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__410) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__414) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__407) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__407) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__410) dtb__411) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__407) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 920 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil))

# 946 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__415, dtb__416, dtb__417, dtb__418, dtb__419) -> (if dtb__416 then (1 + (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__419)) else 0)
  | _ -> 0
))

# 953 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec name level m -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__420) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__420))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__421) -> ec
  | _ -> failwith "DT: impossible branch"
))

# 1002 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__422, dtb__423) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__423) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__422) mc0) mc1) mc3))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1007 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__424, dtb__425) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__424)) mc1) mc2) dtb__425)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1076 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n x xs -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dtake n) xs)) (Base_dList.C_Base_dList_dList_Cons (x, Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_ddrop n) xs)))

# 1021 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel defName dName appPos depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__426, dtb__427, dtb__428) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__426, dtb__427, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__428)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__429, dtb__430, dtb__431, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__432), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__433)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__434, dtb__435, dtb__436) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__434), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__435), dtb__436))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__437) -> (match dtb__437 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__438; Base_dPair.f_Base_dPair_dPair_second = dtb__439 } -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__438) dtb__439)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__440, dtb__441) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__440, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__441)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__442, dtb__443) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__442, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__443)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__444, dtb__445) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__444, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__445)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__446, dtb__447) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__446), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__447)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__448, dtb__449, dtb__450) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__448), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__449), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__450)))
  | _ -> t
)))
# 1054 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel defName dName appPos depth alt -> (if (fuel <= 0) then alt else (match alt with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__451; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__452; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__453 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__451; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__452; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (Base_dList.v_Base_dList_dlength dtb__452))) dtb__453) }
  | _ -> failwith "DT: impossible branch"
)))
# 1064 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel defName dName appPos depth g args -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((Base_dList.v_Base_dList_dlength args2) > appPos) else false) then (depth > appPos) else false) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dName, ((depth - appPos) - 1), { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }) args2)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) args2))) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) args))))

# 1018 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName dName appPos depth t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))

# 1015 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName dName appPos t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t))

# 974 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName ec ty body baseIdx nGroups k groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__454, dtb__455) -> (match dtb__454 with
  | { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__456; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__457; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__458 } -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__455)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__458))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__456))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) (baseIdx + 2)) dtb__458) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__456) dName) (baseIdx + 2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (baseIdx + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (baseIdx + 1)) dtb__457)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__456)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec } }
  | _ -> failwith "DT: impossible branch"
)) groups))

# 959 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec } }
  | _ -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty) - 1)))) (Base_dList.v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))
))

# 1051 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName dName appPos depth alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))

# 1060 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName dName appPos depth g args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

# 1080 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__459, dtb__460) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__459) = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__460)) else (Base_dList.C_Base_dList_dList_Cons (dtb__459, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__460))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1087 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__461, dtb__462) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__461)) dtb__462)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1098 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__463, dtb__464) -> (match dtb__463 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__465; Base_dPair.f_Base_dPair_dPair_second = dtb__466 } -> (match dtb__465 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__467, dtb__468, dtb__469, dtb__470) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList_Cons (dtb__463, dtb__464))))) mc3) dtb__470) dtb__468) dtb__467)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__471; Base_dPair.f_Base_dPair_dPair_second = dtb__472 } -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__473; Base_dPair.f_Base_dPair_dPair_second = dtb__474 } -> (match dtb__473 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__464) mc1) mc2) dtb__474) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = ty }, mc4))) (Base_dList.C_Base_dList_dList_Cons (inst, mc5))) (Base_dList.C_Base_dList_dList_Cons (inst, mc6)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__475) -> (match dtb__475 with
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__470) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OverlappingInstances (iname))) iname)
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__470) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dInstCoherence.v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash dtb__472) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__471)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__471)) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__472)) mc6)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = iname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__471); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__471); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__471); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__470)) })) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__471))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__471)) dtb__468))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__464) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (Base_dList.v_Base_dList_dreverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1095 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls classes globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 1149 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs name -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__476) -> dtb__476
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1158 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__477, dtb__478) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__477)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__479; Base_dPair.f_Base_dPair_dPair_second = dtb__480 } -> (match dtb__480 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__481; Base_dPair.f_Base_dPair_dPair_second = dtb__482 } -> (match dtb__482 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__483; Base_dPair.f_Base_dPair_dPair_second = dtb__484 } -> (match dtb__484 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__485; Base_dPair.f_Base_dPair_dPair_second = dtb__486 } -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__478) ((Base_dList.v_Base_dList_dappend mc1) dtb__481)) dtb__486) (Base_dList.C_Base_dList_dList_Cons (dtb__479, mc3))) ((Base_dList.v_Base_dList_dappend dtb__481) mc4)) (Base_dList.C_Base_dList_dList_Cons (dtb__483, mc5))) ((Base_dList.v_Base_dList_dappend dtb__485) mc6))
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

# 1155 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 1194 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__487, dtb__488) -> (match dtb__487 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__489; Base_dPair.f_Base_dPair_dPair_second = dtb__490 } -> (if (dtb__489 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__490)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__488))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1198 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__491) -> dtb__491
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore ecAfter srcSpan gs -> ((Base_dList.v_Base_dList_dmap (fun g -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) gs)) (Base_dPair.v_Base_dPair_dfirstOf g)), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (Base_dPair.v_Base_dPair_dfirstOf g))), srcSpan)))) gs))

# 1187 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__492, dtb__493) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf dtb__492)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__493) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__493) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf dtb__492), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__492)), (Base_dPair.v_Base_dPair_dsecondOf dtb__492), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (Base_dPair.v_Base_dPair_dfirstOf dtb__492)) mc2))), mc4))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1182 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals ec srcSpans sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) Base_dList.C_Base_dList_dList_Nil))

# 1213 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__494, dtb__495) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> (if dtb__497 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__499) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__498) dtb__496) dtb__499) dtb__500) (Base_dList.C_Base_dList_dList_Cons (dtb__494, dtb__495))) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__499) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__498) dtb__496) dtb__499) dtb__500) (Base_dList.C_Base_dList_dList_Cons (dtb__494, dtb__495))) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else (match dtb__494 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__501, dtb__502) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__498) dtb__501) dtb__495) mc5) dtb__499) dtb__500) mc7)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__503) -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__498) "_") dtb__495) mc5) dtb__499) dtb__500) mc7)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__494)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DefParamsMustBeVars)
))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DefMoreParams)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__504, dtb__505, dtb__506, dtb__507, dtb__508) -> (if dtb__505 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__507) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__506) dtb__504) dtb__507) dtb__508) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__507) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__506) dtb__504) dtb__507) dtb__508) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term.body") (fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)))) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term.goals") (fun _u -> ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)))) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 })))))))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term.body") (fun _u -> (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)))) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term.goals") (fun _u -> ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)))) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
# 1232 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__509; Base_dPair.f_Base_dPair_dPair_second = dtb__510 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__509)); Base_dPair.f_Base_dPair_dPair_second = dtb__510 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
# 1245 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__511; Base_dPair.f_Base_dPair_dPair_second = dtb__512 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__511)); Base_dPair.f_Base_dPair_dPair_second = dtb__512 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
# 1262 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel globals ctx ec body expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else (match body with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__513, dtb__514, dtb__515) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__516, dtb__517, dtb__518, dtb__519, dtb__520) -> (if dtb__517 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__519) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__518) dtb__516) dtb__519) dtb__520) Base_dList.C_Base_dList_dList_Nil) body) sp) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__519) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__518) dtb__516) dtb__519) dtb__520) Base_dList.C_Base_dList_dList_Nil) body) sp) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) etaName) dtb__518) dtb__519)) (fun etaRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__520) v)) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__521; Base_dPair.f_Base_dPair_dPair_second = dtb__522 } -> ((fun inner2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (etaName, etaRig, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__522 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__522) ctx) dtb__519) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__521) else dtb__521))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (body, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (etaName, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__519) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
)
)))
# 1304 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel globals ctx ec rig pname pats body dom clo sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) pname) rig) dom)) (fun erasure -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__523; Base_dPair.f_Base_dPair_dPair_second = dtb__524 } -> ((fun inner2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (pname, erasure, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__524 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__524) ctx) dom) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__523) else dtb__523))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))

# 1355 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

# 1206 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals ctx0 ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))

# 1210 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp))

# 1335 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti = (fun globals ctx0 ec clauses expected sp -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.pats") (fun _u -> ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats ec) ctx0) expected) clauses)))) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__525; Base_dPair.f_Base_dPair_dPair_second = dtb__526 } -> ((fun table -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.pats") (fun _u -> ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr table) dtb__525)))) (fun bodyExpr -> ((fun _u -> ((fun checked -> ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.coverage") (fun _u -> ((((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive table) (fun _u -> (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmatrixOf dtb__525))) (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan dtb__525)) checked)))) ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term") (fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) dtb__526) Base_dList.C_Base_dList_dList_Nil) bodyExpr) expected) sp))))) (if (dtp_debug_on 0) then (dtp_debug_line "CHECKDEF") else 0))))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__526))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "MULTI") else 0)))

# 1326 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__527, dtb__528) -> (match dtb__527 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__529; Base_dPair.f_Base_dPair_dPair_second = dtb__530 } -> (match dtb__528 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__529) then ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.term") (fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn mc0) mc1) mc2) dtb__529) dtb__530) mc4) mc5))) else ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti mc0) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__529; Base_dPair.f_Base_dPair_dPair_second = dtb__530 }, Base_dList.C_Base_dList_dList_Nil))) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti mc0) mc1) mc2) mc3) mc4) mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
))

# 799 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals ctx ec mty clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))

# 767 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__531, dtb__532) -> (match dtb__531 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__533; Base_dPair.f_Base_dPair_dPair_second = dtb__534 } -> ((fun clauses -> ((fun instTy -> (match clauses with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc9) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__535; Base_dPair.f_Base_dPair_dPair_second = dtb__536 } -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__536) dtb__532) mc5) mc6) (Base_dList.C_Base_dList_dList_Cons (dtb__535, mc7))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__535; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams mc5) dtb__534)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__533) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc8); Base_dPair.f_Base_dPair_dPair_second = mc3 } }))
  | _ -> failwith "DT: impossible branch"
))

# 717 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals cls ctx nCtx headArgs ec methods sp -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) headArgs) methods) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) sp))

# 303 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass = (fun globals allDecls cls info ec0 headExpr methods msp -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__537) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 msp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceUnknownMethod (dtb__537))) dtb__537)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__538) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf cls) dtb__538) allDecls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__539) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__539) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 msp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs info)) ec0) methods) msp)) (fun q -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__540; Base_dPair.f_Base_dPair_dPair_second = dtb__541 } -> (match dtb__541 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__542; Base_dPair.f_Base_dPair_dPair_second = dtb__543 } -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) msp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) Base_dList.C_Base_dList_dList_Nil) ec2)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__544; Base_dPair.f_Base_dPair_dPair_second = dtb__545 } -> ((fun fields2 -> ((fun iname -> ((fun dictTerm -> ((fun dictTyTerm -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = dictTyTerm }, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef dtb__545) { Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = dictTerm }) }))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf info) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))) fields2))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) headExpr))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) dtb__544)) fields1))
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) dtb__540))) (Base_dPair.v_Base_dPair_dsecondOf solvedCtx))) (Base_dPair.v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) dtb__543) Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) (bi_natAdd nTele nCtx))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx info))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 341 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__546; Base_dPair.f_Base_dPair_dPair_second = dtb__547 } -> (match dtb__546 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__548, dtb__549, dtb__550, dtb__551) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan dtb__551)) (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc3) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) mc0))) mc5) dtb__551) dtb__549) dtb__548))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__552; Base_dPair.f_Base_dPair_dPair_second = dtb__553 } -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__552)) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__551) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__554) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk mc1) dtb__551) dtb__554) dtb__549) then ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass mc2) mc1) dtb__554) dtb__552) dtb__553) dtb__549) dtb__550) dtb__551) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__551) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__547) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 803 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals ec mty clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses))

# 1125 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__555, dtb__556) -> (match (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Cons (dtb__555, dtb__556))) mc2) mc5) mc3) mc4) mc6) dtb__555) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__557) -> (if mc0 then ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo mc0) dtb__556) mc2) mc3) mc4) mc5) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddError mc6) dtb__557)) mc7) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__557)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__558) -> (match dtb__558 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__559; Base_dPair.f_Base_dPair_dPair_second = dtb__560 } -> ((fun newDefs -> ((fun ecTbl -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo mc0) dtb__556) mc2) mc3) mc4) ((Base_dList.v_Base_dList_dappend mc5) dtb__559)) ecTbl) ((Base_dList.v_Base_dList_dappend newDefs) mc7))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__560) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) dtb__559) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__560))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc6) dtb__560) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__555)))) dtb__559))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = mc6 }))
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun recover allDecls classes datas globals ec -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo recover) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) Base_dList.C_Base_dList_dList_Nil)) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = d; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d) })) allDecls)) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

# 1171 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__561, dtb__562) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList_Cons (dtb__561, dtb__562))) Base_dList.C_Base_dList_dList_Nil) mc3) mc1) mc2) mc4) dtb__561)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = dtb__564 } -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__562) mc1) mc2) ((Base_dList.v_Base_dList_dappend mc3) dtb__563)) dtb__564) ((Base_dList.v_Base_dList_dappend dtb__563) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1168 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls classes datas globals ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

# 1352 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals ec clauses expected sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))

# 1358 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 1362 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))
