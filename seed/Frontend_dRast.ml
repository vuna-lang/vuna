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
let v_exportItemSpan = (fun (item : Frontend_dAst.t_ExportItem) -> (Frontend_dAst.v_nodeRefSpan (Frontend_dAst.v_exportItemRef item)))

# 265 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_collectClauses = (fun (mc0 : t_Decl B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (match dtb__203 with
  | C_Decl_DFun (dtb__205, dtb__206, dtb__207, dtb__208) -> (if (dtb__205 = mc1) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 }, ((v_collectClauses dtb__204) mc1))) else ((v_collectClauses dtb__204) mc1))
  | _ -> ((v_collectClauses dtb__204) mc1)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Frontend/Rast.vuna"
let v_clausesFor = (fun (decls : t_Decl B_dData_dList.t_List) (name : string) -> ((v_collectClauses decls) name))

# 276 "Vuna/Compiler/Frontend/Rast.vuna"
let v_funArity = (fun (name : string) (decls : t_Decl B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_clausesFor decls) name) in (match nd_uscrut2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (match dtb__209 with
  | { B_dData_dPair.f_Pair_first = dtb__211; B_dData_dPair.f_Pair_second = dtb__212 } -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__211)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 285 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorShortName = (fun (name : string) -> (Base_dSource.v_lastSeg name))

# 291 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorDisplayName = (fun (name : string) -> (let nd_uscrut1 = (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) in (match nd_uscrut1 with
  | { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__214 } -> (match dtb__213 with
  | B_dData_dList.C_List_Nil -> dtb__214
  | _ -> (match (B_dData_dList.v_reverse dtb__213) with
  | B_dData_dList.C_List_Nil -> dtb__214
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (String.concat "" [dtb__215; "."; dtb__214])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 300 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_typeArity = (fun (mc0 : t_Expr) -> (match mc0 with
  | C_Expr_EApp (dtb__217, dtb__218, dtb__219) -> (match dtb__217 with
  | C_Expr_EVar (dtb__220, dtb__221) -> (match dtb__220 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__222) -> (if (dtb__222 = "->") then (match dtb__218 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (match dtb__224 with
  | B_dData_dList.C_List__x58__x58_ (dtb__225, dtb__226) -> (match dtb__226 with
  | B_dData_dList.C_List_Nil -> (1 + (v_typeArity dtb__225))
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

# 353 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declTypeNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231) -> (B_dData_dList.C_List__x58__x58_ (dtb__227, B_dData_dList.C_List_Nil))
  | C_Decl_DRecord (dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239) -> (B_dData_dList.C_List__x58__x58_ (dtb__232, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> (B_dData_dList.C_List__x58__x58_ (dtb__240, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
))

# 359 "Vuna/Compiler/Frontend/Rast.vuna"
let v_typeNamesOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declTypeNames) decls))

# 362 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declDerivings = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DRecord (dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__252
  | C_Decl_DData (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> dtb__261
  | _ -> B_dData_dList.C_List_Nil
))

# 426 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofPat = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__266, dtb__267, dtb__268) -> (C_Pat_PRecord ((((Frontend_dRefs.v_rnameAt mc0) dtb__266) dtb__268), ((B_dData_dList.v_map (v_ofPatField mc0)) dtb__267), (Frontend_dAst.v_nodeRefSpan dtb__268)))
  | Frontend_dAst.C_Pat_PStr (dtb__269, dtb__270) -> (C_Pat_PStr (dtb__269, (Frontend_dAst.v_nodeRefSpan dtb__270)))
  | Frontend_dAst.C_Pat_PInt (dtb__271, dtb__272) -> (C_Pat_PInt (dtb__271, (Frontend_dAst.v_nodeRefSpan dtb__272)))
  | Frontend_dAst.C_Pat_PCon (dtb__273, dtb__274, dtb__275) -> (C_Pat_PCon ((((Frontend_dRefs.v_rnameAt mc0) dtb__273) dtb__275), ((B_dData_dList.v_map (v_ofPat mc0)) dtb__274), (Frontend_dAst.v_nodeRefSpan dtb__275)))
  | Frontend_dAst.C_Pat_PWild (dtb__276) -> (C_Pat_PWild ((Frontend_dAst.v_nodeRefSpan dtb__276)))
  | Frontend_dAst.C_Pat_PAs (dtb__277, dtb__278, dtb__279) -> (C_Pat_PAs (dtb__277, ((v_ofPat mc0) dtb__278), (Frontend_dAst.v_nodeRefSpan dtb__279)))
  | Frontend_dAst.C_Pat_PVar (dtb__280, dtb__281) -> (C_Pat_PVar (dtb__280, (Frontend_dAst.v_nodeRefSpan dtb__281)))
  | _ -> failwith "DT: impossible branch"
))
# 437 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofPatField = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = ((v_ofPat mc0) dtb__283) }
  | _ -> failwith "DT: impossible branch"
))

# 441 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofExpr = (fun (at : Frontend_dRefs.t_Annot) (e : Frontend_dAst.t_Expr) -> (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__284, dtb__285) -> (C_Expr_EVar ((((Frontend_dRefs.v_rnameAt at) dtb__284) dtb__285), (Frontend_dAst.v_nodeRefSpan dtb__285)))
  | Frontend_dAst.C_Expr_EInt (dtb__286, dtb__287) -> (C_Expr_EInt (dtb__286, (Frontend_dAst.v_nodeRefSpan dtb__287)))
  | Frontend_dAst.C_Expr_EStr (dtb__288, dtb__289) -> (C_Expr_EStr (dtb__288, (Frontend_dAst.v_nodeRefSpan dtb__289)))
  | Frontend_dAst.C_Expr_EFloat (dtb__290, dtb__291) -> (C_Expr_EFloat (dtb__290, (Frontend_dAst.v_nodeRefSpan dtb__291)))
  | Frontend_dAst.C_Expr_EInterp (dtb__292, dtb__293) -> (C_Expr_EInterp (((B_dData_dList.v_map (v_ofInterpPart at)) dtb__292), (Frontend_dAst.v_nodeRefSpan dtb__293)))
  | Frontend_dAst.C_Expr_ELam (dtb__294, dtb__295, dtb__296) -> (C_Expr_ELam (dtb__294, ((v_ofExpr at) dtb__295), (Frontend_dAst.v_nodeRefSpan dtb__296)))
  | Frontend_dAst.C_Expr_EApp (dtb__297, dtb__298, dtb__299) -> (match dtb__297 with
  | Frontend_dAst.C_Expr_EVar (dtb__300, dtb__301) -> (let nd_uscrut7 = dtb__298 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__302, dtb__303) -> (match dtb__303 with
  | B_dData_dList.C_List__x58__x58_ (dtb__304, dtb__305) -> (match dtb__305 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut15 = (Frontend_dReserved.v_classify dtb__300) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__306) -> (match dtb__306 with
  | Frontend_dReserved.C_Reserved_RsAscribe -> (C_Expr_EAnn (((v_ofExpr at) dtb__302), ((v_ofExpr at) dtb__304), (Frontend_dAst.v_nodeRefSpan dtb__299)))
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__297), ((B_dData_dList.v_map (v_ofExpr at)) dtb__298), (Frontend_dAst.v_nodeRefSpan dtb__299)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__297), ((B_dData_dList.v_map (v_ofExpr at)) dtb__298), (Frontend_dAst.v_nodeRefSpan dtb__299)))
))
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__297), ((B_dData_dList.v_map (v_ofExpr at)) dtb__298), (Frontend_dAst.v_nodeRefSpan dtb__299)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__297), ((B_dData_dList.v_map (v_ofExpr at)) dtb__298), (Frontend_dAst.v_nodeRefSpan dtb__299)))
)
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__297), ((B_dData_dList.v_map (v_ofExpr at)) dtb__298), (Frontend_dAst.v_nodeRefSpan dtb__299)))
))
  | _ -> (C_Expr_EApp (((v_ofExpr at) dtb__297), ((B_dData_dList.v_map (v_ofExpr at)) dtb__298), (Frontend_dAst.v_nodeRefSpan dtb__299)))
)
  | Frontend_dAst.C_Expr_EPi (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> (C_Expr_EPi (dtb__307, dtb__308, dtb__309, ((v_ofExpr at) dtb__310), ((v_ofExpr at) dtb__311), (Frontend_dAst.v_nodeRefSpan dtb__312)))
  | Frontend_dAst.C_Expr_ELet (dtb__313, dtb__314, dtb__315, dtb__316) -> (C_Expr_ELet (((B_dData_dList.v_map (v_ofBinding at)) dtb__313), ((v_ofExpr at) dtb__314), dtb__315, (Frontend_dAst.v_nodeRefSpan dtb__316)))
  | Frontend_dAst.C_Expr_ECase (dtb__317, dtb__318, dtb__319) -> (C_Expr_ECase (((v_ofExpr at) dtb__317), ((B_dData_dList.v_map (v_ofAlt at)) dtb__318), (Frontend_dAst.v_nodeRefSpan dtb__319)))
  | Frontend_dAst.C_Expr_EIf (dtb__320, dtb__321, dtb__322, dtb__323) -> (C_Expr_EIf (((v_ofExpr at) dtb__320), ((v_ofExpr at) dtb__321), ((v_ofExpr at) dtb__322), (Frontend_dAst.v_nodeRefSpan dtb__323)))
  | Frontend_dAst.C_Expr_EField (dtb__324, dtb__325, dtb__326) -> (C_Expr_EField (((v_ofExpr at) dtb__324), dtb__325, (Frontend_dAst.v_nodeRefSpan dtb__326)))
  | Frontend_dAst.C_Expr_ERecord (dtb__327, dtb__328, dtb__329) -> (C_Expr_ERecord ((((Frontend_dRefs.v_rnameAt at) dtb__327) dtb__329), ((B_dData_dList.v_map (v_ofFieldValue at)) dtb__328), (Frontend_dAst.v_nodeRefSpan dtb__329)))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__330, dtb__331, dtb__332) -> (C_Expr_ERecUpdate (((v_ofExpr at) dtb__330), ((B_dData_dList.v_map (v_ofFieldValue at)) dtb__331), (Frontend_dAst.v_nodeRefSpan dtb__332)))
  | Frontend_dAst.C_Expr_EDo (dtb__333, dtb__334) -> (C_Expr_EDo (((v_ofStmts at) dtb__333), (Frontend_dAst.v_nodeRefSpan dtb__334)))
  | _ -> failwith "DT: impossible branch"
))
# 474 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofBinding = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Binding) -> (match mc1 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__335; Frontend_dAst.f_Binding_bindValue = dtb__336; Frontend_dAst.f_Binding_bindSig = dtb__337; Frontend_dAst.f_Binding_bindRef = dtb__338 } -> (match dtb__336 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__339) -> (let value = (C_Expr_ELocalFun (((B_dData_dList.v_map (v_ofLocalClause mc0)) dtb__339), (Frontend_dAst.v_nodeRefSpan dtb__338))) in (match dtb__337 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__340) -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__335); B_dData_dPair.f_Pair_second = (C_Expr_EAnn (value, ((v_ofExpr mc0) (dtb__340).Frontend_dAst.f_BindingSig_sigType), (Frontend_dAst.v_nodeRefSpan (dtb__340).Frontend_dAst.f_BindingSig_sigRef))) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__335); B_dData_dPair.f_Pair_second = value }
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dAst.C_BindingValue_BVal (dtb__341) -> (let value = ((v_ofExpr mc0) dtb__341) in (match dtb__337 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__342) -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__335); B_dData_dPair.f_Pair_second = (C_Expr_EAnn (value, ((v_ofExpr mc0) (dtb__342).Frontend_dAst.f_BindingSig_sigType), (Frontend_dAst.v_nodeRefSpan (dtb__342).Frontend_dAst.f_BindingSig_sigRef))) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = ((v_ofPat mc0) dtb__335); B_dData_dPair.f_Pair_second = value }
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 489 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofLocalClause = (fun (at : Frontend_dRefs.t_Annot) (clause : Frontend_dAst.t_LocalClause) -> { B_dData_dPair.f_Pair_first = ((B_dData_dList.v_map (v_ofPat at)) (clause).Frontend_dAst.f_LocalClause_lcPats); B_dData_dPair.f_Pair_second = ((v_ofExpr at) (clause).Frontend_dAst.f_LocalClause_lcBody) })
# 492 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofAlt = (fun (at : Frontend_dRefs.t_Annot) (alt : Frontend_dAst.t_Alt) -> { B_dData_dPair.f_Pair_first = ((v_ofPat at) (alt).Frontend_dAst.f_Alt_altPat); B_dData_dPair.f_Pair_second = ((v_ofExpr at) (alt).Frontend_dAst.f_Alt_altBody) })
# 495 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofFieldValue = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match mc1 with
  | { B_dData_dPair.f_Pair_first = dtb__343; B_dData_dPair.f_Pair_second = dtb__344 } -> { B_dData_dPair.f_Pair_first = dtb__343; B_dData_dPair.f_Pair_second = ((v_ofExpr mc0) dtb__344) }
  | _ -> failwith "DT: impossible branch"
))
# 498 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofInterpPart = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_InterpPart) -> (match mc1 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__345) -> (C_InterpPart_IPHole (((v_ofExpr mc0) dtb__345)))
  | Frontend_dAst.C_InterpPart_IPText (dtb__346) -> (C_InterpPart_IPText (dtb__346))
  | _ -> failwith "DT: impossible branch"
))
# 502 "Vuna/Compiler/Frontend/Rast.vuna"
and v_ofStmts = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (match dtb__347 with
  | Frontend_dAst.C_DoStmt_DBind (dtb__349, dtb__350, dtb__351) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DBind (((v_ofPat mc0) dtb__349), ((v_ofExpr mc0) dtb__350), (Frontend_dAst.v_nodeRefSpan dtb__351))), ((v_ofStmts mc0) dtb__348)))
  | Frontend_dAst.C_DoStmt_DLet (dtb__352, dtb__353) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DLet (((B_dData_dList.v_map (v_ofBinding mc0)) dtb__352), (Frontend_dAst.v_nodeRefSpan dtb__353))), ((v_ofStmts mc0) dtb__348)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb__354, dtb__355) -> (B_dData_dList.C_List__x58__x58_ ((C_DoStmt_DExpr (((v_ofExpr mc0) dtb__354), (Frontend_dAst.v_nodeRefSpan dtb__355))), ((v_ofStmts mc0) dtb__348)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofCtor = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Ctor) -> (match mc1 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__356; Frontend_dAst.f_Ctor_ctorType = dtb__357; Frontend_dAst.f_Ctor_ctorArity = dtb__358; Frontend_dAst.f_Ctor_ctorRef = dtb__359 } -> { f_Ctor_ctorName = dtb__356; f_Ctor_ctorType = ((v_ofExpr mc0) dtb__357); f_Ctor_ctorArity = dtb__358; f_Ctor_ctorSpan = (Frontend_dAst.v_nodeRefSpan dtb__359) }
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofField = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Field) -> (match mc1 with
  | { Frontend_dAst.f_Field_fieldName = dtb__360; Frontend_dAst.f_Field_fieldType = dtb__361; Frontend_dAst.f_Field_fieldRef = dtb__362 } -> { f_Field_fieldName = dtb__360; f_Field_fieldType = ((v_ofExpr mc0) dtb__361); f_Field_fieldSpan = (Frontend_dAst.v_nodeRefSpan dtb__362) }
  | _ -> failwith "DT: impossible branch"
))

