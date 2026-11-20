open Vuna_runtime
type t_Field = { f_Field_fieldName : string; f_Field_fieldType : t_Expr; f_Field_fieldSpan : Base_dSource.t_Span }
and t_TraitMethod = { f_TraitMethod_traitMethodName : string; f_TraitMethod_traitMethodType : t_Expr; f_TraitMethod_traitMethodSpan : Base_dSource.t_Span }
and t_TraitParam = { f_TraitParam_traitParamName : string; f_TraitParam_traitParamKind : t_Expr B_dData_dMaybe.t_Maybe }
and t_Pat = C_Pat_PVar of (string) * (Base_dSource.t_Span) | C_Pat_PAs of (string) * (t_Pat) * (Base_dSource.t_Span) | C_Pat_PWild of (Base_dSource.t_Span) | C_Pat_PCon of (Frontend_dRast_dName.t_RName) * (t_Pat B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Pat_PInt of (int) * (Base_dSource.t_Span) | C_Pat_PStr of (string) * (Base_dSource.t_Span) | C_Pat_PRecord of (Frontend_dRast_dName.t_RName) * ((string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_InterpPart = C_InterpPart_IPText of (string) | C_InterpPart_IPHole of (t_Expr)
and t_Expr = C_Expr_EVar of (Frontend_dRast_dName.t_RName) * (Base_dSource.t_Span) | C_Expr_EInt of (int) * (Base_dSource.t_Span) | C_Expr_EStr of (string) * (Base_dSource.t_Span) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EPi of (string) * (bool) * (Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ELet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (bool) * (Base_dSource.t_Span) | C_Expr_ELocalFun of ((t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ECase of (t_Expr) * ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EField of (t_Expr) * (string) * (Base_dSource.t_Span) | C_Expr_ERecord of (Frontend_dRast_dName.t_RName) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EInfix of (string) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EParen of (t_Expr) * (Base_dSource.t_Span) | C_Expr_EBacktick of (string) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ESectOp of (string) * (Base_dSource.t_Span) | C_Expr_ESectL of (string) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ESectR of (t_Expr) * (string) * (Base_dSource.t_Span) | C_Expr_EAnn of (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EInterp of (bool) * (t_InterpPart B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EFloat of (string) * (Base_dSource.t_Span)
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DExpr of (t_Expr) * (Base_dSource.t_Span)
and t_Ctor = { f_Ctor_ctorName : string; f_Ctor_ctorType : t_Expr; f_Ctor_ctorArity : int; f_Ctor_ctorSpan : Base_dSource.t_Span }
and t_Decl = C_Decl_DData of (string) * (string B_dData_dList.t_List) * (t_Expr) * (t_Ctor B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (Frontend_dAst.t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DAxiom of (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DExtern of (string) * (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DSig of (string) * (t_Expr B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DFun of (string) * (t_Pat B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DRecord of (string) * (string B_dData_dList.t_List) * (t_Field B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (Frontend_dAst.t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DTrait of (string) * (t_TraitParam B_dData_dList.t_List) * (t_Expr B_dData_dList.t_List) * (t_TraitMethod B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Decl_DInstance of (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_Decl B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_SourceFile = { f_SourceFile_sourceFileModDecl : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe; f_SourceFile_sourceFileImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_SourceFile_sourceFileFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_SourceFile_sourceFileDecls : t_Decl B_dData_dList.t_List; f_SourceFile_sourceFileExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_SourceFile_sourceFileReexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List; f_SourceFile_sourceFileOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }

# 141 "Vuna/Compiler/Frontend/Rast.vuna"
let v_patSpan = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__0, dtb__1, dtb__2) -> dtb__2
  | C_Pat_PStr (dtb__3, dtb__4) -> dtb__4
  | C_Pat_PInt (dtb__5, dtb__6) -> dtb__6
  | C_Pat_PCon (dtb__7, dtb__8, dtb__9) -> dtb__9
  | C_Pat_PWild (dtb__10) -> dtb__10
  | C_Pat_PAs (dtb__11, dtb__12, dtb__13) -> dtb__13
  | C_Pat_PVar (dtb__14, dtb__15) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_exprSpan = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__16, dtb__17, dtb__18) -> dtb__18
  | C_Expr_EAnn (dtb__19, dtb__20, dtb__21) -> dtb__21
  | C_Expr_EDo (dtb__22, dtb__23) -> dtb__23
  | C_Expr_ERecUpdate (dtb__24, dtb__25, dtb__26) -> dtb__26
  | C_Expr_ERecord (dtb__27, dtb__28, dtb__29) -> dtb__29
  | C_Expr_EField (dtb__30, dtb__31, dtb__32) -> dtb__32
  | C_Expr_EIf (dtb__33, dtb__34, dtb__35, dtb__36) -> dtb__36
  | C_Expr_ECase (dtb__37, dtb__38, dtb__39) -> dtb__39
  | C_Expr_ELocalFun (dtb__40, dtb__41) -> dtb__41
  | C_Expr_ELet (dtb__42, dtb__43, dtb__44, dtb__45) -> dtb__45
  | C_Expr_EPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50, dtb__51) -> dtb__51
  | C_Expr_EApp (dtb__52, dtb__53, dtb__54) -> dtb__54
  | C_Expr_ELam (dtb__55, dtb__56, dtb__57) -> dtb__57
  | C_Expr_EFloat (dtb__58, dtb__59) -> dtb__59
  | C_Expr_EStr (dtb__60, dtb__61) -> dtb__61
  | C_Expr_EInt (dtb__62, dtb__63) -> dtb__63
  | C_Expr_ESectR (dtb__64, dtb__65, dtb__66) -> dtb__66
  | C_Expr_ESectL (dtb__67, dtb__68, dtb__69) -> dtb__69
  | C_Expr_ESectOp (dtb__70, dtb__71) -> dtb__71
  | C_Expr_EBacktick (dtb__72, dtb__73, dtb__74, dtb__75) -> dtb__75
  | C_Expr_EParen (dtb__76, dtb__77) -> (v_exprSpan dtb__76)
  | C_Expr_EInfix (dtb__78, dtb__79, dtb__80, dtb__81) -> dtb__81
  | C_Expr_EVar (dtb__82, dtb__83) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_patWeight = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__84, dtb__85, dtb__86) -> (1 + (v_patWeightFields dtb__85))
  | C_Pat_PStr (dtb__87, dtb__88) -> 1
  | C_Pat_PInt (dtb__89, dtb__90) -> 1
  | C_Pat_PCon (dtb__91, dtb__92, dtb__93) -> (1 + (v_patWeightList dtb__92))
  | C_Pat_PWild (dtb__94) -> 1
  | C_Pat_PAs (dtb__95, dtb__96, dtb__97) -> (1 + (v_patWeight dtb__96))
  | C_Pat_PVar (dtb__98, dtb__99) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 189 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightList = (fun (mc0 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> ((v_patWeight dtb__100) + (v_patWeightList dtb__101))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 193 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> ((v_patWeight (B_dData_dPair.v_secondOf dtb__102)) + (v_patWeightFields dtb__103))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_exprWeight = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__104, dtb__105, dtb__106) -> (1 + (v_interpWeight dtb__105))
  | C_Expr_EAnn (dtb__107, dtb__108, dtb__109) -> ((1 + (v_exprWeight dtb__107)) + (v_exprWeight dtb__108))
  | C_Expr_EDo (dtb__110, dtb__111) -> (1 + (v_doStmtWeight dtb__110))
  | C_Expr_ERecUpdate (dtb__112, dtb__113, dtb__114) -> ((1 + (v_exprWeight dtb__112)) + (v_exprWeightFields dtb__113))
  | C_Expr_ERecord (dtb__115, dtb__116, dtb__117) -> (1 + (v_exprWeightFields dtb__116))
  | C_Expr_EField (dtb__118, dtb__119, dtb__120) -> (1 + (v_exprWeight dtb__118))
  | C_Expr_EIf (dtb__121, dtb__122, dtb__123, dtb__124) -> (((1 + (v_exprWeight dtb__121)) + (v_exprWeight dtb__122)) + (v_exprWeight dtb__123))
  | C_Expr_ECase (dtb__125, dtb__126, dtb__127) -> ((1 + (v_exprWeight dtb__125)) + (v_patExprWeight dtb__126))
  | C_Expr_ELocalFun (dtb__128, dtb__129) -> (1 + (v_clauseWeight dtb__128))
  | C_Expr_ELet (dtb__130, dtb__131, dtb__132, dtb__133) -> ((1 + (v_patExprWeight dtb__130)) + (v_exprWeight dtb__131))
  | C_Expr_EPi (dtb__134, dtb__135, dtb__136, dtb__137, dtb__138, dtb__139) -> ((1 + (v_exprWeight dtb__137)) + (v_exprWeight dtb__138))
  | C_Expr_EApp (dtb__140, dtb__141, dtb__142) -> ((1 + (v_exprWeight dtb__140)) + (v_exprWeightList dtb__141))
  | C_Expr_ELam (dtb__143, dtb__144, dtb__145) -> (1 + (v_exprWeight dtb__144))
  | C_Expr_ESectR (dtb__146, dtb__147, dtb__148) -> (1 + (v_exprWeight dtb__146))
  | C_Expr_ESectL (dtb__149, dtb__150, dtb__151) -> (1 + (v_exprWeight dtb__150))
  | C_Expr_ESectOp (dtb__152, dtb__153) -> 1
  | C_Expr_EBacktick (dtb__154, dtb__155, dtb__156, dtb__157) -> ((1 + (v_exprWeight dtb__155)) + (v_exprWeight dtb__156))
  | C_Expr_EParen (dtb__158, dtb__159) -> (1 + (v_exprWeight dtb__158))
  | C_Expr_EInfix (dtb__160, dtb__161, dtb__162, dtb__163) -> ((1 + (v_exprWeight dtb__161)) + (v_exprWeight dtb__162))
  | C_Expr_EFloat (dtb__164, dtb__165) -> 1
  | C_Expr_EStr (dtb__166, dtb__167) -> 1
  | C_Expr_EInt (dtb__168, dtb__169) -> 1
  | C_Expr_EVar (dtb__170, dtb__171) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 224 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightList = (fun (mc0 : t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> ((v_exprWeight dtb__172) + (v_exprWeightList dtb__173))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 228 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patExprWeight = (fun (mc0 : (t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (((v_patWeight (B_dData_dPair.v_firstOf dtb__174)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__174))) + (v_patExprWeight dtb__175))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 232 "Vuna/Compiler/Frontend/Rast.vuna"
and v_clauseWeight = (fun (mc0 : (t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (((v_patWeightList (B_dData_dPair.v_firstOf dtb__176)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__176))) + (v_clauseWeight dtb__177))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 236 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightFields = (fun (mc0 : (string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> ((v_exprWeight (B_dData_dPair.v_secondOf dtb__178)) + (v_exprWeightFields dtb__179))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 240 "Vuna/Compiler/Frontend/Rast.vuna"
and v_doStmtWeight = (fun (mc0 : t_DoStmt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> ((v_oneDoStmtWeight dtb__180) + (v_doStmtWeight dtb__181))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 244 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneDoStmtWeight = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DExpr (dtb__182, dtb__183) -> (1 + (v_exprWeight dtb__182))
  | C_DoStmt_DBind (dtb__184, dtb__185, dtb__186) -> ((1 + (v_patWeight dtb__184)) + (v_exprWeight dtb__185))
  | _ -> failwith "DT: impossible branch"
))
# 248 "Vuna/Compiler/Frontend/Rast.vuna"
and v_interpWeight = (fun (mc0 : t_InterpPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> ((v_oneInterpWeight dtb__187) + (v_interpWeight dtb__188))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 252 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneInterpWeight = (fun (mc0 : t_InterpPart) -> (match mc0 with
  | C_InterpPart_IPHole (dtb__189) -> (1 + (v_exprWeight dtb__189))
  | C_InterpPart_IPText (dtb__190) -> 1
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exprBudget = (fun (base : int) (e : t_Expr) -> (base + (8 * (v_exprWeight e))))

# 261 "Vuna/Compiler/Frontend/Rast.vuna"
let v_patBudget = (fun (base : int) (p : t_Pat) -> (base + (8 * (v_patWeight p))))

# 264 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DExpr (dtb__191, dtb__192) -> dtb__192
  | C_DoStmt_DBind (dtb__193, dtb__194, dtb__195) -> dtb__195
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doStmtExpr = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DExpr (dtb__196, dtb__197) -> dtb__196
  | C_DoStmt_DBind (dtb__198, dtb__199, dtb__200) -> dtb__199
  | _ -> failwith "DT: impossible branch"
))

# 272 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declSpan = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__201, dtb__202, dtb__203, dtb__204) -> dtb__204
  | C_Decl_DTrait (dtb__205, dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__209
  | C_Decl_DRecord (dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217) -> dtb__217
  | C_Decl_DFun (dtb__218, dtb__219, dtb__220, dtb__221) -> dtb__221
  | C_Decl_DSig (dtb__222, dtb__223, dtb__224, dtb__225) -> dtb__225
  | C_Decl_DExtern (dtb__226, dtb__227, dtb__228, dtb__229) -> dtb__229
  | C_Decl_DAxiom (dtb__230, dtb__231, dtb__232) -> dtb__232
  | C_Decl_DData (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241) -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorSpan = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__242; f_Ctor_ctorType = dtb__243; f_Ctor_ctorArity = dtb__244; f_Ctor_ctorSpan = dtb__245 } -> dtb__245
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldSpan = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__246; f_Field_fieldType = dtb__247; f_Field_fieldSpan = dtb__248 } -> dtb__248
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__249; f_Field_fieldType = dtb__250; f_Field_fieldSpan = dtb__251 } -> dtb__249
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__252; f_Field_fieldType = dtb__253; f_Field_fieldSpan = dtb__254 } -> dtb__253
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__255; f_TraitMethod_traitMethodType = dtb__256; f_TraitMethod_traitMethodSpan = dtb__257 } -> dtb__255
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodSpan = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__258; f_TraitMethod_traitMethodType = dtb__259; f_TraitMethod_traitMethodSpan = dtb__260 } -> dtb__260
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exportItemSpan = (fun (mc0 : Frontend_dAst.t_ExportItem) -> (match mc0 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__261, dtb__262, dtb__263) -> dtb__263
  | Frontend_dAst.C_ExportItem_XModule (dtb__264, dtb__265) -> dtb__265
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__266, dtb__267, dtb__268) -> dtb__268
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__269, dtb__270) -> dtb__270
  | Frontend_dAst.C_ExportItem_XBare (dtb__271, dtb__272) -> dtb__272
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__273, dtb__274) -> (match dtb__273 with
  | C_Decl_DFun (dtb__275, dtb__276, dtb__277, dtb__278) -> (if (dtb__275 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = dtb__277 }, ((v_collectClauses dtb__274) mc1))) else ((v_collectClauses dtb__274) mc1))
  | _ -> ((v_collectClauses dtb__274) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Frontend/Rast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 318 "Vuna/Compiler/Frontend/Rast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__279, dtb__280) -> (match dtb__279 with
  | { B_dData_dPair.f_Pair_first = dtb__281; B_dData_dPair.f_Pair_second = dtb__282 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__281)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_clausesFor decls) name)))

# 324 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__283; f_Ctor_ctorType = dtb__284; f_Ctor_ctorArity = dtb__285; f_Ctor_ctorSpan = dtb__286 } -> dtb__283
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 336 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorDisplayName = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__287; B_dData_dPair.f_Pair_second = dtb__288 } -> (match dtb__287 with
  | B_dData_dList.C_List_Nil -> dtb__288
  | _ -> (match (B_dData_dList.v_reverse dtb__287) with
  | B_dData_dList.C_List_Nil -> dtb__288
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> (String.concat "" [dtb__289; "."; dtb__288])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 345 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__291; f_Ctor_ctorType = dtb__292; f_Ctor_ctorArity = dtb__293; f_Ctor_ctorSpan = dtb__294 } -> dtb__292
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__295, dtb__296, dtb__297) -> (match dtb__295 with
  | C_Expr_EVar (dtb__298, dtb__299) -> (match dtb__298 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__300) -> (if (dtb__300 = "->") then (match dtb__296 with
  | B_dData_dList.C_List__x58__x58_ (dtb__301, dtb__302) -> (match dtb__302 with
  | B_dData_dList.C_List__x58__x58_ (dtb__303, dtb__304) -> (match dtb__304 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__303))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
))

# 352 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__305, dtb__306) -> (if ((v_ctorName dtb__305) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__305).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__306))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (match dtb__307 with
  | C_Decl_DData (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315, dtb__316, dtb__317) -> (match ((v_lookupCtorArity mc0) dtb__312) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__318) -> (B_dData_dMaybe.C_Maybe_Just (dtb__318))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__308)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> (if (mc0 = dtb__319) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__321))) else ((v_ctorArity mc0) dtb__308))
  | _ -> ((v_ctorArity mc0) dtb__308)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 369 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__327, dtb__328, dtb__329, dtb__330) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335) -> ((B_dData_dList.v_map v_traitMethodName) dtb__334)
  | C_Decl_DRecord (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> (B_dData_dList.C_List__x58__x58_ (dtb__336, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> ((B_dData_dList.v_map v_ctorName) dtb__347)
  | C_Decl_DSig (dtb__353, dtb__354, dtb__355, dtb__356) -> (B_dData_dList.C_List__x58__x58_ (dtb__353, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__357, dtb__358, dtb__359, dtb__360) -> (B_dData_dList.C_List__x58__x58_ (dtb__357, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__361, dtb__362, dtb__363) -> (B_dData_dList.C_List__x58__x58_ (dtb__361, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__364, dtb__365, dtb__366, dtb__367) -> (B_dData_dList.C_List__x58__x58_ (dtb__364, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Rast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 385 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__368, dtb__369, dtb__370, dtb__371, dtb__372) -> (B_dData_dList.C_List__x58__x58_ (dtb__368, ((B_dData_dList.v_map v_traitMethodName) dtb__371)))
  | C_Decl_DRecord (dtb__373, dtb__374, dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380) -> (B_dData_dList.C_List__x58__x58_ (dtb__373, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__381, dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (B_dData_dList.C_List__x58__x58_ (dtb__381, ((B_dData_dList.v_map v_ctorName) dtb__384)))
  | _ -> (v_declNames mc0)
))

# 392 "Vuna/Compiler/Frontend/Rast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> ((B_dData_dList.v_map v_traitMethodName) dtb__393)
  | C_Decl_DRecord (dtb__395, dtb__396, dtb__397, dtb__398, dtb__399, dtb__400, dtb__401, dtb__402) -> (B_dData_dList.C_List__x58__x58_ (dtb__395, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410, dtb__411) -> ((B_dData_dList.v_map v_ctorName) dtb__406)
  | _ -> B_dData_dList.C_List_Nil
))

# 398 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 401 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> (B_dData_dList.C_List__x58__x58_ (dtb__412, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> (B_dData_dList.C_List__x58__x58_ (dtb__417, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__425, dtb__426, dtb__427, dtb__428, dtb__429, dtb__430, dtb__431, dtb__432, dtb__433) -> (B_dData_dList.C_List__x58__x58_ (dtb__425, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 407 "Vuna/Compiler/Frontend/Rast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 410 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__434, dtb__435, dtb__436, dtb__437, dtb__438, dtb__439, dtb__440, dtb__441) -> dtb__437
  | C_Decl_DData (dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448, dtb__449, dtb__450) -> dtb__446
  | _ -> B_dData_dList.C_List_Nil
))

# 424 "Vuna/Compiler/Frontend/Rast.vuna"
let v_holeNamed = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__451, dtb__452) -> (if (dtb__451 = 63) then (match dtb__452 with
  | B_dData_dList.C_List__x58__x58_ (dtb__453, dtb__454) -> true
  | _ -> false
) else false)
  | _ -> false
)) (B_dData_dList.dtp_unpack name)))

# 421 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isHoleName = (fun (name : string) -> (if (name = "_") then true else (v_holeNamed name)))

# 431 "Vuna/Compiler/Frontend/Rast.vuna"
let v_holeNameOf = (fun (name : string) -> (if (v_holeNamed name) then name else ""))

# 441 "Vuna/Compiler/Frontend/Rast.vuna"
let v_internalNamePrefix = "@vuna@"

# 445 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overCtorPrefix = "@vuna@ctor@"

# 449 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isInternalSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_internalNamePrefix) name))

# 453 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_dropNChars = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__455, dtb__456) -> ((v_dropNChars (n - 1)) dtb__456)
  | _ -> failwith "DT: impossible branch"
)))

# 463 "Vuna/Compiler/Frontend/Rast.vuna"
let v_dropNamePrefix = (fun (p : string) (name : string) -> (if ((B_dData_dString.v_startsWith p) name) then (B_dData_dList.dtp_pack ((v_dropNChars (bi_strLength p)) (B_dData_dList.dtp_unpack name))) else name))

# 468 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_joinWithAt = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__457, dtb__458) -> (match dtb__458 with
  | B_dData_dList.C_List_Nil -> dtb__457
  | _ -> (String.concat "" [dtb__457; "@"; (v_joinWithAt dtb__458)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overCtorName = (fun (short : string) (targets : string B_dData_dList.t_List) -> (String.concat "" [v_overCtorPrefix; short; "@"; (v_joinWithAt targets)]))

# 478 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overCtorShort = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overCtorPrefix) name)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__459, dtb__460) -> dtb__459
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overCtorTargets = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overCtorPrefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__461, dtb__462) -> dtb__462
  | _ -> failwith "DT: impossible branch"
))

# 492 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isOverCtorName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_overCtorPrefix) name))

# 496 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overValuePrefix = "@vuna@value@"

# 499 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overValueName = (fun (short : string) (targets : string B_dData_dList.t_List) -> (String.concat "" [v_overValuePrefix; short; "@"; (v_joinWithAt targets)]))

# 502 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overValueShort = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overValuePrefix) name)) with
  | B_dData_dList.C_List_Nil -> ""
  | B_dData_dList.C_List__x58__x58_ (dtb__463, dtb__464) -> dtb__463
  | _ -> failwith "DT: impossible branch"
))

# 508 "Vuna/Compiler/Frontend/Rast.vuna"
let v_overValueTargets = (fun (name : string) -> (match ((Base_dSource.v_splitOnChar 64) ((v_dropNamePrefix v_overValuePrefix) name)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__465, dtb__466) -> dtb__466
  | _ -> failwith "DT: impossible branch"
))

# 514 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isOverValueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_overValuePrefix) name))

# 520 "Vuna/Compiler/Frontend/Rast.vuna"
let v_listNilSyntax = "@vuna@list@nil"

# 524 "Vuna/Compiler/Frontend/Rast.vuna"
let v_listConsSyntax = "@vuna@list@cons"

# 528 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isListNilSyntax = (fun (name : string) -> (name = v_listNilSyntax))

# 532 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isListConsSyntax = (fun (name : string) -> (name = v_listConsSyntax))

# 554 "Vuna/Compiler/Frontend/Rast.vuna"
let v_performSyntax = "@vuna@perform"

# 558 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isPerformSyntax = (fun (name : string) -> (name = v_performSyntax))

# 570 "Vuna/Compiler/Frontend/Rast.vuna"
let v_handleSyntax = "@vuna@handle"

# 574 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isHandleSyntax = (fun (name : string) -> (name = v_handleSyntax))

# 578 "Vuna/Compiler/Frontend/Rast.vuna"
let v_handleNoRetSyntax = "@vuna@handle@noret"

# 582 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isHandleNoRetSyntax = (fun (name : string) -> (name = v_handleNoRetSyntax))

# 588 "Vuna/Compiler/Frontend/Rast.vuna"
let v_rowAtSyntax = "@vuna@row@at"

# 592 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isRowAtSyntax = (fun (name : string) -> (name = v_rowAtSyntax))

# 599 "Vuna/Compiler/Frontend/Rast.vuna"
let v_appAtSyntax = "@vuna@app@at"

# 603 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isAppAtSyntax = (fun (name : string) -> (name = v_appAtSyntax))

# 608 "Vuna/Compiler/Frontend/Rast.vuna"
let v_instArgSyntax = "@vuna@inst@arg"

# 612 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isInstArgSyntax = (fun (name : string) -> (name = v_instArgSyntax))

# 624 "Vuna/Compiler/Frontend/Rast.vuna"
let v_macroSyntaxPrefix = "@vuna@macro@"

# 628 "Vuna/Compiler/Frontend/Rast.vuna"
let v_macroSyntaxName = (fun (name : string) -> (v_macroSyntaxPrefix ^ name))

# 632 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isMacroSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_macroSyntaxPrefix) name))

# 636 "Vuna/Compiler/Frontend/Rast.vuna"
let v_macroNameOf = (fun (name : string) -> (if (v_isMacroSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_macroSyntaxPrefix) name))) else B_dData_dMaybe.C_Maybe_Nothing))

