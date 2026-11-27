open Vuna_runtime
type t_DeclDictBinder = { f_DeclDictBinder_declDictName : string; f_DeclDictBinder_declDictLevel : int; f_DeclDictBinder_declDictDom : Core_dTerm.t_Value }
and t_DictSubst = { f_DictSubst_dictSubstMeta : int; f_DictSubst_dictSubstName : string; f_DictSubst_dictSubstQ : int }
and t_ElabCore = { f_ElabCore_coreDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_ElabCore_coreEc : Elab_dTypes.t_Ec; f_ElabCore_coreDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_ElabCore_coreInstDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_ElabCore_coreGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ElabCore_coreProjSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_DtGoalInfo = { f_DtGoalInfo_dtGoalInfoSpan : Base_dSource.t_Span; f_DtGoalInfo_dtGoalInfoGoal : string; f_DtGoalInfo_dtGoalInfoCtx : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtGoalInfo_dtGoalInfoName : string }

# 41 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_countNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (let cur = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__0) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> dtb__2
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in ((v_countNames dtb__1) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__0) (cur + 1)) mc1)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Elab/Driver.vuna"
let v_showCounters = (fun (names : string B_dData_dList.t_List) -> ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (fun (p : (string, int) B_dData_dPair.t_Pair) -> (String.concat "" [((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) (B_dData_dPair.v_firstOf (Obj.magic p))); "="; ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_uc9feaa570847b590_ua B_dData_dInt.v_Show_u0077d73cf424e521_uInt)) (B_dData_dPair.v_secondOf (Obj.magic p)))]))) ((B_dData_dSort.v_sortBy (fun (a : (string, int) B_dData_dPair.t_Pair) (b : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf (Obj.magic a))) (B_dData_dPair.v_firstOf (Obj.magic b))))) (B_dContainer_dHashMap.v_toList ((v_countNames names) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))))))

# 109 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_leadingImplicitCtxGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if dtb__4 then (let domVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc0)) dtb__6) in ((v_leadingImplicitCtxGo (((Elab_dTypes.v_ctxBindValue dtb__3) domVal) mc0)) dtb__7)) else mc0)
  | _ -> mc0
))

# 106 "Vuna/Compiler/Elab/Driver.vuna"
let v_leadingImplicitCtx = (fun (ty0 : Core_dTerm.t_Term) -> ((v_leadingImplicitCtxGo Elab_dTypes.v_emptyCtx) ty0))

# 156 "Vuna/Compiler/Elab/Driver.vuna"
let v_isMemberConstraintExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__8, dtb__9, dtb__10) -> (match dtb__8 with
  | Frontend_dAst.C_Expr_EVar (dtb__11, dtb__12) -> (if (dtb__11 = Base_dIntrinsics.v_effMemberFamilyName) then (if ((B_dData_dList.v_length dtb__9) = 3) then true else ((B_dData_dList.v_length dtb__9) = 2)) else false)
  | _ -> false
)
  | _ -> false
))

# 149 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_splitMemberCtx = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (let r = (v_splitMemberCtx dtb__14) in (if (v_isMemberConstraintExpr dtb__13) then { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__13, (B_dData_dPair.v_firstOf r))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } else { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf r); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__13, (B_dData_dPair.v_secondOf r))) }))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Elab/Driver.vuna"
let v_memberSugarExpr = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EApp (dtb__15, dtb__16, dtb__17) -> (match dtb__15 with
  | Frontend_dAst.C_Expr_EVar (dtb__18, dtb__19) -> (match dtb__16 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match dtb__21 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__23 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> (if (dtb__18 = Base_dIntrinsics.v_effMemberFamilyName) then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__18, dtb__19)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effNamedName, dtb__17)), (B_dData_dList.C_List__x58__x58_ (dtb__20, (B_dData_dList.C_List__x58__x58_ (dtb__22, B_dData_dList.C_List_Nil)))), dtb__17)), (B_dData_dList.C_List__x58__x58_ (dtb__24, B_dData_dList.C_List_Nil)))), dtb__17)) else mc1)
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

# 170 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_elabMemberConstraintDoms = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType mc0) mc1) mc2) ((v_memberSugarExpr mc2) dtb__26))) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut9 = p in (match nd_uscrut9 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> (match dtb__29 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> ((Base_dCommon.v_bind (((((v_elabMemberConstraintDoms mc0) mc1) dtb__31) dtb__27) mc4)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__32)); B_dData_dPair.f_Pair_second = dtb__33 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Driver.vuna"
let v_sigMemberName = (fun (k : int) -> ("_member" ^ (string_of_int k)))

# 192 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_prependSigMembers = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (Core_dTerm.C_Term_TPi ((v_sigMemberName mc2), true, Core_dTerm.C_Rig_Rig0, dtb__34, (((v_prependSigMembers mc0) dtb__35) (mc2 + 1))))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_insertSigMembersRev = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> ((((v_insertSigMembersRev (((((Core_dTerm.v_insertImplicitBinder (v_sigMemberName mc2)) mc3) Core_dTerm.C_Rig_Rig0) dtb__36) mc0)) dtb__37) (mc2 - 1)) mc3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Elab/Driver.vuna"
let v_insertSigMembers = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_prependSigMembers mc0) mc1) 0) else ((((v_insertSigMembersRev mc0) mc1) ((B_dData_dList.v_length mc1) - 1)) (mc2 - 1)))
))

# 233 "Vuna/Compiler/Elab/Driver.vuna"
let v_sigDictName = (fun (k : int) -> ("_ctx" ^ (string_of_int k)))

# 223 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_prependSigDicts = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (Core_dTerm.C_Term_TPi ((v_sigDictName mc2), true, Core_dTerm.C_Rig_RigOmega, dtb__38, (((v_prependSigDicts mc0) dtb__39) (mc2 + 1))))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_insertSigDictsRev = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) (mc3 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> ((((v_insertSigDictsRev ((((Core_dTerm.v_insertDictBinder (v_sigDictName mc2)) mc3) dtb__40) mc0)) dtb__41) (mc2 - 1)) mc3)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Elab/Driver.vuna"
let v_insertSigDicts = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (if (mc2 <= 0) then (((v_prependSigDicts mc0) mc1) 0) else ((((v_insertSigDictsRev mc0) mc1) ((B_dData_dList.v_length mc1) - 1)) (mc2 - 1)))
))

# 123 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabSigDictBinders = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : Core_dTerm.t_Term) (mc3 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc4 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = mc1 }))
  | _ -> (let split = (v_splitMemberCtx mc3) in (let memberExprs = (B_dData_dPair.v_firstOf split) in (let otherExprs = (B_dData_dPair.v_secondOf split) in (let leadCtx = (v_leadingImplicitCtx mc2) in ((Base_dCommon.v_bind ((Elab_dTrait.v_constraintPartsOf mc4) otherExprs)) (fun (parts : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((Elab_dTrait.v_elabConstraintDomains (Elab_dTypes.v_ecClasses mc1)) mc0) leadCtx) parts) mc4) mc1)) (fun (q : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((((v_elabMemberConstraintDoms mc0) leadCtx) (B_dData_dPair.v_secondOf q)) memberExprs) mc4)) (fun (m : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let doms = (B_dData_dPair.v_firstOf q) in (let ec1 = (B_dData_dPair.v_secondOf q) in (let memberDoms = (B_dData_dPair.v_firstOf m) in (let ec2 = (B_dData_dPair.v_secondOf m) in (let ty1 = (((v_insertSigDicts mc2) doms) (Elab_dTrait.v_leadingImplicitCount mc2)) in (let ty2 = (((v_insertSigMembers ty1) memberDoms) (Elab_dTrait.v_leadingImplicitCount ty1)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ty2; B_dData_dPair.f_Pair_second = ec2 }))))))))))))))))))
))

# 88 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_elabSigsGo = (fun (mc0 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Elab_dTypes.t_Ec) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__45 } -> (match dtb__45 with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (match dtb__47 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType mc1) Elab_dTypes.v_emptyCtx) mc2) dtb__48)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut20 = p in (match nd_uscrut20 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (match dtb__51 with
  | { B_dData_dPair.f_Pair_first = dtb__52; B_dData_dPair.f_Pair_second = dtb__53 } -> ((Base_dCommon.v_bind (((((v_elabSigDictBinders mc1) dtb__53) dtb__50) dtb__46) dtb__49)) (fun (q : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__54; B_dData_dPair.f_Pair_second = dtb__55 } -> (let sigTy0 = (((Elab_dMeta.v_zonkTerm dtb__55) 0) dtb__54) in ((((v_elabSigsGo dtb__43) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = sigTy0 }, mc1))) ((Elab_dTypes.v_ecPutGlobalsTbl dtb__55) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__44) sigTy0) (Elab_dTypes.v_ecGlobalsTbl dtb__55)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = sigTy0 }, mc3))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append mc1) (B_dData_dList.v_reverse mc3)); B_dData_dPair.f_Pair_second = mc2 }))
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabSigs = (fun (sigs : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> ((((v_elabSigsGo sigs) globals) ((Elab_dTypes.v_ecSetGlobalsComplete ((Elab_dTypes.v_ecPutGlobalsTbl ec) (Elab_dMeta.v_globalsTableOf globals))) true)) B_dData_dList.C_List_Nil))

# 251 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_declaredDictBindersGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Core_dTerm.t_Term) (mc3 : t_DeclDictBinder B_dData_dList.t_List) -> (match mc2 with
  | Core_dTerm.C_Term_TPi (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (if dtb__57 then (let domVal = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__59) in (let acc2 = (if ((Elab_dDict.v_isDictDomain mc0) domVal) then (B_dData_dList.C_List__x58__x58_ ({ f_DeclDictBinder_declDictName = dtb__56; f_DeclDictBinder_declDictLevel = (Elab_dTypes.v_ctxDepth mc1); f_DeclDictBinder_declDictDom = domVal }, mc3)) else mc3) in ((((v_declaredDictBindersGo mc0) (((Elab_dTypes.v_ctxBindValue dtb__56) domVal) mc1)) dtb__60) acc2))) else (B_dData_dList.v_reverse mc3))
  | _ -> (B_dData_dList.v_reverse mc3)
))

# 248 "Vuna/Compiler/Elab/Driver.vuna"
let v_declaredDictBinders = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) -> ((((v_declaredDictBindersGo ec) Elab_dTypes.v_emptyCtx) ty) B_dData_dList.C_List_Nil))

