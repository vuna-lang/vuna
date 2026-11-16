open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder = { f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName : string; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel : int; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue }
and t_Vuna_dCompiler_dElab_dDriver_dDictSubst = { f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta : int; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName : string; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ : int }
and t_Vuna_dCompiler_dElab_dDriver_dElabCore = { f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans : (string, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal : string; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName : string }

# 36 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcountNames = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dcountNames dtb__1) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__0) (cur + 1)) mc1))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__0) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> dtb__2
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dshowCounters = (fun names -> ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (fun p -> (String.concat "" [((Base_dInterp.v_Base_dInterp_dinterp Base_dInterp.v_Interp_uString) (Base_dPair.v_Base_dPair_dfirstOf p)); "="; ((Base_dInterp.v_Base_dInterp_dinterp (Base_dInterp.v_Interp_ua Base_dInt.v_Show_uInt)) (Base_dPair.v_Base_dPair_dsecondOf p))]))) ((Base_dSort.v_Base_dSort_dsortBy (fun a b -> (((Base_dOrd.v_Base_dOrd_dlt Base_dString.v_Ord_uString) (Base_dPair.v_Base_dPair_dfirstOf a)) (Base_dPair.v_Base_dPair_dfirstOf b)))) ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dString.v_Eq_uString) ((v_Vuna_dCompiler_dElab_dDriver_dcountNames names) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))))))

# 96 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if dtb__4 then ((fun domVal -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__3) domVal) mc0)) dtb__7)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) dtb__6)) else mc0)
  | _ -> mc0
))

# 93 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx = (fun ty0 -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty0))

# 138 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__8, dtb__9, dtb__10) -> (match dtb__8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__11, dtb__12) -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (match dtb__14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (match dtb__16 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__11 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMemberFamilyName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 130 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__19, dtb__20) -> ((fun r -> (if (v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr dtb__19) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__19, (Base_dPair.v_Base_dPair_dfirstOf r))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) } else { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf r); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__19, (Base_dPair.v_Base_dPair_dsecondOf r))) })) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx dtb__20))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 142 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) dtb__21)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__23; Base_dPair.f_Base_dPair_dPair_second = dtb__24 } -> (match dtb__24 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__25; Base_dPair.f_Base_dPair_dPair_second = dtb__26 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) mc1) dtb__26) dtb__22) mc4)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__28 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__27)); Base_dPair.f_Base_dPair_dPair_second = dtb__28 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigMemberName = (fun k -> ("_member" ^ (bi_strFromInt k)))

# 156 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__29, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) dtb__30) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev (((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder (v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2)) mc3) Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0) dtb__31) mc0)) dtb__32) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 192 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

# 182 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, dtb__33, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) dtb__34) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder (v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2)) mc3) dtb__35) mc0)) dtb__36) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 110 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> ((fun split -> ((fun memberExprs -> ((fun otherExprs -> ((fun leadCtx -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc4) otherExprs)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses mc1)) mc0) leadCtx) parts) mc4) mc1)) (fun q -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) leadCtx) (Base_dPair.v_Base_dPair_dsecondOf q)) memberExprs) mc4)) (fun m -> ((fun doms -> ((fun ec1 -> ((fun memberDoms -> ((fun ec2 -> ((fun ty1 -> ((fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ty2; Base_dPair.f_Base_dPair_dPair_second = ec2 }))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers ty1) memberDoms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty1)))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts mc2) doms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)))) (Base_dPair.v_Base_dPair_dsecondOf m))) (Base_dPair.v_Base_dPair_dfirstOf m))) (Base_dPair.v_Base_dPair_dsecondOf q))) (Base_dPair.v_Base_dPair_dfirstOf q))))))))) (v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx mc2))) (Base_dPair.v_Base_dPair_dsecondOf split))) (Base_dPair.v_Base_dPair_dfirstOf split))) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx mc3))
))

