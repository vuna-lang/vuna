open Vuna_runtime
type t_DeclDictBinder = { f_DeclDictBinder_declDictName : string; f_DeclDictBinder_declDictLevel : int; f_DeclDictBinder_declDictDom : Core_dTerm.t_Value }
and t_DictSubst = { f_DictSubst_dictSubstMeta : int; f_DictSubst_dictSubstName : string; f_DictSubst_dictSubstQ : int }
and t_ElabCore = { f_ElabCore_coreDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_ElabCore_coreEc : Elab_dTypes.t_Ec; f_ElabCore_coreDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_ElabCore_coreInstDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_ElabCore_coreGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ElabCore_coreProjSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_DtGoalInfo = { f_DtGoalInfo_dtGoalInfoSpan : Base_dSource.t_Span; f_DtGoalInfo_dtGoalInfoGoal : string; f_DtGoalInfo_dtGoalInfoCtx : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtGoalInfo_dtGoalInfoName : string }

# 40 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_countNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> ((fun cur -> ((v_countNames dtb__1) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__0) (cur + 1)) mc1))) (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__0) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> dtb__2
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Elab/Driver.vuna"
let v_showCounters = (fun (names : string B_dData_dList.t_List) -> ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (fun (p : (string, int) B_dData_dPair.t_Pair) -> (String.concat "" [((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uString) (B_dData_dPair.v_firstOf p)); "="; ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_ua B_dData_dInt.v_Show_uInt)) (B_dData_dPair.v_secondOf p))]))) ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60_ B_dData_dString.v_Ord_uString) (B_dData_dPair.v_firstOf a)) (B_dData_dPair.v_firstOf b)))) (B_dContainer_dHashMap.v_toList ((v_countNames names) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))))))

# 108 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_leadingImplicitCtxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if dtb__4 then ((fun domVal -> ((v_leadingImplicitCtxGo (((Elab_dTypes.v_ctxBindValue dtb__3) domVal) mc0)) dtb__7)) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc0)) dtb__6)) else mc0)
  | _ -> mc0
))

# 105 "Vuna/Compiler/Elab/Driver.vuna"
let v_leadingImplicitCtx = (fun (ty0 : Core_dTerm.t_Term) -> ((v_leadingImplicitCtxGo Elab_dTypes.v_emptyCtx) ty0))

# 158 "Vuna/Compiler/Elab/Driver.vuna"
let v_isMemberConstraintExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__8, dtb__9, dtb__10) -> (match dtb__8 with
  | Frontend_dRast.C_Expr_EVar (dtb__11, dtb__12) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__11) = Base_dIntrinsics.v_effMemberFamilyName) then (if ((B_dData_dList.v_length dtb__9) = 3) then true else ((B_dData_dList.v_length dtb__9) = 2)) else false)
  | _ -> false
)
  | _ -> false
))

# 148 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_splitMemberCtx = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> ((fun r -> (if (v_isMemberConstraintExpr dtb__13) then { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__13, (B_dData_dPair.v_firstOf r))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } else { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf r); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__13, (B_dData_dPair.v_secondOf r))) })) (v_splitMemberCtx dtb__14))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Elab/Driver.vuna"
let v_memberSugarExpr = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EApp (dtb__15, dtb__16, dtb__17) -> (match dtb__15 with
  | Frontend_dRast.C_Expr_EVar (dtb__18, dtb__19) -> (match dtb__16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__18) = Base_dIntrinsics.v_effMemberFamilyName) then (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar (dtb__18, dtb__19)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effNamedName), dtb__17)), (B_dData_dList.C_List__x58__x58_ (dtb__20, (B_dData_dList.C_List__x58__x58_ (dtb__22, B_dData_dList.C_List_Nil)))), dtb__17)), (B_dData_dList.C_List__x58__x58_ (dtb__24, B_dData_dList.C_List_Nil)))), dtb__17)) else mc1)
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
let rec v_elabMemberConstraintDoms = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType mc0) mc1) mc2) ((v_memberSugarExpr mc2) dtb__26))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> (match dtb__29 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> ((Base_dCommon.v_bind (((((v_elabMemberConstraintDoms mc0) mc1) dtb__31) dtb__27) mc4)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__32)); B_dData_dPair.f_Pair_second = dtb__33 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Elab/Driver.vuna"
let v_sigMemberName = (fun (k : int) -> ("_member" ^ (bi_strFromInt k)))

# 194 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_prependSigMembers = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (Core_dTerm.C_Term_TPi ((v_sigMemberName mc2), true, Core_dTerm.C_Rig_Rig0, dtb__34, (((v_prependSigMembers mc0) dtb__35) (mc2 + 1))))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_insertSigMembersRev = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> ((((v_insertSigMembersRev (((((Core_dTerm.v_insertImplicitBinder (v_sigMemberName mc2)) mc3) Core_dTerm.C_Rig_Rig0) dtb__36) mc0)) dtb__37) (mc2 - 1)) mc3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Elab/Driver.vuna"
let v_insertSigMembers = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_prependSigMembers mc0) mc1) 0) else ((((v_insertSigMembersRev mc0) mc1) ((B_dData_dList.v_length mc1) - 1)) (mc2 - 1)))
))

# 235 "Vuna/Compiler/Elab/Driver.vuna"
let v_sigDictName = (fun (k : int) -> ("_ctx" ^ (bi_strFromInt k)))

# 225 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_prependSigDicts = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (Core_dTerm.C_Term_TPi ((v_sigDictName mc2), true, Core_dTerm.C_Rig_RigOmega, dtb__38, (((v_prependSigDicts mc0) dtb__39) (mc2 + 1))))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_insertSigDictsRev = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> ((((v_insertSigDictsRev ((((Core_dTerm.v_insertDictBinder (v_sigDictName mc2)) mc3) dtb__40) mc0)) dtb__41) (mc2 - 1)) mc3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Elab/Driver.vuna"
let v_insertSigDicts = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_prependSigDicts mc0) mc1) 0) else ((((v_insertSigDictsRev mc0) mc1) ((B_dData_dList.v_length mc1) - 1)) (mc2 - 1)))
))

# 122 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabSigDictBinders = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Term) (mc3 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> ((fun split -> ((fun memberExprs -> ((fun otherExprs -> ((fun leadCtx -> ((Base_dCommon.v_bind ((Elab_dTrait.v_constraintPartsOf mc4) otherExprs)) (fun (parts : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((Elab_dTrait.v_elabConstraintDomains (Elab_dTypes.v_ecClasses mc1)) mc0) leadCtx) parts) mc4) mc1)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((((v_elabMemberConstraintDoms mc0) leadCtx) (B_dData_dPair.v_secondOf q)) memberExprs) mc4)) (fun (m : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((fun doms -> ((fun ec1 -> ((fun memberDoms -> ((fun ec2 -> ((fun ty1 -> ((fun ty2 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ty2; B_dData_dPair.f_Pair_second = ec2 }))) (((v_insertSigMembers ty1) memberDoms) (Elab_dTrait.v_leadingImplicitCount ty1)))) (((v_insertSigDicts mc2) doms) (Elab_dTrait.v_leadingImplicitCount mc2)))) (B_dData_dPair.v_secondOf m))) (B_dData_dPair.v_firstOf m))) (B_dData_dPair.v_secondOf q))) (B_dData_dPair.v_firstOf q))))))))) (v_leadingImplicitCtx mc2))) (B_dData_dPair.v_secondOf split))) (B_dData_dPair.v_firstOf split))) (v_splitMemberCtx mc3))
))

# 87 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_elabSigsGo = (fun (mc0 : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__45 } -> (match dtb__45 with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (match dtb__47 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType mc1) Elab_dTypes.v_emptyCtx) mc2) dtb__48)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (match dtb__51 with
  | { B_dData_dPair.f_Pair_first = dtb__52; B_dData_dPair.f_Pair_second = dtb__53 } -> ((Base_dCommon.v_bind (((((v_elabSigDictBinders mc1) dtb__53) dtb__50) dtb__46) dtb__49)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = dtb__55 } -> ((fun sigTy -> ((((v_elabSigsGo dtb__43) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = sigTy }, mc1))) ((Elab_dTypes.v_ecPutGlobalsTbl dtb__55) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__44) sigTy) (Elab_dTypes.v_ecGlobalsTbl dtb__55)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = sigTy }, mc3)))) (((Elab_dMeta.v_zonkTerm dtb__55) 0) dtb__54))
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
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) (B_dData_dList.v_reverse mc3)); B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabSigs = (fun (sigs : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((v_elabSigsGo sigs) globals) ((Elab_dTypes.v_ecSetGlobalsComplete ((Elab_dTypes.v_ecPutGlobalsTbl ec) (Elab_dMeta.v_globalsTableOf globals))) true)) B_dData_dList.C_List_Nil))

# 253 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_declaredDictBindersGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Core_dTerm.t_Term) (mc3 : t_DeclDictBinder B_dData_dList.t_List) -> (match mc2 with
  | Core_dTerm.C_Term_TPi (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (if dtb__57 then ((fun domVal -> ((fun acc2 -> ((((v_declaredDictBindersGo mc0) (((Elab_dTypes.v_ctxBindValue dtb__56) domVal) mc1)) dtb__60) acc2)) (if ((Elab_dDict.v_isDictDomain mc0) domVal) then (B_dData_dList.C_List__x58__x58_ ({ f_DeclDictBinder_declDictName = dtb__56; f_DeclDictBinder_declDictLevel = (Elab_dTypes.v_ctxDepth mc1); f_DeclDictBinder_declDictDom = domVal }, mc3)) else mc3))) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__59)) else (B_dData_dList.v_reverse mc3))
  | _ -> (B_dData_dList.v_reverse mc3)
))

# 250 "Vuna/Compiler/Elab/Driver.vuna"
let v_declaredDictBinders = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) -> ((((v_declaredDictBindersGo ec) Elab_dTypes.v_emptyCtx) ty) B_dData_dList.C_List_Nil))

