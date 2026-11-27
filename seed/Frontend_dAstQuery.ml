open Vuna_runtime
# 16 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_weightCap = 1000000

# 22 "Vuna/Compiler/Frontend/AstQuery.vuna"
let rec v_patWeightF = (fun (fuel : int) (p : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then 1 else (match p with
  | Frontend_dAst.C_Pat_PVar (dtb__0, dtb__1) -> 1
  | Frontend_dAst.C_Pat_PAs (dtb__2, dtb__3, dtb__4) -> (1 + ((v_patWeightF (fuel - 1)) dtb__3))
  | Frontend_dAst.C_Pat_PWild (dtb__5) -> 1
  | Frontend_dAst.C_Pat_PCon (dtb__6, dtb__7, dtb__8) -> (1 + ((v_patWeightListF (fuel - 1)) dtb__7))
  | Frontend_dAst.C_Pat_PInt (dtb__9, dtb__10) -> 1
  | Frontend_dAst.C_Pat_PStr (dtb__11, dtb__12) -> 1
  | Frontend_dAst.C_Pat_PRecord (dtb__13, dtb__14, dtb__15) -> (1 + ((v_patWeightFieldsF (fuel - 1)) dtb__14))
  | _ -> failwith "DT: impossible branch"
)))
# 36 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_patWeightListF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (mc0 <= 0) then 1 else (((v_patWeightF (mc0 - 1)) dtb__16) + ((v_patWeightListF (mc0 - 1)) dtb__17)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 41 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_patWeightFieldsF = (fun (mc0 : int) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if (mc0 <= 0) then 1 else (((v_patWeightF (mc0 - 1)) (B_dData_dPair.v_secondOf dtb__18)) + ((v_patWeightFieldsF (mc0 - 1)) dtb__19)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_patWeight = (fun (p : Frontend_dAst.t_Pat) -> ((v_patWeightF v_weightCap) p))

