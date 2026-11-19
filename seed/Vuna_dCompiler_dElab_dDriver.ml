open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder = { f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName : string; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel : int; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue }
and t_Vuna_dCompiler_dElab_dDriver_dDictSubst = { f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta : int; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName : string; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ : int }
and t_Vuna_dCompiler_dElab_dDriver_dElabCore = { f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans : (string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal : string; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName : string }

# 40 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcountNames = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, int) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dcountNames dtb__1) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__0) (cur + 1)) mc1))) (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__0) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__2) -> dtb__2
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dshowCounters = (fun (names : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dString.v_Base_dData_dString_djoin ",") ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (String.concat "" [((Base_dTrait_dInterp.v_Base_dTrait_dInterp_dinterp Base_dTrait_dInterp.v_Interp_uString) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); "="; ((Base_dTrait_dInterp.v_Base_dTrait_dInterp_dinterp (Base_dTrait_dInterp.v_Interp_ua Base_dData_dInt.v_Show_uInt)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))]))) ((Base_dData_dSort.v_Base_dData_dSort_dsortBy (fun (a : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) (b : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (((Base_dTrait_dOrd.v_Base_dTrait_dOrd_d_x60_ Base_dData_dString.v_Ord_uString) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf a)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf b)))) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dtoList Base_dData_dString.v_Eq_uString) ((v_Vuna_dCompiler_dElab_dDriver_dcountNames names) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))

# 108 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if dtb__4 then ((fun domVal -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__3) domVal) mc0)) dtb__7)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) dtb__6)) else mc0)
  | _ -> mc0
))

# 105 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx = (fun (ty0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty0))

# 158 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__8, dtb__9, dtb__10) -> (match dtb__8 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__11, dtb__12) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__11) = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName) then (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__9) = 3) then true else ((Base_dData_dList.v_Base_dData_dList_dlength dtb__9) = 2)) else false)
  | _ -> false
)
  | _ -> false
))

# 148 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> ((fun r -> (if (v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr dtb__13) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf r))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf r) } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf r); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, (Base_dData_dPair.v_Base_dData_dPair_dsecondOf r))) })) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx dtb__14))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmemberSugarExpr = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__15, dtb__16, dtb__17) -> (match dtb__15 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__18, dtb__19) -> (match dtb__16 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__18) = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName) then (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__18, dtb__19)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName), dtb__17)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__22, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), dtb__17)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, Base_dData_dList.C_Base_dData_dList_dList_Nil)))), dtb__17)) else mc1)
  | _ -> mc1
)
  | _ -> mc1
)
  | _ -> mc1
)
  | _ -> mc1
)
  | _ -> mc1
)
  | _ -> mc1
))

# 172 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc3 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__26, dtb__27) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) ((v_Vuna_dCompiler_dElab_dDriver_dmemberSugarExpr mc2) dtb__26))) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dLevel, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__28; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__29 } -> (match dtb__29 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__30; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__31 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) mc1) dtb__31) dtb__27) mc4)) (fun (q : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__32; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__33 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__28, dtb__32)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__33 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigMemberName = (fun (k : int) -> ("_member" ^ (bi_strFromInt k)))

# 194 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__34, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) dtb__35) (mc2 + 1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev (((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder (v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2)) mc3) Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0) dtb__36) mc0)) dtb__37) (mc2 - 1)) mc3)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev mc0) mc1) ((Base_dData_dList.v_Base_dData_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 235 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigDictName = (fun (k : int) -> ("_ctx" ^ (bi_strFromInt k)))

# 225 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, dtb__38, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) dtb__39) (mc2 + 1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder (v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2)) mc3) dtb__40) mc0)) dtb__41) (mc2 - 1)) mc3)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev mc0) mc1) ((Base_dData_dList.v_Base_dData_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 122 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc3 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }))
  | _ -> ((fun split -> ((fun memberExprs -> ((fun otherExprs -> ((fun leadCtx -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc4) otherExprs)) (fun (parts : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses mc1)) mc0) leadCtx) parts) mc4) mc1)) (fun (q : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) leadCtx) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf q)) memberExprs) mc4)) (fun (m : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun doms -> ((fun ec1 -> ((fun memberDoms -> ((fun ec2 -> ((fun ty1 -> ((fun ty2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ty2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec2 }))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers ty1) memberDoms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty1)))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts mc2) doms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf m))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf m))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf q))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf q))))))))) (v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx mc2))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf split))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf split))) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx mc3))
))

