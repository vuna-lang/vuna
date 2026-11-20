open Vuna_runtime
# 63 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstPat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__0, dtb__1, dtb__2) -> (Frontend_dAst.C_Pat_PRecord ((Frontend_dRast_dName.v_rnameKey dtb__0), ((B_dData_dList.v_map v_toAstPatField) dtb__1), dtb__2))
  | Frontend_dRast.C_Pat_PStr (dtb__3, dtb__4) -> (Frontend_dAst.C_Pat_PStr (dtb__3, dtb__4))
  | Frontend_dRast.C_Pat_PInt (dtb__5, dtb__6) -> (Frontend_dAst.C_Pat_PInt (dtb__5, dtb__6))
  | Frontend_dRast.C_Pat_PCon (dtb__7, dtb__8, dtb__9) -> (Frontend_dAst.C_Pat_PCon ((Frontend_dRast_dName.v_rnameKey dtb__7), ((B_dData_dList.v_map v_toAstPat) dtb__8), dtb__9))
  | Frontend_dRast.C_Pat_PWild (dtb__10) -> (Frontend_dAst.C_Pat_PWild (dtb__10))
  | Frontend_dRast.C_Pat_PAs (dtb__11, dtb__12, dtb__13) -> (Frontend_dAst.C_Pat_PAs (dtb__11, (v_toAstPat dtb__12), dtb__13))
  | Frontend_dRast.C_Pat_PVar (dtb__14, dtb__15) -> (Frontend_dAst.C_Pat_PVar (dtb__14, dtb__15))
  | _ -> failwith "DT: impossible branch"
))
# 73 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstPatField = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = (v_toAstPat dtb__17) }
  | _ -> failwith "DT: impossible branch"
))

