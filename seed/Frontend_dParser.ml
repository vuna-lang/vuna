open Vuna_runtime
type t_ParsedSource = { f_ParsedSource_parsedFile : Frontend_dAst.t_SourceFile; f_ParsedSource_parsedComments : Frontend_dLexer.t_Comment B_dData_dList.t_List; f_ParsedSource_parsedRawToks : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_ParsedSource_parsedCst : Frontend_dCst.t_CstNode }
and t_ParsedCore = { f_ParsedCore_pcSource : Frontend_dAst.t_SourceFile; f_ParsedCore_pcComments : Frontend_dLexer.t_Comment B_dData_dList.t_List; f_ParsedCore_pcToks : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_ParsedCore_pcFin : Frontend_dParser_dSupport.t_PState }
and t_DeclAcc = { f_DeclAcc_declAccFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_DeclAcc_declAccDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DeclAcc_declAccExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_DeclAcc_declAccOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }
and t_ParsedDecl = { f_ParsedDecl_parsedFixity : Frontend_dAst.t_FixityDecl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedDecl : Frontend_dAst.t_Decl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedExport : Frontend_dAst.t_ExportSpec B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedOpacity : Frontend_dAst.t_OpacitySpec B_dData_dMaybe.t_Maybe }
and t_DeclStart = { f_DeclStart_declStartId : int; f_DeclStart_declStartPos : Base_dSource.t_Pos }
and t_DeclBlock = { f_DeclBlock_dbOpen : string B_dData_dMaybe.t_Maybe; f_DeclBlock_dbClauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DeclBlock_dbFirst : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap }
and t_TraitHead = { f_TraitHead_traitHeadName : string; f_TraitHead_traitHeadParams : Frontend_dAst.t_TraitParam B_dData_dList.t_List; f_TraitHead_traitHeadSupers : Frontend_dAst.t_Expr B_dData_dList.t_List }
and t_BindingItem = C_BindingItem_BISig of (string) * (Frontend_dAst.t_Expr) * (Frontend_dAst.t_NodeRef) | C_BindingItem_BIBind of (Frontend_dAst.t_Binding)
and t_HandleOp = C_HandleOp_HandleOp of (string) * (Frontend_dAst.t_Pat B_dData_dList.t_List) * (Frontend_dAst.t_NodeRef) * (Frontend_dAst.t_NodeRef) * (string) * (Frontend_dAst.t_Expr)
and t_HandleBlock = C_HandleBlock_HandleBlock of ((string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (t_HandleOp B_dData_dList.t_List)

# 21 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps0 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dParser_dSupport.v_tokSpan st)) e))

# 24 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps1 = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (a0 : string) -> (((Base_dDiagnostics_dFrontend.v_psErr1At (Frontend_dParser_dSupport.v_tokSpan st)) e) a0))

# 27 "Vuna/Compiler/Frontend/Parser.vuna"
let v_psAt = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (args : string B_dData_dVec.t_Vec) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dParser_dSupport.v_tokSpan st)) e) args))

# 123 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclAcc = { f_DeclAcc_declAccFixities = B_dData_dList.C_List_Nil; f_DeclAcc_declAccDecls = B_dData_dList.C_List_Nil; f_DeclAcc_declAccExports = B_dData_dList.C_List_Nil; f_DeclAcc_declAccOpacity = B_dData_dList.C_List_Nil }

# 132 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyParsedDecl = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }

# 141 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declRefAt = (fun (st : Frontend_dParser_dSupport.t_PState) (ds : t_DeclStart) (end_ : Frontend_dParser_dSupport.t_PState) -> { Frontend_dAst.f_NodeRef_nodeRefId = (ds).f_DeclStart_declStartId; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) end_) })

# 148 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semModHead = (fun (mc0 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemModHead (dtb__0))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semImport = (fun (i : Frontend_dAst.t_Import) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemImport (i)))))

# 155 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semReexportImport = (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemReexportImport ((B_dData_dPair.v_firstOf p), (B_dData_dPair.v_secondOf p))))))

# 158 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExportNamespace = (fun (item : Frontend_dAst.t_ExportItem) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExportNamespace (item)))))

# 161 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExportItem = (fun (item : Frontend_dAst.t_ExportItem) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExportItem (item)))))

# 164 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semFixity = (fun (f : Frontend_dAst.t_FixityDecl) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemFixity (f)))))

# 167 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semDecl = (fun (d : Frontend_dAst.t_Decl) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDecl (d, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing)))))

# 170 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semParsedDecl = (fun (mc0 : t_ParsedDecl) -> (match mc0 with
  | { f_ParsedDecl_parsedFixity = dtb__1; f_ParsedDecl_parsedDecl = dtb__2; f_ParsedDecl_parsedExport = dtb__3; f_ParsedDecl_parsedOpacity = dtb__4 } -> (match dtb__2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDecl (dtb__5, dtb__3, dtb__4))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semCtor = (fun (c : Frontend_dAst.t_Ctor) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemCtor (c)))))

# 177 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semField = (fun (f : Frontend_dAst.t_Field) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemField (f)))))

# 180 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMethod = (fun (m : Frontend_dAst.t_TraitMethod) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemMethod (m)))))

# 183 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semBindingItem = (fun (mc0 : t_BindingItem) -> (match mc0 with
  | C_BindingItem_BIBind (dtb__6) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemBinding (dtb__6))))
  | C_BindingItem_BISig (dtb__7, dtb__8, dtb__9) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemBindingSig (dtb__7, dtb__8, dtb__9))))
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semAlt = (fun (a : Frontend_dAst.t_Alt) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemAlt (a)))))

# 190 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExpr = (fun (e : Frontend_dAst.t_Expr) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExpr (e)))))

# 193 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semPat = (fun (p : Frontend_dAst.t_Pat) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemPat (p)))))

# 196 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semDoStmt = (fun (s : Frontend_dAst.t_DoStmt) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDoStmt (s)))))

# 205 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMacroNamed = (fun (arity : int) (n : string) -> (match (Frontend_dReserved.v_macroNameOf n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemMacro (dtb__10, arity))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMacroAtom = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__11, dtb__12, dtb__13) -> (match dtb__11 with
  | Frontend_dAst.C_Expr_EVar (dtb__14, dtb__15) -> ((v_semMacroNamed (B_dData_dList.v_length dtb__12)) dtb__14)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__16, dtb__17) -> ((v_semMacroNamed 0) dtb__16)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 212 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semHandleRet = (fun (_u : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> B_dData_dMaybe.C_Maybe_Nothing)

# 326 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportItemOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportMembers) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__18) -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, dtb__18, mc2))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, B_dData_dList.C_List_Nil, mc2))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (mc0, mc2))
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespaceBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "module")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (name : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st3) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "as")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st4)) (fun (alias : string) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, (B_dData_dMaybe.C_Maybe_Just (alias)), { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st5) })); B_dData_dPair.f_Pair_second = st5 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, B_dData_dMaybe.C_Maybe_Nothing, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 }))))))))))

# 345 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespace = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semExportNamespace) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportNamespaceBody st0))))

# 376 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reexportPrefix = (fun (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> dtb__19
  | B_dData_dMaybe.C_Maybe_Nothing -> (imp).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Parser.vuna"
let v_qualifyExportItem = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__20, dtb__21, dtb__22) -> (Frontend_dAst.C_ExportItem_XNamespace (dtb__20, dtb__21, dtb__22))
  | Frontend_dAst.C_ExportItem_XModule (dtb__23, dtb__24) -> (Frontend_dAst.C_ExportItem_XModule (dtb__23, dtb__24))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__25, dtb__26, dtb__27) -> (Frontend_dAst.C_ExportItem_XTypeSome ((String.concat "" [mc0; "."; dtb__25]), dtb__26, dtb__27))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__28, dtb__29) -> (Frontend_dAst.C_ExportItem_XTypeAll ((String.concat "" [mc0; "."; dtb__28]), dtb__29))
  | Frontend_dAst.C_ExportItem_XBare (dtb__30, dtb__31) -> (Frontend_dAst.C_ExportItem_XBare ((String.concat "" [mc0; "."; dtb__30]), dtb__31))
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAlias = (fun (start : Base_dSource.t_Pos) (nid : int) (st : Frontend_dParser_dSupport.t_PState) (isQualified : bool) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "as")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (alias : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = (B_dData_dMaybe.C_Maybe_Just (alias)); Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) start) st3) } }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) start) st1) } }; B_dData_dPair.f_Pair_second = st1 }))))))

# 357 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAfterKeyword = (fun (start : Base_dSource.t_Pos) (nid : int) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "qualified")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseImportAlias start) nid) st1) true))) else ((((v_parseImportAlias start) nid) st) false)))

# 392 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpecBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "import")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos st)) (st).Frontend_dParser_dSupport.f_PState_openNodeId) st1))))

# 389 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpec = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semImport) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseImportSpecBody st0))))

# 451 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclBlock = { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 454 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClose = (fun (b : t_DeclBlock) -> { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst })

# 458 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpenAt = (fun (n : string) (sp : Base_dSource.t_Span) (b : t_DeclBlock) -> (let first2 = (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) (b).f_DeclBlock_dbFirst) then (b).f_DeclBlock_dbFirst else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) sp) (b).f_DeclBlock_dbFirst)) in { f_DeclBlock_dbOpen = (B_dData_dMaybe.C_Maybe_Just (n)); f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = first2 }))

# 464 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbAddClause = (fun (b : t_DeclBlock) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> { f_DeclBlock_dbOpen = (b).f_DeclBlock_dbOpen; f_DeclBlock_dbClauses = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pats; B_dData_dPair.f_Pair_second = sp }, (b).f_DeclBlock_dbClauses)); f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst })

# 467 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyNullary = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (match dtb__32 with
  | { B_dData_dPair.f_Pair_first = dtb__34; B_dData_dPair.f_Pair_second = dtb__35 } -> (match dtb__34 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_anyNullary dtb__33)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_findShadow = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__36 with
  | { B_dData_dPair.f_Pair_first = dtb__38; B_dData_dPair.f_Pair_second = dtb__39 } -> (if ((Frontend_dAst.v_clauseSubsumedBy dtb__38) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__39)) else ((v_findShadow dtb__37) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/Parser.vuna"
let v_shadowDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "an earlier clause already matches these values"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseShadowed (n))) (B_dData_dVec.C_Vec__x58__x58_ (n, B_dData_dVec.C_Vec_Nil))))))

# 478 "Vuna/Compiler/Frontend/Parser.vuna"
let v_clauseVerdict = (fun (mc0 : t_DeclBlock) (mc1 : string) (mc2 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> (if (v_anyNullary (mc0).f_DeclBlock_dbClauses) then (B_dData_dMaybe.C_Maybe_Just (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (mc3)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_DefinitionDuplicate (mc1))) (B_dData_dVec.C_Vec__x58__x58_ (mc1, B_dData_dVec.C_Vec_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (match ((v_findShadow (mc0).f_DeclBlock_dbClauses) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shadowDiag mc1) mc3) dtb__40)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
))

# 501 "Vuna/Compiler/Frontend/Parser.vuna"
let v_notAdjacentDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "the definition starts here"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseNotAdjacent (n))) (B_dData_dVec.C_Vec__x58__x58_ (n, B_dData_dVec.C_Vec_Nil))))))

# 495 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reopenDiag = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) (b).f_DeclBlock_dbFirst) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> (B_dData_dMaybe.C_Maybe_Just ((((v_notAdjacentDiag n) sp) dtb__41)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockFun = (fun (b : t_DeclBlock) (n : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (if (dtb__42 = n) then { B_dData_dPair.f_Pair_first = ((((v_clauseVerdict b) n) pats) sp); B_dData_dPair.f_Pair_second = (((v_dbAddClause b) pats) sp) } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) }
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockSig = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (if (dtb__43 = n) then { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = b } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) b) }
  | _ -> failwith "DT: impossible branch"
))

