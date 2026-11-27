open Vuna_runtime
type t_DeclDictBinder = { f_DeclDictBinder_declDictName : string; f_DeclDictBinder_declDictLevel : int; f_DeclDictBinder_declDictDom : Core_dTerm.t_Value }
and t_DictSubst = { f_DictSubst_dictSubstMeta : int; f_DictSubst_dictSubstName : string; f_DictSubst_dictSubstQ : int }
and t_ElabCore = { f_ElabCore_coreDatas : Elab_dTypes.t_DtData B_dData_dList.t_List; f_ElabCore_coreEc : Elab_dTypes.t_Ec; f_ElabCore_coreDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_ElabCore_coreInstDefs : Elab_dTypes.t_DtDef B_dData_dList.t_List; f_ElabCore_coreGlobals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List; f_ElabCore_coreProjSpans : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_DtGoalInfo = { f_DtGoalInfo_dtGoalInfoSpan : Base_dSource.t_Span; f_DtGoalInfo_dtGoalInfoGoal : string; f_DtGoalInfo_dtGoalInfoCtx : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DtGoalInfo_dtGoalInfoName : string }

# 41 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_countNames = (fun (dtb_u_u1 : string B_dData_dList.t_List) (dtb_u_u2 : (string, int) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (let dtb_u_u5 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u3) dtb_u_u2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u6) -> dtb_u_u6
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in ((v_countNames dtb_u_u4) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u3) (dtb_u_u5 + 1)) dtb_u_u2)))
  | B_dData_dList.C_List_Nil -> dtb_u_u2
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Elab/Driver.vuna"
let v_showCounters = (fun (dtb_u_u7 : string B_dData_dList.t_List) -> ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (fun (dtb_u_u8 : (string, int) B_dData_dPair.t_Pair) -> (String.concat "" [((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) (B_dData_dPair.v_firstOf dtb_u_u8)); "="; ((B_dTrait_dInterp.v_interp (B_dTrait_dInterp.v_Interp_uc9feaa570847b590_ua B_dData_dInt.v_Show_u0077d73cf424e521_uInt)) (B_dData_dPair.v_secondOf dtb_u_u8))]))) ((B_dData_dSort.v_sortBy (fun (dtb_u_u9 : (string, int) B_dData_dPair.t_Pair) (dtb_u_u10 : (string, int) B_dData_dPair.t_Pair) -> (((B_dTrait_dOrd.v__x60_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) (B_dData_dPair.v_firstOf dtb_u_u9)) (B_dData_dPair.v_firstOf dtb_u_u10)))) (B_dContainer_dHashMap.v_toList ((v_countNames dtb_u_u7) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))))))

# 109 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_leadingImplicitCtxGo = (fun (dtb_u_u11 : Elab_dTypes.t_Ctx) (dtb_u_u12 : Core_dTerm.t_Term) -> (match dtb_u_u12 with
  | Core_dTerm.C_Term_TPi (dtb_u_u13, dtb_u_u14, dtb_u_u15, dtb_u_u16, dtb_u_u17) -> (if dtb_u_u14 then (let dtb_u_u18 = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u11)) dtb_u_u16) in ((v_leadingImplicitCtxGo (((Elab_dTypes.v_ctxBindValue dtb_u_u13) dtb_u_u18) dtb_u_u11)) dtb_u_u17)) else dtb_u_u11)
  | _ -> dtb_u_u11
))

# 106 "Vuna/Compiler/Elab/Driver.vuna"
let v_leadingImplicitCtx = (fun (dtb_u_u19 : Core_dTerm.t_Term) -> ((v_leadingImplicitCtxGo Elab_dTypes.v_emptyCtx) dtb_u_u19))

# 156 "Vuna/Compiler/Elab/Driver.vuna"
let v_isMemberConstraintExpr = (fun (dtb_u_u20 : Frontend_dAst.t_Expr) -> (match dtb_u_u20 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u21, dtb_u_u22, dtb_u_u23) -> (match dtb_u_u21 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u24, dtb_u_u25) -> (if (dtb_u_u24 = Base_dIntrinsics.v_effMemberFamilyName) then (if ((B_dData_dList.v_length dtb_u_u22) = 3) then true else ((B_dData_dList.v_length dtb_u_u22) = 2)) else false)
  | _ -> false
)
  | _ -> false
))

# 149 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_splitMemberCtx = (fun (dtb_u_u26 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u26 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u27, dtb_u_u28) -> (let dtb_u_u29 = (v_splitMemberCtx dtb_u_u28) in (if (v_isMemberConstraintExpr dtb_u_u27) then { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u27, (B_dData_dPair.v_firstOf dtb_u_u29))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u29) } else { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u29); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u27, (B_dData_dPair.v_secondOf dtb_u_u29))) }))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Elab/Driver.vuna"
let v_memberSugarExpr = (fun (dtb_u_u30 : Elab_dTypes.t_Ec) (dtb_u_u31 : Frontend_dAst.t_Expr) -> (match dtb_u_u31 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u32, dtb_u_u33, dtb_u_u34) -> (match dtb_u_u32 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u35, dtb_u_u36) -> (match dtb_u_u33 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u37, dtb_u_u38) -> (match dtb_u_u38 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u39, dtb_u_u40) -> (match dtb_u_u40 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u41, dtb_u_u42) -> (match dtb_u_u42 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u35 = Base_dIntrinsics.v_effMemberFamilyName) then (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u35, dtb_u_u36)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effNamedName, dtb_u_u34)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u37, (B_dData_dList.C_List__x58__x58_ (dtb_u_u39, B_dData_dList.C_List_Nil)))), dtb_u_u34)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u41, B_dData_dList.C_List_Nil)))), dtb_u_u34)) else dtb_u_u31)
  | _ -> dtb_u_u31
)
  | _ -> dtb_u_u31
)
  | _ -> dtb_u_u31
)
  | _ -> dtb_u_u31
)
  | _ -> dtb_u_u31
)
  | _ -> dtb_u_u31
))

# 170 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_elabMemberConstraintDoms = (fun (dtb_u_u43 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u44 : Elab_dTypes.t_Ctx) (dtb_u_u45 : Elab_dTypes.t_Ec) (dtb_u_u46 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u47 : Base_dSource.t_Span) -> (match dtb_u_u46 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u48, dtb_u_u49) -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType dtb_u_u43) dtb_u_u44) dtb_u_u45) ((v_memberSugarExpr dtb_u_u45) dtb_u_u48))) (fun (dtb_u_u50 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u51 = dtb_u_u50 in (match dtb_u_u51 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u52; B_dData_dPair.f_Pair_second = dtb_u_u53 } -> (match dtb_u_u53 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u54; B_dData_dPair.f_Pair_second = dtb_u_u55 } -> ((Base_dCommon.v_bind (((((v_elabMemberConstraintDoms dtb_u_u43) dtb_u_u44) dtb_u_u55) dtb_u_u49) dtb_u_u47)) (fun (dtb_u_u56 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u56 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u57; B_dData_dPair.f_Pair_second = dtb_u_u58 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u52, dtb_u_u57)); B_dData_dPair.f_Pair_second = dtb_u_u58 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u45 }))
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Driver.vuna"
let v_sigMemberName = (fun (dtb_u_u59 : int) -> ("_member" ^ (string_of_int dtb_u_u59)))

# 192 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_prependSigMembers = (fun (dtb_u_u60 : Core_dTerm.t_Term) (dtb_u_u61 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u62 : int) -> (match dtb_u_u61 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u63, dtb_u_u64) -> (Core_dTerm.C_Term_TPi ((v_sigMemberName dtb_u_u62), true, Core_dTerm.C_Rig_Rig0, dtb_u_u63, (((v_prependSigMembers dtb_u_u60) dtb_u_u64) (dtb_u_u62 + 1))))
  | B_dData_dList.C_List_Nil -> dtb_u_u60
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_insertSigMembersRev = (fun (dtb_u_u65 : Core_dTerm.t_Term) (dtb_u_u66 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u67 : int) (dtb_u_u68 : int) -> (match dtb_u_u66 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u69, dtb_u_u70) -> ((((v_insertSigMembersRev (((((Core_dTerm.v_insertImplicitBinder (v_sigMemberName dtb_u_u67)) dtb_u_u68) Core_dTerm.C_Rig_Rig0) dtb_u_u69) dtb_u_u65)) dtb_u_u70) (dtb_u_u67 - 1)) dtb_u_u68)
  | B_dData_dList.C_List_Nil -> dtb_u_u65
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Elab/Driver.vuna"
let v_insertSigMembers = (fun (dtb_u_u71 : Core_dTerm.t_Term) (dtb_u_u72 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u73 : int) -> (match dtb_u_u72 with
  | B_dData_dList.C_List_Nil -> dtb_u_u71
  | _ -> (if (dtb_u_u73 <= 0) then (((v_prependSigMembers dtb_u_u71) dtb_u_u72) 0) else ((((v_insertSigMembersRev dtb_u_u71) dtb_u_u72) ((B_dData_dList.v_length dtb_u_u72) - 1)) (dtb_u_u73 - 1)))
))

# 233 "Vuna/Compiler/Elab/Driver.vuna"
let v_sigDictName = (fun (dtb_u_u74 : int) -> ("_ctx" ^ (string_of_int dtb_u_u74)))

# 223 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_prependSigDicts = (fun (dtb_u_u75 : Core_dTerm.t_Term) (dtb_u_u76 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u77 : int) -> (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> (Core_dTerm.C_Term_TPi ((v_sigDictName dtb_u_u77), true, Core_dTerm.C_Rig_RigOmega, dtb_u_u78, (((v_prependSigDicts dtb_u_u75) dtb_u_u79) (dtb_u_u77 + 1))))
  | B_dData_dList.C_List_Nil -> dtb_u_u75
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_insertSigDictsRev = (fun (dtb_u_u80 : Core_dTerm.t_Term) (dtb_u_u81 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u82 : int) (dtb_u_u83 : int) -> (match dtb_u_u81 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u84, dtb_u_u85) -> ((((v_insertSigDictsRev ((((Core_dTerm.v_insertDictBinder (v_sigDictName dtb_u_u82)) dtb_u_u83) dtb_u_u84) dtb_u_u80)) dtb_u_u85) (dtb_u_u82 - 1)) dtb_u_u83)
  | B_dData_dList.C_List_Nil -> dtb_u_u80
  | _ -> failwith "DT: impossible branch"
))

# 215 "Vuna/Compiler/Elab/Driver.vuna"
let v_insertSigDicts = (fun (dtb_u_u86 : Core_dTerm.t_Term) (dtb_u_u87 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u88 : int) -> (match dtb_u_u87 with
  | B_dData_dList.C_List_Nil -> dtb_u_u86
  | _ -> (if (dtb_u_u88 <= 0) then (((v_prependSigDicts dtb_u_u86) dtb_u_u87) 0) else ((((v_insertSigDictsRev dtb_u_u86) dtb_u_u87) ((B_dData_dList.v_length dtb_u_u87) - 1)) (dtb_u_u88 - 1)))
))

# 123 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabSigDictBinders = (fun (dtb_u_u89 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u90 : Elab_dTypes.t_Ec) (dtb_u_u91 : Core_dTerm.t_Term) (dtb_u_u92 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u93 : Base_dSource.t_Span) -> (match dtb_u_u92 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u91; B_dData_dPair.f_Pair_second = dtb_u_u90 }))
  | _ -> (let dtb_u_u94 = (v_splitMemberCtx dtb_u_u92) in (let dtb_u_u95 = (B_dData_dPair.v_firstOf dtb_u_u94) in (let dtb_u_u96 = (B_dData_dPair.v_secondOf dtb_u_u94) in (let dtb_u_u97 = (v_leadingImplicitCtx dtb_u_u91) in ((Base_dCommon.v_bind ((Elab_dTrait.v_constraintPartsOf dtb_u_u93) dtb_u_u96)) (fun (dtb_u_u98 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((Elab_dTrait.v_elabConstraintDomains (Elab_dTypes.v_ecClasses dtb_u_u90)) dtb_u_u89) dtb_u_u97) dtb_u_u98) dtb_u_u93) dtb_u_u90)) (fun (dtb_u_u99 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind (((((v_elabMemberConstraintDoms dtb_u_u89) dtb_u_u97) (B_dData_dPair.v_secondOf dtb_u_u99)) dtb_u_u95) dtb_u_u93)) (fun (dtb_u_u100 : (Core_dTerm.t_Term B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let dtb_u_u101 = (B_dData_dPair.v_firstOf dtb_u_u99) in (let dtb_u_u102 = (B_dData_dPair.v_secondOf dtb_u_u99) in (let dtb_u_u103 = (B_dData_dPair.v_firstOf dtb_u_u100) in (let dtb_u_u104 = (B_dData_dPair.v_secondOf dtb_u_u100) in (let dtb_u_u105 = (((v_insertSigDicts dtb_u_u91) dtb_u_u101) (Elab_dTrait.v_leadingImplicitCount dtb_u_u91)) in (let dtb_u_u106 = (((v_insertSigMembers dtb_u_u105) dtb_u_u103) (Elab_dTrait.v_leadingImplicitCount dtb_u_u105)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u106; B_dData_dPair.f_Pair_second = dtb_u_u104 }))))))))))))))))))
))

# 88 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_elabSigsGo = (fun (dtb_u_u107 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u108 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u109 : Elab_dTypes.t_Ec) (dtb_u_u110 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u107 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u111, dtb_u_u112) -> (match dtb_u_u111 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u113; B_dData_dPair.f_Pair_second = dtb_u_u114 } -> (match dtb_u_u114 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u115; B_dData_dPair.f_Pair_second = dtb_u_u116 } -> (match dtb_u_u116 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u117; B_dData_dPair.f_Pair_second = dtb_u_u118 } -> ((Base_dCommon.v_bind ((((Elab_dTerm.v_checkType dtb_u_u108) Elab_dTypes.v_emptyCtx) dtb_u_u109) dtb_u_u117)) (fun (dtb_u_u119 : (Core_dTerm.t_Term, (Core_dTerm.t_Level, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u120 = dtb_u_u119 in (match dtb_u_u120 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u121; B_dData_dPair.f_Pair_second = dtb_u_u122 } -> (match dtb_u_u122 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u123; B_dData_dPair.f_Pair_second = dtb_u_u124 } -> ((Base_dCommon.v_bind (((((v_elabSigDictBinders dtb_u_u108) dtb_u_u124) dtb_u_u121) dtb_u_u115) dtb_u_u118)) (fun (dtb_u_u125 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u125 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u126; B_dData_dPair.f_Pair_second = dtb_u_u127 } -> (let dtb_u_u128 = (((Elab_dMeta.v_zonkTerm dtb_u_u127) 0) dtb_u_u126) in ((((v_elabSigsGo dtb_u_u112) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u113; B_dData_dPair.f_Pair_second = dtb_u_u128 }, dtb_u_u108))) ((Elab_dTypes.v_ecPutGlobalsTbl dtb_u_u127) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u113) dtb_u_u128) (Elab_dTypes.v_ecGlobalsTbl dtb_u_u127)))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u113; B_dData_dPair.f_Pair_second = dtb_u_u128 }, dtb_u_u110))))
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
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u108) (B_dData_dList.v_reverse dtb_u_u110)); B_dData_dPair.f_Pair_second = dtb_u_u109 }))
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabSigs = (fun (dtb_u_u129 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u130 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u131 : Elab_dTypes.t_Ec) -> ((((v_elabSigsGo dtb_u_u129) dtb_u_u130) ((Elab_dTypes.v_ecSetGlobalsComplete ((Elab_dTypes.v_ecPutGlobalsTbl dtb_u_u131) (Elab_dMeta.v_globalsTableOf dtb_u_u130))) true)) B_dData_dList.C_List_Nil))

