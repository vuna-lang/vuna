open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder = { f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName : string; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel : int; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue }
and t_Vuna_dCompiler_dElab_dDriver_dDictSubst = { f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta : int; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName : string; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ : int }
and t_Vuna_dCompiler_dElab_dDriver_dElabCore = { f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans : (string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal : string; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName : string }

# 38 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcountNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dcountNames dtb__1) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__0) (cur + 1)) mc1))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__0) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> dtb__2
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dshowCounters = (fun names -> ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" [((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) (Base_dPair.v_Base_dPair_dfirstOf p)); "="; ((Base_dInterp.v_Base_dInterp_dinterp (Base_dInterp.v_Interp_ua Base_dInt.v_Show_uInt)) (Base_dPair.v_Base_dPair_dsecondOf p))]))) ((Base_dSort.v_Base_dSort_dsortBy (fun a b -> (((Base_dOrd.v_Base_dOrd_d_x60_ Base_dString.v_Ord_uString) (Base_dPair.v_Base_dPair_dfirstOf a)) (Base_dPair.v_Base_dPair_dfirstOf b)))) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) ((v_Vuna_dCompiler_dElab_dDriver_dcountNames names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))))))

# 98 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if dtb__4 then ((fun domVal -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__3) domVal) mc0)) dtb__7)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) dtb__6)) else mc0)
  | _ -> mc0
))

# 95 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx = (fun ty0 -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty0))

# 140 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__8, dtb__9, dtb__10) -> (match dtb__8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__11, dtb__12) -> (if (dtb__11 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName) then (if ((Base_dList.v_Base_dList_dlength dtb__9) = 3) then true else ((Base_dList.v_Base_dList_dlength dtb__9) = 2)) else false)
  | _ -> false
)
  | _ -> false
))

# 132 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__13, dtb__14) -> ((fun r -> (if (v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr dtb__13) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__13, (Base_dPair.v_Base_dPair_dfirstOf r))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) } else { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf r); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__13, (Base_dPair.v_Base_dPair_dsecondOf r))) })) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx dtb__14))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmemberSugarExpr = (fun ec e -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__15, dtb__16, dtb__17) -> (match dtb__15 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__18, dtb__19) -> (match dtb__16 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__18 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__18, dtb__19)), (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName, dtb__17)), (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__20, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, Base_dList.C_Base_dList_dList_Nil)))), dtb__17)), (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__24, Base_dList.C_Base_dList_dList_Nil)))), dtb__17)) else e)
  | _ -> e
)
  | _ -> e
)
  | _ -> e
)
  | _ -> e
)
  | _ -> e
)
  | _ -> e
)) e))

# 153 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__26, dtb__27) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) ((v_Vuna_dCompiler_dElab_dDriver_dmemberSugarExpr mc2) dtb__26))) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__28; Base_dPair.f_Base_dPair_dPair_second = dtb__29 } -> (match dtb__29 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__30; Base_dPair.f_Base_dPair_dPair_second = dtb__31 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) mc1) dtb__31) dtb__27) mc4)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__28, dtb__32)); Base_dPair.f_Base_dPair_dPair_second = dtb__33 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigMemberName = (fun k -> ("_member" ^ (bi_strFromInt k)))

# 167 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__34, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) dtb__35) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__36, dtb__37) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev (((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder (v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2)) mc3) Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0) dtb__36) mc0)) dtb__37) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 203 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

# 193 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, dtb__38, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) dtb__39) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__40, dtb__41) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder (v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2)) mc3) dtb__40) mc0)) dtb__41) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 112 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> ((fun split -> ((fun memberExprs -> ((fun otherExprs -> ((fun leadCtx -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc4) otherExprs)) (fun parts -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses mc1)) mc0) leadCtx) parts) mc4) mc1)) (fun q -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) leadCtx) (Base_dPair.v_Base_dPair_dsecondOf q)) memberExprs) mc4)) (fun m -> ((fun doms -> ((fun ec1 -> ((fun memberDoms -> ((fun ec2 -> ((fun ty1 -> ((fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ty2; Base_dPair.f_Base_dPair_dPair_second = ec2 }))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers ty1) memberDoms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty1)))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts mc2) doms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)))) (Base_dPair.v_Base_dPair_dsecondOf m))) (Base_dPair.v_Base_dPair_dfirstOf m))) (Base_dPair.v_Base_dPair_dsecondOf q))) (Base_dPair.v_Base_dPair_dfirstOf q))))))))) (v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx mc2))) (Base_dPair.v_Base_dPair_dsecondOf split))) (Base_dPair.v_Base_dPair_dfirstOf split))) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx mc3))
))