# 524 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockStep = (fun (mc0 : t_DeclBlock) (mc1 : t_ParsedDecl) -> (match mc1 with
  | { f_ParsedDecl_parsedFixity = dtb__44; f_ParsedDecl_parsedDecl = dtb__45; f_ParsedDecl_parsedExport = dtb__46; f_ParsedDecl_parsedOpacity = dtb__47 } -> (match dtb__44 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__45 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__46 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__47 with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = mc0 }
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (match dtb__50 with
  | Frontend_dAst.C_Decl_DSig (dtb__51, dtb__52, dtb__53, dtb__54) -> (match dtb__46 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__47 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_blockSig mc0) dtb__51) (Frontend_dAst.v_nodeRefSpan dtb__54))
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Decl_DFun (dtb__57, dtb__58, dtb__59, dtb__60) -> (match dtb__46 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__47 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_blockFun mc0) dtb__57) dtb__58) (Frontend_dAst.v_nodeRefSpan dtb__60))
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb__46 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb__47 with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose mc0) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Frontend/Parser.vuna"
let v_addParsedDecl = (fun (mc0 : t_ParsedDecl) (mc1 : t_DeclAcc) -> (match mc0 with
  | { f_ParsedDecl_parsedFixity = dtb__66; f_ParsedDecl_parsedDecl = dtb__67; f_ParsedDecl_parsedExport = dtb__68; f_ParsedDecl_parsedOpacity = dtb__69 } -> (match mc1 with
  | { f_DeclAcc_declAccFixities = dtb__70; f_DeclAcc_declAccDecls = dtb__71; f_DeclAcc_declAccExports = dtb__72; f_DeclAcc_declAccOpacity = dtb__73 } -> (let fixities2 = (match dtb__66 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__77) -> (B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__70))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__70
  | _ -> failwith "DT: impossible branch"
) in (let decls2 = (match dtb__67 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__71))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__71
  | _ -> failwith "DT: impossible branch"
) in (let exports2 = (match dtb__68 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__72))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__72
  | _ -> failwith "DT: impossible branch"
) in (let opacity2 = (match dtb__69 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__73))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__73
  | _ -> failwith "DT: impossible branch"
) in { f_DeclAcc_declAccFixities = fixities2; f_DeclAcc_declAccDecls = decls2; f_DeclAcc_declAccExports = exports2; f_DeclAcc_declAccOpacity = opacity2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reverseDeclAcc = (fun (mc0 : t_DeclAcc) -> (match mc0 with
  | { f_DeclAcc_declAccFixities = dtb__78; f_DeclAcc_declAccDecls = dtb__79; f_DeclAcc_declAccExports = dtb__80; f_DeclAcc_declAccOpacity = dtb__81 } -> { f_DeclAcc_declAccFixities = (B_dData_dList.v_reverse dtb__78); f_DeclAcc_declAccDecls = (B_dData_dList.v_reverse dtb__79); f_DeclAcc_declAccExports = (B_dData_dList.v_reverse dtb__80); f_DeclAcc_declAccOpacity = (B_dData_dList.v_reverse dtb__81) }
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_skipToDeclLine = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> ((v_skipFrom dtb__83) mc1)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 617 "Vuna/Compiler/Frontend/Parser.vuna"
and v_skipFrom = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if ((Base_dSource.v_posCol (dtb__84).Frontend_dLexer.f_PTok_ptokPos) = mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85)) else ((v_skipToDeclLine dtb__85) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 606 "Vuna/Compiler/Frontend/Parser.vuna"
let v_recoverDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let rest = ((v_skipToDeclLine (st).Frontend_dParser_dSupport.f_PState_toksOf) blockCol) in (let skipped = (bi_natSub (B_dData_dList.v_length (st).Frontend_dParser_dSupport.f_PState_toksOf) (B_dData_dList.v_length rest)) in { st with Frontend_dParser_dSupport.f_PState_toksOf = rest; Frontend_dParser_dSupport.f_PState_toksLeft = (B_dData_dList.v_length rest); Frontend_dParser_dSupport.f_PState_tokIndex = ((st).Frontend_dParser_dSupport.f_PState_tokIndex + skipped) })))

# 655 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportMarkerFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__86; Frontend_dLexer.f_PTok_ptokPos = dtb__87 } -> (match dtb__86 with
  | Frontend_dLexer.C_Tok_TKw (dtb__88) -> (if (dtb__88 = "data") then true else (if (dtb__88 = "record") then true else (if (dtb__88 = "trait") then true else (if (dtb__88 = "axiom") then true else (if (dtb__88 = "extern") then true else (if (dtb__88 = "linear") then true else (if (dtb__88 = "opaque") then true else (if (dtb__88 = "transparent") then true else (if (dtb__88 = "import") then true else false)))))))))
  | Frontend_dLexer.C_Tok_TSym (dtb__89) -> (if (dtb__89 = ":") then false else true)
  | Frontend_dLexer.C_Tok_TIdent (dtb__90) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 649 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__91; Frontend_dLexer.f_PTok_ptokPos = dtb__92 } -> (match dtb__91 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__93) -> (if (dtb__93 = "export") then (v_exportMarkerFollows (Frontend_dParser_dSupport.v_advance st)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 744 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityGiven = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__94) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacitySpecOf = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (mc1 : string) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__95) -> (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = mc1; Frontend_dAst.f_OpacitySpec_opacityKind = dtb__95; Frontend_dAst.f_OpacitySpec_opacitySpan = mc2 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 983 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_traitSupersFollowGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__98; Frontend_dLexer.f_PTok_ptokPos = dtb__99 } -> (let nd_uscrut7 = dtb__98 in (match nd_uscrut7 with
  | Frontend_dLexer.C_Tok_TSym (dtb__100) -> (if (dtb__100 = "=>") then (mc0 = 0) else (if (dtb__100 = "(") then ((v_traitSupersFollowGo (mc0 + 1)) dtb__97) else (if (dtb__100 = ")") then ((v_traitSupersFollowGo (if (mc0 > 0) then (mc0 - 1) else 0)) dtb__97) else ((v_traitSupersFollowGo mc0) dtb__97))))
  | Frontend_dLexer.C_Tok_TKw (dtb__101) -> (if (dtb__101 = "where") then false else ((v_traitSupersFollowGo mc0) dtb__97))
  | _ -> ((v_traitSupersFollowGo mc0) dtb__97)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 980 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitSupersFollow = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((v_traitSupersFollowGo 0) (st).Frontend_dParser_dSupport.f_PState_toksOf))

# 1019 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parenIsMemberList = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__102; Frontend_dLexer.f_PTok_ptokPos = dtb__103 } -> (match dtb__102 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__104) -> (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__105; Frontend_dLexer.f_PTok_ptokPos = dtb__106 } -> (match dtb__105 with
  | Frontend_dLexer.C_Tok_TSym (dtb__107) -> (if (dtb__107 = ",") then true else (if (dtb__107 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dLexer.C_Tok_TSym (dtb__108) -> (if (dtb__108 = "..") then true else (if (dtb__108 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1052 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectDeclName = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__109; Frontend_dLexer.f_PTok_ptokPos = dtb__110 } -> (match dtb__109 with
  | Frontend_dLexer.C_Tok_TSym (dtb__111) -> (if (dtb__111 = "(") then (let nd_uscrut5 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__112) -> (match dtb__112 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__113; Frontend_dLexer.f_PTok_ptokPos = dtb__114 } -> (match dtb__113 with
  | Frontend_dLexer.C_Tok_TSym (dtb__115) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__115) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (let nd_uscrut11 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (match dtb__116 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__117; Frontend_dLexer.f_PTok_ptokPos = dtb__118 } -> (match dtb__117 with
  | Frontend_dLexer.C_Tok_TSym (dtb__119) -> (if (dtb__119 = ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__115; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) })) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator"))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__111) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__120) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 317 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMemberNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseMemberNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 311 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (if ((Frontend_dParser_dSupport.v_atSym st1) "..") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "..")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step ((v_parseMemberNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (names)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 286 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItem = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__121; Frontend_dLexer.f_PTok_ptokPos = dtb__122 } -> (match dtb__121 with
  | Frontend_dLexer.C_Tok_TSym (dtb__123) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__123) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__123, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__124) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "(") then ((Base_dCommon.v_step (v_parseExportMembers st1)) (fun (members : Frontend_dAst.t_ExportMembers) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_exportItemOf dtb__124) members) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__124, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
  | Frontend_dLexer.C_Tok_TKw (dtb__125) -> (if (dtb__125 = "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (name, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem)
)
  | _ -> failwith "DT: impossible branch"
)))

# 277 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItemAt = (fun (mc0 : bool) (mc1 : Frontend_dParser_dSupport.t_PState) -> (if mc0 then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExportItemKind) v_semExportItem) mc1) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseExportItem st0)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExportItemRef { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf mc1) st1) }) item); B_dData_dPair.f_Pair_second = st1 })))))) else (v_parseExportItem mc1)))

# 268 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseExportItemsFrom = (fun (anchored : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step ((v_parseExportItemAt anchored) st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseExportItemsFrom anchored) (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 262 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItems = (fun (anchored : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (((v_parseExportItemsFrom anchored) (Frontend_dParser_dSupport.v_stateFuel st1)) st1)))))

# 251 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) "(") then ((Base_dCommon.v_step ((v_parseExportItems true) st2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = true; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st4) } })); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = false; Frontend_dAst.f_ModDecl_modDeclExportItems = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } })); B_dData_dPair.f_Pair_second = st3 }))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 244 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDecl = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstModHeadKind) v_semModHead) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseModDeclBody st0))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 366 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseReexportTail = (fun (imp : Frontend_dAst.t_Import) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then ((Base_dCommon.v_step ((v_parseExportItems false) st)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (v_qualifyExportItem (v_reexportPrefix imp))) items) }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st1 }))))))

# 337 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImportBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "import") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "import")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos st)) (st).Frontend_dParser_dSupport.f_PState_openNodeId) st2)) (fun (imp : Frontend_dAst.t_Import) (st3 : Frontend_dParser_dSupport.t_PState) -> ((v_parseReexportTail imp) st3))))) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))

# 333 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImport = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semReexportImport) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportImportBody st0))))

# 1031 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOptionalMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then (v_parseExportMembers st) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = st }))))

# 1014 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (v_parseOptionalMembers st))

# 1073 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectFixityLevel = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__126; Frontend_dLexer.f_PTok_ptokPos = dtb__127 } -> (match dtb__126 with
  | Frontend_dLexer.C_Tok_TInt (dtb__128) -> (if (if (dtb__128 >= 0) then (dtb__128 <= 9) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_FixityLevelRange))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedFixityLevel)
)
  | _ -> failwith "DT: impossible branch"
)))

# 1081 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectOpName = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__129; Frontend_dLexer.f_PTok_ptokPos = dtb__130 } -> (match dtb__129 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__131) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__131) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TSym (dtb__132) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__132) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__132; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1044 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) (nid : int) -> ((Base_dCommon.v_step (v_expectFixityLevel (Frontend_dParser_dSupport.v_advance st))) (fun (level : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_expectOpName st1)) (fun (op : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixityRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) kwPos) st2) } }; B_dData_dPair.f_Pair_second = st2 })))))))

# 1036 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFixityKind) v_semFixity) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseFixityDeclBody st0) blockCol) assoc) kwPos) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1168 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rejectCtxSuffix = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere) else (Base_dDiag.C_Check_OkC (st))))

# 1353 "Vuna/Compiler/Frontend/Parser.vuna"
let v_localFunMerge = (fun (mc0 : string) (mc1 : Frontend_dAst.t_BindingValue) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (match (dtb__133).Frontend_dAst.f_Binding_bindPat with
  | Frontend_dAst.C_Pat_PVar (dtb__135, dtb__136) -> (if (dtb__135 = mc0) then (match (dtb__133).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__137) -> (match mc1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__138) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb__135, dtb__136)); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BClauses (((B_dData_dList.v_append dtb__137) dtb__138))); Frontend_dAst.f_Binding_bindSig = (dtb__133).Frontend_dAst.f_Binding_bindSig; Frontend_dAst.f_Binding_bindRef = (dtb__133).Frontend_dAst.f_Binding_bindRef }, dtb__134))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1370 "Vuna/Compiler/Frontend/Parser.vuna"
let v_patBoundName = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PVar (dtb__139, dtb__140) -> dtb__139
  | _ -> ""
))

