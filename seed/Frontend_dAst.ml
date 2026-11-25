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

# 20 "Vuna/Compiler/Frontend/Ast.vuna"
let v_nodeRefId = (fun (r : t_NodeRef) -> (r).f_NodeRef_nodeRefId)

# 23 "Vuna/Compiler/Frontend/Ast.vuna"
let v_nodeRefSpan = (fun (r : t_NodeRef) -> (r).f_NodeRef_nodeRefSpan)

# 27 "Vuna/Compiler/Frontend/Ast.vuna"
let v_noNodeRef = { f_NodeRef_nodeRefId = (0 - 1); f_NodeRef_nodeRefSpan = Base_dSource.v_spanEmpty }

# 31 "Vuna/Compiler/Frontend/Ast.vuna"
let v_detachedNodeRef = (fun (sp : Base_dSource.t_Span) -> { f_NodeRef_nodeRefId = (0 - 1); f_NodeRef_nodeRefSpan = sp })

# 40 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldSpan = (fun (f : t_Field) -> (v_nodeRefSpan (f).f_Field_fieldRef))

# 50 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodSpan = (fun (m : t_TraitMethod) -> (v_nodeRefSpan (m).f_TraitMethod_traitMethodRef))

# 78 "Vuna/Compiler/Frontend/Ast.vuna"
let v_qtyIsZero = (fun (mc0 : t_Qty) -> (match mc0 with
  | C_Qty_Q1 -> false
  | C_Qty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Frontend/Ast.vuna"
let v_reprPrefix = (fun (mc0 : t_ReprTier) -> (match mc0 with
  | C_ReprTier_ReprBoxed -> "boxed "
  | C_ReprTier_ReprAlias -> "alias "
  | C_ReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixitySpan = (fun (d : t_FixityDecl) -> (v_nodeRefSpan (d).f_FixityDecl_fixityRef))

# 192 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorSpan = (fun (c : t_Ctor) -> (v_nodeRefSpan (c).f_Ctor_ctorRef))

# 242 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecName = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__0, dtb__1, dtb__2) -> dtb__0
  | C_ExportSpec_ESValue (dtb__3, dtb__4) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecSpan = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__5, dtb__6, dtb__7) -> dtb__7
  | C_ExportSpec_ESValue (dtb__8, dtb__9) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecName = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__10; f_OpacitySpec_opacityKind = dtb__11; f_OpacitySpec_opacitySpan = dtb__12 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecSpan = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__13; f_OpacitySpec_opacityKind = dtb__14; f_OpacitySpec_opacitySpan = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclSpan = (fun (m : t_ModDecl) -> (v_nodeRefSpan (m).f_ModDecl_modDeclRef))

# 293 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patSpan = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__16, dtb__17, dtb__18) -> (v_nodeRefSpan dtb__18)
  | C_Pat_PStr (dtb__19, dtb__20) -> (v_nodeRefSpan dtb__20)
  | C_Pat_PInt (dtb__21, dtb__22) -> (v_nodeRefSpan dtb__22)
  | C_Pat_PCon (dtb__23, dtb__24, dtb__25) -> (v_nodeRefSpan dtb__25)
  | C_Pat_PWild (dtb__26) -> (v_nodeRefSpan dtb__26)
  | C_Pat_PAs (dtb__27, dtb__28, dtb__29) -> (v_nodeRefSpan dtb__29)
  | C_Pat_PVar (dtb__30, dtb__31) -> (v_nodeRefSpan dtb__31)
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatRef = (fun (mc0 : t_NodeRef) (mc1 : t_Pat) -> (match mc1 with
  | C_Pat_PRecord (dtb__32, dtb__33, dtb__34) -> (C_Pat_PRecord (dtb__32, dtb__33, mc0))
  | C_Pat_PStr (dtb__35, dtb__36) -> (C_Pat_PStr (dtb__35, mc0))
  | C_Pat_PInt (dtb__37, dtb__38) -> (C_Pat_PInt (dtb__37, mc0))
  | C_Pat_PCon (dtb__39, dtb__40, dtb__41) -> (C_Pat_PCon (dtb__39, dtb__40, mc0))
  | C_Pat_PWild (dtb__42) -> (C_Pat_PWild (mc0))
  | C_Pat_PAs (dtb__43, dtb__44, dtb__45) -> (C_Pat_PAs (dtb__43, dtb__44, mc0))
  | C_Pat_PVar (dtb__46, dtb__47) -> (C_Pat_PVar (dtb__46, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 318 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patRef = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__48, dtb__49, dtb__50) -> dtb__50
  | C_Pat_PStr (dtb__51, dtb__52) -> dtb__52
  | C_Pat_PInt (dtb__53, dtb__54) -> dtb__54
  | C_Pat_PCon (dtb__55, dtb__56, dtb__57) -> dtb__57
  | C_Pat_PWild (dtb__58) -> dtb__58
  | C_Pat_PAs (dtb__59, dtb__60, dtb__61) -> dtb__61
  | C_Pat_PVar (dtb__62, dtb__63) -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatId = (fun (nid : int) (p : t_Pat) -> ((v_withPatRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_patRef p)) }) p))

# 358 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_fieldPatOf = (fun (mc0 : string) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__64 with
  | { B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = dtb__67 } -> (if (dtb__66 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__67)) else ((v_fieldPatOf mc0) dtb__65))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_patSubsumes = (fun (mc0 : t_Pat) (mc1 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__68, dtb__69, dtb__70) -> (match mc1 with
  | C_Pat_PRecord (dtb__71, dtb__72, dtb__73) -> (if (dtb__68 = dtb__71) then ((v_subsumePatFields dtb__69) dtb__72) else false)
  | C_Pat_PAs (dtb__74, dtb__75, dtb__76) -> ((v_patSubsumes mc0) dtb__75)
  | _ -> false
)
  | C_Pat_PStr (dtb__77, dtb__78) -> (match mc1 with
  | C_Pat_PStr (dtb__79, dtb__80) -> (dtb__77 = dtb__79)
  | C_Pat_PAs (dtb__81, dtb__82, dtb__83) -> ((v_patSubsumes mc0) dtb__82)
  | _ -> false
)
  | C_Pat_PInt (dtb__84, dtb__85) -> (match mc1 with
  | C_Pat_PInt (dtb__86, dtb__87) -> (dtb__84 = dtb__86)
  | C_Pat_PAs (dtb__88, dtb__89, dtb__90) -> ((v_patSubsumes mc0) dtb__89)
  | _ -> false
)
  | C_Pat_PCon (dtb__91, dtb__92, dtb__93) -> (match mc1 with
  | C_Pat_PCon (dtb__94, dtb__95, dtb__96) -> (if (dtb__91 = dtb__94) then ((v_subsumePatList dtb__92) dtb__95) else false)
  | C_Pat_PAs (dtb__97, dtb__98, dtb__99) -> ((v_patSubsumes mc0) dtb__98)
  | _ -> false
)
  | C_Pat_PAs (dtb__100, dtb__101, dtb__102) -> ((v_patSubsumes dtb__101) mc1)
  | C_Pat_PWild (dtb__103) -> true
  | C_Pat_PVar (dtb__104, dtb__105) -> true
  | _ -> failwith "DT: impossible branch"
))
# 345 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatList = (fun (mc0 : t_Pat B_dData_dList.t_List) (mc1 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__108, dtb__109) -> (if ((v_patSubsumes dtb__106) dtb__108) then ((v_subsumePatList dtb__107) dtb__109) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 351 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (match dtb__110 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (match ((v_fieldPatOf dtb__112) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (if ((v_patSubsumes dtb__113) dtb__114) then ((v_subsumePatFields dtb__111) mc1) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_subsumePatFields dtb__111) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clauseSubsumedBy = (fun (ps : t_Pat B_dData_dList.t_List) (qs : t_Pat B_dData_dList.t_List) -> ((v_subsumePatList ps) qs))

# 380 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprRef = (fun (mc0 : t_NodeRef) (mc1 : t_Expr) -> (match mc1 with
  | C_Expr_EInterp (dtb__115, dtb__116) -> (C_Expr_EInterp (dtb__115, mc0))
  | C_Expr_EDo (dtb__117, dtb__118) -> (C_Expr_EDo (dtb__117, mc0))
  | C_Expr_ERecUpdate (dtb__119, dtb__120, dtb__121) -> (C_Expr_ERecUpdate (dtb__119, dtb__120, mc0))
  | C_Expr_ERecord (dtb__122, dtb__123, dtb__124) -> (C_Expr_ERecord (dtb__122, dtb__123, mc0))
  | C_Expr_EField (dtb__125, dtb__126, dtb__127) -> (C_Expr_EField (dtb__125, dtb__126, mc0))
  | C_Expr_EIf (dtb__128, dtb__129, dtb__130, dtb__131) -> (C_Expr_EIf (dtb__128, dtb__129, dtb__130, mc0))
  | C_Expr_ECase (dtb__132, dtb__133, dtb__134) -> (C_Expr_ECase (dtb__132, dtb__133, mc0))
  | C_Expr_ELet (dtb__135, dtb__136, dtb__137, dtb__138) -> (C_Expr_ELet (dtb__135, dtb__136, dtb__137, mc0))
  | C_Expr_EPi (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144) -> (C_Expr_EPi (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, mc0))
  | C_Expr_EApp (dtb__145, dtb__146, dtb__147) -> (C_Expr_EApp (dtb__145, dtb__146, mc0))
  | C_Expr_ELam (dtb__148, dtb__149, dtb__150) -> (C_Expr_ELam (dtb__148, dtb__149, mc0))
  | C_Expr_EFloat (dtb__151, dtb__152) -> (C_Expr_EFloat (dtb__151, mc0))
  | C_Expr_EStr (dtb__153, dtb__154) -> (C_Expr_EStr (dtb__153, mc0))
  | C_Expr_EInt (dtb__155, dtb__156) -> (C_Expr_EInt (dtb__155, mc0))
  | C_Expr_EVar (dtb__157, dtb__158) -> (C_Expr_EVar (dtb__157, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprRef = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__159, dtb__160) -> dtb__160
  | C_Expr_EDo (dtb__161, dtb__162) -> dtb__162
  | C_Expr_ERecUpdate (dtb__163, dtb__164, dtb__165) -> dtb__165
  | C_Expr_ERecord (dtb__166, dtb__167, dtb__168) -> dtb__168
  | C_Expr_EField (dtb__169, dtb__170, dtb__171) -> dtb__171
  | C_Expr_EIf (dtb__172, dtb__173, dtb__174, dtb__175) -> dtb__175
  | C_Expr_ECase (dtb__176, dtb__177, dtb__178) -> dtb__178
  | C_Expr_ELet (dtb__179, dtb__180, dtb__181, dtb__182) -> dtb__182
  | C_Expr_EPi (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188) -> dtb__188
  | C_Expr_EApp (dtb__189, dtb__190, dtb__191) -> dtb__191
  | C_Expr_ELam (dtb__192, dtb__193, dtb__194) -> dtb__194
  | C_Expr_EFloat (dtb__195, dtb__196) -> dtb__196
  | C_Expr_EStr (dtb__197, dtb__198) -> dtb__198
  | C_Expr_EInt (dtb__199, dtb__200) -> dtb__200
  | C_Expr_EVar (dtb__201, dtb__202) -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprSpan = (fun (e : t_Expr) -> (v_nodeRefSpan (v_exprRef e)))

# 376 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprId = (fun (nid : int) (e : t_Expr) -> ((v_withExprRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_exprRef e)) }) e))

# 415 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__203, dtb__204) -> (v_nodeRefSpan dtb__204)
  | C_DoStmt_DExpr (dtb__205, dtb__206) -> (v_nodeRefSpan dtb__206)
  | C_DoStmt_DBind (dtb__207, dtb__208, dtb__209) -> (v_nodeRefSpan dtb__209)
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtRef = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__210, dtb__211) -> dtb__211
  | C_DoStmt_DExpr (dtb__212, dtb__213) -> dtb__213
  | C_DoStmt_DBind (dtb__214, dtb__215, dtb__216) -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declRef = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__217, dtb__218, dtb__219, dtb__220) -> dtb__220
  | C_Decl_DTrait (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> dtb__225
  | C_Decl_DRecord (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230, dtb__231, dtb__232, dtb__233) -> dtb__233
  | C_Decl_DFun (dtb__234, dtb__235, dtb__236, dtb__237) -> dtb__237
  | C_Decl_DSig (dtb__238, dtb__239, dtb__240, dtb__241) -> dtb__241
  | C_Decl_DExtern (dtb__242, dtb__243, dtb__244, dtb__245) -> dtb__245
  | C_Decl_DAxiom (dtb__246, dtb__247, dtb__248) -> dtb__248
  | C_Decl_DData (dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257) -> dtb__257
  | _ -> failwith "DT: impossible branch"
))