# 311 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictDomMatches = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) ((Elab_dTypes.v_forceVal ec) a)) ((Elab_dTypes.v_forceVal ec) b)) with
  | Base_dDiag.C_Check_OkC (dtb__61) -> true
  | Base_dDiag.C_Check_ErrC (dtb__62) -> false
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_firstMatchDictBinder = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : t_DeclDictBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Value) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if (((v_dictDomMatches mc0) (dtb__63).f_DeclDictBinder_declDictDom) mc2) then (B_dData_dMaybe.C_Maybe_Just (dtb__63)) else (((v_firstMatchDictBinder mc0) dtb__64) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_solveDeclaredDictGoalsGo = (fun (ec : Elab_dTypes.t_Ec) (binders : t_DeclDictBinder B_dData_dList.t_List) (goals : Elab_dTypes.t_Constraint B_dData_dList.t_List) (kept : Elab_dTypes.t_Constraint B_dData_dList.t_List) (acc : t_DictSubst B_dData_dList.t_List) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { Elab_dTypes.f_Constraint_conId = dtb__67; Elab_dTypes.f_Constraint_conKind = dtb__68; Elab_dTypes.f_Constraint_conMeta = dtb__69; Elab_dTypes.f_Constraint_conDom = dtb__70; Elab_dTypes.f_Constraint_conSpan = dtb__71; Elab_dTypes.f_Constraint_conDepth = dtb__72 } -> (match ((Core_dTerm.v_metaLookup dtb__69) (Elab_dTypes.v_ecSolTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (((((v_solveDeclaredDictGoalsGo ec) binders) dtb__66) (B_dData_dList.C_List__x58__x58_ (dtb__65, kept))) acc)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_firstMatchDictBinder ec) binders) dtb__70) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_solveDeclaredDictGoalsGo ec) binders) dtb__66) (B_dData_dList.C_List__x58__x58_ (dtb__65, kept))) acc)
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> ((fun q -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) ((dtb__74).f_DeclDictBinder_declDictLevel + 1)) dtb__69) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((dtb__74).f_DeclDictBinder_declDictName, (dtb__74).f_DeclDictBinder_declDictLevel, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__75) -> (((((v_solveDeclaredDictGoalsGo ((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__75))) binders) dtb__66) kept) (B_dData_dList.C_List__x58__x58_ ({ f_DictSubst_dictSubstMeta = dtb__69; f_DictSubst_dictSubstName = (dtb__74).f_DeclDictBinder_declDictName; f_DictSubst_dictSubstQ = q }, acc)))
  | Base_dDiag.C_Check_ErrC (dtb__76) -> (((((v_solveDeclaredDictGoalsGo ec) binders) dtb__66) (B_dData_dList.C_List__x58__x58_ (dtb__65, kept))) acc)
  | _ -> failwith "DT: impossible branch"
)) ((dtb__74).f_DeclDictBinder_declDictLevel + 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending ec) (B_dData_dList.v_reverse kept)) }
  | _ -> failwith "DT: impossible branch"
)) goals))

# 317 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_applyDeclaredDictSubsts = (fun (mc0 : t_DictSubst B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> ((v_applyDeclaredDictSubsts dtb__78) ((((Core_dTerm.v_substMetaVar (dtb__77).f_DictSubst_dictSubstMeta) (dtb__77).f_DictSubst_dictSubstName) (dtb__77).f_DictSubst_dictSubstQ) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Elab/Driver.vuna"
let v_solveDeclaredDictGoals = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPendingList ec) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec }
  | _ -> (match ((v_declaredDictBinders ec) ty) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec }
  | dtb__79 -> ((fun solved -> { B_dData_dPair.f_Pair_first = ((v_applyDeclaredDictSubsts (B_dData_dPair.v_firstOf solved)) body); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf solved) }) (((((v_solveDeclaredDictGoalsGo ec) dtb__79) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))
)
))

# 327 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_clausesTblGo = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : (string, (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | Frontend_dRast.C_Decl_DFun (dtb__82, dtb__83, dtb__84, dtb__85) -> ((fun cur -> ((v_clausesTblGo dtb__81) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__82) ((B_dData_dList.v_append cur) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__83; B_dData_dPair.f_Pair_second = dtb__84 }, B_dData_dList.C_List_Nil)))) mc1))) (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__82) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> dtb__86
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_clausesTblGo dtb__81) mc1)
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Driver.vuna"
let v_clausesTblOf = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((v_clausesTblGo decls) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))

# 340 "Vuna/Compiler/Elab/Driver.vuna"
let v_clausesOfTbl = (fun (ec : Elab_dTypes.t_Ec) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (ec).Elab_dTypes.f_Ec_ecClausesTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> dtb__87
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dRast.v_clausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

# 346 "Vuna/Compiler/Elab/Driver.vuna"
let v_defAlreadyDone = (fun (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) (Elab_dTypes.v_ecDefTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Elab/Driver.vuna"
let v_defBodyPair = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = dtb__89 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Elab/Driver.vuna"
let v_defBodyPairs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_mapMaybe v_defBodyPair) defs))

# 363 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_declFunNames = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | Frontend_dRast.C_Decl_DFun (dtb__92, dtb__93, dtb__94, dtb__95) -> (B_dData_dList.C_List__x58__x58_ (dtb__92, (v_declFunNames dtb__91)))
  | _ -> (v_declFunNames dtb__91)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_checkAllDefinedGo = (fun (mc0 : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> (match dtb__99 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> (match dtb__101 with
  | { B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = dtb__103 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__98) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__104) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__98) mc2) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb__104) (Base_dDiagnostics_dTc.C_TcErr_AxiomWithDefinition (dtb__98))) dtb__98) else ((((v_checkAllDefinedGo dtb__97) mc1) mc2) mc3))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__98) mc2) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__98) mc1) then ((((v_checkAllDefinedGo dtb__97) mc1) mc2) mc3) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb__103) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_SignatureNoDef (dtb__98))) (B_dData_dVec.C_Vec_VCons (dtb__98, B_dData_dVec.C_Vec_Nil))))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb__103) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_SignatureNoDef (dtb__98))) (B_dData_dVec.C_Vec_VCons (dtb__98, B_dData_dVec.C_Vec_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Elab/Driver.vuna"
let v_funNamesTbl = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (B_dContainer_dHashMap.v_ofNames (v_declFunNames decls)))

# 504 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_axiomSpanPairs = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | Frontend_dRast.C_Decl_DAxiom (dtb__107, dtb__108, dtb__109) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__109 }, (v_axiomSpanPairs dtb__106)))
  | Frontend_dRast.C_Decl_DExtern (dtb__110, dtb__111, dtb__112, dtb__113) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__110; B_dData_dPair.f_Pair_second = dtb__113 }, (v_axiomSpanPairs dtb__106)))
  | _ -> (v_axiomSpanPairs dtb__106)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Elab/Driver.vuna"
let v_axiomSpansTbl = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (v_axiomSpanPairs decls)))

# 469 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkAllDefined = (fun (sigs : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((((v_checkAllDefinedGo sigs) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) globals))) (v_funNamesTbl decls)) (v_axiomSpansTbl decls)))

# 512 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasFunClause = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (match dtb__114 with
  | Frontend_dRast.C_Decl_DFun (dtb__116, dtb__117, dtb__118, dtb__119) -> (if (dtb__116 = mc0) then true else ((v_hasFunClause mc0) dtb__115))
  | _ -> ((v_hasFunClause mc0) dtb__115)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_axiomSpanOf = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> (match dtb__120 with
  | Frontend_dRast.C_Decl_DAxiom (dtb__122, dtb__123, dtb__124) -> (if (dtb__122 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__124)) else ((v_axiomSpanOf mc0) dtb__121))
  | Frontend_dRast.C_Decl_DExtern (dtb__125, dtb__126, dtb__127, dtb__128) -> (if (dtb__125 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__128)) else ((v_axiomSpanOf mc0) dtb__121))
  | _ -> ((v_axiomSpanOf mc0) dtb__121)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternArrayElem = (fun (mc0 : Base_dSource.t_Span) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__129) -> (match dtb__129 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__130, dtb__131) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__130) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported (("Array " ^ dtb__130)))) dtb__130))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

# 550 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternDomain = (fun (mc0 : Base_dSource.t_Span) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__132) -> (match dtb__132 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__133, dtb__134) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__133) then (Base_dDiag.C_Check_OkC (0)) else (if (dtb__133 = "Array") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (match dtb__136 with
  | B_dData_dList.C_List_Nil -> ((v_checkExternArrayElem mc0) dtb__135)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) dtb__134) else (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported (dtb__133))) dtb__133)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

# 534 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_checkExternValue = (fun (mc0 : Base_dSource.t_Span) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Value) -> (match mc3 with
  | Core_dTerm.C_Value_VPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> (if (mc1 <= 0) then (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__138 then (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Base_dCommon.v_bind ((v_checkExternDomain mc0) dtb__140)) (fun (_u : int) -> ((((v_checkExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Core_dEval.v_applyClosure dtb__141) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__137, mc2, B_dData_dList.C_List_Nil))))))))))
  | _ -> (if (mc1 <= 0) then (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_checkExternDomain mc0) mc3))
))

# 531 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternTy = (fun (sp : Base_dSource.t_Span) (tyTerm : Core_dTerm.t_Term) -> ((((v_checkExternValue sp) 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm)))

# 587 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_allReplCtors = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> ((B_dData_dList.v_append (Elab_dTypes.v_dtDataCtors dtb__142)) (v_allReplCtors dtb__143))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Elab/Driver.vuna"
let v_replShortName = (fun (g : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot g))))

# 626 "Vuna/Compiler/Elab/Driver.vuna"
let v_appendLastTerm = (fun (xs : Core_dTerm.t_Term B_dData_dList.t_List) (x : Core_dTerm.t_Term) -> ((B_dData_dList.v_append xs) (B_dData_dList.C_List__x58__x58_ (x, B_dData_dList.C_List_Nil))))

# 619 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_spineOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__144, dtb__145, dtb__146) -> (match (v_spineOf dtb__144) with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = ((v_appendLastTerm dtb__148) dtb__145) }
  | _ -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp (dtb__144, dtb__145, dtb__146)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
)
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 630 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNatZeroName = "Base.Data.Nat.Nat.Zero"

# 634 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNatSuccName = "Base.Data.Nat.Nat.Succ"

