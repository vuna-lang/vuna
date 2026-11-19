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
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DExpr of (t_Expr) * (Base_dSource.t_Span)
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

# 45 "Vuna/Compiler/Frontend/Ast.vuna"
let v_qtyIsZero = (fun (mc0 : t_Qty) -> (match mc0 with
  | C_Qty_Q1 -> false
  | C_Qty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Frontend/Ast.vuna"
let v_reprPrefix = (fun (mc0 : t_ReprTier) -> (match mc0 with
  | C_ReprTier_ReprBoxed -> "boxed "
  | C_ReprTier_ReprAlias -> "alias "
  | C_ReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fixitySpan = (fun (mc0 : t_FixityDecl) -> (match mc0 with
  | { f_FixityDecl_fixityOp = dtb__0; f_FixityDecl_fixityLevel = dtb__1; f_FixityDecl_fixityAssoc = dtb__2; f_FixityDecl_fixitySpan = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecName = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__4, dtb__5, dtb__6) -> dtb__4
  | C_ExportSpec_ESValue (dtb__7, dtb__8) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportSpecSpan = (fun (mc0 : t_ExportSpec) -> (match mc0 with
  | C_ExportSpec_ESType (dtb__9, dtb__10, dtb__11) -> dtb__11
  | C_ExportSpec_ESValue (dtb__12, dtb__13) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecName = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__14; f_OpacitySpec_opacityKind = dtb__15; f_OpacitySpec_opacitySpan = dtb__16 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Ast.vuna"
let v_opacitySpecSpan = (fun (mc0 : t_OpacitySpec) -> (match mc0 with
  | { f_OpacitySpec_opacityName = dtb__17; f_OpacitySpec_opacityKind = dtb__18; f_OpacitySpec_opacitySpan = dtb__19 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Frontend/Ast.vuna"
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

# 237 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_exprSpan = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__36, dtb__37, dtb__38) -> dtb__38
  | C_Expr_EAnn (dtb__39, dtb__40, dtb__41) -> dtb__41
  | C_Expr_EDo (dtb__42, dtb__43) -> dtb__43
  | C_Expr_ERecUpdate (dtb__44, dtb__45, dtb__46) -> dtb__46
  | C_Expr_ERecord (dtb__47, dtb__48, dtb__49) -> dtb__49
  | C_Expr_EField (dtb__50, dtb__51, dtb__52) -> dtb__52
  | C_Expr_EIf (dtb__53, dtb__54, dtb__55, dtb__56) -> dtb__56
  | C_Expr_ECase (dtb__57, dtb__58, dtb__59) -> dtb__59
  | C_Expr_ELocalFun (dtb__60, dtb__61) -> dtb__61
  | C_Expr_ELet (dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__65
  | C_Expr_EPi (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> dtb__71
  | C_Expr_EApp (dtb__72, dtb__73, dtb__74) -> dtb__74
  | C_Expr_ELam (dtb__75, dtb__76, dtb__77) -> dtb__77
  | C_Expr_EFloat (dtb__78, dtb__79) -> dtb__79
  | C_Expr_EStr (dtb__80, dtb__81) -> dtb__81
  | C_Expr_EInt (dtb__82, dtb__83) -> dtb__83
  | C_Expr_ESectR (dtb__84, dtb__85, dtb__86) -> dtb__86
  | C_Expr_ESectL (dtb__87, dtb__88, dtb__89) -> dtb__89
  | C_Expr_ESectOp (dtb__90, dtb__91) -> dtb__91
  | C_Expr_EBacktick (dtb__92, dtb__93, dtb__94, dtb__95) -> dtb__95
  | C_Expr_EParen (dtb__96, dtb__97) -> (v_exprSpan dtb__96)
  | C_Expr_EInfix (dtb__98, dtb__99, dtb__100, dtb__101) -> dtb__101
  | C_Expr_EVar (dtb__102, dtb__103) -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DExpr (dtb__104, dtb__105) -> dtb__105
  | C_DoStmt_DBind (dtb__106, dtb__107, dtb__108) -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doStmtExpr = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DExpr (dtb__109, dtb__110) -> dtb__109
  | C_DoStmt_DBind (dtb__111, dtb__112, dtb__113) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declSpan = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__114, dtb__115, dtb__116, dtb__117) -> dtb__117
  | C_Decl_DTrait (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | C_Decl_DRecord (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> dtb__130
  | C_Decl_DFun (dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__134
  | C_Decl_DSig (dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__138
  | C_Decl_DExtern (dtb__139, dtb__140, dtb__141, dtb__142) -> dtb__142
  | C_Decl_DAxiom (dtb__143, dtb__144, dtb__145) -> dtb__145
  | C_Decl_DData (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> dtb__154
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorSpan = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__155; f_Ctor_ctorType = dtb__156; f_Ctor_ctorArity = dtb__157; f_Ctor_ctorSpan = dtb__158 } -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldSpan = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__159; f_Field_fieldType = dtb__160; f_Field_fieldSpan = dtb__161 } -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__162; f_Field_fieldType = dtb__163; f_Field_fieldSpan = dtb__164 } -> dtb__162
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Frontend/Ast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__165; f_Field_fieldType = dtb__166; f_Field_fieldSpan = dtb__167 } -> dtb__166
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__168; f_TraitMethod_traitMethodType = dtb__169; f_TraitMethod_traitMethodSpan = dtb__170 } -> dtb__168
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Frontend/Ast.vuna"
let v_traitMethodSpan = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__171; f_TraitMethod_traitMethodType = dtb__172; f_TraitMethod_traitMethodSpan = dtb__173 } -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Frontend/Ast.vuna"
let v_exportItemSpan = (fun (mc0 : t_ExportItem) -> (match mc0 with
  | C_ExportItem_XNamespace (dtb__174, dtb__175, dtb__176) -> dtb__176
  | C_ExportItem_XModule (dtb__177, dtb__178) -> dtb__178
  | C_ExportItem_XTypeSome (dtb__179, dtb__180, dtb__181) -> dtb__181
  | C_ExportItem_XTypeAll (dtb__182, dtb__183) -> dtb__183
  | C_ExportItem_XBare (dtb__184, dtb__185) -> dtb__185
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__186, dtb__187) -> (match dtb__186 with
  | C_Decl_DFun (dtb__188, dtb__189, dtb__190, dtb__191) -> (if (dtb__188 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__189; B_dData_dPair.f_Pair_second = dtb__190 }, ((v_collectClauses dtb__187) mc1))) else ((v_collectClauses dtb__187) mc1))
  | _ -> ((v_collectClauses dtb__187) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Frontend/Ast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 322 "Vuna/Compiler/Frontend/Ast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__194)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_clausesFor decls) name)))

# 328 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__196; f_Ctor_ctorType = dtb__197; f_Ctor_ctorArity = dtb__198; f_Ctor_ctorSpan = dtb__199 } -> dtb__196
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 340 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorDisplayName = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (match dtb__200 with
  | B_dData_dList.C_List_Nil -> dtb__201
  | _ -> (match (B_dData_dList.v_reverse dtb__200) with
  | B_dData_dList.C_List_Nil -> dtb__201
  | B_dData_dList.C_List__x58__x58_ (dtb__202, dtb__203) -> (String.concat "" [dtb__202; "."; dtb__201])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 349 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__204; f_Ctor_ctorType = dtb__205; f_Ctor_ctorArity = dtb__206; f_Ctor_ctorSpan = dtb__207 } -> dtb__205
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__208, dtb__209, dtb__210) -> (match dtb__208 with
  | C_Expr_EVar (dtb__211, dtb__212) -> (if (dtb__211 = "->") then (match dtb__209 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (match dtb__214 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (match dtb__216 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__215))
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

# 356 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__217, dtb__218) -> (if ((v_ctorName dtb__217) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__217).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__218))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (match dtb__219 with
  | C_Decl_DData (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> (match ((v_lookupCtorArity mc0) dtb__224) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__230) -> (B_dData_dMaybe.C_Maybe_Just (dtb__230))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__220)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238) -> (if (mc0 = dtb__231) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__233))) else ((v_ctorArity mc0) dtb__220))
  | _ -> ((v_ctorArity mc0) dtb__220)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__239, dtb__240, dtb__241, dtb__242) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__243, dtb__244, dtb__245, dtb__246, dtb__247) -> ((B_dData_dList.v_map v_traitMethodName) dtb__246)
  | C_Decl_DRecord (dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255) -> (B_dData_dList.C_List__x58__x58_ (dtb__248, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> ((B_dData_dList.v_map v_ctorName) dtb__259)
  | C_Decl_DSig (dtb__265, dtb__266, dtb__267, dtb__268) -> (B_dData_dList.C_List__x58__x58_ (dtb__265, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__269, dtb__270, dtb__271, dtb__272) -> (B_dData_dList.C_List__x58__x58_ (dtb__269, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__273, dtb__274, dtb__275) -> (B_dData_dList.C_List__x58__x58_ (dtb__273, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__276, dtb__277, dtb__278, dtb__279) -> (B_dData_dList.C_List__x58__x58_ (dtb__276, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Frontend/Ast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 389 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> (B_dData_dList.C_List__x58__x58_ (dtb__280, ((B_dData_dList.v_map v_traitMethodName) dtb__283)))
  | C_Decl_DRecord (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (B_dData_dList.C_List__x58__x58_ (dtb__285, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> (B_dData_dList.C_List__x58__x58_ (dtb__293, ((B_dData_dList.v_map v_ctorName) dtb__296)))
  | _ -> (v_declNames mc0)
))

# 396 "Vuna/Compiler/Frontend/Ast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306) -> ((B_dData_dList.v_map v_traitMethodName) dtb__305)
  | C_Decl_DRecord (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> (B_dData_dList.C_List__x58__x58_ (dtb__307, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323) -> ((B_dData_dList.v_map v_ctorName) dtb__318)
  | _ -> B_dData_dList.C_List_Nil
))

# 402 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 405 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328) -> (B_dData_dList.C_List__x58__x58_ (dtb__324, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (B_dData_dList.C_List__x58__x58_ (dtb__329, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345) -> (B_dData_dList.C_List__x58__x58_ (dtb__337, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 411 "Vuna/Compiler/Frontend/Ast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 414 "Vuna/Compiler/Frontend/Ast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> dtb__349
  | C_Decl_DData (dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362) -> dtb__358
  | _ -> B_dData_dList.C_List_Nil
))

# 428 "Vuna/Compiler/Frontend/Ast.vuna"
let v_holeNamed = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__363, dtb__364) -> (if (dtb__363 = 63) then (match dtb__364 with
  | B_dData_dList.C_List__x58__x58_ (dtb__365, dtb__366) -> true
  | _ -> false
) else false)
  | _ -> false
)) (B_dData_dList.dtp_unpack name)))

# 425 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isHoleName = (fun (name : string) -> (if (name = "_") then true else (v_holeNamed name)))

# 435 "Vuna/Compiler/Frontend/Ast.vuna"
let v_holeNameOf = (fun (name : string) -> (if (v_holeNamed name) then name else ""))

# 445 "Vuna/Compiler/Frontend/Ast.vuna"
let v_internalNamePrefix = "@vuna@"

# 449 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overCtorPrefix = "@vuna@ctor@"

# 453 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isInternalSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_internalNamePrefix) name))

# 457 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_dropNChars = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> ((v_dropNChars (n - 1)) dtb__368)
  | _ -> failwith "DT: impossible branch"
)))

# 467 "Vuna/Compiler/Frontend/Ast.vuna"
let v_dropNamePrefix = (fun (p : string) (name : string) -> (if ((B_dData_dString.v_startsWith p) name) then (B_dData_dList.dtp_pack ((v_dropNChars (bi_strLength p)) (B_dData_dList.dtp_unpack name))) else name))

# 472 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_joinWithAt = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__369, dtb__370) -> (match dtb__370 with
  | B_dData_dList.C_List_Nil -> dtb__369
  | _ -> (String.concat "" [dtb__369; "@"; (v_joinWithAt dtb__370)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overCtorName = (fun (short : string) (targets : string B_dData_dList.t_List) -> (String.concat "" [v_overCtorPrefix; short; "@"; (v_joinWithAt targets)]))

# 482 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overCtorShort = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overCtorPrefix) name)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> dtb__371
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overCtorTargets = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overCtorPrefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> dtb__374
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isOverCtorName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_overCtorPrefix) name))

# 500 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overValuePrefix = "@vuna@value@"

# 503 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overValueName = (fun (short : string) (targets : string B_dData_dList.t_List) -> (String.concat "" [v_overValuePrefix; short; "@"; (v_joinWithAt targets)]))

# 506 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overValueShort = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overValuePrefix) name)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> dtb__375
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Frontend/Ast.vuna"
let v_overValueTargets = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overValuePrefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__377, dtb__378) -> dtb__378
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isOverValueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_overValuePrefix) name))

# 524 "Vuna/Compiler/Frontend/Ast.vuna"
let v_listNilSyntax = "@vuna@list@nil"

# 528 "Vuna/Compiler/Frontend/Ast.vuna"
let v_listConsSyntax = "@vuna@list@cons"

# 532 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isListNilSyntax = (fun (name : string) -> (name = v_listNilSyntax))

# 536 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isListConsSyntax = (fun (name : string) -> (name = v_listConsSyntax))

# 542 "Vuna/Compiler/Frontend/Ast.vuna"
let v_tuplePairSyntax = "@vuna@tuple@pair"

# 546 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isTuplePairSyntax = (fun (name : string) -> (name = v_tuplePairSyntax))

# 550 "Vuna/Compiler/Frontend/Ast.vuna"
let v_tupleUnitSyntax = "@vuna@tuple@unit"

# 554 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isTupleUnitSyntax = (fun (name : string) -> (name = v_tupleUnitSyntax))

# 560 "Vuna/Compiler/Frontend/Ast.vuna"
let v_ascribeSyntax = "@vuna@ascribe"

# 564 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isAscribeSyntax = (fun (name : string) -> (name = v_ascribeSyntax))

# 586 "Vuna/Compiler/Frontend/Ast.vuna"
let v_performSyntax = "@vuna@perform"

# 590 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isPerformSyntax = (fun (name : string) -> (name = v_performSyntax))

# 602 "Vuna/Compiler/Frontend/Ast.vuna"
let v_handleSyntax = "@vuna@handle"

# 606 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isHandleSyntax = (fun (name : string) -> (name = v_handleSyntax))

# 610 "Vuna/Compiler/Frontend/Ast.vuna"
let v_handleNoRetSyntax = "@vuna@handle@noret"

# 614 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isHandleNoRetSyntax = (fun (name : string) -> (name = v_handleNoRetSyntax))

# 620 "Vuna/Compiler/Frontend/Ast.vuna"
let v_rowAtSyntax = "@vuna@row@at"

# 624 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isRowAtSyntax = (fun (name : string) -> (name = v_rowAtSyntax))

# 631 "Vuna/Compiler/Frontend/Ast.vuna"
let v_appAtSyntax = "@vuna@app@at"

# 635 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isAppAtSyntax = (fun (name : string) -> (name = v_appAtSyntax))

# 640 "Vuna/Compiler/Frontend/Ast.vuna"
let v_instArgSyntax = "@vuna@inst@arg"

# 644 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isInstArgSyntax = (fun (name : string) -> (name = v_instArgSyntax))

# 656 "Vuna/Compiler/Frontend/Ast.vuna"
let v_macroSyntaxPrefix = "@vuna@macro@"

# 660 "Vuna/Compiler/Frontend/Ast.vuna"
let v_macroSyntaxName = (fun (name : string) -> (v_macroSyntaxPrefix ^ name))

# 664 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isMacroSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_macroSyntaxPrefix) name))

# 668 "Vuna/Compiler/Frontend/Ast.vuna"
let v_macroNameOf = (fun (name : string) -> (if (v_isMacroSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_macroSyntaxPrefix) name))) else B_dData_dMaybe.C_Maybe_Nothing))

# 673 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doBindSyntaxPrefix = "@vuna@do@bind@"

# 677 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 681 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doBindSyntaxName = (fun (canonical : string) -> (v_doBindSyntaxPrefix ^ canonical))

# 685 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doIgnoreSyntaxName = (fun (canonical : string) -> (v_doIgnoreSyntaxPrefix ^ canonical))

# 689 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isDoBindSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_doBindSyntaxPrefix) name))

# 693 "Vuna/Compiler/Frontend/Ast.vuna"
let v_isDoIgnoreSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_doIgnoreSyntaxPrefix) name))

# 698 "Vuna/Compiler/Frontend/Ast.vuna"
let v_doSyntaxCanonical = (fun (name : string) -> (if (v_isDoBindSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_doBindSyntaxPrefix) name))) else (if (v_isDoIgnoreSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_doIgnoreSyntaxPrefix) name))) else B_dData_dMaybe.C_Maybe_Nothing)))
