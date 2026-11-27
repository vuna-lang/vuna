open Vuna_runtime
type t_ParsedSource = { f_ParsedSource_parsedFile : Frontend_dAst.t_SourceFile; f_ParsedSource_parsedComments : Frontend_dLexer.t_Comment B_dData_dList.t_List; f_ParsedSource_parsedRawToks : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_ParsedSource_parsedCst : Frontend_dCst.t_CstNode }
and t_ParsedCore = { f_ParsedCore_pcSource : Frontend_dAst.t_SourceFile; f_ParsedCore_pcComments : Frontend_dLexer.t_Comment B_dData_dList.t_List; f_ParsedCore_pcToks : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_ParsedCore_pcFin : Frontend_dParser_dSupport.t_PState }
and t_DeclAcc = { f_DeclAcc_declAccFixities : Frontend_dAst.t_FixityDecl B_dData_dList.t_List; f_DeclAcc_declAccDecls : Frontend_dAst.t_Decl B_dData_dList.t_List; f_DeclAcc_declAccExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List; f_DeclAcc_declAccOpacity : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List }
and t_ParsedDecl = { f_ParsedDecl_parsedFixity : Frontend_dAst.t_FixityDecl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedDecl : Frontend_dAst.t_Decl B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedExport : Frontend_dAst.t_ExportSpec B_dData_dMaybe.t_Maybe; f_ParsedDecl_parsedOpacity : Frontend_dAst.t_OpacitySpec B_dData_dMaybe.t_Maybe }
and t_DeclStart = { f_DeclStart_declStartId : int; f_DeclStart_declStartPos : Base_dSource.t_Pos }
and t_DeclBlock = { f_DeclBlock_dbOpen : string B_dData_dMaybe.t_Maybe; f_DeclBlock_dbClauses : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List; f_DeclBlock_dbFirst : (string, Base_dSource.t_Span) B_dContainer_dHashMap.t_HashMap; f_DeclBlock_dbResume : bool }
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

# 32 "Vuna/Compiler/Frontend/Parser.vuna"
let v_psDiagAt = (fun (st : Frontend_dParser_dSupport.t_PState) (e : Base_dDiagnostics_dFrontend.t_PsDiag) (args : string B_dData_dVec.t_Vec) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dParser_dSupport.v_tokSpan st))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg e) args)))

# 37 "Vuna/Compiler/Frontend/Parser.vuna"
let v_endOfInputDiag = (fun (st : Frontend_dParser_dSupport.t_PState) -> (((v_psDiagAt st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput) B_dData_dVec.C_Vec_Nil))

# 133 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclAcc = { f_DeclAcc_declAccFixities = B_dData_dList.C_List_Nil; f_DeclAcc_declAccDecls = B_dData_dList.C_List_Nil; f_DeclAcc_declAccExports = B_dData_dList.C_List_Nil; f_DeclAcc_declAccOpacity = B_dData_dList.C_List_Nil }

# 142 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyParsedDecl = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }

# 151 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declRefAt = (fun (st : Frontend_dParser_dSupport.t_PState) (ds : t_DeclStart) (end_ : Frontend_dParser_dSupport.t_PState) -> { Frontend_dAst.f_NodeRef_nodeRefId = (ds).f_DeclStart_declStartId; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) end_) })

# 158 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semModHead = (fun (mc0 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemModHead (dtb__0))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semImport = (fun (i : Frontend_dAst.t_Import) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemImport (i)))))

# 165 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semReexportImport = (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemReexportImport ((B_dData_dPair.v_firstOf p), (B_dData_dPair.v_secondOf p))))))

# 168 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExportNamespace = (fun (item : Frontend_dAst.t_ExportItem) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExportNamespace (item)))))

# 171 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExportItem = (fun (item : Frontend_dAst.t_ExportItem) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExportItem (item)))))

# 174 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semFixity = (fun (f : Frontend_dAst.t_FixityDecl) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemFixity (f)))))

# 177 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semDecl = (fun (d : Frontend_dAst.t_Decl) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDecl (d, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing)))))

# 180 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semParsedDecl = (fun (mc0 : t_ParsedDecl) -> (match mc0 with
  | { f_ParsedDecl_parsedFixity = dtb__1; f_ParsedDecl_parsedDecl = dtb__2; f_ParsedDecl_parsedExport = dtb__3; f_ParsedDecl_parsedOpacity = dtb__4 } -> (match dtb__2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDecl (dtb__5, dtb__3, dtb__4))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semCtor = (fun (c : Frontend_dAst.t_Ctor) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemCtor (c)))))

# 187 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semField = (fun (f : Frontend_dAst.t_Field) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemField (f)))))

# 190 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMethod = (fun (m : Frontend_dAst.t_TraitMethod) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemMethod (m)))))

# 193 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semBindingItem = (fun (mc0 : t_BindingItem) -> (match mc0 with
  | C_BindingItem_BIBind (dtb__6) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemBinding (dtb__6))))
  | C_BindingItem_BISig (dtb__7, dtb__8, dtb__9) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemBindingSig (dtb__7, dtb__8, dtb__9))))
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semAlt = (fun (a : Frontend_dAst.t_Alt) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemAlt (a)))))

# 200 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExpr = (fun (e : Frontend_dAst.t_Expr) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExpr (e)))))

# 203 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semPat = (fun (p : Frontend_dAst.t_Pat) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemPat (p)))))

# 206 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semDoStmt = (fun (s : Frontend_dAst.t_DoStmt) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDoStmt (s)))))

# 215 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMacroNamed = (fun (arity : int) (n : string) -> (match (Frontend_dReserved.v_macroNameOf n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemMacro (dtb__10, arity))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMacroAtom = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__11, dtb__12, dtb__13) -> (match dtb__11 with
  | Frontend_dAst.C_Expr_EVar (dtb__14, dtb__15) -> ((v_semMacroNamed (B_dData_dList.v_length dtb__12)) dtb__14)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb__16, dtb__17) -> ((v_semMacroNamed 0) dtb__16)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 222 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semHandleRet = (fun (_u : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> B_dData_dMaybe.C_Maybe_Nothing)

# 341 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportItemOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportMembers) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__18) -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, dtb__18, mc2))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XTypeSome (mc0, B_dData_dList.C_List_Nil, mc2))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (mc0, mc2))
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespaceBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "module")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (name : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st3) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "as")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st4)) (fun (alias : string) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, (B_dData_dMaybe.C_Maybe_Just (alias)), { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st5) })); B_dData_dPair.f_Pair_second = st5 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (name, B_dData_dMaybe.C_Maybe_Nothing, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 }))))))))))

# 360 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespace = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semExportNamespace) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportNamespaceBody st0))))

# 391 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reexportPrefix = (fun (imp : Frontend_dAst.t_Import) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> dtb__19
  | B_dData_dMaybe.C_Maybe_Nothing -> (imp).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Parser.vuna"
let v_qualifyExportItem = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ExportItem) -> (match mc1 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__20, dtb__21, dtb__22) -> (Frontend_dAst.C_ExportItem_XNamespace (dtb__20, dtb__21, dtb__22))
  | Frontend_dAst.C_ExportItem_XModule (dtb__23, dtb__24) -> (Frontend_dAst.C_ExportItem_XModule (dtb__23, dtb__24))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__25, dtb__26, dtb__27) -> (Frontend_dAst.C_ExportItem_XTypeSome ((String.concat "" [mc0; "."; dtb__25]), dtb__26, dtb__27))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__28, dtb__29) -> (Frontend_dAst.C_ExportItem_XTypeAll ((String.concat "" [mc0; "."; dtb__28]), dtb__29))
  | Frontend_dAst.C_ExportItem_XBare (dtb__30, dtb__31) -> (Frontend_dAst.C_ExportItem_XBare ((String.concat "" [mc0; "."; dtb__30]), dtb__31))
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAlias = (fun (start : Base_dSource.t_Pos) (nid : int) (st : Frontend_dParser_dSupport.t_PState) (isQualified : bool) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "as")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (alias : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = (B_dData_dMaybe.C_Maybe_Just (alias)); Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) start) st3) } }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = name; Frontend_dAst.f_Import_importIsQualified = isQualified; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) start) st1) } }; B_dData_dPair.f_Pair_second = st1 }))))))

# 372 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAfterKeyword = (fun (start : Base_dSource.t_Pos) (nid : int) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "qualified")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseImportAlias start) nid) st1) true))) else ((((v_parseImportAlias start) nid) st) false)))

# 407 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpecBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "import")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos st)) (st).Frontend_dParser_dSupport.f_PState_openNodeId) st1))))

# 404 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpec = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semImport) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseImportSpecBody st0))))

# 469 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclBlock = { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil); f_DeclBlock_dbResume = false }

# 473 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbMarkResume = (fun (b : t_DeclBlock) -> { b with f_DeclBlock_dbResume = true })

# 476 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClose = (fun (b : t_DeclBlock) -> { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst; f_DeclBlock_dbResume = (b).f_DeclBlock_dbResume })

# 480 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpenAt = (fun (n : string) (sp : Base_dSource.t_Span) (b : t_DeclBlock) -> (let first2 = (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) (b).f_DeclBlock_dbFirst) then (b).f_DeclBlock_dbFirst else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) sp) (b).f_DeclBlock_dbFirst)) in { f_DeclBlock_dbOpen = (B_dData_dMaybe.C_Maybe_Just (n)); f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = first2; f_DeclBlock_dbResume = (b).f_DeclBlock_dbResume }))

# 486 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbAddClause = (fun (b : t_DeclBlock) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> { f_DeclBlock_dbOpen = (b).f_DeclBlock_dbOpen; f_DeclBlock_dbClauses = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pats; B_dData_dPair.f_Pair_second = sp }, (b).f_DeclBlock_dbClauses)); f_DeclBlock_dbFirst = (b).f_DeclBlock_dbFirst; f_DeclBlock_dbResume = (b).f_DeclBlock_dbResume })

# 489 "Vuna/Compiler/Frontend/Parser.vuna"
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

# 496 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_findShadow = (fun (mc0 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__36 with
  | { B_dData_dPair.f_Pair_first = dtb__38; B_dData_dPair.f_Pair_second = dtb__39 } -> (if ((Frontend_dAst.v_clauseSubsumedBy dtb__38) mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__39)) else ((v_findShadow dtb__37) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Frontend/Parser.vuna"
let v_shadowDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "an earlier clause already matches these values"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseShadowed (n))) (B_dData_dVec.C_Vec__x58__x58_ (n, B_dData_dVec.C_Vec_Nil))))))

# 500 "Vuna/Compiler/Frontend/Parser.vuna"
let v_clauseVerdict = (fun (mc0 : t_DeclBlock) (mc1 : string) (mc2 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> (if (v_anyNullary (mc0).f_DeclBlock_dbClauses) then (B_dData_dMaybe.C_Maybe_Just (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (mc3)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_DefinitionDuplicate (mc1))) (B_dData_dVec.C_Vec__x58__x58_ (mc1, B_dData_dVec.C_Vec_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (match ((v_findShadow (mc0).f_DeclBlock_dbClauses) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__40) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shadowDiag mc1) mc3) dtb__40)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
))

# 523 "Vuna/Compiler/Frontend/Parser.vuna"
let v_notAdjacentDiag = (fun (n : string) (sp : Base_dSource.t_Span) (firstSp : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (firstSp)); Base_dDiag.f_Label_labelText = "the definition starts here"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (sp)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseNotAdjacent (n))) (B_dData_dVec.C_Vec__x58__x58_ (n, B_dData_dVec.C_Vec_Nil))))))

# 517 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reopenDiag = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) (b).f_DeclBlock_dbFirst) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> (B_dData_dMaybe.C_Maybe_Just ((((v_notAdjacentDiag n) sp) dtb__41)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockFun = (fun (b : t_DeclBlock) (n : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (if (dtb__42 = n) then { B_dData_dPair.f_Pair_first = ((((v_clauseVerdict b) n) pats) sp); B_dData_dPair.f_Pair_second = (((v_dbAddClause b) pats) sp) } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) }
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockSig = (fun (b : t_DeclBlock) (n : string) (sp : Base_dSource.t_Span) -> (match (b).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb__43) -> (if (dtb__43 = n) then { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = b } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) (v_dbClose b)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag b) n) sp); B_dData_dPair.f_Pair_second = (((v_dbOpenAt n) sp) b) }
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockStepRaw = (fun (mc0 : t_DeclBlock) (mc1 : t_ParsedDecl) -> (match mc1 with
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

# 549 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockStep = (fun (b : t_DeclBlock) (pd : t_ParsedDecl) -> (match ((v_blockStepRaw b) pd) with
  | { B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = dtb__67 } -> { B_dData_dPair.f_Pair_first = (if (b).f_DeclBlock_dbResume then B_dData_dMaybe.C_Maybe_Nothing else dtb__66); B_dData_dPair.f_Pair_second = { dtb__67 with f_DeclBlock_dbResume = false } }
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declColumnDiag = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let col = (string_of_int blockCol) in (((v_psDiagAt st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn (col))) (B_dData_dVec.C_Vec__x58__x58_ (col, B_dData_dVec.C_Vec_Nil)))))