# 641 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doBindSyntaxPrefix = "@vuna@do@bind@"

# 645 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 649 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doBindSyntaxName = (fun (canonical : string) -> (v_doBindSyntaxPrefix ^ canonical))

# 653 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doIgnoreSyntaxName = (fun (canonical : string) -> (v_doIgnoreSyntaxPrefix ^ canonical))

# 657 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isDoBindSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_doBindSyntaxPrefix) name))

# 661 "Vuna/Compiler/Frontend/Rast.vuna"
let v_isDoIgnoreSyntaxName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_doIgnoreSyntaxPrefix) name))

# 666 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doSyntaxCanonical = (fun (name : string) -> (if (v_isDoBindSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_doBindSyntaxPrefix) name))) else (if (v_isDoIgnoreSyntaxName name) then (B_dData_dMaybe.C_Maybe_Just (((v_dropNamePrefix v_doIgnoreSyntaxPrefix) name))) else B_dData_dMaybe.C_Maybe_Nothing)))

# 682 "Vuna/Compiler/Frontend/Rast.vuna"
let v_nameOf = (fun (scope : string B_dData_dList.t_List) (name : string) -> (if ((B_dData_dList.v_memName name) scope) then (Frontend_dRast_dName.C_RName_RLocal (name)) else (Frontend_dRast_dName.v_classifyName name)))