# 309 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictDomMatches = (fun (ec : Elab_dTypes.t_Ec) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) 0) ((Elab_dTypes.v_forceVal ec) a)) ((Elab_dTypes.v_forceVal ec) b)) with
  | Base_dDiag.C_Check_OkC (dtb__61) -> true
  | Base_dDiag.C_Check_ErrC (dtb__62) -> false
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_firstMatchDictBinder = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : t_DeclDictBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Value) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if (((v_dictDomMatches mc0) (dtb__63).f_DeclDictBinder_declDictDom) mc2) then (B_dData_dMaybe.C_Maybe_Just (dtb__63)) else (((v_firstMatchDictBinder mc0) dtb__64) mc2))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_solveDeclaredDictGoalsGo = (fun (ec : Elab_dTypes.t_Ec) (binders : t_DeclDictBinder B_dData_dList.t_List) (goals : Elab_dTypes.t_Constraint B_dData_dList.t_List) (kept : Elab_dTypes.t_Constraint B_dData_dList.t_List) (acc : t_DictSubst B_dData_dList.t_List) -> (let nd_uscrut5 = goals in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { Elab_dTypes.f_Constraint_conId = dtb__67; Elab_dTypes.f_Constraint_conKind = dtb__68; Elab_dTypes.f_Constraint_conMeta = dtb__69; Elab_dTypes.f_Constraint_conDom = dtb__70; Elab_dTypes.f_Constraint_conSpan = dtb__71; Elab_dTypes.f_Constraint_conDepth = dtb__72 } -> (match ((Core_dTerm.v_metaLookup dtb__69) (Elab_dTypes.v_ecSolTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (((((v_solveDeclaredDictGoalsGo ec) binders) dtb__66) (B_dData_dList.C_List__x58__x58_ (dtb__65, kept))) acc)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_firstMatchDictBinder ec) binders) dtb__70) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_solveDeclaredDictGoalsGo ec) binders) dtb__66) (B_dData_dList.C_List__x58__x58_ (dtb__65, kept))) acc)
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (let q = ((dtb__74).f_DeclDictBinder_declDictLevel + 1) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) ((dtb__74).f_DeclDictBinder_declDictLevel + 1)) dtb__69) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((dtb__74).f_DeclDictBinder_declDictName, (dtb__74).f_DeclDictBinder_declDictLevel, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb__75) -> (((((v_solveDeclaredDictGoalsGo ((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__75))) binders) dtb__66) kept) (B_dData_dList.C_List__x58__x58_ ({ f_DictSubst_dictSubstMeta = dtb__69; f_DictSubst_dictSubstName = (dtb__74).f_DeclDictBinder_declDictName; f_DictSubst_dictSubstQ = q }, acc)))
  | Base_dDiag.C_Check_ErrC (dtb__76) -> (((((v_solveDeclaredDictGoalsGo ec) binders) dtb__66) (B_dData_dList.C_List__x58__x58_ (dtb__65, kept))) acc)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending ec) (B_dData_dList.v_reverse kept)) }
  | _ -> failwith "DT: impossible branch"
)))

# 315 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_applyDeclaredDictSubsts = (fun (mc0 : t_DictSubst B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> ((v_applyDeclaredDictSubsts dtb__78) ((((Core_dTerm.v_substMetaVar (dtb__77).f_DictSubst_dictSubstMeta) (dtb__77).f_DictSubst_dictSubstName) (dtb__77).f_DictSubst_dictSubstQ) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Driver.vuna"
let v_solveDeclaredDictGoals = (fun (ec : Elab_dTypes.t_Ec) (ty : Core_dTerm.t_Term) (body : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPendingList ec) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec }
  | _ -> (match ((v_declaredDictBinders ec) ty) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = ec }
  | dtb__79 -> (let solved = (((((v_solveDeclaredDictGoalsGo ec) dtb__79) (Elab_dTypes.v_ecPendingList ec)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in { B_dData_dPair.f_Pair_first = ((v_applyDeclaredDictSubsts (B_dData_dPair.v_firstOf solved)) body); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf solved) })
)
))

# 325 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_clausesTblGo = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | Frontend_dAst.C_Decl_DFun (dtb__82, dtb__83, dtb__84, dtb__85) -> (let cur = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__82) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> dtb__86
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in ((v_clausesTblGo dtb__81) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__82) ((B_dData_dList.v_append cur) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__83; B_dData_dPair.f_Pair_second = dtb__84 }, B_dData_dList.C_List_Nil)))) mc1)))
  | _ -> ((v_clausesTblGo dtb__81) mc1)
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Elab/Driver.vuna"
let v_clausesTblOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_clausesTblGo decls) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 338 "Vuna/Compiler/Elab/Driver.vuna"
let v_clausesOfTbl = (fun (ec : Elab_dTypes.t_Ec) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (name : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (ec).Elab_dTypes.f_Ec_ecClausesTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> dtb__87
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dAst.v_clausesFor decls) name)
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Elab/Driver.vuna"
let v_defAlreadyDone = (fun (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) (Elab_dTypes.v_ecDefTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Driver.vuna"
let v_defBodyPair = (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = dtb__89 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Driver.vuna"
let v_defBodyPairs = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_mapMaybe v_defBodyPair) defs))

# 361 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_declFunNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | Frontend_dAst.C_Decl_DFun (dtb__92, dtb__93, dtb__94, dtb__95) -> (B_dData_dList.C_List__x58__x58_ (dtb__92, (v_declFunNames dtb__91)))
  | Frontend_dAst.C_Decl_DInstance (dtb__96, dtb__97, dtb__98, dtb__99) -> ((B_dData_dList.v_append (v_declFunNames dtb__98)) (v_declFunNames dtb__91))
  | _ -> (v_declFunNames dtb__91)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_checkAllDefinedGo = (fun (mc0 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = dtb__103 } -> (match dtb__103 with
  | { B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = dtb__105 } -> (match dtb__105 with
  | { B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = dtb__107 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__102) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__102) mc2) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb__108) (Base_dDiagnostics_dTc.C_TcErr_AxiomWithDefinition (dtb__102))) dtb__102) else ((((v_checkAllDefinedGo dtb__101) mc1) mc2) mc3))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__102) mc2) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__102) mc1) then ((((v_checkAllDefinedGo dtb__101) mc1) mc2) mc3) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb__107) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_SignatureNoDef (dtb__102))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__102, B_dData_dVec.C_Vec_Nil))))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb__107) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_SignatureNoDef (dtb__102))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__102, B_dData_dVec.C_Vec_Nil)))))))
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

# 497 "Vuna/Compiler/Elab/Driver.vuna"
let v_funNamesTbl = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (B_dContainer_dHashMap.v_ofNames (v_declFunNames decls)))

# 505 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_axiomSpanPairs = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match dtb__109 with
  | Frontend_dAst.C_Decl_DAxiom (dtb__111, dtb__112, dtb__113) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__113) }, (v_axiomSpanPairs dtb__110)))
  | Frontend_dAst.C_Decl_DExtern (dtb__114, dtb__115, dtb__116, dtb__117) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__117) }, (v_axiomSpanPairs dtb__110)))
  | _ -> (v_axiomSpanPairs dtb__110)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Elab/Driver.vuna"
let v_axiomSpansTbl = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_axiomSpanPairs decls)))

# 470 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkAllDefined = (fun (sigs : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_checkAllDefinedGo sigs) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) globals))) (v_funNamesTbl decls)) (v_axiomSpansTbl decls)))

# 513 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasFunClause = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__118, dtb__119) -> (match dtb__118 with
  | Frontend_dAst.C_Decl_DFun (dtb__120, dtb__121, dtb__122, dtb__123) -> (if (dtb__120 = mc0) then true else ((v_hasFunClause mc0) dtb__119))
  | _ -> ((v_hasFunClause mc0) dtb__119)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 521 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_axiomSpanOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__124 with
  | Frontend_dAst.C_Decl_DAxiom (dtb__126, dtb__127, dtb__128) -> (if (dtb__126 = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__128))) else ((v_axiomSpanOf mc0) dtb__125))
  | Frontend_dAst.C_Decl_DExtern (dtb__129, dtb__130, dtb__131, dtb__132) -> (if (dtb__129 = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__132))) else ((v_axiomSpanOf mc0) dtb__125))
  | _ -> ((v_axiomSpanOf mc0) dtb__125)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternArrayElem = (fun (mc0 : Base_dSource.t_Span) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__133) -> (match dtb__133 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__134, dtb__135) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__134) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported (("Array " ^ dtb__134)))) dtb__134))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

# 551 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternDomain = (fun (mc0 : Base_dSource.t_Span) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__136) -> (match dtb__136 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__137, dtb__138) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb__137) then (Base_dDiag.C_Check_OkC (0)) else (if (dtb__137 = "Array") then (let nd_uscrut5 = dtb__138 in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (match dtb__140 with
  | B_dData_dList.C_List_Nil -> ((v_checkExternArrayElem mc0) dtb__139)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) else (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported (dtb__137))) dtb__137)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

# 535 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_checkExternValue = (fun (mc0 : Base_dSource.t_Span) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Value) -> (match mc3 with
  | Core_dTerm.C_Value_VPi (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (if (mc1 <= 0) then (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb__142 then (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Base_dCommon.v_bind ((v_checkExternDomain mc0) dtb__144)) (fun (_u : int) -> ((((v_checkExternValue mc0) (mc1 - 1)) (mc2 + 1)) ((Core_dEval.v_applyClosure dtb__145) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__141, mc2, B_dData_dList.C_List_Nil))))))))))
  | _ -> (if (mc1 <= 0) then (((Base_dDiagnostics_dTc.v_tcErr1 mc0) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_checkExternDomain mc0) mc3))
))

# 532 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternTy = (fun (sp : Base_dSource.t_Span) (tyTerm : Core_dTerm.t_Term) -> ((((v_checkExternValue sp) 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm)))

# 588 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_allReplCtors = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> ((B_dData_dList.v_append (Elab_dTypes.v_dtDataCtors dtb__146)) (v_allReplCtors dtb__147))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 617 "Vuna/Compiler/Elab/Driver.vuna"
let v_replShortName = (fun (g : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot g))))

# 627 "Vuna/Compiler/Elab/Driver.vuna"
let v_appendLastTerm = (fun (xs : Core_dTerm.t_Term B_dData_dList.t_List) (x : Core_dTerm.t_Term) -> ((B_dData_dList.v_append xs) (B_dData_dList.C_List__x58__x58_ (x, B_dData_dList.C_List_Nil))))

# 620 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_spineOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__148, dtb__149, dtb__150) -> (match (v_spineOf dtb__148) with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = ((v_appendLastTerm dtb__152) dtb__149) }
  | _ -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp (dtb__148, dtb__149, dtb__150)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
)
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 631 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNatZeroName = "Base.Data.Nat.Nat.Zero"

# 635 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNatSuccName = "Base.Data.Nat.Nat.Succ"

# 771 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_zipKeptArgs = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (match dtb__155 with
  | { B_dData_dPair.f_Pair_first = dtb__157; B_dData_dPair.f_Pair_second = dtb__158 } -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb__153)) then ((v_zipKeptArgs dtb__154) dtb__156) else (B_dData_dList.C_List__x58__x58_ (dtb__157, ((v_zipKeptArgs dtb__154) dtb__156))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf (Obj.magic p)))) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 765 "Vuna/Compiler/Elab/Driver.vuna"
let v_keptCtorArgs = (fun (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_findCtorIn c) ctors) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf (Obj.magic p)))) args)
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> ((v_zipKeptArgs (Elab_dTypes.v_dtCtorTelescope dtb__159)) args)
  | _ -> failwith "DT: impossible branch"
))

