open Vuna_runtime
type t_Field = { f_Field_fieldName : string; f_Field_fieldType : t_Expr; f_Field_fieldSpan : Base_dSource.t_Span }
and t_TraitMethod = { f_TraitMethod_traitMethodName : string; f_TraitMethod_traitMethodType : t_Expr; f_TraitMethod_traitMethodSpan : Base_dSource.t_Span }
and t_TraitParam = { f_TraitParam_traitParamName : string; f_TraitParam_traitParamKind : t_Expr B_dData_dMaybe.t_Maybe }
and t_Pat = C_Pat_PVar of (string) * (Base_dSource.t_Span) | C_Pat_PAs of (string) * (t_Pat) * (Base_dSource.t_Span) | C_Pat_PWild of (Base_dSource.t_Span) | C_Pat_PCon of (Frontend_dRast_dName.t_RName) * (t_Pat B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Pat_PInt of (int) * (Base_dSource.t_Span) | C_Pat_PStr of (string) * (Base_dSource.t_Span) | C_Pat_PRecord of (Frontend_dRast_dName.t_RName) * ((string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_InterpPart = C_InterpPart_IPText of (string) | C_InterpPart_IPHole of (t_Expr)
and t_Expr = C_Expr_EVar of (Frontend_dRast_dName.t_RName) * (Base_dSource.t_Span) | C_Expr_EInt of (int) * (Base_dSource.t_Span) | C_Expr_EStr of (string) * (Base_dSource.t_Span) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EPi of (string) * (bool) * (Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ELet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (bool) * (Base_dSource.t_Span) | C_Expr_ELocalFun of ((t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ECase of (t_Expr) * ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EField of (t_Expr) * (string) * (Base_dSource.t_Span) | C_Expr_ERecord of (Frontend_dRast_dName.t_RName) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EInfix of (string) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EParen of (t_Expr) * (Base_dSource.t_Span) | C_Expr_EBacktick of (string) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ESectOp of (string) * (Base_dSource.t_Span) | C_Expr_ESectL of (string) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ESectR of (t_Expr) * (string) * (Base_dSource.t_Span) | C_Expr_EAnn of (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EInterp of (bool) * (t_InterpPart B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EFloat of (string) * (Base_dSource.t_Span)
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DExpr of (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DLet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_Ctor = { f_Ctor_ctorName : string; f_Ctor_ctorType : t_Expr; f_Ctor_ctorArity : int; f_Ctor_ctorSpan : Base_dSource.t_Span }
and t_Decl = C_Decl_DData of (string) * (string B_dData_dList.t_List) * (t_Expr) * (t_Ctor B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (Frontend_dAst.t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DAxiom of (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DExtern of (string) * (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DSig of (string) * (t_Expr B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DFun of (string) * (t_Pat B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DRecord of (string) * (string B_dData_dList.t_List) * (t_Field B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (Frontend_dAst.t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DTrait of (string) * (t_TraitParam B_dData_dList.t_List) * (t_Expr B_dData_dList.t_List) * (t_TraitMethod B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Decl_DInstance of (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_Decl B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_SourceFile = { f_SourceFile_sourceFileModDecl : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe; f_SourceFile_sourceFileImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_SourceFile_sourceFileFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_SourceFile_sourceFileDecls : t_Decl B_dData_dList.t_List; f_SourceFile_sourceFileExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_SourceFile_sourceFileReexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List; f_SourceFile_sourceFileOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }

# 146 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 155 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 185 "Vuna/Compiler/Frontend/Rast.vuna"
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
# 194 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightList = (fun (mc0 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> ((v_patWeight dtb__100) + (v_patWeightList dtb__101))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 198 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> ((v_patWeight (B_dData_dPair.v_secondOf dtb__102)) + (v_patWeightFields dtb__103))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Frontend/Rast.vuna"
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
# 229 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightList = (fun (mc0 : t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> ((v_exprWeight dtb__172) + (v_exprWeightList dtb__173))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 233 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patExprWeight = (fun (mc0 : (t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (((v_patWeight (B_dData_dPair.v_firstOf dtb__174)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__174))) + (v_patExprWeight dtb__175))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 237 "Vuna/Compiler/Frontend/Rast.vuna"
and v_clauseWeight = (fun (mc0 : (t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> (((v_patWeightList (B_dData_dPair.v_firstOf dtb__176)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__176))) + (v_clauseWeight dtb__177))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 241 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightFields = (fun (mc0 : (string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> ((v_exprWeight (B_dData_dPair.v_secondOf dtb__178)) + (v_exprWeightFields dtb__179))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 245 "Vuna/Compiler/Frontend/Rast.vuna"
and v_doStmtWeight = (fun (mc0 : t_DoStmt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> ((v_oneDoStmtWeight dtb__180) + (v_doStmtWeight dtb__181))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 249 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneDoStmtWeight = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__182, dtb__183) -> (1 + (v_patExprWeight dtb__182))
  | C_DoStmt_DExpr (dtb__184, dtb__185) -> (1 + (v_exprWeight dtb__184))
  | C_DoStmt_DBind (dtb__186, dtb__187, dtb__188) -> ((1 + (v_patWeight dtb__186)) + (v_exprWeight dtb__187))
  | _ -> failwith "DT: impossible branch"
))
# 254 "Vuna/Compiler/Frontend/Rast.vuna"
and v_interpWeight = (fun (mc0 : t_InterpPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> ((v_oneInterpWeight dtb__189) + (v_interpWeight dtb__190))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 258 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneInterpWeight = (fun (mc0 : t_InterpPart) -> (match mc0 with
  | C_InterpPart_IPHole (dtb__191) -> (1 + (v_exprWeight dtb__191))
  | C_InterpPart_IPText (dtb__192) -> 1
  | _ -> failwith "DT: impossible branch"
))

# 263 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exprBudget = (fun (base : int) (e : t_Expr) -> (base + (8 * (v_exprWeight e))))

# 267 "Vuna/Compiler/Frontend/Rast.vuna"
let v_patBudget = (fun (base : int) (p : t_Pat) -> (base + (8 * (v_patWeight p))))

# 270 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__193, dtb__194) -> dtb__194
  | C_DoStmt_DExpr (dtb__195, dtb__196) -> dtb__196
  | C_DoStmt_DBind (dtb__197, dtb__198, dtb__199) -> dtb__199
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declSpan = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__200, dtb__201, dtb__202, dtb__203) -> dtb__203
  | C_Decl_DTrait (dtb__204, dtb__205, dtb__206, dtb__207, dtb__208) -> dtb__208
  | C_Decl_DRecord (dtb__209, dtb__210, dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> dtb__216
  | C_Decl_DFun (dtb__217, dtb__218, dtb__219, dtb__220) -> dtb__220
  | C_Decl_DSig (dtb__221, dtb__222, dtb__223, dtb__224) -> dtb__224
  | C_Decl_DExtern (dtb__225, dtb__226, dtb__227, dtb__228) -> dtb__228
  | C_Decl_DAxiom (dtb__229, dtb__230, dtb__231) -> dtb__231
  | C_Decl_DData (dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240) -> dtb__240
  | _ -> failwith "DT: impossible branch"
))

# 285 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorSpan = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__241; f_Ctor_ctorType = dtb__242; f_Ctor_ctorArity = dtb__243; f_Ctor_ctorSpan = dtb__244 } -> dtb__244
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldSpan = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__245; f_Field_fieldType = dtb__246; f_Field_fieldSpan = dtb__247 } -> dtb__247
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__248; f_Field_fieldType = dtb__249; f_Field_fieldSpan = dtb__250 } -> dtb__248
  | _ -> failwith "DT: impossible branch"
))

# 294 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__251; f_Field_fieldType = dtb__252; f_Field_fieldSpan = dtb__253 } -> dtb__252
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__254; f_TraitMethod_traitMethodType = dtb__255; f_TraitMethod_traitMethodSpan = dtb__256 } -> dtb__254
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodSpan = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__257; f_TraitMethod_traitMethodType = dtb__258; f_TraitMethod_traitMethodSpan = dtb__259 } -> dtb__259
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exportItemSpan = (fun (item : Frontend_dAst.t_ExportItem) -> (Frontend_dAst.v_nodeRefSpan (Frontend_dAst.v_exportItemRef item)))

# 306 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (match dtb__260 with
  | C_Decl_DFun (dtb__262, dtb__263, dtb__264, dtb__265) -> (if (dtb__262 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__263; B_dData_dPair.f_Pair_second = dtb__264 }, ((v_collectClauses dtb__261) mc1))) else ((v_collectClauses dtb__261) mc1))
  | _ -> ((v_collectClauses dtb__261) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Frontend/Rast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 317 "Vuna/Compiler/Frontend/Rast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (match dtb__266 with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__268)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 323 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__270; f_Ctor_ctorType = dtb__271; f_Ctor_ctorArity = dtb__272; f_Ctor_ctorSpan = dtb__273 } -> dtb__270
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 335 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = dtb__275 } -> (match dtb__274 with
  | B_dData_dList.C_List_Nil -> dtb__275
  | _ -> (match (B_dData_dList.v_reverse dtb__274) with
  | B_dData_dList.C_List_Nil -> dtb__275
  | B_dData_dList.C_List__x58__x58_ (dtb__276, dtb__277) -> (String.concat "" [dtb__276; "."; dtb__275])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 344 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__278; f_Ctor_ctorType = dtb__279; f_Ctor_ctorArity = dtb__280; f_Ctor_ctorSpan = dtb__281 } -> dtb__279
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__282, dtb__283, dtb__284) -> (match dtb__282 with
  | C_Expr_EVar (dtb__285, dtb__286) -> (match dtb__285 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__287) -> (if (dtb__287 = "->") then (match dtb__283 with
  | B_dData_dList.C_List__x58__x58_ (dtb__288, dtb__289) -> (match dtb__289 with
  | B_dData_dList.C_List__x58__x58_ (dtb__290, dtb__291) -> (match dtb__291 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__290))
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

# 351 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__292, dtb__293) -> (if ((v_ctorName dtb__292) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__292).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__293))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__294, dtb__295) -> (match dtb__294 with
  | C_Decl_DData (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> (match ((v_lookupCtorArity mc0) dtb__299) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__305) -> (B_dData_dMaybe.C_Maybe_Just (dtb__305))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__295)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> (if (mc0 = dtb__306) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__308))) else ((v_ctorArity mc0) dtb__295))
  | _ -> ((v_ctorArity mc0) dtb__295)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__314, dtb__315, dtb__316, dtb__317) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__318, dtb__319, dtb__320, dtb__321, dtb__322) -> ((B_dData_dList.v_map v_traitMethodName) dtb__321)
  | C_Decl_DRecord (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329, dtb__330) -> (B_dData_dList.C_List__x58__x58_ (dtb__323, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338, dtb__339) -> ((B_dData_dList.v_map v_ctorName) dtb__334)
  | C_Decl_DSig (dtb__340, dtb__341, dtb__342, dtb__343) -> (B_dData_dList.C_List__x58__x58_ (dtb__340, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__344, dtb__345, dtb__346, dtb__347) -> (B_dData_dList.C_List__x58__x58_ (dtb__344, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__348, dtb__349, dtb__350) -> (B_dData_dList.C_List__x58__x58_ (dtb__348, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__351, dtb__352, dtb__353, dtb__354) -> (B_dData_dList.C_List__x58__x58_ (dtb__351, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Frontend/Rast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 384 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> (B_dData_dList.C_List__x58__x58_ (dtb__355, ((B_dData_dList.v_map v_traitMethodName) dtb__358)))
  | C_Decl_DRecord (dtb__360, dtb__361, dtb__362, dtb__363, dtb__364, dtb__365, dtb__366, dtb__367) -> (B_dData_dList.C_List__x58__x58_ (dtb__360, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373, dtb__374, dtb__375, dtb__376) -> (B_dData_dList.C_List__x58__x58_ (dtb__368, ((B_dData_dList.v_map v_ctorName) dtb__371)))
  | _ -> (v_declNames mc0)
))

# 391 "Vuna/Compiler/Frontend/Rast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__377, dtb__378, dtb__379, dtb__380, dtb__381) -> ((B_dData_dList.v_map v_traitMethodName) dtb__380)
  | C_Decl_DRecord (dtb__382, dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (B_dData_dList.C_List__x58__x58_ (dtb__382, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398) -> ((B_dData_dList.v_map v_ctorName) dtb__393)
  | _ -> B_dData_dList.C_List_Nil
))

# 397 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 400 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__399, dtb__400, dtb__401, dtb__402, dtb__403) -> (B_dData_dList.C_List__x58__x58_ (dtb__399, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409, dtb__410, dtb__411) -> (B_dData_dList.C_List__x58__x58_ (dtb__404, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__412, dtb__413, dtb__414, dtb__415, dtb__416, dtb__417, dtb__418, dtb__419, dtb__420) -> (B_dData_dList.C_List__x58__x58_ (dtb__412, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 406 "Vuna/Compiler/Frontend/Rast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 409 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__421, dtb__422, dtb__423, dtb__424, dtb__425, dtb__426, dtb__427, dtb__428) -> dtb__424
  | C_Decl_DData (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437) -> dtb__433
  | _ -> B_dData_dList.C_List_Nil
))

# 421 "Vuna/Compiler/Frontend/Rast.vuna"
let v_nameOf = (fun (scope : string B_dData_dList.t_List) (name : string) -> (if ((B_dData_dList.v_memName name) scope) then (Frontend_dRast_dName.C_RName_RLocal (name)) else (Frontend_dRast_dName.v_classifyName name)))

# 485 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofPat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__438, dtb__439, dtb__440) -> (C_Pat_PRecord (((v_nameOf mc0) dtb__438), ((B_dData_dList.v_map (v_ofPatField mc0)) dtb__439), (Frontend_dAst.v_nodeRefSpan dtb__440)))
  | Frontend_dAst.C_Pat_PStr (dtb__441, dtb__442) -> (C_Pat_PStr (dtb__441, (Frontend_dAst.v_nodeRefSpan dtb__442)))
  | Frontend_dAst.C_Pat_PInt (dtb__443, dtb__444) -> (C_Pat_PInt (dtb__443, (Frontend_dAst.v_nodeRefSpan dtb__444)))
  | Frontend_dAst.C_Pat_PCon (dtb__445, dtb__446, dtb__447) -> (C_Pat_PCon (((v_nameOf mc0) dtb__445), ((B_dData_dList.v_map (v_ofPat mc0)) dtb__446), (Frontend_dAst.v_nodeRefSpan dtb__447)))
  | Frontend_dAst.C_Pat_PWild (dtb__448) -> (C_Pat_PWild ((Frontend_dAst.v_nodeRefSpan dtb__448)))
  | Frontend_dAst.C_Pat_PAs (dtb__449, dtb__450, dtb__451) -> (C_Pat_PAs (dtb__449, ((v_ofPat mc0) dtb__450), (Frontend_dAst.v_nodeRefSpan dtb__451)))
  | Frontend_dAst.C_Pat_PVar (dtb__452, dtb__453) -> (C_Pat_PVar (dtb__452, (Frontend_dAst.v_nodeRefSpan dtb__453)))
  | _ -> failwith "DT: impossible branch"
))
# 496 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofPatField = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__454; B_dData_dPair.f_Pair_second = dtb__455 } -> { B_dData_dPair.f_Pair_first = dtb__454; B_dData_dPair.f_Pair_second = ((v_ofPat mc0) dtb__455) }
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_patBinders = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__456, dtb__457, dtb__458) -> ((B_dData_dList.v_concatMap v_patFieldBinders) dtb__457)
  | Frontend_dAst.C_Pat_PStr (dtb__459, dtb__460) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__461, dtb__462) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__463, dtb__464, dtb__465) -> ((B_dData_dList.v_concatMap v_patBinders) dtb__464)
  | Frontend_dAst.C_Pat_PWild (dtb__466) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__467, dtb__468, dtb__469) -> (B_dData_dList.C_List__x58__x58_ (dtb__467, (v_patBinders dtb__468)))
  | Frontend_dAst.C_Pat_PVar (dtb__470, dtb__471) -> (B_dData_dList.C_List__x58__x58_ (dtb__470, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 596 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patFieldBinders = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__472; B_dData_dPair.f_Pair_second = dtb__473 } -> (v_patBinders dtb__473)
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Frontend/Rast.vuna"
let v_bindersOfPats = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_patBinders) pats))

# 599 "Vuna/Compiler/Frontend/Rast.vuna"
let v_bindingBinders = (fun (binding : Frontend_dAst.t_Binding) -> (v_patBinders (binding).Frontend_dAst.f_Binding_bindPat))

# 513 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofExpr = (fun (scope : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__474, dtb__475) -> (C_Expr_EVar (((v_nameOf scope) dtb__474), (Frontend_dAst.v_nodeRefSpan dtb__475)))
  | Frontend_dAst.C_Expr_EInt (dtb__476, dtb__477) -> (C_Expr_EInt (dtb__476, (Frontend_dAst.v_nodeRefSpan dtb__477)))
  | Frontend_dAst.C_Expr_EStr (dtb__478, dtb__479) -> (C_Expr_EStr (dtb__478, (Frontend_dAst.v_nodeRefSpan dtb__479)))
  | Frontend_dAst.C_Expr_EFloat (dtb__480, dtb__481) -> (C_Expr_EFloat (dtb__480, (Frontend_dAst.v_nodeRefSpan dtb__481)))
  | Frontend_dAst.C_Expr_EInterp (dtb__482, dtb__483, dtb__484) -> (C_Expr_EInterp (dtb__482, ((B_dData_dList.v_map (v_ofInterpPart scope)) dtb__483), (Frontend_dAst.v_nodeRefSpan dtb__484)))
  | Frontend_dAst.C_Expr_ELam (dtb__485, dtb__486, dtb__487) -> (C_Expr_ELam (dtb__485, ((v_ofExpr ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__485)) scope)) dtb__486), (Frontend_dAst.v_nodeRefSpan dtb__487)))
  | Frontend_dAst.C_Expr_EApp (dtb__488, dtb__489, dtb__490) -> (C_Expr_EApp (((v_ofExpr scope) dtb__488), ((B_dData_dList.v_map (v_ofExpr scope)) dtb__489), (Frontend_dAst.v_nodeRefSpan dtb__490)))
  | Frontend_dAst.C_Expr_EPi (dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496) -> (C_Expr_EPi (dtb__491, dtb__492, dtb__493, ((v_ofExpr scope) dtb__494), ((v_ofExpr (B_dData_dList.C_List__x58__x58_ (dtb__491, scope))) dtb__495), (Frontend_dAst.v_nodeRefSpan dtb__496)))
  | Frontend_dAst.C_Expr_ELet (dtb__497, dtb__498, dtb__499, dtb__500) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__497)) scope) in (C_Expr_ELet (((B_dData_dList.v_map ((v_ofBinding bound) scope)) dtb__497), ((v_ofExpr bound) dtb__498), dtb__499, (Frontend_dAst.v_nodeRefSpan dtb__500))))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__501, dtb__502) -> (C_Expr_ELocalFun (((B_dData_dList.v_map (v_ofLocalClause scope)) dtb__501), (Frontend_dAst.v_nodeRefSpan dtb__502)))
  | Frontend_dAst.C_Expr_ECase (dtb__503, dtb__504, dtb__505) -> (C_Expr_ECase (((v_ofExpr scope) dtb__503), ((B_dData_dList.v_map (v_ofAlt scope)) dtb__504), (Frontend_dAst.v_nodeRefSpan dtb__505)))
  | Frontend_dAst.C_Expr_EIf (dtb__506, dtb__507, dtb__508, dtb__509) -> (C_Expr_EIf (((v_ofExpr scope) dtb__506), ((v_ofExpr scope) dtb__507), ((v_ofExpr scope) dtb__508), (Frontend_dAst.v_nodeRefSpan dtb__509)))
  | Frontend_dAst.C_Expr_EField (dtb__510, dtb__511, dtb__512) -> (C_Expr_EField (((v_ofExpr scope) dtb__510), dtb__511, (Frontend_dAst.v_nodeRefSpan dtb__512)))
  | Frontend_dAst.C_Expr_ERecord (dtb__513, dtb__514, dtb__515) -> (C_Expr_ERecord (((v_nameOf scope) dtb__513), ((B_dData_dList.v_map (v_ofFieldValue scope)) dtb__514), (Frontend_dAst.v_nodeRefSpan dtb__515)))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__516, dtb__517, dtb__518) -> (C_Expr_ERecUpdate (((v_ofExpr scope) dtb__516), ((B_dData_dList.v_map (v_ofFieldValue scope)) dtb__517), (Frontend_dAst.v_nodeRefSpan dtb__518)))
  | Frontend_dAst.C_Expr_EDo (dtb__519, dtb__520) -> (C_Expr_EDo (((v_ofStmts scope) dtb__519), (Frontend_dAst.v_nodeRefSpan dtb__520)))
  | Frontend_dAst.C_Expr_EInfix (dtb__521, dtb__522, dtb__523, dtb__524) -> (C_Expr_EInfix (dtb__521, ((v_ofExpr scope) dtb__522), ((v_ofExpr scope) dtb__523), (Frontend_dAst.v_nodeRefSpan dtb__524)))
  | Frontend_dAst.C_Expr_EParen (dtb__525, dtb__526) -> (C_Expr_EParen (((v_ofExpr scope) dtb__525), (Frontend_dAst.v_nodeRefSpan dtb__526)))
  | Frontend_dAst.C_Expr_EBacktick (dtb__527, dtb__528, dtb__529, dtb__530) -> (C_Expr_EBacktick (dtb__527, ((v_ofExpr scope) dtb__528), ((v_ofExpr scope) dtb__529), (Frontend_dAst.v_nodeRefSpan dtb__530)))
  | Frontend_dAst.C_Expr_ESectOp (dtb__531, dtb__532) -> (C_Expr_ESectOp (dtb__531, (Frontend_dAst.v_nodeRefSpan dtb__532)))
  | Frontend_dAst.C_Expr_ESectL (dtb__533, dtb__534, dtb__535) -> (C_Expr_ESectL (dtb__533, ((v_ofExpr scope) dtb__534), (Frontend_dAst.v_nodeRefSpan dtb__535)))
  | Frontend_dAst.C_Expr_ESectR (dtb__536, dtb__537, dtb__538) -> (C_Expr_ESectR (((v_ofExpr scope) dtb__536), dtb__537, (Frontend_dAst.v_nodeRefSpan dtb__538)))
  | Frontend_dAst.C_Expr_EAnn (dtb__539, dtb__540, dtb__541) -> (C_Expr_EAnn (((v_ofExpr scope) dtb__539), ((v_ofExpr scope) dtb__540), (Frontend_dAst.v_nodeRefSpan dtb__541)))
  | _ -> failwith "DT: impossible branch"
))
# 552 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofBinding = (fun (bound : string B_dData_dList.t_List) (scope : string B_dData_dList.t_List) (binding : Frontend_dAst.t_Binding) -> (let pat = (binding).Frontend_dAst.f_Binding_bindPat in (let valueScope = ((B_dData_dList.v_append (v_patBinders pat)) bound) in (let value = ((v_ofExpr valueScope) (binding).Frontend_dAst.f_Binding_bindValue) in (match (binding).Frontend_dAst.f_Binding_bindSig with
  | B_dData_dMaybe.C_Maybe_Just (dtb__542) -> { B_dData_dPair.f_Pair_first = ((v_ofPat scope) pat); B_dData_dPair.f_Pair_second = (C_Expr_EAnn (value, ((v_ofExpr valueScope) (dtb__542).Frontend_dAst.f_BindingSig_sigType), (Frontend_dAst.v_nodeRefSpan (dtb__542).Frontend_dAst.f_BindingSig_sigRef))) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((v_ofPat scope) pat); B_dData_dPair.f_Pair_second = value }
  | _ -> failwith "DT: impossible branch"
)))))
# 564 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofLocalClause = (fun (scope : string B_dData_dList.t_List) (clause : Frontend_dAst.t_LocalClause) -> (let pats = (clause).Frontend_dAst.f_LocalClause_lcPats in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (v_ofPat scope)) pats); B_dData_dPair.f_Pair_second = ((v_ofExpr ((B_dData_dList.v_append (v_bindersOfPats pats)) scope)) (clause).Frontend_dAst.f_LocalClause_lcBody) }))
# 570 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofAlt = (fun (scope : string B_dData_dList.t_List) (alt : Frontend_dAst.t_Alt) -> (let pat = (alt).Frontend_dAst.f_Alt_altPat in { B_dData_dPair.f_Pair_first = ((v_ofPat scope) pat); B_dData_dPair.f_Pair_second = ((v_ofExpr ((B_dData_dList.v_append (v_patBinders pat)) scope)) (alt).Frontend_dAst.f_Alt_altBody) }))
# 576 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofFieldValue = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__543; B_dData_dPair.f_Pair_second = dtb__544 } -> { B_dData_dPair.f_Pair_first = dtb__543; B_dData_dPair.f_Pair_second = ((v_ofExpr mc0) dtb__544) }
  | _ -> failwith "DT: impossible branch"
))
# 579 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofInterpPart = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__545) -> (C_InterpPart_IPHole (((v_ofExpr mc0) dtb__545)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__546) -> (C_InterpPart_IPText (dtb__546))
  | _ -> failwith "DT: impossible branch"
))
# 583 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofStmts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__547, dtb__548) -> (match dtb__547 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__549, dtb__550, dtb__551) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DBind (((v_ofPat mc0) dtb__549), ((v_ofExpr mc0) dtb__550), (Frontend_dAst.v_nodeRefSpan dtb__551))), ((v_ofStmts ((B_dData_dList.v_append (v_patBinders dtb__549)) mc0)) dtb__548)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__552, dtb__553) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__552)) mc0) in (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DLet (((B_dData_dList.v_map ((v_ofBinding bound) mc0)) dtb__552), (Frontend_dAst.v_nodeRefSpan dtb__553))), ((v_ofStmts bound) dtb__548))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__554, dtb__555) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DExpr (((v_ofExpr mc0) dtb__554), (Frontend_dAst.v_nodeRefSpan dtb__555))), ((v_ofStmts mc0) dtb__548)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofCtor = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__556; Frontend_dAst.f_Ctor_ctorType = dtb__557; Frontend_dAst.f_Ctor_ctorArity = dtb__558; Frontend_dAst.f_Ctor_ctorRef = dtb__559 } -> { f_Ctor_ctorName = dtb__556; f_Ctor_ctorType = ((v_ofExpr mc0) dtb__557); f_Ctor_ctorArity = dtb__558; f_Ctor_ctorSpan = (Frontend_dAst.v_nodeRefSpan dtb__559) }
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofField = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__560; Frontend_dAst.f_Field_fieldType = dtb__561; Frontend_dAst.f_Field_fieldRef = dtb__562 } -> { f_Field_fieldName = dtb__560; f_Field_fieldType = ((v_ofExpr mc0) dtb__561); f_Field_fieldSpan = (Frontend_dAst.v_nodeRefSpan dtb__562) }
  | _ -> failwith "DT: impossible branch"
))