# 81 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> (match dtb__45 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> (match dtb__47 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__48)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 } -> (match dtb__51 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders mc1) dtb__53) dtb__50) dtb__46) dtb__49)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__54; Base_dPair.f_Base_dPair_dPair_second = dtb__55 } -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__43) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = sigTy }, mc1))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__55) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__44) sigTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__55)))) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = sigTy }, mc3)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__55) 0) dtb__54))
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
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) (Base_dList.v_Base_dList_dreverse mc3)); Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun sigs globals ec -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf globals))) true)) Base_dList.C_Base_dList_dList_Nil))

# 221 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (if dtb__57 then ((fun domVal -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__56) domVal) mc1)) dtb__60) acc2)) (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc0) domVal) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName = dtb__56; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1); f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom = domVal }, mc3)) else mc3))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__59)) else (Base_dList.v_Base_dList_dreverse mc3))
  | _ -> (Base_dList.v_Base_dList_dreverse mc3)
))

# 218 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders = (fun ec ty -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo ec) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty) Base_dList.C_Base_dList_dList_Nil))

# 270 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__61) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__62) -> false
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (if (((v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches mc0) (dtb__63).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63)) else (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder mc0) dtb__64) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo = (fun ec binders goals kept acc -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__67; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__68; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__69; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__70; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__71; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__72 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__69) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__66) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__65, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder ec) binders) dtb__70) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__66) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__65, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74) -> ((fun q -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__69) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName, (dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel, Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__75) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__75))) binders) dtb__66) kept) (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta = dtb__69; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName = (dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ = q }, acc)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__76) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__66) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__65, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) (Base_dList.v_Base_dList_dreverse kept)) }
  | _ -> failwith "DT: impossible branch"
)) goals))

# 275 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts dtb__78) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (dtb__77).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta) (dtb__77).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName) (dtb__77).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals = (fun ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec }
  | _ -> (match ((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders ec) ty) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec }
  | dtb__79 -> ((fun solved -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts (Base_dPair.v_Base_dPair_dfirstOf solved)) body); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf solved) }) (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) dtb__79) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))
)
))

# 285 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__82, dtb__83, dtb__84, dtb__85) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__81) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__82) ((Base_dList.v_Base_dList_dappend cur) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__83; Base_dPair.f_Base_dPair_dPair_second = dtb__84 }, Base_dList.C_Base_dList_dList_Nil)))) mc1))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__82) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__86) -> dtb__86
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__81) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun decls -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 296 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun ec decls name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> dtb__87
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun name ec -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = dtb__89 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun defs -> ((Base_dList.v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

# 316 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__92, dtb__93, dtb__94, dtb__95) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__92, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__91)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__91)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__98; Base_dPair.f_Base_dPair_dPair_second = dtb__99 } -> (match dtb__99 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__100; Base_dPair.f_Base_dPair_dPair_second = dtb__101 } -> (match dtb__101 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__103 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__98) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__98) mc2) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__104) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AxiomWithDefinition (dtb__98))) dtb__98) else ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__97) mc1) mc2) mc3))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__98) mc2) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__98) mc1) then ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__97) mc1) mc2) mc3) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__103) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__98))) (Base_dVec.C_Base_dVec_dVec_VCons (dtb__98, Base_dVec.C_Base_dVec_dVec_Nil))))))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__103) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__98))) (Base_dVec.C_Base_dVec_dVec_VCons (dtb__98, Base_dVec.C_Base_dVec_dVec_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl = (fun decls -> (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)))

# 425 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__107, dtb__108, dtb__109) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__107; Base_dPair.f_Base_dPair_dPair_second = dtb__109 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__106)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__110, dtb__111, dtb__112, dtb__113) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__110; Base_dPair.f_Base_dPair_dPair_second = dtb__113 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__106)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__106)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl = (fun decls -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs decls)))

# 400 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs globals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) globals))) (v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl decls)) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl decls)))

# 432 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (match dtb__114 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__116, dtb__117, dtb__118, dtb__119) -> (if (dtb__116 = mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__115))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__115)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__122, dtb__123, dtb__124) -> (if (dtb__122 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__124)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__121))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__125, dtb__126, dtb__127, dtb__128) -> (if (dtb__125 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__121))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__121)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 471 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__129) -> (match dtb__129 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__130, dtb__131) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__130) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (("Array " ^ dtb__130)))) dtb__130))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

# 462 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__132) -> (match dtb__132 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__133, dtb__134) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__133) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if (dtb__133 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem mc0) dtb__135)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__134) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (dtb__133))) dtb__133)))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

# 452 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> (if (mc1 <= 0) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__138 then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) dtb__140)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__141) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__137, mc2, Base_dList.C_Base_dList_dList_Nil))))))))))
  | _ -> (if (mc1 <= 0) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) mc3))
))