# 1374 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingSigOf = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (match dtb__141 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (if (dtb__143 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__144)) else ((v_bindingSigOf mc0) dtb__142))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1378 "Vuna/Compiler/Frontend/Parser.vuna"
let v_hasBindingSig = (fun (name : string) (sigs : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_bindingSigOf name) sigs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1384 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstDanglingSig = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (match dtb__146 with
  | { B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = dtb__149 } -> (match dtb__149 with
  | { B_dData_dPair.f_Pair_first = dtb__150; B_dData_dPair.f_Pair_second = dtb__151 } -> (if ((B_dData_dList.v_memName dtb__148) mc1) then ((v_firstDanglingSig dtb__147) mc1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = dtb__151 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1314 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingBindsGo = (fun (mc0 : t_BindingItem B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (match dtb__152 with
  | C_BindingItem_BISig (dtb__154, dtb__155, dtb__156) -> (if ((B_dData_dList.v_memName dtb__154) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__156))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigBeforeClause (dtb__154))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__154, B_dData_dVec.C_Vec_Nil)))))) else (if ((v_hasBindingSig dtb__154) mc1) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__156))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigDuplicate (dtb__154))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__154, B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__153) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } }, mc1))) mc2) mc3)))
  | C_BindingItem_BIBind (dtb__157) -> (match (((v_localFunMerge (v_patBoundName (dtb__157).Frontend_dAst.f_Binding_bindPat)) (dtb__157).Frontend_dAst.f_Binding_bindValue) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> ((((v_bindingBindsGo dtb__153) mc1) mc2) dtb__158)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = ((v_bindingSigOf (v_patBoundName (dtb__157).Frontend_dAst.f_Binding_bindPat)) mc1) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_bindingBindsGo dtb__153) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb__157).Frontend_dAst.f_Binding_bindPat), mc2))) (B_dData_dList.C_List__x58__x58_ (dtb__157, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> (match dtb__159 with
  | { B_dData_dPair.f_Pair_first = dtb__160; B_dData_dPair.f_Pair_second = dtb__161 } -> (if ((B_dData_dList.v_memName (v_patBoundName (dtb__157).Frontend_dAst.f_Binding_bindPat)) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__161))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigMultiClause ((v_patBoundName (dtb__157).Frontend_dAst.f_Binding_bindPat)))) (B_dData_dVec.C_Vec__x58__x58_ ((v_patBoundName (dtb__157).Frontend_dAst.f_Binding_bindPat), B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__153) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb__157).Frontend_dAst.f_Binding_bindPat), mc2))) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__157).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = (dtb__157).Frontend_dAst.f_Binding_bindValue; Frontend_dAst.f_Binding_bindSig = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb__160; Frontend_dAst.f_BindingSig_sigRef = dtb__161 })); Frontend_dAst.f_Binding_bindRef = (dtb__157).Frontend_dAst.f_Binding_bindRef }, mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let nd_uscrut5 = ((v_firstDanglingSig (B_dData_dList.v_reverse mc1)) mc2) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> (match dtb__162 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__164))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigNoDef (dtb__163))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__163, B_dData_dVec.C_Vec_Nil))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1311 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindingItemsToBinds = (fun (items : t_BindingItem B_dData_dList.t_List) -> ((((v_bindingBindsGo items) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1414 "Vuna/Compiler/Frontend/Parser.vuna"
let v_tierFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__165; Frontend_dLexer.f_PTok_ptokPos = dtb__166 } -> (match dtb__165 with
  | Frontend_dLexer.C_Tok_TKw (dtb__167) -> (if (dtb__167 = "record") then true else (if (dtb__167 = "linear") then (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__168; Frontend_dLexer.f_PTok_ptokPos = dtb__169 } -> (match dtb__168 with
  | Frontend_dLexer.C_Tok_TKw (dtb__170) -> (if (dtb__170 = "record") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 674 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__171; Frontend_dLexer.f_PTok_ptokPos = dtb__172 } -> (match dtb__171 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__173) -> (if (dtb__173 = "abstract") then true else false)
  | Frontend_dLexer.C_Tok_TKw (dtb__174) -> (if (dtb__174 = "opaque") then (B_dData_dBool.v_not (v_tierFollows st)) else (if (dtb__174 = "transparent") then (B_dData_dBool.v_not (v_tierFollows st)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1523 "Vuna/Compiler/Frontend/Parser.vuna"
let v_atIdentName = (fun (st : Frontend_dParser_dSupport.t_PState) (name : string) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__175; Frontend_dLexer.f_PTok_ptokPos = dtb__176 } -> (match dtb__175 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__177) -> (dtb__177 = name)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 405 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseImports = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "import") then ((Base_dCommon.v_step (v_parseImportSpec st)) (fun (imp : Frontend_dAst.t_Import) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__178; B_dData_dPair.f_Pair_second = dtb__179 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (imp, dtb__178)); B_dData_dPair.f_Pair_second = dtb__179 }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "import") else false) then ((Base_dCommon.v_step (v_parseExportImport st)) (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__180; B_dData_dPair.f_Pair_second = dtb__181 } -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__182)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__181) dtb__183) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "module") else false) then ((Base_dCommon.v_step (v_parseExportNamespace st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (item, dtb__185)) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st })))))))

# 1547 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDerivingNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseDerivingNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1541 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDerivingParens = (fun (via : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step ((v_parseDerivingNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1531 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeriving = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "deriving") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "deriving")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((v_atIdentName st1) "via") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (fld : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if (fld = "field") then ((v_parseDerivingParens true) st3) else (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("field"))) "field")))))) else ((v_parseDerivingParens false) st1)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = false }; B_dData_dPair.f_Pair_second = st }))))

# 1653 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_innermostPiCod = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> (v_innermostPiCod dtb__190)
  | _ -> mc0
))

# 1657 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_replacePiCod = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> (Frontend_dAst.C_Expr_EPi (dtb__192, dtb__193, dtb__194, dtb__195, ((v_replacePiCod dtb__196) mc1), dtb__197))
  | _ -> mc1
))

# 1648 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ctxThenSplit = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_innermostPiCod (Frontend_dAst.C_Expr_EPi (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_replacePiCod (Frontend_dAst.C_Expr_EPi (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203))) mc1) }
  | _ -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = mc1 }
))

# 1714 "Vuna/Compiler/Frontend/Parser.vuna"
let v_instanceMethodStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__204; Frontend_dLexer.f_PTok_ptokPos = dtb__205 } -> (match dtb__204 with
  | Frontend_dLexer.C_Tok_TSym (dtb__206) -> (if (dtb__206 = "(") then (let nd_uscrut5 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__207) -> (match dtb__207 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__208; Frontend_dLexer.f_PTok_ptokPos = dtb__209 } -> (match dtb__208 with
  | Frontend_dLexer.C_Tok_TSym (dtb__210) -> (let nd_uscrut11 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__211) -> (match dtb__211 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__212; Frontend_dLexer.f_PTok_ptokPos = dtb__213 } -> (match dtb__212 with
  | Frontend_dLexer.C_Tok_TSym (dtb__214) -> (if (dtb__214 = ")") then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__210)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) else (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__206)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__215) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1728 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__216; Frontend_dLexer.f_PTok_ptokPos = dtb__217 } -> (match dtb__216 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__218) -> ((Base_dCommon.v_step ((v_parseParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : string B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__218, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1879 "Vuna/Compiler/Frontend/Parser.vuna"
let v_spanFromExpr = (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (let sp = (Frontend_dAst.v_exprSpan e) in (let p1 = (Frontend_dParser_dSupport.v_lastPos st2) in { Base_dSource.f_Span_spanFile = (sp).Base_dSource.f_Span_spanFile; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (Frontend_dParser_dSupport.v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) })))

# 1914 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldSuffix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (base : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ".") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ".")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (fname : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EField (base, fname, (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr base) st2))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st })))))

# 1928 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroBangAt = (fun (st : Frontend_dParser_dSupport.t_PState) (start : Base_dSource.t_Pos) (name : string) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__219; Frontend_dLexer.f_PTok_ptokPos = dtb__220 } -> (match dtb__219 with
  | Frontend_dLexer.C_Tok_TSym (dtb__221) -> (if (dtb__221 = "!") then (if ((Base_dSource.v_posLine dtb__220) = (Base_dSource.v_posLine start)) then ((Base_dSource.v_posCol dtb__220) = ((Base_dSource.v_posCol start) + (String.length name))) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1935 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroAtom = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (mc0))), (Frontend_dAst.v_detachedNodeRef mc3)))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (mc0))), (Frontend_dAst.v_detachedNodeRef mc3))), mc1, (Frontend_dAst.v_detachedNodeRef mc2)))
))

# 2042 "Vuna/Compiler/Frontend/Parser.vuna"
let v_holeSpan = (fun (mc0 : string) (mc1 : Base_dSource.t_Pos) -> (match mc1 with
  | { Base_dSource.f_Pos_posLine = dtb__222; Base_dSource.f_Pos_posCol = dtb__223; Base_dSource.f_Pos_posOffset = dtb__224; Base_dSource.f_Pos_posEndOffset = dtb__225 } -> { Base_dSource.f_Span_spanFile = mc0; Base_dSource.f_Span_spanStartLine = dtb__222; Base_dSource.f_Span_spanStartCol = dtb__223; Base_dSource.f_Span_spanEndLine = dtb__222; Base_dSource.f_Span_spanEndCol = dtb__223; Base_dSource.f_Span_spanStartOffset = dtb__224; Base_dSource.f_Span_spanEndOffset = dtb__224 }
  | _ -> failwith "DT: impossible branch"
))

# 2046 "Vuna/Compiler/Frontend/Parser.vuna"
let v_toksFuel = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((128 * (B_dData_dList.v_length toks)) + 1024))

# 2050 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_textPartsOf = (fun (mc0 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__226, dtb__227) -> (match dtb__226 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__228) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_TmplPart_TPText (dtb__229) -> (match (v_textPartsOf dtb__227) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__230) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__229 ^ dtb__230)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (""))
  | _ -> failwith "DT: impossible branch"
))

# 2085 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairExprs = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (match dtb__232 with
  | B_dData_dList.C_List_Nil -> dtb__231
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTuplePair), mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__231, (B_dData_dList.C_List__x58__x58_ (((v_foldPairExprs mc0) dtb__232), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2122 "Vuna/Compiler/Frontend/Parser.vuna"
let v_sectionLeftExpr = (fun (op : string) (operand : Frontend_dAst.t_Expr) (r : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan r) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (op, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), r)))

# 2129 "Vuna/Compiler/Frontend/Parser.vuna"
let v_sectionRightExpr = (fun (op : string) (operand : Frontend_dAst.t_Expr) (r : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan r) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (op, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), (B_dData_dList.C_List__x58__x58_ (operand, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), r)))

# 2160 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePiNamesRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__233; Frontend_dLexer.f_PTok_ptokPos = dtb__234 } -> (match dtb__233 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__235) -> (((v_parsePiNamesRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) (B_dData_dList.C_List__x58__x58_ (dtb__235, acc)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 2151 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsePiNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parsePiNamesRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)))))))

# 2170 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPiNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : bool) (mc2 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__236, dtb__237) -> (Frontend_dAst.C_Expr_EPi (dtb__236, mc1, mc2, mc3, ((((((v_foldPiNames dtb__237) mc1) mc2) mc3) mc4) mc5), mc5))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 2175 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyDottedName = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (if (Base_dSource.v_containsDot dtb__238) then true else (v_anyDottedName dtb__239))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2180 "Vuna/Compiler/Frontend/Parser.vuna"
let v_consumeQty = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok mc0) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__241; Frontend_dLexer.f_PTok_ptokPos = dtb__242 } -> (match dtb__241 with
  | Frontend_dLexer.C_Tok_TInt (dtb__243) -> (if (dtb__243 = 0) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else (if (dtb__243 = 1) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)))
  | _ -> ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2241 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldCons = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListCons), mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__244, (B_dData_dList.C_List__x58__x58_ (((v_foldCons mc0) dtb__245), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2255 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLambdaParam = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_tokenSpan st) }; B_dData_dPair.f_Pair_second = st1 })))))

# 2259 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseLambdaParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ",") then ((Base_dCommon.v_step (v_parseLambdaParam (Frontend_dParser_dSupport.v_advance st))) (fun (p : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseLambdaParams (fuel - 1)) st1) ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (p, B_dData_dList.C_List_Nil)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = st })))))

# 2350 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rowAtNameExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__246, dtb__247) -> (Frontend_dAst.C_Expr_EStr (dtb__246, dtb__247))
  | _ -> mc0
))

# 2439 "Vuna/Compiler/Frontend/Parser.vuna"
let v_isReturnClauseHead = (fun (stat : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok stat) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__248; Frontend_dLexer.f_PTok_ptokPos = dtb__249 } -> (match dtb__248 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__250) -> (dtb__250 = "return")
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 2533 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpKName = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> dtb__255
  | _ -> failwith "DT: impossible branch"
))

# 2537 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstOtherKName = (fun (mc0 : t_HandleOp B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (let k2 = (v_handleOpKName dtb__257) in (if (k2 = mc1) then ((v_firstOtherKName dtb__258) mc1) else (B_dData_dMaybe.C_Maybe_Just (k2))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2545 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleAlt = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> { Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb__259, dtb__260, dtb__261)); Frontend_dAst.f_Alt_altBody = dtb__264; Frontend_dAst.f_Alt_altRef = dtb__262 }
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semHandleOp = (fun (op : t_HandleOp) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemAlt ((v_handleAlt op))))))

