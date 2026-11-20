open Vuna_runtime
# 34 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandFuelBound = 1073741824

# 212 "Vuna/Compiler/Loader/Expand.vuna"
let v_internalRef = (fun (name : string) (sp : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_EVar (("!" ^ name), sp)))

# 216 "Vuna/Compiler/Loader/Expand.vuna"
let v_debugOnRef = (fun (sp : Base_dSource.t_Span) -> (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_debugOnIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (0, sp)), B_dData_dList.C_List_Nil)), sp)))

# 219 "Vuna/Compiler/Loader/Expand.vuna"
let v_macroArityMismatch = (fun (name : string) (expected : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (let expectedText = (bi_strFromInt expected) in (let actualText = (bi_strFromInt (B_dData_dList.v_length args)) in (((((Base_dDiagnostics_dRn.v_rnAt3 sp) (Base_dDiagnostics_dRn.C_RnErr_MacroArity (name, expectedText, actualText))) name) expectedText) actualText))))

# 235 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandMacro = (fun (name : string) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (if (name = "dbg") then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (match dtb__1 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf ((v_debugOnRef sp), (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_debugLineIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ (dtb__0, B_dData_dList.C_List_Nil)), sp)), (Frontend_dAst.C_Expr_EInt (0, sp)), sp))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (if (name = "obs") then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__3 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_obsLogIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ (dtb__2, B_dData_dList.C_List_Nil)), sp))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (if (name = "mark") then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (match dtb__5 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_obsMarkIntrinsicName) sp), (B_dData_dList.C_List__x58__x58_ (dtb__4, B_dData_dList.C_List_Nil)), sp))))
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)
  | _ -> ((((v_macroArityMismatch name) 1) args) sp)
)) else (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_UnknownMacro (name))) name)))))