# 87 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun (mc0 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 } -> (match dtb__45 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__46; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__47 } -> (match dtb__47 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__48; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__49 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__48)) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dLevel, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__50; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__51 } -> (match dtb__51 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__52; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__53 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders mc1) dtb__53) dtb__50) dtb__46) dtb__49)) (fun (q : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__54; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__55 } -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__43) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = sigTy }, mc1))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__55) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__44) sigTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__55)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = sigTy }, mc3)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__55) 0) dtb__54))
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
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend mc1) (Base_dData_dList.v_Base_dData_dList_dreverse mc3)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun (sigs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf globals))) true)) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 253 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc3 : t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (if dtb__57 then ((fun domVal -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__56) domVal) mc1)) dtb__60) acc2)) (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc0) domVal) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName = dtb__56; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1); f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom = domVal }, mc3)) else mc3))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__59)) else (Base_dData_dList.v_Base_dData_dList_dreverse mc3))
  | _ -> (Base_dData_dList.v_Base_dData_dList_dreverse mc3)
))

# 250 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo ec) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 311 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (a : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (b : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__61) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__62) -> false
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (if (((v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches mc0) (dtb__63).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom) mc2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__63)) else (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder mc0) dtb__64) mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (binders : t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder Base_dData_dList.t_Base_dData_dList_dList) (goals : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) (kept : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) (acc : t_Vuna_dCompiler_dElab_dDriver_dDictSubst Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__67; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__68; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__69; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__70; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__71; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__72 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__69) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__73) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__66) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, kept))) acc)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder ec) binders) dtb__70) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__66) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, kept))) acc)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__74) -> ((fun q -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__69) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName, (dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__75) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__75))) binders) dtb__66) kept) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta = dtb__69; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName = (dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ = q }, acc)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__76) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__66) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((dtb__74).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) (Base_dData_dList.v_Base_dData_dList_dreverse kept)) }
  | _ -> failwith "DT: impossible branch"
)) goals))

# 317 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts = (fun (mc0 : t_Vuna_dCompiler_dElab_dDriver_dDictSubst Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts dtb__78) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (dtb__77).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta) (dtb__77).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName) (dtb__77).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (body : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = body; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }
  | _ -> (match ((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders ec) ty) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = body; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec }
  | dtb__79 -> ((fun solved -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts (Base_dData_dPair.v_Base_dData_dPair_dfirstOf solved)) body); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf solved) }) (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) dtb__79) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))
)
))

# 327 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__82, dtb__83, dtb__84, dtb__85) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__81) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) dtb__82) ((Base_dData_dList.v_Base_dData_dList_dappend cur) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__83; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__84 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) mc1))) (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__82) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__86) -> dtb__86
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__81) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 340 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__87) -> dtb__87
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun (name : string) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__88) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__89) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__89 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

# 363 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__92, dtb__93, dtb__94, dtb__95) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__92, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__91)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__91)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun (mc0 : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : (string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__98; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__99 } -> (match dtb__99 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__100; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__101 } -> (match dtb__101 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__102; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__103 } -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__98) mc3) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__104) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__98) mc2) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__104) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AxiomWithDefinition (dtb__98))) dtb__98) else ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__97) mc1) mc2) mc3))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__98) mc2) then (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__98) mc1) then ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__97) mc1) mc2) mc3) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__103) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__98))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__98, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__103) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__98))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (dtb__98, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)))

# 504 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__107, dtb__108, dtb__109) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__107; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__109 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__106)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__110, dtb__111, dtb__112, dtb__113) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__110; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__113 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__106)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__106)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs decls)))

# 469 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun (sigs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) globals))) (v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl decls)) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl decls)))

# 512 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> (match dtb__114 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__116, dtb__117, dtb__118, dtb__119) -> (if (dtb__116 = mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__115))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__115)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__122, dtb__123, dtb__124) -> (if (dtb__122 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__124)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__121))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__125, dtb__126, dtb__127, dtb__128) -> (if (dtb__125 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__128)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__121))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__121)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem = (fun (mc0 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__129) -> (match dtb__129 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__130, dtb__131) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__130) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (("Array " ^ dtb__130)))) dtb__130))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

# 550 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain = (fun (mc0 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__132) -> (match dtb__132 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__133, dtb__134) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName dtb__133) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if (dtb__133 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem mc0) dtb__135)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__134) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (dtb__133))) dtb__133)))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

# 534 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue = (fun (mc0 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc1 : int) (mc2 : int) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> (if (mc1 <= 0) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__138 then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) dtb__140)) (fun (_u : int) -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__141) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__137, mc2, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))
  | _ -> (if (mc1 <= 0) then (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) mc3))
))