# 2549 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleRetExpr = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> (match dtb__265 with
  | { B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = dtb__267 } -> (match dtb__267 with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__269) }, B_dData_dList.C_List_Nil)), dtb__268, dtb__269))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsHandleNoRet), mc1))
  | _ -> failwith "DT: impossible branch"
))

# 2554 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpLam = (fun (ops : t_HandleOp B_dData_dList.t_List) (kname : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleOpIndexBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleOpBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = kname; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleOpBinderName, sp)), ((B_dData_dList.v_map v_handleAlt) ops), sp)), sp)))

# 2562 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : t_HandleBlock) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | C_HandleBlock_HandleBlock (dtb__270, dtb__271) -> (match dtb__271 with
  | B_dData_dList.C_List__x58__x58_ (dtb__272, dtb__273) -> (match ((v_firstOtherKName dtb__273) (v_handleOpKName dtb__272)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsHandle), mc2)), (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (((v_handleRetExpr dtb__270) mc2), (B_dData_dList.C_List__x58__x58_ ((((v_handleOpLam (B_dData_dList.C_List__x58__x58_ (dtb__272, dtb__273))) (v_handleOpKName dtb__272)) mc2), B_dData_dList.C_List_Nil)))))), mc2))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__274) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dAst.v_nodeRefSpan mc2)) (Base_dDiagnostics_dFrontend.C_PsDiag_HandleContinuationNameMismatch ((v_handleOpKName dtb__272), dtb__274))) (B_dData_dVec.C_Vec__x58__x58_ ((v_handleOpKName dtb__272), (B_dData_dVec.C_Vec__x58__x58_ (dtb__274, B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan mc2)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2679 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_patBinderBindings = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__275, dtb__276) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__277, dtb__278) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PWild (dtb__279) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb__280, dtb__281, dtb__282) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinderBindings (B_dData_dPair.v_secondOf f)))) dtb__281)
  | Frontend_dAst.C_Pat_PCon (dtb__283, dtb__284, dtb__285) -> ((B_dData_dList.v_concatMap v_patBinderBindings) dtb__284)
  | Frontend_dAst.C_Pat_PAs (dtb__286, dtb__287, dtb__288) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__286; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__288) }, (v_patBinderBindings dtb__287)))
  | Frontend_dAst.C_Pat_PVar (dtb__289, dtb__290) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__289; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__290) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2693 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstRepeatedBindingGo = (fun (mc0 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__291, dtb__292) -> (match dtb__291 with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> (if ((B_dData_dList.v_memName dtb__293) mc1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 })) else ((v_firstRepeatedBindingGo dtb__292) (B_dData_dList.C_List__x58__x58_ (dtb__293, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2689 "Vuna/Compiler/Frontend/Parser.vuna"
let v_firstRepeatedBinding = (fun (binds : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_firstRepeatedBindingGo binds) B_dData_dList.C_List_Nil))

# 2708 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkNoRepeatedBinders = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let nd_uscrut1 = (v_firstRepeatedBinding ((B_dData_dList.v_concatMap v_patBinderBindings) pats)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> (match dtb__295 with
  | { B_dData_dPair.f_Pair_first = dtb__296; B_dData_dPair.f_Pair_second = dtb__297 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__297)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_appendMessage (String.concat "" [" (repeated name: `"; dtb__296; "`)"])) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_RepeatedPatternBinder) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (pats))
  | _ -> failwith "DT: impossible branch"
)))

# 2702 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkBindersAt = (fun (st : Frontend_dParser_dSupport.t_PState) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (Frontend_dParser_dSupport.v_pmodeOf st) with
  | Frontend_dParser_dSupport.C_ParseMode_PmTool -> (Base_dDiag.C_Check_OkC (pats))
  | Frontend_dParser_dSupport.C_ParseMode_PmStrict -> (v_checkNoRepeatedBinders pats)
  | _ -> failwith "DT: impossible branch"
))

# 2827 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAsName = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__298; Frontend_dLexer.f_PTok_ptokPos = dtb__299 } -> (match dtb__298 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__300) -> (if (dtb__300 = "_") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))

# 2884 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPCon = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__301, dtb__302) -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListCons), (B_dData_dList.C_List__x58__x58_ (dtb__301, (B_dData_dList.C_List__x58__x58_ (((v_foldPCon mc0) dtb__302), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2899 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairPats = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__303, dtb__304) -> (match dtb__304 with
  | B_dData_dList.C_List_Nil -> dtb__303
  | _ -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTuplePair), (B_dData_dList.C_List__x58__x58_ (dtb__303, (B_dData_dList.C_List__x58__x58_ (((v_foldPairPats mc0) dtb__304), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2717 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePatternSingle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstPatKind) v_semPat) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingleBody fuel) st0) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withPatId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) p); B_dData_dPair.f_Pair_second = st1 })))))))
# 2725 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternSingleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((v_parsePatternCons (fuel - 1)) st) blockCol)))
# 2730 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternCons = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternHead (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atSym st1) "::") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternCons (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("::", (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2739 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternHead = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__305; Frontend_dLexer.f_PTok_ptokPos = dtb__306 } -> (match dtb__305 with
  | Frontend_dLexer.C_Tok_TSym (dtb__307) -> (if (dtb__307 = "(") then (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__308) -> (match dtb__308 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__309; Frontend_dLexer.f_PTok_ptokPos = dtb__310 } -> (match dtb__309 with
  | Frontend_dLexer.C_Tok_TSym (dtb__311) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__311) then (((v_parsePatternAtom (fuel - 1)) st) blockCol) else (let nd_uscrut13 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__312) -> (match dtb__312 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__313; Frontend_dLexer.f_PTok_ptokPos = dtb__314 } -> (match dtb__313 with
  | Frontend_dLexer.C_Tok_TSym (dtb__315) -> (if (dtb__315 = ")") then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__311, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
  | Frontend_dLexer.C_Tok_TIdent (dtb__316) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__316) then ((Frontend_dParser_dSupport.v_atSym st1) "{") else false) then ((Base_dCommon.v_step (((v_parseRecordPatternFields (fuel - 1)) st1) blockCol)) (fun (fields : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__316, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__316) then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__316, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2762 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternFields = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseRecordPatternList (fuel - 1)) st1) blockCol)))))
# 2771 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordPatternField (fuel - 1)) st) blockCol)) (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseRecordPatternList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "}")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2782 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternField = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__317; Frontend_dLexer.f_PTok_ptokPos = dtb__318 } -> (match dtb__317 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__319) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "=") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st2) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__319; B_dData_dPair.f_Pair_second = pat }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__319; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Pat_PVar (dtb__319, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__318); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__318); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__318); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__318); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__318); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__318) }))) }; B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedRecordFieldPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2794 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtoms = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 2805 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_finishAsPattern (fuel - 1)) st) base) st1) blockCol)))))
# 2815 "Vuna/Compiler/Frontend/Parser.vuna"
and v_finishAsPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then (let nd_uscrut5 = base in (match nd_uscrut5 with
  | Frontend_dAst.C_Pat_PVar (dtb__320, dtb__321) -> (if (dtb__320 = "_") then ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, (Frontend_dAst.C_Pat_PWild (dtb__321)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__320, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, base, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st1 })))))
# 2836 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__322; Frontend_dLexer.f_PTok_ptokPos = dtb__323 } -> (match dtb__322 with
  | Frontend_dLexer.C_Tok_TSym (dtb__324) -> (if (dtb__324 = "(") then (if ((Frontend_dParser_dSupport.v_atSym (Frontend_dParser_dSupport.v_advance st)) ")") then (let st2 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))) else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (first : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairPats (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 })))))))) else (if (dtb__324 = "[") then (((v_parseListPattern (fuel - 1)) st) blockCol) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__325, dtb__326, dtb__327) -> (match (v_textPartsOf dtb__326) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__328) -> (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = ((Frontend_dParser_dSupport.v_withLastPos dtb__327) advanced) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__328, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateInPattern)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dLexer.C_Tok_TStr (dtb__329) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__329, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__330) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__330, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__331) -> (if (dtb__331 = "_") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__331) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__331, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__331, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2865 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) st1) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPCon (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2874 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPatternElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))
# 2889 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (p, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (p, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1390 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseClausePatterns = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseClausePatterns (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))

# 1246 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseBindingItemsAt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__332; Base_dSource.f_Pos_posCol = dtb__333; Base_dSource.f_Pos_posOffset = dtb__334; Base_dSource.f_Pos_posEndOffset = dtb__335 } -> (if (dtb__333 = bindCol) then ((Base_dCommon.v_step (((v_parseBindingItem (fuel - 1)) st) bindCol)) (fun (item : t_BindingItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st1) bindCol)) (fun (rest : t_BindingItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__333 > bindCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInBinding) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1258 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItem = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstBindingKind) v_semBindingItem) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseBindingItemBody fuel) st0) bindCol)))))
# 1265 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItemBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__336; Frontend_dLexer.f_PTok_ptokPos = dtb__337 } -> (match dtb__336 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__338) -> (if (dtb__338 = "_") then (((v_parseBindingPattern fuel) st) bindCol) else (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__339) -> (match dtb__339 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__340; Frontend_dLexer.f_PTok_ptokPos = dtb__341 } -> (match dtb__340 with
  | Frontend_dLexer.C_Tok_TSym (dtb__342) -> (if (dtb__342 = ":") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance st)) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) bindCol)) (fun (ty : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st2)) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BISig (dtb__338, ty, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else (((v_parseBindingPattern fuel) st) bindCol))
  | _ -> (((v_parseBindingPattern fuel) st) bindCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parseBindingPattern fuel) st) bindCol)
)))
  | _ -> (((v_parseBindingPattern fuel) st) bindCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1284 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseBindingDef (fuel - 1)) st) st1) bindCol) pat))))
# 1291 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingDef = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__343, dtb__344) -> (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) bindCol) else false) then ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "=")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) bindCol)) (fun (value : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb__343, (Frontend_dAst.v_patRef pat))); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BClauses ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = pats; Frontend_dAst.f_LocalClause_lcBody = value; Frontend_dAst.f_LocalClause_lcRef = { Frontend_dAst.f_NodeRef_nodeRefId = (stStart).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st4) }; Frontend_dAst.f_LocalClause_lcHead = (Frontend_dAst.v_patRef pat) }, B_dData_dList.C_List_Nil)))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = (stStart).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st4) } })); B_dData_dPair.f_Pair_second = st4 })))))))))) else ((Base_dCommon.v_step ((((((v_parseBindingValue (fuel - 1)) stStart) st) (stStart).Frontend_dParser_dSupport.f_PState_openNodeId) pat) bindCol)) (fun (b : Frontend_dAst.t_Binding) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((((((v_parseBindingValue (fuel - 1)) stStart) st) (stStart).Frontend_dParser_dSupport.f_PState_openNodeId) pat) bindCol)) (fun (b : Frontend_dAst.t_Binding) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 }))))
)))
# 1300 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingValue = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (nid : int) (pat : Frontend_dAst.t_Pat) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "=")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = pat; Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (value)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st2) } }; B_dData_dPair.f_Pair_second = st2 }))))))))))
# 1767 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((((v_parseExprBody fuel) (st0).Frontend_dParser_dSupport.f_PState_openNodeId) st0) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExprId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) e); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_rekeyInfix (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef e))) (st0).Frontend_dParser_dSupport.f_PState_openNodeId) st1) })))))))
# 1775 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExprBody = (fun (fuel : int) (nid : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (((v_parseLhs (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (fuel - 1)) nid) st1) blockCol) lhs))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExprNotIndented)))))
# 1791 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseInfix = (fun (fuel : int) (nid : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (lhs : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__345; Frontend_dLexer.f_PTok_ptokPos = dtb__346 } -> (match dtb__345 with
  | Frontend_dLexer.C_Tok_TSym (dtb__347) -> (if (dtb__347 = "`") then (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectValueName (Frontend_dParser_dSupport.v_advance st))) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "`")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (fuel - 1)) nid) ((Frontend_dParser_dSupport.v_addBacktickShape nid) st3)) blockCol) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (name, (Frontend_dAst.v_detachedNodeRef (Frontend_dParser_dSupport.v_tokenSpan (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))) else (if (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isSyntaxSym dtb__347)) else false) then (if (Frontend_dParser_dSupport.v_closeParenNext st) then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (let sp = ((Frontend_dParser_dSupport.v_spanOf st0) (Frontend_dParser_dSupport.v_advance st0)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_sectionRightExpr dtb__347) lhs) { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = sp }); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset sp)) (Frontend_dCst.C_SectionShape_SectionRight (dtb__347))) (Frontend_dParser_dSupport.v_advance st0)) }))))) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (fuel - 1)) nid) st2) blockCol) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__347, (Frontend_dAst.v_detachedNodeRef (Frontend_dParser_dSupport.v_tokenSpan st)))), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))
