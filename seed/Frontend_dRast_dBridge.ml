open Vuna_runtime
# 76 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstPat = (fun (mc0 : Frontend_dRast.t_Pat) -> (match mc0 with
  | Frontend_dRast.C_Pat_PRecord (dtb__0, dtb__1, dtb__2) -> (Frontend_dAst.C_Pat_PRecord ((Frontend_dRast_dName.v_rnameKey dtb__0), ((B_dData_dList.v_map v_toAstPatField) dtb__1), (Frontend_dAst.v_detachedNodeRef dtb__2)))
  | Frontend_dRast.C_Pat_PStr (dtb__3, dtb__4) -> (Frontend_dAst.C_Pat_PStr (dtb__3, (Frontend_dAst.v_detachedNodeRef dtb__4)))
  | Frontend_dRast.C_Pat_PInt (dtb__5, dtb__6) -> (Frontend_dAst.C_Pat_PInt (dtb__5, (Frontend_dAst.v_detachedNodeRef dtb__6)))
  | Frontend_dRast.C_Pat_PCon (dtb__7, dtb__8, dtb__9) -> (Frontend_dAst.C_Pat_PCon ((Frontend_dRast_dName.v_rnameKey dtb__7), ((B_dData_dList.v_map v_toAstPat) dtb__8), (Frontend_dAst.v_detachedNodeRef dtb__9)))
  | Frontend_dRast.C_Pat_PWild (dtb__10) -> (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef dtb__10)))
  | Frontend_dRast.C_Pat_PAs (dtb__11, dtb__12, dtb__13) -> (Frontend_dAst.C_Pat_PAs (dtb__11, (v_toAstPat dtb__12), (Frontend_dAst.v_detachedNodeRef dtb__13)))
  | Frontend_dRast.C_Pat_PVar (dtb__14, dtb__15) -> (Frontend_dAst.C_Pat_PVar (dtb__14, (Frontend_dAst.v_detachedNodeRef dtb__15)))
  | _ -> failwith "DT: impossible branch"
))
# 87 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstPatField = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = (v_toAstPat dtb__17) }
  | _ -> failwith "DT: impossible branch"
))