# 733 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofPat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__467, dtb__468, dtb__469) -> (C_Pat_PRecord (((v_nameOf mc0) dtb__467), ((B_dData_dList.v_map (v_ofPatField mc0)) dtb__468), dtb__469))
  | Frontend_dAst.C_Pat_PStr (dtb__470, dtb__471) -> (C_Pat_PStr (dtb__470, dtb__471))
  | Frontend_dAst.C_Pat_PInt (dtb__472, dtb__473) -> (C_Pat_PInt (dtb__472, dtb__473))
  | Frontend_dAst.C_Pat_PCon (dtb__474, dtb__475, dtb__476) -> (C_Pat_PCon (((v_nameOf mc0) dtb__474), ((B_dData_dList.v_map (v_ofPat mc0)) dtb__475), dtb__476))
  | Frontend_dAst.C_Pat_PWild (dtb__477) -> (C_Pat_PWild (dtb__477))
  | Frontend_dAst.C_Pat_PAs (dtb__478, dtb__479, dtb__480) -> (C_Pat_PAs (dtb__478, ((v_ofPat mc0) dtb__479), dtb__480))
  | Frontend_dAst.C_Pat_PVar (dtb__481, dtb__482) -> (C_Pat_PVar (dtb__481, dtb__482))
  | _ -> failwith "DT: impossible branch"
))
# 743 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofPatField = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = dtb__484 } -> { B_dData_dPair.f_Pair_first = dtb__483; B_dData_dPair.f_Pair_second = ((v_ofPat mc0) dtb__484) }
  | _ -> failwith "DT: impossible branch"
))

