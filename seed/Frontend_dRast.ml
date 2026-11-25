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

# 135 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 144 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 168 "Vuna/Compiler/Frontend/Rast.vuna"
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
# 177 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightList = (fun (mc0 : t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> ((v_patWeight dtb__81) + (v_patWeightList dtb__82))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 181 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patWeightFields = (fun (mc0 : (string, t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> ((v_patWeight (B_dData_dPair.v_secondOf dtb__83)) + (v_patWeightFields dtb__84))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Rast.vuna"
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
# 206 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightList = (fun (mc0 : t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> ((v_exprWeight dtb__134) + (v_exprWeightList dtb__135))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 210 "Vuna/Compiler/Frontend/Rast.vuna"
and v_patExprWeight = (fun (mc0 : (t_Pat, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (((v_patWeight (B_dData_dPair.v_firstOf dtb__136)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__136))) + (v_patExprWeight dtb__137))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 214 "Vuna/Compiler/Frontend/Rast.vuna"
and v_clauseWeight = (fun (mc0 : (t_Pat B_dData_dList.t_List, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (((v_patWeightList (B_dData_dPair.v_firstOf dtb__138)) + (v_exprWeight (B_dData_dPair.v_secondOf dtb__138))) + (v_clauseWeight dtb__139))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 218 "Vuna/Compiler/Frontend/Rast.vuna"
and v_exprWeightFields = (fun (mc0 : (string, t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> ((v_exprWeight (B_dData_dPair.v_secondOf dtb__140)) + (v_exprWeightFields dtb__141))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 222 "Vuna/Compiler/Frontend/Rast.vuna"
and v_doStmtWeight = (fun (mc0 : t_DoStmt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> ((v_oneDoStmtWeight dtb__142) + (v_doStmtWeight dtb__143))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 226 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneDoStmtWeight = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__144, dtb__145) -> (1 + (v_patExprWeight dtb__144))
  | C_DoStmt_DExpr (dtb__146, dtb__147) -> (1 + (v_exprWeight dtb__146))
  | C_DoStmt_DBind (dtb__148, dtb__149, dtb__150) -> ((1 + (v_patWeight dtb__148)) + (v_exprWeight dtb__149))
  | _ -> failwith "DT: impossible branch"
))
# 231 "Vuna/Compiler/Frontend/Rast.vuna"
and v_interpWeight = (fun (mc0 : t_InterpPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> ((v_oneInterpWeight dtb__151) + (v_interpWeight dtb__152))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 235 "Vuna/Compiler/Frontend/Rast.vuna"
and v_oneInterpWeight = (fun (mc0 : t_InterpPart) -> (match mc0 with
  | C_InterpPart_IPHole (dtb__153) -> (1 + (v_exprWeight dtb__153))
  | C_InterpPart_IPText (dtb__154) -> 1
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exprBudget = (fun (base : int) (e : t_Expr) -> (base + (8 * (v_exprWeight e))))

# 244 "Vuna/Compiler/Frontend/Rast.vuna"
let v_patBudget = (fun (base : int) (p : t_Pat) -> (base + (8 * (v_patWeight p))))

# 247 "Vuna/Compiler/Frontend/Rast.vuna"
let v_doStmtSpan = (fun (mc0 : t_DoStmt) -> (match mc0 with
  | C_DoStmt_DLet (dtb__155, dtb__156) -> dtb__156
  | C_DoStmt_DExpr (dtb__157, dtb__158) -> dtb__158
  | C_DoStmt_DBind (dtb__159, dtb__160, dtb__161) -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 262 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorSpan = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__203; f_Ctor_ctorType = dtb__204; f_Ctor_ctorArity = dtb__205; f_Ctor_ctorSpan = dtb__206 } -> dtb__206
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldSpan = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__207; f_Field_fieldType = dtb__208; f_Field_fieldSpan = dtb__209 } -> dtb__209
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldName = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__210; f_Field_fieldType = dtb__211; f_Field_fieldSpan = dtb__212 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldType = (fun (mc0 : t_Field) -> (match mc0 with
  | { f_Field_fieldName = dtb__213; f_Field_fieldType = dtb__214; f_Field_fieldSpan = dtb__215 } -> dtb__214
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodName = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__216; f_TraitMethod_traitMethodType = dtb__217; f_TraitMethod_traitMethodSpan = dtb__218 } -> dtb__216
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodSpan = (fun (mc0 : t_TraitMethod) -> (match mc0 with
  | { f_TraitMethod_traitMethodName = dtb__219; f_TraitMethod_traitMethodType = dtb__220; f_TraitMethod_traitMethodSpan = dtb__221 } -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Frontend/Rast.vuna"
let v_exportItemSpan = (fun (item : Frontend_dAst.t_ExportItem) -> (Frontend_dAst.v_nodeRefSpan (Frontend_dAst.v_exportItemRef item)))

# 283 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (match dtb__222 with
  | C_Decl_DFun (dtb__224, dtb__225, dtb__226, dtb__227) -> (if (dtb__224 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__225; B_dData_dPair.f_Pair_second = dtb__226 }, ((v_collectClauses dtb__223) mc1))) else ((v_collectClauses dtb__223) mc1))
  | _ -> ((v_collectClauses dtb__223) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Frontend/Rast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 294 "Vuna/Compiler/Frontend/Rast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match dtb__228 with
  | { B_dData_dPair.f_Pair_first = dtb__230; B_dData_dPair.f_Pair_second = dtb__231 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__230)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 300 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorName = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__232; f_Ctor_ctorType = dtb__233; f_Ctor_ctorArity = dtb__234; f_Ctor_ctorSpan = dtb__235 } -> dtb__232
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 312 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 321 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorType = (fun (mc0 : t_Ctor) -> (match mc0 with
  | { f_Ctor_ctorName = dtb__240; f_Ctor_ctorType = dtb__241; f_Ctor_ctorArity = dtb__242; f_Ctor_ctorSpan = dtb__243 } -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 328 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> (if ((v_ctorName dtb__254) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__254).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__255))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 345 "Vuna/Compiler/Frontend/Rast.vuna"
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

# 358 "Vuna/Compiler/Frontend/Rast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 361 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> (B_dData_dList.C_List__x58__x58_ (dtb__317, ((B_dData_dList.v_map v_traitMethodName) dtb__320)))
  | C_Decl_DRecord (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> (B_dData_dList.C_List__x58__x58_ (dtb__322, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> (B_dData_dList.C_List__x58__x58_ (dtb__330, ((B_dData_dList.v_map v_ctorName) dtb__333)))
  | _ -> (v_declNames mc0)
))

# 368 "Vuna/Compiler/Frontend/Rast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> ((B_dData_dList.v_map v_traitMethodName) dtb__342)
  | C_Decl_DRecord (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> (B_dData_dList.C_List__x58__x58_ (dtb__344, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__352, dtb__353, dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360) -> ((B_dData_dList.v_map v_ctorName) dtb__355)
  | _ -> B_dData_dList.C_List_Nil
))

# 374 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 377 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__361, dtb__362, dtb__363, dtb__364, dtb__365) -> (B_dData_dList.C_List__x58__x58_ (dtb__361, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__366, dtb__367, dtb__368, dtb__369, dtb__370, dtb__371, dtb__372, dtb__373) -> (B_dData_dList.C_List__x58__x58_ (dtb__366, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__374, dtb__375, dtb__376, dtb__377, dtb__378, dtb__379, dtb__380, dtb__381, dtb__382) -> (B_dData_dList.C_List__x58__x58_ (dtb__374, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 383 "Vuna/Compiler/Frontend/Rast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 386 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__383, dtb__384, dtb__385, dtb__386, dtb__387, dtb__388, dtb__389, dtb__390) -> dtb__386
  | C_Decl_DData (dtb__391, dtb__392, dtb__393, dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> dtb__395
  | _ -> B_dData_dList.C_List_Nil
))

# 450 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofPat = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__400, dtb__401, dtb__402) -> (C_Pat_PRecord ((((Frontend_dRefs.v_rnameAt mc0) dtb__400) dtb__402), ((B_dData_dList.v_map (v_ofPatField mc0)) dtb__401), (Frontend_dAst.v_nodeRefSpan dtb__402)))
  | Frontend_dAst.C_Pat_PStr (dtb__403, dtb__404) -> (C_Pat_PStr (dtb__403, (Frontend_dAst.v_nodeRefSpan dtb__404)))
  | Frontend_dAst.C_Pat_PInt (dtb__405, dtb__406) -> (C_Pat_PInt (dtb__405, (Frontend_dAst.v_nodeRefSpan dtb__406)))
  | Frontend_dAst.C_Pat_PCon (dtb__407, dtb__408, dtb__409) -> (C_Pat_PCon ((((Frontend_dRefs.v_rnameAt mc0) dtb__407) dtb__409), ((B_dData_dList.v_map (v_ofPat mc0)) dtb__408), (Frontend_dAst.v_nodeRefSpan dtb__409)))
  | Frontend_dAst.C_Pat_PWild (dtb__410) -> (C_Pat_PWild ((Frontend_dAst.v_nodeRefSpan dtb__410)))
  | Frontend_dAst.C_Pat_PAs (dtb__411, dtb__412, dtb__413) -> (C_Pat_PAs (dtb__411, ((v_ofPat mc0) dtb__412), (Frontend_dAst.v_nodeRefSpan dtb__413)))
  | Frontend_dAst.C_Pat_PVar (dtb__414, dtb__415) -> (C_Pat_PVar (dtb__414, (Frontend_dAst.v_nodeRefSpan dtb__415)))
  | _ -> failwith "DT: impossible branch"
))
# 461 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofPatField = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = ((v_ofPat mc0) dtb__417) }
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofExpr = (fun (at : Frontend_dRefs.t_Annot) (e : Frontend_dAst.t_Expr) -> (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__418, dtb__419) -> (C_Expr_EVar ((((Frontend_dRefs.v_rnameAt at) dtb__418) dtb__419), (Frontend_dAst.v_nodeRefSpan dtb__419)))
  | Frontend_dAst.C_Expr_EInt (dtb__420, dtb__421) -> (C_Expr_EInt (dtb__420, (Frontend_dAst.v_nodeRefSpan dtb__421)))
  | Frontend_dAst.C_Expr_EStr (dtb__422, dtb__423) -> (C_Expr_EStr (dtb__422, (Frontend_dAst.v_nodeRefSpan dtb__423)))
  | Frontend_dAst.C_Expr_EFloat (dtb__424, dtb__425) -> (C_Expr_EFloat (dtb__424, (Frontend_dAst.v_nodeRefSpan dtb__425)))
  | Frontend_dAst.C_Expr_EInterp (dtb__426, dtb__427) -> (C_Expr_EInterp (((B_dData_dList.v_map (v_ofInterpPart at)) dtb__426), (Frontend_dAst.v_nodeRefSpan dtb__427)))
  | Frontend_dAst.C_Expr_ELam (dtb__428, dtb__429, dtb__430) -> (C_Expr_ELam (dtb__428, ((v_ofExpr at) dtb__429), (Frontend_dAst.v_nodeRefSpan dtb__430)))
  | Frontend_dAst.C_Expr_EApp (dtb__431, dtb__432, dtb__433) -> (match dtb__431 with
  | Frontend_dAst.C_Expr_EVar (dtb__434, dtb__435) -> (let nd_uscrut7 = dtb__432 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__437) -> (match dtb__437 with
  | B_dData_dList.C_List__x58__x58_ (dtb__438, dtb__439) -> (match dtb__439 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut15 = (Frontend_dReserved.v_classify dtb__434) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__440) -> (match dtb__440 with
  | Frontend_dReserved.C_Reserved_RsAscribe -> (C_Expr_EAnn (((v_ofExpr at) dtb__436), ((v_ofExpr at) dtb__438), (Frontend_dAst.v_nodeRefSpan dtb__433)))
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__431), ((B_dData_dList.v_map (v_ofExpr at)) dtb__432), (Frontend_dAst.v_nodeRefSpan dtb__433)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__431), ((B_dData_dList.v_map (v_ofExpr at)) dtb__432), (Frontend_dAst.v_nodeRefSpan dtb__433)))
))
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__431), ((B_dData_dList.v_map (v_ofExpr at)) dtb__432), (Frontend_dAst.v_nodeRefSpan dtb__433)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__431), ((B_dData_dList.v_map (v_ofExpr at)) dtb__432), (Frontend_dAst.v_nodeRefSpan dtb__433)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__431), ((B_dData_dList.v_map (v_ofExpr at)) dtb__432), (Frontend_dAst.v_nodeRefSpan dtb__433)))
))
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__431), ((B_dData_dList.v_map (v_ofExpr at)) dtb__432), (Frontend_dAst.v_nodeRefSpan dtb__433)))
)
  | Frontend_dAst.C_Expr_EPi (dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446) -> (C_Expr_EPi (dtb__441, dtb__442, dtb__443, ((v_ofExpr at) dtb__444), ((v_ofExpr at) dtb__445), (Frontend_dAst.v_nodeRefSpan dtb__446)))
  | Frontend_dAst.C_Expr_ELet (dtb__447, dtb__448, dtb__449, dtb__450) -> (C_Expr_ELet (((B_dData_dList.v_map (v_ofBinding at)) dtb__447), ((v_ofExpr at) dtb__448), dtb__449, (Frontend_dAst.v_nodeRefSpan dtb__450)))
  | Frontend_dAst.C_Expr_ECase (dtb__451, dtb__452, dtb__453) -> (C_Expr_ECase (((v_ofExpr at) dtb__451), ((B_dData_dList.v_map (v_ofAlt at)) dtb__452), (Frontend_dAst.v_nodeRefSpan dtb__453)))
  | Frontend_dAst.C_Expr_EIf (dtb__454, dtb__455, dtb__456, dtb__457) -> (C_Expr_EIf (((v_ofExpr at) dtb__454), ((v_ofExpr at) dtb__455), ((v_ofExpr at) dtb__456), (Frontend_dAst.v_nodeRefSpan dtb__457)))
  | Frontend_dAst.C_Expr_EField (dtb__458, dtb__459, dtb__460) -> (C_Expr_EField (((v_ofExpr at) dtb__458), dtb__459, (Frontend_dAst.v_nodeRefSpan dtb__460)))
  | Frontend_dAst.C_Expr_ERecord (dtb__461, dtb__462, dtb__463) -> (C_Expr_ERecord ((((Frontend_dRefs.v_rnameAt at) dtb__461) dtb__463), ((B_dData_dList.v_map (v_ofFieldValue at)) dtb__462), (Frontend_dAst.v_nodeRefSpan dtb__463)))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__464, dtb__465, dtb__466) -> (C_Expr_ERecUpdate (((v_ofExpr at) dtb__464), ((B_dData_dList.v_map (v_ofFieldValue at)) dtb__465), (Frontend_dAst.v_nodeRefSpan dtb__466)))
  | Frontend_dAst.C_Expr_EDo (dtb__467, dtb__468) -> (C_Expr_EDo (((v_ofStmts at) dtb__467), (Frontend_dAst.v_nodeRefSpan dtb__468)))
  | _ -> failwith "DT: impossible branch"
))
# 498 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofBinding = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Binding) -> (match mc1 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__469; Frontend_dAst.f_Binding_bindValue = dtb__470; Frontend_dAst.f_Binding_bindSig = dtb__471; Frontend_dAst.f_Binding_bindRef = dtb__472 } -> (match dtb__470 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__473) -> (let value = (C_Expr_ELocalFun (((B_dData_dList.v_map (v_ofLocalClause mc0)) dtb__473), (Frontend_dAst.v_nodeRefSpan dtb__472))) in (match dtb__471 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__474) -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__469); B_dData_dPair.f_Pair_second = (C_Expr_EAnn (value, ((v_ofExpr mc0) (dtb__474).Frontend_dAst.f_BindingSig_sigType), (Frontend_dAst.v_nodeRefSpan (dtb__474).Frontend_dAst.f_BindingSig_sigRef))) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__469); B_dData_dPair.f_Pair_second = value }
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_BindingValue_BVal (dtb__475) -> (let value = ((v_ofExpr mc0) dtb__475) in (match dtb__471 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__476) -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__469); B_dData_dPair.f_Pair_second = (C_Expr_EAnn (value, ((v_ofExpr mc0) (dtb__476).Frontend_dAst.f_BindingSig_sigType), (Frontend_dAst.v_nodeRefSpan (dtb__476).Frontend_dAst.f_BindingSig_sigRef))) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__469); B_dData_dPair.f_Pair_second = value }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 513 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofLocalClause = (fun (at : Frontend_dRefs.t_Annot) (clause : Frontend_dAst.t_LocalClause) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (v_ofPat at)) (clause).Frontend_dAst.f_LocalClause_lcPats); B_dData_dPair.f_Pair_second = ((v_ofExpr at) (clause).Frontend_dAst.f_LocalClause_lcBody) })
# 516 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofAlt = (fun (at : Frontend_dRefs.t_Annot) (alt : Frontend_dAst.t_Alt) -> { B_dData_dPair.f_Pair_first = ((v_ofPat at) (alt).Frontend_dAst.f_Alt_altPat); B_dData_dPair.f_Pair_second = ((v_ofExpr at) (alt).Frontend_dAst.f_Alt_altBody) })
# 519 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofFieldValue = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__477; B_dData_dPair.f_Pair_second = dtb__478 } -> { B_dData_dPair.f_Pair_first = dtb__477; B_dData_dPair.f_Pair_second = ((v_ofExpr mc0) dtb__478) }
  | _ -> failwith "DT: impossible branch"
))
# 522 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofInterpPart = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__479) -> (C_InterpPart_IPHole (((v_ofExpr mc0) dtb__479)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__480) -> (C_InterpPart_IPText (dtb__480))
  | _ -> failwith "DT: impossible branch"
))
# 526 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofStmts = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__481, dtb__482) -> (match dtb__481 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__483, dtb__484, dtb__485) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DBind (((v_ofPat mc0) dtb__483), ((v_ofExpr mc0) dtb__484), (Frontend_dAst.v_nodeRefSpan dtb__485))), ((v_ofStmts mc0) dtb__482)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__486, dtb__487) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DLet (((B_dData_dList.v_map (v_ofBinding mc0)) dtb__486), (Frontend_dAst.v_nodeRefSpan dtb__487))), ((v_ofStmts mc0) dtb__482)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__488, dtb__489) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DExpr (((v_ofExpr mc0) dtb__488), (Frontend_dAst.v_nodeRefSpan dtb__489))), ((v_ofStmts mc0) dtb__482)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 437 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofCtor = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__490; Frontend_dAst.f_Ctor_ctorType = dtb__491; Frontend_dAst.f_Ctor_ctorArity = dtb__492; Frontend_dAst.f_Ctor_ctorRef = dtb__493 } -> { f_Ctor_ctorName = dtb__490; f_Ctor_ctorType = ((v_ofExpr mc0) dtb__491); f_Ctor_ctorArity = dtb__492; f_Ctor_ctorSpan = (Frontend_dAst.v_nodeRefSpan dtb__493) }
  | _ -> failwith "DT: impossible branch"
))