# 419 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitMethod = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_TraitMethod) -> (match mc1 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__363; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__364; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__365 } -> { f_TraitMethod_traitMethodName = dtb__363; f_TraitMethod_traitMethodType = ((v_ofExpr mc0) dtb__364); f_TraitMethod_traitMethodSpan = (Frontend_dAst.v_nodeRefSpan dtb__365) }
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofMaybeExpr = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (B_dData_dMaybe.C_Maybe_Just (((v_ofExpr mc0) dtb__366)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 422 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofTraitParam = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_TraitParam) -> (match mc1 with
  | { Frontend_dAst.f_TraitParam_traitParamName = dtb__367; Frontend_dAst.f_TraitParam_traitParamKind = dtb__368 } -> { f_TraitParam_traitParamName = dtb__367; f_TraitParam_traitParamKind = ((v_ofMaybeExpr mc0) dtb__368) }
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_ofDecl = (fun (mc0 : Frontend_dRefs.t_Annot) (mc1 : Frontend_dAst.t_Decl) -> (match mc1 with
  | Frontend_dAst.C_Decl_DInstance (dtb__369, dtb__370, dtb__371, dtb__372) -> (C_Decl_DInstance (((B_dData_dList.v_map (v_ofExpr mc0)) dtb__369), ((v_ofExpr mc0) dtb__370), ((B_dData_dList.v_map (v_ofDecl mc0)) dtb__371), (Frontend_dAst.v_nodeRefSpan dtb__372)))
  | Frontend_dAst.C_Decl_DTrait (dtb__373, dtb__374, dtb__375, dtb__376, dtb__377) -> (C_Decl_DTrait (dtb__373, ((B_dData_dList.v_map (v_ofTraitParam mc0)) dtb__374), ((B_dData_dList.v_map (v_ofExpr mc0)) dtb__375), ((B_dData_dList.v_map (v_ofTraitMethod mc0)) dtb__376), (Frontend_dAst.v_nodeRefSpan dtb__377)))
  | Frontend_dAst.C_Decl_DRecord (dtb__378, dtb__379, dtb__380, dtb__381, dtb__382, dtb__383, dtb__384, dtb__385) -> (C_Decl_DRecord (dtb__378, dtb__379, ((B_dData_dList.v_map (v_ofField mc0)) dtb__380), dtb__381, dtb__382, dtb__383, dtb__384, (Frontend_dAst.v_nodeRefSpan dtb__385)))
  | Frontend_dAst.C_Decl_DFun (dtb__386, dtb__387, dtb__388, dtb__389) -> (C_Decl_DFun (dtb__386, ((B_dData_dList.v_map (v_ofPat mc0)) dtb__387), ((v_ofExpr mc0) dtb__388), (Frontend_dAst.v_nodeRefSpan dtb__389)))
  | Frontend_dAst.C_Decl_DSig (dtb__390, dtb__391, dtb__392, dtb__393) -> (C_Decl_DSig (dtb__390, ((B_dData_dList.v_map (v_ofExpr mc0)) dtb__391), ((v_ofExpr mc0) dtb__392), (Frontend_dAst.v_nodeRefSpan dtb__393)))
  | Frontend_dAst.C_Decl_DExtern (dtb__394, dtb__395, dtb__396, dtb__397) -> (C_Decl_DExtern (dtb__394, dtb__395, ((v_ofExpr mc0) dtb__396), (Frontend_dAst.v_nodeRefSpan dtb__397)))
  | Frontend_dAst.C_Decl_DAxiom (dtb__398, dtb__399, dtb__400) -> (C_Decl_DAxiom (dtb__398, ((v_ofExpr mc0) dtb__399), (Frontend_dAst.v_nodeRefSpan dtb__400)))
  | Frontend_dAst.C_Decl_DData (dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409) -> (C_Decl_DData (dtb__401, dtb__402, ((v_ofExpr mc0) dtb__403), ((B_dData_dList.v_map (v_ofCtor mc0)) dtb__404), dtb__405, dtb__406, dtb__407, dtb__408, (Frontend_dAst.v_nodeRefSpan dtb__409)))
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofDeclsWith = (fun (at : Frontend_dRefs.t_Annot) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_map (v_ofDecl at)) decls))

# 375 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ofDecls = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((v_ofDeclsWith (Frontend_dRefs.v_annotateDecls decls)) decls))

# 22 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldName = (fun (p : t_Field) -> (match p with
  | { f_Field_fieldName = dtb__410; f_Field_fieldType = dtb__411; f_Field_fieldSpan = dtb__412 } -> dtb__410
  | _ -> failwith "DT: impossible branch"
))