# 449 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy = (fun sp tyTerm -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue sp) 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)))

# 495 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dallReplCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__142, dtb__143) -> ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__142)) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors dtb__143))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplShortName = (fun g -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot g))))

# 526 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm = (fun xs x -> ((Base_dList.v_Base_dList_dappend xs) (Base_dList.C_Base_dList_dList__x58__x58_ (x, Base_dList.C_Base_dList_dList_Nil))))

# 520 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dspineOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__144, dtb__145, dtb__146) -> (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf dtb__144) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = dtb__148 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__147; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm dtb__148) dtb__145) }
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__144, dtb__145, dtb__146)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 530 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName = "Base.Nat.Nat.Zero"

# 534 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName = "Base.Nat.Nat.Succ"

# 639 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__153; Base_dPair.f_Base_dPair_dPair_second = dtb__154 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__149)) then ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__150) dtb__152) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__153, ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__150) dtb__152))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 634 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs = (fun ctors c args -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn c) ctors) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) args)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__155)) args)
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dreplNatValue = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__156, dtb__157) -> (if (dtb__156 = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0)) else (if (dtb__156 = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (match dtb__159 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__158) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__160 + 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__156) dtb__157)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

# 646 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListNilName = "Base.List.List.Nil"

# 650 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListConsName = "Base.List.List.::"

# 653 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplPairName = "Base.Pair.Pair"

# 657 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplJustName = "Base.Maybe.Maybe.Just"

# 661 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNothingName = "Base.Maybe.Maybe.Nothing"

# 617 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disReplAtom = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__161, dtb__162) -> (if (if (if (dtb__161 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then true else (dtb__161 = v_Vuna_dCompiler_dElab_dDriver_dreplPairName)) then true else (dtb__161 = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName)) then true else ((Base_dList.v_Base_dList_dlength (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs mc0) dtb__161) dtb__162)) = 0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__163) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__164) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__165) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__166, dtb__167, dtb__168) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__169) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__170) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__171) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__172) -> true
  | _ -> false
))

# 499 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__173, dtb__174) -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor (fuel - 1)) ctors) dtb__173) dtb__174)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__175, dtb__176, dtb__177, dtb__178) -> "<\229\135\189\230\149\176>"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__179) -> "_"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__180) -> (v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__180)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__181, dtb__182, dtb__183) -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplApp (fuel - 1)) ctors) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__181, dtb__182, dtb__183)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)))
# 510 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplApp = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__184; Base_dPair.f_Base_dPair_dPair_second = dtb__185 } -> (match dtb__184 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__186) -> ((v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__186) ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) dtb__185))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)
  | _ -> failwith "DT: impossible branch"
)))
# 549 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor = (fun fuel ctors c args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun kept -> (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then "0" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__187, dtb__188) -> (match dtb__188 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__187) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (bi_strFromInt (dtb__189 + 1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then "[]" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplList (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplPairName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplPair (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplJustName) then ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary (fuel - 1)) ctors) "Just") kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName) then "Nothing" else ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) (v_Vuna_dCompiler_dElab_dDriver_dreplShortName c)) kept))))))))) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) c) args))))
# 567 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplList = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (if (mc0 <= 0) then "[]" else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (match dtb__193 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (mc0 - 1)) mc1) dtb__192) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__194) -> (String.concat "" ["["; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__190); dtb__194])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "(::)") (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__192, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "(::)") (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, dtb__191)))
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "(::)") (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__190, dtb__191)))
)) dtb__191))
  | Base_dList.C_Base_dList_dList_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
# 576 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__195, dtb__196) -> (if (dtb__195 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("]")) else (if (dtb__195 = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__197, dtb__198) -> (match dtb__198 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__199, dtb__200) -> (match dtb__200 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (fuel - 1)) ctors) dtb__199) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__201) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__197); dtb__201])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__195) dtb__196)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
# 588 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplPair = (fun fuel ctors args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__202, dtb__203) -> (match dtb__203 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__204, dtb__205) -> (match dtb__205 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__202); ", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__204); ")"])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)) args)))
# 595 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__206, dtb__207) -> (match dtb__207 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [label; " "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__206)])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)) args)))
# 601 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else (label ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) args))))
# 605 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__208, dtb__209) -> (if (mc0 <= 0) then "" else (String.concat "" [" "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__208); (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (mc0 - 1)) mc1) dtb__209)]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 611 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArg = (fun fuel ctors t -> (if (fuel <= 0) then "<\229\128\188>" else (if ((v_Vuna_dCompiler_dElab_dDriver_disReplAtom ctors) t) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t) else (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t); ")"]))))

