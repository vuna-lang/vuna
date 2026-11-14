open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder = { f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName : string; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel : int; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue }
and t_Vuna_dCompiler_dElab_dDriver_dDictSubst = { f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta : int; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName : string; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ : int }
and t_Vuna_dCompiler_dElab_dDriver_dElabCore = { f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans : (string, Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo = { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal : string; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName : string }

# 79 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then ((fun domVal -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__0) domVal) mc0)) dtb__4)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc0)) dtb__3)) else mc0)
  | _ -> mc0
))

# 76 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx = (fun ty0 -> ((v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty0))

# 121 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__5, dtb__6, dtb__7) -> (match dtb__5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__8, dtb__9) -> (match dtb__6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__8 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMemberFamilyName)
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

# 113 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> ((fun r -> (if (v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr dtb__16) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__16, (Base_dPair.v_Base_dPair_dfirstOf r))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) } else { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf r); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__16, (Base_dPair.v_Base_dPair_dsecondOf r))) })) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx dtb__17))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc0) mc1) mc2) dtb__18)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 } -> (match dtb__21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) mc1) dtb__23) dtb__19) mc4)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__24; Base_dPair.f_Base_dPair_dPair_second = dtb__25 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__24)); Base_dPair.f_Base_dPair_dPair_second = dtb__25 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigMemberName = (fun k -> ("_member" ^ (bi_strFromInt k)))

# 139 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, dtb__26, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) dtb__27) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev (((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder (v_Vuna_dCompiler_dElab_dDriver_dsigMemberName mc2)) mc3) Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0) dtb__28) mc0)) dtb__29) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 175 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsigDictName = (fun k -> ("_ctx" ^ (bi_strFromInt k)))

# 165 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ((v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2), true, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, dtb__30, (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) dtb__31) (mc2 + 1))))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder (v_Vuna_dCompiler_dElab_dDriver_dsigDictName mc2)) mc3) dtb__32) mc0)) dtb__33) (mc2 - 1)) mc3)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts mc0) mc1) 0) else ((((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev mc0) mc1) ((Base_dList.v_Base_dList_dlength mc1) - 1)) (mc2 - 1)))
))

# 93 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc2; Base_dPair.f_Base_dPair_dPair_second = mc1 }))
  | _ -> ((fun split -> ((fun memberExprs -> ((fun otherExprs -> ((fun leadCtx -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf mc4) otherExprs)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses mc1)) mc0) leadCtx) parts) mc4) mc1)) (fun q -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms mc0) leadCtx) (Base_dPair.v_Base_dPair_dsecondOf q)) memberExprs) mc4)) (fun m -> ((fun doms -> ((fun ec1 -> ((fun memberDoms -> ((fun ec2 -> ((fun ty1 -> ((fun ty2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ty2; Base_dPair.f_Base_dPair_dPair_second = ec2 }))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers ty1) memberDoms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount ty1)))) (((v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts mc2) doms) (Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount mc2)))) (Base_dPair.v_Base_dPair_dsecondOf m))) (Base_dPair.v_Base_dPair_dfirstOf m))) (Base_dPair.v_Base_dPair_dsecondOf q))) (Base_dPair.v_Base_dPair_dfirstOf q))))))))) (v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx mc2))) (Base_dPair.v_Base_dPair_dsecondOf split))) (Base_dPair.v_Base_dPair_dfirstOf split))) (v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx mc3))
))

# 62 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabSigsGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__34 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = dtb__37 } -> (match dtb__37 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> (match dtb__39 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__40; Base_dPair.f_Base_dPair_dPair_second = dtb__41 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dcheckType mc1) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) mc2) dtb__40)) (fun p -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = dtb__43 } -> (match dtb__43 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders mc1) dtb__45) dtb__42) dtb__38) dtb__41)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__46; Base_dPair.f_Base_dPair_dPair_second = dtb__47 } -> ((fun sigTy -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo dtb__35) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = sigTy }, mc1))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__47) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__36) sigTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl dtb__47)))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = sigTy }, mc3)))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm dtb__47) 0) dtb__46))
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

# 54 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabSigs = (fun sigs globals ec -> ((((v_Vuna_dCompiler_dElab_dDriver_delabSigsGo sigs) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf globals))) true)) Base_dList.C_Base_dList_dList_Nil))

# 193 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (if dtb__49 then ((fun domVal -> ((fun acc2 -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo mc0) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__48) domVal) mc1)) dtb__52) acc2)) (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain mc0) domVal) then (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName = dtb__48; f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1); f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom = domVal }, mc3)) else mc3))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__51)) else (Base_dList.v_Base_dList_dreverse mc3))
  | _ -> (Base_dList.v_Base_dList_dreverse mc3)
))

# 190 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders = (fun ec ty -> ((((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo ec) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ty) Base_dList.C_Base_dList_dList_Nil))