# 747 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_patBinders = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__485, dtb__486, dtb__487) -> ((B_dData_dList.v_concatMap v_patFieldBinders) dtb__486)
  | Frontend_dAst.C_Pat_PStr (dtb__488, dtb__489) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__490, dtb__491) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__492, dtb__493, dtb__494) -> ((B_dData_dList.v_concatMap v_patBinders) dtb__493)
  | Frontend_dAst.C_Pat_PWild (dtb__495) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__496, dtb__497, dtb__498) -> (B_dData_dList.C_List__x58__x58_ (dtb__496, (v_patBinders dtb__497)))
  | Frontend_dAst.C_Pat_PVar (dtb__499, dtb__500) -> (B_dData_dList.C_List__x58__x58_ (dtb__499, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 823 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patFieldBinders = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__501; B_dData_dPair.f_Pair_second = dtb__502 } -> (v_patBinders dtb__502)
  | _ -> failwith "DT: impossible branch"
))

# 756 "Vuna/Compiler/Frontend/Rast.vuna"
let v_bindersOfPats = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_patBinders) pats))

# 826 "Vuna/Compiler/Frontend/Rast.vuna"
let v_bindingBinders = (fun (mc0 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__503; B_dData_dPair.f_Pair_second = dtb__504 } -> (v_patBinders dtb__503)
  | _ -> failwith "DT: impossible branch"
))