# 79 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__37 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__39; Base_dPair.f_Base_dPair_dPair_second = dtb__40 } -> (match dtb__40 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__41; Base_dPair.f_Base_dPair_dPair_second = dtb__42 } -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__43; Base_dPair.f_Base_dPair_dPair_second = dtb__44 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__43)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = dtb__46 } -> (match dtb__46 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__47; Base_dPair.f_Base_dPair_dPair_second = dtb__48 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders mc1) dtb__48) dtb__45) dtb__41) dtb__44)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__49; Base_dPair.f_Base_dPair_dPair_second = dtb__50 } -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__38) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__39; Base_dPair.f_Base_dPair_dPair_second = sigTy }, mc1))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__50) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__39) sigTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__50)))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__39; Base_dPair.f_Base_dPair_dPair_second = sigTy }, mc3)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__50) 0) dtb__49))
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
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend mc1) (Base_dList.v_Base_dList_dreverse mc3)); Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun sigs globals ec -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf globals))) true)) Base_dList.C_Base_dList_dList_Nil))

# 210 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> (if dtb__52 then ((fun domVal -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__51) domVal) mc1)) dtb__55) acc2)) (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc0) domVal) then (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName = dtb__51; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1); f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom = domVal }, mc3)) else mc3))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__54)) else (Base_dList.v_Base_dList_dreverse mc3))
  | _ -> (Base_dList.v_Base_dList_dreverse mc3)
))

# 207 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders = (fun ec ty -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo ec) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty) Base_dList.C_Base_dList_dList_Nil))

# 261 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__56) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__57) -> false
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if (((v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches mc0) (dtb__58).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58)) else (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder mc0) dtb__59) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo = (fun ec binders goals kept acc -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__60 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__62; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__63; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__64; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__65; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__66; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__67 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__68) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__61) (Base_dList.C_Base_dList_dList_Cons (dtb__60, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder ec) binders) dtb__65) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__61) (Base_dList.C_Base_dList_dList_Cons (dtb__60, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> ((fun q -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__64) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((dtb__69).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName, (dtb__69).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel, Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__70) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__70))) binders) dtb__61) kept) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta = dtb__64; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName = (dtb__69).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ = q }, acc)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__71) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__61) (Base_dList.C_Base_dList_dList_Cons (dtb__60, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((dtb__69).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) (Base_dList.v_Base_dList_dreverse kept)) }
  | _ -> failwith "DT: impossible branch"
)) goals))

# 266 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts dtb__73) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (dtb__72).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta) (dtb__72).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName) (dtb__72).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals = (fun ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec }
  | _ -> (match ((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders ec) ty) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec }
  | dtb__74 -> ((fun solved -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts (Base_dPair.v_Base_dPair_dfirstOf solved)) body); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf solved) }) (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) dtb__74) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))
)
))

# 276 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (match dtb__75 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__77, dtb__78, dtb__79, dtb__80) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__76) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__77) ((Base_dList.v_Base_dList_dappend cur) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__78; Base_dPair.f_Base_dPair_dPair_second = dtb__79 }, Base_dList.C_Base_dList_dList_Nil)))) mc1))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__77) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__81) -> dtb__81
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__76) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun decls -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 287 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun ec decls name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> dtb__82
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun name ec -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__84) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = dtb__84 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun defs -> ((Base_dList.v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

# 307 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (match dtb__85 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__87, dtb__88, dtb__89, dtb__90) -> (Base_dList.C_Base_dList_dList_Cons (dtb__87, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__86)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__86)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (match dtb__91 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__93; Base_dPair.f_Base_dPair_dPair_second = dtb__94 } -> (match dtb__94 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__96 } -> (match dtb__96 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__97; Base_dPair.f_Base_dPair_dPair_second = dtb__98 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__93) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__93) mc2) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__99) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AxiomWithDefinition (dtb__93))) dtb__93) else ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__92) mc1) mc2) mc3))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__93) mc2) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__93) mc1) then ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__92) mc1) mc2) mc3) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan dtb__98) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__93))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__93, Base_dVec.C_Base_dVec_dVec_Nil))))))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan dtb__98) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__93))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__93, Base_dVec.C_Base_dVec_dVec_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl = (fun decls -> (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)))

# 392 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__100 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__102, dtb__103, dtb__104) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__104 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__101)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__105, dtb__106, dtb__107, dtb__108) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__105; Base_dPair.f_Base_dPair_dPair_second = dtb__108 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__101)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__101)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl = (fun decls -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs decls)))

# 367 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs globals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) globals))) (v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl decls)) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl decls)))

# 399 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match dtb__109 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__111, dtb__112, dtb__113, dtb__114) -> (if (dtb__111 = mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__110))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__110)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (match dtb__115 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__117, dtb__118, dtb__119) -> (if (dtb__117 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__116))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__120, dtb__121, dtb__122, dtb__123) -> (if (dtb__120 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__123)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__116))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__116)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 438 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__124) -> (match dtb__124 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__125, dtb__126) -> (if (if (if (dtb__125 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__125 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__125 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (("Array " ^ dtb__125)))) dtb__125))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

# 429 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__127) -> (match dtb__127 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__128, dtb__129) -> (if (if (if (dtb__128 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__128 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__128 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (if (dtb__128 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem mc0) dtb__130)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__129) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (dtb__128))) dtb__128)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

# 419 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__133 then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) dtb__135)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__136) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__132, mc2, Base_dList.C_Base_dList_dList_Nil))))))))))
  | _ -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) mc3))
))

