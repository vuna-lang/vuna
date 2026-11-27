open Vuna_runtime
type t_FailCandidate = { f_FailCandidate_fcRank : int; f_FailCandidate_fcPos : int; f_FailCandidate_fcEdges : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 16 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_patNames = (fun (dtb_u_u1 : Frontend_dAst.t_Pat) -> (match dtb_u_u1 with
  | Frontend_dAst.C_Pat_PWild (dtb_u_u2) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u3, dtb_u_u4, dtb_u_u5) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u6 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patNames (B_dData_dPair.v_secondOf dtb_u_u6)))) dtb_u_u4)
  | Frontend_dAst.C_Pat_PCon (dtb_u_u7, dtb_u_u8, dtb_u_u9) -> ((B_dData_dList.v_concatMap v_patNames) dtb_u_u8)
  | Frontend_dAst.C_Pat_PAs (dtb_u_u10, dtb_u_u11, dtb_u_u12) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u10, (v_patNames dtb_u_u11)))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u13, dtb_u_u14) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u13, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 24 "Vuna/Compiler/Elab/Termination.vuna"
let v_patsNames = (fun (dtb_u_u15 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_patNames) dtb_u_u15))

# 27 "Vuna/Compiler/Elab/Termination.vuna"
let v_altPatOf = (fun (dtb_u_u16 : Frontend_dAst.t_Alt) -> (dtb_u_u16).Frontend_dAst.f_Alt_altPat)

# 30 "Vuna/Compiler/Elab/Termination.vuna"
let v_altBodyOf = (fun (dtb_u_u17 : Frontend_dAst.t_Alt) -> (dtb_u_u17).Frontend_dAst.f_Alt_altBody)

# 33 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_altsToPairs = (fun (dtb_u_u18 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match dtb_u_u18 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb_u_u19).Frontend_dAst.f_Alt_altPat; B_dData_dPair.f_Pair_second = (dtb_u_u19).Frontend_dAst.f_Alt_altBody }, (v_altsToPairs dtb_u_u20)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Elab/Termination.vuna"
let v_bindingPatNames = (fun (dtb_u_u21 : Frontend_dAst.t_Binding) -> (v_patNames (dtb_u_u21).Frontend_dAst.f_Binding_bindPat))

# 37 "Vuna/Compiler/Elab/Termination.vuna"
let v_stmtBinderNames = (fun (dtb_u_u22 : Frontend_dAst.t_DoStmt) -> (match dtb_u_u22 with
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u23, dtb_u_u24) -> ((B_dData_dList.v_concatMap v_bindingPatNames) dtb_u_u23)
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u25, dtb_u_u26) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u27, dtb_u_u28, dtb_u_u29) -> (v_patNames dtb_u_u27)
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Termination.vuna"
let v_bindingBinderNames = (fun (dtb_u_u30 : Frontend_dAst.t_Binding) -> (v_patNames (dtb_u_u30).Frontend_dAst.f_Binding_bindPat))

# 42 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_stmtRefsF = (fun (dtb_u_u31 : int) (dtb_u_u32 : string B_dData_dList.t_List) (dtb_u_u33 : Frontend_dAst.t_DoStmt) -> (match dtb_u_u33 with
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u34, dtb_u_u35) -> (((v_exprRefsBindsF (dtb_u_u31 - 1)) dtb_u_u32) dtb_u_u34)
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u36, dtb_u_u37) -> (((v_exprRefsBF (dtb_u_u31 - 1)) dtb_u_u32) dtb_u_u36)
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u38, dtb_u_u39, dtb_u_u40) -> (((v_exprRefsBF (dtb_u_u31 - 1)) dtb_u_u32) dtb_u_u39)
  | _ -> failwith "DT: impossible branch"
))
# 47 "Vuna/Compiler/Elab/Termination.vuna"
and v_refsOfStmtsF = (fun (dtb_u_u41 : int) (dtb_u_u42 : string B_dData_dList.t_List) (dtb_u_u43 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match dtb_u_u43 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u44, dtb_u_u45) -> (if (dtb_u_u41 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_stmtRefsF (dtb_u_u41 - 1)) dtb_u_u42) dtb_u_u44)) (((v_refsOfStmtsF (dtb_u_u41 - 1)) ((B_dData_dList.v_append (v_stmtBinderNames dtb_u_u44)) dtb_u_u42)) dtb_u_u45)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBF = (fun (dtb_u_u46 : int) (dtb_u_u47 : string B_dData_dList.t_List) (dtb_u_u48 : Frontend_dAst.t_Expr) -> (if (dtb_u_u46 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u48 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u49, dtb_u_u50) -> (if ((B_dData_dList.v_memName dtb_u_u49) dtb_u_u47) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb_u_u49, B_dData_dList.C_List_Nil)))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u51, dtb_u_u52) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EStr (dtb_u_u53, dtb_u_u54) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_ELam (dtb_u_u55, dtb_u_u56, dtb_u_u57) -> (((v_exprRefsBF (dtb_u_u46 - 1)) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u55)) dtb_u_u47)) dtb_u_u56)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u58, dtb_u_u59, dtb_u_u60) -> ((B_dData_dList.v_append (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u58)) ((B_dData_dList.v_concatMap ((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47)) dtb_u_u59))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u61, dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u66) -> ((B_dData_dList.v_append (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u64)) (((v_exprRefsBF (dtb_u_u46 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u61, dtb_u_u47))) dtb_u_u65))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u67, dtb_u_u68, dtb_u_u69, dtb_u_u70) -> ((B_dData_dList.v_append (((v_exprRefsBindsF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u67)) (((v_exprRefsBF (dtb_u_u46 - 1)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinderNames) dtb_u_u67)) dtb_u_u47)) dtb_u_u68))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u71, dtb_u_u72, dtb_u_u73) -> ((B_dData_dList.v_append (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u71)) ((B_dData_dList.v_concatMap (fun (dtb_u_u74 : Frontend_dAst.t_Alt) -> (((v_exprRefsBF (dtb_u_u46 - 1)) ((B_dData_dList.v_append (v_patNames (v_altPatOf dtb_u_u74))) dtb_u_u47)) (v_altBodyOf dtb_u_u74)))) dtb_u_u72))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u75, dtb_u_u76, dtb_u_u77, dtb_u_u78) -> ((B_dData_dList.v_append (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u75)) ((B_dData_dList.v_append (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u76)) (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u77)))
  | Frontend_dAst.C_Expr_EField (dtb_u_u79, dtb_u_u80, dtb_u_u81) -> (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u79)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u82, dtb_u_u83, dtb_u_u84) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u85 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) (B_dData_dPair.v_secondOf dtb_u_u85)))) dtb_u_u83)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u86, dtb_u_u87, dtb_u_u88) -> ((B_dData_dList.v_append (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u86)) ((B_dData_dList.v_concatMap (fun (dtb_u_u89 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprRefsBF (dtb_u_u46 - 1)) dtb_u_u47) (B_dData_dPair.v_secondOf dtb_u_u89)))) dtb_u_u87))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u90, dtb_u_u91) -> (((v_refsOfStmtsF (dtb_u_u46 - 1)) dtb_u_u47) dtb_u_u90)
  | _ -> B_dData_dList.C_List_Nil
)))
# 81 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBindsF = (fun (dtb_u_u92 : int) (dtb_u_u93 : string B_dData_dList.t_List) (dtb_u_u94 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u94 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if (dtb_u_u92 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_exprRefsBindingF (dtb_u_u92 - 1)) dtb_u_u93) dtb_u_u95)) (((v_exprRefsBindsF (dtb_u_u92 - 1)) dtb_u_u93) dtb_u_u96)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 89 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsBindingF = (fun (dtb_u_u97 : int) (dtb_u_u98 : string B_dData_dList.t_List) (dtb_u_u99 : Frontend_dAst.t_Binding) -> (match dtb_u_u99 with
  | { Frontend_dAst.f_Binding_bindPat = dtb_u_u100; Frontend_dAst.f_Binding_bindValue = dtb_u_u101; Frontend_dAst.f_Binding_bindSig = dtb_u_u102; Frontend_dAst.f_Binding_bindRef = dtb_u_u103 } -> (if (dtb_u_u97 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (match dtb_u_u101 with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u104) -> (((v_exprRefsBF (dtb_u_u97 - 1)) dtb_u_u98) dtb_u_u104)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u105) -> (((v_exprRefsClausesF (dtb_u_u97 - 1)) dtb_u_u98) dtb_u_u105)
  | _ -> failwith "DT: impossible branch"
)) (match dtb_u_u102 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u106) -> (((v_exprRefsBF (dtb_u_u97 - 1)) dtb_u_u98) (dtb_u_u106).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
# 104 "Vuna/Compiler/Elab/Termination.vuna"
and v_exprRefsClausesF = (fun (dtb_u_u107 : int) (dtb_u_u108 : string B_dData_dList.t_List) (dtb_u_u109 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (if (dtb_u_u107 <= 0) then B_dData_dList.C_List_Nil else ((B_dData_dList.v_append (((v_exprRefsBF (dtb_u_u107 - 1)) ((B_dData_dList.v_append (v_patsNames (dtb_u_u110).Frontend_dAst.f_LocalClause_lcPats)) dtb_u_u108)) (dtb_u_u110).Frontend_dAst.f_LocalClause_lcBody)) (((v_exprRefsClausesF (dtb_u_u107 - 1)) dtb_u_u108) dtb_u_u111)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Elab/Termination.vuna"
let v_exprRefsB = (fun (dtb_u_u112 : string B_dData_dList.t_List) (dtb_u_u113 : Frontend_dAst.t_Expr) -> (((v_exprRefsBF ((Frontend_dAstQuery.v_exprBudget 64) dtb_u_u113)) dtb_u_u112) dtb_u_u113))

# 120 "Vuna/Compiler/Elab/Termination.vuna"
let v_refsOfDef = (fun (dtb_u_u114 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (dtb_u_u115 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprRefsB (v_patsNames (B_dData_dPair.v_firstOf dtb_u_u115))) (B_dData_dPair.v_secondOf dtb_u_u115)))) dtb_u_u114)))

# 123 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_mapEdges = (fun (dtb_u_u116 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u117 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u118); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_filter (fun (dtb_u_u120 : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u120) dtb_u_u116))) (v_refsOfDef (B_dData_dPair.v_secondOf dtb_u_u118))) }, ((v_mapEdges dtb_u_u116) dtb_u_u119)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Termination.vuna"
let v_callGraph = (fun (dtb_u_u121 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_mapEdges (B_dContainer_dHashMap.v_ofNames (Elab_dTermination_dMeasure.v_defNames dtb_u_u121))) dtb_u_u121))

