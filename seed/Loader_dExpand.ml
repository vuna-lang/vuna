open Vuna_runtime
# 33 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandFuelBound = 1073741824

# 78 "Vuna/Compiler/Loader/Expand.vuna"
let v_internalRef = (fun (name : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (("!" ^ name), (Frontend_dAst.v_synthNodeRef sp))))

# 82 "Vuna/Compiler/Loader/Expand.vuna"
let v_logLevelOf = (fun (s : string) -> ((B_dData_dList.v_lookupPair s) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "error"; B_dData_dPair.f_Pair_second = 0 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "warn"; B_dData_dPair.f_Pair_second = 1 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "info"; B_dData_dPair.f_Pair_second = 2 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "debug"; B_dData_dPair.f_Pair_second = 3 }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "trace"; B_dData_dPair.f_Pair_second = 4 }, B_dData_dList.C_List_Nil))))))))))))

# 86 "Vuna/Compiler/Loader/Expand.vuna"
let v_logOnRef = (fun (level : int) (scope : string) (sp : Frontend_dAst.t_NodeRef) -> (let sref = (Frontend_dAst.v_synthNodeRef sp) in (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logOnIntrinsicName) sref), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sref)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sref)), B_dData_dList.C_List_Nil)))), sref))))

# 94 "Vuna/Compiler/Loader/Expand.vuna"
let v_logExpand = (fun (scope : string) (level : int) (msg : Frontend_dAst.t_Expr) (sp : Frontend_dAst.t_NodeRef) -> (let sref = (Frontend_dAst.v_synthNodeRef sp) in (Frontend_dAst.C_Expr_EIf ((((v_logOnRef level) scope) sref), (Frontend_dAst.C_Expr_EApp (((v_internalRef Base_dIntrinsics.v_logEmitIntrinsicName) sref), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EInt (level, sref)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (scope, sref)), (B_dData_dList.C_List__x58__x58_ (msg, B_dData_dList.C_List_Nil)))))), sref)), (Frontend_dAst.C_Expr_EInt (0, sref)), sref))))

# 104 "Vuna/Compiler/Loader/Expand.vuna"
let v_macroArityMismatch = (fun (name : string) (expected : int) (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (let expectedText = (string_of_int expected) in (let actualText = (string_of_int (B_dData_dList.v_length args)) in (((((Base_dDiagnostics_dRn.v_rnAt3 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dRn.C_RnErr_MacroArity (name, expectedText, actualText))) name) expectedText) actualText))))

# 117 "Vuna/Compiler/Loader/Expand.vuna"
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

# 53 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandExpr = (fun (fuel : int) (scope : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__9, dtb__10) -> (match (Frontend_dReserved.v_macroNameOf dtb__9) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> ((((v_expandMacro scope) dtb__11) B_dData_dList.C_List_Nil) dtb__10)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (e))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Expr_EApp (dtb__12, dtb__13, dtb__14) -> (match dtb__12 with
  | Frontend_dAst.C_Expr_EVar (dtb__15, dtb__16) -> (match (Frontend_dReserved.v_macroNameOf dtb__15) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> ((Base_dCommon.v_bind ((Frontend_dAstWalk.v_mapExprList ((v_expandExpr (fuel - 1)) scope)) dtb__13)) (fun (args2 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((((v_expandMacro scope) dtb__17) args2) dtb__14)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dAstWalk.v_mapExpr ((v_expandExpr (fuel - 1)) scope)) e)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Frontend_dAstWalk.v_mapExpr ((v_expandExpr (fuel - 1)) scope)) e)
)
  | _ -> ((Frontend_dAstWalk.v_mapExpr ((v_expandExpr (fuel - 1)) scope)) e)
)))

# 41 "Vuna/Compiler/Loader/Expand.vuna"
let rec v_expandDecl = (fun (fuel : int) (scope : string) (d : Frontend_dAst.t_Decl) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "macro expansion") else (((((Frontend_dAstWalk.v_mapDeclWith ((v_expandExpr (fuel - 1)) scope)) (fun (p : Frontend_dAst.t_Pat) -> (Base_dDiag.C_Check_OkC (p)))) ((v_expandDecl (fuel - 1)) scope)) (fun (param : Frontend_dAst.t_TraitParam) -> (Base_dDiag.C_Check_OkC (param)))) d)))

# 38 "Vuna/Compiler/Loader/Expand.vuna"
let v_expandDecls = (fun (scope : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Frontend_dAstWalk.v_mapDeclsWith ((v_expandDecl v_expandFuelBound) scope)) decls))