# 244 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches = (fun ec a b -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) a)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) b)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__53) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__54) -> false
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (((v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches mc0) (dtb__55).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictDom) mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55)) else (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder mc0) dtb__56) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo = (fun ec binders goals kept acc -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (match dtb__57 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__59; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__60; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__61; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__62; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__63; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__64 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__61) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__58) (Base_dList.C_Base_dList_dList_Cons (dtb__57, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder ec) binders) dtb__62) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__58) (Base_dList.C_Base_dList_dList_Cons (dtb__57, kept))) acc)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66) -> ((fun q -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__61) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ((dtb__66).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName, (dtb__66).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel, Base_dList.C_Base_dList_dList_Nil))))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__67) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__67))) binders) dtb__58) kept) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta = dtb__61; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName = (dtb__66).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictName; f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ = q }, acc)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__68) -> (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) binders) dtb__58) (Base_dList.C_Base_dList_dList_Cons (dtb__57, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((dtb__66).f_Vuna_dCompiler_dElab_dDriver_dDeclDictBinder_declDictLevel + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) (Base_dList.v_Base_dList_dreverse kept)) }
  | _ -> failwith "DT: impossible branch"
)) goals))

# 249 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts dtb__70) ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar (dtb__69).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstMeta) (dtb__69).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstName) (dtb__69).f_Vuna_dCompiler_dElab_dDriver_dDictSubst_dictSubstQ) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals = (fun ec ty body -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec }
  | _ -> (match ((v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders ec) ty) with
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = body; Base_dPair.f_Base_dPair_dPair_second = ec }
  | dtb__71 -> ((fun solved -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts (Base_dPair.v_Base_dPair_dfirstOf solved)) body); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf solved) }) (((((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo ec) dtb__71) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))
)
))

# 259 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match dtb__72 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__74, dtb__75, dtb__76, dtb__77) -> ((fun cur -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__73) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__74) ((Base_dList.v_Base_dList_dappend cur) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = dtb__76 }, Base_dList.C_Base_dList_dList_Nil)))) mc1))) (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__74) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> dtb__78
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo dtb__73) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf = (fun decls -> ((v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo decls) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 270 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl = (fun ec decls name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (ec).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79) -> dtb__79
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone = (fun name ec -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__80) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__81) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = dtb__81 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs = (fun defs -> ((Base_dList.v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair) defs))

# 290 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (match dtb__82 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__84, dtb__85, dtb__86, dtb__87) -> (Base_dList.C_Base_dList_dList_Cons (dtb__84, (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__83)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames dtb__83)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__88 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__90; Base_dPair.f_Base_dPair_dPair_second = dtb__91 } -> (match dtb__91 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__92; Base_dPair.f_Base_dPair_dPair_second = dtb__93 } -> (match dtb__93 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__94; Base_dPair.f_Base_dPair_dPair_second = dtb__95 } -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__90) mc3) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__90) mc2) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__96) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AxiomWithDefinition (dtb__90))) dtb__90) else ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__89) mc1) mc2) mc3))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__90) mc2) then (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__90) mc1) then ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo dtb__89) mc1) mc2) mc3) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan dtb__95) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__90))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__90, Base_dVec.C_Base_dVec_dVec_Nil))))))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan dtb__95) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_SignatureNoDef (dtb__90))) (Base_dVec.C_Base_dVec_dVec_Cons (dtb__90, Base_dVec.C_Base_dVec_dVec_Nil)))))))
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

# 367 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl = (fun decls -> (Base_dHashMap.v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)))

# 375 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__97 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__99, dtb__100, dtb__101) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__99; Base_dPair.f_Base_dPair_dPair_second = dtb__101 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__98)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__102, dtb__103, dtb__104, dtb__105) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__102; Base_dPair.f_Base_dPair_dPair_second = dtb__105 }, (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__98)))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs dtb__98)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl = (fun decls -> ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs decls)))

# 350 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined = (fun sigs globals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo sigs) (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) globals))) (v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl decls)) (v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl decls)))

# 382 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasFunClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (match dtb__106 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__108, dtb__109, dtb__110, dtb__111) -> (if (dtb__108 = mc0) then true else ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__107))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_dhasFunClause mc0) dtb__107)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match dtb__112 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__114, dtb__115, dtb__116) -> (if (dtb__114 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__113))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__117, dtb__118, dtb__119, dtb__120) -> (if (dtb__117 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__120)) else ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__113))
  | _ -> ((v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf mc0) dtb__113)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__121) -> (match dtb__121 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__122, dtb__123) -> (if (if (if (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (("Array " ^ dtb__122)))) dtb__122))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

# 412 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__124) -> (match dtb__124 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__125, dtb__126) -> (if (if (if (dtb__125 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__125 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__125 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (if (dtb__125 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem mc0) dtb__127)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__126) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported (dtb__125))) dtb__125)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

# 402 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__130 then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) dtb__132)) (fun _u -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__133) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__129, mc2, Base_dList.C_Base_dList_dList_Nil))))))))))
  | _ -> (if (mc1 <= 0) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain mc0) mc3))
))

# 399 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy = (fun sp tyTerm -> ((((v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue sp) 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) tyTerm)))

# 446 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dallReplCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__134)) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors dtb__135))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplShortName = (fun g -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot g))))

# 477 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm = (fun xs x -> ((Base_dList.v_Base_dList_dappend xs) (Base_dList.C_Base_dList_dList_Cons (x, Base_dList.C_Base_dList_dList_Nil))))

# 471 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dspineOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__136, dtb__137, dtb__138) -> (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf dtb__136) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__139; Base_dPair.f_Base_dPair_dPair_second = dtb__140 } -> { Base_dPair.f_Base_dPair_dPair_first = dtb__139; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm dtb__140) dtb__137) }
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__136, dtb__137, dtb__138)); Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = mc0; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
))