# 625 "Vuna/Compiler/Frontend/Parser.vuna"
let v_addParsedDecl = (fun (mc0 : t_ParsedDecl) (mc1 : t_DeclAcc) -> (match mc0 with
  | { f_ParsedDecl_parsedFixity = dtb__68; f_ParsedDecl_parsedDecl = dtb__69; f_ParsedDecl_parsedExport = dtb__70; f_ParsedDecl_parsedOpacity = dtb__71 } -> (match mc1 with
  | { f_DeclAcc_declAccFixities = dtb__72; f_DeclAcc_declAccDecls = dtb__73; f_DeclAcc_declAccExports = dtb__74; f_DeclAcc_declAccOpacity = dtb__75 } -> (let fixities2 = (match dtb__68 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__72))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__72
  | _ -> failwith "DT: impossible branch"
) in (let decls2 = (match dtb__69 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__73))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__73
  | _ -> failwith "DT: impossible branch"
) in (let exports2 = (match dtb__70 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__77) -> (B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__74))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__74
  | _ -> failwith "DT: impossible branch"
) in (let opacity2 = (match dtb__71 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__75))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__75
  | _ -> failwith "DT: impossible branch"
) in { f_DeclAcc_declAccFixities = fixities2; f_DeclAcc_declAccDecls = decls2; f_DeclAcc_declAccExports = exports2; f_DeclAcc_declAccOpacity = opacity2 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 646 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reverseDeclAcc = (fun (mc0 : t_DeclAcc) -> (match mc0 with
  | { f_DeclAcc_declAccFixities = dtb__80; f_DeclAcc_declAccDecls = dtb__81; f_DeclAcc_declAccExports = dtb__82; f_DeclAcc_declAccOpacity = dtb__83 } -> { f_DeclAcc_declAccFixities = (B_dData_dList.v_reverse dtb__80); f_DeclAcc_declAccDecls = (B_dData_dList.v_reverse dtb__81); f_DeclAcc_declAccExports = (B_dData_dList.v_reverse dtb__82); f_DeclAcc_declAccOpacity = (B_dData_dList.v_reverse dtb__83) }
  | _ -> failwith "DT: impossible branch"
))

# 680 "Vuna/Compiler/Frontend/Parser.vuna"
let v_closesBracket = (fun (mc0 : Frontend_dLexer.t_Tok) -> (match mc0 with
  | Frontend_dLexer.C_Tok_TSym (dtb__84) -> (if (dtb__84 = ")") then true else (if (dtb__84 = "]") then true else (if (dtb__84 = "}") then true else false)))
  | _ -> false
))

# 676 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declStartsAt = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok) (mc2 : int) -> (match mc1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__85; Frontend_dLexer.f_PTok_ptokPos = dtb__86 } -> (if (if (mc0 = 0) then ((Base_dSource.v_posCol dtb__86) = mc2) else false) then (B_dData_dBool.v_not (v_closesBracket dtb__85)) else false)
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declDepthAfter = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok) -> (match mc1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__87; Frontend_dLexer.f_PTok_ptokPos = dtb__88 } -> (match ((Frontend_dParser_dSupport.v_tokBracketStep dtb__87) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__89) -> dtb__89
  | B_dData_dMaybe.C_Maybe_Nothing -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 667 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_skipToDeclLine = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (if (((v_declStartsAt mc2) dtb__90) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91)) else (((v_skipToDeclLine dtb__91) mc1) ((v_declDepthAfter mc2) dtb__90)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 662 "Vuna/Compiler/Frontend/Parser.vuna"
let v_skipPastDeclStart = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (((v_skipToDeclLine dtb__93) mc1) 0)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Frontend/Parser.vuna"
let v_recoverDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let rest = ((v_skipPastDeclStart (st).Frontend_dParser_dSupport.f_PState_toksOf) blockCol) in (let skipped = (bi_natSub (B_dData_dList.v_length (st).Frontend_dParser_dSupport.f_PState_toksOf) (B_dData_dList.v_length rest)) in { st with Frontend_dParser_dSupport.f_PState_toksOf = rest; Frontend_dParser_dSupport.f_PState_toksLeft = (B_dData_dList.v_length rest); Frontend_dParser_dSupport.f_PState_tokIndex = ((st).Frontend_dParser_dSupport.f_PState_tokIndex + skipped) })))

# 726 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportMarkerFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__94; Frontend_dLexer.f_PTok_ptokPos = dtb__95 } -> (match dtb__94 with
  | Frontend_dLexer.C_Tok_TKw (dtb__96) -> (if (dtb__96 = "data") then true else (if (dtb__96 = "record") then true else (if (dtb__96 = "trait") then true else (if (dtb__96 = "axiom") then true else (if (dtb__96 = "extern") then true else (if (dtb__96 = "linear") then true else (if (dtb__96 = "opaque") then true else (if (dtb__96 = "transparent") then true else (if (dtb__96 = "import") then true else false)))))))))
  | Frontend_dLexer.C_Tok_TSym (dtb__97) -> (if (dtb__97 = ":") then false else true)
  | Frontend_dLexer.C_Tok_TIdent (dtb__98) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 720 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__99; Frontend_dLexer.f_PTok_ptokPos = dtb__100 } -> (match dtb__99 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__101) -> (if (dtb__101 = "export") then (v_exportMarkerFollows (Frontend_dParser_dSupport.v_advance st)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 815 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityGiven = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__102) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 819 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacitySpecOf = (fun (mc0 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (mc1 : string) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__103) -> (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = mc1; Frontend_dAst.f_OpacitySpec_opacityKind = dtb__103; Frontend_dAst.f_OpacitySpec_opacitySpan = mc2 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1054 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_traitSupersFollowGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (match dtb__104 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__106; Frontend_dLexer.f_PTok_ptokPos = dtb__107 } -> (let nd_uscrut7 = dtb__106 in (match nd_uscrut7 with
  | Frontend_dLexer.C_Tok_TSym (dtb__108) -> (if (dtb__108 = "=>") then (mc0 = 0) else (if (dtb__108 = "(") then ((v_traitSupersFollowGo (mc0 + 1)) dtb__105) else (if (dtb__108 = ")") then ((v_traitSupersFollowGo (if (mc0 > 0) then (mc0 - 1) else 0)) dtb__105) else ((v_traitSupersFollowGo mc0) dtb__105))))
  | Frontend_dLexer.C_Tok_TKw (dtb__109) -> (if (dtb__109 = "where") then false else ((v_traitSupersFollowGo mc0) dtb__105))
  | _ -> ((v_traitSupersFollowGo mc0) dtb__105)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1051 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitSupersFollow = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((v_traitSupersFollowGo 0) (st).Frontend_dParser_dSupport.f_PState_toksOf))

# 1090 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parenIsMemberList = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__110; Frontend_dLexer.f_PTok_ptokPos = dtb__111 } -> (match dtb__110 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__112) -> (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__113; Frontend_dLexer.f_PTok_ptokPos = dtb__114 } -> (match dtb__113 with
  | Frontend_dLexer.C_Tok_TSym (dtb__115) -> (if (dtb__115 = ",") then true else (if (dtb__115 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dLexer.C_Tok_TSym (dtb__116) -> (if (dtb__116 = "..") then true else (if (dtb__116 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1123 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectDeclName = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__117; Frontend_dLexer.f_PTok_ptokPos = dtb__118 } -> (match dtb__117 with
  | Frontend_dLexer.C_Tok_TSym (dtb__119) -> (if (dtb__119 = "(") then (let nd_uscrut5 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> (match dtb__120 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__121; Frontend_dLexer.f_PTok_ptokPos = dtb__122 } -> (match dtb__121 with
  | Frontend_dLexer.C_Tok_TSym (dtb__123) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__123) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (let nd_uscrut11 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> (match dtb__124 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__125; Frontend_dLexer.f_PTok_ptokPos = dtb__126 } -> (match dtb__125 with
  | Frontend_dLexer.C_Tok_TSym (dtb__127) -> (if (dtb__127 = ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__123; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) })) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator"))
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
)) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__119) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__128) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 332 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMemberNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseMemberNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 326 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (if ((Frontend_dParser_dSupport.v_atSym st1) "..") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "..")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step ((v_parseMemberNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (names)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 301 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItem = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__129; Frontend_dLexer.f_PTok_ptokPos = dtb__130 } -> (match dtb__129 with
  | Frontend_dLexer.C_Tok_TSym (dtb__131) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__131) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__131, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__132) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "(") then ((Base_dCommon.v_step (v_parseExportMembers st1)) (fun (members : Frontend_dAst.t_ExportMembers) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_exportItemOf dtb__132) members) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb__132, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
  | Frontend_dLexer.C_Tok_TKw (dtb__133) -> (if (dtb__133 = "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (name, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem)
)
  | _ -> failwith "DT: impossible branch"
)))

# 292 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItemAt = (fun (mc0 : bool) (mc1 : Frontend_dParser_dSupport.t_PState) -> (if mc0 then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExportItemKind) v_semExportItem) mc1) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseExportItem st0)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExportItemRef { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf mc1) st1) }) item); B_dData_dPair.f_Pair_second = st1 })))))) else (v_parseExportItem mc1)))

# 283 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseExportItemsFrom = (fun (anchored : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step ((v_parseExportItemAt anchored) st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseExportItemsFrom anchored) (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 277 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItems = (fun (anchored : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else (((v_parseExportItemsFrom anchored) (Frontend_dParser_dSupport.v_stateFuel st1)) st1)))))

# 266 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "module")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) "(") then ((Base_dCommon.v_step ((v_parseExportItems true) st2)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = true; Frontend_dAst.f_ModDecl_modDeclExportItems = items; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st4) } })); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = name; Frontend_dAst.f_ModDecl_modDeclHasExportList = false; Frontend_dAst.f_ModDecl_modDeclExportItems = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } })); B_dData_dPair.f_Pair_second = st3 }))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 259 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDecl = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "module") then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstModHeadKind) v_semModHead) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseModDeclBody st0))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = st }))))

# 381 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseReexportTail = (fun (imp : Frontend_dAst.t_Import) (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then ((Base_dCommon.v_step ((v_parseExportItems false) st)) (fun (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (v_qualifyExportItem (v_reexportPrefix imp))) items) }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = imp; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st1 }))))))

# 352 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImportBody = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st1) "import") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "import")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos st)) (st).Frontend_dParser_dSupport.f_PState_openNodeId) st2)) (fun (imp : Frontend_dAst.t_Import) (st3 : Frontend_dParser_dSupport.t_PState) -> ((v_parseReexportTail imp) st3))))) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))

# 348 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImport = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semReexportImport) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportImportBody st0))))

# 1102 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOptionalMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "(") then (v_parseExportMembers st) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = st }))))

# 1085 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExportMembers = (fun (st : Frontend_dParser_dSupport.t_PState) -> (v_parseOptionalMembers st))

# 1144 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectFixityLevel = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__134; Frontend_dLexer.f_PTok_ptokPos = dtb__135 } -> (match dtb__134 with
  | Frontend_dLexer.C_Tok_TInt (dtb__136) -> (if (if (dtb__136 >= 0) then (dtb__136 <= 9) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_FixityLevelRange))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedFixityLevel)
)
  | _ -> failwith "DT: impossible branch"
)))

# 1152 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectOpName = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__137; Frontend_dLexer.f_PTok_ptokPos = dtb__138 } -> (match dtb__137 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__139) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__139) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__139; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | Frontend_dLexer.C_Tok_TSym (dtb__140) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__140) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1115 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) (nid : int) -> ((Base_dCommon.v_step (v_expectFixityLevel (Frontend_dParser_dSupport.v_advance st))) (fun (level : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_expectOpName st1)) (fun (op : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = op; Frontend_dAst.f_FixityDecl_fixityLevel = level; Frontend_dAst.f_FixityDecl_fixityAssoc = assoc; Frontend_dAst.f_FixityDecl_fixityRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) kwPos) st2) } }; B_dData_dPair.f_Pair_second = st2 })))))))

# 1107 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (assoc : int) (kwPos : Base_dSource.t_Pos) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFixityKind) v_semFixity) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseFixityDeclBody st0) blockCol) assoc) kwPos) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1239 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rejectCtxSuffix = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere) else (Base_dDiag.C_Check_OkC (st))))

# 1424 "Vuna/Compiler/Frontend/Parser.vuna"
let v_localFunMerge = (fun (mc0 : string) (mc1 : Frontend_dAst.t_BindingValue) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (match (dtb__141).Frontend_dAst.f_Binding_bindPat with
  | Frontend_dAst.C_Pat_PVar (dtb__143, dtb__144) -> (if (dtb__143 = mc0) then (match (dtb__141).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__145) -> (match mc1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__146) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb__143, dtb__144)); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BClauses (((B_dData_dList.v_append dtb__145) dtb__146))); Frontend_dAst.f_Binding_bindSig = (dtb__141).Frontend_dAst.f_Binding_bindSig; Frontend_dAst.f_Binding_bindRef = (dtb__141).Frontend_dAst.f_Binding_bindRef }, dtb__142))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1441 "Vuna/Compiler/Frontend/Parser.vuna"
let v_patBoundName = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PVar (dtb__147, dtb__148) -> dtb__147
  | _ -> ""
))

# 1445 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingSigOf = (fun (mc0 : string) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (match dtb__149 with
  | { B_dData_dPair.f_Pair_first = dtb__151; B_dData_dPair.f_Pair_second = dtb__152 } -> (if (dtb__151 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__152)) else ((v_bindingSigOf mc0) dtb__150))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1449 "Vuna/Compiler/Frontend/Parser.vuna"
let v_hasBindingSig = (fun (name : string) (sigs : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_bindingSigOf name) sigs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1455 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstDanglingSig = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (match dtb__154 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (match dtb__157 with
  | { B_dData_dPair.f_Pair_first = dtb__158; B_dData_dPair.f_Pair_second = dtb__159 } -> (if ((B_dData_dList.v_memName dtb__156) mc1) then ((v_firstDanglingSig dtb__155) mc1) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__159 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1385 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingBindsGo = (fun (mc0 : t_BindingItem B_dData_dList.t_List) (mc1 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (match dtb__160 with
  | C_BindingItem_BISig (dtb__162, dtb__163, dtb__164) -> (if ((B_dData_dList.v_memName dtb__162) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__164))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigBeforeClause (dtb__162))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__162, B_dData_dVec.C_Vec_Nil)))))) else (if ((v_hasBindingSig dtb__162) mc1) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__164))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigDuplicate (dtb__162))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__162, B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__161) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } }, mc1))) mc2) mc3)))
  | C_BindingItem_BIBind (dtb__165) -> (match (((v_localFunMerge (v_patBoundName (dtb__165).Frontend_dAst.f_Binding_bindPat)) (dtb__165).Frontend_dAst.f_Binding_bindValue) mc3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> ((((v_bindingBindsGo dtb__161) mc1) mc2) dtb__166)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut9 = ((v_bindingSigOf (v_patBoundName (dtb__165).Frontend_dAst.f_Binding_bindPat)) mc1) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_bindingBindsGo dtb__161) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb__165).Frontend_dAst.f_Binding_bindPat), mc2))) (B_dData_dList.C_List__x58__x58_ (dtb__165, mc3)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> (match dtb__167 with
  | { B_dData_dPair.f_Pair_first = dtb__168; B_dData_dPair.f_Pair_second = dtb__169 } -> (if ((B_dData_dList.v_memName (v_patBoundName (dtb__165).Frontend_dAst.f_Binding_bindPat)) mc2) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__169))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigMultiClause ((v_patBoundName (dtb__165).Frontend_dAst.f_Binding_bindPat)))) (B_dData_dVec.C_Vec__x58__x58_ ((v_patBoundName (dtb__165).Frontend_dAst.f_Binding_bindPat), B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb__161) mc1) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb__165).Frontend_dAst.f_Binding_bindPat), mc2))) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb__165).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = (dtb__165).Frontend_dAst.f_Binding_bindValue; Frontend_dAst.f_Binding_bindSig = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb__168; Frontend_dAst.f_BindingSig_sigRef = dtb__169 })); Frontend_dAst.f_Binding_bindRef = (dtb__165).Frontend_dAst.f_Binding_bindRef }, mc3))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let nd_uscrut5 = ((v_firstDanglingSig (B_dData_dList.v_reverse mc1)) mc2) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> (match dtb__170 with
  | { B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = dtb__172 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb__172))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigNoDef (dtb__171))) (B_dData_dVec.C_Vec__x58__x58_ (dtb__171, B_dData_dVec.C_Vec_Nil))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc3)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1382 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindingItemsToBinds = (fun (items : t_BindingItem B_dData_dList.t_List) -> ((((v_bindingBindsGo items) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1485 "Vuna/Compiler/Frontend/Parser.vuna"
let v_tierFollows = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__173; Frontend_dLexer.f_PTok_ptokPos = dtb__174 } -> (match dtb__173 with
  | Frontend_dLexer.C_Tok_TKw (dtb__175) -> (if (dtb__175 = "record") then true else (if (dtb__175 = "linear") then (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__176; Frontend_dLexer.f_PTok_ptokPos = dtb__177 } -> (match dtb__176 with
  | Frontend_dLexer.C_Tok_TKw (dtb__178) -> (if (dtb__178 = "record") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 745 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__179; Frontend_dLexer.f_PTok_ptokPos = dtb__180 } -> (match dtb__179 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__181) -> (if (dtb__181 = "abstract") then true else false)
  | Frontend_dLexer.C_Tok_TKw (dtb__182) -> (if (dtb__182 = "opaque") then (B_dData_dBool.v_not (v_tierFollows st)) else (if (dtb__182 = "transparent") then (B_dData_dBool.v_not (v_tierFollows st)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1594 "Vuna/Compiler/Frontend/Parser.vuna"
let v_atIdentName = (fun (st : Frontend_dParser_dSupport.t_PState) (name : string) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__183; Frontend_dLexer.f_PTok_ptokPos = dtb__184 } -> (match dtb__183 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__185) -> (dtb__185 = name)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 420 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseImports = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "import") then ((Base_dCommon.v_step (v_parseImportSpec st)) (fun (imp : Frontend_dAst.t_Import) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__186; B_dData_dPair.f_Pair_second = dtb__187 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (imp, dtb__186)); B_dData_dPair.f_Pair_second = dtb__187 }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "import") else false) then ((Base_dCommon.v_step (v_parseExportImport st)) (fun (p : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__190; B_dData_dPair.f_Pair_second = dtb__191 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__190)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__189) dtb__191) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if (if ((v_atIdentName st) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance st)) "module") else false) then ((Base_dCommon.v_step (v_parseExportNamespace st)) (fun (item : Frontend_dAst.t_ExportItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (fuel - 1)) st1)) (fun (rest : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (item, dtb__193)) }; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> failwith "DT: impossible branch"
))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st })))))))