# 416 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy = (fun sp tyTerm -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue sp) 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)))

# 463 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dallReplCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__137)) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors dtb__138))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplShortName = (fun g -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot g))))

# 494 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm = (fun xs x -> ((Base_dList.v_Base_dList_dappend xs) (Base_dList.C_Base_dList_dList_Cons (x, Base_dList.C_Base_dList_dList_Nil))))

# 488 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dspineOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__139, dtb__140, dtb__141) -> (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf dtb__139) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm dtb__143) dtb__140) }
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__139, dtb__140, dtb__141)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 498 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName = "Base.Nat.Nat.Zero"

# 502 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName = "Base.Nat.Nat.Succ"

# 607 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (match dtb__146 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__148; Base_dPair.f_Base_dPair_dPair_second = dtb__149 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__144)) then ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__145) dtb__147) else (Base_dList.C_Base_dList_dList_Cons (dtb__148, ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__145) dtb__147))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 602 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs = (fun ctors c args -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn c) ctors) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) args)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__150)) args)
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dreplNatValue = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__151, dtb__152) -> (if (dtb__151 = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0)) else (if (dtb__151 = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (match dtb__154 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__153) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__155 + 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__151) dtb__152)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

# 614 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListNilName = "Base.List.List.Nil"

# 618 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListConsName = "Base.List.List.Cons"

# 621 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplPairName = "Base.Pair.Pair"

# 625 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplJustName = "Base.Maybe.Maybe.Just"

# 629 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNothingName = "Base.Maybe.Maybe.Nothing"

# 585 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disReplAtom = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__156, dtb__157) -> (if (if (if (dtb__156 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then true else (dtb__156 = v_Vuna_dCompiler_dElab_dDriver_dreplPairName)) then true else (dtb__156 = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName)) then true else ((Base_dList.v_Base_dList_dlength (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs mc0) dtb__156) dtb__157)) = 0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__158) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__159) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__160) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__161, dtb__162, dtb__163) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__164) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__165) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__166) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__167) -> true
  | _ -> false
))

# 467 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__168, dtb__169) -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor (fuel - 1)) ctors) dtb__168) dtb__169)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__170, dtb__171, dtb__172) -> "<\229\135\189\230\149\176>"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__173) -> "_"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__174) -> (v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__174)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__175, dtb__176, dtb__177) -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplApp (fuel - 1)) ctors) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__175, dtb__176, dtb__177)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)))
# 478 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplApp = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__178; Base_dPair.f_Base_dPair_dPair_second = dtb__179 } -> (match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__180) -> ((v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__180) ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) dtb__179))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)
  | _ -> failwith "DT: impossible branch"
)))
# 517 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor = (fun fuel ctors c args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun kept -> (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then "0" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (match dtb__182 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__181) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__183) -> (bi_strFromInt (dtb__183 + 1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then "[]" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplList (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplPairName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplPair (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplJustName) then ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary (fuel - 1)) ctors) "Just") kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName) then "Nothing" else ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) (v_Vuna_dCompiler_dElab_dDriver_dreplShortName c)) kept))))))))) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) c) args))))
# 535 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplList = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185) -> (if (mc0 <= 0) then "[]" else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__186, dtb__187) -> (match dtb__187 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (mc0 - 1)) mc1) dtb__186) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> (String.concat "" ["["; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__184); dtb__188])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__184, (Base_dList.C_Base_dList_dList_Cons (dtb__186, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185)))
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185)))
)) dtb__185))
  | Base_dList.C_Base_dList_dList_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