# 492 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl = (fun datas ec v -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm 512) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors datas)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) v))))

# 713 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__210, dtb__211) -> (match dtb__210 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (if (if (dtb__212 = "Base.Record.HasField") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__212) = "HasField")) then true else (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__211))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__211)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 722 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__217, dtb__218) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (dtb__217).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) = (dtb__217).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__217, (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__218))) else (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__218))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls = (fun decls -> (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls decls))))

# 733 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__219, dtb__220) -> (match dtb__219 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__221, dtb__222, dtb__223, dtb__224) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__225, dtb__226) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__225) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__220))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__227, dtb__228, dtb__229) -> (match dtb__227 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__230, dtb__231) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__230) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__220))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__220)
)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__220)
)) dtb__222)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__220)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 744 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances = (fun globals decls -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance decls) then decls else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup "Base.Record.getField") globals) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__232) -> ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls decls) then ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls)) else decls)
  | _ -> failwith "DT: impossible branch"
)))

# 900 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__233, dtb__234) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__233) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__233)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName mc0) dtb__234))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 907 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainActionOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__235, dtb__236, dtb__237) -> (match dtb__235 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__238, dtb__239, dtb__240) -> (match dtb__238 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__241) -> (if (dtb__241 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "eff"; Base_dPair.f_Base_dPair_dPair_second = dtb__236 } else { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
))

# 914 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disNilRowTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__242, dtb__243) -> (match dtb__243 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__242 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__244) -> (dtb__244 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 921 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__245) -> (match dtb__245 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__246, dtb__247) -> (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBuiltinEffectTag dtb__246)
  | _ -> false
)
  | _ -> false
))

# 926 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dbuiltinHostLabelOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__248) -> (match dtb__248 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__249, dtb__250) -> (if (dtb__249 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__251, dtb__252) -> (match dtb__252 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__253, dtb__254) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__253))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__250) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__249, dtb__250)))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

# 933 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__255, dtb__256) -> (if (dtb__255 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then true else (if (dtb__255 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__257, dtb__258) -> (match dtb__258 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__259, dtb__260) -> (match (v_Vuna_dCompiler_dElab_dDriver_dbuiltinHostLabelOf dtb__257) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__261) -> (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel dtb__261) then (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue dtb__259) else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)) dtb__256) else false))
  | _ -> false
))

# 944 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__262, dtb__263, dtb__264) -> (match dtb__262 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__265, dtb__266, dtb__267) -> (match dtb__265 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__268) -> (if (dtb__268 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then ((fun rowV -> (if ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue mc0) rowV) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue rowV) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (match (((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) mc0) rowV) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269) -> (if (((Base_dEq.v_Base_dEq_d_x61__x61_ (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__269) Base_dList.C_Base_dList_dList_Nil) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__269)))) (Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__269)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__266)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__266))
  | _ -> failwith "DT: impossible branch"
)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc0)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__266))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
))

# 961 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__270) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__271, dtb__272) -> (match dtb__272 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dList.v_Base_dList_dmemName dtb__271) (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName, (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName, Base_dList.C_Base_dList_dList_Nil)))))))))))
  | _ -> false
)
  | _ -> false
)) dtb__270)
  | _ -> false
))

# 969 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainHasParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> true
  | _ -> false
))

# 975 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainArityErr = (fun sp ty -> ((fun st -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_MainArity (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ty)))

# 1001 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies = (fun defs -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__278) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = dtb__278 }, Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) defs))

# 1033 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing = (fun sp tyVal -> ((fun st -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))))

# 1121 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo = (fun globals ec n -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) < (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec2) (n - 1)) else ec2))) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))

# 1116 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals ec n -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> ec
  | _ -> (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec) n)
))