# 481 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName = "Base.Nat.Nat.Zero"

# 485 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName = "Base.Nat.Nat.Succ"

# 590 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__141, dtb__142) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (match dtb__143 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__145; Base_dPair.f_Base_dPair_dPair_second = dtb__146 } -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf dtb__141)) then ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__142) dtb__144) else (Base_dList.C_Base_dList_dList_Cons (dtb__145, ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs dtb__142) dtb__144))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs = (fun ctors c args -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn c) ctors) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.v_Base_dPair_dfirstOf p))) args)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__147) -> ((v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__147)) args)
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dreplNatValue = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__148, dtb__149) -> (if (dtb__148 = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0)) else (if (dtb__148 = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match dtb__151 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__150) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__152) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__152 + 1)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__148) dtb__149)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

# 597 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListNilName = "Base.List.List.Nil"

# 601 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplListConsName = "Base.List.List.Cons"

# 604 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplPairName = "Base.Pair.Pair"

# 608 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplJustName = "Base.Maybe.Maybe.Just"

# 612 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dreplNothingName = "Base.Maybe.Maybe.Nothing"

# 568 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disReplAtom = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__153, dtb__154) -> (if (if (if (dtb__153 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then true else (dtb__153 = v_Vuna_dCompiler_dElab_dDriver_dreplPairName)) then true else (dtb__153 = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName)) then true else ((Base_dList.v_Base_dList_dlength (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs mc0) dtb__153) dtb__154)) = 0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__155) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__156) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__157) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__158, dtb__159, dtb__160) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__161) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__162) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__163) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__164) -> true
  | _ -> false
))

# 450 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__165, dtb__166) -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor (fuel - 1)) ctors) dtb__165) dtb__166)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__167, dtb__168, dtb__169) -> "<\229\135\189\230\149\176>"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__170) -> "_"
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__171) -> (v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__171)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__172, dtb__173, dtb__174) -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplApp (fuel - 1)) ctors) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__172, dtb__173, dtb__174)))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)))
# 461 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplApp = (fun fuel ctors t -> (if (fuel <= 0) then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t) else (match (v_Vuna_dCompiler_dElab_dDriver_dspineOf t) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__175; Base_dPair.f_Base_dPair_dPair_second = dtb__176 } -> (match dtb__175 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__177) -> ((v_Vuna_dCompiler_dElab_dDriver_dreplShortName dtb__177) ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) dtb__176))
  | _ -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm t)
)
  | _ -> failwith "DT: impossible branch"
)))
# 500 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor = (fun fuel ctors c args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun kept -> (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName) then "0" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (match dtb__179 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_dreplNatValue (fuel - 1)) ctors) dtb__178) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__180) -> (bi_strFromInt (dtb__180 + 1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then "[]" else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplList (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplPairName) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplPair (fuel - 1)) ctors) kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplJustName) then ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary (fuel - 1)) ctors) "Just") kept) else (if (c = v_Vuna_dCompiler_dElab_dDriver_dreplNothingName) then "Nothing" else ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) (v_Vuna_dCompiler_dElab_dDriver_dreplShortName c)) kept))))))))) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) c) args))))
# 518 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplList = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (if (mc0 <= 0) then "[]" else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (match dtb__184 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (mc0 - 1)) mc1) dtb__183) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185) -> (String.concat "" ["["; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__181); dtb__185])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__181, (Base_dList.C_Base_dList_dList_Cons (dtb__183, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182)))
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (mc0 - 1)) mc1) "Cons") (Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182)))
)) dtb__182))
  | Base_dList.C_Base_dList_dList_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
# 527 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail = (fun fuel ctors t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__186, dtb__187) -> (if (dtb__186 = v_Vuna_dCompiler_dElab_dDriver_dreplListNilName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("]")) else (if (dtb__186 = v_Vuna_dCompiler_dElab_dDriver_dreplListConsName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__188, dtb__189) -> (match dtb__189 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (match dtb__191 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail (fuel - 1)) ctors) dtb__190) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__192) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__188); dtb__192])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (((v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs ctors) dtb__186) dtb__187)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
# 539 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplPair = (fun fuel ctors args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__193, dtb__194) -> (match dtb__194 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__196 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__193); ", "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__195); ")"])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) "Pair") args)
)) args)))
# 546 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__197, dtb__198) -> (match dtb__198 with
  | Base_dList.C_Base_dList_dList_Nil -> (String.concat "" [label; " "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (fuel - 1)) ctors) dtb__197)])
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric (fuel - 1)) ctors) label) args)
)) args)))
# 552 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric = (fun fuel ctors label args -> (if (fuel <= 0) then "<\229\128\188>" else (label ^ (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (fuel - 1)) ctors) args))))
# 556 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__199, dtb__200) -> (if (mc0 <= 0) then "" else (String.concat "" [" "; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArg (mc0 - 1)) mc1) dtb__199); (((v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs (mc0 - 1)) mc1) dtb__200)]))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 562 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_drenderReplArg = (fun fuel ctors t -> (if (fuel <= 0) then "<\229\128\188>" else (if ((v_Vuna_dCompiler_dElab_dDriver_disReplAtom ctors) t) then (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t) else (String.concat "" ["("; (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm (fuel - 1)) ctors) t); ")"]))))