# 760 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofExpr = (fun (scope : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__505, dtb__506) -> (C_Expr_EVar (((v_nameOf scope) dtb__505), dtb__506))
  | Frontend_dAst.C_Expr_EInt (dtb__507, dtb__508) -> (C_Expr_EInt (dtb__507, dtb__508))
  | Frontend_dAst.C_Expr_EStr (dtb__509, dtb__510) -> (C_Expr_EStr (dtb__509, dtb__510))
  | Frontend_dAst.C_Expr_EFloat (dtb__511, dtb__512) -> (C_Expr_EFloat (dtb__511, dtb__512))
  | Frontend_dAst.C_Expr_EInterp (dtb__513, dtb__514, dtb__515) -> (C_Expr_EInterp (dtb__513, ((B_dData_dList.v_map (v_ofInterpPart scope)) dtb__514), dtb__515))
  | Frontend_dAst.C_Expr_ELam (dtb__516, dtb__517, dtb__518) -> (C_Expr_ELam (dtb__516, ((v_ofExpr ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__516)) scope)) dtb__517), dtb__518))
  | Frontend_dAst.C_Expr_EApp (dtb__519, dtb__520, dtb__521) -> (C_Expr_EApp (((v_ofExpr scope) dtb__519), ((B_dData_dList.v_map (v_ofExpr scope)) dtb__520), dtb__521))
  | Frontend_dAst.C_Expr_EPi (dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527) -> (C_Expr_EPi (dtb__522, dtb__523, dtb__524, ((v_ofExpr scope) dtb__525), ((v_ofExpr (B_dData_dList.C_List__x58__x58_ (dtb__522, scope))) dtb__526), dtb__527))
  | Frontend_dAst.C_Expr_ELet (dtb__528, dtb__529, dtb__530, dtb__531) -> ((fun bound -> (C_Expr_ELet (((B_dData_dList.v_map ((v_ofBinding bound) scope)) dtb__528), ((v_ofExpr bound) dtb__529), dtb__530, dtb__531))) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__528)) scope))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__532, dtb__533) -> (C_Expr_ELocalFun (((B_dData_dList.v_map (v_ofLocalClause scope)) dtb__532), dtb__533))
  | Frontend_dAst.C_Expr_ECase (dtb__534, dtb__535, dtb__536) -> (C_Expr_ECase (((v_ofExpr scope) dtb__534), ((B_dData_dList.v_map (v_ofAlt scope)) dtb__535), dtb__536))
  | Frontend_dAst.C_Expr_EIf (dtb__537, dtb__538, dtb__539, dtb__540) -> (C_Expr_EIf (((v_ofExpr scope) dtb__537), ((v_ofExpr scope) dtb__538), ((v_ofExpr scope) dtb__539), dtb__540))
  | Frontend_dAst.C_Expr_EField (dtb__541, dtb__542, dtb__543) -> (C_Expr_EField (((v_ofExpr scope) dtb__541), dtb__542, dtb__543))
  | Frontend_dAst.C_Expr_ERecord (dtb__544, dtb__545, dtb__546) -> (C_Expr_ERecord (((v_nameOf scope) dtb__544), ((B_dData_dList.v_map (v_ofFieldValue scope)) dtb__545), dtb__546))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__547, dtb__548, dtb__549) -> (C_Expr_ERecUpdate (((v_ofExpr scope) dtb__547), ((B_dData_dList.v_map (v_ofFieldValue scope)) dtb__548), dtb__549))
  | Frontend_dAst.C_Expr_EDo (dtb__550, dtb__551) -> (C_Expr_EDo (((v_ofStmts scope) dtb__550), dtb__551))
  | Frontend_dAst.C_Expr_EInfix (dtb__552, dtb__553, dtb__554, dtb__555) -> (C_Expr_EInfix (dtb__552, ((v_ofExpr scope) dtb__553), ((v_ofExpr scope) dtb__554), dtb__555))
  | Frontend_dAst.C_Expr_EParen (dtb__556, dtb__557) -> (C_Expr_EParen (((v_ofExpr scope) dtb__556), dtb__557))
  | Frontend_dAst.C_Expr_EBacktick (dtb__558, dtb__559, dtb__560, dtb__561) -> (C_Expr_EBacktick (dtb__558, ((v_ofExpr scope) dtb__559), ((v_ofExpr scope) dtb__560), dtb__561))
  | Frontend_dAst.C_Expr_ESectOp (dtb__562, dtb__563) -> (C_Expr_ESectOp (dtb__562, dtb__563))
  | Frontend_dAst.C_Expr_ESectL (dtb__564, dtb__565, dtb__566) -> (C_Expr_ESectL (dtb__564, ((v_ofExpr scope) dtb__565), dtb__566))
  | Frontend_dAst.C_Expr_ESectR (dtb__567, dtb__568, dtb__569) -> (C_Expr_ESectR (((v_ofExpr scope) dtb__567), dtb__568, dtb__569))
  | Frontend_dAst.C_Expr_EAnn (dtb__570, dtb__571, dtb__572) -> (C_Expr_EAnn (((v_ofExpr scope) dtb__570), ((v_ofExpr scope) dtb__571), dtb__572))
  | _ -> failwith "DT: impossible branch"
))
# 794 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofBinding = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc2 with
  | { B_dData_dPair.f_Pair_first = dtb__573; B_dData_dPair.f_Pair_second = dtb__574 } -> ((fun valueScope -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc1) dtb__573); B_dData_dPair.f_Pair_second = ((v_ofExpr valueScope) dtb__574) }) ((B_dData_dList.v_append (v_patBinders dtb__573)) mc0))
  | _ -> failwith "DT: impossible branch"
))
# 800 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofLocalClause = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__575; B_dData_dPair.f_Pair_second = dtb__576 } -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (v_ofPat mc0)) dtb__575); B_dData_dPair.f_Pair_second = ((v_ofExpr ((B_dData_dList.v_append (v_bindersOfPats dtb__575)) mc0)) dtb__576) }
  | _ -> failwith "DT: impossible branch"
))
# 804 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofAlt = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__577; B_dData_dPair.f_Pair_second = dtb__578 } -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__577); B_dData_dPair.f_Pair_second = ((v_ofExpr ((B_dData_dList.v_append (v_patBinders dtb__577)) mc0)) dtb__578) }
  | _ -> failwith "DT: impossible branch"
))
# 807 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofFieldValue = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = dtb__580 } -> { B_dData_dPair.f_Pair_first = dtb__579; B_dData_dPair.f_Pair_second = ((v_ofExpr mc0) dtb__580) }
  | _ -> failwith "DT: impossible branch"
))
# 810 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofInterpPart = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__581) -> (C_InterpPart_IPHole (((v_ofExpr mc0) dtb__581)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__582) -> (C_InterpPart_IPText (dtb__582))
  | _ -> failwith "DT: impossible branch"
))
# 814 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofStmts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__583, dtb__584) -> (match dtb__583 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__585, dtb__586, dtb__587) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DBind (((v_ofPat mc0) dtb__585), ((v_ofExpr mc0) dtb__586), dtb__587)), ((v_ofStmts ((B_dData_dList.v_append (v_patBinders dtb__585)) mc0)) dtb__584)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__588, dtb__589) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DExpr (((v_ofExpr mc0) dtb__588), dtb__589)), ((v_ofStmts mc0) dtb__584)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 723 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofCtor = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__590; Frontend_dAst.f_Ctor_ctorType = dtb__591; Frontend_dAst.f_Ctor_ctorArity = dtb__592; Frontend_dAst.f_Ctor_ctorSpan = dtb__593 } -> { f_Ctor_ctorName = dtb__590; f_Ctor_ctorType = ((v_ofExpr mc0) dtb__591); f_Ctor_ctorArity = dtb__592; f_Ctor_ctorSpan = dtb__593 }
  | _ -> failwith "DT: impossible branch"
))

