open Vuna_runtime
# 68 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstPat = (fun (p : Frontend_dRast.t_Pat) -> (match p with
  | Frontend_dRast.C_Pat_PVar (dtb__0, dtb__1) -> (Frontend_dAst.C_Pat_PVar (dtb__0, dtb__1))
  | Frontend_dRast.C_Pat_PAs (dtb__2, dtb__3, dtb__4) -> (Frontend_dAst.C_Pat_PAs (dtb__2, (v_toAstPat dtb__3), dtb__4))
  | Frontend_dRast.C_Pat_PWild (dtb__5) -> (Frontend_dAst.C_Pat_PWild (dtb__5))
  | Frontend_dRast.C_Pat_PCon (dtb__6, dtb__7, dtb__8) -> (Frontend_dAst.C_Pat_PCon ((Frontend_dRast_dName.v_rnameKey dtb__6), ((B_dData_dList.v_map v_toAstPat) dtb__7), dtb__8))
  | Frontend_dRast.C_Pat_PInt (dtb__9, dtb__10) -> (Frontend_dAst.C_Pat_PInt (dtb__9, dtb__10))
  | Frontend_dRast.C_Pat_PStr (dtb__11, dtb__12) -> (Frontend_dAst.C_Pat_PStr (dtb__11, dtb__12))
  | Frontend_dRast.C_Pat_PRecord (dtb__13, dtb__14, dtb__15) -> (Frontend_dAst.C_Pat_PRecord ((Frontend_dRast_dName.v_rnameKey dtb__13), ((B_dData_dList.v_map v_toAstPatField) dtb__14), dtb__15))
  | _ -> failwith "DT: impossible branch"
))
# 80 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstPatField = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = (v_toAstPat dtb__17) }
  | _ -> failwith "DT: impossible branch"
))

