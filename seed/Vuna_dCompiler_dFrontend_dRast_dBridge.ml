open Vuna_runtime
# 68 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat = (fun p -> (match p with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__0, dtb__1) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__0, dtb__1))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__2, dtb__3, dtb__4) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__2, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat dtb__3), dtb__4))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__5) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__5))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__6, dtb__7, dtb__8) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__6), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat) dtb__7), dtb__8))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__9, dtb__10) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__9, dtb__10))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__11, dtb__12) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__11, dtb__12))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__13, dtb__14, dtb__15) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__13), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPatField) dtb__14), dtb__15))
  | _ -> failwith "DT: impossible branch"
))
# 80 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPatField = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__17 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat dtb__17) }
  | _ -> failwith "DT: impossible branch"
))

# 14 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr = (fun e -> (match e with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__18, dtb__19) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__18), dtb__19))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__20, dtb__21) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__20, dtb__21))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__22, dtb__23) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__22, dtb__23))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat (dtb__24, dtb__25) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__24, dtb__25))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__26, dtb__27, dtb__28) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__26, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstInterpPart) dtb__27), dtb__28))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__29, dtb__30, dtb__31) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__29, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__30), dtb__31))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__32, dtb__33, dtb__34) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__32), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr) dtb__33), dtb__34))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__35, dtb__36, dtb__37, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__38), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__39), dtb__40))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__41, dtb__42, dtb__43, dtb__44) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstBinding) dtb__41), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__42), dtb__43, dtb__44))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__45, dtb__46) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstLocalClause) dtb__45), dtb__46))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__47, dtb__48, dtb__49) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__47), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstAlt) dtb__48), dtb__49))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__50, dtb__51, dtb__52, dtb__53) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__50), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__51), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__52), dtb__53))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__54, dtb__55, dtb__56) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__54), dtb__55, dtb__56))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__57, dtb__58, dtb__59) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__57), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstFieldValue) dtb__58), dtb__59))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__60, dtb__61, dtb__62) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__60), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstFieldValue) dtb__61), dtb__62))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__63, dtb__64) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstStmt) dtb__63), dtb__64))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__65, dtb__66, dtb__67, dtb__68) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__65, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__66), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__67), dtb__68))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (dtb__69, dtb__70) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__69), dtb__70))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__71, dtb__72, dtb__73, dtb__74) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__71, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__72), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__73), dtb__74))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp (dtb__75, dtb__76) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__75, dtb__76))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__77, dtb__78, dtb__79) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__77, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__78), dtb__79))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (dtb__80, dtb__81, dtb__82) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__80), dtb__81, dtb__82))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__83, dtb__84, dtb__85) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__83), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__84), dtb__85))
  | _ -> failwith "DT: impossible branch"
))
# 44 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstInterpPart = (fun part -> (match part with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__86) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__86))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole (dtb__87) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__87)))
  | _ -> failwith "DT: impossible branch"
))
# 50 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstBinding = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__88; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__89 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat dtb__88); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__89) }
  | _ -> failwith "DT: impossible branch"
))
# 53 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstLocalClause = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__90; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__91 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat) dtb__90); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__91) }
  | _ -> failwith "DT: impossible branch"
))
# 56 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstAlt = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__92; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat dtb__92); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__93) }
  | _ -> failwith "DT: impossible branch"
))
# 59 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstFieldValue = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__94; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__95 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__94; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__95) }
  | _ -> failwith "DT: impossible branch"
))
# 62 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstStmt = (fun stmt -> (match stmt with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DBind (dtb__96, dtb__97, dtb__98) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat dtb__96), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__97), dtb__98))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDoStmt_DExpr (dtb__99, dtb__100) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__99), dtb__100))
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastExpr = (fun e -> ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dofExpr Base_dData_dList.C_Base_dData_dList_dList_Nil) e))

# 88 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastDecls = (fun decls -> (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dofDecls decls))

# 92 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastDecl = (fun d -> ((Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dofDecl Base_dData_dList.C_Base_dData_dList_dList_Nil) d))

# 120 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstCtor = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dCtor) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorName = dtb__101; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorType = dtb__102; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorArity = dtb__103; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dCtor_ctorSpan = dtb__104 } -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__101; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__102); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__103; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__104 }
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstField = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dField) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dField_fieldName = dtb__105; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dField_fieldType = dtb__106; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dField_fieldSpan = dtb__107 } -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__105; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__106); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__107 }
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstTraitMethod = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dTraitMethod) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodName = dtb__108; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodType = dtb__109; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dTraitMethod_traitMethodSpan = dtb__110 } -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__108; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__109); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__110 }
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dmaybeMap = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__111) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((mc0 dtb__111)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstTraitParam = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dTraitParam) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamName = dtb__112; Vuna_dCompiler_dFrontend_dRast.f_Vuna_dCompiler_dFrontend_dRast_dTraitParam_traitParamKind = dtb__113 } -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName = dtb__112; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind = ((v_Vuna_dCompiler_dFrontend_dRast_dBridge_dmaybeMap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr) dtb__113) }
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstDecl = (fun d -> (match d with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__114, dtb__115, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__116), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstCtor) dtb__117), dtb__118, dtb__119, dtb__120, dtb__121, dtb__122))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__123, dtb__124, dtb__125) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__123, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__124), dtb__125))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__126, dtb__127, dtb__128, dtb__129) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__126, dtb__127, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__128), dtb__129))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DSig (dtb__130, dtb__131, dtb__132, dtb__133) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__130, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr) dtb__131), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__132), dtb__133))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__134, dtb__135, dtb__136, dtb__137) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__134, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstPat) dtb__135), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__136), dtb__137))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DRecord (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__138, dtb__139, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstField) dtb__140), dtb__141, dtb__142, dtb__143, dtb__144, dtb__145))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DTrait (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__146, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstTraitParam) dtb__147), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr) dtb__148), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstTraitMethod) dtb__149), dtb__150))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DInstance (dtb__151, dtb__152, dtb__153, dtb__154) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr) dtb__151), (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstExpr dtb__152), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstDecl) dtb__153), dtb__154))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstDecls = (fun decls -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoAstDecl) decls))

# 137 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastPat = (fun p -> (match p with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__155, dtb__156) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__155, dtb__156))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__157, dtb__158, dtb__159) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__157, (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastPat dtb__158), dtb__159))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__160) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__160))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__161, dtb__162, dtb__163) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName dtb__161), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastPat) dtb__162), dtb__163))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__164, dtb__165) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__164, dtb__165))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__166, dtb__167) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__166, dtb__167))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__168, dtb__169, dtb__170) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName dtb__168), ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastPatField) dtb__169), dtb__170))
  | _ -> failwith "DT: impossible branch"
))
# 149 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastPatField = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__171; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__172 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__171; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dRast_dBridge_dtoRastPat dtb__172) }
  | _ -> failwith "DT: impossible branch"
))