# 14 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EAnn (dtb__18, dtb__19, dtb__20) -> (Frontend_dAst.C_Expr_EAnn ((v_toAstExpr dtb__18), (v_toAstExpr dtb__19), dtb__20))
  | Frontend_dRast.C_Expr_ESectR (dtb__21, dtb__22, dtb__23) -> (Frontend_dAst.C_Expr_ESectR ((v_toAstExpr dtb__21), dtb__22, dtb__23))
  | Frontend_dRast.C_Expr_ESectL (dtb__24, dtb__25, dtb__26) -> (Frontend_dAst.C_Expr_ESectL (dtb__24, (v_toAstExpr dtb__25), dtb__26))
  | Frontend_dRast.C_Expr_ESectOp (dtb__27, dtb__28) -> (Frontend_dAst.C_Expr_ESectOp (dtb__27, dtb__28))
  | Frontend_dRast.C_Expr_EBacktick (dtb__29, dtb__30, dtb__31, dtb__32) -> (Frontend_dAst.C_Expr_EBacktick (dtb__29, (v_toAstExpr dtb__30), (v_toAstExpr dtb__31), dtb__32))
  | Frontend_dRast.C_Expr_EParen (dtb__33, dtb__34) -> (Frontend_dAst.C_Expr_EParen ((v_toAstExpr dtb__33), dtb__34))
  | Frontend_dRast.C_Expr_EInfix (dtb__35, dtb__36, dtb__37, dtb__38) -> (Frontend_dAst.C_Expr_EInfix (dtb__35, (v_toAstExpr dtb__36), (v_toAstExpr dtb__37), dtb__38))
  | Frontend_dRast.C_Expr_EDo (dtb__39, dtb__40) -> (Frontend_dAst.C_Expr_EDo (((B_dData_dList.v_map v_toAstStmt) dtb__39), dtb__40))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__41, dtb__42, dtb__43) -> (Frontend_dAst.C_Expr_ERecUpdate ((v_toAstExpr dtb__41), ((B_dData_dList.v_map v_toAstFieldValue) dtb__42), dtb__43))
  | Frontend_dRast.C_Expr_ERecord (dtb__44, dtb__45, dtb__46) -> (Frontend_dAst.C_Expr_ERecord ((Frontend_dRast_dName.v_rnameKey dtb__44), ((B_dData_dList.v_map v_toAstFieldValue) dtb__45), dtb__46))
  | Frontend_dRast.C_Expr_EField (dtb__47, dtb__48, dtb__49) -> (Frontend_dAst.C_Expr_EField ((v_toAstExpr dtb__47), dtb__48, dtb__49))
  | Frontend_dRast.C_Expr_EIf (dtb__50, dtb__51, dtb__52, dtb__53) -> (Frontend_dAst.C_Expr_EIf ((v_toAstExpr dtb__50), (v_toAstExpr dtb__51), (v_toAstExpr dtb__52), dtb__53))
  | Frontend_dRast.C_Expr_ECase (dtb__54, dtb__55, dtb__56) -> (Frontend_dAst.C_Expr_ECase ((v_toAstExpr dtb__54), ((B_dData_dList.v_map v_toAstAlt) dtb__55), dtb__56))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__57, dtb__58) -> (Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_map v_toAstLocalClause) dtb__57), dtb__58))
  | Frontend_dRast.C_Expr_ELet (dtb__59, dtb__60, dtb__61, dtb__62) -> (Frontend_dAst.C_Expr_ELet (((B_dData_dList.v_map v_toAstBinding) dtb__59), (v_toAstExpr dtb__60), dtb__61, dtb__62))
  | Frontend_dRast.C_Expr_EPi (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (Frontend_dAst.C_Expr_EPi (dtb__63, dtb__64, dtb__65, (v_toAstExpr dtb__66), (v_toAstExpr dtb__67), dtb__68))
  | Frontend_dRast.C_Expr_EApp (dtb__69, dtb__70, dtb__71) -> (Frontend_dAst.C_Expr_EApp ((v_toAstExpr dtb__69), ((B_dData_dList.v_map v_toAstExpr) dtb__70), dtb__71))
  | Frontend_dRast.C_Expr_ELam (dtb__72, dtb__73, dtb__74) -> (Frontend_dAst.C_Expr_ELam (dtb__72, (v_toAstExpr dtb__73), dtb__74))
  | Frontend_dRast.C_Expr_EInterp (dtb__75, dtb__76, dtb__77) -> (Frontend_dAst.C_Expr_EInterp (dtb__75, ((B_dData_dList.v_map v_toAstInterpPart) dtb__76), dtb__77))
  | Frontend_dRast.C_Expr_EFloat (dtb__78, dtb__79) -> (Frontend_dAst.C_Expr_EFloat (dtb__78, dtb__79))
  | Frontend_dRast.C_Expr_EStr (dtb__80, dtb__81) -> (Frontend_dAst.C_Expr_EStr (dtb__80, dtb__81))
  | Frontend_dRast.C_Expr_EInt (dtb__82, dtb__83) -> (Frontend_dAst.C_Expr_EInt (dtb__82, dtb__83))
  | Frontend_dRast.C_Expr_EVar (dtb__84, dtb__85) -> (Frontend_dAst.C_Expr_EVar ((Frontend_dRast_dName.v_rnameKey dtb__84), dtb__85))
  | _ -> failwith "DT: impossible branch"
))
# 43 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstInterpPart = (fun (mc0 : Frontend_dRast.t_InterpPart) -> (match mc0 with
  | Frontend_dRast.C_InterpPart_IPHole (dtb__86) -> (Frontend_dAst.C_InterpPart_IPHole ((v_toAstExpr dtb__86)))
  | Frontend_dRast.C_InterpPart_IPText (dtb__87) -> (Frontend_dAst.C_InterpPart_IPText (dtb__87))
  | _ -> failwith "DT: impossible branch"
))
# 47 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstBinding = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = dtb__89 } -> { B_dData_dPair.f_Pair_first = (v_toAstPat dtb__88); B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__89) }
  | _ -> failwith "DT: impossible branch"
))
# 50 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstLocalClause = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__91 } -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map v_toAstPat) dtb__90); B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__91) }
  | _ -> failwith "DT: impossible branch"
))
# 53 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstAlt = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> { B_dData_dPair.f_Pair_first = (v_toAstPat dtb__92); B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__93) }
  | _ -> failwith "DT: impossible branch"
))
# 56 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstFieldValue = (fun (mc0 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__95) }
  | _ -> failwith "DT: impossible branch"
))
# 59 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstStmt = (fun (mc0 : Frontend_dRast.t_DoStmt) -> (match mc0 with
  | Frontend_dRast.C_DoStmt_DExpr (dtb__96, dtb__97) -> (Frontend_dAst.C_DoStmt_DExpr ((v_toAstExpr dtb__96), dtb__97))
  | Frontend_dRast.C_DoStmt_DBind (dtb__98, dtb__99, dtb__100) -> (Frontend_dAst.C_DoStmt_DBind ((v_toAstPat dtb__98), (v_toAstExpr dtb__99), dtb__100))
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastExpr = (fun (e : Frontend_dAst.t_Expr) -> ((Frontend_dRast.v_ofExpr B_dData_dList.C_List_Nil) e))

