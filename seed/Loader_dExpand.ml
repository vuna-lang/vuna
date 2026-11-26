open Vuna_runtime
# 32 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandFuelBound = 1073741824

# 231 "Vuna/Compiler/Loader/Expand.vuna"
let v_internalRef = (fun (name : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (("!" ^ name), (Frontend_dAst.v_synthNodeRef sp))))

# 235 "Vuna/Compiler/Loader/Expand.vuna"
let v_logLevelOf = (fun (s : string) -> ((B_dData_dList.v_lookupPair s) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "error"; B_dData_dPair.f_Pair_second = 0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "warn"; B_dData_dPair.f_Pair_second = 1 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "info"; B_dData_dPair.f_Pair_second = 2 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "debug"; B_dData_dPair.f_Pair_second = 3 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "trace"; B_dData_dPair.f_Pair_second = 4 }, B_dData_dList.C_List_Nil))))))))))))

# 239 "Vuna/Compiler/Loader/Expand.vuna"
let v_logOnRef = (fun (level : int) (scope : string) (sp : Frontend_dAst.t_NodeRef) -> (let sref = (Frontend_dAst.v_synthNodeRef sp) in (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logOnIntrinsicName) sref), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sref)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sref)), B_dData_dList.C_List_Nil)))), sref))))

# 247 "Vuna/Compiler/Loader/Expand.vuna"
let v_logExpand = (fun (scope : string) (level : int) (msg : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (let sref = (Frontend_dAst.v_synthNodeRef sp) in (Frontend_dAst.C_Expr_EIf ((((v_logOnRef level) scope) sref), (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logEmitIntrinsicName) sref), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sref)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sref)), (B_dData_dList.C_List__x58__x58_ (msg, B_dData_dList.C_List_Nil)))))), sref)), (Frontend_dAst.C_Expr_EInt (0, sref)), sref))))

# 257 "Vuna/Compiler/Loader/Expand.vuna"
let v_macroArityMismatch = (fun (name : string) (expected : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (let expectedText = (string_of_int expected) in (let actualText = (string_of_int (B_dData_dList.v_length args)) in (((((Base_dDiagnostics_dRn.v_rnAt3 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_MacroArity (name, expectedText, actualText))) name) expectedText) actualText))))

# 270 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandMacro = (fun (scope : string) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (if (name = "log") then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List_Nil -> (match dtb__0 with
  | Frontend_dAst.C_Expr_EStr (dtb__4, dtb__5) -> (match (v_logLevelOf dtb__4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> (Base_dDiag.C_Check_OkC (((((v_logExpand scope) dtb__6) dtb__2) sp)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_LogLevelUnknown (dtb__4))) dtb__4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dDiagnostics_dRn.v_rnAt0 (Frontend_dAst.v_nodeRefSpan sp)) Base_dDiagnostics_dRn.C_RnErr_LogLevelNotLiteral)
)
  | _ -> ((((v_macroArityMismatch name) 2) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 2) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 2) args) sp)
)) else (if (name = "mark") then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List_Nil -> (let sref = (Frontend_dAst.v_synthNodeRef sp) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_obsMarkIntrinsicName) sref), (B_dData_dList.C_List__x58__x58_ (dtb__7, B_dData_dList.C_List_Nil)), sref)))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_UnknownMacro (name))) name))))

