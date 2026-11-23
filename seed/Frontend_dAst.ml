open Vuna_runtime
type t_NodeRef = { f_NodeRef_nodeRefId : int; f_NodeRef_nodeRefSpan : Base_dSource.t_Span }
and t_Field = { f_Field_fieldName : string; f_Field_fieldType : t_Expr; f_Field_fieldRef : t_NodeRef }
and t_TraitMethod = { f_TraitMethod_traitMethodName : string; f_TraitMethod_traitMethodType : t_Expr; f_TraitMethod_traitMethodRef : t_NodeRef }
and t_TraitParam = { f_TraitParam_traitParamName : string; f_TraitParam_traitParamKind : t_Expr B_dData_dMaybe.t_Maybe }
and t_Pat = C_Pat_PVar of (string) * (t_NodeRef) | C_Pat_PAs of (string) * (t_Pat) * (t_NodeRef) | C_Pat_PWild of (t_NodeRef) | C_Pat_PCon of (string) * (t_Pat B_dData_dList.t_List) * (t_NodeRef) | C_Pat_PInt of (int) * (t_NodeRef) | C_Pat_PStr of (string) * (t_NodeRef) | C_Pat_PRecord of (string) * ((string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef)
and t_InterpPart = C_InterpPart_IPText of (string) | C_InterpPart_IPHole of (t_Expr)
and t_Qty = C_Qty_Q0 | C_Qty_Q1
and t_ReprTier = C_ReprTier_ReprAuto | C_ReprTier_ReprAlias | C_ReprTier_ReprBoxed
and t_Expr = C_Expr_EVar of (string) * (t_NodeRef) | C_Expr_EInt of (int) * (t_NodeRef) | C_Expr_EStr of (string) * (t_NodeRef) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (t_NodeRef) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EPi of (string) * (bool) * (t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_ELet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (bool) * (t_NodeRef) | C_Expr_ELocalFun of ((t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_ECase of (t_Expr) * ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EField of (t_Expr) * (string) * (t_NodeRef) | C_Expr_ERecord of (string) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EInfix of (string) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EParen of (t_Expr) * (t_NodeRef) | C_Expr_EBacktick of (string) * (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_ESectOp of (string) * (t_NodeRef) | C_Expr_ESectL of (string) * (t_Expr) * (t_NodeRef) | C_Expr_ESectR of (t_Expr) * (string) * (t_NodeRef) | C_Expr_EAnn of (t_Expr) * (t_Expr) * (t_NodeRef) | C_Expr_EInterp of (bool) * (t_InterpPart B_dData_dList.t_List) * (t_NodeRef) | C_Expr_EFloat of (string) * (t_NodeRef)
and t_FixityDecl = { f_FixityDecl_fixityOp : string; f_FixityDecl_fixityLevel : int; f_FixityDecl_fixityAssoc : int; f_FixityDecl_fixityRef : t_NodeRef }
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (t_NodeRef) | C_DoStmt_DExpr of (t_Expr) * (t_NodeRef) | C_DoStmt_DLet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_NodeRef)
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

# 152 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixitySpan = (fun (d : t_FixityDecl) -> (v_nodeRefSpan (d).f_FixityDecl_fixityRef))

# 168 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorSpan = (fun (c : t_Ctor) -> (v_nodeRefSpan (c).f_Ctor_ctorRef))

# 218 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecName = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__0, dtb__1, dtb__2) -> dtb__0
  | C_ExportSpec_ESValue (dtb__3, dtb__4) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecSpan = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__5, dtb__6, dtb__7) -> dtb__7
  | C_ExportSpec_ESValue (dtb__8, dtb__9) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecName = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__10; f_OpacitySpec_opacityKind = dtb__11; f_OpacitySpec_opacitySpan = dtb__12 } -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecSpan = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__13; f_OpacitySpec_opacityKind = dtb__14; f_OpacitySpec_opacitySpan = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Frontend/Ast.vuna"
let v_modDeclSpan = (fun (m : t_ModDecl) -> (v_nodeRefSpan (m).f_ModDecl_modDeclRef))

# 269 "Vuna/Compiler/Frontend/Ast.vuna"
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

# 284 "Vuna/Compiler/Frontend/Ast.vuna"
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

# 294 "Vuna/Compiler/Frontend/Ast.vuna"
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

# 280 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withPatId = (fun (nid : int) (p : t_Pat) -> ((v_withPatRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_patRef p)) }) p))

# 334 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_fieldPatOf = (fun (mc0 : string) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__64 with
  | { B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = dtb__67 } -> (if (dtb__66 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__67)) else ((v_fieldPatOf mc0) dtb__65))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Frontend/Ast.vuna"
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
# 321 "Vuna/Compiler/Frontend/Ast.vuna"
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
# 327 "Vuna/Compiler/Frontend/Ast.vuna"
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

# 340 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clauseSubsumedBy = (fun (ps : t_Pat B_dData_dList.t_List) (qs : t_Pat B_dData_dList.t_List) -> ((v_subsumePatList ps) qs))

# 358 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprRef = (fun (mc0 : t_NodeRef) (mc1 : t_Expr) -> (match mc1 with
  | C_Expr_EInterp (dtb__115, dtb__116, dtb__117) -> (C_Expr_EInterp (dtb__115, dtb__116, mc0))
  | C_Expr_EAnn (dtb__118, dtb__119, dtb__120) -> (C_Expr_EAnn (dtb__118, dtb__119, mc0))
  | C_Expr_EDo (dtb__121, dtb__122) -> (C_Expr_EDo (dtb__121, mc0))
  | C_Expr_ERecUpdate (dtb__123, dtb__124, dtb__125) -> (C_Expr_ERecUpdate (dtb__123, dtb__124, mc0))
  | C_Expr_ERecord (dtb__126, dtb__127, dtb__128) -> (C_Expr_ERecord (dtb__126, dtb__127, mc0))
  | C_Expr_EField (dtb__129, dtb__130, dtb__131) -> (C_Expr_EField (dtb__129, dtb__130, mc0))
  | C_Expr_EIf (dtb__132, dtb__133, dtb__134, dtb__135) -> (C_Expr_EIf (dtb__132, dtb__133, dtb__134, mc0))
  | C_Expr_ECase (dtb__136, dtb__137, dtb__138) -> (C_Expr_ECase (dtb__136, dtb__137, mc0))
  | C_Expr_ELocalFun (dtb__139, dtb__140) -> (C_Expr_ELocalFun (dtb__139, mc0))
  | C_Expr_ELet (dtb__141, dtb__142, dtb__143, dtb__144) -> (C_Expr_ELet (dtb__141, dtb__142, dtb__143, mc0))
  | C_Expr_EPi (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, dtb__150) -> (C_Expr_EPi (dtb__145, dtb__146, dtb__147, dtb__148, dtb__149, mc0))
  | C_Expr_EApp (dtb__151, dtb__152, dtb__153) -> (C_Expr_EApp (dtb__151, dtb__152, mc0))
  | C_Expr_ELam (dtb__154, dtb__155, dtb__156) -> (C_Expr_ELam (dtb__154, dtb__155, mc0))
  | C_Expr_EFloat (dtb__157, dtb__158) -> (C_Expr_EFloat (dtb__157, mc0))
  | C_Expr_EStr (dtb__159, dtb__160) -> (C_Expr_EStr (dtb__159, mc0))
  | C_Expr_EInt (dtb__161, dtb__162) -> (C_Expr_EInt (dtb__161, mc0))
  | C_Expr_ESectR (dtb__163, dtb__164, dtb__165) -> (C_Expr_ESectR (dtb__163, dtb__164, mc0))
  | C_Expr_ESectL (dtb__166, dtb__167, dtb__168) -> (C_Expr_ESectL (dtb__166, dtb__167, mc0))
  | C_Expr_ESectOp (dtb__169, dtb__170) -> (C_Expr_ESectOp (dtb__169, mc0))
  | C_Expr_EBacktick (dtb__171, dtb__172, dtb__173, dtb__174) -> (C_Expr_EBacktick (dtb__171, dtb__172, dtb__173, mc0))
  | C_Expr_EParen (dtb__175, dtb__176) -> (C_Expr_EParen (dtb__175, mc0))
  | C_Expr_EInfix (dtb__177, dtb__178, dtb__179, dtb__180) -> (C_Expr_EInfix (dtb__177, dtb__178, dtb__179, mc0))
  | C_Expr_EVar (dtb__181, dtb__182) -> (C_Expr_EVar (dtb__181, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 384 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exprRef = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__183, dtb__184, dtb__185) -> dtb__185
  | C_Expr_EAnn (dtb__186, dtb__187, dtb__188) -> dtb__188
  | C_Expr_EDo (dtb__189, dtb__190) -> dtb__190
  | C_Expr_ERecUpdate (dtb__191, dtb__192, dtb__193) -> dtb__193
  | C_Expr_ERecord (dtb__194, dtb__195, dtb__196) -> dtb__196
  | C_Expr_EField (dtb__197, dtb__198, dtb__199) -> dtb__199
  | C_Expr_EIf (dtb__200, dtb__201, dtb__202, dtb__203) -> dtb__203
  | C_Expr_ECase (dtb__204, dtb__205, dtb__206) -> dtb__206
  | C_Expr_ELocalFun (dtb__207, dtb__208) -> dtb__208
  | C_Expr_ELet (dtb__209, dtb__210, dtb__211, dtb__212) -> dtb__212
  | C_Expr_EPi (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> dtb__218
  | C_Expr_EApp (dtb__219, dtb__220, dtb__221) -> dtb__221
  | C_Expr_ELam (dtb__222, dtb__223, dtb__224) -> dtb__224
  | C_Expr_EFloat (dtb__225, dtb__226) -> dtb__226
  | C_Expr_EStr (dtb__227, dtb__228) -> dtb__228
  | C_Expr_EInt (dtb__229, dtb__230) -> dtb__230
  | C_Expr_ESectR (dtb__231, dtb__232, dtb__233) -> dtb__233
  | C_Expr_ESectL (dtb__234, dtb__235, dtb__236) -> dtb__236
  | C_Expr_ESectOp (dtb__237, dtb__238) -> dtb__238
  | C_Expr_EBacktick (dtb__239, dtb__240, dtb__241, dtb__242) -> dtb__242
  | C_Expr_EParen (dtb__243, dtb__244) -> dtb__244
  | C_Expr_EInfix (dtb__245, dtb__246, dtb__247, dtb__248) -> dtb__248
  | C_Expr_EVar (dtb__249, dtb__250) -> dtb__250
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_exprSpan = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EParen (dtb__251, dtb__252) -> (v_exprSpan dtb__251)
  | _ -> (v_nodeRefSpan (v_exprRef mc0))
))

# 354 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExprId = (fun (nid : int) (e : t_Expr) -> ((v_withExprRef { f_NodeRef_nodeRefId = nid; f_NodeRef_nodeRefSpan = (v_nodeRefSpan (v_exprRef e)) }) e))

# 409 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__253, dtb__254) -> (v_nodeRefSpan dtb__254)
  | C_DoStmt_DExpr (dtb__255, dtb__256) -> (v_nodeRefSpan dtb__256)
  | C_DoStmt_DBind (dtb__257, dtb__258, dtb__259) -> (v_nodeRefSpan dtb__259)
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtRef = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__260, dtb__261) -> dtb__261
  | C_DoStmt_DExpr (dtb__262, dtb__263) -> dtb__263
  | C_DoStmt_DBind (dtb__264, dtb__265, dtb__266) -> dtb__266
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declRef = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__267, dtb__268, dtb__269, dtb__270) -> dtb__270
  | C_Decl_DTrait (dtb__271, dtb__272, dtb__273, dtb__274, dtb__275) -> dtb__275
  | C_Decl_DRecord (dtb__276, dtb__277, dtb__278, dtb__279, dtb__280, dtb__281, dtb__282, dtb__283) -> dtb__283
  | C_Decl_DFun (dtb__284, dtb__285, dtb__286, dtb__287) -> dtb__287
  | C_Decl_DSig (dtb__288, dtb__289, dtb__290, dtb__291) -> dtb__291
  | C_Decl_DExtern (dtb__292, dtb__293, dtb__294, dtb__295) -> dtb__295
  | C_Decl_DAxiom (dtb__296, dtb__297, dtb__298) -> dtb__298
  | C_Decl_DData (dtb__299, dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306, dtb__307) -> dtb__307
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declSpan = (fun (d : t_Decl) -> (v_nodeRefSpan (v_declRef d)))

