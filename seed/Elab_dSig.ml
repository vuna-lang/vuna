open Vuna_runtime
# 27 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_arityFun = (fun (dtb_u_u1 : int) (dtb_u_u2 : Core_dTerm.t_Term) -> (if (dtb_u_u1 <= 0) then dtb_u_u2 else (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_arityFun (dtb_u_u1 - 1)) dtb_u_u2)))))

# 34 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_maxIntList = (fun (dtb_u_u3 : int B_dData_dList.t_List) -> (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u4, dtb_u_u5) -> (if (dtb_u_u4 >= (v_maxIntList dtb_u_u5)) then dtb_u_u4 else (v_maxIntList dtb_u_u5))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Sig.vuna"
let v_altBodyOf = (fun (dtb_u_u6 : Frontend_dAst.t_Alt) -> (dtb_u_u6).Frontend_dAst.f_Alt_altBody)

# 85 "Vuna/Compiler/Elab/Sig.vuna"
let v_clauseBodyOf = (fun (dtb_u_u7 : Frontend_dAst.t_LocalClause) -> (dtb_u_u7).Frontend_dAst.f_LocalClause_lcBody)

# 45 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_exprMaxAppArityF = (fun (dtb_u_u8 : int) (dtb_u_u9 : string) (dtb_u_u10 : Frontend_dAst.t_Expr) -> (if (dtb_u_u8 <= 0) then 0 else (let dtb_u_u11 = dtb_u_u10 in (match dtb_u_u11 with
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u12, dtb_u_u13, dtb_u_u14) -> (((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u12)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u15, dtb_u_u16, dtb_u_u17) -> (v_maxIntList ((B_dData_dList.v_map (fun (dtb_u_u18 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) (B_dData_dPair.v_secondOf dtb_u_u18)))) dtb_u_u16))
  | Frontend_dAst.C_Expr_EField (dtb_u_u19, dtb_u_u20, dtb_u_u21) -> (((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u19)
  | Frontend_dAst.C_Expr_ECase (dtb_u_u22, dtb_u_u23, dtb_u_u24) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u22), ((B_dData_dList.v_concatMap (fun (dtb_u_u25 : Frontend_dAst.t_Alt) -> (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) (v_altBodyOf dtb_u_u25)), B_dData_dList.C_List_Nil)))) dtb_u_u23))))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u26, dtb_u_u27, dtb_u_u28, dtb_u_u29) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u27), (((v_exprMaxAppArityBindsF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u26))))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u30, dtb_u_u31, dtb_u_u32, dtb_u_u33) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u30), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u31), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u32), B_dData_dList.C_List_Nil)))))))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u34, dtb_u_u35, dtb_u_u36, dtb_u_u37, dtb_u_u38, dtb_u_u39) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u37), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u38), B_dData_dList.C_List_Nil)))))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u40, dtb_u_u41, dtb_u_u42) -> (((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u41)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u43, dtb_u_u44, dtb_u_u45) -> (match dtb_u_u43 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u46, dtb_u_u47) -> (if (dtb_u_u46 = dtb_u_u9) then (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.v_length dtb_u_u44), ((B_dData_dList.v_map ((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9)) dtb_u_u44)))) else (v_maxIntList ((B_dData_dList.v_map ((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9)) dtb_u_u44)))
  | _ -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9) dtb_u_u43), ((B_dData_dList.v_map ((v_exprMaxAppArityF (dtb_u_u8 - 1)) dtb_u_u9)) dtb_u_u44))))
)
  | _ -> 0
))))
# 63 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppArityBindsF = (fun (dtb_u_u48 : int) (dtb_u_u49 : string) (dtb_u_u50 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u50 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityBindingF (dtb_u_u48 - 1)) dtb_u_u49) dtb_u_u51), (((v_exprMaxAppArityBindsF (dtb_u_u48 - 1)) dtb_u_u49) dtb_u_u52)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 68 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppArityBindingF = (fun (dtb_u_u53 : int) (dtb_u_u54 : string) (dtb_u_u55 : Frontend_dAst.t_Binding) -> (match dtb_u_u55 with
  | { Frontend_dAst.f_Binding_bindPat = dtb_u_u56; Frontend_dAst.f_Binding_bindValue = dtb_u_u57; Frontend_dAst.f_Binding_bindSig = dtb_u_u58; Frontend_dAst.f_Binding_bindRef = dtb_u_u59 } -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityValueF (dtb_u_u53 - 1)) dtb_u_u54) dtb_u_u57), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppAritySigF (dtb_u_u53 - 1)) dtb_u_u54) dtb_u_u58), B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
))
# 73 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppArityValueF = (fun (dtb_u_u60 : int) (dtb_u_u61 : string) (dtb_u_u62 : Frontend_dAst.t_BindingValue) -> (match dtb_u_u62 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u63) -> (v_maxIntList ((B_dData_dList.v_map (fun (dtb_u_u64 : Frontend_dAst.t_LocalClause) -> (((v_exprMaxAppArityF (dtb_u_u60 - 1)) dtb_u_u61) (v_clauseBodyOf dtb_u_u64)))) dtb_u_u63))
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u65) -> (((v_exprMaxAppArityF (dtb_u_u60 - 1)) dtb_u_u61) dtb_u_u65)
  | _ -> failwith "DT: impossible branch"
))
# 78 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppAritySigF = (fun (dtb_u_u66 : int) (dtb_u_u67 : string) (dtb_u_u68 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match dtb_u_u68 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u69) -> (((v_exprMaxAppArityF (dtb_u_u66 - 1)) dtb_u_u67) (dtb_u_u69).Frontend_dAst.f_BindingSig_sigType)
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprMaxAppArity = (fun (dtb_u_u70 : string) (dtb_u_u71 : Frontend_dAst.t_Expr) -> (((v_exprMaxAppArityF ((Frontend_dAstQuery.v_exprBudget 64) dtb_u_u71)) dtb_u_u70) dtb_u_u71))