# 770 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_zipKeptArgs = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | { B_dData_dPair.f_Pair_first = dtb__153; B_dData_dPair.f_Pair_second = dtb__154 } -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__149)) then ((v_zipKeptArgs dtb__150) dtb__152) else (B_dData_dList.C_List__x58__x58_ (dtb__153, ((v_zipKeptArgs dtb__150) dtb__152))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Elab/Driver.vuna"
let v_keptCtorArgs = (fun (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_findCtorIn c) ctors) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf p))) args)
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> ((v_zipKeptArgs (Elab_dTypes.v_dtCtorTelescope dtb__155)) args)
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_replNatValue = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match t with
  | Core_dTerm.C_Term_TCon (dtb__156, dtb__157) -> (if (dtb__156 = v_replNatZeroName) then (B_dData_dMaybe.C_Maybe_Just (0)) else (if (dtb__156 = v_replNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (match dtb__159 with
  | B_dData_dList.C_List_Nil -> (match (((v_replNatValue (fuel - 1)) ctors) dtb__158) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__160 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (((v_keptCtorArgs ctors) dtb__156) dtb__157)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 777 "Vuna/Compiler/Elab/Driver.vuna"
let v_replListNilName = "Base.Data.List.List.Nil"

# 781 "Vuna/Compiler/Elab/Driver.vuna"
let v_replListConsName = "Base.Data.List.List.::"

# 784 "Vuna/Compiler/Elab/Driver.vuna"
let v_replPairName = "Base.Data.Pair.Pair"

# 788 "Vuna/Compiler/Elab/Driver.vuna"
let v_replJustName = "Base.Data.Maybe.Maybe.Just"

# 792 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNothingName = "Base.Data.Maybe.Maybe.Nothing"

# 747 "Vuna/Compiler/Elab/Driver.vuna"
let v_isReplAtom = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TCon (dtb__161, dtb__162) -> (if (if (if (dtb__161 = v_replListNilName) then true else (dtb__161 = v_replPairName)) then true else (dtb__161 = v_replNothingName)) then true else ((B_dData_dList.v_length (((v_keptCtorArgs mc0) dtb__161) dtb__162)) = 0))
  | Core_dTerm.C_Term_TMeta (dtb__163) -> true
  | Core_dTerm.C_Term_TType (dtb__164) -> true
  | Core_dTerm.C_Term_TGlobal (dtb__165) -> true
  | Core_dTerm.C_Term_TVar (dtb__166, dtb__167, dtb__168) -> true
  | Core_dTerm.C_Term_TBool (dtb__169) -> true
  | Core_dTerm.C_Term_TFloat (dtb__170) -> true
  | Core_dTerm.C_Term_TStr (dtb__171) -> true
  | Core_dTerm.C_Term_TInt (dtb__172) -> true
  | _ -> false
))

# 591 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_renderReplTerm = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Core_dTerm.v_showTerm t) else (match t with
  | Core_dTerm.C_Term_TCon (dtb__173, dtb__174) -> ((((v_renderReplCtor (fuel - 1)) ctors) dtb__173) dtb__174)
  | Core_dTerm.C_Term_TLam (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> "<\229\135\189\230\149\176>"
  | Core_dTerm.C_Term_TMeta (dtb__180) -> "_"
  | Core_dTerm.C_Term_TGlobal (dtb__181) -> (v_replShortName dtb__181)
  | Core_dTerm.C_Term_TApp (dtb__182, dtb__183, dtb__184) -> (((v_renderReplApp (fuel - 1)) ctors) (Core_dTerm.C_Term_TApp (dtb__182, dtb__183, dtb__184)))
  | _ -> (Core_dTerm.v_showTerm t)
)))
# 605 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplApp = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Core_dTerm.v_showTerm t) else (match (v_spineOf t) with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (match dtb__185 with
  | Core_dTerm.C_Term_TGlobal (dtb__187) -> ((v_replShortName dtb__187) ^ (((v_renderReplArgs (fuel - 1)) ctors) dtb__186))
  | _ -> (Core_dTerm.v_showTerm t)
)
  | _ -> failwith "DT: impossible branch"
)))
# 657 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplCtor = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else ((fun kept -> (if (c = v_replNatZeroName) then "0" else (if (c = v_replNatSuccName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match dtb__189 with
  | B_dData_dList.C_List_Nil -> (match (((v_replNatValue (fuel - 1)) ctors) dtb__188) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (bi_strFromInt (dtb__190 + 1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Succ") kept)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)) kept) else (if (c = v_replListNilName) then "[]" else (if (c = v_replListConsName) then (((v_renderReplList (fuel - 1)) ctors) kept) else (if (c = v_replPairName) then (((v_renderReplPair (fuel - 1)) ctors) kept) else (if (c = v_replJustName) then ((((v_renderReplUnary (fuel - 1)) ctors) "Just") kept) else (if (c = v_replNothingName) then "Nothing" else ((((v_renderReplGeneric (fuel - 1)) ctors) (v_replShortName c)) kept))))))))) (((v_keptCtorArgs ctors) c) args))))
# 675 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplList = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (if (mc0 <= 0) then "[]" else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (match dtb__194 with
  | B_dData_dList.C_List_Nil -> (match (((v_renderReplListTail (mc0 - 1)) mc1) dtb__193) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (String.concat "" ["["; (((v_renderReplArg (mc0 - 1)) mc1) dtb__191); dtb__195])
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_renderReplGeneric (mc0 - 1)) mc1) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb__191, (B_dData_dList.C_List__x58__x58_ (dtb__193, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_renderReplGeneric (mc0 - 1)) mc1) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192)))
)
  | _ -> ((((v_renderReplGeneric (mc0 - 1)) mc1) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192)))
)) dtb__192))
  | B_dData_dList.C_List_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
# 688 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplListTail = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match t with
  | Core_dTerm.C_Term_TCon (dtb__196, dtb__197) -> (if (dtb__196 = v_replListNilName) then (B_dData_dMaybe.C_Maybe_Just ("]")) else (if (dtb__196 = v_replListConsName) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (match dtb__199 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> (match dtb__201 with
  | B_dData_dList.C_List_Nil -> (match (((v_renderReplListTail (fuel - 1)) ctors) dtb__200) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__202) -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [", "; (((v_renderReplArg (fuel - 1)) ctors) dtb__198); dtb__202])))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) (((v_keptCtorArgs ctors) dtb__196) dtb__197)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 708 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplPair = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (match dtb__204 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__206 with
  | B_dData_dList.C_List_Nil -> (String.concat "" ["("; (((v_renderReplArg (fuel - 1)) ctors) dtb__203); ", "; (((v_renderReplArg (fuel - 1)) ctors) dtb__205); ")"])
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Pair") args)
)) args)))
# 717 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplUnary = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (label : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__207, dtb__208) -> (match dtb__208 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [label; " "; (((v_renderReplArg (fuel - 1)) ctors) dtb__207)])
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) label) args)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) label) args)
)) args)))
# 726 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplGeneric = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (label : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else (label ^ (((v_renderReplArgs (fuel - 1)) ctors) args))))
# 730 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (if (mc0 <= 0) then "" else (String.concat "" [" "; (((v_renderReplArg (mc0 - 1)) mc1) dtb__209); (((v_renderReplArgs (mc0 - 1)) mc1) dtb__210)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 738 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplArg = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then "<\229\128\188>" else (if ((v_isReplAtom ctors) t) then (((v_renderReplTerm (fuel - 1)) ctors) t) else (String.concat "" ["("; (((v_renderReplTerm (fuel - 1)) ctors) t); ")"]))))

# 584 "Vuna/Compiler/Elab/Driver.vuna"
let v_showValueRepl = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (((v_renderReplTerm 512) (v_allReplCtors datas)) (((Elab_dMeta.v_zonkTerm ec) 0) ((Core_dEval.v_quote 0) v))))

# 866 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasHasFieldDecls = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (match dtb__211 with
  | Frontend_dRast.C_Decl_DTrait (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> (if (dtb__213 = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasHasFieldDecls dtb__212))
  | _ -> (v_hasHasFieldDecls dtb__212)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 874 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_shortRecordMetas = (fun (mc0 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (if ((Elab_dMeta.v_baseNameOf (dtb__218).Elab_dRecords.f_RecordMeta_recordMetaName) = (dtb__218).Elab_dRecords.f_RecordMeta_recordMetaName) then (B_dData_dList.C_List__x58__x58_ (dtb__218, (v_shortRecordMetas dtb__219))) else (v_shortRecordMetas dtb__219))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Elab/Driver.vuna"
let v_hasFieldInstancesOfDecls = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Elab_dRecords.v_recordHasFieldInstances (v_shortRecordMetas (Elab_dRecords.v_recordsOfDecls decls))))

# 887 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasExplicitHasFieldInstance = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> (match dtb__220 with
  | Frontend_dRast.C_Decl_DInstance (dtb__222, dtb__223, dtb__224, dtb__225) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Frontend_dRast.C_Expr_EVar (dtb__226, dtb__227) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__226) = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasExplicitHasFieldInstance dtb__221))
  | Frontend_dRast.C_Expr_EApp (dtb__228, dtb__229, dtb__230) -> (match dtb__228 with
  | Frontend_dRast.C_Expr_EVar (dtb__231, dtb__232) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__231) = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasExplicitHasFieldInstance dtb__221))
  | _ -> (v_hasExplicitHasFieldInstance dtb__221)
)
  | _ -> (v_hasExplicitHasFieldInstance dtb__221)
)) dtb__223)
  | _ -> (v_hasExplicitHasFieldInstance dtb__221)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Elab/Driver.vuna"
let v_maybeAddHasFieldInstances = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (if (v_hasExplicitHasFieldInstance decls) then decls else (match ((Elab_dMeta.v_globalLookup Base_dIntrinsics.v_hasFieldGetFieldName) globals) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__233) -> ((B_dData_dList.v_append decls) (v_hasFieldInstancesOfDecls decls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (v_hasHasFieldDecls decls) then ((B_dData_dList.v_append decls) (v_hasFieldInstancesOfDecls decls)) else decls)
  | _ -> failwith "DT: impossible branch"
)))

# 1087 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findDefByName = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (if ((Elab_dTypes.v_dtDefName dtb__234) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__234)) else ((v_findDefByName mc0) dtb__235))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1094 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainActionOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__236, dtb__237, dtb__238) -> (match dtb__236 with
  | Core_dTerm.C_Term_TApp (dtb__239, dtb__240, dtb__241) -> (match dtb__239 with
  | Core_dTerm.C_Term_TGlobal (dtb__242) -> (if (dtb__242 = Base_dIntrinsics.v_effTypeName) then { B_dData_dPair.f_Pair_first = "eff"; B_dData_dPair.f_Pair_second = dtb__237 } else { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 })
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 }
)
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 }
)
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 }
))