# 14 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstExpr = (fun (e : Frontend_dRast.t_Expr) -> (match e with
  | Frontend_dRast.C_Expr_EVar (dtb__18, dtb__19) -> (Frontend_dAst.C_Expr_EVar ((Frontend_dRast_dName.v_rnameKey dtb__18), dtb__19))
  | Frontend_dRast.C_Expr_EInt (dtb__20, dtb__21) -> (Frontend_dAst.C_Expr_EInt (dtb__20, dtb__21))
  | Frontend_dRast.C_Expr_EStr (dtb__22, dtb__23) -> (Frontend_dAst.C_Expr_EStr (dtb__22, dtb__23))
  | Frontend_dRast.C_Expr_EFloat (dtb__24, dtb__25) -> (Frontend_dAst.C_Expr_EFloat (dtb__24, dtb__25))
  | Frontend_dRast.C_Expr_EInterp (dtb__26, dtb__27, dtb__28) -> (Frontend_dAst.C_Expr_EInterp (dtb__26, ((B_dData_dList.v_map v_toAstInterpPart) dtb__27), dtb__28))
  | Frontend_dRast.C_Expr_ELam (dtb__29, dtb__30, dtb__31) -> (Frontend_dAst.C_Expr_ELam (dtb__29, (v_toAstExpr dtb__30), dtb__31))
  | Frontend_dRast.C_Expr_EApp (dtb__32, dtb__33, dtb__34) -> (Frontend_dAst.C_Expr_EApp ((v_toAstExpr dtb__32), ((B_dData_dList.v_map v_toAstExpr) dtb__33), dtb__34))
  | Frontend_dRast.C_Expr_EPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (Frontend_dAst.C_Expr_EPi (dtb__35, dtb__36, dtb__37, (v_toAstExpr dtb__38), (v_toAstExpr dtb__39), dtb__40))
  | Frontend_dRast.C_Expr_ELet (dtb__41, dtb__42, dtb__43, dtb__44) -> (Frontend_dAst.C_Expr_ELet (((B_dData_dList.v_map v_toAstBinding) dtb__41), (v_toAstExpr dtb__42), dtb__43, dtb__44))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__45, dtb__46) -> (Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_map v_toAstLocalClause) dtb__45), dtb__46))
  | Frontend_dRast.C_Expr_ECase (dtb__47, dtb__48, dtb__49) -> (Frontend_dAst.C_Expr_ECase ((v_toAstExpr dtb__47), ((B_dData_dList.v_map v_toAstAlt) dtb__48), dtb__49))
  | Frontend_dRast.C_Expr_EIf (dtb__50, dtb__51, dtb__52, dtb__53) -> (Frontend_dAst.C_Expr_EIf ((v_toAstExpr dtb__50), (v_toAstExpr dtb__51), (v_toAstExpr dtb__52), dtb__53))
  | Frontend_dRast.C_Expr_EField (dtb__54, dtb__55, dtb__56) -> (Frontend_dAst.C_Expr_EField ((v_toAstExpr dtb__54), dtb__55, dtb__56))
  | Frontend_dRast.C_Expr_ERecord (dtb__57, dtb__58, dtb__59) -> (Frontend_dAst.C_Expr_ERecord ((Frontend_dRast_dName.v_rnameKey dtb__57), ((B_dData_dList.v_map v_toAstFieldValue) dtb__58), dtb__59))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__60, dtb__61, dtb__62) -> (Frontend_dAst.C_Expr_ERecUpdate ((v_toAstExpr dtb__60), ((B_dData_dList.v_map v_toAstFieldValue) dtb__61), dtb__62))
  | Frontend_dRast.C_Expr_EDo (dtb__63, dtb__64) -> (Frontend_dAst.C_Expr_EDo (((B_dData_dList.v_map v_toAstStmt) dtb__63), dtb__64))
  | Frontend_dRast.C_Expr_EInfix (dtb__65, dtb__66, dtb__67, dtb__68) -> (Frontend_dAst.C_Expr_EInfix (dtb__65, (v_toAstExpr dtb__66), (v_toAstExpr dtb__67), dtb__68))
  | Frontend_dRast.C_Expr_EParen (dtb__69, dtb__70) -> (Frontend_dAst.C_Expr_EParen ((v_toAstExpr dtb__69), dtb__70))
  | Frontend_dRast.C_Expr_EBacktick (dtb__71, dtb__72, dtb__73, dtb__74) -> (Frontend_dAst.C_Expr_EBacktick (dtb__71, (v_toAstExpr dtb__72), (v_toAstExpr dtb__73), dtb__74))
  | Frontend_dRast.C_Expr_ESectOp (dtb__75, dtb__76) -> (Frontend_dAst.C_Expr_ESectOp (dtb__75, dtb__76))
  | Frontend_dRast.C_Expr_ESectL (dtb__77, dtb__78, dtb__79) -> (Frontend_dAst.C_Expr_ESectL (dtb__77, (v_toAstExpr dtb__78), dtb__79))
  | Frontend_dRast.C_Expr_ESectR (dtb__80, dtb__81, dtb__82) -> (Frontend_dAst.C_Expr_ESectR ((v_toAstExpr dtb__80), dtb__81, dtb__82))
  | Frontend_dRast.C_Expr_EAnn (dtb__83, dtb__84, dtb__85) -> (Frontend_dAst.C_Expr_EAnn ((v_toAstExpr dtb__83), (v_toAstExpr dtb__84), dtb__85))
  | _ -> failwith "DT: impossible branch"
))
# 44 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstInterpPart = (fun (part : Frontend_dRast.t_InterpPart) -> (match part with
  | Frontend_dRast.C_InterpPart_IPText (dtb__86) -> (Frontend_dAst.C_InterpPart_IPText (dtb__86))
  | Frontend_dRast.C_InterpPart_IPHole (dtb__87) -> (Frontend_dAst.C_InterpPart_IPHole ((v_toAstExpr dtb__87)))
  | _ -> failwith "DT: impossible branch"
))
# 50 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstBinding = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = dtb__89 } -> { B_dData_dPair.f_Pair_first = (v_toAstPat dtb__88); B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__89) }
  | _ -> failwith "DT: impossible branch"
))
# 53 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstLocalClause = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__91 } -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map v_toAstPat) dtb__90); B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__91) }
  | _ -> failwith "DT: impossible branch"
))
# 56 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstAlt = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> { B_dData_dPair.f_Pair_first = (v_toAstPat dtb__92); B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__93) }
  | _ -> failwith "DT: impossible branch"
))
# 59 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstFieldValue = (fun (mc0 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__95) }
  | _ -> failwith "DT: impossible branch"
))
# 62 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstStmt = (fun (stmt : Frontend_dRast.t_DoStmt) -> (match stmt with
  | Frontend_dRast.C_DoStmt_DBind (dtb__96, dtb__97, dtb__98) -> (Frontend_dAst.C_DoStmt_DBind ((v_toAstPat dtb__96), (v_toAstExpr dtb__97), dtb__98))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__99, dtb__100) -> (Frontend_dAst.C_DoStmt_DExpr ((v_toAstExpr dtb__99), dtb__100))
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastExpr = (fun (e : Frontend_dAst.t_Expr) -> ((Frontend_dRast.v_ofExpr B_dData_dList.C_List_Nil) e))