# 251 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_declaredDictBindersGo = (fun (dtb_u_u132 : Elab_dTypes.t_Ec) (dtb_u_u133 : Elab_dTypes.t_Ctx) (dtb_u_u134 : Core_dTerm.t_Term) (dtb_u_u135 : t_DeclDictBinder B_dData_dList.t_List) -> (match dtb_u_u134 with
  | Core_dTerm.C_Term_TPi (dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u139, dtb_u_u140) -> (if dtb_u_u137 then (let dtb_u_u141 = ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u133)) dtb_u_u139) in (let dtb_u_u142 = (if ((Elab_dDict.v_isDictDomain dtb_u_u132) dtb_u_u141) then (B_dData_dList.C_List__x58__x58_ ({ f_DeclDictBinder_declDictName = dtb_u_u136; f_DeclDictBinder_declDictLevel = (Elab_dTypes.v_ctxDepth dtb_u_u133); f_DeclDictBinder_declDictDom = dtb_u_u141 }, dtb_u_u135)) else dtb_u_u135) in ((((v_declaredDictBindersGo dtb_u_u132) (((Elab_dTypes.v_ctxBindValue dtb_u_u136) dtb_u_u141) dtb_u_u133)) dtb_u_u140) dtb_u_u142))) else (B_dData_dList.v_reverse dtb_u_u135))
  | _ -> (B_dData_dList.v_reverse dtb_u_u135)
))

# 248 "Vuna/Compiler/Elab/Driver.vuna"
let v_declaredDictBinders = (fun (dtb_u_u143 : Elab_dTypes.t_Ec) (dtb_u_u144 : Core_dTerm.t_Term) -> ((((v_declaredDictBindersGo dtb_u_u143) Elab_dTypes.v_emptyCtx) dtb_u_u144) B_dData_dList.C_List_Nil))

# 309 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictDomMatches = (fun (dtb_u_u145 : Elab_dTypes.t_Ec) (dtb_u_u146 : Core_dTerm.t_Value) (dtb_u_u147 : Core_dTerm.t_Value) -> (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u145)) (Elab_dTypes.v_ecSolsP dtb_u_u145)) 0) ((Elab_dTypes.v_forceVal dtb_u_u145) dtb_u_u146)) ((Elab_dTypes.v_forceVal dtb_u_u145) dtb_u_u147)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u148) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u149) -> false
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_firstMatchDictBinder = (fun (dtb_u_u150 : Elab_dTypes.t_Ec) (dtb_u_u151 : t_DeclDictBinder B_dData_dList.t_List) (dtb_u_u152 : Core_dTerm.t_Value) -> (match dtb_u_u151 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u153, dtb_u_u154) -> (if (((v_dictDomMatches dtb_u_u150) (dtb_u_u153).f_DeclDictBinder_declDictDom) dtb_u_u152) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u153)) else (((v_firstMatchDictBinder dtb_u_u150) dtb_u_u154) dtb_u_u152))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_solveDeclaredDictGoalsGo = (fun (dtb_u_u155 : Elab_dTypes.t_Ec) (dtb_u_u156 : t_DeclDictBinder B_dData_dList.t_List) (dtb_u_u157 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u158 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u159 : t_DictSubst B_dData_dList.t_List) -> (let dtb_u_u160 = dtb_u_u157 in (match dtb_u_u160 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u162) -> (match dtb_u_u161 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u163; Elab_dTypes.f_Constraint_conKind = dtb_u_u164; Elab_dTypes.f_Constraint_conMeta = dtb_u_u165; Elab_dTypes.f_Constraint_conDom = dtb_u_u166; Elab_dTypes.f_Constraint_conSpan = dtb_u_u167; Elab_dTypes.f_Constraint_conDepth = dtb_u_u168 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u165) (Elab_dTypes.v_ecSolTbl dtb_u_u155)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u169) -> (((((v_solveDeclaredDictGoalsGo dtb_u_u155) dtb_u_u156) dtb_u_u162) (B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u158))) dtb_u_u159)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_firstMatchDictBinder dtb_u_u155) dtb_u_u156) dtb_u_u166) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_solveDeclaredDictGoalsGo dtb_u_u155) dtb_u_u156) dtb_u_u162) (B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u158))) dtb_u_u159)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u170) -> (let dtb_u_u171 = ((dtb_u_u170).f_DeclDictBinder_declDictLevel + 1) in (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u155)) (Elab_dTypes.v_ecSolsP dtb_u_u155)) ((dtb_u_u170).f_DeclDictBinder_declDictLevel + 1)) dtb_u_u165) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ((dtb_u_u170).f_DeclDictBinder_declDictName, (dtb_u_u170).f_DeclDictBinder_declDictLevel, B_dData_dList.C_List_Nil))))) with
  | Base_dDiag.C_Check_OkC (dtb_u_u172) -> (((((v_solveDeclaredDictGoalsGo ((Elab_dTypes.v_ecPutSols dtb_u_u155) (Core_dTerm.v_solsList dtb_u_u172))) dtb_u_u156) dtb_u_u162) dtb_u_u158) (B_dData_dList.C_List__x58__x58_ ({ f_DictSubst_dictSubstMeta = dtb_u_u165; f_DictSubst_dictSubstName = (dtb_u_u170).f_DeclDictBinder_declDictName; f_DictSubst_dictSubstQ = dtb_u_u171 }, dtb_u_u159)))
  | Base_dDiag.C_Check_ErrC (dtb_u_u173) -> (((((v_solveDeclaredDictGoalsGo dtb_u_u155) dtb_u_u156) dtb_u_u162) (B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u158))) dtb_u_u159)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u159); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutPending dtb_u_u155) (B_dData_dList.v_reverse dtb_u_u158)) }
  | _ -> failwith "DT: impossible branch"
)))

# 315 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_applyDeclaredDictSubsts = (fun (dtb_u_u174 : t_DictSubst B_dData_dList.t_List) (dtb_u_u175 : Core_dTerm.t_Term) -> (match dtb_u_u174 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u176, dtb_u_u177) -> ((v_applyDeclaredDictSubsts dtb_u_u177) ((((Core_dTerm.v_substMetaVar (dtb_u_u176).f_DictSubst_dictSubstMeta) (dtb_u_u176).f_DictSubst_dictSubstName) (dtb_u_u176).f_DictSubst_dictSubstQ) dtb_u_u175))
  | B_dData_dList.C_List_Nil -> dtb_u_u175
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Driver.vuna"
let v_solveDeclaredDictGoals = (fun (dtb_u_u178 : Elab_dTypes.t_Ec) (dtb_u_u179 : Core_dTerm.t_Term) (dtb_u_u180 : Core_dTerm.t_Term) -> (match (Elab_dTypes.v_ecPendingList dtb_u_u178) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u180; B_dData_dPair.f_Pair_second = dtb_u_u178 }
  | _ -> (match ((v_declaredDictBinders dtb_u_u178) dtb_u_u179) with
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u180; B_dData_dPair.f_Pair_second = dtb_u_u178 }
  | dtb_u_u181 -> (let dtb_u_u182 = (((((v_solveDeclaredDictGoalsGo dtb_u_u178) dtb_u_u181) (Elab_dTypes.v_ecPendingList dtb_u_u178)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in { B_dData_dPair.f_Pair_first = ((v_applyDeclaredDictSubsts (B_dData_dPair.v_firstOf dtb_u_u182)) dtb_u_u180); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u182) })
)
))

# 325 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_clausesTblGo = (fun (dtb_u_u183 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u184 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u183 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u185, dtb_u_u186) -> (match dtb_u_u185 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u187, dtb_u_u188, dtb_u_u189, dtb_u_u190) -> (let dtb_u_u191 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u187) dtb_u_u184) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u192) -> dtb_u_u192
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in ((v_clausesTblGo dtb_u_u186) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u187) ((B_dData_dList.v_append dtb_u_u191) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u188; B_dData_dPair.f_Pair_second = dtb_u_u189 }, B_dData_dList.C_List_Nil)))) dtb_u_u184)))
  | _ -> ((v_clausesTblGo dtb_u_u186) dtb_u_u184)
)
  | B_dData_dList.C_List_Nil -> dtb_u_u184
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Elab/Driver.vuna"
let v_clausesTblOf = (fun (dtb_u_u193 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_clausesTblGo dtb_u_u193) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 338 "Vuna/Compiler/Elab/Driver.vuna"
let v_clausesOfTbl = (fun (dtb_u_u194 : Elab_dTypes.t_Ec) (dtb_u_u195 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u196 : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u196) (dtb_u_u194).Elab_dTypes.f_Ec_ecClausesTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u197) -> dtb_u_u197
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dAst.v_clausesFor dtb_u_u195) dtb_u_u196)
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Elab/Driver.vuna"
let v_defAlreadyDone = (fun (dtb_u_u198 : string) (dtb_u_u199 : Elab_dTypes.t_Ec) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u198) (Elab_dTypes.v_ecDefTbl dtb_u_u199)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u200) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Elab/Driver.vuna"
let v_defBodyPair = (fun (dtb_u_u201 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u201) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u202) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u201); B_dData_dPair.f_Pair_second = dtb_u_u202 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Elab/Driver.vuna"
let v_defBodyPairs = (fun (dtb_u_u203 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_mapMaybe v_defBodyPair) dtb_u_u203))

# 361 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_declFunNames = (fun (dtb_u_u204 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u204 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u205, dtb_u_u206) -> (match dtb_u_u205 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u207, dtb_u_u208, dtb_u_u209, dtb_u_u210) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u207, (v_declFunNames dtb_u_u206)))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u211, dtb_u_u212, dtb_u_u213, dtb_u_u214) -> ((B_dData_dList.v_append (v_declFunNames dtb_u_u213)) (v_declFunNames dtb_u_u206))
  | _ -> (v_declFunNames dtb_u_u206)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_checkAllDefinedGo = (fun (dtb_u_u215 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u216 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u217 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u218 : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u215 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u219, dtb_u_u220) -> (match dtb_u_u219 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u221; B_dData_dPair.f_Pair_second = dtb_u_u222 } -> (match dtb_u_u222 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u223; B_dData_dPair.f_Pair_second = dtb_u_u224 } -> (match dtb_u_u224 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u225; B_dData_dPair.f_Pair_second = dtb_u_u226 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u221) dtb_u_u218) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u227) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u221) dtb_u_u217) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u227) (Base_dDiagnostics_dTc.C_TcErr_AxiomWithDefinition (dtb_u_u221))) dtb_u_u221) else ((((v_checkAllDefinedGo dtb_u_u220) dtb_u_u216) dtb_u_u217) dtb_u_u218))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u221) dtb_u_u217) then (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u221) dtb_u_u216) then ((((v_checkAllDefinedGo dtb_u_u220) dtb_u_u216) dtb_u_u217) dtb_u_u218) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb_u_u226) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_SignatureNoDef (dtb_u_u221))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u221, B_dData_dVec.C_Vec_Nil))))))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan dtb_u_u226) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_SignatureNoDef (dtb_u_u221))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u221, B_dData_dVec.C_Vec_Nil)))))))
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
let v_funNamesTbl = (fun (dtb_u_u228 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (B_dContainer_dHashMap.v_ofNames (v_declFunNames dtb_u_u228)))

# 505 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_axiomSpanPairs = (fun (dtb_u_u229 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u229 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u230, dtb_u_u231) -> (match dtb_u_u230 with
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u232, dtb_u_u233, dtb_u_u234) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u232; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u234) }, (v_axiomSpanPairs dtb_u_u231)))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u235, dtb_u_u236, dtb_u_u237, dtb_u_u238) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u235; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u238) }, (v_axiomSpanPairs dtb_u_u231)))
  | _ -> (v_axiomSpanPairs dtb_u_u231)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Elab/Driver.vuna"
let v_axiomSpansTbl = (fun (dtb_u_u239 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (v_axiomSpanPairs dtb_u_u239)))

# 470 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkAllDefined = (fun (dtb_u_u240 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u241 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u242 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_checkAllDefinedGo dtb_u_u240) (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u241))) (v_funNamesTbl dtb_u_u242)) (v_axiomSpansTbl dtb_u_u242)))

# 513 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasFunClause = (fun (dtb_u_u243 : string) (dtb_u_u244 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u244 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u245, dtb_u_u246) -> (match dtb_u_u245 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u247, dtb_u_u248, dtb_u_u249, dtb_u_u250) -> (if (dtb_u_u247 = dtb_u_u243) then true else ((v_hasFunClause dtb_u_u243) dtb_u_u246))
  | _ -> ((v_hasFunClause dtb_u_u243) dtb_u_u246)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 521 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_axiomSpanOf = (fun (dtb_u_u251 : string) (dtb_u_u252 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u252 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u253, dtb_u_u254) -> (match dtb_u_u253 with
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u255, dtb_u_u256, dtb_u_u257) -> (if (dtb_u_u255 = dtb_u_u251) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u257))) else ((v_axiomSpanOf dtb_u_u251) dtb_u_u254))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u258, dtb_u_u259, dtb_u_u260, dtb_u_u261) -> (if (dtb_u_u258 = dtb_u_u251) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u261))) else ((v_axiomSpanOf dtb_u_u251) dtb_u_u254))
  | _ -> ((v_axiomSpanOf dtb_u_u251) dtb_u_u254)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternArrayElem = (fun (dtb_u_u262 : Base_dSource.t_Span) (dtb_u_u263 : Core_dTerm.t_Value) -> (match dtb_u_u263 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u264) -> (match dtb_u_u264 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u265, dtb_u_u266) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb_u_u265) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u262) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported (("Array " ^ dtb_u_u265)))) dtb_u_u265))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u262) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u262) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array element is not a basic type"))) "array-element")
))

# 551 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternDomain = (fun (dtb_u_u267 : Base_dSource.t_Span) (dtb_u_u268 : Core_dTerm.t_Value) -> (match dtb_u_u268 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u269) -> (match dtb_u_u269 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u270, dtb_u_u271) -> (if (Base_dIntrinsics.v_isFfiScalarName dtb_u_u270) then (Base_dDiag.C_Check_OkC (0)) else (if (dtb_u_u270 = "Array") then (let dtb_u_u272 = dtb_u_u271 in (match dtb_u_u272 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u273, dtb_u_u274) -> (match dtb_u_u274 with
  | B_dData_dList.C_List_Nil -> ((v_checkExternArrayElem dtb_u_u267) dtb_u_u273)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u267) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u267) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("Array needs one type argument"))) "Array")
)) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u267) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported (dtb_u_u270))) dtb_u_u270)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u267) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("non-global type"))) "non-global")
)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u267) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("non-basic type"))) "non-basic")
))

# 535 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_checkExternValue = (fun (dtb_u_u275 : Base_dSource.t_Span) (dtb_u_u276 : int) (dtb_u_u277 : int) (dtb_u_u278 : Core_dTerm.t_Value) -> (match dtb_u_u278 with
  | Core_dTerm.C_Value_VPi (dtb_u_u279, dtb_u_u280, dtb_u_u281, dtb_u_u282, dtb_u_u283) -> (if (dtb_u_u276 <= 0) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u275) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else (if dtb_u_u280 then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u275) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("implicit parameter"))) "implicit parameter") else ((Base_dCommon.v_bind ((v_checkExternDomain dtb_u_u275) dtb_u_u282)) (fun (dtb_u_u284 : int) -> ((((v_checkExternValue dtb_u_u275) (dtb_u_u276 - 1)) (dtb_u_u277 + 1)) ((Core_dEval.v_applyClosure dtb_u_u283) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u279, dtb_u_u277, B_dData_dList.C_List_Nil))))))))))
  | _ -> (if (dtb_u_u276 <= 0) then (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u275) (Base_dDiagnostics_dTc.C_TcErr_FfiTypeUnsupported ("too many parameters"))) "too many parameters") else ((v_checkExternDomain dtb_u_u275) dtb_u_u278))
))

# 532 "Vuna/Compiler/Elab/Driver.vuna"
let v_checkExternTy = (fun (dtb_u_u285 : Base_dSource.t_Span) (dtb_u_u286 : Core_dTerm.t_Term) -> ((((v_checkExternValue dtb_u_u285) 64) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u286)))

# 588 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_allReplCtors = (fun (dtb_u_u287 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u287 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u288, dtb_u_u289) -> ((B_dData_dList.v_append (Elab_dTypes.v_dtDataCtors dtb_u_u288)) (v_allReplCtors dtb_u_u289))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 617 "Vuna/Compiler/Elab/Driver.vuna"
let v_replShortName = (fun (dtb_u_u290 : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u290))))

# 627 "Vuna/Compiler/Elab/Driver.vuna"
let v_appendLastTerm = (fun (dtb_u_u291 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u292 : Core_dTerm.t_Term) -> ((B_dData_dList.v_append dtb_u_u291) (B_dData_dList.C_List__x58__x58_ (dtb_u_u292, B_dData_dList.C_List_Nil))))