# 30 "Vuna/Compiler/Elab/Sig.vuna"
let v_methodMaxAppArity = (fun (dtb_u_u72 : string) (dtb_u_u73 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_maxIntList ((B_dData_dList.v_map (fun (dtb_u_u74 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprMaxAppArity dtb_u_u72) (B_dData_dPair.v_secondOf dtb_u_u74)))) dtb_u_u73)))

# 21 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKindOf = (fun (dtb_u_u75 : string) (dtb_u_u76 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_arityFun ((v_methodMaxAppArity dtb_u_u75) dtb_u_u76)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 24 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKind = (fun (dtb_u_u77 : string) (dtb_u_u78 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_classParamKindOf dtb_u_u77) dtb_u_u78))

# 39 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprMaxAppArityIn = (fun (dtb_u_u79 : string) (dtb_u_u80 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (v_maxIntList ((B_dData_dList.v_map (v_exprMaxAppArity dtb_u_u79)) dtb_u_u80)))

# 93 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_methodArgRigsOfGo = (fun (dtb_u_u81 : (bool) -> (Core_dTerm.t_Value) -> Core_dTerm.t_Rig) (dtb_u_u82 : Core_dTerm.t_Term) (dtb_u_u83 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u82 with
  | Core_dTerm.C_Term_TPi (dtb_u_u84, dtb_u_u85, dtb_u_u86, dtb_u_u87, dtb_u_u88) -> (let dtb_u_u89 = ((Core_dEval.v_eval dtb_u_u83) dtb_u_u87) in (let dtb_u_u90 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u84, (B_dData_dList.v_length dtb_u_u83), B_dData_dList.C_List_Nil)))) in (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, (((v_methodArgRigsOfGo dtb_u_u81) dtb_u_u88) (B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u83)))))))
  | _ -> B_dData_dList.C_List_Nil
))

# 90 "Vuna/Compiler/Elab/Sig.vuna"
let v_methodArgRigsOf = (fun (dtb_u_u91 : (bool) -> (Core_dTerm.t_Value) -> Core_dTerm.t_Rig) (dtb_u_u92 : Core_dTerm.t_Term) -> (((v_methodArgRigsOfGo dtb_u_u91) dtb_u_u92) B_dData_dList.C_List_Nil))