# 531 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy = (fun (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (tyTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue sp) 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) tyTerm)))

# 587 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dallReplCtors = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__142)) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors dtb__143))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplShortName = (fun (g : string) -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot g))))

# 626 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm = (fun (xs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (x : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Base_dData_dList.v_Base_dData_dList_dappend xs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (x, Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 619 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dspineOf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__144, dtb__145, dtb__146) -> (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf dtb__144) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm dtb__148) dtb__145) }
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__144, dtb__145, dtb__146)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }
))

# 630 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName = "Base.Data.Nat.Nat.Zero"

# 634 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName = "Base.Data.Nat.Nat.Succ"

# 770 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__153; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__154 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__149)) then ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__150) dtb__152) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__153, ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__150) dtb__152))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs = (fun (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (c : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn c) ctors) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) args)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__155) -> ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__155)) args)
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dreplNatValue = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__156, dtb__157) -> (if (dtb__156 = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (0)) else (if (dtb__156 = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (match dtb__159 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__158) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__160) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__160 + 1)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__156) dtb__157)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))

# 777 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListNilName = "Base.Data.List.List.Nil"

# 781 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListConsName = "Base.Data.List.List.::"

# 784 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplPairName = "Base.Data.Pair.Pair"

# 788 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplJustName = "Base.Data.Maybe.Maybe.Just"

# 792 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNothingName = "Base.Data.Maybe.Maybe.Nothing"

# 747 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disReplAtom = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__161, dtb__162) -> (if (if (if (dtb__161 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then true else (dtb__161 = v_Vuna_dCompiler_dElab_dDriver_dreplPairName)) then true else (dtb__161 = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName)) then true else ((Base_dData_dList.v_Base_dData_dList_dlength (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs mc0) dtb__161) dtb__162)) = 0))
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

# 591 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__173, dtb__174) -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor (fuel - 1)) ctors) dtb__173) dtb__174)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> "<\229\135\189\230\149\176>"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__180) -> "_"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__181) -> (v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__181)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__182, dtb__183, dtb__184) -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplApp (fuel - 1)) ctors) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__182, dtb__183, dtb__184)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)))
# 605 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplApp = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf t) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__185; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__186 } -> (match dtb__185 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__187) -> ((v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__187) ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) dtb__186))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)
  | _ -> failwith "DT: impossible branch"
)))
# 657 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (c : string) (args : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then "<\229\128\188>" else ((fun kept -> (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then "0" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__188, dtb__189) -> (match dtb__189 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__188) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__190) -> (bi_strFromInt (dtb__190 + 1))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then "[]" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplList (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplPairName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplPair (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplJustName) then ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary (fuel - 1)) ctors) "Just") kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName) then "Nothing" else ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) (v_Vuna_dCompiler_dElab_dDriver_dreplShortName c)) kept))))))))) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) c) args))))
# 675 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplList = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (if (mc0 <= 0) then "[]" else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, dtb__194) -> (match dtb__194 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (mc0 - 1)) mc1) dtb__193) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__195) -> (String.concat "" ["["; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__191); dtb__195])
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "(::)") (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "(::)") (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192)))
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "(::)") (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192)))
)) dtb__192))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
# 688 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__196, dtb__197) -> (if (dtb__196 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("]")) else (if (dtb__196 = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (match dtb__199 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__200, dtb__201) -> (match dtb__201 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (fuel - 1)) ctors) dtb__200) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__202) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" [", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__198); dtb__202])))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__196) dtb__197)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))
# 708 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplPair = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (match dtb__204 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (match dtb__206 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__203); ", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__205); ")"])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)) args)))
# 717 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (label : string) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__207, dtb__208) -> (match dtb__208 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (String.concat "" [label; " "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__207)])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)) args)))
# 726 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (label : string) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then "<\229\128\188>" else (label ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) args))))
# 730 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__209, dtb__210) -> (if (mc0 <= 0) then "" else (String.concat "" [" "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__209); (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (mc0 - 1)) mc1) dtb__210)]))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 738 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArg = (fun (fuel : int) (ctors : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then "<\229\128\188>" else (if ((v_Vuna_dCompiler_dElab_dDriver_disReplAtom ctors) t) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t) else (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t); ")"]))))

# 584 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm 512) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors datas)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) v))))

# 865 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__211, dtb__212) -> (match dtb__211 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> (if (if (dtb__213 = "Base.Trait.Record.HasField") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__213) = "HasField")) then true else (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__212))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__212)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 877 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas = (fun (mc0 : Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (dtb__218).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) = (dtb__218).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__219))) else (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__219))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 886 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls decls))))

