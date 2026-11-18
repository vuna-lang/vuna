open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTrait_dInstSigInfo = { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass : string; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup = { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep : int; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras : int Base_dList.t_Base_dList_dList }

# 29 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dbindClassParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__2; Base_dPair.f_Base_dPair_dPair_second = dtb__3 } -> ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams dtb__1) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind dtb__2) dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__4, dtb__5) -> (match dtb__4 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__6; Base_dPair.f_Base_dPair_dPair_second = dtb__7 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig (fun nm -> (Base_dMaybe.v_Base_dMaybe_disJust ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup nm) mc1)))) dtb__7) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__7)))) (fun p -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__8; Base_dPair.f_Base_dPair_dPair_second = dtb__9 } -> (match dtb__9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo mc0) mc1) dtb__11) dtb__5) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys = (fun globals ec paramsKinds methods -> (((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo globals) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx)) ec) methods) Base_dList.C_Base_dList_dList_Nil))

# 47 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__12, dtb__13) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef mc0) dtb__12)) dtb__13)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc1) dtb__14), (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo dtb__15) (mc1 + 1)) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys = (fun fieldTys ty -> (((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo fieldTys) 0) ty))

# 118 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (Base_dList.C_Base_dList_dList__x58__x58_ (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf dtb__16) mc1), ((v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds dtb__17) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (match dtb__18 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__20; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__21 } -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__20, (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__24; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = dtb__25 } -> (match dtb__25 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit mc0) mc1) dtb__26) dtb__23) mc3)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer mc0) mc1) dtb__24) dtb__23) mc3)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> failwith "DT: impossible branch"
))
# 133 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit = (fun globals ec kexpr rest methods -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) kexpr)) (fun pk -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__28 } -> (match dtb__28 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__30 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) dtb__30) rest) methods)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__31; Base_dPair.f_Base_dPair_dPair_second = dtb__32 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__27, dtb__31)); Base_dPair.f_Base_dPair_dPair_second = dtb__32 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pk))))
# 140 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer = (fun globals ec pname rest methods -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds globals) ec) rest) methods)) (fun pr -> (match pr with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__33; Base_dPair.f_Base_dPair_dPair_second = dtb__34 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods), dtb__33)); Base_dPair.f_Base_dPair_dPair_second = dtb__34 }))
  | _ -> failwith "DT: impossible branch"
))))

# 146 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__35, dtb__36) -> (match dtb__35 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = dtb__38 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__37, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__38, ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis dtb__36) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__39, dtb__40) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__39, mc1, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs dtb__40) (mc1 - 1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 151 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf = (fun dname params -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dname))) ((v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs params) ((Base_dList.v_Base_dList_dlength params) - 1))))

# 159 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__41, dtb__42) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__41); Base_dPair.f_Base_dPair_dPair_second = (dtb__41).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType }, (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__42)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmethodProjType = (fun tname params pKinds methodTy -> ((fun dictPi -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis ((Base_dList.v_Base_dList_dzip params) pKinds)) dictPi)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname)) params), (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) methodTy)))))

# 174 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (match dtb__43 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = dtb__46 } -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__47, dtb__48) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjType mc0) mc1) mc2) dtb__47) }, ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip mc0) mc1) mc2) (mc3 + 1)) dtb__44) dtb__48)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmethodProjections = (fun tname params pKinds methods fieldTys -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip tname) params) pKinds) 0) methods) fieldTys))

# 220 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__49, dtb__50) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__49, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams dtb__50) mc1)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames = (fun n -> (if (n = 1) then (Base_dList.C_Base_dList_dList__x58__x58_ ("_p", Base_dList.C_Base_dList_dList_Nil)) else ((Base_dList.v_Base_dList_dmap (fun i -> ("_p" ^ ((Base_dInterp.v_Base_dInterp_dinterp (Base_dInterp.v_Interp_ua Base_dInt.v_Show_uInt)) i)))) ((Base_dList.v_Base_dList_drange 0) n))))

# 203 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque = (fun fieldOpaque ctor fieldIdx rigs nFields nParams -> ((fun arity -> ((fun dictIdx -> ((fun fieldVar -> ((fun argPairs -> ((fun applied0 -> ((fun applied -> ((fun binders -> ((fun alt -> ((fun caseTerm -> ((fun lamArgs -> ((v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams (v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames nParams)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_d", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, lamArgs)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams rigs) 0) caseTerm))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("_d", dictIdx, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), (Base_dList.C_Base_dList_dList__x58__x58_ (alt, Base_dList.C_Base_dList_dList_Nil)))))) { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = ctor; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = binders; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = applied })) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames nFields)))) (if fieldOpaque then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (((nFields - 1) - fieldIdx), Base_dList.C_Base_dList_dList_Nil))) applied0) else applied0))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms fieldVar) argPairs))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms rigs) nFields))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfieldVarName fieldIdx), ((nFields - 1) - fieldIdx), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })))) arity)) (Base_dList.v_Base_dList_dlength rigs)))

# 195 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionBody = (fun ctor fieldIdx rigs nFields nParams -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque false) ctor) fieldIdx) rigs) nFields) nParams))

# 244 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dflagAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (if (mc0 <= 0) then dtb__51 else ((v_Vuna_dCompiler_dElab_dTrait_dflagAt (mc0 - 1)) dtb__52))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__53, dtb__54) -> (match dtb__53 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = dtb__56 } -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__55; Base_dPair.f_Base_dPair_dPair_second = ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque ((v_Vuna_dCompiler_dElab_dTrait_dflagAt mc5) mc0)) mc1) mc5) ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig) dtb__57)) mc6) mc2) }, (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo mc0) mc1) mc2) dtb__54) dtb__58) (mc5 + 1)) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque = (fun flags tname nParams methods fieldTys nFields -> (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo flags) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname)) nParams) methods) fieldTys) 0) nFields))

# 228 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs = (fun tname nParams methods fieldTys nFields -> ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque ((Base_dList.v_Base_dList_dmap (fun _u -> false)) fieldTys)) tname) nParams) methods) fieldTys) nFields))

# 248 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo = (fun ctor nParams methods fieldTys idx nFields -> (((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo ((Base_dList.v_Base_dList_dmap (fun _u -> false)) fieldTys)) ctor) nParams) methods) fieldTys) idx) nFields))