# 1818 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLhs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__348; Frontend_dLexer.f_PTok_ptokPos = dtb__349 } -> (match dtb__348 with
  | Frontend_dLexer.C_Tok_TSym (dtb__350) -> (if (dtb__350 = "\\") then (((v_parseLambda (fuel - 1)) st) blockCol) else (if (dtb__350 = "-") then (((v_parseNegation (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))
  | Frontend_dLexer.C_Tok_TKw (dtb__351) -> (if (dtb__351 = "let") then (((v_parseLet (fuel - 1)) st) blockCol) else (if (dtb__351 = "case") then (((v_parseCase (fuel - 1)) st) blockCol) else (if (dtb__351 = "if") then (((v_parseIf (fuel - 1)) st) blockCol) else (if (dtb__351 = "do") then (((v_parseDo (fuel - 1)) st) blockCol) else (if (dtb__351 = "perform") then (((v_parsePerform (fuel - 1)) st) blockCol) else (if (dtb__351 = "handle") then (((v_parseHandle (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))))))
  | _ -> (((v_parseApplication (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1836 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseNegation = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> (match dtb__352 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__353; Frontend_dLexer.f_PTok_ptokPos = dtb__354 } -> (match dtb__353 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__355) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (("-" ^ dtb__355), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__356) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt ((0 - dtb__356), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
))))
# 1846 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseApplication = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st2) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAppAt), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (payload, args)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))); B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (let app = (Frontend_dAst.C_Expr_EApp (first, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))) in (if ((Frontend_dParser_dSupport.v_atSym st2) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsRowAt), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))), (B_dData_dList.C_List__x58__x58_ (app, (B_dData_dList.C_List__x58__x58_ (payload, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))); B_dData_dPair.f_Pair_second = st3 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = app; B_dData_dPair.f_Pair_second = st2 }))))
))))))))
# 1870 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtPayload = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (if ((Frontend_dParser_dSupport.v_atSym st) "(") then e else (v_rowAtNameExpr e)); B_dData_dPair.f_Pair_second = st1 }))))))
# 1893 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseArgs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (arg : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (arg, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 1904 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol) base)))))
# 1942 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseMacroAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstMacroKind) v_semMacroAtom) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance st0)) "!")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs fuel) st1) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((v_macroAtom name) args) ((Frontend_dParser_dSupport.v_spanOf st) st2)) ((Frontend_dParser_dSupport.v_spanOf st) st1)); B_dData_dPair.f_Pair_second = st2 })))))))))
# 1950 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__357; Frontend_dLexer.f_PTok_ptokPos = dtb__358 } -> (match dtb__357 with
  | Frontend_dLexer.C_Tok_TSym (dtb__359) -> (if (dtb__359 = "(") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__360) -> (if (Frontend_dParser_dSupport.v_piArrowAhead (Frontend_dParser_dSupport.v_advance st)) then ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__360)) (B_dData_dPair.v_secondOf dtb__360)) false) "(") ")") else (((v_parseParenAtom (fuel - 1)) st) blockCol))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dParser_dSupport.v_sectionOpAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseSectionAtom (fuel - 1)) st0) blockCol) dtb__361)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_parseParenAtom (fuel - 1)) st) blockCol)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__359 = "[") then (((v_parseListExpr (fuel - 1)) st) blockCol) else (if (dtb__359 = "?") then (match (Frontend_dParser_dSupport.v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__362) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((B_dData_dPair.v_firstOf dtb__362), (Frontend_dAst.v_detachedNodeRef (B_dData_dPair.v_secondOf dtb__362)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__359 = "{") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__363)) (B_dData_dPair.v_secondOf dtb__363)) true) "{") "}")
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "|")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st3) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (base, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))
  | _ -> failwith "DT: impossible branch"
) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__364) -> (if (dtb__364 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__365, dtb__366, dtb__367) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseTemplateAtom (fuel - 1)) st0) dtb__365) dtb__366) dtb__367)))
  | Frontend_dLexer.C_Tok_TStr (dtb__368) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__368, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TFloat (dtb__369) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__369, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__370) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__370, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__371) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "{") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "{")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st1b) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__371, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else (if (((v_macroBangAt st1) dtb__358) dtb__371) then ((((v_parseMacroAtom (fuel - 1)) st) blockCol) dtb__371) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__371, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 })))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1989 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (multi : bool) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((((v_parseTemplateParts (fuel - 1)) st) (Frontend_dParser_dSupport.v_tokSpan st)) parts)) (fun (parsed : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let ps = (B_dData_dPair.v_firstOf parsed) in (let holes = (B_dData_dPair.v_secondOf parsed) in (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = (((Frontend_dParser_dSupport.v_addInterpMulti (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_peekPos st))) multi) (((Frontend_dParser_dSupport.v_addTemplateHoles (st).Frontend_dParser_dSupport.f_PState_openNodeId) holes) ((Frontend_dParser_dSupport.v_withLastPos endP) advanced))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (ps, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st2) })); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2005 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateParts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fallback : Base_dSource.t_Span) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut4 = parts in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__372, dtb__373) -> (match dtb__372 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__374) -> ((Base_dCommon.v_bind ((((v_parseTemplateHole (v_toksFuel dtb__374)) st) fallback) dtb__374)) (fun (hole : (Frontend_dAst.t_Expr, Frontend_dCst.t_CstNode) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_parseTemplateParts (fuel - 1)) st) fallback) dtb__373)) (fun (tail : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole ((B_dData_dPair.v_firstOf hole))), (B_dData_dPair.v_firstOf tail))); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf hole), (B_dData_dPair.v_secondOf tail))) }))))))
  | Frontend_dLexer.C_TmplPart_TPText (dtb__375) -> ((Base_dCommon.v_bind ((((v_parseTemplateParts (fuel - 1)) st) fallback) dtb__373)) (fun (tail : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__375)), (B_dData_dPair.v_firstOf tail))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf tail) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))))
# 2018 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateHole = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fallback : Base_dSource.t_Span) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match toks with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At fallback) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateHoleEmpty)
  | B_dData_dList.C_List__x58__x58_ (dtb__376, dtb__377) -> (let pos = (dtb__376).Frontend_dLexer.f_PTok_ptokPos in (let file = (Frontend_dParser_dSupport.v_fileOf st) in (let subState = (((((((Frontend_dParser_dSupport.v_mkStateAt file) (st).Frontend_dParser_dSupport.f_PState_sourceOf) toks) pos) (B_dData_dList.v_length toks)) (Frontend_dParser_dSupport.v_pmodeOf st)) (Frontend_dParser_dSupport.v_eventMode st)) in (let nd_uscrut10 = (((v_parseExpr (fuel - 1)) subState) 0) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__378) -> (match dtb__378 with
  | { B_dData_dPair.f_Pair_first = dtb__379; B_dData_dPair.f_Pair_second = dtb__380 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__380) then (let events = (Frontend_dParser_dSupport.v_eventsOf dtb__380) in (let tree = (((((((Frontend_dCst.v_nestToTreeWithSurface (((Frontend_dCst.v_lexTokensOfFrom (st).Frontend_dParser_dSupport.f_PState_sourceOf) pos) toks)) events) ((Frontend_dCst.v_parenEntriesOf toks) events)) (dtb__380).Frontend_dParser_dSupport.f_PState_backtickShapes) (dtb__380).Frontend_dParser_dSupport.f_PState_sectionShapes) (dtb__380).Frontend_dParser_dSupport.f_PState_interpMultis) (dtb__380).Frontend_dParser_dSupport.f_PState_templateHoles) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__379; B_dData_dPair.f_Pair_second = (Frontend_dCst.v_holeRootOf tree) })))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (((v_holeSpan file) pos))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__381) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan ((v_holeSpan file) pos)) dtb__381)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
