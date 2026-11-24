open Vuna_runtime
# 74 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
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
# 85 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstPatField = (fun (mc0 : (string, Frontend_dRast.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = (v_toAstPat dtb__17) }
  | _ -> failwith "DT: impossible branch"
))

# 14 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstExpr = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EAnn (dtb__18, dtb__19, dtb__20) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_ascribeSyntax, (Frontend_dAst.v_detachedNodeRef dtb__20))), (B_dData_dList.C_List__x58__x58_ ((v_toAstExpr dtb__18), (B_dData_dList.C_List__x58__x58_ ((v_toAstExpr dtb__19), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef dtb__20)))
  | Frontend_dRast.C_Expr_EDo (dtb__21, dtb__22) -> (Frontend_dAst.C_Expr_EDo (((B_dData_dList.v_map v_toAstStmt) dtb__21), (Frontend_dAst.v_detachedNodeRef dtb__22)))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__23, dtb__24, dtb__25) -> (Frontend_dAst.C_Expr_ERecUpdate ((v_toAstExpr dtb__23), ((B_dData_dList.v_map v_toAstFieldValue) dtb__24), (Frontend_dAst.v_detachedNodeRef dtb__25)))
  | Frontend_dRast.C_Expr_ERecord (dtb__26, dtb__27, dtb__28) -> (Frontend_dAst.C_Expr_ERecord ((Frontend_dRast_dName.v_rnameKey dtb__26), ((B_dData_dList.v_map v_toAstFieldValue) dtb__27), (Frontend_dAst.v_detachedNodeRef dtb__28)))
  | Frontend_dRast.C_Expr_EField (dtb__29, dtb__30, dtb__31) -> (Frontend_dAst.C_Expr_EField ((v_toAstExpr dtb__29), dtb__30, (Frontend_dAst.v_detachedNodeRef dtb__31)))
  | Frontend_dRast.C_Expr_EIf (dtb__32, dtb__33, dtb__34, dtb__35) -> (Frontend_dAst.C_Expr_EIf ((v_toAstExpr dtb__32), (v_toAstExpr dtb__33), (v_toAstExpr dtb__34), (Frontend_dAst.v_detachedNodeRef dtb__35)))
  | Frontend_dRast.C_Expr_ECase (dtb__36, dtb__37, dtb__38) -> (Frontend_dAst.C_Expr_ECase ((v_toAstExpr dtb__36), ((B_dData_dList.v_map v_toAstAlt) dtb__37), (Frontend_dAst.v_detachedNodeRef dtb__38)))
  | Frontend_dRast.C_Expr_ELocalFun (dtb__39, dtb__40) -> (Frontend_dAst.C_Expr_EVar ("#local-fun", (Frontend_dAst.v_detachedNodeRef dtb__40)))
  | Frontend_dRast.C_Expr_ELet (dtb__41, dtb__42, dtb__43, dtb__44) -> (Frontend_dAst.C_Expr_ELet (((B_dData_dList.v_map v_toAstBinding) dtb__41), (v_toAstExpr dtb__42), dtb__43, (Frontend_dAst.v_detachedNodeRef dtb__44)))
  | Frontend_dRast.C_Expr_EPi (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (Frontend_dAst.C_Expr_EPi (dtb__45, dtb__46, dtb__47, (v_toAstExpr dtb__48), (v_toAstExpr dtb__49), (Frontend_dAst.v_detachedNodeRef dtb__50)))
  | Frontend_dRast.C_Expr_EApp (dtb__51, dtb__52, dtb__53) -> (Frontend_dAst.C_Expr_EApp ((v_toAstExpr dtb__51), ((B_dData_dList.v_map v_toAstExpr) dtb__52), (Frontend_dAst.v_detachedNodeRef dtb__53)))
  | Frontend_dRast.C_Expr_ELam (dtb__54, dtb__55, dtb__56) -> (Frontend_dAst.C_Expr_ELam (dtb__54, (v_toAstExpr dtb__55), (Frontend_dAst.v_detachedNodeRef dtb__56)))
  | Frontend_dRast.C_Expr_EInterp (dtb__57, dtb__58) -> (Frontend_dAst.C_Expr_EInterp (((B_dData_dList.v_map v_toAstInterpPart) dtb__57), (Frontend_dAst.v_detachedNodeRef dtb__58)))
  | Frontend_dRast.C_Expr_EFloat (dtb__59, dtb__60) -> (Frontend_dAst.C_Expr_EFloat (dtb__59, (Frontend_dAst.v_detachedNodeRef dtb__60)))
  | Frontend_dRast.C_Expr_EStr (dtb__61, dtb__62) -> (Frontend_dAst.C_Expr_EStr (dtb__61, (Frontend_dAst.v_detachedNodeRef dtb__62)))
  | Frontend_dRast.C_Expr_EInt (dtb__63, dtb__64) -> (Frontend_dAst.C_Expr_EInt (dtb__63, (Frontend_dAst.v_detachedNodeRef dtb__64)))
  | Frontend_dRast.C_Expr_EVar (dtb__65, dtb__66) -> (Frontend_dAst.C_Expr_EVar ((Frontend_dRast_dName.v_rnameKey dtb__65), (Frontend_dAst.v_detachedNodeRef dtb__66)))
  | _ -> failwith "DT: impossible branch"
))
# 46 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstInterpPart = (fun (mc0 : Frontend_dRast.t_InterpPart) -> (match mc0 with
  | Frontend_dRast.C_InterpPart_IPHole (dtb__67) -> (Frontend_dAst.C_InterpPart_IPHole ((v_toAstExpr dtb__67)))
  | Frontend_dRast.C_InterpPart_IPText (dtb__68) -> (Frontend_dAst.C_InterpPart_IPText (dtb__68))
  | _ -> failwith "DT: impossible branch"
))
# 51 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstBinding = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__69; B_dData_dPair.f_Pair_second = dtb__70 } -> (match dtb__70 with
  | Frontend_dRast.C_Expr_ELocalFun (dtb__71, dtb__72) -> { Frontend_dAst.f_Binding_bindPat = (v_toAstPat dtb__69); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BClauses (((B_dData_dList.v_map v_toAstLocalClause) dtb__71))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }
  | _ -> { Frontend_dAst.f_Binding_bindPat = (v_toAstPat dtb__69); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal ((v_toAstExpr dtb__70))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = Frontend_dAst.v_noNodeRef }
)
  | _ -> failwith "DT: impossible branch"
))
# 58 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstLocalClause = (fun (mc0 : (Frontend_dRast.t_Pat B_dData_dList.t_List, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__73; B_dData_dPair.f_Pair_second = dtb__74 } -> { Frontend_dAst.f_LocalClause_lcPats = ((B_dData_dList.v_map v_toAstPat) dtb__73); Frontend_dAst.f_LocalClause_lcBody = (v_toAstExpr dtb__74); Frontend_dAst.f_LocalClause_lcRef = Frontend_dAst.v_noNodeRef; Frontend_dAst.f_LocalClause_lcHead = Frontend_dAst.v_noNodeRef }
  | _ -> failwith "DT: impossible branch"
))
# 62 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstAlt = (fun (mc0 : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> { Frontend_dAst.f_Alt_altPat = (v_toAstPat dtb__75); Frontend_dAst.f_Alt_altBody = (v_toAstExpr dtb__76); Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }
  | _ -> failwith "DT: impossible branch"
))
# 65 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstFieldValue = (fun (mc0 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = (v_toAstExpr dtb__78) }
  | _ -> failwith "DT: impossible branch"
))
# 68 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toAstStmt = (fun (mc0 : Frontend_dRast.t_DoStmt) -> (match mc0 with
  | Frontend_dRast.C_DoStmt_DLet (dtb__79, dtb__80) -> (Frontend_dAst.C_DoStmt_DLet (((B_dData_dList.v_map v_toAstBinding) dtb__79), (Frontend_dAst.v_detachedNodeRef dtb__80)))
  | Frontend_dRast.C_DoStmt_DExpr (dtb__81, dtb__82) -> (Frontend_dAst.C_DoStmt_DExpr ((v_toAstExpr dtb__81), (Frontend_dAst.v_detachedNodeRef dtb__82)))
  | Frontend_dRast.C_DoStmt_DBind (dtb__83, dtb__84, dtb__85) -> (Frontend_dAst.C_DoStmt_DBind ((v_toAstPat dtb__83), (v_toAstExpr dtb__84), (Frontend_dAst.v_detachedNodeRef dtb__85)))
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastExpr = (fun (e : Frontend_dAst.t_Expr) -> ((Frontend_dRast.v_ofExpr B_dData_dList.C_List_Nil) e))