# 258 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddeclTopName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 264 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (match dtb__81 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__83; Base_dPair.f_Base_dPair_dPair_second = dtb__84 } -> (match (v_Vuna_dCompiler_dElab_dTrait_ddeclTopName dtb__83) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (if (if (dtb__85 = mc1) then ((dtb__84).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = mc2) else false) then true else (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__82) mc1) mc2))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile dtb__82) mc1) mc2)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__86, dtb__87, dtb__88) -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__86)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__89, dtb__90) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 275 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__91, dtb__92) -> (match (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf dtb__91) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__93) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__93, (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__92)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__92)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType = (fun n -> (if (if (if (if (n = "Int") then true else (n = "String")) then true else (n = "Float")) then true else (n = "Array")) then true else (n = "IORef")))

# 292 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__94, dtb__95) -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile mc0) dtb__94) mc2) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile mc0) dtb__95) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (if (v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType dtb__96) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead dtb__97))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__98, dtb__99, dtb__100) -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__101, dtb__102) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__101; Base_dPair.f_Base_dPair_dPair_second = dtb__99 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__103, dtb__104) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__103; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 287 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames = (fun headExpr -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__105) -> (match dtb__105 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__106; Base_dPair.f_Base_dPair_dPair_second = dtb__107 } -> (v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf dtb__107)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr)))

# 301 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk = (fun allDecls sp cls headExpr -> ((fun file -> ((fun headNames -> (if (if (((v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile allDecls) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) file) then true else (((v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile allDecls) headNames) file)) then true else (v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead headNames))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames headExpr))) (sp).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile))

# 387 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__108, dtb__109) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__108; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__110, dtb__111, dtb__112) -> (match dtb__110 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__113, dtb__114) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__113; Base_dPair.f_Base_dPair_dPair_second = dtb__111 }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 380 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__115, dtb__116) -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts dtb__115) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc0) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc0) dtb__116)) (fun ps -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__117, ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigClass = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__118; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__119; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__120; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__121; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__122 } -> dtb__118
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigTele = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__123; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__124; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__125; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__126; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__127 } -> dtb__124
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__128; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__129; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__130; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__131; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__132 } -> dtb__130
  | _ -> failwith "DT: impossible branch"
))

# 411 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__133; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__134; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__135; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__136; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__137 } -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstSigHead = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = dtb__138; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = dtb__139; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__140; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__141; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = dtb__142 } -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__145, dtb__146) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind mc0) mc1) mc2) dtb__143) dtb__145) mc5)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc0) mc1) dtb__148) dtb__144) dtb__146) mc5)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__147, dtb__149)); Base_dPair.f_Base_dPair_dPair_second = dtb__150 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
)
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__151, dtb__152, dtb__153) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__151) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__154) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__152) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms dtb__154) dtb__155)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__156, dtb__157) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__156))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
# 504 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__158) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs dtb__159) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__160; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 }, dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm dtb__162) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__164) -> (match (v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms dtb__163) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__165) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__164, dtb__165))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_disLowerStart = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (if (dtb__166 >= 97) then (dtb__166 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 542 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dseedKindOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (match dtb__168 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = dtb__171 } -> (if (dtb__170 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__171)) else ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf mc0) dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__172, dtb__173) -> (match ((v_Vuna_dCompiler_dElab_dTrait_dseedKindOf dtb__172) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__173) mc1) mc2) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__175; Base_dPair.f_Base_dPair_dPair_second = dtb__176 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = dtb__174 }, dtb__175)); Base_dPair.f_Base_dPair_dPair_second = dtb__176 }
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__177; Base_dPair.f_Base_dPair_dPair_second = dtb__178 } -> (match dtb__177 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__179) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__173) mc1) dtb__178) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__180; Base_dPair.f_Base_dPair_dPair_second = dtb__181 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__179)) }, dtb__180)); Base_dPair.f_Base_dPair_dPair_second = dtb__181 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit dtb__173) mc1) dtb__178) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__172; Base_dPair.f_Base_dPair_dPair_second = dtb__177 }, dtb__182)); Base_dPair.f_Base_dPair_dPair_second = dtb__183 }
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

# 548 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__184, dtb__185) -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__186, dtb__187) -> (match dtb__184 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__188, dtb__189) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__188) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__188; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__186) }, ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__185) dtb__187))) else ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__185) dtb__187))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__185) dtb__187)
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (match dtb__190 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass dtb__192) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__191)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__194) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc1) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__194)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__191)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds dtb__193) dtb__195)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds mc0) mc1) dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind = (fun combined v -> ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_darityFun ((Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity v) combined)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

# 571 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__196) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__196) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__197) -> ((fun q -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar 0) q) then ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1) else q)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dtb__197))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind mc0) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))

# 566 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (match dtb__198 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = dtb__201 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__200; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind mc0) dtb__200) dtb__201) mc2) }, (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds mc0) dtb__199) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__202, dtb__203, dtb__204) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__202)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__203))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__208)) (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__209))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__211, dtb__212, dtb__213) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower dtb__211)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) dtb__212))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__214, dtb__215) -> (if (v_Vuna_dCompiler_dElab_dTrait_disLowerStart dtb__214) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__214, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 513 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceMono = (fun e -> (match (v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower e) with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

# 591 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__216, dtb__217) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__216) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__217) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__216, ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned mc0) dtb__217))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 525 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas = (fun banned combined exprs seeds ec -> (((v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit (Base_dList.v_Base_dList_dnubNames ((v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned banned) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower) exprs)))) seeds) ec))

# 600 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__220; Base_dPair.f_Base_dPair_dPair_second = dtb__221 } -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo dtb__219) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__220) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__221)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx = (fun tele -> ((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo tele) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))

# 631 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dctxDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

# 626 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue (v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__222))) mc0)) dtb__223) (mc2 + 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx = (fun info -> (((v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)) 0))

# 641 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__226; Base_dPair.f_Base_dPair_dPair_second = dtb__227 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__226, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam mc0) dtb__225)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 648 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo = (fun body remaining k -> (if (remaining <= 0) then body else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (remaining - 1)) (k + 1))))))

# 645 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam = (fun body nCtx k -> (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo body) (nCtx - k)) k))

# 635 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstValueOf = (fun info ctor fields -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam (((v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (ctor, ((Base_dList.v_Base_dList_dmap (fun t -> { Base_dPair.f_Base_dPair_dPair_first = t; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega })) fields)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) 0)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))

# 662 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__228, dtb__229) -> (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) dtb__228), mc0))) dtb__229) (mc2 - 1))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 667 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__232; Base_dPair.f_Base_dPair_dPair_second = dtb__233 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__232, true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__233, ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele mc0) dtb__231)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 654 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf = (fun info -> ((fun nCtx -> ((fun body0 -> ((fun body1 -> ((v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele body1) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx body0) (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))) (nCtx - 1)))) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info))))

# 673 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__234, dtb__235) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__234))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__236, dtb__237, dtb__238) -> (match dtb__237 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__239, dtb__240) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dargNameOf dtb__239)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
)
  | _ -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
))