# 638 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_replNatValue = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match t with
  | Core_dTerm.C_Term_TCon (dtb__160, dtb__161) -> (if (dtb__160 = v_replNatZeroName) then (B_dData_dMaybe.C_Maybe_Just (0)) else (if (dtb__160 = v_replNatSuccName) then (let nd_uscrut5 = (((v_keptCtorArgs ctors) dtb__160) dtb__161) in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match dtb__163 with
  | B_dData_dList.C_List_Nil -> (match (((v_replNatValue (fuel - 1)) ctors) dtb__162) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__164 + 1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 778 "Vuna/Compiler/Elab/Driver.vuna"
let v_replListNilName = "Base.Data.List.List.Nil"

# 782 "Vuna/Compiler/Elab/Driver.vuna"
let v_replListConsName = "Base.Data.List.List.::"

# 785 "Vuna/Compiler/Elab/Driver.vuna"
let v_replPairName = "Base.Data.Pair.Pair"

# 789 "Vuna/Compiler/Elab/Driver.vuna"
let v_replJustName = "Base.Data.Maybe.Maybe.Just"

# 793 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNothingName = "Base.Data.Maybe.Maybe.Nothing"

# 748 "Vuna/Compiler/Elab/Driver.vuna"
let v_isReplAtom = (fun (mc0 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TCon (dtb__165, dtb__166) -> (if (if (if (dtb__165 = v_replListNilName) then true else (dtb__165 = v_replPairName)) then true else (dtb__165 = v_replNothingName)) then true else ((B_dData_dList.v_length (((v_keptCtorArgs mc0) dtb__165) dtb__166)) = 0))
  | Core_dTerm.C_Term_TMeta (dtb__167) -> true
  | Core_dTerm.C_Term_TType (dtb__168) -> true
  | Core_dTerm.C_Term_TGlobal (dtb__169) -> true
  | Core_dTerm.C_Term_TVar (dtb__170, dtb__171, dtb__172) -> true
  | Core_dTerm.C_Term_TBool (dtb__173) -> true
  | Core_dTerm.C_Term_TFloat (dtb__174) -> true
  | Core_dTerm.C_Term_TStr (dtb__175) -> true
  | Core_dTerm.C_Term_TInt (dtb__176) -> true
  | _ -> false
))

# 592 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_renderReplTerm = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Core_dTerm.v_showTerm t) else (match t with
  | Core_dTerm.C_Term_TCon (dtb__177, dtb__178) -> ((((v_renderReplCtor (fuel - 1)) ctors) dtb__177) dtb__178)
  | Core_dTerm.C_Term_TLam (dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> "<\229\135\189\230\149\176>"
  | Core_dTerm.C_Term_TMeta (dtb__184) -> "_"
  | Core_dTerm.C_Term_TGlobal (dtb__185) -> (v_replShortName dtb__185)
  | Core_dTerm.C_Term_TApp (dtb__186, dtb__187, dtb__188) -> (((v_renderReplApp (fuel - 1)) ctors) (Core_dTerm.C_Term_TApp (dtb__186, dtb__187, dtb__188)))
  | _ -> (Core_dTerm.v_showTerm t)
)))
# 606 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplApp = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then (Core_dTerm.v_showTerm t) else (match (v_spineOf t) with
  | { B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = dtb__190 } -> (match dtb__189 with
  | Core_dTerm.C_Term_TGlobal (dtb__191) -> ((v_replShortName dtb__191) ^ (((v_renderReplArgs (fuel - 1)) ctors) dtb__190))
  | _ -> (Core_dTerm.v_showTerm t)
)
  | _ -> failwith "DT: impossible branch"
)))
# 658 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplCtor = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else (let kept = (((v_keptCtorArgs ctors) c) args) in (if (c = v_replNatZeroName) then "0" else (if (c = v_replNatSuccName) then (let nd_uscrut5 = kept in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__193 with
  | B_dData_dList.C_List_Nil -> (match (((v_replNatValue (fuel - 1)) ctors) dtb__192) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (string_of_int (dtb__194 + 1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Succ") kept)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Succ") kept)
)) else (if (c = v_replListNilName) then "[]" else (if (c = v_replListConsName) then (((v_renderReplList (fuel - 1)) ctors) kept) else (if (c = v_replPairName) then (((v_renderReplPair (fuel - 1)) ctors) kept) else (if (c = v_replJustName) then ((((v_renderReplUnary (fuel - 1)) ctors) "Just") kept) else (if (c = v_replNothingName) then "Nothing" else ((((v_renderReplGeneric (fuel - 1)) ctors) (v_replShortName c)) kept)))))))))))
# 676 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplList = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> (if (mc0 <= 0) then "[]" else (let nd_uscrut6 = dtb__196 in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (match dtb__198 with
  | B_dData_dList.C_List_Nil -> (match (((v_renderReplListTail (mc0 - 1)) mc1) dtb__197) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (String.concat "" ["["; (((v_renderReplArg (mc0 - 1)) mc1) dtb__195); dtb__199])
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_renderReplGeneric (mc0 - 1)) mc1) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb__195, (B_dData_dList.C_List__x58__x58_ (dtb__197, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_renderReplGeneric (mc0 - 1)) mc1) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196)))
)
  | _ -> ((((v_renderReplGeneric (mc0 - 1)) mc1) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196)))
)))
  | B_dData_dList.C_List_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
# 689 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplListTail = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match t with
  | Core_dTerm.C_Term_TCon (dtb__200, dtb__201) -> (if (dtb__200 = v_replListNilName) then (B_dData_dMaybe.C_Maybe_Just ("]")) else (if (dtb__200 = v_replListConsName) then (let nd_uscrut5 = (((v_keptCtorArgs ctors) dtb__200) dtb__201) in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (match dtb__203 with
  | B_dData_dList.C_List__x58__x58_ (dtb__204, dtb__205) -> (match dtb__205 with
  | B_dData_dList.C_List_Nil -> (match (((v_renderReplListTail (fuel - 1)) ctors) dtb__204) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__206) -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [", "; (((v_renderReplArg (fuel - 1)) ctors) dtb__202); dtb__206])))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 709 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplPair = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__207, dtb__208) -> (match dtb__208 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (match dtb__210 with
  | B_dData_dList.C_List_Nil -> (String.concat "" ["("; (((v_renderReplArg (fuel - 1)) ctors) dtb__207); ", "; (((v_renderReplArg (fuel - 1)) ctors) dtb__209); ")"])
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Pair") args)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) "Pair") args)
))))
# 718 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplUnary = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (label : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> (match dtb__212 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [label; " "; (((v_renderReplArg (fuel - 1)) ctors) dtb__211)])
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) label) args)
)
  | _ -> ((((v_renderReplGeneric (fuel - 1)) ctors) label) args)
))))
# 727 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplGeneric = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (label : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then "<\229\128\188>" else (label ^ (((v_renderReplArgs (fuel - 1)) ctors) args))))
# 731 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplArgs = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (if (mc0 <= 0) then "" else (String.concat "" [" "; (((v_renderReplArg (mc0 - 1)) mc1) dtb__213); (((v_renderReplArgs (mc0 - 1)) mc1) dtb__214)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 739 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplArg = (fun (fuel : int) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then "<\229\128\188>" else (if ((v_isReplAtom ctors) t) then (((v_renderReplTerm (fuel - 1)) ctors) t) else (String.concat "" ["("; (((v_renderReplTerm (fuel - 1)) ctors) t); ")"]))))

# 585 "Vuna/Compiler/Elab/Driver.vuna"
let v_showValueRepl = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (((v_renderReplTerm 512) (v_allReplCtors datas)) (((Elab_dMeta.v_zonkTerm ec) 0) ((Core_dEval.v_quote 0) v))))

# 867 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasHasFieldDecls = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (match dtb__215 with
  | Frontend_dAst.C_Decl_DTrait (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221) -> (if (dtb__217 = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasHasFieldDecls dtb__216))
  | _ -> (v_hasHasFieldDecls dtb__216)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 875 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_shortRecordMetas = (fun (mc0 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (if ((Elab_dMeta.v_baseNameOf (dtb__222).Elab_dRecords.f_RecordMeta_recordMetaName) = (dtb__222).Elab_dRecords.f_RecordMeta_recordMetaName) then (B_dData_dList.C_List__x58__x58_ (dtb__222, (v_shortRecordMetas dtb__223))) else (v_shortRecordMetas dtb__223))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 884 "Vuna/Compiler/Elab/Driver.vuna"
let v_hasFieldInstancesOfDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Elab_dRecords.v_recordHasFieldInstances (v_shortRecordMetas (Elab_dRecords.v_recordsOfDecls decls))))

# 888 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasExplicitHasFieldInstance = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | Frontend_dAst.C_Decl_DInstance (dtb__226, dtb__227, dtb__228, dtb__229) -> (let nd_uscrut8 = dtb__227 in (match nd_uscrut8 with
  | Frontend_dAst.C_Expr_EVar (dtb__230, dtb__231) -> (if (dtb__230 = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasExplicitHasFieldInstance dtb__225))
  | Frontend_dAst.C_Expr_EApp (dtb__232, dtb__233, dtb__234) -> (match dtb__232 with
  | Frontend_dAst.C_Expr_EVar (dtb__235, dtb__236) -> (if (dtb__235 = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasExplicitHasFieldInstance dtb__225))
  | _ -> (v_hasExplicitHasFieldInstance dtb__225)
)
  | _ -> (v_hasExplicitHasFieldInstance dtb__225)
))
  | _ -> (v_hasExplicitHasFieldInstance dtb__225)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Elab/Driver.vuna"
let v_maybeAddHasFieldInstances = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (v_hasExplicitHasFieldInstance decls) then decls else (match ((Elab_dMeta.v_globalLookup Base_dIntrinsics.v_hasFieldGetFieldName) globals) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__237) -> ((B_dData_dList.v_append decls) (v_hasFieldInstancesOfDecls decls))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (v_hasHasFieldDecls decls) then ((B_dData_dList.v_append decls) (v_hasFieldInstancesOfDecls decls)) else decls)
  | _ -> failwith "DT: impossible branch"
)))

# 1087 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findDefByName = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (if ((Elab_dTypes.v_dtDefName dtb__238) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__238)) else ((v_findDefByName mc0) dtb__239))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1094 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainActionOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TApp (dtb__240, dtb__241, dtb__242) -> (match dtb__240 with
  | Core_dTerm.C_Term_TApp (dtb__243, dtb__244, dtb__245) -> (match dtb__243 with
  | Core_dTerm.C_Term_TGlobal (dtb__246) -> (if (dtb__246 = Base_dIntrinsics.v_effTypeName) then { B_dData_dPair.f_Pair_first = "eff"; B_dData_dPair.f_Pair_second = dtb__241 } else { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 })
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 }
)
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 }
)
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = mc0 }
))

# 1102 "Vuna/Compiler/Elab/Driver.vuna"
let v_isNilRowTerm = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TCon (dtb__247, dtb__248) -> (match dtb__248 with
  | B_dData_dList.C_List_Nil -> (dtb__247 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
)
  | Core_dTerm.C_Term_TGlobal (dtb__249) -> (dtb__249 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 1109 "Vuna/Compiler/Elab/Driver.vuna"
let v_isBuiltinHostLabel = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__250) -> (match dtb__250 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__251, dtb__252) -> (Base_dIntrinsics.v_isBuiltinEffectTag dtb__251)
  | _ -> false
)
  | _ -> false
))