# 113 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_keepOut = (fun (dtb_u_u93 : (string) -> bool) (dtb_u_u94 : string B_dData_dList.t_List) -> (match dtb_u_u94 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if (dtb_u_u93 dtb_u_u95) then ((v_keepOut dtb_u_u93) dtb_u_u96) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u95, ((v_keepOut dtb_u_u93) dtb_u_u96))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantify = (fun (dtb_u_u97 : string B_dData_dList.t_List) (dtb_u_u98 : Frontend_dAst.t_Expr) (dtb_u_u99 : Base_dSource.t_Span) -> (match dtb_u_u97 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u100, dtb_u_u101) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u100, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef dtb_u_u99))), (((v_quantify dtb_u_u101) dtb_u_u98) dtb_u_u99), (Frontend_dAst.v_detachedNodeRef dtb_u_u99)))
  | B_dData_dList.C_List_Nil -> dtb_u_u98
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Elab/Sig.vuna"
let v_memberDomainOverridesOne = (fun (dtb_u_u102 : Frontend_dAst.t_Expr) -> (match dtb_u_u102 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u103, dtb_u_u104, dtb_u_u105) -> (match dtb_u_u103 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u106, dtb_u_u107) -> (match dtb_u_u104 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (match dtb_u_u111 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u112, dtb_u_u113) -> (match dtb_u_u113 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u106 = Base_dIntrinsics.v_effMemberFamilyName) then (let dtb_u_u114 = (match dtb_u_u108 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u118, dtb_u_u119) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u118; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_strTypeName, dtb_u_u119)) }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
) in (let dtb_u_u115 = (match dtb_u_u112 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u116, dtb_u_u117) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u116; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effRowFamilyName, dtb_u_u117)) }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
) in ((B_dData_dList.v_append dtb_u_u114) dtb_u_u115))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 146 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOverrides = (fun (dtb_u_u120 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u120 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> ((B_dData_dList.v_append (v_memberDomainOverridesOne dtb_u_u121)) (v_memberDomainOverrides dtb_u_u122))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOf = (fun (dtb_u_u123 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u124 : string) -> (match dtb_u_u123 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u125, dtb_u_u126) -> (match dtb_u_u125 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u127; B_dData_dPair.f_Pair_second = dtb_u_u128 } -> (if (dtb_u_u127 = dtb_u_u124) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u128)) else ((v_memberDomainOf dtb_u_u126) dtb_u_u124))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindArrowExpr = (fun (dtb_u_u129 : int) (dtb_u_u130 : Base_dSource.t_Span) -> (let dtb_u_u131 = (Frontend_dAst.v_detachedNodeRef dtb_u_u130) in (if (dtb_u_u129 <= 0) then (Frontend_dAst.C_Expr_EVar ("Type", dtb_u_u131)) else (Frontend_dAst.C_Expr_EPi ("_", false, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", dtb_u_u131)), ((v_kindArrowExpr (dtb_u_u129 - 1)) dtb_u_u130), dtb_u_u131)))))

# 134 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantifyTopKindsWith = (fun (dtb_u_u132 : (string) -> Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (dtb_u_u133 : string B_dData_dList.t_List) (dtb_u_u134 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u135 : Frontend_dAst.t_Expr) (dtb_u_u136 : Base_dSource.t_Span) -> (match dtb_u_u133 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u137, dtb_u_u138) -> (let dtb_u_u139 = (match (dtb_u_u132 dtb_u_u137) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u140) -> dtb_u_u140
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_kindArrowExpr ((v_exprMaxAppArityIn dtb_u_u137) dtb_u_u134)) dtb_u_u136)
  | _ -> failwith "DT: impossible branch"
) in (Frontend_dAst.C_Expr_EPi (dtb_u_u137, true, B_dData_dMaybe.C_Maybe_Nothing, dtb_u_u139, (((((v_quantifyTopKindsWith dtb_u_u132) dtb_u_u138) dtb_u_u134) dtb_u_u135) dtb_u_u136), (Frontend_dAst.v_detachedNodeRef dtb_u_u136))))
  | B_dData_dList.C_List_Nil -> dtb_u_u135
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopKinds = (fun (dtb_u_u141 : string B_dData_dList.t_List) (dtb_u_u142 : Frontend_dAst.t_Expr) (dtb_u_u143 : Frontend_dAst.t_Expr) (dtb_u_u144 : Base_dSource.t_Span) -> (((((v_quantifyTopKindsWith (fun (dtb_u_u145 : string) -> B_dData_dMaybe.C_Maybe_Nothing)) dtb_u_u141) (B_dData_dList.C_List__x58__x58_ (dtb_u_u142, B_dData_dList.C_List_Nil))) dtb_u_u143) dtb_u_u144))

# 180 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_piBoundNames = (fun (dtb_u_u146 : Frontend_dAst.t_Expr) -> (match dtb_u_u146 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u152) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u147, (v_piBoundNames dtb_u_u151)))
  | _ -> B_dData_dList.C_List_Nil
))

