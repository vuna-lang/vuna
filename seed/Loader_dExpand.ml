open Vuna_runtime
# 31 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandFuelBound = 1073741824

# 231 "Vuna/Compiler/Loader/Expand.vuna"
let v_internalRef = (fun (name : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (("!" ^ name), sp)))

# 235 "Vuna/Compiler/Loader/Expand.vuna"
let v_logLevelOf = (fun (s : string) -> ((B_dData_dList.v_lookupPair s) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "error"; B_dData_dPair.f_Pair_second = 0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "warn"; B_dData_dPair.f_Pair_second = 1 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "info"; B_dData_dPair.f_Pair_second = 2 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "debug"; B_dData_dPair.f_Pair_second = 3 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "trace"; B_dData_dPair.f_Pair_second = 4 }, B_dData_dList.C_List_Nil))))))))))))

# 239 "Vuna/Compiler/Loader/Expand.vuna"
let v_logOnRef = (fun (level : int) (scope : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logOnIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sp)), B_dData_dList.C_List_Nil)))), sp)))

# 244 "Vuna/Compiler/Loader/Expand.vuna"
let v_logExpand = (fun (scope : string) (level : int) (msg : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EIf ((((v_logOnRef level) scope) sp), (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logEmitIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sp)), (B_dData_dList.C_List__x58__x58_ (msg, B_dData_dList.C_List_Nil)))))), sp)), (Frontend_dAst.C_Expr_EInt (0, sp)), sp)))

# 252 "Vuna/Compiler/Loader/Expand.vuna"
let v_macroArityMismatch = (fun (name : string) (expected : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (let expectedText = (bi_strFromInt expected) in (let actualText = (bi_strFromInt (B_dData_dList.v_length args)) in (((((Base_dDiagnostics_dRn.v_rnAt3 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_MacroArity (name, expectedText, actualText))) name) expectedText) actualText))))

# 265 "Vuna/Compiler/Loader/Expand.vuna"
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
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_obsMarkIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ (dtb__7, B_dData_dList.C_List_Nil)), sp))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_UnknownMacro (name))) name))))

