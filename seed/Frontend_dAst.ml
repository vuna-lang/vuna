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
and t_Binding = { f_Binding_bindPat : t_Pat; f_Binding_bindValue : t_Expr; f_Binding_bindSig : t_BindingSig B_dData_dMaybe.t_Maybe; f_Binding_bindRef : t_NodeRef }
and t_Expr = C_Expr_EVar of (string) * (t_NodeRef) | C_Expr_EInt of (int) * (t_NodeRef) | C_Expr_EStr of (string) * (t_NodeRef) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EPi of (string) * (bool) * (t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_ELet of (t_Binding B_dData_dList.t_List) * (t_Expr) * (bool) * (t_NodeRef) | C_Expr_ELocalFun of (t_LocalClause B_dData_dList.t_List) * (t_NodeRef) | C_Expr_ECase of (t_Expr) * (t_Alt B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EField of (t_Expr) * (string) * (t_NodeRef) | C_Expr_ERecord of (string) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EInfix of (string) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EParen of (t_Expr) * (t_NodeRef) | C_Expr_EBacktick of (string) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_ESectOp of (string) * (t_NodeRef) | C_Expr_ESectL of (string) * (t_Expr) * (t_NodeRef) | C_Expr_ESectR of (t_Expr) * (string) * (t_NodeRef) | C_Expr_EAnn of (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EInterp of (bool) * (t_InterpPart B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EFloat of (string) * (t_NodeRef)
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

# 128 "Vuna/Compiler/Frontend/Ast.vuna"
let v_bindingValueView = (fun (b : t_Binding) -> (match (b).f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (C_Expr_EAnn ((b).f_Binding_bindValue, (dtb__0).f_BindingSig_sigType, (dtb__0).f_BindingSig_sigRef))
  | B_dData_dMaybe.C_Maybe_Nothing -> (b).f_Binding_bindValue
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixitySpan = (fun (d : t_FixityDecl) -> (v_nodeRefSpan (d).f_FixityDecl_fixityRef))

# 205 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorSpan = (fun (c : t_Ctor) -> (v_nodeRefSpan (c).f_Ctor_ctorRef))

# 255 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecName = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__1, dtb__2, dtb__3) -> dtb__1
  | C_ExportSpec_ESValue (dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecSpan = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__6, dtb__7, dtb__8) -> dtb__8
  | C_ExportSpec_ESValue (dtb__9, dtb__10) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecName = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__11; f_OpacitySpec_opacityKind = dtb__12; f_OpacitySpec_opacitySpan = dtb__13 } -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecSpan = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__14; f_OpacitySpec_opacityKind = dtb__15; f_OpacitySpec_opacitySpan = dtb__16 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclSpan = (fun (m : t_ModDecl) -> (v_nodeRefSpan (m).f_ModDecl_modDeclRef))

# 306 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patSpan = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__17, dtb__18, dtb__19) -> (v_nodeRefSpan dtb__19)
  | C_Pat_PStr (dtb__20, dtb__21) -> (v_nodeRefSpan dtb__21)
  | C_Pat_PInt (dtb__22, dtb__23) -> (v_nodeRefSpan dtb__23)
  | C_Pat_PCon (dtb__24, dtb__25, dtb__26) -> (v_nodeRefSpan dtb__26)
  | C_Pat_PWild (dtb__27) -> (v_nodeRefSpan dtb__27)
  | C_Pat_PAs (dtb__28, dtb__29, dtb__30) -> (v_nodeRefSpan dtb__30)
  | C_Pat_PVar (dtb__31, dtb__32) -> (v_nodeRefSpan dtb__32)
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatRef = (fun (mc0 : t_NodeRef) (mc1 : t_Pat) -> (match mc1 with
  | C_Pat_PRecord (dtb__33, dtb__34, dtb__35) -> (C_Pat_PRecord (dtb__33, dtb__34, mc0))
  | C_Pat_PStr (dtb__36, dtb__37) -> (C_Pat_PStr (dtb__36, mc0))
  | C_Pat_PInt (dtb__38, dtb__39) -> (C_Pat_PInt (dtb__38, mc0))
  | C_Pat_PCon (dtb__40, dtb__41, dtb__42) -> (C_Pat_PCon (dtb__40, dtb__41, mc0))
  | C_Pat_PWild (dtb__43) -> (C_Pat_PWild (mc0))
  | C_Pat_PAs (dtb__44, dtb__45, dtb__46) -> (C_Pat_PAs (dtb__44, dtb__45, mc0))
  | C_Pat_PVar (dtb__47, dtb__48) -> (C_Pat_PVar (dtb__47, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patRef = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__49, dtb__50, dtb__51) -> dtb__51
  | C_Pat_PStr (dtb__52, dtb__53) -> dtb__53
  | C_Pat_PInt (dtb__54, dtb__55) -> dtb__55
  | C_Pat_PCon (dtb__56, dtb__57, dtb__58) -> dtb__58
  | C_Pat_PWild (dtb__59) -> dtb__59
  | C_Pat_PAs (dtb__60, dtb__61, dtb__62) -> dtb__62
  | C_Pat_PVar (dtb__63, dtb__64) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatId = (fun (nid : int) (p : t_Pat) -> ((v_withPatRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_patRef p)) }) p))

# 371 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_fieldPatOf = (fun (mc0 : string) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> (if (dtb__67 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__68)) else ((v_fieldPatOf mc0) dtb__66))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_patSubsumes = (fun (mc0 : t_Pat) (mc1 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__69, dtb__70, dtb__71) -> (match mc1 with
  | C_Pat_PRecord (dtb__72, dtb__73, dtb__74) -> (if (dtb__69 = dtb__72) then ((v_subsumePatFields dtb__70) dtb__73) else false)
  | C_Pat_PAs (dtb__75, dtb__76, dtb__77) -> ((v_patSubsumes mc0) dtb__76)
  | _ -> false
)
  | C_Pat_PStr (dtb__78, dtb__79) -> (match mc1 with
  | C_Pat_PStr (dtb__80, dtb__81) -> (dtb__78 = dtb__80)
  | C_Pat_PAs (dtb__82, dtb__83, dtb__84) -> ((v_patSubsumes mc0) dtb__83)
  | _ -> false
)
  | C_Pat_PInt (dtb__85, dtb__86) -> (match mc1 with
  | C_Pat_PInt (dtb__87, dtb__88) -> (dtb__85 = dtb__87)
  | C_Pat_PAs (dtb__89, dtb__90, dtb__91) -> ((v_patSubsumes mc0) dtb__90)
  | _ -> false
)
  | C_Pat_PCon (dtb__92, dtb__93, dtb__94) -> (match mc1 with
  | C_Pat_PCon (dtb__95, dtb__96, dtb__97) -> (if (dtb__92 = dtb__95) then ((v_subsumePatList dtb__93) dtb__96) else false)
  | C_Pat_PAs (dtb__98, dtb__99, dtb__100) -> ((v_patSubsumes mc0) dtb__99)
  | _ -> false
)
  | C_Pat_PAs (dtb__101, dtb__102, dtb__103) -> ((v_patSubsumes dtb__102) mc1)
  | C_Pat_PWild (dtb__104) -> true
  | C_Pat_PVar (dtb__105, dtb__106) -> true
  | _ -> failwith "DT: impossible branch"
))
# 358 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatList = (fun (mc0 : t_Pat B_dData_dList.t_List) (mc1 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if ((v_patSubsumes dtb__107) dtb__109) then ((v_subsumePatList dtb__108) dtb__110) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 364 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> (match ((v_fieldPatOf dtb__113) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> (if ((v_patSubsumes dtb__114) dtb__115) then ((v_subsumePatFields dtb__112) mc1) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_subsumePatFields dtb__112) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clauseSubsumedBy = (fun (ps : t_Pat B_dData_dList.t_List) (qs : t_Pat B_dData_dList.t_List) -> ((v_subsumePatList ps) qs))

# 395 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprRef = (fun (mc0 : t_NodeRef) (mc1 : t_Expr) -> (match mc1 with
  | C_Expr_EInterp (dtb__116, dtb__117, dtb__118) -> (C_Expr_EInterp (dtb__116, dtb__117, mc0))
  | C_Expr_EAnn (dtb__119, dtb__120, dtb__121) -> (C_Expr_EAnn (dtb__119, dtb__120, mc0))
  | C_Expr_EDo (dtb__122, dtb__123) -> (C_Expr_EDo (dtb__122, mc0))
  | C_Expr_ERecUpdate (dtb__124, dtb__125, dtb__126) -> (C_Expr_ERecUpdate (dtb__124, dtb__125, mc0))
  | C_Expr_ERecord (dtb__127, dtb__128, dtb__129) -> (C_Expr_ERecord (dtb__127, dtb__128, mc0))
  | C_Expr_EField (dtb__130, dtb__131, dtb__132) -> (C_Expr_EField (dtb__130, dtb__131, mc0))
  | C_Expr_EIf (dtb__133, dtb__134, dtb__135, dtb__136) -> (C_Expr_EIf (dtb__133, dtb__134, dtb__135, mc0))
  | C_Expr_ECase (dtb__137, dtb__138, dtb__139) -> (C_Expr_ECase (dtb__137, dtb__138, mc0))
  | C_Expr_ELocalFun (dtb__140, dtb__141) -> (C_Expr_ELocalFun (dtb__140, mc0))
  | C_Expr_ELet (dtb__142, dtb__143, dtb__144, dtb__145) -> (C_Expr_ELet (dtb__142, dtb__143, dtb__144, mc0))
  | C_Expr_EPi (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> (C_Expr_EPi (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, mc0))
  | C_Expr_EApp (dtb__152, dtb__153, dtb__154) -> (C_Expr_EApp (dtb__152, dtb__153, mc0))
  | C_Expr_ELam (dtb__155, dtb__156, dtb__157) -> (C_Expr_ELam (dtb__155, dtb__156, mc0))
  | C_Expr_EFloat (dtb__158, dtb__159) -> (C_Expr_EFloat (dtb__158, mc0))
  | C_Expr_EStr (dtb__160, dtb__161) -> (C_Expr_EStr (dtb__160, mc0))
  | C_Expr_EInt (dtb__162, dtb__163) -> (C_Expr_EInt (dtb__162, mc0))
  | C_Expr_ESectR (dtb__164, dtb__165, dtb__166) -> (C_Expr_ESectR (dtb__164, dtb__165, mc0))
  | C_Expr_ESectL (dtb__167, dtb__168, dtb__169) -> (C_Expr_ESectL (dtb__167, dtb__168, mc0))
  | C_Expr_ESectOp (dtb__170, dtb__171) -> (C_Expr_ESectOp (dtb__170, mc0))
  | C_Expr_EBacktick (dtb__172, dtb__173, dtb__174, dtb__175) -> (C_Expr_EBacktick (dtb__172, dtb__173, dtb__174, mc0))
  | C_Expr_EParen (dtb__176, dtb__177) -> (C_Expr_EParen (dtb__176, mc0))
  | C_Expr_EInfix (dtb__178, dtb__179, dtb__180, dtb__181) -> (C_Expr_EInfix (dtb__178, dtb__179, dtb__180, mc0))
  | C_Expr_EVar (dtb__182, dtb__183) -> (C_Expr_EVar (dtb__182, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprRef = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__184, dtb__185, dtb__186) -> dtb__186
  | C_Expr_EAnn (dtb__187, dtb__188, dtb__189) -> dtb__189
  | C_Expr_EDo (dtb__190, dtb__191) -> dtb__191
  | C_Expr_ERecUpdate (dtb__192, dtb__193, dtb__194) -> dtb__194
  | C_Expr_ERecord (dtb__195, dtb__196, dtb__197) -> dtb__197
  | C_Expr_EField (dtb__198, dtb__199, dtb__200) -> dtb__200
  | C_Expr_EIf (dtb__201, dtb__202, dtb__203, dtb__204) -> dtb__204
  | C_Expr_ECase (dtb__205, dtb__206, dtb__207) -> dtb__207
  | C_Expr_ELocalFun (dtb__208, dtb__209) -> dtb__209
  | C_Expr_ELet (dtb__210, dtb__211, dtb__212, dtb__213) -> dtb__213
  | C_Expr_EPi (dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> dtb__219
  | C_Expr_EApp (dtb__220, dtb__221, dtb__222) -> dtb__222
  | C_Expr_ELam (dtb__223, dtb__224, dtb__225) -> dtb__225
  | C_Expr_EFloat (dtb__226, dtb__227) -> dtb__227
  | C_Expr_EStr (dtb__228, dtb__229) -> dtb__229
  | C_Expr_EInt (dtb__230, dtb__231) -> dtb__231
  | C_Expr_ESectR (dtb__232, dtb__233, dtb__234) -> dtb__234
  | C_Expr_ESectL (dtb__235, dtb__236, dtb__237) -> dtb__237
  | C_Expr_ESectOp (dtb__238, dtb__239) -> dtb__239
  | C_Expr_EBacktick (dtb__240, dtb__241, dtb__242, dtb__243) -> dtb__243
  | C_Expr_EParen (dtb__244, dtb__245) -> dtb__245
  | C_Expr_EInfix (dtb__246, dtb__247, dtb__248, dtb__249) -> dtb__249
  | C_Expr_EVar (dtb__250, dtb__251) -> dtb__251
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_exprSpan = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EParen (dtb__252, dtb__253) -> (v_exprSpan dtb__252)
  | _ -> (v_nodeRefSpan (v_exprRef mc0))
))

# 391 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprId = (fun (nid : int) (e : t_Expr) -> ((v_withExprRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_exprRef e)) }) e))

# 446 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__254, dtb__255) -> (v_nodeRefSpan dtb__255)
  | C_DoStmt_DExpr (dtb__256, dtb__257) -> (v_nodeRefSpan dtb__257)
  | C_DoStmt_DBind (dtb__258, dtb__259, dtb__260) -> (v_nodeRefSpan dtb__260)
  | _ -> failwith "DT: impossible branch"
))

# 452 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtRef = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__261, dtb__262) -> dtb__262
  | C_DoStmt_DExpr (dtb__263, dtb__264) -> dtb__264
  | C_DoStmt_DBind (dtb__265, dtb__266, dtb__267) -> dtb__267
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declRef = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__268, dtb__269, dtb__270, dtb__271) -> dtb__271
  | C_Decl_DTrait (dtb__272, dtb__273, dtb__274, dtb__275, dtb__276) -> dtb__276
  | C_Decl_DRecord (dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> dtb__284
  | C_Decl_DFun (dtb__285, dtb__286, dtb__287, dtb__288) -> dtb__288
  | C_Decl_DSig (dtb__289, dtb__290, dtb__291, dtb__292) -> dtb__292
  | C_Decl_DExtern (dtb__293, dtb__294, dtb__295, dtb__296) -> dtb__296
  | C_Decl_DAxiom (dtb__297, dtb__298, dtb__299) -> dtb__299
  | C_Decl_DData (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307, dtb__308) -> dtb__308
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declSpan = (fun (d : t_Decl) -> (v_nodeRefSpan (v_declRef d)))

# 471 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__309; f_Field_fieldType = dtb__310; f_Field_fieldRef = dtb__311 } -> dtb__309
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__312; f_Field_fieldType = dtb__313; f_Field_fieldRef = dtb__314 } -> dtb__313
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__315; f_TraitMethod_traitMethodType = dtb__316; f_TraitMethod_traitMethodRef = dtb__317 } -> dtb__315
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importSpan = (fun (i : t_Import) -> (v_nodeRefSpan (i).f_Import_importRef))