# 51 "Vuna/Compiler/Frontend/AstQuery.vuna"
let rec v_exprWeightF = (fun (fuel : int) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then 1 else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__20, dtb__21) -> 1
  | Frontend_dAst.C_Expr_EInt (dtb__22, dtb__23) -> 1
  | Frontend_dAst.C_Expr_EStr (dtb__24, dtb__25) -> 1
  | Frontend_dAst.C_Expr_EFloat (dtb__26, dtb__27) -> 1
  | Frontend_dAst.C_Expr_ELam (dtb__28, dtb__29, dtb__30) -> (1 + ((v_exprWeightF (fuel - 1)) dtb__29))
  | Frontend_dAst.C_Expr_EApp (dtb__31, dtb__32, dtb__33) -> ((1 + ((v_exprWeightF (fuel - 1)) dtb__31)) + ((v_exprWeightListF (fuel - 1)) dtb__32))
  | Frontend_dAst.C_Expr_EPi (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> ((1 + ((v_exprWeightF (fuel - 1)) dtb__37)) + ((v_exprWeightF (fuel - 1)) dtb__38))
  | Frontend_dAst.C_Expr_ELet (dtb__40, dtb__41, dtb__42, dtb__43) -> ((1 + ((v_bindingWeightsF (fuel - 1)) dtb__40)) + ((v_exprWeightF (fuel - 1)) dtb__41))
  | Frontend_dAst.C_Expr_ECase (dtb__44, dtb__45, dtb__46) -> ((1 + ((v_exprWeightF (fuel - 1)) dtb__44)) + ((v_altWeightsF (fuel - 1)) dtb__45))
  | Frontend_dAst.C_Expr_EIf (dtb__47, dtb__48, dtb__49, dtb__50) -> (((1 + ((v_exprWeightF (fuel - 1)) dtb__47)) + ((v_exprWeightF (fuel - 1)) dtb__48)) + ((v_exprWeightF (fuel - 1)) dtb__49))
  | Frontend_dAst.C_Expr_EField (dtb__51, dtb__52, dtb__53) -> (1 + ((v_exprWeightF (fuel - 1)) dtb__51))
  | Frontend_dAst.C_Expr_ERecord (dtb__54, dtb__55, dtb__56) -> (1 + ((v_exprWeightFieldsF (fuel - 1)) dtb__55))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__57, dtb__58, dtb__59) -> ((1 + ((v_exprWeightF (fuel - 1)) dtb__57)) + ((v_exprWeightFieldsF (fuel - 1)) dtb__58))
  | Frontend_dAst.C_Expr_EDo (dtb__60, dtb__61) -> (1 + ((v_doStmtWeightF (fuel - 1)) dtb__60))
  | Frontend_dAst.C_Expr_EInterp (dtb__62, dtb__63) -> (1 + ((v_interpWeightF (fuel - 1)) dtb__62))
  | _ -> failwith "DT: impossible branch"
)))
# 73 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_exprWeightListF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (if (mc0 <= 0) then 1 else (((v_exprWeightF (mc0 - 1)) dtb__64) + ((v_exprWeightListF (mc0 - 1)) dtb__65)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 78 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_bindingWeightsF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (if (mc0 <= 0) then 1 else (((v_bindingWeightF (mc0 - 1)) dtb__66) + ((v_bindingWeightsF (mc0 - 1)) dtb__67)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 83 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_bindingWeightF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Binding) -> (match mc1 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__68; Frontend_dAst.f_Binding_bindValue = dtb__69; Frontend_dAst.f_Binding_bindSig = dtb__70; Frontend_dAst.f_Binding_bindRef = dtb__71 } -> (if (mc0 <= 0) then 1 else (let valueWeight = (match dtb__69 with
  | Frontend_dAst.C_BindingValue_BVal (dtb__73) -> ((v_exprWeightF (mc0 - 1)) dtb__73)
  | Frontend_dAst.C_BindingValue_BClauses (dtb__74) -> (1 + ((v_clauseWeightsF (mc0 - 1)) dtb__74))
  | _ -> failwith "DT: impossible branch"
) in (let sigWeight = (match dtb__70 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> ((v_exprWeightF (mc0 - 1)) (dtb__72).Frontend_dAst.f_BindingSig_sigType)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) in (((1 + ((v_patWeightF (mc0 - 1)) dtb__68)) + valueWeight) + sigWeight))))
  | _ -> failwith "DT: impossible branch"
))
# 99 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_clauseWeightsF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if (mc0 <= 0) then 1 else (((1 + ((v_patWeightListF (mc0 - 1)) (dtb__75).Frontend_dAst.f_LocalClause_lcPats)) + ((v_exprWeightF (mc0 - 1)) (dtb__75).Frontend_dAst.f_LocalClause_lcBody)) + ((v_clauseWeightsF (mc0 - 1)) dtb__76)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 109 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_altWeightsF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if (mc0 <= 0) then 1 else (((1 + ((v_patWeightF (mc0 - 1)) (dtb__77).Frontend_dAst.f_Alt_altPat)) + ((v_exprWeightF (mc0 - 1)) (dtb__77).Frontend_dAst.f_Alt_altBody)) + ((v_altWeightsF (mc0 - 1)) dtb__78)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 119 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_exprWeightFieldsF = (fun (mc0 : int) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (if (mc0 <= 0) then 1 else (((v_exprWeightF (mc0 - 1)) (B_dData_dPair.v_secondOf dtb__79)) + ((v_exprWeightFieldsF (mc0 - 1)) dtb__80)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 124 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_doStmtWeightF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (if (mc0 <= 0) then 1 else (((v_oneDoStmtWeightF (mc0 - 1)) dtb__81) + ((v_doStmtWeightF (mc0 - 1)) dtb__82)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 129 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_oneDoStmtWeightF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_DoStmt) -> (match mc1 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__83, dtb__84) -> (if (mc0 <= 0) then 1 else (1 + ((v_bindingWeightsF (mc0 - 1)) dtb__83)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__85, dtb__86) -> (if (mc0 <= 0) then 1 else (1 + ((v_exprWeightF (mc0 - 1)) dtb__85)))
  | Frontend_dAst.C_DoStmt_DBind (dtb__87, dtb__88, dtb__89) -> (if (mc0 <= 0) then 1 else ((1 + ((v_patWeightF (mc0 - 1)) dtb__87)) + ((v_exprWeightF (mc0 - 1)) dtb__88)))
  | _ -> failwith "DT: impossible branch"
))
# 135 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_interpWeightF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (if (mc0 <= 0) then 1 else (((v_oneInterpWeightF (mc0 - 1)) dtb__90) + ((v_interpWeightF (mc0 - 1)) dtb__91)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 140 "Vuna/Compiler/Frontend/AstQuery.vuna"
and v_oneInterpWeightF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__92) -> (if (mc0 <= 0) then 1 else (1 + ((v_exprWeightF (mc0 - 1)) dtb__92)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__93) -> 1
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_exprWeight = (fun (e : Frontend_dAst.t_Expr) -> ((v_exprWeightF v_weightCap) e))

# 145 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_exprBudget = (fun (base : int) (e : Frontend_dAst.t_Expr) -> (base + (8 * (v_exprWeight e))))

# 149 "Vuna/Compiler/Frontend/AstQuery.vuna"
let v_patBudget = (fun (base : int) (p : Frontend_dAst.t_Pat) -> (base + (8 * (v_patWeight p))))