# 1114 "Vuna/Compiler/Elab/Driver.vuna"
let v_builtinHostLabelOf = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__253) -> (match dtb__253 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__254, dtb__255) -> (if (dtb__254 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut4 = dtb__255 in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (match dtb__257 with
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (B_dData_dMaybe.C_Maybe_Just (dtb__258))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__254, dtb__255)))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1124 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_isBuiltinHostRowValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VCon (dtb__260, dtb__261) -> (if (dtb__260 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb__260 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut3 = dtb__261 in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match dtb__263 with
  | B_dData_dList.C_List__x58__x58_ (dtb__264, dtb__265) -> (match (v_builtinHostLabelOf dtb__262) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__266) -> (if (v_isBuiltinHostLabel dtb__266) then (v_isBuiltinHostRowValue dtb__264) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)) else false))
  | _ -> false
))

# 1140 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainEntryRowCheck = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) (mc3 : Core_dTerm.t_Term) -> (match mc3 with
  | Core_dTerm.C_Term_TApp (dtb__267, dtb__268, dtb__269) -> (match dtb__267 with
  | Core_dTerm.C_Term_TApp (dtb__270, dtb__271, dtb__272) -> (match dtb__270 with
  | Core_dTerm.C_Term_TGlobal (dtb__273) -> (if (dtb__273 = Base_dIntrinsics.v_effTypeName) then (let rowV = ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl mc0)) (Elab_dTypes.v_ecSolsP mc0)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__271)) in (let named = (((Elab_dTerm_dImpl.v_rowNonDefaultHostEntries 64) mc0) rowV) in (if ((Elab_dTerm_dImpl.v_isNilRowValue mc0) rowV) then (Base_dDiag.C_Check_OkC (0)) else (match named with
  | B_dData_dList.C_List__x58__x58_ (dtb__274, dtb__275) -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_EntryInstanceNotDefault ((Elab_dTerm_dImpl.v_joinEffectLabels named)))) (Elab_dTerm_dImpl.v_joinEffectLabels named))
  | B_dData_dList.C_List_Nil -> (if (v_isBuiltinHostRowValue rowV) then (Base_dDiag.C_Check_OkC (0)) else (match (((Elab_dTerm_dImpl.v_rowEffectLabels 64) mc0) rowV) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb__276) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((Elab_dTerm_dImpl.v_joinEffectLabels dtb__276)))) (Elab_dTerm_dImpl.v_joinEffectLabels dtb__276)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((Core_dTerm.v_showTerm dtb__271)))) (Core_dTerm.v_showTerm dtb__271))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> (Base_dDiag.C_Check_OkC (0))
)
  | _ -> (Base_dDiag.C_Check_OkC (0))
)
  | _ -> (Base_dDiag.C_Check_OkC (0))
))

# 1166 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainShowBuiltinTy = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__277) -> (let nd_uscrut2 = dtb__277 in (match nd_uscrut2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__278, dtb__279) -> (match dtb__279 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_memName dtb__278) (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_intTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_natTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_strTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_boolTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))))))))))
  | _ -> false
)
  | _ -> false
))
  | _ -> false
))

# 1175 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainHasParams = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> true
  | _ -> false
))

# 1181 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainArityErr = (fun (sp : Base_dSource.t_Span) (ty : Core_dTerm.t_Term) -> (let st = (Core_dTerm.v_showTerm ty) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_MainArity (st))) st)))

# 1212 "Vuna/Compiler/Elab/Driver.vuna"
let v_matchedBodies = (fun (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName d); B_dData_dPair.f_Pair_second = dtb__285 }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) defs))

# 1252 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainShowMissing = (fun (sp : Base_dSource.t_Span) (tyVal : Core_dTerm.t_Value) -> (let st = (Core_dTerm.v_showTerm ((Core_dEval.v_quote 0) tyVal)) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (st))) st)))

# 1367 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_resolveDictGoalsFixGo = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (n : int) -> (let ec2 = ((Elab_dDict.v_resolveDictGoals globals) ec) in (if (n <= 0) then ec2 else (if ((Elab_dTypes.v_ecPendingCount ec2) < (Elab_dTypes.v_ecPendingCount ec)) then (((v_resolveDictGoalsFixGo globals) ec2) (n - 1)) else ec2))))

# 1361 "Vuna/Compiler/Elab/Driver.vuna"
let v_resolveDictGoalsFix = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (n : int) -> (match (Elab_dTypes.v_ecPendingList ec) with
  | B_dData_dList.C_List_Nil -> ec
  | _ -> (((v_resolveDictGoalsFixGo globals) ec) n)
))