# 437 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declSpan = (fun (d : t_Decl) -> (v_nodeRefSpan (v_declRef d)))

# 440 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__258; f_Field_fieldType = dtb__259; f_Field_fieldRef = dtb__260 } -> dtb__258
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__261; f_Field_fieldType = dtb__262; f_Field_fieldRef = dtb__263 } -> dtb__262
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__264; f_TraitMethod_traitMethodType = dtb__265; f_TraitMethod_traitMethodRef = dtb__266 } -> dtb__264
  | _ -> failwith "DT: impossible branch"
))

# 455 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importSpan = (fun (i : t_Import) -> (v_nodeRefSpan (i).f_Import_importRef))

# 459 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemRef = (fun (mc0 : t_ExportItem) -> (match mc0 with
  | C_ExportItem_XNamespace (dtb__267, dtb__268, dtb__269) -> dtb__269
  | C_ExportItem_XModule (dtb__270, dtb__271) -> dtb__271
  | C_ExportItem_XTypeSome (dtb__272, dtb__273, dtb__274) -> dtb__274
  | C_ExportItem_XTypeAll (dtb__275, dtb__276) -> dtb__276
  | C_ExportItem_XBare (dtb__277, dtb__278) -> dtb__278
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExportItemRef = (fun (mc0 : t_NodeRef) (mc1 : t_ExportItem) -> (match mc1 with
  | C_ExportItem_XNamespace (dtb__279, dtb__280, dtb__281) -> (C_ExportItem_XNamespace (dtb__279, dtb__280, mc0))
  | C_ExportItem_XModule (dtb__282, dtb__283) -> (C_ExportItem_XModule (dtb__282, mc0))
  | C_ExportItem_XTypeSome (dtb__284, dtb__285, dtb__286) -> (C_ExportItem_XTypeSome (dtb__284, dtb__285, mc0))
  | C_ExportItem_XTypeAll (dtb__287, dtb__288) -> (C_ExportItem_XTypeAll (dtb__287, mc0))
  | C_ExportItem_XBare (dtb__289, dtb__290) -> (C_ExportItem_XBare (dtb__289, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemSpan = (fun (item : t_ExportItem) -> (v_nodeRefSpan (v_exportItemRef item)))

# 478 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__291, dtb__292) -> (match dtb__291 with
  | C_Decl_DFun (dtb__293, dtb__294, dtb__295, dtb__296) -> (if (dtb__293 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__294; B_dData_dPair.f_Pair_second = dtb__295 }, ((v_collectClauses dtb__292) mc1))) else ((v_collectClauses dtb__292) mc1))
  | _ -> ((v_collectClauses dtb__292) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 489 "Vuna/Compiler/Frontend/Ast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__297, dtb__298) -> (match dtb__297 with
  | { B_dData_dPair.f_Pair_first = dtb__299; B_dData_dPair.f_Pair_second = dtb__300 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__299)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 495 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__301; f_Ctor_ctorType = dtb__302; f_Ctor_ctorArity = dtb__303; f_Ctor_ctorRef = dtb__304 } -> dtb__301
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 507 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = dtb__306 } -> (match dtb__305 with
  | B_dData_dList.C_List_Nil -> dtb__306
  | _ -> (match (B_dData_dList.v_reverse dtb__305) with
  | B_dData_dList.C_List_Nil -> dtb__306
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (String.concat "" [dtb__307; "."; dtb__306])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 516 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__309; f_Ctor_ctorType = dtb__310; f_Ctor_ctorArity = dtb__311; f_Ctor_ctorRef = dtb__312 } -> dtb__310
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__313, dtb__314, dtb__315) -> (match dtb__313 with
  | C_Expr_EVar (dtb__316, dtb__317) -> (if (dtb__316 = "->") then (match dtb__314 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (match dtb__319 with
  | B_dData_dList.C_List__x58__x58_ (dtb__320, dtb__321) -> (match dtb__321 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__320))
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

# 523 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__322, dtb__323) -> (if ((v_ctorName dtb__322) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__322).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__323))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__324, dtb__325) -> (match dtb__324 with
  | C_Decl_DData (dtb__326, dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> (match ((v_lookupCtorArity mc0) dtb__329) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__335) -> (B_dData_dMaybe.C_Maybe_Just (dtb__335))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__325)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> (if (mc0 = dtb__336) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__338))) else ((v_ctorArity mc0) dtb__325))
  | _ -> ((v_ctorArity mc0) dtb__325)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 540 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__344, dtb__345, dtb__346, dtb__347) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> ((B_dData_dList.v_map v_traitMethodName) dtb__351)
  | C_Decl_DRecord (dtb__353, dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360) -> (B_dData_dList.C_List__x58__x58_ (dtb__353, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__361, dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369) -> ((B_dData_dList.v_map v_ctorName) dtb__364)
  | C_Decl_DSig (dtb__370, dtb__371, dtb__372, dtb__373) -> (B_dData_dList.C_List__x58__x58_ (dtb__370, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__374, dtb__375, dtb__376, dtb__377) -> (B_dData_dList.C_List__x58__x58_ (dtb__374, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__378, dtb__379, dtb__380) -> (B_dData_dList.C_List__x58__x58_ (dtb__378, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__381, dtb__382, dtb__383, dtb__384) -> (B_dData_dList.C_List__x58__x58_ (dtb__381, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Frontend/Ast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 556 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (B_dData_dList.C_List__x58__x58_ (dtb__385, ((B_dData_dList.v_map v_traitMethodName) dtb__388)))
  | C_Decl_DRecord (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397) -> (B_dData_dList.C_List__x58__x58_ (dtb__390, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__398, dtb__399, dtb__400, dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406) -> (B_dData_dList.C_List__x58__x58_ (dtb__398, ((B_dData_dList.v_map v_ctorName) dtb__401)))
  | _ -> (v_declNames mc0)
))

# 563 "Vuna/Compiler/Frontend/Ast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__407, dtb__408, dtb__409, dtb__410, dtb__411) -> ((B_dData_dList.v_map v_traitMethodName) dtb__410)
  | C_Decl_DRecord (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419) -> (B_dData_dList.C_List__x58__x58_ (dtb__412, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__420, dtb__421, dtb__422, dtb__423, dtb__424, dtb__425, dtb__426, dtb__427, dtb__428) -> ((B_dData_dList.v_map v_ctorName) dtb__423)
  | _ -> B_dData_dList.C_List_Nil
))

# 569 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 572 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433) -> (B_dData_dList.C_List__x58__x58_ (dtb__429, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441) -> (B_dData_dList.C_List__x58__x58_ (dtb__434, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, dtb__450) -> (B_dData_dList.C_List__x58__x58_ (dtb__442, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 578 "Vuna/Compiler/Frontend/Ast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 581 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457, dtb__458) -> dtb__454
  | C_Decl_DData (dtb__459, dtb__460, dtb__461, dtb__462, dtb__463, dtb__464, dtb__465, dtb__466, dtb__467) -> dtb__463
  | _ -> B_dData_dList.C_List_Nil
))

# 37 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldRef = (fun (p : t_Field) -> (match p with
  | { f_Field_fieldName = dtb__468; f_Field_fieldType = dtb__469; f_Field_fieldRef = dtb__470 } -> dtb__470
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodType = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__471; f_TraitMethod_traitMethodType = dtb__472; f_TraitMethod_traitMethodRef = dtb__473 } -> dtb__472
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodRef = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__474; f_TraitMethod_traitMethodType = dtb__475; f_TraitMethod_traitMethodRef = dtb__476 } -> dtb__476
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitParamName = (fun (p : t_TraitParam) -> (match p with
  | { f_TraitParam_traitParamName = dtb__477; f_TraitParam_traitParamKind = dtb__478 } -> dtb__477
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitParamKind = (fun (p : t_TraitParam) -> (match p with
  | { f_TraitParam_traitParamName = dtb__479; f_TraitParam_traitParamKind = dtb__480 } -> dtb__480
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcPats = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__481; f_LocalClause_lcBody = dtb__482; f_LocalClause_lcRef = dtb__483; f_LocalClause_lcHead = dtb__484 } -> dtb__481
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcBody = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__485; f_LocalClause_lcBody = dtb__486; f_LocalClause_lcRef = dtb__487; f_LocalClause_lcHead = dtb__488 } -> dtb__486
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcRef = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__489; f_LocalClause_lcBody = dtb__490; f_LocalClause_lcRef = dtb__491; f_LocalClause_lcHead = dtb__492 } -> dtb__491
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Frontend/Ast.vuna"
let v_lcHead = (fun (p : t_LocalClause) -> (match p with
  | { f_LocalClause_lcPats = dtb__493; f_LocalClause_lcBody = dtb__494; f_LocalClause_lcRef = dtb__495; f_LocalClause_lcHead = dtb__496 } -> dtb__496
  | _ -> failwith "DT: impossible branch"
))

# 108 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altPat = (fun (p : t_Alt) -> (match p with
  | { f_Alt_altPat = dtb__497; f_Alt_altBody = dtb__498; f_Alt_altRef = dtb__499 } -> dtb__497
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altBody = (fun (p : t_Alt) -> (match p with
  | { f_Alt_altPat = dtb__500; f_Alt_altBody = dtb__501; f_Alt_altRef = dtb__502 } -> dtb__501
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Frontend/Ast.vuna"
let v_altRef = (fun (p : t_Alt) -> (match p with
  | { f_Alt_altPat = dtb__503; f_Alt_altBody = dtb__504; f_Alt_altRef = dtb__505 } -> dtb__505
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sigType = (fun (p : t_BindingSig) -> (match p with
  | { f_BindingSig_sigType = dtb__506; f_BindingSig_sigRef = dtb__507 } -> dtb__506
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sigRef = (fun (p : t_BindingSig) -> (match p with
  | { f_BindingSig_sigType = dtb__508; f_BindingSig_sigRef = dtb__509 } -> dtb__509
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindPat = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__510; f_Binding_bindValue = dtb__511; f_Binding_bindSig = dtb__512; f_Binding_bindRef = dtb__513 } -> dtb__510
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindValue = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__514; f_Binding_bindValue = dtb__515; f_Binding_bindSig = dtb__516; f_Binding_bindRef = dtb__517 } -> dtb__515
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindSig = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__518; f_Binding_bindValue = dtb__519; f_Binding_bindSig = dtb__520; f_Binding_bindRef = dtb__521 } -> dtb__520
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindRef = (fun (p : t_Binding) -> (match p with
  | { f_Binding_bindPat = dtb__522; f_Binding_bindValue = dtb__523; f_Binding_bindSig = dtb__524; f_Binding_bindRef = dtb__525 } -> dtb__525
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityOp = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__526; f_FixityDecl_fixityLevel = dtb__527; f_FixityDecl_fixityAssoc = dtb__528; f_FixityDecl_fixityRef = dtb__529 } -> dtb__526
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityLevel = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__530; f_FixityDecl_fixityLevel = dtb__531; f_FixityDecl_fixityAssoc = dtb__532; f_FixityDecl_fixityRef = dtb__533 } -> dtb__531
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityAssoc = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__534; f_FixityDecl_fixityLevel = dtb__535; f_FixityDecl_fixityAssoc = dtb__536; f_FixityDecl_fixityRef = dtb__537 } -> dtb__536
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixityRef = (fun (p : t_FixityDecl) -> (match p with
  | { f_FixityDecl_fixityOp = dtb__538; f_FixityDecl_fixityLevel = dtb__539; f_FixityDecl_fixityAssoc = dtb__540; f_FixityDecl_fixityRef = dtb__541 } -> dtb__541
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorRef = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__542; f_Ctor_ctorType = dtb__543; f_Ctor_ctorArity = dtb__544; f_Ctor_ctorRef = dtb__545 } -> dtb__545
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacityName = (fun (p : t_OpacitySpec) -> (match p with
  | { f_OpacitySpec_opacityName = dtb__546; f_OpacitySpec_opacityKind = dtb__547; f_OpacitySpec_opacitySpan = dtb__548 } -> dtb__546
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacityKind = (fun (p : t_OpacitySpec) -> (match p with
  | { f_OpacitySpec_opacityName = dtb__549; f_OpacitySpec_opacityKind = dtb__550; f_OpacitySpec_opacitySpan = dtb__551 } -> dtb__550
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpan = (fun (p : t_OpacitySpec) -> (match p with
  | { f_OpacitySpec_opacityName = dtb__552; f_OpacitySpec_opacityKind = dtb__553; f_OpacitySpec_opacitySpan = dtb__554 } -> dtb__554
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclName = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__555; f_ModDecl_modDeclHasExportList = dtb__556; f_ModDecl_modDeclExportItems = dtb__557; f_ModDecl_modDeclExports = dtb__558; f_ModDecl_modDeclReexports = dtb__559; f_ModDecl_modDeclOpacity = dtb__560; f_ModDecl_modDeclRef = dtb__561 } -> dtb__555
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclHasExportList = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__562; f_ModDecl_modDeclHasExportList = dtb__563; f_ModDecl_modDeclExportItems = dtb__564; f_ModDecl_modDeclExports = dtb__565; f_ModDecl_modDeclReexports = dtb__566; f_ModDecl_modDeclOpacity = dtb__567; f_ModDecl_modDeclRef = dtb__568 } -> dtb__563
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclExportItems = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__569; f_ModDecl_modDeclHasExportList = dtb__570; f_ModDecl_modDeclExportItems = dtb__571; f_ModDecl_modDeclExports = dtb__572; f_ModDecl_modDeclReexports = dtb__573; f_ModDecl_modDeclOpacity = dtb__574; f_ModDecl_modDeclRef = dtb__575 } -> dtb__571
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclExports = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__576; f_ModDecl_modDeclHasExportList = dtb__577; f_ModDecl_modDeclExportItems = dtb__578; f_ModDecl_modDeclExports = dtb__579; f_ModDecl_modDeclReexports = dtb__580; f_ModDecl_modDeclOpacity = dtb__581; f_ModDecl_modDeclRef = dtb__582 } -> dtb__579
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclReexports = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__583; f_ModDecl_modDeclHasExportList = dtb__584; f_ModDecl_modDeclExportItems = dtb__585; f_ModDecl_modDeclExports = dtb__586; f_ModDecl_modDeclReexports = dtb__587; f_ModDecl_modDeclOpacity = dtb__588; f_ModDecl_modDeclRef = dtb__589 } -> dtb__587
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclOpacity = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__590; f_ModDecl_modDeclHasExportList = dtb__591; f_ModDecl_modDeclExportItems = dtb__592; f_ModDecl_modDeclExports = dtb__593; f_ModDecl_modDeclReexports = dtb__594; f_ModDecl_modDeclOpacity = dtb__595; f_ModDecl_modDeclRef = dtb__596 } -> dtb__595
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclRef = (fun (p : t_ModDecl) -> (match p with
  | { f_ModDecl_modDeclName = dtb__597; f_ModDecl_modDeclHasExportList = dtb__598; f_ModDecl_modDeclExportItems = dtb__599; f_ModDecl_modDeclExports = dtb__600; f_ModDecl_modDeclReexports = dtb__601; f_ModDecl_modDeclOpacity = dtb__602; f_ModDecl_modDeclRef = dtb__603 } -> dtb__603
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileModDecl = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__604; f_SourceFile_sourceFileImports = dtb__605; f_SourceFile_sourceFileFixities = dtb__606; f_SourceFile_sourceFileDecls = dtb__607; f_SourceFile_sourceFileExports = dtb__608; f_SourceFile_sourceFileReexports = dtb__609; f_SourceFile_sourceFileOpacity = dtb__610 } -> dtb__604
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileImports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__611; f_SourceFile_sourceFileImports = dtb__612; f_SourceFile_sourceFileFixities = dtb__613; f_SourceFile_sourceFileDecls = dtb__614; f_SourceFile_sourceFileExports = dtb__615; f_SourceFile_sourceFileReexports = dtb__616; f_SourceFile_sourceFileOpacity = dtb__617 } -> dtb__612
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileFixities = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__618; f_SourceFile_sourceFileImports = dtb__619; f_SourceFile_sourceFileFixities = dtb__620; f_SourceFile_sourceFileDecls = dtb__621; f_SourceFile_sourceFileExports = dtb__622; f_SourceFile_sourceFileReexports = dtb__623; f_SourceFile_sourceFileOpacity = dtb__624 } -> dtb__620
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileDecls = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__625; f_SourceFile_sourceFileImports = dtb__626; f_SourceFile_sourceFileFixities = dtb__627; f_SourceFile_sourceFileDecls = dtb__628; f_SourceFile_sourceFileExports = dtb__629; f_SourceFile_sourceFileReexports = dtb__630; f_SourceFile_sourceFileOpacity = dtb__631 } -> dtb__628
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileExports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__632; f_SourceFile_sourceFileImports = dtb__633; f_SourceFile_sourceFileFixities = dtb__634; f_SourceFile_sourceFileDecls = dtb__635; f_SourceFile_sourceFileExports = dtb__636; f_SourceFile_sourceFileReexports = dtb__637; f_SourceFile_sourceFileOpacity = dtb__638 } -> dtb__636
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileReexports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__639; f_SourceFile_sourceFileImports = dtb__640; f_SourceFile_sourceFileFixities = dtb__641; f_SourceFile_sourceFileDecls = dtb__642; f_SourceFile_sourceFileExports = dtb__643; f_SourceFile_sourceFileReexports = dtb__644; f_SourceFile_sourceFileOpacity = dtb__645 } -> dtb__644
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Frontend/Ast.vuna"
let v_sourceFileOpacity = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__646; f_SourceFile_sourceFileImports = dtb__647; f_SourceFile_sourceFileFixities = dtb__648; f_SourceFile_sourceFileDecls = dtb__649; f_SourceFile_sourceFileExports = dtb__650; f_SourceFile_sourceFileReexports = dtb__651; f_SourceFile_sourceFileOpacity = dtb__652 } -> dtb__652
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importName = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__653; f_Import_importIsQualified = dtb__654; f_Import_importAlias = dtb__655; f_Import_importRef = dtb__656 } -> dtb__653
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importIsQualified = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__657; f_Import_importIsQualified = dtb__658; f_Import_importAlias = dtb__659; f_Import_importRef = dtb__660 } -> dtb__658
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importAlias = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__661; f_Import_importIsQualified = dtb__662; f_Import_importAlias = dtb__663; f_Import_importRef = dtb__664 } -> dtb__663
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importRef = (fun (p : t_Import) -> (match p with
  | { f_Import_importName = dtb__665; f_Import_importIsQualified = dtb__666; f_Import_importAlias = dtb__667; f_Import_importRef = dtb__668 } -> dtb__668
  | _ -> failwith "DT: impossible branch"
))