# 1618 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDerivingNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((v_parseDerivingNames (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (rest : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1612 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDerivingParens = (fun (via : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step ((v_parseDerivingNames (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = names; B_dData_dPair.f_Pair_second = via }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1602 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeriving = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw st) "deriving") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "deriving")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((v_atIdentName st1) "via") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st2)) (fun (fld : string) (st3 : Frontend_dParser_dSupport.t_PState) -> (if (fld = "field") then ((v_parseDerivingParens true) st3) else (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("field"))) "field")))))) else ((v_parseDerivingParens false) st1)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = false }; B_dData_dPair.f_Pair_second = st }))))

# 1724 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_innermostPiCod = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> (v_innermostPiCod dtb__198)
  | _ -> mc0
))

# 1728 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_replacePiCod = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205) -> (Frontend_dAst.C_Expr_EPi (dtb__200, dtb__201, dtb__202, dtb__203, ((v_replacePiCod dtb__204) mc1), dtb__205))
  | _ -> mc1
))

# 1719 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ctxThenSplit = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_innermostPiCod (Frontend_dAst.C_Expr_EPi (dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_replacePiCod (Frontend_dAst.C_Expr_EPi (dtb__206, dtb__207, dtb__208, dtb__209, dtb__210, dtb__211))) mc1) }
  | _ -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = mc1 }
))

# 1785 "Vuna/Compiler/Frontend/Parser.vuna"
let v_instanceMethodStart = (fun (st : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__212; Frontend_dLexer.f_PTok_ptokPos = dtb__213 } -> (match dtb__212 with
  | Frontend_dLexer.C_Tok_TSym (dtb__214) -> (if (dtb__214 = "(") then (let nd_uscrut5 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__215) -> (match dtb__215 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__216; Frontend_dLexer.f_PTok_ptokPos = dtb__217 } -> (match dtb__216 with
  | Frontend_dLexer.C_Tok_TSym (dtb__218) -> (let nd_uscrut11 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__219) -> (match dtb__219 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__220; Frontend_dLexer.f_PTok_ptokPos = dtb__221 } -> (match dtb__220 with
  | Frontend_dLexer.C_Tok_TSym (dtb__222) -> (if (dtb__222 = ")") then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__218)) else false)
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
)) else (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb__214)))
  | Frontend_dLexer.C_Tok_TIdent (dtb__223) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1799 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__224; Frontend_dLexer.f_PTok_ptokPos = dtb__225 } -> (match dtb__224 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__226) -> ((Base_dCommon.v_step ((v_parseParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : string B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__226, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1950 "Vuna/Compiler/Frontend/Parser.vuna"
let v_spanFromExpr = (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (let sp = (Frontend_dAst.v_exprSpan e) in (let p1 = (Frontend_dParser_dSupport.v_lastPos st2) in { Base_dSource.f_Span_spanFile = (sp).Base_dSource.f_Span_spanFile; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol sp); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (Frontend_dParser_dSupport.v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset sp); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) })))

# 1985 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldSuffix = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (base : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ".") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ".")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (fname : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (fuel - 1)) st2) blockCol) (Frontend_dAst.C_Expr_EField (base, fname, (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr base) st2))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st })))))

# 1999 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroBangAt = (fun (st : Frontend_dParser_dSupport.t_PState) (start : Base_dSource.t_Pos) (name : string) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__227; Frontend_dLexer.f_PTok_ptokPos = dtb__228 } -> (match dtb__227 with
  | Frontend_dLexer.C_Tok_TSym (dtb__229) -> (if (dtb__229 = "!") then (if ((Base_dSource.v_posLine dtb__228) = (Base_dSource.v_posLine start)) then ((Base_dSource.v_posCol dtb__228) = ((Base_dSource.v_posCol start) + (String.length name))) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 2006 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroAtom = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (mc0))), (Frontend_dAst.v_detachedNodeRef mc3)))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (mc0))), (Frontend_dAst.v_detachedNodeRef mc3))), mc1, (Frontend_dAst.v_detachedNodeRef mc2)))
))

# 2115 "Vuna/Compiler/Frontend/Parser.vuna"
let v_holeSpan = (fun (mc0 : string) (mc1 : Base_dSource.t_Pos) -> (match mc1 with
  | { Base_dSource.f_Pos_posLine = dtb__230; Base_dSource.f_Pos_posCol = dtb__231; Base_dSource.f_Pos_posOffset = dtb__232; Base_dSource.f_Pos_posEndOffset = dtb__233 } -> { Base_dSource.f_Span_spanFile = mc0; Base_dSource.f_Span_spanStartLine = dtb__230; Base_dSource.f_Span_spanStartCol = dtb__231; Base_dSource.f_Span_spanEndLine = dtb__230; Base_dSource.f_Span_spanEndCol = dtb__231; Base_dSource.f_Span_spanStartOffset = dtb__232; Base_dSource.f_Span_spanEndOffset = dtb__232 }
  | _ -> failwith "DT: impossible branch"
))

# 2119 "Vuna/Compiler/Frontend/Parser.vuna"
let v_toksFuel = (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((128 * (B_dData_dList.v_length toks)) + 1024))

# 2123 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_textPartsOf = (fun (mc0 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (match dtb__234 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__236) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_TmplPart_TPText (dtb__237) -> (match (v_textPartsOf dtb__235) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (B_dData_dMaybe.C_Maybe_Just ((dtb__237 ^ dtb__238)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (""))
  | _ -> failwith "DT: impossible branch"
))

# 2158 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairExprs = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__239, dtb__240) -> (match dtb__240 with
  | B_dData_dList.C_List_Nil -> dtb__239
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTuplePair), mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__239, (B_dData_dList.C_List__x58__x58_ (((v_foldPairExprs mc0) dtb__240), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2195 "Vuna/Compiler/Frontend/Parser.vuna"
let v_sectionLeftExpr = (fun (op : string) (operand : Frontend_dAst.t_Expr) (r : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan r) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (op, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), r)))

# 2202 "Vuna/Compiler/Frontend/Parser.vuna"
let v_sectionRightExpr = (fun (op : string) (operand : Frontend_dAst.t_Expr) (r : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan r) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (op, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), (B_dData_dList.C_List__x58__x58_ (operand, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan r)))), r)))

# 2233 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePiNamesRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__241; Frontend_dLexer.f_PTok_ptokPos = dtb__242 } -> (match dtb__241 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__243) -> (((v_parsePiNamesRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) (B_dData_dList.C_List__x58__x58_ (dtb__243, acc)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 2224 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsePiNames = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parsePiNamesRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (name, B_dData_dList.C_List_Nil)))))))

# 2243 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPiNames = (fun (mc0 : string B_dData_dList.t_List) (mc1 : bool) (mc2 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__244, dtb__245) -> (Frontend_dAst.C_Expr_EPi (dtb__244, mc1, mc2, mc3, ((((((v_foldPiNames dtb__245) mc1) mc2) mc3) mc4) mc5), mc5))
  | B_dData_dList.C_List_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

# 2248 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyDottedName = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__246, dtb__247) -> (if (Base_dSource.v_containsDot dtb__246) then true else (v_anyDottedName dtb__247))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2253 "Vuna/Compiler/Frontend/Parser.vuna"
let v_consumeQty = (fun (mc0 : Frontend_dParser_dSupport.t_PState) (mc1 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__248) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok mc0) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__249; Frontend_dLexer.f_PTok_ptokPos = dtb__250 } -> (match dtb__249 with
  | Frontend_dLexer.C_Tok_TInt (dtb__251) -> (if (dtb__251 = 0) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else (if (dtb__251 = 1) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance mc0))) else ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)))
  | _ -> ((v_ps0 mc0) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2314 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldCons = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__252, dtb__253) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListCons), mc0)), (B_dData_dList.C_List__x58__x58_ (dtb__252, (B_dData_dList.C_List__x58__x58_ (((v_foldCons mc0) dtb__253), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2328 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLambdaParam = (fun (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = name; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_tokenSpan st) }; B_dData_dPair.f_Pair_second = st1 })))))

# 2332 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseLambdaParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) ",") then ((Base_dCommon.v_step (v_parseLambdaParam (Frontend_dParser_dSupport.v_advance st))) (fun (p : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseLambdaParams (fuel - 1)) st1) ((B_dData_dList.v_append acc) (B_dData_dList.C_List__x58__x58_ (p, B_dData_dList.C_List_Nil)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = st })))))

# 2423 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rowAtNameExpr = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__254, dtb__255) -> (Frontend_dAst.C_Expr_EStr (dtb__254, dtb__255))
  | _ -> mc0
))

# 2512 "Vuna/Compiler/Frontend/Parser.vuna"
let v_isReturnClauseHead = (fun (stat : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut1 = (Frontend_dParser_dSupport.v_peekTok stat) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__256; Frontend_dLexer.f_PTok_ptokPos = dtb__257 } -> (match dtb__256 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__258) -> (dtb__258 = "return")
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 2606 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpKName = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> dtb__263
  | _ -> failwith "DT: impossible branch"
))

# 2610 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstOtherKName = (fun (mc0 : t_HandleOp B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__265, dtb__266) -> (let k2 = (v_handleOpKName dtb__265) in (if (k2 = mc1) then ((v_firstOtherKName dtb__266) mc1) else (B_dData_dMaybe.C_Maybe_Just (k2))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2618 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleAlt = (fun (mc0 : t_HandleOp) -> (match mc0 with
  | C_HandleOp_HandleOp (dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272) -> { Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb__267, dtb__268, dtb__269)); Frontend_dAst.f_Alt_altBody = dtb__272; Frontend_dAst.f_Alt_altRef = dtb__270 }
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semHandleOp = (fun (op : t_HandleOp) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemAlt ((v_handleAlt op))))))

# 2622 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleRetExpr = (fun (mc0 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (match dtb__273 with
  | { B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = dtb__275 } -> (match dtb__275 with
  | { B_dData_dPair.f_Pair_first = dtb__276; B_dData_dPair.f_Pair_second = dtb__277 } -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__274; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__277) }, B_dData_dList.C_List_Nil)), dtb__276, dtb__277))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsHandleNoRet), mc1))
  | _ -> failwith "DT: impossible branch"
))

# 2627 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpLam = (fun (ops : t_HandleOp B_dData_dList.t_List) (kname : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleOpIndexBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleOpBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = kname; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleOpBinderName, sp)), ((B_dData_dList.v_map v_handleAlt) ops), sp)), sp)))

# 2635 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleExpr = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : t_HandleBlock) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | C_HandleBlock_HandleBlock (dtb__278, dtb__279) -> (match dtb__279 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> (match ((v_firstOtherKName dtb__281) (v_handleOpKName dtb__280)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsHandle), mc2)), (B_dData_dList.C_List__x58__x58_ (mc0, (B_dData_dList.C_List__x58__x58_ (((v_handleRetExpr dtb__278) mc2), (B_dData_dList.C_List__x58__x58_ ((((v_handleOpLam (B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281))) (v_handleOpKName dtb__280)) mc2), B_dData_dList.C_List_Nil)))))), mc2))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dAst.v_nodeRefSpan mc2)) (Base_dDiagnostics_dFrontend.C_PsDiag_HandleContinuationNameMismatch ((v_handleOpKName dtb__280), dtb__282))) (B_dData_dVec.C_Vec__x58__x58_ ((v_handleOpKName dtb__280), (B_dData_dVec.C_Vec__x58__x58_ (dtb__282, B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan mc2)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2709 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindArrowTok = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__283; Frontend_dLexer.f_PTok_ptokPos = dtb__284 } -> (match dtb__283 with
  | Frontend_dLexer.C_Tok_TSym (dtb__285) -> (if (dtb__285 = "<-") then (B_dData_dMaybe.C_Maybe_Just (true)) else (if (dtb__285 = "@") then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__285 = "::") then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__285 = ",") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (false))))))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__286, dtb__287, dtb__288) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TStr (dtb__289) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TFloat (dtb__290) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TInt (dtb__291) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TIdent (dtb__292) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))

# 2723 "Vuna/Compiler/Frontend/Parser.vuna"
let v_doStmtBindsAhead = (fun (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> (((Frontend_dParser_dSupport.v_scanDoStmtLevel st) stmtCol) v_bindArrowTok))

# 2775 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_patBinderBindings = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PStr (dtb__293, dtb__294) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__295, dtb__296) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PWild (dtb__297) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb__298, dtb__299, dtb__300) -> ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinderBindings (B_dData_dPair.v_secondOf (Obj.magic f))))) dtb__299)
  | Frontend_dAst.C_Pat_PCon (dtb__301, dtb__302, dtb__303) -> ((B_dData_dList.v_concatMap v_patBinderBindings) dtb__302)
  | Frontend_dAst.C_Pat_PAs (dtb__304, dtb__305, dtb__306) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__304; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__306) }, (v_patBinderBindings dtb__305)))
  | Frontend_dAst.C_Pat_PVar (dtb__307, dtb__308) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__307; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb__308) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2789 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstRepeatedBindingGo = (fun (mc0 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (match dtb__309 with
  | { B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 } -> (if ((B_dData_dList.v_memName dtb__311) mc1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__311; B_dData_dPair.f_Pair_second = dtb__312 })) else ((v_firstRepeatedBindingGo dtb__310) (B_dData_dList.C_List__x58__x58_ (dtb__311, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2785 "Vuna/Compiler/Frontend/Parser.vuna"
let v_firstRepeatedBinding = (fun (binds : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_firstRepeatedBindingGo binds) B_dData_dList.C_List_Nil))

# 2804 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkNoRepeatedBinders = (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let nd_uscrut1 = (v_firstRepeatedBinding ((B_dData_dList.v_concatMap v_patBinderBindings) pats)) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> (match dtb__313 with
  | { B_dData_dPair.f_Pair_first = dtb__314; B_dData_dPair.f_Pair_second = dtb__315 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb__315)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_appendMessage (String.concat "" [" (repeated name: `"; dtb__314; "`)"])) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_RepeatedPatternBinder) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (pats))
  | _ -> failwith "DT: impossible branch"
)))

