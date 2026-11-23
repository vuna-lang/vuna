open Vuna_runtime
# 34 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandFuelBound = 1073741824

# 237 "Vuna/Compiler/Loader/Expand.vuna"
let v_internalRef = (fun (name : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (("!" ^ name), sp)))

# 241 "Vuna/Compiler/Loader/Expand.vuna"
let v_debugOnRef = (fun (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_debugOnIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (0, sp)), B_dData_dList.C_List_Nil)), sp)))

# 245 "Vuna/Compiler/Loader/Expand.vuna"
let v_logLevelOf = (fun (s : string) -> ((B_dData_dList.v_lookupPair s) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "error"; B_dData_dPair.f_Pair_second = 0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "warn"; B_dData_dPair.f_Pair_second = 1 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "info"; B_dData_dPair.f_Pair_second = 2 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "debug"; B_dData_dPair.f_Pair_second = 3 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "trace"; B_dData_dPair.f_Pair_second = 4 }, B_dData_dList.C_List_Nil))))))))))))

# 249 "Vuna/Compiler/Loader/Expand.vuna"
let v_logOnRef = (fun (level : int) (scope : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logOnIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sp)), B_dData_dList.C_List_Nil)))), sp)))

# 254 "Vuna/Compiler/Loader/Expand.vuna"
let v_logExpand = (fun (scope : string) (level : int) (msg : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EIf ((((v_logOnRef level) scope) sp), (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logEmitIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sp)), (B_dData_dList.C_List__x58__x58_ (msg, B_dData_dList.C_List_Nil)))))), sp)), (Frontend_dAst.C_Expr_EInt (0, sp)), sp)))

# 262 "Vuna/Compiler/Loader/Expand.vuna"
let v_macroArityMismatch = (fun (name : string) (expected : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (let expectedText = (bi_strFromInt expected) in (let actualText = (bi_strFromInt (B_dData_dList.v_length args)) in (((((Base_dDiagnostics_dRn.v_rnAt3 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_MacroArity (name, expectedText, actualText))) name) expectedText) actualText))))

# 279 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandMacro = (fun (scope : string) (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (if (name = "dbg") then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf ((v_debugOnRef sp), (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_debugLineIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ (dtb__0, B_dData_dList.C_List_Nil)), sp)), (Frontend_dAst.C_Expr_EInt (0, sp)), sp))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (if (name = "log") then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | B_dData_dList.C_List_Nil -> (match dtb__2 with
  | Frontend_dAst.C_Expr_EStr (dtb__6, dtb__7) -> (match (v_logLevelOf dtb__6) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (Base_dDiag.C_Check_OkC (((((v_logExpand scope) dtb__8) dtb__4) sp)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_LogLevelUnknown (dtb__6))) dtb__6)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dDiagnostics_dRn.v_rnAt0 (Frontend_dAst.v_nodeRefSpan sp)) Base_dDiagnostics_dRn.C_RnErr_LogLevelNotLiteral)
)
  | _ -> ((((v_macroArityMismatch name) 2) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 2) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 2) args) sp)
)) else (if (name = "obs") then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_obsLogIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ (dtb__9, B_dData_dList.C_List_Nil)), sp))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (if (name = "mark") then (let nd_uscrut4 = args in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match dtb__12 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_obsMarkIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ (dtb__11, B_dData_dList.C_List_Nil)), sp))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_UnknownMacro (name))) name))))))