# 681 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcanonicalMethodShort = (fun name -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "eq") then "==" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "neq") then "/=" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "lt") then "<" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "le") then "<=" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "gt") then ">" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "ge") then ">=" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "add") then "+" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "sub") then "-" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "mul") then "*" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "div") then "/" else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "bind") then ">>=" else ((fun other -> other) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name))))))))))))))

# 696 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsameMethodShort = (fun a b -> ((v_Vuna_dCompiler_dElab_dTrait_dcanonicalMethodShort a) = (v_Vuna_dCompiler_dElab_dTrait_dcanonicalMethodShort b)))

# 699 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_danySameMethod = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__241, dtb__242) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dsameMethodShort mc0) dtb__241) then true else ((v_Vuna_dCompiler_dElab_dTrait_danySameMethod mc0) dtb__242))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 707 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__243, dtb__244) -> (match dtb__243 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__245, dtb__246, dtb__247, dtb__248) -> (if ((v_Vuna_dCompiler_dElab_dTrait_danySameMethod (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__245)) mc0) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__244) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__245)))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo mc0) dtb__244)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 703 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf m)))) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods)) methods))

# 725 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__249, dtb__250) -> (match dtb__249 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__251, dtb__252, dtb__253, dtb__254) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dsameMethodShort dtb__251) mc0) then true else ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__250))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses mc0) dtb__250)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 719 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__255, dtb__256) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__255))) mc1) then ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo dtb__256) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dfirstOf dtb__255))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 716 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod = (fun cls methods -> ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) methods))

# 735 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__257, dtb__258) -> (match dtb__257 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__259; Base_dPair.f_Base_dPair_dPair_second = dtb__260 } -> (match dtb__259 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> (if (dtb__261 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__259)) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__258))
  | _ -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl mc0) dtb__258)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 742 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__266, dtb__267) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName dtb__266) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan dtb__266))) else ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mc0) dtb__267))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf = (fun cls mname decls -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__268) -> (match dtb__268 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan mname) dtb__272)
  | _ -> ((Base_dList.v_Base_dList_dlookupPair mname) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans)
)
  | _ -> ((Base_dList.v_Base_dList_dlookupPair mname) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans)
)) ((v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) decls)))

# 753 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dctorResultType = (fun cls args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))))) ((Base_dList.v_Base_dList_dmap (fun a -> { Base_dPair.f_Base_dPair_dPair_first = a; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 })) args)))

# 606 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__274, dtb__275) -> (match dtb__274 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__276; Base_dPair.f_Base_dPair_dPair_second = dtb__277 } -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass dtb__276) mc0) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc4) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownInterface (dtb__276))) dtb__276)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__278) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__278)), Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ConstraintNotDict)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength dtb__279) <> (Base_dList.v_Base_dList_dlength dtb__277)) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc4) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ConstraintNotDict) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds mc1) mc2) mc5) dtb__277) dtb__279) mc4)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains mc0) mc1) mc2) dtb__275) mc4) dtb__281)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__282; Base_dPair.f_Base_dPair_dPair_second = dtb__283 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dTrait_dctorResultType dtb__278) dtb__280), dtb__282)); Base_dPair.f_Base_dPair_dPair_second = dtb__283 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["constraint-dom: "; dtb__276; " args="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__277)); " kinds="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__279))])) else 0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal = (fun globals ec tname paramNames superParts methods methodsP pKinds fieldTys sp -> ((fun paramsKinds -> ((fun classCtx -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) globals) classCtx) superParts) sp) ec)) (fun pq -> (match pq with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__284; Base_dPair.f_Base_dPair_dPair_second = dtb__285 } -> ((fun nFields -> ((fun dname -> ((fun cname -> ((fun dapp -> ((fun ctorTy -> ((fun tele -> ((fun dd -> ((fun projs -> ((fun projSpans -> ((fun fieldCtx -> ((fun opaqueFields -> ((fun projBodies -> ((fun cls -> ((fun ec2 -> ((fun ec3 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dd; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = projs; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = cls; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = projSpans; Base_dPair.f_Base_dPair_dPair_second = ec3 } } } }))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef ec2) projBodies))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData dtb__285) dd)) cls))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassName = tname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams = paramNames; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers = dtb__284; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods = projs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys = fieldTys; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethodSpans = projSpans })) ((((((v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque opaqueFields) tname) (Base_dList.v_Base_dList_dlength paramNames)) methodsP) fieldTys) nFields))) ((Base_dList.v_Base_dList_dmap (fun t -> (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__285) fieldCtx) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv fieldCtx)) t)))) fieldTys))) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))) ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan m) })) methods))) (((((v_Vuna_dCompiler_dElab_dTrait_dmethodProjections tname) paramNames) pKinds) methodsP) fieldTys))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataName = dname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataCtors = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorName = cname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorFamily = dname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorTelescope = tele; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorType = ctorTy; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtCtor_dtCtorSpan = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }, Base_dList.C_Base_dList_dList_Nil)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataKind = ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataLinear = false; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataRepr = Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataFields = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataIsRecord = false })) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dteleOfType ctorTy))) ((v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis paramsKinds) ((v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys fieldTys) dapp)))) ((v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf dname) paramNames))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName tname))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName tname))) (Base_dList.v_Base_dList_dlength fieldTys))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTrait_dbindClassParams paramsKinds) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds)))

# 78 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds = (fun globals ec tname params supers methods methodsP pKinds sp -> ((fun paramNames -> ((fun paramsKinds -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) supers)) (fun superParts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys globals) ec) paramsKinds) methodsP)) (fun p -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal globals) (Base_dPair.v_Base_dPair_dsecondOf p)) tname) paramNames) superParts) methods) methodsP) pKinds) (Base_dPair.v_Base_dPair_dfirstOf p)) sp)))))) ((Base_dList.v_Base_dList_dzip paramNames) pKinds))) (v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames params)))