# 2798 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkBindersAt = (fun (st : Frontend_dParser_dSupport.t_PState) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (Frontend_dParser_dSupport.v_pmodeOf st) with
  | Frontend_dParser_dSupport.C_ParseMode_PmTool -> (Base_dDiag.C_Check_OkC (pats))
  | Frontend_dParser_dSupport.C_ParseMode_PmStrict -> (v_checkNoRepeatedBinders pats)
  | _ -> failwith "DT: impossible branch"
))

# 2923 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAsName = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__316; Frontend_dLexer.f_PTok_ptokPos = dtb__317 } -> (match dtb__316 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__318) -> (if (dtb__318 = "_") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__318; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))

# 2980 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPCon = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__319, dtb__320) -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListCons), (B_dData_dList.C_List__x58__x58_ (dtb__319, (B_dData_dList.C_List__x58__x58_ (((v_foldPCon mc0) dtb__320), B_dData_dList.C_List_Nil)))), mc0))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2995 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairPats = (fun (mc0 : Frontend_dAst.t_NodeRef) (mc1 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__321, dtb__322) -> (match dtb__322 with
  | B_dData_dList.C_List_Nil -> dtb__321
  | _ -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTuplePair), (B_dData_dList.C_List__x58__x58_ (dtb__321, (B_dData_dList.C_List__x58__x58_ (((v_foldPairPats mc0) dtb__322), B_dData_dList.C_List_Nil)))), mc0))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), B_dData_dList.C_List_Nil, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 2813 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePatternSingle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstPatKind) v_semPat) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingleBody fuel) st0) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withPatId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) p); B_dData_dPair.f_Pair_second = st1 })))))))
# 2821 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternSingleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (((v_parsePatternCons (fuel - 1)) st) blockCol)))
# 2826 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternCons = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternHead (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atSym st1) "::") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternCons (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("::", (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2835 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternHead = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__323; Frontend_dLexer.f_PTok_ptokPos = dtb__324 } -> (match dtb__323 with
  | Frontend_dLexer.C_Tok_TSym (dtb__325) -> (if (dtb__325 = "(") then (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__326) -> (match dtb__326 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__327; Frontend_dLexer.f_PTok_ptokPos = dtb__328 } -> (match dtb__327 with
  | Frontend_dLexer.C_Tok_TSym (dtb__329) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__329) then (((v_parsePatternAtom (fuel - 1)) st) blockCol) else (let nd_uscrut13 = ((Frontend_dParser_dSupport.v_peekTokAt st) 2) in (match nd_uscrut13 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__330) -> (match dtb__330 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__331; Frontend_dLexer.f_PTok_ptokPos = dtb__332 } -> (match dtb__331 with
  | Frontend_dLexer.C_Tok_TSym (dtb__333) -> (if (dtb__333 = ")") then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__329, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))
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
  | Frontend_dLexer.C_Tok_TIdent (dtb__334) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__334) then ((Frontend_dParser_dSupport.v_atSym st1) "{") else false) then ((Base_dCommon.v_step (((v_parseRecordPatternFields (fuel - 1)) st1) blockCol)) (fun (fields : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb__334, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__334) then ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__334, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else (((v_parsePatternAtom (fuel - 1)) st) blockCol))))
  | _ -> (((v_parsePatternAtom (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2858 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternFields = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseRecordPatternList (fuel - 1)) st1) blockCol)))))
# 2867 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordPatternField (fuel - 1)) st) blockCol)) (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseRecordPatternList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, rest)); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "}")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (f, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2878 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternField = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__335; Frontend_dLexer.f_PTok_ptokPos = dtb__336 } -> (match dtb__335 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__337) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "=") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st2) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__337; B_dData_dPair.f_Pair_second = pat }; B_dData_dPair.f_Pair_second = st3 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__337; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Pat_PVar (dtb__337, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__336); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__336); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__336); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__336); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__336); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__336) }))) }; B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedRecordFieldPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2890 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtoms = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternAtoms (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 2901 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_finishAsPattern (fuel - 1)) st) base) st1) blockCol)))))
# 2911 "Vuna/Compiler/Frontend/Parser.vuna"
and v_finishAsPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (base : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Frontend_dParser_dSupport.v_canContinue st1) blockCol) else false) then (let nd_uscrut5 = base in (match nd_uscrut5 with
  | Frontend_dAst.C_Pat_PVar (dtb__338, dtb__339) -> (if (dtb__338 = "_") then ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, (Frontend_dAst.C_Pat_PWild (dtb__339)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step (((v_parsePatternAtom (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rhs : Frontend_dAst.t_Pat) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb__338, rhs, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((v_parseAsName (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1))) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (name, base, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = base; B_dData_dPair.f_Pair_second = st1 })))))
# 2932 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__340; Frontend_dLexer.f_PTok_ptokPos = dtb__341 } -> (match dtb__340 with
  | Frontend_dLexer.C_Tok_TSym (dtb__342) -> (if (dtb__342 = "(") then (if ((Frontend_dParser_dSupport.v_atSym (Frontend_dParser_dSupport.v_advance st)) ")") then (let st2 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))) else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (first : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairPats (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 })))))))) else (if (dtb__342 = "[") then (((v_parseListPattern (fuel - 1)) st) blockCol) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__343, dtb__344, dtb__345) -> (match (v_textPartsOf dtb__344) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__346) -> (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = ((Frontend_dParser_dSupport.v_withLastPos dtb__345) advanced) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__346, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateInPattern)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dLexer.C_Tok_TStr (dtb__347) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb__347, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__348) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb__348, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__349) -> (if (dtb__349 = "_") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb__349) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb__349, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb__349, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2961 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) st1) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPCon (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) pats); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2970 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPatternElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListPatternElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))
# 2985 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (fuel - 1)) st) blockCol)) (fun (p : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parsePatternTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (p, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (p, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))

# 1461 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseClausePatterns = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseClausePatterns (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (pat, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))

# 1317 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseBindingItemsAt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__350; Base_dSource.f_Pos_posCol = dtb__351; Base_dSource.f_Pos_posOffset = dtb__352; Base_dSource.f_Pos_posEndOffset = dtb__353 } -> (if (dtb__351 = bindCol) then ((Base_dCommon.v_step (((v_parseBindingItem (fuel - 1)) st) bindCol)) (fun (item : t_BindingItem) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st1) bindCol)) (fun (rest : t_BindingItem B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (item, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__351 > bindCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInBinding) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1329 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItem = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstBindingKind) v_semBindingItem) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseBindingItemBody fuel) st0) bindCol)))))
# 1336 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItemBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__354; Frontend_dLexer.f_PTok_ptokPos = dtb__355 } -> (match dtb__354 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__356) -> (if (dtb__356 = "_") then (((v_parseBindingPattern fuel) st) bindCol) else (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__357) -> (match dtb__357 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__358; Frontend_dLexer.f_PTok_ptokPos = dtb__359 } -> (match dtb__358 with
  | Frontend_dLexer.C_Tok_TSym (dtb__360) -> (if (dtb__360 = ":") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance st)) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) bindCol)) (fun (ty : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st2)) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BISig (dtb__356, ty, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else (((v_parseBindingPattern fuel) st) bindCol))
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
# 1355 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingPattern = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseBindingDef (fuel - 1)) st) st1) bindCol) pat))))
# 1362 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingDef = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (bindCol : int) (pat : Frontend_dAst.t_Pat) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match pat with
  | Frontend_dAst.C_Pat_PVar (dtb__361, dtb__362) -> (if (if (Frontend_dParser_dSupport.v_startsPatternAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) bindCol) else false) then ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) bindCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "=")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) bindCol)) (fun (value : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb__361, (Frontend_dAst.v_patRef pat))); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BClauses ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = pats; Frontend_dAst.f_LocalClause_lcBody = value; Frontend_dAst.f_LocalClause_lcRef = { Frontend_dAst.f_NodeRef_nodeRefId = (stStart).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st4) }; Frontend_dAst.f_LocalClause_lcHead = (Frontend_dAst.v_patRef pat) }, B_dData_dList.C_List_Nil)))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = (stStart).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st4) } })); B_dData_dPair.f_Pair_second = st4 })))))))))) else ((Base_dCommon.v_step ((((((v_parseBindingValue (fuel - 1)) stStart) st) (stStart).Frontend_dParser_dSupport.f_PState_openNodeId) pat) bindCol)) (fun (b : Frontend_dAst.t_Binding) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 })))))
  | _ -> ((Base_dCommon.v_step ((((((v_parseBindingValue (fuel - 1)) stStart) st) (stStart).Frontend_dParser_dSupport.f_PState_openNodeId) pat) bindCol)) (fun (b : Frontend_dAst.t_Binding) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (b)); B_dData_dPair.f_Pair_second = st2 }))))
)))
# 1371 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingValue = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (nid : int) (pat : Frontend_dAst.t_Pat) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "=")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = pat; Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (value)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st2) } }; B_dData_dPair.f_Pair_second = st2 }))))))))))
# 1838 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((((v_parseExprBody fuel) (st0).Frontend_dParser_dSupport.f_PState_openNodeId) st0) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExprId (st0).Frontend_dParser_dSupport.f_PState_openNodeId) e); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_rekeyInfix (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef e))) (st0).Frontend_dParser_dSupport.f_PState_openNodeId) st1) })))))))
# 1846 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExprBody = (fun (fuel : int) (nid : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (((v_parseLhs (fuel - 1)) st) blockCol)) (fun (lhs : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (fuel - 1)) nid) st1) blockCol) lhs))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExprNotIndented)))))
# 1862 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseInfix = (fun (fuel : int) (nid : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (lhs : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut5 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__363; Frontend_dLexer.f_PTok_ptokPos = dtb__364 } -> (match dtb__363 with
  | Frontend_dLexer.C_Tok_TSym (dtb__365) -> (if (dtb__365 = "`") then (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectValueName (Frontend_dParser_dSupport.v_advance st))) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "`")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (fuel - 1)) nid) ((Frontend_dParser_dSupport.v_addBacktickShape nid) st3)) blockCol) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (name, (Frontend_dAst.v_detachedNodeRef (Frontend_dParser_dSupport.v_tokenSpan (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))) else (if (if ((Frontend_dParser_dSupport.v_canContinue st) blockCol) then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isSyntaxSym dtb__365)) else false) then (if (Frontend_dParser_dSupport.v_closeParenNext st) then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (let sp = ((Frontend_dParser_dSupport.v_spanOf st0) (Frontend_dParser_dSupport.v_advance st0)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_sectionRightExpr dtb__365) lhs) { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = sp }); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset sp)) (Frontend_dCst.C_SectionShape_SectionRight (dtb__365))) (Frontend_dParser_dSupport.v_advance st0)) }))))) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (fuel - 1)) nid) st2) blockCol) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__365, (Frontend_dAst.v_detachedNodeRef (Frontend_dParser_dSupport.v_tokenSpan st)))), (B_dData_dList.C_List__x58__x58_ (lhs, (B_dData_dList.C_List__x58__x58_ (rhs, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = lhs; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))
# 1889 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLhs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__366; Frontend_dLexer.f_PTok_ptokPos = dtb__367 } -> (match dtb__366 with
  | Frontend_dLexer.C_Tok_TSym (dtb__368) -> (if (dtb__368 = "\\") then (((v_parseLambda (fuel - 1)) st) blockCol) else (if (dtb__368 = "-") then (((v_parseNegation (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))
  | Frontend_dLexer.C_Tok_TKw (dtb__369) -> (if (dtb__369 = "let") then (((v_parseLet (fuel - 1)) st) blockCol) else (if (dtb__369 = "case") then (((v_parseCase (fuel - 1)) st) blockCol) else (if (dtb__369 = "if") then (((v_parseIf (fuel - 1)) st) blockCol) else (if (dtb__369 = "do") then (((v_parseDo (fuel - 1)) st) blockCol) else (if (dtb__369 = "perform") then (((v_parsePerform (fuel - 1)) st) blockCol) else (if (dtb__369 = "handle") then (((v_parseHandle (fuel - 1)) st) blockCol) else (((v_parseApplication (fuel - 1)) st) blockCol)))))))
  | _ -> (((v_parseApplication (fuel - 1)) st) blockCol)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1907 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseNegation = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__370) -> (match dtb__370 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__371; Frontend_dLexer.f_PTok_ptokPos = dtb__372 } -> (match dtb__371 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__373) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (("-" ^ dtb__373), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__374) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt ((0 - dtb__374), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))), (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 }))))
))))
# 1917 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseApplication = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st2) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAppAt), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (payload, args)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))); B_dData_dPair.f_Pair_second = st3 })))))) else ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (let app = (Frontend_dAst.C_Expr_EApp (first, args, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))) in (if ((Frontend_dParser_dSupport.v_atSym st2) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (payload : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsRowAt), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))), (B_dData_dList.C_List__x58__x58_ (app, (B_dData_dList.C_List__x58__x58_ (payload, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3)))); B_dData_dPair.f_Pair_second = st3 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = app; B_dData_dPair.f_Pair_second = st2 }))))
))))))))
# 1941 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtPayload = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (if ((Frontend_dParser_dSupport.v_atSym st) "(") then e else (v_rowAtNameExpr e)); B_dData_dPair.f_Pair_second = st1 }))))))
# 1964 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseArgs = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsAtom st) then ((Frontend_dParser_dSupport.v_canContinue st) blockCol) else false) then ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st) blockCol)) (fun (arg : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (fuel - 1)) st1) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (arg, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))))
# 1975 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtomBase (fuel - 1)) st) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol) base)))))
# 2013 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseMacroAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstMacroKind) v_semMacroAtom) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance st0)) "!")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs fuel) st1) blockCol)) (fun (args : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((v_macroAtom name) args) ((Frontend_dParser_dSupport.v_spanOf st) st2)) ((Frontend_dParser_dSupport.v_spanOf st) st1)); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2021 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtomBase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__375; Frontend_dLexer.f_PTok_ptokPos = dtb__376 } -> (match dtb__375 with
  | Frontend_dLexer.C_Tok_TSym (dtb__377) -> (if (dtb__377 = "(") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> (if (Frontend_dParser_dSupport.v_piArrowAhead (Frontend_dParser_dSupport.v_advance st)) then ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__378)) (B_dData_dPair.v_secondOf dtb__378)) false) "(") ")") else (((v_parseParenAtom (fuel - 1)) st) blockCol))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dParser_dSupport.v_sectionOpAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseSectionAtom (fuel - 1)) st0) blockCol) dtb__379)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_parseParenAtom (fuel - 1)) st) blockCol)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__377 = "[") then (((v_parseListExpr (fuel - 1)) st) blockCol) else (if (dtb__377 = "?") then (match (Frontend_dParser_dSupport.v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__380) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((B_dData_dPair.v_firstOf dtb__380), (Frontend_dAst.v_detachedNodeRef (B_dData_dPair.v_secondOf dtb__380)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__377 = "{") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__381) -> ((((((((v_parsePiBinder (fuel - 1)) st) blockCol) (B_dData_dPair.v_firstOf dtb__381)) (B_dData_dPair.v_secondOf dtb__381)) true) "{") "}")
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "{")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (base : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "|")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st3) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (base, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))
  | _ -> failwith "DT: impossible branch"
) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__382) -> (if (dtb__382 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__383, dtb__384, dtb__385) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseTemplateAtom (fuel - 1)) st0) dtb__383) dtb__384) dtb__385)))
  | Frontend_dLexer.C_Tok_TStr (dtb__386) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb__386, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TFloat (dtb__387) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb__387, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TInt (dtb__388) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb__388, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb__389) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) "{") then (if (Frontend_dParser_dSupport.v_recordUpdateAhead st1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__389, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "{")) (fun (st1b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (fuel - 1)) st1b) blockCol)) (fun (fields : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb__389, fields, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))))) else (if (((v_macroBangAt st1) dtb__376) dtb__389) then ((((v_parseMacroAtom (fuel - 1)) st) blockCol) dtb__389) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__389, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st1)))); B_dData_dPair.f_Pair_second = st1 })))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2062 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (multi : bool) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((((v_parseTemplateParts (fuel - 1)) st) (Frontend_dParser_dSupport.v_tokSpan st)) parts)) (fun (parsed : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let ps = (B_dData_dPair.v_firstOf parsed) in (let holes = (B_dData_dPair.v_secondOf parsed) in (let advanced = (Frontend_dParser_dSupport.v_advance st) in (let st2 = (((Frontend_dParser_dSupport.v_addInterpMulti (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_peekPos st))) multi) (((Frontend_dParser_dSupport.v_addTemplateHoles (st).Frontend_dParser_dSupport.f_PState_openNodeId) holes) ((Frontend_dParser_dSupport.v_withLastPos endP) advanced))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (ps, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st2) })); B_dData_dPair.f_Pair_second = st2 }))))))))))