# 481 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitMethod = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__563; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__564; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__565 } -> { f_TraitMethod_traitMethodName = dtb__563; f_TraitMethod_traitMethodType = ((v_ofExpr mc0) dtb__564); f_TraitMethod_traitMethodSpan = (Frontend_dAst.v_nodeRefSpan dtb__565) }
  | _ -> failwith "DT: impossible branch"
))

# 602 "Vuna/Compiler/Frontend/Rast.vuna"
let v_astTraitParamName = (fun (p : Frontend_dAst.t_TraitParam) -> (p).Frontend_dAst.f_TraitParam_traitParamName)

# 608 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofMaybeExpr = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__566) -> (B_dData_dMaybe.C_Maybe_Just (((v_ofExpr mc0) dtb__566)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 605 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitParam = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_TraitParam) -> (match mc1 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__567; Frontend_dAst.f_TraitParam_traitParamKind = dtb__568 } -> { f_TraitParam_traitParamName = dtb__567; f_TraitParam_traitParamKind = ((v_ofMaybeExpr mc0) dtb__568) }
  | _ -> failwith "DT: impossible branch"
))

# 429 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofDecl = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__569, dtb__570, dtb__571, dtb__572) -> (C_Decl_DInstance (((B_dData_dList.v_map (v_ofExpr mc0)) dtb__569), ((v_ofExpr mc0) dtb__570), ((B_dData_dList.v_map (v_ofDecl mc0)) dtb__571), (Frontend_dAst.v_nodeRefSpan dtb__572)))
  | Frontend_dAst.C_Decl_DTrait (dtb__573, dtb__574, dtb__575, dtb__576, dtb__577) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_map v_astTraitParamName) dtb__574)) mc0) in (C_Decl_DTrait (dtb__573, ((B_dData_dList.v_map (v_ofTraitParam bound)) dtb__574), ((B_dData_dList.v_map (v_ofExpr bound)) dtb__575), ((B_dData_dList.v_map (v_ofTraitMethod bound)) dtb__576), (Frontend_dAst.v_nodeRefSpan dtb__577))))
  | Frontend_dAst.C_Decl_DRecord (dtb__578, dtb__579, dtb__580, dtb__581, dtb__582, dtb__583, dtb__584, dtb__585) -> (C_Decl_DRecord (dtb__578, dtb__579, ((B_dData_dList.v_map (v_ofField ((B_dData_dList.v_append dtb__579) mc0))) dtb__580), dtb__581, dtb__582, dtb__583, dtb__584, (Frontend_dAst.v_nodeRefSpan dtb__585)))
  | Frontend_dAst.C_Decl_DFun (dtb__586, dtb__587, dtb__588, dtb__589) -> (let bound = ((B_dData_dList.v_append (v_bindersOfPats dtb__587)) mc0) in (C_Decl_DFun (dtb__586, ((B_dData_dList.v_map (v_ofPat mc0)) dtb__587), ((v_ofExpr bound) dtb__588), (Frontend_dAst.v_nodeRefSpan dtb__589))))
  | Frontend_dAst.C_Decl_DSig (dtb__590, dtb__591, dtb__592, dtb__593) -> (C_Decl_DSig (dtb__590, ((B_dData_dList.v_map (v_ofExpr mc0)) dtb__591), ((v_ofExpr mc0) dtb__592), (Frontend_dAst.v_nodeRefSpan dtb__593)))
  | Frontend_dAst.C_Decl_DExtern (dtb__594, dtb__595, dtb__596, dtb__597) -> (C_Decl_DExtern (dtb__594, dtb__595, ((v_ofExpr mc0) dtb__596), (Frontend_dAst.v_nodeRefSpan dtb__597)))
  | Frontend_dAst.C_Decl_DAxiom (dtb__598, dtb__599, dtb__600) -> (C_Decl_DAxiom (dtb__598, ((v_ofExpr mc0) dtb__599), (Frontend_dAst.v_nodeRefSpan dtb__600)))
  | Frontend_dAst.C_Decl_DData (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605, dtb__606, dtb__607, dtb__608, dtb__609) -> (C_Decl_DData (dtb__601, dtb__602, ((v_ofExpr ((B_dData_dList.v_append dtb__602) mc0)) dtb__603), ((B_dData_dList.v_map (v_ofCtor ((B_dData_dList.v_append dtb__602) mc0))) dtb__604), dtb__605, dtb__606, dtb__607, dtb__608, (Frontend_dAst.v_nodeRefSpan dtb__609)))
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_ofDecl B_dData_dList.C_List_Nil)) decls))