# 109 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandExprs = (fun (fuel : int) (scope : string) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match exprs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__13)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__14)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (e2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 118 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandExpr = (fun (fuel : int) (scope : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__15, dtb__16) -> (match (Frontend_dReserved.v_macroNameOf dtb__15) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> ((((v_expandMacro scope) dtb__17) B_dData_dList.C_List_Nil) dtb__16)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (e))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EApp (dtb__18, dtb__19, dtb__20) -> (match dtb__18 with
  | Frontend_dAst.C_Expr_EVar (dtb__21, dtb__22) -> (match (Frontend_dReserved.v_macroNameOf dtb__21) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__23) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__19)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((((v_expandMacro scope) dtb__23) args2) dtb__20)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__18)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__19)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__20))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__18)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__19)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__20))))))))
)
  | Frontend_dAst.C_Expr_EInt (dtb__24, dtb__25) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EStr (dtb__26, dtb__27) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EFloat (dtb__28, dtb__29) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_ELam (dtb__30, dtb__31, dtb__32) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__31)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__30, body2, dtb__32))))))
  | Frontend_dAst.C_Expr_EPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__36)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__37)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__33, dtb__34, dtb__35, dom2, cod2, dtb__38))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__39, dtb__40, dtb__41, dtb__42) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__39)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__40)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__41, dtb__42))))))))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__43, dtb__44) -> ((Base_dCommon.v_bind (((v_expandClauses (fuel - 1)) scope) dtb__43)) (fun (clauses2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELocalFun (clauses2, dtb__44))))))
  | Frontend_dAst.C_Expr_ECase (dtb__45, dtb__46, dtb__47) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__45)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandAlts (fuel - 1)) scope) dtb__46)) (fun (alts2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__47))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__48, dtb__49, dtb__50, dtb__51) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__48)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__49)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__50)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, el2, dtb__51))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__52, dtb__53, dtb__54) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__52)) (fun (base2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (base2, dtb__53, dtb__54))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__55, dtb__56, dtb__57) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__56)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__55, fields2, dtb__57))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__58, dtb__59, dtb__60) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__58)) (fun (base2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__59)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (base2, fields2, dtb__60))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__61, dtb__62) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__61)) (fun (stmts2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (stmts2, dtb__62))))))
  | Frontend_dAst.C_Expr_EInfix (dtb__63, dtb__64, dtb__65, dtb__66) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__64)) (fun (lhs2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__65)) (fun (rhs2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInfix (dtb__63, lhs2, rhs2, dtb__66))))))))
  | Frontend_dAst.C_Expr_EParen (dtb__67, dtb__68) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__67)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EParen (inner2, dtb__68))))))
  | Frontend_dAst.C_Expr_EBacktick (dtb__69, dtb__70, dtb__71, dtb__72) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__70)) (fun (lhs2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__71)) (fun (rhs2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EBacktick (dtb__69, lhs2, rhs2, dtb__72))))))))
  | Frontend_dAst.C_Expr_ESectOp (dtb__73, dtb__74) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_ESectL (dtb__75, dtb__76, dtb__77) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__76)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectL (dtb__75, inner2, dtb__77))))))
  | Frontend_dAst.C_Expr_ESectR (dtb__78, dtb__79, dtb__80) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__78)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectR (inner2, dtb__79, dtb__80))))))
  | Frontend_dAst.C_Expr_EAnn (dtb__81, dtb__82, dtb__83) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__81)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__82)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EAnn (value2, ty2, dtb__83))))))))
  | Frontend_dAst.C_Expr_EInterp (dtb__84, dtb__85, dtb__86) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__85)) (fun (parts2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (dtb__84, parts2, dtb__86))))))
  | _ -> failwith "DT: impossible branch"
)))
# 158 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandPatExprs = (fun (fuel : int) (scope : string) (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match binds with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> ((Base_dCommon.v_bind (((v_expandBindingSig (fuel - 1)) scope) (dtb__87).Frontend_dAst.f_Binding_bindSig)) (fun (sig2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__87).Frontend_dAst.f_Binding_bindValue)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__88)) (fun (rest2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__87).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = value2; Frontend_dAst.f_Binding_bindSig = sig2; Frontend_dAst.f_Binding_bindRef = (dtb__87).Frontend_dAst.f_Binding_bindRef }, rest2))))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 168 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandBindingSig = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) (dtb__89).Frontend_dAst.f_BindingSig_sigType)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = ty2; Frontend_dAst.f_BindingSig_sigRef = (dtb__89).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 176 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandAlts = (fun (fuel : int) (scope : string) (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match alts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__90).Frontend_dAst.f_Alt_altBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandAlts (fuel - 1)) scope) dtb__91)) (fun (rest2 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (dtb__90).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = body2; Frontend_dAst.f_Alt_altRef = (dtb__90).Frontend_dAst.f_Alt_altRef }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 185 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandClauses = (fun (fuel : int) (scope : string) (clauses : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match clauses with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) (dtb__92).Frontend_dAst.f_LocalClause_lcBody)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandClauses (fuel - 1)) scope) dtb__93)) (fun (rest2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = (dtb__92).Frontend_dAst.f_LocalClause_lcPats; Frontend_dAst.f_LocalClause_lcBody = body2; Frontend_dAst.f_LocalClause_lcRef = (dtb__92).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (dtb__92).Frontend_dAst.f_LocalClause_lcHead }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 194 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandFieldExprs = (fun (fuel : int) (scope : string) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (let nd_uscrut3 = fields in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__97)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandFieldExprs (fuel - 1)) scope) dtb__95)) (fun (rest2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = value2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 203 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDoStmts = (fun (fuel : int) (scope : string) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match stmts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__100, dtb__101, dtb__102) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__101)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__99)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb__100, stmtExpr2, dtb__102)), rest2))))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__103, dtb__104) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__103)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__99)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr (stmtExpr2, dtb__104)), rest2))))))))
  | Frontend_dAst.C_DoStmt_DLet (dtb__105, dtb__106) -> ((Base_dCommon.v_bind (((v_expandPatExprs (fuel - 1)) scope) dtb__105)) (fun (binds2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandDoStmts (fuel - 1)) scope) dtb__99)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DLet (binds2, dtb__106)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 216 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandInterpParts = (fun (fuel : int) (scope : string) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match parts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__109) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__108)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__109)), rest2))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__110) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__110)) (fun (holeExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandInterpParts (fuel - 1)) scope) dtb__108)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (holeExpr2)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 75 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandCtor = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Ctor) -> (match mc2 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__111; Frontend_dAst.f_Ctor_ctorType = dtb__112; Frontend_dAst.f_Ctor_ctorArity = dtb__113; Frontend_dAst.f_Ctor_ctorRef = dtb__114 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__112)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__111; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__113; Frontend_dAst.f_Ctor_ctorRef = dtb__114 }))))
  | _ -> failwith "DT: impossible branch"
))