# 890 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__221) -> (match dtb__220 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__222, dtb__223, dtb__224, dtb__225) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__226, dtb__227) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__226)) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__221))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__228, dtb__229, dtb__230) -> (match dtb__228 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__231, dtb__232) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__231)) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__221))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__221)
)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__221)
)) dtb__223)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__221)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 904 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance decls) then decls else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup "Base.Trait.Record.getField") globals) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__233) -> ((Base_dData_dList.v_Base_dData_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls decls) then ((Base_dData_dList.v_Base_dData_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls)) else decls)
  | _ -> failwith "DT: impossible branch"
)))

# 1088 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefByName = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__234) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__234)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName mc0) dtb__235))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1095 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainActionOf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__236, dtb__237, dtb__238) -> (match dtb__236 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__239, dtb__240, dtb__241) -> (match dtb__239 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__242) -> (if (dtb__242 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = "eff"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__237 } else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = "other"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 })
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = "other"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = "other"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = "other"; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc0 }
))

# 1103 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disNilRowTerm = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__243, dtb__244) -> (match dtb__244 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (dtb__243 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__245) -> (dtb__245 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 1110 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__246) -> (match dtb__246 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__247, dtb__248) -> (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBuiltinEffectTag dtb__247)
  | _ -> false
)
  | _ -> false
))

# 1115 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dbuiltinHostLabelOf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__249) -> (match dtb__249 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__250, dtb__251) -> (if (dtb__250 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__252, dtb__253) -> (match dtb__253 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__254, dtb__255) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__254))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__251) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__250, dtb__251)))))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 1125 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__256, dtb__257) -> (if (dtb__256 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then true else (if (dtb__256 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, dtb__259) -> (match dtb__259 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (match (v_Vuna_dCompiler_dElab_dDriver_dbuiltinHostLabelOf dtb__258) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__262) -> (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel dtb__262) then (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue dtb__260) else false)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)) dtb__257) else false))
  | _ -> false
))

# 1141 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__263, dtb__264, dtb__265) -> (match dtb__263 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__266, dtb__267, dtb__268) -> (match dtb__266 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__269) -> (if (dtb__269 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName) then ((fun rowV -> (if ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue mc0) rowV) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue rowV) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (match (((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) mc0) rowV) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__270) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ (Base_dData_dList.v_Eq_uBase_uData_uList_uList_ua Base_dData_dString.v_Eq_uString)) dtb__270) Base_dData_dList.C_Base_dData_dList_dList_Nil) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__270)))) (Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__270)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__267)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__267))
  | _ -> failwith "DT: impossible branch"
)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc0)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__267))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
))

# 1162 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__271) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__272, dtb__273) -> (match dtb__273 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__272) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))))
  | _ -> false
)
  | _ -> false
)) dtb__271)
  | _ -> false
))

# 1171 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainHasParams = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__274, dtb__275, dtb__276, dtb__277, dtb__278) -> true
  | _ -> false
))

# 1177 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainArityErr = (fun (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (ty : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((fun st -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_MainArity (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ty)))

# 1208 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies = (fun (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__279) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__279 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) defs))

# 1248 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing = (fun (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (tyVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((fun st -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))))

# 1353 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (n : int) -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) < (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec2) (n - 1)) else ec2))) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))

# 1347 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (n : int) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ec
  | _ -> (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec) n)
))