# 620 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_spineOf = (fun (dtb_u_u293 : Core_dTerm.t_Term) -> (match dtb_u_u293 with
  | Core_dTerm.C_Term_TApp (dtb_u_u294, dtb_u_u295, dtb_u_u296) -> (match (v_spineOf dtb_u_u294) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u297; B_dData_dPair.f_Pair_second = dtb_u_u298 } -> { B_dData_dPair.f_Pair_first = dtb_u_u297; B_dData_dPair.f_Pair_second = ((v_appendLastTerm dtb_u_u298) dtb_u_u295) }
  | _ -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp (dtb_u_u294, dtb_u_u295, dtb_u_u296)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
)
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u293; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
))

# 631 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNatZeroName = "Base.Data.Nat.Nat.Zero"

# 635 "Vuna/Compiler/Elab/Driver.vuna"
let v_replNatSuccName = "Base.Data.Nat.Nat.Succ"

# 771 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_zipKeptArgs = (fun (dtb_u_u299 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u300 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u299 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u301, dtb_u_u302) -> (match dtb_u_u300 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u303, dtb_u_u304) -> (match dtb_u_u303 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u305; B_dData_dPair.f_Pair_second = dtb_u_u306 } -> (if (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u301)) then ((v_zipKeptArgs dtb_u_u302) dtb_u_u304) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u305, ((v_zipKeptArgs dtb_u_u302) dtb_u_u304))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_map (fun (dtb_u_u307 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u307))) dtb_u_u300)
  | _ -> failwith "DT: impossible branch"
))

# 765 "Vuna/Compiler/Elab/Driver.vuna"
let v_keptCtorArgs = (fun (dtb_u_u308 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u309 : string) (dtb_u_u310 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((Elab_dMeta.v_findCtorIn dtb_u_u309) dtb_u_u308) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dData_dList.v_map (fun (dtb_u_u311 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dPair.v_firstOf dtb_u_u311))) dtb_u_u310)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u312) -> ((v_zipKeptArgs (Elab_dTypes.v_dtCtorTelescope dtb_u_u312)) dtb_u_u310)
  | _ -> failwith "DT: impossible branch"
))

# 638 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_replNatValue = (fun (dtb_u_u313 : int) (dtb_u_u314 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u315 : Core_dTerm.t_Term) -> (if (dtb_u_u313 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u315 with
  | Core_dTerm.C_Term_TCon (dtb_u_u316, dtb_u_u317) -> (if (dtb_u_u316 = v_replNatZeroName) then (B_dData_dMaybe.C_Maybe_Just (0)) else (if (dtb_u_u316 = v_replNatSuccName) then (let dtb_u_u318 = (((v_keptCtorArgs dtb_u_u314) dtb_u_u316) dtb_u_u317) in (match dtb_u_u318 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u319, dtb_u_u320) -> (match dtb_u_u320 with
  | B_dData_dList.C_List_Nil -> (match (((v_replNatValue (dtb_u_u313 - 1)) dtb_u_u314) dtb_u_u319) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u321) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u321 + 1)))
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
let v_isReplAtom = (fun (dtb_u_u322 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u323 : Core_dTerm.t_Term) -> (match dtb_u_u323 with
  | Core_dTerm.C_Term_TCon (dtb_u_u324, dtb_u_u325) -> (if (if (if (dtb_u_u324 = v_replListNilName) then true else (dtb_u_u324 = v_replPairName)) then true else (dtb_u_u324 = v_replNothingName)) then true else ((B_dData_dList.v_length (((v_keptCtorArgs dtb_u_u322) dtb_u_u324) dtb_u_u325)) = 0))
  | Core_dTerm.C_Term_TMeta (dtb_u_u326) -> true
  | Core_dTerm.C_Term_TType (dtb_u_u327) -> true
  | Core_dTerm.C_Term_TGlobal (dtb_u_u328) -> true
  | Core_dTerm.C_Term_TVar (dtb_u_u329, dtb_u_u330, dtb_u_u331) -> true
  | Core_dTerm.C_Term_TBool (dtb_u_u332) -> true
  | Core_dTerm.C_Term_TFloat (dtb_u_u333) -> true
  | Core_dTerm.C_Term_TStr (dtb_u_u334) -> true
  | Core_dTerm.C_Term_TInt (dtb_u_u335) -> true
  | _ -> false
))

# 592 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_renderReplTerm = (fun (dtb_u_u336 : int) (dtb_u_u337 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u338 : Core_dTerm.t_Term) -> (if (dtb_u_u336 <= 0) then (Core_dTerm.v_showTerm dtb_u_u338) else (match dtb_u_u338 with
  | Core_dTerm.C_Term_TCon (dtb_u_u339, dtb_u_u340) -> ((((v_renderReplCtor (dtb_u_u336 - 1)) dtb_u_u337) dtb_u_u339) dtb_u_u340)
  | Core_dTerm.C_Term_TLam (dtb_u_u341, dtb_u_u342, dtb_u_u343, dtb_u_u344, dtb_u_u345) -> "<\229\135\189\230\149\176>"
  | Core_dTerm.C_Term_TMeta (dtb_u_u346) -> "_"
  | Core_dTerm.C_Term_TGlobal (dtb_u_u347) -> (v_replShortName dtb_u_u347)
  | Core_dTerm.C_Term_TApp (dtb_u_u348, dtb_u_u349, dtb_u_u350) -> (((v_renderReplApp (dtb_u_u336 - 1)) dtb_u_u337) (Core_dTerm.C_Term_TApp (dtb_u_u348, dtb_u_u349, dtb_u_u350)))
  | _ -> (Core_dTerm.v_showTerm dtb_u_u338)
)))
# 606 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplApp = (fun (dtb_u_u351 : int) (dtb_u_u352 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u353 : Core_dTerm.t_Term) -> (if (dtb_u_u351 <= 0) then (Core_dTerm.v_showTerm dtb_u_u353) else (match (v_spineOf dtb_u_u353) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u354; B_dData_dPair.f_Pair_second = dtb_u_u355 } -> (match dtb_u_u354 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u356) -> ((v_replShortName dtb_u_u356) ^ (((v_renderReplArgs (dtb_u_u351 - 1)) dtb_u_u352) dtb_u_u355))
  | _ -> (Core_dTerm.v_showTerm dtb_u_u353)
)
  | _ -> failwith "DT: impossible branch"
)))
# 658 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplCtor = (fun (dtb_u_u357 : int) (dtb_u_u358 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u359 : string) (dtb_u_u360 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u357 <= 0) then "<\229\128\188>" else (let dtb_u_u361 = (((v_keptCtorArgs dtb_u_u358) dtb_u_u359) dtb_u_u360) in (if (dtb_u_u359 = v_replNatZeroName) then "0" else (if (dtb_u_u359 = v_replNatSuccName) then (let dtb_u_u362 = dtb_u_u361 in (match dtb_u_u362 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u363, dtb_u_u364) -> (match dtb_u_u364 with
  | B_dData_dList.C_List_Nil -> (match (((v_replNatValue (dtb_u_u357 - 1)) dtb_u_u358) dtb_u_u363) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u365) -> (string_of_int (dtb_u_u365 + 1))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_renderReplGeneric (dtb_u_u357 - 1)) dtb_u_u358) "Succ") dtb_u_u361)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_renderReplGeneric (dtb_u_u357 - 1)) dtb_u_u358) "Succ") dtb_u_u361)
)
  | _ -> ((((v_renderReplGeneric (dtb_u_u357 - 1)) dtb_u_u358) "Succ") dtb_u_u361)
)) else (if (dtb_u_u359 = v_replListNilName) then "[]" else (if (dtb_u_u359 = v_replListConsName) then (((v_renderReplList (dtb_u_u357 - 1)) dtb_u_u358) dtb_u_u361) else (if (dtb_u_u359 = v_replPairName) then (((v_renderReplPair (dtb_u_u357 - 1)) dtb_u_u358) dtb_u_u361) else (if (dtb_u_u359 = v_replJustName) then ((((v_renderReplUnary (dtb_u_u357 - 1)) dtb_u_u358) "Just") dtb_u_u361) else (if (dtb_u_u359 = v_replNothingName) then "Nothing" else ((((v_renderReplGeneric (dtb_u_u357 - 1)) dtb_u_u358) (v_replShortName dtb_u_u359)) dtb_u_u361)))))))))))
# 676 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplList = (fun (dtb_u_u366 : int) (dtb_u_u367 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u368 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u368 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u369, dtb_u_u370) -> (if (dtb_u_u366 <= 0) then "[]" else (let dtb_u_u371 = dtb_u_u370 in (match dtb_u_u371 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u372, dtb_u_u373) -> (match dtb_u_u373 with
  | B_dData_dList.C_List_Nil -> (match (((v_renderReplListTail (dtb_u_u366 - 1)) dtb_u_u367) dtb_u_u372) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u374) -> (String.concat "" ["["; (((v_renderReplArg (dtb_u_u366 - 1)) dtb_u_u367) dtb_u_u369); dtb_u_u374])
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_renderReplGeneric (dtb_u_u366 - 1)) dtb_u_u367) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb_u_u369, (B_dData_dList.C_List__x58__x58_ (dtb_u_u372, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_renderReplGeneric (dtb_u_u366 - 1)) dtb_u_u367) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb_u_u369, dtb_u_u370)))
)
  | _ -> ((((v_renderReplGeneric (dtb_u_u366 - 1)) dtb_u_u367) "(::)") (B_dData_dList.C_List__x58__x58_ (dtb_u_u369, dtb_u_u370)))
)))
  | B_dData_dList.C_List_Nil -> "[]"
  | _ -> failwith "DT: impossible branch"
))
# 689 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplListTail = (fun (dtb_u_u375 : int) (dtb_u_u376 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u377 : Core_dTerm.t_Term) -> (if (dtb_u_u375 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u377 with
  | Core_dTerm.C_Term_TCon (dtb_u_u378, dtb_u_u379) -> (if (dtb_u_u378 = v_replListNilName) then (B_dData_dMaybe.C_Maybe_Just ("]")) else (if (dtb_u_u378 = v_replListConsName) then (let dtb_u_u380 = (((v_keptCtorArgs dtb_u_u376) dtb_u_u378) dtb_u_u379) in (match dtb_u_u380 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u381, dtb_u_u382) -> (match dtb_u_u382 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u383, dtb_u_u384) -> (match dtb_u_u384 with
  | B_dData_dList.C_List_Nil -> (match (((v_renderReplListTail (dtb_u_u375 - 1)) dtb_u_u376) dtb_u_u383) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u385) -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [", "; (((v_renderReplArg (dtb_u_u375 - 1)) dtb_u_u376) dtb_u_u381); dtb_u_u385])))
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
and v_renderReplPair = (fun (dtb_u_u386 : int) (dtb_u_u387 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u388 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (dtb_u_u386 <= 0) then "<\229\128\188>" else (let dtb_u_u389 = dtb_u_u388 in (match dtb_u_u389 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u390, dtb_u_u391) -> (match dtb_u_u391 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u392, dtb_u_u393) -> (match dtb_u_u393 with
  | B_dData_dList.C_List_Nil -> (String.concat "" ["("; (((v_renderReplArg (dtb_u_u386 - 1)) dtb_u_u387) dtb_u_u390); ", "; (((v_renderReplArg (dtb_u_u386 - 1)) dtb_u_u387) dtb_u_u392); ")"])
  | _ -> ((((v_renderReplGeneric (dtb_u_u386 - 1)) dtb_u_u387) "Pair") dtb_u_u388)
)
  | _ -> ((((v_renderReplGeneric (dtb_u_u386 - 1)) dtb_u_u387) "Pair") dtb_u_u388)
)
  | _ -> ((((v_renderReplGeneric (dtb_u_u386 - 1)) dtb_u_u387) "Pair") dtb_u_u388)
))))
# 718 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplUnary = (fun (dtb_u_u394 : int) (dtb_u_u395 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u396 : string) (dtb_u_u397 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (dtb_u_u394 <= 0) then "<\229\128\188>" else (let dtb_u_u398 = dtb_u_u397 in (match dtb_u_u398 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u399, dtb_u_u400) -> (match dtb_u_u400 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [dtb_u_u396; " "; (((v_renderReplArg (dtb_u_u394 - 1)) dtb_u_u395) dtb_u_u399)])
  | _ -> ((((v_renderReplGeneric (dtb_u_u394 - 1)) dtb_u_u395) dtb_u_u396) dtb_u_u397)
)
  | _ -> ((((v_renderReplGeneric (dtb_u_u394 - 1)) dtb_u_u395) dtb_u_u396) dtb_u_u397)
))))
# 727 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplGeneric = (fun (dtb_u_u401 : int) (dtb_u_u402 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u403 : string) (dtb_u_u404 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (dtb_u_u401 <= 0) then "<\229\128\188>" else (dtb_u_u403 ^ (((v_renderReplArgs (dtb_u_u401 - 1)) dtb_u_u402) dtb_u_u404))))
# 731 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplArgs = (fun (dtb_u_u405 : int) (dtb_u_u406 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u407 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match dtb_u_u407 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u408, dtb_u_u409) -> (if (dtb_u_u405 <= 0) then "" else (String.concat "" [" "; (((v_renderReplArg (dtb_u_u405 - 1)) dtb_u_u406) dtb_u_u408); (((v_renderReplArgs (dtb_u_u405 - 1)) dtb_u_u406) dtb_u_u409)]))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 739 "Vuna/Compiler/Elab/Driver.vuna"
and v_renderReplArg = (fun (dtb_u_u410 : int) (dtb_u_u411 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) (dtb_u_u412 : Core_dTerm.t_Term) -> (if (dtb_u_u410 <= 0) then "<\229\128\188>" else (if ((v_isReplAtom dtb_u_u411) dtb_u_u412) then (((v_renderReplTerm (dtb_u_u410 - 1)) dtb_u_u411) dtb_u_u412) else (String.concat "" ["("; (((v_renderReplTerm (dtb_u_u410 - 1)) dtb_u_u411) dtb_u_u412); ")"]))))

# 585 "Vuna/Compiler/Elab/Driver.vuna"
let v_showValueRepl = (fun (dtb_u_u413 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u414 : Elab_dTypes.t_Ec) (dtb_u_u415 : Core_dTerm.t_Value) -> (((v_renderReplTerm 512) (v_allReplCtors dtb_u_u413)) (((Elab_dMeta.v_zonkTerm dtb_u_u414) 0) ((Core_dEval.v_quote 0) dtb_u_u415))))

# 867 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasHasFieldDecls = (fun (dtb_u_u416 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u416 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u417, dtb_u_u418) -> (match dtb_u_u417 with
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u419, dtb_u_u420, dtb_u_u421, dtb_u_u422, dtb_u_u423) -> (if (dtb_u_u419 = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasHasFieldDecls dtb_u_u418))
  | _ -> (v_hasHasFieldDecls dtb_u_u418)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 875 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_shortRecordMetas = (fun (dtb_u_u424 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) -> (match dtb_u_u424 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u425, dtb_u_u426) -> (if ((Elab_dMeta.v_baseNameOf (dtb_u_u425).Elab_dRecords.f_RecordMeta_recordMetaName) = (dtb_u_u425).Elab_dRecords.f_RecordMeta_recordMetaName) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u425, (v_shortRecordMetas dtb_u_u426))) else (v_shortRecordMetas dtb_u_u426))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 884 "Vuna/Compiler/Elab/Driver.vuna"
let v_hasFieldInstancesOfDecls = (fun (dtb_u_u427 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Elab_dRecords.v_recordHasFieldInstances (v_shortRecordMetas (Elab_dRecords.v_recordsOfDecls dtb_u_u427))))

# 888 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_hasExplicitHasFieldInstance = (fun (dtb_u_u428 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u428 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u429, dtb_u_u430) -> (match dtb_u_u429 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u431, dtb_u_u432, dtb_u_u433, dtb_u_u434) -> (let dtb_u_u435 = dtb_u_u432 in (match dtb_u_u435 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u436, dtb_u_u437) -> (if (dtb_u_u436 = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasExplicitHasFieldInstance dtb_u_u430))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u438, dtb_u_u439, dtb_u_u440) -> (match dtb_u_u438 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u441, dtb_u_u442) -> (if (dtb_u_u441 = Base_dIntrinsics.v_hasFieldTraitName) then true else (v_hasExplicitHasFieldInstance dtb_u_u430))
  | _ -> (v_hasExplicitHasFieldInstance dtb_u_u430)
)
  | _ -> (v_hasExplicitHasFieldInstance dtb_u_u430)
))
  | _ -> (v_hasExplicitHasFieldInstance dtb_u_u430)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Elab/Driver.vuna"
