open Vuna_runtime
# 16 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_weightCap = 1000000

# 22 "Vuna/Compiler/Frontend/AstQuery.vuna"
let rec v_patWeightF = (fun (dtb_u_u1 : int) (dtb_u_u2 : Frontend_dAst.t_Pat) -> (if (dtb_u_u1 <= 0) then 1 else (match dtb_u_u2 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u3, dtb_u_u4) -> 1
  | Frontend_dAst.C_Pat_PAs (dtb_u_u5, dtb_u_u6, dtb_u_u7) -> (1 + ((v_patWeightF (dtb_u_u1 - 1)) dtb_u_u6))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u8) -> 1
  | Frontend_dAst.C_Pat_PCon (dtb_u_u9, dtb_u_u10, dtb_u_u11) -> (1 + ((v_patWeightListF (dtb_u_u1 - 1)) dtb_u_u10))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u12, dtb_u_u13) -> 1
  | Frontend_dAst.C_Pat_PStr (dtb_u_u14, dtb_u_u15) -> 1
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u16, dtb_u_u17, dtb_u_u18) -> (1 + ((v_patWeightFieldsF (dtb_u_u1 - 1)) dtb_u_u17))
  | _ -> failwith "DT: impossible branch"
)))
# 36 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_patWeightListF = (fun (dtb_u_u19 : int) (dtb_u_u20 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u20 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u21, dtb_u_u22) -> (if (dtb_u_u19 <= 0) then 1 else (((v_patWeightF (dtb_u_u19 - 1)) dtb_u_u21) + ((v_patWeightListF (dtb_u_u19 - 1)) dtb_u_u22)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 41 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_patWeightFieldsF = (fun (dtb_u_u23 : int) (dtb_u_u24 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u24 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u25, dtb_u_u26) -> (if (dtb_u_u23 <= 0) then 1 else (((v_patWeightF (dtb_u_u23 - 1)) (B_dData_dPair.v_secondOf dtb_u_u25)) + ((v_patWeightFieldsF (dtb_u_u23 - 1)) dtb_u_u26)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_patWeight = (fun (dtb_u_u27 : Frontend_dAst.t_Pat) -> ((v_patWeightF v_weightCap) dtb_u_u27))

