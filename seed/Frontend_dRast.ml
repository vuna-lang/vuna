open Vuna_runtime
type t_Field = { f_Field_fieldName : string; f_Field_fieldType : t_Expr; f_Field_fieldSpan : Base_dSource.t_Span }
and t_TraitMethod = { f_TraitMethod_traitMethodName : string; f_TraitMethod_traitMethodType : t_Expr; f_TraitMethod_traitMethodSpan : Base_dSource.t_Span }
and t_TraitParam = { f_TraitParam_traitParamName : string; f_TraitParam_traitParamKind : t_Expr B_dData_dMaybe.t_Maybe }
and t_Pat = C_Pat_PVar of (string) * (Base_dSource.t_Span) | C_Pat_PAs of (string) * (t_Pat) * (Base_dSource.t_Span) | C_Pat_PWild of (Base_dSource.t_Span) | C_Pat_PCon of (Frontend_dRast_dName.t_RName) * (t_Pat B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Pat_PInt of (int) * (Base_dSource.t_Span) | C_Pat_PStr of (string) * (Base_dSource.t_Span) | C_Pat_PRecord of (Frontend_dRast_dName.t_RName) * ((string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_InterpPart = C_InterpPart_IPText of (string) | C_InterpPart_IPHole of (t_Expr)
and t_Expr = C_Expr_EVar of (Frontend_dRast_dName.t_RName) * (Base_dSource.t_Span) | C_Expr_EInt of (int) * (Base_dSource.t_Span) | C_Expr_EStr of (string) * (Base_dSource.t_Span) | C_Expr_ELam of ((string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EApp of (t_Expr) * (t_Expr B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EPi of (string) * (bool) * (Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_ELet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_Expr) * (bool) * (Base_dSource.t_Span) | C_Expr_ELocalFun of ((t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ECase of (t_Expr) * ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EIf of (t_Expr) * (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EField of (t_Expr) * (string) * (Base_dSource.t_Span) | C_Expr_ERecord of (Frontend_dRast_dName.t_RName) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_ERecUpdate of (t_Expr) * ((string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EDo of (t_DoStmt B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EAnn of (t_Expr) * (t_Expr) * (Base_dSource.t_Span) | C_Expr_EInterp of (t_InterpPart B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Expr_EFloat of (string) * (Base_dSource.t_Span)
and t_DoStmt = C_DoStmt_DBind of (t_Pat) * (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DExpr of (t_Expr) * (Base_dSource.t_Span) | C_DoStmt_DLet of ((t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_Ctor = { f_Ctor_ctorName : string; f_Ctor_ctorType : t_Expr; f_Ctor_ctorArity : int; f_Ctor_ctorSpan : Base_dSource.t_Span }
and t_Decl = C_Decl_DData of (string) * (string B_dData_dList.t_List) * (t_Expr) * (t_Ctor B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (Frontend_dAst.t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DAxiom of (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DExtern of (string) * (string) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DSig of (string) * (t_Expr B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DFun of (string) * (t_Pat B_dData_dList.t_List) * (t_Expr) * (Base_dSource.t_Span) | C_Decl_DRecord of (string) * (string B_dData_dList.t_List) * (t_Field B_dData_dList.t_List) * (string B_dData_dList.t_List) * (bool) * (Frontend_dAst.t_ReprTier) * (bool) * (Base_dSource.t_Span) | C_Decl_DTrait of (string) * (t_TraitParam B_dData_dList.t_List) * (t_Expr B_dData_dList.t_List) * (t_TraitMethod B_dData_dList.t_List) * (Base_dSource.t_Span) | C_Decl_DInstance of (t_Expr B_dData_dList.t_List) * (t_Expr) * (t_Decl B_dData_dList.t_List) * (Base_dSource.t_Span)
and t_SourceFile = { f_SourceFile_sourceFileModDecl : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe; f_SourceFile_sourceFileImports : Frontend_dAst.t_Import B_dData_dList.t_List; f_SourceFile_sourceFileFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_SourceFile_sourceFileDecls : t_Decl B_dData_dList.t_List; f_SourceFile_sourceFileExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_SourceFile_sourceFileReexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List; f_SourceFile_sourceFileOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }

# 134 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 143 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exprSpan = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__16, dtb__17) -> dtb__17
  | C_Expr_EAnn (dtb__18, dtb__19, dtb__20) -> dtb__20
  | C_Expr_EDo (dtb__21, dtb__22) -> dtb__22
  | C_Expr_ERecUpdate (dtb__23, dtb__24, dtb__25) -> dtb__25
  | C_Expr_ERecord (dtb__26, dtb__27, dtb__28) -> dtb__28
  | C_Expr_EField (dtb__29, dtb__30, dtb__31) -> dtb__31
  | C_Expr_EIf (dtb__32, dtb__33, dtb__34, dtb__35) -> dtb__35
  | C_Expr_ECase (dtb__36, dtb__37, dtb__38) -> dtb__38
  | C_Expr_ELocalFun (dtb__39, dtb__40) -> dtb__40
  | C_Expr_ELet (dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__44
  | C_Expr_EPi (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__50
  | C_Expr_EApp (dtb__51, dtb__52, dtb__53) -> dtb__53
  | C_Expr_ELam (dtb__54, dtb__55, dtb__56) -> dtb__56
  | C_Expr_EFloat (dtb__57, dtb__58) -> dtb__58
  | C_Expr_EStr (dtb__59, dtb__60) -> dtb__60
  | C_Expr_EInt (dtb__61, dtb__62) -> dtb__62
  | C_Expr_EVar (dtb__63, dtb__64) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_patWeight = (fun (mc0 : t_Pat) -> (match mc0 with
  | C_Pat_PRecord (dtb__65, dtb__66, dtb__67) -> (1 + (v_patWeightFields dtb__66))
  | C_Pat_PStr (dtb__68, dtb__69) -> 1
  | C_Pat_PInt (dtb__70, dtb__71) -> 1
  | C_Pat_PCon (dtb__72, dtb__73, dtb__74) -> (1 + (v_patWeightList dtb__73))
  | C_Pat_PWild (dtb__75) -> 1
  | C_Pat_PAs (dtb__76, dtb__77, dtb__78) -> (1 + (v_patWeight dtb__77))
  | C_Pat_PVar (dtb__79, dtb__80) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 176 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightList = (fun (mc0 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> ((v_patWeight dtb__81) + (v_patWeightList dtb__82))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 180 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> ((v_patWeight (B_dData_dPair.v_secondOf dtb__83)) + (v_patWeightFields dtb__84))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_exprWeight = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EInterp (dtb__85, dtb__86) -> (1 + (v_interpWeight dtb__85))
  | C_Expr_EAnn (dtb__87, dtb__88, dtb__89) -> ((1 + (v_exprWeight dtb__87)) + (v_exprWeight dtb__88))
  | C_Expr_EDo (dtb__90, dtb__91) -> (1 + (v_doStmtWeight dtb__90))
  | C_Expr_ERecUpdate (dtb__92, dtb__93, dtb__94) -> ((1 + (v_exprWeight dtb__92)) + (v_exprWeightFields dtb__93))
  | C_Expr_ERecord (dtb__95, dtb__96, dtb__97) -> (1 + (v_exprWeightFields dtb__96))
  | C_Expr_EField (dtb__98, dtb__99, dtb__100) -> (1 + (v_exprWeight dtb__98))
  | C_Expr_EIf (dtb__101, dtb__102, dtb__103, dtb__104) -> (((1 + (v_exprWeight dtb__101)) + (v_exprWeight dtb__102)) + (v_exprWeight dtb__103))
  | C_Expr_ECase (dtb__105, dtb__106, dtb__107) -> ((1 + (v_exprWeight dtb__105)) + (v_patExprWeight dtb__106))
  | C_Expr_ELocalFun (dtb__108, dtb__109) -> (1 + (v_clauseWeight dtb__108))
  | C_Expr_ELet (dtb__110, dtb__111, dtb__112, dtb__113) -> ((1 + (v_patExprWeight dtb__110)) + (v_exprWeight dtb__111))
  | C_Expr_EPi (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> ((1 + (v_exprWeight dtb__117)) + (v_exprWeight dtb__118))
  | C_Expr_EApp (dtb__120, dtb__121, dtb__122) -> ((1 + (v_exprWeight dtb__120)) + (v_exprWeightList dtb__121))
  | C_Expr_ELam (dtb__123, dtb__124, dtb__125) -> (1 + (v_exprWeight dtb__124))
  | C_Expr_EFloat (dtb__126, dtb__127) -> 1
  | C_Expr_EStr (dtb__128, dtb__129) -> 1
  | C_Expr_EInt (dtb__130, dtb__131) -> 1
  | C_Expr_EVar (dtb__132, dtb__133) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 205 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightList = (fun (mc0 : t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> ((v_exprWeight dtb__134) + (v_exprWeightList dtb__135))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 209 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patExprWeight = (fun (mc0 : (t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (((v_patWeight (B_dData_dPair.v_firstOf dtb__136)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__136))) + (v_patExprWeight dtb__137))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 213 "Vuna/Compiler/Frontend/Rast.vuna"
and v_clauseWeight = (fun (mc0 : (t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (((v_patWeightList (B_dData_dPair.v_firstOf dtb__138)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__138))) + (v_clauseWeight dtb__139))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 217 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightFields = (fun (mc0 : (string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> ((v_exprWeight (B_dData_dPair.v_secondOf dtb__140)) + (v_exprWeightFields dtb__141))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 221 "Vuna/Compiler/Frontend/Rast.vuna"
and v_doStmtWeight = (fun (mc0 : t_DoStmt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> ((v_oneDoStmtWeight dtb__142) + (v_doStmtWeight dtb__143))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 225 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneDoStmtWeight = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__144, dtb__145) -> (1 + (v_patExprWeight dtb__144))
  | C_DoStmt_DExpr (dtb__146, dtb__147) -> (1 + (v_exprWeight dtb__146))
  | C_DoStmt_DBind (dtb__148, dtb__149, dtb__150) -> ((1 + (v_patWeight dtb__148)) + (v_exprWeight dtb__149))
  | _ -> failwith "DT: impossible branch"
))
# 230 "Vuna/Compiler/Frontend/Rast.vuna"
and v_interpWeight = (fun (mc0 : t_InterpPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> ((v_oneInterpWeight dtb__151) + (v_interpWeight dtb__152))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 234 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneInterpWeight = (fun (mc0 : t_InterpPart) -> (match mc0 with
  | C_InterpPart_IPHole (dtb__153) -> (1 + (v_exprWeight dtb__153))
  | C_InterpPart_IPText (dtb__154) -> 1
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exprBudget = (fun (base : int) (e : t_Expr) -> (base + (8 * (v_exprWeight e))))

# 243 "Vuna/Compiler/Frontend/Rast.vuna"
let v_patBudget = (fun (base : int) (p : t_Pat) -> (base + (8 * (v_patWeight p))))

# 246 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__155, dtb__156) -> dtb__156
  | C_DoStmt_DExpr (dtb__157, dtb__158) -> dtb__158
  | C_DoStmt_DBind (dtb__159, dtb__160, dtb__161) -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

# 251 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 261 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorSpan = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__203; f_Ctor_ctorType = dtb__204; f_Ctor_ctorArity = dtb__205; f_Ctor_ctorSpan = dtb__206 } -> dtb__206
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldSpan = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__207; f_Field_fieldType = dtb__208; f_Field_fieldSpan = dtb__209 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__210; f_Field_fieldType = dtb__211; f_Field_fieldSpan = dtb__212 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__213; f_Field_fieldType = dtb__214; f_Field_fieldSpan = dtb__215 } -> dtb__214
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__216; f_TraitMethod_traitMethodType = dtb__217; f_TraitMethod_traitMethodSpan = dtb__218 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodSpan = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__219; f_TraitMethod_traitMethodType = dtb__220; f_TraitMethod_traitMethodSpan = dtb__221 } -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exportItemSpan = (fun (item : Frontend_dAst.t_ExportItem) -> (Frontend_dAst.v_nodeRefSpan (Frontend_dAst.v_exportItemRef item)))

# 282 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | C_Decl_DFun (dtb__224, dtb__225, dtb__226, dtb__227) -> (if (dtb__224 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__226 }, ((v_collectClauses dtb__223) mc1))) else ((v_collectClauses dtb__223) mc1))
  | _ -> ((v_collectClauses dtb__223) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Rast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 293 "Vuna/Compiler/Frontend/Rast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match dtb__228 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__230)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 299 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__232; f_Ctor_ctorType = dtb__233; f_Ctor_ctorArity = dtb__234; f_Ctor_ctorSpan = dtb__235 } -> dtb__232
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 311 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__236; B_dData_dPair.f_Pair_second = dtb__237 } -> (match dtb__236 with
  | B_dData_dList.C_List_Nil -> dtb__237
  | _ -> (match (B_dData_dList.v_reverse dtb__236) with
  | B_dData_dList.C_List_Nil -> dtb__237
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (String.concat "" [dtb__238; "."; dtb__237])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 320 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__240; f_Ctor_ctorType = dtb__241; f_Ctor_ctorArity = dtb__242; f_Ctor_ctorSpan = dtb__243 } -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__244, dtb__245, dtb__246) -> (match dtb__244 with
  | C_Expr_EVar (dtb__247, dtb__248) -> (match dtb__247 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__249) -> (if (dtb__249 = "->") then (match dtb__245 with
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (match dtb__251 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (match dtb__253 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__252))
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

# 327 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> (if ((v_ctorName dtb__254) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__254).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__255))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ctorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (match dtb__256 with
  | C_Decl_DData (dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265, dtb__266) -> (match ((v_lookupCtorArity mc0) dtb__261) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__267) -> (B_dData_dMaybe.C_Maybe_Just (dtb__267))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ctorArity mc0) dtb__257)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__268, dtb__269, dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275) -> (if (mc0 = dtb__268) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__270))) else ((v_ctorArity mc0) dtb__257))
  | _ -> ((v_ctorArity mc0) dtb__257)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__276, dtb__277, dtb__278, dtb__279) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> ((B_dData_dList.v_map v_traitMethodName) dtb__283)
  | C_Decl_DRecord (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (B_dData_dList.C_List__x58__x58_ (dtb__285, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> ((B_dData_dList.v_map v_ctorName) dtb__296)
  | C_Decl_DSig (dtb__302, dtb__303, dtb__304, dtb__305) -> (B_dData_dList.C_List__x58__x58_ (dtb__302, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__306, dtb__307, dtb__308, dtb__309) -> (B_dData_dList.C_List__x58__x58_ (dtb__306, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__310, dtb__311, dtb__312) -> (B_dData_dList.C_List__x58__x58_ (dtb__310, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__313, dtb__314, dtb__315, dtb__316) -> (B_dData_dList.C_List__x58__x58_ (dtb__313, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 357 "Vuna/Compiler/Frontend/Rast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 360 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (B_dData_dList.C_List__x58__x58_ (dtb__317, ((B_dData_dList.v_map v_traitMethodName) dtb__320)))
  | C_Decl_DRecord (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> (B_dData_dList.C_List__x58__x58_ (dtb__322, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> (B_dData_dList.C_List__x58__x58_ (dtb__330, ((B_dData_dList.v_map v_ctorName) dtb__333)))
  | _ -> (v_declNames mc0)
))

# 367 "Vuna/Compiler/Frontend/Rast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> ((B_dData_dList.v_map v_traitMethodName) dtb__342)
  | C_Decl_DRecord (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> (B_dData_dList.C_List__x58__x58_ (dtb__344, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__352, dtb__353, dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360) -> ((B_dData_dList.v_map v_ctorName) dtb__355)
  | _ -> B_dData_dList.C_List_Nil
))

# 373 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 376 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__361, dtb__362, dtb__363, dtb__364, dtb__365) -> (B_dData_dList.C_List__x58__x58_ (dtb__361, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373) -> (B_dData_dList.C_List__x58__x58_ (dtb__366, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__374, dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382) -> (B_dData_dList.C_List__x58__x58_ (dtb__374, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 382 "Vuna/Compiler/Frontend/Rast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 385 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390) -> dtb__386
  | C_Decl_DData (dtb__391, dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> dtb__395
  | _ -> B_dData_dList.C_List_Nil
))

# 397 "Vuna/Compiler/Frontend/Rast.vuna"
let v_nameOf = (fun (scope : string B_dData_dList.t_List) (name : string) -> (if ((B_dData_dList.v_memName name) scope) then (Frontend_dRast_dName.C_RName_RLocal (name)) else (Frontend_dRast_dName.v_classifyName name)))

# 461 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofPat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__400, dtb__401, dtb__402) -> (C_Pat_PRecord (((v_nameOf mc0) dtb__400), ((B_dData_dList.v_map (v_ofPatField mc0)) dtb__401), (Frontend_dAst.v_nodeRefSpan dtb__402)))
  | Frontend_dAst.C_Pat_PStr (dtb__403, dtb__404) -> (C_Pat_PStr (dtb__403, (Frontend_dAst.v_nodeRefSpan dtb__404)))
  | Frontend_dAst.C_Pat_PInt (dtb__405, dtb__406) -> (C_Pat_PInt (dtb__405, (Frontend_dAst.v_nodeRefSpan dtb__406)))
  | Frontend_dAst.C_Pat_PCon (dtb__407, dtb__408, dtb__409) -> (C_Pat_PCon (((v_nameOf mc0) dtb__407), ((B_dData_dList.v_map (v_ofPat mc0)) dtb__408), (Frontend_dAst.v_nodeRefSpan dtb__409)))
  | Frontend_dAst.C_Pat_PWild (dtb__410) -> (C_Pat_PWild ((Frontend_dAst.v_nodeRefSpan dtb__410)))
  | Frontend_dAst.C_Pat_PAs (dtb__411, dtb__412, dtb__413) -> (C_Pat_PAs (dtb__411, ((v_ofPat mc0) dtb__412), (Frontend_dAst.v_nodeRefSpan dtb__413)))
  | Frontend_dAst.C_Pat_PVar (dtb__414, dtb__415) -> (C_Pat_PVar (dtb__414, (Frontend_dAst.v_nodeRefSpan dtb__415)))
  | _ -> failwith "DT: impossible branch"
))
# 472 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofPatField = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = ((v_ofPat mc0) dtb__417) }
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_patBinders = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__418, dtb__419, dtb__420) -> ((B_dData_dList.v_concatMap v_patFieldBinders) dtb__419)
  | Frontend_dAst.C_Pat_PStr (dtb__421, dtb__422) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__423, dtb__424) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__425, dtb__426, dtb__427) -> ((B_dData_dList.v_concatMap v_patBinders) dtb__426)
  | Frontend_dAst.C_Pat_PWild (dtb__428) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__429, dtb__430, dtb__431) -> (B_dData_dList.C_List__x58__x58_ (dtb__429, (v_patBinders dtb__430)))
  | Frontend_dAst.C_Pat_PVar (dtb__432, dtb__433) -> (B_dData_dList.C_List__x58__x58_ (dtb__432, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 576 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patFieldBinders = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (v_patBinders dtb__435)
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Frontend/Rast.vuna"
let v_bindersOfPats = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_patBinders) pats))

# 579 "Vuna/Compiler/Frontend/Rast.vuna"
let v_bindingBinders = (fun (binding : Frontend_dAst.t_Binding) -> (v_patBinders (binding).Frontend_dAst.f_Binding_bindPat))

# 489 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofExpr = (fun (scope : string B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__436, dtb__437) -> (C_Expr_EVar (((v_nameOf scope) dtb__436), (Frontend_dAst.v_nodeRefSpan dtb__437)))
  | Frontend_dAst.C_Expr_EInt (dtb__438, dtb__439) -> (C_Expr_EInt (dtb__438, (Frontend_dAst.v_nodeRefSpan dtb__439)))
  | Frontend_dAst.C_Expr_EStr (dtb__440, dtb__441) -> (C_Expr_EStr (dtb__440, (Frontend_dAst.v_nodeRefSpan dtb__441)))
  | Frontend_dAst.C_Expr_EFloat (dtb__442, dtb__443) -> (C_Expr_EFloat (dtb__442, (Frontend_dAst.v_nodeRefSpan dtb__443)))
  | Frontend_dAst.C_Expr_EInterp (dtb__444, dtb__445) -> (C_Expr_EInterp (((B_dData_dList.v_map (v_ofInterpPart scope)) dtb__444), (Frontend_dAst.v_nodeRefSpan dtb__445)))
  | Frontend_dAst.C_Expr_ELam (dtb__446, dtb__447, dtb__448) -> (C_Expr_ELam (dtb__446, ((v_ofExpr ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__446)) scope)) dtb__447), (Frontend_dAst.v_nodeRefSpan dtb__448)))
  | Frontend_dAst.C_Expr_EApp (dtb__449, dtb__450, dtb__451) -> (match dtb__449 with
  | Frontend_dAst.C_Expr_EVar (dtb__452, dtb__453) -> (let nd_uscrut7 = dtb__450 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__454, dtb__455) -> (match dtb__455 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (match dtb__457 with
  | B_dData_dList.C_List_Nil -> (if (Frontend_dReserved.v_isAscribeSyntax dtb__452) then (C_Expr_EAnn (((v_ofExpr scope) dtb__454), ((v_ofExpr scope) dtb__456), (Frontend_dAst.v_nodeRefSpan dtb__451))) else (C_Expr_EApp (((v_ofExpr scope) dtb__449), ((B_dData_dList.v_map (v_ofExpr scope)) dtb__450), (Frontend_dAst.v_nodeRefSpan dtb__451))))
  | _ -> (C_Expr_EApp (((v_ofExpr scope) dtb__449), ((B_dData_dList.v_map (v_ofExpr scope)) dtb__450), (Frontend_dAst.v_nodeRefSpan dtb__451)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr scope) dtb__449), ((B_dData_dList.v_map (v_ofExpr scope)) dtb__450), (Frontend_dAst.v_nodeRefSpan dtb__451)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr scope) dtb__449), ((B_dData_dList.v_map (v_ofExpr scope)) dtb__450), (Frontend_dAst.v_nodeRefSpan dtb__451)))
))
  | _ -> (C_Expr_EApp (((v_ofExpr scope) dtb__449), ((B_dData_dList.v_map (v_ofExpr scope)) dtb__450), (Frontend_dAst.v_nodeRefSpan dtb__451)))
)
  | Frontend_dAst.C_Expr_EPi (dtb__458, dtb__459, dtb__460, dtb__461, dtb__462, dtb__463) -> (C_Expr_EPi (dtb__458, dtb__459, dtb__460, ((v_ofExpr scope) dtb__461), ((v_ofExpr (B_dData_dList.C_List__x58__x58_ (dtb__458, scope))) dtb__462), (Frontend_dAst.v_nodeRefSpan dtb__463)))
  | Frontend_dAst.C_Expr_ELet (dtb__464, dtb__465, dtb__466, dtb__467) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__464)) scope) in (C_Expr_ELet (((B_dData_dList.v_map ((v_ofBinding bound) scope)) dtb__464), ((v_ofExpr bound) dtb__465), dtb__466, (Frontend_dAst.v_nodeRefSpan dtb__467))))
  | Frontend_dAst.C_Expr_ECase (dtb__468, dtb__469, dtb__470) -> (C_Expr_ECase (((v_ofExpr scope) dtb__468), ((B_dData_dList.v_map (v_ofAlt scope)) dtb__469), (Frontend_dAst.v_nodeRefSpan dtb__470)))
  | Frontend_dAst.C_Expr_EIf (dtb__471, dtb__472, dtb__473, dtb__474) -> (C_Expr_EIf (((v_ofExpr scope) dtb__471), ((v_ofExpr scope) dtb__472), ((v_ofExpr scope) dtb__473), (Frontend_dAst.v_nodeRefSpan dtb__474)))
  | Frontend_dAst.C_Expr_EField (dtb__475, dtb__476, dtb__477) -> (C_Expr_EField (((v_ofExpr scope) dtb__475), dtb__476, (Frontend_dAst.v_nodeRefSpan dtb__477)))
  | Frontend_dAst.C_Expr_ERecord (dtb__478, dtb__479, dtb__480) -> (C_Expr_ERecord (((v_nameOf scope) dtb__478), ((B_dData_dList.v_map (v_ofFieldValue scope)) dtb__479), (Frontend_dAst.v_nodeRefSpan dtb__480)))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__481, dtb__482, dtb__483) -> (C_Expr_ERecUpdate (((v_ofExpr scope) dtb__481), ((B_dData_dList.v_map (v_ofFieldValue scope)) dtb__482), (Frontend_dAst.v_nodeRefSpan dtb__483)))
  | Frontend_dAst.C_Expr_EDo (dtb__484, dtb__485) -> (C_Expr_EDo (((v_ofStmts scope) dtb__484), (Frontend_dAst.v_nodeRefSpan dtb__485)))
  | _ -> failwith "DT: impossible branch"
))
# 527 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofBinding = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding) -> (match mc2 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__486; Frontend_dAst.f_Binding_bindValue = dtb__487; Frontend_dAst.f_Binding_bindSig = dtb__488; Frontend_dAst.f_Binding_bindRef = dtb__489 } -> (match dtb__487 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__490) -> (let valueScope = ((B_dData_dList.v_append (v_patBinders dtb__486)) mc0) in (let value = (C_Expr_ELocalFun (((B_dData_dList.v_map (v_ofLocalClause valueScope)) dtb__490), (Frontend_dAst.v_nodeRefSpan dtb__489))) in (match dtb__488 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__491) -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc1) dtb__486); B_dData_dPair.f_Pair_second = (C_Expr_EAnn (value, ((v_ofExpr valueScope) (dtb__491).Frontend_dAst.f_BindingSig_sigType), (Frontend_dAst.v_nodeRefSpan (dtb__491).Frontend_dAst.f_BindingSig_sigRef))) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc1) dtb__486); B_dData_dPair.f_Pair_second = value }
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_BindingValue_BVal (dtb__492) -> (let valueScope = ((B_dData_dList.v_append (v_patBinders dtb__486)) mc0) in (let value = ((v_ofExpr valueScope) dtb__492) in (match dtb__488 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__493) -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc1) dtb__486); B_dData_dPair.f_Pair_second = (C_Expr_EAnn (value, ((v_ofExpr valueScope) (dtb__493).Frontend_dAst.f_BindingSig_sigType), (Frontend_dAst.v_nodeRefSpan (dtb__493).Frontend_dAst.f_BindingSig_sigRef))) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc1) dtb__486); B_dData_dPair.f_Pair_second = value }
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 544 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofLocalClause = (fun (scope : string B_dData_dList.t_List) (clause : Frontend_dAst.t_LocalClause) -> (let pats = (clause).Frontend_dAst.f_LocalClause_lcPats in { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (v_ofPat scope)) pats); B_dData_dPair.f_Pair_second = ((v_ofExpr ((B_dData_dList.v_append (v_bindersOfPats pats)) scope)) (clause).Frontend_dAst.f_LocalClause_lcBody) }))
# 550 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofAlt = (fun (scope : string B_dData_dList.t_List) (alt : Frontend_dAst.t_Alt) -> (let pat = (alt).Frontend_dAst.f_Alt_altPat in { B_dData_dPair.f_Pair_first = ((v_ofPat scope) pat); B_dData_dPair.f_Pair_second = ((v_ofExpr ((B_dData_dList.v_append (v_patBinders pat)) scope)) (alt).Frontend_dAst.f_Alt_altBody) }))
# 556 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofFieldValue = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__494; B_dData_dPair.f_Pair_second = dtb__495 } -> { B_dData_dPair.f_Pair_first = dtb__494; B_dData_dPair.f_Pair_second = ((v_ofExpr mc0) dtb__495) }
  | _ -> failwith "DT: impossible branch"
))
# 559 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofInterpPart = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__496) -> (C_InterpPart_IPHole (((v_ofExpr mc0) dtb__496)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__497) -> (C_InterpPart_IPText (dtb__497))
  | _ -> failwith "DT: impossible branch"
))
# 563 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofStmts = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__498, dtb__499) -> (match dtb__498 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__500, dtb__501, dtb__502) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DBind (((v_ofPat mc0) dtb__500), ((v_ofExpr mc0) dtb__501), (Frontend_dAst.v_nodeRefSpan dtb__502))), ((v_ofStmts ((B_dData_dList.v_append (v_patBinders dtb__500)) mc0)) dtb__499)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__503, dtb__504) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindingBinders) dtb__503)) mc0) in (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DLet (((B_dData_dList.v_map ((v_ofBinding bound) mc0)) dtb__503), (Frontend_dAst.v_nodeRefSpan dtb__504))), ((v_ofStmts bound) dtb__499))))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__505, dtb__506) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DExpr (((v_ofExpr mc0) dtb__505), (Frontend_dAst.v_nodeRefSpan dtb__506))), ((v_ofStmts mc0) dtb__499)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofCtor = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__507; Frontend_dAst.f_Ctor_ctorType = dtb__508; Frontend_dAst.f_Ctor_ctorArity = dtb__509; Frontend_dAst.f_Ctor_ctorRef = dtb__510 } -> { f_Ctor_ctorName = dtb__507; f_Ctor_ctorType = ((v_ofExpr mc0) dtb__508); f_Ctor_ctorArity = dtb__509; f_Ctor_ctorSpan = (Frontend_dAst.v_nodeRefSpan dtb__510) }
  | _ -> failwith "DT: impossible branch"
))

# 454 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofField = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__511; Frontend_dAst.f_Field_fieldType = dtb__512; Frontend_dAst.f_Field_fieldRef = dtb__513 } -> { f_Field_fieldName = dtb__511; f_Field_fieldType = ((v_ofExpr mc0) dtb__512); f_Field_fieldSpan = (Frontend_dAst.v_nodeRefSpan dtb__513) }
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitMethod = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__514; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__515; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__516 } -> { f_TraitMethod_traitMethodName = dtb__514; f_TraitMethod_traitMethodType = ((v_ofExpr mc0) dtb__515); f_TraitMethod_traitMethodSpan = (Frontend_dAst.v_nodeRefSpan dtb__516) }
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Frontend/Rast.vuna"
let v_astTraitParamName = (fun (p : Frontend_dAst.t_TraitParam) -> (p).Frontend_dAst.f_TraitParam_traitParamName)

# 588 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofMaybeExpr = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> (B_dData_dMaybe.C_Maybe_Just (((v_ofExpr mc0) dtb__517)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 585 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitParam = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_TraitParam) -> (match mc1 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__518; Frontend_dAst.f_TraitParam_traitParamKind = dtb__519 } -> { f_TraitParam_traitParamName = dtb__518; f_TraitParam_traitParamKind = ((v_ofMaybeExpr mc0) dtb__519) }
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofDecl = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__520, dtb__521, dtb__522, dtb__523) -> (C_Decl_DInstance (((B_dData_dList.v_map (v_ofExpr mc0)) dtb__520), ((v_ofExpr mc0) dtb__521), ((B_dData_dList.v_map (v_ofDecl mc0)) dtb__522), (Frontend_dAst.v_nodeRefSpan dtb__523)))
  | Frontend_dAst.C_Decl_DTrait (dtb__524, dtb__525, dtb__526, dtb__527, dtb__528) -> (let bound = ((B_dData_dList.v_append ((B_dData_dList.v_map v_astTraitParamName) dtb__525)) mc0) in (C_Decl_DTrait (dtb__524, ((B_dData_dList.v_map (v_ofTraitParam bound)) dtb__525), ((B_dData_dList.v_map (v_ofExpr bound)) dtb__526), ((B_dData_dList.v_map (v_ofTraitMethod bound)) dtb__527), (Frontend_dAst.v_nodeRefSpan dtb__528))))
  | Frontend_dAst.C_Decl_DRecord (dtb__529, dtb__530, dtb__531, dtb__532, dtb__533, dtb__534, dtb__535, dtb__536) -> (C_Decl_DRecord (dtb__529, dtb__530, ((B_dData_dList.v_map (v_ofField ((B_dData_dList.v_append dtb__530) mc0))) dtb__531), dtb__532, dtb__533, dtb__534, dtb__535, (Frontend_dAst.v_nodeRefSpan dtb__536)))
  | Frontend_dAst.C_Decl_DFun (dtb__537, dtb__538, dtb__539, dtb__540) -> (let bound = ((B_dData_dList.v_append (v_bindersOfPats dtb__538)) mc0) in (C_Decl_DFun (dtb__537, ((B_dData_dList.v_map (v_ofPat mc0)) dtb__538), ((v_ofExpr bound) dtb__539), (Frontend_dAst.v_nodeRefSpan dtb__540))))
  | Frontend_dAst.C_Decl_DSig (dtb__541, dtb__542, dtb__543, dtb__544) -> (C_Decl_DSig (dtb__541, ((B_dData_dList.v_map (v_ofExpr mc0)) dtb__542), ((v_ofExpr mc0) dtb__543), (Frontend_dAst.v_nodeRefSpan dtb__544)))
  | Frontend_dAst.C_Decl_DExtern (dtb__545, dtb__546, dtb__547, dtb__548) -> (C_Decl_DExtern (dtb__545, dtb__546, ((v_ofExpr mc0) dtb__547), (Frontend_dAst.v_nodeRefSpan dtb__548)))
  | Frontend_dAst.C_Decl_DAxiom (dtb__549, dtb__550, dtb__551) -> (C_Decl_DAxiom (dtb__549, ((v_ofExpr mc0) dtb__550), (Frontend_dAst.v_nodeRefSpan dtb__551)))
  | Frontend_dAst.C_Decl_DData (dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, dtb__560) -> (C_Decl_DData (dtb__552, dtb__553, ((v_ofExpr ((B_dData_dList.v_append dtb__553) mc0)) dtb__554), ((B_dData_dList.v_map (v_ofCtor ((B_dData_dList.v_append dtb__553) mc0))) dtb__555), dtb__556, dtb__557, dtb__558, dtb__559, (Frontend_dAst.v_nodeRefSpan dtb__560)))
  | _ -> failwith "DT: impossible branch"
))

# 401 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_ofDecl B_dData_dList.C_List_Nil)) decls))