# 2078 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateParts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fallback : Base_dSource.t_Span) (parts : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut4 = parts in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__390, dtb__391) -> (match dtb__390 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb__392) -> ((Base_dCommon.v_bind ((((v_parseTemplateHole (v_toksFuel dtb__392)) st) fallback) dtb__392)) (fun (hole : (Frontend_dAst.t_Expr, Frontend_dCst.t_CstNode) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_parseTemplateParts (fuel - 1)) st) fallback) dtb__391)) (fun (tail : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole ((B_dData_dPair.v_firstOf hole))), (B_dData_dPair.v_firstOf tail))); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf hole), (B_dData_dPair.v_secondOf tail))) }))))))
  | Frontend_dLexer.C_TmplPart_TPText (dtb__393) -> ((Base_dCommon.v_bind ((((v_parseTemplateParts (fuel - 1)) st) fallback) dtb__391)) (fun (tail : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb__393)), (B_dData_dPair.v_firstOf tail))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf tail) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))))
# 2091 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateHole = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fallback : Base_dSource.t_Span) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match toks with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At fallback) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateHoleEmpty)
  | B_dData_dList.C_List__x58__x58_ (dtb__394, dtb__395) -> (let pos = (dtb__394).Frontend_dLexer.f_PTok_ptokPos in (let file = (Frontend_dParser_dSupport.v_fileOf st) in (let subState = (((((((Frontend_dParser_dSupport.v_mkStateAt file) (st).Frontend_dParser_dSupport.f_PState_sourceOf) toks) pos) (B_dData_dList.v_length toks)) (Frontend_dParser_dSupport.v_pmodeOf st)) (Frontend_dParser_dSupport.v_eventMode st)) in (let nd_uscrut10 = (((v_parseExpr (fuel - 1)) subState) 0) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__396) -> (match dtb__396 with
  | { B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = dtb__398 } -> (if (Frontend_dParser_dSupport.v_isEof dtb__398) then (let events = (Frontend_dParser_dSupport.v_eventsOf dtb__398) in (let tree = (((((((Frontend_dCst.v_nestToTreeWithSurface (((Frontend_dCst.v_lexTokensOfFrom (st).Frontend_dParser_dSupport.f_PState_sourceOf) pos) toks)) events) ((Frontend_dCst.v_parenEntriesOf toks) events)) (dtb__398).Frontend_dParser_dSupport.f_PState_backtickShapes) (dtb__398).Frontend_dParser_dSupport.f_PState_sectionShapes) (dtb__398).Frontend_dParser_dSupport.f_PState_interpMultis) (dtb__398).Frontend_dParser_dSupport.f_PState_templateHoles) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__397; B_dData_dPair.f_Pair_second = (Frontend_dCst.v_holeRootOf tree) })))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (((v_holeSpan file) pos))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__399) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan ((v_holeSpan file) pos)) dtb__399)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
# 2132 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ")") then (let st2 = (Frontend_dParser_dSupport.v_advance st1) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (first : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ",") then ((Base_dCommon.v_step ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairExprs (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st3))) elems); B_dData_dPair.f_Pair_second = st3 })))) else (if ((Frontend_dParser_dSupport.v_atSym st2) ":") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st2)) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAscribe), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))), (B_dData_dList.C_List__x58__x58_ (first, (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ")")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = first; B_dData_dPair.f_Pair_second = st3 })))))))))))))
# 2148 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenTupleRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseParenTupleRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol) (B_dData_dList.C_List__x58__x58_ (e, acc))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ")")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2167 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseSectionAtom = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (op : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) op)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st2) ")") then (let sp = ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st2)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (op, { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = sp })); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset sp)) (Frontend_dCst.C_SectionShape_SectionOp (op))) (Frontend_dParser_dSupport.v_advance st2)) }))) else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (rhs : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ")")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (let sp = ((Frontend_dParser_dSupport.v_spanOf st) st4) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_sectionLeftExpr op) rhs) { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = sp }); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset sp)) (Frontend_dCst.C_SectionShape_SectionLeft (op))) st4) }))))))))))))))
# 2212 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePiBinder = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (qty : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (names : string B_dData_dList.t_List) (implicit : bool) (openSym : string) (closeSym : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (v_anyDottedName names) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_PiBinderNameNotSimple) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) openSym)) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_consumeQty st1) qty)) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st2)) (fun (names2 : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (dom : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st5) closeSym)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st6) "->")) (fun (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st7) blockCol)) (fun (cod : Frontend_dAst.t_Expr) (st8 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((v_foldPiNames names2) implicit) qty) dom) cod) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st8))); B_dData_dPair.f_Pair_second = st8 })))))))))))))))))))))
# 2262 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignments = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) st) blockCol)) (fun (fs : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = fs; B_dData_dPair.f_Pair_second = st1 })))))))
# 2273 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (fname : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (value : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st3) ",") then ((Base_dCommon.v_step (((v_parseRecordAssignList (fuel - 1)) (Frontend_dParser_dSupport.v_advance st3)) blockCol)) (fun (rest : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, rest)); B_dData_dPair.f_Pair_second = st4 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "}")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = fname; B_dData_dPair.f_Pair_second = value }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = st4 })))))))))))))
# 2282 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "[")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st1))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) st1) blockCol)) (fun (elems : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldCons (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2))) elems); B_dData_dPair.f_Pair_second = st2 })))))))))
# 2291 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExprElems = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st) blockCol)) (fun (e0 : Frontend_dAst.t_Expr) (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseListElemAt (fuel - 1)) e0) st0)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((Base_dCommon.v_step (((v_parseListExprElems (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (rest : Frontend_dAst.t_Expr B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, rest)); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (e, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st1) })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))))
# 2302 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListElemAt = (fun (fuel : int) (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "@") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "@")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAtom (fuel - 1)) st1) 0)) (fun (nm : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsRowAt), (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr e) st2)))), (B_dData_dList.C_List__x58__x58_ (e, (B_dData_dList.C_List__x58__x58_ ((v_rowAtNameExpr nm), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr e) st2)))); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = e; B_dData_dPair.f_Pair_second = st })))))
# 2318 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLambda = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "\\")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseLambdaParam st1)) (fun (first : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLambdaParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2) (B_dData_dList.C_List__x58__x58_ (first, B_dData_dList.C_List_Nil)))) (fun (params : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) "=>")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st4) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (params, body, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st5)))); B_dData_dPair.f_Pair_second = st5 }))))))))))))))
# 2343 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLet = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "let")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLetBindings (fuel - 1)) st1) blockCol)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "in")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (binds, body, false, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2354 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLetBindings = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (if ((Frontend_dParser_dSupport.v_atKw st) "in") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__400; Base_dSource.f_Pos_posCol = dtb__401; Base_dSource.f_Pos_posOffset = dtb__402; Base_dSource.f_Pos_posEndOffset = dtb__403 } -> (if (dtb__401 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_LetBindingNotIndented) else ((Base_dCommon.v_step (((v_parseBindingItemsAt (fuel - 1)) st) dtb__401)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 2366 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCase = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "case")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (scrut : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "of")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCaseAlts (fuel - 1)) st3) blockCol)) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (scrut, alts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4)))); B_dData_dPair.f_Pair_second = st4 }))))))))))))
# 2375 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCaseAlts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__404; Base_dSource.f_Pos_posCol = dtb__405; Base_dSource.f_Pos_posOffset = dtb__406; Base_dSource.f_Pos_posEndOffset = dtb__407 } -> (if (dtb__405 <= blockCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_CaseAltNotIndented) else ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st) dtb__405)) (fun (alts : Frontend_dAst.t_Alt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_badCaseIndent st2) dtb__405) then ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentAfterCaseAlt) else (match alts with
  | B_dData_dList.C_List_Nil -> (Obj.magic ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = alts; B_dData_dPair.f_Pair_second = st2 }))
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2397 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__408; Base_dSource.f_Pos_posCol = dtb__409; Base_dSource.f_Pos_posOffset = dtb__410; Base_dSource.f_Pos_posEndOffset = dtb__411 } -> (if (dtb__409 = altCol) then ((Base_dCommon.v_step (((v_parseAlt (fuel - 1)) st) altCol)) (fun (alt : Frontend_dAst.t_Alt) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltList (fuel - 1)) st1) altCol)) (fun (rest : Frontend_dAst.t_Alt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (alt, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
))))
# 2408 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAlt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semAlt) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltBody fuel) st0) altCol)) (fun (alt : Frontend_dAst.t_Alt) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = (alt).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = (alt).Frontend_dAst.f_Alt_altBody; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) } }; B_dData_dPair.f_Pair_second = st1 })))))))
# 2416 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (altCol : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) altCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) altCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = body; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (st).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3 })))))))))))
# 2429 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePerform = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "perform")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseApplication (fuel - 1)) st1) blockCol)) (fun (operand : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsPerform), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))), (B_dData_dList.C_List__x58__x58_ (operand, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2458 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandle = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "handle")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleComp (fuel - 1)) st1) blockCol)) (fun (comp : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "{")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleBody (fuel - 1)) st3) blockCol)) (fun (blk : t_HandleBlock) (st4 : Frontend_dParser_dSupport.t_PState) -> (match (((v_handleExpr comp) blk) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))) with
  | Base_dDiag.C_Check_ErrC (dtb__412) -> (Obj.magic (Base_dDiag.C_Check_ErrC (dtb__412)))
  | Base_dDiag.C_Check_OkC (dtb__413) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__413; B_dData_dPair.f_Pair_second = st4 }))
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 2480 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleComp = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__414; Frontend_dLexer.f_PTok_ptokPos = dtb__415 } -> (match dtb__414 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__416) -> (let nd_uscrut7 = ((Frontend_dParser_dSupport.v_peekTokAt st) 1) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__417) -> (match dtb__417 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__418; Frontend_dLexer.f_PTok_ptokPos = dtb__419 } -> (match dtb__418 with
  | Frontend_dLexer.C_Tok_TSym (dtb__420) -> (if (dtb__420 = "{") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb__416, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) (Frontend_dParser_dSupport.v_advance st))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else (((v_parseExpr (fuel - 1)) st) blockCol))
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
# 2493 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (handleCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__421; Base_dSource.f_Pos_posCol = dtb__422; Base_dSource.f_Pos_posOffset = dtb__423; Base_dSource.f_Pos_posEndOffset = dtb__424 } -> (if (dtb__422 <= handleCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNotIndented) else ((Base_dCommon.v_step (((((v_parseHandleClauses (fuel - 1)) st) dtb__422) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dList.C_List_Nil)) (fun (p : ((string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe, t_HandleOp B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__425; B_dData_dPair.f_Pair_second = dtb__426 } -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "}")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleBlock_HandleBlock (dtb__425, dtb__426)); B_dData_dPair.f_Pair_second = st3 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 2519 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleClauses = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (retOpt : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (acc : t_HandleOp B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_atSym st) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = retOpt; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__427; Base_dSource.f_Pos_posCol = dtb__428; Base_dSource.f_Pos_posOffset = dtb__429; Base_dSource.f_Pos_posEndOffset = dtb__430 } -> (if (dtb__428 = clauseCol) then (if (v_isReturnClauseHead st) then (match retOpt with
  | B_dData_dMaybe.C_Maybe_Just (dtb__431) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match acc with
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_step (((v_parseHandleRetClause (fuel - 1)) st) clauseCol)) (fun (p : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut13 = p in (match nd_uscrut13 with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (match dtb__435 with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> (((((v_parseHandleClauses (fuel - 1)) st2) clauseCol) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } }))) acc)
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
# 2549 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleRetClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semHandleRet) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st0)) (fun (_ukw : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (x : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) "->")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = x; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = body; B_dData_dPair.f_Pair_second = { Frontend_dAst.f_NodeRef_nodeRefId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st0) st4) } } }; B_dData_dPair.f_Pair_second = st4 }))))))))))))))
# 2561 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClause = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semHandleOp) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseHandleOpClauseBody fuel) st0) clauseCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId)))))
# 2573 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClauseBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) clauseCol)) (fun (pat : Frontend_dAst.t_Pat) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (pat, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match pat with
  | Frontend_dAst.C_Pat_PCon (dtb__438, dtb__439, dtb__440) -> (match (B_dData_dList.v_reverse dtb__439) with
  | B_dData_dList.C_List_Nil -> (Obj.magic ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__440)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor))
  | B_dData_dList.C_List__x58__x58_ (dtb__441, dtb__442) -> (match dtb__441 with
  | Frontend_dAst.C_Pat_PVar (dtb__443, dtb__444) -> (((((((((v_handleOpTail (fuel - 1)) st) st1) clauseCol) dtb__438) (B_dData_dList.v_reverse dtb__442)) dtb__440) nid) dtb__443)
  | Frontend_dAst.C_Pat_PWild (dtb__445) -> (((((((((v_handleOpTail (fuel - 1)) st) st1) clauseCol) dtb__438) (B_dData_dList.v_reverse dtb__442)) dtb__440) nid) "_")
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb__440)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)))))))
# 2596 "Vuna/Compiler/Frontend/Parser.vuna"
and v_handleOpTail = (fun (fuel : int) (stStart : Frontend_dParser_dSupport.t_PState) (st : Frontend_dParser_dSupport.t_PState) (clauseCol : int) (cname : string) (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (psp : Frontend_dAst.t_NodeRef) (nid : int) (kname : string) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "->")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) clauseCol)) (fun (body : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleOp_HandleOp (cname, pats, psp, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf stStart) st2) }, kname, body)); B_dData_dPair.f_Pair_second = st2 }))))))))
# 2648 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseIf = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "if")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) blockCol)) (fun (cond : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "then")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st3) blockCol)) (fun (yes : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st4) "else")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st5) blockCol)) (fun (no : Frontend_dAst.t_Expr) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (cond, yes, no, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st6)))); B_dData_dPair.f_Pair_second = st6 }))))))))))))))))
# 2659 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDo = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "do")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st1) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement) else (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__446; Base_dSource.f_Pos_posCol = dtb__447; Base_dSource.f_Pos_posOffset = dtb__448; Base_dSource.f_Pos_posEndOffset = dtb__449 } -> (if (dtb__447 <= blockCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_DoStatementNotIndented) else ((Base_dCommon.v_step ((((v_parseDoStmts (fuel - 1)) st1) dtb__447) B_dData_dList.C_List_Nil)) (fun (stmts : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut10 = (B_dData_dList.v_reverse stmts) in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> (match dtb__450 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__452, dtb__453) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (stmts, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st2)))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)
  | _ -> ((v_ps0 st2) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 2682 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmts = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (acc : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__454; Base_dSource.f_Pos_posCol = dtb__455; Base_dSource.f_Pos_posOffset = dtb__456; Base_dSource.f_Pos_posEndOffset = dtb__457 } -> (if (dtb__455 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = st })) else (if (dtb__455 > stmtCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((Base_dCommon.v_step (((v_parseDoStmt (fuel - 1)) st) stmtCol)) (fun (stmt : Frontend_dAst.t_DoStmt) (st1 : Frontend_dParser_dSupport.t_PState) -> (match (Frontend_dParser_dSupport.v_peekPos st1) with
  | { Base_dSource.f_Pos_posLine = dtb__458; Base_dSource.f_Pos_posCol = dtb__459; Base_dSource.f_Pos_posOffset = dtb__460; Base_dSource.f_Pos_posEndOffset = dtb__461 } -> (if (Frontend_dParser_dSupport.v_isEof st1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__459 < stmtCol) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (stmt, acc))); B_dData_dPair.f_Pair_second = st1 })) else (if (dtb__459 > stmtCol) then ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((((v_parseDoStmts (fuel - 1)) st1) stmtCol) (B_dData_dList.C_List__x58__x58_ (stmt, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2703 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDoStmtKind) v_semDoStmt) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseDoStmtBody fuel) st0) stmtCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))