# 104 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandExprs = (fun (fuel : int) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match exprs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__6)) (fun (e2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExprs (fuel - 1)) dtb__7)) (fun (rest2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (e2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 113 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandExpr = (fun (fuel : int) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__8, dtb__9) -> (match (Frontend_dAst.v_macroNameOf dtb__8) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (((v_expandMacro dtb__10) B_dData_dList.C_List_Nil) dtb__9)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (e))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EApp (dtb__11, dtb__12, dtb__13) -> (match dtb__11 with
  | Frontend_dAst.C_Expr_EVar (dtb__14, dtb__15) -> (match (Frontend_dAst.v_macroNameOf dtb__14) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> ((Base_dCommon.v_bind ((v_expandExprs (fuel - 1)) dtb__12)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (((v_expandMacro dtb__16) args2) dtb__13)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__11)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExprs (fuel - 1)) dtb__12)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__13))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__11)) (fun (fn2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExprs (fuel - 1)) dtb__12)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (fn2, args2, dtb__13))))))))
)
  | Frontend_dAst.C_Expr_EInt (dtb__17, dtb__18) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EStr (dtb__19, dtb__20) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_EFloat (dtb__21, dtb__22) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_ELam (dtb__23, dtb__24, dtb__25) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__24)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb__23, body2, dtb__25))))))
  | Frontend_dAst.C_Expr_EPi (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__29)) (fun (dom2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__30)) (fun (cod2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb__26, dtb__27, dtb__28, dom2, cod2, dtb__31))))))))
  | Frontend_dAst.C_Expr_ELet (dtb__32, dtb__33, dtb__34, dtb__35) -> ((Base_dCommon.v_bind ((v_expandPatExprs (fuel - 1)) dtb__32)) (fun (binds2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__33)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (binds2, body2, dtb__34, dtb__35))))))))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__36, dtb__37) -> ((Base_dCommon.v_bind ((v_expandClauses (fuel - 1)) dtb__36)) (fun (clauses2 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELocalFun (clauses2, dtb__37))))))
  | Frontend_dAst.C_Expr_ECase (dtb__38, dtb__39, dtb__40) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__38)) (fun (scrut2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandPatExprs (fuel - 1)) dtb__39)) (fun (alts2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (scrut2, alts2, dtb__40))))))))
  | Frontend_dAst.C_Expr_EIf (dtb__41, dtb__42, dtb__43, dtb__44) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__41)) (fun (c2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__42)) (fun (t2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__43)) (fun (el2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (c2, t2, el2, dtb__44))))))))))
  | Frontend_dAst.C_Expr_EField (dtb__45, dtb__46, dtb__47) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__45)) (fun (base2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (base2, dtb__46, dtb__47))))))
  | Frontend_dAst.C_Expr_ERecord (dtb__48, dtb__49, dtb__50) -> ((Base_dCommon.v_bind ((v_expandFieldExprs (fuel - 1)) dtb__49)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb__48, fields2, dtb__50))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__51, dtb__52, dtb__53) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__51)) (fun (base2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandFieldExprs (fuel - 1)) dtb__52)) (fun (fields2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (base2, fields2, dtb__53))))))))
  | Frontend_dAst.C_Expr_EDo (dtb__54, dtb__55) -> ((Base_dCommon.v_bind ((v_expandDoStmts (fuel - 1)) dtb__54)) (fun (stmts2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EDo (stmts2, dtb__55))))))
  | Frontend_dAst.C_Expr_EInfix (dtb__56, dtb__57, dtb__58, dtb__59) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__57)) (fun (lhs2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__58)) (fun (rhs2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInfix (dtb__56, lhs2, rhs2, dtb__59))))))))
  | Frontend_dAst.C_Expr_EParen (dtb__60, dtb__61) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__60)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EParen (inner2, dtb__61))))))
  | Frontend_dAst.C_Expr_EBacktick (dtb__62, dtb__63, dtb__64, dtb__65) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__63)) (fun (lhs2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__64)) (fun (rhs2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EBacktick (dtb__62, lhs2, rhs2, dtb__65))))))))
  | Frontend_dAst.C_Expr_ESectOp (dtb__66, dtb__67) -> (Base_dDiag.C_Check_OkC (e))
  | Frontend_dAst.C_Expr_ESectL (dtb__68, dtb__69, dtb__70) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__69)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectL (dtb__68, inner2, dtb__70))))))
  | Frontend_dAst.C_Expr_ESectR (dtb__71, dtb__72, dtb__73) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__71)) (fun (inner2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ESectR (inner2, dtb__72, dtb__73))))))
  | Frontend_dAst.C_Expr_EAnn (dtb__74, dtb__75, dtb__76) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__74)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__75)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EAnn (value2, ty2, dtb__76))))))))
  | Frontend_dAst.C_Expr_EInterp (dtb__77, dtb__78, dtb__79) -> ((Base_dCommon.v_bind ((v_expandInterpParts (fuel - 1)) dtb__78)) (fun (parts2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInterp (dtb__77, parts2, dtb__79))))))
  | _ -> failwith "DT: impossible branch"
)))
# 152 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandPatExprs = (fun (fuel : int) (pairs : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (let nd_uscrut2 = pairs in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = dtb__83 } -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__83)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandPatExprs (fuel - 1)) dtb__81)) (fun (rest2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = value2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 161 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandClauses = (fun (fuel : int) (clauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (let nd_uscrut2 = clauses in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match dtb__84 with
  | { B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = dtb__87 } -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__87)) (fun (body2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandClauses (fuel - 1)) dtb__85)) (fun (rest2 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = body2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 170 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandFieldExprs = (fun (fuel : int) (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (let nd_uscrut2 = fields in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (match dtb__88 with
  | { B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__91 } -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__91)) (fun (value2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandFieldExprs (fuel - 1)) dtb__89)) (fun (rest2 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = value2 }, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 179 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDoStmts = (fun (fuel : int) (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match stmts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__94, dtb__95, dtb__96) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__95)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandDoStmts (fuel - 1)) dtb__93)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DBind (dtb__94, stmtExpr2, dtb__96)), rest2))))))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__97, dtb__98) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__97)) (fun (stmtExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandDoStmts (fuel - 1)) dtb__93)) (fun (rest2 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_DoStmt_DExpr (stmtExpr2, dtb__98)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 191 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandInterpParts = (fun (fuel : int) (parts : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match parts with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (match dtb__99 with
  | Frontend_dAst.C_InterpPart_IPText (dtb__101) -> ((Base_dCommon.v_bind ((v_expandInterpParts (fuel - 1)) dtb__100)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__101)), rest2))))))
  | Frontend_dAst.C_InterpPart_IPHole (dtb__102) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__102)) (fun (holeExpr2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandInterpParts (fuel - 1)) dtb__100)) (fun (rest2 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (holeExpr2)), rest2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 74 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandCtor = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__103; Frontend_dAst.f_Ctor_ctorType = dtb__104; Frontend_dAst.f_Ctor_ctorArity = dtb__105; Frontend_dAst.f_Ctor_ctorSpan = dtb__106 } -> ((Base_dCommon.v_bind ((v_expandExpr (mc0 - 1)) dtb__104)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb__103; Frontend_dAst.f_Ctor_ctorType = ty2; Frontend_dAst.f_Ctor_ctorArity = dtb__105; Frontend_dAst.f_Ctor_ctorSpan = dtb__106 }))))
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandCtors = (fun (fuel : int) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match ctors with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> ((Base_dCommon.v_bind ((v_expandCtor (fuel - 1)) dtb__107)) (fun (c2 : Frontend_dAst.t_Ctor) -> ((Base_dCommon.v_bind ((v_expandCtors (fuel - 1)) dtb__108)) (fun (rest2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (c2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 87 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandField = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__109; Frontend_dAst.f_Field_fieldType = dtb__110; Frontend_dAst.f_Field_fieldSpan = dtb__111 } -> ((Base_dCommon.v_bind ((v_expandExpr (mc0 - 1)) dtb__110)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb__109; Frontend_dAst.f_Field_fieldType = ty2; Frontend_dAst.f_Field_fieldSpan = dtb__111 }))))
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandFields = (fun (fuel : int) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match fields with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> ((Base_dCommon.v_bind ((v_expandField (fuel - 1)) dtb__112)) (fun (f2 : Frontend_dAst.t_Field) -> ((Base_dCommon.v_bind ((v_expandFields (fuel - 1)) dtb__113)) (fun (rest2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (f2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 100 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandTraitMethod = (fun (mc0 : int) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__114; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__115; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__116 } -> ((Base_dCommon.v_bind ((v_expandExpr (mc0 - 1)) dtb__115)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb__114; Frontend_dAst.f_TraitMethod_traitMethodType = ty2; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__116 }))))
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandTraitMethods = (fun (fuel : int) (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match methods with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> ((Base_dCommon.v_bind ((v_expandTraitMethod (fuel - 1)) dtb__117)) (fun (m2 : Frontend_dAst.t_TraitMethod) -> ((Base_dCommon.v_bind ((v_expandTraitMethods (fuel - 1)) dtb__118)) (fun (rest2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (m2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 41 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandDeclsGo = (fun (fuel : int) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match decls with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__119, dtb__120) -> ((Base_dCommon.v_bind ((v_expandDecl fuel) dtb__119)) (fun (d2 : Frontend_dAst.t_Decl) -> ((Base_dCommon.v_bind ((v_expandDeclsGo (fuel - 1)) dtb__120)) (fun (rest2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (d2, rest2))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 50 "Vuna/Compiler/Loader/Expand.vuna"
and v_expandDecl = (fun (fuel : int) (d : Frontend_dAst.t_Decl) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match d with
  | Frontend_dAst.C_Decl_DData (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__123)) (fun (kind2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandCtors (fuel - 1)) dtb__124)) (fun (ctors2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb__121, dtb__122, kind2, ctors2, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb__130, dtb__131, dtb__132) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__131)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb__130, ty2, dtb__132))))))
  | Frontend_dAst.C_Decl_DExtern (dtb__133, dtb__134, dtb__135, dtb__136) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__135)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb__133, dtb__134, ty2, dtb__136))))))
  | Frontend_dAst.C_Decl_DSig (dtb__137, dtb__138, dtb__139, dtb__140) -> ((Base_dCommon.v_bind ((v_expandExprs (fuel - 1)) dtb__138)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__139)) (fun (ty2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb__137, ctx2, ty2, dtb__140))))))))
  | Frontend_dAst.C_Decl_DFun (dtb__141, dtb__142, dtb__143, dtb__144) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__143)) (fun (body2 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb__141, dtb__142, body2, dtb__144))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152) -> ((Base_dCommon.v_bind ((v_expandFields (fuel - 1)) dtb__147)) (fun (fields2 : Frontend_dAst.t_Field B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb__145, dtb__146, fields2, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152))))))
  | Frontend_dAst.C_Decl_DTrait (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157) -> ((Base_dCommon.v_bind ((v_expandExprs (fuel - 1)) dtb__155)) (fun (supers2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandTraitMethods (fuel - 1)) dtb__156)) (fun (methods2 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb__153, dtb__154, supers2, methods2, dtb__157))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb__158, dtb__159, dtb__160, dtb__161) -> ((Base_dCommon.v_bind ((v_expandExprs (fuel - 1)) dtb__158)) (fun (ctx2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_expandExpr (fuel - 1)) dtb__159)) (fun (head2 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((v_expandDeclsGo (fuel - 1)) dtb__160)) (fun (methods2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctx2, head2, methods2, dtb__161))))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 38 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_expandDeclsGo v_expandFuelBound) decls))