# 131 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjOf = (fun (dtb_u_u122 : string) (dtb_u_u123 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u122) dtb_u_u123) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u124) -> dtb_u_u124
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Elab/Termination.vuna"
let v_adjTblOf = (fun (dtb_u_u125 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u125) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 145 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addSrcs = (fun (dtb_u_u126 : string) (dtb_u_u127 : string B_dData_dList.t_List) (dtb_u_u128 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) -> (match dtb_u_u127 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130) -> (let dtb_u_u131 = (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u129) dtb_u_u128) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u132) -> dtb_u_u132
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in (((v_addSrcs dtb_u_u126) dtb_u_u130) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u129) (B_dData_dList.C_List__x58__x58_ (dtb_u_u126, dtb_u_u131))) dtb_u_u128)))
  | B_dData_dList.C_List_Nil -> dtb_u_u128
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_reverseAdjOf = (fun (dtb_u_u133 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u133 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u134, dtb_u_u135) -> (match dtb_u_u134 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u136; B_dData_dPair.f_Pair_second = dtb_u_u137 } -> (((v_addSrcs dtb_u_u136) dtb_u_u137) (v_reverseAdjOf dtb_u_u135))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_replacePair = (fun (dtb_u_u138 : string) (dtb_u_u139 : string B_dData_dList.t_List) (dtb_u_u140 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u140 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u141, dtb_u_u142) -> (match dtb_u_u141 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u143; B_dData_dPair.f_Pair_second = dtb_u_u144 } -> (if (dtb_u_u143 = dtb_u_u138) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u138; B_dData_dPair.f_Pair_second = dtb_u_u139 }, dtb_u_u142)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u143; B_dData_dPair.f_Pair_second = dtb_u_u144 }, (((v_replacePair dtb_u_u138) dtb_u_u139) dtb_u_u142))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Elab/Termination.vuna"
let v_addEdge = (fun (dtb_u_u145 : string) (dtb_u_u146 : string) (dtb_u_u147 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((B_dData_dList.v_lookupPair dtb_u_u145) dtb_u_u147) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u148) -> (((v_replacePair dtb_u_u145) (B_dData_dList.C_List__x58__x58_ (dtb_u_u146, dtb_u_u148))) dtb_u_u147)
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u145; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u146, B_dData_dList.C_List_Nil)) }, dtb_u_u147))
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_addEdges = (fun (dtb_u_u149 : string) (dtb_u_u150 : string B_dData_dList.t_List) (dtb_u_u151 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u152, dtb_u_u153) -> (((v_addEdges dtb_u_u149) dtb_u_u153) (((v_addEdge dtb_u_u152) dtb_u_u149) dtb_u_u151))
  | B_dData_dList.C_List_Nil -> dtb_u_u151
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_transposeGo = (fun (dtb_u_u154 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u155 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u154 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u156, dtb_u_u157) -> (match dtb_u_u156 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u158; B_dData_dPair.f_Pair_second = dtb_u_u159 } -> ((v_transposeGo dtb_u_u157) (((v_addEdges dtb_u_u158) dtb_u_u159) dtb_u_u155))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u155
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Elab/Termination.vuna"
let[@tail_mod_cons] rec v_dedupTransposed = (fun (dtb_u_u160 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u160 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u162) -> (match dtb_u_u161 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u163; B_dData_dPair.f_Pair_second = dtb_u_u164 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u163; B_dData_dPair.f_Pair_second = (Elab_dTermination_dMeasure.v_dedup dtb_u_u164) }, (v_dedupTransposed dtb_u_u162)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Elab/Termination.vuna"
let v_transpose = (fun (dtb_u_u165 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_dedupTransposed ((v_transposeGo dtb_u_u165) B_dData_dList.C_List_Nil)))

# 183 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgeCount = (fun (dtb_u_u166 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u166 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u167, dtb_u_u168) -> (match dtb_u_u167 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u169; B_dData_dPair.f_Pair_second = dtb_u_u170 } -> ((B_dData_dList.v_length dtb_u_u170) + (v_edgeCount dtb_u_u168))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Elab/Termination.vuna"
let v_graphFuel = (fun (dtb_u_u171 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u172 : string B_dData_dList.t_List) -> (((4 * (B_dData_dList.v_length dtb_u_u172)) + (4 * (v_edgeCount dtb_u_u171))) + 16))

# 191 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsPost = (fun (dtb_u_u173 : (string, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u174 : int) (dtb_u_u175 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u176 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u177 : string B_dData_dList.t_List) -> (if (dtb_u_u174 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u176; B_dData_dPair.f_Pair_second = dtb_u_u177 } else (let dtb_u_u178 = dtb_u_u173 in (match dtb_u_u178 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u179, dtb_u_u180) -> (match dtb_u_u179 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u181; B_dData_dPair.f_Pair_second = dtb_u_u182 } -> (if dtb_u_u182 then (((((v_dfsPost dtb_u_u180) (dtb_u_u174 - 1)) dtb_u_u175) dtb_u_u176) (B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u177))) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u181) dtb_u_u176) then (((((v_dfsPost dtb_u_u180) (dtb_u_u174 - 1)) dtb_u_u175) dtb_u_u176) dtb_u_u177) else (((((v_dfsPost ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u183 : string) -> { B_dData_dPair.f_Pair_first = dtb_u_u183; B_dData_dPair.f_Pair_second = false })) ((v_adjOf dtb_u_u181) dtb_u_u175))) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u181; B_dData_dPair.f_Pair_second = true }, dtb_u_u180)))) (dtb_u_u174 - 1)) dtb_u_u175) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u181) true) dtb_u_u176)) dtb_u_u177)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u176; B_dData_dPair.f_Pair_second = dtb_u_u177 }
  | _ -> failwith "DT: impossible branch"
))))