# 1414 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_termHasMeta = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TIf (dtb__286, dtb__287, dtb__288) -> (if (if ((v_termHasMeta mc0) dtb__286) then true else ((v_termHasMeta mc0) dtb__287)) then true else ((v_termHasMeta mc0) dtb__288))
  | Core_dTerm.C_Term_TBool (dtb__289) -> false
  | Core_dTerm.C_Term_TFloat (dtb__290) -> false
  | Core_dTerm.C_Term_TStr (dtb__291) -> false
  | Core_dTerm.C_Term_TInt (dtb__292) -> false
  | Core_dTerm.C_Term_TCase (dtb__293, dtb__294) -> (if ((v_termHasMeta mc0) dtb__293) then true else ((v_anyAltHasMeta mc0) dtb__294))
  | Core_dTerm.C_Term_TRecUpd (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> (if ((v_termHasMeta mc0) dtb__295) then true else ((v_termHasMeta mc0) dtb__299))
  | Core_dTerm.C_Term_TProj (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> ((v_termHasMeta mc0) dtb__300)
  | Core_dTerm.C_Term_TRecord (dtb__305, dtb__306) -> ((v_anyArgHasMeta mc0) dtb__306)
  | Core_dTerm.C_Term_TMk (dtb__307, dtb__308) -> ((v_anyArgHasMeta mc0) dtb__308)
  | Core_dTerm.C_Term_TCon (dtb__309, dtb__310) -> ((v_anyArgHasMeta mc0) dtb__310)
  | Core_dTerm.C_Term_TApp (dtb__311, dtb__312, dtb__313) -> (if ((v_termHasMeta mc0) dtb__311) then true else ((v_termHasMeta mc0) dtb__312))
  | Core_dTerm.C_Term_TLam (dtb__314, dtb__315, dtb__316, dtb__317, dtb__318) -> (let tys = (let nd_uscrut7 = dtb__316 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__319) -> (match dtb__319 with
  | { B_dData_dPair.f_Pair_first = dtb__320; B_dData_dPair.f_Pair_second = dtb__321 } -> (match dtb__321 with
  | { B_dData_dPair.f_Pair_first = dtb__322; B_dData_dPair.f_Pair_second = dtb__323 } -> (if ((v_termHasMetaMaybe mc0) dtb__322) then true else ((v_termHasMetaMaybe mc0) dtb__323))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_termHasMeta mc0) dtb__318)))
  | Core_dTerm.C_Term_TPi (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328) -> (if ((v_termHasMeta mc0) dtb__327) then true else ((v_termHasMeta mc0) dtb__328))
  | Core_dTerm.C_Term_TType (dtb__329) -> false
  | Core_dTerm.C_Term_TGlobal (dtb__330) -> false
  | Core_dTerm.C_Term_TVar (dtb__331, dtb__332, dtb__333) -> false
  | Core_dTerm.C_Term_TMeta (dtb__334) -> (dtb__334 = mc0)
  | _ -> failwith "DT: impossible branch"
))
# 1440 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyArgHasMeta = (fun (mc0 : int) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__335, dtb__336) -> (match dtb__335 with
  | { B_dData_dPair.f_Pair_first = dtb__337; B_dData_dPair.f_Pair_second = dtb__338 } -> (if ((v_termHasMeta mc0) dtb__337) then true else ((v_anyArgHasMeta mc0) dtb__336))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1444 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyAltHasMeta = (fun (mc0 : int) (mc1 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__339, dtb__340) -> (if ((v_termHasMeta mc0) (Core_dTerm.v_caseAltBody dtb__339)) then true else ((v_anyAltHasMeta mc0) dtb__340))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1448 "Vuna/Compiler/Elab/Driver.vuna"
and v_termHasMetaMaybe = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__341) -> ((v_termHasMeta mc0) dtb__341)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1409 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findDefWithMeta = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__342, dtb__343) -> (match dtb__342 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> (if ((v_termHasMeta mc1) dtb__345) then (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [dtb__344; " body="; (Core_dTerm.v_showTerm dtb__345)]))) else ((v_findDefWithMeta dtb__343) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1403 "Vuna/Compiler/Elab/Driver.vuna"
let v_metaOwnerHint = (fun (ec : Elab_dTypes.t_Ec) (m : int) -> (match ((v_findDefWithMeta (Elab_dTypes.v_ecDefs ec)) m) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (String.concat "" [" (in `"; dtb__346; "`)"])
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1454 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_termHasAnyMeta = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TIf (dtb__347, dtb__348, dtb__349) -> (if (if (v_termHasAnyMeta dtb__347) then true else (v_termHasAnyMeta dtb__348)) then true else (v_termHasAnyMeta dtb__349))
  | Core_dTerm.C_Term_TBool (dtb__350) -> false
  | Core_dTerm.C_Term_TFloat (dtb__351) -> false
  | Core_dTerm.C_Term_TStr (dtb__352) -> false
  | Core_dTerm.C_Term_TInt (dtb__353) -> false
  | Core_dTerm.C_Term_TCase (dtb__354, dtb__355) -> (if (v_termHasAnyMeta dtb__354) then true else (v_anyAltHasAnyMeta dtb__355))
  | Core_dTerm.C_Term_TRecUpd (dtb__356, dtb__357, dtb__358, dtb__359, dtb__360) -> (if (v_termHasAnyMeta dtb__356) then true else (v_termHasAnyMeta dtb__360))
  | Core_dTerm.C_Term_TProj (dtb__361, dtb__362, dtb__363, dtb__364, dtb__365) -> (v_termHasAnyMeta dtb__361)
  | Core_dTerm.C_Term_TRecord (dtb__366, dtb__367) -> (v_anyArgHasAnyMeta dtb__367)
  | Core_dTerm.C_Term_TMk (dtb__368, dtb__369) -> (v_anyArgHasAnyMeta dtb__369)
  | Core_dTerm.C_Term_TCon (dtb__370, dtb__371) -> (v_anyArgHasAnyMeta dtb__371)
  | Core_dTerm.C_Term_TApp (dtb__372, dtb__373, dtb__374) -> (if (v_termHasAnyMeta dtb__372) then true else (v_termHasAnyMeta dtb__373))
  | Core_dTerm.C_Term_TLam (dtb__375, dtb__376, dtb__377, dtb__378, dtb__379) -> (let tys = (let nd_uscrut6 = dtb__377 in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__380) -> (match dtb__380 with
  | { B_dData_dPair.f_Pair_first = dtb__381; B_dData_dPair.f_Pair_second = dtb__382 } -> (match dtb__382 with
  | { B_dData_dPair.f_Pair_first = dtb__383; B_dData_dPair.f_Pair_second = dtb__384 } -> (if (v_termHasAnyMetaMaybe dtb__383) then true else (v_termHasAnyMetaMaybe dtb__384))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (v_termHasAnyMeta dtb__379)))
  | Core_dTerm.C_Term_TPi (dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (if (v_termHasAnyMeta dtb__388) then true else (v_termHasAnyMeta dtb__389))
  | Core_dTerm.C_Term_TType (dtb__390) -> false
  | Core_dTerm.C_Term_TGlobal (dtb__391) -> false
  | Core_dTerm.C_Term_TVar (dtb__392, dtb__393, dtb__394) -> false
  | Core_dTerm.C_Term_TMeta (dtb__395) -> true
  | _ -> failwith "DT: impossible branch"
))
# 1480 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyArgHasAnyMeta = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__396, dtb__397) -> (match dtb__396 with
  | { B_dData_dPair.f_Pair_first = dtb__398; B_dData_dPair.f_Pair_second = dtb__399 } -> (if (v_termHasAnyMeta dtb__398) then true else (v_anyArgHasAnyMeta dtb__397))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1484 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyAltHasAnyMeta = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__400, dtb__401) -> (if (v_termHasAnyMeta (Core_dTerm.v_caseAltBody dtb__400)) then true else (v_anyAltHasAnyMeta dtb__401))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1488 "Vuna/Compiler/Elab/Driver.vuna"
and v_termHasAnyMetaMaybe = (fun (mc0 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__402) -> (v_termHasAnyMeta dtb__402)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabOneDef = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (name : string) (tyTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (ec : Elab_dTypes.t_Ec) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Driver") ("DEF " ^ name)) else 0) in (let startCid = (Elab_dTypes.v_ecNextConstraintId ec) in ((Base_dCommon.v_bind (((Base_dObs.v_obsDefCheck "vuna.def.elab") name) (fun (_u : int) -> (((((Elab_dTrait.v_elabFunDef globals) ec) (((v_clausesOfTbl ec) decls) name)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) tyTerm)) sp)))) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Driver") ("FUN " ^ name)) else 0) in ((Base_dObs.v_obsCheck "vuna.elab.post") (fun (_u : int) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__403; B_dData_dPair.f_Pair_second = dtb__404 } -> (let solvedDecl = (((v_solveDeclaredDictGoals dtb__404) tyTerm) dtb__403) in (let bodyTerm1 = (B_dData_dPair.v_firstOf solvedDecl) in (let ec1b = (B_dData_dPair.v_secondOf solvedDecl) in (let lifted = (((((Elab_dTrait.v_liftFreeDictGoals name) startCid) ec1b) tyTerm) bodyTerm1) in (let liftedTy = (B_dData_dPair.v_firstOf lifted) in (let liftedBody = (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf lifted)) in (let liftedEc = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf lifted)) in (let cleanTerm = (if (v_termHasAnyMeta liftedBody) then ((Elab_dDict.v_substDictTerm liftedEc) liftedBody) else liftedBody) in (let ecGlobals = ((Elab_dTypes.v_ecPutGlobalsTbl liftedEc) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) liftedTy) (Elab_dTypes.v_ecGlobalsTbl liftedEc))) in (let ecWithDef = ((Elab_dTypes.v_ecAddDef ecGlobals) { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = cleanTerm }) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtDef (name, liftedTy, cleanTerm, (B_dData_dMaybe.C_Maybe_Just (sp)))); B_dData_dPair.f_Pair_second = ecWithDef }))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 407 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_resumeBodies = (fun (mc0 : bool) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) (mc6 : Base_dDiag.t_Diagnostic) -> (if mc0 then ((((((v_elabBodies mc0) mc1) mc2) mc3) mc4) ((Elab_dTypes.v_ecAddError mc5) mc6)) else (Base_dDiag.C_Check_ErrC (mc6))))
# 414 "Vuna/Compiler/Elab/Driver.vuna"
and v_elabBodies = (fun (mc0 : bool) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (mc5 : Elab_dTypes.t_Ec) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__405, dtb__406) -> (match dtb__405 with
  | Frontend_dAst.C_Decl_DFun (dtb__407, dtb__408, dtb__409, dtb__410) -> (match (((Elab_dMeta.v_globalsLookup dtb__407) mc2) mc5) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__410)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb__407))) dtb__407) with
  | Base_dDiag.C_Check_OkC (dtb__411) -> ((((((v_elabBodies mc0) dtb__406) mc2) mc3) mc4) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__412) -> (((((((v_resumeBodies mc0) dtb__406) mc2) mc3) mc4) mc5) dtb__412)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__413) -> (if ((v_defAlreadyDone dtb__407) mc5) then ((((((v_elabBodies mc0) dtb__406) mc2) mc3) mc4) mc5) else (match ((((((v_elabOneDef (B_dData_dList.C_List__x58__x58_ (dtb__405, dtb__406))) mc2) dtb__407) dtb__413) (Frontend_dAst.v_nodeRefSpan dtb__410)) mc5) with
  | Base_dDiag.C_Check_OkC (dtb__414) -> (match dtb__414 with
  | { B_dData_dPair.f_Pair_first = dtb__415; B_dData_dPair.f_Pair_second = dtb__416 } -> ((((((v_elabBodies mc0) dtb__406) mc2) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__407; B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDefType dtb__415) }, mc3))) (B_dData_dList.C_List__x58__x58_ (dtb__415, mc4))) dtb__416)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__417) -> (((((((v_resumeBodies mc0) dtb__406) mc2) mc3) mc4) mc5) dtb__417)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Decl_DAxiom (dtb__418, dtb__419, dtb__420) -> (if ((B_dData_dString.v_startsWith "vuna_seal_") dtb__418) then (let target = (((dtp_substring 10) ((String.length dtb__418) - 10)) dtb__418) in ((((((v_elabBodies mc0) dtb__406) mc2) mc3) mc4) ((Elab_dTypes.v_ecRemoveDefTbl target) mc5))) else (match (((Elab_dMeta.v_globalsLookup dtb__418) mc2) mc5) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__420)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb__418))) dtb__418) with
  | Base_dDiag.C_Check_OkC (dtb__421) -> ((((((v_elabBodies mc0) dtb__406) mc2) mc3) mc4) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__422) -> (((((((v_resumeBodies mc0) dtb__406) mc2) mc3) mc4) mc5) dtb__422)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__423) -> ((((((v_elabBodies mc0) dtb__406) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtAxiom (dtb__418, dtb__423, (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__420))))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Decl_DExtern (dtb__424, dtb__425, dtb__426, dtb__427) -> (match (((Elab_dMeta.v_globalsLookup dtb__424) mc2) mc5) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb__427)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb__424))) dtb__424) with
  | Base_dDiag.C_Check_OkC (dtb__428) -> ((((((v_elabBodies mc0) dtb__406) mc2) mc3) mc4) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__429) -> (((((((v_resumeBodies mc0) dtb__406) mc2) mc3) mc4) mc5) dtb__429)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__430) -> (match ((v_checkExternTy (Frontend_dAst.v_nodeRefSpan dtb__427)) dtb__430) with
  | Base_dDiag.C_Check_ErrC (dtb__431) -> (((((((v_resumeBodies mc0) dtb__406) mc2) mc3) mc4) mc5) dtb__431)
  | Base_dDiag.C_Check_OkC (dtb__432) -> ((((((v_elabBodies mc0) dtb__406) mc2) mc3) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtExtern (dtb__424, dtb__430, dtb__425, (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__427))))), mc4))) mc5)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_elabBodies mc0) dtb__406) mc2) mc3) mc4) mc5)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc4); B_dData_dPair.f_Pair_second = mc5 }))
  | _ -> failwith "DT: impossible branch"
))

# 1350 "Vuna/Compiler/Elab/Driver.vuna"
let v_rezonkDefs = (fun (ec : Elab_dTypes.t_Ec) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (d : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody d) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__433) -> (if (v_termHasAnyMeta dtb__433) then (Elab_dTypes.C_DtDef_DtDef ((Elab_dTypes.v_dtDefName d), (Elab_dTypes.v_dtDefType d), ((Elab_dDict.v_substDictTerm ec) dtb__433), (Elab_dTypes.v_dtDefSpan d))) else d)
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
))) defs))