# 81 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Frontend_dRast.v_ofDecls decls))

# 85 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecl = (fun (d : Frontend_dAst.t_Decl) -> ((Frontend_dRast.v_ofDecl B_dData_dList.C_List_Nil) d))

# 111 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstCtor = (fun (mc0 : Frontend_dRast.t_Ctor) -> (match mc0 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__101; Frontend_dRast.f_Ctor_ctorType = dtb__102; Frontend_dRast.f_Ctor_ctorArity = dtb__103; Frontend_dRast.f_Ctor_ctorSpan = dtb__104 } -> { Frontend_dAst.f_Ctor_ctorName = dtb__101; Frontend_dAst.f_Ctor_ctorType = (v_toAstExpr dtb__102); Frontend_dAst.f_Ctor_ctorArity = dtb__103; Frontend_dAst.f_Ctor_ctorSpan = dtb__104 }
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstField = (fun (mc0 : Frontend_dRast.t_Field) -> (match mc0 with
  | { Frontend_dRast.f_Field_fieldName = dtb__105; Frontend_dRast.f_Field_fieldType = dtb__106; Frontend_dRast.f_Field_fieldSpan = dtb__107 } -> { Frontend_dAst.f_Field_fieldName = dtb__105; Frontend_dAst.f_Field_fieldType = (v_toAstExpr dtb__106); Frontend_dAst.f_Field_fieldSpan = dtb__107 }
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitMethod = (fun (mc0 : Frontend_dRast.t_TraitMethod) -> (match mc0 with
  | { Frontend_dRast.f_TraitMethod_traitMethodName = dtb__108; Frontend_dRast.f_TraitMethod_traitMethodType = dtb__109; Frontend_dRast.f_TraitMethod_traitMethodSpan = dtb__110 } -> { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__108; Frontend_dAst.f_TraitMethod_traitMethodType = (v_toAstExpr dtb__109); Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__110 }
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_maybeMap = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__111)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitParam = (fun (mc0 : Frontend_dRast.t_TraitParam) -> (match mc0 with
  | { Frontend_dRast.f_TraitParam_traitParamName = dtb__112; Frontend_dRast.f_TraitParam_traitParamKind = dtb__113 } -> { Frontend_dAst.f_TraitParam_traitParamName = dtb__112; Frontend_dAst.f_TraitParam_traitParamKind = ((v_maybeMap v_toAstExpr) dtb__113) }
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstDecl = (fun (mc0 : Frontend_dRast.t_Decl) -> (match mc0 with
  | Frontend_dRast.C_Decl_DInstance (dtb__114, dtb__115, dtb__116, dtb__117) -> (Frontend_dAst.C_Decl_DInstance (((B_dData_dList.v_map v_toAstExpr) dtb__114), (v_toAstExpr dtb__115), ((B_dData_dList.v_map v_toAstDecl) dtb__116), dtb__117))
  | Frontend_dRast.C_Decl_DTrait (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (Frontend_dAst.C_Decl_DTrait (dtb__118, ((B_dData_dList.v_map v_toAstTraitParam) dtb__119), ((B_dData_dList.v_map v_toAstExpr) dtb__120), ((B_dData_dList.v_map v_toAstTraitMethod) dtb__121), dtb__122))
  | Frontend_dRast.C_Decl_DRecord (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> (Frontend_dAst.C_Decl_DRecord (dtb__123, dtb__124, ((B_dData_dList.v_map v_toAstField) dtb__125), dtb__126, dtb__127, dtb__128, dtb__129, dtb__130))
  | Frontend_dRast.C_Decl_DFun (dtb__131, dtb__132, dtb__133, dtb__134) -> (Frontend_dAst.C_Decl_DFun (dtb__131, ((B_dData_dList.v_map v_toAstPat) dtb__132), (v_toAstExpr dtb__133), dtb__134))
  | Frontend_dRast.C_Decl_DSig (dtb__135, dtb__136, dtb__137, dtb__138) -> (Frontend_dAst.C_Decl_DSig (dtb__135, ((B_dData_dList.v_map v_toAstExpr) dtb__136), (v_toAstExpr dtb__137), dtb__138))
  | Frontend_dRast.C_Decl_DExtern (dtb__139, dtb__140, dtb__141, dtb__142) -> (Frontend_dAst.C_Decl_DExtern (dtb__139, dtb__140, (v_toAstExpr dtb__141), dtb__142))
  | Frontend_dRast.C_Decl_DAxiom (dtb__143, dtb__144, dtb__145) -> (Frontend_dAst.C_Decl_DAxiom (dtb__143, (v_toAstExpr dtb__144), dtb__145))
  | Frontend_dRast.C_Decl_DData (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> (Frontend_dAst.C_Decl_DData (dtb__146, dtb__147, (v_toAstExpr dtb__148), ((B_dData_dList.v_map v_toAstCtor) dtb__149), dtb__150, dtb__151, dtb__152, dtb__153, dtb__154))
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstDecls = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map v_toAstDecl) decls))

# 128 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toRastPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__155, dtb__156, dtb__157) -> (Frontend_dRast.C_Pat_PRecord ((Frontend_dRast_dName.v_classifyName dtb__155), ((B_dData_dList.v_map v_toRastPatField) dtb__156), dtb__157))
  | Frontend_dAst.C_Pat_PStr (dtb__158, dtb__159) -> (Frontend_dRast.C_Pat_PStr (dtb__158, dtb__159))
  | Frontend_dAst.C_Pat_PInt (dtb__160, dtb__161) -> (Frontend_dRast.C_Pat_PInt (dtb__160, dtb__161))
  | Frontend_dAst.C_Pat_PCon (dtb__162, dtb__163, dtb__164) -> (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__162), ((B_dData_dList.v_map v_toRastPat) dtb__163), dtb__164))
  | Frontend_dAst.C_Pat_PWild (dtb__165) -> (Frontend_dRast.C_Pat_PWild (dtb__165))
  | Frontend_dAst.C_Pat_PAs (dtb__166, dtb__167, dtb__168) -> (Frontend_dRast.C_Pat_PAs (dtb__166, (v_toRastPat dtb__167), dtb__168))
  | Frontend_dAst.C_Pat_PVar (dtb__169, dtb__170) -> (Frontend_dRast.C_Pat_PVar (dtb__169, dtb__170))
  | _ -> failwith "DT: impossible branch"
))
# 138 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toRastPatField = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = dtb__172 } -> { B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = (v_toRastPat dtb__172) }
  | _ -> failwith "DT: impossible branch"
))