# 1159 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__279, dtb__280, dtb__281) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__279) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__280)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__281))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__282) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__283) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__284) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__285) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__286, dtb__287) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__286) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__287))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__288) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__292))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__293)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__298, dtb__299) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__299)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__300, dtb__301) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__301)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__302, dtb__303) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__303)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__304, dtb__305, dtb__306) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__304) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__305))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__307, dtb__308, dtb__309, dtb__310) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__310)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__314) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__315))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__316) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__317) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__318, dtb__319, dtb__320) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__321) -> (dtb__321 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 1179 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__322, dtb__323) -> (match dtb__322 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__324; Base_dPair.f_Base_dPair_dPair_second = dtb__325 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__324) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__323))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1183 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__326, dtb__327) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__326)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__327))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__328, dtb__329) -> (match dtb__328 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__330; Base_dPair.f_Base_dPair_dPair_second = dtb__331 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc1) dtb__331) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [dtb__330; " body="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__331)]))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__329) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1149 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__332) -> (String.concat "" [" (in `"; dtb__332; "`)"])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1189 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__333, dtb__334, dtb__335) -> (if (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__333) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__334)) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__335))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__336) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__337) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__338) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__339) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__340, dtb__341) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__340) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__341))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__342, dtb__343, dtb__344, dtb__345, dtb__346) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__342) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__346))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__347)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__352, dtb__353) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__353)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__354, dtb__355) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__355)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__356, dtb__357) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__357)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__358, dtb__359, dtb__360) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__358) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__359))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__361, dtb__362, dtb__363, dtb__364) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__364)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__365, dtb__366, dtb__367, dtb__368, dtb__369) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__368) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__369))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__370) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__371) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__372, dtb__373, dtb__374) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__375) -> true
  | _ -> failwith "DT: impossible branch"
))
# 1209 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__376, dtb__377) -> (match dtb__376 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__378; Base_dPair.f_Base_dPair_dPair_second = dtb__379 } -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__378) then true else (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__377))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1213 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__380, dtb__381) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__380)) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__381))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabOneDef = (fun decls globals name tyTerm sp ec -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsDefCheck "vuna.def.elab") name) (fun _u -> (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabFunDef globals) ec) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl ec) decls) name)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)) sp)))) (fun p -> ((fun _u -> ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.post") (fun _u -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__382; Base_dPair.f_Base_dPair_dPair_second = dtb__383 } -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (name, liftedTy, cleanTerm, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)))); Base_dPair.f_Base_dPair_dPair_second = ecWithDef }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) { Base_dPair.f_Base_dPair_dPair_first = name; Base_dPair.f_Base_dPair_dPair_second = cleanTerm }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) name) liftedTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta liftedBody) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody) else liftedBody))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf lifted))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals name) ec1b) tyTerm) bodyTerm1))) (Base_dPair.v_Base_dPair_dsecondOf solvedDecl))) (Base_dPair.v_Base_dPair_dfirstOf solvedDecl))) (((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals dtb__383) tyTerm) dtb__382))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("FUN " ^ name)) else 0))))) (if (dtp_debug_on 0) then (dtp_debug_line ("DEF " ^ name)) else 0)))

# 354 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dresumeBodies = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (if mc0 then ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) mc1) mc2) mc3) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddError mc5) mc6)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (mc6))))
# 361 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__384, dtb__385) -> (match dtb__384 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__386, dtb__387, dtb__388, dtb__389) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__386) mc2) mc5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__389) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__386))) dtb__386) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__390) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) mc4) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__391) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__385) mc2) mc3) mc4) mc5) dtb__391)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__392) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__386) mc5) then ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) mc4) mc5) else (match ((((((v_Vuna_dCompiler_dElab_dDriver_delabOneDef (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__384, dtb__385))) mc2) dtb__386) dtb__392) dtb__389) mc5) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__393) -> (match dtb__393 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__394; Base_dPair.f_Base_dPair_dPair_second = dtb__395 } -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__386; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__394) }, mc3))) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__394, mc4))) dtb__395)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__396) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__385) mc2) mc3) mc4) mc5) dtb__396)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__397, dtb__398, dtb__399) -> (if ((Base_dString.v_Base_dString_dstartsWith "vuna_seal_") dtb__397) then ((fun target -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRemoveDefTbl target) mc5))) (((dtp_substring 10) ((bi_strLength dtb__397) - 10)) dtb__397)) else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__397) mc2) mc5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__399) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__397))) dtb__397) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__400) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) mc4) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__401) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__385) mc2) mc3) mc4) mc5) dtb__401)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__402) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__397, dtb__402, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__399)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__403, dtb__404, dtb__405, dtb__406) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__403) mc2) mc5) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__406) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__403))) dtb__403) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__407) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) mc4) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__408) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__385) mc2) mc3) mc4) mc5) dtb__408)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__409) -> (match ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy dtb__406) dtb__409) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__410) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__385) mc2) mc3) mc4) mc5) dtb__410)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__411) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__403, dtb__409, dtb__404, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__406)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__385) mc2) mc3) mc4) mc5)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc4); Base_dPair.f_Base_dPair_dPair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

# 1106 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec defs -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__412) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__412) then (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__412), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))) else d)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