# 998 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramCoreWithAux = (fun (recover : bool) (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.collectsigs") (fun (_u : int) -> (Elab_dMeta.v_collectSigs decls)))) (fun (sigs : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "collectSigs-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.datas") (fun (_u : int) -> ((((Elab_dData.v_elabDatas ((Elab_dMeta.v_collectDataDecls decls) B_dData_dList.C_List_Nil)) records) startGlobals) startEc)))) (fun (pd : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut7 = pd in (match nd_uscrut7 with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (match dtb__435 with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> (let ec0b = ((Elab_dTypes.v_ecPutCtorTbl dtb__437) (Elab_dTypes.v_ctorTblOfDatas (Elab_dTypes.v_ecDatas dtb__437))) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "datas-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.traits") (fun (_u : int) -> (((Elab_dTrait.v_elabTraits ((Elab_dMeta.v_collectTraitDecls decls) B_dData_dList.C_List_Nil)) dtb__436) ec0b)))) (fun (pt : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass B_dData_dList.t_List, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut18 = pt in (match nd_uscrut18 with
  | { B_dData_dPair.f_Pair_first = dtb__438; B_dData_dPair.f_Pair_second = dtb__439 } -> (match dtb__439 with
  | { B_dData_dPair.f_Pair_first = dtb__440; B_dData_dPair.f_Pair_second = dtb__441 } -> (match dtb__441 with
  | { B_dData_dPair.f_Pair_first = dtb__442; B_dData_dPair.f_Pair_second = dtb__443 } -> (match dtb__443 with
  | { B_dData_dPair.f_Pair_first = dtb__444; B_dData_dPair.f_Pair_second = dtb__445 } -> (let globals1 = ((B_dData_dList.v_append dtb__436) dtb__440) in (let datas1 = ((B_dData_dList.v_append dtb__434) dtb__438) in (let classesAll = (Elab_dTypes.v_ecClasses dtb__445) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "traits-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.instheads") (fun (_u : int) -> ((((Elab_dTrait.v_checkInstanceHeads ((Elab_dMeta.v_collectInstDecls decls) B_dData_dList.C_List_Nil)) classesAll) globals1) dtb__445)))) (fun (pih : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pih with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> (let globals2 = ((B_dData_dList.v_append globals1) dtb__446) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "instheads-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.sigs") (fun (_u : int) -> (((v_elabSigs sigs) globals2) dtb__447)))) (fun (p : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__448; B_dData_dPair.f_Pair_second = dtb__449 } -> (let ec2b = ((Elab_dTypes.v_ecPutClausesTbl ((Elab_dTypes.v_ecSetGlobalsComplete ((Elab_dTypes.v_ecPutGlobalsTbl dtb__449) (Elab_dMeta.v_globalsTableOf dtb__448))) true)) (v_clausesTblOf decls)) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "sigs-elab-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.defined") (fun (_u : int) -> (((v_checkAllDefined sigs) dtb__448) decls)))) (fun (_u : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.bodies") (fun (_u : int) -> ((((((v_elabBodies recover) decls) dtb__448) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) ec2b)))) (fun (q : (Elab_dTypes.t_DtDef B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__450; B_dData_dPair.f_Pair_second = dtb__451 } -> (let ec3 = ((Base_dObs.v_obsPure "vuna.elab.dictfix") (fun (_u : int) -> (((v_resolveDictGoalsFix dtb__448) dtb__451) 8))) in (let defs = ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (_u : int) -> ((v_rezonkDefs ec3) dtb__450))) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") (String.concat "" ["bodies-done g="; (string_of_int (B_dData_dList.v_length dtb__448)); " sols="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecSols dtb__451))); " defs="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecDefs dtb__451))); " metas="; (string_of_int (Elab_dTypes.v_ecNext dtb__451)); " dgoals="; (string_of_int (Elab_dTypes.v_ecPendingCount dtb__451)); " datas="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecDatas dtb__451))); " insts="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecInstList dtb__451))); " classes="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecClasses dtb__451))); " counters="; (v_showCounters (Elab_dTypes.v_ecCounters dtb__451))])) else 0) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Driver") (if (Elab_dTypes.v_ecInstsAudit dtb__451) then "inst-index=ok" else "inst-index=MISMATCH")) else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.instbodies") (fun (_u : int) -> ((((((Elab_dTrait.v_elabInstanceBodies recover) decls) classesAll) datas1) dtb__448) ec3)))) (fun (pi : (Elab_dTypes.t_DtDef B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match pi with
  | { B_dData_dPair.f_Pair_first = dtb__452; B_dData_dPair.f_Pair_second = dtb__453 } -> (let ec4 = ((Base_dObs.v_obsPure "vuna.elab.dictfix") (fun (_u : int) -> (((v_resolveDictGoalsFix dtb__448) dtb__453) 8))) in (let instDefs = ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (_u : int) -> ((v_rezonkDefs ec4) dtb__452))) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "instbodies-done") else 0) in (Base_dDiag.C_Check_OkC ({ f_ElabCore_coreDatas = datas1; f_ElabCore_coreEc = ec4; f_ElabCore_coreDefs = defs; f_ElabCore_coreInstDefs = instDefs; f_ElabCore_coreGlobals = dtb__448; f_ElabCore_coreProjSpans = dtb__444 })))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1228 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShowGo = (fun (ec : Elab_dTypes.t_Ec) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (sp : Base_dSource.t_Span) (tyVal : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_findClass "Base.Trait.Show.Show") (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mainShowMissing sp) tyVal)
  | B_dData_dMaybe.C_Maybe_Just (dtb__454) -> (let mname = ((Elab_dPrelude.v_classMethodProjection (dtb__454).Elab_dTypes.f_DtClass_dtClassMethods) "show") in (let dictTy = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__454)), (B_dData_dList.C_List__x58__x58_ (tyVal, B_dData_dList.C_List_Nil)))))) in (let nd_uscrut9 = (((((Elab_dDict.v_searchInstanceIn globals) Elab_dTypes.v_emptyCtx) ec) dictTy) sp) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__455) -> (match dtb__455 with
  | { B_dData_dPair.f_Pair_first = dtb__456; B_dData_dPair.f_Pair_second = dtb__457 } -> (let tyTerm = ((Core_dEval.v_quote 0) tyVal) in (let body = (Core_dTerm.C_Term_TLam ("x", Core_dTerm.C_Rig_Rig1, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__456, Core_dTerm.C_Rig_RigOmega)), (Core_dTerm.C_Term_TVar ("x", 0, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), Core_dTerm.C_Rig_Rig1)))) in (let def = (Elab_dTypes.C_DtDef_DtDef (Base_dIntrinsics.v_mainShowDefName, (Core_dTerm.C_Term_TPi ("x", false, Core_dTerm.C_Rig_Rig1, tyTerm, (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_strTypeName)))), body, (B_dData_dMaybe.C_Maybe_Just (sp)))) in (Base_dDiag.C_Check_OkC (((v_rezonkDefs ec) ((B_dData_dList.v_append defs) (B_dData_dList.C_List__x58__x58_ (def, B_dData_dList.C_List_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__458) -> ((v_mainShowMissing sp) tyVal)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 1221 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShowInner = (fun (ec : Elab_dTypes.t_Ec) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) (bodies : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (sp : Base_dSource.t_Span) (inner : Core_dTerm.t_Term) (kind : string) -> (let tyVal = ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) bodies)) (Elab_dTypes.v_ecSolsP ec)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) inner)) in (let tyTerm = ((Core_dEval.v_quote 0) tyVal) in (if (v_mainShowBuiltinTy tyVal) then (Base_dDiag.C_Check_OkC (defs)) else (((((v_synthMainShowGo ec) globals) defs) sp) tyVal)))))

# 1189 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShow = (fun (ec : Elab_dTypes.t_Ec) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (defs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((v_findDefByName "main") defs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (defs))
  | B_dData_dMaybe.C_Maybe_Just (dtb__459) -> (let sp = (match (Elab_dTypes.v_dtDefSpan dtb__459) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__460) -> dtb__460
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
) in (let ty = (Elab_dTypes.v_dtDefType dtb__459) in (let bodies = (v_matchedBodies defs) in (let p = (v_mainActionOf ty) in (let inner = (B_dData_dPair.v_secondOf p) in (let kind = (B_dData_dPair.v_firstOf p) in (if (v_mainHasParams inner) then ((v_mainArityErr sp) inner) else ((Base_dCommon.v_bind ((((v_mainEntryRowCheck ec) globals) sp) ty)) (fun (_u : int) -> (((((((v_synthMainShowInner ec) globals) defs) bodies) sp) inner) kind))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1493 "Vuna/Compiler/Elab/Driver.vuna"
let v_ctxDepthOf = (fun (g : Elab_dTypes.t_DtGoal) -> (B_dData_dList.v_length (g).Elab_dTypes.f_DtGoal_dtGoalCtx))

# 1496 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findGoal = (fun (mc0 : int) (mc1 : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__461, dtb__462) -> (if ((dtb__461).Elab_dTypes.f_DtGoal_dtGoalMeta = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__461)) else ((v_findGoal mc0) dtb__462))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_unsolvedFromRelevantGo = (fun (remaining : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (relevant : int B_dData_dList.t_List) (goals : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (if (remaining <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let i = (stop - remaining) in (match ((Core_dTerm.v_metaLookup i) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__463) -> (((((v_unsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((Elab_dMeta.v_memMetaId i) relevant) then true else (B_dData_dMaybe.v_isJust ((v_findGoal i) goals))) then (B_dData_dMaybe.C_Maybe_Just (i)) else (((((v_unsolvedFromRelevantGo (remaining - 1)) stop) sols) relevant) goals))
  | _ -> failwith "DT: impossible branch"
))))

# 58 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedFromRelevant = (fun (i : int) (stop : int) (sols : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (relevant : int B_dData_dList.t_List) (goals : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (((((v_unsolvedFromRelevantGo (stop - i)) stop) sols) relevant) goals))

# 51 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedMeta = (fun (ec : Elab_dTypes.t_Ec) -> (((((v_unsolvedFromRelevant 0) (Elab_dTypes.v_ecNext ec)) (Elab_dTypes.v_ecSolTbl ec)) (Elab_dMeta.v_relevantMetas ec)) (Elab_dTypes.v_ecGoals ec)))

# 1517 "Vuna/Compiler/Elab/Driver.vuna"
let v_zonkGoal = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (v : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) (Core_dTerm.v_solsFromList sols)) Core_dTerm.v_defaultFuel) v))

# 1524 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_ctxEntriesAt = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__464, dtb__465) -> (match dtb__464 with
  | { B_dData_dPair.f_Pair_first = dtb__466; B_dData_dPair.f_Pair_second = dtb__467 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__466; B_dData_dPair.f_Pair_second = ((Core_dEval.v_showValueAt mc2) ((Core_dEval.v_eval (((Elab_dTypes.v_ctxEnvAt (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__466; B_dData_dPair.f_Pair_second = dtb__467 }, dtb__465))) 0) mc2)) (((Core_dTerm.v_shift 0) (mc1 + 1)) dtb__467))) }, (((v_ctxEntriesAt dtb__465) (mc1 + 1)) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1521 "Vuna/Compiler/Elab/Driver.vuna"
let v_ctxEntriesOf = (fun (items : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_ctxEntriesAt items) 0) (B_dData_dList.v_length items)))

# 1508 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalInfoOf = (fun (sols : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (g : Elab_dTypes.t_DtGoal) -> { f_DtGoalInfo_dtGoalInfoSpan = (g).Elab_dTypes.f_DtGoal_dtGoalSpan; f_DtGoalInfo_dtGoalInfoGoal = ((Core_dEval.v_showValueAt (v_ctxDepthOf g)) ((v_zonkGoal sols) (g).Elab_dTypes.f_DtGoal_dtGoalType)); f_DtGoalInfo_dtGoalInfoCtx = (v_ctxEntriesOf (g).Elab_dTypes.f_DtGoal_dtGoalCtx); f_DtGoalInfo_dtGoalInfoName = (g).Elab_dTypes.f_DtGoal_dtGoalName })

# 1539 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalsOfProgramTolerant = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls decls)) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__469)) (fun (ds2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb__468) ds2)) (fun (core : t_ElabCore) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_ecSols (core).f_ElabCore_coreEc))) (Elab_dTypes.v_ecGoals (core).f_ElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1550 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabGoalsWithPrepared = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (termAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dRecords.v_prepareDeclsWith termAux) ((v_maybeAddHasFieldInstances startGlobals) decls))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__471)) (fun (ds2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) startEc) startGlobals) dtb__470) ds2)) (fun (core : t_ElabCore) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_ecSols (core).f_ElabCore_coreEc))) (Elab_dTypes.v_ecGoals (core).f_ElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1583 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addDatasEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__472, dtb__473) -> ((v_addDatasEc ((Elab_dTypes.v_ecAddData mc0) dtb__472)) dtb__473)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1587 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addInstsEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__474, dtb__475) -> ((v_addInstsEc ((Elab_dTypes.v_ecAddInst mc0) dtb__474)) dtb__475)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1591 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addClassesEc = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__476, dtb__477) -> ((v_addClassesEc ((Elab_dTypes.v_ecAddClass mc0) dtb__476)) dtb__477)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1570 "Vuna/Compiler/Elab/Driver.vuna"
let v_ecOfProgram = (fun (prog : Elab_dTypes.t_DtProgram) -> (let ec0 = Elab_dTypes.v_ecEmpty in (let ec1 = ((v_addDatasEc ec0) (Elab_dTypes.v_dtProgDatas prog)) in (let ec2 = ((v_addInstsEc ec1) (Elab_dTypes.v_dtProgInsts prog)) in (let ec3 = ((v_addClassesEc ec2) (Elab_dTypes.v_dtProgClasses prog)) in (let ec4 = ((Elab_dTypes.v_ecPutCtorTbl ec3) (Elab_dTypes.v_ctorTblOfDatas (Elab_dTypes.v_dtProgDatas prog))) in (let ec5 = ((Elab_dTypes.v_ecPutSols ec4) (Elab_dTypes.v_dtProgSols prog)) in (let ec6 = ((Elab_dTypes.v_ecPutNext ec5) (prog).Elab_dTypes.f_DtProgram_dtProgNext) in (let ec7 = ((Elab_dTypes.v_ecPutGlobalsTbl ec6) (Elab_dMeta.v_globalsTableOf (Elab_dTypes.v_dtProgGlobals prog))) in { B_dData_dPair.f_Pair_first = ec7; B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtProgGlobals prog) })))))))))