# 443 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl = (fun datas ec v -> (((v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm 512) (v_Vuna_dCompiler_dElab_dDriver_dallReplCtors datas)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) v))))

# 664 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__201, dtb__202) -> (match dtb__201 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__203, dtb__204, dtb__205, dtb__206) -> (if (if (dtb__203 = "Base.Record.HasField") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__203) = "HasField")) then true else (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__202))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls dtb__202)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 673 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__207, dtb__208) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf (dtb__207).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) = (dtb__207).Vuna_dCompiler_dElab_dRecords.f_Vuna_dCompiler_dElab_dRecords_dRecordMeta_recordMetaName) then (Base_dList.C_Base_dList_dList_Cons (dtb__207, (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__208))) else (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas dtb__208))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 680 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls = (fun decls -> (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances (v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls decls))))

# 684 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (match dtb__209 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__211, dtb__212, dtb__213, dtb__214) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__215, dtb__216) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__215) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__210))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__217, dtb__218, dtb__219) -> (match dtb__217 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__220, dtb__221) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf dtb__220) = "HasField") then true else (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__210))
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__210)
)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__210)
)) dtb__212)
  | _ -> (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance dtb__210)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 695 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances = (fun globals decls -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance decls) then decls else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalLookup "Base.Record.getField") globals) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__222) -> ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls decls) then ((Base_dList.v_Base_dList_dappend decls) (v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls decls)) else decls)
  | _ -> failwith "DT: impossible branch"
)))

# 830 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__223, dtb__224) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__223) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName mc0) dtb__224))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 837 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainActionOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__225, dtb__226, dtb__227) -> (match dtb__225 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__228, dtb__229, dtb__230) -> (match dtb__228 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__231) -> (if (dtb__231 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then { Base_dPair.f_Base_dPair_dPair_first = "eff"; Base_dPair.f_Base_dPair_dPair_second = dtb__226 } else { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
)
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = "other"; Base_dPair.f_Base_dPair_dPair_second = mc0 }
))

# 844 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disNilRowTerm = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__232, dtb__233) -> (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__232 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__234) -> (dtb__234 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

# 851 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__235) -> (match dtb__235 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__236, dtb__237) -> (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disBuiltinEffectTag dtb__236)
  | _ -> false
)
  | _ -> false
))

# 855 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__238, dtb__239) -> (if (dtb__238 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then true else (if (dtb__238 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__240, dtb__241) -> (match dtb__241 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__242, dtb__243) -> (match dtb__243 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel dtb__242) then (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue dtb__244) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) dtb__239) else false))
  | _ -> false
))

# 864 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__246, dtb__247, dtb__248) -> (match dtb__246 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__249, dtb__250, dtb__251) -> (match dtb__249 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__252) -> (if (dtb__252 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then ((fun rowV -> (if ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue mc0) rowV) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (if (v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue rowV) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (match (((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) mc0) rowV) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__253) -> (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__253) Base_dList.C_Base_dList_dList_Nil) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__253)))) (Vuna_dCompiler_dElab_dTerm_dImpl.v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__253)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnhandledEffects ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__250)))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__250))
  | _ -> failwith "DT: impossible branch"
)))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc0)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__250))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
))

# 881 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__254) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__255, dtb__256) -> (match dtb__256 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (if (if (if (dtb__255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (dtb__255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)) then true else (dtb__255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (dtb__255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then true else (dtb__255 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName))
  | _ -> false
)
  | _ -> false
)) dtb__254)
  | _ -> false
))

# 894 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainHasParams = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261) -> true
  | _ -> false
))

# 900 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainArityErr = (fun sp ty -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_MainArity (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ty)))

# 926 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies = (fun defs -> ((Base_dList.v_Base_dList_dconcatMap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d); Base_dPair.f_Base_dPair_dPair_second = dtb__262 }, Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) defs))

# 958 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing = (fun sp tyVal -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (st))) st)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))))

# 1046 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo = (fun globals ec n -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) < (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec))) then (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec2) (n - 1)) else ec2))) ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec)))

# 1041 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix = (fun globals ec n -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec) with
  | Base_dList.C_Base_dList_dList_Nil -> ec
  | _ -> (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo globals) ec) n)
))