# 106 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandExprs = (fun (fuel : int) (scope : string) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match exprs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__9)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__10)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (e2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 115 "Vuna/Compiler/Loader/Expand.vuna"
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
  | Frontend_dAst.C_Expr_ELocalFun (dtb__39, dtb__40) -> ((Base_dCommon.v_bind (((v_expandClauses (fuel - 1)) scope) dtb__39)) (fun (clauses2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELocalFun (clauses2, dtb__40))))))
  | Frontend_dAst.C_Expr_ECase (dtb__41, dtb__42, dtb__43) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__41)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandAlts (fuel - 1)) scope) dtb__42)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__43))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__44, dtb__45, dtb__46, dtb__47) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__44)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__45)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__46)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, el2, dtb__47))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__48, dtb__49, dtb__50) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__48)) (fun (base2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (base2, dtb__49, dtb__50))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__51, dtb__52, dtb__53) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__52)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__51, fields2, dtb__53))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__54, dtb__55, dtb__56) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__54)) (fun (base2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__55)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (base2, fields2, dtb__56))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__57, dtb__58) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__57)) (fun (stmts2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (stmts2, dtb__58))))))
  | Frontend_dAst.C_Expr_EInfix (dtb__59, dtb__60, dtb__61, dtb__62) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__60)) (fun (lhs2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__61)) (fun (rhs2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInfix (dtb__59, lhs2, rhs2, dtb__62))))))))
  | Frontend_dAst.C_Expr_EParen (dtb__63, dtb__64) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__63)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EParen (inner2, dtb__64))))))
  | Frontend_dAst.C_Expr_EBacktick (dtb__65, dtb__66, dtb__67, dtb__68) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__66)) (fun (lhs2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__67)) (fun (rhs2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EBacktick (dtb__65, lhs2, rhs2, dtb__68))))))))
  | Frontend_dAst.C_Expr_ESectOp (dtb__69, dtb__70) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_ESectL (dtb__71, dtb__72, dtb__73) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__72)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectL (dtb__71, inner2, dtb__73))))))
  | Frontend_dAst.C_Expr_ESectR (dtb__74, dtb__75, dtb__76) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__74)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectR (inner2, dtb__75, dtb__76))))))
  | Frontend_dAst.C_Expr_EAnn (dtb__77, dtb__78, dtb__79) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__77)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__78)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EAnn (value2, ty2, dtb__79))))))))
  | Frontend_dAst.C_Expr_EInterp (dtb__80, dtb__81, dtb__82) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__81)) (fun (parts2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (dtb__80, parts2, dtb__82))))))
  | _ -> failwith "DT: impossible branch"
)))
# 155 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandPatExprs = (fun (fuel : int) (scope : string) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match binds with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> ((Base_dCommon.v_bind (((v_expandBindingSig (fuel - 1)) scope) (dtb__83).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__83).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__84)) (fun (rest2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__83).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__83).Frontend_dAst.f_Binding_bindRef }, rest2))))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 165 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandBindingSig = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) (dtb__85).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__85).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 173 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandAlts = (fun (fuel : int) (scope : string) (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match alts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__86).Frontend_dAst.f_Alt_altBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandAlts (fuel - 1)) scope) dtb__87)) (fun (rest2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (dtb__86).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = body2; Frontend_dAst.f_Alt_altRef = (dtb__86).Frontend_dAst.f_Alt_altRef }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 182 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandClauses = (fun (fuel : int) (scope : string) (clauses : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match clauses with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__88).Frontend_dAst.f_LocalClause_lcBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandClauses (fuel - 1)) scope) dtb__89)) (fun (rest2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = (dtb__88).Frontend_dAst.f_LocalClause_lcPats; Frontend_dAst.f_LocalClause_lcBody = body2; Frontend_dAst.f_LocalClause_lcRef = (dtb__88).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (dtb__88).Frontend_dAst.f_LocalClause_lcHead }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 191 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandFieldExprs = (fun (fuel : int) (scope : string) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (let nd_uscrut3 = fields in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__90 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__93)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__91)) (fun (rest2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = value2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 200 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDoStmts = (fun (fuel : int) (scope : string) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match stmts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__96, dtb__97, dtb__98) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__97)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__95)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb__96, stmtExpr2, dtb__98)), rest2))))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__99, dtb__100) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__99)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__95)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr (stmtExpr2, dtb__100)), rest2))))))))
  | Frontend_dAst.C_DoStmt_DLet (dtb__101, dtb__102) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__101)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__95)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet (binds2, dtb__102)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 213 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandInterpParts = (fun (fuel : int) (scope : string) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match parts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (match dtb__103 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__105) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__104)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__105)), rest2))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__106) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__106)) (fun (holeExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__104)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (holeExpr2)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 72 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandCtor = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Ctor) -> (match mc2 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__107; Frontend_dAst.f_Ctor_ctorType = dtb__108; Frontend_dAst.f_Ctor_ctorArity = dtb__109; Frontend_dAst.f_Ctor_ctorRef = dtb__110 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__108)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__107; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__109; Frontend_dAst.f_Ctor_ctorRef = dtb__110 }))))
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandCtors = (fun (fuel : int) (scope : string) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match ctors with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> ((Base_dCommon.v_bind (((v_expandCtor (fuel - 1)) scope) dtb__111)) (fun (c2 : Frontend_dAst.t_Ctor) -> ((Base_dCommon.v_bind (((v_expandCtors (fuel - 1)) scope) dtb__112)) (fun (rest2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (c2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 87 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandField = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Field) -> (match mc2 with
  | { Frontend_dAst.f_Field_fieldName = dtb__113; Frontend_dAst.f_Field_fieldType = dtb__114; Frontend_dAst.f_Field_fieldRef = dtb__115 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__114)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__113; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__115 }))))
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandFields = (fun (fuel : int) (scope : string) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match fields with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> ((Base_dCommon.v_bind (((v_expandField (fuel - 1)) scope) dtb__116)) (fun (f2 : Frontend_dAst.t_Field) -> ((Base_dCommon.v_bind (((v_expandFields (fuel - 1)) scope) dtb__117)) (fun (rest2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (f2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 100 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandTraitMethod = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_TraitMethod) -> (match mc2 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__118; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__119; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__120 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__119)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__118; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__120 }))))
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandTraitMethods = (fun (fuel : int) (scope : string) (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match methods with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__121, dtb__122) -> ((Base_dCommon.v_bind (((v_expandTraitMethod (fuel - 1)) scope) dtb__121)) (fun (m2 : Frontend_dAst.t_TraitMethod) -> ((Base_dCommon.v_bind (((v_expandTraitMethods (fuel - 1)) scope) dtb__122)) (fun (rest2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (m2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 39 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandDeclsGo = (fun (fuel : int) (scope : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match decls with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> ((Base_dCommon.v_bind (((v_expandDecl fuel) scope) dtb__123)) (fun (d2 : Frontend_dAst.t_Decl) -> ((Base_dCommon.v_bind (((v_expandDeclsGo (fuel - 1)) scope) dtb__124)) (fun (rest2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (d2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 48 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDecl = (fun (fuel : int) (scope : string) (d : Frontend_dAst.t_Decl) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match d with
  | Frontend_dAst.C_Decl_DData (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__127)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandCtors (fuel - 1)) scope) dtb__128)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__125, dtb__126, kind2, ctors2, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__134, dtb__135, dtb__136) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__135)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__134, ty2, dtb__136))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__137, dtb__138, dtb__139, dtb__140) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__139)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__137, dtb__138, ty2, dtb__140))))))
  | Frontend_dAst.C_Decl_DSig (dtb__141, dtb__142, dtb__143, dtb__144) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__142)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__143)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__141, ctx2, ty2, dtb__144))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__145, dtb__146, dtb__147, dtb__148) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__147)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__145, dtb__146, body2, dtb__148))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> ((Base_dCommon.v_bind (((v_expandFields (fuel - 1)) scope) dtb__151)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__149, dtb__150, fields2, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__159)) (fun (supers2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandTraitMethods (fuel - 1)) scope) dtb__160)) (fun (methods2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__157, dtb__158, supers2, methods2, dtb__161))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb__162, dtb__163, dtb__164, dtb__165) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__162)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__163)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDeclsGo (fuel - 1)) scope) dtb__164)) (fun (methods2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, methods2, dtb__165))))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 36 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandDecls = (fun (scope : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((v_expandDeclsGo v_expandFuelBound) scope) decls))