# 1102 "Vuna/Compiler/Elab/Driver.vuna"
let v_isNilRowTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__243, dtb__244) -> (match dtb__244 with
  | B_dData_dList.C_List_Nil -> (dtb__243 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
)
  | Core_dTerm.C_Term_TGlobal (dtb__245) -> (dtb__245 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 1109 "Vuna/Compiler/Elab/Driver.vuna"
let v_isBuiltinHostLabel = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__246) -> (match dtb__246 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__247, dtb__248) -> (Base_dIntrinsics.v_isBuiltinEffectTag dtb__247)
  | _ -> false
)
  | _ -> false
))

# 1114 "Vuna/Compiler/Elab/Driver.vuna"
let v_builtinHostLabelOf = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__249) -> (match dtb__249 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__250, dtb__251) -> (if (dtb__250 = Base_dIntrinsics.v_effNamedName) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match dtb__253 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> (B_dData_dMaybe.C_Maybe_Just (dtb__254))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) dtb__251) else (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__250, dtb__251)))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1124 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_isBuiltinHostRowValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__256, dtb__257) -> (if (dtb__256 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__256 = Base_dIntrinsics.v_effRowConsCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (match dtb__259 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (match (v_builtinHostLabelOf dtb__258) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__262) -> (if (v_isBuiltinHostLabel dtb__262) then (v_isBuiltinHostRowValue dtb__260) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)) dtb__257) else false))
  | _ -> false
))

# 1140 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainEntryRowCheck = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TApp (dtb__263, dtb__264, dtb__265) -> (match dtb__263 with
  | Core_dTerm.C_Term_TApp (dtb__266, dtb__267, dtb__268) -> (match dtb__266 with
  | Core_dTerm.C_Term_TGlobal (dtb__269) -> (if (dtb__269 = Base_dIntrinsics.v_effTypeName) then ((fun rowV -> ((fun named -> (if ((Elab_dTerm_dImpl.v_isNilRowValue mc0) rowV) then (Base_dDiag.C_Check_OkC (0)) else (match named with
  | B_dData_dList.C_List__x58__x58_ (dtb__270, dtb__271) -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_EntryInstanceNotDefault ((Elab_dTerm_dImpl.v_joinEffectLabels named)))) (Elab_dTerm_dImpl.v_joinEffectLabels named))
  | B_dData_dList.C_List_Nil -> (if (v_isBuiltinHostRowValue rowV) then (Base_dDiag.C_Check_OkC (0)) else (match (((Elab_dTerm_dImpl.v_rowEffectLabels 64) mc0) rowV) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_uBase_uData_uList_uList_ua B_dData_dString.v_Eq_uString)) dtb__272) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((Elab_dTerm_dImpl.v_joinEffectLabels dtb__272)))) (Elab_dTerm_dImpl.v_joinEffectLabels dtb__272)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((Core_dTerm.v_showTerm dtb__267)))) (Core_dTerm.v_showTerm dtb__267))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))) (((Elab_dTerm_dImpl.v_rowNonDefaultHostEntries 64) mc0) rowV))) ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl mc0)) (Elab_dTypes.v_ecSolsP mc0)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__267))) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> (Base_dDiag.C_Check_OkC (0))
)
  | _ -> (Base_dDiag.C_Check_OkC (0))
)
  | _ -> (Base_dDiag.C_Check_OkC (0))
))

# 1166 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainShowBuiltinTy = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__273) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__274, dtb__275) -> (match dtb__275 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_memName dtb__274) (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_intTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_natTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_strTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_boolTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))))))))))
  | _ -> false
)
  | _ -> false
)) dtb__273)
  | _ -> false
))

# 1175 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainHasParams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280) -> true
  | _ -> false
))

# 1181 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainArityErr = (fun (sp : Base_dSource.t_Span) (ty : Core_dTerm.t_Term) -> ((fun st -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MainArity (st))) st)) (Core_dTerm.v_showTerm ty)))

# 1212 "Vuna/Compiler/Elab/Driver.vuna"
let v_matchedBodies = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__281) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = dtb__281 }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) defs))

# 1252 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainShowMissing = (fun (sp : Base_dSource.t_Span) (tyVal : Core_dTerm.t_Value) -> ((fun st -> (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (st))) st)) (Core_dTerm.v_showTerm ((Core_dEval.v_quote 0) tyVal))))

# 1365 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_resolveDictGoalsFixGo = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (n : int) -> ((fun ec2 -> (if (n <= 0) then ec2 else (if ((Elab_dTypes.v_ecPendingCount ec2) < (Elab_dTypes.v_ecPendingCount ec)) then (((v_resolveDictGoalsFixGo globals) ec2) (n - 1)) else ec2))) ((Elab_dDict.v_resolveDictGoals globals) ec)))

# 1359 "Vuna/Compiler/Elab/Driver.vuna"
let v_resolveDictGoalsFix = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (n : int) -> (match (Elab_dTypes.v_ecPendingList ec) with
  | B_dData_dList.C_List_Nil -> ec
  | _ -> (((v_resolveDictGoalsFixGo globals) ec) n)
))

# 1412 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_termHasMeta = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__282, dtb__283, dtb__284) -> (if (if ((v_termHasMeta mc0) dtb__282) then true else ((v_termHasMeta mc0) dtb__283)) then true else ((v_termHasMeta mc0) dtb__284))
  | Core_dTerm.C_Term_TBool (dtb__285) -> false
  | Core_dTerm.C_Term_TFloat (dtb__286) -> false
  | Core_dTerm.C_Term_TStr (dtb__287) -> false
  | Core_dTerm.C_Term_TInt (dtb__288) -> false
  | Core_dTerm.C_Term_TCase (dtb__289, dtb__290) -> (if ((v_termHasMeta mc0) dtb__289) then true else ((v_anyAltHasMeta mc0) dtb__290))
  | Core_dTerm.C_Term_TRecUpd (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> (if ((v_termHasMeta mc0) dtb__291) then true else ((v_termHasMeta mc0) dtb__295))
  | Core_dTerm.C_Term_TProj (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> ((v_termHasMeta mc0) dtb__296)
  | Core_dTerm.C_Term_TRecord (dtb__301, dtb__302) -> ((v_anyArgHasMeta mc0) dtb__302)
  | Core_dTerm.C_Term_TMk (dtb__303, dtb__304) -> ((v_anyArgHasMeta mc0) dtb__304)
  | Core_dTerm.C_Term_TCon (dtb__305, dtb__306) -> ((v_anyArgHasMeta mc0) dtb__306)
  | Core_dTerm.C_Term_TApp (dtb__307, dtb__308, dtb__309) -> (if ((v_termHasMeta mc0) dtb__307) then true else ((v_termHasMeta mc0) dtb__308))
  | Core_dTerm.C_Term_TLam (dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> ((fun tys -> (if tys then true else ((v_termHasMeta mc0) dtb__314))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__315) -> (match dtb__315 with
  | { B_dData_dPair.f_Pair_first = dtb__316; B_dData_dPair.f_Pair_second = dtb__317 } -> (if ((v_termHasMetaMaybe mc0) dtb__316) then true else ((v_termHasMetaMaybe mc0) dtb__317))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__312))
  | Core_dTerm.C_Term_TPi (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322) -> (if ((v_termHasMeta mc0) dtb__321) then true else ((v_termHasMeta mc0) dtb__322))
  | Core_dTerm.C_Term_TType (dtb__323) -> false
  | Core_dTerm.C_Term_TGlobal (dtb__324) -> false
  | Core_dTerm.C_Term_TVar (dtb__325, dtb__326, dtb__327) -> false
  | Core_dTerm.C_Term_TMeta (dtb__328) -> (dtb__328 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 1438 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyArgHasMeta = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__329, dtb__330) -> (match dtb__329 with
  | { B_dData_dPair.f_Pair_first = dtb__331; B_dData_dPair.f_Pair_second = dtb__332 } -> (if ((v_termHasMeta mc0) dtb__331) then true else ((v_anyArgHasMeta mc0) dtb__330))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1442 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyAltHasMeta = (fun (mc0 : int) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__333, dtb__334) -> (if ((v_termHasMeta mc0) (Core_dTerm.v_caseAltBody dtb__333)) then true else ((v_anyAltHasMeta mc0) dtb__334))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1446 "Vuna/Compiler/Elab/Driver.vuna"
and v_termHasMetaMaybe = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__335) -> ((v_termHasMeta mc0) dtb__335)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1407 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findDefWithMeta = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__336, dtb__337) -> (match dtb__336 with
  | { B_dData_dPair.f_Pair_first = dtb__338; B_dData_dPair.f_Pair_second = dtb__339 } -> (if ((v_termHasMeta mc1) dtb__339) then (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [dtb__338; " body="; (Core_dTerm.v_showTerm dtb__339)]))) else ((v_findDefWithMeta dtb__337) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1401 "Vuna/Compiler/Elab/Driver.vuna"
let v_metaOwnerHint = (fun (ec : Elab_dTypes.t_Ec) (m : int) -> (match ((v_findDefWithMeta (Elab_dTypes.v_ecDefs ec)) m) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__340) -> (String.concat "" [" (in `"; dtb__340; "`)"])
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1452 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_termHasAnyMeta = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__341, dtb__342, dtb__343) -> (if (if (v_termHasAnyMeta dtb__341) then true else (v_termHasAnyMeta dtb__342)) then true else (v_termHasAnyMeta dtb__343))
  | Core_dTerm.C_Term_TBool (dtb__344) -> false
  | Core_dTerm.C_Term_TFloat (dtb__345) -> false
  | Core_dTerm.C_Term_TStr (dtb__346) -> false
  | Core_dTerm.C_Term_TInt (dtb__347) -> false
  | Core_dTerm.C_Term_TCase (dtb__348, dtb__349) -> (if (v_termHasAnyMeta dtb__348) then true else (v_anyAltHasAnyMeta dtb__349))
  | Core_dTerm.C_Term_TRecUpd (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> (if (v_termHasAnyMeta dtb__350) then true else (v_termHasAnyMeta dtb__354))
  | Core_dTerm.C_Term_TProj (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> (v_termHasAnyMeta dtb__355)
  | Core_dTerm.C_Term_TRecord (dtb__360, dtb__361) -> (v_anyArgHasAnyMeta dtb__361)
  | Core_dTerm.C_Term_TMk (dtb__362, dtb__363) -> (v_anyArgHasAnyMeta dtb__363)
  | Core_dTerm.C_Term_TCon (dtb__364, dtb__365) -> (v_anyArgHasAnyMeta dtb__365)
  | Core_dTerm.C_Term_TApp (dtb__366, dtb__367, dtb__368) -> (if (v_termHasAnyMeta dtb__366) then true else (v_termHasAnyMeta dtb__367))
  | Core_dTerm.C_Term_TLam (dtb__369, dtb__370, dtb__371, dtb__372, dtb__373) -> ((fun tys -> (if tys then true else (v_termHasAnyMeta dtb__373))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (match dtb__374 with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> (if (v_termHasAnyMetaMaybe dtb__375) then true else (v_termHasAnyMetaMaybe dtb__376))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__371))
  | Core_dTerm.C_Term_TPi (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381) -> (if (v_termHasAnyMeta dtb__380) then true else (v_termHasAnyMeta dtb__381))
  | Core_dTerm.C_Term_TType (dtb__382) -> false
  | Core_dTerm.C_Term_TGlobal (dtb__383) -> false
  | Core_dTerm.C_Term_TVar (dtb__384, dtb__385, dtb__386) -> false
  | Core_dTerm.C_Term_TMeta (dtb__387) -> true
  | _ -> failwith "DT: impossible branch"
))
# 1478 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyArgHasAnyMeta = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__388, dtb__389) -> (match dtb__388 with
  | { B_dData_dPair.f_Pair_first = dtb__390; B_dData_dPair.f_Pair_second = dtb__391 } -> (if (v_termHasAnyMeta dtb__390) then true else (v_anyArgHasAnyMeta dtb__389))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1482 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyAltHasAnyMeta = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__392, dtb__393) -> (if (v_termHasAnyMeta (Core_dTerm.v_caseAltBody dtb__392)) then true else (v_anyAltHasAnyMeta dtb__393))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1486 "Vuna/Compiler/Elab/Driver.vuna"
and v_termHasAnyMetaMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__394) -> (v_termHasAnyMeta dtb__394)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 371 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabOneDef = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) (tyTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (ec : Elab_dTypes.t_Ec) -> ((fun _u -> ((Base_dCommon.v_bind (((Base_dObs.v_obsDefCheck "vuna.def.elab") name) (fun (_u : int) -> (((((Elab_dTrait.v_elabFunDef globals) ec) (((v_clausesOfTbl ec) decls) name)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm)) sp)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((fun _u -> ((Base_dObs.v_obsCheck "vuna.elab.post") (fun (_u : int) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__395; B_dData_dPair.f_Pair_second = dtb__396 } -> ((fun solvedDecl -> ((fun bodyTerm1 -> ((fun ec1b -> ((fun lifted -> ((fun liftedTy -> ((fun liftedBody -> ((fun liftedEc -> ((fun cleanTerm -> ((fun ecGlobals -> ((fun ecWithDef -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtDef (name, liftedTy, cleanTerm, (B_dData_dMaybe.C_Maybe_Just (sp)))); B_dData_dPair.f_Pair_second = ecWithDef }))) ((Elab_dTypes.v_ecAddDef ecGlobals) { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = cleanTerm }))) ((Elab_dTypes.v_ecPutGlobalsTbl liftedEc) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) liftedTy) (Elab_dTypes.v_ecGlobalsTbl liftedEc))))) (if (v_termHasAnyMeta liftedBody) then ((Elab_dDict.v_substDictTerm liftedEc) liftedBody) else liftedBody))) (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf lifted)))) (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf lifted)))) (B_dData_dPair.v_firstOf lifted))) ((((Elab_dTrait.v_liftFreeDictGoals name) ec1b) tyTerm) bodyTerm1))) (B_dData_dPair.v_secondOf solvedDecl))) (B_dData_dPair.v_firstOf solvedDecl))) (((v_solveDeclaredDictGoals dtb__396) tyTerm) dtb__395))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line ("FUN " ^ name)) else 0))))) (if (dtp_debug_on 0) then (dtp_debug_line ("DEF " ^ name)) else 0)))