# 2059 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (let st2 = (Frontend_dParser_dSupport.v_advance st1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ",") then ((Base_dCommon.v_step ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairExprs (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3))) elems); B_dData_dPair.f_Pair_second = st3 })))) else (if ((Frontend_dParser_dSupport.v_atSym st2) ":") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAscribe), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st3 })))))))))))))
# 2075 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (e, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2094 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseSectionAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (op : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) op)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ")") then (let sp = ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st2)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (op, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = sp })); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset sp)) (Frontend_dCst.C_SectionShape_SectionOp (op))) (Frontend_dParser_dSupport.v_advance st2)) }))) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (let sp = ((Frontend_dParser_dSupport.v_spanOf st) st4) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_sectionLeftExpr op) rhs) { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = sp }); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset sp)) (Frontend_dCst.C_SectionShape_SectionLeft (op))) st4) }))))))))))))))
# 2139 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePiBinder = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (names : string B_dData_dList.t_List) (implicit : bool) (openSym : string) (closeSym : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (v_anyDottedName names) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_PiBinderNameNotSimple) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) openSym)) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_consumeQty st1) qty)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st2)) (fun (names2 : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (dom : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st5) closeSym)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st6) "->")) (fun (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st7) blockCol)) (fun (cod : Frontend_dAst.t_Expr) (st8 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((v_foldPiNames names2) implicit) qty) dom) cod) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st8))); B_dData_dPair.f_Pair_second = st8 })))))))))))))))))))))
# 2189 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignments = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) st) blockCol)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = fs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2200 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (fname : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st3) ",") then ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st3)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, rest)); B_dData_dPair.f_Pair_second = st4 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "}")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 2209 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) st1) blockCol)) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldCons (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) elems); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2218 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExprElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e0 : Frontend_dAst.t_Expr) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseListElemAt (fuel - 1)) e0) st0)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))))
# 2229 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListElemAt = (fun (fuel : int) (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "@") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "@")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st1) 0)) (fun (nm : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsRowAt), (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr e) st2)))), (B_dData_dList.C_List__x58__x58_ (e, (B_dData_dList.C_List__x58__x58_ ((v_rowAtNameExpr nm), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr e) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e; B_dData_dPair.f_Pair_second = st })))))
# 2245 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLambda = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "\\")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseLambdaParam st1)) (fun (first : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLambdaParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (params : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "=>")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (params, body, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st5)))); B_dData_dPair.f_Pair_second = st5 }))))))))))))))
# 2270 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLet = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "let")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLetBindings (fuel - 1)) st1) blockCol)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "in")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (binds, body, false, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2281 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLetBindings = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__382; Base_dSource.f_Pos_posCol = dtb__383; Base_dSource.f_Pos_posOffset = dtb__384; Base_dSource.f_Pos_posEndOffset = dtb__385 } -> (if (dtb__383 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_LetBindingNotIndented) else ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st) dtb__383)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 2293 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "case")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (scrut : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "of")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCaseAlts (fuel - 1)) st3) blockCol)) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (scrut, alts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2302 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCaseAlts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__386; Base_dSource.f_Pos_posCol = dtb__387; Base_dSource.f_Pos_posOffset = dtb__388; Base_dSource.f_Pos_posEndOffset = dtb__389 } -> (if (dtb__387 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseAltNotIndented) else ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st) dtb__387)) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_badCaseIndent st2) dtb__387) then ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentAfterCaseAlt) else (match alts with
  | B_dData_dList.C_List_Nil -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = alts; B_dData_dPair.f_Pair_second = st2 }))
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2324 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__390; Base_dSource.f_Pos_posCol = dtb__391; Base_dSource.f_Pos_posOffset = dtb__392; Base_dSource.f_Pos_posEndOffset = dtb__393 } -> (if (dtb__391 = altCol) then ((Base_dCommon.v_step (((v_parseAlt (fuel - 1)) st) altCol)) (fun (alt : Frontend_dAst.t_Alt) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st1) altCol)) (fun (rest : Frontend_dAst.t_Alt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (alt, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
))))
# 2335 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAlt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semAlt) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltBody fuel) st0) altCol)) (fun (alt : Frontend_dAst.t_Alt) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = (alt).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = (alt).Frontend_dAst.f_Alt_altBody; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) } }; B_dData_dPair.f_Pair_second = st1 })))))))
# 2343 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) altCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) altCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = body; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3 })))))))))))
# 2356 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePerform = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "perform")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) st1) blockCol)) (fun (operand : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsPerform), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2385 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "handle")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleComp (fuel - 1)) st1) blockCol)) (fun (comp : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "{")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleBody (fuel - 1)) st3) blockCol)) (fun (blk : t_HandleBlock) (st4 : Frontend_dParser_dSupport.t_PState) -> (match (((v_handleExpr comp) blk) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))) with
  | Base_dDiag.C_Check_ErrC (dtb__394) -> (Base_dDiag.C_Check_ErrC (dtb__394))
  | Base_dDiag.C_Check_OkC (dtb__395) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__395; B_dData_dPair.f_Pair_second = st4 }))
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 2407 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleComp = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__396; Frontend_dLexer.f_PTok_ptokPos = dtb__397 } -> (match dtb__396 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__398) -> (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__399) -> (match dtb__399 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__400; Frontend_dLexer.f_PTok_ptokPos = dtb__401 } -> (match dtb__400 with
  | Frontend_dLexer.C_Tok_TSym (dtb__402) -> (if (dtb__402 = "{") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__398, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (((v_parseExpr (fuel - 1)) st) blockCol))
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
))
  | _ -> (((v_parseExpr (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2420 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (handleCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__403; Base_dSource.f_Pos_posCol = dtb__404; Base_dSource.f_Pos_posOffset = dtb__405; Base_dSource.f_Pos_posEndOffset = dtb__406 } -> (if (dtb__404 <= handleCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNotIndented) else ((Base_dCommon.v_step (((((v_parseHandleClauses (fuel - 1)) st) dtb__404) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dList.C_List_Nil)) (fun (p : ((string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe, t_HandleOp B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__407; B_dData_dPair.f_Pair_second = dtb__408 } -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "}")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleBlock_HandleBlock (dtb__407, dtb__408)); B_dData_dPair.f_Pair_second = st3 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 2446 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleClauses = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (retOpt : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : t_HandleOp B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__409; Base_dSource.f_Pos_posCol = dtb__410; Base_dSource.f_Pos_posOffset = dtb__411; Base_dSource.f_Pos_posEndOffset = dtb__412 } -> (if (dtb__410 = clauseCol) then (if (v_isReturnClauseHead st) then (match retOpt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__413) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match acc with
  | B_dData_dList.C_List__x58__x58_ (dtb__414, dtb__415) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_step (((v_parseHandleRetClause (fuel - 1)) st) clauseCol)) (fun (p : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut13 = p in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> (match dtb__417 with
  | { B_dData_dPair.f_Pair_first = dtb__418; B_dData_dPair.f_Pair_second = dtb__419 } -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__418; B_dData_dPair.f_Pair_second = dtb__419 } }))) acc)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_step (((v_parseHandleOpClause (fuel - 1)) st) clauseCol)) (fun (op : t_HandleOp) (st2 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) retOpt) (B_dData_dList.C_List__x58__x58_ (op, acc)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))))
# 2476 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleRetClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semHandleRet) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st0)) (fun (_ukw : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (x : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "->")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = x; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st0) st4) } } }; B_dData_dPair.f_Pair_second = st4 }))))))))))))))
# 2488 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semHandleOp) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseHandleOpClauseBody fuel) st0) clauseCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId)))))
# 2500 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClauseBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) clauseCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match pat with
  | Frontend_dAst.C_Pat_PCon (dtb__420, dtb__421, dtb__422) -> (match (B_dData_dList.v_reverse dtb__421) with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__422)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
  | B_dData_dList.C_List__x58__x58_ (dtb__423, dtb__424) -> (match dtb__423 with
  | Frontend_dAst.C_Pat_PVar (dtb__425, dtb__426) -> (((((((((v_handleOpTail (fuel - 1)) st) st1) clauseCol) dtb__420) (B_dData_dList.v_reverse dtb__424)) dtb__422) nid) dtb__425)
  | Frontend_dAst.C_Pat_PWild (dtb__427) -> (((((((((v_handleOpTail (fuel - 1)) st) st1) clauseCol) dtb__420) (B_dData_dList.v_reverse dtb__424)) dtb__422) nid) "_")
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__422)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)))))))
# 2523 "Vuna/Compiler/Frontend/Parser.vuna"
and v_handleOpTail = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (cname : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (psp : Frontend_dAst.t_NodeRef) (nid : int) (kname : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "->")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleOp_HandleOp (cname, pats, psp, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st2) }, kname, body)); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2575 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseIf = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "if")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (cond : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "then")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (yes : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st4) "else")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st5) blockCol)) (fun (no : Frontend_dAst.t_Expr) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (cond, yes, no, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st6)))); B_dData_dPair.f_Pair_second = st6 }))))))))))))))))
# 2586 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDo = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "do")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st1) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement) else (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__428; Base_dSource.f_Pos_posCol = dtb__429; Base_dSource.f_Pos_posOffset = dtb__430; Base_dSource.f_Pos_posEndOffset = dtb__431 } -> (if (dtb__429 <= blockCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoStatementNotIndented) else ((Base_dCommon.v_step ((((v_parseDoStmts (fuel - 1)) st1) dtb__429) B_dData_dList.C_List_Nil)) (fun (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut10 = (B_dData_dList.v_reverse stmts) in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> (match dtb__432 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__434, dtb__435) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (stmts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 2609 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (acc : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__436; Base_dSource.f_Pos_posCol = dtb__437; Base_dSource.f_Pos_posOffset = dtb__438; Base_dSource.f_Pos_posEndOffset = dtb__439 } -> (if (dtb__437 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (if (dtb__437 > stmtCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((Base_dCommon.v_step (((v_parseDoStmt (fuel - 1)) st) stmtCol)) (fun (stmt : Frontend_dAst.t_DoStmt) (st1 : Frontend_dParser_dSupport.t_PState) -> (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__440; Base_dSource.f_Pos_posCol = dtb__441; Base_dSource.f_Pos_posOffset = dtb__442; Base_dSource.f_Pos_posEndOffset = dtb__443 } -> (if (Frontend_dParser_dSupport.v_isEof st1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__441 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__441 > stmtCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((((v_parseDoStmts (fuel - 1)) st1) stmtCol) (B_dData_dList.C_List__x58__x58_ (stmt, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2630 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDoStmtKind) v_semDoStmt) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseDoStmtBody fuel) st0) stmtCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))
# 2634 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmtBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "let") then ((((v_doLetOrExpr fuel) st) stmtCol) nid) else (let nd_uscrut4 = (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) stmtCol) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_ErrC (dtb__444) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | Base_dDiag.C_Check_OkC (dtb__445) -> (match dtb__445 with
  | { B_dData_dPair.f_Pair_first = dtb__446; B_dData_dPair.f_Pair_second = dtb__447 } -> (if ((Frontend_dParser_dSupport.v_atSym dtb__447) "<-") then ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (dtb__446, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb__447) "<-")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__446, e, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 2648 "Vuna/Compiler/Frontend/Parser.vuna"
and v_doLetOrExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match ((Frontend_dParser_dSupport.v_expectKw st) "let") with
  | Base_dDiag.C_Check_ErrC (dtb__448) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | Base_dDiag.C_Check_OkC (dtb__449) -> (let nd_uscrut6 = (((v_parseLetBindings (fuel - 1)) dtb__449) stmtCol) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__450) -> (match dtb__450 with
  | { B_dData_dPair.f_Pair_first = dtb__451; B_dData_dPair.f_Pair_second = dtb__452 } -> (if ((Frontend_dParser_dSupport.v_atKw dtb__452) "in") then ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb__451, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) dtb__452) })); B_dData_dPair.f_Pair_second = dtb__452 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__453) -> ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 2660 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoExprStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_sameLineState st)) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (e, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) })); B_dData_dPair.f_Pair_second = st1 }))))))

# 110 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExpressionSource = (fun (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel (((((Frontend_dParser_dSupport.v_mkState "<expr>") source) toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict) Frontend_dParser_dSupport.C_EventMode_EvNone))) (((((Frontend_dParser_dSupport.v_mkState "<expr>") source) toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict) Frontend_dParser_dSupport.C_EventMode_EvNone)) 0)) (fun (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC (e)) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr)))))))

# 1002 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitSupersRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ",")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) 0)) (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st2) (B_dData_dList.C_List__x58__x58_ (e, acc))))))))))

# 993 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitSupers = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) 0)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil)))))))

# 1145 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiom = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "axiom")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st4)) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (name, ty, (((v_declRefAt st) ds) st5))); B_dData_dPair.f_Pair_second = st5 })))))))))))))

# 781 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiomExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseAxiom st) blockCol) ds)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DAxiom (dtb__454, dtb__455, dtb__456) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__454, (Frontend_dAst.v_nodeRefSpan dtb__456))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseAxiomExport: not an axiom")
)))))

# 1153 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExtern = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "extern")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut6 = (Frontend_dParser_dSupport.v_peekTok st2) in (match nd_uscrut6 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__457; Frontend_dLexer.f_PTok_ptokPos = dtb__458 } -> (match dtb__457 with
  | Frontend_dLexer.C_Tok_TStr (dtb__459) -> ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__459; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) }))) (fun (cName2 : string) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st5)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (name, cName2, ty, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))))))))))
  | _ -> (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("string"))) "string")
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 793 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExternExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseExtern st) blockCol) ds)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DExtern (dtb__460, dtb__461, dtb__462, dtb__463) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__460, (Frontend_dAst.v_nodeRefSpan dtb__463))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseExternExport: not an extern")
)))))

# 1233 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhereBindings = (fun (st : Frontend_dParser_dSupport.t_PState) (whereCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__464; Base_dSource.f_Pos_posCol = dtb__465; Base_dSource.f_Pos_posOffset = dtb__466; Base_dSource.f_Pos_posEndOffset = dtb__467 } -> (if (dtb__465 > whereCol) then ((Base_dCommon.v_step (((v_parseBindingItemsAt (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__465)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1221 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhere = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__468; Frontend_dLexer.f_PTok_ptokPos = dtb__469 } -> (match dtb__468 with
  | Frontend_dLexer.C_Tok_TKw (dtb__470) -> (if (dtb__470 = "where") then (if ((Base_dSource.v_posCol dtb__469) > blockCol) then ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))) (fun (_u : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhereBindings st1) blockCol)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1187 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseClause = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) (ds : t_DeclStart) -> ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhere st3) blockCol)) (fun (wheres : Frontend_dAst.t_Binding B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (let body2 = (match wheres with
  | B_dData_dList.C_List_Nil -> body
  | B_dData_dList.C_List__x58__x58_ (dtb__471, dtb__472) -> (Frontend_dAst.C_Expr_ELet (wheres, body, true, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))))
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (name, pats, body2, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))))