let v_maybeAddHasFieldInstances = (fun (dtb_u_u443 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u444 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (v_hasExplicitHasFieldInstance dtb_u_u444) then dtb_u_u444 else (match ((Elab_dMeta.v_globalLookup Base_dIntrinsics.v_hasFieldGetFieldName) dtb_u_u443) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u445) -> ((B_dData_dList.v_append dtb_u_u444) (v_hasFieldInstancesOfDecls dtb_u_u444))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (v_hasHasFieldDecls dtb_u_u444) then ((B_dData_dList.v_append dtb_u_u444) (v_hasFieldInstancesOfDecls dtb_u_u444)) else dtb_u_u444)
  | _ -> failwith "DT: impossible branch"
)))

# 1087 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findDefByName = (fun (dtb_u_u446 : string) (dtb_u_u447 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match dtb_u_u447 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u448, dtb_u_u449) -> (if ((Elab_dTypes.v_dtDefName dtb_u_u448) = dtb_u_u446) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u448)) else ((v_findDefByName dtb_u_u446) dtb_u_u449))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1094 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainActionOf = (fun (dtb_u_u450 : Core_dTerm.t_Term) -> (match dtb_u_u450 with
  | Core_dTerm.C_Term_TApp (dtb_u_u451, dtb_u_u452, dtb_u_u453) -> (match dtb_u_u451 with
  | Core_dTerm.C_Term_TApp (dtb_u_u454, dtb_u_u455, dtb_u_u456) -> (match dtb_u_u454 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u457) -> (if (dtb_u_u457 = Base_dIntrinsics.v_effTypeName) then { B_dData_dPair.f_Pair_first = "eff"; B_dData_dPair.f_Pair_second = dtb_u_u452 } else { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = dtb_u_u450 })
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = dtb_u_u450 }
)
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = dtb_u_u450 }
)
  | _ -> { B_dData_dPair.f_Pair_first = "other"; B_dData_dPair.f_Pair_second = dtb_u_u450 }
))

# 1102 "Vuna/Compiler/Elab/Driver.vuna"
let v_isNilRowTerm = (fun (dtb_u_u458 : Core_dTerm.t_Term) -> (match dtb_u_u458 with
  | Core_dTerm.C_Term_TCon (dtb_u_u459, dtb_u_u460) -> (match dtb_u_u460 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u459 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u461) -> (dtb_u_u461 = Base_dIntrinsics.v_effRowNilCtor)
  | _ -> false
))

# 1109 "Vuna/Compiler/Elab/Driver.vuna"
let v_isBuiltinHostLabel = (fun (dtb_u_u462 : Core_dTerm.t_Value) -> (match dtb_u_u462 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u463) -> (match dtb_u_u463 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u464, dtb_u_u465) -> (Base_dIntrinsics.v_isBuiltinEffectTag dtb_u_u464)
  | _ -> false
)
  | _ -> false
))

# 1114 "Vuna/Compiler/Elab/Driver.vuna"
let v_builtinHostLabelOf = (fun (dtb_u_u466 : Core_dTerm.t_Value) -> (match dtb_u_u466 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u467) -> (match dtb_u_u467 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u468, dtb_u_u469) -> (if (dtb_u_u468 = Base_dIntrinsics.v_effNamedName) then (let dtb_u_u470 = dtb_u_u469 in (match dtb_u_u470 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u471, dtb_u_u472) -> (match dtb_u_u472 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u473, dtb_u_u474) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u473))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (B_dData_dMaybe.C_Maybe_Just ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u468, dtb_u_u469)))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1124 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_isBuiltinHostRowValue = (fun (dtb_u_u475 : Core_dTerm.t_Value) -> (match dtb_u_u475 with
  | Core_dTerm.C_Value_VCon (dtb_u_u476, dtb_u_u477) -> (if (dtb_u_u476 = Base_dIntrinsics.v_effRowNilCtor) then true else (if (dtb_u_u476 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u478 = dtb_u_u477 in (match dtb_u_u478 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u479, dtb_u_u480) -> (match dtb_u_u480 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u481, dtb_u_u482) -> (match (v_builtinHostLabelOf dtb_u_u479) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u483) -> (if (v_isBuiltinHostLabel dtb_u_u483) then (v_isBuiltinHostRowValue dtb_u_u481) else false)
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
let v_mainEntryRowCheck = (fun (dtb_u_u484 : Elab_dTypes.t_Ec) (dtb_u_u485 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u486 : Base_dSource.t_Span) (dtb_u_u487 : Core_dTerm.t_Term) -> (match dtb_u_u487 with
  | Core_dTerm.C_Term_TApp (dtb_u_u488, dtb_u_u489, dtb_u_u490) -> (match dtb_u_u488 with
  | Core_dTerm.C_Term_TApp (dtb_u_u491, dtb_u_u492, dtb_u_u493) -> (match dtb_u_u491 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u494) -> (if (dtb_u_u494 = Base_dIntrinsics.v_effTypeName) then (let dtb_u_u495 = ((((Core_dEval.v_force (Elab_dTypes.v_ecDefTbl dtb_u_u484)) (Elab_dTypes.v_ecSolsP dtb_u_u484)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u492)) in (let dtb_u_u496 = (((Elab_dTerm_dImpl.v_rowNonDefaultHostEntries 64) dtb_u_u484) dtb_u_u495) in (if ((Elab_dTerm_dImpl.v_isNilRowValue dtb_u_u484) dtb_u_u495) then (Base_dDiag.C_Check_OkC (0)) else (match dtb_u_u496 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u497, dtb_u_u498) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u486) (Base_dDiagnostics_dTc.C_TcErr_EntryInstanceNotDefault ((Elab_dTerm_dImpl.v_joinEffectLabels dtb_u_u496)))) (Elab_dTerm_dImpl.v_joinEffectLabels dtb_u_u496))
  | B_dData_dList.C_List_Nil -> (if (v_isBuiltinHostRowValue dtb_u_u495) then (Base_dDiag.C_Check_OkC (0)) else (match (((Elab_dTerm_dImpl.v_rowEffectLabels 64) dtb_u_u484) dtb_u_u495) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u499) -> (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dList.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) dtb_u_u499) B_dData_dList.C_List_Nil) then (Base_dDiag.C_Check_OkC (0)) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u486) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((Elab_dTerm_dImpl.v_joinEffectLabels dtb_u_u499)))) (Elab_dTerm_dImpl.v_joinEffectLabels dtb_u_u499)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u486) (Base_dDiagnostics_dTc.C_TcErr_UnhandledEffects ((Core_dTerm.v_showTerm dtb_u_u492)))) (Core_dTerm.v_showTerm dtb_u_u492))
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
let v_mainShowBuiltinTy = (fun (dtb_u_u500 : Core_dTerm.t_Value) -> (match dtb_u_u500 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u501) -> (let dtb_u_u502 = dtb_u_u501 in (match dtb_u_u502 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u503, dtb_u_u504) -> (match dtb_u_u504 with
  | B_dData_dList.C_List_Nil -> ((B_dData_dList.v_memName dtb_u_u503) (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_intTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_natTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_strTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_boolTypeName, (B_dData_dList.C_List__x58__x58_ (Base_dIntrinsics.v_floatTypeName, B_dData_dList.C_List_Nil)))))))))))
  | _ -> false
)
  | _ -> false
))
  | _ -> false
))

# 1175 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainHasParams = (fun (dtb_u_u505 : Core_dTerm.t_Term) -> (match dtb_u_u505 with
  | Core_dTerm.C_Term_TPi (dtb_u_u506, dtb_u_u507, dtb_u_u508, dtb_u_u509, dtb_u_u510) -> true
  | _ -> false
))

# 1181 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainArityErr = (fun (dtb_u_u512 : Base_dSource.t_Span) (dtb_u_u513 : Core_dTerm.t_Term) -> (let dtb_u_u514 = (Core_dTerm.v_showTerm dtb_u_u513) in (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u512) (Base_dDiagnostics_dTc.C_TcErr_MainArity (dtb_u_u514))) dtb_u_u514)))

# 1212 "Vuna/Compiler/Elab/Driver.vuna"
let v_matchedBodies = (fun (dtb_u_u515 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u516 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u516) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u517) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u516); B_dData_dPair.f_Pair_second = dtb_u_u517 }, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) dtb_u_u515))

# 1252 "Vuna/Compiler/Elab/Driver.vuna"
let v_mainShowMissing = (fun (dtb_u_u519 : Base_dSource.t_Span) (dtb_u_u520 : Core_dTerm.t_Value) -> (let dtb_u_u521 = (Core_dTerm.v_showTerm ((Core_dEval.v_quote 0) dtb_u_u520)) in (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u519) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb_u_u521))) dtb_u_u521)))

# 1367 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_resolveDictGoalsFixGo = (fun (dtb_u_u522 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u523 : Elab_dTypes.t_Ec) (dtb_u_u524 : int) -> (let dtb_u_u525 = ((Elab_dDict.v_resolveDictGoals dtb_u_u522) dtb_u_u523) in (if (dtb_u_u524 <= 0) then dtb_u_u525 else (if ((Elab_dTypes.v_ecPendingCount dtb_u_u525) < (Elab_dTypes.v_ecPendingCount dtb_u_u523)) then (((v_resolveDictGoalsFixGo dtb_u_u522) dtb_u_u525) (dtb_u_u524 - 1)) else dtb_u_u525))))

# 1361 "Vuna/Compiler/Elab/Driver.vuna"
let v_resolveDictGoalsFix = (fun (dtb_u_u526 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u527 : Elab_dTypes.t_Ec) (dtb_u_u528 : int) -> (match (Elab_dTypes.v_ecPendingList dtb_u_u527) with
  | B_dData_dList.C_List_Nil -> dtb_u_u527
  | _ -> (((v_resolveDictGoalsFixGo dtb_u_u526) dtb_u_u527) dtb_u_u528)
))