# 406 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_resumeBodies = (fun (mc0 : bool) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) (mc6 : Base_dDiag.t_Diagnostic) -> (if mc0 then ((((((v_elabBodies mc0) mc1) mc2) mc3) mc4) ((Elab_dTypes.v_ecAddError mc5) mc6)) else (Base_dDiag.C_Check_ErrC (mc6))))
# 413 "Vuna/Compiler/Elab/Driver.vuna"
and v_elabBodies = (fun (mc0 : bool) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__397, dtb__398) -> (match dtb__397 with
  | Frontend_dRast.C_Decl_DFun (dtb__399, dtb__400, dtb__401, dtb__402) -> (match (((Elab_dMeta.v_globalsLookup dtb__399) mc2) mc5) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 dtb__402) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb__399))) dtb__399) with
  | Base_dDiag.C_Check_OkC (dtb__403) -> ((((((v_elabBodies mc0) dtb__398) mc2) mc3) mc4) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__404) -> (((((((v_resumeBodies mc0) dtb__398) mc2) mc3) mc4) mc5) dtb__404)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__405) -> (if ((v_defAlreadyDone dtb__399) mc5) then ((((((v_elabBodies mc0) dtb__398) mc2) mc3) mc4) mc5) else (match ((((((v_elabOneDef (B_dData_dList.C_List__x58__x58_ (dtb__397, dtb__398))) mc2) dtb__399) dtb__405) dtb__402) mc5) with
  | Base_dDiag.C_Check_OkC (dtb__406) -> (match dtb__406 with
  | { B_dData_dPair.f_Pair_first = dtb__407; B_dData_dPair.f_Pair_second = dtb__408 } -> ((((((v_elabBodies mc0) dtb__398) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__399; B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDefType dtb__407) }, mc3))) (B_dData_dList.C_List__x58__x58_ (dtb__407, mc4))) dtb__408)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__409) -> (((((((v_resumeBodies mc0) dtb__398) mc2) mc3) mc4) mc5) dtb__409)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dRast.C_Decl_DAxiom (dtb__410, dtb__411, dtb__412) -> (if ((B_dData_dString.v_startsWith "vuna_seal_") dtb__410) then ((fun target -> ((((((v_elabBodies mc0) dtb__398) mc2) mc3) mc4) ((Elab_dTypes.v_ecRemoveDefTbl target) mc5))) (((dtp_substring 10) ((bi_strLength dtb__410) - 10)) dtb__410)) else (match (((Elab_dMeta.v_globalsLookup dtb__410) mc2) mc5) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 dtb__412) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb__410))) dtb__410) with
  | Base_dDiag.C_Check_OkC (dtb__413) -> ((((((v_elabBodies mc0) dtb__398) mc2) mc3) mc4) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__414) -> (((((((v_resumeBodies mc0) dtb__398) mc2) mc3) mc4) mc5) dtb__414)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__415) -> ((((((v_elabBodies mc0) dtb__398) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtAxiom (dtb__410, dtb__415, (B_dData_dMaybe.C_Maybe_Just (dtb__412)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dRast.C_Decl_DExtern (dtb__416, dtb__417, dtb__418, dtb__419) -> (match (((Elab_dMeta.v_globalsLookup dtb__416) mc2) mc5) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 dtb__419) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb__416))) dtb__416) with
  | Base_dDiag.C_Check_OkC (dtb__420) -> ((((((v_elabBodies mc0) dtb__398) mc2) mc3) mc4) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__421) -> (((((((v_resumeBodies mc0) dtb__398) mc2) mc3) mc4) mc5) dtb__421)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__422) -> (match ((v_checkExternTy dtb__419) dtb__422) with
  | Base_dDiag.C_Check_ErrC (dtb__423) -> (((((((v_resumeBodies mc0) dtb__398) mc2) mc3) mc4) mc5) dtb__423)
  | Base_dDiag.C_Check_OkC (dtb__424) -> ((((((v_elabBodies mc0) dtb__398) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtExtern (dtb__416, dtb__422, dtb__417, (B_dData_dMaybe.C_Maybe_Just (dtb__419)))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_elabBodies mc0) dtb__398) mc2) mc3) mc4) mc5)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