# 1609 "Vuna/Compiler/Elab/Driver.vuna"
let v_candidateLe = (fun (mc0 : Base_dDiag.t_Candidate) (mc1 : Base_dDiag.t_Candidate) -> (match mc0 with
  | { Base_dDiag.f_Candidate_candidateText = dtb__478; Base_dDiag.f_Candidate_candidateSpan = dtb__479; Base_dDiag.f_Candidate_candidateReason = dtb__480 } -> (match mc1 with
  | { Base_dDiag.f_Candidate_candidateText = dtb__481; Base_dDiag.f_Candidate_candidateSpan = dtb__482; Base_dDiag.f_Candidate_candidateReason = dtb__483 } -> (dtb__478 <= dtb__481)
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
  | B_dData_dList.C_List__x58__x58_ (dtb__484, dtb__485) -> (if (if (dtb__484 = 32) then true else (dtb__484 = 41)) then (B_dData_dList.v_reverse mc1) else ((v_takeWhileDictChar dtb__485) (B_dData_dList.C_List__x58__x58_ (dtb__484, mc1))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 1621 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictFamilyOfShown = (fun (s : string) -> (let cs = (B_dData_dList.dtp_unpack s) in (let body = (match cs with
  | B_dData_dList.C_List__x58__x58_ (dtb__486, dtb__487) -> (if (dtb__486 = 40) then dtb__487 else cs)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dList.dtp_pack ((v_takeWhileDictChar body) B_dData_dList.C_List_Nil)))))

# 1597 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictCandidatesOf = (fun (ec : Elab_dTypes.t_Ec) (shown : string) -> (let fam = (v_dictFamilyOfShown shown) in (let insts = (if (fam = "") then (Elab_dTypes.v_ecInstList ec) else ((Elab_dTypes.v_ecInstsFamily ec) fam)) in (v_sortCandidates ((B_dData_dList.v_map (v_instCandidate shown)) insts)))))

# 1638 "Vuna/Compiler/Elab/Driver.vuna"
let v_withMetaCreated = (fun (ec : Elab_dTypes.t_Ec) (m : int) (d : Base_dDiag.t_Diagnostic) -> (match ((Elab_dMetaSpans.v_metaSpanOf ec) m) with
  | B_dData_dMaybe.C_Maybe_Nothing -> d
  | B_dData_dMaybe.C_Maybe_Just (dtb__488) -> ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("created", dtb__488))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote ("metavariable created here"))) d))
  | _ -> failwith "DT: impossible branch"
))

# 807 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprInInfoCore = (fun (prog : Elab_dTypes.t_DtProgram) (expr : Frontend_dAst.t_Expr) -> (match prog with
  | { Elab_dTypes.f_DtProgram_dtProgDatas = dtb__489; Elab_dTypes.f_DtProgram_dtProgDefs = dtb__490; Elab_dTypes.f_DtProgram_dtProgGoals = dtb__491; Elab_dTypes.f_DtProgram_dtProgSols = dtb__492; Elab_dTypes.f_DtProgram_dtProgGlobals = dtb__493; Elab_dTypes.f_DtProgram_dtProgInsts = dtb__494; Elab_dTypes.f_DtProgram_dtProgClasses = dtb__495; Elab_dTypes.f_DtProgram_dtProgNext = dtb__496; Elab_dTypes.f_DtProgram_dtProgDepths = dtb__497; Elab_dTypes.f_DtProgram_dtProgWarnings = dtb__498 } -> (let bodies = (v_defBodyPairs dtb__490) in (let ec0 = { Elab_dTypes.f_Ec_ecNext = dtb__496; Elab_dTypes.f_Ec_ecSols = dtb__492; Elab_dTypes.f_Ec_ecDefsRev = (B_dData_dList.v_reverse bodies); Elab_dTypes.f_Ec_ecDatas = dtb__489; Elab_dTypes.f_Ec_ecDepthOfMeta = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecGoals = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecInsts = (Elab_dTypes.v_instStoreOf dtb__494); Elab_dTypes.f_Ec_ecClasses = dtb__495; Elab_dTypes.f_Ec_ecConstraints = Elab_dTypes.v_csEmpty; Elab_dTypes.f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) bodies); Elab_dTypes.f_Ec_ecGlobalsTbl = (Elab_dMeta.v_globalsTableOf dtb__493); Elab_dTypes.f_Ec_ecSolTbl = (Elab_dTypes.v_solsToTbl dtb__492); Elab_dTypes.f_Ec_ecDepthTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); Elab_dTypes.f_Ec_ecGlobalsComplete = true; Elab_dTypes.f_Ec_ecClausesTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); Elab_dTypes.f_Ec_ecCtorTbl = (Elab_dTypes.v_ctorTblOfDatas dtb__489); Elab_dTypes.f_Ec_ecHasLinear = (Elab_dTypes.v_datasHaveLinear dtb__489); Elab_dTypes.f_Ec_ecMetaSpans = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecUseSpans = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecWarnings = dtb__498; Elab_dTypes.f_Ec_ecCounters = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecErrors = B_dData_dList.C_List_Nil } in ((Base_dCommon.v_bind ((((Elab_dTerm.v_inferE dtb__493) Elab_dTypes.v_emptyCtx) ec0) expr)) (fun (p : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = p in (match nd_uscrut15 with
  | { B_dData_dPair.f_Pair_first = dtb__499; B_dData_dPair.f_Pair_second = dtb__500 } -> (match dtb__500 with
  | { B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__502 } -> (let ec2 = (((v_resolveDictGoalsFix dtb__493) dtb__502) 8) in (let sols2 = (Elab_dTypes.v_ecSols ec2) in (let tyText = (Core_dTerm.v_showTypeSig (((Elab_dMeta.v_zonkTerm ec2) 0) ((Core_dEval.v_quote 0) ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) bodies)) (Elab_dTypes.v_ecSolsP ec2)) Core_dTerm.v_defaultFuel) dtb__501)))) in (match (Elab_dDict.v_firstUnsolvedInterpGoal ec2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__503) -> (Obj.magic (match (Elab_dDict.v_firstUnsolvedInterpGoalSpan ec2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__504) -> (Obj.magic (((Base_dDiagnostics_dTc.v_tcErr1 dtb__504) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__503))) dtb__503))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__503))) dtb__503))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_unsolvedFrom dtb__496) (Elab_dTypes.v_ecNext ec2)) (Elab_dTypes.v_ecSolTbl ec2)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__505) -> (Obj.magic ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (((v_withMetaCreated ec2) dtb__505) d))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_exprSpan expr)) (Base_dDiagnostics_dTc.C_TcErr_UnsolvedMetavarInfer ((string_of_int dtb__505)))) (string_of_int dtb__505))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) bodies)) (Elab_dTypes.v_ecSolsP ec2)) Core_dEval.v_normalizeFuelBound) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__499)) with
  | Core_dTerm.C_Value_VInt (dtb__506) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (string_of_int dtb__506); B_dData_dPair.f_Pair_second = tyText }))
  | dtb__507 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_showValueRepl dtb__489) ec2) dtb__507); B_dData_dPair.f_Pair_second = tyText }))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))

# 802 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprInInfo = (fun (prog : Elab_dTypes.t_DtProgram) (expr : Frontend_dAst.t_Expr) -> ((v_dtEvalExprInInfoCore prog) expr))

# 796 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprIn = (fun (prog : Elab_dTypes.t_DtProgram) (expr : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_dtEvalExprInInfo prog) expr)) (fun (p : (string, string) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf p))))))

# 1379 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedMessage = (fun (ec : Elab_dTypes.t_Ec) (m : int) -> (match ((v_findGoal m) (Elab_dTypes.v_ecGoals ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__508) -> (let spot = (if ((dtb__508).Elab_dTypes.f_DtGoal_dtGoalName = "") then "?" else ("?" ^ (dtb__508).Elab_dTypes.f_DtGoal_dtGoalName)) in (let goalTy = ((Core_dEval.v_showValueAt (v_ctxDepthOf dtb__508)) (dtb__508).Elab_dTypes.f_DtGoal_dtGoalType) in (let detail = (String.concat "" [spot; " with goal "; goalTy]) in (((v_withMetaCreated ec) (dtb__508).Elab_dTypes.f_DtGoal_dtGoalMeta) ((Base_dDiag.v_withFallbackSpan (dtb__508).Elab_dTypes.f_DtGoal_dtGoalSpan) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("goal", (dtb__508).Elab_dTypes.f_DtGoal_dtGoalSpan))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote (("goal: " ^ goalTy)))) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_UnsolvedHole (detail))) (B_dData_dVec.C_Vec__x58__x58_ (detail, B_dData_dVec.C_Vec_Nil))))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let num = (string_of_int m) in (let hint = ((v_metaOwnerHint ec) m) in (((v_withMetaCreated ec) m) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldName (num))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote (hint))) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_UnsolvedMetavar (num, hint))) (B_dData_dVec.C_Vec__x58__x58_ (num, (B_dData_dVec.C_Vec__x58__x58_ (hint, B_dData_dVec.C_Vec_Nil))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1259 "Vuna/Compiler/Elab/Driver.vuna"
let v_finishCore = (fun (termAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (core : t_ElabCore) -> (let ec4 = (core).f_ElabCore_coreEc in (let datas1 = (core).f_ElabCore_coreDatas in (let defs = (core).f_ElabCore_coreDefs in (let instDefs = (core).f_ElabCore_coreInstDefs in (let globals = (core).f_ElabCore_coreGlobals in (let projSpans = (core).f_ElabCore_coreProjSpans in (match (Elab_dDict.v_firstUnsolvedMemberGoal ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__509) -> (match (Elab_dDict.v_firstUnsolvedMemberGoalSpan ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__510) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__510) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__509))) dtb__509)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__509))) dtb__509)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dDict.v_firstUnsolvedInterpGoal ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> (match (Elab_dDict.v_firstUnsolvedInterpGoalSpan ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__512) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb__512) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__511))) dtb__511)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb__511))) dtb__511)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_unsolvedMeta ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__513) -> (match ((Elab_dDict.v_firstUnsolvedDictGoalExhausted globals) ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__514) -> (Base_dDiag.C_Check_ErrC ((((v_withMetaCreated ec4) dtb__513) dtb__514)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dDict.v_firstUnsolvedDictGoal ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__515) -> (let cands = ((v_dictCandidatesOf ec4) dtb__515) in (let createdOf = (match (Elab_dDict.v_firstUnsolvedDictGoalMeta ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> ((v_withMetaCreated ec4) dtb__517)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withMetaCreated ec4) dtb__513)
  | _ -> failwith "DT: impossible branch"
) in (match (Elab_dDict.v_firstUnsolvedDictGoalSpan ec4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__516) -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (createdOf ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCandidates (cands))) d)))) (((Base_dDiagnostics_dTc.v_tcErr1 dtb__516) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__515))) dtb__515))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiag.v_onErrDiag (fun (d : Base_dDiag.t_Diagnostic) -> (createdOf ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCandidates (cands))) d)))) ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb__515))) dtb__515))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((v_unsolvedMessage ec4) dtb__513)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.extra") (fun (_u : int) -> ((((Elab_dTrait.v_extraDefsOf globals) ec4) projSpans) ((B_dData_dList.v_append instDefs) defs))))) (fun (extra : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let allDefs0 = ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (_u : int) -> ((v_rezonkDefs ec4) ((B_dData_dList.v_append instDefs) ((B_dData_dList.v_append extra) defs))))) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.main.show") (fun (_u : int) -> (((v_synthMainShow ec4) globals) allDefs0)))) (fun (allDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let defsTblOut = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (x : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName x); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDefType x) })) allDefs)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let globalsOut = ((B_dData_dList.v_map (fun (g : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf g)) defsTblOut) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__518) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf g); B_dData_dPair.f_Pair_second = dtb__518 }
  | B_dData_dMaybe.C_Maybe_Nothing -> g
  | _ -> failwith "DT: impossible branch"
))) globals) in (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "extradefs-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.usage") (fun (_u : int) -> ((Elab_dUsage.v_checkProgramUsage ec4) allDefs)))) (fun (ec5 : Elab_dTypes.t_Ec) -> (let termInput = (((Elab_dTermination_dElabInput.v_elabTermInput datas1) (Elab_dTypes.v_ecClasses ec5)) allDefs) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.term") (fun (_u : int) -> ((((Elab_dTermination.v_checkTerminationGroups (B_dData_dPair.v_firstOf termInput)) (B_dData_dPair.v_secondOf termInput)) termAux) decls)))) (fun (_u : int) -> (let _u = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "termination-done") else 0) in (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtProgram_dtProgDatas = datas1; Elab_dTypes.f_DtProgram_dtProgDefs = allDefs; Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_ecGoals ec5); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_ecSols ec5); Elab_dTypes.f_DtProgram_dtProgGlobals = globalsOut; Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_ecInstList ec5); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_ecClasses ec5); Elab_dTypes.f_DtProgram_dtProgNext = (Elab_dTypes.v_ecNext ec5); Elab_dTypes.f_DtProgram_dtProgDepths = (B_dContainer_dHashMap.v_toList (Elab_dTypes.v_ecDepthTbl ec5)); Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_ecWarnings ec5) }))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 926 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramErrors = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let decls2 = ((v_maybeAddHasFieldInstances Elab_dPrelude.v_preludeGlobals) decls) in ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls decls2)) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__519; B_dData_dPair.f_Pair_second = dtb__520 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb__520)) (fun (ds2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux true) Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb__519) ds2)) (fun (core : t_ElabCore) -> (let errs = (B_dData_dList.v_reverse (Elab_dTypes.v_ecErrors (core).f_ElabCore_coreEc)) in (if (Elab_dMeta.v_nonEmpty errs) then (Base_dDiag.C_Check_OkC (errs)) else (match (((v_finishCore B_dData_dList.C_List_Nil) ds2) core) with
  | Base_dDiag.C_Check_ErrC (dtb__521) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__521, B_dData_dList.C_List_Nil))))
  | Base_dDiag.C_Check_OkC (dtb__522) -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1343 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGoWithAux = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (termAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) startEc) startGlobals) records) decls)) (fun (core : t_ElabCore) -> ((Base_dObs.v_obsCheck "vuna.elab.tail") (fun (_u : int) -> (((v_finishCore termAux) decls) core))))))