# 1414 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_termHasMeta = (fun (dtb_u_u529 : int) (dtb_u_u530 : Core_dTerm.t_Term) -> (match dtb_u_u530 with
  | Core_dTerm.C_Term_TIf (dtb_u_u531, dtb_u_u532, dtb_u_u533) -> (if (if ((v_termHasMeta dtb_u_u529) dtb_u_u531) then true else ((v_termHasMeta dtb_u_u529) dtb_u_u532)) then true else ((v_termHasMeta dtb_u_u529) dtb_u_u533))
  | Core_dTerm.C_Term_TBool (dtb_u_u534) -> false
  | Core_dTerm.C_Term_TFloat (dtb_u_u535) -> false
  | Core_dTerm.C_Term_TStr (dtb_u_u536) -> false
  | Core_dTerm.C_Term_TInt (dtb_u_u537) -> false
  | Core_dTerm.C_Term_TCase (dtb_u_u538, dtb_u_u539) -> (if ((v_termHasMeta dtb_u_u529) dtb_u_u538) then true else ((v_anyAltHasMeta dtb_u_u529) dtb_u_u539))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u540, dtb_u_u541, dtb_u_u542, dtb_u_u543, dtb_u_u544) -> (if ((v_termHasMeta dtb_u_u529) dtb_u_u540) then true else ((v_termHasMeta dtb_u_u529) dtb_u_u544))
  | Core_dTerm.C_Term_TProj (dtb_u_u545, dtb_u_u546, dtb_u_u547, dtb_u_u548, dtb_u_u549) -> ((v_termHasMeta dtb_u_u529) dtb_u_u545)
  | Core_dTerm.C_Term_TRecord (dtb_u_u550, dtb_u_u551) -> ((v_anyArgHasMeta dtb_u_u529) dtb_u_u551)
  | Core_dTerm.C_Term_TMk (dtb_u_u552, dtb_u_u553) -> ((v_anyArgHasMeta dtb_u_u529) dtb_u_u553)
  | Core_dTerm.C_Term_TCon (dtb_u_u554, dtb_u_u555) -> ((v_anyArgHasMeta dtb_u_u529) dtb_u_u555)
  | Core_dTerm.C_Term_TApp (dtb_u_u556, dtb_u_u557, dtb_u_u558) -> (if ((v_termHasMeta dtb_u_u529) dtb_u_u556) then true else ((v_termHasMeta dtb_u_u529) dtb_u_u557))
  | Core_dTerm.C_Term_TLam (dtb_u_u559, dtb_u_u560, dtb_u_u561, dtb_u_u562, dtb_u_u563) -> (let dtb_u_u564 = (let dtb_u_u565 = dtb_u_u561 in (match dtb_u_u565 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u566) -> (match dtb_u_u566 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u567; B_dData_dPair.f_Pair_second = dtb_u_u568 } -> (match dtb_u_u568 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u569; B_dData_dPair.f_Pair_second = dtb_u_u570 } -> (if ((v_termHasMetaMaybe dtb_u_u529) dtb_u_u569) then true else ((v_termHasMetaMaybe dtb_u_u529) dtb_u_u570))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u564 then true else ((v_termHasMeta dtb_u_u529) dtb_u_u563)))
  | Core_dTerm.C_Term_TPi (dtb_u_u571, dtb_u_u572, dtb_u_u573, dtb_u_u574, dtb_u_u575) -> (if ((v_termHasMeta dtb_u_u529) dtb_u_u574) then true else ((v_termHasMeta dtb_u_u529) dtb_u_u575))
  | Core_dTerm.C_Term_TType (dtb_u_u576) -> false
  | Core_dTerm.C_Term_TGlobal (dtb_u_u577) -> false
  | Core_dTerm.C_Term_TVar (dtb_u_u578, dtb_u_u579, dtb_u_u580) -> false
  | Core_dTerm.C_Term_TMeta (dtb_u_u581) -> (dtb_u_u581 = dtb_u_u529)
  | _ -> failwith "DT: impossible branch"
))
# 1440 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyArgHasMeta = (fun (dtb_u_u582 : int) (dtb_u_u583 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u583 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u584, dtb_u_u585) -> (match dtb_u_u584 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u586; B_dData_dPair.f_Pair_second = dtb_u_u587 } -> (if ((v_termHasMeta dtb_u_u582) dtb_u_u586) then true else ((v_anyArgHasMeta dtb_u_u582) dtb_u_u585))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1444 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyAltHasMeta = (fun (dtb_u_u588 : int) (dtb_u_u589 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u589 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u590, dtb_u_u591) -> (if ((v_termHasMeta dtb_u_u588) (Core_dTerm.v_caseAltBody dtb_u_u590)) then true else ((v_anyAltHasMeta dtb_u_u588) dtb_u_u591))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1448 "Vuna/Compiler/Elab/Driver.vuna"
and v_termHasMetaMaybe = (fun (dtb_u_u592 : int) (dtb_u_u593 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u593 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u594) -> ((v_termHasMeta dtb_u_u592) dtb_u_u594)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1409 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findDefWithMeta = (fun (dtb_u_u595 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u596 : int) -> (match dtb_u_u595 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u597, dtb_u_u598) -> (match dtb_u_u597 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u599; B_dData_dPair.f_Pair_second = dtb_u_u600 } -> (if ((v_termHasMeta dtb_u_u596) dtb_u_u600) then (B_dData_dMaybe.C_Maybe_Just ((String.concat "" [dtb_u_u599; " body="; (Core_dTerm.v_showTerm dtb_u_u600)]))) else ((v_findDefWithMeta dtb_u_u598) dtb_u_u596))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1403 "Vuna/Compiler/Elab/Driver.vuna"
let v_metaOwnerHint = (fun (dtb_u_u601 : Elab_dTypes.t_Ec) (dtb_u_u602 : int) -> (match ((v_findDefWithMeta (Elab_dTypes.v_ecDefs dtb_u_u601)) dtb_u_u602) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u603) -> (String.concat "" [" (in `"; dtb_u_u603; "`)"])
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1454 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_termHasAnyMeta = (fun (dtb_u_u604 : Core_dTerm.t_Term) -> (match dtb_u_u604 with
  | Core_dTerm.C_Term_TIf (dtb_u_u605, dtb_u_u606, dtb_u_u607) -> (if (if (v_termHasAnyMeta dtb_u_u605) then true else (v_termHasAnyMeta dtb_u_u606)) then true else (v_termHasAnyMeta dtb_u_u607))
  | Core_dTerm.C_Term_TBool (dtb_u_u608) -> false
  | Core_dTerm.C_Term_TFloat (dtb_u_u609) -> false
  | Core_dTerm.C_Term_TStr (dtb_u_u610) -> false
  | Core_dTerm.C_Term_TInt (dtb_u_u611) -> false
  | Core_dTerm.C_Term_TCase (dtb_u_u612, dtb_u_u613) -> (if (v_termHasAnyMeta dtb_u_u612) then true else (v_anyAltHasAnyMeta dtb_u_u613))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u614, dtb_u_u615, dtb_u_u616, dtb_u_u617, dtb_u_u618) -> (if (v_termHasAnyMeta dtb_u_u614) then true else (v_termHasAnyMeta dtb_u_u618))
  | Core_dTerm.C_Term_TProj (dtb_u_u619, dtb_u_u620, dtb_u_u621, dtb_u_u622, dtb_u_u623) -> (v_termHasAnyMeta dtb_u_u619)
  | Core_dTerm.C_Term_TRecord (dtb_u_u624, dtb_u_u625) -> (v_anyArgHasAnyMeta dtb_u_u625)
  | Core_dTerm.C_Term_TMk (dtb_u_u626, dtb_u_u627) -> (v_anyArgHasAnyMeta dtb_u_u627)
  | Core_dTerm.C_Term_TCon (dtb_u_u628, dtb_u_u629) -> (v_anyArgHasAnyMeta dtb_u_u629)
  | Core_dTerm.C_Term_TApp (dtb_u_u630, dtb_u_u631, dtb_u_u632) -> (if (v_termHasAnyMeta dtb_u_u630) then true else (v_termHasAnyMeta dtb_u_u631))
  | Core_dTerm.C_Term_TLam (dtb_u_u633, dtb_u_u634, dtb_u_u635, dtb_u_u636, dtb_u_u637) -> (let dtb_u_u638 = (let dtb_u_u639 = dtb_u_u635 in (match dtb_u_u639 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u640) -> (match dtb_u_u640 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u641; B_dData_dPair.f_Pair_second = dtb_u_u642 } -> (match dtb_u_u642 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u643; B_dData_dPair.f_Pair_second = dtb_u_u644 } -> (if (v_termHasAnyMetaMaybe dtb_u_u643) then true else (v_termHasAnyMetaMaybe dtb_u_u644))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u638 then true else (v_termHasAnyMeta dtb_u_u637)))
  | Core_dTerm.C_Term_TPi (dtb_u_u645, dtb_u_u646, dtb_u_u647, dtb_u_u648, dtb_u_u649) -> (if (v_termHasAnyMeta dtb_u_u648) then true else (v_termHasAnyMeta dtb_u_u649))
  | Core_dTerm.C_Term_TType (dtb_u_u650) -> false
  | Core_dTerm.C_Term_TGlobal (dtb_u_u651) -> false
  | Core_dTerm.C_Term_TVar (dtb_u_u652, dtb_u_u653, dtb_u_u654) -> false
  | Core_dTerm.C_Term_TMeta (dtb_u_u655) -> true
  | _ -> failwith "DT: impossible branch"
))
# 1480 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyArgHasAnyMeta = (fun (dtb_u_u656 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u656 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u657, dtb_u_u658) -> (match dtb_u_u657 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u659; B_dData_dPair.f_Pair_second = dtb_u_u660 } -> (if (v_termHasAnyMeta dtb_u_u659) then true else (v_anyArgHasAnyMeta dtb_u_u658))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1484 "Vuna/Compiler/Elab/Driver.vuna"
and v_anyAltHasAnyMeta = (fun (dtb_u_u661 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u661 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u662, dtb_u_u663) -> (if (v_termHasAnyMeta (Core_dTerm.v_caseAltBody dtb_u_u662)) then true else (v_anyAltHasAnyMeta dtb_u_u663))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1488 "Vuna/Compiler/Elab/Driver.vuna"
and v_termHasAnyMetaMaybe = (fun (dtb_u_u664 : Core_dTerm.t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u664 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u665) -> (v_termHasAnyMeta dtb_u_u665)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabOneDef = (fun (dtb_u_u666 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u667 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u668 : string) (dtb_u_u669 : Core_dTerm.t_Term) (dtb_u_u670 : Base_dSource.t_Span) (dtb_u_u671 : Elab_dTypes.t_Ec) -> (let dtb_u_u672 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Driver") ("DEF " ^ dtb_u_u668)) else 0) in (let dtb_u_u673 = (Elab_dTypes.v_ecNextConstraintId dtb_u_u671) in ((Base_dCommon.v_bind (((Base_dObs.v_obsDefCheck "vuna.def.elab") dtb_u_u668) (fun (dtb_u_u674 : int) -> (((((Elab_dTrait.v_elabFunDef dtb_u_u667) dtb_u_u671) (((v_clausesOfTbl dtb_u_u671) dtb_u_u666) dtb_u_u668)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u669)) dtb_u_u670)))) (fun (dtb_u_u675 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (let dtb_u_u676 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Driver") ("FUN " ^ dtb_u_u668)) else 0) in ((Base_dObs.v_obsCheck "vuna.elab.post") (fun (dtb_u_u677 : int) -> (match dtb_u_u675 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u678; B_dData_dPair.f_Pair_second = dtb_u_u679 } -> (let dtb_u_u680 = (((v_solveDeclaredDictGoals dtb_u_u679) dtb_u_u669) dtb_u_u678) in (let dtb_u_u681 = (B_dData_dPair.v_firstOf dtb_u_u680) in (let dtb_u_u682 = (B_dData_dPair.v_secondOf dtb_u_u680) in (let dtb_u_u683 = (((((Elab_dTrait.v_liftFreeDictGoals dtb_u_u668) dtb_u_u673) dtb_u_u682) dtb_u_u669) dtb_u_u681) in (let dtb_u_u684 = (B_dData_dPair.v_firstOf dtb_u_u683) in (let dtb_u_u685 = (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u683)) in (let dtb_u_u686 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u683)) in (let dtb_u_u687 = (if (v_termHasAnyMeta dtb_u_u685) then ((Elab_dDict.v_substDictTerm dtb_u_u686) dtb_u_u685) else dtb_u_u685) in (let dtb_u_u688 = ((Elab_dTypes.v_ecPutGlobalsTbl dtb_u_u686) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u668) dtb_u_u684) (Elab_dTypes.v_ecGlobalsTbl dtb_u_u686))) in (let dtb_u_u689 = ((Elab_dTypes.v_ecAddDef dtb_u_u688) { B_dData_dPair.f_Pair_first = dtb_u_u668; B_dData_dPair.f_Pair_second = dtb_u_u687 }) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.C_DtDef_DtDef (dtb_u_u668, dtb_u_u684, dtb_u_u687, (B_dData_dMaybe.C_Maybe_Just (dtb_u_u670)))); B_dData_dPair.f_Pair_second = dtb_u_u689 }))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 407 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_resumeBodies = (fun (dtb_u_u690 : bool) (dtb_u_u691 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u692 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u693 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u694 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u695 : Elab_dTypes.t_Ec) (dtb_u_u696 : Base_dDiag.t_Diagnostic) -> (if dtb_u_u690 then ((((((v_elabBodies dtb_u_u690) dtb_u_u691) dtb_u_u692) dtb_u_u693) dtb_u_u694) ((Elab_dTypes.v_ecAddError dtb_u_u695) dtb_u_u696)) else (Base_dDiag.C_Check_ErrC (dtb_u_u696))))
# 414 "Vuna/Compiler/Elab/Driver.vuna"
and v_elabBodies = (fun (dtb_u_u697 : bool) (dtb_u_u698 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u699 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u700 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u701 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u702 : Elab_dTypes.t_Ec) -> (match dtb_u_u698 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u703, dtb_u_u704) -> (match dtb_u_u703 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u705, dtb_u_u706, dtb_u_u707, dtb_u_u708) -> (match (((Elab_dMeta.v_globalsLookup dtb_u_u705) dtb_u_u699) dtb_u_u702) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u708)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb_u_u705))) dtb_u_u705) with
  | Base_dDiag.C_Check_OkC (dtb_u_u709) -> ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702)
  | Base_dDiag.C_Check_ErrC (dtb_u_u710) -> (((((((v_resumeBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702) dtb_u_u710)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u711) -> (if ((v_defAlreadyDone dtb_u_u705) dtb_u_u702) then ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702) else (match ((((((v_elabOneDef (B_dData_dList.C_List__x58__x58_ (dtb_u_u703, dtb_u_u704))) dtb_u_u699) dtb_u_u705) dtb_u_u711) (Frontend_dAst.v_nodeRefSpan dtb_u_u708)) dtb_u_u702) with
  | Base_dDiag.C_Check_OkC (dtb_u_u712) -> (match dtb_u_u712 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u713; B_dData_dPair.f_Pair_second = dtb_u_u714 } -> ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u705; B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDefType dtb_u_u713) }, dtb_u_u700))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u713, dtb_u_u701))) dtb_u_u714)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u715) -> (((((((v_resumeBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702) dtb_u_u715)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u716, dtb_u_u717, dtb_u_u718) -> (if ((B_dData_dString.v_startsWith "vuna_seal_") dtb_u_u716) then (let dtb_u_u719 = (((dtp_substring 10) ((String.length dtb_u_u716) - 10)) dtb_u_u716) in ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) ((Elab_dTypes.v_ecRemoveDefTbl dtb_u_u719) dtb_u_u702))) else (match (((Elab_dMeta.v_globalsLookup dtb_u_u716) dtb_u_u699) dtb_u_u702) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u718)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb_u_u716))) dtb_u_u716) with
  | Base_dDiag.C_Check_OkC (dtb_u_u720) -> ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702)
  | Base_dDiag.C_Check_ErrC (dtb_u_u721) -> (((((((v_resumeBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702) dtb_u_u721)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u722) -> ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtAxiom (dtb_u_u716, dtb_u_u722, (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u718))))), dtb_u_u701))) dtb_u_u702)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u723, dtb_u_u724, dtb_u_u725, dtb_u_u726) -> (match (((Elab_dMeta.v_globalsLookup dtb_u_u723) dtb_u_u699) dtb_u_u702) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u726)) (Base_dDiagnostics_dTc.C_TcErr_ExpectedSignature (dtb_u_u723))) dtb_u_u723) with
  | Base_dDiag.C_Check_OkC (dtb_u_u727) -> ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702)
  | Base_dDiag.C_Check_ErrC (dtb_u_u728) -> (((((((v_resumeBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702) dtb_u_u728)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u729) -> (match ((v_checkExternTy (Frontend_dAst.v_nodeRefSpan dtb_u_u726)) dtb_u_u729) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u730) -> (((((((v_resumeBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702) dtb_u_u730)
  | Base_dDiag.C_Check_OkC (dtb_u_u731) -> ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) (B_dData_dList.C_List__x58__x58_ ((Elab_dTypes.C_DtDef_DtExtern (dtb_u_u723, dtb_u_u729, dtb_u_u724, (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u726))))), dtb_u_u701))) dtb_u_u702)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((v_elabBodies dtb_u_u697) dtb_u_u704) dtb_u_u699) dtb_u_u700) dtb_u_u701) dtb_u_u702)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u701); B_dData_dPair.f_Pair_second = dtb_u_u702 }))
  | _ -> failwith "DT: impossible branch"
))

# 1350 "Vuna/Compiler/Elab/Driver.vuna"
let v_rezonkDefs = (fun (dtb_u_u732 : Elab_dTypes.t_Ec) (dtb_u_u733 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u734 : Elab_dTypes.t_DtDef) -> (match (Elab_dTypes.v_dtDefBody dtb_u_u734) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u735) -> (if (v_termHasAnyMeta dtb_u_u735) then (Elab_dTypes.C_DtDef_DtDef ((Elab_dTypes.v_dtDefName dtb_u_u734), (Elab_dTypes.v_dtDefType dtb_u_u734), ((Elab_dDict.v_substDictTerm dtb_u_u732) dtb_u_u735), (Elab_dTypes.v_dtDefSpan dtb_u_u734))) else dtb_u_u734)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u734
  | _ -> failwith "DT: impossible branch"
))) dtb_u_u733))