# 1348 "Vuna/Compiler/Elab/Driver.vuna"
let v_rezonkDefs = (fun (ec : Elab_dTypes.t_Ec) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> (if (v_termHasAnyMeta dtb__425) then (Elab_dTypes.C_DtDef_DtDef ((Elab_dTypes.v_dtDefName d), (Elab_dTypes.v_dtDefType d), ((Elab_dDict.v_substDictTerm ec) dtb__425), (Elab_dTypes.v_dtDefSpan d))) else d)
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

# 998 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramCoreWithAux = (fun (recover : bool) (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.collectsigs") (fun (_u : int) -> (Elab_dMeta.v_collectSigs decls)))) (fun (sigs : (string, (Frontend_dRast.t_Expr B_dData_dList.t_List, (Frontend_dRast.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.datas") (fun (_u : int) -> ((((Elab_dData.v_elabDatas ((Elab_dMeta.v_collectDataDecls decls) B_dData_dList.C_List_Nil)) records) startGlobals) startEc)))) (fun (pd : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__426; B_dData_dPair.f_Pair_second = dtb__427 } -> (match dtb__427 with
  | { B_dData_dPair.f_Pair_first = dtb__428; B_dData_dPair.f_Pair_second = dtb__429 } -> ((fun ec0b -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.traits") (fun (_u : int) -> (((Elab_dTrait.v_elabTraits ((Elab_dMeta.v_collectTraitDecls decls) B_dData_dList.C_List_Nil)) dtb__428) ec0b)))) (fun (pt : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass B_dData_dList.t_List, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__430; B_dData_dPair.f_Pair_second = dtb__431 } -> (match dtb__431 with
  | { B_dData_dPair.f_Pair_first = dtb__432; B_dData_dPair.f_Pair_second = dtb__433 } -> (match dtb__433 with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (match dtb__435 with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> ((fun globals1 -> ((fun datas1 -> ((fun classesAll -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.instheads") (fun (_u : int) -> ((((Elab_dTrait.v_checkInstanceHeads ((Elab_dMeta.v_collectInstDecls decls) B_dData_dList.C_List_Nil)) classesAll) globals1) dtb__437)))) (fun (pih : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pih with
  | { B_dData_dPair.f_Pair_first = dtb__438; B_dData_dPair.f_Pair_second = dtb__439 } -> ((fun globals2 -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.sigs") (fun (_u : int) -> (((v_elabSigs sigs) globals2) dtb__439)))) (fun (p : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> ((fun ec2b -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.defined") (fun (_u : int) -> (((v_checkAllDefined sigs) dtb__440) decls)))) (fun (_u : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.bodies") (fun (_u : int) -> ((((((v_elabBodies recover) decls) dtb__440) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) ec2b)))) (fun (q : (Elab_dTypes.t_DtDef B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__442; B_dData_dPair.f_Pair_second = dtb__443 } -> ((fun ec3 -> ((fun defs -> ((fun _u -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.instbodies") (fun (_u : int) -> ((((((Elab_dTrait.v_elabInstanceBodies recover) decls) classesAll) datas1) dtb__440) ec3)))) (fun (pi : (Elab_dTypes.t_DtDef B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pi with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> ((fun ec4 -> ((fun instDefs -> ((fun _u -> (Base_dDiag.C_Check_OkC ({ f_ElabCore_coreDatas = datas1; f_ElabCore_coreEc = ec4; f_ElabCore_coreDefs = defs; f_ElabCore_coreInstDefs = instDefs; f_ElabCore_coreGlobals = dtb__440; f_ElabCore_coreProjSpans = dtb__436 }))) (if (dtp_debug_on 0) then (dtp_debug_line "instbodies-done") else 0))) ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (_u : int) -> ((v_rezonkDefs ec4) dtb__444))))) ((Base_dObs.v_obsPure "vuna.elab.dictfix") (fun (_u : int) -> (((v_resolveDictGoalsFix dtb__440) dtb__445) 8))))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line (if (Elab_dTypes.v_ecInstsAudit dtb__443) then "inst-index=ok" else "inst-index=MISMATCH")) else 0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["bodies-done g="; (bi_strFromInt (B_dData_dList.v_length dtb__440)); " sols="; (bi_strFromInt (B_dData_dList.v_length (Elab_dTypes.v_ecSols dtb__443))); " defs="; (bi_strFromInt (B_dData_dList.v_length (Elab_dTypes.v_ecDefs dtb__443))); " metas="; (bi_strFromInt (Elab_dTypes.v_ecNext dtb__443)); " dgoals="; (bi_strFromInt (Elab_dTypes.v_ecPendingCount dtb__443)); " datas="; (bi_strFromInt (B_dData_dList.v_length (Elab_dTypes.v_ecDatas dtb__443))); " insts="; (bi_strFromInt (B_dData_dList.v_length (Elab_dTypes.v_ecInsts dtb__443))); " classes="; (bi_strFromInt (B_dData_dList.v_length (Elab_dTypes.v_ecClasses dtb__443))); " counters="; (v_showCounters (Elab_dTypes.v_ecCounters dtb__443))])) else 0))) ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (_u : int) -> ((v_rezonkDefs ec3) dtb__442))))) ((Base_dObs.v_obsPure "vuna.elab.dictfix") (fun (_u : int) -> (((v_resolveDictGoalsFix dtb__440) dtb__443) 8))))
  | _ -> failwith "DT: impossible branch"
)))))) (if (dtp_debug_on 0) then (dtp_debug_line "sigs-elab-done") else 0))) ((Elab_dTypes.v_ecPutClausesTbl ((Elab_dTypes.v_ecSetGlobalsComplete ((Elab_dTypes.v_ecPutGlobalsTbl dtb__441) (Elab_dMeta.v_globalsTableOf dtb__440))) true)) (v_clausesTblOf decls)))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "instheads-done") else 0))) ((B_dData_dList.v_append globals1) dtb__438))
  | _ -> failwith "DT: impossible branch"
)))) (if (dtp_debug_on 0) then (dtp_debug_line "traits-done") else 0))) (Elab_dTypes.v_ecClasses dtb__437))) ((B_dData_dList.v_append dtb__426) dtb__430))) ((B_dData_dList.v_append dtb__428) dtb__432))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))) (if (dtp_debug_on 0) then (dtp_debug_line "datas-done") else 0))) ((Elab_dTypes.v_ecPutCtorTbl dtb__429) (Elab_dTypes.v_ctorTblOfDatas (Elab_dTypes.v_ecDatas dtb__429))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))) (if (dtp_debug_on 0) then (dtp_debug_line "collectSigs-done") else 0)))))

# 1228 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShowGo = (fun (ec : Elab_dTypes.t_Ec) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (sp : Base_dSource.t_Span) (tyVal : Core_dTerm.t_Value) -> (match ((Elab_dMeta.v_findClassByShortName "Show") (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mainShowMissing sp) tyVal)
  | B_dData_dMaybe.C_Maybe_Just (dtb__446) -> ((fun mname -> ((fun dictTy -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__447) -> (match dtb__447 with
  | { B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = dtb__449 } -> ((fun tyTerm -> ((fun body -> ((fun def -> (Base_dDiag.C_Check_OkC (((v_rezonkDefs ec) ((B_dData_dList.v_append defs) (B_dData_dList.C_List__x58__x58_ (def, B_dData_dList.C_List_Nil))))))) (Elab_dTypes.C_DtDef_DtDef (Base_dIntrinsics.v_mainShowDefName, (Core_dTerm.C_Term_TPi ("x", false, Core_dTerm.C_Rig_Rig1, tyTerm, (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_strTypeName)))), body, (B_dData_dMaybe.C_Maybe_Just (sp)))))) (Core_dTerm.C_Term_TLam ("x", Core_dTerm.C_Rig_Rig1, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__448, Core_dTerm.C_Rig_RigOmega)), (Core_dTerm.C_Term_TVar ("x", 0, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), Core_dTerm.C_Rig_Rig1)))))) ((Core_dEval.v_quote 0) tyVal))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__450) -> ((v_mainShowMissing sp) tyVal)
  | _ -> failwith "DT: impossible branch"
)) (((((Elab_dDict.v_searchInstanceIn globals) Elab_dTypes.v_emptyCtx) ec) dictTy) sp))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__446)), (B_dData_dList.C_List__x58__x58_ (tyVal, B_dData_dList.C_List_Nil)))))))) ((Elab_dPrelude.v_classMethodProjection (dtb__446).Elab_dTypes.f_DtClass_dtClassMethods) "show"))
  | _ -> failwith "DT: impossible branch"
))

# 1221 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShowInner = (fun (ec : Elab_dTypes.t_Ec) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (bodies : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (inner : Core_dTerm.t_Term) (kind : string) -> ((fun tyVal -> ((fun tyTerm -> (if (v_mainShowBuiltinTy tyVal) then (Base_dDiag.C_Check_OkC (defs)) else (((((v_synthMainShowGo ec) globals) defs) sp) tyVal))) ((Core_dEval.v_quote 0) tyVal))) ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) bodies)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) inner))))

# 1189 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShow = (fun (ec : Elab_dTypes.t_Ec) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((v_findDefByName "main") defs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (defs))
  | B_dData_dMaybe.C_Maybe_Just (dtb__451) -> ((fun sp -> ((fun ty -> ((fun bodies -> ((fun p -> ((fun inner -> ((fun kind -> (if (v_mainHasParams inner) then ((v_mainArityErr sp) inner) else ((Base_dCommon.v_bind ((((v_mainEntryRowCheck ec) globals) sp) ty)) (fun (_u : int) -> (((((((v_synthMainShowInner ec) globals) defs) bodies) sp) inner) kind))))) (B_dData_dPair.v_firstOf p))) (B_dData_dPair.v_secondOf p))) (v_mainActionOf ty))) (v_matchedBodies defs))) (Elab_dTypes.v_dtDefType dtb__451))) (match (Elab_dTypes.v_dtDefSpan dtb__451) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__452) -> dtb__452
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1491 "Vuna/Compiler/Elab/Driver.vuna"
let v_ctxDepthOf = (fun (g : Elab_dTypes.t_DtGoal) -> (B_dData_dList.v_length (g).Elab_dTypes.f_DtGoal_dtGoalCtx))

# 1494 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findGoal = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__453, dtb__454) -> (if ((dtb__453).Elab_dTypes.f_DtGoal_dtGoalMeta = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__453)) else ((v_findGoal mc0) dtb__454))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_unsolvedFromRelevantGo = (fun (remaining : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (relevant : int B_dData_dList.t_List) (goals : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (if (remaining <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun i -> (match ((Core_dTerm.v_metaLookup i) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__455) -> (((((v_unsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((Elab_dMeta.v_memMetaId i) relevant) then true else (B_dData_dMaybe.v_isJust ((v_findGoal i) goals))) then (B_dData_dMaybe.C_Maybe_Just (i)) else (((((v_unsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
)) (stop - remaining))))

# 57 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedFromRelevant = (fun (i : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (relevant : int B_dData_dList.t_List) (goals : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (((((v_unsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

# 50 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedMeta = (fun (ec : Elab_dTypes.t_Ec) -> (((((v_unsolvedFromRelevant 0) (Elab_dTypes.v_ecNext ec)) (Elab_dTypes.v_ecSolTbl ec)) (Elab_dMeta.v_relevantMetas ec)) (Elab_dTypes.v_ecGoals ec)))

# 1515 "Vuna/Compiler/Elab/Driver.vuna"
let v_zonkGoal = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)) (Core_dTerm.v_solsFromList sols)) Core_dTerm.v_defaultFuel) v))

# 1522 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_ctxEntriesAt = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (match dtb__456 with
  | { B_dData_dPair.f_Pair_first = dtb__458; B_dData_dPair.f_Pair_second = dtb__459 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__458; B_dData_dPair.f_Pair_second = ((Core_dEval.v_showValueAt mc2) ((Core_dEval.v_eval (((Elab_dTypes.v_ctxEnvAt (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__458; B_dData_dPair.f_Pair_second = dtb__459 }, dtb__457))) 0) mc2)) (((Core_dTerm.v_shift 0) (mc1 + 1)) dtb__459))) }, (((v_ctxEntriesAt dtb__457) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1519 "Vuna/Compiler/Elab/Driver.vuna"
let v_ctxEntriesOf = (fun (items : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_ctxEntriesAt items) 0) (B_dData_dList.v_length items)))