# 440 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofField = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__494; Frontend_dAst.f_Field_fieldType = dtb__495; Frontend_dAst.f_Field_fieldRef = dtb__496 } -> { f_Field_fieldName = dtb__494; f_Field_fieldType = ((v_ofExpr mc0) dtb__495); f_Field_fieldSpan = (Frontend_dAst.v_nodeRefSpan dtb__496) }
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitMethod = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__497; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__498; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__499 } -> { f_TraitMethod_traitMethodName = dtb__497; f_TraitMethod_traitMethodType = ((v_ofExpr mc0) dtb__498); f_TraitMethod_traitMethodSpan = (Frontend_dAst.v_nodeRefSpan dtb__499) }
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofMaybeExpr = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__500) -> (B_dData_dMaybe.C_Maybe_Just (((v_ofExpr mc0) dtb__500)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitParam = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_TraitParam) -> (match mc1 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__501; Frontend_dAst.f_TraitParam_traitParamKind = dtb__502 } -> { f_TraitParam_traitParamName = dtb__501; f_TraitParam_traitParamKind = ((v_ofMaybeExpr mc0) dtb__502) }
  | _ -> failwith "DT: impossible branch"
))

# 407 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofDecl = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__503, dtb__504, dtb__505, dtb__506) -> (C_Decl_DInstance (((B_dData_dList.v_map (v_ofExpr mc0)) dtb__503), ((v_ofExpr mc0) dtb__504), ((B_dData_dList.v_map (v_ofDecl mc0)) dtb__505), (Frontend_dAst.v_nodeRefSpan dtb__506)))
  | Frontend_dAst.C_Decl_DTrait (dtb__507, dtb__508, dtb__509, dtb__510, dtb__511) -> (C_Decl_DTrait (dtb__507, ((B_dData_dList.v_map (v_ofTraitParam mc0)) dtb__508), ((B_dData_dList.v_map (v_ofExpr mc0)) dtb__509), ((B_dData_dList.v_map (v_ofTraitMethod mc0)) dtb__510), (Frontend_dAst.v_nodeRefSpan dtb__511)))
  | Frontend_dAst.C_Decl_DRecord (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516, dtb__517, dtb__518, dtb__519) -> (C_Decl_DRecord (dtb__512, dtb__513, ((B_dData_dList.v_map (v_ofField mc0)) dtb__514), dtb__515, dtb__516, dtb__517, dtb__518, (Frontend_dAst.v_nodeRefSpan dtb__519)))
  | Frontend_dAst.C_Decl_DFun (dtb__520, dtb__521, dtb__522, dtb__523) -> (C_Decl_DFun (dtb__520, ((B_dData_dList.v_map (v_ofPat mc0)) dtb__521), ((v_ofExpr mc0) dtb__522), (Frontend_dAst.v_nodeRefSpan dtb__523)))
  | Frontend_dAst.C_Decl_DSig (dtb__524, dtb__525, dtb__526, dtb__527) -> (C_Decl_DSig (dtb__524, ((B_dData_dList.v_map (v_ofExpr mc0)) dtb__525), ((v_ofExpr mc0) dtb__526), (Frontend_dAst.v_nodeRefSpan dtb__527)))
  | Frontend_dAst.C_Decl_DExtern (dtb__528, dtb__529, dtb__530, dtb__531) -> (C_Decl_DExtern (dtb__528, dtb__529, ((v_ofExpr mc0) dtb__530), (Frontend_dAst.v_nodeRefSpan dtb__531)))
  | Frontend_dAst.C_Decl_DAxiom (dtb__532, dtb__533, dtb__534) -> (C_Decl_DAxiom (dtb__532, ((v_ofExpr mc0) dtb__533), (Frontend_dAst.v_nodeRefSpan dtb__534)))
  | Frontend_dAst.C_Decl_DData (dtb__535, dtb__536, dtb__537, dtb__538, dtb__539, dtb__540, dtb__541, dtb__542, dtb__543) -> (C_Decl_DData (dtb__535, dtb__536, ((v_ofExpr mc0) dtb__537), ((B_dData_dList.v_map (v_ofCtor mc0)) dtb__538), dtb__539, dtb__540, dtb__541, dtb__542, (Frontend_dAst.v_nodeRefSpan dtb__543)))
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofDeclsWith = (fun (at : Frontend_dRefs.t_Annot) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_ofDecl at)) decls))

# 399 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_ofDeclsWith (Frontend_dRefs.v_annotateDecls decls)) decls))