# 88 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Frontend_dRast.v_ofDecls decls))

# 92 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecl = (fun (d : Frontend_dAst.t_Decl) -> ((Frontend_dRast.v_ofDecl B_dData_dList.C_List_Nil) d))

# 120 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstCtor = (fun (mc0 : Frontend_dRast.t_Ctor) -> (match mc0 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__101; Frontend_dRast.f_Ctor_ctorType = dtb__102; Frontend_dRast.f_Ctor_ctorArity = dtb__103; Frontend_dRast.f_Ctor_ctorSpan = dtb__104 } -> { Frontend_dAst.f_Ctor_ctorName = dtb__101; Frontend_dAst.f_Ctor_ctorType = (v_toAstExpr dtb__102); Frontend_dAst.f_Ctor_ctorArity = dtb__103; Frontend_dAst.f_Ctor_ctorSpan = dtb__104 }
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstField = (fun (mc0 : Frontend_dRast.t_Field) -> (match mc0 with
  | { Frontend_dRast.f_Field_fieldName = dtb__105; Frontend_dRast.f_Field_fieldType = dtb__106; Frontend_dRast.f_Field_fieldSpan = dtb__107 } -> { Frontend_dAst.f_Field_fieldName = dtb__105; Frontend_dAst.f_Field_fieldType = (v_toAstExpr dtb__106); Frontend_dAst.f_Field_fieldSpan = dtb__107 }
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitMethod = (fun (mc0 : Frontend_dRast.t_TraitMethod) -> (match mc0 with
  | { Frontend_dRast.f_TraitMethod_traitMethodName = dtb__108; Frontend_dRast.f_TraitMethod_traitMethodType = dtb__109; Frontend_dRast.f_TraitMethod_traitMethodSpan = dtb__110 } -> { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__108; Frontend_dAst.f_TraitMethod_traitMethodType = (v_toAstExpr dtb__109); Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__110 }
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_maybeMap = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__111)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitParam = (fun (mc0 : Frontend_dRast.t_TraitParam) -> (match mc0 with
  | { Frontend_dRast.f_TraitParam_traitParamName = dtb__112; Frontend_dRast.f_TraitParam_traitParamKind = dtb__113 } -> { Frontend_dAst.f_TraitParam_traitParamName = dtb__112; Frontend_dAst.f_TraitParam_traitParamKind = ((v_maybeMap v_toAstExpr) dtb__113) }
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstDecl = (fun (d : Frontend_dRast.t_Decl) -> (match d with
  | Frontend_dRast.C_Decl_DData (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (Frontend_dAst.C_Decl_DData (dtb__114, dtb__115, (v_toAstExpr dtb__116), ((B_dData_dList.v_map v_toAstCtor) dtb__117), dtb__118, dtb__119, dtb__120, dtb__121, dtb__122))
  | Frontend_dRast.C_Decl_DAxiom (dtb__123, dtb__124, dtb__125) -> (Frontend_dAst.C_Decl_DAxiom (dtb__123, (v_toAstExpr dtb__124), dtb__125))
  | Frontend_dRast.C_Decl_DExtern (dtb__126, dtb__127, dtb__128, dtb__129) -> (Frontend_dAst.C_Decl_DExtern (dtb__126, dtb__127, (v_toAstExpr dtb__128), dtb__129))
  | Frontend_dRast.C_Decl_DSig (dtb__130, dtb__131, dtb__132, dtb__133) -> (Frontend_dAst.C_Decl_DSig (dtb__130, ((B_dData_dList.v_map v_toAstExpr) dtb__131), (v_toAstExpr dtb__132), dtb__133))
  | Frontend_dRast.C_Decl_DFun (dtb__134, dtb__135, dtb__136, dtb__137) -> (Frontend_dAst.C_Decl_DFun (dtb__134, ((B_dData_dList.v_map v_toAstPat) dtb__135), (v_toAstExpr dtb__136), dtb__137))
  | Frontend_dRast.C_Decl_DRecord (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (Frontend_dAst.C_Decl_DRecord (dtb__138, dtb__139, ((B_dData_dList.v_map v_toAstField) dtb__140), dtb__141, dtb__142, dtb__143, dtb__144, dtb__145))
  | Frontend_dRast.C_Decl_DTrait (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> (Frontend_dAst.C_Decl_DTrait (dtb__146, ((B_dData_dList.v_map v_toAstTraitParam) dtb__147), ((B_dData_dList.v_map v_toAstExpr) dtb__148), ((B_dData_dList.v_map v_toAstTraitMethod) dtb__149), dtb__150))
  | Frontend_dRast.C_Decl_DInstance (dtb__151, dtb__152, dtb__153, dtb__154) -> (Frontend_dAst.C_Decl_DInstance (((B_dData_dList.v_map v_toAstExpr) dtb__151), (v_toAstExpr dtb__152), ((B_dData_dList.v_map v_toAstDecl) dtb__153), dtb__154))
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstDecls = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map v_toAstDecl) decls))

# 137 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toRastPat = (fun (p : Frontend_dAst.t_Pat) -> (match p with
  | Frontend_dAst.C_Pat_PVar (dtb__155, dtb__156) -> (Frontend_dRast.C_Pat_PVar (dtb__155, dtb__156))
  | Frontend_dAst.C_Pat_PAs (dtb__157, dtb__158, dtb__159) -> (Frontend_dRast.C_Pat_PAs (dtb__157, (v_toRastPat dtb__158), dtb__159))
  | Frontend_dAst.C_Pat_PWild (dtb__160) -> (Frontend_dRast.C_Pat_PWild (dtb__160))
  | Frontend_dAst.C_Pat_PCon (dtb__161, dtb__162, dtb__163) -> (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__161), ((B_dData_dList.v_map v_toRastPat) dtb__162), dtb__163))
  | Frontend_dAst.C_Pat_PInt (dtb__164, dtb__165) -> (Frontend_dRast.C_Pat_PInt (dtb__164, dtb__165))
  | Frontend_dAst.C_Pat_PStr (dtb__166, dtb__167) -> (Frontend_dRast.C_Pat_PStr (dtb__166, dtb__167))
  | Frontend_dAst.C_Pat_PRecord (dtb__168, dtb__169, dtb__170) -> (Frontend_dRast.C_Pat_PRecord ((Frontend_dRast_dName.v_classifyName dtb__168), ((B_dData_dList.v_map v_toRastPatField) dtb__169), dtb__170))
  | _ -> failwith "DT: impossible branch"
))
# 149 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toRastPatField = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = dtb__172 } -> { B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = (v_toRastPat dtb__172) }
  | _ -> failwith "DT: impossible branch"
))