# 51 "Vuna/Compiler/Frontend/AstQuery.vuna"
let rec v_exprWeightF = (fun (dtb_u_u28 : int) (dtb_u_u29 : Frontend_dAst.t_Expr) -> (if (dtb_u_u28 <= 0) then 1 else (match dtb_u_u29 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u30, dtb_u_u31) -> 1
  | Frontend_dAst.C_Expr_EInt (dtb_u_u32, dtb_u_u33) -> 1
  | Frontend_dAst.C_Expr_EStr (dtb_u_u34, dtb_u_u35) -> 1
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u36, dtb_u_u37) -> 1
  | Frontend_dAst.C_Expr_ELam (dtb_u_u38, dtb_u_u39, dtb_u_u40) -> (1 + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u39))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u41, dtb_u_u42, dtb_u_u43) -> ((1 + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u41)) + ((v_exprWeightListF (dtb_u_u28 - 1)) dtb_u_u42))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u44, dtb_u_u45, dtb_u_u46, dtb_u_u47, dtb_u_u48, dtb_u_u49) -> ((1 + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u47)) + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u48))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u50, dtb_u_u51, dtb_u_u52, dtb_u_u53) -> ((1 + ((v_bindingWeightsF (dtb_u_u28 - 1)) dtb_u_u50)) + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u51))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u54, dtb_u_u55, dtb_u_u56) -> ((1 + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u54)) + ((v_altWeightsF (dtb_u_u28 - 1)) dtb_u_u55))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u57, dtb_u_u58, dtb_u_u59, dtb_u_u60) -> (((1 + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u57)) + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u58)) + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u59))
  | Frontend_dAst.C_Expr_EField (dtb_u_u61, dtb_u_u62, dtb_u_u63) -> (1 + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u61))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u64, dtb_u_u65, dtb_u_u66) -> (1 + ((v_exprWeightFieldsF (dtb_u_u28 - 1)) dtb_u_u65))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u67, dtb_u_u68, dtb_u_u69) -> ((1 + ((v_exprWeightF (dtb_u_u28 - 1)) dtb_u_u67)) + ((v_exprWeightFieldsF (dtb_u_u28 - 1)) dtb_u_u68))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u70, dtb_u_u71) -> (1 + ((v_doStmtWeightF (dtb_u_u28 - 1)) dtb_u_u70))
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u72, dtb_u_u73) -> (1 + ((v_interpWeightF (dtb_u_u28 - 1)) dtb_u_u72))
  | _ -> failwith "DT: impossible branch"
)))
# 73 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_exprWeightListF = (fun (dtb_u_u74 : int) (dtb_u_u75 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u75 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u76, dtb_u_u77) -> (if (dtb_u_u74 <= 0) then 1 else (((v_exprWeightF (dtb_u_u74 - 1)) dtb_u_u76) + ((v_exprWeightListF (dtb_u_u74 - 1)) dtb_u_u77)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 78 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_bindingWeightsF = (fun (dtb_u_u78 : int) (dtb_u_u79 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (if (dtb_u_u78 <= 0) then 1 else (((v_bindingWeightF (dtb_u_u78 - 1)) dtb_u_u80) + ((v_bindingWeightsF (dtb_u_u78 - 1)) dtb_u_u81)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_bindingWeightF = (fun (dtb_u_u82 : int) (dtb_u_u83 : Frontend_dAst.t_Binding) -> (match dtb_u_u83 with
  | { Frontend_dAst.f_Binding_bindPat = dtb_u_u84; Frontend_dAst.f_Binding_bindValue = dtb_u_u85; Frontend_dAst.f_Binding_bindSig = dtb_u_u86; Frontend_dAst.f_Binding_bindRef = dtb_u_u87 } -> (if (dtb_u_u82 <= 0) then 1 else (let dtb_u_u88 = (match dtb_u_u85 with
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u91) -> ((v_exprWeightF (dtb_u_u82 - 1)) dtb_u_u91)
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u92) -> (1 + ((v_clauseWeightsF (dtb_u_u82 - 1)) dtb_u_u92))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u89 = (match dtb_u_u86 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u90) -> ((v_exprWeightF (dtb_u_u82 - 1)) (dtb_u_u90).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in (((1 + ((v_patWeightF (dtb_u_u82 - 1)) dtb_u_u84)) + dtb_u_u88) + dtb_u_u89))))
  | _ -> failwith "DT: impossible branch"
))
# 99 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_clauseWeightsF = (fun (dtb_u_u93 : int) (dtb_u_u94 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match dtb_u_u94 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if (dtb_u_u93 <= 0) then 1 else (((1 + ((v_patWeightListF (dtb_u_u93 - 1)) (dtb_u_u95).Frontend_dAst.f_LocalClause_lcPats)) + ((v_exprWeightF (dtb_u_u93 - 1)) (dtb_u_u95).Frontend_dAst.f_LocalClause_lcBody)) + ((v_clauseWeightsF (dtb_u_u93 - 1)) dtb_u_u96)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 109 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_altWeightsF = (fun (dtb_u_u97 : int) (dtb_u_u98 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match dtb_u_u98 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u99, dtb_u_u100) -> (if (dtb_u_u97 <= 0) then 1 else (((1 + ((v_patWeightF (dtb_u_u97 - 1)) (dtb_u_u99).Frontend_dAst.f_Alt_altPat)) + ((v_exprWeightF (dtb_u_u97 - 1)) (dtb_u_u99).Frontend_dAst.f_Alt_altBody)) + ((v_altWeightsF (dtb_u_u97 - 1)) dtb_u_u100)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 119 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_exprWeightFieldsF = (fun (dtb_u_u101 : int) (dtb_u_u102 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u102 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u103, dtb_u_u104) -> (if (dtb_u_u101 <= 0) then 1 else (((v_exprWeightF (dtb_u_u101 - 1)) (B_dData_dPair.v_secondOf dtb_u_u103)) + ((v_exprWeightFieldsF (dtb_u_u101 - 1)) dtb_u_u104)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 124 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_doStmtWeightF = (fun (dtb_u_u105 : int) (dtb_u_u106 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match dtb_u_u106 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u107, dtb_u_u108) -> (if (dtb_u_u105 <= 0) then 1 else (((v_oneDoStmtWeightF (dtb_u_u105 - 1)) dtb_u_u107) + ((v_doStmtWeightF (dtb_u_u105 - 1)) dtb_u_u108)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 129 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_oneDoStmtWeightF = (fun (dtb_u_u109 : int) (dtb_u_u110 : Frontend_dAst.t_DoStmt) -> (match dtb_u_u110 with
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u111, dtb_u_u112) -> (if (dtb_u_u109 <= 0) then 1 else (1 + ((v_bindingWeightsF (dtb_u_u109 - 1)) dtb_u_u111)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u113, dtb_u_u114) -> (if (dtb_u_u109 <= 0) then 1 else (1 + ((v_exprWeightF (dtb_u_u109 - 1)) dtb_u_u113)))
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u115, dtb_u_u116, dtb_u_u117) -> (if (dtb_u_u109 <= 0) then 1 else ((1 + ((v_patWeightF (dtb_u_u109 - 1)) dtb_u_u115)) + ((v_exprWeightF (dtb_u_u109 - 1)) dtb_u_u116)))
  | _ -> failwith "DT: impossible branch"
))
# 135 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_interpWeightF = (fun (dtb_u_u118 : int) (dtb_u_u119 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match dtb_u_u119 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u120, dtb_u_u121) -> (if (dtb_u_u118 <= 0) then 1 else (((v_oneInterpWeightF (dtb_u_u118 - 1)) dtb_u_u120) + ((v_interpWeightF (dtb_u_u118 - 1)) dtb_u_u121)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 140 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_oneInterpWeightF = (fun (dtb_u_u122 : int) (dtb_u_u123 : Frontend_dAst.t_InterpPart) -> (match dtb_u_u123 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u124) -> (if (dtb_u_u122 <= 0) then 1 else (1 + ((v_exprWeightF (dtb_u_u122 - 1)) dtb_u_u124)))
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u125) -> 1
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_exprWeight = (fun (dtb_u_u126 : Frontend_dAst.t_Expr) -> ((v_exprWeightF v_weightCap) dtb_u_u126))

# 145 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_exprBudget = (fun (dtb_u_u127 : int) (dtb_u_u128 : Frontend_dAst.t_Expr) -> (dtb_u_u127 + (8 * (v_exprWeight dtb_u_u128))))

# 149 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_patBudget = (fun (dtb_u_u129 : int) (dtb_u_u130 : Frontend_dAst.t_Pat) -> (dtb_u_u129 + (8 * (v_patWeight dtb_u_u130))))