# 2726 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmtBody = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw st) "let") then ((((v_doLetOrExpr fuel) st) stmtCol) nid) else (let nd_uscrut4 = (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel st)) st) stmtCol) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_ErrC (dtb__462) -> (if ((v_doStmtBindsAhead st) stmtCol) then (Base_dDiag.C_Check_ErrC (dtb__462)) else ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid))
  | Base_dDiag.C_Check_OkC (dtb__463) -> (match dtb__463 with
  | { B_dData_dPair.f_Pair_first = dtb__464; B_dData_dPair.f_Pair_second = dtb__465 } -> (if ((Frontend_dParser_dSupport.v_atSym dtb__465) "<-") then ((Base_dCommon.v_bind ((v_checkBindersAt st) (B_dData_dList.C_List__x58__x58_ (dtb__464, B_dData_dList.C_List_Nil)))) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb__465) "<-")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb__464, e, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) })); B_dData_dPair.f_Pair_second = st3 })))))))) else ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 2744 "Vuna/Compiler/Frontend/Parser.vuna"
and v_doLetOrExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (match ((Frontend_dParser_dSupport.v_expectKw st) "let") with
  | Base_dDiag.C_Check_ErrC (dtb__466) -> (Base_dDiag.C_Check_ErrC (dtb__466))
  | Base_dDiag.C_Check_OkC (dtb__467) -> (let nd_uscrut6 = (((v_parseLetBindings (fuel - 1)) dtb__467) stmtCol) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__468) -> (match dtb__468 with
  | { B_dData_dPair.f_Pair_first = dtb__469; B_dData_dPair.f_Pair_second = dtb__470 } -> (if ((Frontend_dParser_dSupport.v_atKw dtb__470) "in") then ((((v_parseDoExprStmt (fuel - 1)) st) stmtCol) nid) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb__469, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) dtb__470) })); B_dData_dPair.f_Pair_second = dtb__470 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__471) -> (Base_dDiag.C_Check_ErrC (dtb__471))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 2756 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoExprStmt = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (stmtCol : int) (nid : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_sameLineState st)) stmtCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (e, { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st1) })); B_dData_dPair.f_Pair_second = st1 }))))))

# 120 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExpressionSource = (fun (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel (((((Frontend_dParser_dSupport.v_mkState "<expr>") source) toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict) Frontend_dParser_dSupport.C_EventMode_EvNone))) (((((Frontend_dParser_dSupport.v_mkState "<expr>") source) toks) Frontend_dParser_dSupport.C_ParseMode_PmStrict) Frontend_dParser_dSupport.C_EventMode_EvNone)) 0)) (fun (e : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC (e)) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr)))))))

# 1073 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitSupersRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ",")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st1) 0)) (fun (e : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st2) (B_dData_dList.C_List__x58__x58_ (e, acc))))))))))

# 1064 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitSupers = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) 0)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (fuel - 1)) st1) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil)))))))

# 1216 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiom = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "axiom")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st4)) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (name, ty, (((v_declRefAt st) ds) st5))); B_dData_dPair.f_Pair_second = st5 })))))))))))))

# 852 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiomExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseAxiom st) blockCol) ds)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DAxiom (dtb__472, dtb__473, dtb__474) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__472, (Frontend_dAst.v_nodeRefSpan dtb__474))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseAxiomExport: not an axiom")
)))))

# 1224 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExtern = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "extern")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut6 = (Frontend_dParser_dSupport.v_peekTok st2) in (match nd_uscrut6 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__475; Frontend_dLexer.f_PTok_ptokPos = dtb__476 } -> (match dtb__475 with
  | Frontend_dLexer.C_Tok_TStr (dtb__477) -> ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__477; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st2) }))) (fun (cName2 : string) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st5)) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (name, cName2, ty, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))))))))))
  | _ -> (((v_ps1 st2) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("string"))) "string")
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 864 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExternExport = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseExtern st) blockCol) ds)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (match decl with
  | Frontend_dAst.C_Decl_DExtern (dtb__478, dtb__479, dtb__480, dtb__481) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__478, (Frontend_dAst.v_nodeRefSpan dtb__481))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> (Base_dDiag.v_icInternal "parseExternExport: not an extern")
)))))

# 1304 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhereBindings = (fun (st : Frontend_dParser_dSupport.t_PState) (whereCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__482; Base_dSource.f_Pos_posCol = dtb__483; Base_dSource.f_Pos_posOffset = dtb__484; Base_dSource.f_Pos_posEndOffset = dtb__485 } -> (if (dtb__483 > whereCol) then ((Base_dCommon.v_step (((v_parseBindingItemsAt (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__483)) (fun (items : t_BindingItem B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds items)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st1 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1292 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhere = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__486; Frontend_dLexer.f_PTok_ptokPos = dtb__487 } -> (match dtb__486 with
  | Frontend_dLexer.C_Tok_TKw (dtb__488) -> (if (dtb__488 = "where") then (if ((Base_dSource.v_posCol dtb__487) > blockCol) then ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance st) }))) (fun (_u : int) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhereBindings st1) blockCol)) (fun (binds : Frontend_dAst.t_Binding B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = binds; B_dData_dPair.f_Pair_second = st2 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1258 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseClause = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (name : string) (ds : t_DeclStart) -> ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel st)) st) blockCol)) (fun (pats : Frontend_dAst.t_Pat B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt st) pats)) (fun (_u : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) blockCol)) (fun (body : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhere st3) blockCol)) (fun (wheres : Frontend_dAst.t_Binding B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (let body2 = (match wheres with
  | B_dData_dList.C_List_Nil -> body
  | B_dData_dList.C_List__x58__x58_ (dtb__489, dtb__490) -> (Frontend_dAst.C_Expr_ELet (wheres, body, true, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf st) st4))))
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (name, pats, body2, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 }))))))))))))))

# 1586 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFieldBody = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) (nid : int) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) fieldCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = name; Frontend_dAst.f_Field_fieldType = ty; Frontend_dAst.f_Field_fieldRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1582 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseField = (fun (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFieldKind) v_semField) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseFieldBody st0) fieldCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1571 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (fieldCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__491; Base_dSource.f_Pos_posCol = dtb__492; Base_dSource.f_Pos_posOffset = dtb__493; Base_dSource.f_Pos_posEndOffset = dtb__494 } -> (if (dtb__492 = fieldCol) then ((Base_dCommon.v_step ((v_parseField st) fieldCol)) (fun (fld : Frontend_dAst.t_Field) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseFieldList (fuel - 1)) st1) fieldCol)) (fun (rest : Frontend_dAst.t_Field B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (fld, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__492 > fieldCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInRecord) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1563 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFields = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__495; Base_dSource.f_Pos_posCol = dtb__496; Base_dSource.f_Pos_posOffset = dtb__497; Base_dSource.f_Pos_posEndOffset = dtb__498 } -> (if (dtb__496 > blockCol) then (((v_parseFieldList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__496) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 981 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecordExport = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3b) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__499; B_dData_dPair.f_Pair_second = dtb__500 } -> (let decl = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__499, dtb__500, tier, lin, (((v_declRefAt st) ds) st6))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st6 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 935 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredExport = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__501; Frontend_dLexer.f_PTok_ptokPos = dtb__502 } -> (match dtb__501 with
  | Frontend_dLexer.C_Tok_TKw (dtb__503) -> (if (dtb__503 = "linear") then (let nd_uscrut8 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) in (match nd_uscrut8 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__504; Frontend_dLexer.f_PTok_ptokPos = dtb__505 } -> (match dtb__504 with
  | Frontend_dLexer.C_Tok_TKw (dtb__506) -> (if (dtb__506 = "record") then (((((v_parseRecordExport true) tier) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st))) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__503 = "record") then (((((v_parseRecordExport false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1540 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecord = (fun (lin : bool) (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "record")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields st4) blockCol)) (fun (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st5)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st6 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__507; B_dData_dPair.f_Pair_second = dtb__508 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (name, params, fields, dtb__507, dtb__508, tier, lin, (((v_declRefAt st) ds) st6))); B_dData_dPair.f_Pair_second = st6 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 1497 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredDecl = (fun (tier : Frontend_dAst.t_ReprTier) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance st)) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__509; Frontend_dLexer.f_PTok_ptokPos = dtb__510 } -> (match dtb__509 with
  | Frontend_dLexer.C_Tok_TKw (dtb__511) -> (if (dtb__511 = "linear") then (let st1 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance st)) in (let nd_uscrut9 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut9 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__512; Frontend_dLexer.f_PTok_ptokPos = dtb__513 } -> (match dtb__512 with
  | Frontend_dLexer.C_Tok_TKw (dtb__514) -> (if (dtb__514 = "record") then (((((v_parseRecord true) tier) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
))) else (if (dtb__511 = "record") then (((((v_parseRecord false) tier) (Frontend_dParser_dSupport.v_advance st)) blockCol) ds) else (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1648 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitParams = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__515; Frontend_dLexer.f_PTok_ptokPos = dtb__516 } -> (match dtb__515 with
  | Frontend_dLexer.C_Tok_TSym (dtb__517) -> (if (dtb__517 = "(") then (if (v_parenIsMemberList st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) "(")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (fuel - 1)) st1)) (fun (names : string B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st2) ":")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st3)) st3) 0)) (fun (kind : Frontend_dAst.t_Expr) (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st4) ")")) (fun (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) st5)) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st6 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_TraitParam_traitParamName = n; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (kind)) })) names)) rest); B_dData_dPair.f_Pair_second = st6 }))))))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__518) -> ((Base_dCommon.v_step ((v_parseTraitParams (fuel - 1)) (Frontend_dParser_dSupport.v_advance st))) (fun (rest : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitParam_traitParamName = dtb__518; Frontend_dAst.f_TraitParam_traitParamKind = B_dData_dMaybe.C_Maybe_Nothing }, rest)); B_dData_dPair.f_Pair_second = st1 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1038 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitHead = (fun (st : Frontend_dParser_dSupport.t_PState) -> (if (v_traitSupersFollow st) then ((Base_dCommon.v_bind ((v_parseTraitSupers (Frontend_dParser_dSupport.v_stateFuel st)) st)) (fun (p : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair) -> (let supers = (B_dData_dPair.v_firstOf p) in (let st1 = (B_dData_dPair.v_secondOf p) in ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = supers }; B_dData_dPair.f_Pair_second = st3 })))))))))) else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (params : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = name; f_TraitHead_traitHeadParams = params; f_TraitHead_traitHeadSupers = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }))))))))

# 1681 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigBody = (fun (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) (nid : int) -> ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) methodCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = name; Frontend_dAst.f_TraitMethod_traitMethodType = ty; Frontend_dAst.f_TraitMethod_traitMethodRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1677 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSig = (fun (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstMethodKind) v_semMethod) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseMethodSigBody st0) methodCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1666 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMethodSigList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (methodCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__519; Base_dSource.f_Pos_posCol = dtb__520; Base_dSource.f_Pos_posOffset = dtb__521; Base_dSource.f_Pos_posEndOffset = dtb__522 } -> (if (dtb__520 = methodCol) then ((Base_dCommon.v_step ((v_parseMethodSig st) methodCol)) (fun (m : Frontend_dAst.t_TraitMethod) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseMethodSigList (fuel - 1)) st1) methodCol)) (fun (rest : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (m, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__520 > methodCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInTrait) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1658 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigs = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__523; Base_dSource.f_Pos_posCol = dtb__524; Base_dSource.f_Pos_posOffset = dtb__525; Base_dSource.f_Pos_posEndOffset = dtb__526 } -> (if (dtb__524 > blockCol) then (((v_parseMethodSigList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__524) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1010 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitExportMembers st2)) (fun (members : Frontend_dAst.t_ExportMembers) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st3) "where")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st4) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st5 : Frontend_dParser_dSupport.t_PState) -> (let decl = (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, (((v_declRefAt st) ds) st5))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType ((h).f_TraitHead_traitHeadName, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st5 }))))))))))))))

# 1629 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTrait = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "trait")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead st1)) (fun (h : t_TraitHead) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs st3) blockCol)) (fun (methods : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (let decl = (Frontend_dAst.C_Decl_DTrait ((h).f_TraitHead_traitHeadName, (h).f_TraitHead_traitHeadParams, (h).f_TraitHead_traitHeadSupers, methods, (((v_declRefAt st) ds) st4))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = decl; B_dData_dPair.f_Pair_second = st4 }))))))))))))