# 544 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__189, dtb__190) -> (if (dtb__189 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("]")) else (if (dtb__189 = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__191, dtb__192) -> (match dtb__192 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> (match dtb__194 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (fuel - 1)) ctors) dtb__193) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__191); dtb__195])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__189) dtb__190)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
# 556 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplPair = (fun fuel ctors args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (match dtb__197 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__198, dtb__199) -> (match dtb__199 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__196); ", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__198); ")"])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)) args)))
# 563 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__200, dtb__201) -> (match dtb__201 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [label; " "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__200)])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)) args)))
# 569 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else (label ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) args))))
# 573 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__202, dtb__203) -> (if (mc0 <= 0) then "" else (String.concat "" [" "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__202); (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (mc0 - 1)) mc1) dtb__203)]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 579 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArg = (fun fuel ctors t -> (if (fuel <= 0) then "<\229\128\188>" else (if ((v_Vuna_dCompiler_dElab_dDriver_disReplAtom ctors) t) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t) else (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t); ")"]))))

# 460 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl = (fun datas ec v -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm 512) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors datas)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) v))))

# 681 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__204, dtb__205) -> (match dtb__204 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__206, dtb__207, dtb__208, dtb__209) -> (if (if (dtb__206 = "Base.Record.HasField") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__206) = "HasField")) then true else (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__205))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__205)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 690 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (dtb__210).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) = (dtb__210).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) then (Base_dList.C_Base_dList_dList_Cons (dtb__210, (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__211))) else (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__211))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls = (fun decls -> (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls decls))))

# 701 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> (match dtb__212 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__214, dtb__215, dtb__216, dtb__217) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__218, dtb__219) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__218) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__213))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__220, dtb__221, dtb__222) -> (match dtb__220 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__223, dtb__224) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__223) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__213))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__213)
)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__213)
)) dtb__215)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__213)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 712 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances = (fun globals decls -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance decls) then decls else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup "Base.Record.getField") globals) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225) -> ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls decls) then ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls)) else decls)
  | _ -> failwith "DT: impossible branch"
)))

# 848 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__226, dtb__227) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__226) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__226)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName mc0) dtb__227))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 855 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainActionOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__228, dtb__229, dtb__230) -> (match dtb__228 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__231, dtb__232, dtb__233) -> (match dtb__231 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__234) -> (if (dtb__234 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "eff"; Base_dPair.f_Base_dPair_dPair_second = dtb__229 } else { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
))

# 862 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disNilRowTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__235, dtb__236) -> (match dtb__236 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__235 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__237) -> (dtb__237 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 869 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__238) -> (match dtb__238 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__239, dtb__240) -> (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disBuiltinEffectTag dtb__239)
  | _ -> false
)
  | _ -> false
))

# 873 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__241, dtb__242) -> (if (dtb__241 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then true else (if (dtb__241 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (match dtb__244 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (match dtb__246 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__247, dtb__248) -> (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel dtb__245) then (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue dtb__247) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) dtb__242) else false))
  | _ -> false
))

# 882 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__249, dtb__250, dtb__251) -> (match dtb__249 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__252, dtb__253, dtb__254) -> (match dtb__252 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__255) -> (if (dtb__255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then ((fun rowV -> (if ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue mc0) rowV) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue rowV) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (match (((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) mc0) rowV) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__256) -> (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__256) Base_dList.C_Base_dList_dList_Nil) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__256)))) (Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__256)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__253)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__253))
  | _ -> failwith "DT: impossible branch"
)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc0)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__253))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
))

# 899 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__257) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__258, dtb__259) -> (match dtb__259 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (if (if (if (dtb__258 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__258 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)) then true else (dtb__258 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__258 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then true else (dtb__258 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName))
  | _ -> false
)
  | _ -> false
)) dtb__257)
  | _ -> false
))

# 912 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainHasParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> true
  | _ -> false
))

# 918 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainArityErr = (fun sp ty -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_MainArity (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ty)))

# 944 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies = (fun defs -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__265) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = dtb__265 }, Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) defs))

# 976 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing = (fun sp tyVal -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))))

# 1064 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo = (fun globals ec n -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) < (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec2) (n - 1)) else ec2))) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))