# 107 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandExprs = (fun (fuel : int) (scope : string) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match exprs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__9)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__10)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (e2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 116 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandExpr = (fun (fuel : int) (scope : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__11, dtb__12) -> (match (Frontend_dReserved.v_macroNameOf dtb__11) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> ((((v_expandMacro scope) dtb__13) B_dData_dList.C_List_Nil) dtb__12)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (e))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EApp (dtb__14, dtb__15, dtb__16) -> (match dtb__14 with
  | Frontend_dAst.C_Expr_EVar (dtb__17, dtb__18) -> (match (Frontend_dReserved.v_macroNameOf dtb__17) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__15)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((((v_expandMacro scope) dtb__19) args2) dtb__16)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__14)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__15)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__16))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__14)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__15)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__16))))))))
)
  | Frontend_dAst.C_Expr_EInt (dtb__20, dtb__21) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EStr (dtb__22, dtb__23) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EFloat (dtb__24, dtb__25) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_ELam (dtb__26, dtb__27, dtb__28) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__27)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__26, body2, dtb__28))))))
  | Frontend_dAst.C_Expr_EPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__32)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__33)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__29, dtb__30, dtb__31, dom2, cod2, dtb__34))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__35, dtb__36, dtb__37, dtb__38) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__35)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__36)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__37, dtb__38))))))))
  | Frontend_dAst.C_Expr_ECase (dtb__39, dtb__40, dtb__41) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__39)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandAlts (fuel - 1)) scope) dtb__40)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__41))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__42, dtb__43, dtb__44, dtb__45) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__42)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__43)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__44)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, el2, dtb__45))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__46, dtb__47, dtb__48) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__46)) (fun (base2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (base2, dtb__47, dtb__48))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__49, dtb__50, dtb__51) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__50)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__49, fields2, dtb__51))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__52, dtb__53, dtb__54) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__52)) (fun (base2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__53)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (base2, fields2, dtb__54))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__55, dtb__56) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__55)) (fun (stmts2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (stmts2, dtb__56))))))
  | Frontend_dAst.C_Expr_EInterp (dtb__57, dtb__58) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__57)) (fun (parts2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (parts2, dtb__58))))))
  | _ -> failwith "DT: impossible branch"
)))
# 148 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandPatExprs = (fun (fuel : int) (scope : string) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match binds with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> ((Base_dCommon.v_bind (((v_expandBindingSig (fuel - 1)) scope) (dtb__59).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_expandBindingValue (fuel - 1)) scope) (dtb__59).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__60)) (fun (rest2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__59).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__59).Frontend_dAst.f_Binding_bindRef }, rest2))))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 158 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandBindingSig = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) (dtb__61).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__61).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 166 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandAlts = (fun (fuel : int) (scope : string) (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match alts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__62).Frontend_dAst.f_Alt_altBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandAlts (fuel - 1)) scope) dtb__63)) (fun (rest2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (dtb__62).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = body2; Frontend_dAst.f_Alt_altRef = (dtb__62).Frontend_dAst.f_Alt_altRef }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 175 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandClauses = (fun (fuel : int) (scope : string) (clauses : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match clauses with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__64).Frontend_dAst.f_LocalClause_lcBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandClauses (fuel - 1)) scope) dtb__65)) (fun (rest2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = (dtb__64).Frontend_dAst.f_LocalClause_lcPats; Frontend_dAst.f_LocalClause_lcBody = body2; Frontend_dAst.f_LocalClause_lcRef = (dtb__64).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (dtb__64).Frontend_dAst.f_LocalClause_lcHead }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 185 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandBindingValue = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_BindingValue) -> (match mc2 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__66) -> ((Base_dCommon.v_bind (((v_expandClauses (mc0 - 1)) mc1) dtb__66)) (fun (cs : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (cs))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb__67) -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__67)) (fun (e2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (e2))))))
  | _ -> failwith "DT: impossible branch"
))
# 191 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandFieldExprs = (fun (fuel : int) (scope : string) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (let nd_uscrut3 = fields in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (match dtb__68 with
  | { B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = dtb__71 } -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__71)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__69)) (fun (rest2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = value2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 200 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDoStmts = (fun (fuel : int) (scope : string) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match stmts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__72 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__74, dtb__75, dtb__76) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__75)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__73)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb__74, stmtExpr2, dtb__76)), rest2))))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__77, dtb__78) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__77)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__73)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr (stmtExpr2, dtb__78)), rest2))))))))
  | Frontend_dAst.C_DoStmt_DLet (dtb__79, dtb__80) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__79)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__73)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet (binds2, dtb__80)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 213 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandInterpParts = (fun (fuel : int) (scope : string) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match parts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (match dtb__81 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__83) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__82)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__83)), rest2))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__84) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__84)) (fun (holeExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__82)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (holeExpr2)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 73 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandCtor = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Ctor) -> (match mc2 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__85; Frontend_dAst.f_Ctor_ctorType = dtb__86; Frontend_dAst.f_Ctor_ctorArity = dtb__87; Frontend_dAst.f_Ctor_ctorRef = dtb__88 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__86)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__85; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__87; Frontend_dAst.f_Ctor_ctorRef = dtb__88 }))))
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandCtors = (fun (fuel : int) (scope : string) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match ctors with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> ((Base_dCommon.v_bind (((v_expandCtor (fuel - 1)) scope) dtb__89)) (fun (c2 : Frontend_dAst.t_Ctor) -> ((Base_dCommon.v_bind (((v_expandCtors (fuel - 1)) scope) dtb__90)) (fun (rest2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (c2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 88 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandField = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Field) -> (match mc2 with
  | { Frontend_dAst.f_Field_fieldName = dtb__91; Frontend_dAst.f_Field_fieldType = dtb__92; Frontend_dAst.f_Field_fieldRef = dtb__93 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__92)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__91; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__93 }))))
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandFields = (fun (fuel : int) (scope : string) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match fields with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> ((Base_dCommon.v_bind (((v_expandField (fuel - 1)) scope) dtb__94)) (fun (f2 : Frontend_dAst.t_Field) -> ((Base_dCommon.v_bind (((v_expandFields (fuel - 1)) scope) dtb__95)) (fun (rest2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (f2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 101 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandTraitMethod = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_TraitMethod) -> (match mc2 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__96; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__97; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__98 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__97)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__96; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__98 }))))
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandTraitMethods = (fun (fuel : int) (scope : string) (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match methods with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> ((Base_dCommon.v_bind (((v_expandTraitMethod (fuel - 1)) scope) dtb__99)) (fun (m2 : Frontend_dAst.t_TraitMethod) -> ((Base_dCommon.v_bind (((v_expandTraitMethods (fuel - 1)) scope) dtb__100)) (fun (rest2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (m2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 40 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandDeclsGo = (fun (fuel : int) (scope : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match decls with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__101, dtb__102) -> ((Base_dCommon.v_bind (((v_expandDecl fuel) scope) dtb__101)) (fun (d2 : Frontend_dAst.t_Decl) -> ((Base_dCommon.v_bind (((v_expandDeclsGo (fuel - 1)) scope) dtb__102)) (fun (rest2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (d2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 49 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDecl = (fun (fuel : int) (scope : string) (d : Frontend_dAst.t_Decl) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match d with
  | Frontend_dAst.C_Decl_DData (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__105)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandCtors (fuel - 1)) scope) dtb__106)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__103, dtb__104, kind2, ctors2, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__112, dtb__113, dtb__114) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__113)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__112, ty2, dtb__114))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__115, dtb__116, dtb__117, dtb__118) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__117)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__115, dtb__116, ty2, dtb__118))))))
  | Frontend_dAst.C_Decl_DSig (dtb__119, dtb__120, dtb__121, dtb__122) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__120)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__121)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__119, ctx2, ty2, dtb__122))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__123, dtb__124, dtb__125, dtb__126) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__125)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__123, dtb__124, body2, dtb__126))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> ((Base_dCommon.v_bind (((v_expandFields (fuel - 1)) scope) dtb__129)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__127, dtb__128, fields2, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__137)) (fun (supers2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandTraitMethods (fuel - 1)) scope) dtb__138)) (fun (methods2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__135, dtb__136, supers2, methods2, dtb__139))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb__140, dtb__141, dtb__142, dtb__143) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__140)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__141)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDeclsGo (fuel - 1)) scope) dtb__142)) (fun (methods2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, methods2, dtb__143))))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 37 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandDecls = (fun (scope : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((v_expandDeclsGo v_expandFuelBound) scope) decls))