# 1515 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFieldBody = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) (nid : int) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) fieldCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = name; Frontend_dAst.f_Field_fieldType = ty; Frontend_dAst.f_Field_fieldRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1511 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseField = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFieldKind) v_semField) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseFieldBody st0) fieldCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1500 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__473; Base_dSource.f_Pos_posCol = dtb__474; Base_dSource.f_Pos_posOffset = dtb__475; Base_dSource.f_Pos_posEndOffset = dtb__476 } -> (if (dtb__474 = fieldCol) then ((Base_dCommon.v_step ((v_parseField st) fieldCol)) (fun (fld : Frontend_dAst.t_Field) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseFieldList (fuel - 1)) st1) fieldCol)) (fun (rest : Frontend_dAst.t_Field B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (fld, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__474 > fieldCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInRecord) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1492 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFields = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__477; Base_dSource.f_Pos_posCol = dtb__478; Base_dSource.f_Pos_posOffset = dtb__479; Base_dSource.f_Pos_posEndOffset = dtb__480 } -> (if (dtb__478 > blockCol) then (((v_parseFieldList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__478) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 910 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecordExport = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3b) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__481; B_dData_dPair.f_Pair_second = dtb__482 } -> (let decl = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__481, dtb__482, tier, lin, (((v_declRefAt st) ds) st6))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st6 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 864 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredExport = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__483; Frontend_dLexer.f_PTok_ptokPos = dtb__484 } -> (match dtb__483 with
  | Frontend_dLexer.C_Tok_TKw (dtb__485) -> (if (dtb__485 = "linear") then (let nd_uscrut8 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut8 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__486; Frontend_dLexer.f_PTok_ptokPos = dtb__487 } -> (match dtb__486 with
  | Frontend_dLexer.C_Tok_TKw (dtb__488) -> (if (dtb__488 = "record") then (((((v_parseRecordExport true) tier) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__485 = "record") then (((((v_parseRecordExport false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1469 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecord = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__489; B_dData_dPair.f_Pair_second = dtb__490 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__489, dtb__490, tier, lin, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 1426 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredDecl = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__491; Frontend_dLexer.f_PTok_ptokPos = dtb__492 } -> (match dtb__491 with
  | Frontend_dLexer.C_Tok_TKw (dtb__493) -> (if (dtb__493 = "linear") then (let st1 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (let nd_uscrut9 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut9 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__494; Frontend_dLexer.f_PTok_ptokPos = dtb__495 } -> (match dtb__494 with
  | Frontend_dLexer.C_Tok_TKw (dtb__496) -> (if (dtb__496 = "record") then (((((v_parseRecord true) tier) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
))) else (if (dtb__493 = "record") then (((((v_parseRecord false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1577 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__497; Frontend_dLexer.f_PTok_ptokPos = dtb__498 } -> (match dtb__497 with
  | Frontend_dLexer.C_Tok_TSym (dtb__499) -> (if (dtb__499 = "(") then (if (v_parenIsMemberList st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) 0)) (fun (kind : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st4) ")")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) st5)) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_TraitParam_traitParamName = n; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (kind)) })) names)) rest); B_dData_dPair.f_Pair_second = st6 }))))))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__500) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitParam_traitParamName = dtb__500; Frontend_dAst.f_TraitParam_traitParamKind = B_dData_dMaybe.C_Maybe_Nothing }, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 967 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitHead = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if (v_traitSupersFollow st) then ((Base_dCommon.v_bind ((v_parseTraitSupers (Frontend_dParser_dSupport.v_stateFuel st)) st)) (fun (p : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair) -> (let supers = (B_dData_dPair.v_firstOf p) in (let st1 = (B_dData_dPair.v_secondOf p) in ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = supers }; B_dData_dPair.f_Pair_second = st3 })))))))))) else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1610 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigBody = (fun (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) (nid : int) -> ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) methodCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = name; Frontend_dAst.f_TraitMethod_traitMethodType = ty; Frontend_dAst.f_TraitMethod_traitMethodRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1606 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSig = (fun (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstMethodKind) v_semMethod) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseMethodSigBody st0) methodCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1595 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMethodSigList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__501; Base_dSource.f_Pos_posCol = dtb__502; Base_dSource.f_Pos_posOffset = dtb__503; Base_dSource.f_Pos_posEndOffset = dtb__504 } -> (if (dtb__502 = methodCol) then ((Base_dCommon.v_step ((v_parseMethodSig st) methodCol)) (fun (m : Frontend_dAst.t_TraitMethod) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseMethodSigList (fuel - 1)) st1) methodCol)) (fun (rest : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (m, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__502 > methodCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInTrait) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1587 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigs = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__505; Base_dSource.f_Pos_posCol = dtb__506; Base_dSource.f_Pos_posOffset = dtb__507; Base_dSource.f_Pos_posEndOffset = dtb__508 } -> (if (dtb__506 > blockCol) then (((v_parseMethodSigList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__506) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 939 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitExportMembers st2)) (fun (members : Frontend_dAst.t_ExportMembers) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st4) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> (let decl = (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, (((v_declRefAt st) ds) st5))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType ((h).f_TraitHead_traitHeadName, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st5 }))))))))))))))

# 1558 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTrait = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st3) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (let decl = (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, (((v_declRefAt st) ds) st4))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = decl; B_dData_dPair.f_Pair_second = st4 }))))))))))))

# 1662 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtxRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e, acc))) blockCol) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st3 }))))))))))))

# 1636 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtxThenExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctxThenSplit e1) hd); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil))) blockCol) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e1 }; B_dData_dPair.f_Pair_second = st1 }))))))))

# 1173 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSignature = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (allowCtx : bool) (name : string) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__509; B_dData_dPair.f_Pair_second = dtb__510 } -> (match dtb__509 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, B_dData_dList.C_List_Nil, dtb__510, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (if allowCtx then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, dtb__509, dtb__510, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere))
)
  | _ -> failwith "DT: impossible branch"
))))))

# 753 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedValue = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__511; Frontend_dLexer.f_PTok_ptokPos = dtb__512 } -> (match dtb__511 with
  | Frontend_dLexer.C_Tok_TSym (dtb__513) -> (if (dtb__513 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__513) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__513) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__513, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__513) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__513) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__513, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__513) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__514) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__514) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__514, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__514) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__514) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__514, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__514) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name")
)
  | _ -> failwith "DT: impossible branch"
)))

# 842 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityValue = (fun (kind : Frontend_dAst.t_Opacity) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__515; Frontend_dLexer.f_PTok_ptokPos = dtb__516 } -> (match dtb__515 with
  | Frontend_dLexer.C_Tok_TSym (dtb__517) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__517) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__517) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__517; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__518) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__518) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__518; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")
)
  | _ -> failwith "DT: impossible branch"
)))

# 825 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__519; Frontend_dLexer.f_PTok_ptokPos = dtb__520 } -> (match dtb__519 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__521) -> (if (dtb__521 = "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityAbstract) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))
  | Frontend_dLexer.C_Tok_TKw (dtb__522) -> (if (dtb__522 = "opaque") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "opaque")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityOpaque) st1) blockCol) ds))) else (if (dtb__522 = "transparent") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "transparent")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityTransparent) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 817 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semParsedDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseOpacityDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 1704 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_instanceMethodStart st) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) false) name) ds) else ((((v_parseClause st1) blockCol) name) ds)))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1693 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (v_instanceMethodStart st) then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseInstanceDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1683 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseInstanceDeclList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (declCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__523; Base_dSource.f_Pos_posCol = dtb__524; Base_dSource.f_Pos_posOffset = dtb__525; Base_dSource.f_Pos_posEndOffset = dtb__526 } -> (if (dtb__524 = declCol) then ((Base_dCommon.v_step ((v_parseInstanceDecl st) declCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseInstanceDeclList (fuel - 1)) st1) declCol)) (fun (rest : Frontend_dAst.t_Decl B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (decl, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__524 > declCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInInstance) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1675 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__527; Base_dSource.f_Pos_posCol = dtb__528; Base_dSource.f_Pos_posOffset = dtb__529; Base_dSource.f_Pos_posEndOffset = dtb__530 } -> (if (dtb__528 > blockCol) then (((v_parseInstanceDeclList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__528) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1630 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceTail = (fun (ctxE : Frontend_dAst.t_Expr B_dData_dList.t_List) (head : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseInstanceBody st3) blockCol)) (fun (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (ctxE, head, methods, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 })))))))

# 1619 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstance = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "instance")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__531; B_dData_dPair.f_Pair_second = dtb__532 } -> ((((((v_parseInstanceTail dtb__531) dtb__532) st) blockCol) ds) st2)
  | _ -> failwith "DT: impossible branch"
))))))

# 1760 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtorBody = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) (nid : int) -> ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) ctorCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = name; Frontend_dAst.f_Ctor_ctorType = ty; Frontend_dAst.f_Ctor_ctorArity = (Frontend_dParser_dSupport.v_countArrows ty); Frontend_dAst.f_Ctor_ctorRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1756 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtor = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstCtorKind) v_semCtor) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseCtorBody st0) ctorCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1745 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtorList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__533; Base_dSource.f_Pos_posCol = dtb__534; Base_dSource.f_Pos_posOffset = dtb__535; Base_dSource.f_Pos_posEndOffset = dtb__536 } -> (if (dtb__534 = ctorCol) then ((Base_dCommon.v_step ((v_parseCtor st) ctorCol)) (fun (ctor : Frontend_dAst.t_Ctor) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtorList (fuel - 1)) st1) ctorCol)) (fun (rest : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (ctor, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__534 > ctorCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInData) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1737 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtors = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__537; Base_dSource.f_Pos_posCol = dtb__538; Base_dSource.f_Pos_posOffset = dtb__539; Base_dSource.f_Pos_posEndOffset = dtb__540 } -> (if (dtb__538 > blockCol) then (((v_parseCtorList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__538) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 875 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDataExport = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3b) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__541; B_dData_dPair.f_Pair_second = dtb__542 } -> (let decl = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__541, dtb__542, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st8 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))))

# 806 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__543; Frontend_dLexer.f_PTok_ptokPos = dtb__544 } -> (match dtb__543 with
  | Frontend_dLexer.C_Tok_TKw (dtb__545) -> (if (dtb__545 = "data") then ((((v_parseDataExport true) st1) blockCol) ds) else (if (dtb__545 = "record") then (((((v_parseRecordExport true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 698 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedPlain = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__546; Frontend_dLexer.f_PTok_ptokPos = dtb__547 } -> (match dtb__546 with
  | Frontend_dLexer.C_Tok_TSym (dtb__548) -> ((((v_parseExportedValue op) st) blockCol) ds)
  | Frontend_dLexer.C_Tok_TIdent (dtb__549) -> (if (if (if (dtb__549 = "alias") then true else (dtb__549 = "boxed")) then (v_tierFollows st) else false) then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseTieredExport (if (dtb__549 = "alias") then Frontend_dAst.C_ReprTier_ReprAlias else Frontend_dAst.C_ReprTier_ReprBoxed)) st) blockCol) ds)) else ((((v_parseExportedValue op) st) blockCol) ds))
  | Frontend_dLexer.C_Tok_TKw (dtb__550) -> (if (dtb__550 = "data") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseDataExport false) st) blockCol) ds)) else (if (dtb__550 = "linear") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseLinearExport st) blockCol) ds)) else (if (dtb__550 = "record") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((((v_parseRecordExport false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds)) else (if (dtb__550 = "trait") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseTraitExport st) blockCol) ds)) else (if (dtb__550 = "axiom") then ((((v_parseAxiomExport op) st) blockCol) ds) else (if (dtb__550 = "extern") then ((((v_parseExternExport op) st) blockCol) ds) else (if (dtb__550 = "transparent") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else (if (dtb__550 = "opaque") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 692 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atKw st1) "opaque") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "opaque")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityOpaque))) st2) blockCol) ds))) else (if (if ((Frontend_dParser_dSupport.v_atKw st1) "transparent") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "transparent")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityTransparent))) st2) blockCol) ds))) else (if ((v_atIdentName st1) "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityAbstract))) st2) blockCol) ds))) else ((((v_parseExportedPlain B_dData_dMaybe.C_Maybe_Nothing) st1) blockCol) ds)))))))

# 684 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semParsedDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 1438 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseData = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = dtb__552 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__551, dtb__552, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))); B_dData_dPair.f_Pair_second = st8 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

# 1402 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__553; Frontend_dLexer.f_PTok_ptokPos = dtb__554 } -> (match dtb__553 with
  | Frontend_dLexer.C_Tok_TKw (dtb__555) -> (if (dtb__555 = "data") then ((((v_parseData true) st1) blockCol) ds) else (if (dtb__555 = "record") then (((((v_parseRecord true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1105 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__556; Frontend_dLexer.f_PTok_ptokPos = dtb__557 } -> (match dtb__556 with
  | Frontend_dLexer.C_Tok_TSym (dtb__558) -> (if (dtb__558 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) name) ds) else ((((v_parseClause st1) blockCol) name) ds)))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__558) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__558) ds) else ((((v_parseClause st1) blockCol) dtb__558) ds)))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__559) -> (if (if (dtb__559 = "alias") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (if (if (dtb__559 = "boxed") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__559) ds) else ((((v_parseClause st1) blockCol) dtb__559) ds)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__560) -> (if (dtb__560 = "data") then ((((v_parseData false) st) blockCol) ds) else (if (dtb__560 = "linear") then (((v_parseLinearDecl st) blockCol) ds) else (if (dtb__560 = "axiom") then (((v_parseAxiom st) blockCol) ds) else (if (dtb__560 = "extern") then (((v_parseExtern st) blockCol) ds) else (if (dtb__560 = "record") then (((((v_parseRecord false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds) else (if (dtb__560 = "trait") then (((v_parseTrait st) blockCol) ds) else (if (dtb__560 = "instance") then (((v_parseInstance st) blockCol) ds) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 1097 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 623 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityOrDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__561; Frontend_dLexer.f_PTok_ptokPos = dtb__562 } -> (match dtb__561 with
  | Frontend_dLexer.C_Tok_TKw (dtb__563) -> (if (dtb__563 = "infixl") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 1) dtb__562)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__563 = "infixr") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 2) dtb__562)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__563 = "infix") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 0) dtb__562)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))))))))
  | _ -> (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))))))
)
  | _ -> failwith "DT: impossible branch"
)))