# 230 "Vuna/Compiler/Elab/Sig.vuna"
let v_isLowerIdent = (fun (dtb_u_u153 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u153) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (if (dtb_u_u154 >= 97) then (dtb_u_u154 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_exprLowerVarsF = (fun (dtb_u_u156 : int) (dtb_u_u157 : Frontend_dAst.t_Expr) -> (if (dtb_u_u156 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u157 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u158, dtb_u_u159) -> (if (v_isLowerIdent dtb_u_u158) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u158, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u160, dtb_u_u161, dtb_u_u162) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u160)) ((B_dData_dList.v_concatMap (v_exprLowerVarsF (dtb_u_u156 - 1))) dtb_u_u161))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u163, dtb_u_u164, dtb_u_u165) -> ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u164)
  | Frontend_dAst.C_Expr_EPi (dtb_u_u166, dtb_u_u167, dtb_u_u168, dtb_u_u169, dtb_u_u170, dtb_u_u171) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u169)) ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u170))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u172, dtb_u_u173, dtb_u_u174, dtb_u_u175) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u172)) ((B_dData_dList.v_append ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u173)) ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u174)))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u176, dtb_u_u177, dtb_u_u178, dtb_u_u179) -> ((B_dData_dList.v_append ((v_exprLowerVarsBindsF (dtb_u_u156 - 1)) dtb_u_u176)) ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u177))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u180, dtb_u_u181, dtb_u_u182) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u180)) ((B_dData_dList.v_concatMap (fun (dtb_u_u183 : Frontend_dAst.t_Alt) -> ((v_exprLowerVarsF (dtb_u_u156 - 1)) (v_altBodyOf dtb_u_u183)))) dtb_u_u181))
  | Frontend_dAst.C_Expr_EField (dtb_u_u184, dtb_u_u185, dtb_u_u186) -> ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u184)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u187, dtb_u_u188, dtb_u_u189) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u190 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprLowerVarsF (dtb_u_u156 - 1)) (B_dData_dPair.v_secondOf dtb_u_u190)))) dtb_u_u188)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u191, dtb_u_u192, dtb_u_u193) -> ((v_exprLowerVarsF (dtb_u_u156 - 1)) dtb_u_u191)
  | _ -> B_dData_dList.C_List_Nil
)))
# 208 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsBindsF = (fun (dtb_u_u194 : int) (dtb_u_u195 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u195 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u196, dtb_u_u197) -> ((B_dData_dList.v_append ((v_exprLowerVarsBindingF (dtb_u_u194 - 1)) dtb_u_u196)) ((v_exprLowerVarsBindsF (dtb_u_u194 - 1)) dtb_u_u197))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 213 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsBindingF = (fun (dtb_u_u198 : int) (dtb_u_u199 : Frontend_dAst.t_Binding) -> (match dtb_u_u199 with
  | { Frontend_dAst.f_Binding_bindPat = dtb_u_u200; Frontend_dAst.f_Binding_bindValue = dtb_u_u201; Frontend_dAst.f_Binding_bindSig = dtb_u_u202; Frontend_dAst.f_Binding_bindRef = dtb_u_u203 } -> ((B_dData_dList.v_append ((v_exprLowerVarsValueF (dtb_u_u198 - 1)) dtb_u_u201)) ((v_exprLowerVarsSigF (dtb_u_u198 - 1)) dtb_u_u202))
  | _ -> failwith "DT: impossible branch"
))
# 217 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsValueF = (fun (dtb_u_u204 : int) (dtb_u_u205 : Frontend_dAst.t_BindingValue) -> (match dtb_u_u205 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u206) -> ((v_exprLowerVarsClausesF (dtb_u_u204 - 1)) dtb_u_u206)
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u207) -> ((v_exprLowerVarsF (dtb_u_u204 - 1)) dtb_u_u207)
  | _ -> failwith "DT: impossible branch"
))
# 221 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsSigF = (fun (dtb_u_u208 : int) (dtb_u_u209 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match dtb_u_u209 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u210) -> ((v_exprLowerVarsF (dtb_u_u208 - 1)) (dtb_u_u210).Frontend_dAst.f_BindingSig_sigType)
  | _ -> failwith "DT: impossible branch"
))
# 225 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsClausesF = (fun (dtb_u_u211 : int) (dtb_u_u212 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u212 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u213, dtb_u_u214) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (dtb_u_u211 - 1)) (dtb_u_u213).Frontend_dAst.f_LocalClause_lcBody)) ((v_exprLowerVarsClausesF (dtb_u_u211 - 1)) dtb_u_u214))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprLowerVars = (fun (dtb_u_u215 : Frontend_dAst.t_Expr) -> ((v_exprLowerVarsF ((Frontend_dAstQuery.v_exprBudget 64) dtb_u_u215)) dtb_u_u215))