# 822 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux = (fun recover startEc startGlobals records decls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dData.v_Vuna_dCompiler_dElab_dData_delabDatas ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) Base_dList.C_Base_dList_dList_Nil)) records) startGlobals) startEc)) (fun pd -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__413; Base_dPair.f_Base_dPair_dPair_second = dtb__414 } -> (match dtb__414 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__415; Base_dPair.f_Base_dPair_dPair_second = dtb__416 } -> ((fun ec0b -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabTraits ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) Base_dList.C_Base_dList_dList_Nil)) dtb__415) ec0b)) (fun pt -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__417; Base_dPair.f_Base_dPair_dPair_second = dtb__418 } -> (match dtb__418 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__419; Base_dPair.f_Base_dPair_dPair_second = dtb__420 } -> (match dtb__420 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__421; Base_dPair.f_Base_dPair_dPair_second = dtb__422 } -> (match dtb__422 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__423; Base_dPair.f_Base_dPair_dPair_second = dtb__424 } -> ((fun globals1 -> ((fun datas1 -> ((fun classesAll -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) Base_dList.C_Base_dList_dList_Nil)) classesAll) globals1) dtb__424)) (fun pih -> (match pih with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__425; Base_dPair.f_Base_dPair_dPair_second = dtb__426 } -> ((fun globals2 -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__426)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__427; Base_dPair.f_Base_dPair_dPair_second = dtb__428 } -> ((fun ec2b -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__427) decls)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.bodies") (fun _u -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies recover) decls) dtb__427) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) ec2b)))) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__429; Base_dPair.f_Base_dPair_dPair_second = dtb__430 } -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies recover) decls) classesAll) datas1) dtb__427) ec3)) (fun pi -> (match pi with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__431; Base_dPair.f_Base_dPair_dPair_second = dtb__432 } -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas = datas1; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc = ec4; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs = defs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs = instDefs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals = dtb__427; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans = dtb__423 }))) (if (dtp_debug_on 0) then (dtp_debug_line "instbodies-done") else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__431))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__427) dtb__432) 8))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsAudit dtb__430) then "inst-index=ok" else "inst-index=MISMATCH")) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["bodies-done g="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__427)); " sols="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols dtb__430))); " defs="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__430))); " metas="; (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext dtb__430)); " dgoals="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending dtb__430))); " datas="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__430))); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__430))); " classes="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__430))); " counters="; (v_Vuna_dCompiler_dElab_dDriver_dshowCounters (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decCounters dtb__430))])) else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__429))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__427) dtb__430) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "sigs-elab-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__428) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__427))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "instheads-done") else 0))) ((Base_dList.v_Base_dList_dappend globals1) dtb__425))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "traits-done") else 0))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__424))) ((Base_dList.v_Base_dList_dappend dtb__413) dtb__417))) ((Base_dList.v_Base_dList_dappend dtb__415) dtb__419))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (if (dtp_debug_on 0) then (dtp_debug_line "datas-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__416) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__416))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (if (dtp_debug_on 0) then (dtp_debug_line "collectSigs-done") else 0)))))

# 1014 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo = (fun ec globals defs sp tyVal -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Show") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__433) -> ((fun mname -> ((fun dictTy -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__434) -> (match dtb__434 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__435; Base_dPair.f_Base_dPair_dPair_second = dtb__436 } -> ((fun tyTerm -> ((fun body -> ((fun def -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec) ((Base_dList.v_Base_dList_dappend defs) (Base_dList.C_Base_dList_dList__x58__x58_ (def, Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("x", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, tyTerm, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)))), body, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("x", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__435, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("x", 0, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__437) -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dictTy) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__433)), (Base_dList.C_Base_dList_dList__x58__x58_ (tyVal, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__433).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) "show"))
  | _ -> failwith "DT: impossible branch"
))

# 1007 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner = (fun ec globals defs bodies sp inner kind -> ((fun tyVal -> ((fun tyTerm -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy tyVal) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (defs)) else (((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo ec) globals) defs) sp) tyVal))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) inner))))

# 983 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow = (fun ec globals defs -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName "main") defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (defs))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__438) -> ((fun sp -> ((fun ty -> ((fun bodies -> ((fun p -> ((fun inner -> ((fun kind -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainHasParams inner) then ((v_Vuna_dCompiler_dElab_dDriver_dmainArityErr sp) inner) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck ec) globals) sp) ty)) (fun _u -> (((((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner ec) globals) defs) bodies) sp) inner) kind))))) (Base_dPair.v_Base_dPair_dfirstOf p))) (Base_dPair.v_Base_dPair_dsecondOf p))) (v_Vuna_dCompiler_dElab_dDriver_dmainActionOf ty))) (v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies defs))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__438))) (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__438) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__439) -> dtb__439
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (Base_dList.v_Base_dList_dlength (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx))