# 1084 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__263, dtb__264, dtb__265) -> (if (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__263) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__264)) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__265))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__266) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__267) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__268) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__269) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__270, dtb__271) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__270) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__271))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__272, dtb__273, dtb__274, dtb__275, dtb__276) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__272) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__276))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__277, dtb__278, dtb__279, dtb__280, dtb__281) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__277)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__282, dtb__283) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__283)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__284, dtb__285) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__285)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__286, dtb__287) -> ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__287)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__288, dtb__289, dtb__290) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__288) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__289))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__291, dtb__292, dtb__293) -> ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__293)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__297) then true else ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__298))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__299) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__300) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__301, dtb__302, dtb__303) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__304) -> (dtb__304 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 1104 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__305, dtb__306) -> (match dtb__305 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__307; Base_dPair.f_Base_dPair_dPair_second = dtb__308 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) dtb__307) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta mc0) dtb__306))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1108 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__309, dtb__310) -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__309)) then true else ((v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta mc0) dtb__310))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1079 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__311, dtb__312) -> (match dtb__311 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__313; Base_dPair.f_Base_dPair_dPair_second = dtb__314 } -> (if ((v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta mc1) dtb__314) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" [dtb__313; " body="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__314)]))) else ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta dtb__312) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1074 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs ec)) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__315) -> (String.concat "" [" (in `"; dtb__315; "`)"])
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1114 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__316, dtb__317, dtb__318) -> (if (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__316) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__317)) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__318))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__319) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__320) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__321) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__322) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__323, dtb__324) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__323) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__324))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__325) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__329))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__330)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__335, dtb__336) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__336)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__337, dtb__338) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__338)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__339, dtb__340) -> (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__340)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__341, dtb__342, dtb__343) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__341) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__342))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__344, dtb__345, dtb__346) -> (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__346)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__350) then true else (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__351))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__352) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__353) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__354, dtb__355, dtb__356) -> false
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__357) -> true
  | _ -> failwith "DT: impossible branch"
))
# 1134 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__358, dtb__359) -> (match dtb__358 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__360; Base_dPair.f_Base_dPair_dPair_second = dtb__361 } -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__360) then true else (v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta dtb__359))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1138 "Vuna/Compiler/Elab/Driver.vuna"
and v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__362, dtb__363) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__362)) then true else (v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta dtb__363))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_delabBodies = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__364, dtb__365) -> (match dtb__364 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__366, dtb__367, dtb__368, dtb__369) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__366) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__369) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__366))) dtb__366)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__370) -> (if ((v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone dtb__366) mc4) then (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__365) mc1) mc2) mc3) mc4) else ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabFunDef mc1) mc4) (((v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__364, dtb__365))) dtb__366)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__370)) dtb__369)) (fun p -> ((fun _u -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__371; Base_dPair.f_Base_dPair_dPair_second = dtb__372 } -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__365) mc1) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = liftedTy }, mc2))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (dtb__366, liftedTy, cleanTerm, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__369)))), mc3))) ecWithDef)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDef ecGlobals) { Base_dPair.f_Base_dPair_dPair_first = dtb__366; Base_dPair.f_Base_dPair_dPair_second = cleanTerm }))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl liftedEc) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) dtb__366) liftedTy) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl liftedEc))))) (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta liftedBody) then ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm liftedEc) liftedBody) else liftedBody))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf lifted)))) (Base_dPair.v_Base_dPair_dfirstOf lifted))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals dtb__366) ec1b) dtb__370) bodyTerm1))) (Base_dPair.v_Base_dPair_dsecondOf solvedDecl))) (Base_dPair.v_Base_dPair_dfirstOf solvedDecl))) (((v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals dtb__372) dtb__370) dtb__371))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line ("FUN " ^ dtb__366)) else 0))))) (if (dtp_debug_on 0) then (dtp_debug_line ("DEF " ^ dtb__366)) else 0)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__373, dtb__374, dtb__375) -> (if ((Base_dString.v_Base_dString_dstartsWith "vuna_seal_") dtb__373) then ((fun target -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__365) mc1) mc2) mc3) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRemoveDefTbl target) mc4))) (((dtp_substring 10) ((bi_strLength dtb__373) - 10)) dtb__373)) else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__373) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__375) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__373))) dtb__373)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__376) -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__365) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtAxiom (dtb__373, dtb__376, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__375)))), mc3))) mc4)
  | _ -> failwith "DT: impossible branch"
))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__377, dtb__378, dtb__379, dtb__380) -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__377) mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__380) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedSignature (dtb__377))) dtb__377)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__381) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy dtb__380) dtb__381)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__365) mc1) mc2) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtExtern (dtb__377, dtb__381, dtb__378, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__380)))), mc3))) mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies dtb__365) mc1) mc2) mc3) mc4)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc3); Base_dPair.f_Base_dPair_dPair_second = mc4 }))
  | _ -> failwith "DT: impossible branch"
))

# 1031 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_drezonkDefs = (fun ec defs -> ((Base_dList.v_Base_dList_dmap (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__382) -> (if (v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta dtb__382) then (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d), ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm ec) dtb__382), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d))) else d)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