# 726 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofField = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__594; Frontend_dAst.f_Field_fieldType = dtb__595; Frontend_dAst.f_Field_fieldSpan = dtb__596 } -> { f_Field_fieldName = dtb__594; f_Field_fieldType = ((v_ofExpr mc0) dtb__595); f_Field_fieldSpan = dtb__596 }
  | _ -> failwith "DT: impossible branch"
))

# 729 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitMethod = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__597; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__598; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__599 } -> { f_TraitMethod_traitMethodName = dtb__597; f_TraitMethod_traitMethodType = ((v_ofExpr mc0) dtb__598); f_TraitMethod_traitMethodSpan = dtb__599 }
  | _ -> failwith "DT: impossible branch"
))

# 829 "Vuna/Compiler/Frontend/Rast.vuna"
let v_astTraitParamName = (fun (p : Frontend_dAst.t_TraitParam) -> (p).Frontend_dAst.f_TraitParam_traitParamName)

# 835 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofMaybeExpr = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__600) -> (B_dData_dMaybe.C_Maybe_Just (((v_ofExpr mc0) dtb__600)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 832 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitParam = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_TraitParam) -> (match mc1 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__601; Frontend_dAst.f_TraitParam_traitParamKind = dtb__602 } -> { f_TraitParam_traitParamName = dtb__601; f_TraitParam_traitParamKind = ((v_ofMaybeExpr mc0) dtb__602) }
  | _ -> failwith "DT: impossible branch"
))