# 66 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandCtors = (fun (fuel : int) (scope : string) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match ctors with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> ((Base_dCommon.v_bind (((v_expandCtor (fuel - 1)) scope) dtb__115)) (fun (c2 : Frontend_dAst.t_Ctor) -> ((Base_dCommon.v_bind (((v_expandCtors (fuel - 1)) scope) dtb__116)) (fun (rest2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (c2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 90 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandField = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Field) -> (match mc2 with
  | { Frontend_dAst.f_Field_fieldName = dtb__117; Frontend_dAst.f_Field_fieldType = dtb__118; Frontend_dAst.f_Field_fieldRef = dtb__119 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__118)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__117; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldRef = dtb__119 }))))
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandFields = (fun (fuel : int) (scope : string) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match fields with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> ((Base_dCommon.v_bind (((v_expandField (fuel - 1)) scope) dtb__120)) (fun (f2 : Frontend_dAst.t_Field) -> ((Base_dCommon.v_bind (((v_expandFields (fuel - 1)) scope) dtb__121)) (fun (rest2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (f2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 103 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandTraitMethod = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_TraitMethod) -> (match mc2 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__122; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__123; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__124 } -> ((Base_dCommon.v_bind (((v_expandExpr (mc0 - 1)) mc1) dtb__123)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__122; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__124 }))))
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandTraitMethods = (fun (fuel : int) (scope : string) (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match methods with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> ((Base_dCommon.v_bind (((v_expandTraitMethod (fuel - 1)) scope) dtb__125)) (fun (m2 : Frontend_dAst.t_TraitMethod) -> ((Base_dCommon.v_bind (((v_expandTraitMethods (fuel - 1)) scope) dtb__126)) (fun (rest2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (m2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 42 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandDeclsGo = (fun (fuel : int) (scope : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match decls with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> ((Base_dCommon.v_bind (((v_expandDecl fuel) scope) dtb__127)) (fun (d2 : Frontend_dAst.t_Decl) -> ((Base_dCommon.v_bind (((v_expandDeclsGo (fuel - 1)) scope) dtb__128)) (fun (rest2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (d2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 51 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDecl = (fun (fuel : int) (scope : string) (d : Frontend_dAst.t_Decl) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match d with
  | Frontend_dAst.C_Decl_DData (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__131)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandCtors (fuel - 1)) scope) dtb__132)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__129, dtb__130, kind2, ctors2, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__138, dtb__139, dtb__140) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__139)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__138, ty2, dtb__140))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__141, dtb__142, dtb__143, dtb__144) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__143)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__141, dtb__142, ty2, dtb__144))))))
  | Frontend_dAst.C_Decl_DSig (dtb__145, dtb__146, dtb__147, dtb__148) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__146)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__147)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__145, ctx2, ty2, dtb__148))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__149, dtb__150, dtb__151, dtb__152) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__151)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__149, dtb__150, body2, dtb__152))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> ((Base_dCommon.v_bind (((v_expandFields (fuel - 1)) scope) dtb__155)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__153, dtb__154, fields2, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__163)) (fun (supers2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandTraitMethods (fuel - 1)) scope) dtb__164)) (fun (methods2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__161, dtb__162, supers2, methods2, dtb__165))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb__166, dtb__167, dtb__168, dtb__169) -> ((Base_dCommon.v_bind (((v_expandExprs (fuel - 1)) scope) dtb__166)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((v_expandExpr (fuel - 1)) scope) dtb__167)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind (((v_expandDeclsGo (fuel - 1)) scope) dtb__168)) (fun (methods2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, methods2, dtb__169))))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 39 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandDecls = (fun (scope : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (((v_expandDeclsGo v_expandFuelBound) scope) decls))