# 753 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux = (fun startEc startGlobals records decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectSigs decls)) (fun sigs -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dData.v_Vuna_dCompiler_dElab_dData_delabDatas ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls decls) Base_dList.C_Base_dList_dList_Nil)) records) startGlobals) startEc)) (fun pd -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__383; Base_dPair.f_Base_dPair_dPair_second = dtb__384 } -> (match dtb__384 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__385; Base_dPair.f_Base_dPair_dPair_second = dtb__386 } -> ((fun ec0b -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabTraits ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls decls) Base_dList.C_Base_dList_dList_Nil)) dtb__385) ec0b)) (fun pt -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__387; Base_dPair.f_Base_dPair_dPair_second = dtb__388 } -> (match dtb__388 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__389; Base_dPair.f_Base_dPair_dPair_second = dtb__390 } -> (match dtb__390 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__391; Base_dPair.f_Base_dPair_dPair_second = dtb__392 } -> (match dtb__392 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__393; Base_dPair.f_Base_dPair_dPair_second = dtb__394 } -> ((fun globals1 -> ((fun datas1 -> ((fun classesAll -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls decls) Base_dList.C_Base_dList_dList_Nil)) classesAll) globals1) dtb__394)) (fun pih -> (match pih with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__395; Base_dPair.f_Base_dPair_dPair_second = dtb__396 } -> ((fun globals2 -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_delabSigs sigs) globals2) dtb__396)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__397; Base_dPair.f_Base_dPair_dPair_second = dtb__398 } -> ((fun ec2b -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined sigs) dtb__397) decls)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDriver_delabBodies decls) dtb__397) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) ec2b)) (fun q -> (match q with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__399; Base_dPair.f_Base_dPair_dPair_second = dtb__400 } -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies decls) classesAll) datas1) dtb__397) ec3)) (fun pi -> (match pi with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__401; Base_dPair.f_Base_dPair_dPair_second = dtb__402 } -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas = datas1; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc = ec4; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs = defs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs = instDefs; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals = dtb__397; f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans = dtb__393 }))) (if (dtp_debug_on 0) then (dtp_debug_line "instbodies-done") else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) dtb__401))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__397) dtb__402) 8))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsAudit dtb__400) then "inst-index=ok" else "inst-index=MISMATCH")) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["bodies-done g="; (bi_strFromInt (Base_dList.v_Base_dList_dlength dtb__397)); " sols="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols dtb__400))); " defs="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefs dtb__400))); " metas="; (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext dtb__400)); " dgoals="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending dtb__400))); " datas="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__400))); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts dtb__400))); " classes="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__400)))])) else 0))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec3) dtb__399))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__397) dtb__400) 8))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "sigs-elab-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl dtb__398) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__397))) true)) (v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "instheads-done") else 0))) ((Base_dList.v_Base_dList_dappend globals1) dtb__395))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "traits-done") else 0))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses dtb__394))) ((Base_dList.v_Base_dList_dappend dtb__383) dtb__387))) ((Base_dList.v_Base_dList_dappend dtb__385) dtb__389))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (if (dtp_debug_on 0) then (dtp_debug_line "datas-done") else 0))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl dtb__386) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__386))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (if (dtp_debug_on 0) then (dtp_debug_line "collectSigs-done") else 0)))))

# 939 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo = (fun ec globals defs sp tyVal -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Show") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__403) -> ((fun mname -> ((fun dictTy -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__404) -> (match dtb__404 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__405; Base_dPair.f_Base_dPair_dPair_second = dtb__406 } -> ((fun tyTerm -> ((fun body -> ((fun def -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec) ((Base_dList.v_Base_dList_dappend defs) (Base_dList.C_Base_dList_dList_Cons (def, Base_dList.C_Base_dList_dList_Nil))))))) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDef_DtDef (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dmainShowDefName, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("x", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, tyTerm, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)))), body, (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("x", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__405, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar ("x", 0, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__407) -> ((v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing sp) tyVal)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dictTy) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__403)), (Base_dList.C_Base_dList_dList_Cons (tyVal, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__403).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) "show"))
  | _ -> failwith "DT: impossible branch"
))

# 932 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner = (fun ec globals defs bodies sp inner kind -> ((fun tyVal -> ((fun tyTerm -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy tyVal) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (defs)) else (((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo ec) globals) defs) sp) tyVal))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) tyVal))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) inner))))