# 1221 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__440, dtb__441) -> (if ((dtb__440).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__440)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__441))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining stop sols relevant goals -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__442) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (Base_dMaybe.v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 54 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i stop sols relevant goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

# 47 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

# 1239 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 1246 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__443, dtb__444) -> (match dtb__443 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__445; Base_dPair.f_Base_dPair_dPair_second = dtb__446 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__445; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__445; Base_dPair.f_Base_dPair_dPair_second = dtb__446 }, dtb__444))) 0) mc2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) dtb__446))) }, (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__444) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1243 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (Base_dList.v_Base_dList_dlength items)))

# 1233 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols g -> { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType)); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx = (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName })

# 1260 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant = (fun decls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__447; Base_dPair.f_Base_dPair_dPair_second = dtb__448 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__448)) (fun ds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux false) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__447) ds2)) (fun core -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1270 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabGoalsWithPrepared = (fun startEc startGlobals termAux decls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls))) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__449; Base_dPair.f_Base_dPair_dPair_second = dtb__450 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__450)) (fun ds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux false) startEc) startGlobals) dtb__449) ds2)) (fun core -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1299 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddDatasEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__451, dtb__452) -> ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData mc0) dtb__451)) dtb__452)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1303 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddInstsEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__453, dtb__454) -> ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__453)) dtb__454)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1307 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddClassesEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__455, dtb__456) -> ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass mc0) dtb__455)) dtb__456)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1286 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_decOfProgram = (fun prog -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> ((fun ec7 -> { Base_dPair.f_Base_dPair_dPair_first = ec7; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec6) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec5) (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec4) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl ec3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty))

# 1325 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcandidateLe = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateText = dtb__457; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateSpan = dtb__458; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateReason = dtb__459 } -> (match mc1 with
  | { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateText = dtb__460; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateSpan = dtb__461; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateReason = dtb__462 } -> (dtb__457 <= dtb__460)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1322 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsortCandidates = (fun cs -> ((Base_dSort.v_Base_dSort_dsortBy v_Vuna_dCompiler_dElab_dDriver_dcandidateLe) cs))

# 1329 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinstCandidate = (fun shown i -> { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateText = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateSpan = (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateReason = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["instance head "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " does not match goal "; shown]))) })

# 1345 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__463, dtb__464) -> (if (if (dtb__463 = 32) then true else (dtb__463 = 41)) then (Base_dList.v_Base_dList_dreverse mc1) else ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar dtb__464) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__463, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1335 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown = (fun s -> ((fun cs -> ((fun body -> (Base_dList.dtp_pack ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar body) Base_dList.C_Base_dList_dList_Nil))) (match cs with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__465, dtb__466) -> (if (dtb__465 = 40) then dtb__466 else cs)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (Base_dList.dtp_unpack s)))

# 1313 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf = (fun ec shown -> ((fun fam -> ((fun insts -> (v_Vuna_dCompiler_dElab_dDriver_dsortCandidates ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dinstCandidate shown)) insts))) (if (fam = "") then (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) fam)))) (v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown shown)))

# 1351 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated = (fun ec m d -> (match ((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf ec) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldSpan ("created", dtb__467))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldNote ("metavariable created here"))) d))
  | _ -> failwith "DT: impossible branch"
))

# 675 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore = (fun prog expr -> (match prog with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__468; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__469; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__470; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__471; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__472; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__473; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__474; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__475; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__476; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__477 } -> ((fun bodies -> ((fun ec0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__472) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__478; Base_dPair.f_Base_dPair_dPair_second = dtb__479 } -> (match dtb__479 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__480; Base_dPair.f_Base_dPair_dPair_second = dtb__481 } -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__482) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__483) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__483) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__482))) dtb__482)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__482))) dtb__482)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__475) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__484) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec2) dtb__484) d))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnsolvedMetavarInfer ((bi_strFromInt dtb__484)))) (bi_strFromInt dtb__484)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__478)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__485) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (bi_strFromInt dtb__485); Base_dPair.f_Base_dPair_dPair_second = tyText }))
  | dtb__486 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl dtb__468) ec2) dtb__486); Base_dPair.f_Base_dPair_dPair_second = tyText }))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec2) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__480)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__472) dtb__481) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__475; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__471; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dList.v_Base_dList_dreverse bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__468; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__473); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__474; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__472); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__471); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = true; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__468); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__468); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__477; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = Base_dList.C_Base_dList_dList_Nil })) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__469))
  | _ -> failwith "DT: impossible branch"
))