# 1059 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals ec n -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> ec
  | _ -> (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec) n)
))

# 1102 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__266, dtb__267, dtb__268) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__266) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__267)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__268))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__269) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__270) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__271) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__272) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__273, dtb__274) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__273) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__274))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__275, dtb__276, dtb__277, dtb__278, dtb__279) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__275) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__279))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__280)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__285, dtb__286) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__286)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__287, dtb__288) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__288)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__289, dtb__290) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__290)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__291, dtb__292, dtb__293) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__291) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__292))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__294, dtb__295, dtb__296) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__296)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__300) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__301))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__302) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__303) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__304, dtb__305, dtb__306) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__307) -> (dtb__307 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 1122 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__308, dtb__309) -> (match dtb__308 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__310; Base_dPair.f_Base_dPair_dPair_second = dtb__311 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__310) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__309))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1126 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__312, dtb__313) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__312)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__313))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1097 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__314, dtb__315) -> (match dtb__314 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__316; Base_dPair.f_Base_dPair_dPair_second = dtb__317 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc1) dtb__317) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [dtb__316; " body="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__317)]))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__315) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1092 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__318) -> (String.concat "" [" (in `"; dtb__318; "`)"])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1132 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__319, dtb__320, dtb__321) -> (if (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__319) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__320)) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__321))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__322) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__323) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__324) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__325) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__326, dtb__327) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__326) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__327))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__328) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__332))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__333, dtb__334, dtb__335, dtb__336, dtb__337) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__333)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__338, dtb__339) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__339)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__340, dtb__341) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__341)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__342, dtb__343) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__343)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__344, dtb__345, dtb__346) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__344) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__345))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__347, dtb__348, dtb__349) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__349)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__353) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__354))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__355) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__356) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__357, dtb__358, dtb__359) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__360) -> true
  | _ -> failwith "DT: impossible branch"
))
# 1152 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (match dtb__361 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__363; Base_dPair.f_Base_dPair_dPair_second = dtb__364 } -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__363) then true else (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__362))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1156 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__365, dtb__366) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__365)) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__366))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__367, dtb__368) -> (match dtb__367 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__369, dtb__370, dtb__371, dtb__372) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__369) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__372) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__369))) dtb__369)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__373) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__369) mc4) then (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__368) mc1) mc2) mc3) mc4) else ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsDefCheck "vuna.def.elab") dtb__369) (fun _u -> (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc1) mc4) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__367, dtb__368))) dtb__369)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__373)) dtb__372)))) (fun p -> ((fun _u -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__374; Base_dPair.f_Base_dPair_dPair_second = dtb__375 } -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__368) mc1) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__369; Base_dPair.f_Base_dPair_dPair_second = liftedTy }, mc2))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__369, liftedTy, cleanTerm, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__372)))), mc3))) ecWithDef)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) { Base_dPair.f_Base_dPair_dPair_first = dtb__369; Base_dPair.f_Base_dPair_dPair_second = cleanTerm }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__369) liftedTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta liftedBody) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody) else liftedBody))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf lifted))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__369) ec1b) dtb__373) bodyTerm1))) (Base_dPair.v_Base_dPair_dsecondOf solvedDecl))) (Base_dPair.v_Base_dPair_dfirstOf solvedDecl))) (((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals dtb__375) dtb__373) dtb__374))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line ("FUN " ^ dtb__369)) else 0))))) (if (dtp_debug_on 0) then (dtp_debug_line ("DEF " ^ dtb__369)) else 0)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__376, dtb__377, dtb__378) -> (if ((Base_dString.v_Base_dString_dstartsWith "vuna_seal_") dtb__376) then ((fun target -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__368) mc1) mc2) mc3) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRemoveDefTbl target) mc4))) (((dtp_substring 10) ((bi_strLength dtb__376) - 10)) dtb__376)) else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__376) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__378) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__376))) dtb__376)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__379) -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__368) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__376, dtb__379, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__378)))), mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__380, dtb__381, dtb__382, dtb__383) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__380) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__383) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__380))) dtb__380)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__384) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy dtb__383) dtb__384)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__368) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__380, dtb__384, dtb__381, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__383)))), mc3))) mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__368) mc1) mc2) mc3) mc4)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1049 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec defs -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__385) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__385) then (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__385), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))) else d)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