# 184 "Vuna/Compiler/Elab/Sig.vuna"
let v_lowerVarNames = (fun (dtb_u_u216 : Frontend_dAst.t_Expr) -> (B_dData_dList.v_nubNames (v_exprLowerVars dtb_u_u216)))

# 240 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_dropName = (fun (dtb_u_u217 : string) (dtb_u_u218 : string B_dData_dList.t_List) -> (match dtb_u_u218 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u219, dtb_u_u220) -> (if (dtb_u_u219 = dtb_u_u217) then ((v_dropName dtb_u_u217) dtb_u_u220) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u219, ((v_dropName dtb_u_u217) dtb_u_u220))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dropPiBound = (fun (dtb_u_u221 : string B_dData_dList.t_List) (dtb_u_u222 : string B_dData_dList.t_List) -> (match dtb_u_u222 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u223, dtb_u_u224) -> ((v_dropPiBound ((v_dropName dtb_u_u223) dtb_u_u221)) dtb_u_u224)
  | B_dData_dList.C_List_Nil -> dtb_u_u221
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/Sig.vuna"
let v_freeNames = (fun (dtb_u_u225 : (string) -> bool) (dtb_u_u226 : Frontend_dAst.t_Expr) -> ((v_keepOut dtb_u_u225) ((v_dropPiBound (v_lowerVarNames dtb_u_u226)) (v_piBoundNames dtb_u_u226))))

# 107 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTraitSig = (fun (dtb_u_u227 : (string) -> bool) (dtb_u_u228 : Frontend_dAst.t_Expr) (dtb_u_u229 : Base_dSource.t_Span) -> (((v_quantify ((v_freeNames dtb_u_u227) dtb_u_u228)) dtb_u_u228) dtb_u_u229))

# 263 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindDomains = (fun (dtb_u_u230 : Frontend_dAst.t_Expr) -> (match dtb_u_u230 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u231, dtb_u_u232, dtb_u_u233) -> (let dtb_u_u234 = dtb_u_u231 in (match dtb_u_u234 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u235, dtb_u_u236) -> (if (dtb_u_u235 = "->") then (let dtb_u_u237 = dtb_u_u232 in (match dtb_u_u237 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u238, dtb_u_u239) -> (match dtb_u_u239 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u240, dtb_u_u241) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u238, (v_kindDomains dtb_u_u240)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u242, dtb_u_u243, dtb_u_u244, dtb_u_u245, dtb_u_u246, dtb_u_u247) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u245, (v_kindDomains dtb_u_u246)))
  | _ -> B_dData_dList.C_List_Nil
))

# 253 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_dataParamKindTbl = (fun (dtb_u_u248 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u248 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u249, dtb_u_u250) -> (match dtb_u_u249 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u251, dtb_u_u252, dtb_u_u253, dtb_u_u254, dtb_u_u255, dtb_u_u256, dtb_u_u257, dtb_u_u258, dtb_u_u259) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u251; B_dData_dPair.f_Pair_second = (v_kindDomains dtb_u_u253) }, (v_dataParamKindTbl dtb_u_u250)))
  | _ -> (v_dataParamKindTbl dtb_u_u250)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_lookupParamKinds = (fun (dtb_u_u260 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u261 : string) -> (match dtb_u_u260 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u262, dtb_u_u263) -> (match dtb_u_u262 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u264; B_dData_dPair.f_Pair_second = dtb_u_u265 } -> (if (dtb_u_u264 = dtb_u_u261) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u265)) else ((v_lookupParamKinds dtb_u_u263) dtb_u_u261))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_zipArgKindsGo = (fun (dtb_u_u266 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u267 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u266 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u268, dtb_u_u269) -> (match dtb_u_u267 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u270, dtb_u_u271) -> (match dtb_u_u270 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u272, dtb_u_u273) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u272; B_dData_dPair.f_Pair_second = dtb_u_u268 }, ((v_zipArgKindsGo dtb_u_u269) dtb_u_u271)))
  | _ -> ((v_zipArgKindsGo dtb_u_u269) dtb_u_u271)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Sig.vuna"