# 434 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__308; f_Field_fieldType = dtb__309; f_Field_fieldRef = dtb__310 } -> dtb__308
  | _ -> failwith "DT: impossible branch"
))

# 437 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__311; f_Field_fieldType = dtb__312; f_Field_fieldRef = dtb__313 } -> dtb__312
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__314; f_TraitMethod_traitMethodType = dtb__315; f_TraitMethod_traitMethodRef = dtb__316 } -> dtb__314
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Frontend/Ast.vuna"
let v_importSpan = (fun (i : t_Import) -> (v_nodeRefSpan (i).f_Import_importRef))

# 453 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemRef = (fun (mc0 : t_ExportItem) -> (match mc0 with
  | C_ExportItem_XNamespace (dtb__317, dtb__318, dtb__319) -> dtb__319
  | C_ExportItem_XModule (dtb__320, dtb__321) -> dtb__321
  | C_ExportItem_XTypeSome (dtb__322, dtb__323, dtb__324) -> dtb__324
  | C_ExportItem_XTypeAll (dtb__325, dtb__326) -> dtb__326
  | C_ExportItem_XBare (dtb__327, dtb__328) -> dtb__328
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Frontend/Ast.vuna"
let v_withExportItemRef = (fun (mc0 : t_NodeRef) (mc1 : t_ExportItem) -> (match mc1 with
  | C_ExportItem_XNamespace (dtb__329, dtb__330, dtb__331) -> (C_ExportItem_XNamespace (dtb__329, dtb__330, mc0))
  | C_ExportItem_XModule (dtb__332, dtb__333) -> (C_ExportItem_XModule (dtb__332, mc0))
  | C_ExportItem_XTypeSome (dtb__334, dtb__335, dtb__336) -> (C_ExportItem_XTypeSome (dtb__334, dtb__335, mc0))
  | C_ExportItem_XTypeAll (dtb__337, dtb__338) -> (C_ExportItem_XTypeAll (dtb__337, mc0))
  | C_ExportItem_XBare (dtb__339, dtb__340) -> (C_ExportItem_XBare (dtb__339, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemSpan = (fun (item : t_ExportItem) -> (v_nodeRefSpan (v_exportItemRef item)))

# 472 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__341, dtb__342) -> (match dtb__341 with
  | C_Decl_DFun (dtb__343, dtb__344, dtb__345, dtb__346) -> (if (dtb__343 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 }, ((v_collectClauses dtb__342) mc1))) else ((v_collectClauses dtb__342) mc1))
  | _ -> ((v_collectClauses dtb__342) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 483 "Vuna/Compiler/Frontend/Ast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (match dtb__347 with
  | { B_dData_dPair.f_Pair_first = dtb__349; B_dData_dPair.f_Pair_second = dtb__350 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__349)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 489 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__351; f_Ctor_ctorType = dtb__352; f_Ctor_ctorArity = dtb__353; f_Ctor_ctorRef = dtb__354 } -> dtb__351
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 501 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__355; B_dData_dPair.f_Pair_second = dtb__356 } -> (match dtb__355 with
  | B_dData_dList.C_List_Nil -> dtb__356
  | _ -> (match (B_dData_dList.v_reverse dtb__355) with
  | B_dData_dList.C_List_Nil -> dtb__356
  | B_dData_dList.C_List__x58__x58_ (dtb__357, dtb__358) -> (String.concat "" [dtb__357; "."; dtb__356])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 510 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__359; f_Ctor_ctorType = dtb__360; f_Ctor_ctorArity = dtb__361; f_Ctor_ctorRef = dtb__362 } -> dtb__360
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__363, dtb__364, dtb__365) -> (match dtb__363 with
  | C_Expr_EVar (dtb__366, dtb__367) -> (if (dtb__366 = "->") then (match dtb__364 with
  | B_dData_dList.C_List__x58__x58_ (dtb__368, dtb__369) -> (match dtb__369 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (match dtb__371 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__370))
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

# 517 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__372, dtb__373) -> (if ((v_ctorName dtb__372) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__372).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__373))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__374, dtb__375) -> (match dtb__374 with
  | C_Decl_DData (dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384) -> (match ((v_lookupCtorArity mc0) dtb__379) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> (B_dData_dMaybe.C_Maybe_Just (dtb__385))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__375)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392, dtb__393) -> (if (mc0 = dtb__386) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__388))) else ((v_ctorArity mc0) dtb__375))
  | _ -> ((v_ctorArity mc0) dtb__375)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__394, dtb__395, dtb__396, dtb__397) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__398, dtb__399, dtb__400, dtb__401, dtb__402) -> ((B_dData_dList.v_map v_traitMethodName) dtb__401)
  | C_Decl_DRecord (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> (B_dData_dList.C_List__x58__x58_ (dtb__403, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419) -> ((B_dData_dList.v_map v_ctorName) dtb__414)
  | C_Decl_DSig (dtb__420, dtb__421, dtb__422, dtb__423) -> (B_dData_dList.C_List__x58__x58_ (dtb__420, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__424, dtb__425, dtb__426, dtb__427) -> (B_dData_dList.C_List__x58__x58_ (dtb__424, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__428, dtb__429, dtb__430) -> (B_dData_dList.C_List__x58__x58_ (dtb__428, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__431, dtb__432, dtb__433, dtb__434) -> (B_dData_dList.C_List__x58__x58_ (dtb__431, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Frontend/Ast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 550 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__435, dtb__436, dtb__437, dtb__438, dtb__439) -> (B_dData_dList.C_List__x58__x58_ (dtb__435, ((B_dData_dList.v_map v_traitMethodName) dtb__438)))
  | C_Decl_DRecord (dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447) -> (B_dData_dList.C_List__x58__x58_ (dtb__440, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__448, dtb__449, dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456) -> (B_dData_dList.C_List__x58__x58_ (dtb__448, ((B_dData_dList.v_map v_ctorName) dtb__451)))
  | _ -> (v_declNames mc0)
))

# 557 "Vuna/Compiler/Frontend/Ast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461) -> ((B_dData_dList.v_map v_traitMethodName) dtb__460)
  | C_Decl_DRecord (dtb__462, dtb__463, dtb__464, dtb__465, dtb__466, dtb__467, dtb__468, dtb__469) -> (B_dData_dList.C_List__x58__x58_ (dtb__462, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__470, dtb__471, dtb__472, dtb__473, dtb__474, dtb__475, dtb__476, dtb__477, dtb__478) -> ((B_dData_dList.v_map v_ctorName) dtb__473)
  | _ -> B_dData_dList.C_List_Nil
))

# 563 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 566 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__479, dtb__480, dtb__481, dtb__482, dtb__483) -> (B_dData_dList.C_List__x58__x58_ (dtb__479, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__484, dtb__485, dtb__486, dtb__487, dtb__488, dtb__489, dtb__490, dtb__491) -> (B_dData_dList.C_List__x58__x58_ (dtb__484, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__492, dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> (B_dData_dList.C_List__x58__x58_ (dtb__492, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 572 "Vuna/Compiler/Frontend/Ast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 575 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505, dtb__506, dtb__507, dtb__508) -> dtb__504
  | C_Decl_DData (dtb__509, dtb__510, dtb__511, dtb__512, dtb__513, dtb__514, dtb__515, dtb__516, dtb__517) -> dtb__513
  | _ -> B_dData_dList.C_List_Nil
))