# 66 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTrait = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__286; Base_dPair.f_Base_dPair_dPair_second = dtb__287 } -> (match dtb__286 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (if ((Base_dList.v_Base_dList_dlength dtb__289) = 0) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__292) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterfaceNoParam) else ((fun methodsP -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds mc0) mc1) dtb__289) methodsP)) (fun pk -> (((((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds mc0) (Base_dPair.v_Base_dPair_dsecondOf pk)) dtb__288) dtb__289) dtb__290) dtb__291) methodsP) (Base_dPair.v_Base_dPair_dfirstOf pk)) dtb__292)))) (v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs dtb__291)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__287) "DT: internal: expected a trait declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained = (fun classes globals defined ec0 sp cls argExprs ctxParts -> ((fun ctxArgs -> ((fun banned -> ((fun combined -> ((fun kindMaybe -> (match kindMaybe with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__293) -> (if ((Base_dList.v_Base_dList_dlength dtb__293) <> (Base_dList.v_Base_dList_dlength argExprs)) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((fun seeds -> ((fun init -> ((fun tele0 -> ((fun ec1 -> ((fun teleCtx0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds globals) teleCtx0) ec1) argExprs) dtb__293) sp)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__294; Base_dPair.f_Base_dPair_dPair_second = dtb__295 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains classes) globals) teleCtx0) ctxParts) sp) dtb__295)) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__296; Base_dPair.f_Base_dPair_dPair_second = dtb__297 } -> ((fun tele -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigClass = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls); f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigTele = tele; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigCtx = dtb__296; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigArgs = dtb__294; f_Vuna_dCompiler_dElab_dTrait_dInstSigInfo_instSigHead = ((v_Vuna_dCompiler_dElab_dTrait_dctorResultType cls) dtb__294) }; Base_dPair.f_Base_dPair_dPair_second = dtb__297 }))) (((v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds combined) tele0) dtb__297))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx tele0))) (Base_dPair.v_Base_dPair_dsecondOf init))) (Base_dPair.v_Base_dPair_dfirstOf init))) (((((v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas banned) combined) ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs)) seeds) ec0))) ((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds argExprs) dtb__293)) (((v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds classes) ec0) ctxParts))))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)), Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("#inst", sp)), ((Base_dList.v_Base_dList_dappend argExprs) ctxArgs), sp)))) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned defined))) ((Base_dList.v_Base_dList_dconcatMap (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) ctxParts)))

# 422 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig = (fun classes globals defined ec0 sp headExpr ctxE -> (match (v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts headExpr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__298) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass (Base_dPair.v_Base_dPair_dfirstOf dtb__298)) classes) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownInterface ((Base_dPair.v_Base_dPair_dfirstOf dtb__298)))) (Base_dPair.v_Base_dPair_dfirstOf dtb__298))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__299) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__298) with
  | dtb__300 -> (if ((Base_dList.v_Base_dList_dlength dtb__300) <> (Base_dList.v_Base_dList_dlength (dtb__299).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassParams)) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf sp) ctxE)) (fun ctxParts -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained classes) globals) defined) ec0) sp) dtb__299) dtb__300) ctxParts))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 769 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__301, dtb__302) -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, dtb__304) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf dtb__301); Base_dPair.f_Base_dPair_dPair_second = dtb__303 }, ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields dtb__302) dtb__304)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 766 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dzipClassFields = (fun cls -> ((v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassFieldTys))

# 807 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinstArgAt = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__305, dtb__306) -> (if (mc0 <= 0) then dtb__305 else ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt (mc0 - 1)) dtb__306))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__307, dtb__308, dtb__309) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__307), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__308), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__309)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__310, dtb__311) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__310), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt mc0) mc1) mc2) alt))) dtb__311)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__312, dtb__313) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__312, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__313)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__314, dtb__315) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__314, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__315)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__316, dtb__317, dtb__318) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__316), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__317), dtb__318))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__319, dtb__320, dtb__321, dtb__322) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__319, dtb__320, dtb__321, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__322)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__323, dtb__324, dtb__325, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) mc2) dtb__326), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + 1)) dtb__327)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__328, dtb__329, dtb__330) -> (if (dtb__329 >= mc2) then (if ((dtb__329 - mc2) < mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dinstArgAt ((mc0 - 1) - (dtb__329 - mc2))) mc1)) else mc3) else mc3)
  | _ -> mc3
))
# 803 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__331; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__332; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__333 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__331; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__332; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__332))) dtb__333) }
  | _ -> failwith "DT: impossible branch"
))

# 778 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams = (fun args t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo (Base_dList.v_Base_dList_dlength args)) args) 0) t))

# 312 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dcheckSuperClasses = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__334, dtb__335) -> ((fun goal -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__336) -> (match dtb__336 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__337; Base_dPair.f_Base_dPair_dPair_second = dtb__338 } -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckSuperClasses mc0) mc1) mc2) mc3) mc4) mc5) dtb__335) dtb__338)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__339) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc4) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_SuperclassNotSatisfied (mc3, (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue goal)))) mc3) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue goal))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc7) goal) mc4))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc1) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams mc5) dtb__334))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc7))
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__340, dtb__341) -> (match dtb__340 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__342, dtb__343, dtb__344, dtb__345) -> (if ((v_Vuna_dCompiler_dElab_dTrait_dsameMethodShort dtb__342) mc0) then (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__341) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__343; Base_dPair.f_Base_dPair_dPair_second = dtb__344 }, mc2))) else (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__341) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mc0) dtb__341) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 828 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed = (fun mname decls -> (((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo mname) decls) Base_dList.C_Base_dList_dList_Nil))

# 884 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__346) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__347) -> false
  | _ -> failwith "DT: impossible branch"
))

# 876 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__348, dtb__349) -> (if (mc4 >= mc1) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__348 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__350; Base_dPair.f_Base_dPair_dPair_second = dtb__351 } -> (if (((v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc4) dtb__351)) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc4)) else ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__349))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 873 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx = (fun ctx nCtx dom ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo ctx) nCtx) dom) ec) 0) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems))

# 859 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__352, dtb__353) -> (match dtb__352 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__354; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__356; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__357; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__358; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__359 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__356) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__360) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__353) mc4) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx mc0) mc1) dtb__357) mc2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__353) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__352, mc4))) mc5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__361) -> ((fun k -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc2)) 0) dtb__356) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((v_Vuna_dCompiler_dElab_dTrait_dctxDictName k), (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0) - mc1) + k), Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__362) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc2) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__362))) dtb__353) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__356; Base_dPair.f_Base_dPair_dPair_second = k }, mc5)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__363) -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo mc0) mc1) mc2) dtb__353) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
)) ((mc1 - 1) - dtb__361))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc2) (Base_dList.v_Base_dList_dreverse mc4)) }
  | _ -> failwith "DT: impossible branch"
))

