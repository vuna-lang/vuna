open Vuna_runtime
type t_NodeRef = { f_NodeRef_nodeRefId : int; f_NodeRef_nodeRefSpan : Base_dSource.t_Span }
and t_Field = { f_Field_fieldName : string; f_Field_fieldType : t_Expr; f_Field_fieldRef : t_NodeRef }
and t_TraitMethod = { f_TraitMethod_traitMethodName : string; f_TraitMethod_traitMethodType : t_Expr; f_TraitMethod_traitMethodRef : t_NodeRef }
and t_TraitParam = { f_TraitParam_traitParamName : string; f_TraitParam_traitParamKind : t_Expr B_dData_dMaybe.t_Maybe }
and t_Pat = C_Pat_PVar of (string) * (t_NodeRef) | C_Pat_PAs of (string) * (t_Pat) * (t_NodeRef) | C_Pat_PWild of (t_NodeRef) | C_Pat_PCon of (string) * (t_Pat B_dData_dList.t_List) * (t_NodeRef) | C_Pat_PInt of (int) * (t_NodeRef) | C_Pat_PStr of (string) * (t_NodeRef) | C_Pat_PRecord of (string) * ((string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef)
and t_InterpPart = C_InterpPart_IPText of (string) | C_InterpPart_IPHole of (t_Expr)
and t_Qty = C_Qty_Q0 | C_Qty_Q1
and t_ReprTier = C_ReprTier_ReprAuto | C_ReprTier_ReprAlias | C_ReprTier_ReprBoxed
and t_LocalClause = { f_LocalClause_lcPats : t_Pat B_dData_dList.t_List; f_LocalClause_lcBody : t_Expr; f_LocalClause_lcRef : t_NodeRef; f_LocalClause_lcHead : t_NodeRef }
and t_Alt = { f_Alt_altPat : t_Pat; f_Alt_altBody : t_Expr; f_Alt_altRef : t_NodeRef }
and t_BindingSig = { f_BindingSig_sigType : t_Expr; f_BindingSig_sigRef : t_NodeRef }
and t_BindingValue = C_BindingValue_BVal of (t_Expr) | C_BindingValue_BClauses of (t_LocalClause B_dData_dList.t_List)
and t_Binding = { f_Binding_bindPat : t_Pat; f_Binding_bindValue : t_BindingValue; f_Binding_bindSig : t_BindingSig B_dData_dMaybe.t_Maybe; f_Binding_bindRef : t_NodeRef }
and t_Expr = C_Expr_EVar of (string) * (t_NodeRef) | C_Expr_EInt of (int) * (t_NodeRef) | C_Expr_EStr of (string) * (t_NodeRef) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EPi of (string) * (bool) * (t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_ELet of (t_Binding B_dData_dList.t_List) * (t_Expr) * (bool) * (t_NodeRef) | C_Expr_ECase of (t_Expr) * (t_Alt B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EField of (t_Expr) * (string) * (t_NodeRef) | C_Expr_ERecord of (string) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EInterp of (t_InterpPart B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EFloat of (string) * (t_NodeRef)
and t_FixityDecl = { f_FixityDecl_fixityOp : string; f_FixityDecl_fixityLevel : int; f_FixityDecl_fixityAssoc : int; f_FixityDecl_fixityRef : t_NodeRef }
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (t_NodeRef) | C_DoStmt_DExpr of (t_Expr) * (t_NodeRef) | C_DoStmt_DLet of (t_Binding B_dData_dList.t_List) * (t_NodeRef)
and t_Ctor = { f_Ctor_ctorName : string; f_Ctor_ctorType : t_Expr; f_Ctor_ctorArity : int; f_Ctor_ctorRef : t_NodeRef }
and t_Decl = C_Decl_DData of (string) * (string B_dData_dList.t_List) * (t_Expr) * (t_Ctor B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (t_ReprTier) * (bool) * (t_NodeRef) | C_Decl_DAxiom of (string) * (t_Expr) * (t_NodeRef) | C_Decl_DExtern of (string) * (string) * (t_Expr) * (t_NodeRef) | C_Decl_DSig of (string) * (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Decl_DFun of (string) * (t_Pat B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Decl_DRecord of (string) * (string B_dData_dList.t_List) * (t_Field B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (t_ReprTier) * (bool) * (t_NodeRef) | C_Decl_DTrait of (string) * (t_TraitParam B_dData_dList.t_List) * (t_Expr B_dData_dList.t_List) * (t_TraitMethod B_dData_dList.t_List) * (t_NodeRef) | C_Decl_DInstance of (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_Decl B_dData_dList.t_List) * (t_NodeRef)
and t_ExportItem = C_ExportItem_XBare of (string) * (t_NodeRef) | C_ExportItem_XTypeAll of (string) * (t_NodeRef) | C_ExportItem_XTypeSome of (string) * (string B_dData_dList.t_List) * (t_NodeRef) | C_ExportItem_XModule of (string) * (t_NodeRef) | C_ExportItem_XNamespace of (string) * (string B_dData_dMaybe.t_Maybe) * (t_NodeRef)
and t_ExportMembers = C_ExportMembers_EMNone | C_ExportMembers_EMAll | C_ExportMembers_EMOnly of (string B_dData_dList.t_List)
and t_ExportSpec = C_ExportSpec_ESValue of (string) * (Base_dSource.t_Span) | C_ExportSpec_ESType of (string) * (t_ExportMembers) * (Base_dSource.t_Span)
and t_Opacity = C_Opacity_OpacityOpaque | C_Opacity_OpacityTransparent | C_Opacity_OpacityAbstract
and t_OpacitySpec = { f_OpacitySpec_opacityName : string; f_OpacitySpec_opacityKind : t_Opacity; f_OpacitySpec_opacitySpan : Base_dSource.t_Span }
and t_ModDecl = { f_ModDecl_modDeclName : string; f_ModDecl_modDeclHasExportList : bool; f_ModDecl_modDeclExportItems : t_ExportItem B_dData_dList.t_List; f_ModDecl_modDeclExports : t_ExportSpec B_dData_dList.t_List; f_ModDecl_modDeclReexports : t_ExportItem B_dData_dList.t_List; f_ModDecl_modDeclOpacity : t_OpacitySpec B_dData_dList.t_List; f_ModDecl_modDeclRef : t_NodeRef }
and t_SourceFile = { f_SourceFile_sourceFileModDecl : t_ModDecl B_dData_dMaybe.t_Maybe; f_SourceFile_sourceFileImports : t_Import B_dData_dList.t_List; f_SourceFile_sourceFileFixities : t_FixityDecl B_dData_dList.t_List; f_SourceFile_sourceFileDecls : t_Decl B_dData_dList.t_List; f_SourceFile_sourceFileExports : t_ExportSpec B_dData_dList.t_List; f_SourceFile_sourceFileReexports : t_ExportItem B_dData_dList.t_List; f_SourceFile_sourceFileOpacity : t_OpacitySpec B_dData_dList.t_List }
and t_Import = { f_Import_importName : string; f_Import_importIsQualified : bool; f_Import_importAlias : string B_dData_dMaybe.t_Maybe; f_Import_importRef : t_NodeRef }

# 21 "Vuna/Compiler/Frontend/Ast.vuna"
let v_noNodeRef = { f_NodeRef_nodeRefId = (0 - 1); f_NodeRef_nodeRefSpan = Base_dSource.v_spanEmpty }

# 25 "Vuna/Compiler/Frontend/Ast.vuna"
let v_detachedNodeRef = (fun (sp : Base_dSource.t_Span) -> { f_NodeRef_nodeRefId = (0 - 1); f_NodeRef_nodeRefSpan = sp })

# 37 "Vuna/Compiler/Frontend/Ast.vuna"
let v_synthNodeIdBase = 1099511627776

# 45 "Vuna/Compiler/Frontend/Ast.vuna"
let v_synthRefAt = (fun (sp : Base_dSource.t_Span) -> { f_NodeRef_nodeRefId = (v_synthNodeIdBase + (Base_dSource.v_spanStartOffset sp)); f_NodeRef_nodeRefSpan = sp })

# 96 "Vuna/Compiler/Frontend/Ast.vuna"
let v_qtyIsZero = (fun (mc0 : t_Qty) -> (match mc0 with
  | C_Qty_Q1 -> false
  | C_Qty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Frontend/Ast.vuna"
let v_reprPrefix = (fun (mc0 : t_ReprTier) -> (match mc0 with
  | C_ReprTier_ReprBoxed -> "boxed "
  | C_ReprTier_ReprAlias -> "alias "
  | C_ReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecName = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__0, dtb__1, dtb__2) -> dtb__0
  | C_ExportSpec_ESValue (dtb__3, dtb__4) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecSpan = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__5, dtb__6, dtb__7) -> dtb__7
  | C_ExportSpec_ESValue (dtb__8, dtb__9) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecName = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__10; f_OpacitySpec_opacityKind = dtb__11; f_OpacitySpec_opacitySpan = dtb__12 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecSpan = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__13; f_OpacitySpec_opacityKind = dtb__14; f_OpacitySpec_opacitySpan = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatRef = (fun (mc0 : t_NodeRef) (mc1 : t_Pat) -> (match mc1 with
  | C_Pat_PRecord (dtb__16, dtb__17, dtb__18) -> (C_Pat_PRecord (dtb__16, dtb__17, mc0))
  | C_Pat_PStr (dtb__19, dtb__20) -> (C_Pat_PStr (dtb__19, mc0))
  | C_Pat_PInt (dtb__21, dtb__22) -> (C_Pat_PInt (dtb__21, mc0))
  | C_Pat_PCon (dtb__23, dtb__24, dtb__25) -> (C_Pat_PCon (dtb__23, dtb__24, mc0))
  | C_Pat_PWild (dtb__26) -> (C_Pat_PWild (mc0))
  | C_Pat_PAs (dtb__27, dtb__28, dtb__29) -> (C_Pat_PAs (dtb__27, dtb__28, mc0))
  | C_Pat_PVar (dtb__30, dtb__31) -> (C_Pat_PVar (dtb__30, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 336 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patRef = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__32, dtb__33, dtb__34) -> dtb__34
  | C_Pat_PStr (dtb__35, dtb__36) -> dtb__36
  | C_Pat_PInt (dtb__37, dtb__38) -> dtb__38
  | C_Pat_PCon (dtb__39, dtb__40, dtb__41) -> dtb__41
  | C_Pat_PWild (dtb__42) -> dtb__42
  | C_Pat_PAs (dtb__43, dtb__44, dtb__45) -> dtb__45
  | C_Pat_PVar (dtb__46, dtb__47) -> dtb__47
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_fieldPatOf = (fun (mc0 : string) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (match dtb__48 with
  | { B_dData_dPair.f_Pair_first = dtb__50; B_dData_dPair.f_Pair_second = dtb__51 } -> (if (dtb__50 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__51)) else ((v_fieldPatOf mc0) dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_patSubsumes = (fun (mc0 : t_Pat) (mc1 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__52, dtb__53, dtb__54) -> (match mc1 with
  | C_Pat_PRecord (dtb__55, dtb__56, dtb__57) -> (if (dtb__52 = dtb__55) then ((v_subsumePatFields dtb__53) dtb__56) else false)
  | C_Pat_PAs (dtb__58, dtb__59, dtb__60) -> ((v_patSubsumes mc0) dtb__59)
  | _ -> false
)
  | C_Pat_PStr (dtb__61, dtb__62) -> (match mc1 with
  | C_Pat_PStr (dtb__63, dtb__64) -> (dtb__61 = dtb__63)
  | C_Pat_PAs (dtb__65, dtb__66, dtb__67) -> ((v_patSubsumes mc0) dtb__66)
  | _ -> false
)
  | C_Pat_PInt (dtb__68, dtb__69) -> (match mc1 with
  | C_Pat_PInt (dtb__70, dtb__71) -> (dtb__68 = dtb__70)
  | C_Pat_PAs (dtb__72, dtb__73, dtb__74) -> ((v_patSubsumes mc0) dtb__73)
  | _ -> false
)
  | C_Pat_PCon (dtb__75, dtb__76, dtb__77) -> (match mc1 with
  | C_Pat_PCon (dtb__78, dtb__79, dtb__80) -> (if (dtb__75 = dtb__78) then ((v_subsumePatList dtb__76) dtb__79) else false)
  | C_Pat_PAs (dtb__81, dtb__82, dtb__83) -> ((v_patSubsumes mc0) dtb__82)
  | _ -> false
)
  | C_Pat_PAs (dtb__84, dtb__85, dtb__86) -> ((v_patSubsumes dtb__85) mc1)
  | C_Pat_PWild (dtb__87) -> true
  | C_Pat_PVar (dtb__88, dtb__89) -> true
  | _ -> failwith "DT: impossible branch"
))
# 363 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatList = (fun (mc0 : t_Pat B_dData_dList.t_List) (mc1 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (if ((v_patSubsumes dtb__90) dtb__92) then ((v_subsumePatList dtb__91) dtb__93) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 369 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> (match ((v_fieldPatOf dtb__96) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (if ((v_patSubsumes dtb__97) dtb__98) then ((v_subsumePatFields dtb__95) mc1) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_subsumePatFields dtb__95) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clauseSubsumedBy = (fun (ps : t_Pat B_dData_dList.t_List) (qs : t_Pat B_dData_dList.t_List) -> ((v_subsumePatList ps) qs))

# 398 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprRef = (fun (mc0 : t_NodeRef) (mc1 : t_Expr) -> (match mc1 with
  | C_Expr_EInterp (dtb__99, dtb__100) -> (C_Expr_EInterp (dtb__99, mc0))
  | C_Expr_EDo (dtb__101, dtb__102) -> (C_Expr_EDo (dtb__101, mc0))
  | C_Expr_ERecUpdate (dtb__103, dtb__104, dtb__105) -> (C_Expr_ERecUpdate (dtb__103, dtb__104, mc0))
  | C_Expr_ERecord (dtb__106, dtb__107, dtb__108) -> (C_Expr_ERecord (dtb__106, dtb__107, mc0))
  | C_Expr_EField (dtb__109, dtb__110, dtb__111) -> (C_Expr_EField (dtb__109, dtb__110, mc0))
  | C_Expr_EIf (dtb__112, dtb__113, dtb__114, dtb__115) -> (C_Expr_EIf (dtb__112, dtb__113, dtb__114, mc0))
  | C_Expr_ECase (dtb__116, dtb__117, dtb__118) -> (C_Expr_ECase (dtb__116, dtb__117, mc0))
  | C_Expr_ELet (dtb__119, dtb__120, dtb__121, dtb__122) -> (C_Expr_ELet (dtb__119, dtb__120, dtb__121, mc0))
  | C_Expr_EPi (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (C_Expr_EPi (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, mc0))
  | C_Expr_EApp (dtb__129, dtb__130, dtb__131) -> (C_Expr_EApp (dtb__129, dtb__130, mc0))
  | C_Expr_ELam (dtb__132, dtb__133, dtb__134) -> (C_Expr_ELam (dtb__132, dtb__133, mc0))
  | C_Expr_EFloat (dtb__135, dtb__136) -> (C_Expr_EFloat (dtb__135, mc0))
  | C_Expr_EStr (dtb__137, dtb__138) -> (C_Expr_EStr (dtb__137, mc0))
  | C_Expr_EInt (dtb__139, dtb__140) -> (C_Expr_EInt (dtb__139, mc0))
  | C_Expr_EVar (dtb__141, dtb__142) -> (C_Expr_EVar (dtb__141, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprRef = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__143, dtb__144) -> dtb__144
  | C_Expr_EDo (dtb__145, dtb__146) -> dtb__146
  | C_Expr_ERecUpdate (dtb__147, dtb__148, dtb__149) -> dtb__149
  | C_Expr_ERecord (dtb__150, dtb__151, dtb__152) -> dtb__152
  | C_Expr_EField (dtb__153, dtb__154, dtb__155) -> dtb__155
  | C_Expr_EIf (dtb__156, dtb__157, dtb__158, dtb__159) -> dtb__159
  | C_Expr_ECase (dtb__160, dtb__161, dtb__162) -> dtb__162
  | C_Expr_ELet (dtb__163, dtb__164, dtb__165, dtb__166) -> dtb__166
  | C_Expr_EPi (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> dtb__172
  | C_Expr_EApp (dtb__173, dtb__174, dtb__175) -> dtb__175
  | C_Expr_ELam (dtb__176, dtb__177, dtb__178) -> dtb__178
  | C_Expr_EFloat (dtb__179, dtb__180) -> dtb__180
  | C_Expr_EStr (dtb__181, dtb__182) -> dtb__182
  | C_Expr_EInt (dtb__183, dtb__184) -> dtb__184
  | C_Expr_EVar (dtb__185, dtb__186) -> dtb__186
  | _ -> failwith "DT: impossible branch"
))

# 439 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtRef = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__187, dtb__188) -> dtb__188
  | C_DoStmt_DExpr (dtb__189, dtb__190) -> dtb__190
  | C_DoStmt_DBind (dtb__191, dtb__192, dtb__193) -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declRef = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__194, dtb__195, dtb__196, dtb__197) -> dtb__197
  | C_Decl_DTrait (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> dtb__202
  | C_Decl_DRecord (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> dtb__210
  | C_Decl_DFun (dtb__211, dtb__212, dtb__213, dtb__214) -> dtb__214
  | C_Decl_DSig (dtb__215, dtb__216, dtb__217, dtb__218) -> dtb__218
  | C_Decl_DExtern (dtb__219, dtb__220, dtb__221, dtb__222) -> dtb__222
  | C_Decl_DAxiom (dtb__223, dtb__224, dtb__225) -> dtb__225
  | C_Decl_DData (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234) -> dtb__234
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemRef = (fun (mc0 : t_ExportItem) -> (match mc0 with
  | C_ExportItem_XNamespace (dtb__235, dtb__236, dtb__237) -> dtb__237
  | C_ExportItem_XModule (dtb__238, dtb__239) -> dtb__239
  | C_ExportItem_XTypeSome (dtb__240, dtb__241, dtb__242) -> dtb__242
  | C_ExportItem_XTypeAll (dtb__243, dtb__244) -> dtb__244
  | C_ExportItem_XBare (dtb__245, dtb__246) -> dtb__246
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExportItemRef = (fun (mc0 : t_NodeRef) (mc1 : t_ExportItem) -> (match mc1 with
  | C_ExportItem_XNamespace (dtb__247, dtb__248, dtb__249) -> (C_ExportItem_XNamespace (dtb__247, dtb__248, mc0))
  | C_ExportItem_XModule (dtb__250, dtb__251) -> (C_ExportItem_XModule (dtb__250, mc0))
  | C_ExportItem_XTypeSome (dtb__252, dtb__253, dtb__254) -> (C_ExportItem_XTypeSome (dtb__252, dtb__253, mc0))
  | C_ExportItem_XTypeAll (dtb__255, dtb__256) -> (C_ExportItem_XTypeAll (dtb__255, mc0))
  | C_ExportItem_XBare (dtb__257, dtb__258) -> (C_ExportItem_XBare (dtb__257, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Frontend/Ast.vuna"
let[@tail_mod_cons] rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (match dtb__259 with
  | C_Decl_DFun (dtb__261, dtb__262, dtb__263, dtb__264) -> (if (dtb__261 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__262; B_dData_dPair.f_Pair_second = dtb__263 }, ((v_collectClauses dtb__260) mc1))) else ((v_collectClauses dtb__260) mc1))
  | _ -> ((v_collectClauses dtb__260) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 498 "Vuna/Compiler/Frontend/Ast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (match dtb__265 with
  | { B_dData_dPair.f_Pair_first = dtb__267; B_dData_dPair.f_Pair_second = dtb__268 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__267)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 507 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 513 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (match dtb__269 with
  | B_dData_dList.C_List_Nil -> dtb__270
  | _ -> (match (B_dData_dList.v_reverse dtb__269) with
  | B_dData_dList.C_List_Nil -> dtb__270
  | B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__272) -> (String.concat "" [dtb__271; "."; dtb__270])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 522 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__273, dtb__274, dtb__275) -> (match dtb__273 with
  | C_Expr_EVar (dtb__276, dtb__277) -> (if (dtb__276 = "->") then (match dtb__274 with
  | B_dData_dList.C_List__x58__x58_ (dtb__278, dtb__279) -> (match dtb__279 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> (match dtb__281 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__280))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
))

# 588 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__282, dtb__283, dtb__284, dtb__285) -> B_dData_dList.C_List_Nil
  | C_Decl_DSig (dtb__286, dtb__287, dtb__288, dtb__289) -> B_dData_dList.C_List_Nil
  | C_Decl_DExtern (dtb__290, dtb__291, dtb__292, dtb__293) -> B_dData_dList.C_List_Nil
  | C_Decl_DAxiom (dtb__294, dtb__295, dtb__296) -> B_dData_dList.C_List_Nil
  | C_Decl_DFun (dtb__297, dtb__298, dtb__299, dtb__300) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> (B_dData_dList.C_List__x58__x58_ (dtb__301, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> (B_dData_dList.C_List__x58__x58_ (dtb__306, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__314, dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322) -> (B_dData_dList.C_List__x58__x58_ (dtb__314, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 598 "Vuna/Compiler/Frontend/Ast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 601 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329, dtb__330) -> dtb__326
  | C_Decl_DData (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338, dtb__339) -> dtb__335
  | _ -> B_dData_dList.C_List_Nil
))

# 16 "Vuna/Compiler/Frontend/Ast.vuna"
let v_nodeRefId = (fun (p : t_NodeRef) -> (match p with
  | { f_NodeRef_nodeRefId = dtb__340; f_NodeRef_nodeRefSpan = dtb__341 } -> dtb__340
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isSynthNodeRef = (fun (r : t_NodeRef) -> ((v_nodeRefId r) >= v_synthNodeIdBase))

# 17 "Vuna/Compiler/Frontend/Ast.vuna"
let v_nodeRefSpan = (fun (p : t_NodeRef) -> (match p with
  | { f_NodeRef_nodeRefId = dtb__342; f_NodeRef_nodeRefSpan = dtb__343 } -> dtb__343
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Ast.vuna"
let v_synthNodeRef = (fun (r : t_NodeRef) -> (v_synthRefAt (v_nodeRefSpan r)))

# 58 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldSpan = (fun (f : t_Field) -> (v_nodeRefSpan (f).f_Field_fieldRef))

# 68 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodSpan = (fun (m : t_TraitMethod) -> (v_nodeRefSpan (m).f_TraitMethod_traitMethodRef))

# 194 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixitySpan = (fun (d : t_FixityDecl) -> (v_nodeRefSpan (d).f_FixityDecl_fixityRef))

# 210 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorSpan = (fun (c : t_Ctor) -> (v_nodeRefSpan (c).f_Ctor_ctorRef))

# 296 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclSpan = (fun (m : t_ModDecl) -> (v_nodeRefSpan (m).f_ModDecl_modDeclRef))

# 311 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patSpan = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__344, dtb__345, dtb__346) -> (v_nodeRefSpan dtb__346)
  | C_Pat_PStr (dtb__347, dtb__348) -> (v_nodeRefSpan dtb__348)
  | C_Pat_PInt (dtb__349, dtb__350) -> (v_nodeRefSpan dtb__350)
  | C_Pat_PCon (dtb__351, dtb__352, dtb__353) -> (v_nodeRefSpan dtb__353)
  | C_Pat_PWild (dtb__354) -> (v_nodeRefSpan dtb__354)
  | C_Pat_PAs (dtb__355, dtb__356, dtb__357) -> (v_nodeRefSpan dtb__357)
  | C_Pat_PVar (dtb__358, dtb__359) -> (v_nodeRefSpan dtb__359)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatId = (fun (nid : int) (p : t_Pat) -> ((v_withPatRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_patRef p)) }) p))

# 386 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprSpan = (fun (e : t_Expr) -> (v_nodeRefSpan (v_exprRef e)))

# 394 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprId = (fun (nid : int) (e : t_Expr) -> ((v_withExprRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_exprRef e)) }) e))

# 433 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__360, dtb__361) -> (v_nodeRefSpan dtb__361)
  | C_DoStmt_DExpr (dtb__362, dtb__363) -> (v_nodeRefSpan dtb__363)
  | C_DoStmt_DBind (dtb__364, dtb__365, dtb__366) -> (v_nodeRefSpan dtb__366)
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declSpan = (fun (d : t_Decl) -> (v_nodeRefSpan (v_declRef d)))

# 464 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importSpan = (fun (i : t_Import) -> (v_nodeRefSpan (i).f_Import_importRef))

# 484 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemSpan = (fun (item : t_ExportItem) -> (v_nodeRefSpan (v_exportItemRef item)))

# 53 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldName = (fun (p : t_Field) -> (match p with
  | { f_Field_fieldName = dtb__367; f_Field_fieldType = dtb__368; f_Field_fieldRef = dtb__369 } -> dtb__367
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldType = (fun (p : t_Field) -> (match p with
  | { f_Field_fieldName = dtb__370; f_Field_fieldType = dtb__371; f_Field_fieldRef = dtb__372 } -> dtb__371
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldRef = (fun (p : t_Field) -> (match p with
  | { f_Field_fieldName = dtb__373; f_Field_fieldType = dtb__374; f_Field_fieldRef = dtb__375 } -> dtb__375
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodName = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__376; f_TraitMethod_traitMethodType = dtb__377; f_TraitMethod_traitMethodRef = dtb__378 } -> dtb__376
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodType = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__379; f_TraitMethod_traitMethodType = dtb__380; f_TraitMethod_traitMethodRef = dtb__381 } -> dtb__380
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodRef = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__382; f_TraitMethod_traitMethodType = dtb__383; f_TraitMethod_traitMethodRef = dtb__384 } -> dtb__384
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitParamName = (fun (p : t_TraitParam) -> (match p with
  | { f_TraitParam_traitParamName = dtb__385; f_TraitParam_traitParamKind = dtb__386 } -> dtb__385
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitParamKind = (fun (p : t_TraitParam) -> (match p with
  | { f_TraitParam_traitParamName = dtb__387; f_TraitParam_traitParamKind = dtb__388 } -> dtb__388
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcPats = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__389; f_LocalClause_lcBody = dtb__390; f_LocalClause_lcRef = dtb__391; f_LocalClause_lcHead = dtb__392 } -> dtb__389
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcBody = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__393; f_LocalClause_lcBody = dtb__394; f_LocalClause_lcRef = dtb__395; f_LocalClause_lcHead = dtb__396 } -> dtb__394
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcRef = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__397; f_LocalClause_lcBody = dtb__398; f_LocalClause_lcRef = dtb__399; f_LocalClause_lcHead = dtb__400 } -> dtb__399
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcHead = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__401; f_LocalClause_lcBody = dtb__402; f_LocalClause_lcRef = dtb__403; f_LocalClause_lcHead = dtb__404 } -> dtb__404
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altPat = (fun (p : t_Alt) -> (match p with
  | { f_Alt_altPat = dtb__405; f_Alt_altBody = dtb__406; f_Alt_altRef = dtb__407 } -> dtb__405
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altBody = (fun (p : t_Alt) -> (match p with
  | { f_Alt_altPat = dtb__408; f_Alt_altBody = dtb__409; f_Alt_altRef = dtb__410 } -> dtb__409
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altRef = (fun (p : t_Alt) -> (match p with
  | { f_Alt_altPat = dtb__411; f_Alt_altBody = dtb__412; f_Alt_altRef = dtb__413 } -> dtb__413
  | _ -> failwith "DT: impossible branch"
))

# 132 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sigType = (fun (p : t_BindingSig) -> (match p with
  | { f_BindingSig_sigType = dtb__414; f_BindingSig_sigRef = dtb__415 } -> dtb__414
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sigRef = (fun (p : t_BindingSig) -> (match p with
  | { f_BindingSig_sigType = dtb__416; f_BindingSig_sigRef = dtb__417 } -> dtb__417
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindPat = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__418; f_Binding_bindValue = dtb__419; f_Binding_bindSig = dtb__420; f_Binding_bindRef = dtb__421 } -> dtb__418
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindValue = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__422; f_Binding_bindValue = dtb__423; f_Binding_bindSig = dtb__424; f_Binding_bindRef = dtb__425 } -> dtb__423
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindSig = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__426; f_Binding_bindValue = dtb__427; f_Binding_bindSig = dtb__428; f_Binding_bindRef = dtb__429 } -> dtb__428
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindRef = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__430; f_Binding_bindValue = dtb__431; f_Binding_bindSig = dtb__432; f_Binding_bindRef = dtb__433 } -> dtb__433
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityOp = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__434; f_FixityDecl_fixityLevel = dtb__435; f_FixityDecl_fixityAssoc = dtb__436; f_FixityDecl_fixityRef = dtb__437 } -> dtb__434
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityLevel = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__438; f_FixityDecl_fixityLevel = dtb__439; f_FixityDecl_fixityAssoc = dtb__440; f_FixityDecl_fixityRef = dtb__441 } -> dtb__439
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityAssoc = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__442; f_FixityDecl_fixityLevel = dtb__443; f_FixityDecl_fixityAssoc = dtb__444; f_FixityDecl_fixityRef = dtb__445 } -> dtb__444
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityRef = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__446; f_FixityDecl_fixityLevel = dtb__447; f_FixityDecl_fixityAssoc = dtb__448; f_FixityDecl_fixityRef = dtb__449 } -> dtb__449
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorName = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__450; f_Ctor_ctorType = dtb__451; f_Ctor_ctorArity = dtb__452; f_Ctor_ctorRef = dtb__453 } -> dtb__450
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__454, dtb__455) -> (if ((v_ctorName dtb__454) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__454).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__455))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_declCtorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (match dtb__456 with
  | C_Decl_DData (dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463, dtb__464, dtb__465, dtb__466) -> (match ((v_lookupCtorArity mc0) dtb__461) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__467) -> (B_dData_dMaybe.C_Maybe_Just (dtb__467))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_declCtorArity mc0) dtb__457)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473, dtb__474, dtb__475) -> (if (mc0 = dtb__468) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__470))) else ((v_declCtorArity mc0) dtb__457))
  | C_Decl_DAxiom (dtb__476, dtb__477, dtb__478) -> ((v_declCtorArity dtb__476) dtb__457)
  | C_Decl_DExtern (dtb__479, dtb__480, dtb__481, dtb__482) -> ((v_declCtorArity dtb__479) dtb__457)
  | C_Decl_DSig (dtb__483, dtb__484, dtb__485, dtb__486) -> ((v_declCtorArity dtb__483) dtb__457)
  | C_Decl_DFun (dtb__487, dtb__488, dtb__489, dtb__490) -> ((v_declCtorArity dtb__487) dtb__457)
  | C_Decl_DTrait (dtb__491, dtb__492, dtb__493, dtb__494, dtb__495) -> ((v_declCtorArity mc0) dtb__457)
  | C_Decl_DInstance (dtb__496, dtb__497, dtb__498, dtb__499) -> ((v_declCtorArity mc0) dtb__457)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__500, dtb__501, dtb__502, dtb__503) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__504, dtb__505, dtb__506, dtb__507, dtb__508) -> ((B_dData_dList.v_map v_traitMethodName) dtb__507)
  | C_Decl_DRecord (dtb__509, dtb__510, dtb__511, dtb__512, dtb__513, dtb__514, dtb__515, dtb__516) -> (B_dData_dList.C_List__x58__x58_ (dtb__509, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__517, dtb__518, dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> ((B_dData_dList.v_map v_ctorName) dtb__520)
  | C_Decl_DSig (dtb__526, dtb__527, dtb__528, dtb__529) -> (B_dData_dList.C_List__x58__x58_ (dtb__526, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__530, dtb__531, dtb__532, dtb__533) -> (B_dData_dList.C_List__x58__x58_ (dtb__530, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__534, dtb__535, dtb__536) -> (B_dData_dList.C_List__x58__x58_ (dtb__534, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__537, dtb__538, dtb__539, dtb__540) -> (B_dData_dList.C_List__x58__x58_ (dtb__537, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 561 "Vuna/Compiler/Frontend/Ast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 564 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__541, dtb__542, dtb__543, dtb__544) -> B_dData_dList.C_List_Nil
  | C_Decl_DSig (dtb__545, dtb__546, dtb__547, dtb__548) -> (B_dData_dList.C_List__x58__x58_ (dtb__545, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__549, dtb__550, dtb__551, dtb__552) -> (B_dData_dList.C_List__x58__x58_ (dtb__549, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__553, dtb__554, dtb__555) -> (B_dData_dList.C_List__x58__x58_ (dtb__553, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__556, dtb__557, dtb__558, dtb__559) -> (B_dData_dList.C_List__x58__x58_ (dtb__556, B_dData_dList.C_List_Nil))
  | C_Decl_DTrait (dtb__560, dtb__561, dtb__562, dtb__563, dtb__564) -> (B_dData_dList.C_List__x58__x58_ (dtb__560, ((B_dData_dList.v_map v_traitMethodName) dtb__563)))
  | C_Decl_DRecord (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569, dtb__570, dtb__571, dtb__572) -> (B_dData_dList.C_List__x58__x58_ (dtb__565, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__573, dtb__574, dtb__575, dtb__576, dtb__577, dtb__578, dtb__579, dtb__580, dtb__581) -> (B_dData_dList.C_List__x58__x58_ (dtb__573, ((B_dData_dList.v_map v_ctorName) dtb__576)))
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Frontend/Ast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__582, dtb__583, dtb__584, dtb__585) -> B_dData_dList.C_List_Nil
  | C_Decl_DSig (dtb__586, dtb__587, dtb__588, dtb__589) -> B_dData_dList.C_List_Nil
  | C_Decl_DExtern (dtb__590, dtb__591, dtb__592, dtb__593) -> B_dData_dList.C_List_Nil
  | C_Decl_DAxiom (dtb__594, dtb__595, dtb__596) -> B_dData_dList.C_List_Nil
  | C_Decl_DFun (dtb__597, dtb__598, dtb__599, dtb__600) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605) -> ((B_dData_dList.v_map v_traitMethodName) dtb__604)
  | C_Decl_DRecord (dtb__606, dtb__607, dtb__608, dtb__609, dtb__610, dtb__611, dtb__612, dtb__613) -> (B_dData_dList.C_List__x58__x58_ (dtb__606, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__614, dtb__615, dtb__616, dtb__617, dtb__618, dtb__619, dtb__620, dtb__621, dtb__622) -> ((B_dData_dList.v_map v_ctorName) dtb__617)
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 205 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorType = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__623; f_Ctor_ctorType = dtb__624; f_Ctor_ctorArity = dtb__625; f_Ctor_ctorRef = dtb__626 } -> dtb__624
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorArity = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__627; f_Ctor_ctorType = dtb__628; f_Ctor_ctorArity = dtb__629; f_Ctor_ctorRef = dtb__630 } -> dtb__629
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorRef = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__631; f_Ctor_ctorType = dtb__632; f_Ctor_ctorArity = dtb__633; f_Ctor_ctorRef = dtb__634 } -> dtb__634
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacityName = (fun (p : t_OpacitySpec) -> (match p with
  | { f_OpacitySpec_opacityName = dtb__635; f_OpacitySpec_opacityKind = dtb__636; f_OpacitySpec_opacitySpan = dtb__637 } -> dtb__635
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacityKind = (fun (p : t_OpacitySpec) -> (match p with
  | { f_OpacitySpec_opacityName = dtb__638; f_OpacitySpec_opacityKind = dtb__639; f_OpacitySpec_opacitySpan = dtb__640 } -> dtb__639
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpan = (fun (p : t_OpacitySpec) -> (match p with
  | { f_OpacitySpec_opacityName = dtb__641; f_OpacitySpec_opacityKind = dtb__642; f_OpacitySpec_opacitySpan = dtb__643 } -> dtb__643
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclName = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__644; f_ModDecl_modDeclHasExportList = dtb__645; f_ModDecl_modDeclExportItems = dtb__646; f_ModDecl_modDeclExports = dtb__647; f_ModDecl_modDeclReexports = dtb__648; f_ModDecl_modDeclOpacity = dtb__649; f_ModDecl_modDeclRef = dtb__650 } -> dtb__644
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclHasExportList = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__651; f_ModDecl_modDeclHasExportList = dtb__652; f_ModDecl_modDeclExportItems = dtb__653; f_ModDecl_modDeclExports = dtb__654; f_ModDecl_modDeclReexports = dtb__655; f_ModDecl_modDeclOpacity = dtb__656; f_ModDecl_modDeclRef = dtb__657 } -> dtb__652
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclExportItems = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__658; f_ModDecl_modDeclHasExportList = dtb__659; f_ModDecl_modDeclExportItems = dtb__660; f_ModDecl_modDeclExports = dtb__661; f_ModDecl_modDeclReexports = dtb__662; f_ModDecl_modDeclOpacity = dtb__663; f_ModDecl_modDeclRef = dtb__664 } -> dtb__660
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclExports = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__665; f_ModDecl_modDeclHasExportList = dtb__666; f_ModDecl_modDeclExportItems = dtb__667; f_ModDecl_modDeclExports = dtb__668; f_ModDecl_modDeclReexports = dtb__669; f_ModDecl_modDeclOpacity = dtb__670; f_ModDecl_modDeclRef = dtb__671 } -> dtb__668
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclReexports = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__672; f_ModDecl_modDeclHasExportList = dtb__673; f_ModDecl_modDeclExportItems = dtb__674; f_ModDecl_modDeclExports = dtb__675; f_ModDecl_modDeclReexports = dtb__676; f_ModDecl_modDeclOpacity = dtb__677; f_ModDecl_modDeclRef = dtb__678 } -> dtb__676
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclOpacity = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__679; f_ModDecl_modDeclHasExportList = dtb__680; f_ModDecl_modDeclExportItems = dtb__681; f_ModDecl_modDeclExports = dtb__682; f_ModDecl_modDeclReexports = dtb__683; f_ModDecl_modDeclOpacity = dtb__684; f_ModDecl_modDeclRef = dtb__685 } -> dtb__684
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclRef = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__686; f_ModDecl_modDeclHasExportList = dtb__687; f_ModDecl_modDeclExportItems = dtb__688; f_ModDecl_modDeclExports = dtb__689; f_ModDecl_modDeclReexports = dtb__690; f_ModDecl_modDeclOpacity = dtb__691; f_ModDecl_modDeclRef = dtb__692 } -> dtb__692
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileModDecl = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__693; f_SourceFile_sourceFileImports = dtb__694; f_SourceFile_sourceFileFixities = dtb__695; f_SourceFile_sourceFileDecls = dtb__696; f_SourceFile_sourceFileExports = dtb__697; f_SourceFile_sourceFileReexports = dtb__698; f_SourceFile_sourceFileOpacity = dtb__699 } -> dtb__693
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileImports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__700; f_SourceFile_sourceFileImports = dtb__701; f_SourceFile_sourceFileFixities = dtb__702; f_SourceFile_sourceFileDecls = dtb__703; f_SourceFile_sourceFileExports = dtb__704; f_SourceFile_sourceFileReexports = dtb__705; f_SourceFile_sourceFileOpacity = dtb__706 } -> dtb__701
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileFixities = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__707; f_SourceFile_sourceFileImports = dtb__708; f_SourceFile_sourceFileFixities = dtb__709; f_SourceFile_sourceFileDecls = dtb__710; f_SourceFile_sourceFileExports = dtb__711; f_SourceFile_sourceFileReexports = dtb__712; f_SourceFile_sourceFileOpacity = dtb__713 } -> dtb__709
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileDecls = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__714; f_SourceFile_sourceFileImports = dtb__715; f_SourceFile_sourceFileFixities = dtb__716; f_SourceFile_sourceFileDecls = dtb__717; f_SourceFile_sourceFileExports = dtb__718; f_SourceFile_sourceFileReexports = dtb__719; f_SourceFile_sourceFileOpacity = dtb__720 } -> dtb__717
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileExports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__721; f_SourceFile_sourceFileImports = dtb__722; f_SourceFile_sourceFileFixities = dtb__723; f_SourceFile_sourceFileDecls = dtb__724; f_SourceFile_sourceFileExports = dtb__725; f_SourceFile_sourceFileReexports = dtb__726; f_SourceFile_sourceFileOpacity = dtb__727 } -> dtb__725
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileReexports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__728; f_SourceFile_sourceFileImports = dtb__729; f_SourceFile_sourceFileFixities = dtb__730; f_SourceFile_sourceFileDecls = dtb__731; f_SourceFile_sourceFileExports = dtb__732; f_SourceFile_sourceFileReexports = dtb__733; f_SourceFile_sourceFileOpacity = dtb__734 } -> dtb__733
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileOpacity = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__735; f_SourceFile_sourceFileImports = dtb__736; f_SourceFile_sourceFileFixities = dtb__737; f_SourceFile_sourceFileDecls = dtb__738; f_SourceFile_sourceFileExports = dtb__739; f_SourceFile_sourceFileReexports = dtb__740; f_SourceFile_sourceFileOpacity = dtb__741 } -> dtb__741
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importName = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__742; f_Import_importIsQualified = dtb__743; f_Import_importAlias = dtb__744; f_Import_importRef = dtb__745 } -> dtb__742
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importIsQualified = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__746; f_Import_importIsQualified = dtb__747; f_Import_importAlias = dtb__748; f_Import_importRef = dtb__749 } -> dtb__747
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importAlias = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__750; f_Import_importIsQualified = dtb__751; f_Import_importAlias = dtb__752; f_Import_importRef = dtb__753 } -> dtb__752
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importRef = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__754; f_Import_importIsQualified = dtb__755; f_Import_importAlias = dtb__756; f_Import_importRef = dtb__757 } -> dtb__757
  | _ -> failwith "DT: impossible branch"
))