# 962 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFullWithAux = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (termAux : Frontend_dAst.t_Decl B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let decls2 = ((v_maybeAddHasFieldInstances startGlobals) decls) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (_u : int) -> ((Elab_dRecords.v_prepareDeclsWith termAux) decls2)))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__523; B_dData_dPair.f_Pair_second = dtb__524 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (_u : int) -> (Elab_dDerive.v_expandDerivings dtb__524)))) (fun (ds2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (_u : int) -> (Elab_dRecords.v_prepareDecls termAux)))) (fun (ap : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match ap with
  | { B_dData_dPair.f_Pair_first = dtb__525; B_dData_dPair.f_Pair_second = dtb__526 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (_u : int) -> (Elab_dDerive.v_expandDerivings dtb__526)))) (fun (ads2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((((v_elabProgramGoWithAux startEc) startGlobals) dtb__523) ads2) ds2)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))

# 956 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFullWith = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramFullWithAux startEc) startGlobals) B_dData_dList.C_List_Nil) decls))

# 984 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGoWith = (fun (startEc : Elab_dTypes.t_Ec) (startGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (records : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((((v_elabProgramGoWithAux startEc) startGlobals) records) B_dData_dList.C_List_Nil) decls))

# 912 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFull = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let decls2 = ((v_maybeAddHasFieldInstances Elab_dPrelude.v_preludeGlobals) decls) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (_u : int) -> (Elab_dRecords.v_prepareDecls decls2)))) (fun (p : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (_u : int) -> (Elab_dDerive.v_expandDerivings dtb__528)))) (fun (ds2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramGoWith Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb__527) ds2)))
  | _ -> failwith "DT: impossible branch"
)))))

# 951 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGo = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramGoWith Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) B_dData_dList.C_List_Nil) decls))

# 1530 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalsOfProgram = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_elabProgramFull decls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_dtProgSols prog))) (Elab_dTypes.v_dtProgGoals prog)))))))

# 1560 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgram = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_elabProgramFull decls)) (fun (prog : Elab_dTypes.t_DtProgram) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtProgDatas prog); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtProgDefs prog) })))))

# 242 "Vuna/Compiler/Elab/Driver.vuna"
let v_declDictName = (fun (p : t_DeclDictBinder) -> (match p with
  | { f_DeclDictBinder_declDictName = dtb__529; f_DeclDictBinder_declDictLevel = dtb__530; f_DeclDictBinder_declDictDom = dtb__531 } -> dtb__529
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Driver.vuna"
let v_declDictLevel = (fun (p : t_DeclDictBinder) -> (match p with
  | { f_DeclDictBinder_declDictName = dtb__532; f_DeclDictBinder_declDictLevel = dtb__533; f_DeclDictBinder_declDictDom = dtb__534 } -> dtb__533
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Driver.vuna"
let v_declDictDom = (fun (p : t_DeclDictBinder) -> (match p with
  | { f_DeclDictBinder_declDictName = dtb__535; f_DeclDictBinder_declDictLevel = dtb__536; f_DeclDictBinder_declDictDom = dtb__537 } -> dtb__537
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictSubstMeta = (fun (p : t_DictSubst) -> (match p with
  | { f_DictSubst_dictSubstMeta = dtb__538; f_DictSubst_dictSubstName = dtb__539; f_DictSubst_dictSubstQ = dtb__540 } -> dtb__538
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictSubstName = (fun (p : t_DictSubst) -> (match p with
  | { f_DictSubst_dictSubstMeta = dtb__541; f_DictSubst_dictSubstName = dtb__542; f_DictSubst_dictSubstQ = dtb__543 } -> dtb__542
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictSubstQ = (fun (p : t_DictSubst) -> (match p with
  | { f_DictSubst_dictSubstMeta = dtb__544; f_DictSubst_dictSubstName = dtb__545; f_DictSubst_dictSubstQ = dtb__546 } -> dtb__546
  | _ -> failwith "DT: impossible branch"
))

# 990 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreDatas = (fun (p : t_ElabCore) -> (match p with
  | { f_ElabCore_coreDatas = dtb__547; f_ElabCore_coreEc = dtb__548; f_ElabCore_coreDefs = dtb__549; f_ElabCore_coreInstDefs = dtb__550; f_ElabCore_coreGlobals = dtb__551; f_ElabCore_coreProjSpans = dtb__552 } -> dtb__547
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreEc = (fun (p : t_ElabCore) -> (match p with
  | { f_ElabCore_coreDatas = dtb__553; f_ElabCore_coreEc = dtb__554; f_ElabCore_coreDefs = dtb__555; f_ElabCore_coreInstDefs = dtb__556; f_ElabCore_coreGlobals = dtb__557; f_ElabCore_coreProjSpans = dtb__558 } -> dtb__554
  | _ -> failwith "DT: impossible branch"
))

# 992 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreDefs = (fun (p : t_ElabCore) -> (match p with
  | { f_ElabCore_coreDatas = dtb__559; f_ElabCore_coreEc = dtb__560; f_ElabCore_coreDefs = dtb__561; f_ElabCore_coreInstDefs = dtb__562; f_ElabCore_coreGlobals = dtb__563; f_ElabCore_coreProjSpans = dtb__564 } -> dtb__561
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreInstDefs = (fun (p : t_ElabCore) -> (match p with
  | { f_ElabCore_coreDatas = dtb__565; f_ElabCore_coreEc = dtb__566; f_ElabCore_coreDefs = dtb__567; f_ElabCore_coreInstDefs = dtb__568; f_ElabCore_coreGlobals = dtb__569; f_ElabCore_coreProjSpans = dtb__570 } -> dtb__568
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreGlobals = (fun (p : t_ElabCore) -> (match p with
  | { f_ElabCore_coreDatas = dtb__571; f_ElabCore_coreEc = dtb__572; f_ElabCore_coreDefs = dtb__573; f_ElabCore_coreInstDefs = dtb__574; f_ElabCore_coreGlobals = dtb__575; f_ElabCore_coreProjSpans = dtb__576 } -> dtb__575
  | _ -> failwith "DT: impossible branch"
))

# 995 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreProjSpans = (fun (p : t_ElabCore) -> (match p with
  | { f_ElabCore_coreDatas = dtb__577; f_ElabCore_coreEc = dtb__578; f_ElabCore_coreDefs = dtb__579; f_ElabCore_coreInstDefs = dtb__580; f_ElabCore_coreGlobals = dtb__581; f_ElabCore_coreProjSpans = dtb__582 } -> dtb__582
  | _ -> failwith "DT: impossible branch"
))

# 1502 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoSpan = (fun (p : t_DtGoalInfo) -> (match p with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb__583; f_DtGoalInfo_dtGoalInfoGoal = dtb__584; f_DtGoalInfo_dtGoalInfoCtx = dtb__585; f_DtGoalInfo_dtGoalInfoName = dtb__586 } -> dtb__583
  | _ -> failwith "DT: impossible branch"
))

# 1503 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoGoal = (fun (p : t_DtGoalInfo) -> (match p with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb__587; f_DtGoalInfo_dtGoalInfoGoal = dtb__588; f_DtGoalInfo_dtGoalInfoCtx = dtb__589; f_DtGoalInfo_dtGoalInfoName = dtb__590 } -> dtb__588
  | _ -> failwith "DT: impossible branch"
))

# 1504 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoCtx = (fun (p : t_DtGoalInfo) -> (match p with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb__591; f_DtGoalInfo_dtGoalInfoGoal = dtb__592; f_DtGoalInfo_dtGoalInfoCtx = dtb__593; f_DtGoalInfo_dtGoalInfoName = dtb__594 } -> dtb__593
  | _ -> failwith "DT: impossible branch"
))

# 1505 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoName = (fun (p : t_DtGoalInfo) -> (match p with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb__595; f_DtGoalInfo_dtGoalInfoGoal = dtb__596; f_DtGoalInfo_dtGoalInfoCtx = dtb__597; f_DtGoalInfo_dtGoalInfoName = dtb__598 } -> dtb__598
  | _ -> failwith "DT: impossible branch"
))