# 538 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDecls = (fun (recover : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : t_DeclAcc) (blocks : t_DeclBlock) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_reverseDeclAcc acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = st; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__564; Base_dSource.f_Pos_posCol = dtb__565; Base_dSource.f_Pos_posOffset = dtb__566; Base_dSource.f_Pos_posEndOffset = dtb__567 } -> (if (dtb__565 = blockCol) then (match ((v_parseFixityOrDecl st) blockCol) with
  | Base_dDiag.C_Check_ErrC (dtb__568) -> (if recover then (let st2 = ((v_recoverDecl st) blockCol) in ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st2) blockCol) acc) (v_dbClose blocks))) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__569; B_dData_dPair.f_Pair_second = dtb__570 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__569; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__568, dtb__570)) } }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_ErrC (dtb__568)))
  | Base_dDiag.C_Check_OkC (dtb__571) -> (let pd = (B_dData_dPair.v_firstOf dtb__571) in (let st1 = (B_dData_dPair.v_secondOf dtb__571) in (let acc2 = ((v_addParsedDecl pd) acc) in (let verdict = ((v_blockStep blocks) pd) in (match (B_dData_dPair.v_firstOf verdict) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__572) -> (if recover then ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))) (fun (q : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__573; B_dData_dPair.f_Pair_second = dtb__574 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = q; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__573; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__572, dtb__574)) } }))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (dtb__572)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseDecls recover) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn ((string_of_int blockCol)))) (string_of_int blockCol)))
  | _ -> failwith "DT: impossible branch"
))))

# 221 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceFile = (fun (recover : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseModDecl st)) (fun (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (imp : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match imp with
  | { B_dData_dPair.f_Pair_first = dtb__575; B_dData_dPair.f_Pair_second = dtb__576 } -> (if (Frontend_dParser_dSupport.v_isEof st2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__575; Frontend_dAst.f_SourceFile_sourceFileFixities = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileDecls = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__576; Frontend_dAst.f_SourceFile_sourceFileOpacity = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) else (match (Frontend_dParser_dSupport.v_peekPos st2) with
  | { Base_dSource.f_Pos_posLine = dtb__577; Base_dSource.f_Pos_posCol = dtb__578; Base_dSource.f_Pos_posOffset = dtb__579; Base_dSource.f_Pos_posEndOffset = dtb__580 } -> ((Base_dCommon.v_step ((((((v_parseDecls recover) (Frontend_dParser_dSupport.v_stateFuel st2)) st2) dtb__578) v_emptyDeclAcc) v_emptyDeclBlock)) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__581; B_dData_dPair.f_Pair_second = dtb__582 } -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__583; f_DeclAcc_declAccDecls = dtb__584; f_DeclAcc_declAccExports = dtb__585; f_DeclAcc_declAccOpacity = dtb__586 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__581) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__575; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__583; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__584; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__585; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__576; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__586 }; B_dData_dPair.f_Pair_second = dtb__581 }; B_dData_dPair.f_Pair_second = dtb__582 })) else ((v_ps0 dtb__581) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 57 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceCore = (fun (events : Frontend_dParser_dSupport.t_EventMode) (file : string) (source : string) -> (let nd_uscrut3 = (Frontend_dLexer.v_lexSourceWithComments source) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__587) -> (match dtb__587 with
  | { B_dData_dPair.f_Pair_first = dtb__588; B_dData_dPair.f_Pair_second = dtb__589 } -> (let st0 = (((((Frontend_dParser_dSupport.v_mkState file) source) dtb__588) Frontend_dParser_dSupport.C_ParseMode_PmTool) events) in (match ((v_parseSourceFile false) st0) with
  | Base_dDiag.C_Check_ErrC (dtb__590) -> (Base_dDiag.C_Check_ErrC (dtb__590))
  | Base_dDiag.C_Check_OkC (dtb__591) -> (Base_dDiag.C_Check_OkC ({ f_ParsedCore_pcSource = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__591)); f_ParsedCore_pcComments = dtb__589; f_ParsedCore_pcToks = dtb__588; f_ParsedCore_pcFin = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__591)) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__592) -> (Base_dDiag.C_Check_ErrC (dtb__592))
  | _ -> failwith "DT: impossible branch"
)))

# 74 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceDetailed = (fun (file : string) (source : string) -> (match (((v_parseSourceCore Frontend_dParser_dSupport.C_EventMode_EvFull) file) source) with
  | Base_dDiag.C_Check_ErrC (dtb__593) -> (Base_dDiag.C_Check_ErrC (dtb__593))
  | Base_dDiag.C_Check_OkC (dtb__594) -> (let events = (Frontend_dParser_dSupport.v_eventsOf (dtb__594).f_ParsedCore_pcFin) in (let cst = (((((((Frontend_dCst.v_nestToTreeWithSurface (((Frontend_dCst.v_lexTokensOf source) (dtb__594).f_ParsedCore_pcToks) (dtb__594).f_ParsedCore_pcComments)) events) ((Frontend_dCst.v_parenEntriesOf (dtb__594).f_ParsedCore_pcToks) events)) ((dtb__594).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_backtickShapes) ((dtb__594).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_sectionShapes) ((dtb__594).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_interpMultis) ((dtb__594).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_templateHoles) in (Base_dDiag.C_Check_OkC ({ f_ParsedSource_parsedFile = (Frontend_dAstView.v_ofTree cst); f_ParsedSource_parsedComments = (dtb__594).f_ParsedCore_pcComments; f_ParsedSource_parsedRawToks = (dtb__594).f_ParsedCore_pcToks; f_ParsedSource_parsedCst = cst }))))
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceWithComments = (fun (file : string) (source : string) -> (match (((v_parseSourceCore Frontend_dParser_dSupport.C_EventMode_EvNone) file) source) with
  | Base_dDiag.C_Check_ErrC (dtb__595) -> (Base_dDiag.C_Check_ErrC (dtb__595))
  | Base_dDiag.C_Check_OkC (dtb__596) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__596).f_ParsedCore_pcSource; B_dData_dPair.f_Pair_second = (dtb__596).f_ParsedCore_pcComments }))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSource = (fun (file : string) (source : string) -> (let nd_uscrut2 = ((v_parseSourceWithComments file) source) in (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__597) -> (match dtb__597 with
  | { B_dData_dPair.f_Pair_first = dtb__598; B_dData_dPair.f_Pair_second = dtb__599 } -> (Base_dDiag.C_Check_OkC (dtb__598))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__600) -> (Base_dDiag.C_Check_ErrC (dtb__600))
  | _ -> failwith "DT: impossible branch"
)))

# 2919 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecoveringTokens = (fun (file : string) (source : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (let st0 = (((((Frontend_dParser_dSupport.v_mkState file) source) toks) mode) Frontend_dParser_dSupport.C_EventMode_EvLayout) in ((Base_dCommon.v_bind ((v_parseSourceFile true) st0)) (fun (p : ((Frontend_dAst.t_SourceFile, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let fin = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf p)) in (let events = (Frontend_dParser_dSupport.v_eventsOf fin) in (let parens = ((Frontend_dCst.v_parenEntriesOf toks) events) in (let holes = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) (fin).Frontend_dParser_dSupport.f_PState_templateHoles) in (let facts = ((((Frontend_dCst.v_fixityFactsOfParts parens) (fin).Frontend_dParser_dSupport.f_PState_backtickShapes) (fin).Frontend_dParser_dSupport.f_PState_sectionShapes) holes) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = facts }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))))))))

# 2907 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecovering = (fun (file : string) (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((((v_parseSourceRecoveringTokens file) source) Frontend_dParser_dSupport.C_ParseMode_PmStrict) toks))))

# 36 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedFile = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__601; f_ParsedSource_parsedComments = dtb__602; f_ParsedSource_parsedRawToks = dtb__603; f_ParsedSource_parsedCst = dtb__604 } -> dtb__601
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedComments = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__605; f_ParsedSource_parsedComments = dtb__606; f_ParsedSource_parsedRawToks = dtb__607; f_ParsedSource_parsedCst = dtb__608 } -> dtb__606
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedRawToks = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__609; f_ParsedSource_parsedComments = dtb__610; f_ParsedSource_parsedRawToks = dtb__611; f_ParsedSource_parsedCst = dtb__612 } -> dtb__611
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedCst = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__613; f_ParsedSource_parsedComments = dtb__614; f_ParsedSource_parsedRawToks = dtb__615; f_ParsedSource_parsedCst = dtb__616 } -> dtb__616
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcSource = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__617; f_ParsedCore_pcComments = dtb__618; f_ParsedCore_pcToks = dtb__619; f_ParsedCore_pcFin = dtb__620 } -> dtb__617
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcComments = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__621; f_ParsedCore_pcComments = dtb__622; f_ParsedCore_pcToks = dtb__623; f_ParsedCore_pcFin = dtb__624 } -> dtb__622
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcToks = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__625; f_ParsedCore_pcComments = dtb__626; f_ParsedCore_pcToks = dtb__627; f_ParsedCore_pcFin = dtb__628 } -> dtb__627
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcFin = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__629; f_ParsedCore_pcComments = dtb__630; f_ParsedCore_pcToks = dtb__631; f_ParsedCore_pcFin = dtb__632 } -> dtb__632
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccFixities = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__633; f_DeclAcc_declAccDecls = dtb__634; f_DeclAcc_declAccExports = dtb__635; f_DeclAcc_declAccOpacity = dtb__636 } -> dtb__633
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccDecls = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__637; f_DeclAcc_declAccDecls = dtb__638; f_DeclAcc_declAccExports = dtb__639; f_DeclAcc_declAccOpacity = dtb__640 } -> dtb__638
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccExports = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__641; f_DeclAcc_declAccDecls = dtb__642; f_DeclAcc_declAccExports = dtb__643; f_DeclAcc_declAccOpacity = dtb__644 } -> dtb__643
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccOpacity = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__645; f_DeclAcc_declAccDecls = dtb__646; f_DeclAcc_declAccExports = dtb__647; f_DeclAcc_declAccOpacity = dtb__648 } -> dtb__648
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedFixity = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__649; f_ParsedDecl_parsedDecl = dtb__650; f_ParsedDecl_parsedExport = dtb__651; f_ParsedDecl_parsedOpacity = dtb__652 } -> dtb__649
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedDecl = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__653; f_ParsedDecl_parsedDecl = dtb__654; f_ParsedDecl_parsedExport = dtb__655; f_ParsedDecl_parsedOpacity = dtb__656 } -> dtb__654
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedExport = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__657; f_ParsedDecl_parsedDecl = dtb__658; f_ParsedDecl_parsedExport = dtb__659; f_ParsedDecl_parsedOpacity = dtb__660 } -> dtb__659
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedOpacity = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__661; f_ParsedDecl_parsedDecl = dtb__662; f_ParsedDecl_parsedExport = dtb__663; f_ParsedDecl_parsedOpacity = dtb__664 } -> dtb__664
  | _ -> failwith "DT: impossible branch"
))

# 136 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declStartId = (fun (p : t_DeclStart) -> (match p with
  | { f_DeclStart_declStartId = dtb__665; f_DeclStart_declStartPos = dtb__666 } -> dtb__665
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declStartPos = (fun (p : t_DeclStart) -> (match p with
  | { f_DeclStart_declStartId = dtb__667; f_DeclStart_declStartPos = dtb__668 } -> dtb__668
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpen = (fun (p : t_DeclBlock) -> (match p with
  | { f_DeclBlock_dbOpen = dtb__669; f_DeclBlock_dbClauses = dtb__670; f_DeclBlock_dbFirst = dtb__671 } -> dtb__669
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClauses = (fun (p : t_DeclBlock) -> (match p with
  | { f_DeclBlock_dbOpen = dtb__672; f_DeclBlock_dbClauses = dtb__673; f_DeclBlock_dbFirst = dtb__674 } -> dtb__673
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbFirst = (fun (p : t_DeclBlock) -> (match p with
  | { f_DeclBlock_dbOpen = dtb__675; f_DeclBlock_dbClauses = dtb__676; f_DeclBlock_dbFirst = dtb__677 } -> dtb__677
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadName = (fun (p : t_TraitHead) -> (match p with
  | { f_TraitHead_traitHeadName = dtb__678; f_TraitHead_traitHeadParams = dtb__679; f_TraitHead_traitHeadSupers = dtb__680 } -> dtb__678
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadParams = (fun (p : t_TraitHead) -> (match p with
  | { f_TraitHead_traitHeadName = dtb__681; f_TraitHead_traitHeadParams = dtb__682; f_TraitHead_traitHeadSupers = dtb__683 } -> dtb__682
  | _ -> failwith "DT: impossible branch"
))

# 964 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadSupers = (fun (p : t_TraitHead) -> (match p with
  | { f_TraitHead_traitHeadName = dtb__684; f_TraitHead_traitHeadParams = dtb__685; f_TraitHead_traitHeadSupers = dtb__686 } -> dtb__686
  | _ -> failwith "DT: impossible branch"
))