# 93 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Frontend_dRast.v_ofDecls decls))

# 97 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toRastDecl = (fun (d : Frontend_dAst.t_Decl) -> ((Frontend_dRast.v_ofDecl B_dData_dList.C_List_Nil) d))

# 135 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstCtor = (fun (mc0 : Frontend_dRast.t_Ctor) -> (match mc0 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__86; Frontend_dRast.f_Ctor_ctorType = dtb__87; Frontend_dRast.f_Ctor_ctorArity = dtb__88; Frontend_dRast.f_Ctor_ctorSpan = dtb__89 } -> { Frontend_dAst.f_Ctor_ctorName = dtb__86; Frontend_dAst.f_Ctor_ctorType = (v_toAstExpr dtb__87); Frontend_dAst.f_Ctor_ctorArity = dtb__88; Frontend_dAst.f_Ctor_ctorRef = (Frontend_dAst.v_detachedNodeRef dtb__89) }
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstField = (fun (mc0 : Frontend_dRast.t_Field) -> (match mc0 with
  | { Frontend_dRast.f_Field_fieldName = dtb__90; Frontend_dRast.f_Field_fieldType = dtb__91; Frontend_dRast.f_Field_fieldSpan = dtb__92 } -> { Frontend_dAst.f_Field_fieldName = dtb__90; Frontend_dAst.f_Field_fieldType = (v_toAstExpr dtb__91); Frontend_dAst.f_Field_fieldRef = (Frontend_dAst.v_detachedNodeRef dtb__92) }
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitMethod = (fun (mc0 : Frontend_dRast.t_TraitMethod) -> (match mc0 with
  | { Frontend_dRast.f_TraitMethod_traitMethodName = dtb__93; Frontend_dRast.f_TraitMethod_traitMethodType = dtb__94; Frontend_dRast.f_TraitMethod_traitMethodSpan = dtb__95 } -> { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__93; Frontend_dAst.f_TraitMethod_traitMethodType = (v_toAstExpr dtb__94); Frontend_dAst.f_TraitMethod_traitMethodRef = (Frontend_dAst.v_detachedNodeRef dtb__95) }
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_maybeMap = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__96) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__96)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstTraitParam = (fun (mc0 : Frontend_dRast.t_TraitParam) -> (match mc0 with
  | { Frontend_dRast.f_TraitParam_traitParamName = dtb__97; Frontend_dRast.f_TraitParam_traitParamKind = dtb__98 } -> { Frontend_dAst.f_TraitParam_traitParamName = dtb__97; Frontend_dAst.f_TraitParam_traitParamKind = ((v_maybeMap v_toAstExpr) dtb__98) }
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toAstDecl = (fun (mc0 : Frontend_dRast.t_Decl) -> (match mc0 with
  | Frontend_dRast.C_Decl_DInstance (dtb__99, dtb__100, dtb__101, dtb__102) -> (Frontend_dAst.C_Decl_DInstance (((B_dData_dList.v_map v_toAstExpr) dtb__99), (v_toAstExpr dtb__100), ((B_dData_dList.v_map v_toAstDecl) dtb__101), (Frontend_dAst.v_detachedNodeRef dtb__102)))
  | Frontend_dRast.C_Decl_DTrait (dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (Frontend_dAst.C_Decl_DTrait (dtb__103, ((B_dData_dList.v_map v_toAstTraitParam) dtb__104), ((B_dData_dList.v_map v_toAstExpr) dtb__105), ((B_dData_dList.v_map v_toAstTraitMethod) dtb__106), (Frontend_dAst.v_detachedNodeRef dtb__107)))
  | Frontend_dRast.C_Decl_DRecord (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115) -> (Frontend_dAst.C_Decl_DRecord (dtb__108, dtb__109, ((B_dData_dList.v_map v_toAstField) dtb__110), dtb__111, dtb__112, dtb__113, dtb__114, (Frontend_dAst.v_detachedNodeRef dtb__115)))
  | Frontend_dRast.C_Decl_DFun (dtb__116, dtb__117, dtb__118, dtb__119) -> (Frontend_dAst.C_Decl_DFun (dtb__116, ((B_dData_dList.v_map v_toAstPat) dtb__117), (v_toAstExpr dtb__118), (Frontend_dAst.v_detachedNodeRef dtb__119)))
  | Frontend_dRast.C_Decl_DSig (dtb__120, dtb__121, dtb__122, dtb__123) -> (Frontend_dAst.C_Decl_DSig (dtb__120, ((B_dData_dList.v_map v_toAstExpr) dtb__121), (v_toAstExpr dtb__122), (Frontend_dAst.v_detachedNodeRef dtb__123)))
  | Frontend_dRast.C_Decl_DExtern (dtb__124, dtb__125, dtb__126, dtb__127) -> (Frontend_dAst.C_Decl_DExtern (dtb__124, dtb__125, (v_toAstExpr dtb__126), (Frontend_dAst.v_detachedNodeRef dtb__127)))
  | Frontend_dRast.C_Decl_DAxiom (dtb__128, dtb__129, dtb__130) -> (Frontend_dAst.C_Decl_DAxiom (dtb__128, (v_toAstExpr dtb__129), (Frontend_dAst.v_detachedNodeRef dtb__130)))
  | Frontend_dRast.C_Decl_DData (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139) -> (Frontend_dAst.C_Decl_DData (dtb__131, dtb__132, (v_toAstExpr dtb__133), ((B_dData_dList.v_map v_toAstCtor) dtb__134), dtb__135, dtb__136, dtb__137, dtb__138, (Frontend_dAst.v_detachedNodeRef dtb__139)))
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let v_toAstDecls = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map v_toAstDecl) decls))

# 153 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
let rec v_toRastPat = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__140, dtb__141, dtb__142) -> (Frontend_dRast.C_Pat_PRecord ((Frontend_dRast_dName.v_classifyName dtb__140), ((B_dData_dList.v_map v_toRastPatField) dtb__141), (Frontend_dAst.v_nodeRefSpan dtb__142)))
  | Frontend_dAst.C_Pat_PStr (dtb__143, dtb__144) -> (Frontend_dRast.C_Pat_PStr (dtb__143, (Frontend_dAst.v_nodeRefSpan dtb__144)))
  | Frontend_dAst.C_Pat_PInt (dtb__145, dtb__146) -> (Frontend_dRast.C_Pat_PInt (dtb__145, (Frontend_dAst.v_nodeRefSpan dtb__146)))
  | Frontend_dAst.C_Pat_PCon (dtb__147, dtb__148, dtb__149) -> (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__147), ((B_dData_dList.v_map v_toRastPat) dtb__148), (Frontend_dAst.v_nodeRefSpan dtb__149)))
  | Frontend_dAst.C_Pat_PWild (dtb__150) -> (Frontend_dRast.C_Pat_PWild ((Frontend_dAst.v_nodeRefSpan dtb__150)))
  | Frontend_dAst.C_Pat_PAs (dtb__151, dtb__152, dtb__153) -> (Frontend_dRast.C_Pat_PAs (dtb__151, (v_toRastPat dtb__152), (Frontend_dAst.v_nodeRefSpan dtb__153)))
  | Frontend_dAst.C_Pat_PVar (dtb__154, dtb__155) -> (Frontend_dRast.C_Pat_PVar (dtb__154, (Frontend_dAst.v_nodeRefSpan dtb__155)))
  | _ -> failwith "DT: impossible branch"
))
# 164 "Vuna/Compiler/Frontend/Rast/Bridge.vuna"
and v_toRastPatField = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = (v_toRastPat dtb__157) }
  | _ -> failwith "DT: impossible branch"
))