# 490 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemRef = (fun (mc0 : t_ExportItem) -> (match mc0 with
  | C_ExportItem_XNamespace (dtb__318, dtb__319, dtb__320) -> dtb__320
  | C_ExportItem_XModule (dtb__321, dtb__322) -> dtb__322
  | C_ExportItem_XTypeSome (dtb__323, dtb__324, dtb__325) -> dtb__325
  | C_ExportItem_XTypeAll (dtb__326, dtb__327) -> dtb__327
  | C_ExportItem_XBare (dtb__328, dtb__329) -> dtb__329
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExportItemRef = (fun (mc0 : t_NodeRef) (mc1 : t_ExportItem) -> (match mc1 with
  | C_ExportItem_XNamespace (dtb__330, dtb__331, dtb__332) -> (C_ExportItem_XNamespace (dtb__330, dtb__331, mc0))
  | C_ExportItem_XModule (dtb__333, dtb__334) -> (C_ExportItem_XModule (dtb__333, mc0))
  | C_ExportItem_XTypeSome (dtb__335, dtb__336, dtb__337) -> (C_ExportItem_XTypeSome (dtb__335, dtb__336, mc0))
  | C_ExportItem_XTypeAll (dtb__338, dtb__339) -> (C_ExportItem_XTypeAll (dtb__338, mc0))
  | C_ExportItem_XBare (dtb__340, dtb__341) -> (C_ExportItem_XBare (dtb__340, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemSpan = (fun (item : t_ExportItem) -> (v_nodeRefSpan (v_exportItemRef item)))

# 509 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__342, dtb__343) -> (match dtb__342 with
  | C_Decl_DFun (dtb__344, dtb__345, dtb__346, dtb__347) -> (if (dtb__344 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__345; B_dData_dPair.f_Pair_second = dtb__346 }, ((v_collectClauses dtb__343) mc1))) else ((v_collectClauses dtb__343) mc1))
  | _ -> ((v_collectClauses dtb__343) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 520 "Vuna/Compiler/Frontend/Ast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__348, dtb__349) -> (match dtb__348 with
  | { B_dData_dPair.f_Pair_first = dtb__350; B_dData_dPair.f_Pair_second = dtb__351 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__350)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 526 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__352; f_Ctor_ctorType = dtb__353; f_Ctor_ctorArity = dtb__354; f_Ctor_ctorRef = dtb__355 } -> dtb__352
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 538 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (match dtb__356 with
  | B_dData_dList.C_List_Nil -> dtb__357
  | _ -> (match (B_dData_dList.v_reverse dtb__356) with
  | B_dData_dList.C_List_Nil -> dtb__357
  | B_dData_dList.C_List__x58__x58_ (dtb__358, dtb__359) -> (String.concat "" [dtb__358; "."; dtb__357])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 547 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__360; f_Ctor_ctorType = dtb__361; f_Ctor_ctorArity = dtb__362; f_Ctor_ctorRef = dtb__363 } -> dtb__361
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__364, dtb__365, dtb__366) -> (match dtb__364 with
  | C_Expr_EVar (dtb__367, dtb__368) -> (if (dtb__367 = "->") then (match dtb__365 with
  | B_dData_dList.C_List__x58__x58_ (dtb__369, dtb__370) -> (match dtb__370 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__372 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__371))
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

# 554 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (if ((v_ctorName dtb__373) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__373).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__374))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 559 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | C_Decl_DData (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385) -> (match ((v_lookupCtorArity mc0) dtb__380) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__386) -> (B_dData_dMaybe.C_Maybe_Just (dtb__386))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__376)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> (if (mc0 = dtb__387) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__389))) else ((v_ctorArity mc0) dtb__376))
  | _ -> ((v_ctorArity mc0) dtb__376)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 571 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__395, dtb__396, dtb__397, dtb__398) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__399, dtb__400, dtb__401, dtb__402, dtb__403) -> ((B_dData_dList.v_map v_traitMethodName) dtb__402)
  | C_Decl_DRecord (dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410, dtb__411) -> (B_dData_dList.C_List__x58__x58_ (dtb__404, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420) -> ((B_dData_dList.v_map v_ctorName) dtb__415)
  | C_Decl_DSig (dtb__421, dtb__422, dtb__423, dtb__424) -> (B_dData_dList.C_List__x58__x58_ (dtb__421, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__425, dtb__426, dtb__427, dtb__428) -> (B_dData_dList.C_List__x58__x58_ (dtb__425, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__429, dtb__430, dtb__431) -> (B_dData_dList.C_List__x58__x58_ (dtb__429, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__432, dtb__433, dtb__434, dtb__435) -> (B_dData_dList.C_List__x58__x58_ (dtb__432, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Frontend/Ast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 587 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__436, dtb__437, dtb__438, dtb__439, dtb__440) -> (B_dData_dList.C_List__x58__x58_ (dtb__436, ((B_dData_dList.v_map v_traitMethodName) dtb__439)))
  | C_Decl_DRecord (dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448) -> (B_dData_dList.C_List__x58__x58_ (dtb__441, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457) -> (B_dData_dList.C_List__x58__x58_ (dtb__449, ((B_dData_dList.v_map v_ctorName) dtb__452)))
  | _ -> (v_declNames mc0)
))

# 594 "Vuna/Compiler/Frontend/Ast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__458, dtb__459, dtb__460, dtb__461, dtb__462) -> ((B_dData_dList.v_map v_traitMethodName) dtb__461)
  | C_Decl_DRecord (dtb__463, dtb__464, dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470) -> (B_dData_dList.C_List__x58__x58_ (dtb__463, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__471, dtb__472, dtb__473, dtb__474, dtb__475, dtb__476, dtb__477, dtb__478, dtb__479) -> ((B_dData_dList.v_map v_ctorName) dtb__474)
  | _ -> B_dData_dList.C_List_Nil
))

# 600 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 603 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__480, dtb__481, dtb__482, dtb__483, dtb__484) -> (B_dData_dList.C_List__x58__x58_ (dtb__480, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490, dtb__491, dtb__492) -> (B_dData_dList.C_List__x58__x58_ (dtb__485, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500, dtb__501) -> (B_dData_dList.C_List__x58__x58_ (dtb__493, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 609 "Vuna/Compiler/Frontend/Ast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 612 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506, dtb__507, dtb__508, dtb__509) -> dtb__505
  | C_Decl_DData (dtb__510, dtb__511, dtb__512, dtb__513, dtb__514, dtb__515, dtb__516, dtb__517, dtb__518) -> dtb__514
  | _ -> B_dData_dList.C_List_Nil
))