# 856 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals = (fun ctx nCtx nTele ec acc -> ((((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo ctx) nCtx) ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) acc))

# 891 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__364, dtb__365) -> (match dtb__364 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = dtb__367 } -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo mc0) dtb__365) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__366) (v_Vuna_dCompiler_dElab_dTrait_dctxDictName dtb__367)) ((dtb__367 - mc0) + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__368, dtb__369) -> (match dtb__368 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__370; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__371; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__372; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__373; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__374; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__375 } -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc6) dtb__373) then ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__376) -> (match dtb__376 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__377; Base_dPair.f_Base_dPair_dPair_second = dtb__378 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__378)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__378)) 0) dtb__372) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__377)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__379) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__369) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__372; Base_dPair.f_Base_dPair_dPair_second = dtb__377 }, mc5))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__378) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__379)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__380) -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__369) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__372; Base_dPair.f_Base_dPair_dPair_second = dtb__377 }, mc5))) dtb__378)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__381) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceContextMissing ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__373)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__373))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc6) dtb__373) mc2)) else (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo mc0) mc1) mc2) dtb__369) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__368, mc4))) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc6) (Base_dList.v_Base_dList_dreverse mc4)) }))
  | _ -> failwith "DT: impossible branch"
))

# 898 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals = (fun globals ctx sp goals acc ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo globals) ctx) sp) goals) Base_dList.C_Base_dList_dList_Nil) acc) ec))

# 922 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__382, dtb__383, dtb__384) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__382), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__383), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__384)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__385, dtb__386) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__385), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt mc0) mc1) mc2) alt))) dtb__386)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__387, dtb__388) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__387, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__388)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__389, dtb__390) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__389, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__390)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__391, dtb__392) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__391, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__392)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__393, dtb__394, dtb__395) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__393), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__394), dtb__395))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__396, dtb__397, dtb__398, dtb__399) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__396, dtb__397, dtb__398, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__399)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__400, dtb__401, dtb__402, dtb__403, dtb__404) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__400, dtb__401, dtb__402, ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) mc2) dtb__403), ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + 1)) dtb__404)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__405) -> (if (dtb__405 = mc0) then (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) mc1) else mc3)
  | _ -> mc3
))
# 942 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__406; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__407; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__408 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__406; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__407; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__407))) dtb__408) }
  | _ -> failwith "DT: impossible branch"
))

# 919 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm = (fun m rep t -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo m) rep) 0) t))

# 914 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__409, dtb__410) -> (match dtb__409 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__411; Base_dPair.f_Base_dPair_dPair_second = dtb__412 } -> (((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo mc0) dtb__410) (((v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm dtb__411) dtb__412) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__413, dtb__414) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan (Base_dPair.v_Base_dPair_dsecondOf dtb__413))
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))

# 984 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) a) b) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__415) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__416) -> false
  | _ -> failwith "DT: impossible branch"
))

# 978 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__417, dtb__418) -> (match dtb__417 with
  | { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__419; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__420; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__421 } -> (if (((v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual mc0) dtb__420) mc2) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__419; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__420; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = (Base_dList.C_Base_dList_dList__x58__x58_ (mc1, dtb__421)) }, dtb__418)) else (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__419; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__420; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__421 }, ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) mc1) mc2) dtb__418))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = mc1; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = mc2; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = Base_dList.C_Base_dList_dList_Nil }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 967 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__422, dtb__423) -> (match dtb__422 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__424; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__425; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__426; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__427; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__428; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__429 } -> (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) dtb__427) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__426) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__430) -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__423) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__423) ((((v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup mc0) dtb__426) dtb__427) mc2))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo mc0) dtb__423) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 964 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals = (fun ec -> (((v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil))

# 990 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435) -> (if dtb__432 then (1 + (v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount dtb__435)) else 0)
  | _ -> 0
))

# 997 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta = (fun ec name level m -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (name, level, Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__436) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__436))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__437) -> ec
  | _ -> failwith "DT: impossible branch"
))

# 1046 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__438, dtb__439) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas mc0) mc1) dtb__439) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__438) mc0) mc1) mc3))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 1051 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__440, dtb__441) -> ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta mc0) mc1) mc2) dtb__440)) mc1) mc2) dtb__441)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt = (fun n x xs -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dtake n) xs)) (Base_dList.C_Base_dList_dList__x58__x58_ (x, Base_dList.C_Base_dList_dList_Nil)))) ((Base_dList.v_Base_dList_ddrop n) xs)))

# 1065 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel = (fun fuel defName dName appPos depth t -> (if (fuel <= 0) then t else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__442, dtb__443, dtb__444, dtb__445) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__442, dtb__443, dtb__444, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__445)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__446, dtb__447, dtb__448, dtb__449, dtb__450) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__446, dtb__447, dtb__448, ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__449), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + 1)) dtb__450)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__451, dtb__452, dtb__453) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__451), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__452), dtb__453))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__454) -> (match dtb__454 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__455; Base_dPair.f_Base_dPair_dPair_second = dtb__456 } -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel (fuel - 1)) defName) dName) appPos) depth) dtb__455) dtb__456)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp t))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__457, dtb__458) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__457, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__458)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__459, dtb__460) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__459, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__460)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__461, dtb__462) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__461, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__462)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__463, dtb__464) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__463), ((Base_dList.v_Base_dList_dmap (fun alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel (fuel - 1)) defName) dName) appPos) depth) alt))) dtb__464)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__465, dtb__466, dtb__467) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__465), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__466), ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) dtb__467)))
  | _ -> t
)))
# 1098 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel = (fun fuel defName dName appPos depth alt -> (if (fuel <= 0) then alt else (match alt with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__468; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__469; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__470 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__468; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__469; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) (depth + (Base_dList.v_Base_dList_dlength dtb__469))) dtb__470) }
  | _ -> failwith "DT: impossible branch"
)))
# 1108 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel = (fun fuel defName dName appPos depth g args -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g)) else ((fun args2 -> (if (if (if (g = defName) then ((Base_dList.v_Base_dList_dlength args2) > appPos) else false) then (depth > appPos) else false) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) (((v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt appPos) { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dName, ((depth - appPos) - 1), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }) args2)) else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (g))) args2))) ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel (fuel - 1)) defName) dName) appPos) depth) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) args))))

# 1062 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo = (fun defName dName appPos depth t -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel 128) defName) dName) appPos) depth) t))