# 23 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldType = (fun (p : t_Field) -> (match p with
  | { f_Field_fieldName = dtb__413; f_Field_fieldType = dtb__414; f_Field_fieldSpan = dtb__415 } -> dtb__414
  | _ -> failwith "DT: impossible branch"
))

# 24 "Vuna/Compiler/Frontend/Rast.vuna"
let v_fieldSpan = (fun (p : t_Field) -> (match p with
  | { f_Field_fieldName = dtb__416; f_Field_fieldType = dtb__417; f_Field_fieldSpan = dtb__418 } -> dtb__418
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodName = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__419; f_TraitMethod_traitMethodType = dtb__420; f_TraitMethod_traitMethodSpan = dtb__421 } -> dtb__419
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodType = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__422; f_TraitMethod_traitMethodType = dtb__423; f_TraitMethod_traitMethodSpan = dtb__424 } -> dtb__423
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitMethodSpan = (fun (p : t_TraitMethod) -> (match p with
  | { f_TraitMethod_traitMethodName = dtb__425; f_TraitMethod_traitMethodType = dtb__426; f_TraitMethod_traitMethodSpan = dtb__427 } -> dtb__427
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitParamName = (fun (p : t_TraitParam) -> (match p with
  | { f_TraitParam_traitParamName = dtb__428; f_TraitParam_traitParamKind = dtb__429 } -> dtb__428
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Frontend/Rast.vuna"
let v_traitParamKind = (fun (p : t_TraitParam) -> (match p with
  | { f_TraitParam_traitParamName = dtb__430; f_TraitParam_traitParamKind = dtb__431 } -> dtb__431
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorName = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__432; f_Ctor_ctorType = dtb__433; f_Ctor_ctorArity = dtb__434; f_Ctor_ctorSpan = dtb__435 } -> dtb__432
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_lookupCtorArity = (fun (mc0 : string) (mc1 : t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__437) -> (if ((v_ctorName dtb__436) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((dtb__436).f_Ctor_ctorArity)) else ((v_lookupCtorArity mc0) dtb__437))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 309 "Vuna/Compiler/Frontend/Rast.vuna"
let rec v_declCtorArity = (fun (mc0 : string) (mc1 : t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__438, dtb__439) -> (match dtb__438 with
  | C_Decl_DData (dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447, dtb__448) -> (match ((v_lookupCtorArity mc0) dtb__443) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__449) -> (B_dData_dMaybe.C_Maybe_Just (dtb__449))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_declCtorArity mc0) dtb__439)
  | _ -> failwith "DT: impossible branch"
)
  | C_Decl_DRecord (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454, dtb__455, dtb__456, dtb__457) -> (if (mc0 = dtb__450) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_length dtb__452))) else ((v_declCtorArity mc0) dtb__439))
  | _ -> ((v_declCtorArity mc0) dtb__439)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DInstance (dtb__458, dtb__459, dtb__460, dtb__461) -> B_dData_dList.C_List_Nil
  | C_Decl_DTrait (dtb__462, dtb__463, dtb__464, dtb__465, dtb__466) -> ((B_dData_dList.v_map v_traitMethodName) dtb__465)
  | C_Decl_DRecord (dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473, dtb__474) -> (B_dData_dList.C_List__x58__x58_ (dtb__467, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__475, dtb__476, dtb__477, dtb__478, dtb__479, dtb__480, dtb__481, dtb__482, dtb__483) -> ((B_dData_dList.v_map v_ctorName) dtb__478)
  | C_Decl_DSig (dtb__484, dtb__485, dtb__486, dtb__487) -> (B_dData_dList.C_List__x58__x58_ (dtb__484, B_dData_dList.C_List_Nil))
  | C_Decl_DExtern (dtb__488, dtb__489, dtb__490, dtb__491) -> (B_dData_dList.C_List__x58__x58_ (dtb__488, B_dData_dList.C_List_Nil))
  | C_Decl_DAxiom (dtb__492, dtb__493, dtb__494) -> (B_dData_dList.C_List__x58__x58_ (dtb__492, B_dData_dList.C_List_Nil))
  | C_Decl_DFun (dtb__495, dtb__496, dtb__497, dtb__498) -> (B_dData_dList.C_List__x58__x58_ (dtb__495, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Frontend/Rast.vuna"
let v_topNames = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declNames) decls))

# 337 "Vuna/Compiler/Frontend/Rast.vuna"
let v_declAllNames = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__499, dtb__500, dtb__501, dtb__502, dtb__503) -> (B_dData_dList.C_List__x58__x58_ (dtb__499, ((B_dData_dList.v_map v_traitMethodName) dtb__502)))
  | C_Decl_DRecord (dtb__504, dtb__505, dtb__506, dtb__507, dtb__508, dtb__509, dtb__510, dtb__511) -> (B_dData_dList.C_List__x58__x58_ (dtb__504, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516, dtb__517, dtb__518, dtb__519, dtb__520) -> (B_dData_dList.C_List__x58__x58_ (dtb__512, ((B_dData_dList.v_map v_ctorName) dtb__515)))
  | _ -> (v_declNames mc0)
))