# 1400 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__280, dtb__281, dtb__282) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__280) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__281)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__282))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__283) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__284) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__285) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__286) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__287, dtb__288) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__287) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__288))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__289) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__293))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__294)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__299, dtb__300) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__300)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__301, dtb__302) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__302)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__303, dtb__304) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__304)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__305, dtb__306, dtb__307) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__305) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__306))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> ((fun tys -> (if tys then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__312))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__313) -> (match dtb__313 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__314; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__315 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMetaMaybe mc0) dtb__314) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMetaMaybe mc0) dtb__315))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__310))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__316, dtb__317, dtb__318, dtb__319, dtb__320) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__319) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__320))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__321) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__322) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__323, dtb__324, dtb__325) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__326) -> (dtb__326 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 1426 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun (mc0 : int) (mc1 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__327, dtb__328) -> (match dtb__327 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__329; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__330 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__329) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__328))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1430 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__331, dtb__332) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__331)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__332))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1434 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_dtermHasMetaMaybe = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__333) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__333)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1395 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__334, dtb__335) -> (match dtb__334 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__336; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc1) dtb__337) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" [dtb__336; " body="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__337)]))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__335) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1389 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (m : int) -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__338) -> (String.concat "" [" (in `"; dtb__338; "`)"])
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1440 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__339, dtb__340, dtb__341) -> (if (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__339) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__340)) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__341))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__342) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__343) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__344) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__345) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__346, dtb__347) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__346) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__347))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__348) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__352))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__353, dtb__354, dtb__355, dtb__356, dtb__357) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__353)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__358, dtb__359) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__359)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__360, dtb__361) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__361)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__362, dtb__363) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__363)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__364, dtb__365, dtb__366) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__364) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__365))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__367, dtb__368, dtb__369, dtb__370, dtb__371) -> ((fun tys -> (if tys then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__371))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__372) -> (match dtb__372 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__373; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__374 } -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMetaMaybe dtb__373) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMetaMaybe dtb__374))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__369))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__375, dtb__376, dtb__377, dtb__378, dtb__379) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__378) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__379))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__380) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__381) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__382, dtb__383, dtb__384) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__385) -> true
  | _ -> failwith "DT: impossible branch"
))
# 1466 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__386, dtb__387) -> (match dtb__386 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__388; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__389 } -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__388) then true else (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__387))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1470 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__390, dtb__391) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__390)) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__391))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1474 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMetaMaybe = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__392) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__392)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabOneDef = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (name : string) (tyTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsDefCheck "vuna.def.elab") name) (fun (_u : int) -> (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabFunDef globals) ec) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl ec) decls) name)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) tyTerm)) sp)))) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun _u -> ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.post") (fun (_u : int) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__393; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__394 } -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (name, liftedTy, cleanTerm, (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp)))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ecWithDef }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) { Base_dData_dPair.f_Base_dData_dPair_dPair_first = name; Base_dData_dPair.f_Base_dData_dPair_dPair_second = cleanTerm }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) name) liftedTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta liftedBody) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody) else liftedBody))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf lifted)))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf lifted)))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf lifted))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals name) ec1b) tyTerm) bodyTerm1))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf solvedDecl))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf solvedDecl))) (((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals dtb__394) tyTerm) dtb__393))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("FUN " ^ name)) else 0))))) (if (dtp_debug_on 0) then (dtp_debug_line ("DEF " ^ name)) else 0)))

# 406 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dresumeBodies = (fun (mc0 : bool) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc6 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (if mc0 then ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) mc1) mc2) mc3) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddError mc5) mc6)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (mc6))))
# 413 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun (mc0 : bool) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__395, dtb__396) -> (match dtb__395 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__397, dtb__398, dtb__399, dtb__400) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__397) mc2) mc5) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__400) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__397))) dtb__397) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__401) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) mc4) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__402) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__396) mc2) mc3) mc4) mc5) dtb__402)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__403) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__397) mc5) then ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) mc4) mc5) else (match ((((((v_Vuna_dCompiler_dElab_dDriver_delabOneDef (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__395, dtb__396))) mc2) dtb__397) dtb__403) dtb__400) mc5) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__404) -> (match dtb__404 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__405; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__406 } -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__397; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__405) }, mc3))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__405, mc4))) dtb__406)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__407) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__396) mc2) mc3) mc4) mc5) dtb__407)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__408, dtb__409, dtb__410) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith "vuna_seal_") dtb__408) then ((fun target -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRemoveDefTbl target) mc5))) (((dtp_substring 10) ((bi_strLength dtb__408) - 10)) dtb__408)) else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__408) mc2) mc5) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__410) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__408))) dtb__408) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__411) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) mc4) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__412) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__396) mc2) mc3) mc4) mc5) dtb__412)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__413) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__408, dtb__413, (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__410)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__414, dtb__415, dtb__416, dtb__417) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__414) mc2) mc5) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__417) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__414))) dtb__414) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__418) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) mc4) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__419) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__396) mc2) mc3) mc4) mc5) dtb__419)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__420) -> (match ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy dtb__417) dtb__420) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__421) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dresumeBodies mc0) dtb__396) mc2) mc3) mc4) mc5) dtb__421)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__422) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__414, dtb__420, dtb__415, (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__417)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies mc0) dtb__396) mc2) mc3) mc4) mc5)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc4); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

# 1336 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__423) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__423) then (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__423), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))) else d)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