# 1059 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls = (fun defName dName appPos t -> (((((v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo defName) dName) appPos) 0) t))

# 1018 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo = (fun defName ec ty body baseIdx nGroups k groups -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__471, dtb__472) -> (match dtb__471 with
  | { f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupRep = dtb__473; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupDom = dtb__474; f_Vuna_dCompiler_dElab_dTrait_dDictGoalGroup_dictGoalGroupExtras = dtb__475 } -> ((fun dName -> ((fun finalPos -> ((fun dictDom -> ((fun ty2 -> ((fun body2 -> ((fun body3 -> ((fun body4 -> ((fun ec2 -> ((fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec3) ty2) body4) baseIdx) nGroups) (k + 1)) dtb__472)) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas ec2) dName) finalPos) dtb__475))) ((((v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta ec) dName) finalPos) dtb__473))) ((((v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas dName) (baseIdx + 2)) dtb__475) body3))) ((((v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls defName) dName) (baseIdx + 1)) body2))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar dtb__473) dName) (baseIdx + 2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder dName) baseIdx) body)))) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder dName) baseIdx) dictDom) ty))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (baseIdx + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (baseIdx + 1)) dtb__474)))) ((baseIdx + 1) + ((nGroups - 1) - k)))) ("d" ^ (bi_strFromInt dtb__473)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec } }
  | _ -> failwith "DT: impossible branch"
)) groups))

# 1003 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals = (fun defName ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec } }
  | _ -> ((fun groups -> ((fun nGroups -> ((fun baseIdx -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo defName) ec) ty) body) baseIdx) nGroups) 0) groups)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmaxInt 0) ((v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty) - 1)))) (Base_dList.v_Base_dList_dlength groups))) (v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals ec))
))

# 1095 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo = (fun defName dName appPos depth alt -> ((((((v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel 128) defName) dName) appPos) depth) alt))

# 1104 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine = (fun defName dName appPos depth g args -> (((((((v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel 128) defName) dName) appPos) depth) g) args))

# 1124 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__476, dtb__477) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__476) = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = mc1 }, dtb__477)) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__476, (((v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType mc0) mc1) dtb__477))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1130 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__478, dtb__479) -> ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__478)) dtb__479)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1141 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__480, dtb__481) -> (match dtb__480 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__482; Base_dPair.f_Base_dPair_dPair_second = dtb__483 } -> (match dtb__482 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__484, dtb__485, dtb__486, dtb__487) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc1) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__480, dtb__481))))) mc3) dtb__487) dtb__485) dtb__484)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__488; Base_dPair.f_Base_dPair_dPair_second = dtb__489 } -> ((fun iname -> ((fun ty -> ((fun inst -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__490; Base_dPair.f_Base_dPair_dPair_second = dtb__491 } -> (match dtb__490 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__481) mc1) mc2) dtb__491) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = ty }, mc4))) (Base_dList.C_Base_dList_dList__x58__x58_ (inst, mc5))) (Base_dList.C_Base_dList_dList__x58__x58_ (inst, mc6)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__492) -> (match dtb__492 with
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashOverlap -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__487) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OverlappingInstances (iname))) iname)
  | Vuna_dCompiler_dElab_dInstCoherence.C_Vuna_dCompiler_dElab_dInstCoherence_dInstClash_ClashDuplicate -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__487) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DuplicateInstance (iname))) iname)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dInstCoherence.v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash dtb__489) iname) (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__488)) (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__488)) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__489)) mc6)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstName = iname; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele = (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele dtb__488); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx = (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx dtb__488); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead = (v_Vuna_dCompiler_dElab_dTrait_dinstSigHead dtb__488); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__487)) })) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf dtb__488))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__488)) dtb__485))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo dtb__481) mc1) mc2) mc3) mc4) mc5) mc6)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst mc3) (Base_dList.v_Base_dList_dreverse mc5)) }))
  | _ -> failwith "DT: impossible branch"
))

# 1138 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads = (fun decls classes globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo decls) classes) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 1192 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf = (fun defs name -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefLookup name) defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__493) -> dtb__493
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0))
  | _ -> failwith "DT: impossible branch"
))

# 1201 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__494, dtb__495) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dTrait_delabTrait mc1) mc2) dtb__494)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__496; Base_dPair.f_Base_dPair_dPair_second = dtb__497 } -> (match dtb__497 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__498; Base_dPair.f_Base_dPair_dPair_second = dtb__499 } -> (match dtb__499 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__500; Base_dPair.f_Base_dPair_dPair_second = dtb__501 } -> (match dtb__501 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__502; Base_dPair.f_Base_dPair_dPair_second = dtb__503 } -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo dtb__495) ((Base_dList.v_Base_dList_dappend mc1) dtb__498)) dtb__503) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__496, mc3))) ((Base_dList.v_Base_dList_dappend dtb__498) mc4)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__500, mc5))) ((Base_dList.v_Base_dList_dappend dtb__502) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc6); Base_dPair.f_Base_dPair_dPair_second = mc2 } } } }))
  | _ -> failwith "DT: impossible branch"
))

# 1198 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabTraits = (fun decls globals ec -> (((((((v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo decls) globals) ec) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 1236 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dspanOfName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__504, dtb__505) -> (match dtb__504 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__506; Base_dPair.f_Base_dPair_dPair_second = dtb__507 } -> (if (dtb__506 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__507)) else ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName mc0) dtb__505))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1240 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl = (fun tbl name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) tbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__508) -> dtb__508
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Int"))
  | _ -> failwith "DT: impossible branch"
))

# 1186 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf = (fun ecBefore ecAfter srcSpan gs -> ((Base_dList.v_Base_dList_dmap (fun g -> (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf g), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) gs)) (Base_dPair.v_Base_dPair_dfirstOf g)), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ecAfter) ((v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ecAfter)) (Base_dPair.v_Base_dPair_dfirstOf g))), srcSpan)))) gs))

# 1229 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__509, dtb__510) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf dtb__509)) mc1) then (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__510) mc4) else (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo mc0) mc1) mc2) dtb__510) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Base_dPair.v_Base_dPair_dfirstOf dtb__509), ((v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl mc0) (Base_dPair.v_Base_dPair_dfirstOf dtb__509)), (Base_dPair.v_Base_dPair_dsecondOf dtb__509), ((v_Vuna_dCompiler_dElab_dTrait_dspanOfName (Base_dPair.v_Base_dPair_dfirstOf dtb__509)) mc2))), mc4))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc4)
  | _ -> failwith "DT: impossible branch"
))