# 770 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux = (fun startEc startGlobals records decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dData.v_Vuna_dCompiler_dElab_dData_delabDatas ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) Base_dList.C_Base_dList_dList_Nil)) records) startGlobals) startEc)) (fun pd -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__386; Base_dPair.f_Base_dPair_dPair_second = dtb__387 } -> (match dtb__387 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__388; Base_dPair.f_Base_dPair_dPair_second = dtb__389 } -> ((fun ec0b -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabTraits ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) Base_dList.C_Base_dList_dList_Nil)) dtb__388) ec0b)) (fun pt -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__390; Base_dPair.f_Base_dPair_dPair_second = dtb__391 } -> (match dtb__391 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__392; Base_dPair.f_Base_dPair_dPair_second = dtb__393 } -> (match dtb__393 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__394; Base_dPair.f_Base_dPair_dPair_second = dtb__395 } -> (match dtb__395 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__396; Base_dPair.f_Base_dPair_dPair_second = dtb__397 } -> ((fun globals1 -> ((fun datas1 -> ((fun classesAll -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) Base_dList.C_Base_dList_dList_Nil)) classesAll) globals1) dtb__397)) (fun pih -> (match pih with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__398; Base_dPair.f_Base_dPair_dPair_second = dtb__399 } -> ((fun globals2 -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__399)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__400; Base_dPair.f_Base_dPair_dPair_second = dtb__401 } -> ((fun ec2b -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__400) decls)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dObs.v_Vuna_dCompiler_dObs_dobsCheck "vuna.elab.bodies") (fun _u -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies decls) dtb__400) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) ec2b)))) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__402; Base_dPair.f_Base_dPair_dPair_second = dtb__403 } -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies decls) classesAll) datas1) dtb__400) ec3)) (fun pi -> (match pi with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__404; Base_dPair.f_Base_dPair_dPair_second = dtb__405 } -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas = datas1; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc = ec4; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs = defs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs = instDefs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals = dtb__400; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans = dtb__396 }))) (if (dtp_debug_on 0) then (dtp_debug_line "instbodies-done") else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__404))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__400) dtb__405) 8))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsAudit dtb__403) then "inst-index=ok" else "inst-index=MISMATCH")) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["bodies-done g="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__400)); " sols="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols dtb__403))); " defs="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__403))); " metas="; (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext dtb__403)); " dgoals="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending dtb__403))); " datas="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__403))); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__403))); " classes="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__403))); " counters="; (v_Vuna_dCompiler_dElab_dDriver_dshowCounters (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decCounters dtb__403))])) else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__402))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__400) dtb__403) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "sigs-elab-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__401) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__400))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "instheads-done") else 0))) ((Base_dList.v_Base_dList_dappend globals1) dtb__398))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "traits-done") else 0))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__397))) ((Base_dList.v_Base_dList_dappend dtb__386) dtb__390))) ((Base_dList.v_Base_dList_dappend dtb__388) dtb__392))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (if (dtp_debug_on 0) then (dtp_debug_line "datas-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__389) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__389))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (if (dtp_debug_on 0) then (dtp_debug_line "collectSigs-done") else 0)))))

# 957 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo = (fun ec globals defs sp tyVal -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Show") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__406) -> ((fun mname -> ((fun dictTy -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__407) -> (match dtb__407 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__408; Base_dPair.f_Base_dPair_dPair_second = dtb__409 } -> ((fun tyTerm -> ((fun body -> ((fun def -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec) ((Base_dList.v_Base_dList_dappend defs) (Base_dList.C_Base_dList_dList_Cons (def, Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("x", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, tyTerm, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)))), body, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("x", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__408, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("x", 0, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__410) -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dictTy) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__406)), (Base_dList.C_Base_dList_dList_Cons (tyVal, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__406).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) "show"))
  | _ -> failwith "DT: impossible branch"
))

# 950 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner = (fun ec globals defs bodies sp inner kind -> ((fun tyVal -> ((fun tyTerm -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy tyVal) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (defs)) else (((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo ec) globals) defs) sp) tyVal))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) inner))))