# 1733 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtxRest = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (acc : Frontend_dAst.t_Expr B_dData_dList.t_List) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym st) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st1 })))) else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e, acc))) blockCol) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) "=>")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) st2) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (e, acc))); B_dData_dPair.f_Pair_second = hd }; B_dData_dPair.f_Pair_second = st3 }))))))))))))

# 1707 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtxThenExpr = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr fuel) st) blockCol)) (fun (e1 : Frontend_dAst.t_Expr) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) "=>") then ((Base_dCommon.v_step (((v_parseExpr (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) blockCol)) (fun (hd : Frontend_dAst.t_Expr) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctxThenSplit e1) hd); B_dData_dPair.f_Pair_second = st2 })))) else (if ((Frontend_dParser_dSupport.v_atSym st1) ",") then ((((v_parseCtxRest (fuel - 1)) (Frontend_dParser_dSupport.v_advance st1)) (B_dData_dList.C_List__x58__x58_ (e1, B_dData_dList.C_List_Nil))) blockCol) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = e1 }; B_dData_dPair.f_Pair_second = st1 }))))))))

# 1244 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSignature = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (allowCtx : bool) (name : string) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st) ":")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__527; B_dData_dPair.f_Pair_second = dtb__528 } -> (match dtb__527 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, B_dData_dList.C_List_Nil, dtb__528, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 }))
  | _ -> (if allowCtx then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (name, dtb__527, dtb__528, (((v_declRefAt st) ds) st2))); B_dData_dPair.f_Pair_second = st2 })) else ((v_ps0 st1) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere))
)
  | _ -> failwith "DT: impossible branch"
))))))

# 824 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedValue = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__529; Frontend_dLexer.f_PTok_ptokPos = dtb__530 } -> (match dtb__529 with
  | Frontend_dLexer.C_Tok_TSym (dtb__531) -> (if (dtb__531 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) name) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (name, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) name) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__531) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__531) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__531, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__531) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__531) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__531, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__531) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__532) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__532) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__532, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__532) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 })))) else ((Base_dCommon.v_step ((((v_parseClause st1) blockCol) dtb__532) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb__532, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf op) dtb__532) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2)) }; B_dData_dPair.f_Pair_second = st2 }))))))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name")
)
  | _ -> failwith "DT: impossible branch"
)))

# 913 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityValue = (fun (kind : Frontend_dAst.t_Opacity) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__533; Frontend_dLexer.f_PTok_ptokPos = dtb__534 } -> (match dtb__533 with
  | Frontend_dLexer.C_Tok_TSym (dtb__535) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__535) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__535) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__535; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__536) -> (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then ((Base_dCommon.v_step (((((v_parseSignature st1) blockCol) true) dtb__536) ds)) (fun (decl : Frontend_dAst.t_Decl) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb__536; Frontend_dAst.f_OpacitySpec_opacityKind = kind; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf st)) (ds).f_DeclStart_declStartPos) st2) })) }; B_dData_dPair.f_Pair_second = st2 })))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")))
  | _ -> (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")
)
  | _ -> failwith "DT: impossible branch"
)))

# 896 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__537; Frontend_dLexer.f_PTok_ptokPos = dtb__538 } -> (match dtb__537 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__539) -> (if (dtb__539 = "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityAbstract) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))
  | Frontend_dLexer.C_Tok_TKw (dtb__540) -> (if (dtb__540 = "opaque") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "opaque")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityOpaque) st1) blockCol) ds))) else (if (dtb__540 = "transparent") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "transparent")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityTransparent) st1) blockCol) ds))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 888 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semParsedDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseOpacityDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 1775 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (if (v_instanceMethodStart st) then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) false) name) ds) else ((((v_parseClause st1) blockCol) name) ds)))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1764 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (v_instanceMethodStart st) then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseInstanceDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1754 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseInstanceDeclList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (declCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__541; Base_dSource.f_Pos_posCol = dtb__542; Base_dSource.f_Pos_posOffset = dtb__543; Base_dSource.f_Pos_posEndOffset = dtb__544 } -> (if (dtb__542 = declCol) then ((Base_dCommon.v_step ((v_parseInstanceDecl st) declCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseInstanceDeclList (fuel - 1)) st1) declCol)) (fun (rest : Frontend_dAst.t_Decl B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (decl, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__542 > declCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInInstance) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1746 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__545; Base_dSource.f_Pos_posCol = dtb__546; Base_dSource.f_Pos_posOffset = dtb__547; Base_dSource.f_Pos_posEndOffset = dtb__548 } -> (if (dtb__546 > blockCol) then (((v_parseInstanceDeclList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__546) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 1701 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceTail = (fun (ctxE : Frontend_dAst.t_Expr B_dData_dList.t_List) (head : Frontend_dAst.t_Expr) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st2) "where")) (fun (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseInstanceBody st3) blockCol)) (fun (methods : Frontend_dAst.t_Decl B_dData_dList.t_List) (st4 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (ctxE, head, methods, (((v_declRefAt st) ds) st4))); B_dData_dPair.f_Pair_second = st4 })))))))

# 1690 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstance = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "instance")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel st1)) st1) blockCol)) (fun (hc : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match hc with
  | { B_dData_dPair.f_Pair_first = dtb__549; B_dData_dPair.f_Pair_second = dtb__550 } -> ((((((v_parseInstanceTail dtb__549) dtb__550) st) blockCol) ds) st2)
  | _ -> failwith "DT: impossible branch"
))))))

# 1831 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtorBody = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) (nid : int) -> ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st1) ":")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st2)) st2) ctorCol)) (fun (ty : Frontend_dAst.t_Expr) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix st3)) (fun (st3b : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = name; Frontend_dAst.f_Ctor_ctorType = ty; Frontend_dAst.f_Ctor_ctorArity = (Frontend_dParser_dSupport.v_countArrows ty); Frontend_dAst.f_Ctor_ctorRef = { Frontend_dAst.f_NodeRef_nodeRefId = nid; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf st) st3) } }; B_dData_dPair.f_Pair_second = st3b })))))))))))

# 1827 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtor = (fun (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstCtorKind) v_semCtor) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseCtorBody st0) ctorCol) (st0).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1816 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtorList = (fun (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (ctorCol : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__551; Base_dSource.f_Pos_posCol = dtb__552; Base_dSource.f_Pos_posOffset = dtb__553; Base_dSource.f_Pos_posEndOffset = dtb__554 } -> (if (dtb__552 = ctorCol) then ((Base_dCommon.v_step ((v_parseCtor st) ctorCol)) (fun (ctor : Frontend_dAst.t_Ctor) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtorList (fuel - 1)) st1) ctorCol)) (fun (rest : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st2 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (ctor, rest)); B_dData_dPair.f_Pair_second = st2 })))))) else (if (dtb__552 > ctorCol) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInData) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1808 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtors = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__555; Base_dSource.f_Pos_posCol = dtb__556; Base_dSource.f_Pos_posOffset = dtb__557; Base_dSource.f_Pos_posEndOffset = dtb__558 } -> (if (dtb__556 > blockCol) then (((v_parseCtorList (Frontend_dParser_dSupport.v_stateFuel st)) st) dtb__556) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = st })))
  | _ -> failwith "DT: impossible branch"
)))

# 946 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDataExport = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers st3)) (fun (members : Frontend_dAst.t_ExportMembers) (st3b : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3b) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__559; B_dData_dPair.f_Pair_second = dtb__560 } -> (let decl = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__559, dtb__560, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (name, members, (Frontend_dAst.v_declSpan decl))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st8 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))))

# 877 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearExport = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__561; Frontend_dLexer.f_PTok_ptokPos = dtb__562 } -> (match dtb__561 with
  | Frontend_dLexer.C_Tok_TKw (dtb__563) -> (if (dtb__563 = "data") then ((((v_parseDataExport true) st1) blockCol) ds) else (if (dtb__563 = "record") then (((((v_parseRecordExport true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 769 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedPlain = (fun (op : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__564; Frontend_dLexer.f_PTok_ptokPos = dtb__565 } -> (match dtb__564 with
  | Frontend_dLexer.C_Tok_TSym (dtb__566) -> ((((v_parseExportedValue op) st) blockCol) ds)
  | Frontend_dLexer.C_Tok_TIdent (dtb__567) -> (if (if (if (dtb__567 = "alias") then true else (dtb__567 = "boxed")) then (v_tierFollows st) else false) then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseTieredExport (if (dtb__567 = "alias") then Frontend_dAst.C_ReprTier_ReprAlias else Frontend_dAst.C_ReprTier_ReprBoxed)) st) blockCol) ds)) else ((((v_parseExportedValue op) st) blockCol) ds))
  | Frontend_dLexer.C_Tok_TKw (dtb__568) -> (if (dtb__568 = "data") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseDataExport false) st) blockCol) ds)) else (if (dtb__568 = "linear") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseLinearExport st) blockCol) ds)) else (if (dtb__568 = "record") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((((v_parseRecordExport false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds)) else (if (dtb__568 = "trait") then (if (v_opacityGiven op) then (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseTraitExport st) blockCol) ds)) else (if (dtb__568 = "axiom") then ((((v_parseAxiomExport op) st) blockCol) ds) else (if (dtb__568 = "extern") then ((((v_parseExternExport op) st) blockCol) ds) else (if (dtb__568 = "transparent") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else (if (dtb__568 = "opaque") then (if (v_tierFollows st) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 763 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st)) (fun (_u : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atKw st1) "opaque") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "opaque")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityOpaque))) st2) blockCol) ds))) else (if (if ((Frontend_dParser_dSupport.v_atKw st1) "transparent") then (B_dData_dBool.v_not (v_tierFollows st1)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st1) "transparent")) (fun (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityTransparent))) st2) blockCol) ds))) else (if ((v_atIdentName st1) "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (_u : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityAbstract))) st2) blockCol) ds))) else ((((v_parseExportedPlain B_dData_dMaybe.C_Maybe_Nothing) st1) blockCol) ds)))))))

# 755 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semParsedDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 1509 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseData = (fun (lin : bool) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "data")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent st1)) (fun (name : string) (st2 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel st2)) st2)) (fun (params : string B_dData_dList.t_List) (st3 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym st3) ":")) (fun (st4 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel st4)) st4) blockCol)) (fun (ty : Frontend_dAst.t_Expr) (st5 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st5) "where")) (fun (st6 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors st6) blockCol)) (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (st7 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving st7)) (fun (dv : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (st8 : Frontend_dParser_dSupport.t_PState) -> (match dv with
  | { B_dData_dPair.f_Pair_first = dtb__569; B_dData_dPair.f_Pair_second = dtb__570 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (name, params, ty, ctors, dtb__569, dtb__570, Frontend_dAst.C_ReprTier_ReprAuto, lin, (((v_declRefAt st) ds) st8))); B_dData_dPair.f_Pair_second = st8 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

# 1473 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw st) "linear")) (fun (st1 : Frontend_dParser_dSupport.t_PState) -> (let nd_uscrut4 = (Frontend_dParser_dSupport.v_peekTok st1) in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__571; Frontend_dLexer.f_PTok_ptokPos = dtb__572 } -> (match dtb__571 with
  | Frontend_dLexer.C_Tok_TKw (dtb__573) -> (if (dtb__573 = "data") then ((((v_parseData true) st1) blockCol) ds) else (if (dtb__573 = "record") then (((((v_parseRecord true) Frontend_dAst.C_ReprTier_ReprAuto) st1) blockCol) ds) else (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 st1) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1176 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeclBody = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (ds : t_DeclStart) -> (let nd_uscrut3 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut3 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__574; Frontend_dLexer.f_PTok_ptokPos = dtb__575 } -> (match dtb__574 with
  | Frontend_dLexer.C_Tok_TSym (dtb__576) -> (if (dtb__576 = "(") then ((Base_dCommon.v_step (v_expectDeclName st)) (fun (name : string) (st1 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) name) ds) else ((((v_parseClause st1) blockCol) name) ds)))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb__576) then ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__576) ds) else ((((v_parseClause st1) blockCol) dtb__576) ds)))))
  | Frontend_dLexer.C_Tok_TIdent (dtb__577) -> (if (if (dtb__577 = "alias") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprAlias) st) blockCol) ds) else (if (if (dtb__577 = "boxed") then (v_tierFollows st) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprBoxed) st) blockCol) ds) else (let st1 = (Frontend_dParser_dSupport.v_advance st) in (if ((Frontend_dParser_dSupport.v_atSym st1) ":") then (((((v_parseSignature st1) blockCol) true) dtb__577) ds) else ((((v_parseClause st1) blockCol) dtb__577) ds)))))
  | Frontend_dLexer.C_Tok_TKw (dtb__578) -> (if (dtb__578 = "data") then ((((v_parseData false) st) blockCol) ds) else (if (dtb__578 = "linear") then (((v_parseLinearDecl st) blockCol) ds) else (if (dtb__578 = "axiom") then (((v_parseAxiom st) blockCol) ds) else (if (dtb__578 = "extern") then (((v_parseExtern st) blockCol) ds) else (if (dtb__578 = "record") then (((((v_parseRecord false) Frontend_dAst.C_ReprTier_ReprAuto) st) blockCol) ds) else (if (dtb__578 = "trait") then (((v_parseTrait st) blockCol) ds) else (if (dtb__578 = "instance") then (((v_parseInstance st) blockCol) ds) else ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))))))))
  | _ -> ((v_ps0 st) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 1168 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semDecl) st) (fun (st0 : Frontend_dParser_dSupport.t_PState) -> (((v_parseDeclBody st0) blockCol) { f_DeclStart_declStartId = (st0).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos st0) }))))

# 694 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityOrDecl = (fun (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) -> (let nd_uscrut2 = (Frontend_dParser_dSupport.v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__579; Frontend_dLexer.f_PTok_ptokPos = dtb__580 } -> (match dtb__579 with
  | Frontend_dLexer.C_Tok_TKw (dtb__581) -> (if (dtb__581 = "infixl") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 1) dtb__580)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__581 = "infixr") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 2) dtb__580)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (dtb__581 = "infix") then ((Base_dCommon.v_step ((((v_parseFixityDecl st) blockCol) 0) dtb__580)) (fun (fd : Frontend_dAst.t_FixityDecl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (fd)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))) else (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 })))))))))
  | _ -> (if (v_exportStart st) then ((v_parseExportDecl st) blockCol) else (if (v_opacityStart st) then ((v_parseOpacityDecl st) blockCol) else ((Base_dCommon.v_step ((v_parseDecl st) blockCol)) (fun (decl : Frontend_dAst.t_Decl) (st1 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (decl)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = st1 }))))))
)
  | _ -> failwith "DT: impossible branch"
)))