# 1225 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf = (fun globals ec srcSpans sourceDefs -> (((((v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) sourceDefs))) srcSpans) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) Base_dList.C_Base_dList_dList_Nil))

# 1255 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__511, dtb__512) -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "binder check") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__513, dtb__514, dtb__515, dtb__516, dtb__517) -> (if dtb__514 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__516) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__515) dtb__513) dtb__516) dtb__517) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__511, dtb__512))) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__516) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__515) dtb__513) dtb__516) dtb__517) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__511, dtb__512))) mc5) mc7) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else (match dtb__511 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__518, dtb__519) -> ((((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__515) dtb__518) dtb__512) mc5) dtb__516) dtb__517) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanAtName dtb__518) dtb__519)) mc7)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__520) -> ((((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel (mc0 - 1)) mc1) mc2) mc3) dtb__515) "_") dtb__512) mc5) dtb__516) dtb__517) dtb__520) mc7)
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__511)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DefParamsMustBeVars)
))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DefMoreParams)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "binder check") else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> (if dtb__522 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc3) dtb__524) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__523) dtb__521) dtb__524) dtb__525) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain mc2) mc3) dtb__524) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (mc0 - 1)) mc1) mc2) mc3) dtb__523) dtb__521) dtb__524) dtb__525) Base_dList.C_Base_dList_dList_Nil) mc5) mc7) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.body") (fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7)))) (fun p -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.goals") (fun _u -> ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)))) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 })))))))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.body") (fun _u -> (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE mc1) mc2) mc3) mc5) mc6)))) (fun p -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term.goals") (fun _u -> ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx mc1) mc2) (Base_dPair.v_Base_dPair_dsecondOf p)) mc7)))) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | _ -> failwith "DT: impossible branch"
))
# 1274 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__526; Base_dPair.f_Base_dPair_dPair_second = dtb__527 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, dtb__526)); Base_dPair.f_Base_dPair_dPair_second = dtb__527 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
# 1287 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel = (fun fuel globals ctx ec rig name dom clo pats body sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) expected2) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__528; Base_dPair.f_Base_dPair_dPair_second = dtb__529 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, dtb__528)); Base_dPair.f_Base_dPair_dPair_second = dtb__529 }))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue name) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))
# 1304 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel = (fun fuel globals ctx ec body expected sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "binder check") else (match body with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__530, dtb__531, dtb__532) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537) -> (if dtb__534 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__536) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__535) dtb__533) dtb__536) dtb__537) Base_dList.C_Base_dList_dList_Nil) body) sp) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__536) then (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel (fuel - 1)) globals) ctx) ec) dtb__535) dtb__533) dtb__536) dtb__537) Base_dList.C_Base_dList_dList_Nil) body) sp) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ImplicitParamKind))) else ((fun lvl -> ((fun etaName -> ((fun v -> ((fun ctx2 -> ((fun body2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) etaName) dtb__535) dtb__536)) (fun etaRig -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel (fuel - 1)) globals) ctx2) ec) body2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__537) v)) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__538; Base_dPair.f_Base_dPair_dPair_second = dtb__539 } -> ((fun inner2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (etaName, etaRig, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__539 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__539) ctx) dtb__536) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) dtb__538) else dtb__538))
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (body, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (etaName, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue etaName) dtb__536) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue etaName) lvl))) ("_arity" ^ (bi_strFromInt lvl)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckE globals) ctx) ec) body) expected)) (fun p -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx globals) ctx) (Base_dPair.v_Base_dPair_dsecondOf p)) sp)) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf p); Base_dPair.f_Base_dPair_dPair_second = ec2 }))))))
)
)))
# 1348 "Vuna/Compiler/Elab/Trait.vuna"
and v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel = (fun fuel globals ctx ec rig pname pats body dom clo binderSp sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "binder check") else ((fun lvl -> ((fun v -> ((fun ctx2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) pname) rig) dom)) (fun erasure -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel (fuel - 1)) globals) ctx2) ec) pats) body) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) sp)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__540; Base_dPair.f_Base_dPair_dPair_second = dtb__541 } -> ((fun inner2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (pname, erasure, binderSp, inner2)); Base_dPair.f_Base_dPair_dPair_second = dtb__541 }))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__541) ctx) dom) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList__x58__x58_ (0, Base_dList.C_Base_dList_dList_Nil))) dtb__540) else dtb__540))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) dom) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue pname) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))

# 1399 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckBinders = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel 512) a1) a2) a3) a4) a5) a6) a7))

# 1248 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn = (fun globals ctx0 ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckBinders globals) ctx0) ec) pats) body) expected) sp))

# 1252 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dcheckDef = (fun globals ec pats body expected sp -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) pats) body) expected) sp))

# 1379 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti = (fun globals ctx0 ec clauses expected sp -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.pats") (fun _u -> ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats ec) ctx0) expected) clauses)))) (fun r -> (match r with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__542; Base_dPair.f_Base_dPair_dPair_second = dtb__543 } -> ((fun table -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.pats") (fun _u -> ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr table) dtb__542)))) (fun bodyExpr -> ((fun _u -> ((fun checked -> ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.coverage") (fun _u -> ((((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive table) (fun _u -> (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmatrixOf dtb__542))) (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan dtb__542)) checked)))) ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term") (fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn globals) ctx0) dtb__543) Base_dList.C_Base_dList_dList_Nil) bodyExpr) expected) sp))))) (if (dtp_debug_on 0) then (dtp_debug_line "CHECKDEF") else 0))))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__543))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "MULTI") else 0)))

# 1370 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__544, dtb__545) -> (match dtb__544 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__546; Base_dPair.f_Base_dPair_dPair_second = dtb__547 } -> (match dtb__545 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__546) then ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.term") (fun _u -> (((((((v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn mc0) mc1) mc2) dtb__546) dtb__547) mc4) mc5))) else ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti mc0) mc1) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__546; Base_dPair.f_Base_dPair_dPair_second = dtb__547 }, Base_dList.C_Base_dList_dList_Nil))) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti mc0) mc1) mc2) mc3) mc4) mc5)
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc5) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FunctionNoClauses)
  | _ -> failwith "DT: impossible branch"
))

# 843 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn = (fun globals ctx ec mty clauses -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) ctx) ec) clauses) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) mty)) (v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf clauses)))