let v_zipArgKinds = (fun (dtb_u_u274 : Frontend_dAst.t_Expr B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (dtb_u_u275 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u274 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u276) -> ((v_zipArgKindsGo dtb_u_u276) dtb_u_u275)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_argParamKindsF = (fun (dtb_u_u277 : int) (dtb_u_u278 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u279 : Frontend_dAst.t_Expr) -> (if (dtb_u_u277 <= 0) then B_dData_dList.C_List_Nil else (let dtb_u_u280 = dtb_u_u279 in (match dtb_u_u280 with
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u281, dtb_u_u282, dtb_u_u283) -> (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u281)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u284, dtb_u_u285, dtb_u_u286) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u287 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) (B_dData_dPair.v_secondOf dtb_u_u287)))) dtb_u_u285)
  | Frontend_dAst.C_Expr_EField (dtb_u_u288, dtb_u_u289, dtb_u_u290) -> (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u288)
  | Frontend_dAst.C_Expr_EIf (dtb_u_u291, dtb_u_u292, dtb_u_u293, dtb_u_u294) -> ((B_dData_dList.v_append (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u291)) ((B_dData_dList.v_append (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u292)) (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u293)))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u295, dtb_u_u296, dtb_u_u297) -> ((B_dData_dList.v_append (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u295)) ((B_dData_dList.v_concatMap (fun (dtb_u_u298 : Frontend_dAst.t_Alt) -> (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) (v_altBodyOf dtb_u_u298)))) dtb_u_u296))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u299, dtb_u_u300, dtb_u_u301, dtb_u_u302) -> ((B_dData_dList.v_append (((v_argParamKindsBindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u299)) (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u300))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u303, dtb_u_u304, dtb_u_u305, dtb_u_u306, dtb_u_u307, dtb_u_u308) -> ((B_dData_dList.v_append (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u306)) (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u307))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u309, dtb_u_u310, dtb_u_u311) -> (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u310)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u312, dtb_u_u313, dtb_u_u314) -> (match dtb_u_u312 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u315, dtb_u_u316) -> ((B_dData_dList.v_append ((v_zipArgKinds ((v_lookupParamKinds dtb_u_u278) dtb_u_u315)) dtb_u_u313)) ((B_dData_dList.v_concatMap ((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278)) dtb_u_u313))
  | _ -> ((B_dData_dList.v_append (((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278) dtb_u_u312)) ((B_dData_dList.v_concatMap ((v_argParamKindsF (dtb_u_u277 - 1)) dtb_u_u278)) dtb_u_u313))
)
  | _ -> B_dData_dList.C_List_Nil
))))
# 302 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsBindsF = (fun (dtb_u_u317 : int) (dtb_u_u318 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u319 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u319 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u320, dtb_u_u321) -> ((B_dData_dList.v_append (((v_argParamKindsBindingF (dtb_u_u317 - 1)) dtb_u_u318) dtb_u_u320)) (((v_argParamKindsBindsF (dtb_u_u317 - 1)) dtb_u_u318) dtb_u_u321))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 307 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsBindingF = (fun (dtb_u_u322 : int) (dtb_u_u323 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u324 : Frontend_dAst.t_Binding) -> (match dtb_u_u324 with
  | { Frontend_dAst.f_Binding_bindPat = dtb_u_u325; Frontend_dAst.f_Binding_bindValue = dtb_u_u326; Frontend_dAst.f_Binding_bindSig = dtb_u_u327; Frontend_dAst.f_Binding_bindRef = dtb_u_u328 } -> ((B_dData_dList.v_append (((v_argParamKindsValueF (dtb_u_u322 - 1)) dtb_u_u323) dtb_u_u326)) (((v_argParamKindsSigF (dtb_u_u322 - 1)) dtb_u_u323) dtb_u_u327))
  | _ -> failwith "DT: impossible branch"
))
# 311 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsValueF = (fun (dtb_u_u329 : int) (dtb_u_u330 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u331 : Frontend_dAst.t_BindingValue) -> (match dtb_u_u331 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u332) -> (((v_argParamKindsClausesF (dtb_u_u329 - 1)) dtb_u_u330) dtb_u_u332)
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u333) -> (((v_argParamKindsF (dtb_u_u329 - 1)) dtb_u_u330) dtb_u_u333)
  | _ -> failwith "DT: impossible branch"
))
# 315 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsSigF = (fun (dtb_u_u334 : int) (dtb_u_u335 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u336 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match dtb_u_u336 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u337) -> (((v_argParamKindsF (dtb_u_u334 - 1)) dtb_u_u335) (dtb_u_u337).Frontend_dAst.f_BindingSig_sigType)
  | _ -> failwith "DT: impossible branch"
))
# 319 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsClausesF = (fun (dtb_u_u338 : int) (dtb_u_u339 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u340 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u340 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u341, dtb_u_u342) -> ((B_dData_dList.v_append (((v_argParamKindsF (dtb_u_u338 - 1)) dtb_u_u339) (dtb_u_u341).Frontend_dAst.f_LocalClause_lcBody)) (((v_argParamKindsClausesF (dtb_u_u338 - 1)) dtb_u_u339) dtb_u_u342))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Sig.vuna"
let v_argParamKinds = (fun (dtb_u_u343 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u344 : Frontend_dAst.t_Expr) -> (((v_argParamKindsF ((Frontend_dAstQuery.v_exprBudget 64) dtb_u_u344)) dtb_u_u343) dtb_u_u344))