# 1506 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalInfoOf = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (g : Elab_dTypes.t_DtGoal) -> { f_DtGoalInfo_dtGoalInfoSpan = (g).Elab_dTypes.f_DtGoal_dtGoalSpan; f_DtGoalInfo_dtGoalInfoGoal = ((Core_dEval.v_showValueAt (v_ctxDepthOf g)) ((v_zonkGoal sols) (g).Elab_dTypes.f_DtGoal_dtGoalType)); f_DtGoalInfo_dtGoalInfoCtx = (v_ctxEntriesOf (g).Elab_dTypes.f_DtGoal_dtGoalCtx); f_DtGoalInfo_dtGoalInfoName = (g).Elab_dTypes.f_DtGoal_dtGoalName })

# 1539 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalsOfProgramTolerant = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls decls)) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__460; B_dData_dPair.f_Pair_second = dtb__461 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__461)) (fun (ds2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb__460) ds2)) (fun (core : t_ElabCore) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_ecSols (core).f_ElabCore_coreEc))) (Elab_dTypes.v_ecGoals (core).f_ElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1550 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabGoalsWithPrepared = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (termAux : Frontend_dRast.t_Decl B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dRecords.v_prepareDeclsWith termAux) ((v_maybeAddHasFieldInstances startGlobals) decls))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__462; B_dData_dPair.f_Pair_second = dtb__463 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__463)) (fun (ds2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) startEc) startGlobals) dtb__462) ds2)) (fun (core : t_ElabCore) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_ecSols (core).f_ElabCore_coreEc))) (Elab_dTypes.v_ecGoals (core).f_ElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1583 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addDatasEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__464, dtb__465) -> ((v_addDatasEc ((Elab_dTypes.v_ecAddData mc0) dtb__464)) dtb__465)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1587 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addInstsEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__466, dtb__467) -> ((v_addInstsEc ((Elab_dTypes.v_ecAddInst mc0) dtb__466)) dtb__467)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1591 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addClassesEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__468, dtb__469) -> ((v_addClassesEc ((Elab_dTypes.v_ecAddClass mc0) dtb__468)) dtb__469)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1570 "Vuna/Compiler/Elab/Driver.vuna"
let v_ecOfProgram = (fun (prog : Elab_dTypes.t_DtProgram) -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> ((fun ec7 -> { B_dData_dPair.f_Pair_first = ec7; B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtProgGlobals prog) }) ((Elab_dTypes.v_ecPutGlobalsTbl ec6) (Elab_dMeta.v_globalsTableOf (Elab_dTypes.v_dtProgGlobals prog))))) ((Elab_dTypes.v_ecPutNext ec5) (prog).Elab_dTypes.f_DtProgram_dtProgNext))) ((Elab_dTypes.v_ecPutSols ec4) (Elab_dTypes.v_dtProgSols prog)))) ((Elab_dTypes.v_ecPutCtorTbl ec3) (Elab_dTypes.v_ctorTblOfDatas (Elab_dTypes.v_dtProgDatas prog))))) ((v_addClassesEc ec2) (Elab_dTypes.v_dtProgClasses prog)))) ((v_addInstsEc ec1) (Elab_dTypes.v_dtProgInsts prog)))) ((v_addDatasEc ec0) (Elab_dTypes.v_dtProgDatas prog)))) Elab_dTypes.v_ecEmpty))

# 1609 "Vuna/Compiler/Elab/Driver.vuna"
let v_candidateLe = (fun (mc0 : Base_dDiag.t_Candidate) (mc1 : Base_dDiag.t_Candidate) -> (match mc0 with
  | { Base_dDiag.f_Candidate_candidateText = dtb__470; Base_dDiag.f_Candidate_candidateSpan = dtb__471; Base_dDiag.f_Candidate_candidateReason = dtb__472 } -> (match mc1 with
  | { Base_dDiag.f_Candidate_candidateText = dtb__473; Base_dDiag.f_Candidate_candidateSpan = dtb__474; Base_dDiag.f_Candidate_candidateReason = dtb__475 } -> (dtb__470 <= dtb__473)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1606 "Vuna/Compiler/Elab/Driver.vuna"
let v_sortCandidates = (fun (cs : Base_dDiag.t_Candidate B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_candidateLe) cs))

# 1613 "Vuna/Compiler/Elab/Driver.vuna"
let v_instCandidate = (fun (shown : string) (i : Elab_dTypes.t_DtInst) -> { Base_dDiag.f_Candidate_candidateText = (Elab_dTypes.v_dtInstName i); Base_dDiag.f_Candidate_candidateSpan = (i).Elab_dTypes.f_DtInst_dtInstSpan; Base_dDiag.f_Candidate_candidateReason = (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["instance head "; (Core_dTerm.v_showTerm (i).Elab_dTypes.f_DtInst_dtInstHead); " does not match goal "; shown]))) })

# 1632 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_takeWhileDictChar = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__476, dtb__477) -> (if (if (dtb__476 = 32) then true else (dtb__476 = 41)) then (B_dData_dList.v_reverse mc1) else ((v_takeWhileDictChar dtb__477) (B_dData_dList.C_List__x58__x58_ (dtb__476, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1621 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictFamilyOfShown = (fun (s : string) -> ((fun cs -> ((fun body -> (B_dData_dList.dtp_pack ((v_takeWhileDictChar body) B_dData_dList.C_List_Nil))) (match cs with
  | B_dData_dList.C_List__x58__x58_ (dtb__478, dtb__479) -> (if (dtb__478 = 40) then dtb__479 else cs)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) (B_dData_dList.dtp_unpack s)))

# 1597 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictCandidatesOf = (fun (ec : Elab_dTypes.t_Ec) (shown : string) -> ((fun fam -> ((fun insts -> (v_sortCandidates ((B_dData_dList.v_map (v_instCandidate shown)) insts))) (if (fam = "") then (Elab_dTypes.v_ecInsts ec) else ((Elab_dTypes.v_ecInstsFamily ec) fam)))) (v_dictFamilyOfShown shown)))

# 1638 "Vuna/Compiler/Elab/Driver.vuna"
let v_withMetaCreated = (fun (ec : Elab_dTypes.t_Ec) (m : int) (d : Base_dDiag.t_Diagnostic) -> (match ((Elab_dMetaSpans.v_metaSpanOf ec) m) with
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | B_dData_dMaybe.C_Maybe_Just (dtb__480) -> ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("created", dtb__480))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote ("metavariable created here"))) d))
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprInInfoCore = (fun (prog : Elab_dTypes.t_DtProgram) (expr : Frontend_dRast.t_Expr) -> (match prog with
  | { Elab_dTypes.f_DtProgram_dtProgDatas = dtb__481; Elab_dTypes.f_DtProgram_dtProgDefs = dtb__482; Elab_dTypes.f_DtProgram_dtProgGoals = dtb__483; Elab_dTypes.f_DtProgram_dtProgSols = dtb__484; Elab_dTypes.f_DtProgram_dtProgGlobals = dtb__485; Elab_dTypes.f_DtProgram_dtProgInsts = dtb__486; Elab_dTypes.f_DtProgram_dtProgClasses = dtb__487; Elab_dTypes.f_DtProgram_dtProgNext = dtb__488; Elab_dTypes.f_DtProgram_dtProgDepths = dtb__489; Elab_dTypes.f_DtProgram_dtProgWarnings = dtb__490 } -> ((fun bodies -> ((fun ec0 -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_inferE dtb__485) Elab_dTypes.v_emptyCtx) ec0) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__491; B_dData_dPair.f_Pair_second = dtb__492 } -> (match dtb__492 with
  | { B_dData_dPair.f_Pair_first = dtb__493; B_dData_dPair.f_Pair_second = dtb__494 } -> ((fun ec2 -> ((fun sols2 -> ((fun tyText -> (match (Elab_dDict.v_firstUnsolvedInterpGoal ec2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__495) -> (match (Elab_dDict.v_firstUnsolvedInterpGoalSpan ec2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__496) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__496) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__495))) dtb__495)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__495))) dtb__495)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_unsolvedFrom dtb__488) (Elab_dTypes.v_ecNext ec2)) (Elab_dTypes.v_ecSolTbl ec2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__497) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (((v_withMetaCreated ec2) dtb__497) d))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dRast.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnsolvedMetavarInfer ((bi_strFromInt dtb__497)))) (bi_strFromInt dtb__497)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) bodies)) (Elab_dTypes.v_ecSolsP ec2)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__491)) with
  | Core_dTerm.C_Value_VInt (dtb__498) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (bi_strFromInt dtb__498); B_dData_dPair.f_Pair_second = tyText }))
  | dtb__499 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_showValueRepl dtb__481) ec2) dtb__499); B_dData_dPair.f_Pair_second = tyText }))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Core_dTerm.v_showTypeSig (((Elab_dMeta.v_zonkTerm ec2) 0) ((Core_dEval.v_quote 0) ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) bodies)) (Elab_dTypes.v_ecSolsP ec2)) Core_dTerm.v_defaultFuel) dtb__493)))))) (Elab_dTypes.v_ecSols ec2))) (((v_resolveDictGoalsFix dtb__485) dtb__494) 8))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) { Elab_dTypes.f_Ec_ecNext = dtb__488; Elab_dTypes.f_Ec_ecSols = dtb__484; Elab_dTypes.f_Ec_ecDefsRev = (B_dData_dList.v_reverse bodies); Elab_dTypes.f_Ec_ecDatas = dtb__481; Elab_dTypes.f_Ec_ecDepthOfMeta = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecGoals = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecInsts = (Elab_dTypes.v_instStoreOf dtb__486); Elab_dTypes.f_Ec_ecClasses = dtb__487; Elab_dTypes.f_Ec_ecConstraints = Elab_dTypes.v_csEmpty; Elab_dTypes.f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) bodies); Elab_dTypes.f_Ec_ecGlobalsTbl = (Elab_dMeta.v_globalsTableOf dtb__485); Elab_dTypes.f_Ec_ecSolTbl = (Elab_dTypes.v_solsToTbl dtb__484); Elab_dTypes.f_Ec_ecDepthTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil); Elab_dTypes.f_Ec_ecGlobalsComplete = true; Elab_dTypes.f_Ec_ecClausesTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil); Elab_dTypes.f_Ec_ecCtorTbl = (Elab_dTypes.v_ctorTblOfDatas dtb__481); Elab_dTypes.f_Ec_ecHasLinear = (Elab_dTypes.v_datasHaveLinear dtb__481); Elab_dTypes.f_Ec_ecMetaSpans = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecUseSpans = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecWarnings = dtb__490; Elab_dTypes.f_Ec_ecCounters = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecErrors = B_dData_dList.C_List_Nil })) (v_defBodyPairs dtb__482))
  | _ -> failwith "DT: impossible branch"
))