# 908 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow = (fun ec globals defs -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindDefByName "main") defs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (defs))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__408) -> ((fun sp -> ((fun ty -> ((fun bodies -> ((fun p -> ((fun inner -> ((fun kind -> (if (v_Vuna_dCompiler_dElab_dDriver_dmainHasParams inner) then ((v_Vuna_dCompiler_dElab_dDriver_dmainArityErr sp) inner) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck ec) globals) sp) ty)) (fun _u -> (((((((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner ec) globals) defs) bodies) sp) inner) kind))))) (Base_dPair.v_Base_dPair_dfirstOf p))) (Base_dPair.v_Base_dPair_dsecondOf p))) (v_Vuna_dCompiler_dElab_dDriver_dmainActionOf ty))) (v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies defs))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__408))) (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__408) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__409) -> dtb__409
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf = (fun g -> (Base_dList.v_Base_dList_dlength (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx))

# 1146 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dfindGoal = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__410, dtb__411) -> (if ((dtb__410).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__410)) else ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal mc0) dtb__411))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo = (fun remaining stop sols relevant goals -> (if (remaining <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun i -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup i) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__412) -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dmemMetaId i) relevant) then true else (Base_dMaybe.v_Base_dMaybe_disJust ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal i) goals))) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (i)) else (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 35 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant = (fun i stop sols relevant goals -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

# 28 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta = (fun ec -> (((((v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant 0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drelevantMetas ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)))

# 1164 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dzonkGoal = (fun sols v -> ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsFromList sols)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))

# 1171 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__413, dtb__414) -> (match dtb__413 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__415; Base_dPair.f_Base_dPair_dPair_second = dtb__416 } -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__415; Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt mc2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__415; Base_dPair.f_Base_dPair_dPair_second = dtb__416 }, dtb__414))) 0) mc2)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (mc1 + 1)) dtb__416))) }, (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt dtb__414) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1168 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf = (fun items -> (((v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt items) 0) (Base_dList.v_Base_dList_dlength items)))

# 1158 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf = (fun sols g -> { f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoSpan = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan; f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoGoal = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf g)) ((v_Vuna_dCompiler_dElab_dDriver_dzonkGoal sols) (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType)); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoCtx = (v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalCtx); f_Vuna_dCompiler_dElab_dDriver_dDtGoalInfo_dtGoalInfoName = (g).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName })

# 1185 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__417; Base_dPair.f_Base_dPair_dPair_second = dtb__418 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__418)) (fun ds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__417) ds2)) (fun core -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1214 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddDatasEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__419, dtb__420) -> ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddData mc0) dtb__419)) dtb__420)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddInstsEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__421, dtb__422) -> ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddInst mc0) dtb__421)) dtb__422)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1222 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_daddClassesEc = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__423, dtb__424) -> ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddClass mc0) dtb__423)) dtb__424)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1201 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_decOfProgram = (fun prog -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> ((fun ec7 -> { Base_dPair.f_Base_dPair_dPair_first = ec7; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog) }) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec6) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutNext ec5) (prog).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec4) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl ec3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))))) ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog)))) ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty))

# 1241 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dinsertCandidate = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__425; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__426; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__427 } -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__428, dtb__429) -> (match dtb__428 with
  | { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__430; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__431; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__432 } -> (if (dtb__425 <= dtb__430) then (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__425; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__426; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__427 }, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__430; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__431; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__432 }, dtb__429)))) else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__430; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__431; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__432 }, ((v_Vuna_dCompiler_dElab_dDriver_dinsertCandidate { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = dtb__425; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = dtb__426; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = dtb__427 }) dtb__429))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1237 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dsortCandidates = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__433, dtb__434) -> ((v_Vuna_dCompiler_dElab_dDriver_dinsertCandidate dtb__433) (v_Vuna_dCompiler_dElab_dDriver_dsortCandidates dtb__434))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1248 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dinstCandidate = (fun shown i -> { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateText = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName i); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateSpan = (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dCandidate_candidateReason = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((String.concat "" ["instance head "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " does not match goal "; shown]))) })

# 1264 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__435, dtb__436) -> (if (if (dtb__435 = 32) then true else (dtb__435 = 41)) then (Base_dList.v_Base_dList_dreverse mc1) else ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar dtb__436) (Base_dList.C_Base_dList_dList_Cons (dtb__435, mc1))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1254 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown = (fun s -> ((fun cs -> ((fun body -> (Base_dList.dtp_pack ((v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar body) Base_dList.C_Base_dList_dList_Nil))) (match cs with
  | Base_dList.C_Base_dList_dList_Cons (dtb__437, dtb__438) -> (if (dtb__437 = 40) then dtb__438 else cs)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (Base_dList.dtp_unpack s)))

# 1228 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf = (fun ec shown -> ((fun fam -> ((fun insts -> (v_Vuna_dCompiler_dElab_dDriver_dsortCandidates ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dinstCandidate shown)) insts))) (if (fam = "") then (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) fam)))) (v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown shown)))

# 1270 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated = (fun ec m d -> (match ((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf ec) m) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__439) -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan ("created", dtb__439))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote ("metavariable created here"))) d))
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore = (fun prog expr -> (match prog with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = dtb__440; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = dtb__441; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = dtb__442; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = dtb__443; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = dtb__444; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = dtb__445; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = dtb__446; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = dtb__447; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = dtb__448; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = dtb__449; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = dtb__450 } -> ((fun bodies -> ((fun ec0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dTerm.v_Vuna_dCompiler_dElab_dTerm_dinferE dtb__444) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec0) expr)) (fun p -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__451; Base_dPair.f_Base_dPair_dPair_second = dtb__452 } -> (match dtb__452 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__453; Base_dPair.f_Base_dPair_dPair_second = dtb__454 } -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__455) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__456) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__456) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__455))) dtb__455)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__455))) dtb__455)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom dtb__447) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec2)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec2)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__457) -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec2) dtb__457) d))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedMetavarInfer ((bi_strFromInt dtb__457)))) (bi_strFromInt dtb__457)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dnormalize ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__451)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__458) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (bi_strFromInt dtb__458); Base_dPair.f_Base_dPair_dPair_second = tyText }))
  | dtb__459 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl dtb__440) ec2) dtb__459); Base_dPair.f_Base_dPair_dPair_second = tyText }))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec2) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec2)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) dtb__453)))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec2))) (((v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix dtb__444) dtb__454) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecNext = dtb__447; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSols = dtb__443; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefsRev = (Base_dList.v_Base_dList_dreverse bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDatas = dtb__440; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthOfMeta = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGoals = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf dtb__445); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClasses = dtb__446; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecConstraints = Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dcsEmpty; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) bodies); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsTbl = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf dtb__444); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecSolTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl dtb__443); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDepthTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dInt.v_Hashable_uInt) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecGlobalsComplete = true; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecClausesTbl = ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecCtorTbl = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas dtb__440); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecDefVals = dtb__448; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecHasLinear = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear dtb__440); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecMetaSpans = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecUseSpans = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dEc_ecWarnings = dtb__450 })) (v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs dtb__441))
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo = (fun prog expr -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore prog) expr))

# 615 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn = (fun prog expr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) expr)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dfirstOf p))))))