# 926 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow = (fun ec globals defs -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName "main") defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (defs))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__411) -> ((fun sp -> ((fun ty -> ((fun bodies -> ((fun p -> ((fun inner -> ((fun kind -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainHasParams inner) then ((v_Vuna_dCompiler_dElab_dDriver_dmainArityErr sp) inner) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck ec) globals) sp) ty)) (fun _u -> (((((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner ec) globals) defs) bodies) sp) inner) kind))))) (Base_dPair.v_Base_dPair_dfirstOf p))) (Base_dPair.v_Base_dPair_dsecondOf p))) (v_Vuna_dCompiler_dElab_dDriver_dmainActionOf ty))) (v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies defs))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__411))) (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__411) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__412) -> dtb__412
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (Base_dList.v_Base_dList_dlength (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx))

# 1164 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__413, dtb__414) -> (if ((dtb__413).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__413)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__414))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining stop sols relevant goals -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__415) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (Base_dMaybe.v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 52 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i stop sols relevant goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

# 45 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

# 1182 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 1189 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__416, dtb__417) -> (match dtb__416 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__418; Base_dPair.f_Base_dPair_dPair_second = dtb__419 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__418; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__418; Base_dPair.f_Base_dPair_dPair_second = dtb__419 }, dtb__417))) 0) mc2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) dtb__419))) }, (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__417) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1186 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (Base_dList.v_Base_dList_dlength items)))

# 1176 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols g -> { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType)); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx = (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName })

# 1203 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__420; Base_dPair.f_Base_dPair_dPair_second = dtb__421 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__421)) (fun ds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__420) ds2)) (fun core -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1232 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddDatasEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__422, dtb__423) -> ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData mc0) dtb__422)) dtb__423)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1236 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddInstsEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__424, dtb__425) -> ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__424)) dtb__425)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1240 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddClassesEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__426, dtb__427) -> ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass mc0) dtb__426)) dtb__427)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1219 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_decOfProgram = (fun prog -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> ((fun ec7 -> { Base_dPair.f_Base_dPair_dPair_first = ec7; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec6) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec5) (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec4) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl ec3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty))

# 1258 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcandidateLe = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__428; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__429; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__430 } -> (match mc1 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__431; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__432; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__433 } -> (dtb__428 <= dtb__431)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1255 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsortCandidates = (fun cs -> ((Base_dSort.v_Base_dSort_dsortBy v_Vuna_dCompiler_dElab_dDriver_dcandidateLe) cs))

# 1262 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinstCandidate = (fun shown i -> { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["instance head "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " does not match goal "; shown]))) })

# 1278 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__434, dtb__435) -> (if (if (dtb__434 = 32) then true else (dtb__434 = 41)) then (Base_dList.v_Base_dList_dreverse mc1) else ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar dtb__435) (Base_dList.C_Base_dList_dList_Cons (dtb__434, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1268 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown = (fun s -> ((fun cs -> ((fun body -> (Base_dList.dtp_pack ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar body) Base_dList.C_Base_dList_dList_Nil))) (match cs with
  | Base_dList.C_Base_dList_dList_Cons (dtb__436, dtb__437) -> (if (dtb__436 = 40) then dtb__437 else cs)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (Base_dList.dtp_unpack s)))

# 1246 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf = (fun ec shown -> ((fun fam -> ((fun insts -> (v_Vuna_dCompiler_dElab_dDriver_dsortCandidates ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dinstCandidate shown)) insts))) (if (fam = "") then (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) fam)))) (v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown shown)))

# 1284 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated = (fun ec m d -> (match ((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf ec) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__438) -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan ("created", dtb__438))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote ("metavariable created here"))) d))
  | _ -> failwith "DT: impossible branch"
))

# 643 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore = (fun prog expr -> (match prog with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__439; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__440; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__441; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__442; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__443; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__444; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__445; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__446; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__447; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__448 } -> ((fun bodies -> ((fun ec0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__443) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__449; Base_dPair.f_Base_dPair_dPair_second = dtb__450 } -> (match dtb__450 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__451; Base_dPair.f_Base_dPair_dPair_second = dtb__452 } -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__453) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__454) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__454) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__453))) dtb__453)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__453))) dtb__453)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__446) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__455) -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec2) dtb__455) d))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedMetavarInfer ((bi_strFromInt dtb__455)))) (bi_strFromInt dtb__455)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__449)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__456) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (bi_strFromInt dtb__456); Base_dPair.f_Base_dPair_dPair_second = tyText }))
  | dtb__457 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl dtb__439) ec2) dtb__457); Base_dPair.f_Base_dPair_dPair_second = tyText }))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec2) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__451)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__443) dtb__452) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__446; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__442; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dList.v_Base_dList_dreverse bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__439; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__444); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__445; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__443); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__442); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = true; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__439); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__439); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__448; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = Base_dList.C_Base_dList_dList_Nil })) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__440))
  | _ -> failwith "DT: impossible branch"
))