# 811 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__548, dtb__549) -> (match dtb__548 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__550; Base_dPair.f_Base_dPair_dPair_second = dtb__551 } -> ((fun clauses -> ((fun instTy -> (match clauses with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 mc9) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn mc0) mc1) mc3) instTy) clauses)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__552; Base_dPair.f_Base_dPair_dPair_second = dtb__553 } -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo mc0) mc1) mc2) dtb__553) dtb__549) mc5) mc6) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__552, mc7))) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__552; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, mc8))) mc9)
  | _ -> failwith "DT: impossible branch"
)))
)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) mc2) ((v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams mc5) dtb__551)))) ((v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed dtb__550) mc6))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc8); Base_dPair.f_Base_dPair_dPair_second = mc3 } }))
  | _ -> failwith "DT: impossible branch"
))

# 761 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx = (fun globals cls ctx nCtx headArgs ec methods sp -> ((((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo globals) ctx) nCtx) ec) (v_Vuna_dCompiler_dElab_dTrait_dzipClassFields cls)) headArgs) methods) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) sp))

# 322 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass = (fun globals allDecls cls info ec0 headExpr methods msp -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__554) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 msp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceUnknownMethod (dtb__554))) dtb__554)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod cls) methods) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__555) -> (match (((v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf cls) dtb__555) allDecls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__556) -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__556) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 msp) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceMissingMethod)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun bodyCtx -> ((fun nCtx -> ((fun nTele -> ((fun bodyDepth -> ((fun iname -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_dcheckSuperClasses globals) bodyCtx) nCtx) iname) msp) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs info)) (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassSupers) ec0)) (fun ecSuper -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx globals) cls) bodyCtx) nCtx) (v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs info)) ecSuper) methods) msp)) (fun q -> ((fun fieldTerms -> ((fun ec1 -> ((fun solvedCtx -> ((fun ctxSubs -> ((fun ec2 -> ((fun fields1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals globals) bodyCtx) msp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) Base_dList.C_Base_dList_dList_Nil) ec2)) (fun r -> ((fun globSubs -> ((fun ec3 -> ((fun fields2 -> ((fun dictTerm -> ((fun dictTyTerm -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = dictTyTerm }, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef ec3) { Base_dPair.f_Base_dPair_dPair_first = iname; Base_dPair.f_Base_dPair_dPair_second = dictTerm }) }))) (v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf info))) (((v_Vuna_dCompiler_dElab_dTrait_dinstValueOf info) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictCtorName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls))) fields2))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo bodyDepth) globSubs)) fields1))) (Base_dPair.v_Base_dPair_dsecondOf r))) (Base_dPair.v_Base_dPair_dfirstOf r))))) ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo nCtx) ctxSubs)) fieldTerms))) (Base_dPair.v_Base_dPair_dsecondOf solvedCtx))) (Base_dPair.v_Base_dPair_dfirstOf solvedCtx))) (((((v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals bodyCtx) nCtx) nTele) ec1) Base_dList.C_Base_dList_dList_Nil))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf q)))) (Base_dPair.v_Base_dPair_dfirstOf q))))))) ((Vuna_dCompiler_dElab_dInstName.v_Vuna_dCompiler_dElab_dInstName_dinstanceName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName cls)) headExpr))) (bi_natAdd nTele nCtx))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigTele info)))) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx info)))) (v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx info))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstance = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__557; Base_dPair.f_Base_dPair_dPair_second = dtb__558 } -> (match dtb__557 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__559, dtb__560, dtb__561, dtb__562) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__562)) (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig mc3) mc2) (Vuna_dCompiler_dElab_dSig.v_Vuna_dCompiler_dElab_dSig_ddefinedNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) mc0))) mc5) dtb__562) dtb__560) dtb__559))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__563; Base_dPair.f_Base_dPair_dPair_second = dtb__564 } -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfindClass (v_Vuna_dCompiler_dElab_dTrait_dinstSigClass dtb__563)) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__562) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InstanceHeadNotApp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__565) -> (if ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk mc1) dtb__562) dtb__565) dtb__560) then ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass mc2) mc1) dtb__565) dtb__563) dtb__564) dtb__560) dtb__561) dtb__562) else ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 dtb__562) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OrphanInstance))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt dtb__558) "DT: internal: expected an instance declaration")
)
  | _ -> failwith "DT: impossible branch"
))

# 847 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod = (fun globals ec mty clauses -> (((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) mty) clauses))

# 1168 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__566, dtb__567) -> (match (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__566, dtb__567))) mc2) mc5) mc3) mc4) mc6) dtb__566) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__568) -> (if mc0 then ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo mc0) dtb__567) mc2) mc3) mc4) mc5) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddError mc6) dtb__568)) mc7) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__568)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__569) -> (match dtb__569 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__570; Base_dPair.f_Base_dPair_dPair_second = dtb__571 } -> ((fun newDefs -> ((fun ecTbl -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo mc0) dtb__567) mc2) mc3) mc4) ((Base_dList.v_Base_dList_dappend mc5) dtb__570)) ecTbl) ((Base_dList.v_Base_dList_dappend newDefs) mc7))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__571) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) dtb__570) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__571))))) ((((v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf mc6) dtb__571) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__566)))) dtb__570))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = mc6 }))
  | _ -> failwith "DT: impossible branch"
))

# 1163 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies = (fun recover allDecls classes datas globals ec -> ((((((((v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo recover) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls allDecls) Base_dList.C_Base_dList_dList_Nil)) ((Base_dList.v_Base_dList_dmap (fun d -> { Base_dPair.f_Base_dPair_dPair_first = d; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan d) })) allDecls)) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

# 1214 "Vuna/Compiler/Elab/Trait.vuna"
let rec v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__572, dtb__573) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTrait_delabInstance (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__572, dtb__573))) Base_dList.C_Base_dList_dList_Nil) mc3) mc1) mc2) mc4) dtb__572)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__574; Base_dPair.f_Base_dPair_dPair_second = dtb__575 } -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo dtb__573) mc1) mc2) ((Base_dList.v_Base_dList_dappend mc3) dtb__574)) dtb__575) ((Base_dList.v_Base_dList_dappend dtb__574) mc5))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc5); Base_dPair.f_Base_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1211 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabInstances = (fun decls classes datas globals ec -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo decls) classes) datas) globals) ec) Base_dList.C_Base_dList_dList_Nil))

# 1396 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_delabFunDef = (fun globals ec clauses expected sp -> ((((((v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) clauses) expected) sp))

# 1402 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10))

# 1406 "Vuna/Compiler/Elab/Trait.vuna"
let v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern = (fun a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 -> ((((((((((((v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel 512) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))
