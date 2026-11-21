open Vuna_runtime
type t_Field = { f_Field_fieldName : string; f_Field_fieldType : t_Expr; f_Field_fieldSpan : Base_dSource.t_Span }
and t_TraitMethod = { f_TraitMethod_traitMethodName : string; f_TraitMethod_traitMethodType : t_Expr; f_TraitMethod_traitMethodSpan : Base_dSource.t_Span }
and t_TraitParam = { f_TraitParam_traitParamName : string; f_TraitParam_traitParamKind : t_Expr B_dData_dMaybe.t_Maybe }
and t_Pat = C_Pat_PVar of (string) * (Base_dSource.t_Span) | C_Pat_PAs of (string) * (t_Pat) * (Base_dSource.t_Span) | C_Pat_PWild of (Base_dSource.t_Span) | C_Pat_PCon of (string) * (t_Pat B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Pat_PInt of (int) * (Base_dSource.t_Span) | C_Pat_PStr of (string) * (Base_dSource.t_Span) | C_Pat_PRecord of (string) * ((string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_InterpPart = C_InterpPart_IPText of (string) | C_InterpPart_IPHole of (t_Expr)
and t_Qty = C_Qty_Q0 | C_Qty_Q1
and t_ReprTier = C_ReprTier_ReprAuto | C_ReprTier_ReprAlias | C_ReprTier_ReprBoxed
and t_Expr = C_Expr_EVar of (string) * (Base_dSource.t_Span) | C_Expr_EInt of (int) * (Base_dSource.t_Span) | C_Expr_EStr of (string) * (Base_dSource.t_Span) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EPi of (string) * (bool) * (t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ELet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (bool) * (Base_dSource.t_Span) | C_Expr_ELocalFun of ((t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ECase of (t_Expr) * ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EField of (t_Expr) * (string) * (Base_dSource.t_Span) | C_Expr_ERecord of (string) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EInfix of (string) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EParen of (t_Expr) * (Base_dSource.t_Span) | C_Expr_EBacktick of (string) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ESectOp of (string) * (Base_dSource.t_Span) | C_Expr_ESectL of (string) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ESectR of (t_Expr) * (string) * (Base_dSource.t_Span) | C_Expr_EAnn of (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EInterp of (bool) * (t_InterpPart B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EFloat of (string) * (Base_dSource.t_Span)
and t_FixityDecl = { f_FixityDecl_fixityOp : string; f_FixityDecl_fixityLevel : int; f_FixityDecl_fixityAssoc : int; f_FixityDecl_fixitySpan : Base_dSource.t_Span }
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DExpr of (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DLet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_Ctor = { f_Ctor_ctorName : string; f_Ctor_ctorType : t_Expr; f_Ctor_ctorArity : int; f_Ctor_ctorSpan : Base_dSource.t_Span }
and t_Decl = C_Decl_DData of (string) * (string B_dData_dList.t_List) * (t_Expr) * (t_Ctor B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DAxiom of (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DExtern of (string) * (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DSig of (string) * (t_Expr B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DFun of (string) * (t_Pat B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DRecord of (string) * (string B_dData_dList.t_List) * (t_Field B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DTrait of (string) * (t_TraitParam B_dData_dList.t_List) * (t_Expr B_dData_dList.t_List) * (t_TraitMethod B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Decl_DInstance of (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_Decl B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_ExportItem = C_ExportItem_XBare of (string) * (Base_dSource.t_Span) | C_ExportItem_XTypeAll of (string) * (Base_dSource.t_Span) | C_ExportItem_XTypeSome of (string) * (string B_dData_dList.t_List) * (Base_dSource.t_Span) | C_ExportItem_XModule of (string) * (Base_dSource.t_Span) | C_ExportItem_XNamespace of (string) * (string B_dData_dMaybe.t_Maybe) * (Base_dSource.t_Span)
and t_ExportMembers = C_ExportMembers_EMNone | C_ExportMembers_EMAll | C_ExportMembers_EMOnly of (string B_dData_dList.t_List)
and t_ExportSpec = C_ExportSpec_ESValue of (string) * (Base_dSource.t_Span) | C_ExportSpec_ESType of (string) * (t_ExportMembers) * (Base_dSource.t_Span)
and t_Opacity = C_Opacity_OpacityOpaque | C_Opacity_OpacityTransparent | C_Opacity_OpacityAbstract
and t_OpacitySpec = { f_OpacitySpec_opacityName : string; f_OpacitySpec_opacityKind : t_Opacity; f_OpacitySpec_opacitySpan : Base_dSource.t_Span }
and t_ModDecl = { f_ModDecl_modDeclName : string; f_ModDecl_modDeclHasExportList : bool; f_ModDecl_modDeclExportItems : t_ExportItem B_dData_dList.t_List; f_ModDecl_modDeclExports : t_ExportSpec B_dData_dList.t_List; f_ModDecl_modDeclReexports : t_ExportItem B_dData_dList.t_List; f_ModDecl_modDeclOpacity : t_OpacitySpec B_dData_dList.t_List; f_ModDecl_modDeclSpan : Base_dSource.t_Span }
and t_SourceFile = { f_SourceFile_sourceFileModDecl : t_ModDecl B_dData_dMaybe.t_Maybe; f_SourceFile_sourceFileImports : t_Import B_dData_dList.t_List; f_SourceFile_sourceFileFixities : t_FixityDecl B_dData_dList.t_List; f_SourceFile_sourceFileDecls : t_Decl B_dData_dList.t_List; f_SourceFile_sourceFileExports : t_ExportSpec B_dData_dList.t_List; f_SourceFile_sourceFileReexports : t_ExportItem B_dData_dList.t_List; f_SourceFile_sourceFileOpacity : t_OpacitySpec B_dData_dList.t_List }
and t_Import = { f_Import_importName : string; f_Import_importIsQualified : bool; f_Import_importAlias : string B_dData_dMaybe.t_Maybe; f_Import_importSpan : Base_dSource.t_Span }

# 49 "Vuna/Compiler/Frontend/Ast.vuna"
let v_qtyIsZero = (fun (mc0 : t_Qty) -> (match mc0 with
  | C_Qty_Q1 -> false
  | C_Qty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Ast.vuna"
let v_reprPrefix = (fun (mc0 : t_ReprTier) -> (match mc0 with
  | C_ReprTier_ReprBoxed -> "boxed "
  | C_ReprTier_ReprAlias -> "alias "
  | C_ReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixitySpan = (fun (mc0 : t_FixityDecl) -> (match mc0 with
  | { f_FixityDecl_fixityOp = dtb__0; f_FixityDecl_fixityLevel = dtb__1; f_FixityDecl_fixityAssoc = dtb__2; f_FixityDecl_fixitySpan = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecName = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__4, dtb__5, dtb__6) -> dtb__4
  | C_ExportSpec_ESValue (dtb__7, dtb__8) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecSpan = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__9, dtb__10, dtb__11) -> dtb__11
  | C_ExportSpec_ESValue (dtb__12, dtb__13) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecName = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__14; f_OpacitySpec_opacityKind = dtb__15; f_OpacitySpec_opacitySpan = dtb__16 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecSpan = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__17; f_OpacitySpec_opacityKind = dtb__18; f_OpacitySpec_opacitySpan = dtb__19 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Frontend/Ast.vuna"
let v_patSpan = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__20, dtb__21, dtb__22) -> dtb__22
  | C_Pat_PStr (dtb__23, dtb__24) -> dtb__24
  | C_Pat_PInt (dtb__25, dtb__26) -> dtb__26
  | C_Pat_PCon (dtb__27, dtb__28, dtb__29) -> dtb__29
  | C_Pat_PWild (dtb__30) -> dtb__30
  | C_Pat_PAs (dtb__31, dtb__32, dtb__33) -> dtb__33
  | C_Pat_PVar (dtb__34, dtb__35) -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_fieldPatOf = (fun (mc0 : string) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__36 with
  | { B_dData_dPair.f_Pair_first = dtb__38; B_dData_dPair.f_Pair_second = dtb__39 } -> (if (dtb__38 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__39)) else ((v_fieldPatOf mc0) dtb__37))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 247 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_patSubsumes = (fun (mc0 : t_Pat) (mc1 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__40, dtb__41, dtb__42) -> (match mc1 with
  | C_Pat_PRecord (dtb__43, dtb__44, dtb__45) -> (if (dtb__40 = dtb__43) then ((v_subsumePatFields dtb__41) dtb__44) else false)
  | C_Pat_PAs (dtb__46, dtb__47, dtb__48) -> ((v_patSubsumes mc0) dtb__47)
  | _ -> false
)
  | C_Pat_PStr (dtb__49, dtb__50) -> (match mc1 with
  | C_Pat_PStr (dtb__51, dtb__52) -> (dtb__49 = dtb__51)
  | C_Pat_PAs (dtb__53, dtb__54, dtb__55) -> ((v_patSubsumes mc0) dtb__54)
  | _ -> false
)
  | C_Pat_PInt (dtb__56, dtb__57) -> (match mc1 with
  | C_Pat_PInt (dtb__58, dtb__59) -> (dtb__56 = dtb__58)
  | C_Pat_PAs (dtb__60, dtb__61, dtb__62) -> ((v_patSubsumes mc0) dtb__61)
  | _ -> false
)
  | C_Pat_PCon (dtb__63, dtb__64, dtb__65) -> (match mc1 with
  | C_Pat_PCon (dtb__66, dtb__67, dtb__68) -> (if (dtb__63 = dtb__66) then ((v_subsumePatList dtb__64) dtb__67) else false)
  | C_Pat_PAs (dtb__69, dtb__70, dtb__71) -> ((v_patSubsumes mc0) dtb__70)
  | _ -> false
)
  | C_Pat_PAs (dtb__72, dtb__73, dtb__74) -> ((v_patSubsumes dtb__73) mc1)
  | C_Pat_PWild (dtb__75) -> true
  | C_Pat_PVar (dtb__76, dtb__77) -> true
  | _ -> failwith "DT: impossible branch"
))
# 261 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatList = (fun (mc0 : t_Pat B_dData_dList.t_List) (mc1 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (if ((v_patSubsumes dtb__78) dtb__80) then ((v_subsumePatList dtb__79) dtb__81) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
# 267 "Vuna/Compiler/Frontend/Ast.vuna"
and v_subsumePatFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__82 with
  | { B_dData_dPair.f_Pair_first = dtb__84; B_dData_dPair.f_Pair_second = dtb__85 } -> (match ((v_fieldPatOf dtb__84) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (if ((v_patSubsumes dtb__85) dtb__86) then ((v_subsumePatFields dtb__83) mc1) else false)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_subsumePatFields dtb__83) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clauseSubsumedBy = (fun (ps : t_Pat B_dData_dList.t_List) (qs : t_Pat B_dData_dList.t_List) -> ((v_subsumePatList ps) qs))

# 283 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_exprSpan = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__87, dtb__88, dtb__89) -> dtb__89
  | C_Expr_EAnn (dtb__90, dtb__91, dtb__92) -> dtb__92
  | C_Expr_EDo (dtb__93, dtb__94) -> dtb__94
  | C_Expr_ERecUpdate (dtb__95, dtb__96, dtb__97) -> dtb__97
  | C_Expr_ERecord (dtb__98, dtb__99, dtb__100) -> dtb__100
  | C_Expr_EField (dtb__101, dtb__102, dtb__103) -> dtb__103
  | C_Expr_EIf (dtb__104, dtb__105, dtb__106, dtb__107) -> dtb__107
  | C_Expr_ECase (dtb__108, dtb__109, dtb__110) -> dtb__110
  | C_Expr_ELocalFun (dtb__111, dtb__112) -> dtb__112
  | C_Expr_ELet (dtb__113, dtb__114, dtb__115, dtb__116) -> dtb__116
  | C_Expr_EPi (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | C_Expr_EApp (dtb__123, dtb__124, dtb__125) -> dtb__125
  | C_Expr_ELam (dtb__126, dtb__127, dtb__128) -> dtb__128
  | C_Expr_EFloat (dtb__129, dtb__130) -> dtb__130
  | C_Expr_EStr (dtb__131, dtb__132) -> dtb__132
  | C_Expr_EInt (dtb__133, dtb__134) -> dtb__134
  | C_Expr_ESectR (dtb__135, dtb__136, dtb__137) -> dtb__137
  | C_Expr_ESectL (dtb__138, dtb__139, dtb__140) -> dtb__140
  | C_Expr_ESectOp (dtb__141, dtb__142) -> dtb__142
  | C_Expr_EBacktick (dtb__143, dtb__144, dtb__145, dtb__146) -> dtb__146
  | C_Expr_EParen (dtb__147, dtb__148) -> (v_exprSpan dtb__147)
  | C_Expr_EInfix (dtb__149, dtb__150, dtb__151, dtb__152) -> dtb__152
  | C_Expr_EVar (dtb__153, dtb__154) -> dtb__154
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__155, dtb__156) -> dtb__156
  | C_DoStmt_DExpr (dtb__157, dtb__158) -> dtb__158
  | C_DoStmt_DBind (dtb__159, dtb__160, dtb__161) -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declSpan = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__162, dtb__163, dtb__164, dtb__165) -> dtb__165
  | C_Decl_DTrait (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> dtb__170
  | C_Decl_DRecord (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178) -> dtb__178
  | C_Decl_DFun (dtb__179, dtb__180, dtb__181, dtb__182) -> dtb__182
  | C_Decl_DSig (dtb__183, dtb__184, dtb__185, dtb__186) -> dtb__186
  | C_Decl_DExtern (dtb__187, dtb__188, dtb__189, dtb__190) -> dtb__190
  | C_Decl_DAxiom (dtb__191, dtb__192, dtb__193) -> dtb__193
  | C_Decl_DData (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorSpan = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__203; f_Ctor_ctorType = dtb__204; f_Ctor_ctorArity = dtb__205; f_Ctor_ctorSpan = dtb__206 } -> dtb__206
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldSpan = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__207; f_Field_fieldType = dtb__208; f_Field_fieldSpan = dtb__209 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__210; f_Field_fieldType = dtb__211; f_Field_fieldSpan = dtb__212 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__213; f_Field_fieldType = dtb__214; f_Field_fieldSpan = dtb__215 } -> dtb__214
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__216; f_TraitMethod_traitMethodType = dtb__217; f_TraitMethod_traitMethodSpan = dtb__218 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodSpan = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__219; f_TraitMethod_traitMethodType = dtb__220; f_TraitMethod_traitMethodSpan = dtb__221 } -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemSpan = (fun (mc0 : t_ExportItem) -> (match mc0 with
  | C_ExportItem_XNamespace (dtb__222, dtb__223, dtb__224) -> dtb__224
  | C_ExportItem_XModule (dtb__225, dtb__226) -> dtb__226
  | C_ExportItem_XTypeSome (dtb__227, dtb__228, dtb__229) -> dtb__229
  | C_ExportItem_XTypeAll (dtb__230, dtb__231) -> dtb__231
  | C_ExportItem_XBare (dtb__232, dtb__233) -> dtb__233
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (match dtb__234 with
  | C_Decl_DFun (dtb__236, dtb__237, dtb__238, dtb__239) -> (if (dtb__236 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = dtb__238 }, ((v_collectClauses dtb__235) mc1))) else ((v_collectClauses dtb__235) mc1))
  | _ -> ((v_collectClauses dtb__235) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 365 "Vuna/Compiler/Frontend/Ast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__240, dtb__241) -> (match dtb__240 with
  | { B_dData_dPair.f_Pair_first = dtb__242; B_dData_dPair.f_Pair_second = dtb__243 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__242)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 371 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__244; f_Ctor_ctorType = dtb__245; f_Ctor_ctorArity = dtb__246; f_Ctor_ctorSpan = dtb__247 } -> dtb__244
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 383 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__248; B_dData_dPair.f_Pair_second = dtb__249 } -> (match dtb__248 with
  | B_dData_dList.C_List_Nil -> dtb__249
  | _ -> (match (B_dData_dList.v_reverse dtb__248) with
  | B_dData_dList.C_List_Nil -> dtb__249
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (String.concat "" [dtb__250; "."; dtb__249])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 392 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__252; f_Ctor_ctorType = dtb__253; f_Ctor_ctorArity = dtb__254; f_Ctor_ctorSpan = dtb__255 } -> dtb__253
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__256, dtb__257, dtb__258) -> (match dtb__256 with
  | C_Expr_EVar (dtb__259, dtb__260) -> (if (dtb__259 = "->") then (match dtb__257 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (match dtb__262 with
  | B_dData_dList.C_List__x58__x58_ (dtb__263, dtb__264) -> (match dtb__264 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__263))
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

# 399 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (if ((v_ctorName dtb__265) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__265).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__266))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__268) -> (match dtb__267 with
  | C_Decl_DData (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (match ((v_lookupCtorArity mc0) dtb__272) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (B_dData_dMaybe.C_Maybe_Just (dtb__278))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__268)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__279, dtb__280, dtb__281, dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> (if (mc0 = dtb__279) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__281))) else ((v_ctorArity mc0) dtb__268))
  | _ -> ((v_ctorArity mc0) dtb__268)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__287, dtb__288, dtb__289, dtb__290) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295) -> ((B_dData_dList.v_map v_traitMethodName) dtb__294)
  | C_Decl_DRecord (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> (B_dData_dList.C_List__x58__x58_ (dtb__296, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__304, dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> ((B_dData_dList.v_map v_ctorName) dtb__307)
  | C_Decl_DSig (dtb__313, dtb__314, dtb__315, dtb__316) -> (B_dData_dList.C_List__x58__x58_ (dtb__313, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__317, dtb__318, dtb__319, dtb__320) -> (B_dData_dList.C_List__x58__x58_ (dtb__317, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__321, dtb__322, dtb__323) -> (B_dData_dList.C_List__x58__x58_ (dtb__321, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__324, dtb__325, dtb__326, dtb__327) -> (B_dData_dList.C_List__x58__x58_ (dtb__324, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Frontend/Ast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 432 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332) -> (B_dData_dList.C_List__x58__x58_ (dtb__328, ((B_dData_dList.v_map v_traitMethodName) dtb__331)))
  | C_Decl_DRecord (dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340) -> (B_dData_dList.C_List__x58__x58_ (dtb__333, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349) -> (B_dData_dList.C_List__x58__x58_ (dtb__341, ((B_dData_dList.v_map v_ctorName) dtb__344)))
  | _ -> (v_declNames mc0)
))

# 439 "Vuna/Compiler/Frontend/Ast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> ((B_dData_dList.v_map v_traitMethodName) dtb__353)
  | C_Decl_DRecord (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362) -> (B_dData_dList.C_List__x58__x58_ (dtb__355, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__363, dtb__364, dtb__365, dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371) -> ((B_dData_dList.v_map v_ctorName) dtb__366)
  | _ -> B_dData_dList.C_List_Nil
))

# 445 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 448 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> (B_dData_dList.C_List__x58__x58_ (dtb__372, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384) -> (B_dData_dList.C_List__x58__x58_ (dtb__377, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390, dtb__391, dtb__392, dtb__393) -> (B_dData_dList.C_List__x58__x58_ (dtb__385, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 454 "Vuna/Compiler/Frontend/Ast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 457 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> dtb__397
  | C_Decl_DData (dtb__402, dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410) -> dtb__406
  | _ -> B_dData_dList.C_List_Nil
))