# 998 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramCoreWithAux = (fun (dtb_u_u736 : bool) (dtb_u_u737 : Elab_dTypes.t_Ec) (dtb_u_u738 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u739 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dtb_u_u740 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.collectsigs") (fun (dtb_u_u741 : int) -> (Elab_dMeta.v_collectSigs dtb_u_u740)))) (fun (dtb_u_u742 : (string, (Frontend_dAst.t_Expr B_dData_dList.t_List, (Frontend_dAst.t_Expr, Base_dSource.t_Span) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u743 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "collectSigs-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.datas") (fun (dtb_u_u744 : int) -> ((((Elab_dData.v_elabDatas ((Elab_dMeta.v_collectDataDecls dtb_u_u740) B_dData_dList.C_List_Nil)) dtb_u_u739) dtb_u_u738) dtb_u_u737)))) (fun (dtb_u_u745 : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u746 = dtb_u_u745 in (match dtb_u_u746 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u747; B_dData_dPair.f_Pair_second = dtb_u_u748 } -> (match dtb_u_u748 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u749; B_dData_dPair.f_Pair_second = dtb_u_u750 } -> (let dtb_u_u751 = ((Elab_dTypes.v_ecPutCtorTbl dtb_u_u750) (Elab_dTypes.v_ctorTblOfDatas (Elab_dTypes.v_ecDatas dtb_u_u750))) in (let dtb_u_u752 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "datas-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.traits") (fun (dtb_u_u753 : int) -> (((Elab_dTrait.v_elabTraits ((Elab_dMeta.v_collectTraitDecls dtb_u_u740) B_dData_dList.C_List_Nil)) dtb_u_u749) dtb_u_u751)))) (fun (dtb_u_u754 : (Elab_dTypes.t_DtData B_dData_dList.t_List, ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, (Elab_dTypes.t_DtClass B_dData_dList.t_List, ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u755 = dtb_u_u754 in (match dtb_u_u755 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u756; B_dData_dPair.f_Pair_second = dtb_u_u757 } -> (match dtb_u_u757 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u758; B_dData_dPair.f_Pair_second = dtb_u_u759 } -> (match dtb_u_u759 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u760; B_dData_dPair.f_Pair_second = dtb_u_u761 } -> (match dtb_u_u761 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u762; B_dData_dPair.f_Pair_second = dtb_u_u763 } -> (let dtb_u_u764 = ((B_dData_dList.v_append dtb_u_u749) dtb_u_u758) in (let dtb_u_u765 = ((B_dData_dList.v_append dtb_u_u747) dtb_u_u756) in (let dtb_u_u766 = (Elab_dTypes.v_ecClasses dtb_u_u763) in (let dtb_u_u767 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "traits-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.instheads") (fun (dtb_u_u768 : int) -> ((((Elab_dTrait.v_checkInstanceHeads ((Elab_dMeta.v_collectInstDecls dtb_u_u740) B_dData_dList.C_List_Nil)) dtb_u_u766) dtb_u_u764) dtb_u_u763)))) (fun (dtb_u_u769 : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u769 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u770; B_dData_dPair.f_Pair_second = dtb_u_u771 } -> (let dtb_u_u772 = ((B_dData_dList.v_append dtb_u_u764) dtb_u_u770) in (let dtb_u_u773 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "instheads-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.sigs") (fun (dtb_u_u774 : int) -> (((v_elabSigs dtb_u_u742) dtb_u_u772) dtb_u_u771)))) (fun (dtb_u_u775 : ((string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u775 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u776; B_dData_dPair.f_Pair_second = dtb_u_u777 } -> (let dtb_u_u778 = ((Elab_dTypes.v_ecPutClausesTbl ((Elab_dTypes.v_ecSetGlobalsComplete ((Elab_dTypes.v_ecPutGlobalsTbl dtb_u_u777) (Elab_dMeta.v_globalsTableOf dtb_u_u776))) true)) (v_clausesTblOf dtb_u_u740)) in (let dtb_u_u779 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "sigs-elab-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.defined") (fun (dtb_u_u780 : int) -> (((v_checkAllDefined dtb_u_u742) dtb_u_u776) dtb_u_u740)))) (fun (dtb_u_u781 : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.bodies") (fun (dtb_u_u782 : int) -> ((((((v_elabBodies dtb_u_u736) dtb_u_u740) dtb_u_u776) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u778)))) (fun (dtb_u_u783 : (Elab_dTypes.t_DtDef B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u783 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u784; B_dData_dPair.f_Pair_second = dtb_u_u785 } -> (let dtb_u_u786 = ((Base_dObs.v_obsPure "vuna.elab.dictfix") (fun (dtb_u_u800 : int) -> (((v_resolveDictGoalsFix dtb_u_u776) dtb_u_u785) 8))) in (let dtb_u_u787 = ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (dtb_u_u799 : int) -> ((v_rezonkDefs dtb_u_u786) dtb_u_u784))) in (let dtb_u_u788 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") (String.concat "" ["bodies-done g="; (string_of_int (B_dData_dList.v_length dtb_u_u776)); " sols="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecSols dtb_u_u785))); " defs="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecDefs dtb_u_u785))); " metas="; (string_of_int (Elab_dTypes.v_ecNext dtb_u_u785)); " dgoals="; (string_of_int (Elab_dTypes.v_ecPendingCount dtb_u_u785)); " datas="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecDatas dtb_u_u785))); " insts="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecInstList dtb_u_u785))); " classes="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecClasses dtb_u_u785))); " counters="; (v_showCounters (Elab_dTypes.v_ecCounters dtb_u_u785))])) else 0) in (let dtb_u_u789 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Driver") (if (Elab_dTypes.v_ecInstsAudit dtb_u_u785) then "inst-index=ok" else "inst-index=MISMATCH")) else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.instbodies") (fun (dtb_u_u790 : int) -> ((((((Elab_dTrait.v_elabInstanceBodies dtb_u_u736) dtb_u_u740) dtb_u_u766) dtb_u_u765) dtb_u_u776) dtb_u_u786)))) (fun (dtb_u_u791 : (Elab_dTypes.t_DtDef B_dData_dList.t_List, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (match dtb_u_u791 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u792; B_dData_dPair.f_Pair_second = dtb_u_u793 } -> (let dtb_u_u794 = ((Base_dObs.v_obsPure "vuna.elab.dictfix") (fun (dtb_u_u798 : int) -> (((v_resolveDictGoalsFix dtb_u_u776) dtb_u_u793) 8))) in (let dtb_u_u795 = ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (dtb_u_u797 : int) -> ((v_rezonkDefs dtb_u_u794) dtb_u_u792))) in (let dtb_u_u796 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "instbodies-done") else 0) in (Base_dDiag.C_Check_OkC ({ f_ElabCore_coreDatas = dtb_u_u765; f_ElabCore_coreEc = dtb_u_u794; f_ElabCore_coreDefs = dtb_u_u787; f_ElabCore_coreInstDefs = dtb_u_u795; f_ElabCore_coreGlobals = dtb_u_u776; f_ElabCore_coreProjSpans = dtb_u_u762 })))))
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
let v_synthMainShowGo = (fun (dtb_u_u801 : Elab_dTypes.t_Ec) (dtb_u_u802 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u803 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u804 : Base_dSource.t_Span) (dtb_u_u805 : Core_dTerm.t_Value) -> (match ((Elab_dDict.v_findClass "Base.Trait.Show.Show") (Elab_dTypes.v_ecClasses dtb_u_u801)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mainShowMissing dtb_u_u804) dtb_u_u805)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u806) -> (let dtb_u_u807 = ((Elab_dPrelude.v_classMethodProjection (dtb_u_u806).Elab_dTypes.f_DtClass_dtClassMethods) "show") in (let dtb_u_u808 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u806)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u805, B_dData_dList.C_List_Nil)))))) in (let dtb_u_u809 = (((((Elab_dDict.v_searchInstanceIn dtb_u_u802) Elab_dTypes.v_emptyCtx) dtb_u_u801) dtb_u_u808) dtb_u_u804) in (match dtb_u_u809 with
  | Base_dDiag.C_Check_OkC (dtb_u_u810) -> (match dtb_u_u810 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u811; B_dData_dPair.f_Pair_second = dtb_u_u812 } -> (let dtb_u_u813 = ((Core_dEval.v_quote 0) dtb_u_u805) in (let dtb_u_u814 = (Core_dTerm.C_Term_TLam ("x", Core_dTerm.C_Rig_Rig1, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u807)), dtb_u_u813, Core_dTerm.C_Rig_Rig0)), dtb_u_u811, Core_dTerm.C_Rig_RigOmega)), (Core_dTerm.C_Term_TVar ("x", 0, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })), Core_dTerm.C_Rig_Rig1)))) in (let dtb_u_u815 = (Elab_dTypes.C_DtDef_DtDef (Base_dIntrinsics.v_mainShowDefName, (Core_dTerm.C_Term_TPi ("x", false, Core_dTerm.C_Rig_Rig1, dtb_u_u813, (Core_dTerm.C_Term_TGlobal (Base_dIntrinsics.v_strTypeName)))), dtb_u_u814, (B_dData_dMaybe.C_Maybe_Just (dtb_u_u804)))) in (Base_dDiag.C_Check_OkC (((v_rezonkDefs dtb_u_u801) ((B_dData_dList.v_append dtb_u_u803) (B_dData_dList.C_List__x58__x58_ (dtb_u_u815, B_dData_dList.C_List_Nil)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u816) -> ((v_mainShowMissing dtb_u_u804) dtb_u_u805)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 1221 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShowInner = (fun (dtb_u_u817 : Elab_dTypes.t_Ec) (dtb_u_u818 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u819 : Elab_dTypes.t_DtDef B_dData_dList.t_List) (dtb_u_u820 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u821 : Base_dSource.t_Span) (dtb_u_u822 : Core_dTerm.t_Term) (dtb_u_u823 : string) -> (let dtb_u_u824 = ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u820)) (Elab_dTypes.v_ecSolsP dtb_u_u817)) Core_dTerm.v_defaultFuel) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u822)) in (let dtb_u_u825 = ((Core_dEval.v_quote 0) dtb_u_u824) in (if (v_mainShowBuiltinTy dtb_u_u824) then (Base_dDiag.C_Check_OkC (dtb_u_u819)) else (((((v_synthMainShowGo dtb_u_u817) dtb_u_u818) dtb_u_u819) dtb_u_u821) dtb_u_u824)))))

# 1189 "Vuna/Compiler/Elab/Driver.vuna"
let v_synthMainShow = (fun (dtb_u_u826 : Elab_dTypes.t_Ec) (dtb_u_u827 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u828 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (match ((v_findDefByName "main") dtb_u_u828) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u828))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u829) -> (let dtb_u_u830 = (match (Elab_dTypes.v_dtDefSpan dtb_u_u829) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u837) -> dtb_u_u837
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u831 = (Elab_dTypes.v_dtDefType dtb_u_u829) in (let dtb_u_u832 = (v_matchedBodies dtb_u_u828) in (let dtb_u_u833 = (v_mainActionOf dtb_u_u831) in (let dtb_u_u834 = (B_dData_dPair.v_secondOf dtb_u_u833) in (let dtb_u_u835 = (B_dData_dPair.v_firstOf dtb_u_u833) in (if (v_mainHasParams dtb_u_u834) then ((v_mainArityErr dtb_u_u830) dtb_u_u834) else ((Base_dCommon.v_bind ((((v_mainEntryRowCheck dtb_u_u826) dtb_u_u827) dtb_u_u830) dtb_u_u831)) (fun (dtb_u_u836 : int) -> (((((((v_synthMainShowInner dtb_u_u826) dtb_u_u827) dtb_u_u828) dtb_u_u832) dtb_u_u830) dtb_u_u834) dtb_u_u835))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1493 "Vuna/Compiler/Elab/Driver.vuna"
let v_ctxDepthOf = (fun (dtb_u_u838 : Elab_dTypes.t_DtGoal) -> (B_dData_dList.v_length (dtb_u_u838).Elab_dTypes.f_DtGoal_dtGoalCtx))

# 1496 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_findGoal = (fun (dtb_u_u839 : int) (dtb_u_u840 : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (match dtb_u_u840 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u841, dtb_u_u842) -> (if ((dtb_u_u841).Elab_dTypes.f_DtGoal_dtGoalMeta = dtb_u_u839) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u841)) else ((v_findGoal dtb_u_u839) dtb_u_u842))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_unsolvedFromRelevantGo = (fun (dtb_u_u843 : int) (dtb_u_u844 : int) (dtb_u_u845 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u846 : int B_dData_dList.t_List) (dtb_u_u847 : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (if (dtb_u_u843 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u848 = (dtb_u_u844 - dtb_u_u843) in (match ((Core_dTerm.v_metaLookup dtb_u_u848) dtb_u_u845) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u849) -> (((((v_unsolvedFromRelevantGo (dtb_u_u843 - 1)) dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u847)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((Elab_dMeta.v_memMetaId dtb_u_u848) dtb_u_u846) then true else (B_dData_dMaybe.v_isJust ((v_findGoal dtb_u_u848) dtb_u_u847))) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u848)) else (((((v_unsolvedFromRelevantGo (dtb_u_u843 - 1)) dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u847))
  | _ -> failwith "DT: impossible branch"
))))

# 58 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedFromRelevant = (fun (dtb_u_u850 : int) (dtb_u_u851 : int) (dtb_u_u852 : (int, Core_dTerm.t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u853 : int B_dData_dList.t_List) (dtb_u_u854 : Elab_dTypes.t_DtGoal B_dData_dList.t_List) -> (((((v_unsolvedFromRelevantGo (dtb_u_u851 - dtb_u_u850)) dtb_u_u851) dtb_u_u852) dtb_u_u853) dtb_u_u854))

# 51 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedMeta = (fun (dtb_u_u855 : Elab_dTypes.t_Ec) -> (((((v_unsolvedFromRelevant 0) (Elab_dTypes.v_ecNext dtb_u_u855)) (Elab_dTypes.v_ecSolTbl dtb_u_u855)) (Elab_dMeta.v_relevantMetas dtb_u_u855)) (Elab_dTypes.v_ecGoals dtb_u_u855)))

# 1517 "Vuna/Compiler/Elab/Driver.vuna"
let v_zonkGoal = (fun (dtb_u_u856 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u857 : Core_dTerm.t_Value) -> ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) (Core_dTerm.v_solsFromList dtb_u_u856)) Core_dTerm.v_defaultFuel) dtb_u_u857))

# 1524 "Vuna/Compiler/Elab/Driver.vuna"
let[@tail_mod_cons] rec v_ctxEntriesAt = (fun (dtb_u_u858 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u859 : int) (dtb_u_u860 : int) -> (match dtb_u_u858 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u861, dtb_u_u862) -> (match dtb_u_u861 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u863; B_dData_dPair.f_Pair_second = dtb_u_u864 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u863; B_dData_dPair.f_Pair_second = ((Core_dEval.v_showValueAt dtb_u_u860) ((Core_dEval.v_eval (((Elab_dTypes.v_ctxEnvAt (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u863; B_dData_dPair.f_Pair_second = dtb_u_u864 }, dtb_u_u862))) 0) dtb_u_u860)) (((Core_dTerm.v_shift 0) (dtb_u_u859 + 1)) dtb_u_u864))) }, (((v_ctxEntriesAt dtb_u_u862) (dtb_u_u859 + 1)) dtb_u_u860)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1521 "Vuna/Compiler/Elab/Driver.vuna"
let v_ctxEntriesOf = (fun (dtb_u_u865 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (((v_ctxEntriesAt dtb_u_u865) 0) (B_dData_dList.v_length dtb_u_u865)))

# 1508 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalInfoOf = (fun (dtb_u_u866 : (int, Core_dTerm.t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u867 : Elab_dTypes.t_DtGoal) -> { f_DtGoalInfo_dtGoalInfoSpan = (dtb_u_u867).Elab_dTypes.f_DtGoal_dtGoalSpan; f_DtGoalInfo_dtGoalInfoGoal = ((Core_dEval.v_showValueAt (v_ctxDepthOf dtb_u_u867)) ((v_zonkGoal dtb_u_u866) (dtb_u_u867).Elab_dTypes.f_DtGoal_dtGoalType)); f_DtGoalInfo_dtGoalInfoCtx = (v_ctxEntriesOf (dtb_u_u867).Elab_dTypes.f_DtGoal_dtGoalCtx); f_DtGoalInfo_dtGoalInfoName = (dtb_u_u867).Elab_dTypes.f_DtGoal_dtGoalName })

# 1539 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalsOfProgramTolerant = (fun (dtb_u_u868 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls dtb_u_u868)) (fun (dtb_u_u869 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u869 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u870; B_dData_dPair.f_Pair_second = dtb_u_u871 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb_u_u871)) (fun (dtb_u_u872 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb_u_u870) dtb_u_u872)) (fun (dtb_u_u873 : t_ElabCore) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_ecSols (dtb_u_u873).f_ElabCore_coreEc))) (Elab_dTypes.v_ecGoals (dtb_u_u873).f_ElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1550 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabGoalsWithPrepared = (fun (dtb_u_u874 : Elab_dTypes.t_Ec) (dtb_u_u875 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u876 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u877 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Elab_dRecords.v_prepareDeclsWith dtb_u_u876) ((v_maybeAddHasFieldInstances dtb_u_u875) dtb_u_u877))) (fun (dtb_u_u878 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u878 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u879; B_dData_dPair.f_Pair_second = dtb_u_u880 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb_u_u880)) (fun (dtb_u_u881 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) dtb_u_u874) dtb_u_u875) dtb_u_u879) dtb_u_u881)) (fun (dtb_u_u882 : t_ElabCore) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_ecSols (dtb_u_u882).f_ElabCore_coreEc))) (Elab_dTypes.v_ecGoals (dtb_u_u882).f_ElabCore_coreEc))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1583 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addDatasEc = (fun (dtb_u_u883 : Elab_dTypes.t_Ec) (dtb_u_u884 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u884 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u885, dtb_u_u886) -> ((v_addDatasEc ((Elab_dTypes.v_ecAddData dtb_u_u883) dtb_u_u885)) dtb_u_u886)
  | B_dData_dList.C_List_Nil -> dtb_u_u883
  | _ -> failwith "DT: impossible branch"
))

# 1587 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addInstsEc = (fun (dtb_u_u887 : Elab_dTypes.t_Ec) (dtb_u_u888 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u888 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u889, dtb_u_u890) -> ((v_addInstsEc ((Elab_dTypes.v_ecAddInst dtb_u_u887) dtb_u_u889)) dtb_u_u890)
  | B_dData_dList.C_List_Nil -> dtb_u_u887
  | _ -> failwith "DT: impossible branch"
))

# 1591 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_addClassesEc = (fun (dtb_u_u891 : Elab_dTypes.t_Ec) (dtb_u_u892 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match dtb_u_u892 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u893, dtb_u_u894) -> ((v_addClassesEc ((Elab_dTypes.v_ecAddClass dtb_u_u891) dtb_u_u893)) dtb_u_u894)
  | B_dData_dList.C_List_Nil -> dtb_u_u891
  | _ -> failwith "DT: impossible branch"
))

# 1570 "Vuna/Compiler/Elab/Driver.vuna"
let v_ecOfProgram = (fun (dtb_u_u895 : Elab_dTypes.t_DtProgram) -> (let dtb_u_u896 = Elab_dTypes.v_ecEmpty in (let dtb_u_u897 = ((v_addDatasEc dtb_u_u896) (Elab_dTypes.v_dtProgDatas dtb_u_u895)) in (let dtb_u_u898 = ((v_addInstsEc dtb_u_u897) (Elab_dTypes.v_dtProgInsts dtb_u_u895)) in (let dtb_u_u899 = ((v_addClassesEc dtb_u_u898) (Elab_dTypes.v_dtProgClasses dtb_u_u895)) in (let dtb_u_u900 = ((Elab_dTypes.v_ecPutCtorTbl dtb_u_u899) (Elab_dTypes.v_ctorTblOfDatas (Elab_dTypes.v_dtProgDatas dtb_u_u895))) in (let dtb_u_u901 = ((Elab_dTypes.v_ecPutSols dtb_u_u900) (Elab_dTypes.v_dtProgSols dtb_u_u895)) in (let dtb_u_u902 = ((Elab_dTypes.v_ecPutNext dtb_u_u901) (dtb_u_u895).Elab_dTypes.f_DtProgram_dtProgNext) in (let dtb_u_u903 = ((Elab_dTypes.v_ecPutGlobalsTbl dtb_u_u902) (Elab_dMeta.v_globalsTableOf (Elab_dTypes.v_dtProgGlobals dtb_u_u895))) in { B_dData_dPair.f_Pair_first = dtb_u_u903; B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtProgGlobals dtb_u_u895) })))))))))