# 344 "Vuna/Compiler/Frontend/Rast.vuna"
let v__udeclCtors = (fun (mc0 : t_Decl) -> (match mc0 with
  | C_Decl_DTrait (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> ((B_dData_dList.v_map v_traitMethodName) dtb__524)
  | C_Decl_DRecord (dtb__526, dtb__527, dtb__528, dtb__529, dtb__530, dtb__531, dtb__532, dtb__533) -> (B_dData_dList.C_List__x58__x58_ (dtb__526, B_dData_dList.C_List_Nil))
  | C_Decl_DData (dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539, dtb__540, dtb__541, dtb__542) -> ((B_dData_dList.v_map v_ctorName) dtb__537)
  | _ -> B_dData_dList.C_List_Nil
))

# 350 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorsOf = (fun (decls : t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v__udeclCtors) decls))

# 93 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorType = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__543; f_Ctor_ctorType = dtb__544; f_Ctor_ctorArity = dtb__545; f_Ctor_ctorSpan = dtb__546 } -> dtb__544
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorArity = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__547; f_Ctor_ctorType = dtb__548; f_Ctor_ctorArity = dtb__549; f_Ctor_ctorSpan = dtb__550 } -> dtb__549
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Frontend/Rast.vuna"
let v_ctorSpan = (fun (p : t_Ctor) -> (match p with
  | { f_Ctor_ctorName = dtb__551; f_Ctor_ctorType = dtb__552; f_Ctor_ctorArity = dtb__553; f_Ctor_ctorSpan = dtb__554 } -> dtb__554
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Frontend/Rast.vuna"
let v_sourceFileModDecl = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__555; f_SourceFile_sourceFileImports = dtb__556; f_SourceFile_sourceFileFixities = dtb__557; f_SourceFile_sourceFileDecls = dtb__558; f_SourceFile_sourceFileExports = dtb__559; f_SourceFile_sourceFileReexports = dtb__560; f_SourceFile_sourceFileOpacity = dtb__561 } -> dtb__555
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Frontend/Rast.vuna"
let v_sourceFileImports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__562; f_SourceFile_sourceFileImports = dtb__563; f_SourceFile_sourceFileFixities = dtb__564; f_SourceFile_sourceFileDecls = dtb__565; f_SourceFile_sourceFileExports = dtb__566; f_SourceFile_sourceFileReexports = dtb__567; f_SourceFile_sourceFileOpacity = dtb__568 } -> dtb__563
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Rast.vuna"
let v_sourceFileFixities = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__569; f_SourceFile_sourceFileImports = dtb__570; f_SourceFile_sourceFileFixities = dtb__571; f_SourceFile_sourceFileDecls = dtb__572; f_SourceFile_sourceFileExports = dtb__573; f_SourceFile_sourceFileReexports = dtb__574; f_SourceFile_sourceFileOpacity = dtb__575 } -> dtb__571
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/Rast.vuna"
let v_sourceFileDecls = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__576; f_SourceFile_sourceFileImports = dtb__577; f_SourceFile_sourceFileFixities = dtb__578; f_SourceFile_sourceFileDecls = dtb__579; f_SourceFile_sourceFileExports = dtb__580; f_SourceFile_sourceFileReexports = dtb__581; f_SourceFile_sourceFileOpacity = dtb__582 } -> dtb__579
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Rast.vuna"
let v_sourceFileExports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__583; f_SourceFile_sourceFileImports = dtb__584; f_SourceFile_sourceFileFixities = dtb__585; f_SourceFile_sourceFileDecls = dtb__586; f_SourceFile_sourceFileExports = dtb__587; f_SourceFile_sourceFileReexports = dtb__588; f_SourceFile_sourceFileOpacity = dtb__589 } -> dtb__587
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Frontend/Rast.vuna"
let v_sourceFileReexports = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__590; f_SourceFile_sourceFileImports = dtb__591; f_SourceFile_sourceFileFixities = dtb__592; f_SourceFile_sourceFileDecls = dtb__593; f_SourceFile_sourceFileExports = dtb__594; f_SourceFile_sourceFileReexports = dtb__595; f_SourceFile_sourceFileOpacity = dtb__596 } -> dtb__595
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Frontend/Rast.vuna"
let v_sourceFileOpacity = (fun (p : t_SourceFile) -> (match p with
  | { f_SourceFile_sourceFileModDecl = dtb__597; f_SourceFile_sourceFileImports = dtb__598; f_SourceFile_sourceFileFixities = dtb__599; f_SourceFile_sourceFileDecls = dtb__600; f_SourceFile_sourceFileExports = dtb__601; f_SourceFile_sourceFileReexports = dtb__602; f_SourceFile_sourceFileOpacity = dtb__603 } -> dtb__603
  | _ -> failwith "DT: impossible branch"
))