# 999 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux = (fun (recover : bool) (startEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (startGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (records : Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun (sigs : (string, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dData.v_Vuna_dCompiler_dElab_dData_delabDatas ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) Base_dData_dList.C_Base_dData_dList_dList_Nil)) records) startGlobals) startEc)) (fun (pd : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList, ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__424; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__425 } -> (match dtb__425 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__426; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__427 } -> ((fun ec0b -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabTraits ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) Base_dData_dList.C_Base_dData_dList_dList_Nil)) dtb__426) ec0b)) (fun (pt : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList, ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList, ((string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__428; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__429 } -> (match dtb__429 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__430; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__431 } -> (match dtb__431 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__432; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__433 } -> (match dtb__433 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__434; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__435 } -> ((fun globals1 -> ((fun datas1 -> ((fun classesAll -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) Base_dData_dList.C_Base_dData_dList_dList_Nil)) classesAll) globals1) dtb__435)) (fun (pih : ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pih with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__436; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__437 } -> ((fun globals2 -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__437)) (fun (p : ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__438; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__439 } -> ((fun ec2b -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__438) decls)) (fun (_u : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dBase_dObs.v_Vuna_dCompiler_dBase_dObs_dobsCheck "vuna.elab.bodies") (fun (_u : int) -> ((((((v_Vuna_dCompiler_dElab_dDriver_delabBodies recover) decls) dtb__438) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil) ec2b)))) (fun (q : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match q with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__440; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__441 } -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies recover) decls) classesAll) datas1) dtb__438) ec3)) (fun (pi : (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match pi with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__442; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__443 } -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas = datas1; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc = ec4; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs = defs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs = instDefs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals = dtb__438; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans = dtb__434 }))) (if (dtp_debug_on 0) then (dtp_debug_line "instbodies-done") else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__442))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__438) dtb__443) 8))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsAudit dtb__441) then "inst-index=ok" else "inst-index=MISMATCH")) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["bodies-done g="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength dtb__438)); " sols="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols dtb__441))); " defs="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__441))); " metas="; (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext dtb__441)); " dgoals="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending dtb__441))); " datas="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__441))); " insts="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__441))); " classes="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__441))); " counters="; (v_Vuna_dCompiler_dElab_dDriver_dshowCounters (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decCounters dtb__441))])) else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__440))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__438) dtb__441) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "sigs-elab-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__439) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__438))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "instheads-done") else 0))) ((Base_dData_dList.v_Base_dData_dList_dappend globals1) dtb__436))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "traits-done") else 0))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__435))) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__424) dtb__428))) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__426) dtb__430))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (if (dtp_debug_on 0) then (dtp_debug_line "datas-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__427) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__427))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (if (dtp_debug_on 0) then (dtp_debug_line "collectSigs-done") else 0)))))

# 1224 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (tyVal : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Show") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__444) -> ((fun mname -> ((fun dictTy -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__445) -> (match dtb__445 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__446; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__447 } -> ((fun tyTerm -> ((fun body -> ((fun def -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec) ((Base_dData_dList.v_Base_dData_dList_dappend defs) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (def, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("x", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, tyTerm, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)))), body, (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("x", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__446, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("x", 0, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__448) -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dictTy) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__444)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (tyVal, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__444).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) "show"))
  | _ -> failwith "DT: impossible branch"
))

# 1217 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) (bodies : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (sp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (inner : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (kind : string) -> ((fun tyVal -> ((fun tyTerm -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy tyVal) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (defs)) else (((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo ec) globals) defs) sp) tyVal))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) inner))))

# 1185 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (globals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (defs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName "main") defs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (defs))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__449) -> ((fun sp -> ((fun ty -> ((fun bodies -> ((fun p -> ((fun inner -> ((fun kind -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainHasParams inner) then ((v_Vuna_dCompiler_dElab_dDriver_dmainArityErr sp) inner) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck ec) globals) sp) ty)) (fun (_u : int) -> (((((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner ec) globals) defs) bodies) sp) inner) kind))))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))) (v_Vuna_dCompiler_dElab_dDriver_dmainActionOf ty))) (v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies defs))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__449))) (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__449) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__450) -> dtb__450
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1479 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun (g : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtGoal) -> (Base_dData_dList.v_Base_dData_dList_dlength (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx))

# 1482 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__451, dtb__452) -> (if ((dtb__451).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__451)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__452))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun (remaining : int) (stop : int) (sols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (relevant : int Base_dData_dList.t_Base_dData_dList_dList) (goals : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dData_dList.t_Base_dData_dList_dList) -> (if (remaining <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__453) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (Base_dData_dMaybe.v_Base_dData_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 57 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun (i : int) (stop : int) (sols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (relevant : int Base_dData_dList.t_Base_dData_dList_dList) (goals : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtGoal Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

# 50 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

# 1503 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun (sols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 1510 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__454, dtb__455) -> (match dtb__454 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__456; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__457 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__456; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__456; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__457 }, dtb__455))) 0) mc2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) dtb__457))) }, (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__455) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1507 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun (items : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (Base_dData_dList.v_Base_dData_dList_dlength items)))