# 201 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfsAll = (fun (dtb_u_u184 : string B_dData_dList.t_List) (dtb_u_u185 : int) (dtb_u_u186 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u187 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u188 : string B_dData_dList.t_List) -> (match dtb_u_u184 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u189, dtb_u_u190) -> (if (dtb_u_u185 <= 0) then dtb_u_u188 else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u189) dtb_u_u187) then (((((v_dfsAll dtb_u_u190) (dtb_u_u185 - 1)) dtb_u_u186) dtb_u_u187) dtb_u_u188) else (match (((((v_dfsPost (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u189; B_dData_dPair.f_Pair_second = false }, B_dData_dList.C_List_Nil))) dtb_u_u185) dtb_u_u186) dtb_u_u187) dtb_u_u188) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u191; B_dData_dPair.f_Pair_second = dtb_u_u192 } -> (((((v_dfsAll dtb_u_u190) (dtb_u_u185 - 1)) dtb_u_u186) dtb_u_u191) dtb_u_u192)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> dtb_u_u188
  | _ -> failwith "DT: impossible branch"
))

# 213 "Vuna/Compiler/Elab/Termination.vuna"
let v_postOrder = (fun (dtb_u_u193 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u194 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u195 : string B_dData_dList.t_List) -> (let dtb_u_u196 = (((((v_dfsAll dtb_u_u195) ((v_graphFuel dtb_u_u194) dtb_u_u195)) dtb_u_u193) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_length dtb_u_u196) = (B_dData_dList.v_length dtb_u_u195)); B_dData_dPair.f_Pair_second = dtb_u_u196 }))