# 1609 "Vuna/Compiler/Elab/Driver.vuna"
let v_candidateLe = (fun (dtb_u_u904 : Base_dDiag.t_Candidate) (dtb_u_u905 : Base_dDiag.t_Candidate) -> (match dtb_u_u904 with
  | { Base_dDiag.f_Candidate_candidateText = dtb_u_u906; Base_dDiag.f_Candidate_candidateSpan = dtb_u_u907; Base_dDiag.f_Candidate_candidateReason = dtb_u_u908 } -> (match dtb_u_u905 with
  | { Base_dDiag.f_Candidate_candidateText = dtb_u_u909; Base_dDiag.f_Candidate_candidateSpan = dtb_u_u910; Base_dDiag.f_Candidate_candidateReason = dtb_u_u911 } -> (dtb_u_u906 <= dtb_u_u909)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1606 "Vuna/Compiler/Elab/Driver.vuna"
let v_sortCandidates = (fun (dtb_u_u912 : Base_dDiag.t_Candidate B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy v_candidateLe) dtb_u_u912))

# 1613 "Vuna/Compiler/Elab/Driver.vuna"
let v_instCandidate = (fun (dtb_u_u913 : string) (dtb_u_u914 : Elab_dTypes.t_DtInst) -> { Base_dDiag.f_Candidate_candidateText = (Elab_dTypes.v_dtInstName dtb_u_u914); Base_dDiag.f_Candidate_candidateSpan = (dtb_u_u914).Elab_dTypes.f_DtInst_dtInstSpan; Base_dDiag.f_Candidate_candidateReason = (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["instance head "; (Core_dTerm.v_showTerm (dtb_u_u914).Elab_dTypes.f_DtInst_dtInstHead); " does not match goal "; dtb_u_u913]))) })

# 1632 "Vuna/Compiler/Elab/Driver.vuna"
let rec v_takeWhileDictChar = (fun (dtb_u_u915 : int B_dData_dList.t_List) (dtb_u_u916 : int B_dData_dList.t_List) -> (match dtb_u_u915 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u917, dtb_u_u918) -> (if (if (dtb_u_u917 = 32) then true else (dtb_u_u917 = 41)) then (B_dData_dList.v_reverse dtb_u_u916) else ((v_takeWhileDictChar dtb_u_u918) (B_dData_dList.C_List__x58__x58_ (dtb_u_u917, dtb_u_u916))))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u916)
  | _ -> failwith "DT: impossible branch"
))

# 1621 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictFamilyOfShown = (fun (dtb_u_u919 : string) -> (let dtb_u_u920 = (B_dData_dList.dtp_unpack dtb_u_u919) in (let dtb_u_u921 = (match dtb_u_u920 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u922, dtb_u_u923) -> (if (dtb_u_u922 = 40) then dtb_u_u923 else dtb_u_u920)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dList.dtp_pack ((v_takeWhileDictChar dtb_u_u921) B_dData_dList.C_List_Nil)))))

# 1597 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictCandidatesOf = (fun (dtb_u_u924 : Elab_dTypes.t_Ec) (dtb_u_u925 : string) -> (let dtb_u_u926 = (v_dictFamilyOfShown dtb_u_u925) in (let dtb_u_u927 = (if (dtb_u_u926 = "") then (Elab_dTypes.v_ecInstList dtb_u_u924) else ((Elab_dTypes.v_ecInstsFamily dtb_u_u924) dtb_u_u926)) in (v_sortCandidates ((B_dData_dList.v_map (v_instCandidate dtb_u_u925)) dtb_u_u927)))))

# 1638 "Vuna/Compiler/Elab/Driver.vuna"
let v_withMetaCreated = (fun (dtb_u_u928 : Elab_dTypes.t_Ec) (dtb_u_u929 : int) (dtb_u_u930 : Base_dDiag.t_Diagnostic) -> (match ((Elab_dMetaSpans.v_metaSpanOf dtb_u_u928) dtb_u_u929) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u930
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u931) -> ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("created", dtb_u_u931))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote ("metavariable created here"))) dtb_u_u930))
  | _ -> failwith "DT: impossible branch"
))

# 807 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprInInfoCore = (fun (dtb_u_u932 : Elab_dTypes.t_DtProgram) (dtb_u_u933 : Frontend_dAst.t_Expr) -> (match dtb_u_u932 with
  | { Elab_dTypes.f_DtProgram_dtProgDatas = dtb_u_u934; Elab_dTypes.f_DtProgram_dtProgDefs = dtb_u_u935; Elab_dTypes.f_DtProgram_dtProgGoals = dtb_u_u936; Elab_dTypes.f_DtProgram_dtProgSols = dtb_u_u937; Elab_dTypes.f_DtProgram_dtProgGlobals = dtb_u_u938; Elab_dTypes.f_DtProgram_dtProgInsts = dtb_u_u939; Elab_dTypes.f_DtProgram_dtProgClasses = dtb_u_u940; Elab_dTypes.f_DtProgram_dtProgNext = dtb_u_u941; Elab_dTypes.f_DtProgram_dtProgDepths = dtb_u_u942; Elab_dTypes.f_DtProgram_dtProgWarnings = dtb_u_u943 } -> (let dtb_u_u944 = (v_defBodyPairs dtb_u_u935) in (let dtb_u_u945 = { Elab_dTypes.f_Ec_ecNext = dtb_u_u941; Elab_dTypes.f_Ec_ecSols = dtb_u_u937; Elab_dTypes.f_Ec_ecDefsRev = (B_dData_dList.v_reverse dtb_u_u944); Elab_dTypes.f_Ec_ecDatas = dtb_u_u934; Elab_dTypes.f_Ec_ecDepthOfMeta = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecGoals = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecInsts = (Elab_dTypes.v_instStoreOf dtb_u_u939); Elab_dTypes.f_Ec_ecClasses = dtb_u_u940; Elab_dTypes.f_Ec_ecConstraints = Elab_dTypes.v_csEmpty; Elab_dTypes.f_Ec_ecDefTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u944); Elab_dTypes.f_Ec_ecGlobalsTbl = (Elab_dMeta.v_globalsTableOf dtb_u_u938); Elab_dTypes.f_Ec_ecSolTbl = (Elab_dTypes.v_solsToTbl dtb_u_u937); Elab_dTypes.f_Ec_ecDepthTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); Elab_dTypes.f_Ec_ecGlobalsComplete = true; Elab_dTypes.f_Ec_ecClausesTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); Elab_dTypes.f_Ec_ecCtorTbl = (Elab_dTypes.v_ctorTblOfDatas dtb_u_u934); Elab_dTypes.f_Ec_ecHasLinear = (Elab_dTypes.v_datasHaveLinear dtb_u_u934); Elab_dTypes.f_Ec_ecMetaSpans = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecUseSpans = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecWarnings = dtb_u_u943; Elab_dTypes.f_Ec_ecCounters = B_dData_dList.C_List_Nil; Elab_dTypes.f_Ec_ecErrors = B_dData_dList.C_List_Nil } in ((Base_dCommon.v_bind ((((Elab_dTerm.v_inferE dtb_u_u938) Elab_dTypes.v_emptyCtx) dtb_u_u945) dtb_u_u933)) (fun (dtb_u_u946 : (Core_dTerm.t_Term, (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u947 = dtb_u_u946 in (match dtb_u_u947 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u948; B_dData_dPair.f_Pair_second = dtb_u_u949 } -> (match dtb_u_u949 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u950; B_dData_dPair.f_Pair_second = dtb_u_u951 } -> (let dtb_u_u952 = (((v_resolveDictGoalsFix dtb_u_u938) dtb_u_u951) 8) in (let dtb_u_u953 = (Elab_dTypes.v_ecSols dtb_u_u952) in (let dtb_u_u954 = (Core_dTerm.v_showTypeSig (((Elab_dMeta.v_zonkTerm dtb_u_u952) 0) ((Core_dEval.v_quote 0) ((((Core_dEval.v_force (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u944)) (Elab_dTypes.v_ecSolsP dtb_u_u952)) Core_dTerm.v_defaultFuel) dtb_u_u950)))) in (match (Elab_dDict.v_firstUnsolvedInterpGoal dtb_u_u952) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u955) -> (match (Elab_dDict.v_firstUnsolvedInterpGoalSpan dtb_u_u952) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u956) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u956) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb_u_u955))) dtb_u_u955)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb_u_u955))) dtb_u_u955)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((Elab_dMeta.v_unsolvedFrom dtb_u_u941) (Elab_dTypes.v_ecNext dtb_u_u952)) (Elab_dTypes.v_ecSolTbl dtb_u_u952)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u957) -> ((Base_dDiag.v_onErrDiag (fun (dtb_u_u958 : Base_dDiag.t_Diagnostic) -> (((v_withMetaCreated dtb_u_u952) dtb_u_u957) dtb_u_u958))) (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_exprSpan dtb_u_u933)) (Base_dDiagnostics_dTc.C_TcErr_UnsolvedMetavarInfer ((string_of_int dtb_u_u957)))) (string_of_int dtb_u_u957)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((Core_dEval.v_normalize (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u944)) (Elab_dTypes.v_ecSolsP dtb_u_u952)) Core_dEval.v_normalizeFuelBound) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u948)) with
  | Core_dTerm.C_Value_VInt (dtb_u_u959) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (string_of_int dtb_u_u959); B_dData_dPair.f_Pair_second = dtb_u_u954 }))
  | dtb_u_u960 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_showValueRepl dtb_u_u934) dtb_u_u952) dtb_u_u960); B_dData_dPair.f_Pair_second = dtb_u_u954 }))
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
let v_dtEvalExprInInfo = (fun (dtb_u_u961 : Elab_dTypes.t_DtProgram) (dtb_u_u962 : Frontend_dAst.t_Expr) -> ((v_dtEvalExprInInfoCore dtb_u_u961) dtb_u_u962))

# 796 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtEvalExprIn = (fun (dtb_u_u963 : Elab_dTypes.t_DtProgram) (dtb_u_u964 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_dtEvalExprInInfo dtb_u_u963) dtb_u_u964)) (fun (dtb_u_u965 : (string, string) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf dtb_u_u965))))))

# 1379 "Vuna/Compiler/Elab/Driver.vuna"
let v_unsolvedMessage = (fun (dtb_u_u966 : Elab_dTypes.t_Ec) (dtb_u_u967 : int) -> (match ((v_findGoal dtb_u_u967) (Elab_dTypes.v_ecGoals dtb_u_u966)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u968) -> (let dtb_u_u969 = (if ((dtb_u_u968).Elab_dTypes.f_DtGoal_dtGoalName = "") then "?" else ("?" ^ (dtb_u_u968).Elab_dTypes.f_DtGoal_dtGoalName)) in (let dtb_u_u970 = ((Core_dEval.v_showValueAt (v_ctxDepthOf dtb_u_u968)) (dtb_u_u968).Elab_dTypes.f_DtGoal_dtGoalType) in (let dtb_u_u971 = (String.concat "" [dtb_u_u969; " with goal "; dtb_u_u970]) in (((v_withMetaCreated dtb_u_u966) (dtb_u_u968).Elab_dTypes.f_DtGoal_dtGoalMeta) ((Base_dDiag.v_withFallbackSpan (dtb_u_u968).Elab_dTypes.f_DtGoal_dtGoalSpan) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldSpan ("goal", (dtb_u_u968).Elab_dTypes.f_DtGoal_dtGoalSpan))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote (("goal: " ^ dtb_u_u970)))) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_UnsolvedHole (dtb_u_u971))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u971, B_dData_dVec.C_Vec_Nil))))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u972 = (string_of_int dtb_u_u967) in (let dtb_u_u973 = ((v_metaOwnerHint dtb_u_u966) dtb_u_u967) in (((v_withMetaCreated dtb_u_u966) dtb_u_u967) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldName (dtb_u_u972))) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldNote (dtb_u_u973))) ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_UnsolvedMetavar (dtb_u_u972, dtb_u_u973))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u972, (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u973, B_dData_dVec.C_Vec_Nil))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1259 "Vuna/Compiler/Elab/Driver.vuna"
let v_finishCore = (fun (dtb_u_u974 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u975 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u976 : t_ElabCore) -> (let dtb_u_u977 = (dtb_u_u976).f_ElabCore_coreEc in (let dtb_u_u978 = (dtb_u_u976).f_ElabCore_coreDatas in (let dtb_u_u979 = (dtb_u_u976).f_ElabCore_coreDefs in (let dtb_u_u980 = (dtb_u_u976).f_ElabCore_coreInstDefs in (let dtb_u_u981 = (dtb_u_u976).f_ElabCore_coreGlobals in (let dtb_u_u982 = (dtb_u_u976).f_ElabCore_coreProjSpans in (match (Elab_dDict.v_firstUnsolvedMemberGoal dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u983) -> (match (Elab_dDict.v_firstUnsolvedMemberGoalSpan dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u984) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u984) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb_u_u983))) dtb_u_u983)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb_u_u983))) dtb_u_u983)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dDict.v_firstUnsolvedInterpGoal dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u985) -> (match (Elab_dDict.v_firstUnsolvedInterpGoalSpan dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u986) -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u986) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb_u_u985))) dtb_u_u985)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb_u_u985))) dtb_u_u985)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_unsolvedMeta dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u987) -> (match ((Elab_dDict.v_firstUnsolvedDictGoalExhausted dtb_u_u981) dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u988) -> (Base_dDiag.C_Check_ErrC ((((v_withMetaCreated dtb_u_u977) dtb_u_u987) dtb_u_u988)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Elab_dDict.v_firstUnsolvedDictGoal dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u989) -> (let dtb_u_u990 = ((v_dictCandidatesOf dtb_u_u977) dtb_u_u989) in (let dtb_u_u991 = (match (Elab_dDict.v_firstUnsolvedDictGoalMeta dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u995) -> ((v_withMetaCreated dtb_u_u977) dtb_u_u995)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withMetaCreated dtb_u_u977) dtb_u_u987)
  | _ -> failwith "DT: impossible branch"
) in (match (Elab_dDict.v_firstUnsolvedDictGoalSpan dtb_u_u977) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u992) -> ((Base_dDiag.v_onErrDiag (fun (dtb_u_u993 : Base_dDiag.t_Diagnostic) -> (dtb_u_u991 ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCandidates (dtb_u_u990))) dtb_u_u993)))) (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u992) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb_u_u989))) dtb_u_u989))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiag.v_onErrDiag (fun (dtb_u_u994 : Base_dDiag.t_Diagnostic) -> (dtb_u_u991 ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCandidates (dtb_u_u990))) dtb_u_u994)))) ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb_u_u989))) dtb_u_u989))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC (((v_unsolvedMessage dtb_u_u977) dtb_u_u987)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.extra") (fun (dtb_u_u996 : int) -> ((((Elab_dTrait.v_extraDefsOf dtb_u_u981) dtb_u_u977) dtb_u_u982) ((B_dData_dList.v_append dtb_u_u980) dtb_u_u979))))) (fun (dtb_u_u997 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u998 = ((Base_dObs.v_obsPure "vuna.elab.rezonk") (fun (dtb_u_u1013 : int) -> ((v_rezonkDefs dtb_u_u977) ((B_dData_dList.v_append dtb_u_u980) ((B_dData_dList.v_append dtb_u_u997) dtb_u_u979))))) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.main.show") (fun (dtb_u_u999 : int) -> (((v_synthMainShow dtb_u_u977) dtb_u_u981) dtb_u_u998)))) (fun (dtb_u_u1000 : Elab_dTypes.t_DtDef B_dData_dList.t_List) -> (let dtb_u_u1001 = ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u1012 : Elab_dTypes.t_DtDef) -> { B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtDefName dtb_u_u1012); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtDefType dtb_u_u1012) })) dtb_u_u1000)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) in (let dtb_u_u1002 = ((B_dData_dList.v_map (fun (dtb_u_u1010 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) (B_dData_dPair.v_firstOf dtb_u_u1010)) dtb_u_u1001) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1011) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u1010); B_dData_dPair.f_Pair_second = dtb_u_u1011 }
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u1010
  | _ -> failwith "DT: impossible branch"
))) dtb_u_u981) in (let dtb_u_u1003 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "extradefs-done") else 0) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.usage") (fun (dtb_u_u1004 : int) -> ((Elab_dUsage.v_checkProgramUsage dtb_u_u977) dtb_u_u1000)))) (fun (dtb_u_u1005 : Elab_dTypes.t_Ec) -> (let dtb_u_u1006 = (((Elab_dTermination_dElabInput.v_elabTermInput dtb_u_u978) (Elab_dTypes.v_ecClasses dtb_u_u1005)) dtb_u_u1000) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.term") (fun (dtb_u_u1007 : int) -> ((((Elab_dTermination.v_checkTerminationGroups (B_dData_dPair.v_firstOf dtb_u_u1006)) (B_dData_dPair.v_secondOf dtb_u_u1006)) dtb_u_u974) dtb_u_u975)))) (fun (dtb_u_u1008 : int) -> (let dtb_u_u1009 = (if ((dtp_log_on 2) "Vuna.Compiler.Elab.Driver") then (((dtp_log_emit 2) "Vuna.Compiler.Elab.Driver") "termination-done") else 0) in (Base_dDiag.C_Check_OkC ({ Elab_dTypes.f_DtProgram_dtProgDatas = dtb_u_u978; Elab_dTypes.f_DtProgram_dtProgDefs = dtb_u_u1000; Elab_dTypes.f_DtProgram_dtProgGoals = (Elab_dTypes.v_ecGoals dtb_u_u1005); Elab_dTypes.f_DtProgram_dtProgSols = (Elab_dTypes.v_ecSols dtb_u_u1005); Elab_dTypes.f_DtProgram_dtProgGlobals = dtb_u_u1002; Elab_dTypes.f_DtProgram_dtProgInsts = (Elab_dTypes.v_ecInstList dtb_u_u1005); Elab_dTypes.f_DtProgram_dtProgClasses = (Elab_dTypes.v_ecClasses dtb_u_u1005); Elab_dTypes.f_DtProgram_dtProgNext = (Elab_dTypes.v_ecNext dtb_u_u1005); Elab_dTypes.f_DtProgram_dtProgDepths = (B_dContainer_dHashMap.v_toList (Elab_dTypes.v_ecDepthTbl dtb_u_u1005)); Elab_dTypes.f_DtProgram_dtProgWarnings = (Elab_dTypes.v_ecWarnings dtb_u_u1005) }))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))