# 278 "Vuna/Compiler/Elab/Sig.vuna"
let v_argParamKindsIn = (fun (dtb_u_u345 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u346 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (v_argParamKinds dtb_u_u345)) dtb_u_u346))

# 359 "Vuna/Compiler/Elab/Sig.vuna"
let v_modulePrefixOf = (fun (dtb_u_u347 : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u347)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u348; B_dData_dPair.f_Pair_second = dtb_u_u349 } -> (Base_dSource.v_joinDots dtb_u_u348)
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_filterNamesInModule = (fun (dtb_u_u350 : string) (dtb_u_u351 : string B_dData_dList.t_List) -> (match dtb_u_u351 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u352, dtb_u_u353) -> (if ((v_modulePrefixOf dtb_u_u352) = (v_modulePrefixOf dtb_u_u350)) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u352, ((v_filterNamesInModule dtb_u_u350) dtb_u_u353))) else ((v_filterNamesInModule dtb_u_u350) dtb_u_u353))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedKey = (fun (dtb_u_u354 : string) (dtb_u_u355 : string) -> (String.concat "" [dtb_u_u354; "\t"; dtb_u_u355]))

# 373 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedBannedTbl = (fun (dtb_u_u356 : string B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (dtb_u_u357 : string) -> { B_dData_dPair.f_Pair_first = ((v_qualifiedKey (v_modulePrefixOf dtb_u_u357)) dtb_u_u357); B_dData_dPair.f_Pair_second = true })) dtb_u_u356)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 426 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_paramKindOf = (fun (dtb_u_u358 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u359 : string) -> (match dtb_u_u358 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u360, dtb_u_u361) -> (match dtb_u_u360 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u362; B_dData_dPair.f_Pair_second = dtb_u_u363 } -> (if (dtb_u_u362 = dtb_u_u359) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u363)) else ((v_paramKindOf dtb_u_u361) dtb_u_u359))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Elab/Sig.vuna"
let v_kindOverrideOf = (fun (dtb_u_u364 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u365 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u366 : string) -> (match ((v_memberDomainOf dtb_u_u364) dtb_u_u366) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u367) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u367))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_paramKindOf dtb_u_u365) dtb_u_u366)
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_keepOutQualified = (fun (dtb_u_u368 : string) (dtb_u_u369 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u370 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u371 : string B_dData_dList.t_List) -> (match dtb_u_u371 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u372, dtb_u_u373) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u372) dtb_u_u370) then ((((v_keepOutQualified dtb_u_u368) dtb_u_u369) dtb_u_u370) dtb_u_u373) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((v_qualifiedKey dtb_u_u368) dtb_u_u372)) dtb_u_u369) then ((((v_keepOutQualified dtb_u_u368) dtb_u_u369) dtb_u_u370) dtb_u_u373) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u372, ((((v_keepOutQualified dtb_u_u368) dtb_u_u369) dtb_u_u370) dtb_u_u373)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCached = (fun (dtb_u_u374 : string) (dtb_u_u375 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u376 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u377 : Frontend_dAst.t_Expr) (dtb_u_u378 : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((((v_keepOutQualified dtb_u_u374) dtb_u_u375) dtb_u_u376) ((v_freeNames (fun (dtb_u_u379 : string) -> false)) dtb_u_u377))) dtb_u_u377) dtb_u_u377) dtb_u_u378))