# 14 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EAnn (dtb__18, dtb__19, dtb__20) -> (Frontend_dAst.C_Expr_EAnn ((v_toAstExpr dtb__18), (v_toAstExpr dtb__19), (Frontend_dAst.v_detachedNodeRef dtb__20)))
  | Frontend_dRast.C_Expr_ESectR (dtb__21, dtb__22, dtb__23) -> (Frontend_dAst.C_Expr_ESectR ((v_toAstExpr dtb__21), dtb__22, (Frontend_dAst.v_detachedNodeRef dtb__23)))
  | Frontend_dRast.C_Expr_ESectL (dtb__24, dtb__25, dtb__26) -> (Frontend_dAst.C_Expr_ESectL (dtb__24, (v_toAstExpr dtb__25), (Frontend_dAst.v_detachedNodeRef dtb__26)))
  | Frontend_dRast.C_Expr_ESectOp (dtb__27, dtb__28) -> (Frontend_dAst.C_Expr_ESectOp (dtb__27, (Frontend_dAst.v_detachedNodeRef dtb__28)))
  | Frontend_dRast.C_Expr_EBacktick (dtb__29, dtb__30, dtb__31, dtb__32) -> (Frontend_dAst.C_Expr_EBacktick (dtb__29, (v_toAstExpr dtb__30), (v_toAstExpr dtb__31), (Frontend_dAst.v_detachedNodeRef dtb__32)))
  | Frontend_dRast.C_Expr_EParen (dtb__33, dtb__34) -> (Frontend_dAst.C_Expr_EParen ((v_toAstExpr dtb__33), (Frontend_dAst.v_detachedNodeRef dtb__34)))
  | Frontend_dRast.C_Expr_EInfix (dtb__35, dtb__36, dtb__37, dtb__38) -> (Frontend_dAst.C_Expr_EInfix (dtb__35, (v_toAstExpr dtb__36), (v_toAstExpr dtb__37), (Frontend_dAst.v_detachedNodeRef dtb__38)))
  | Frontend_dRast.C_Expr_EDo (dtb__39, dtb__40) -> (Frontend_dAst.C_Expr_EDo (((B_dData_dList.v_map v_toAstStmt) dtb__39), (Frontend_dAst.v_detachedNodeRef dtb__40)))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__41, dtb__42, dtb__43) -> (Frontend_dAst.C_Expr_ERecUpdate ((v_toAstExpr dtb__41), ((B_dData_dList.v_map v_toAstFieldValue) dtb__42), (Frontend_dAst.v_detachedNodeRef dtb__43)))
  | Frontend_dRast.C_Expr_ERecord (dtb__44, dtb__45, dtb__46) -> (Frontend_dAst.C_Expr_ERecord ((Frontend_dRast_dName.v_rnameKey dtb__44), ((B_dData_dList.v_map v_toAstFieldValue) dtb__45), (Frontend_dAst.v_detachedNodeRef dtb__46)))
  | Frontend_dRast.C_Expr_EField (dtb__47, dtb__48, dtb__49) -> (Frontend_dAst.C_Expr_EField ((v_toAstExpr dtb__47), dtb__48, (Frontend_dAst.v_detachedNodeRef dtb__49)))
  | Frontend_dRast.C_Expr_EIf (dtb__50, dtb__51, dtb__52, dtb__53) -> (Frontend_dAst.C_Expr_EIf ((v_toAstExpr dtb__50), (v_toAstExpr dtb__51), (v_toAstExpr dtb__52), (Frontend_dAst.v_detachedNodeRef dtb__53)))
  | Frontend_dRast.C_Expr_ECase (dtb__54, dtb__55, dtb__56) -> (Frontend_dAst.C_Expr_ECase ((v_toAstExpr dtb__54), ((B_dData_dList.v_map v_toAstAlt) dtb__55), (Frontend_dAst.v_detachedNodeRef dtb__56)))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__57, dtb__58) -> (Frontend_dAst.C_Expr_ELocalFun (((B_dData_dList.v_map v_toAstLocalClause) dtb__57), (Frontend_dAst.v_detachedNodeRef dtb__58)))
  | Frontend_dRast.C_Expr_ELet (dtb__59, dtb__60, dtb__61, dtb__62) -> (Frontend_dAst.C_Expr_ELet (((B_dData_dList.v_map v_toAstBinding) dtb__59), (v_toAstExpr dtb__60), dtb__61, (Frontend_dAst.v_detachedNodeRef dtb__62)))
  | Frontend_dRast.C_Expr_EPi (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (Frontend_dAst.C_Expr_EPi (dtb__63, dtb__64, dtb__65, (v_toAstExpr dtb__66), (v_toAstExpr dtb__67), (Frontend_dAst.v_detachedNodeRef dtb__68)))
  | Frontend_dRast.C_Expr_EApp (dtb__69, dtb__70, dtb__71) -> (Frontend_dAst.C_Expr_EApp ((v_toAstExpr dtb__69), ((B_dData_dList.v_map v_toAstExpr) dtb__70), (Frontend_dAst.v_detachedNodeRef dtb__71)))
  | Frontend_dRast.C_Expr_ELam (dtb__72, dtb__73, dtb__74) -> (Frontend_dAst.C_Expr_ELam (dtb__72, (v_toAstExpr dtb__73), (Frontend_dAst.v_detachedNodeRef dtb__74)))
  | Frontend_dRast.C_Expr_EInterp (dtb__75, dtb__76, dtb__77) -> (Frontend_dAst.C_Expr_EInterp (dtb__75, ((B_dData_dList.v_map v_toAstInterpPart) dtb__76), (Frontend_dAst.v_detachedNodeRef dtb__77)))
  | Frontend_dRast.C_Expr_EFloat (dtb__78, dtb__79) -> (Frontend_dAst.C_Expr_EFloat (dtb__78, (Frontend_dAst.v_detachedNodeRef dtb__79)))
  | Frontend_dRast.C_Expr_EStr (dtb__80, dtb__81) -> (Frontend_dAst.C_Expr_EStr (dtb__80, (Frontend_dAst.v_detachedNodeRef dtb__81)))
  | Frontend_dRast.C_Expr_EInt (dtb__82, dtb__83) -> (Frontend_dAst.C_Expr_EInt (dtb__82, (Frontend_dAst.v_detachedNodeRef dtb__83)))
  | Frontend_dRast.C_Expr_EVar (dtb__84, dtb__85) -> (Frontend_dAst.C_Expr_EVar ((Frontend_dRast_dName.v_rnameKey dtb__84), (Frontend_dAst.v_detachedNodeRef dtb__85)))
  | _ -> failwith "DT: impossible branch"
))
# 51 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstInterpPart = (fun (mc0 : Frontend_dRast.t_InterpPart) -> (match mc0 with
  | Frontend_dRast.C_InterpPart_IPHole (dtb__86) -> (Frontend_dAst.C_InterpPart_IPHole ((v_toAstExpr dtb__86)))
  | Frontend_dRast.C_InterpPart_IPText (dtb__87) -> (Frontend_dAst.C_InterpPart_IPText (dtb__87))
  | _ -> failwith "DT: impossible branch"
))
# 56 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstBinding = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = dtb__89 } -> { Frontend_dAst.f_Binding_bindPat = (v_toAstPat dtb__88); Frontend_dAst.f_Binding_bindValue = (v_toAstExpr dtb__89); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstLocalClause = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__91 } -> { Frontend_dAst.f_LocalClause_lcPats = ((B_dData_dList.v_map v_toAstPat) dtb__90); Frontend_dAst.f_LocalClause_lcBody = (v_toAstExpr dtb__91); Frontend_dAst.f_LocalClause_lcRef = Frontend_dAst.v_noNodeRef; Frontend_dAst.f_LocalClause_lcHead = Frontend_dAst.v_noNodeRef }
  | _ -> failwith "DT: impossible branch"
))
# 64 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstAlt = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> { Frontend_dAst.f_Alt_altPat = (v_toAstPat dtb__92); Frontend_dAst.f_Alt_altBody = (v_toAstExpr dtb__93); Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }
  | _ -> failwith "DT: impossible branch"
))
# 67 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstFieldValue = (fun (mc0 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__95) }
  | _ -> failwith "DT: impossible branch"
))
# 70 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstStmt = (fun (mc0 : Frontend_dRast.t_DoStmt) -> (match mc0 with
  | Frontend_dRast.C_DoStmt_DLet (dtb__96, dtb__97) -> (Frontend_dAst.C_DoStmt_DLet (((B_dData_dList.v_map v_toAstBinding) dtb__96), (Frontend_dAst.v_detachedNodeRef dtb__97)))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__98, dtb__99) -> (Frontend_dAst.C_DoStmt_DExpr ((v_toAstExpr dtb__98), (Frontend_dAst.v_detachedNodeRef dtb__99)))
  | Frontend_dRast.C_DoStmt_DBind (dtb__100, dtb__101, dtb__102) -> (Frontend_dAst.C_DoStmt_DBind ((v_toAstPat dtb__100), (v_toAstExpr dtb__101), (Frontend_dAst.v_detachedNodeRef dtb__102)))
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastExpr = (fun (e : Frontend_dAst.t_Expr) -> ((Frontend_dRast.v_ofExpr B_dData_dList.C_List_Nil) e))