# 926 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramErrors = (fun (dtb_u_u1014 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u1015 = ((v_maybeAddHasFieldInstances Elab_dPrelude.v_preludeGlobals) dtb_u_u1014) in ((Base_dCommon.v_bind (Elab_dRecords.v_prepareDecls dtb_u_u1015)) (fun (dtb_u_u1016 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1016 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1017; B_dData_dPair.f_Pair_second = dtb_u_u1018 } -> ((Base_dCommon.v_bind (Elab_dDerive.v_expandDerivings dtb_u_u1018)) (fun (dtb_u_u1019 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux true) Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb_u_u1017) dtb_u_u1019)) (fun (dtb_u_u1020 : t_ElabCore) -> (let dtb_u_u1021 = (B_dData_dList.v_reverse (Elab_dTypes.v_ecErrors (dtb_u_u1020).f_ElabCore_coreEc)) in (if (Elab_dMeta.v_nonEmpty dtb_u_u1021) then (Base_dDiag.C_Check_OkC (dtb_u_u1021)) else (match (((v_finishCore B_dData_dList.C_List_Nil) dtb_u_u1019) dtb_u_u1020) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1022) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u1022, B_dData_dList.C_List_Nil))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1023) -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1343 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGoWithAux = (fun (dtb_u_u1024 : Elab_dTypes.t_Ec) (dtb_u_u1025 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1026 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dtb_u_u1027 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1028 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_elabProgramCoreWithAux false) dtb_u_u1024) dtb_u_u1025) dtb_u_u1026) dtb_u_u1028)) (fun (dtb_u_u1029 : t_ElabCore) -> ((Base_dObs.v_obsCheck "vuna.elab.tail") (fun (dtb_u_u1030 : int) -> (((v_finishCore dtb_u_u1027) dtb_u_u1028) dtb_u_u1029))))))

# 962 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFullWithAux = (fun (dtb_u_u1031 : Elab_dTypes.t_Ec) (dtb_u_u1032 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1033 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1034 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u1035 = ((v_maybeAddHasFieldInstances dtb_u_u1032) dtb_u_u1034) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (dtb_u_u1036 : int) -> ((Elab_dRecords.v_prepareDeclsWith dtb_u_u1033) dtb_u_u1035)))) (fun (dtb_u_u1037 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1037 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1038; B_dData_dPair.f_Pair_second = dtb_u_u1039 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (dtb_u_u1040 : int) -> (Elab_dDerive.v_expandDerivings dtb_u_u1039)))) (fun (dtb_u_u1041 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (dtb_u_u1042 : int) -> (Elab_dRecords.v_prepareDecls dtb_u_u1033)))) (fun (dtb_u_u1043 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1043 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1044; B_dData_dPair.f_Pair_second = dtb_u_u1045 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (dtb_u_u1046 : int) -> (Elab_dDerive.v_expandDerivings dtb_u_u1045)))) (fun (dtb_u_u1047 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((((v_elabProgramGoWithAux dtb_u_u1031) dtb_u_u1032) dtb_u_u1038) dtb_u_u1047) dtb_u_u1041)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))

# 956 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFullWith = (fun (dtb_u_u1048 : Elab_dTypes.t_Ec) (dtb_u_u1049 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1050 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramFullWithAux dtb_u_u1048) dtb_u_u1049) B_dData_dList.C_List_Nil) dtb_u_u1050))

# 984 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGoWith = (fun (dtb_u_u1051 : Elab_dTypes.t_Ec) (dtb_u_u1052 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1053 : Elab_dRecords.t_RecordMeta B_dData_dList.t_List) (dtb_u_u1054 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((((v_elabProgramGoWithAux dtb_u_u1051) dtb_u_u1052) dtb_u_u1053) B_dData_dList.C_List_Nil) dtb_u_u1054))

# 912 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramFull = (fun (dtb_u_u1055 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u1056 = ((v_maybeAddHasFieldInstances Elab_dPrelude.v_preludeGlobals) dtb_u_u1055) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.prepare") (fun (dtb_u_u1057 : int) -> (Elab_dRecords.v_prepareDecls dtb_u_u1056)))) (fun (dtb_u_u1058 : (Elab_dRecords.t_RecordMeta B_dData_dList.t_List, Frontend_dAst.t_Decl B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1058 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1059; B_dData_dPair.f_Pair_second = dtb_u_u1060 } -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.elab.deriving") (fun (dtb_u_u1061 : int) -> (Elab_dDerive.v_expandDerivings dtb_u_u1060)))) (fun (dtb_u_u1062 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramGoWith Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) dtb_u_u1059) dtb_u_u1062)))
  | _ -> failwith "DT: impossible branch"
)))))

# 951 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgramGo = (fun (dtb_u_u1063 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_elabProgramGoWith Elab_dTypes.v_ecEmpty) Elab_dPrelude.v_preludeGlobals) B_dData_dList.C_List_Nil) dtb_u_u1063))

# 1530 "Vuna/Compiler/Elab/Driver.vuna"
let v_goalsOfProgram = (fun (dtb_u_u1064 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_elabProgramFull dtb_u_u1064)) (fun (dtb_u_u1065 : Elab_dTypes.t_DtProgram) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_map (v_goalInfoOf (Elab_dTypes.v_dtProgSols dtb_u_u1065))) (Elab_dTypes.v_dtProgGoals dtb_u_u1065)))))))

# 1560 "Vuna/Compiler/Elab/Driver.vuna"
let v_elabProgram = (fun (dtb_u_u1066 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (v_elabProgramFull dtb_u_u1066)) (fun (dtb_u_u1067 : Elab_dTypes.t_DtProgram) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtProgDatas dtb_u_u1067); B_dData_dPair.f_Pair_second = (Elab_dTypes.v_dtProgDefs dtb_u_u1067) })))))

# 242 "Vuna/Compiler/Elab/Driver.vuna"
let v_declDictName = (fun (dtb_u_u1068 : t_DeclDictBinder) -> (match dtb_u_u1068 with
  | { f_DeclDictBinder_declDictName = dtb_u_u1069; f_DeclDictBinder_declDictLevel = dtb_u_u1070; f_DeclDictBinder_declDictDom = dtb_u_u1071 } -> dtb_u_u1069
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Driver.vuna"
let v_declDictLevel = (fun (dtb_u_u1072 : t_DeclDictBinder) -> (match dtb_u_u1072 with
  | { f_DeclDictBinder_declDictName = dtb_u_u1073; f_DeclDictBinder_declDictLevel = dtb_u_u1074; f_DeclDictBinder_declDictDom = dtb_u_u1075 } -> dtb_u_u1074
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Driver.vuna"
let v_declDictDom = (fun (dtb_u_u1076 : t_DeclDictBinder) -> (match dtb_u_u1076 with
  | { f_DeclDictBinder_declDictName = dtb_u_u1077; f_DeclDictBinder_declDictLevel = dtb_u_u1078; f_DeclDictBinder_declDictDom = dtb_u_u1079 } -> dtb_u_u1079
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictSubstMeta = (fun (dtb_u_u1080 : t_DictSubst) -> (match dtb_u_u1080 with
  | { f_DictSubst_dictSubstMeta = dtb_u_u1081; f_DictSubst_dictSubstName = dtb_u_u1082; f_DictSubst_dictSubstQ = dtb_u_u1083 } -> dtb_u_u1081
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictSubstName = (fun (dtb_u_u1084 : t_DictSubst) -> (match dtb_u_u1084 with
  | { f_DictSubst_dictSubstMeta = dtb_u_u1085; f_DictSubst_dictSubstName = dtb_u_u1086; f_DictSubst_dictSubstQ = dtb_u_u1087 } -> dtb_u_u1086
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Elab/Driver.vuna"
let v_dictSubstQ = (fun (dtb_u_u1088 : t_DictSubst) -> (match dtb_u_u1088 with
  | { f_DictSubst_dictSubstMeta = dtb_u_u1089; f_DictSubst_dictSubstName = dtb_u_u1090; f_DictSubst_dictSubstQ = dtb_u_u1091 } -> dtb_u_u1091
  | _ -> failwith "DT: impossible branch"
))

# 990 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreDatas = (fun (dtb_u_u1092 : t_ElabCore) -> (match dtb_u_u1092 with
  | { f_ElabCore_coreDatas = dtb_u_u1093; f_ElabCore_coreEc = dtb_u_u1094; f_ElabCore_coreDefs = dtb_u_u1095; f_ElabCore_coreInstDefs = dtb_u_u1096; f_ElabCore_coreGlobals = dtb_u_u1097; f_ElabCore_coreProjSpans = dtb_u_u1098 } -> dtb_u_u1093
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreEc = (fun (dtb_u_u1099 : t_ElabCore) -> (match dtb_u_u1099 with
  | { f_ElabCore_coreDatas = dtb_u_u1100; f_ElabCore_coreEc = dtb_u_u1101; f_ElabCore_coreDefs = dtb_u_u1102; f_ElabCore_coreInstDefs = dtb_u_u1103; f_ElabCore_coreGlobals = dtb_u_u1104; f_ElabCore_coreProjSpans = dtb_u_u1105 } -> dtb_u_u1101
  | _ -> failwith "DT: impossible branch"
))

# 992 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreDefs = (fun (dtb_u_u1106 : t_ElabCore) -> (match dtb_u_u1106 with
  | { f_ElabCore_coreDatas = dtb_u_u1107; f_ElabCore_coreEc = dtb_u_u1108; f_ElabCore_coreDefs = dtb_u_u1109; f_ElabCore_coreInstDefs = dtb_u_u1110; f_ElabCore_coreGlobals = dtb_u_u1111; f_ElabCore_coreProjSpans = dtb_u_u1112 } -> dtb_u_u1109
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreInstDefs = (fun (dtb_u_u1113 : t_ElabCore) -> (match dtb_u_u1113 with
  | { f_ElabCore_coreDatas = dtb_u_u1114; f_ElabCore_coreEc = dtb_u_u1115; f_ElabCore_coreDefs = dtb_u_u1116; f_ElabCore_coreInstDefs = dtb_u_u1117; f_ElabCore_coreGlobals = dtb_u_u1118; f_ElabCore_coreProjSpans = dtb_u_u1119 } -> dtb_u_u1117
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreGlobals = (fun (dtb_u_u1120 : t_ElabCore) -> (match dtb_u_u1120 with
  | { f_ElabCore_coreDatas = dtb_u_u1121; f_ElabCore_coreEc = dtb_u_u1122; f_ElabCore_coreDefs = dtb_u_u1123; f_ElabCore_coreInstDefs = dtb_u_u1124; f_ElabCore_coreGlobals = dtb_u_u1125; f_ElabCore_coreProjSpans = dtb_u_u1126 } -> dtb_u_u1125
  | _ -> failwith "DT: impossible branch"
))

# 995 "Vuna/Compiler/Elab/Driver.vuna"
let v_coreProjSpans = (fun (dtb_u_u1127 : t_ElabCore) -> (match dtb_u_u1127 with
  | { f_ElabCore_coreDatas = dtb_u_u1128; f_ElabCore_coreEc = dtb_u_u1129; f_ElabCore_coreDefs = dtb_u_u1130; f_ElabCore_coreInstDefs = dtb_u_u1131; f_ElabCore_coreGlobals = dtb_u_u1132; f_ElabCore_coreProjSpans = dtb_u_u1133 } -> dtb_u_u1133
  | _ -> failwith "DT: impossible branch"
))

# 1502 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoSpan = (fun (dtb_u_u1134 : t_DtGoalInfo) -> (match dtb_u_u1134 with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb_u_u1135; f_DtGoalInfo_dtGoalInfoGoal = dtb_u_u1136; f_DtGoalInfo_dtGoalInfoCtx = dtb_u_u1137; f_DtGoalInfo_dtGoalInfoName = dtb_u_u1138 } -> dtb_u_u1135
  | _ -> failwith "DT: impossible branch"
))

# 1503 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoGoal = (fun (dtb_u_u1139 : t_DtGoalInfo) -> (match dtb_u_u1139 with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb_u_u1140; f_DtGoalInfo_dtGoalInfoGoal = dtb_u_u1141; f_DtGoalInfo_dtGoalInfoCtx = dtb_u_u1142; f_DtGoalInfo_dtGoalInfoName = dtb_u_u1143 } -> dtb_u_u1141
  | _ -> failwith "DT: impossible branch"
))

# 1504 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoCtx = (fun (dtb_u_u1144 : t_DtGoalInfo) -> (match dtb_u_u1144 with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb_u_u1145; f_DtGoalInfo_dtGoalInfoGoal = dtb_u_u1146; f_DtGoalInfo_dtGoalInfoCtx = dtb_u_u1147; f_DtGoalInfo_dtGoalInfoName = dtb_u_u1148 } -> dtb_u_u1147
  | _ -> failwith "DT: impossible branch"
))

# 1505 "Vuna/Compiler/Elab/Driver.vuna"
let v_dtGoalInfoName = (fun (dtb_u_u1149 : t_DtGoalInfo) -> (match dtb_u_u1149 with
  | { f_DtGoalInfo_dtGoalInfoSpan = dtb_u_u1150; f_DtGoalInfo_dtGoalInfoGoal = dtb_u_u1151; f_DtGoalInfo_dtGoalInfoCtx = dtb_u_u1152; f_DtGoalInfo_dtGoalInfoName = dtb_u_u1153 } -> dtb_u_u1153
  | _ -> failwith "DT: impossible branch"
))