# 670 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun prog expr -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore prog) expr))

# 664 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog expr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf p))))))

# 1130 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__487) -> ((fun spot -> ((fun goalTy -> ((fun detail -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) (dtb__487).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (dtb__487).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldSpan ("goal", (dtb__487).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldNote (("goal: " ^ goalTy)))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnsolvedHole (detail))) (Base_dVec.C_Base_dVec_dVec_VCons (detail, Base_dVec.C_Base_dVec_dVec_Nil)))))))) (String.concat "" [spot; " with goal "; goalTy]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__487)) (dtb__487).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType))) (if ((dtb__487).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = "") then "?" else ("?" ^ (dtb__487).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun num -> ((fun hint -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) m) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldName (num))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldNote (hint))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnsolvedMetavar (num, hint))) (Base_dVec.C_Base_dVec_dVec_VCons (num, (Base_dVec.C_Base_dVec_dVec_VCons (hint, Base_dVec.C_Base_dVec_dVec_Nil))))))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

# 1040 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfinishCore = (fun termAux decls core -> ((fun ec4 -> ((fun datas1 -> ((fun defs -> ((fun instDefs -> ((fun globals -> ((fun projSpans -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__488) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__489) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__489) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__488))) dtb__488)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__488))) dtb__488)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__490) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__491) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__491) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__490))) dtb__490)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__490))) dtb__490)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__492) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__493) -> ((fun cands -> ((fun createdOf -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__494) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> (createdOf ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldCandidates (cands))) d)))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__494) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__493))) dtb__493))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun d -> (createdOf ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldCandidates (cands))) d)))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__493))) dtb__493))
  | _ -> failwith "DT: impossible branch"
)) (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__495) -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__495)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__492)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf ec4) dtb__493))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__492)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun extra -> ((fun allDefs0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow ec4) globals) allDefs0)) (fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage ec4) allDefs)) (fun ec5 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTermination.v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((Base_dList.v_Base_dList_dappend termAux) decls))) (fun _u -> ((fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = datas1; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = allDefs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = globalsOut; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dInt.v_Eq_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec5)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decWarnings ec5) }))) (if (dtp_debug_on 0) then (dtp_debug_line "termination-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "extradefs-done") else 0))) ((Base_dList.v_Base_dList_dmap (fun g -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf g)) defsTblOut) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__496) -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf g); Base_dPair.f_Base_dPair_dPair_second = dtb__496 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> g
  | _ -> failwith "DT: impossible branch"
))) globals))) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun x -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName x); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType x) })) allDefs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((Base_dList.v_Base_dList_dappend instDefs) ((Base_dList.v_Base_dList_dappend extra) defs))))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf globals) ec4) projSpans) ((Base_dList.v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))

# 766 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramErrors = (fun decls -> ((fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls2)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__497; Base_dPair.f_Base_dPair_dPair_second = dtb__498 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__498)) (fun ds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux true) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__497) ds2)) (fun core -> ((fun errs -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty errs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (errs)) else (match (((v_Vuna_dCompiler_dElab_dDriver_dfinishCore Base_dList.C_Base_dList_dList_Nil) ds2) core) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__499) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__499, Base_dList.C_Base_dList_dList_Nil))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__500) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))) (Base_dList.v_Base_dList_dreverse (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decErrors (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc)))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls)))

# 1100 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux = (fun startEc startGlobals records termAux decls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux false) startEc) startGlobals) records) decls)) (fun core -> (((v_Vuna_dCompiler_dElab_dDriver_dfinishCore termAux) decls) core))))

# 793 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux = (fun startEc startGlobals termAux decls -> ((fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) decls2)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__501; Base_dPair.f_Base_dPair_dPair_second = dtb__502 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__502)) (fun ds2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls termAux)) (fun ap -> (match ap with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__503; Base_dPair.f_Base_dPair_dPair_second = dtb__504 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__504)) (fun ads2 -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) dtb__501) ads2) ds2)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls)))

# 787 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith = (fun startEc startGlobals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux startEc) startGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

# 808 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith = (fun startEc startGlobals records decls -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) records) Base_dList.C_Base_dList_dList_Nil) decls))

# 752 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls2)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__505; Base_dPair.f_Base_dPair_dPair_second = dtb__506 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__506)) (fun ds2 -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__505) ds2)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls)))

# 782 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

# 1252 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

# 1277 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog) })))))