# 690 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofDecl = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__603, dtb__604, dtb__605, dtb__606) -> (C_Decl_DInstance (((B_dData_dList.v_map (v_ofExpr mc0)) dtb__603), ((v_ofExpr mc0) dtb__604), ((B_dData_dList.v_map (v_ofDecl mc0)) dtb__605), dtb__606))
  | Frontend_dAst.C_Decl_DTrait (dtb__607, dtb__608, dtb__609, dtb__610, dtb__611) -> ((fun bound -> (C_Decl_DTrait (dtb__607, ((B_dData_dList.v_map (v_ofTraitParam bound)) dtb__608), ((B_dData_dList.v_map (v_ofExpr bound)) dtb__609), ((B_dData_dList.v_map (v_ofTraitMethod bound)) dtb__610), dtb__611))) ((B_dData_dList.v_append ((B_dData_dList.v_map v_astTraitParamName) dtb__608)) mc0))
  | Frontend_dAst.C_Decl_DRecord (dtb__612, dtb__613, dtb__614, dtb__615, dtb__616, dtb__617, dtb__618, dtb__619) -> (C_Decl_DRecord (dtb__612, dtb__613, ((B_dData_dList.v_map (v_ofField ((B_dData_dList.v_append dtb__613) mc0))) dtb__614), dtb__615, dtb__616, dtb__617, dtb__618, dtb__619))
  | Frontend_dAst.C_Decl_DFun (dtb__620, dtb__621, dtb__622, dtb__623) -> ((fun bound -> (C_Decl_DFun (dtb__620, ((B_dData_dList.v_map (v_ofPat mc0)) dtb__621), ((v_ofExpr bound) dtb__622), dtb__623))) ((B_dData_dList.v_append (v_bindersOfPats dtb__621)) mc0))
  | Frontend_dAst.C_Decl_DSig (dtb__624, dtb__625, dtb__626, dtb__627) -> (C_Decl_DSig (dtb__624, ((B_dData_dList.v_map (v_ofExpr mc0)) dtb__625), ((v_ofExpr mc0) dtb__626), dtb__627))
  | Frontend_dAst.C_Decl_DExtern (dtb__628, dtb__629, dtb__630, dtb__631) -> (C_Decl_DExtern (dtb__628, dtb__629, ((v_ofExpr mc0) dtb__630), dtb__631))
  | Frontend_dAst.C_Decl_DAxiom (dtb__632, dtb__633, dtb__634) -> (C_Decl_DAxiom (dtb__632, ((v_ofExpr mc0) dtb__633), dtb__634))
  | Frontend_dAst.C_Decl_DData (dtb__635, dtb__636, dtb__637, dtb__638, dtb__639, dtb__640, dtb__641, dtb__642, dtb__643) -> (C_Decl_DData (dtb__635, dtb__636, ((v_ofExpr ((B_dData_dList.v_append dtb__636) mc0)) dtb__637), ((B_dData_dList.v_map (v_ofCtor ((B_dData_dList.v_append dtb__636) mc0))) dtb__638), dtb__639, dtb__640, dtb__641, dtb__642, dtb__643))
  | _ -> failwith "DT: impossible branch"
))

# 686 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_ofDecl B_dData_dList.C_List_Nil)) decls))