# 394 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCached = (fun (dtb_u_u380 : string) (dtb_u_u381 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u382 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u383 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u384 : Frontend_dAst.t_Expr) (dtb_u_u385 : Base_dSource.t_Span) -> (let dtb_u_u386 = ((B_dData_dList.v_append dtb_u_u383) (B_dData_dList.C_List__x58__x58_ (dtb_u_u384, B_dData_dList.C_List_Nil))) in (let dtb_u_u387 = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) dtb_u_u383)) (v_exprLowerVars dtb_u_u384))) in (let dtb_u_u388 = ((((v_keepOutQualified dtb_u_u380) dtb_u_u381) dtb_u_u382) ((v_dropPiBound dtb_u_u387) (v_piBoundNames dtb_u_u384))) in (let dtb_u_u389 = (v_memberDomainOverrides dtb_u_u383) in (((((v_quantifyTopKindsWith (v_memberDomainOf dtb_u_u389)) dtb_u_u388) dtb_u_u386) dtb_u_u384) dtb_u_u385))))))

# 409 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCachedKinds = (fun (dtb_u_u390 : string) (dtb_u_u391 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u392 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u393 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u394 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u395 : Frontend_dAst.t_Expr) (dtb_u_u396 : Base_dSource.t_Span) -> (let dtb_u_u397 = ((B_dData_dList.v_append dtb_u_u394) (B_dData_dList.C_List__x58__x58_ (dtb_u_u395, B_dData_dList.C_List_Nil))) in (let dtb_u_u398 = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) dtb_u_u394)) (v_exprLowerVars dtb_u_u395))) in (let dtb_u_u399 = ((((v_keepOutQualified dtb_u_u390) dtb_u_u391) dtb_u_u392) ((v_dropPiBound dtb_u_u398) (v_piBoundNames dtb_u_u395))) in (let dtb_u_u400 = (v_memberDomainOverrides dtb_u_u394) in (let dtb_u_u401 = ((v_argParamKindsIn dtb_u_u393) dtb_u_u397) in (((((v_quantifyTopKindsWith ((v_kindOverrideOf dtb_u_u400) dtb_u_u401)) dtb_u_u399) dtb_u_u397) dtb_u_u395) dtb_u_u396)))))))

# 440 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_keepOutTbl = (fun (dtb_u_u402 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u403 : string B_dData_dList.t_List) -> (match dtb_u_u403 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u404, dtb_u_u405) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u404) dtb_u_u402) then ((v_keepOutTbl dtb_u_u402) dtb_u_u405) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u404, ((v_keepOutTbl dtb_u_u402) dtb_u_u405))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSig = (fun (dtb_u_u406 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u407 : Frontend_dAst.t_Expr) (dtb_u_u408 : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((v_keepOutTbl dtb_u_u406) ((v_freeNames (fun (dtb_u_u409 : string) -> false)) dtb_u_u407))) dtb_u_u407) dtb_u_u407) dtb_u_u408))

# 445 "Vuna/Compiler/Elab/Sig.vuna"
let v_topPreludeNames = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_typeIntrinsicNames) Base_dIntrinsics.v_preludeValueNames))

# 341 "Vuna/Compiler/Elab/Sig.vuna"
let v_topQuantBanned = (fun (dtb_u_u410 : string B_dData_dList.t_List) -> (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_append dtb_u_u410) v_topPreludeNames)))

# 347 "Vuna/Compiler/Elab/Sig.vuna"
let v_bannedForModule = (fun (dtb_u_u411 : string) (dtb_u_u412 : string B_dData_dList.t_List) -> (v_topQuantBanned ((v_filterNamesInModule dtb_u_u411) dtb_u_u412)))

# 449 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_definedNames = (fun (dtb_u_u413 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u413 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u414, dtb_u_u415) -> (match dtb_u_u414 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u416, dtb_u_u417, dtb_u_u418, dtb_u_u419) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u416, (v_definedNames dtb_u_u415)))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u420, dtb_u_u421, dtb_u_u422) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u420, (v_definedNames dtb_u_u415)))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u423, dtb_u_u424, dtb_u_u425, dtb_u_u426) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u423, (v_definedNames dtb_u_u415)))
  | _ -> (v_definedNames dtb_u_u415)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