# 1055 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage = (fun ec m -> (match ((v_Vuna_dCompiler_dElab_dDriver_dfindGoal m) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__460) -> ((fun spot -> ((fun goalTy -> ((fun detail -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) (dtb__460).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalMeta) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithFallbackSpan (dtb__460).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldSpan ("goal", (dtb__460).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalSpan))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (("goal: " ^ goalTy)))) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedHole (detail))) (Base_dVec.C_Base_dVec_dVec_Cons (detail, Base_dVec.C_Base_dVec_dVec_Nil)))))))) (String.concat "" [spot; " with goal "; goalTy]))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf dtb__460)) (dtb__460).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalType))) (if ((dtb__460).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName = "") then "?" else ("?" ^ (dtb__460).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtGoal_dtGoalName)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun num -> ((fun hint -> (((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec) m) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldName (num))) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldNote (hint))) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnsolvedMetavar (num, hint))) (Base_dVec.C_Base_dVec_dVec_Cons (num, (Base_dVec.C_Base_dVec_dVec_Cons (hint, Base_dVec.C_Base_dVec_dVec_Nil))))))))) ((v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

# 965 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dfinishCore = (fun termAux decls core -> ((fun ec4 -> ((fun datas1 -> ((fun defs -> ((fun instDefs -> ((fun globals -> ((fun projSpans -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__461) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__462) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__462) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__461))) dtb__461)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__461))) dtb__461)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__463) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__464) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__464) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__463))) dtb__463)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (dtb__463))) dtb__463)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__465) -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__466) -> ((fun cands -> ((fun createdOf -> (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__467) -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> (createdOf ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (cands))) d)))) (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__467) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__466))) dtb__466))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_donErrDiag (fun d -> (createdOf ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldCandidates (cands))) d)))) ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (dtb__466))) dtb__466))
  | _ -> failwith "DT: impossible branch"
)) (match (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta ec4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__468) -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__468)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated ec4) dtb__465)
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf ec4) dtb__466))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage ec4) dtb__465)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun extra -> ((fun allDefs0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow ec4) globals) allDefs0)) (fun allDefs -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dUsage.v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage ec4) allDefs)) (fun ec5 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTermination.v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith (v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames decls)) ((Base_dList.v_Base_dList_dappend termAux) decls))) (fun _u -> ((fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDatas = datas1; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefs = allDefs; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGoals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGoals ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgSols = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgGlobals = globalsOut; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgInsts = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgClasses = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgNext = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDefVals = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefVals ec5); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgDepths = ((Base_dHashMap.v_Base_dHashMap_dtoList Base_dInt.v_Eq_uInt) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDepthTbl ec5)); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtProgram_dtProgWarnings = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decWarnings ec5) }))) (if (dtp_debug_on 0) then (dtp_debug_line "termination-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "extradefs-done") else 0))) ((Base_dList.v_Base_dList_dmap (fun g -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) (Base_dPair.v_Base_dPair_dfirstOf g)) defsTblOut) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__469) -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf g); Base_dPair.f_Base_dPair_dPair_second = dtb__469 }
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> g
  | _ -> failwith "DT: impossible branch"
))) globals))) (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun x -> { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName x); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType x) })) allDefs)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dElab_dDriver_drezonkDefs ec4) ((Base_dList.v_Base_dList_dappend instDefs) ((Base_dList.v_Base_dList_dappend extra) defs))))) ((((Vuna_dCompiler_dElab_dTrait.v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf globals) ec4) projSpans) ((Base_dList.v_Base_dList_dappend instDefs) defs)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreProjSpans)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreGlobals)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreInstDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDefs)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreDatas)) (core).f_Vuna_dCompiler_dElab_dDriver_dElabCore_coreEc))

# 1025 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux = (fun startEc startGlobals records termAux decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux startEc) startGlobals) records) decls)) (fun core -> (((v_Vuna_dCompiler_dElab_dDriver_dfinishCore termAux) decls) core))))

# 724 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux = (fun startEc startGlobals termAux decls -> ((fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith termAux) decls2)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__470; Base_dPair.f_Base_dPair_dPair_second = dtb__471 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__471)) (fun ds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls termAux)) (fun ap -> (match ap with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__472; Base_dPair.f_Base_dPair_dPair_second = dtb__473 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__473)) (fun ads2 -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) dtb__470) ads2) ds2)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances startGlobals) decls)))

# 718 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith = (fun startEc startGlobals decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux startEc) startGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

# 739 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith = (fun startEc startGlobals records decls -> (((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux startEc) startGlobals) records) Base_dList.C_Base_dList_dList_Nil) decls))

# 703 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramFull = (fun decls -> ((fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dprepareDecls decls2)) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__474; Base_dPair.f_Base_dPair_dPair_second = dtb__475 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dDerive.v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings dtb__475)) (fun ds2 -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) dtb__474) ds2)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) decls)))

# 713 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgramGo = (fun decls -> ((((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decEmpty) Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals) Base_dList.C_Base_dList_dList_Nil) decls))

# 1177 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgSols prog))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals prog)))))))

# 1192 "Vuna/Compiler/Elab/Driver.vuna"
let v_Vuna_dCompiler_dElab_dDriver_delabProgram = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun prog -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog); Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog) })))))