# 1494 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun (sols : (int, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (g : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtGoal) -> { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType)); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx = (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName })

# 1527 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun (p : (Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__458; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__459 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__459)) (fun (ds2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux false) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__458) ds2)) (fun (core : t_Vuna_dCompiler_dElab_dDriver_dElabCore) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1538 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabGoalsWithPrepared = (fun (startEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (startGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (termAux : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls))) (fun (p : (Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__460; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__461 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__461)) (fun (ds2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux false) startEc) startGlobals) dtb__460) ds2)) (fun (core : t_Vuna_dCompiler_dElab_dDriver_dElabCore) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1571 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddDatasEc = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__462, dtb__463) -> ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData mc0) dtb__462)) dtb__463)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1575 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddInstsEc = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__464, dtb__465) -> ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__464)) dtb__465)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1579 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddClassesEc = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__466, dtb__467) -> ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass mc0) dtb__466)) dtb__467)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1558 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_decOfProgram = (fun (prog : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram) -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> ((fun ec7 -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ec7; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec6) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec5) (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec4) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl ec3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty))

# 1597 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcandidateLe = (fun (mc0 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dCandidate) (mc1 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dCandidate) -> (match mc0 with
  | { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateText = dtb__468; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateSpan = dtb__469; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateReason = dtb__470 } -> (match mc1 with
  | { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateText = dtb__471; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateSpan = dtb__472; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateReason = dtb__473 } -> (dtb__468 <= dtb__471)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1594 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsortCandidates = (fun (cs : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dCandidate Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dSort.v_Base_dData_dSort_dsortBy v_Vuna_dCompiler_dElab_dDriver_dcandidateLe) cs))

# 1601 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinstCandidate = (fun (shown : string) (i : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst) -> { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateText = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateSpan = (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dCandidate_candidateReason = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((String.concat "" ["instance head "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " does not match goal "; shown]))) })

# 1620 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__474, dtb__475) -> (if (if (dtb__474 = 32) then true else (dtb__474 = 41)) then (Base_dData_dList.v_Base_dData_dList_dreverse mc1) else ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar dtb__475) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__474, mc1))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1609 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown = (fun (s : string) -> ((fun cs -> ((fun body -> (Base_dData_dList.dtp_pack ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar body) Base_dData_dList.C_Base_dData_dList_dList_Nil))) (match cs with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__476, dtb__477) -> (if (dtb__476 = 40) then dtb__477 else cs)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (Base_dData_dList.dtp_unpack s)))

# 1585 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (shown : string) -> ((fun fam -> ((fun insts -> (v_Vuna_dCompiler_dElab_dDriver_dsortCandidates ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dinstCandidate shown)) insts))) (if (fam = "") then (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) fam)))) (v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown shown)))

# 1626 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (m : int) (d : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (match ((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf ec) m) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> d
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__478) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldSpan ("created", dtb__478))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldNote ("metavariable created here"))) d))
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore = (fun (prog : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram) (expr : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match prog with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__479; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__480; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__481; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__482; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__483; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__484; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__485; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__486; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__487; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__488 } -> ((fun bodies -> ((fun ec0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__483) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__489; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__490 } -> (match dtb__490 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__491; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__492 } -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__493) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__494) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__494) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__493))) dtb__493)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__493))) dtb__493)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__486) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec2)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__495) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun (d : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec2) dtb__495) d))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dexprSpan expr)) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnsolvedMetavarInfer ((bi_strFromInt dtb__495)))) (bi_strFromInt dtb__495)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__489)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__496) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (bi_strFromInt dtb__496); Base_dData_dPair.f_Base_dData_dPair_dPair_second = tyText }))
  | dtb__497 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl dtb__479) ec2) dtb__497); Base_dData_dPair.f_Base_dData_dPair_dPair_second = tyText }))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec2) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__491)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__483) dtb__492) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__486; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__482; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dData_dList.v_Base_dData_dList_dreverse bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__479; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__484); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__485; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__483); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__482); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dInt.v_Hashable_uInt) Base_dData_dList.C_Base_dData_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = true; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__479); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__479); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__488; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCounters = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecErrors = Base_dData_dList.C_Base_dData_dList_dList_Nil })) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__480))
  | _ -> failwith "DT: impossible branch"
))

# 801 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun (prog : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram) (expr : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore prog) expr))

# 795 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun (prog : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram) (expr : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun (p : (string, string) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))))