# 95 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Frontend_dRast.v_ofDecls decls))

# 99 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecl = (fun (d : Frontend_dAst.t_Decl) -> ((Frontend_dRast.v_ofDecl B_dData_dList.C_List_Nil) d))

# 137 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstCtor = (fun (mc0 : Frontend_dRast.t_Ctor) -> (match mc0 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__103; Frontend_dRast.f_Ctor_ctorType = dtb__104; Frontend_dRast.f_Ctor_ctorArity = dtb__105; Frontend_dRast.f_Ctor_ctorSpan = dtb__106 } -> { Frontend_dAst.f_Ctor_ctorName = dtb__103; Frontend_dAst.f_Ctor_ctorType = (v_toAstExpr dtb__104); Frontend_dAst.f_Ctor_ctorArity = dtb__105; Frontend_dAst.f_Ctor_ctorRef = (Frontend_dAst.v_detachedNodeRef dtb__106) }
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstField = (fun (mc0 : Frontend_dRast.t_Field) -> (match mc0 with
  | { Frontend_dRast.f_Field_fieldName = dtb__107; Frontend_dRast.f_Field_fieldType = dtb__108; Frontend_dRast.f_Field_fieldSpan = dtb__109 } -> { Frontend_dAst.f_Field_fieldName = dtb__107; Frontend_dAst.f_Field_fieldType = (v_toAstExpr dtb__108); Frontend_dAst.f_Field_fieldRef = (Frontend_dAst.v_detachedNodeRef dtb__109) }
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitMethod = (fun (mc0 : Frontend_dRast.t_TraitMethod) -> (match mc0 with
  | { Frontend_dRast.f_TraitMethod_traitMethodName = dtb__110; Frontend_dRast.f_TraitMethod_traitMethodType = dtb__111; Frontend_dRast.f_TraitMethod_traitMethodSpan = dtb__112 } -> { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__110; Frontend_dAst.f_TraitMethod_traitMethodType = (v_toAstExpr dtb__111); Frontend_dAst.f_TraitMethod_traitMethodRef = (Frontend_dAst.v_detachedNodeRef dtb__112) }
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_maybeMap = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__113)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitParam = (fun (mc0 : Frontend_dRast.t_TraitParam) -> (match mc0 with
  | { Frontend_dRast.f_TraitParam_traitParamName = dtb__114; Frontend_dRast.f_TraitParam_traitParamKind = dtb__115 } -> { Frontend_dAst.f_TraitParam_traitParamName = dtb__114; Frontend_dAst.f_TraitParam_traitParamKind = ((v_maybeMap v_toAstExpr) dtb__115) }
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstDecl = (fun (mc0 : Frontend_dRast.t_Decl) -> (match mc0 with
  | Frontend_dRast.C_Decl_DInstance (dtb__116, dtb__117, dtb__118, dtb__119) -> (Frontend_dAst.C_Decl_DInstance (((B_dData_dList.v_map v_toAstExpr) dtb__116), (v_toAstExpr dtb__117), ((B_dData_dList.v_map v_toAstDecl) dtb__118), (Frontend_dAst.v_detachedNodeRef dtb__119)))
  | Frontend_dRast.C_Decl_DTrait (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (Frontend_dAst.C_Decl_DTrait (dtb__120, ((B_dData_dList.v_map v_toAstTraitParam) dtb__121), ((B_dData_dList.v_map v_toAstExpr) dtb__122), ((B_dData_dList.v_map v_toAstTraitMethod) dtb__123), (Frontend_dAst.v_detachedNodeRef dtb__124)))
  | Frontend_dRast.C_Decl_DRecord (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (Frontend_dAst.C_Decl_DRecord (dtb__125, dtb__126, ((B_dData_dList.v_map v_toAstField) dtb__127), dtb__128, dtb__129, dtb__130, dtb__131, (Frontend_dAst.v_detachedNodeRef dtb__132)))
  | Frontend_dRast.C_Decl_DFun (dtb__133, dtb__134, dtb__135, dtb__136) -> (Frontend_dAst.C_Decl_DFun (dtb__133, ((B_dData_dList.v_map v_toAstPat) dtb__134), (v_toAstExpr dtb__135), (Frontend_dAst.v_detachedNodeRef dtb__136)))
  | Frontend_dRast.C_Decl_DSig (dtb__137, dtb__138, dtb__139, dtb__140) -> (Frontend_dAst.C_Decl_DSig (dtb__137, ((B_dData_dList.v_map v_toAstExpr) dtb__138), (v_toAstExpr dtb__139), (Frontend_dAst.v_detachedNodeRef dtb__140)))
  | Frontend_dRast.C_Decl_DExtern (dtb__141, dtb__142, dtb__143, dtb__144) -> (Frontend_dAst.C_Decl_DExtern (dtb__141, dtb__142, (v_toAstExpr dtb__143), (Frontend_dAst.v_detachedNodeRef dtb__144)))
  | Frontend_dRast.C_Decl_DAxiom (dtb__145, dtb__146, dtb__147) -> (Frontend_dAst.C_Decl_DAxiom (dtb__145, (v_toAstExpr dtb__146), (Frontend_dAst.v_detachedNodeRef dtb__147)))
  | Frontend_dRast.C_Decl_DData (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (Frontend_dAst.C_Decl_DData (dtb__148, dtb__149, (v_toAstExpr dtb__150), ((B_dData_dList.v_map v_toAstCtor) dtb__151), dtb__152, dtb__153, dtb__154, dtb__155, (Frontend_dAst.v_detachedNodeRef dtb__156)))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstDecls = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map v_toAstDecl) decls))

# 155 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toRastPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__157, dtb__158, dtb__159) -> (Frontend_dRast.C_Pat_PRecord ((Frontend_dRast_dName.v_classifyName dtb__157), ((B_dData_dList.v_map v_toRastPatField) dtb__158), (Frontend_dAst.v_nodeRefSpan dtb__159)))
  | Frontend_dAst.C_Pat_PStr (dtb__160, dtb__161) -> (Frontend_dRast.C_Pat_PStr (dtb__160, (Frontend_dAst.v_nodeRefSpan dtb__161)))
  | Frontend_dAst.C_Pat_PInt (dtb__162, dtb__163) -> (Frontend_dRast.C_Pat_PInt (dtb__162, (Frontend_dAst.v_nodeRefSpan dtb__163)))
  | Frontend_dAst.C_Pat_PCon (dtb__164, dtb__165, dtb__166) -> (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__164), ((B_dData_dList.v_map v_toRastPat) dtb__165), (Frontend_dAst.v_nodeRefSpan dtb__166)))
  | Frontend_dAst.C_Pat_PWild (dtb__167) -> (Frontend_dRast.C_Pat_PWild ((Frontend_dAst.v_nodeRefSpan dtb__167)))
  | Frontend_dAst.C_Pat_PAs (dtb__168, dtb__169, dtb__170) -> (Frontend_dRast.C_Pat_PAs (dtb__168, (v_toRastPat dtb__169), (Frontend_dAst.v_nodeRefSpan dtb__170)))
  | Frontend_dAst.C_Pat_PVar (dtb__171, dtb__172) -> (Frontend_dRast.C_Pat_PVar (dtb__171, (Frontend_dAst.v_nodeRefSpan dtb__172)))
  | _ -> failwith "DT: impossible branch"
))
# 166 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toRastPatField = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__174 } -> { B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = (v_toRastPat dtb__174) }
  | _ -> failwith "DT: impossible branch"
))