# 638 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun prog expr -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore prog) expr))

# 632 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog expr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf p))))))

# 1073 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__458) -> ((fun spot -> ((fun goalTy -> ((fun detail -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) (dtb__458).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan (dtb__458).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan ("goal", (dtb__458).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (("goal: " ^ goalTy)))) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedHole (detail))) (Base_dVec.C_Base_dVec_dVec_Cons (detail, Base_dVec.C_Base_dVec_dVec_Nil)))))))) (String.concat "" [spot; " with goal "; goalTy]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__458)) (dtb__458).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType))) (if ((dtb__458).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = "") then "?" else ("?" ^ (dtb__458).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun num -> ((fun hint -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) m) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (num))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (hint))) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedMetavar (num, hint))) (Base_dVec.C_Base_dVec_dVec_Cons (num, (Base_dVec.C_Base_dVec_dVec_Cons (hint, Base_dVec.C_Base_dVec_dVec_Nil))))))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

# 983 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfinishCore = (fun termAux decls core -> ((fun ec4 -> ((fun datas1 -> ((fun defs -> ((fun instDefs -> ((fun globals -> ((fun projSpans -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__459) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__460) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__460) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__459))) dtb__459)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__459))) dtb__459)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__461) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__462) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__462) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__461))) dtb__461)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__461))) dtb__461)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__463) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__464) -> ((fun cands -> ((fun createdOf -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__465) -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> (createdOf ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (cands))) d)))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__465) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__464))) dtb__464))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> (createdOf ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (cands))) d)))) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__464))) dtb__464))
  | _ -> failwith "DT: impossible branch"
)) (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__466) -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__466)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__463)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf ec4) dtb__464))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__463)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun extra -> ((fun allDefs0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow ec4) globals) allDefs0)) (fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage ec4) allDefs)) (fun ec5 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTermination.v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((Base_dList.v_Base_dList_dappend termAux) decls))) (fun _u -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = datas1; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = allDefs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = globalsOut; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dInt.v_Eq_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec5)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decWarnings ec5) }))) (if (dtp_debug_on 0) then (dtp_debug_line "termination-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "extradefs-done") else 0))) ((Base_dList.v_Base_dList_dmap (fun g -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf g)) defsTblOut) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467) -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf g); Base_dPair.f_Base_dPair_dPair_second = dtb__467 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> g
  | _ -> failwith "DT: impossible branch"
))) globals))) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun x -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName x); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType x) })) allDefs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((Base_dList.v_Base_dList_dappend instDefs) ((Base_dList.v_Base_dList_dappend extra) defs))))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf globals) ec4) projSpans) ((Base_dList.v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))

# 1043 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux = (fun startEc startGlobals records termAux decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux startEc) startGlobals) records) decls)) (fun core -> (((v_Vuna_dCompiler_dElab_dDriver_dfinishCore termAux) decls) core))))

# 741 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux = (fun startEc startGlobals termAux decls -> ((fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) decls2)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__468; Base_dPair.f_Base_dPair_dPair_second = dtb__469 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__469)) (fun ds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls termAux)) (fun ap -> (match ap with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__470; Base_dPair.f_Base_dPair_dPair_second = dtb__471 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__471)) (fun ads2 -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) dtb__468) ads2) ds2)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls)))

# 735 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith = (fun startEc startGlobals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux startEc) startGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

# 756 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith = (fun startEc startGlobals records decls -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) records) Base_dList.C_Base_dList_dList_Nil) decls))

# 720 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls2)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__472; Base_dPair.f_Base_dPair_dPair_second = dtb__473 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__473)) (fun ds2 -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__472) ds2)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls)))

# 730 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

# 1195 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

# 1210 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog) })))))