# 568 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDecls = (fun (recover : bool) (fuel : int) (st : Frontend_dParser_dSupport.t_PState) (blockCol : int) (acc : t_DeclAcc) (blocks : t_DeclBlock) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof st) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_reverseDeclAcc acc); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = st; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } })) else (match (Frontend_dParser_dSupport.v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__582; Base_dSource.f_Pos_posCol = dtb__583; Base_dSource.f_Pos_posOffset = dtb__584; Base_dSource.f_Pos_posEndOffset = dtb__585 } -> (if (dtb__583 = blockCol) then (match ((v_parseFixityOrDecl st) blockCol) with
  | Base_dDiag.C_Check_ErrC (dtb__586) -> (if recover then (let st2 = ((v_recoverDecl st) blockCol) in ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st2) blockCol) acc) (v_dbMarkResume (v_dbClose blocks)))) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__587; B_dData_dPair.f_Pair_second = dtb__588 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__587; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__586, dtb__588)) } }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_ErrC (dtb__586)))
  | Base_dDiag.C_Check_OkC (dtb__589) -> (let pd = (B_dData_dPair.v_firstOf dtb__589) in (let st1 = (B_dData_dPair.v_secondOf dtb__589) in (let acc2 = ((v_addParsedDecl pd) acc) in (let verdict = ((v_blockStep blocks) pd) in (match (B_dData_dPair.v_firstOf verdict) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__590) -> (if recover then ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))) (fun (q : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__591; B_dData_dPair.f_Pair_second = dtb__592 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = q; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__591; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__590, dtb__592)) } }))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (dtb__590)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseDecls recover) (fuel - 1)) st1) blockCol) acc2) (B_dData_dPair.v_secondOf verdict))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) else (if recover then ((Base_dCommon.v_step ((((((v_parseDecls true) (fuel - 1)) ((v_recoverDecl st) blockCol)) blockCol) acc) (v_dbMarkResume (v_dbClose blocks)))) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__593; B_dData_dPair.f_Pair_second = dtb__594 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = p; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb__593; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (((v_declColumnDiag st) blockCol), dtb__594)) } }))
  | _ -> failwith "DT: impossible branch"
))) else (((v_ps1 st) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn ((string_of_int blockCol)))) (string_of_int blockCol))))
  | _ -> failwith "DT: impossible branch"
))))

# 231 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceFile = (fun (recover : bool) (st : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseModDecl st)) (fun (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (st1 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (Frontend_dParser_dSupport.v_stateFuel st1)) st1)) (fun (imp : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (st2 : Frontend_dParser_dSupport.t_PState) -> (match imp with
  | { B_dData_dPair.f_Pair_first = dtb__595; B_dData_dPair.f_Pair_second = dtb__596 } -> (if (Frontend_dParser_dSupport.v_isEof st2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__595; Frontend_dAst.f_SourceFile_sourceFileFixities = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileDecls = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__596; Frontend_dAst.f_SourceFile_sourceFileOpacity = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = st2 }; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) else (match (Frontend_dParser_dSupport.v_peekPos st2) with
  | { Base_dSource.f_Pos_posLine = dtb__597; Base_dSource.f_Pos_posCol = dtb__598; Base_dSource.f_Pos_posOffset = dtb__599; Base_dSource.f_Pos_posEndOffset = dtb__600 } -> ((Base_dCommon.v_step ((((((v_parseDecls recover) (Frontend_dParser_dSupport.v_stateFuel st2)) st2) dtb__598) v_emptyDeclAcc) v_emptyDeclBlock)) (fun (p : t_DeclAcc) (rest : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match rest with
  | { B_dData_dPair.f_Pair_first = dtb__601; B_dData_dPair.f_Pair_second = dtb__602 } -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__603; f_DeclAcc_declAccDecls = dtb__604; f_DeclAcc_declAccExports = dtb__605; f_DeclAcc_declAccOpacity = dtb__606 } -> (let sf = { Frontend_dAst.f_SourceFile_sourceFileModDecl = hdr; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__595; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__603; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__604; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__605; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__596; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__606 } in (if (Frontend_dParser_dSupport.v_isEof dtb__601) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = sf; B_dData_dPair.f_Pair_second = dtb__601 }; B_dData_dPair.f_Pair_second = dtb__602 })) else (if recover then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = sf; B_dData_dPair.f_Pair_second = dtb__601 }; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__602) (B_dData_dList.C_List__x58__x58_ ((v_endOfInputDiag dtb__601), B_dData_dList.C_List_Nil))) })) else ((v_ps0 dtb__601) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 67 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceCore = (fun (events : Frontend_dParser_dSupport.t_EventMode) (file : string) (source : string) -> (let nd_uscrut3 = (Frontend_dLexer.v_lexSourceWithComments source) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__607) -> (match dtb__607 with
  | { B_dData_dPair.f_Pair_first = dtb__608; B_dData_dPair.f_Pair_second = dtb__609 } -> (let st0 = (((((Frontend_dParser_dSupport.v_mkState file) source) dtb__608) Frontend_dParser_dSupport.C_ParseMode_PmTool) events) in (match ((v_parseSourceFile false) st0) with
  | Base_dDiag.C_Check_ErrC (dtb__610) -> (Base_dDiag.C_Check_ErrC (dtb__610))
  | Base_dDiag.C_Check_OkC (dtb__611) -> (Base_dDiag.C_Check_OkC ({ f_ParsedCore_pcSource = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__611)); f_ParsedCore_pcComments = dtb__609; f_ParsedCore_pcToks = dtb__608; f_ParsedCore_pcFin = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__611)) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__612) -> (Base_dDiag.C_Check_ErrC (dtb__612))
  | _ -> failwith "DT: impossible branch"
)))

# 84 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceDetailed = (fun (file : string) (source : string) -> (match (((v_parseSourceCore Frontend_dParser_dSupport.C_EventMode_EvFull) file) source) with
  | Base_dDiag.C_Check_ErrC (dtb__613) -> (Base_dDiag.C_Check_ErrC (dtb__613))
  | Base_dDiag.C_Check_OkC (dtb__614) -> (let events = (Frontend_dParser_dSupport.v_eventsOf (dtb__614).f_ParsedCore_pcFin) in (let cst = (((((((Frontend_dCst.v_nestToTreeWithSurface (((Frontend_dCst.v_lexTokensOf source) (dtb__614).f_ParsedCore_pcToks) (dtb__614).f_ParsedCore_pcComments)) events) ((Frontend_dCst.v_parenEntriesOf (dtb__614).f_ParsedCore_pcToks) events)) ((dtb__614).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_backtickShapes) ((dtb__614).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_sectionShapes) ((dtb__614).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_interpMultis) ((dtb__614).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_templateHoles) in (Base_dDiag.C_Check_OkC ({ f_ParsedSource_parsedFile = (Frontend_dAstView.v_ofTree cst); f_ParsedSource_parsedComments = (dtb__614).f_ParsedCore_pcComments; f_ParsedSource_parsedRawToks = (dtb__614).f_ParsedCore_pcToks; f_ParsedSource_parsedCst = cst }))))
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceWithComments = (fun (file : string) (source : string) -> (match (((v_parseSourceCore Frontend_dParser_dSupport.C_EventMode_EvNone) file) source) with
  | Base_dDiag.C_Check_ErrC (dtb__615) -> (Base_dDiag.C_Check_ErrC (dtb__615))
  | Base_dDiag.C_Check_OkC (dtb__616) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__616).f_ParsedCore_pcSource; B_dData_dPair.f_Pair_second = (dtb__616).f_ParsedCore_pcComments }))
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSource = (fun (file : string) (source : string) -> (let nd_uscrut2 = ((v_parseSourceWithComments file) source) in (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__617) -> (match dtb__617 with
  | { B_dData_dPair.f_Pair_first = dtb__618; B_dData_dPair.f_Pair_second = dtb__619 } -> (Base_dDiag.C_Check_OkC (dtb__618))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__620) -> (Base_dDiag.C_Check_ErrC (dtb__620))
  | _ -> failwith "DT: impossible branch"
)))

# 3015 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecoveringTokens = (fun (file : string) (source : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (let st0 = (((((Frontend_dParser_dSupport.v_mkState file) source) toks) mode) Frontend_dParser_dSupport.C_EventMode_EvLayout) in ((Base_dCommon.v_bind ((v_parseSourceFile true) st0)) (fun (p : ((Frontend_dAst.t_SourceFile, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let fin = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf p)) in (let events = (Frontend_dParser_dSupport.v_eventsOf fin) in (let parens = ((Frontend_dCst.v_parenEntriesOf toks) events) in (let holes = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) (fin).Frontend_dParser_dSupport.f_PState_templateHoles) in (let facts = ((((Frontend_dCst.v_fixityFactsOfParts parens) (fin).Frontend_dParser_dSupport.f_PState_backtickShapes) (fin).Frontend_dParser_dSupport.f_PState_sectionShapes) holes) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = facts }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))))))))

# 3003 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecovering = (fun (file : string) (source : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource source)) (fun (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((((v_parseSourceRecoveringTokens file) source) Frontend_dParser_dSupport.C_ParseMode_PmStrict) toks))))

# 46 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedFile = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__621; f_ParsedSource_parsedComments = dtb__622; f_ParsedSource_parsedRawToks = dtb__623; f_ParsedSource_parsedCst = dtb__624 } -> dtb__621
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedComments = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__625; f_ParsedSource_parsedComments = dtb__626; f_ParsedSource_parsedRawToks = dtb__627; f_ParsedSource_parsedCst = dtb__628 } -> dtb__626
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedRawToks = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__629; f_ParsedSource_parsedComments = dtb__630; f_ParsedSource_parsedRawToks = dtb__631; f_ParsedSource_parsedCst = dtb__632 } -> dtb__631
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedCst = (fun (p : t_ParsedSource) -> (match p with
  | { f_ParsedSource_parsedFile = dtb__633; f_ParsedSource_parsedComments = dtb__634; f_ParsedSource_parsedRawToks = dtb__635; f_ParsedSource_parsedCst = dtb__636 } -> dtb__636
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcSource = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__637; f_ParsedCore_pcComments = dtb__638; f_ParsedCore_pcToks = dtb__639; f_ParsedCore_pcFin = dtb__640 } -> dtb__637
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcComments = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__641; f_ParsedCore_pcComments = dtb__642; f_ParsedCore_pcToks = dtb__643; f_ParsedCore_pcFin = dtb__644 } -> dtb__642
  | _ -> failwith "DT: impossible branch"
))

# 63 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcToks = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__645; f_ParsedCore_pcComments = dtb__646; f_ParsedCore_pcToks = dtb__647; f_ParsedCore_pcFin = dtb__648 } -> dtb__647
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcFin = (fun (p : t_ParsedCore) -> (match p with
  | { f_ParsedCore_pcSource = dtb__649; f_ParsedCore_pcComments = dtb__650; f_ParsedCore_pcToks = dtb__651; f_ParsedCore_pcFin = dtb__652 } -> dtb__652
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccFixities = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__653; f_DeclAcc_declAccDecls = dtb__654; f_DeclAcc_declAccExports = dtb__655; f_DeclAcc_declAccOpacity = dtb__656 } -> dtb__653
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccDecls = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__657; f_DeclAcc_declAccDecls = dtb__658; f_DeclAcc_declAccExports = dtb__659; f_DeclAcc_declAccOpacity = dtb__660 } -> dtb__658
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccExports = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__661; f_DeclAcc_declAccDecls = dtb__662; f_DeclAcc_declAccExports = dtb__663; f_DeclAcc_declAccOpacity = dtb__664 } -> dtb__663
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccOpacity = (fun (p : t_DeclAcc) -> (match p with
  | { f_DeclAcc_declAccFixities = dtb__665; f_DeclAcc_declAccDecls = dtb__666; f_DeclAcc_declAccExports = dtb__667; f_DeclAcc_declAccOpacity = dtb__668 } -> dtb__668
  | _ -> failwith "DT: impossible branch"
))

# 136 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedFixity = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__669; f_ParsedDecl_parsedDecl = dtb__670; f_ParsedDecl_parsedExport = dtb__671; f_ParsedDecl_parsedOpacity = dtb__672 } -> dtb__669
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedDecl = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__673; f_ParsedDecl_parsedDecl = dtb__674; f_ParsedDecl_parsedExport = dtb__675; f_ParsedDecl_parsedOpacity = dtb__676 } -> dtb__674
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedExport = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__677; f_ParsedDecl_parsedDecl = dtb__678; f_ParsedDecl_parsedExport = dtb__679; f_ParsedDecl_parsedOpacity = dtb__680 } -> dtb__679
  | _ -> failwith "DT: impossible branch"
))

# 139 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedOpacity = (fun (p : t_ParsedDecl) -> (match p with
  | { f_ParsedDecl_parsedFixity = dtb__681; f_ParsedDecl_parsedDecl = dtb__682; f_ParsedDecl_parsedExport = dtb__683; f_ParsedDecl_parsedOpacity = dtb__684 } -> dtb__684
  | _ -> failwith "DT: impossible branch"
))

# 146 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declStartId = (fun (p : t_DeclStart) -> (match p with
  | { f_DeclStart_declStartId = dtb__685; f_DeclStart_declStartPos = dtb__686 } -> dtb__685
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declStartPos = (fun (p : t_DeclStart) -> (match p with
  | { f_DeclStart_declStartId = dtb__687; f_DeclStart_declStartPos = dtb__688 } -> dtb__688
  | _ -> failwith "DT: impossible branch"
))

# 461 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpen = (fun (p : t_DeclBlock) -> (match p with
  | { f_DeclBlock_dbOpen = dtb__689; f_DeclBlock_dbClauses = dtb__690; f_DeclBlock_dbFirst = dtb__691; f_DeclBlock_dbResume = dtb__692 } -> dtb__689
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClauses = (fun (p : t_DeclBlock) -> (match p with
  | { f_DeclBlock_dbOpen = dtb__693; f_DeclBlock_dbClauses = dtb__694; f_DeclBlock_dbFirst = dtb__695; f_DeclBlock_dbResume = dtb__696 } -> dtb__694
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbFirst = (fun (p : t_DeclBlock) -> (match p with
  | { f_DeclBlock_dbOpen = dtb__697; f_DeclBlock_dbClauses = dtb__698; f_DeclBlock_dbFirst = dtb__699; f_DeclBlock_dbResume = dtb__700 } -> dtb__699
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbResume = (fun (p : t_DeclBlock) -> (match p with
  | { f_DeclBlock_dbOpen = dtb__701; f_DeclBlock_dbClauses = dtb__702; f_DeclBlock_dbFirst = dtb__703; f_DeclBlock_dbResume = dtb__704 } -> dtb__704
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadName = (fun (p : t_TraitHead) -> (match p with
  | { f_TraitHead_traitHeadName = dtb__705; f_TraitHead_traitHeadParams = dtb__706; f_TraitHead_traitHeadSupers = dtb__707 } -> dtb__705
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadParams = (fun (p : t_TraitHead) -> (match p with
  | { f_TraitHead_traitHeadName = dtb__708; f_TraitHead_traitHeadParams = dtb__709; f_TraitHead_traitHeadSupers = dtb__710 } -> dtb__709
  | _ -> failwith "DT: impossible branch"
))

# 1035 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadSupers = (fun (p : t_TraitHead) -> (match p with
  | { f_TraitHead_traitHeadName = dtb__711; f_TraitHead_traitHeadParams = dtb__712; f_TraitHead_traitHeadSupers = dtb__713 } -> dtb__713
  | _ -> failwith "DT: impossible branch"
))