# 801 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprInInfo = (fun (prog : Elab_dTypes.t_DtProgram) (expr : Frontend_dRast.t_Expr) -> ((v_dtEvalExprInInfoCore prog) expr))

# 795 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprIn = (fun (prog : Elab_dTypes.t_DtProgram) (expr : Frontend_dRast.t_Expr) -> ((Base_dCommon.v_bind ((v_dtEvalExprInInfo prog) expr)) (fun (p : (string, string) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf p))))))

# 1377 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedMessage = (fun (ec : Elab_dTypes.t_Ec) (m : int) -> (match ((v_findGoal m) (Elab_dTypes.v_ecGoals ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__500) -> ((fun spot -> ((fun goalTy -> ((fun detail -> (((v_withMetaCreated ec) (dtb__500).Elab_dTypes.f_DtGoal_dtGoalMeta) ((Base_dDiag.v_withFallbackSpan (dtb__500).Elab_dTypes.f_DtGoal_dtGoalSpan) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("goal", (dtb__500).Elab_dTypes.f_DtGoal_dtGoalSpan))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote (("goal: " ^ goalTy)))) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_UnsolvedHole (detail))) (B_dData_dVec.C_Vec_VCons (detail, B_dData_dVec.C_Vec_Nil)))))))) (String.concat "" [spot; " with goal "; goalTy]))) ((Core_dEval.v_showValueAt (v_ctxDepthOf dtb__500)) (dtb__500).Elab_dTypes.f_DtGoal_dtGoalType))) (if ((dtb__500).Elab_dTypes.f_DtGoal_dtGoalName = "") then "?" else ("?" ^ (dtb__500).Elab_dTypes.f_DtGoal_dtGoalName)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun num -> ((fun hint -> (((v_withMetaCreated ec) m) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldName (num))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote (hint))) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_UnsolvedMetavar (num, hint))) (B_dData_dVec.C_Vec_VCons (num, (B_dData_dVec.C_Vec_VCons (hint, B_dData_dVec.C_Vec_Nil))))))))) ((v_metaOwnerHint ec) m))) (bi_strFromInt m))
  | _ -> failwith "DT: impossible branch"
))

# 1259 "Vuna/Compiler/Elab/Driver.vuna"
let v_finishCore = (fun (termAux : Frontend_dRast.t_Decl B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) (core : t_ElabCore) -> ((fun ec4 -> ((fun datas1 -> ((fun defs -> ((fun instDefs -> ((fun globals -> ((fun projSpans -> (match (Elab_dDict.v_firstUnsolvedMemberGoal ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__501) -> (match (Elab_dDict.v_firstUnsolvedMemberGoalSpan ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__502) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__502) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__501))) dtb__501)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__501))) dtb__501)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dDict.v_firstUnsolvedInterpGoal ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__503) -> (match (Elab_dDict.v_firstUnsolvedInterpGoalSpan ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__504) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__504) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__503))) dtb__503)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__503))) dtb__503)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_unsolvedMeta ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (match (Elab_dDict.v_firstUnsolvedDictGoal ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__506) -> ((fun cands -> ((fun createdOf -> (match (Elab_dDict.v_firstUnsolvedDictGoalSpan ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__507) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (createdOf ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCandidates (cands))) d)))) (((Base_dDiagnostics_dTc.v_tcErr1 dtb__507) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__506))) dtb__506))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (createdOf ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCandidates (cands))) d)))) ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__506))) dtb__506))
  | _ -> failwith "DT: impossible branch"
)) (match (Elab_dDict.v_firstUnsolvedDictGoalMeta ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__508) -> ((v_withMetaCreated ec4) dtb__508)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withMetaCreated ec4) dtb__505)
  | _ -> failwith "DT: impossible branch"
))) ((v_dictCandidatesOf ec4) dtb__506))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((v_unsolvedMessage ec4) dtb__505)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((fun extra -> ((fun allDefs0 -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.main.show") (fun (_u : int) -> (((v_synthMainShow ec4) globals) allDefs0)))) (fun (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((fun defsTblOut -> ((fun globalsOut -> ((fun _u -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.usage") (fun (_u : int) -> ((Elab_dUsage.v_checkProgramUsage ec4) allDefs)))) (fun (ec5 : Elab_dTypes.t_Ec) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.term") (fun (_u : int) -> ((Elab_dTermination.v_checkTerminationDeclsWith (v_declFunNames decls)) ((B_dData_dList.v_append termAux) decls))))) (fun (_u : int) -> ((fun _u -> (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtProgram_dtProgDatas = datas1; Elab_dTypes.f_DtProgram_dtProgDefs = allDefs; Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_ecGoals ec5); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_ecSols ec5); Elab_dTypes.f_DtProgram_dtProgGlobals = globalsOut; Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_ecInsts ec5); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_ecClasses ec5); Elab_dTypes.f_DtProgram_dtProgNext = (Elab_dTypes.v_ecNext ec5); Elab_dTypes.f_DtProgram_dtProgDepths = (B_dContainer_dHashMap.v_toList (Elab_dTypes.v_ecDepthTbl ec5)); Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_ecWarnings ec5) }))) (if (dtp_debug_on 0) then (dtp_debug_line "termination-done") else 0))))))) (if (dtp_debug_on 0) then (dtp_debug_line "extradefs-done") else 0))) ((B_dData_dList.v_map (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) (B_dData_dPair.v_firstOf g)) defsTblOut) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__509) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf g); B_dData_dPair.f_Pair_second = dtb__509 }
  | B_dData_dMaybe.C_Maybe_Nothing -> g
  | _ -> failwith "DT: impossible branch"
))) globals))) ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ((B_dData_dList.v_map (fun (x : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName x); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDefType x) })) allDefs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))))) ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (_u : int) -> ((v_rezonkDefs ec4) ((B_dData_dList.v_append instDefs) ((B_dData_dList.v_append extra) defs))))))) ((Base_dObs.v_obsPure "vuna.elab.extra") (fun (_u : int) -> ((((Elab_dTrait.v_extraDefsOf globals) ec4) projSpans) ((B_dData_dList.v_append instDefs) defs)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (core).f_ElabCore_coreProjSpans)) (core).f_ElabCore_coreGlobals)) (core).f_ElabCore_coreInstDefs)) (core).f_ElabCore_coreDefs)) (core).f_ElabCore_coreDatas)) (core).f_ElabCore_coreEc))

# 926 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramErrors = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((fun decls2 -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls decls2)) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__510; B_dData_dPair.f_Pair_second = dtb__511 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__511)) (fun (ds2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux true) Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb__510) ds2)) (fun (core : t_ElabCore) -> ((fun errs -> (if (Elab_dMeta.v_nonEmpty errs) then (Base_dDiag.C_Check_OkC (errs)) else (match (((v_finishCore B_dData_dList.C_List_Nil) ds2) core) with
  | Base_dDiag.C_Check_ErrC (dtb__512) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__512, B_dData_dList.C_List_Nil))))
  | Base_dDiag.C_Check_OkC (dtb__513) -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))) (B_dData_dList.v_reverse (Elab_dTypes.v_ecErrors (core).f_ElabCore_coreEc)))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_maybeAddHasFieldInstances Elab_dPrelude.v_preludeGlobals) decls)))

# 1341 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGoWithAux = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (termAux : Frontend_dRast.t_Decl B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) startEc) startGlobals) records) decls)) (fun (core : t_ElabCore) -> ((Base_dObs.v_obsCheck "vuna.elab.tail") (fun (_u : int) -> (((v_finishCore termAux) decls) core))))))

# 962 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFullWithAux = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (termAux : Frontend_dRast.t_Decl B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((fun decls2 -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (_u : int) -> ((Elab_dRecords.v_prepareDeclsWith termAux) decls2)))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__514; B_dData_dPair.f_Pair_second = dtb__515 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (_u : int) -> (Elab_dDerive.v_expandDerivings dtb__515)))) (fun (ds2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (_u : int) -> (Elab_dRecords.v_prepareDecls termAux)))) (fun (ap : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match ap with
  | { B_dData_dPair.f_Pair_first = dtb__516; B_dData_dPair.f_Pair_second = dtb__517 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (_u : int) -> (Elab_dDerive.v_expandDerivings dtb__517)))) (fun (ads2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((((v_elabProgramGoWithAux startEc) startGlobals) dtb__514) ads2) ds2)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_maybeAddHasFieldInstances startGlobals) decls)))

# 956 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFullWith = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramFullWithAux startEc) startGlobals) B_dData_dList.C_List_Nil) decls))

# 984 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGoWith = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (((((v_elabProgramGoWithAux startEc) startGlobals) records) B_dData_dList.C_List_Nil) decls))

# 912 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFull = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((fun decls2 -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (_u : int) -> (Elab_dRecords.v_prepareDecls decls2)))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dRast.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__518; B_dData_dPair.f_Pair_second = dtb__519 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (_u : int) -> (Elab_dDerive.v_expandDerivings dtb__519)))) (fun (ds2 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramGoWith Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb__518) ds2)))
  | _ -> failwith "DT: impossible branch"
)))) ((v_maybeAddHasFieldInstances Elab_dPrelude.v_preludeGlobals) decls)))

# 951 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGo = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramGoWith Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) B_dData_dList.C_List_Nil) decls))

# 1530 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalsOfProgram = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_elabProgramFull decls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_dtProgSols prog))) (Elab_dTypes.v_dtProgGoals prog)))))))

# 1560 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgram = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_elabProgramFull decls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtProgDatas prog); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtProgDefs prog) })))))