# 1365 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun (ec : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (m : int) -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__498) -> ((fun spot -> ((fun goalTy -> ((fun detail -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) (dtb__498).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (dtb__498).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldSpan ("goal", (dtb__498).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldNote (("goal: " ^ goalTy)))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnsolvedHole (detail))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (detail, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))))))) (String.concat "" [spot; " with goal "; goalTy]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__498)) (dtb__498).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType))) (if ((dtb__498).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = "") then "?" else ("?" ^ (dtb__498).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun num -> ((fun hint -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) m) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldName (num))) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldNote (hint))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnsolvedMetavar (num, hint))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (num, (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons (hint, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))))))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

# 1255 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfinishCore = (fun (termAux : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (core : t_Vuna_dCompiler_dElab_dDriver_dElabCore) -> ((fun ec4 -> ((fun datas1 -> ((fun defs -> ((fun instDefs -> ((fun globals -> ((fun projSpans -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__499) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__500) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__500) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__499))) dtb__499)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__499))) dtb__499)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__501) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__502) -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__502) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__501))) dtb__501)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__501))) dtb__501)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__503) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__504) -> ((fun cands -> ((fun createdOf -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__505) -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun (d : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (createdOf ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldCandidates (cands))) d)))) (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 dtb__505) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__504))) dtb__504))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (fun (d : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (createdOf ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldCandidates (cands))) d)))) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__504))) dtb__504))
  | _ -> failwith "DT: impossible branch"
)) (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta ec4) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__506) -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__506)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__503)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf ec4) dtb__504))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__503)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun extra -> ((fun allDefs0 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow ec4) globals) allDefs0)) (fun (allDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dData_dList.t_Base_dData_dList_dList) -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage ec4) allDefs)) (fun (ec5 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dTermination.v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((Base_dData_dList.v_Base_dData_dList_dappend termAux) decls))) (fun (_u : int) -> ((fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = datas1; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = allDefs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = globalsOut; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dtoList Base_dData_dInt.v_Eq_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec5)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decWarnings ec5) }))) (if (dtp_debug_on 0) then (dtp_debug_line "termination-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "extradefs-done") else 0))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (g : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf g)) defsTblOut) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__507) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf g); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__507 }
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> g
  | _ -> failwith "DT: impossible branch"
))) globals))) (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (x : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName x); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType x) })) allDefs)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((Base_dData_dList.v_Base_dData_dList_dappend instDefs) ((Base_dData_dList.v_Base_dData_dList_dappend extra) defs))))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf globals) ec4) projSpans) ((Base_dData_dList.v_Base_dData_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))

# 929 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramErrors = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls2)) (fun (p : (Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__508; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__509 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__509)) (fun (ds2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux true) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__508) ds2)) (fun (core : t_Vuna_dCompiler_dElab_dDriver_dElabCore) -> ((fun errs -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty errs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (errs)) else (match (((v_Vuna_dCompiler_dElab_dDriver_dfinishCore Base_dData_dList.C_Base_dData_dList_dList_Nil) ds2) core) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__510) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__510, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__511) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))) (Base_dData_dList.v_Base_dData_dList_dreverse (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decErrors (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc)))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls)))

# 1329 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux = (fun (startEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (startGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (records : Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList) (termAux : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux false) startEc) startGlobals) records) decls)) (fun (core : t_Vuna_dCompiler_dElab_dDriver_dElabCore) -> (((v_Vuna_dCompiler_dElab_dDriver_dfinishCore termAux) decls) core))))

# 965 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux = (fun (startEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (startGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (termAux : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) decls2)) (fun (p : (Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__512; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__513 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__513)) (fun (ds2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls termAux)) (fun (ap : (Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match ap with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__514; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__515 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__515)) (fun (ads2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) dtb__512) ads2) ds2)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls)))

# 959 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith = (fun (startEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (startGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux startEc) startGlobals) Base_dData_dList.C_Base_dData_dList_dList_Nil) decls))

# 985 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith = (fun (startEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (startGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (records : Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList) (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) records) Base_dData_dList.C_Base_dData_dList_dList_Nil) decls))

# 915 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls2)) (fun (p : (Vuna_dCompiler_dElab_dRecords.t_Vuna_dCompiler_dElab_dRecords_dRecordMeta Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match p with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__516; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__517 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__517)) (fun (ds2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__516) ds2)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls)))

# 954 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) Base_dData_dList.C_Base_dData_dList_dList_Nil) decls))

# 1518 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun (prog : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

# 1548 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun (decls : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun (prog : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtProgram) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog) })))))