# 220 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectComp = (fun (dtb_u_u197 : string B_dData_dList.t_List) (dtb_u_u198 : int) (dtb_u_u199 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u200 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u201 : string B_dData_dList.t_List) -> (match dtb_u_u197 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u202, dtb_u_u203) -> (if (dtb_u_u198 <= 0) then { B_dData_dPair.f_Pair_first = dtb_u_u200; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u201; B_dData_dPair.f_Pair_second = false } } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u202) dtb_u_u200) then (((((v_collectComp dtb_u_u203) (dtb_u_u198 - 1)) dtb_u_u199) dtb_u_u200) dtb_u_u201) else (((((v_collectComp ((B_dData_dList.v_append ((v_adjOf dtb_u_u202) dtb_u_u199)) dtb_u_u203)) (dtb_u_u198 - 1)) dtb_u_u199) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u202) true) dtb_u_u200)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u202, dtb_u_u201)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u200; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u201; B_dData_dPair.f_Pair_second = true } }
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_sccOf = (fun (dtb_u_u204 : string B_dData_dList.t_List) (dtb_u_u205 : int) (dtb_u_u206 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u207 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u208 : string B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u204 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u209, dtb_u_u210) -> (if (dtb_u_u205 <= 0) then { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = dtb_u_u208 } else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u209) dtb_u_u207) then (((((v_sccOf dtb_u_u210) (dtb_u_u205 - 1)) dtb_u_u206) dtb_u_u207) dtb_u_u208) else (let dtb_u_u211 = (((((v_collectComp (B_dData_dList.C_List__x58__x58_ (dtb_u_u209, B_dData_dList.C_List_Nil))) (dtb_u_u205 - 1)) dtb_u_u206) dtb_u_u207) B_dData_dList.C_List_Nil) in (match dtb_u_u211 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u212; B_dData_dPair.f_Pair_second = dtb_u_u213 } -> (match dtb_u_u213 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u214; B_dData_dPair.f_Pair_second = dtb_u_u215 } -> (if dtb_u_u215 then (((((v_sccOf dtb_u_u210) (dtb_u_u205 - 1)) dtb_u_u206) dtb_u_u212) (B_dData_dList.C_List__x58__x58_ (dtb_u_u214, dtb_u_u208))) else { B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u214, dtb_u_u208)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = dtb_u_u208 }
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintEdge = (fun (dtb_u_u216 : string) (dtb_u_u217 : string) (dtb_u_u218 : int) (dtb_u_u219 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u220 : string B_dData_dList.t_List) (dtb_u_u221 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u222 : Base_dSource.t_Span) (dtb_u_u223 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match ((((Elab_dTermination_dMeasure.v_argRelHint dtb_u_u218) dtb_u_u219) dtb_u_u221) dtb_u_u220) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u223
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u224) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode dtb_u_u216) dtb_u_u217) dtb_u_u224) dtb_u_u222) dtb_u_u223)
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_extendClauseSizes = (fun (dtb_u_u225 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u226 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u227 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u227 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u228, dtb_u_u229) -> (((v_extendClauseSizes dtb_u_u225) ((((Elab_dTermination_dMeasure.v_extendSizesStrict dtb_u_u225) dtb_u_u226) (dtb_u_u228).Frontend_dAst.f_LocalClause_lcBody) (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))))) dtb_u_u229)
  | B_dData_dList.C_List_Nil -> dtb_u_u226
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Elab/Termination.vuna"
let v_extendBindingSizes = (fun (dtb_u_u230 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u231 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u232 : Frontend_dAst.t_Binding) -> (match (dtb_u_u232).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u233) -> ((((Elab_dTermination_dMeasure.v_extendSizesStrict dtb_u_u230) dtb_u_u231) dtb_u_u233) (dtb_u_u232).Frontend_dAst.f_Binding_bindPat)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u234) -> (((v_extendClauseSizes dtb_u_u230) dtb_u_u231) dtb_u_u234)
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_strWalk = (fun (dtb_u_u235 : int) (dtb_u_u236 : string B_dData_dList.t_List) (dtb_u_u237 : string B_dData_dList.t_List) (dtb_u_u238 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u239 : int) (dtb_u_u240 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u241 : string) (dtb_u_u242 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u243 : string B_dData_dList.t_List) (dtb_u_u244 : Frontend_dAst.t_Expr) (dtb_u_u245 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u235 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u245) else (match dtb_u_u244 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u246, dtb_u_u247, dtb_u_u248) -> (((((((((((((v_strWalkEApp (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u246) dtb_u_u247) (Frontend_dAst.v_nodeRefSpan dtb_u_u248)) dtb_u_u245)
  | Frontend_dAst.C_Expr_ECase (dtb_u_u249, dtb_u_u250, dtb_u_u251) -> ((((((((((((v_strWalkAlts (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u249) (v_altsToPairs dtb_u_u250)) (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u249) dtb_u_u245))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u252, dtb_u_u253, dtb_u_u254, dtb_u_u255) -> (let dtb_u_u256 = (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u252) dtb_u_u245) in (let dtb_u_u257 = (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardThenPosVars dtb_u_u252)) dtb_u_u243)) dtb_u_u253) dtb_u_u256) in (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_guardElsePosVars dtb_u_u252)) dtb_u_u243)) dtb_u_u254) dtb_u_u257)))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u258, dtb_u_u259, dtb_u_u260) -> (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u259) dtb_u_u245)
  | Frontend_dAst.C_Expr_ELet (dtb_u_u261, dtb_u_u262, dtb_u_u263, dtb_u_u264) -> (let dtb_u_u265 = (((Elab_dTermination_dMeasure.v_extendByBinds dtb_u_u238) dtb_u_u261) dtb_u_u240) in (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u265) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u262) (((((((((((v_strWalkBinds (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u261) dtb_u_u245)))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u266, dtb_u_u267, dtb_u_u268, dtb_u_u269, dtb_u_u270, dtb_u_u271) -> (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u270) (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u269) dtb_u_u245))
  | Frontend_dAst.C_Expr_EField (dtb_u_u272, dtb_u_u273, dtb_u_u274) -> (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u272) dtb_u_u245)
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u275, dtb_u_u276, dtb_u_u277) -> (((((((((((v_strWalkFields (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u276) dtb_u_u245)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u278, dtb_u_u279, dtb_u_u280) -> (((((((((((v_strWalkFields (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u279) (((((((((((v_strWalk (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u278) dtb_u_u245))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u281, dtb_u_u282) -> (((((((((((v_strWalkStmts (dtb_u_u235 - 1)) dtb_u_u236) dtb_u_u237) dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u243) dtb_u_u281) dtb_u_u245)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u283, dtb_u_u284) -> (if ((B_dData_dList.v_memName dtb_u_u283) dtb_u_u236) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u245) else dtb_u_u245)
  | _ -> dtb_u_u245
)))
# 283 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEApp = (fun (dtb_u_u285 : int) (dtb_u_u286 : string B_dData_dList.t_List) (dtb_u_u287 : string B_dData_dList.t_List) (dtb_u_u288 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u289 : int) (dtb_u_u290 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u291 : string) (dtb_u_u292 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u293 : string B_dData_dList.t_List) (dtb_u_u294 : Frontend_dAst.t_Expr) (dtb_u_u295 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u296 : Base_dSource.t_Span) (dtb_u_u297 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u285 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u297) else (match ((Elab_dTermination_dMeasure.v_groupHead dtb_u_u286) dtb_u_u294) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u298) -> (match ((((((((Elab_dTermination_dMeasure.v_argRel dtb_u_u289) dtb_u_u295) dtb_u_u290) dtb_u_u287) dtb_u_u288) dtb_u_u291) dtb_u_u292) dtb_u_u293) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid (((((((((((v_strWalkArgs (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293) dtb_u_u295) ((((((((v_hintEdge dtb_u_u291) dtb_u_u298) dtb_u_u289) dtb_u_u295) dtb_u_u287) dtb_u_u290) dtb_u_u296) dtb_u_u297)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u299) -> (((((((((((v_strWalkArgs (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293) dtb_u_u295) (((((Elab_dTermination_dMeasure.v_addEdgeMode dtb_u_u291) dtb_u_u298) dtb_u_u299) dtb_u_u296) dtb_u_u297))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u294 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u300, dtb_u_u301) -> (match (Elab_dTermination_dMeasure.v_hofSpecOf dtb_u_u300) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u302) -> (match ((Elab_dTermination_dMeasure.v_hofLambdaCall dtb_u_u302) dtb_u_u295) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u303) -> (let dtb_u_u304 = (((((((((((v_strWalkArgs (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293) (dtb_u_u303).Elab_dTermination_dMeasure.f_HofCall_hofSideArgs) dtb_u_u297) in (let dtb_u_u305 = (((Elab_dTermination_dMeasure.v_extendElemSizes dtb_u_u290) (dtb_u_u303).Elab_dTermination_dMeasure.f_HofCall_hofListExpr) (dtb_u_u303).Elab_dTermination_dMeasure.f_HofCall_hofElemBinder) in (((((((((((v_strWalk (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u305) dtb_u_u291) dtb_u_u292) dtb_u_u293) (dtb_u_u303).Elab_dTermination_dMeasure.f_HofCall_hofBody) dtb_u_u304)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((dtb_u_u302).Elab_dTermination_dMeasure.f_HofSpec_hofLambdaArity = 1) then ((((((((((((v_strWalkEAppMap (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u297) else ((((((((((((v_strWalkApp (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u297))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((v_strWalkApp (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u297)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((((((v_strWalkApp (dtb_u_u285 - 1)) dtb_u_u286) dtb_u_u287) dtb_u_u288) dtb_u_u289) dtb_u_u290) dtb_u_u291) dtb_u_u292) dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u297)
)
  | _ -> failwith "DT: impossible branch"
)))
# 308 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkEAppMap = (fun (dtb_u_u306 : int) (dtb_u_u307 : string B_dData_dList.t_List) (dtb_u_u308 : string B_dData_dList.t_List) (dtb_u_u309 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u310 : int) (dtb_u_u311 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u312 : string) (dtb_u_u313 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u314 : string B_dData_dList.t_List) (dtb_u_u315 : Frontend_dAst.t_Expr) (dtb_u_u316 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u317 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u306 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u317) else (let dtb_u_u318 = dtb_u_u316 in (match dtb_u_u318 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u319, dtb_u_u320) -> (match dtb_u_u320 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u321, dtb_u_u322) -> (match dtb_u_u322 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u323 = dtb_u_u319 in (match dtb_u_u323 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u324, dtb_u_u325) -> (if ((B_dData_dList.v_memName dtb_u_u324) dtb_u_u307) then ((((((((((((((v_strWalkMapPartialInline (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u324) B_dData_dList.C_List_Nil) dtb_u_u321) (Frontend_dAst.v_nodeRefSpan dtb_u_u325)) dtb_u_u317) else (((((((((((v_strWalkArgs (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u316) dtb_u_u317))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u326, dtb_u_u327, dtb_u_u328) -> (match dtb_u_u326 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u329, dtb_u_u330) -> (if ((B_dData_dList.v_memName dtb_u_u329) dtb_u_u307) then ((((((((((((((v_strWalkMapPartialInline (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u329) dtb_u_u327) dtb_u_u321) (Frontend_dAst.v_nodeRefSpan dtb_u_u328)) dtb_u_u317) else (((((((((((v_strWalkArgs (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u316) dtb_u_u317))
  | _ -> (((((((((((v_strWalkArgs (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u316) dtb_u_u317)
)
  | _ -> (((((((((((v_strWalkArgs (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u316) dtb_u_u317)
))
  | _ -> (((((((((((v_strWalkArgs (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u316) dtb_u_u317)
)
  | _ -> (((((((((((v_strWalkArgs (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u316) dtb_u_u317)
)
  | _ -> (((((((((((v_strWalkArgs (dtb_u_u306 - 1)) dtb_u_u307) dtb_u_u308) dtb_u_u309) dtb_u_u310) dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u316) dtb_u_u317)
))))
# 321 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkMapPartialInline = (fun (dtb_u_u331 : int) (dtb_u_u332 : string B_dData_dList.t_List) (dtb_u_u333 : string B_dData_dList.t_List) (dtb_u_u334 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u335 : int) (dtb_u_u336 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u337 : string) (dtb_u_u338 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u339 : string B_dData_dList.t_List) (dtb_u_u340 : string) (dtb_u_u341 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u342 : Frontend_dAst.t_Expr) (dtb_u_u343 : Base_dSource.t_Span) (dtb_u_u344 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u331 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u344) else (let dtb_u_u345 = (((((((((((v_strWalk (dtb_u_u331 - 1)) dtb_u_u332) dtb_u_u333) dtb_u_u334) dtb_u_u335) dtb_u_u336) dtb_u_u337) dtb_u_u338) dtb_u_u339) dtb_u_u342) dtb_u_u344) in (let dtb_u_u346 = (((Elab_dTermination_dMeasure.v_extendElemSizes dtb_u_u336) dtb_u_u342) "$elem") in (let dtb_u_u347 = ((B_dData_dList.v_append dtb_u_u341) (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("$elem", (Frontend_dAst.v_detachedNodeRef dtb_u_u343))), B_dData_dList.C_List_Nil))) in (let dtb_u_u348 = (((((((((((v_strWalkArgs (dtb_u_u331 - 1)) dtb_u_u332) dtb_u_u333) dtb_u_u334) dtb_u_u335) dtb_u_u336) dtb_u_u337) dtb_u_u338) dtb_u_u339) dtb_u_u341) dtb_u_u345) in (match ((((((((Elab_dTermination_dMeasure.v_argRel dtb_u_u335) dtb_u_u347) dtb_u_u346) dtb_u_u333) dtb_u_u334) dtb_u_u337) dtb_u_u338) dtb_u_u339) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u348)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u349) -> (((((Elab_dTermination_dMeasure.v_addEdgeMode dtb_u_u337) dtb_u_u340) dtb_u_u349) dtb_u_u343) dtb_u_u348)
  | _ -> failwith "DT: impossible branch"
)))))))
# 335 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkApp = (fun (dtb_u_u350 : int) (dtb_u_u351 : string B_dData_dList.t_List) (dtb_u_u352 : string B_dData_dList.t_List) (dtb_u_u353 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u354 : int) (dtb_u_u355 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u356 : string) (dtb_u_u357 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u358 : string B_dData_dList.t_List) (dtb_u_u359 : Frontend_dAst.t_Expr) (dtb_u_u360 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u361 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u350 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u361) else (((((((((((v_strWalkArgs (dtb_u_u350 - 1)) dtb_u_u351) dtb_u_u352) dtb_u_u353) dtb_u_u354) dtb_u_u355) dtb_u_u356) dtb_u_u357) dtb_u_u358) dtb_u_u360) (((((((((((v_strWalk (dtb_u_u350 - 1)) dtb_u_u351) dtb_u_u352) dtb_u_u353) dtb_u_u354) dtb_u_u355) dtb_u_u356) dtb_u_u357) dtb_u_u358) dtb_u_u359) dtb_u_u361))))
# 353 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkArgs = (fun (dtb_u_u362 : int) (dtb_u_u363 : string B_dData_dList.t_List) (dtb_u_u364 : string B_dData_dList.t_List) (dtb_u_u365 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u366 : int) (dtb_u_u367 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u368 : string) (dtb_u_u369 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u370 : string B_dData_dList.t_List) (dtb_u_u371 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u372 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u371 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u373, dtb_u_u374) -> (if (dtb_u_u362 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u372) else (((((((((((v_strWalkArgs (dtb_u_u362 - 1)) dtb_u_u363) dtb_u_u364) dtb_u_u365) dtb_u_u366) dtb_u_u367) dtb_u_u368) dtb_u_u369) dtb_u_u370) dtb_u_u374) (((((((((((v_strWalk (dtb_u_u362 - 1)) dtb_u_u363) dtb_u_u364) dtb_u_u365) dtb_u_u366) dtb_u_u367) dtb_u_u368) dtb_u_u369) dtb_u_u370) dtb_u_u373) dtb_u_u372)))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u362 <= 0) then dtb_u_u372 else dtb_u_u372)
  | _ -> failwith "DT: impossible branch"
))
# 373 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkAlts = (fun (dtb_u_u375 : int) (dtb_u_u376 : string B_dData_dList.t_List) (dtb_u_u377 : string B_dData_dList.t_List) (dtb_u_u378 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u379 : int) (dtb_u_u380 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u381 : string) (dtb_u_u382 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u383 : string B_dData_dList.t_List) (dtb_u_u384 : Frontend_dAst.t_Expr) (dtb_u_u385 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u386 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u385 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u387, dtb_u_u388) -> (match dtb_u_u387 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u389; B_dData_dPair.f_Pair_second = dtb_u_u390 } -> (if (dtb_u_u375 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u386) else ((((((((((((v_strWalkAlts (dtb_u_u375 - 1)) dtb_u_u376) dtb_u_u377) dtb_u_u378) dtb_u_u379) dtb_u_u380) dtb_u_u381) dtb_u_u382) dtb_u_u383) dtb_u_u384) dtb_u_u388) (((((((((((v_strWalk (dtb_u_u375 - 1)) dtb_u_u376) dtb_u_u377) dtb_u_u378) dtb_u_u379) ((((Elab_dTermination_dMeasure.v_extendSizesStrict dtb_u_u378) dtb_u_u380) dtb_u_u384) dtb_u_u389)) dtb_u_u381) dtb_u_u382) dtb_u_u383) dtb_u_u390) dtb_u_u386)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u375 <= 0) then dtb_u_u386 else dtb_u_u386)
  | _ -> failwith "DT: impossible branch"
))
# 394 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinds = (fun (dtb_u_u391 : int) (dtb_u_u392 : string B_dData_dList.t_List) (dtb_u_u393 : string B_dData_dList.t_List) (dtb_u_u394 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u395 : int) (dtb_u_u396 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u397 : string) (dtb_u_u398 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u399 : string B_dData_dList.t_List) (dtb_u_u400 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u401 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u400 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u402, dtb_u_u403) -> (if (dtb_u_u391 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u401) else (((((((((((v_strWalkBinds (dtb_u_u391 - 1)) dtb_u_u392) dtb_u_u393) dtb_u_u394) dtb_u_u395) (((v_extendBindingSizes dtb_u_u394) dtb_u_u396) dtb_u_u402)) dtb_u_u397) dtb_u_u398) dtb_u_u399) dtb_u_u403) (((((((((((v_strWalkBinding (dtb_u_u391 - 1)) dtb_u_u392) dtb_u_u393) dtb_u_u394) dtb_u_u395) dtb_u_u396) dtb_u_u397) dtb_u_u398) dtb_u_u399) dtb_u_u402) dtb_u_u401)))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u391 <= 0) then dtb_u_u401 else dtb_u_u401)
  | _ -> failwith "DT: impossible branch"
))
# 414 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkBinding = (fun (dtb_u_u404 : int) (dtb_u_u405 : string B_dData_dList.t_List) (dtb_u_u406 : string B_dData_dList.t_List) (dtb_u_u407 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u408 : int) (dtb_u_u409 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u410 : string) (dtb_u_u411 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u412 : string B_dData_dList.t_List) (dtb_u_u413 : Frontend_dAst.t_Binding) (dtb_u_u414 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (if (dtb_u_u404 <= 0) then dtb_u_u414 else (let dtb_u_u415 = (match (dtb_u_u413).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u417) -> (((((((((((v_strWalk (dtb_u_u404 - 1)) dtb_u_u405) dtb_u_u406) dtb_u_u407) dtb_u_u408) dtb_u_u409) dtb_u_u410) dtb_u_u411) dtb_u_u412) dtb_u_u417) dtb_u_u414)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u418) -> (((((((((((v_strWalkClauses (dtb_u_u404 - 1)) dtb_u_u405) dtb_u_u406) dtb_u_u407) dtb_u_u408) dtb_u_u409) dtb_u_u410) dtb_u_u411) dtb_u_u412) dtb_u_u418) dtb_u_u414)
  | _ -> failwith "DT: impossible branch"
) in (match (dtb_u_u413).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u416) -> (((((((((((v_strWalk (dtb_u_u404 - 1)) dtb_u_u405) dtb_u_u406) dtb_u_u407) dtb_u_u408) dtb_u_u409) dtb_u_u410) dtb_u_u411) dtb_u_u412) (dtb_u_u416).Frontend_dAst.f_BindingSig_sigType) dtb_u_u415)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u415
  | _ -> failwith "DT: impossible branch"
))))
# 428 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkClauses = (fun (dtb_u_u419 : int) (dtb_u_u420 : string B_dData_dList.t_List) (dtb_u_u421 : string B_dData_dList.t_List) (dtb_u_u422 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u423 : int) (dtb_u_u424 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u425 : string) (dtb_u_u426 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u427 : string B_dData_dList.t_List) (dtb_u_u428 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (dtb_u_u429 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u428 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u430, dtb_u_u431) -> (if (dtb_u_u419 <= 0) then dtb_u_u429 else (((((((((((v_strWalkClauses (dtb_u_u419 - 1)) dtb_u_u420) dtb_u_u421) dtb_u_u422) dtb_u_u423) dtb_u_u424) dtb_u_u425) dtb_u_u426) dtb_u_u427) dtb_u_u431) (((((((((((v_strWalk (dtb_u_u419 - 1)) dtb_u_u420) dtb_u_u421) dtb_u_u422) dtb_u_u423) dtb_u_u424) dtb_u_u425) dtb_u_u426) dtb_u_u427) (dtb_u_u430).Frontend_dAst.f_LocalClause_lcBody) dtb_u_u429)))
  | B_dData_dList.C_List_Nil -> dtb_u_u429
  | _ -> failwith "DT: impossible branch"
))
# 462 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkFields = (fun (dtb_u_u432 : int) (dtb_u_u433 : string B_dData_dList.t_List) (dtb_u_u434 : string B_dData_dList.t_List) (dtb_u_u435 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u436 : int) (dtb_u_u437 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u438 : string) (dtb_u_u439 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u440 : string B_dData_dList.t_List) (dtb_u_u441 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u442 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u441 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u443, dtb_u_u444) -> (match dtb_u_u443 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u445; B_dData_dPair.f_Pair_second = dtb_u_u446 } -> (if (dtb_u_u432 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u442) else (((((((((((v_strWalkFields (dtb_u_u432 - 1)) dtb_u_u433) dtb_u_u434) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u438) dtb_u_u439) dtb_u_u440) dtb_u_u444) (((((((((((v_strWalk (dtb_u_u432 - 1)) dtb_u_u433) dtb_u_u434) dtb_u_u435) dtb_u_u436) dtb_u_u437) dtb_u_u438) dtb_u_u439) dtb_u_u440) dtb_u_u446) dtb_u_u442)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u432 <= 0) then dtb_u_u442 else dtb_u_u442)
  | _ -> failwith "DT: impossible branch"
))
# 482 "Vuna/Compiler/Elab/Termination.vuna"
and v_strWalkStmts = (fun (dtb_u_u447 : int) (dtb_u_u448 : string B_dData_dList.t_List) (dtb_u_u449 : string B_dData_dList.t_List) (dtb_u_u450 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u451 : int) (dtb_u_u452 : (string, (int, (int, int B_dData_dList.t_List) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u453 : string) (dtb_u_u454 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u455 : string B_dData_dList.t_List) (dtb_u_u456 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u457 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u456 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u458, dtb_u_u459) -> (if (dtb_u_u447 <= 0) then (Elab_dTermination_dMeasure.v_markInvalid dtb_u_u457) else (match dtb_u_u458 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u460, dtb_u_u461, dtb_u_u462) -> (((((((((((v_strWalkStmts (dtb_u_u447 - 1)) dtb_u_u448) dtb_u_u449) dtb_u_u450) dtb_u_u451) ((((Elab_dTermination_dMeasure.v_extendSizesStrict dtb_u_u450) dtb_u_u452) dtb_u_u461) dtb_u_u460)) dtb_u_u453) dtb_u_u454) dtb_u_u455) dtb_u_u459) (((((((((((v_strWalk (dtb_u_u447 - 1)) dtb_u_u448) dtb_u_u449) dtb_u_u450) dtb_u_u451) dtb_u_u452) dtb_u_u453) dtb_u_u454) dtb_u_u455) dtb_u_u461) dtb_u_u457))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u463, dtb_u_u464) -> (((((((((((v_strWalkStmts (dtb_u_u447 - 1)) dtb_u_u448) dtb_u_u449) dtb_u_u450) dtb_u_u451) dtb_u_u452) dtb_u_u453) dtb_u_u454) dtb_u_u455) dtb_u_u459) (((((((((((v_strWalk (dtb_u_u447 - 1)) dtb_u_u448) dtb_u_u449) dtb_u_u450) dtb_u_u451) dtb_u_u452) dtb_u_u453) dtb_u_u454) dtb_u_u455) dtb_u_u463) dtb_u_u457))
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u465, dtb_u_u466) -> (((((((((((v_strWalkStmts (dtb_u_u447 - 1)) dtb_u_u448) dtb_u_u449) dtb_u_u450) dtb_u_u451) (((Elab_dTermination_dMeasure.v_extendByBinds dtb_u_u450) dtb_u_u465) dtb_u_u452)) dtb_u_u453) dtb_u_u454) dtb_u_u455) dtb_u_u459) (((((((((((v_strWalkBinds (dtb_u_u447 - 1)) dtb_u_u448) dtb_u_u449) dtb_u_u450) dtb_u_u451) dtb_u_u452) dtb_u_u453) dtb_u_u454) dtb_u_u455) dtb_u_u465) dtb_u_u457))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u447 <= 0) then dtb_u_u457 else dtb_u_u457)
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Elab/Termination.vuna"
let v_strClause = (fun (dtb_u_u467 : string B_dData_dList.t_List) (dtb_u_u468 : string B_dData_dList.t_List) (dtb_u_u469 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u470 : int) (dtb_u_u471 : string) (dtb_u_u472 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u473 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((((((((((v_strWalk ((Frontend_dAstQuery.v_exprBudget 32) (B_dData_dPair.v_secondOf dtb_u_u473))) dtb_u_u467) dtb_u_u468) dtb_u_u469) dtb_u_u470) (Elab_dTermination_dMeasure.v_strSizeEntries (B_dData_dPair.v_firstOf dtb_u_u473))) dtb_u_u471) dtb_u_u472) B_dData_dList.C_List_Nil) (B_dData_dPair.v_secondOf dtb_u_u473)) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))

# 511 "Vuna/Compiler/Elab/Termination.vuna"
let v_groupMessage = (fun (dtb_u_u474 : string B_dData_dList.t_List) -> (match dtb_u_u474 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u475, dtb_u_u476) -> (match dtb_u_u476 with
  | B_dData_dList.C_List_Nil -> (dtb_u_u475 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma dtb_u_u474); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (Elab_dTermination_dMeasure.v_joinComma dtb_u_u474); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

# 529 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_applyCallFields = (fun (dtb_u_u477 : int) (dtb_u_u478 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u479 : Base_dDiag.t_Diagnostic) -> (match dtb_u_u478 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u480, dtb_u_u481) -> (match dtb_u_u480 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u482; B_dData_dPair.f_Pair_second = dtb_u_u483 } -> (match dtb_u_u482 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u484; B_dData_dPair.f_Pair_second = dtb_u_u485 } -> (match dtb_u_u484 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u486; B_dData_dPair.f_Pair_second = dtb_u_u487 } -> (((v_applyCallFields dtb_u_u477) dtb_u_u481) ((Base_dDiag.v_withField (Base_dDiag.C_DiagField_FieldCall ({ Base_dDiag.f_CallInfo_callCallee = dtb_u_u487; Base_dDiag.f_CallInfo_callArg = ("argument " ^ (string_of_int dtb_u_u477)); Base_dDiag.f_CallInfo_callRelation = (Elab_dTermination_dMeasure.v_relText dtb_u_u485); Base_dDiag.f_CallInfo_callSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u483)) }))) dtb_u_u479))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u479
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Elab/Termination.vuna"
let v_cannotProveMsgEdges = (fun (dtb_u_u488 : string B_dData_dList.t_List) (dtb_u_u489 : int) (dtb_u_u490 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u491 = (v_groupMessage dtb_u_u488) in (let dtb_u_u492 = ((Base_dDiagnostics_dTc.v_tcMsg (Base_dDiagnostics_dTc.C_TcErr_CannotProveTermination (dtb_u_u491))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u491, B_dData_dVec.C_Vec_Nil))) in (((v_applyCallFields dtb_u_u489) dtb_u_u490) (let dtb_u_u493 = dtb_u_u490 in (match dtb_u_u493 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u494, dtb_u_u495) -> (match dtb_u_u494 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u496; B_dData_dPair.f_Pair_second = dtb_u_u497 } -> ((Base_dDiag.v_withFallbackSpan dtb_u_u497) dtb_u_u492)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsSynthetic) dtb_u_u492)
  | _ -> failwith "DT: impossible branch"
))))))

# 537 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectClauses = (fun (dtb_u_u498 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u499 : string B_dData_dList.t_List) (dtb_u_u500 : string B_dData_dList.t_List) (dtb_u_u501 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u502 : int) (dtb_u_u503 : string) (dtb_u_u504 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u505 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u498 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u506, dtb_u_u507) -> (if (B_dData_dPair.v_firstOf dtb_u_u505) then (let dtb_u_u508 = (((((((v_strClause dtb_u_u499) dtb_u_u500) dtb_u_u501) dtb_u_u502) dtb_u_u503) dtb_u_u504) dtb_u_u506) in (match dtb_u_u508 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u509; B_dData_dPair.f_Pair_second = dtb_u_u510 } -> (if dtb_u_u509 then ((((((((v_collectClauses dtb_u_u507) dtb_u_u499) dtb_u_u500) dtb_u_u501) dtb_u_u502) dtb_u_u503) dtb_u_u504) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf dtb_u_u505)) dtb_u_u510) }) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = false; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf dtb_u_u505)) dtb_u_u510) })))
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC (dtb_u_u505)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u505))
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_collectMeasure = (fun (dtb_u_u511 : string B_dData_dList.t_List) (dtb_u_u512 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u513 : string B_dData_dList.t_List) (dtb_u_u514 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u515 : int) (dtb_u_u516 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u517 : string B_dData_dList.t_List) (dtb_u_u518 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u517 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u519, dtb_u_u520) -> ((Base_dCommon.v_bind ((((((((v_collectClauses ((Elab_dTermination_dMeasure.v_clausesOfDefTbl dtb_u_u519) dtb_u_u512)) dtb_u_u511) dtb_u_u513) dtb_u_u514) dtb_u_u515) dtb_u_u519) dtb_u_u516) dtb_u_u518)) (fun (dtb_u_u521 : (bool, (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((((((v_collectMeasure dtb_u_u511) dtb_u_u512) dtb_u_u513) dtb_u_u514) dtb_u_u515) dtb_u_u516) dtb_u_u520) dtb_u_u521)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u518))
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Elab/Termination.vuna"
let v_emptyFail = (fun (dtb_u_u522 : int) -> { f_FailCandidate_fcRank = 0; f_FailCandidate_fcPos = dtb_u_u522; f_FailCandidate_fcEdges = B_dData_dList.C_List_Nil })

# 565 "Vuna/Compiler/Elab/Termination.vuna"
let v_hintRankOf = (fun (dtb_u_u523 : int) -> (if (dtb_u_u523 = Elab_dTermination_dMeasure.v_relMissingGuard) then 4 else (if (dtb_u_u523 = Elab_dTermination_dMeasure.v_relAscending) then 4 else (if (dtb_u_u523 = Elab_dTermination_dMeasure.v_relUnknownSize) then 3 else (if (dtb_u_u523 = Elab_dTermination_dMeasure.v_relOtherPosition) then 2 else (if (dtb_u_u523 = Elab_dTermination_dMeasure.v_relNoRelation) then 1 else 0))))))

# 575 "Vuna/Compiler/Elab/Termination.vuna"
let v_edgeRankOf = (fun (dtb_u_u524 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match dtb_u_u524 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u525; B_dData_dPair.f_Pair_second = dtb_u_u526 } -> (match dtb_u_u525 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u527; B_dData_dPair.f_Pair_second = dtb_u_u528 } -> (match dtb_u_u527 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u529; B_dData_dPair.f_Pair_second = dtb_u_u530 } -> (v_hintRankOf dtb_u_u528)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_edgesRankOf = (fun (dtb_u_u531 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u531 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u532, dtb_u_u533) -> ((Elab_dTermination_dMeasure.v_maxInt (v_edgeRankOf dtb_u_u532)) (v_edgesRankOf dtb_u_u533))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Elab/Termination.vuna"
let v_betterFail = (fun (dtb_u_u534 : int) (dtb_u_u535 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u536 : t_FailCandidate) -> (let dtb_u_u537 = (v_edgesRankOf dtb_u_u535) in (if (dtb_u_u537 > (dtb_u_u536).f_FailCandidate_fcRank) then { f_FailCandidate_fcRank = dtb_u_u537; f_FailCandidate_fcPos = dtb_u_u534; f_FailCandidate_fcEdges = dtb_u_u535 } else dtb_u_u536)))

# 629 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_computePosFactsWork = (fun (dtb_u_u538 : string B_dData_dList.t_List) (dtb_u_u539 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u540 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u541 : int) (dtb_u_u542 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u543 : string B_dData_dList.t_List) -> (if (dtb_u_u541 <= 0) then dtb_u_u542 else (let dtb_u_u544 = (B_dContainer_dHashMap.v_ofNames dtb_u_u538) in (let dtb_u_u545 = (((((Elab_dTermination_dMeasure.v_posScanNames dtb_u_u544) dtb_u_u539) (Elab_dTermination_dMeasure.v_posTblOf dtb_u_u542)) dtb_u_u543) { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (let dtb_u_u546 = ((Elab_dTermination_dMeasure.v_posFilterTbl (B_dData_dPair.v_firstOf dtb_u_u545)) (Elab_dTermination_dMeasure.v_posTblOf (B_dData_dPair.v_secondOf dtb_u_u545))) in (let dtb_u_u547 = ((Elab_dTermination_dMeasure.v_posFilterTbl dtb_u_u546) (Elab_dTermination_dMeasure.v_posTblOf dtb_u_u542)) in (let dtb_u_u548 = ((Elab_dTermination_dMeasure.v_posUnionTbl dtb_u_u542) dtb_u_u546) in (let dtb_u_u549 = (Elab_dTermination_dMeasure.v_dedup ((B_dData_dList.v_concatMap (fun (dtb_u_u550 : string) -> ((v_adjOf dtb_u_u550) dtb_u_u540))) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u547))) in (match dtb_u_u549 with
  | B_dData_dList.C_List_Nil -> dtb_u_u548
  | _ -> ((((((v_computePosFactsWork dtb_u_u538) dtb_u_u539) dtb_u_u540) (dtb_u_u541 - 1)) dtb_u_u548) dtb_u_u549)
)))))))))

# 650 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_dfunNames = (fun (dtb_u_u551 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u551 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u552, dtb_u_u553) -> (match dtb_u_u552 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u554, dtb_u_u555, dtb_u_u556, dtb_u_u557) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u554, (v_dfunNames dtb_u_u553)))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u558, dtb_u_u559, dtb_u_u560, dtb_u_u561) -> ((B_dData_dList.v_append (v_dfunNames dtb_u_u560)) (v_dfunNames dtb_u_u553))
  | _ -> (v_dfunNames dtb_u_u553)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 693 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_anyOwnTbl = (fun (dtb_u_u562 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u563 : string B_dData_dList.t_List) -> (match dtb_u_u563 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u564, dtb_u_u565) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u564) dtb_u_u562) then true else ((v_anyOwnTbl dtb_u_u562) dtb_u_u565))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Elab/Termination.vuna"
let v_callMode = (fun (dtb_u_u566 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair) -> (match dtb_u_u566 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u567; B_dData_dPair.f_Pair_second = dtb_u_u568 } -> (match dtb_u_u567 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u569; B_dData_dPair.f_Pair_second = dtb_u_u570 } -> (match dtb_u_u569 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u571; B_dData_dPair.f_Pair_second = dtb_u_u572 } -> dtb_u_u570
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_tryMeasureGo = (fun (dtb_u_u573 : string B_dData_dList.t_List) (dtb_u_u574 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u575 : string B_dData_dList.t_List) (dtb_u_u576 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u577 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u578 : int) (dtb_u_u579 : int) (dtb_u_u580 : int) (dtb_u_u581 : (((string, string) B_dData_dPair.t_Pair, int) B_dData_dPair.t_Pair, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u582 : t_FailCandidate) -> (if (dtb_u_u578 <= 0) then (if ((dtb_u_u582).f_FailCandidate_fcRank > 0) then (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges dtb_u_u573) (dtb_u_u582).f_FailCandidate_fcPos) (dtb_u_u582).f_FailCandidate_fcEdges))) else (Base_dDiag.C_Check_ErrC ((((v_cannotProveMsgEdges dtb_u_u573) dtb_u_u580) dtb_u_u581)))) else (let dtb_u_u583 = (dtb_u_u579 - dtb_u_u578) in (let dtb_u_u584 = ((((((((v_collectMeasure dtb_u_u573) dtb_u_u574) dtb_u_u575) dtb_u_u576) dtb_u_u583) dtb_u_u577) dtb_u_u573) { B_dData_dPair.f_Pair_first = true; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) in (match dtb_u_u584 with
  | Base_dDiag.C_Check_OkC (dtb_u_u585) -> (match dtb_u_u585 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u586; B_dData_dPair.f_Pair_second = dtb_u_u587 } -> (if dtb_u_u586 then (let dtb_u_u588 = (Elab_dTermination_dMeasure.v_filterModes ((B_dData_dList.v_map v_callMode) dtb_u_u587)) in (if (Elab_dTermination_dMeasure.v_notEmpty dtb_u_u588) then (if (Elab_dTermination_dMeasure.v_allSame dtb_u_u588) then (if ((Elab_dTermination_dMeasure.v_hasWeakCycle dtb_u_u573) dtb_u_u587) then ((((((((((v_tryMeasureGo dtb_u_u573) dtb_u_u574) dtb_u_u575) dtb_u_u576) dtb_u_u577) (dtb_u_u578 - 1)) dtb_u_u579) dtb_u_u583) dtb_u_u587) dtb_u_u582) else (Base_dDiag.C_Check_OkC (0))) else ((((((((((v_tryMeasureGo dtb_u_u573) dtb_u_u574) dtb_u_u575) dtb_u_u576) dtb_u_u577) (dtb_u_u578 - 1)) dtb_u_u579) dtb_u_u583) dtb_u_u587) dtb_u_u582)) else ((((((((((v_tryMeasureGo dtb_u_u573) dtb_u_u574) dtb_u_u575) dtb_u_u576) dtb_u_u577) (dtb_u_u578 - 1)) dtb_u_u579) dtb_u_u583) dtb_u_u587) dtb_u_u582))) else ((((((((((v_tryMeasureGo dtb_u_u573) dtb_u_u574) dtb_u_u575) dtb_u_u576) dtb_u_u577) (dtb_u_u578 - 1)) dtb_u_u579) dtb_u_u583) dtb_u_u587) (((v_betterFail dtb_u_u583) dtb_u_u587) dtb_u_u582)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u589) -> (Base_dDiag.C_Check_ErrC (dtb_u_u589))
  | _ -> failwith "DT: impossible branch"
)))))

# 589 "Vuna/Compiler/Elab/Termination.vuna"
let v_tryMeasure = (fun (dtb_u_u590 : string B_dData_dList.t_List) (dtb_u_u591 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u592 : string B_dData_dList.t_List) (dtb_u_u593 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u594 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u595 : int) (dtb_u_u596 : int) -> ((((((((((v_tryMeasureGo dtb_u_u590) dtb_u_u591) dtb_u_u592) dtb_u_u593) dtb_u_u594) (dtb_u_u596 - dtb_u_u595)) dtb_u_u596) dtb_u_u595) B_dData_dList.C_List_Nil) (v_emptyFail dtb_u_u595)))

# 610 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkStrictGroup = (fun (dtb_u_u597 : string B_dData_dList.t_List) (dtb_u_u598 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u599 : string B_dData_dList.t_List) (dtb_u_u600 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u601 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u602 = (Elab_dTermination_dMeasure.v_posTblOf dtb_u_u601) in (match (((((((v_tryMeasure dtb_u_u597) dtb_u_u598) dtb_u_u599) dtb_u_u600) dtb_u_u602) 0) ((Elab_dTermination_dMeasure.v_maxArityOf dtb_u_u597) dtb_u_u598)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u603) -> (Base_dDiag.C_Check_OkC (dtb_u_u603))
  | Base_dDiag.C_Check_ErrC (dtb_u_u604) -> (match ((((((Elab_dTermination_dScc.v_tryFuelThread dtb_u_u597) dtb_u_u598) dtb_u_u599) dtb_u_u600) dtb_u_u602) dtb_u_u604) with
  | Base_dDiag.C_Check_OkC (dtb_u_u605) -> (Base_dDiag.C_Check_OkC (dtb_u_u605))
  | Base_dDiag.C_Check_ErrC (dtb_u_u606) -> ((((((Elab_dTermination_dScc.v_sctCheck dtb_u_u597) dtb_u_u598) dtb_u_u599) dtb_u_u600) dtb_u_u602) dtb_u_u606)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 621 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkComp = (fun (dtb_u_u607 : string B_dData_dList.t_List) (dtb_u_u608 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u609 : string B_dData_dList.t_List) (dtb_u_u610 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u611 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u612 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u607 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u613, dtb_u_u614) -> (match dtb_u_u614 with
  | B_dData_dList.C_List_Nil -> (if ((B_dData_dList.v_memName dtb_u_u613) ((v_adjOf dtb_u_u613) dtb_u_u611)) then (((((v_checkStrictGroup dtb_u_u607) dtb_u_u608) dtb_u_u609) dtb_u_u610) dtb_u_u612) else (Base_dDiag.C_Check_OkC (0)))
  | _ -> (((((v_checkStrictGroup dtb_u_u607) dtb_u_u608) dtb_u_u609) dtb_u_u610) dtb_u_u612)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> (((((v_checkStrictGroup dtb_u_u607) dtb_u_u608) dtb_u_u609) dtb_u_u610) dtb_u_u612)
))

# 697 "Vuna/Compiler/Elab/Termination.vuna"
let rec v_checkSccsWith = (fun (dtb_u_u615 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u616 : string B_dData_dList.t_List B_dData_dList.t_List) (dtb_u_u617 : (string, (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u618 : string B_dData_dList.t_List) (dtb_u_u619 : (string, int B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u620 : (string, string B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dtb_u_u621 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u616 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u622, dtb_u_u623) -> (if ((v_anyOwnTbl dtb_u_u615) dtb_u_u622) then ((Base_dCommon.v_bind ((((((v_checkComp dtb_u_u622) dtb_u_u617) dtb_u_u618) dtb_u_u619) dtb_u_u620) dtb_u_u621)) (fun (dtb_u_u624 : int) -> ((Base_dCommon.v_bind (((((((v_checkSccsWith dtb_u_u615) dtb_u_u623) dtb_u_u617) dtb_u_u618) dtb_u_u619) dtb_u_u620) dtb_u_u621)) (fun (dtb_u_u625 : int) -> (Base_dDiag.C_Check_OkC ((dtb_u_u624 + dtb_u_u625))))))) else (((((((v_checkSccsWith dtb_u_u615) dtb_u_u623) dtb_u_u617) dtb_u_u618) dtb_u_u619) dtb_u_u620) dtb_u_u621))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationGroups = (fun (dtb_u_u626 : string B_dData_dList.t_List) (dtb_u_u627 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u628 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u629 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u630 = ((B_dData_dList.v_append dtb_u_u628) dtb_u_u627) in (let dtb_u_u631 = (Elab_dTermination_dMeasure.v_expandForwarders dtb_u_u630) in (let dtb_u_u632 = (Elab_dTermination_dMeasure.v_groupDefs dtb_u_u631) in (let dtb_u_u633 = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u632) in (let dtb_u_u634 = (Elab_dTermination_dMeasure.v_ctorNamesOf ((B_dData_dList.v_append dtb_u_u628) dtb_u_u629)) in (let dtb_u_u635 = ((B_dData_dList.v_append (Elab_dTermination_dMeasure.v_projectionsOf dtb_u_u632)) (Elab_dTermination_dMeasure.v_fieldProjectionsOf ((B_dData_dList.v_append dtb_u_u628) dtb_u_u629))) in (let dtb_u_u636 = (v_callGraph dtb_u_u632) in (let dtb_u_u637 = (v_adjTblOf dtb_u_u636) in (let dtb_u_u638 = (Elab_dTermination_dMeasure.v_defNames dtb_u_u632) in (let dtb_u_u639 = (v_reverseAdjOf dtb_u_u636) in (let dtb_u_u640 = ((B_dData_dList.v_filter (fun (dtb_u_u647 : string) -> (Elab_dTermination_dMeasure.v_notEmpty ((v_adjOf dtb_u_u647) dtb_u_u637)))) dtb_u_u638) in (let dtb_u_u641 = ((((((v_computePosFactsWork dtb_u_u638) dtb_u_u633) dtb_u_u639) 1024) B_dData_dList.C_List_Nil) dtb_u_u640) in (let dtb_u_u642 = (B_dContainer_dHashMap.v_ofNames dtb_u_u626) in (let dtb_u_u643 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Termination") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Termination") "term-facts") else 0) in (let dtb_u_u644 = ((v_graphFuel dtb_u_u636) dtb_u_u638) in (let dtb_u_u645 = (((v_postOrder dtb_u_u637) dtb_u_u636) dtb_u_u638) in (let dtb_u_u646 = (((((v_sccOf (B_dData_dPair.v_secondOf dtb_u_u645)) dtb_u_u644) dtb_u_u639) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil) in (if (B_dData_dPair.v_firstOf dtb_u_u645) then (if (B_dData_dPair.v_firstOf dtb_u_u646) then (((((((v_checkSccsWith dtb_u_u642) (B_dData_dList.v_reverse (B_dData_dPair.v_secondOf dtb_u_u646))) dtb_u_u633) dtb_u_u634) dtb_u_u635) dtb_u_u637) dtb_u_u641) else (Base_dDiag.v_icFuel "termination-scc")) else (Base_dDiag.v_icFuel "termination-scc"))))))))))))))))))))

# 658 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDeclsWith = (fun (dtb_u_u648 : string B_dData_dList.t_List) (dtb_u_u649 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((v_checkTerminationGroups dtb_u_u648) dtb_u_u649) B_dData_dList.C_List_Nil) dtb_u_u649))

# 647 "Vuna/Compiler/Elab/Termination.vuna"
let v_checkTerminationDecls = (fun (dtb_u_u650 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_checkTerminationDeclsWith (v_dfunNames dtb_u_u650)) dtb_u_u650))

# 556 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcRank = (fun (dtb_u_u651 : t_FailCandidate) -> (match dtb_u_u651 with
  | { f_FailCandidate_fcRank = dtb_u_u652; f_FailCandidate_fcPos = dtb_u_u653; f_FailCandidate_fcEdges = dtb_u_u654 } -> dtb_u_u652
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcPos = (fun (dtb_u_u655 : t_FailCandidate) -> (match dtb_u_u655 with
  | { f_FailCandidate_fcRank = dtb_u_u656; f_FailCandidate_fcPos = dtb_u_u657; f_FailCandidate_fcEdges = dtb_u_u658 } -> dtb_u_u657
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Elab/Termination.vuna"
let v_fcEdges = (fun (dtb_u_u659 : t_FailCandidate) -> (match dtb_u_u659 with
  | { f_FailCandidate_fcRank = dtb_u_u660; f_FailCandidate_fcPos = dtb_u_u661; f_FailCandidate_fcEdges = dtb_u_u662 } -> dtb_u_u662
  | _ -> failwith "DT: impossible branch"
))
