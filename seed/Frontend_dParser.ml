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
let v_ps0 = (fun (dtb_u_u2 : Frontend_dParser_dSupport.t_PState) (dtb_u_u3 : Base_dDiagnostics_dFrontend.t_PsDiag) -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dParser_dSupport.v_tokSpan dtb_u_u2)) dtb_u_u3))

# 24 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ps1 = (fun (dtb_u_u5 : Frontend_dParser_dSupport.t_PState) (dtb_u_u6 : Base_dDiagnostics_dFrontend.t_PsDiag) (dtb_u_u7 : string) -> (((Base_dDiagnostics_dFrontend.v_psErr1At (Frontend_dParser_dSupport.v_tokSpan dtb_u_u5)) dtb_u_u6) dtb_u_u7))

# 27 "Vuna/Compiler/Frontend/Parser.vuna"
let v_psAt = (fun (dtb_u_u10 : Frontend_dParser_dSupport.t_PState) (dtb_u_u12 : Base_dDiagnostics_dFrontend.t_PsDiag) (dtb_u_u13 : string B_dData_dVec.t_Vec) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dParser_dSupport.v_tokSpan dtb_u_u10)) dtb_u_u12) dtb_u_u13))

# 123 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclAcc = { f_DeclAcc_declAccFixities = B_dData_dList.C_List_Nil; f_DeclAcc_declAccDecls = B_dData_dList.C_List_Nil; f_DeclAcc_declAccExports = B_dData_dList.C_List_Nil; f_DeclAcc_declAccOpacity = B_dData_dList.C_List_Nil }

# 132 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyParsedDecl = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }

# 141 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declRefAt = (fun (dtb_u_u14 : Frontend_dParser_dSupport.t_PState) (dtb_u_u15 : t_DeclStart) (dtb_u_u16 : Frontend_dParser_dSupport.t_PState) -> { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u15).f_DeclStart_declStartId; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u14)) (dtb_u_u15).f_DeclStart_declStartPos) dtb_u_u16) })

# 148 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semModHead = (fun (dtb_u_u17 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match dtb_u_u17 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u18) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemModHead (dtb_u_u18))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semImport = (fun (dtb_u_u19 : Frontend_dAst.t_Import) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemImport (dtb_u_u19)))))

# 155 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semReexportImport = (fun (dtb_u_u20 : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemReexportImport ((B_dData_dPair.v_firstOf dtb_u_u20), (B_dData_dPair.v_secondOf dtb_u_u20))))))

# 158 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExportNamespace = (fun (dtb_u_u21 : Frontend_dAst.t_ExportItem) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExportNamespace (dtb_u_u21)))))

# 161 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExportItem = (fun (dtb_u_u22 : Frontend_dAst.t_ExportItem) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExportItem (dtb_u_u22)))))

# 164 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semFixity = (fun (dtb_u_u23 : Frontend_dAst.t_FixityDecl) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemFixity (dtb_u_u23)))))

# 167 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semDecl = (fun (dtb_u_u24 : Frontend_dAst.t_Decl) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDecl (dtb_u_u24, B_dData_dMaybe.C_Maybe_Nothing, B_dData_dMaybe.C_Maybe_Nothing)))))

# 170 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semParsedDecl = (fun (dtb_u_u25 : t_ParsedDecl) -> (match dtb_u_u25 with
  | { f_ParsedDecl_parsedFixity = dtb_u_u26; f_ParsedDecl_parsedDecl = dtb_u_u27; f_ParsedDecl_parsedExport = dtb_u_u28; f_ParsedDecl_parsedOpacity = dtb_u_u29 } -> (match dtb_u_u27 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u30) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDecl (dtb_u_u30, dtb_u_u28, dtb_u_u29))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semCtor = (fun (dtb_u_u31 : Frontend_dAst.t_Ctor) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemCtor (dtb_u_u31)))))

# 177 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semField = (fun (dtb_u_u32 : Frontend_dAst.t_Field) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemField (dtb_u_u32)))))

# 180 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMethod = (fun (dtb_u_u33 : Frontend_dAst.t_TraitMethod) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemMethod (dtb_u_u33)))))

# 183 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semBindingItem = (fun (dtb_u_u34 : t_BindingItem) -> (match dtb_u_u34 with
  | C_BindingItem_BIBind (dtb_u_u35) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemBinding (dtb_u_u35))))
  | C_BindingItem_BISig (dtb_u_u36, dtb_u_u37, dtb_u_u38) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemBindingSig (dtb_u_u36, dtb_u_u37, dtb_u_u38))))
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semAlt = (fun (dtb_u_u39 : Frontend_dAst.t_Alt) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemAlt (dtb_u_u39)))))

# 190 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semExpr = (fun (dtb_u_u40 : Frontend_dAst.t_Expr) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemExpr (dtb_u_u40)))))

# 193 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semPat = (fun (dtb_u_u41 : Frontend_dAst.t_Pat) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemPat (dtb_u_u41)))))

# 196 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semDoStmt = (fun (dtb_u_u42 : Frontend_dAst.t_DoStmt) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemDoStmt (dtb_u_u42)))))

# 205 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMacroNamed = (fun (dtb_u_u43 : int) (dtb_u_u44 : string) -> (match (Frontend_dReserved.v_macroNameOf dtb_u_u44) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u45) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemMacro (dtb_u_u45, dtb_u_u43))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semMacroAtom = (fun (dtb_u_u46 : Frontend_dAst.t_Expr) -> (match dtb_u_u46 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u47, dtb_u_u48, dtb_u_u49) -> (match dtb_u_u47 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u50, dtb_u_u51) -> ((v_semMacroNamed (B_dData_dList.v_length dtb_u_u48)) dtb_u_u50)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u52, dtb_u_u53) -> ((v_semMacroNamed 0) dtb_u_u52)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 212 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semHandleRet = (fun (dtb_u_u54 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> B_dData_dMaybe.C_Maybe_Nothing)

# 326 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportItemOf = (fun (dtb_u_u55 : string) (dtb_u_u56 : Frontend_dAst.t_ExportMembers) (dtb_u_u57 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u56 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb_u_u58) -> (Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u55, dtb_u_u58, dtb_u_u57))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u55, B_dData_dList.C_List_Nil, dtb_u_u57))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (dtb_u_u55, dtb_u_u57))
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespaceBody = (fun (dtb_u_u59 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u59)) (fun (dtb_u_u60 : string) (dtb_u_u61 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u61) "module")) (fun (dtb_u_u62 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u62)) (fun (dtb_u_u63 : string) (dtb_u_u64 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u64) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u64) "as")) (fun (dtb_u_u65 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u65)) (fun (dtb_u_u66 : string) (dtb_u_u67 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u63, (B_dData_dMaybe.C_Maybe_Just (dtb_u_u66)), { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u59).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u59) dtb_u_u67) })); B_dData_dPair.f_Pair_second = dtb_u_u67 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u63, B_dData_dMaybe.C_Maybe_Nothing, { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u59).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u59) dtb_u_u64) })); B_dData_dPair.f_Pair_second = dtb_u_u64 }))))))))))

# 345 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportNamespace = (fun (dtb_u_u68 : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semExportNamespace) dtb_u_u68) (fun (dtb_u_u69 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportNamespaceBody dtb_u_u69))))

# 376 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reexportPrefix = (fun (dtb_u_u70 : Frontend_dAst.t_Import) -> (match (dtb_u_u70).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u71) -> dtb_u_u71
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u70).Frontend_dAst.f_Import_importName
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Frontend/Parser.vuna"
let v_qualifyExportItem = (fun (dtb_u_u72 : string) (dtb_u_u73 : Frontend_dAst.t_ExportItem) -> (match dtb_u_u73 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u74, dtb_u_u75, dtb_u_u76) -> (Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u74, dtb_u_u75, dtb_u_u76))
  | Frontend_dAst.C_ExportItem_XModule (dtb_u_u77, dtb_u_u78) -> (Frontend_dAst.C_ExportItem_XModule (dtb_u_u77, dtb_u_u78))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u79, dtb_u_u80, dtb_u_u81) -> (Frontend_dAst.C_ExportItem_XTypeSome ((String.concat "" [dtb_u_u72; "."; dtb_u_u79]), dtb_u_u80, dtb_u_u81))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb_u_u82, dtb_u_u83) -> (Frontend_dAst.C_ExportItem_XTypeAll ((String.concat "" [dtb_u_u72; "."; dtb_u_u82]), dtb_u_u83))
  | Frontend_dAst.C_ExportItem_XBare (dtb_u_u84, dtb_u_u85) -> (Frontend_dAst.C_ExportItem_XBare ((String.concat "" [dtb_u_u72; "."; dtb_u_u84]), dtb_u_u85))
  | _ -> failwith "DT: impossible branch"
))

# 398 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAlias = (fun (dtb_u_u86 : Base_dSource.t_Pos) (dtb_u_u87 : int) (dtb_u_u88 : Frontend_dParser_dSupport.t_PState) (dtb_u_u89 : bool) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u88)) (fun (dtb_u_u90 : string) (dtb_u_u91 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u91) "as") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u91) "as")) (fun (dtb_u_u92 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u92)) (fun (dtb_u_u93 : string) (dtb_u_u94 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = dtb_u_u90; Frontend_dAst.f_Import_importIsQualified = dtb_u_u89; Frontend_dAst.f_Import_importAlias = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u93)); Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u87; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u88)) dtb_u_u86) dtb_u_u94) } }; B_dData_dPair.f_Pair_second = dtb_u_u94 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Import_importName = dtb_u_u90; Frontend_dAst.f_Import_importIsQualified = dtb_u_u89; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u87; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u88)) dtb_u_u86) dtb_u_u91) } }; B_dData_dPair.f_Pair_second = dtb_u_u91 }))))))

# 357 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportAfterKeyword = (fun (dtb_u_u95 : Base_dSource.t_Pos) (dtb_u_u96 : int) (dtb_u_u97 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u97) "qualified") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u97) "qualified")) (fun (dtb_u_u98 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseImportAlias dtb_u_u95) dtb_u_u96) dtb_u_u98) true))) else ((((v_parseImportAlias dtb_u_u95) dtb_u_u96) dtb_u_u97) false)))

# 392 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpecBody = (fun (dtb_u_u99 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u99) "import")) (fun (dtb_u_u100 : Frontend_dParser_dSupport.t_PState) -> (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos dtb_u_u99)) (dtb_u_u99).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u100))))

# 389 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseImportSpec = (fun (dtb_u_u101 : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semImport) dtb_u_u101) (fun (dtb_u_u102 : Frontend_dParser_dSupport.t_PState) -> (v_parseImportSpecBody dtb_u_u102))))

# 451 "Vuna/Compiler/Frontend/Parser.vuna"
let v_emptyDeclBlock = { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil) }

# 454 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClose = (fun (dtb_u_u103 : t_DeclBlock) -> { f_DeclBlock_dbOpen = B_dData_dMaybe.C_Maybe_Nothing; f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = (dtb_u_u103).f_DeclBlock_dbFirst })

# 458 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpenAt = (fun (dtb_u_u104 : string) (dtb_u_u105 : Base_dSource.t_Span) (dtb_u_u106 : t_DeclBlock) -> (let dtb_u_u107 = (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u104) (dtb_u_u106).f_DeclBlock_dbFirst) then (dtb_u_u106).f_DeclBlock_dbFirst else (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u104) dtb_u_u105) (dtb_u_u106).f_DeclBlock_dbFirst)) in { f_DeclBlock_dbOpen = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u104)); f_DeclBlock_dbClauses = B_dData_dList.C_List_Nil; f_DeclBlock_dbFirst = dtb_u_u107 }))

# 464 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbAddClause = (fun (dtb_u_u108 : t_DeclBlock) (dtb_u_u109 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u110 : Base_dSource.t_Span) -> { f_DeclBlock_dbOpen = (dtb_u_u108).f_DeclBlock_dbOpen; f_DeclBlock_dbClauses = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u109; B_dData_dPair.f_Pair_second = dtb_u_u110 }, (dtb_u_u108).f_DeclBlock_dbClauses)); f_DeclBlock_dbFirst = (dtb_u_u108).f_DeclBlock_dbFirst })

# 467 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyNullary = (fun (dtb_u_u111 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u111 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u112, dtb_u_u113) -> (match dtb_u_u112 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u114; B_dData_dPair.f_Pair_second = dtb_u_u115 } -> (match dtb_u_u114 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> (v_anyNullary dtb_u_u113)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_findShadow = (fun (dtb_u_u116 : (Frontend_dAst.t_Pat B_dData_dList.t_List, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u117 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u116 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> (match dtb_u_u118 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u120; B_dData_dPair.f_Pair_second = dtb_u_u121 } -> (if ((Frontend_dAst.v_clauseSubsumedBy dtb_u_u120) dtb_u_u117) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u121)) else ((v_findShadow dtb_u_u119) dtb_u_u117))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/Parser.vuna"
let v_shadowDiag = (fun (dtb_u_u122 : string) (dtb_u_u123 : Base_dSource.t_Span) (dtb_u_u124 : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u124)); Base_dDiag.f_Label_labelText = "an earlier clause already matches these values"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u123)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseShadowed (dtb_u_u122))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u122, B_dData_dVec.C_Vec_Nil))))))

# 478 "Vuna/Compiler/Frontend/Parser.vuna"
let v_clauseVerdict = (fun (dtb_u_u125 : t_DeclBlock) (dtb_u_u126 : string) (dtb_u_u127 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u128 : Base_dSource.t_Span) -> (match dtb_u_u127 with
  | B_dData_dList.C_List_Nil -> (if (v_anyNullary (dtb_u_u125).f_DeclBlock_dbClauses) then (B_dData_dMaybe.C_Maybe_Just (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u128)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_DefinitionDuplicate (dtb_u_u126))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u126, B_dData_dVec.C_Vec_Nil)))))) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> (match ((v_findShadow (dtb_u_u125).f_DeclBlock_dbClauses) dtb_u_u127) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u129) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shadowDiag dtb_u_u126) dtb_u_u128) dtb_u_u129)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
))

# 501 "Vuna/Compiler/Frontend/Parser.vuna"
let v_notAdjacentDiag = (fun (dtb_u_u130 : string) (dtb_u_u131 : Base_dSource.t_Span) (dtb_u_u132 : Base_dSource.t_Span) -> ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u132)); Base_dDiag.f_Label_labelText = "the definition starts here"; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelSecondary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u131)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_ClauseNotAdjacent (dtb_u_u130))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u130, B_dData_dVec.C_Vec_Nil))))))

# 495 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reopenDiag = (fun (dtb_u_u133 : t_DeclBlock) (dtb_u_u134 : string) (dtb_u_u135 : Base_dSource.t_Span) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u134) (dtb_u_u133).f_DeclBlock_dbFirst) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u136) -> (B_dData_dMaybe.C_Maybe_Just ((((v_notAdjacentDiag dtb_u_u134) dtb_u_u135) dtb_u_u136)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockFun = (fun (dtb_u_u137 : t_DeclBlock) (dtb_u_u138 : string) (dtb_u_u139 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u140 : Base_dSource.t_Span) -> (match (dtb_u_u137).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u141) -> (if (dtb_u_u141 = dtb_u_u138) then { B_dData_dPair.f_Pair_first = ((((v_clauseVerdict dtb_u_u137) dtb_u_u138) dtb_u_u139) dtb_u_u140); B_dData_dPair.f_Pair_second = (((v_dbAddClause dtb_u_u137) dtb_u_u139) dtb_u_u140) } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag dtb_u_u137) dtb_u_u138) dtb_u_u140); B_dData_dPair.f_Pair_second = (((v_dbOpenAt dtb_u_u138) dtb_u_u140) (v_dbClose dtb_u_u137)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag dtb_u_u137) dtb_u_u138) dtb_u_u140); B_dData_dPair.f_Pair_second = (((v_dbOpenAt dtb_u_u138) dtb_u_u140) (v_dbClose dtb_u_u137)) }
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockSig = (fun (dtb_u_u142 : t_DeclBlock) (dtb_u_u143 : string) (dtb_u_u144 : Base_dSource.t_Span) -> (match (dtb_u_u142).f_DeclBlock_dbOpen with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u145) -> (if (dtb_u_u145 = dtb_u_u143) then { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u142 } else { B_dData_dPair.f_Pair_first = (((v_reopenDiag dtb_u_u142) dtb_u_u143) dtb_u_u144); B_dData_dPair.f_Pair_second = (((v_dbOpenAt dtb_u_u143) dtb_u_u144) (v_dbClose dtb_u_u142)) })
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (((v_reopenDiag dtb_u_u142) dtb_u_u143) dtb_u_u144); B_dData_dPair.f_Pair_second = (((v_dbOpenAt dtb_u_u143) dtb_u_u144) dtb_u_u142) }
  | _ -> failwith "DT: impossible branch"
))

# 524 "Vuna/Compiler/Frontend/Parser.vuna"
let v_blockStep = (fun (dtb_u_u146 : t_DeclBlock) (dtb_u_u147 : t_ParsedDecl) -> (match dtb_u_u147 with
  | { f_ParsedDecl_parsedFixity = dtb_u_u148; f_ParsedDecl_parsedDecl = dtb_u_u149; f_ParsedDecl_parsedExport = dtb_u_u150; f_ParsedDecl_parsedOpacity = dtb_u_u151 } -> (match dtb_u_u148 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u149 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u150 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u151 with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u146 }
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u152) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u153) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u154) -> (match dtb_u_u154 with
  | Frontend_dAst.C_Decl_DSig (dtb_u_u155, dtb_u_u156, dtb_u_u157, dtb_u_u158) -> (match dtb_u_u150 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u151 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_blockSig dtb_u_u146) dtb_u_u155) (Frontend_dAst.v_nodeRefSpan dtb_u_u158))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u159) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u160) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_Decl_DFun (dtb_u_u161, dtb_u_u162, dtb_u_u163, dtb_u_u164) -> (match dtb_u_u150 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u151 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_blockFun dtb_u_u146) dtb_u_u161) dtb_u_u162) (Frontend_dAst.v_nodeRefSpan dtb_u_u164))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u165) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u166) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match dtb_u_u150 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u151 with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u167) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u168) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u169) -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (v_dbClose dtb_u_u146) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 580 "Vuna/Compiler/Frontend/Parser.vuna"
let v_addParsedDecl = (fun (dtb_u_u170 : t_ParsedDecl) (dtb_u_u171 : t_DeclAcc) -> (match dtb_u_u170 with
  | { f_ParsedDecl_parsedFixity = dtb_u_u172; f_ParsedDecl_parsedDecl = dtb_u_u173; f_ParsedDecl_parsedExport = dtb_u_u174; f_ParsedDecl_parsedOpacity = dtb_u_u175 } -> (match dtb_u_u171 with
  | { f_DeclAcc_declAccFixities = dtb_u_u176; f_DeclAcc_declAccDecls = dtb_u_u177; f_DeclAcc_declAccExports = dtb_u_u178; f_DeclAcc_declAccOpacity = dtb_u_u179 } -> (let dtb_u_u180 = (match dtb_u_u172 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u187) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u187, dtb_u_u176))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u176
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u181 = (match dtb_u_u173 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u186) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u186, dtb_u_u177))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u177
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u182 = (match dtb_u_u174 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u185) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u185, dtb_u_u178))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u178
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u183 = (match dtb_u_u175 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u184) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u184, dtb_u_u179))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u179
  | _ -> failwith "DT: impossible branch"
) in { f_DeclAcc_declAccFixities = dtb_u_u180; f_DeclAcc_declAccDecls = dtb_u_u181; f_DeclAcc_declAccExports = dtb_u_u182; f_DeclAcc_declAccOpacity = dtb_u_u183 }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Frontend/Parser.vuna"
let v_reverseDeclAcc = (fun (dtb_u_u188 : t_DeclAcc) -> (match dtb_u_u188 with
  | { f_DeclAcc_declAccFixities = dtb_u_u189; f_DeclAcc_declAccDecls = dtb_u_u190; f_DeclAcc_declAccExports = dtb_u_u191; f_DeclAcc_declAccOpacity = dtb_u_u192 } -> { f_DeclAcc_declAccFixities = (B_dData_dList.v_reverse dtb_u_u189); f_DeclAcc_declAccDecls = (B_dData_dList.v_reverse dtb_u_u190); f_DeclAcc_declAccExports = (B_dData_dList.v_reverse dtb_u_u191); f_DeclAcc_declAccOpacity = (B_dData_dList.v_reverse dtb_u_u192) }
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_skipToDeclLine = (fun (dtb_u_u193 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u194 : int) -> (match dtb_u_u193 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u195, dtb_u_u196) -> ((v_skipFrom dtb_u_u196) dtb_u_u194)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 617 "Vuna/Compiler/Frontend/Parser.vuna"
and v_skipFrom = (fun (dtb_u_u197 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u198 : int) -> (match dtb_u_u197 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u199, dtb_u_u200) -> (if ((Base_dSource.v_posCol (dtb_u_u199).Frontend_dLexer.f_PTok_ptokPos) = dtb_u_u198) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u199, dtb_u_u200)) else ((v_skipToDeclLine dtb_u_u200) dtb_u_u198))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 606 "Vuna/Compiler/Frontend/Parser.vuna"
let v_recoverDecl = (fun (dtb_u_u201 : Frontend_dParser_dSupport.t_PState) (dtb_u_u202 : int) -> (let dtb_u_u203 = ((v_skipToDeclLine (dtb_u_u201).Frontend_dParser_dSupport.f_PState_toksOf) dtb_u_u202) in (let dtb_u_u204 = (bi_natSub (B_dData_dList.v_length (dtb_u_u201).Frontend_dParser_dSupport.f_PState_toksOf) (B_dData_dList.v_length dtb_u_u203)) in { dtb_u_u201 with Frontend_dParser_dSupport.f_PState_toksOf = dtb_u_u203; Frontend_dParser_dSupport.f_PState_toksLeft = (B_dData_dList.v_length dtb_u_u203); Frontend_dParser_dSupport.f_PState_tokIndex = ((dtb_u_u201).Frontend_dParser_dSupport.f_PState_tokIndex + dtb_u_u204) })))

# 655 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportMarkerFollows = (fun (dtb_u_u205 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u206 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u205) in (match dtb_u_u206 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u207; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u208 } -> (match dtb_u_u207 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u209) -> (if (dtb_u_u209 = "data") then true else (if (dtb_u_u209 = "record") then true else (if (dtb_u_u209 = "trait") then true else (if (dtb_u_u209 = "axiom") then true else (if (dtb_u_u209 = "extern") then true else (if (dtb_u_u209 = "linear") then true else (if (dtb_u_u209 = "opaque") then true else (if (dtb_u_u209 = "transparent") then true else (if (dtb_u_u209 = "import") then true else false)))))))))
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u210) -> (if (dtb_u_u210 = ":") then false else true)
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u211) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 649 "Vuna/Compiler/Frontend/Parser.vuna"
let v_exportStart = (fun (dtb_u_u212 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u213 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u212) in (match dtb_u_u213 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u214; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u215 } -> (match dtb_u_u214 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u216) -> (if (dtb_u_u216 = "export") then (v_exportMarkerFollows (Frontend_dParser_dSupport.v_advance dtb_u_u212)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 744 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityGiven = (fun (dtb_u_u217 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) -> (match dtb_u_u217 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u218) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacitySpecOf = (fun (dtb_u_u219 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (dtb_u_u220 : string) (dtb_u_u221 : Base_dSource.t_Span) -> (match dtb_u_u219 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u222) -> (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb_u_u220; Frontend_dAst.f_OpacitySpec_opacityKind = dtb_u_u222; Frontend_dAst.f_OpacitySpec_opacitySpan = dtb_u_u221 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 983 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_traitSupersFollowGo = (fun (dtb_u_u223 : int) (dtb_u_u224 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match dtb_u_u224 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u225, dtb_u_u226) -> (match dtb_u_u225 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u227; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u228 } -> (let dtb_u_u229 = dtb_u_u227 in (match dtb_u_u229 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u230) -> (if (dtb_u_u230 = "=>") then (dtb_u_u223 = 0) else (if (dtb_u_u230 = "(") then ((v_traitSupersFollowGo (dtb_u_u223 + 1)) dtb_u_u226) else (if (dtb_u_u230 = ")") then ((v_traitSupersFollowGo (if (dtb_u_u223 > 0) then (dtb_u_u223 - 1) else 0)) dtb_u_u226) else ((v_traitSupersFollowGo dtb_u_u223) dtb_u_u226))))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u231) -> (if (dtb_u_u231 = "where") then false else ((v_traitSupersFollowGo dtb_u_u223) dtb_u_u226))
  | _ -> ((v_traitSupersFollowGo dtb_u_u223) dtb_u_u226)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 980 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitSupersFollow = (fun (dtb_u_u232 : Frontend_dParser_dSupport.t_PState) -> ((v_traitSupersFollowGo 0) (dtb_u_u232).Frontend_dParser_dSupport.f_PState_toksOf))

# 1019 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parenIsMemberList = (fun (dtb_u_u233 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u234 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance dtb_u_u233)) in (match dtb_u_u234 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u235; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u236 } -> (match dtb_u_u235 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u237) -> (let dtb_u_u238 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u233))) in (match dtb_u_u238 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u239; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u240 } -> (match dtb_u_u239 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u241) -> (if (dtb_u_u241 = ",") then true else (if (dtb_u_u241 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u242) -> (if (dtb_u_u242 = "..") then true else (if (dtb_u_u242 = ")") then true else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1052 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectDeclName = (fun (dtb_u_u243 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u244 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u243) in (match dtb_u_u244 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u245; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u246 } -> (match dtb_u_u245 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u247) -> (if (dtb_u_u247 = "(") then (let dtb_u_u248 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u243) 1) in (match dtb_u_u248 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u249) -> (match dtb_u_u249 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u250; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u251 } -> (match dtb_u_u250 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u252) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u252) then (((v_ps1 dtb_u_u243) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (let dtb_u_u253 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u243) 2) in (match dtb_u_u253 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> (match dtb_u_u254 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u255; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u256 } -> (match dtb_u_u255 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u257) -> (if (dtb_u_u257 = ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u252; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u243))) })) else (((v_ps1 dtb_u_u243) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator"))
  | _ -> (((v_ps1 dtb_u_u243) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 dtb_u_u243) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)))
  | _ -> (((v_ps1 dtb_u_u243) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_ps1 dtb_u_u243) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u247) then (((v_ps1 dtb_u_u243) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u243) }))))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u258) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u258; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u243) }))
  | _ -> ((v_ps0 dtb_u_u243) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 317 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMemberNames = (fun (dtb_u_u259 : int) (dtb_u_u260 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u259 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (v_expectDeclName dtb_u_u260)) (fun (dtb_u_u261 : string) (dtb_u_u262 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u262) ",") then ((Base_dCommon.v_step ((v_parseMemberNames (dtb_u_u259 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u262))) (fun (dtb_u_u263 : string B_dData_dList.t_List) (dtb_u_u264 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u261, dtb_u_u263)); B_dData_dPair.f_Pair_second = dtb_u_u264 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u262) ")")) (fun (dtb_u_u265 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u261, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u265 })))))))))

# 311 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportMembers = (fun (dtb_u_u266 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u266) "(")) (fun (dtb_u_u267 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u267) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u267) })) else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u267) "..") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u267) "..")) (fun (dtb_u_u268 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u268) ")")) (fun (dtb_u_u269 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMAll; B_dData_dPair.f_Pair_second = dtb_u_u269 })))))) else ((Base_dCommon.v_step ((v_parseMemberNames (Frontend_dParser_dSupport.v_stateFuel dtb_u_u267)) dtb_u_u267)) (fun (dtb_u_u270 : string B_dData_dList.t_List) (dtb_u_u271 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportMembers_EMOnly (dtb_u_u270)); B_dData_dPair.f_Pair_second = dtb_u_u271 })))))))))

# 286 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItem = (fun (dtb_u_u272 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u273 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u272) in (match dtb_u_u273 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u274; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u275 } -> (match dtb_u_u274 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u276) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u276) then ((v_ps0 dtb_u_u272) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb_u_u276, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u272) (Frontend_dParser_dSupport.v_advance dtb_u_u272))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u272) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u277) -> (let dtb_u_u278 = (Frontend_dParser_dSupport.v_advance dtb_u_u272) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u278) "(") then ((Base_dCommon.v_step (v_parseExportMembers dtb_u_u278)) (fun (dtb_u_u279 : Frontend_dAst.t_ExportMembers) (dtb_u_u280 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_exportItemOf dtb_u_u277) dtb_u_u279) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u272) dtb_u_u280))); B_dData_dPair.f_Pair_second = dtb_u_u280 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XBare (dtb_u_u277, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u272) dtb_u_u278)))); B_dData_dPair.f_Pair_second = dtb_u_u278 }))))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u281) -> (if (dtb_u_u281 = "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u272) "module")) (fun (dtb_u_u282 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u282)) (fun (dtb_u_u283 : string) (dtb_u_u284 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_ExportItem_XModule (dtb_u_u283, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u272) dtb_u_u284)))); B_dData_dPair.f_Pair_second = dtb_u_u284 })))))) else ((v_ps0 dtb_u_u272) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem))
  | _ -> ((v_ps0 dtb_u_u272) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExportItem)
)
  | _ -> failwith "DT: impossible branch"
)))

# 277 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItemAt = (fun (dtb_u_u285 : bool) (dtb_u_u286 : Frontend_dParser_dSupport.t_PState) -> (if dtb_u_u285 then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExportItemKind) v_semExportItem) dtb_u_u286) (fun (dtb_u_u287 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseExportItem dtb_u_u287)) (fun (dtb_u_u288 : Frontend_dAst.t_ExportItem) (dtb_u_u289 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExportItemRef { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u287).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u286) dtb_u_u289) }) dtb_u_u288); B_dData_dPair.f_Pair_second = dtb_u_u289 })))))) else (v_parseExportItem dtb_u_u286)))

# 268 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseExportItemsFrom = (fun (dtb_u_u290 : bool) (dtb_u_u291 : int) (dtb_u_u292 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u291 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step ((v_parseExportItemAt dtb_u_u290) dtb_u_u292)) (fun (dtb_u_u293 : Frontend_dAst.t_ExportItem) (dtb_u_u294 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u294) ",") then ((Base_dCommon.v_step (((v_parseExportItemsFrom dtb_u_u290) (dtb_u_u291 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u294))) (fun (dtb_u_u295 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u296 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u293, dtb_u_u295)); B_dData_dPair.f_Pair_second = dtb_u_u296 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u294) ")")) (fun (dtb_u_u297 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u293, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u297 })))))))))

# 262 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportItems = (fun (dtb_u_u298 : bool) (dtb_u_u299 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u299) "(")) (fun (dtb_u_u300 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u300) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u300) })) else (((v_parseExportItemsFrom dtb_u_u298) (Frontend_dParser_dSupport.v_stateFuel dtb_u_u300)) dtb_u_u300)))))

# 251 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDeclBody = (fun (dtb_u_u301 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u301) "module") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u301) "module")) (fun (dtb_u_u302 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u302)) (fun (dtb_u_u303 : string) (dtb_u_u304 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u304) "(") then ((Base_dCommon.v_step ((v_parseExportItems true) dtb_u_u304)) (fun (dtb_u_u305 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u306 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u306) "where")) (fun (dtb_u_u307 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u303; Frontend_dAst.f_ModDecl_modDeclHasExportList = true; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u305; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u301).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u301) dtb_u_u307) } })); B_dData_dPair.f_Pair_second = dtb_u_u307 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u304) "where")) (fun (dtb_u_u308 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u303; Frontend_dAst.f_ModDecl_modDeclHasExportList = false; Frontend_dAst.f_ModDecl_modDeclExportItems = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclReexports = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclOpacity = B_dData_dList.C_List_Nil; Frontend_dAst.f_ModDecl_modDeclRef = { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u301).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u301) dtb_u_u308) } })); B_dData_dPair.f_Pair_second = dtb_u_u308 }))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u301 }))))

# 244 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseModDecl = (fun (dtb_u_u309 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u309) "module") then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstModHeadKind) v_semModHead) dtb_u_u309) (fun (dtb_u_u310 : Frontend_dParser_dSupport.t_PState) -> (v_parseModDeclBody dtb_u_u310))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u309 }))))

# 366 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseReexportTail = (fun (dtb_u_u311 : Frontend_dAst.t_Import) (dtb_u_u312 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u312) "(") then ((Base_dCommon.v_step ((v_parseExportItems false) dtb_u_u312)) (fun (dtb_u_u313 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u314 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u311; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map (v_qualifyExportItem (v_reexportPrefix dtb_u_u311))) dtb_u_u313) }; B_dData_dPair.f_Pair_second = dtb_u_u314 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u312) "(")) (fun (dtb_u_u315 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u311; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = dtb_u_u315 }))))))

# 337 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImportBody = (fun (dtb_u_u316 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u316)) (fun (dtb_u_u317 : string) (dtb_u_u318 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u318) "import") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u318) "import")) (fun (dtb_u_u319 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseImportAfterKeyword (Frontend_dParser_dSupport.v_peekPos dtb_u_u316)) (dtb_u_u316).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u319)) (fun (dtb_u_u320 : Frontend_dAst.t_Import) (dtb_u_u321 : Frontend_dParser_dSupport.t_PState) -> ((v_parseReexportTail dtb_u_u320) dtb_u_u321))))) else ((v_ps0 dtb_u_u318) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))

# 333 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportImport = (fun (dtb_u_u322 : Frontend_dParser_dSupport.t_PState) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstImportKind) v_semReexportImport) dtb_u_u322) (fun (dtb_u_u323 : Frontend_dParser_dSupport.t_PState) -> (v_parseExportImportBody dtb_u_u323))))

# 1031 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOptionalMembers = (fun (dtb_u_u324 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u324) "(") then (v_parseExportMembers dtb_u_u324) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = Frontend_dAst.C_ExportMembers_EMNone; B_dData_dPair.f_Pair_second = dtb_u_u324 }))))

# 1014 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExportMembers = (fun (dtb_u_u325 : Frontend_dParser_dSupport.t_PState) -> (v_parseOptionalMembers dtb_u_u325))

# 1073 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectFixityLevel = (fun (dtb_u_u326 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u327 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u326) in (match dtb_u_u327 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u328; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u329 } -> (match dtb_u_u328 with
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u330) -> (if (if (dtb_u_u330 >= 0) then (dtb_u_u330 <= 9) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u330; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u326) })) else ((v_ps0 dtb_u_u326) Base_dDiagnostics_dFrontend.C_PsDiag_FixityLevelRange))
  | _ -> ((v_ps0 dtb_u_u326) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedFixityLevel)
)
  | _ -> failwith "DT: impossible branch"
)))

# 1081 "Vuna/Compiler/Frontend/Parser.vuna"
let v_expectOpName = (fun (dtb_u_u331 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u332 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u331) in (match dtb_u_u332 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u333; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u334 } -> (match dtb_u_u333 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u335) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u335) then (((v_ps1 dtb_u_u331) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u335; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u331) })))
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u336) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u336) then (((v_ps1 dtb_u_u331) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u336; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u331) })))
  | _ -> (((v_ps1 dtb_u_u331) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("operator"))) "operator")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1044 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDeclBody = (fun (dtb_u_u337 : Frontend_dParser_dSupport.t_PState) (dtb_u_u338 : int) (dtb_u_u339 : int) (dtb_u_u340 : Base_dSource.t_Pos) (dtb_u_u341 : int) -> ((Base_dCommon.v_step (v_expectFixityLevel (Frontend_dParser_dSupport.v_advance dtb_u_u337))) (fun (dtb_u_u342 : int) (dtb_u_u343 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_expectOpName dtb_u_u343)) (fun (dtb_u_u344 : string) (dtb_u_u345 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_FixityDecl_fixityOp = dtb_u_u344; Frontend_dAst.f_FixityDecl_fixityLevel = dtb_u_u342; Frontend_dAst.f_FixityDecl_fixityAssoc = dtb_u_u339; Frontend_dAst.f_FixityDecl_fixityRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u341; Frontend_dAst.f_NodeRef_nodeRefSpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u337)) dtb_u_u340) dtb_u_u345) } }; B_dData_dPair.f_Pair_second = dtb_u_u345 })))))))

# 1036 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityDecl = (fun (dtb_u_u346 : Frontend_dParser_dSupport.t_PState) (dtb_u_u347 : int) (dtb_u_u348 : int) (dtb_u_u349 : Base_dSource.t_Pos) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFixityKind) v_semFixity) dtb_u_u346) (fun (dtb_u_u350 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseFixityDeclBody dtb_u_u350) dtb_u_u347) dtb_u_u348) dtb_u_u349) (dtb_u_u350).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1168 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rejectCtxSuffix = (fun (dtb_u_u351 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u351) "=>") then ((v_ps0 dtb_u_u351) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere) else (Base_dDiag.C_Check_OkC (dtb_u_u351))))

# 1353 "Vuna/Compiler/Frontend/Parser.vuna"
let v_localFunMerge = (fun (dtb_u_u352 : string) (dtb_u_u353 : Frontend_dAst.t_BindingValue) (dtb_u_u354 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u354 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u355, dtb_u_u356) -> (match (dtb_u_u355).Frontend_dAst.f_Binding_bindPat with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u357, dtb_u_u358) -> (if (dtb_u_u357 = dtb_u_u352) then (match (dtb_u_u355).Frontend_dAst.f_Binding_bindValue with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u359) -> (match dtb_u_u353 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u360) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb_u_u357, dtb_u_u358)); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BClauses (((B_dData_dList.v_append dtb_u_u359) dtb_u_u360))); Frontend_dAst.f_Binding_bindSig = (dtb_u_u355).Frontend_dAst.f_Binding_bindSig; Frontend_dAst.f_Binding_bindRef = (dtb_u_u355).Frontend_dAst.f_Binding_bindRef }, dtb_u_u356))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1370 "Vuna/Compiler/Frontend/Parser.vuna"
let v_patBoundName = (fun (dtb_u_u361 : Frontend_dAst.t_Pat) -> (match dtb_u_u361 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u362, dtb_u_u363) -> dtb_u_u362
  | _ -> ""
))

# 1374 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingSigOf = (fun (dtb_u_u364 : string) (dtb_u_u365 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u365 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u366, dtb_u_u367) -> (match dtb_u_u366 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u368; B_dData_dPair.f_Pair_second = dtb_u_u369 } -> (if (dtb_u_u368 = dtb_u_u364) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u369)) else ((v_bindingSigOf dtb_u_u364) dtb_u_u367))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1378 "Vuna/Compiler/Frontend/Parser.vuna"
let v_hasBindingSig = (fun (dtb_u_u370 : string) (dtb_u_u371 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match ((v_bindingSigOf dtb_u_u370) dtb_u_u371) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u372) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1384 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstDanglingSig = (fun (dtb_u_u373 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u374 : string B_dData_dList.t_List) -> (match dtb_u_u373 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u375, dtb_u_u376) -> (match dtb_u_u375 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u377; B_dData_dPair.f_Pair_second = dtb_u_u378 } -> (match dtb_u_u378 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u379; B_dData_dPair.f_Pair_second = dtb_u_u380 } -> (if ((B_dData_dList.v_memName dtb_u_u377) dtb_u_u374) then ((v_firstDanglingSig dtb_u_u376) dtb_u_u374) else (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u377; B_dData_dPair.f_Pair_second = dtb_u_u380 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1314 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_bindingBindsGo = (fun (dtb_u_u381 : t_BindingItem B_dData_dList.t_List) (dtb_u_u382 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u383 : string B_dData_dList.t_List) (dtb_u_u384 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u381 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u385, dtb_u_u386) -> (match dtb_u_u385 with
  | C_BindingItem_BISig (dtb_u_u387, dtb_u_u388, dtb_u_u389) -> (if ((B_dData_dList.v_memName dtb_u_u387) dtb_u_u383) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u389))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigBeforeClause (dtb_u_u387))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u387, B_dData_dVec.C_Vec_Nil)))))) else (if ((v_hasBindingSig dtb_u_u387) dtb_u_u382) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u389))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigDuplicate (dtb_u_u387))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u387, B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb_u_u386) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u387; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u388; B_dData_dPair.f_Pair_second = dtb_u_u389 } }, dtb_u_u382))) dtb_u_u383) dtb_u_u384)))
  | C_BindingItem_BIBind (dtb_u_u390) -> (match (((v_localFunMerge (v_patBoundName (dtb_u_u390).Frontend_dAst.f_Binding_bindPat)) (dtb_u_u390).Frontend_dAst.f_Binding_bindValue) dtb_u_u384) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u391) -> ((((v_bindingBindsGo dtb_u_u386) dtb_u_u382) dtb_u_u383) dtb_u_u391)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u392 = ((v_bindingSigOf (v_patBoundName (dtb_u_u390).Frontend_dAst.f_Binding_bindPat)) dtb_u_u382) in (match dtb_u_u392 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_bindingBindsGo dtb_u_u386) dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb_u_u390).Frontend_dAst.f_Binding_bindPat), dtb_u_u383))) (B_dData_dList.C_List__x58__x58_ (dtb_u_u390, dtb_u_u384)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u393) -> (match dtb_u_u393 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u394; B_dData_dPair.f_Pair_second = dtb_u_u395 } -> (if ((B_dData_dList.v_memName (v_patBoundName (dtb_u_u390).Frontend_dAst.f_Binding_bindPat)) dtb_u_u383) then (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u395))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigMultiClause ((v_patBoundName (dtb_u_u390).Frontend_dAst.f_Binding_bindPat)))) (B_dData_dVec.C_Vec__x58__x58_ ((v_patBoundName (dtb_u_u390).Frontend_dAst.f_Binding_bindPat), B_dData_dVec.C_Vec_Nil)))))) else ((((v_bindingBindsGo dtb_u_u386) dtb_u_u382) (B_dData_dList.C_List__x58__x58_ ((v_patBoundName (dtb_u_u390).Frontend_dAst.f_Binding_bindPat), dtb_u_u383))) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb_u_u390).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = (dtb_u_u390).Frontend_dAst.f_Binding_bindValue; Frontend_dAst.f_Binding_bindSig = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb_u_u394; Frontend_dAst.f_BindingSig_sigRef = dtb_u_u395 })); Frontend_dAst.f_Binding_bindRef = (dtb_u_u390).Frontend_dAst.f_Binding_bindRef }, dtb_u_u384))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u396 = ((v_firstDanglingSig (B_dData_dList.v_reverse dtb_u_u382)) dtb_u_u383) in (match dtb_u_u396 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u397) -> (match dtb_u_u397 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u398; B_dData_dPair.f_Pair_second = dtb_u_u399 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_nodeRefSpan dtb_u_u399))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg (Base_dDiagnostics_dFrontend.C_PsDiag_WhereSigNoDef (dtb_u_u398))) (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u398, B_dData_dVec.C_Vec_Nil))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u384)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

# 1311 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindingItemsToBinds = (fun (dtb_u_u400 : t_BindingItem B_dData_dList.t_List) -> ((((v_bindingBindsGo dtb_u_u400) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 1414 "Vuna/Compiler/Frontend/Parser.vuna"
let v_tierFollows = (fun (dtb_u_u401 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u402 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance dtb_u_u401)) in (match dtb_u_u402 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u403; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u404 } -> (match dtb_u_u403 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u405) -> (if (dtb_u_u405 = "record") then true else (if (dtb_u_u405 = "linear") then (let dtb_u_u406 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u401))) in (match dtb_u_u406 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u407; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u408 } -> (match dtb_u_u407 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u409) -> (if (dtb_u_u409 = "record") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 674 "Vuna/Compiler/Frontend/Parser.vuna"
let v_opacityStart = (fun (dtb_u_u410 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u411 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u410) in (match dtb_u_u411 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u412; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u413 } -> (match dtb_u_u412 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u414) -> (if (dtb_u_u414 = "abstract") then true else false)
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u415) -> (if (dtb_u_u415 = "opaque") then (B_dData_dBool.v_not (v_tierFollows dtb_u_u410)) else (if (dtb_u_u415 = "transparent") then (B_dData_dBool.v_not (v_tierFollows dtb_u_u410)) else false))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1523 "Vuna/Compiler/Frontend/Parser.vuna"
let v_atIdentName = (fun (dtb_u_u416 : Frontend_dParser_dSupport.t_PState) (dtb_u_u417 : string) -> (let dtb_u_u418 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u416) in (match dtb_u_u418 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u419; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u420 } -> (match dtb_u_u419 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u421) -> (dtb_u_u421 = dtb_u_u417)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 405 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseImports = (fun (dtb_u_u422 : int) (dtb_u_u423 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u422 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u423) "import") then ((Base_dCommon.v_step (v_parseImportSpec dtb_u_u423)) (fun (dtb_u_u424 : Frontend_dAst.t_Import) (dtb_u_u425 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (dtb_u_u422 - 1)) dtb_u_u425)) (fun (dtb_u_u426 : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u427 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u426 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u428; B_dData_dPair.f_Pair_second = dtb_u_u429 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u424, dtb_u_u428)); B_dData_dPair.f_Pair_second = dtb_u_u429 }; B_dData_dPair.f_Pair_second = dtb_u_u427 }))
  | _ -> failwith "DT: impossible branch"
))))) else (if (if ((v_atIdentName dtb_u_u423) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance dtb_u_u423)) "import") else false) then ((Base_dCommon.v_step (v_parseExportImport dtb_u_u423)) (fun (dtb_u_u430 : (Frontend_dAst.t_Import, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u431 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u430 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u432; B_dData_dPair.f_Pair_second = dtb_u_u433 } -> ((Base_dCommon.v_step ((v_parseImports (dtb_u_u422 - 1)) dtb_u_u431)) (fun (dtb_u_u434 : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u435 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u434 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u436; B_dData_dPair.f_Pair_second = dtb_u_u437 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u432, dtb_u_u436)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u433) dtb_u_u437) }; B_dData_dPair.f_Pair_second = dtb_u_u435 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if (if ((v_atIdentName dtb_u_u423) "export") then ((Frontend_dParser_dSupport.v_atKw (Frontend_dParser_dSupport.v_advance dtb_u_u423)) "module") else false) then ((Base_dCommon.v_step (v_parseExportNamespace dtb_u_u423)) (fun (dtb_u_u438 : Frontend_dAst.t_ExportItem) (dtb_u_u439 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (dtb_u_u422 - 1)) dtb_u_u439)) (fun (dtb_u_u440 : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u441 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u440 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u442; B_dData_dPair.f_Pair_second = dtb_u_u443 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u442; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u438, dtb_u_u443)) }; B_dData_dPair.f_Pair_second = dtb_u_u441 }))
  | _ -> failwith "DT: impossible branch"
))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = dtb_u_u423 })))))))

# 1547 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDerivingNames = (fun (dtb_u_u444 : int) (dtb_u_u445 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u444 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u445)) (fun (dtb_u_u446 : string) (dtb_u_u447 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u447) ",") then ((Base_dCommon.v_step ((v_parseDerivingNames (dtb_u_u444 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u447))) (fun (dtb_u_u448 : string B_dData_dList.t_List) (dtb_u_u449 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u446, dtb_u_u448)); B_dData_dPair.f_Pair_second = dtb_u_u449 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u447) ")")) (fun (dtb_u_u450 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u446, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u450 })))))))))

# 1541 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDerivingParens = (fun (dtb_u_u451 : bool) (dtb_u_u452 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u452) "(")) (fun (dtb_u_u453 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u453) ")") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u451 }; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u453) })) else ((Base_dCommon.v_step ((v_parseDerivingNames (Frontend_dParser_dSupport.v_stateFuel dtb_u_u453)) dtb_u_u453)) (fun (dtb_u_u454 : string B_dData_dList.t_List) (dtb_u_u455 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u454; B_dData_dPair.f_Pair_second = dtb_u_u451 }; B_dData_dPair.f_Pair_second = dtb_u_u455 }))))))))

# 1531 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeriving = (fun (dtb_u_u456 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u456) "deriving") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u456) "deriving")) (fun (dtb_u_u457 : Frontend_dParser_dSupport.t_PState) -> (if ((v_atIdentName dtb_u_u457) "via") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u457)) (fun (dtb_u_u458 : string) (dtb_u_u459 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u459)) (fun (dtb_u_u460 : string) (dtb_u_u461 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u460 = "field") then ((v_parseDerivingParens true) dtb_u_u461) else (((v_ps1 dtb_u_u459) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("field"))) "field")))))) else ((v_parseDerivingParens false) dtb_u_u457)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = false }; B_dData_dPair.f_Pair_second = dtb_u_u456 }))))

# 1653 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_innermostPiCod = (fun (dtb_u_u462 : Frontend_dAst.t_Expr) -> (match dtb_u_u462 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u463, dtb_u_u464, dtb_u_u465, dtb_u_u466, dtb_u_u467, dtb_u_u468) -> (v_innermostPiCod dtb_u_u467)
  | _ -> dtb_u_u462
))

# 1657 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_replacePiCod = (fun (dtb_u_u469 : Frontend_dAst.t_Expr) (dtb_u_u470 : Frontend_dAst.t_Expr) -> (match dtb_u_u469 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u471, dtb_u_u472, dtb_u_u473, dtb_u_u474, dtb_u_u475, dtb_u_u476) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u471, dtb_u_u472, dtb_u_u473, dtb_u_u474, ((v_replacePiCod dtb_u_u475) dtb_u_u470), dtb_u_u476))
  | _ -> dtb_u_u470
))

# 1648 "Vuna/Compiler/Frontend/Parser.vuna"
let v_ctxThenSplit = (fun (dtb_u_u477 : Frontend_dAst.t_Expr) (dtb_u_u478 : Frontend_dAst.t_Expr) -> (match dtb_u_u477 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u479, dtb_u_u480, dtb_u_u481, dtb_u_u482, dtb_u_u483, dtb_u_u484) -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_innermostPiCod (Frontend_dAst.C_Expr_EPi (dtb_u_u479, dtb_u_u480, dtb_u_u481, dtb_u_u482, dtb_u_u483, dtb_u_u484))), B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = ((v_replacePiCod (Frontend_dAst.C_Expr_EPi (dtb_u_u479, dtb_u_u480, dtb_u_u481, dtb_u_u482, dtb_u_u483, dtb_u_u484))) dtb_u_u478) }
  | _ -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u477, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u478 }
))

# 1714 "Vuna/Compiler/Frontend/Parser.vuna"
let v_instanceMethodStart = (fun (dtb_u_u485 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u486 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u485) in (match dtb_u_u486 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u487; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u488 } -> (match dtb_u_u487 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u489) -> (if (dtb_u_u489 = "(") then (let dtb_u_u490 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u485) 1) in (match dtb_u_u490 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u491) -> (match dtb_u_u491 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u492; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u493 } -> (match dtb_u_u492 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u494) -> (let dtb_u_u495 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u485) 2) in (match dtb_u_u495 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u496) -> (match dtb_u_u496 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u497; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u498 } -> (match dtb_u_u497 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u499) -> (if (dtb_u_u499 = ")") then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u494)) else false)
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
)) else (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u489)))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u500) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1728 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseParams = (fun (dtb_u_u501 : int) (dtb_u_u502 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u501 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u503 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u502) in (match dtb_u_u503 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u504; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u505 } -> (match dtb_u_u504 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u506) -> ((Base_dCommon.v_step ((v_parseParams (dtb_u_u501 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u502))) (fun (dtb_u_u507 : string B_dData_dList.t_List) (dtb_u_u508 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u506, dtb_u_u507)); B_dData_dPair.f_Pair_second = dtb_u_u508 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u502 }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 1879 "Vuna/Compiler/Frontend/Parser.vuna"
let v_spanFromExpr = (fun (dtb_u_u509 : Frontend_dAst.t_Expr) (dtb_u_u510 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u511 = (Frontend_dAst.v_exprSpan dtb_u_u509) in (let dtb_u_u512 = (Frontend_dParser_dSupport.v_lastPos dtb_u_u510) in { Base_dSource.f_Span_spanFile = (dtb_u_u511).Base_dSource.f_Span_spanFile; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine dtb_u_u511); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_spanStartCol dtb_u_u511); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u512); Base_dSource.f_Span_spanEndCol = (Frontend_dParser_dSupport.v_lastEndCol dtb_u_u512); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_spanStartOffset dtb_u_u511); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset dtb_u_u512) })))

# 1914 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldSuffix = (fun (dtb_u_u513 : int) (dtb_u_u514 : Frontend_dParser_dSupport.t_PState) (dtb_u_u515 : int) (dtb_u_u516 : Frontend_dAst.t_Expr) -> (if (dtb_u_u513 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u514) ".") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u514) ".")) (fun (dtb_u_u517 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u517)) (fun (dtb_u_u518 : string) (dtb_u_u519 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (dtb_u_u513 - 1)) dtb_u_u519) dtb_u_u515) (Frontend_dAst.C_Expr_EField (dtb_u_u516, dtb_u_u518, (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr dtb_u_u516) dtb_u_u519))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u516; B_dData_dPair.f_Pair_second = dtb_u_u514 })))))

# 1928 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroBangAt = (fun (dtb_u_u520 : Frontend_dParser_dSupport.t_PState) (dtb_u_u521 : Base_dSource.t_Pos) (dtb_u_u522 : string) -> (let dtb_u_u523 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u520) in (match dtb_u_u523 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u524; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u525 } -> (match dtb_u_u524 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u526) -> (if (dtb_u_u526 = "!") then (if ((Base_dSource.v_posLine dtb_u_u525) = (Base_dSource.v_posLine dtb_u_u521)) then ((Base_dSource.v_posCol dtb_u_u525) = ((Base_dSource.v_posCol dtb_u_u521) + (String.length dtb_u_u522))) else false) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 1935 "Vuna/Compiler/Frontend/Parser.vuna"
let v_macroAtom = (fun (dtb_u_u527 : string) (dtb_u_u528 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u529 : Base_dSource.t_Span) (dtb_u_u530 : Base_dSource.t_Span) -> (match dtb_u_u528 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (dtb_u_u527))), (Frontend_dAst.v_detachedNodeRef dtb_u_u530)))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsMacro (dtb_u_u527))), (Frontend_dAst.v_detachedNodeRef dtb_u_u530))), dtb_u_u528, (Frontend_dAst.v_detachedNodeRef dtb_u_u529)))
))

# 2042 "Vuna/Compiler/Frontend/Parser.vuna"
let v_holeSpan = (fun (dtb_u_u531 : string) (dtb_u_u532 : Base_dSource.t_Pos) -> (match dtb_u_u532 with
  | { Base_dSource.f_Pos_posLine = dtb_u_u533; Base_dSource.f_Pos_posCol = dtb_u_u534; Base_dSource.f_Pos_posOffset = dtb_u_u535; Base_dSource.f_Pos_posEndOffset = dtb_u_u536 } -> { Base_dSource.f_Span_spanFile = dtb_u_u531; Base_dSource.f_Span_spanStartLine = dtb_u_u533; Base_dSource.f_Span_spanStartCol = dtb_u_u534; Base_dSource.f_Span_spanEndLine = dtb_u_u533; Base_dSource.f_Span_spanEndCol = dtb_u_u534; Base_dSource.f_Span_spanStartOffset = dtb_u_u535; Base_dSource.f_Span_spanEndOffset = dtb_u_u535 }
  | _ -> failwith "DT: impossible branch"
))

# 2046 "Vuna/Compiler/Frontend/Parser.vuna"
let v_toksFuel = (fun (dtb_u_u537 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((128 * (B_dData_dList.v_length dtb_u_u537)) + 1024))

# 2050 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_textPartsOf = (fun (dtb_u_u538 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (match dtb_u_u538 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u539, dtb_u_u540) -> (match dtb_u_u539 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb_u_u541) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_TmplPart_TPText (dtb_u_u542) -> (match (v_textPartsOf dtb_u_u540) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u543) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u542 ^ dtb_u_u543)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (""))
  | _ -> failwith "DT: impossible branch"
))

# 2085 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairExprs = (fun (dtb_u_u544 : Frontend_dAst.t_NodeRef) (dtb_u_u545 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u545 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u546, dtb_u_u547) -> (match dtb_u_u547 with
  | B_dData_dList.C_List_Nil -> dtb_u_u546
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTuplePair), dtb_u_u544)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u546, (B_dData_dList.C_List__x58__x58_ (((v_foldPairExprs dtb_u_u544) dtb_u_u547), B_dData_dList.C_List_Nil)))), dtb_u_u544))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), dtb_u_u544))
  | _ -> failwith "DT: impossible branch"
))

# 2122 "Vuna/Compiler/Frontend/Parser.vuna"
let v_sectionLeftExpr = (fun (dtb_u_u548 : string) (dtb_u_u549 : Frontend_dAst.t_Expr) (dtb_u_u550 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u550) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u548, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u550)))), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u550)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u549, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u550)))), dtb_u_u550)))

# 2129 "Vuna/Compiler/Frontend/Parser.vuna"
let v_sectionRightExpr = (fun (dtb_u_u551 : string) (dtb_u_u552 : Frontend_dAst.t_Expr) (dtb_u_u553 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_sectionBinderName; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u553) }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u551, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u553)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u552, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_sectionBinderName, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u553)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u553)))), dtb_u_u553)))

# 2160 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePiNamesRest = (fun (dtb_u_u554 : int) (dtb_u_u555 : Frontend_dParser_dSupport.t_PState) (dtb_u_u556 : string B_dData_dList.t_List) -> (if (dtb_u_u554 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u557 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u555) in (match dtb_u_u557 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u558; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u559 } -> (match dtb_u_u558 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u560) -> (((v_parsePiNamesRest (dtb_u_u554 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u555)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u560, dtb_u_u556)))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u556); B_dData_dPair.f_Pair_second = dtb_u_u555 }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 2151 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsePiNames = (fun (dtb_u_u561 : int) (dtb_u_u562 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u561 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u562)) (fun (dtb_u_u563 : string) (dtb_u_u564 : Frontend_dParser_dSupport.t_PState) -> (((v_parsePiNamesRest (dtb_u_u561 - 1)) dtb_u_u564) (B_dData_dList.C_List__x58__x58_ (dtb_u_u563, B_dData_dList.C_List_Nil)))))))

# 2170 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPiNames = (fun (dtb_u_u565 : string B_dData_dList.t_List) (dtb_u_u566 : bool) (dtb_u_u567 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dtb_u_u568 : Frontend_dAst.t_Expr) (dtb_u_u569 : Frontend_dAst.t_Expr) (dtb_u_u570 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u565 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u571, dtb_u_u572) -> (Frontend_dAst.C_Expr_EPi (dtb_u_u571, dtb_u_u566, dtb_u_u567, dtb_u_u568, ((((((v_foldPiNames dtb_u_u572) dtb_u_u566) dtb_u_u567) dtb_u_u568) dtb_u_u569) dtb_u_u570), dtb_u_u570))
  | B_dData_dList.C_List_Nil -> dtb_u_u569
  | _ -> failwith "DT: impossible branch"
))

# 2175 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_anyDottedName = (fun (dtb_u_u573 : string B_dData_dList.t_List) -> (match dtb_u_u573 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u574, dtb_u_u575) -> (if (Base_dSource.v_containsDot dtb_u_u574) then true else (v_anyDottedName dtb_u_u575))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2180 "Vuna/Compiler/Frontend/Parser.vuna"
let v_consumeQty = (fun (dtb_u_u576 : Frontend_dParser_dSupport.t_PState) (dtb_u_u577 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) -> (match dtb_u_u577 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u578) -> (let dtb_u_u579 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u576) in (match dtb_u_u579 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u580; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u581 } -> (match dtb_u_u580 with
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u582) -> (if (dtb_u_u582 = 0) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance dtb_u_u576))) else (if (dtb_u_u582 = 1) then (Base_dDiag.C_Check_OkC ((Frontend_dParser_dSupport.v_advance dtb_u_u576))) else ((v_ps0 dtb_u_u576) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)))
  | _ -> ((v_ps0 dtb_u_u576) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u576))
  | _ -> failwith "DT: impossible branch"
))

# 2241 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldCons = (fun (dtb_u_u583 : Frontend_dAst.t_NodeRef) (dtb_u_u584 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u584 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u585, dtb_u_u586) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListCons), dtb_u_u583)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u585, (B_dData_dList.C_List__x58__x58_ (((v_foldCons dtb_u_u583) dtb_u_u586), B_dData_dList.C_List_Nil)))), dtb_u_u583))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), dtb_u_u583))
  | _ -> failwith "DT: impossible branch"
))

# 2255 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLambdaParam = (fun (dtb_u_u587 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u587)) (fun (dtb_u_u588 : string) (dtb_u_u589 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u588; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_tokenSpan dtb_u_u587) }; B_dData_dPair.f_Pair_second = dtb_u_u589 })))))

# 2259 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseLambdaParams = (fun (dtb_u_u590 : int) (dtb_u_u591 : Frontend_dParser_dSupport.t_PState) (dtb_u_u592 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u590 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u591) ",") then ((Base_dCommon.v_step (v_parseLambdaParam (Frontend_dParser_dSupport.v_advance dtb_u_u591))) (fun (dtb_u_u593 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (dtb_u_u594 : Frontend_dParser_dSupport.t_PState) -> (((v_parseLambdaParams (dtb_u_u590 - 1)) dtb_u_u594) ((B_dData_dList.v_append dtb_u_u592) (B_dData_dList.C_List__x58__x58_ (dtb_u_u593, B_dData_dList.C_List_Nil)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u592; B_dData_dPair.f_Pair_second = dtb_u_u591 })))))

# 2350 "Vuna/Compiler/Frontend/Parser.vuna"
let v_rowAtNameExpr = (fun (dtb_u_u595 : Frontend_dAst.t_Expr) -> (match dtb_u_u595 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u596, dtb_u_u597) -> (Frontend_dAst.C_Expr_EStr (dtb_u_u596, dtb_u_u597))
  | _ -> dtb_u_u595
))

# 2439 "Vuna/Compiler/Frontend/Parser.vuna"
let v_isReturnClauseHead = (fun (dtb_u_u598 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u599 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u598) in (match dtb_u_u599 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u600; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u601 } -> (match dtb_u_u600 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u602) -> (dtb_u_u602 = "return")
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 2533 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpKName = (fun (dtb_u_u603 : t_HandleOp) -> (match dtb_u_u603 with
  | C_HandleOp_HandleOp (dtb_u_u604, dtb_u_u605, dtb_u_u606, dtb_u_u607, dtb_u_u608, dtb_u_u609) -> dtb_u_u608
  | _ -> failwith "DT: impossible branch"
))

# 2537 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstOtherKName = (fun (dtb_u_u610 : t_HandleOp B_dData_dList.t_List) (dtb_u_u611 : string) -> (match dtb_u_u610 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u612, dtb_u_u613) -> (let dtb_u_u614 = (v_handleOpKName dtb_u_u612) in (if (dtb_u_u614 = dtb_u_u611) then ((v_firstOtherKName dtb_u_u613) dtb_u_u611) else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u614))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2545 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleAlt = (fun (dtb_u_u615 : t_HandleOp) -> (match dtb_u_u615 with
  | C_HandleOp_HandleOp (dtb_u_u616, dtb_u_u617, dtb_u_u618, dtb_u_u619, dtb_u_u620, dtb_u_u621) -> { Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (dtb_u_u616, dtb_u_u617, dtb_u_u618)); Frontend_dAst.f_Alt_altBody = dtb_u_u621; Frontend_dAst.f_Alt_altRef = dtb_u_u619 }
  | _ -> failwith "DT: impossible branch"
))

# 216 "Vuna/Compiler/Frontend/Parser.vuna"
let v_semHandleOp = (fun (dtb_u_u622 : t_HandleOp) -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dCst.C_CstSem_SemAlt ((v_handleAlt dtb_u_u622))))))

# 2549 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleRetExpr = (fun (dtb_u_u623 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u624 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u623 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u625) -> (match dtb_u_u625 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u626; B_dData_dPair.f_Pair_second = dtb_u_u627 } -> (match dtb_u_u627 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u628; B_dData_dPair.f_Pair_second = dtb_u_u629 } -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u626; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u629) }, B_dData_dList.C_List_Nil)), dtb_u_u628, dtb_u_u629))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsHandleNoRet), dtb_u_u624))
  | _ -> failwith "DT: impossible branch"
))

# 2554 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleOpLam = (fun (dtb_u_u630 : t_HandleOp B_dData_dList.t_List) (dtb_u_u631 : string) (dtb_u_u632 : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleOpIndexBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_handleOpBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u631; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)))))), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_handleOpBinderName, dtb_u_u632)), ((B_dData_dList.v_map v_handleAlt) dtb_u_u630), dtb_u_u632)), dtb_u_u632)))

# 2562 "Vuna/Compiler/Frontend/Parser.vuna"
let v_handleExpr = (fun (dtb_u_u633 : Frontend_dAst.t_Expr) (dtb_u_u634 : t_HandleBlock) (dtb_u_u635 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u634 with
  | C_HandleBlock_HandleBlock (dtb_u_u636, dtb_u_u637) -> (match dtb_u_u637 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u638, dtb_u_u639) -> (match ((v_firstOtherKName dtb_u_u639) (v_handleOpKName dtb_u_u638)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsHandle), dtb_u_u635)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u633, (B_dData_dList.C_List__x58__x58_ (((v_handleRetExpr dtb_u_u636) dtb_u_u635), (B_dData_dList.C_List__x58__x58_ ((((v_handleOpLam (B_dData_dList.C_List__x58__x58_ (dtb_u_u638, dtb_u_u639))) (v_handleOpKName dtb_u_u638)) dtb_u_u635), B_dData_dList.C_List_Nil)))))), dtb_u_u635))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u640) -> (((Base_dDiagnostics_dFrontend.v_psErrAt (Frontend_dAst.v_nodeRefSpan dtb_u_u635)) (Base_dDiagnostics_dFrontend.C_PsDiag_HandleContinuationNameMismatch ((v_handleOpKName dtb_u_u638), dtb_u_u640))) (B_dData_dVec.C_Vec__x58__x58_ ((v_handleOpKName dtb_u_u638), (B_dData_dVec.C_Vec__x58__x58_ (dtb_u_u640, B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb_u_u635)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 2636 "Vuna/Compiler/Frontend/Parser.vuna"
let v_bindArrowTok = (fun (dtb_u_u641 : Frontend_dLexer.t_PTok) -> (match dtb_u_u641 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u642; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u643 } -> (match dtb_u_u642 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u644) -> (if (dtb_u_u644 = "<-") then (B_dData_dMaybe.C_Maybe_Just (true)) else (if (dtb_u_u644 = "@") then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u644 = "::") then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u644 = ",") then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (false))))))
  | Frontend_dLexer.C_Tok_TTmpl (dtb_u_u645, dtb_u_u646, dtb_u_u647) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u648) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TFloat (dtb_u_u649) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u650) -> B_dData_dMaybe.C_Maybe_Nothing
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u651) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just (false))
)
  | _ -> failwith "DT: impossible branch"
))

# 2650 "Vuna/Compiler/Frontend/Parser.vuna"
let v_doStmtBindsAhead = (fun (dtb_u_u652 : Frontend_dParser_dSupport.t_PState) (dtb_u_u653 : int) -> (((Frontend_dParser_dSupport.v_scanDoStmtLevel dtb_u_u652) dtb_u_u653) v_bindArrowTok))

# 2702 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_patBinderBindings = (fun (dtb_u_u654 : Frontend_dAst.t_Pat) -> (match dtb_u_u654 with
  | Frontend_dAst.C_Pat_PStr (dtb_u_u655, dtb_u_u656) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb_u_u657, dtb_u_u658) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PWild (dtb_u_u659) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u660, dtb_u_u661, dtb_u_u662) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u663 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patBinderBindings (B_dData_dPair.v_secondOf dtb_u_u663)))) dtb_u_u661)
  | Frontend_dAst.C_Pat_PCon (dtb_u_u664, dtb_u_u665, dtb_u_u666) -> ((B_dData_dList.v_concatMap v_patBinderBindings) dtb_u_u665)
  | Frontend_dAst.C_Pat_PAs (dtb_u_u667, dtb_u_u668, dtb_u_u669) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u667; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u669) }, (v_patBinderBindings dtb_u_u668)))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u670, dtb_u_u671) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u670; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_nodeRefSpan dtb_u_u671) }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 2716 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_firstRepeatedBindingGo = (fun (dtb_u_u672 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u673 : string B_dData_dList.t_List) -> (match dtb_u_u672 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u674, dtb_u_u675) -> (match dtb_u_u674 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u676; B_dData_dPair.f_Pair_second = dtb_u_u677 } -> (if ((B_dData_dList.v_memName dtb_u_u676) dtb_u_u673) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u676; B_dData_dPair.f_Pair_second = dtb_u_u677 })) else ((v_firstRepeatedBindingGo dtb_u_u675) (B_dData_dList.C_List__x58__x58_ (dtb_u_u676, dtb_u_u673))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 2712 "Vuna/Compiler/Frontend/Parser.vuna"
let v_firstRepeatedBinding = (fun (dtb_u_u678 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_firstRepeatedBindingGo dtb_u_u678) B_dData_dList.C_List_Nil))

# 2731 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkNoRepeatedBinders = (fun (dtb_u_u679 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (let dtb_u_u680 = (v_firstRepeatedBinding ((B_dData_dList.v_concatMap v_patBinderBindings) dtb_u_u679)) in (match dtb_u_u680 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u681) -> (match dtb_u_u681 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u682; B_dData_dPair.f_Pair_second = dtb_u_u683 } -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u683)); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiag.v_appendMessage (String.concat "" [" (repeated name: `"; dtb_u_u682; "`)"])) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_RepeatedPatternBinder) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u679))
  | _ -> failwith "DT: impossible branch"
)))

# 2725 "Vuna/Compiler/Frontend/Parser.vuna"
let v_checkBindersAt = (fun (dtb_u_u684 : Frontend_dParser_dSupport.t_PState) (dtb_u_u685 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match (Frontend_dParser_dSupport.v_pmodeOf dtb_u_u684) with
  | Frontend_dParser_dSupport.C_ParseMode_PmTool -> (Base_dDiag.C_Check_OkC (dtb_u_u685))
  | Frontend_dParser_dSupport.C_ParseMode_PmStrict -> (v_checkNoRepeatedBinders dtb_u_u685)
  | _ -> failwith "DT: impossible branch"
))

# 2850 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAsName = (fun (dtb_u_u686 : int) (dtb_u_u687 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u686 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u688 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u687) in (match dtb_u_u688 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u689; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u690 } -> (match dtb_u_u689 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u691) -> (if (dtb_u_u691 = "_") then ((v_ps0 dtb_u_u687) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u691; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u687) })))
  | _ -> ((v_ps0 dtb_u_u687) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))

# 2907 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPCon = (fun (dtb_u_u692 : Frontend_dAst.t_NodeRef) (dtb_u_u693 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u693 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u694, dtb_u_u695) -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListCons), (B_dData_dList.C_List__x58__x58_ (dtb_u_u694, (B_dData_dList.C_List__x58__x58_ (((v_foldPCon dtb_u_u692) dtb_u_u695), B_dData_dList.C_List_Nil)))), dtb_u_u692))
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), B_dData_dList.C_List_Nil, dtb_u_u692))
  | _ -> failwith "DT: impossible branch"
))

# 2922 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_foldPairPats = (fun (dtb_u_u696 : Frontend_dAst.t_NodeRef) (dtb_u_u697 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u697 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u698, dtb_u_u699) -> (match dtb_u_u699 with
  | B_dData_dList.C_List_Nil -> dtb_u_u698
  | _ -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTuplePair), (B_dData_dList.C_List__x58__x58_ (dtb_u_u698, (B_dData_dList.C_List__x58__x58_ (((v_foldPairPats dtb_u_u696) dtb_u_u699), B_dData_dList.C_List_Nil)))), dtb_u_u696))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), B_dData_dList.C_List_Nil, dtb_u_u696))
  | _ -> failwith "DT: impossible branch"
))

# 2740 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parsePatternSingle = (fun (dtb_u_u700 : int) (dtb_u_u701 : Frontend_dParser_dSupport.t_PState) (dtb_u_u702 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstPatKind) v_semPat) dtb_u_u701) (fun (dtb_u_u703 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingleBody dtb_u_u700) dtb_u_u703) dtb_u_u702)) (fun (dtb_u_u704 : Frontend_dAst.t_Pat) (dtb_u_u705 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withPatId (dtb_u_u703).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u704); B_dData_dPair.f_Pair_second = dtb_u_u705 })))))))
# 2748 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternSingleBody = (fun (dtb_u_u706 : int) (dtb_u_u707 : Frontend_dParser_dSupport.t_PState) (dtb_u_u708 : int) -> (if (dtb_u_u706 <= 0) then (Base_dDiag.v_icFuel "parser") else (((v_parsePatternCons (dtb_u_u706 - 1)) dtb_u_u707) dtb_u_u708)))
# 2753 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternCons = (fun (dtb_u_u709 : int) (dtb_u_u710 : Frontend_dParser_dSupport.t_PState) (dtb_u_u711 : int) -> (if (dtb_u_u709 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternHead (dtb_u_u709 - 1)) dtb_u_u710) dtb_u_u711)) (fun (dtb_u_u712 : Frontend_dAst.t_Pat) (dtb_u_u713 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u713) "::") then ((Frontend_dParser_dSupport.v_canContinue dtb_u_u713) dtb_u_u711) else false) then ((Base_dCommon.v_step (((v_parsePatternCons (dtb_u_u709 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u713)) dtb_u_u711)) (fun (dtb_u_u714 : Frontend_dAst.t_Pat) (dtb_u_u715 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ("::", (B_dData_dList.C_List__x58__x58_ (dtb_u_u712, (B_dData_dList.C_List__x58__x58_ (dtb_u_u714, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u710) dtb_u_u715)))); B_dData_dPair.f_Pair_second = dtb_u_u715 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u712; B_dData_dPair.f_Pair_second = dtb_u_u713 })))))))
# 2762 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternHead = (fun (dtb_u_u716 : int) (dtb_u_u717 : Frontend_dParser_dSupport.t_PState) (dtb_u_u718 : int) -> (if (dtb_u_u716 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u719 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u717) in (match dtb_u_u719 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u720; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u721 } -> (match dtb_u_u720 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u722) -> (if (dtb_u_u722 = "(") then (let dtb_u_u723 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u717) 1) in (match dtb_u_u723 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u724) -> (match dtb_u_u724 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u725; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u726 } -> (match dtb_u_u725 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u727) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u727) then (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718) else (let dtb_u_u728 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u717) 2) in (match dtb_u_u728 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u729) -> (match dtb_u_u729 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u730; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u731 } -> (match dtb_u_u730 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u732) -> (if (dtb_u_u732 = ")") then ((Base_dCommon.v_step (((v_parsePatternAtoms (dtb_u_u716 - 1)) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u717)))) dtb_u_u718)) (fun (dtb_u_u733 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u734 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u727, dtb_u_u733, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u717) dtb_u_u734)))); B_dData_dPair.f_Pair_second = dtb_u_u734 })))) else (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718))
  | _ -> (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718)
)))
  | _ -> (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718)
)) else (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u735) -> (let dtb_u_u736 = (Frontend_dParser_dSupport.v_advance dtb_u_u717) in (if (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb_u_u735) then ((Frontend_dParser_dSupport.v_atSym dtb_u_u736) "{") else false) then ((Base_dCommon.v_step (((v_parseRecordPatternFields (dtb_u_u716 - 1)) dtb_u_u736) dtb_u_u718)) (fun (dtb_u_u737 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u738 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb_u_u735, dtb_u_u737, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u717) dtb_u_u738)))); B_dData_dPair.f_Pair_second = dtb_u_u738 })))) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb_u_u735) then ((Base_dCommon.v_step (((v_parsePatternAtoms (dtb_u_u716 - 1)) dtb_u_u736) dtb_u_u718)) (fun (dtb_u_u739 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u740 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u735, dtb_u_u739, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u717) dtb_u_u740)))); B_dData_dPair.f_Pair_second = dtb_u_u740 })))) else (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718))))
  | _ -> (((v_parsePatternAtom (dtb_u_u716 - 1)) dtb_u_u717) dtb_u_u718)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2785 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternFields = (fun (dtb_u_u741 : int) (dtb_u_u742 : Frontend_dParser_dSupport.t_PState) (dtb_u_u743 : int) -> (if (dtb_u_u741 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u742) "{")) (fun (dtb_u_u744 : Frontend_dParser_dSupport.t_PState) -> (((v_parseRecordPatternList (dtb_u_u741 - 1)) dtb_u_u744) dtb_u_u743)))))
# 2794 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternList = (fun (dtb_u_u745 : int) (dtb_u_u746 : Frontend_dParser_dSupport.t_PState) (dtb_u_u747 : int) -> (if (dtb_u_u745 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u746) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u746) })) else ((Base_dCommon.v_step (((v_parseRecordPatternField (dtb_u_u745 - 1)) dtb_u_u746) dtb_u_u747)) (fun (dtb_u_u748 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) (dtb_u_u749 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u749) ",") then ((Base_dCommon.v_step (((v_parseRecordPatternList (dtb_u_u745 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u749)) dtb_u_u747)) (fun (dtb_u_u750 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u751 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u748, dtb_u_u750)); B_dData_dPair.f_Pair_second = dtb_u_u751 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u749) "}")) (fun (dtb_u_u752 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u748, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u752 }))))))))))
# 2805 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordPatternField = (fun (dtb_u_u753 : int) (dtb_u_u754 : Frontend_dParser_dSupport.t_PState) (dtb_u_u755 : int) -> (if (dtb_u_u753 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u756 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u754) in (match dtb_u_u756 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u757; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u758 } -> (match dtb_u_u757 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u759) -> (let dtb_u_u760 = (Frontend_dParser_dSupport.v_advance dtb_u_u754) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u760) "=") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u760) "=")) (fun (dtb_u_u761 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternSingle (dtb_u_u753 - 1)) dtb_u_u761) dtb_u_u755)) (fun (dtb_u_u762 : Frontend_dAst.t_Pat) (dtb_u_u763 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u759; B_dData_dPair.f_Pair_second = dtb_u_u762 }; B_dData_dPair.f_Pair_second = dtb_u_u763 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u759; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Pat_PVar (dtb_u_u759, (Frontend_dAst.v_detachedNodeRef { Base_dSource.f_Span_spanFile = (Frontend_dParser_dSupport.v_fileOf dtb_u_u754); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u758); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u758); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u758); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb_u_u758); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u758); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb_u_u758) }))) }; B_dData_dPair.f_Pair_second = dtb_u_u760 }))))
  | _ -> ((v_ps0 dtb_u_u754) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedRecordFieldPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2817 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtoms = (fun (dtb_u_u764 : int) (dtb_u_u765 : Frontend_dParser_dSupport.t_PState) (dtb_u_u766 : int) -> (if (dtb_u_u764 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom dtb_u_u765) then ((Frontend_dParser_dSupport.v_canContinue dtb_u_u765) dtb_u_u766) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (dtb_u_u764 - 1)) dtb_u_u765) dtb_u_u766)) (fun (dtb_u_u767 : Frontend_dAst.t_Pat) (dtb_u_u768 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parsePatternAtoms (dtb_u_u764 - 1)) dtb_u_u768) dtb_u_u766)) (fun (dtb_u_u769 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u770 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u767, dtb_u_u769)); B_dData_dPair.f_Pair_second = dtb_u_u770 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u765 })))))
# 2828 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtom = (fun (dtb_u_u771 : int) (dtb_u_u772 : Frontend_dParser_dSupport.t_PState) (dtb_u_u773 : int) -> (if (dtb_u_u771 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternAtomBase (dtb_u_u771 - 1)) dtb_u_u772) dtb_u_u773)) (fun (dtb_u_u774 : Frontend_dAst.t_Pat) (dtb_u_u775 : Frontend_dParser_dSupport.t_PState) -> (((((v_finishAsPattern (dtb_u_u771 - 1)) dtb_u_u772) dtb_u_u774) dtb_u_u775) dtb_u_u773)))))
# 2838 "Vuna/Compiler/Frontend/Parser.vuna"
and v_finishAsPattern = (fun (dtb_u_u776 : int) (dtb_u_u777 : Frontend_dParser_dSupport.t_PState) (dtb_u_u778 : Frontend_dAst.t_Pat) (dtb_u_u779 : Frontend_dParser_dSupport.t_PState) (dtb_u_u780 : int) -> (if (dtb_u_u776 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u779) "@") then ((Frontend_dParser_dSupport.v_canContinue dtb_u_u779) dtb_u_u780) else false) then (let dtb_u_u781 = dtb_u_u778 in (match dtb_u_u781 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u782, dtb_u_u783) -> (if (dtb_u_u782 = "_") then ((Base_dCommon.v_step ((v_parseAsName (dtb_u_u776 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u779))) (fun (dtb_u_u784 : string) (dtb_u_u785 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb_u_u784, (Frontend_dAst.C_Pat_PWild (dtb_u_u783)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u777) dtb_u_u785)))); B_dData_dPair.f_Pair_second = dtb_u_u785 })))) else ((Base_dCommon.v_step (((v_parsePatternAtom (dtb_u_u776 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u779)) dtb_u_u780)) (fun (dtb_u_u786 : Frontend_dAst.t_Pat) (dtb_u_u787 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb_u_u782, dtb_u_u786, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u777) dtb_u_u787)))); B_dData_dPair.f_Pair_second = dtb_u_u787 })))))
  | _ -> ((Base_dCommon.v_step ((v_parseAsName (dtb_u_u776 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u779))) (fun (dtb_u_u788 : string) (dtb_u_u789 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb_u_u788, dtb_u_u778, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u777) dtb_u_u789)))); B_dData_dPair.f_Pair_second = dtb_u_u789 }))))
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u778; B_dData_dPair.f_Pair_second = dtb_u_u779 })))))
# 2859 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternAtomBase = (fun (dtb_u_u790 : int) (dtb_u_u791 : Frontend_dParser_dSupport.t_PState) (dtb_u_u792 : int) -> (if (dtb_u_u790 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u793 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u791) in (match dtb_u_u793 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u794; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u795 } -> (match dtb_u_u794 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u796) -> (if (dtb_u_u796 = "(") then (if ((Frontend_dParser_dSupport.v_atSym (Frontend_dParser_dSupport.v_advance dtb_u_u791)) ")") then (let dtb_u_u797 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u791)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) dtb_u_u797)))); B_dData_dPair.f_Pair_second = dtb_u_u797 }))) else ((Base_dCommon.v_step (((v_parsePatternSingle (dtb_u_u790 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u791)) dtb_u_u792)) (fun (dtb_u_u798 : Frontend_dAst.t_Pat) (dtb_u_u799 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u799) ",") then ((Base_dCommon.v_step ((((v_parsePatternTupleRest (dtb_u_u790 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u799)) dtb_u_u792) (B_dData_dList.C_List__x58__x58_ (dtb_u_u798, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u800 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u801 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairPats (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) dtb_u_u801))) dtb_u_u800); B_dData_dPair.f_Pair_second = dtb_u_u801 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u799) ")")) (fun (dtb_u_u802 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u798; B_dData_dPair.f_Pair_second = dtb_u_u802 })))))))) else (if (dtb_u_u796 = "[") then (((v_parseListPattern (dtb_u_u790 - 1)) dtb_u_u791) dtb_u_u792) else ((v_ps0 dtb_u_u791) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)))
  | Frontend_dLexer.C_Tok_TTmpl (dtb_u_u803, dtb_u_u804, dtb_u_u805) -> (match (v_textPartsOf dtb_u_u804) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u806) -> (let dtb_u_u807 = (Frontend_dParser_dSupport.v_advance dtb_u_u791) in (let dtb_u_u808 = ((Frontend_dParser_dSupport.v_withLastPos dtb_u_u805) dtb_u_u807) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb_u_u806, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) dtb_u_u808)))); B_dData_dPair.f_Pair_second = dtb_u_u808 }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 dtb_u_u791) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateInPattern)
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u809) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb_u_u809, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) (Frontend_dParser_dSupport.v_advance dtb_u_u791))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u791) }))
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u810) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb_u_u810, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) (Frontend_dParser_dSupport.v_advance dtb_u_u791))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u791) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u811) -> (if (dtb_u_u811 = "_") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild ((Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) (Frontend_dParser_dSupport.v_advance dtb_u_u791))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u791) })) else (if (Frontend_dParser_dSupport.v_ctorPatternStart dtb_u_u811) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u811, B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) (Frontend_dParser_dSupport.v_advance dtb_u_u791))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u791) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb_u_u811, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u791) (Frontend_dParser_dSupport.v_advance dtb_u_u791))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u791) }))))
  | _ -> ((v_ps0 dtb_u_u791) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedPattern)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2888 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPattern = (fun (dtb_u_u812 : int) (dtb_u_u813 : Frontend_dParser_dSupport.t_PState) (dtb_u_u814 : int) -> (if (dtb_u_u812 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u813) "[")) (fun (dtb_u_u815 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u815) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), B_dData_dList.C_List_Nil, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u813) (Frontend_dParser_dSupport.v_advance dtb_u_u815))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u815) })) else ((Base_dCommon.v_step (((v_parseListPatternElems (dtb_u_u812 - 1)) dtb_u_u815) dtb_u_u814)) (fun (dtb_u_u816 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u817 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPCon (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u813) dtb_u_u817))) dtb_u_u816); B_dData_dPair.f_Pair_second = dtb_u_u817 })))))))))
# 2897 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListPatternElems = (fun (dtb_u_u818 : int) (dtb_u_u819 : Frontend_dParser_dSupport.t_PState) (dtb_u_u820 : int) -> (if (dtb_u_u818 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (dtb_u_u818 - 1)) dtb_u_u819) dtb_u_u820)) (fun (dtb_u_u821 : Frontend_dAst.t_Pat) (dtb_u_u822 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u822) ",") then ((Base_dCommon.v_step (((v_parseListPatternElems (dtb_u_u818 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u822)) dtb_u_u820)) (fun (dtb_u_u823 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u824 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u821, dtb_u_u823)); B_dData_dPair.f_Pair_second = dtb_u_u824 })))) else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u822) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u821, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u822) })) else ((v_ps0 dtb_u_u822) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))
# 2912 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePatternTupleRest = (fun (dtb_u_u825 : int) (dtb_u_u826 : Frontend_dParser_dSupport.t_PState) (dtb_u_u827 : int) (dtb_u_u828 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (if (dtb_u_u825 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (dtb_u_u825 - 1)) dtb_u_u826) dtb_u_u827)) (fun (dtb_u_u829 : Frontend_dAst.t_Pat) (dtb_u_u830 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u830) ",") then ((((v_parsePatternTupleRest (dtb_u_u825 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u830)) dtb_u_u827) (B_dData_dList.C_List__x58__x58_ (dtb_u_u829, dtb_u_u828))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u830) ")")) (fun (dtb_u_u831 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u829, dtb_u_u828))); B_dData_dPair.f_Pair_second = dtb_u_u831 })))))))))

# 1390 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseClausePatterns = (fun (dtb_u_u832 : int) (dtb_u_u833 : Frontend_dParser_dSupport.t_PState) (dtb_u_u834 : int) -> (if (dtb_u_u832 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsPatternAtom dtb_u_u833) then ((Frontend_dParser_dSupport.v_canContinue dtb_u_u833) dtb_u_u834) else false) then ((Base_dCommon.v_step (((v_parsePatternAtom (Frontend_dParser_dSupport.v_stateFuel dtb_u_u833)) dtb_u_u833) dtb_u_u834)) (fun (dtb_u_u835 : Frontend_dAst.t_Pat) (dtb_u_u836 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseClausePatterns (dtb_u_u832 - 1)) dtb_u_u836) dtb_u_u834)) (fun (dtb_u_u837 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u838 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u835, dtb_u_u837)); B_dData_dPair.f_Pair_second = dtb_u_u838 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u833 })))))

# 1246 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseBindingItemsAt = (fun (dtb_u_u839 : int) (dtb_u_u840 : Frontend_dParser_dSupport.t_PState) (dtb_u_u841 : int) -> (if (dtb_u_u839 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u840) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u840 })) else (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u840) "in") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u840 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u840) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u842; Base_dSource.f_Pos_posCol = dtb_u_u843; Base_dSource.f_Pos_posOffset = dtb_u_u844; Base_dSource.f_Pos_posEndOffset = dtb_u_u845 } -> (if (dtb_u_u843 = dtb_u_u841) then ((Base_dCommon.v_step (((v_parseBindingItem (dtb_u_u839 - 1)) dtb_u_u840) dtb_u_u841)) (fun (dtb_u_u846 : t_BindingItem) (dtb_u_u847 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseBindingItemsAt (dtb_u_u839 - 1)) dtb_u_u847) dtb_u_u841)) (fun (dtb_u_u848 : t_BindingItem B_dData_dList.t_List) (dtb_u_u849 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u846, dtb_u_u848)); B_dData_dPair.f_Pair_second = dtb_u_u849 })))))) else (if (dtb_u_u843 > dtb_u_u841) then ((v_ps0 dtb_u_u840) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInBinding) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u840 }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 1258 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItem = (fun (dtb_u_u850 : int) (dtb_u_u851 : Frontend_dParser_dSupport.t_PState) (dtb_u_u852 : int) -> (if (dtb_u_u850 <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstBindingKind) v_semBindingItem) dtb_u_u851) (fun (dtb_u_u853 : Frontend_dParser_dSupport.t_PState) -> (((v_parseBindingItemBody dtb_u_u850) dtb_u_u853) dtb_u_u852)))))
# 1265 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingItemBody = (fun (dtb_u_u854 : int) (dtb_u_u855 : Frontend_dParser_dSupport.t_PState) (dtb_u_u856 : int) -> (if (dtb_u_u854 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u857 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u855) in (match dtb_u_u857 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u858; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u859 } -> (match dtb_u_u858 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u860) -> (if (dtb_u_u860 = "_") then (((v_parseBindingPattern dtb_u_u854) dtb_u_u855) dtb_u_u856) else (let dtb_u_u861 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u855) 1) in (match dtb_u_u861 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u862) -> (match dtb_u_u862 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u863; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u864 } -> (match dtb_u_u863 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u865) -> (if (dtb_u_u865 = ":") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance dtb_u_u855)) ":")) (fun (dtb_u_u866 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u854 - 1)) dtb_u_u866) dtb_u_u856)) (fun (dtb_u_u867 : Frontend_dAst.t_Expr) (dtb_u_u868 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix dtb_u_u868)) (fun (dtb_u_u869 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BISig (dtb_u_u860, dtb_u_u867, { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u855).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u855) dtb_u_u869) })); B_dData_dPair.f_Pair_second = dtb_u_u869 })))))))) else (((v_parseBindingPattern dtb_u_u854) dtb_u_u855) dtb_u_u856))
  | _ -> (((v_parseBindingPattern dtb_u_u854) dtb_u_u855) dtb_u_u856)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parseBindingPattern dtb_u_u854) dtb_u_u855) dtb_u_u856)
)))
  | _ -> (((v_parseBindingPattern dtb_u_u854) dtb_u_u855) dtb_u_u856)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1284 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingPattern = (fun (dtb_u_u870 : int) (dtb_u_u871 : Frontend_dParser_dSupport.t_PState) (dtb_u_u872 : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel dtb_u_u871)) dtb_u_u871) dtb_u_u872)) (fun (dtb_u_u873 : Frontend_dAst.t_Pat) (dtb_u_u874 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseBindingDef (dtb_u_u870 - 1)) dtb_u_u871) dtb_u_u874) dtb_u_u872) dtb_u_u873))))
# 1291 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingDef = (fun (dtb_u_u875 : int) (dtb_u_u876 : Frontend_dParser_dSupport.t_PState) (dtb_u_u877 : Frontend_dParser_dSupport.t_PState) (dtb_u_u878 : int) (dtb_u_u879 : Frontend_dAst.t_Pat) -> (if (dtb_u_u875 <= 0) then (Base_dDiag.v_icFuel "parser") else (match dtb_u_u879 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u880, dtb_u_u881) -> (if (if (Frontend_dParser_dSupport.v_startsPatternAtom dtb_u_u877) then ((Frontend_dParser_dSupport.v_canContinue dtb_u_u877) dtb_u_u878) else false) then ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel dtb_u_u877)) dtb_u_u877) dtb_u_u878)) (fun (dtb_u_u882 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u883 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt dtb_u_u877) dtb_u_u882)) (fun (dtb_u_u884 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u883) "=")) (fun (dtb_u_u885 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u875 - 1)) dtb_u_u885) dtb_u_u878)) (fun (dtb_u_u886 : Frontend_dAst.t_Expr) (dtb_u_u887 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind ({ Frontend_dAst.f_Binding_bindPat = (Frontend_dAst.C_Pat_PVar (dtb_u_u880, (Frontend_dAst.v_patRef dtb_u_u879))); Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BClauses ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_LocalClause_lcPats = dtb_u_u882; Frontend_dAst.f_LocalClause_lcBody = dtb_u_u886; Frontend_dAst.f_LocalClause_lcRef = { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u876).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u876) dtb_u_u887) }; Frontend_dAst.f_LocalClause_lcHead = (Frontend_dAst.v_patRef dtb_u_u879) }, B_dData_dList.C_List_Nil)))); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u876).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u876) dtb_u_u887) } })); B_dData_dPair.f_Pair_second = dtb_u_u887 })))))))))) else ((Base_dCommon.v_step ((((((v_parseBindingValue (dtb_u_u875 - 1)) dtb_u_u876) dtb_u_u877) (dtb_u_u876).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u879) dtb_u_u878)) (fun (dtb_u_u888 : Frontend_dAst.t_Binding) (dtb_u_u889 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (dtb_u_u888)); B_dData_dPair.f_Pair_second = dtb_u_u889 })))))
  | _ -> ((Base_dCommon.v_step ((((((v_parseBindingValue (dtb_u_u875 - 1)) dtb_u_u876) dtb_u_u877) (dtb_u_u876).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u879) dtb_u_u878)) (fun (dtb_u_u890 : Frontend_dAst.t_Binding) (dtb_u_u891 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_BindingItem_BIBind (dtb_u_u890)); B_dData_dPair.f_Pair_second = dtb_u_u891 }))))
)))
# 1300 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseBindingValue = (fun (dtb_u_u892 : int) (dtb_u_u893 : Frontend_dParser_dSupport.t_PState) (dtb_u_u894 : Frontend_dParser_dSupport.t_PState) (dtb_u_u895 : int) (dtb_u_u896 : Frontend_dAst.t_Pat) (dtb_u_u897 : int) -> (if (dtb_u_u892 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((v_checkBindersAt dtb_u_u894) (B_dData_dList.C_List__x58__x58_ (dtb_u_u896, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u898 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u894) "=")) (fun (dtb_u_u899 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u892 - 1)) dtb_u_u899) dtb_u_u897)) (fun (dtb_u_u900 : Frontend_dAst.t_Expr) (dtb_u_u901 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Binding_bindPat = dtb_u_u896; Frontend_dAst.f_Binding_bindValue = (Frontend_dAst.C_BindingValue_BVal (dtb_u_u900)); Frontend_dAst.f_Binding_bindSig = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Binding_bindRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u895; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u893) dtb_u_u901) } }; B_dData_dPair.f_Pair_second = dtb_u_u901 }))))))))))
# 1767 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExpr = (fun (dtb_u_u902 : int) (dtb_u_u903 : Frontend_dParser_dSupport.t_PState) (dtb_u_u904 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) dtb_u_u903) (fun (dtb_u_u905 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((((v_parseExprBody dtb_u_u902) (dtb_u_u905).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u905) dtb_u_u904)) (fun (dtb_u_u906 : Frontend_dAst.t_Expr) (dtb_u_u907 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Frontend_dAst.v_withExprId (dtb_u_u905).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u906); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_rekeyInfix (Frontend_dAst.v_nodeRefId (Frontend_dAst.v_exprRef dtb_u_u906))) (dtb_u_u905).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u907) })))))))
# 1775 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseExprBody = (fun (dtb_u_u908 : int) (dtb_u_u909 : int) (dtb_u_u910 : Frontend_dParser_dSupport.t_PState) (dtb_u_u911 : int) -> (if (dtb_u_u908 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u910) then ((v_ps0 dtb_u_u910) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_canContinue dtb_u_u910) dtb_u_u911) then ((Base_dCommon.v_step (((v_parseLhs (dtb_u_u908 - 1)) dtb_u_u910) dtb_u_u911)) (fun (dtb_u_u912 : Frontend_dAst.t_Expr) (dtb_u_u913 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (dtb_u_u908 - 1)) dtb_u_u909) dtb_u_u913) dtb_u_u911) dtb_u_u912))) else ((v_ps0 dtb_u_u910) Base_dDiagnostics_dFrontend.C_PsDiag_ExprNotIndented)))))
# 1791 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseInfix = (fun (dtb_u_u914 : int) (dtb_u_u915 : int) (dtb_u_u916 : Frontend_dParser_dSupport.t_PState) (dtb_u_u917 : int) (dtb_u_u918 : Frontend_dAst.t_Expr) -> (if (dtb_u_u914 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u919 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u916) in (match dtb_u_u919 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u920; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u921 } -> (match dtb_u_u920 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u922) -> (if (dtb_u_u922 = "`") then (if ((Frontend_dParser_dSupport.v_canContinue dtb_u_u916) dtb_u_u917) then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectValueName (Frontend_dParser_dSupport.v_advance dtb_u_u916))) (fun (dtb_u_u923 : string) (dtb_u_u924 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u924) "`")) (fun (dtb_u_u925 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u914 - 1)) dtb_u_u925) dtb_u_u917)) (fun (dtb_u_u926 : Frontend_dAst.t_Expr) (dtb_u_u927 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (dtb_u_u914 - 1)) dtb_u_u915) ((Frontend_dParser_dSupport.v_addBacktickShape dtb_u_u915) dtb_u_u927)) dtb_u_u917) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u923, (Frontend_dAst.v_detachedNodeRef (Frontend_dParser_dSupport.v_tokenSpan (Frontend_dParser_dSupport.v_advance dtb_u_u916))))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u918, (B_dData_dList.C_List__x58__x58_ (dtb_u_u926, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u916) dtb_u_u927))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u918; B_dData_dPair.f_Pair_second = dtb_u_u916 }))) else (if (if ((Frontend_dParser_dSupport.v_canContinue dtb_u_u916) dtb_u_u917) then (B_dData_dBool.v_not (Frontend_dParser_dSupport.v_isSyntaxSym dtb_u_u922)) else false) then (if (Frontend_dParser_dSupport.v_closeParenNext dtb_u_u916) then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) dtb_u_u916) (fun (dtb_u_u928 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u929 = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u928) (Frontend_dParser_dSupport.v_advance dtb_u_u928)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_sectionRightExpr dtb_u_u922) dtb_u_u918) { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u928).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = dtb_u_u929 }); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset dtb_u_u929)) (Frontend_dCst.C_SectionShape_SectionRight (dtb_u_u922))) (Frontend_dParser_dSupport.v_advance dtb_u_u928)) }))))) else ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u914 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u916)) dtb_u_u917)) (fun (dtb_u_u930 : Frontend_dAst.t_Expr) (dtb_u_u931 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseInfix (dtb_u_u914 - 1)) dtb_u_u915) dtb_u_u931) dtb_u_u917) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb_u_u922, (Frontend_dAst.v_detachedNodeRef (Frontend_dParser_dSupport.v_tokenSpan dtb_u_u916)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u918, (B_dData_dList.C_List__x58__x58_ (dtb_u_u930, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u916) dtb_u_u931)))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u918; B_dData_dPair.f_Pair_second = dtb_u_u916 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u918; B_dData_dPair.f_Pair_second = dtb_u_u916 }))
)
  | _ -> failwith "DT: impossible branch"
))))
# 1818 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLhs = (fun (dtb_u_u932 : int) (dtb_u_u933 : Frontend_dParser_dSupport.t_PState) (dtb_u_u934 : int) -> (if (dtb_u_u932 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u935 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u933) in (match dtb_u_u935 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u936; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u937 } -> (match dtb_u_u936 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u938) -> (if (dtb_u_u938 = "\\") then (((v_parseLambda (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (if (dtb_u_u938 = "-") then (((v_parseNegation (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (((v_parseApplication (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934)))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u939) -> (if (dtb_u_u939 = "let") then (((v_parseLet (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (if (dtb_u_u939 = "case") then (((v_parseCase (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (if (dtb_u_u939 = "if") then (((v_parseIf (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (if (dtb_u_u939 = "do") then (((v_parseDo (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (if (dtb_u_u939 = "perform") then (((v_parsePerform (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (if (dtb_u_u939 = "handle") then (((v_parseHandle (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934) else (((v_parseApplication (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934)))))))
  | _ -> (((v_parseApplication (dtb_u_u932 - 1)) dtb_u_u933) dtb_u_u934)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1836 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseNegation = (fun (dtb_u_u940 : int) (dtb_u_u941 : Frontend_dParser_dSupport.t_PState) (dtb_u_u942 : int) -> (if (dtb_u_u940 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u943 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u941) 1) in (match dtb_u_u943 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u944) -> (match dtb_u_u944 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u945; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u946 } -> (match dtb_u_u945 with
  | Frontend_dLexer.C_Tok_TFloat (dtb_u_u947) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (("-" ^ dtb_u_u947), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u941) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u941)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u941)) }))
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u948) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt ((0 - dtb_u_u948), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u941) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u941)))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u941)) }))
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (dtb_u_u940 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u941)) dtb_u_u942)) (fun (dtb_u_u949 : Frontend_dAst.t_Expr) (dtb_u_u950 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u941) (Frontend_dParser_dSupport.v_advance dtb_u_u941))))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u949, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u941) dtb_u_u950)))); B_dData_dPair.f_Pair_second = dtb_u_u950 }))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_step (((v_parseApplication (dtb_u_u940 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u941)) dtb_u_u942)) (fun (dtb_u_u951 : Frontend_dAst.t_Expr) (dtb_u_u952 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("negate", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u941) (Frontend_dParser_dSupport.v_advance dtb_u_u941))))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u951, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u941) dtb_u_u952)))); B_dData_dPair.f_Pair_second = dtb_u_u952 }))))
))))
# 1846 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseApplication = (fun (dtb_u_u953 : int) (dtb_u_u954 : Frontend_dParser_dSupport.t_PState) (dtb_u_u955 : int) -> (if (dtb_u_u953 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (dtb_u_u953 - 1)) dtb_u_u954) dtb_u_u955)) (fun (dtb_u_u956 : Frontend_dAst.t_Expr) (dtb_u_u957 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u957) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (dtb_u_u953 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u957)) dtb_u_u955)) (fun (dtb_u_u958 : Frontend_dAst.t_Expr) (dtb_u_u959 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (dtb_u_u953 - 1)) dtb_u_u959) dtb_u_u955)) (fun (dtb_u_u960 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u961 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAppAt), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u954) dtb_u_u961)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u956, (B_dData_dList.C_List__x58__x58_ (dtb_u_u958, dtb_u_u960)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u954) dtb_u_u961)))); B_dData_dPair.f_Pair_second = dtb_u_u961 })))))) else ((Base_dCommon.v_step (((v_parseArgs (dtb_u_u953 - 1)) dtb_u_u957) dtb_u_u955)) (fun (dtb_u_u962 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u963 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u962 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u956; B_dData_dPair.f_Pair_second = dtb_u_u963 }))
  | _ -> (let dtb_u_u964 = (Frontend_dAst.C_Expr_EApp (dtb_u_u956, dtb_u_u962, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u954) dtb_u_u963)))) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u963) "@") then ((Base_dCommon.v_step (((v_parseAtPayload (dtb_u_u953 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u963)) dtb_u_u955)) (fun (dtb_u_u965 : Frontend_dAst.t_Expr) (dtb_u_u966 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsRowAt), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u954) dtb_u_u966)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u964, (B_dData_dList.C_List__x58__x58_ (dtb_u_u965, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u954) dtb_u_u966)))); B_dData_dPair.f_Pair_second = dtb_u_u966 })))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u964; B_dData_dPair.f_Pair_second = dtb_u_u963 }))))
))))))))
# 1870 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtPayload = (fun (dtb_u_u967 : int) (dtb_u_u968 : Frontend_dParser_dSupport.t_PState) (dtb_u_u969 : int) -> (if (dtb_u_u967 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtom (dtb_u_u967 - 1)) dtb_u_u968) dtb_u_u969)) (fun (dtb_u_u970 : Frontend_dAst.t_Expr) (dtb_u_u971 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u968) "(") then dtb_u_u970 else (v_rowAtNameExpr dtb_u_u970)); B_dData_dPair.f_Pair_second = dtb_u_u971 }))))))
# 1893 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseArgs = (fun (dtb_u_u972 : int) (dtb_u_u973 : Frontend_dParser_dSupport.t_PState) (dtb_u_u974 : int) -> (if (dtb_u_u972 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (if (Frontend_dParser_dSupport.v_startsAtom dtb_u_u973) then ((Frontend_dParser_dSupport.v_canContinue dtb_u_u973) dtb_u_u974) else false) then ((Base_dCommon.v_step (((v_parseAtom (dtb_u_u972 - 1)) dtb_u_u973) dtb_u_u974)) (fun (dtb_u_u975 : Frontend_dAst.t_Expr) (dtb_u_u976 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs (dtb_u_u972 - 1)) dtb_u_u976) dtb_u_u974)) (fun (dtb_u_u977 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u978 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u975, dtb_u_u977)); B_dData_dPair.f_Pair_second = dtb_u_u978 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u973 })))))
# 1904 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtom = (fun (dtb_u_u979 : int) (dtb_u_u980 : Frontend_dParser_dSupport.t_PState) (dtb_u_u981 : int) -> (if (dtb_u_u979 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseAtomBase (dtb_u_u979 - 1)) dtb_u_u980) dtb_u_u981)) (fun (dtb_u_u982 : Frontend_dAst.t_Expr) (dtb_u_u983 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseFieldSuffix (Frontend_dParser_dSupport.v_stateFuel dtb_u_u983)) dtb_u_u983) dtb_u_u981) dtb_u_u982)))))
# 1942 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseMacroAtom = (fun (dtb_u_u984 : int) (dtb_u_u985 : Frontend_dParser_dSupport.t_PState) (dtb_u_u986 : int) (dtb_u_u987 : string) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstMacroKind) v_semMacroAtom) dtb_u_u985) (fun (dtb_u_u988 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym (Frontend_dParser_dSupport.v_advance dtb_u_u988)) "!")) (fun (dtb_u_u989 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseArgs dtb_u_u984) dtb_u_u989) dtb_u_u986)) (fun (dtb_u_u990 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u991 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((v_macroAtom dtb_u_u987) dtb_u_u990) ((Frontend_dParser_dSupport.v_spanOf dtb_u_u985) dtb_u_u991)) ((Frontend_dParser_dSupport.v_spanOf dtb_u_u985) dtb_u_u989)); B_dData_dPair.f_Pair_second = dtb_u_u991 })))))))))
# 1950 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAtomBase = (fun (dtb_u_u992 : int) (dtb_u_u993 : Frontend_dParser_dSupport.t_PState) (dtb_u_u994 : int) -> (if (dtb_u_u992 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u995 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u993) in (match dtb_u_u995 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u996; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u997 } -> (match dtb_u_u996 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u998) -> (if (dtb_u_u998 = "(") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance dtb_u_u993)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u999) -> (if (Frontend_dParser_dSupport.v_piArrowAhead (Frontend_dParser_dSupport.v_advance dtb_u_u993)) then ((((((((v_parsePiBinder (dtb_u_u992 - 1)) dtb_u_u993) dtb_u_u994) (B_dData_dPair.v_firstOf dtb_u_u999)) (B_dData_dPair.v_secondOf dtb_u_u999)) false) "(") ")") else (((v_parseParenAtom (dtb_u_u992 - 1)) dtb_u_u993) dtb_u_u994))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Frontend_dParser_dSupport.v_sectionOpAt dtb_u_u993) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1000) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) dtb_u_u993) (fun (dtb_u_u1001 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseSectionAtom (dtb_u_u992 - 1)) dtb_u_u1001) dtb_u_u994) dtb_u_u1000)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_parseParenAtom (dtb_u_u992 - 1)) dtb_u_u993) dtb_u_u994)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u998 = "[") then (((v_parseListExpr (dtb_u_u992 - 1)) dtb_u_u993) dtb_u_u994) else (if (dtb_u_u998 = "?") then (match (Frontend_dParser_dSupport.v_holeAtomAt dtb_u_u993) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1002) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((B_dData_dPair.v_firstOf dtb_u_u1002), (Frontend_dAst.v_detachedNodeRef (B_dData_dPair.v_secondOf dtb_u_u1002)))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u993)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_ps0 dtb_u_u993) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u998 = "{") then (match (Frontend_dParser_dSupport.v_binderHead (Frontend_dParser_dSupport.v_advance dtb_u_u993)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1003) -> ((((((((v_parsePiBinder (dtb_u_u992 - 1)) dtb_u_u993) dtb_u_u994) (B_dData_dPair.v_firstOf dtb_u_u1003)) (B_dData_dPair.v_secondOf dtb_u_u1003)) true) "{") "}")
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u993) "{")) (fun (dtb_u_u1004 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u992 - 1)) dtb_u_u1004) dtb_u_u994)) (fun (dtb_u_u1005 : Frontend_dAst.t_Expr) (dtb_u_u1006 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1006) "|")) (fun (dtb_u_u1007 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (dtb_u_u992 - 1)) dtb_u_u1007) dtb_u_u994)) (fun (dtb_u_u1008 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1009 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u1005, dtb_u_u1008, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u993) dtb_u_u1009)))); B_dData_dPair.f_Pair_second = dtb_u_u1009 }))))))))))
  | _ -> failwith "DT: impossible branch"
) else ((v_ps0 dtb_u_u993) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)))))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1010) -> (if (dtb_u_u1010 = "Type") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u993) (Frontend_dParser_dSupport.v_advance dtb_u_u993))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u993) })) else ((v_ps0 dtb_u_u993) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression))
  | Frontend_dLexer.C_Tok_TTmpl (dtb_u_u1011, dtb_u_u1012, dtb_u_u1013) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstExprKind) v_semExpr) dtb_u_u993) (fun (dtb_u_u1014 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseTemplateAtom (dtb_u_u992 - 1)) dtb_u_u1014) dtb_u_u1011) dtb_u_u1012) dtb_u_u1013)))
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u1015) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EStr (dtb_u_u1015, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u993) (Frontend_dParser_dSupport.v_advance dtb_u_u993))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u993) }))
  | Frontend_dLexer.C_Tok_TFloat (dtb_u_u1016) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EFloat (dtb_u_u1016, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u993) (Frontend_dParser_dSupport.v_advance dtb_u_u993))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u993) }))
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u1017) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInt (dtb_u_u1017, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u993) (Frontend_dParser_dSupport.v_advance dtb_u_u993))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u993) }))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1018) -> (let dtb_u_u1019 = (Frontend_dParser_dSupport.v_advance dtb_u_u993) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1019) "{") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1019) "{")) (fun (dtb_u_u1020 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseRecordAssignments (dtb_u_u992 - 1)) dtb_u_u1020) dtb_u_u994)) (fun (dtb_u_u1021 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1022 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ERecord (dtb_u_u1018, dtb_u_u1021, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u993) dtb_u_u1022)))); B_dData_dPair.f_Pair_second = dtb_u_u1022 })))))) else (if (((v_macroBangAt dtb_u_u1019) dtb_u_u997) dtb_u_u1018) then ((((v_parseMacroAtom (dtb_u_u992 - 1)) dtb_u_u993) dtb_u_u994) dtb_u_u1018) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb_u_u1018, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u993) dtb_u_u1019)))); B_dData_dPair.f_Pair_second = dtb_u_u1019 })))))
  | _ -> ((v_ps0 dtb_u_u993) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedExpression)
)
  | _ -> failwith "DT: impossible branch"
))))
# 1989 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateAtom = (fun (dtb_u_u1023 : int) (dtb_u_u1024 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1025 : bool) (dtb_u_u1026 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) (dtb_u_u1027 : Base_dSource.t_Pos) -> (if (dtb_u_u1023 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((((v_parseTemplateParts (dtb_u_u1023 - 1)) dtb_u_u1024) (Frontend_dParser_dSupport.v_tokSpan dtb_u_u1024)) dtb_u_u1026)) (fun (dtb_u_u1028 : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let dtb_u_u1029 = (B_dData_dPair.v_firstOf dtb_u_u1028) in (let dtb_u_u1030 = (B_dData_dPair.v_secondOf dtb_u_u1028) in (let dtb_u_u1031 = (Frontend_dParser_dSupport.v_advance dtb_u_u1024) in (let dtb_u_u1032 = (((Frontend_dParser_dSupport.v_addInterpMulti (Base_dSource.v_posOffset (Frontend_dParser_dSupport.v_peekPos dtb_u_u1024))) dtb_u_u1025) (((Frontend_dParser_dSupport.v_addTemplateHoles (dtb_u_u1024).Frontend_dParser_dSupport.f_PState_openNodeId) dtb_u_u1030) ((Frontend_dParser_dSupport.v_withLastPos dtb_u_u1027) dtb_u_u1031))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EInterp (dtb_u_u1029, { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u1024).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1024) dtb_u_u1032) })); B_dData_dPair.f_Pair_second = dtb_u_u1032 }))))))))))
# 2005 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateParts = (fun (dtb_u_u1033 : int) (dtb_u_u1034 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1035 : Base_dSource.t_Span) (dtb_u_u1036 : Frontend_dLexer.t_TmplPart B_dData_dList.t_List) -> (if (dtb_u_u1033 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u1037 = dtb_u_u1036 in (match dtb_u_u1037 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1038, dtb_u_u1039) -> (match dtb_u_u1038 with
  | Frontend_dLexer.C_TmplPart_TPHole (dtb_u_u1040) -> ((Base_dCommon.v_bind ((((v_parseTemplateHole (v_toksFuel dtb_u_u1040)) dtb_u_u1034) dtb_u_u1035) dtb_u_u1040)) (fun (dtb_u_u1041 : (Frontend_dAst.t_Expr, Frontend_dCst.t_CstNode) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_parseTemplateParts (dtb_u_u1033 - 1)) dtb_u_u1034) dtb_u_u1035) dtb_u_u1039)) (fun (dtb_u_u1042 : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole ((B_dData_dPair.v_firstOf dtb_u_u1041))), (B_dData_dPair.v_firstOf dtb_u_u1042))); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb_u_u1041), (B_dData_dPair.v_secondOf dtb_u_u1042))) }))))))
  | Frontend_dLexer.C_TmplPart_TPText (dtb_u_u1043) -> ((Base_dCommon.v_bind ((((v_parseTemplateParts (dtb_u_u1033 - 1)) dtb_u_u1034) dtb_u_u1035) dtb_u_u1039)) (fun (dtb_u_u1044 : (Frontend_dAst.t_InterpPart B_dData_dList.t_List, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb_u_u1043)), (B_dData_dPair.v_firstOf dtb_u_u1044))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1044) }))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))))
# 2018 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseTemplateHole = (fun (dtb_u_u1045 : int) (dtb_u_u1046 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1047 : Base_dSource.t_Span) (dtb_u_u1048 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (if (dtb_u_u1045 <= 0) then (Base_dDiag.v_icFuel "parser") else (match dtb_u_u1048 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb_u_u1047) Base_dDiagnostics_dFrontend.C_PsDiag_TemplateHoleEmpty)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1049, dtb_u_u1050) -> (let dtb_u_u1051 = (dtb_u_u1049).Frontend_dLexer.f_PTok_ptokPos in (let dtb_u_u1052 = (Frontend_dParser_dSupport.v_fileOf dtb_u_u1046) in (let dtb_u_u1053 = (((((((Frontend_dParser_dSupport.v_mkStateAt dtb_u_u1052) (dtb_u_u1046).Frontend_dParser_dSupport.f_PState_sourceOf) dtb_u_u1048) dtb_u_u1051) (B_dData_dList.v_length dtb_u_u1048)) (Frontend_dParser_dSupport.v_pmodeOf dtb_u_u1046)) (Frontend_dParser_dSupport.v_eventMode dtb_u_u1046)) in (let dtb_u_u1054 = (((v_parseExpr (dtb_u_u1045 - 1)) dtb_u_u1053) 0) in (match dtb_u_u1054 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1055) -> (match dtb_u_u1055 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1056; B_dData_dPair.f_Pair_second = dtb_u_u1057 } -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1057) then (let dtb_u_u1058 = (Frontend_dParser_dSupport.v_eventsOf dtb_u_u1057) in (let dtb_u_u1059 = (((((((Frontend_dCst.v_nestToTreeWithSurface (((Frontend_dCst.v_lexTokensOfFrom (dtb_u_u1046).Frontend_dParser_dSupport.f_PState_sourceOf) dtb_u_u1051) dtb_u_u1048)) dtb_u_u1058) ((Frontend_dCst.v_parenEntriesOf dtb_u_u1048) dtb_u_u1058)) (dtb_u_u1057).Frontend_dParser_dSupport.f_PState_backtickShapes) (dtb_u_u1057).Frontend_dParser_dSupport.f_PState_sectionShapes) (dtb_u_u1057).Frontend_dParser_dSupport.f_PState_interpMultis) (dtb_u_u1057).Frontend_dParser_dSupport.f_PState_templateHoles) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1056; B_dData_dPair.f_Pair_second = (Frontend_dCst.v_holeRootOf dtb_u_u1059) })))) else (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withLabel { Base_dDiag.f_Label_labelSpan = (B_dData_dMaybe.C_Maybe_Just (((v_holeSpan dtb_u_u1052) dtb_u_u1051))); Base_dDiag.f_Label_labelText = ""; Base_dDiag.f_Label_labelStyle = Base_dDiag.C_LabelStyle_LabelPrimary; Base_dDiag.f_Label_labelProvenance = B_dData_dMaybe.C_Maybe_Nothing }) ((Base_dDiagnostics_dFrontend.v_psMsg Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr) B_dData_dVec.C_Vec_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1060) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withFallbackSpan ((v_holeSpan dtb_u_u1052) dtb_u_u1051)) dtb_u_u1060)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
# 2059 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenAtom = (fun (dtb_u_u1061 : int) (dtb_u_u1062 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1063 : int) -> (if (dtb_u_u1061 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1062) "(")) (fun (dtb_u_u1064 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1064) ")") then (let dtb_u_u1065 = (Frontend_dParser_dSupport.v_advance dtb_u_u1064) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsTupleUnit), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1062) dtb_u_u1065)))); B_dData_dPair.f_Pair_second = dtb_u_u1065 }))) else ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1061 - 1)) dtb_u_u1064) dtb_u_u1063)) (fun (dtb_u_u1066 : Frontend_dAst.t_Expr) (dtb_u_u1067 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1067) ",") then ((Base_dCommon.v_step ((((v_parseParenTupleRest (dtb_u_u1061 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1067)) dtb_u_u1063) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1066, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u1068 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1069 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldPairExprs (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1062) dtb_u_u1069))) dtb_u_u1068); B_dData_dPair.f_Pair_second = dtb_u_u1069 })))) else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1067) ":") then ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1061 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1067)) dtb_u_u1063)) (fun (dtb_u_u1070 : Frontend_dAst.t_Expr) (dtb_u_u1071 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1071) ")")) (fun (dtb_u_u1072 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsAscribe), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1062) dtb_u_u1067)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1066, (B_dData_dList.C_List__x58__x58_ (dtb_u_u1070, B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1062) dtb_u_u1072)))); B_dData_dPair.f_Pair_second = dtb_u_u1072 })))))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1067) ")")) (fun (dtb_u_u1073 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1066; B_dData_dPair.f_Pair_second = dtb_u_u1073 })))))))))))))
# 2075 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseParenTupleRest = (fun (dtb_u_u1074 : int) (dtb_u_u1075 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1076 : int) (dtb_u_u1077 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (dtb_u_u1074 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1074 - 1)) dtb_u_u1075) dtb_u_u1076)) (fun (dtb_u_u1078 : Frontend_dAst.t_Expr) (dtb_u_u1079 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1079) ",") then ((((v_parseParenTupleRest (dtb_u_u1074 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1079)) dtb_u_u1076) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1078, dtb_u_u1077))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1079) ")")) (fun (dtb_u_u1080 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u1078, dtb_u_u1077))); B_dData_dPair.f_Pair_second = dtb_u_u1080 })))))))))
# 2094 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseSectionAtom = (fun (dtb_u_u1081 : int) (dtb_u_u1082 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1083 : int) (dtb_u_u1084 : string) -> (if (dtb_u_u1081 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1082) "(")) (fun (dtb_u_u1085 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1085) dtb_u_u1084)) (fun (dtb_u_u1086 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1086) ")") then (let dtb_u_u1087 = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1082) (Frontend_dParser_dSupport.v_advance dtb_u_u1086)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb_u_u1084, { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u1082).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = dtb_u_u1087 })); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset dtb_u_u1087)) (Frontend_dCst.C_SectionShape_SectionOp (dtb_u_u1084))) (Frontend_dParser_dSupport.v_advance dtb_u_u1086)) }))) else ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1081 - 1)) dtb_u_u1086) dtb_u_u1083)) (fun (dtb_u_u1088 : Frontend_dAst.t_Expr) (dtb_u_u1089 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1089) ")")) (fun (dtb_u_u1090 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1091 = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1082) dtb_u_u1090) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_sectionLeftExpr dtb_u_u1084) dtb_u_u1088) { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u1082).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = dtb_u_u1091 }); B_dData_dPair.f_Pair_second = (((Frontend_dParser_dSupport.v_addSectionShape (Base_dSource.v_spanStartOffset dtb_u_u1091)) (Frontend_dCst.C_SectionShape_SectionLeft (dtb_u_u1084))) dtb_u_u1090) }))))))))))))))
# 2139 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePiBinder = (fun (dtb_u_u1092 : int) (dtb_u_u1093 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1094 : int) (dtb_u_u1095 : Frontend_dAst.t_Qty B_dData_dMaybe.t_Maybe) (dtb_u_u1096 : string B_dData_dList.t_List) (dtb_u_u1097 : bool) (dtb_u_u1098 : string) (dtb_u_u1099 : string) -> (if (dtb_u_u1092 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (v_anyDottedName dtb_u_u1096) then ((v_ps0 dtb_u_u1093) Base_dDiagnostics_dFrontend.C_PsDiag_PiBinderNameNotSimple) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1093) dtb_u_u1098)) (fun (dtb_u_u1100 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_consumeQty dtb_u_u1100) dtb_u_u1095)) (fun (dtb_u_u1101 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (dtb_u_u1092 - 1)) dtb_u_u1101)) (fun (dtb_u_u1102 : string B_dData_dList.t_List) (dtb_u_u1103 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1103) ":")) (fun (dtb_u_u1104 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1092 - 1)) dtb_u_u1104) dtb_u_u1094)) (fun (dtb_u_u1105 : Frontend_dAst.t_Expr) (dtb_u_u1106 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1106) dtb_u_u1099)) (fun (dtb_u_u1107 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1107) "->")) (fun (dtb_u_u1108 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1092 - 1)) dtb_u_u1108) dtb_u_u1094)) (fun (dtb_u_u1109 : Frontend_dAst.t_Expr) (dtb_u_u1110 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((((((v_foldPiNames dtb_u_u1102) dtb_u_u1097) dtb_u_u1095) dtb_u_u1105) dtb_u_u1109) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1093) dtb_u_u1110))); B_dData_dPair.f_Pair_second = dtb_u_u1110 })))))))))))))))))))))
# 2189 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignments = (fun (dtb_u_u1111 : int) (dtb_u_u1112 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1113 : int) -> (if (dtb_u_u1111 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1112) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u1112) })) else ((Base_dCommon.v_step (((v_parseRecordAssignList (dtb_u_u1111 - 1)) dtb_u_u1112) dtb_u_u1113)) (fun (dtb_u_u1114 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1115 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1114; B_dData_dPair.f_Pair_second = dtb_u_u1115 })))))))
# 2200 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseRecordAssignList = (fun (dtb_u_u1116 : int) (dtb_u_u1117 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1118 : int) -> (if (dtb_u_u1116 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1117)) (fun (dtb_u_u1119 : string) (dtb_u_u1120 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1120) "=")) (fun (dtb_u_u1121 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1116 - 1)) dtb_u_u1121) dtb_u_u1118)) (fun (dtb_u_u1122 : Frontend_dAst.t_Expr) (dtb_u_u1123 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1123) ",") then ((Base_dCommon.v_step (((v_parseRecordAssignList (dtb_u_u1116 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1123)) dtb_u_u1118)) (fun (dtb_u_u1124 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1125 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1119; B_dData_dPair.f_Pair_second = dtb_u_u1122 }, dtb_u_u1124)); B_dData_dPair.f_Pair_second = dtb_u_u1125 })))) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1123) "}")) (fun (dtb_u_u1126 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1119; B_dData_dPair.f_Pair_second = dtb_u_u1122 }, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = dtb_u_u1126 })))))))))))))
# 2209 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExpr = (fun (dtb_u_u1127 : int) (dtb_u_u1128 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1129 : int) -> (if (dtb_u_u1127 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1128) "[")) (fun (dtb_u_u1130 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1130) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsListNil), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1128) (Frontend_dParser_dSupport.v_advance dtb_u_u1130))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u1130) })) else ((Base_dCommon.v_step (((v_parseListExprElems (dtb_u_u1127 - 1)) dtb_u_u1130) dtb_u_u1129)) (fun (dtb_u_u1131 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1132 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_foldCons (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1128) dtb_u_u1132))) dtb_u_u1131); B_dData_dPair.f_Pair_second = dtb_u_u1132 })))))))))
# 2218 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListExprElems = (fun (dtb_u_u1133 : int) (dtb_u_u1134 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1135 : int) -> (if (dtb_u_u1133 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1133 - 1)) dtb_u_u1134) dtb_u_u1135)) (fun (dtb_u_u1136 : Frontend_dAst.t_Expr) (dtb_u_u1137 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseListElemAt (dtb_u_u1133 - 1)) dtb_u_u1136) dtb_u_u1137)) (fun (dtb_u_u1138 : Frontend_dAst.t_Expr) (dtb_u_u1139 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1139) ",") then ((Base_dCommon.v_step (((v_parseListExprElems (dtb_u_u1133 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1139)) dtb_u_u1135)) (fun (dtb_u_u1140 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1141 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1138, dtb_u_u1140)); B_dData_dPair.f_Pair_second = dtb_u_u1141 })))) else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1139) "]") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1138, B_dData_dList.C_List_Nil)); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u1139) })) else ((v_ps0 dtb_u_u1139) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedCommaOrBracket)))))))))
# 2229 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseListElemAt = (fun (dtb_u_u1142 : int) (dtb_u_u1143 : Frontend_dAst.t_Expr) (dtb_u_u1144 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u1142 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1144) "@") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1144) "@")) (fun (dtb_u_u1145 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAtom (dtb_u_u1142 - 1)) dtb_u_u1145) 0)) (fun (dtb_u_u1146 : Frontend_dAst.t_Expr) (dtb_u_u1147 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsRowAt), (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr dtb_u_u1143) dtb_u_u1147)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1143, (B_dData_dList.C_List__x58__x58_ ((v_rowAtNameExpr dtb_u_u1146), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef ((v_spanFromExpr dtb_u_u1143) dtb_u_u1147)))); B_dData_dPair.f_Pair_second = dtb_u_u1147 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1143; B_dData_dPair.f_Pair_second = dtb_u_u1144 })))))
# 2245 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLambda = (fun (dtb_u_u1148 : int) (dtb_u_u1149 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1150 : int) -> (if (dtb_u_u1148 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1149) "\\")) (fun (dtb_u_u1151 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseLambdaParam dtb_u_u1151)) (fun (dtb_u_u1152 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair) (dtb_u_u1153 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLambdaParams (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1153)) dtb_u_u1153) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1152, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u1154 : (string, Base_dSource.t_Span) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1155 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1155) "=>")) (fun (dtb_u_u1156 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1148 - 1)) dtb_u_u1156) dtb_u_u1150)) (fun (dtb_u_u1157 : Frontend_dAst.t_Expr) (dtb_u_u1158 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELam (dtb_u_u1154, dtb_u_u1157, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1149) dtb_u_u1158)))); B_dData_dPair.f_Pair_second = dtb_u_u1158 }))))))))))))))
# 2270 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLet = (fun (dtb_u_u1159 : int) (dtb_u_u1160 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1161 : int) -> (if (dtb_u_u1159 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1160) "let")) (fun (dtb_u_u1162 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseLetBindings (dtb_u_u1159 - 1)) dtb_u_u1162) dtb_u_u1161)) (fun (dtb_u_u1163 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u1164 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1164) "in")) (fun (dtb_u_u1165 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1159 - 1)) dtb_u_u1165) dtb_u_u1161)) (fun (dtb_u_u1166 : Frontend_dAst.t_Expr) (dtb_u_u1167 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ELet (dtb_u_u1163, dtb_u_u1166, false, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1160) dtb_u_u1167)))); B_dData_dPair.f_Pair_second = dtb_u_u1167 }))))))))))))
# 2281 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseLetBindings = (fun (dtb_u_u1168 : int) (dtb_u_u1169 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1170 : int) -> (if (dtb_u_u1168 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1169) then ((v_ps0 dtb_u_u1169) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u1169) "in") then ((v_ps0 dtb_u_u1169) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedLetBinding) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1169) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1171; Base_dSource.f_Pos_posCol = dtb_u_u1172; Base_dSource.f_Pos_posOffset = dtb_u_u1173; Base_dSource.f_Pos_posEndOffset = dtb_u_u1174 } -> (if (dtb_u_u1172 <= dtb_u_u1170) then ((v_ps0 dtb_u_u1169) Base_dDiagnostics_dFrontend.C_PsDiag_LetBindingNotIndented) else ((Base_dCommon.v_step (((v_parseBindingItemsAt (dtb_u_u1168 - 1)) dtb_u_u1169) dtb_u_u1172)) (fun (dtb_u_u1175 : t_BindingItem B_dData_dList.t_List) (dtb_u_u1176 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds dtb_u_u1175)) (fun (dtb_u_u1177 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1177; B_dData_dPair.f_Pair_second = dtb_u_u1176 })))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 2293 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCase = (fun (dtb_u_u1178 : int) (dtb_u_u1179 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1180 : int) -> (if (dtb_u_u1178 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1179) "case")) (fun (dtb_u_u1181 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1178 - 1)) dtb_u_u1181) dtb_u_u1180)) (fun (dtb_u_u1182 : Frontend_dAst.t_Expr) (dtb_u_u1183 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1183) "of")) (fun (dtb_u_u1184 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCaseAlts (dtb_u_u1178 - 1)) dtb_u_u1184) dtb_u_u1180)) (fun (dtb_u_u1185 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u1186 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_ECase (dtb_u_u1182, dtb_u_u1185, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1179) dtb_u_u1186)))); B_dData_dPair.f_Pair_second = dtb_u_u1186 }))))))))))))
# 2302 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseCaseAlts = (fun (dtb_u_u1187 : int) (dtb_u_u1188 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1189 : int) -> (if (dtb_u_u1187 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1188) then ((v_ps0 dtb_u_u1188) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1188) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1190; Base_dSource.f_Pos_posCol = dtb_u_u1191; Base_dSource.f_Pos_posOffset = dtb_u_u1192; Base_dSource.f_Pos_posEndOffset = dtb_u_u1193 } -> (if (dtb_u_u1191 <= dtb_u_u1189) then ((v_ps0 dtb_u_u1188) Base_dDiagnostics_dFrontend.C_PsDiag_CaseAltNotIndented) else ((Base_dCommon.v_step (((v_parseAltList (dtb_u_u1187 - 1)) dtb_u_u1188) dtb_u_u1191)) (fun (dtb_u_u1194 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u1195 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_badCaseIndent dtb_u_u1195) dtb_u_u1191) then ((v_ps0 dtb_u_u1195) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentAfterCaseAlt) else (match dtb_u_u1194 with
  | B_dData_dList.C_List_Nil -> ((v_ps0 dtb_u_u1195) Base_dDiagnostics_dFrontend.C_PsDiag_CaseNeedsAlternative)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1194; B_dData_dPair.f_Pair_second = dtb_u_u1195 }))
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2324 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltList = (fun (dtb_u_u1196 : int) (dtb_u_u1197 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1198 : int) -> (if (dtb_u_u1196 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1197) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1197 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1197) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1199; Base_dSource.f_Pos_posCol = dtb_u_u1200; Base_dSource.f_Pos_posOffset = dtb_u_u1201; Base_dSource.f_Pos_posEndOffset = dtb_u_u1202 } -> (if (dtb_u_u1200 = dtb_u_u1198) then ((Base_dCommon.v_step (((v_parseAlt (dtb_u_u1196 - 1)) dtb_u_u1197) dtb_u_u1198)) (fun (dtb_u_u1203 : Frontend_dAst.t_Alt) (dtb_u_u1204 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltList (dtb_u_u1196 - 1)) dtb_u_u1204) dtb_u_u1198)) (fun (dtb_u_u1205 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u1206 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1203, dtb_u_u1205)); B_dData_dPair.f_Pair_second = dtb_u_u1206 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1197 })))
  | _ -> failwith "DT: impossible branch"
))))
# 2335 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAlt = (fun (dtb_u_u1207 : int) (dtb_u_u1208 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1209 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semAlt) dtb_u_u1208) (fun (dtb_u_u1210 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseAltBody dtb_u_u1207) dtb_u_u1210) dtb_u_u1209)) (fun (dtb_u_u1211 : Frontend_dAst.t_Alt) (dtb_u_u1212 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = (dtb_u_u1211).Frontend_dAst.f_Alt_altPat; Frontend_dAst.f_Alt_altBody = (dtb_u_u1211).Frontend_dAst.f_Alt_altBody; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u1210).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1208) dtb_u_u1212) } }; B_dData_dPair.f_Pair_second = dtb_u_u1212 })))))))
# 2343 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseAltBody = (fun (dtb_u_u1213 : int) (dtb_u_u1214 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1215 : int) -> ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1214)) dtb_u_u1214) dtb_u_u1215)) (fun (dtb_u_u1216 : Frontend_dAst.t_Pat) (dtb_u_u1217 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt dtb_u_u1214) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1216, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u1218 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1217) "=>")) (fun (dtb_u_u1219 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1213 - 1)) dtb_u_u1219) dtb_u_u1215)) (fun (dtb_u_u1220 : Frontend_dAst.t_Expr) (dtb_u_u1221 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Alt_altPat = dtb_u_u1216; Frontend_dAst.f_Alt_altBody = dtb_u_u1220; Frontend_dAst.f_Alt_altRef = { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u1214).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1214) dtb_u_u1221) } }; B_dData_dPair.f_Pair_second = dtb_u_u1221 })))))))))))
# 2356 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parsePerform = (fun (dtb_u_u1222 : int) (dtb_u_u1223 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1224 : int) -> (if (dtb_u_u1222 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1223) "perform")) (fun (dtb_u_u1225 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseApplication (dtb_u_u1222 - 1)) dtb_u_u1225) dtb_u_u1224)) (fun (dtb_u_u1226 : Frontend_dAst.t_Expr) (dtb_u_u1227 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText Frontend_dReserved.C_Reserved_RsPerform), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1223) dtb_u_u1227)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1226, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1223) dtb_u_u1227)))); B_dData_dPair.f_Pair_second = dtb_u_u1227 }))))))))
# 2385 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandle = (fun (dtb_u_u1228 : int) (dtb_u_u1229 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1230 : int) -> (if (dtb_u_u1228 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1229) "handle")) (fun (dtb_u_u1231 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleComp (dtb_u_u1228 - 1)) dtb_u_u1231) dtb_u_u1230)) (fun (dtb_u_u1232 : Frontend_dAst.t_Expr) (dtb_u_u1233 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1233) "{")) (fun (dtb_u_u1234 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseHandleBody (dtb_u_u1228 - 1)) dtb_u_u1234) dtb_u_u1230)) (fun (dtb_u_u1235 : t_HandleBlock) (dtb_u_u1236 : Frontend_dParser_dSupport.t_PState) -> (match (((v_handleExpr dtb_u_u1232) dtb_u_u1235) (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1229) dtb_u_u1236))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1237) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1237))
  | Base_dDiag.C_Check_OkC (dtb_u_u1238) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1238; B_dData_dPair.f_Pair_second = dtb_u_u1236 }))
  | _ -> failwith "DT: impossible branch"
)))))))))))
# 2407 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleComp = (fun (dtb_u_u1239 : int) (dtb_u_u1240 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1241 : int) -> (if (dtb_u_u1239 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u1242 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1240) in (match dtb_u_u1242 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1243; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1244 } -> (match dtb_u_u1243 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1245) -> (let dtb_u_u1246 = ((Frontend_dParser_dSupport.v_peekTokAt dtb_u_u1240) 1) in (match dtb_u_u1246 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1247) -> (match dtb_u_u1247 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1248; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1249 } -> (match dtb_u_u1248 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u1250) -> (if (dtb_u_u1250 = "{") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EVar (dtb_u_u1245, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1240) (Frontend_dParser_dSupport.v_advance dtb_u_u1240))))); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u1240) })) else (((v_parseExpr (dtb_u_u1239 - 1)) dtb_u_u1240) dtb_u_u1241))
  | _ -> (((v_parseExpr (dtb_u_u1239 - 1)) dtb_u_u1240) dtb_u_u1241)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_parseExpr (dtb_u_u1239 - 1)) dtb_u_u1240) dtb_u_u1241)
))
  | _ -> (((v_parseExpr (dtb_u_u1239 - 1)) dtb_u_u1240) dtb_u_u1241)
)
  | _ -> failwith "DT: impossible branch"
))))
# 2420 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleBody = (fun (dtb_u_u1251 : int) (dtb_u_u1252 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1253 : int) -> (if (dtb_u_u1251 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1252) "}") then ((v_ps0 dtb_u_u1252) Base_dDiagnostics_dFrontend.C_PsDiag_HandleNeedsOpClause) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1252) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1254; Base_dSource.f_Pos_posCol = dtb_u_u1255; Base_dSource.f_Pos_posOffset = dtb_u_u1256; Base_dSource.f_Pos_posEndOffset = dtb_u_u1257 } -> (if (dtb_u_u1255 <= dtb_u_u1253) then ((v_ps0 dtb_u_u1252) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNotIndented) else ((Base_dCommon.v_step (((((v_parseHandleClauses (dtb_u_u1251 - 1)) dtb_u_u1252) dtb_u_u1255) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dList.C_List_Nil)) (fun (dtb_u_u1258 : ((string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe, t_HandleOp B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u1259 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1258 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1260; B_dData_dPair.f_Pair_second = dtb_u_u1261 } -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1259) "}")) (fun (dtb_u_u1262 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleBlock_HandleBlock (dtb_u_u1260, dtb_u_u1261)); B_dData_dPair.f_Pair_second = dtb_u_u1262 }))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))
# 2446 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleClauses = (fun (dtb_u_u1263 : int) (dtb_u_u1264 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1265 : int) (dtb_u_u1266 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) (dtb_u_u1267 : t_HandleOp B_dData_dList.t_List) -> (if (dtb_u_u1263 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1264) then ((v_ps0 dtb_u_u1264) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedEndOfInput) else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1264) "}") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u1266; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u1267) }; B_dData_dPair.f_Pair_second = dtb_u_u1264 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1264) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1268; Base_dSource.f_Pos_posCol = dtb_u_u1269; Base_dSource.f_Pos_posOffset = dtb_u_u1270; Base_dSource.f_Pos_posEndOffset = dtb_u_u1271 } -> (if (dtb_u_u1269 = dtb_u_u1265) then (if (v_isReturnClauseHead dtb_u_u1264) then (match dtb_u_u1266 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1272) -> ((v_ps0 dtb_u_u1264) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u1267 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1273, dtb_u_u1274) -> ((v_ps0 dtb_u_u1264) Base_dDiagnostics_dFrontend.C_PsDiag_HandleReturnMisplaced)
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_step (((v_parseHandleRetClause (dtb_u_u1263 - 1)) dtb_u_u1264) dtb_u_u1265)) (fun (dtb_u_u1275 : (string, (Frontend_dAst.t_Expr, Frontend_dAst.t_NodeRef) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) (dtb_u_u1276 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1277 = dtb_u_u1275 in (match dtb_u_u1277 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1278; B_dData_dPair.f_Pair_second = dtb_u_u1279 } -> (match dtb_u_u1279 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1280; B_dData_dPair.f_Pair_second = dtb_u_u1281 } -> (((((v_parseHandleClauses (dtb_u_u1263 - 1)) dtb_u_u1276) dtb_u_u1265) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u1278; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1280; B_dData_dPair.f_Pair_second = dtb_u_u1281 } }))) dtb_u_u1267)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_step (((v_parseHandleOpClause (dtb_u_u1263 - 1)) dtb_u_u1264) dtb_u_u1265)) (fun (dtb_u_u1282 : t_HandleOp) (dtb_u_u1283 : Frontend_dParser_dSupport.t_PState) -> (((((v_parseHandleClauses (dtb_u_u1263 - 1)) dtb_u_u1283) dtb_u_u1265) dtb_u_u1266) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1282, dtb_u_u1267)))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u1266; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u1267) }; B_dData_dPair.f_Pair_second = dtb_u_u1264 })))
  | _ -> failwith "DT: impossible branch"
)))))
# 2476 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleRetClause = (fun (dtb_u_u1284 : int) (dtb_u_u1285 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1286 : int) -> (if (dtb_u_u1284 <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semHandleRet) dtb_u_u1285) (fun (dtb_u_u1287 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1287)) (fun (dtb_u_u1288 : string) (dtb_u_u1289 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1289)) (fun (dtb_u_u1290 : string) (dtb_u_u1291 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1291) "->")) (fun (dtb_u_u1292 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1284 - 1)) dtb_u_u1292) dtb_u_u1286)) (fun (dtb_u_u1293 : Frontend_dAst.t_Expr) (dtb_u_u1294 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u1290; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1293; B_dData_dPair.f_Pair_second = { Frontend_dAst.f_NodeRef_nodeRefId = (dtb_u_u1287).Frontend_dParser_dSupport.f_PState_openNodeId; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1287) dtb_u_u1294) } } }; B_dData_dPair.f_Pair_second = dtb_u_u1294 }))))))))))))))
# 2488 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClause = (fun (dtb_u_u1295 : int) (dtb_u_u1296 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1297 : int) -> (if (dtb_u_u1295 <= 0) then (Base_dDiag.v_icFuel "parser") else ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstAltKind) v_semHandleOp) dtb_u_u1296) (fun (dtb_u_u1298 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseHandleOpClauseBody dtb_u_u1295) dtb_u_u1298) dtb_u_u1297) (dtb_u_u1298).Frontend_dParser_dSupport.f_PState_openNodeId)))))
# 2500 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseHandleOpClauseBody = (fun (dtb_u_u1299 : int) (dtb_u_u1300 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1301 : int) (dtb_u_u1302 : int) -> (if (dtb_u_u1299 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1300)) dtb_u_u1300) dtb_u_u1301)) (fun (dtb_u_u1303 : Frontend_dAst.t_Pat) (dtb_u_u1304 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt dtb_u_u1300) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1303, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u1305 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u1303 with
  | Frontend_dAst.C_Pat_PCon (dtb_u_u1306, dtb_u_u1307, dtb_u_u1308) -> (match (B_dData_dList.v_reverse dtb_u_u1307) with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb_u_u1308)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1309, dtb_u_u1310) -> (match dtb_u_u1309 with
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1311, dtb_u_u1312) -> (((((((((v_handleOpTail (dtb_u_u1299 - 1)) dtb_u_u1300) dtb_u_u1304) dtb_u_u1301) dtb_u_u1306) (B_dData_dList.v_reverse dtb_u_u1310)) dtb_u_u1308) dtb_u_u1302) dtb_u_u1311)
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1313) -> (((((((((v_handleOpTail (dtb_u_u1299 - 1)) dtb_u_u1300) dtb_u_u1304) dtb_u_u1301) dtb_u_u1306) (B_dData_dList.v_reverse dtb_u_u1310)) dtb_u_u1308) dtb_u_u1302) "_")
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (Frontend_dAst.v_nodeRefSpan dtb_u_u1308)) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_ps0 dtb_u_u1300) Base_dDiagnostics_dFrontend.C_PsDiag_HandleClauseNeedsCtor)
)))))))
# 2523 "Vuna/Compiler/Frontend/Parser.vuna"
and v_handleOpTail = (fun (dtb_u_u1314 : int) (dtb_u_u1315 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1316 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1317 : int) (dtb_u_u1318 : string) (dtb_u_u1319 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1320 : Frontend_dAst.t_NodeRef) (dtb_u_u1321 : int) (dtb_u_u1322 : string) -> (if (dtb_u_u1314 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1316) "->")) (fun (dtb_u_u1323 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1314 - 1)) dtb_u_u1323) dtb_u_u1317)) (fun (dtb_u_u1324 : Frontend_dAst.t_Expr) (dtb_u_u1325 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_HandleOp_HandleOp (dtb_u_u1318, dtb_u_u1319, dtb_u_u1320, { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u1321; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1315) dtb_u_u1325) }, dtb_u_u1322, dtb_u_u1324)); B_dData_dPair.f_Pair_second = dtb_u_u1325 }))))))))
# 2575 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseIf = (fun (dtb_u_u1326 : int) (dtb_u_u1327 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1328 : int) -> (if (dtb_u_u1326 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1327) "if")) (fun (dtb_u_u1329 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1326 - 1)) dtb_u_u1329) dtb_u_u1328)) (fun (dtb_u_u1330 : Frontend_dAst.t_Expr) (dtb_u_u1331 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1331) "then")) (fun (dtb_u_u1332 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1326 - 1)) dtb_u_u1332) dtb_u_u1328)) (fun (dtb_u_u1333 : Frontend_dAst.t_Expr) (dtb_u_u1334 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1334) "else")) (fun (dtb_u_u1335 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1326 - 1)) dtb_u_u1335) dtb_u_u1328)) (fun (dtb_u_u1336 : Frontend_dAst.t_Expr) (dtb_u_u1337 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EIf (dtb_u_u1330, dtb_u_u1333, dtb_u_u1336, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1327) dtb_u_u1337)))); B_dData_dPair.f_Pair_second = dtb_u_u1337 }))))))))))))))))
# 2586 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDo = (fun (dtb_u_u1338 : int) (dtb_u_u1339 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1340 : int) -> (if (dtb_u_u1338 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1339) "do")) (fun (dtb_u_u1341 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1341) then ((v_ps0 dtb_u_u1341) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1341) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1342; Base_dSource.f_Pos_posCol = dtb_u_u1343; Base_dSource.f_Pos_posOffset = dtb_u_u1344; Base_dSource.f_Pos_posEndOffset = dtb_u_u1345 } -> (if (dtb_u_u1343 <= dtb_u_u1340) then ((v_ps0 dtb_u_u1341) Base_dDiagnostics_dFrontend.C_PsDiag_DoStatementNotIndented) else ((Base_dCommon.v_step ((((v_parseDoStmts (dtb_u_u1338 - 1)) dtb_u_u1341) dtb_u_u1343) B_dData_dList.C_List_Nil)) (fun (dtb_u_u1346 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u1347 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1348 = (B_dData_dList.v_reverse dtb_u_u1346) in (match dtb_u_u1348 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1349, dtb_u_u1350) -> (match dtb_u_u1349 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u1351, dtb_u_u1352) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Expr_EDo (dtb_u_u1346, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1339) dtb_u_u1347)))); B_dData_dPair.f_Pair_second = dtb_u_u1347 }))
  | _ -> ((v_ps0 dtb_u_u1347) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)
  | _ -> ((v_ps0 dtb_u_u1347) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockMustEndWithExpr)
)))))
  | _ -> failwith "DT: impossible branch"
))))))
# 2609 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmts = (fun (dtb_u_u1353 : int) (dtb_u_u1354 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1355 : int) (dtb_u_u1356 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) -> (if (dtb_u_u1353 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1354) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1356); B_dData_dPair.f_Pair_second = dtb_u_u1354 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1354) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1357; Base_dSource.f_Pos_posCol = dtb_u_u1358; Base_dSource.f_Pos_posOffset = dtb_u_u1359; Base_dSource.f_Pos_posEndOffset = dtb_u_u1360 } -> (if (dtb_u_u1358 < dtb_u_u1355) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1356); B_dData_dPair.f_Pair_second = dtb_u_u1354 })) else (if (dtb_u_u1358 > dtb_u_u1355) then ((v_ps0 dtb_u_u1354) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((Base_dCommon.v_step (((v_parseDoStmt (dtb_u_u1353 - 1)) dtb_u_u1354) dtb_u_u1355)) (fun (dtb_u_u1361 : Frontend_dAst.t_DoStmt) (dtb_u_u1362 : Frontend_dParser_dSupport.t_PState) -> (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1362) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1363; Base_dSource.f_Pos_posCol = dtb_u_u1364; Base_dSource.f_Pos_posOffset = dtb_u_u1365; Base_dSource.f_Pos_posEndOffset = dtb_u_u1366 } -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1362) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u1361, dtb_u_u1356))); B_dData_dPair.f_Pair_second = dtb_u_u1362 })) else (if (dtb_u_u1364 < dtb_u_u1355) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u1361, dtb_u_u1356))); B_dData_dPair.f_Pair_second = dtb_u_u1362 })) else (if (dtb_u_u1364 > dtb_u_u1355) then ((v_ps0 dtb_u_u1362) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInDo) else ((((v_parseDoStmts (dtb_u_u1353 - 1)) dtb_u_u1362) dtb_u_u1355) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1361, dtb_u_u1356))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))
# 2630 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmt = (fun (dtb_u_u1367 : int) (dtb_u_u1368 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1369 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDoStmtKind) v_semDoStmt) dtb_u_u1368) (fun (dtb_u_u1370 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseDoStmtBody dtb_u_u1367) dtb_u_u1370) dtb_u_u1369) (dtb_u_u1370).Frontend_dParser_dSupport.f_PState_openNodeId))))
# 2653 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoStmtBody = (fun (dtb_u_u1371 : int) (dtb_u_u1372 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1373 : int) (dtb_u_u1374 : int) -> (if (dtb_u_u1371 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u1372) "let") then ((((v_doLetOrExpr dtb_u_u1371) dtb_u_u1372) dtb_u_u1373) dtb_u_u1374) else (let dtb_u_u1375 = (((v_parsePatternSingle (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1372)) dtb_u_u1372) dtb_u_u1373) in (match dtb_u_u1375 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1376) -> (if ((v_doStmtBindsAhead dtb_u_u1372) dtb_u_u1373) then (Base_dDiag.C_Check_ErrC (dtb_u_u1376)) else ((((v_parseDoExprStmt (dtb_u_u1371 - 1)) dtb_u_u1372) dtb_u_u1373) dtb_u_u1374))
  | Base_dDiag.C_Check_OkC (dtb_u_u1377) -> (match dtb_u_u1377 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1378; B_dData_dPair.f_Pair_second = dtb_u_u1379 } -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1379) "<-") then ((Base_dCommon.v_bind ((v_checkBindersAt dtb_u_u1372) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1378, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u1380 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1379) "<-")) (fun (dtb_u_u1381 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1371 - 1)) dtb_u_u1381) dtb_u_u1373)) (fun (dtb_u_u1382 : Frontend_dAst.t_Expr) (dtb_u_u1383 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DBind (dtb_u_u1378, dtb_u_u1382, { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u1374; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1372) dtb_u_u1383) })); B_dData_dPair.f_Pair_second = dtb_u_u1383 })))))))) else ((((v_parseDoExprStmt (dtb_u_u1371 - 1)) dtb_u_u1372) dtb_u_u1373) dtb_u_u1374))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
# 2671 "Vuna/Compiler/Frontend/Parser.vuna"
and v_doLetOrExpr = (fun (dtb_u_u1384 : int) (dtb_u_u1385 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1386 : int) (dtb_u_u1387 : int) -> (if (dtb_u_u1384 <= 0) then (Base_dDiag.v_icFuel "parser") else (match ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1385) "let") with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1388) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1388))
  | Base_dDiag.C_Check_OkC (dtb_u_u1389) -> (let dtb_u_u1390 = (((v_parseLetBindings (dtb_u_u1384 - 1)) dtb_u_u1389) dtb_u_u1386) in (match dtb_u_u1390 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1391) -> (match dtb_u_u1391 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1392; B_dData_dPair.f_Pair_second = dtb_u_u1393 } -> (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u1393) "in") then ((((v_parseDoExprStmt (dtb_u_u1384 - 1)) dtb_u_u1385) dtb_u_u1386) dtb_u_u1387) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DLet (dtb_u_u1392, { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u1387; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1385) dtb_u_u1393) })); B_dData_dPair.f_Pair_second = dtb_u_u1393 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1394) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1394))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 2683 "Vuna/Compiler/Frontend/Parser.vuna"
and v_parseDoExprStmt = (fun (dtb_u_u1395 : int) (dtb_u_u1396 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1397 : int) (dtb_u_u1398 : int) -> (if (dtb_u_u1395 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1395 - 1)) (Frontend_dParser_dSupport.v_sameLineState dtb_u_u1396)) dtb_u_u1397)) (fun (dtb_u_u1399 : Frontend_dAst.t_Expr) (dtb_u_u1400 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_DoStmt_DExpr (dtb_u_u1399, { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u1398; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1396) dtb_u_u1400) })); B_dData_dPair.f_Pair_second = dtb_u_u1400 }))))))

# 110 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExpressionSource = (fun (dtb_u_u1401 : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource dtb_u_u1401)) (fun (dtb_u_u1402 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel (((((Frontend_dParser_dSupport.v_mkState "<expr>") dtb_u_u1401) dtb_u_u1402) Frontend_dParser_dSupport.C_ParseMode_PmStrict) Frontend_dParser_dSupport.C_EventMode_EvNone))) (((((Frontend_dParser_dSupport.v_mkState "<expr>") dtb_u_u1401) dtb_u_u1402) Frontend_dParser_dSupport.C_ParseMode_PmStrict) Frontend_dParser_dSupport.C_EventMode_EvNone)) 0)) (fun (dtb_u_u1403 : Frontend_dAst.t_Expr) (dtb_u_u1404 : Frontend_dParser_dSupport.t_PState) -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1404) then (Base_dDiag.C_Check_OkC (dtb_u_u1403)) else ((v_ps0 dtb_u_u1404) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfExpr)))))))

# 1002 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitSupersRest = (fun (dtb_u_u1405 : int) (dtb_u_u1406 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1407 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (if (dtb_u_u1405 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1406) "=>") then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1407); B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u1406) })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1406) ",")) (fun (dtb_u_u1408 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1405 - 1)) dtb_u_u1408) 0)) (fun (dtb_u_u1409 : Frontend_dAst.t_Expr) (dtb_u_u1410 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (dtb_u_u1405 - 1)) dtb_u_u1410) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1409, dtb_u_u1407))))))))))

# 993 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitSupers = (fun (dtb_u_u1411 : int) (dtb_u_u1412 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u1411 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr dtb_u_u1411) dtb_u_u1412) 0)) (fun (dtb_u_u1413 : Frontend_dAst.t_Expr) (dtb_u_u1414 : Frontend_dParser_dSupport.t_PState) -> (((v_parseTraitSupersRest (dtb_u_u1411 - 1)) dtb_u_u1414) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1413, B_dData_dList.C_List_Nil)))))))

# 1145 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiom = (fun (dtb_u_u1415 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1416 : int) (dtb_u_u1417 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1415) "axiom")) (fun (dtb_u_u1418 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1418)) (fun (dtb_u_u1419 : string) (dtb_u_u1420 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1420) ":")) (fun (dtb_u_u1421 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1421)) dtb_u_u1421) dtb_u_u1416)) (fun (dtb_u_u1422 : Frontend_dAst.t_Expr) (dtb_u_u1423 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix dtb_u_u1423)) (fun (dtb_u_u1424 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DAxiom (dtb_u_u1419, dtb_u_u1422, (((v_declRefAt dtb_u_u1415) dtb_u_u1417) dtb_u_u1424))); B_dData_dPair.f_Pair_second = dtb_u_u1424 })))))))))))))

# 781 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseAxiomExport = (fun (dtb_u_u1425 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (dtb_u_u1426 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1427 : int) (dtb_u_u1428 : t_DeclStart) -> (if (v_opacityGiven dtb_u_u1425) then (((v_ps1 dtb_u_u1426) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseAxiom dtb_u_u1426) dtb_u_u1427) dtb_u_u1428)) (fun (dtb_u_u1429 : Frontend_dAst.t_Decl) (dtb_u_u1430 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1429 with
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u1431, dtb_u_u1432, dtb_u_u1433) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1429)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1431, (Frontend_dAst.v_nodeRefSpan dtb_u_u1433))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1430 }))
  | _ -> (Base_dDiag.v_icInternal "parseAxiomExport: not an axiom")
)))))

# 1153 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExtern = (fun (dtb_u_u1434 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1435 : int) (dtb_u_u1436 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1434) "extern")) (fun (dtb_u_u1437 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1437)) (fun (dtb_u_u1438 : string) (dtb_u_u1439 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1440 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1439) in (match dtb_u_u1440 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1441; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1442 } -> (match dtb_u_u1441 with
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u1443) -> ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1443; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u1439) }))) (fun (dtb_u_u1444 : string) (dtb_u_u1445 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1445) ":")) (fun (dtb_u_u1446 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1446)) dtb_u_u1446) dtb_u_u1435)) (fun (dtb_u_u1447 : Frontend_dAst.t_Expr) (dtb_u_u1448 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix dtb_u_u1448)) (fun (dtb_u_u1449 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DExtern (dtb_u_u1438, dtb_u_u1444, dtb_u_u1447, (((v_declRefAt dtb_u_u1434) dtb_u_u1436) dtb_u_u1449))); B_dData_dPair.f_Pair_second = dtb_u_u1449 }))))))))))
  | _ -> (((v_ps1 dtb_u_u1439) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("string"))) "string")
)
  | _ -> failwith "DT: impossible branch"
)))))))

# 793 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExternExport = (fun (dtb_u_u1450 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (dtb_u_u1451 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1452 : int) (dtb_u_u1453 : t_DeclStart) -> (if (v_opacityGiven dtb_u_u1450) then (((v_ps1 dtb_u_u1451) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((Base_dCommon.v_step (((v_parseExtern dtb_u_u1451) dtb_u_u1452) dtb_u_u1453)) (fun (dtb_u_u1454 : Frontend_dAst.t_Decl) (dtb_u_u1455 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1454 with
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u1456, dtb_u_u1457, dtb_u_u1458, dtb_u_u1459) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1454)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1456, (Frontend_dAst.v_nodeRefSpan dtb_u_u1459))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1455 }))
  | _ -> (Base_dDiag.v_icInternal "parseExternExport: not an extern")
)))))

# 1233 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhereBindings = (fun (dtb_u_u1460 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1461 : int) -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1460) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1460 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1460) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1462; Base_dSource.f_Pos_posCol = dtb_u_u1463; Base_dSource.f_Pos_posOffset = dtb_u_u1464; Base_dSource.f_Pos_posEndOffset = dtb_u_u1465 } -> (if (dtb_u_u1463 > dtb_u_u1461) then ((Base_dCommon.v_step (((v_parseBindingItemsAt (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1460)) dtb_u_u1460) dtb_u_u1463)) (fun (dtb_u_u1466 : t_BindingItem B_dData_dList.t_List) (dtb_u_u1467 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_bindingItemsToBinds dtb_u_u1466)) (fun (dtb_u_u1468 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1468; B_dData_dPair.f_Pair_second = dtb_u_u1467 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1460 })))
  | _ -> failwith "DT: impossible branch"
)))

# 1221 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseWhere = (fun (dtb_u_u1469 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1470 : int) -> (let dtb_u_u1471 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1469) in (match dtb_u_u1471 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1472; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1473 } -> (match dtb_u_u1472 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1474) -> (if (dtb_u_u1474 = "where") then (if ((Base_dSource.v_posCol dtb_u_u1473) > dtb_u_u1470) then ((Base_dCommon.v_step (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = (Frontend_dParser_dSupport.v_advance dtb_u_u1469) }))) (fun (dtb_u_u1475 : int) (dtb_u_u1476 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhereBindings dtb_u_u1476) dtb_u_u1470)) (fun (dtb_u_u1477 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u1478 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1477; B_dData_dPair.f_Pair_second = dtb_u_u1478 })))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1469 }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1469 })))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1469 }))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1187 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseClause = (fun (dtb_u_u1479 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1480 : int) (dtb_u_u1481 : string) (dtb_u_u1482 : t_DeclStart) -> ((Base_dCommon.v_step (((v_parseClausePatterns (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1479)) dtb_u_u1479) dtb_u_u1480)) (fun (dtb_u_u1483 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1484 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((v_checkBindersAt dtb_u_u1479) dtb_u_u1483)) (fun (dtb_u_u1485 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1484) "=")) (fun (dtb_u_u1486 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1486)) dtb_u_u1486) dtb_u_u1480)) (fun (dtb_u_u1487 : Frontend_dAst.t_Expr) (dtb_u_u1488 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseWhere dtb_u_u1488) dtb_u_u1480)) (fun (dtb_u_u1489 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u1490 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1491 = (match dtb_u_u1489 with
  | B_dData_dList.C_List_Nil -> dtb_u_u1487
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1492, dtb_u_u1493) -> (Frontend_dAst.C_Expr_ELet (dtb_u_u1489, dtb_u_u1487, true, (Frontend_dAst.v_detachedNodeRef ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1479) dtb_u_u1490))))
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DFun (dtb_u_u1481, dtb_u_u1483, dtb_u_u1491, (((v_declRefAt dtb_u_u1479) dtb_u_u1482) dtb_u_u1490))); B_dData_dPair.f_Pair_second = dtb_u_u1490 }))))))))))))))

# 1515 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFieldBody = (fun (dtb_u_u1494 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1495 : int) (dtb_u_u1496 : int) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1494)) (fun (dtb_u_u1497 : string) (dtb_u_u1498 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1498) ":")) (fun (dtb_u_u1499 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1499)) dtb_u_u1499) dtb_u_u1495)) (fun (dtb_u_u1500 : Frontend_dAst.t_Expr) (dtb_u_u1501 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix dtb_u_u1501)) (fun (dtb_u_u1502 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Field_fieldName = dtb_u_u1497; Frontend_dAst.f_Field_fieldType = dtb_u_u1500; Frontend_dAst.f_Field_fieldRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u1496; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1494) dtb_u_u1501) } }; B_dData_dPair.f_Pair_second = dtb_u_u1502 })))))))))))

# 1511 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseField = (fun (dtb_u_u1503 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1504 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstFieldKind) v_semField) dtb_u_u1503) (fun (dtb_u_u1505 : Frontend_dParser_dSupport.t_PState) -> (((v_parseFieldBody dtb_u_u1505) dtb_u_u1504) (dtb_u_u1505).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1500 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseFieldList = (fun (dtb_u_u1506 : int) (dtb_u_u1507 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1508 : int) -> (if (dtb_u_u1506 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1507) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1507 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1507) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1509; Base_dSource.f_Pos_posCol = dtb_u_u1510; Base_dSource.f_Pos_posOffset = dtb_u_u1511; Base_dSource.f_Pos_posEndOffset = dtb_u_u1512 } -> (if (dtb_u_u1510 = dtb_u_u1508) then ((Base_dCommon.v_step ((v_parseField dtb_u_u1507) dtb_u_u1508)) (fun (dtb_u_u1513 : Frontend_dAst.t_Field) (dtb_u_u1514 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseFieldList (dtb_u_u1506 - 1)) dtb_u_u1514) dtb_u_u1508)) (fun (dtb_u_u1515 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u1516 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1513, dtb_u_u1515)); B_dData_dPair.f_Pair_second = dtb_u_u1516 })))))) else (if (dtb_u_u1510 > dtb_u_u1508) then ((v_ps0 dtb_u_u1507) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInRecord) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1507 }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1492 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFields = (fun (dtb_u_u1517 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1518 : int) -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1517) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1517 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1517) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1519; Base_dSource.f_Pos_posCol = dtb_u_u1520; Base_dSource.f_Pos_posOffset = dtb_u_u1521; Base_dSource.f_Pos_posEndOffset = dtb_u_u1522 } -> (if (dtb_u_u1520 > dtb_u_u1518) then (((v_parseFieldList (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1517)) dtb_u_u1517) dtb_u_u1520) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1517 })))
  | _ -> failwith "DT: impossible branch"
)))

# 910 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecordExport = (fun (dtb_u_u1523 : bool) (dtb_u_u1524 : Frontend_dAst.t_ReprTier) (dtb_u_u1525 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1526 : int) (dtb_u_u1527 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1525) "record")) (fun (dtb_u_u1528 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1528)) (fun (dtb_u_u1529 : string) (dtb_u_u1530 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1530)) dtb_u_u1530)) (fun (dtb_u_u1531 : string B_dData_dList.t_List) (dtb_u_u1532 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers dtb_u_u1532)) (fun (dtb_u_u1533 : Frontend_dAst.t_ExportMembers) (dtb_u_u1534 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1534) "where")) (fun (dtb_u_u1535 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields dtb_u_u1535) dtb_u_u1526)) (fun (dtb_u_u1536 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u1537 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving dtb_u_u1537)) (fun (dtb_u_u1538 : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (dtb_u_u1539 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1538 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1540; B_dData_dPair.f_Pair_second = dtb_u_u1541 } -> (let dtb_u_u1542 = (Frontend_dAst.C_Decl_DRecord (dtb_u_u1529, dtb_u_u1531, dtb_u_u1536, dtb_u_u1540, dtb_u_u1541, dtb_u_u1524, dtb_u_u1523, (((v_declRefAt dtb_u_u1525) dtb_u_u1527) dtb_u_u1539))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1542)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (dtb_u_u1529, dtb_u_u1533, (Frontend_dAst.v_declSpan dtb_u_u1542))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1539 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))

# 864 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredExport = (fun (dtb_u_u1543 : Frontend_dAst.t_ReprTier) (dtb_u_u1544 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1545 : int) (dtb_u_u1546 : t_DeclStart) -> (let dtb_u_u1547 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance dtb_u_u1544)) in (match dtb_u_u1547 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1548; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1549 } -> (match dtb_u_u1548 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1550) -> (if (dtb_u_u1550 = "linear") then (let dtb_u_u1551 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u1544))) in (match dtb_u_u1551 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1552; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1553 } -> (match dtb_u_u1552 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1554) -> (if (dtb_u_u1554 = "record") then (((((v_parseRecordExport true) dtb_u_u1543) (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u1544))) dtb_u_u1545) dtb_u_u1546) else (((v_ps1 (Frontend_dParser_dSupport.v_advance dtb_u_u1544)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance dtb_u_u1544)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u1550 = "record") then (((((v_parseRecordExport false) dtb_u_u1543) (Frontend_dParser_dSupport.v_advance dtb_u_u1544)) dtb_u_u1545) dtb_u_u1546) else (((v_ps1 (Frontend_dParser_dSupport.v_advance dtb_u_u1544)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance dtb_u_u1544)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1469 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseRecord = (fun (dtb_u_u1555 : bool) (dtb_u_u1556 : Frontend_dAst.t_ReprTier) (dtb_u_u1557 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1558 : int) (dtb_u_u1559 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1557) "record")) (fun (dtb_u_u1560 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1560)) (fun (dtb_u_u1561 : string) (dtb_u_u1562 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1562)) dtb_u_u1562)) (fun (dtb_u_u1563 : string B_dData_dList.t_List) (dtb_u_u1564 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1564) "where")) (fun (dtb_u_u1565 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseFields dtb_u_u1565) dtb_u_u1558)) (fun (dtb_u_u1566 : Frontend_dAst.t_Field B_dData_dList.t_List) (dtb_u_u1567 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving dtb_u_u1567)) (fun (dtb_u_u1568 : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (dtb_u_u1569 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1568 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1570; B_dData_dPair.f_Pair_second = dtb_u_u1571 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DRecord (dtb_u_u1561, dtb_u_u1563, dtb_u_u1566, dtb_u_u1570, dtb_u_u1571, dtb_u_u1556, dtb_u_u1555, (((v_declRefAt dtb_u_u1557) dtb_u_u1559) dtb_u_u1569))); B_dData_dPair.f_Pair_second = dtb_u_u1569 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))

# 1426 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTieredDecl = (fun (dtb_u_u1572 : Frontend_dAst.t_ReprTier) (dtb_u_u1573 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1574 : int) (dtb_u_u1575 : t_DeclStart) -> (let dtb_u_u1576 = (Frontend_dParser_dSupport.v_peekTok (Frontend_dParser_dSupport.v_advance dtb_u_u1573)) in (match dtb_u_u1576 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1577; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1578 } -> (match dtb_u_u1577 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1579) -> (if (dtb_u_u1579 = "linear") then (let dtb_u_u1580 = (Frontend_dParser_dSupport.v_advance (Frontend_dParser_dSupport.v_advance dtb_u_u1573)) in (let dtb_u_u1581 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1580) in (match dtb_u_u1581 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1582; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1583 } -> (match dtb_u_u1582 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1584) -> (if (dtb_u_u1584 = "record") then (((((v_parseRecord true) dtb_u_u1572) dtb_u_u1580) dtb_u_u1574) dtb_u_u1575) else (((v_ps1 dtb_u_u1580) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record"))
  | _ -> (((v_ps1 dtb_u_u1580) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
))) else (if (dtb_u_u1579 = "record") then (((((v_parseRecord false) dtb_u_u1572) (Frontend_dParser_dSupport.v_advance dtb_u_u1573)) dtb_u_u1574) dtb_u_u1575) else (((v_ps1 (Frontend_dParser_dSupport.v_advance dtb_u_u1573)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")))
  | _ -> (((v_ps1 (Frontend_dParser_dSupport.v_advance dtb_u_u1573)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("record"))) "record")
)
  | _ -> failwith "DT: impossible branch"
)))

# 1577 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseTraitParams = (fun (dtb_u_u1585 : int) (dtb_u_u1586 : Frontend_dParser_dSupport.t_PState) -> (if (dtb_u_u1585 <= 0) then (Base_dDiag.v_icFuel "parser") else (let dtb_u_u1587 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1586) in (match dtb_u_u1587 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1588; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1589 } -> (match dtb_u_u1588 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u1590) -> (if (dtb_u_u1590 = "(") then (if (v_parenIsMemberList dtb_u_u1586) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1586 })) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1586) "(")) (fun (dtb_u_u1591 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parsePiNames (dtb_u_u1585 - 1)) dtb_u_u1591)) (fun (dtb_u_u1592 : string B_dData_dList.t_List) (dtb_u_u1593 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1593) ":")) (fun (dtb_u_u1594 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1594)) dtb_u_u1594) 0)) (fun (dtb_u_u1595 : Frontend_dAst.t_Expr) (dtb_u_u1596 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1596) ")")) (fun (dtb_u_u1597 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (dtb_u_u1585 - 1)) dtb_u_u1597)) (fun (dtb_u_u1598 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u1599 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u1600 : string) -> { Frontend_dAst.f_TraitParam_traitParamName = dtb_u_u1600; Frontend_dAst.f_TraitParam_traitParamKind = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1595)) })) dtb_u_u1592)) dtb_u_u1598); B_dData_dPair.f_Pair_second = dtb_u_u1599 }))))))))))))))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1586 })))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1601) -> ((Base_dCommon.v_step ((v_parseTraitParams (dtb_u_u1585 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1586))) (fun (dtb_u_u1602 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u1603 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_TraitParam_traitParamName = dtb_u_u1601; Frontend_dAst.f_TraitParam_traitParamKind = B_dData_dMaybe.C_Maybe_Nothing }, dtb_u_u1602)); B_dData_dPair.f_Pair_second = dtb_u_u1603 }))))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1586 }))
)
  | _ -> failwith "DT: impossible branch"
))))

# 967 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitHead = (fun (dtb_u_u1604 : Frontend_dParser_dSupport.t_PState) -> (if (v_traitSupersFollow dtb_u_u1604) then ((Base_dCommon.v_bind ((v_parseTraitSupers (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1604)) dtb_u_u1604)) (fun (dtb_u_u1605 : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair) -> (let dtb_u_u1606 = (B_dData_dPair.v_firstOf dtb_u_u1605) in (let dtb_u_u1607 = (B_dData_dPair.v_secondOf dtb_u_u1605) in ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1607)) (fun (dtb_u_u1608 : string) (dtb_u_u1609 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1609)) dtb_u_u1609)) (fun (dtb_u_u1610 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u1611 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = dtb_u_u1608; f_TraitHead_traitHeadParams = dtb_u_u1610; f_TraitHead_traitHeadSupers = dtb_u_u1606 }; B_dData_dPair.f_Pair_second = dtb_u_u1611 })))))))))) else ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1604)) (fun (dtb_u_u1612 : string) (dtb_u_u1613 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseTraitParams (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1613)) dtb_u_u1613)) (fun (dtb_u_u1614 : Frontend_dAst.t_TraitParam B_dData_dList.t_List) (dtb_u_u1615 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_TraitHead_traitHeadName = dtb_u_u1612; f_TraitHead_traitHeadParams = dtb_u_u1614; f_TraitHead_traitHeadSupers = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = dtb_u_u1615 }))))))))

# 1610 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigBody = (fun (dtb_u_u1616 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1617 : int) (dtb_u_u1618 : int) -> ((Base_dCommon.v_step (v_expectDeclName dtb_u_u1616)) (fun (dtb_u_u1619 : string) (dtb_u_u1620 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1620) ":")) (fun (dtb_u_u1621 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1621)) dtb_u_u1621) dtb_u_u1617)) (fun (dtb_u_u1622 : Frontend_dAst.t_Expr) (dtb_u_u1623 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix dtb_u_u1623)) (fun (dtb_u_u1624 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u1619; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u1622; Frontend_dAst.f_TraitMethod_traitMethodRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u1618; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1616) dtb_u_u1623) } }; B_dData_dPair.f_Pair_second = dtb_u_u1624 })))))))))))

# 1606 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSig = (fun (dtb_u_u1625 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1626 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstMethodKind) v_semMethod) dtb_u_u1625) (fun (dtb_u_u1627 : Frontend_dParser_dSupport.t_PState) -> (((v_parseMethodSigBody dtb_u_u1627) dtb_u_u1626) (dtb_u_u1627).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1595 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseMethodSigList = (fun (dtb_u_u1628 : int) (dtb_u_u1629 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1630 : int) -> (if (dtb_u_u1628 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1629) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1629 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1629) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1631; Base_dSource.f_Pos_posCol = dtb_u_u1632; Base_dSource.f_Pos_posOffset = dtb_u_u1633; Base_dSource.f_Pos_posEndOffset = dtb_u_u1634 } -> (if (dtb_u_u1632 = dtb_u_u1630) then ((Base_dCommon.v_step ((v_parseMethodSig dtb_u_u1629) dtb_u_u1630)) (fun (dtb_u_u1635 : Frontend_dAst.t_TraitMethod) (dtb_u_u1636 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseMethodSigList (dtb_u_u1628 - 1)) dtb_u_u1636) dtb_u_u1630)) (fun (dtb_u_u1637 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (dtb_u_u1638 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1635, dtb_u_u1637)); B_dData_dPair.f_Pair_second = dtb_u_u1638 })))))) else (if (dtb_u_u1632 > dtb_u_u1630) then ((v_ps0 dtb_u_u1629) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInTrait) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1629 }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1587 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseMethodSigs = (fun (dtb_u_u1639 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1640 : int) -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1639) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1639 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1639) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1641; Base_dSource.f_Pos_posCol = dtb_u_u1642; Base_dSource.f_Pos_posOffset = dtb_u_u1643; Base_dSource.f_Pos_posEndOffset = dtb_u_u1644 } -> (if (dtb_u_u1642 > dtb_u_u1640) then (((v_parseMethodSigList (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1639)) dtb_u_u1639) dtb_u_u1642) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1639 })))
  | _ -> failwith "DT: impossible branch"
)))

# 939 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTraitExport = (fun (dtb_u_u1645 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1646 : int) (dtb_u_u1647 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1645) "trait")) (fun (dtb_u_u1648 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead dtb_u_u1648)) (fun (dtb_u_u1649 : t_TraitHead) (dtb_u_u1650 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitExportMembers dtb_u_u1650)) (fun (dtb_u_u1651 : Frontend_dAst.t_ExportMembers) (dtb_u_u1652 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1652) "where")) (fun (dtb_u_u1653 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs dtb_u_u1653) dtb_u_u1646)) (fun (dtb_u_u1654 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (dtb_u_u1655 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1656 = (Frontend_dAst.C_Decl_DTrait ((dtb_u_u1649).f_TraitHead_traitHeadName, (dtb_u_u1649).f_TraitHead_traitHeadParams, (dtb_u_u1649).f_TraitHead_traitHeadSupers, dtb_u_u1654, (((v_declRefAt dtb_u_u1645) dtb_u_u1647) dtb_u_u1655))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1656)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType ((dtb_u_u1649).f_TraitHead_traitHeadName, dtb_u_u1651, (Frontend_dAst.v_declSpan dtb_u_u1656))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1655 }))))))))))))))

# 1558 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseTrait = (fun (dtb_u_u1657 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1658 : int) (dtb_u_u1659 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1657) "trait")) (fun (dtb_u_u1660 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseTraitHead dtb_u_u1660)) (fun (dtb_u_u1661 : t_TraitHead) (dtb_u_u1662 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1662) "where")) (fun (dtb_u_u1663 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseMethodSigs dtb_u_u1663) dtb_u_u1658)) (fun (dtb_u_u1664 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) (dtb_u_u1665 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1666 = (Frontend_dAst.C_Decl_DTrait ((dtb_u_u1661).f_TraitHead_traitHeadName, (dtb_u_u1661).f_TraitHead_traitHeadParams, (dtb_u_u1661).f_TraitHead_traitHeadSupers, dtb_u_u1664, (((v_declRefAt dtb_u_u1657) dtb_u_u1659) dtb_u_u1665))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1666; B_dData_dPair.f_Pair_second = dtb_u_u1665 }))))))))))))

# 1662 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtxRest = (fun (dtb_u_u1667 : int) (dtb_u_u1668 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1669 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1670 : int) -> (if (dtb_u_u1667 <= 0) then (Base_dDiag.v_icFuel "parser") else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1668) "=>") then ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1667 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1668)) dtb_u_u1670)) (fun (dtb_u_u1671 : Frontend_dAst.t_Expr) (dtb_u_u1672 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1669); B_dData_dPair.f_Pair_second = dtb_u_u1671 }; B_dData_dPair.f_Pair_second = dtb_u_u1672 })))) else ((Base_dCommon.v_step (((v_parseExpr dtb_u_u1667) dtb_u_u1668) dtb_u_u1670)) (fun (dtb_u_u1673 : Frontend_dAst.t_Expr) (dtb_u_u1674 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1674) ",") then ((((v_parseCtxRest (dtb_u_u1667 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1674)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1673, dtb_u_u1669))) dtb_u_u1670) else ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1674) "=>")) (fun (dtb_u_u1675 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1667 - 1)) dtb_u_u1675) dtb_u_u1670)) (fun (dtb_u_u1676 : Frontend_dAst.t_Expr) (dtb_u_u1677 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u1673, dtb_u_u1669))); B_dData_dPair.f_Pair_second = dtb_u_u1676 }; B_dData_dPair.f_Pair_second = dtb_u_u1677 }))))))))))))

# 1636 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtxThenExpr = (fun (dtb_u_u1678 : int) (dtb_u_u1679 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1680 : int) -> (if (dtb_u_u1678 <= 0) then (Base_dDiag.v_icFuel "parser") else ((Base_dCommon.v_step (((v_parseExpr dtb_u_u1678) dtb_u_u1679) dtb_u_u1680)) (fun (dtb_u_u1681 : Frontend_dAst.t_Expr) (dtb_u_u1682 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1682) "=>") then ((Base_dCommon.v_step (((v_parseExpr (dtb_u_u1678 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1682)) dtb_u_u1680)) (fun (dtb_u_u1683 : Frontend_dAst.t_Expr) (dtb_u_u1684 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_ctxThenSplit dtb_u_u1681) dtb_u_u1683); B_dData_dPair.f_Pair_second = dtb_u_u1684 })))) else (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1682) ",") then ((((v_parseCtxRest (dtb_u_u1678 - 1)) (Frontend_dParser_dSupport.v_advance dtb_u_u1682)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1681, B_dData_dList.C_List_Nil))) dtb_u_u1680) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1681 }; B_dData_dPair.f_Pair_second = dtb_u_u1682 }))))))))

# 1173 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSignature = (fun (dtb_u_u1685 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1686 : int) (dtb_u_u1687 : bool) (dtb_u_u1688 : string) (dtb_u_u1689 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1685) ":")) (fun (dtb_u_u1690 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1690)) dtb_u_u1690) dtb_u_u1686)) (fun (dtb_u_u1691 : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (dtb_u_u1692 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1691 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1693; B_dData_dPair.f_Pair_second = dtb_u_u1694 } -> (match dtb_u_u1693 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (dtb_u_u1688, B_dData_dList.C_List_Nil, dtb_u_u1694, (((v_declRefAt dtb_u_u1685) dtb_u_u1689) dtb_u_u1692))); B_dData_dPair.f_Pair_second = dtb_u_u1692 }))
  | _ -> (if dtb_u_u1687 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DSig (dtb_u_u1688, dtb_u_u1693, dtb_u_u1694, (((v_declRefAt dtb_u_u1685) dtb_u_u1689) dtb_u_u1692))); B_dData_dPair.f_Pair_second = dtb_u_u1692 })) else ((v_ps0 dtb_u_u1690) Base_dDiagnostics_dFrontend.C_PsDiag_ConstraintUnsupportedHere))
)
  | _ -> failwith "DT: impossible branch"
))))))

# 753 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedValue = (fun (dtb_u_u1695 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (dtb_u_u1696 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1697 : int) (dtb_u_u1698 : t_DeclStart) -> (let dtb_u_u1699 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1696) in (match dtb_u_u1699 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1700; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1701 } -> (match dtb_u_u1700 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u1702) -> (if (dtb_u_u1702 = "(") then ((Base_dCommon.v_step (v_expectDeclName dtb_u_u1696)) (fun (dtb_u_u1703 : string) (dtb_u_u1704 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1704) ":") then ((Base_dCommon.v_step (((((v_parseSignature dtb_u_u1704) dtb_u_u1697) true) dtb_u_u1703) dtb_u_u1698)) (fun (dtb_u_u1705 : Frontend_dAst.t_Decl) (dtb_u_u1706 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1705)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1703, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1706))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf dtb_u_u1695) dtb_u_u1703) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1706)) }; B_dData_dPair.f_Pair_second = dtb_u_u1706 })))) else ((Base_dCommon.v_step ((((v_parseClause dtb_u_u1704) dtb_u_u1697) dtb_u_u1703) dtb_u_u1698)) (fun (dtb_u_u1707 : Frontend_dAst.t_Decl) (dtb_u_u1708 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1707)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1703, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1708))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf dtb_u_u1695) dtb_u_u1703) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1708)) }; B_dData_dPair.f_Pair_second = dtb_u_u1708 }))))))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u1702) then (((v_ps1 dtb_u_u1696) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let dtb_u_u1709 = (Frontend_dParser_dSupport.v_advance dtb_u_u1696) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1709) ":") then ((Base_dCommon.v_step (((((v_parseSignature dtb_u_u1709) dtb_u_u1697) true) dtb_u_u1702) dtb_u_u1698)) (fun (dtb_u_u1710 : Frontend_dAst.t_Decl) (dtb_u_u1711 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1710)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1702, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1711))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf dtb_u_u1695) dtb_u_u1702) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1711)) }; B_dData_dPair.f_Pair_second = dtb_u_u1711 })))) else ((Base_dCommon.v_step ((((v_parseClause dtb_u_u1709) dtb_u_u1697) dtb_u_u1702) dtb_u_u1698)) (fun (dtb_u_u1712 : Frontend_dAst.t_Decl) (dtb_u_u1713 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1712)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1702, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1713))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf dtb_u_u1695) dtb_u_u1702) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1713)) }; B_dData_dPair.f_Pair_second = dtb_u_u1713 }))))))))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1714) -> (let dtb_u_u1715 = (Frontend_dParser_dSupport.v_advance dtb_u_u1696) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1715) ":") then ((Base_dCommon.v_step (((((v_parseSignature dtb_u_u1715) dtb_u_u1697) true) dtb_u_u1714) dtb_u_u1698)) (fun (dtb_u_u1716 : Frontend_dAst.t_Decl) (dtb_u_u1717 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1716)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1714, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1717))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf dtb_u_u1695) dtb_u_u1714) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1717)) }; B_dData_dPair.f_Pair_second = dtb_u_u1717 })))) else ((Base_dCommon.v_step ((((v_parseClause dtb_u_u1715) dtb_u_u1697) dtb_u_u1714) dtb_u_u1698)) (fun (dtb_u_u1718 : Frontend_dAst.t_Decl) (dtb_u_u1719 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1718)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u1714, (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1719))))); f_ParsedDecl_parsedOpacity = (((v_opacitySpecOf dtb_u_u1695) dtb_u_u1714) (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1696)) (dtb_u_u1698).f_DeclStart_declStartPos) dtb_u_u1719)) }; B_dData_dPair.f_Pair_second = dtb_u_u1719 }))))))
  | _ -> (((v_ps1 dtb_u_u1696) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name")
)
  | _ -> failwith "DT: impossible branch"
)))

# 842 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityValue = (fun (dtb_u_u1720 : Frontend_dAst.t_Opacity) (dtb_u_u1721 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1722 : int) (dtb_u_u1723 : t_DeclStart) -> (let dtb_u_u1724 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1721) in (match dtb_u_u1724 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1725; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1726 } -> (match dtb_u_u1725 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u1727) -> (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u1727) then (((v_ps1 dtb_u_u1721) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (let dtb_u_u1728 = (Frontend_dParser_dSupport.v_advance dtb_u_u1721) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1728) ":") then ((Base_dCommon.v_step (((((v_parseSignature dtb_u_u1728) dtb_u_u1722) true) dtb_u_u1727) dtb_u_u1723)) (fun (dtb_u_u1729 : Frontend_dAst.t_Decl) (dtb_u_u1730 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1729)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb_u_u1727; Frontend_dAst.f_OpacitySpec_opacityKind = dtb_u_u1720; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1721)) (dtb_u_u1723).f_DeclStart_declStartPos) dtb_u_u1730) })) }; B_dData_dPair.f_Pair_second = dtb_u_u1730 })))) else (((v_ps1 dtb_u_u1721) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature"))))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1731) -> (let dtb_u_u1732 = (Frontend_dParser_dSupport.v_advance dtb_u_u1721) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1732) ":") then ((Base_dCommon.v_step (((((v_parseSignature dtb_u_u1732) dtb_u_u1722) true) dtb_u_u1731) dtb_u_u1723)) (fun (dtb_u_u1733 : Frontend_dAst.t_Decl) (dtb_u_u1734 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1733)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = (B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_OpacitySpec_opacityName = dtb_u_u1731; Frontend_dAst.f_OpacitySpec_opacityKind = dtb_u_u1720; Frontend_dAst.f_OpacitySpec_opacitySpan = (((Frontend_dParser_dSupport.v_spanFromStart (Frontend_dParser_dSupport.v_fileOf dtb_u_u1721)) (dtb_u_u1723).f_DeclStart_declStartPos) dtb_u_u1734) })) }; B_dData_dPair.f_Pair_second = dtb_u_u1734 })))) else (((v_ps1 dtb_u_u1721) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")))
  | _ -> (((v_ps1 dtb_u_u1721) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")
)
  | _ -> failwith "DT: impossible branch"
)))

# 825 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDeclBody = (fun (dtb_u_u1735 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1736 : int) (dtb_u_u1737 : t_DeclStart) -> (let dtb_u_u1738 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1735) in (match dtb_u_u1738 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1739; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1740 } -> (match dtb_u_u1739 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1741) -> (if (dtb_u_u1741 = "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1735)) (fun (dtb_u_u1742 : string) (dtb_u_u1743 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityAbstract) dtb_u_u1743) dtb_u_u1736) dtb_u_u1737))) else ((v_ps0 dtb_u_u1735) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1744) -> (if (dtb_u_u1744 = "opaque") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1735) "opaque")) (fun (dtb_u_u1745 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityOpaque) dtb_u_u1745) dtb_u_u1736) dtb_u_u1737))) else (if (dtb_u_u1744 = "transparent") then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1735) "transparent")) (fun (dtb_u_u1746 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseOpacityValue Frontend_dAst.C_Opacity_OpacityTransparent) dtb_u_u1746) dtb_u_u1736) dtb_u_u1737))) else ((v_ps0 dtb_u_u1735) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))
  | _ -> ((v_ps0 dtb_u_u1735) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 817 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseOpacityDecl = (fun (dtb_u_u1747 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1748 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semParsedDecl) dtb_u_u1747) (fun (dtb_u_u1749 : Frontend_dParser_dSupport.t_PState) -> (((v_parseOpacityDeclBody dtb_u_u1749) dtb_u_u1748) { f_DeclStart_declStartId = (dtb_u_u1749).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos dtb_u_u1749) }))))

# 1704 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDeclBody = (fun (dtb_u_u1750 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1751 : int) (dtb_u_u1752 : t_DeclStart) -> (if (v_instanceMethodStart dtb_u_u1750) then ((Base_dCommon.v_step (v_expectDeclName dtb_u_u1750)) (fun (dtb_u_u1753 : string) (dtb_u_u1754 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1754) ":") then (((((v_parseSignature dtb_u_u1754) dtb_u_u1751) false) dtb_u_u1753) dtb_u_u1752) else ((((v_parseClause dtb_u_u1754) dtb_u_u1751) dtb_u_u1753) dtb_u_u1752)))) else ((v_ps0 dtb_u_u1750) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1693 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceDecl = (fun (dtb_u_u1755 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1756 : int) -> (if (v_instanceMethodStart dtb_u_u1755) then ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semDecl) dtb_u_u1755) (fun (dtb_u_u1757 : Frontend_dParser_dSupport.t_PState) -> (((v_parseInstanceDeclBody dtb_u_u1757) dtb_u_u1756) { f_DeclStart_declStartId = (dtb_u_u1757).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos dtb_u_u1757) }))) else ((v_ps0 dtb_u_u1755) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedInstanceMethod)))

# 1683 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseInstanceDeclList = (fun (dtb_u_u1758 : int) (dtb_u_u1759 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1760 : int) -> (if (dtb_u_u1758 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1759) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1759 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1759) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1761; Base_dSource.f_Pos_posCol = dtb_u_u1762; Base_dSource.f_Pos_posOffset = dtb_u_u1763; Base_dSource.f_Pos_posEndOffset = dtb_u_u1764 } -> (if (dtb_u_u1762 = dtb_u_u1760) then ((Base_dCommon.v_step ((v_parseInstanceDecl dtb_u_u1759) dtb_u_u1760)) (fun (dtb_u_u1765 : Frontend_dAst.t_Decl) (dtb_u_u1766 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseInstanceDeclList (dtb_u_u1758 - 1)) dtb_u_u1766) dtb_u_u1760)) (fun (dtb_u_u1767 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1768 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1765, dtb_u_u1767)); B_dData_dPair.f_Pair_second = dtb_u_u1768 })))))) else (if (dtb_u_u1762 > dtb_u_u1760) then ((v_ps0 dtb_u_u1759) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInInstance) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1759 }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1675 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceBody = (fun (dtb_u_u1769 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1770 : int) -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1769) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1769 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1769) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1771; Base_dSource.f_Pos_posCol = dtb_u_u1772; Base_dSource.f_Pos_posOffset = dtb_u_u1773; Base_dSource.f_Pos_posEndOffset = dtb_u_u1774 } -> (if (dtb_u_u1772 > dtb_u_u1770) then (((v_parseInstanceDeclList (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1769)) dtb_u_u1769) dtb_u_u1772) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1769 })))
  | _ -> failwith "DT: impossible branch"
)))

# 1630 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstanceTail = (fun (dtb_u_u1775 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1776 : Frontend_dAst.t_Expr) (dtb_u_u1777 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1778 : int) (dtb_u_u1779 : t_DeclStart) (dtb_u_u1780 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1780) "where")) (fun (dtb_u_u1781 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseInstanceBody dtb_u_u1781) dtb_u_u1778)) (fun (dtb_u_u1782 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1783 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DInstance (dtb_u_u1775, dtb_u_u1776, dtb_u_u1782, (((v_declRefAt dtb_u_u1777) dtb_u_u1779) dtb_u_u1783))); B_dData_dPair.f_Pair_second = dtb_u_u1783 })))))))

# 1619 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseInstance = (fun (dtb_u_u1784 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1785 : int) (dtb_u_u1786 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1784) "instance")) (fun (dtb_u_u1787 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtxThenExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1787)) dtb_u_u1787) dtb_u_u1785)) (fun (dtb_u_u1788 : (Frontend_dAst.t_Expr B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) (dtb_u_u1789 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1788 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1790; B_dData_dPair.f_Pair_second = dtb_u_u1791 } -> ((((((v_parseInstanceTail dtb_u_u1790) dtb_u_u1791) dtb_u_u1784) dtb_u_u1785) dtb_u_u1786) dtb_u_u1789)
  | _ -> failwith "DT: impossible branch"
))))))

# 1760 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtorBody = (fun (dtb_u_u1792 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1793 : int) (dtb_u_u1794 : int) -> ((Base_dCommon.v_step (v_expectDeclName dtb_u_u1792)) (fun (dtb_u_u1795 : string) (dtb_u_u1796 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1796) ":")) (fun (dtb_u_u1797 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1797)) dtb_u_u1797) dtb_u_u1793)) (fun (dtb_u_u1798 : Frontend_dAst.t_Expr) (dtb_u_u1799 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind (v_rejectCtxSuffix dtb_u_u1799)) (fun (dtb_u_u1800 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Frontend_dAst.f_Ctor_ctorName = dtb_u_u1795; Frontend_dAst.f_Ctor_ctorType = dtb_u_u1798; Frontend_dAst.f_Ctor_ctorArity = (Frontend_dParser_dSupport.v_countArrows dtb_u_u1798); Frontend_dAst.f_Ctor_ctorRef = { Frontend_dAst.f_NodeRef_nodeRefId = dtb_u_u1794; Frontend_dAst.f_NodeRef_nodeRefSpan = ((Frontend_dParser_dSupport.v_spanOf dtb_u_u1792) dtb_u_u1799) } }; B_dData_dPair.f_Pair_second = dtb_u_u1800 })))))))))))

# 1756 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtor = (fun (dtb_u_u1801 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1802 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstCtorKind) v_semCtor) dtb_u_u1801) (fun (dtb_u_u1803 : Frontend_dParser_dSupport.t_PState) -> (((v_parseCtorBody dtb_u_u1803) dtb_u_u1802) (dtb_u_u1803).Frontend_dParser_dSupport.f_PState_openNodeId))))

# 1745 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseCtorList = (fun (dtb_u_u1804 : int) (dtb_u_u1805 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1806 : int) -> (if (dtb_u_u1804 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1805) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1805 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1805) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1807; Base_dSource.f_Pos_posCol = dtb_u_u1808; Base_dSource.f_Pos_posOffset = dtb_u_u1809; Base_dSource.f_Pos_posEndOffset = dtb_u_u1810 } -> (if (dtb_u_u1808 = dtb_u_u1806) then ((Base_dCommon.v_step ((v_parseCtor dtb_u_u1805) dtb_u_u1806)) (fun (dtb_u_u1811 : Frontend_dAst.t_Ctor) (dtb_u_u1812 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseCtorList (dtb_u_u1804 - 1)) dtb_u_u1812) dtb_u_u1806)) (fun (dtb_u_u1813 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u1814 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1811, dtb_u_u1813)); B_dData_dPair.f_Pair_second = dtb_u_u1814 })))))) else (if (dtb_u_u1808 > dtb_u_u1806) then ((v_ps0 dtb_u_u1805) Base_dDiagnostics_dFrontend.C_PsDiag_UnexpectedIndentInData) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1805 }))))
  | _ -> failwith "DT: impossible branch"
))))

# 1737 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseCtors = (fun (dtb_u_u1815 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1816 : int) -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1815) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1815 })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1815) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1817; Base_dSource.f_Pos_posCol = dtb_u_u1818; Base_dSource.f_Pos_posOffset = dtb_u_u1819; Base_dSource.f_Pos_posEndOffset = dtb_u_u1820 } -> (if (dtb_u_u1818 > dtb_u_u1816) then (((v_parseCtorList (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1815)) dtb_u_u1815) dtb_u_u1818) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u1815 })))
  | _ -> failwith "DT: impossible branch"
)))

# 875 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDataExport = (fun (dtb_u_u1821 : bool) (dtb_u_u1822 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1823 : int) (dtb_u_u1824 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1822) "data")) (fun (dtb_u_u1825 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1825)) (fun (dtb_u_u1826 : string) (dtb_u_u1827 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1827)) dtb_u_u1827)) (fun (dtb_u_u1828 : string B_dData_dList.t_List) (dtb_u_u1829 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseOptionalMembers dtb_u_u1829)) (fun (dtb_u_u1830 : Frontend_dAst.t_ExportMembers) (dtb_u_u1831 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1831) ":")) (fun (dtb_u_u1832 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1832)) dtb_u_u1832) dtb_u_u1823)) (fun (dtb_u_u1833 : Frontend_dAst.t_Expr) (dtb_u_u1834 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1834) "where")) (fun (dtb_u_u1835 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors dtb_u_u1835) dtb_u_u1823)) (fun (dtb_u_u1836 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u1837 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving dtb_u_u1837)) (fun (dtb_u_u1838 : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (dtb_u_u1839 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1838 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1840; B_dData_dPair.f_Pair_second = dtb_u_u1841 } -> (let dtb_u_u1842 = (Frontend_dAst.C_Decl_DData (dtb_u_u1826, dtb_u_u1828, dtb_u_u1833, dtb_u_u1836, dtb_u_u1840, dtb_u_u1841, Frontend_dAst.C_ReprTier_ReprAuto, dtb_u_u1821, (((v_declRefAt dtb_u_u1822) dtb_u_u1824) dtb_u_u1839))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1842)); f_ParsedDecl_parsedExport = (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_ExportSpec_ESType (dtb_u_u1826, dtb_u_u1830, (Frontend_dAst.v_declSpan dtb_u_u1842))))); f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1839 })))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))))

# 806 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearExport = (fun (dtb_u_u1843 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1844 : int) (dtb_u_u1845 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1843) "linear")) (fun (dtb_u_u1846 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1847 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1846) in (match dtb_u_u1847 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1848; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1849 } -> (match dtb_u_u1848 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1850) -> (if (dtb_u_u1850 = "data") then ((((v_parseDataExport true) dtb_u_u1846) dtb_u_u1844) dtb_u_u1845) else (if (dtb_u_u1850 = "record") then (((((v_parseRecordExport true) Frontend_dAst.C_ReprTier_ReprAuto) dtb_u_u1846) dtb_u_u1844) dtb_u_u1845) else (((v_ps1 dtb_u_u1846) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 dtb_u_u1846) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 698 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportedPlain = (fun (dtb_u_u1851 : Frontend_dAst.t_Opacity B_dData_dMaybe.t_Maybe) (dtb_u_u1852 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1853 : int) (dtb_u_u1854 : t_DeclStart) -> (let dtb_u_u1855 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1852) in (match dtb_u_u1855 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1856; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1857 } -> (match dtb_u_u1856 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u1858) -> ((((v_parseExportedValue dtb_u_u1851) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854)
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1859) -> (if (if (if (dtb_u_u1859 = "alias") then true else (dtb_u_u1859 = "boxed")) then (v_tierFollows dtb_u_u1852) else false) then (if (v_opacityGiven dtb_u_u1851) then (((v_ps1 dtb_u_u1852) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseTieredExport (if (dtb_u_u1859 = "alias") then Frontend_dAst.C_ReprTier_ReprAlias else Frontend_dAst.C_ReprTier_ReprBoxed)) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854)) else ((((v_parseExportedValue dtb_u_u1851) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1860) -> (if (dtb_u_u1860 = "data") then (if (v_opacityGiven dtb_u_u1851) then (((v_ps1 dtb_u_u1852) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else ((((v_parseDataExport false) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854)) else (if (dtb_u_u1860 = "linear") then (if (v_opacityGiven dtb_u_u1851) then (((v_ps1 dtb_u_u1852) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseLinearExport dtb_u_u1852) dtb_u_u1853) dtb_u_u1854)) else (if (dtb_u_u1860 = "record") then (if (v_opacityGiven dtb_u_u1851) then (((v_ps1 dtb_u_u1852) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((((v_parseRecordExport false) Frontend_dAst.C_ReprTier_ReprAuto) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854)) else (if (dtb_u_u1860 = "trait") then (if (v_opacityGiven dtb_u_u1851) then (((v_ps1 dtb_u_u1852) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature") else (((v_parseTraitExport dtb_u_u1852) dtb_u_u1853) dtb_u_u1854)) else (if (dtb_u_u1860 = "axiom") then ((((v_parseAxiomExport dtb_u_u1851) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854) else (if (dtb_u_u1860 = "extern") then ((((v_parseExternExport dtb_u_u1851) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854) else (if (dtb_u_u1860 = "transparent") then (if (v_tierFollows dtb_u_u1852) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprAlias) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854) else (((v_ps1 dtb_u_u1852) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else (if (dtb_u_u1860 = "opaque") then (if (v_tierFollows dtb_u_u1852) then ((((v_parseTieredExport Frontend_dAst.C_ReprTier_ReprBoxed) dtb_u_u1852) dtb_u_u1853) dtb_u_u1854) else (((v_ps1 dtb_u_u1852) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value signature"))) "value signature")) else ((v_ps0 dtb_u_u1852) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)))))))))
  | _ -> ((v_ps0 dtb_u_u1852) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 692 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDeclBody = (fun (dtb_u_u1861 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1862 : int) (dtb_u_u1863 : t_DeclStart) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1861)) (fun (dtb_u_u1864 : string) (dtb_u_u1865 : Frontend_dParser_dSupport.t_PState) -> (if (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u1865) "opaque") then (B_dData_dBool.v_not (v_tierFollows dtb_u_u1865)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1865) "opaque")) (fun (dtb_u_u1866 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityOpaque))) dtb_u_u1866) dtb_u_u1862) dtb_u_u1863))) else (if (if ((Frontend_dParser_dSupport.v_atKw dtb_u_u1865) "transparent") then (B_dData_dBool.v_not (v_tierFollows dtb_u_u1865)) else false) then ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1865) "transparent")) (fun (dtb_u_u1867 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityTransparent))) dtb_u_u1867) dtb_u_u1862) dtb_u_u1863))) else (if ((v_atIdentName dtb_u_u1865) "abstract") then ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1865)) (fun (dtb_u_u1868 : string) (dtb_u_u1869 : Frontend_dParser_dSupport.t_PState) -> ((((v_parseExportedValue (B_dData_dMaybe.C_Maybe_Just (Frontend_dAst.C_Opacity_OpacityAbstract))) dtb_u_u1869) dtb_u_u1862) dtb_u_u1863))) else ((((v_parseExportedPlain B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u1865) dtb_u_u1862) dtb_u_u1863)))))))

# 684 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseExportDecl = (fun (dtb_u_u1870 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1871 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semParsedDecl) dtb_u_u1870) (fun (dtb_u_u1872 : Frontend_dParser_dSupport.t_PState) -> (((v_parseExportDeclBody dtb_u_u1872) dtb_u_u1871) { f_DeclStart_declStartId = (dtb_u_u1872).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos dtb_u_u1872) }))))

# 1438 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseData = (fun (dtb_u_u1873 : bool) (dtb_u_u1874 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1875 : int) (dtb_u_u1876 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1874) "data")) (fun (dtb_u_u1877 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (Frontend_dParser_dSupport.v_expectIdent dtb_u_u1877)) (fun (dtb_u_u1878 : string) (dtb_u_u1879 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseParams (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1879)) dtb_u_u1879)) (fun (dtb_u_u1880 : string B_dData_dList.t_List) (dtb_u_u1881 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectSym dtb_u_u1881) ":")) (fun (dtb_u_u1882 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (((v_parseExpr (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1882)) dtb_u_u1882) dtb_u_u1875)) (fun (dtb_u_u1883 : Frontend_dAst.t_Expr) (dtb_u_u1884 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1884) "where")) (fun (dtb_u_u1885 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseCtors dtb_u_u1885) dtb_u_u1875)) (fun (dtb_u_u1886 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (dtb_u_u1887 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseDeriving dtb_u_u1887)) (fun (dtb_u_u1888 : (string B_dData_dList.t_List, bool) B_dData_dPair.t_Pair) (dtb_u_u1889 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1888 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1890; B_dData_dPair.f_Pair_second = dtb_u_u1891 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Decl_DData (dtb_u_u1878, dtb_u_u1880, dtb_u_u1883, dtb_u_u1886, dtb_u_u1890, dtb_u_u1891, Frontend_dAst.C_ReprTier_ReprAuto, dtb_u_u1873, (((v_declRefAt dtb_u_u1874) dtb_u_u1876) dtb_u_u1889))); B_dData_dPair.f_Pair_second = dtb_u_u1889 }))
  | _ -> failwith "DT: impossible branch"
))))))))))))))))))

# 1402 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseLinearDecl = (fun (dtb_u_u1892 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1893 : int) (dtb_u_u1894 : t_DeclStart) -> ((Base_dCommon.v_bind ((Frontend_dParser_dSupport.v_expectKw dtb_u_u1892) "linear")) (fun (dtb_u_u1895 : Frontend_dParser_dSupport.t_PState) -> (let dtb_u_u1896 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1895) in (match dtb_u_u1896 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1897; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1898 } -> (match dtb_u_u1897 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1899) -> (if (dtb_u_u1899 = "data") then ((((v_parseData true) dtb_u_u1895) dtb_u_u1893) dtb_u_u1894) else (if (dtb_u_u1899 = "record") then (((((v_parseRecord true) Frontend_dAst.C_ReprTier_ReprAuto) dtb_u_u1895) dtb_u_u1893) dtb_u_u1894) else (((v_ps1 dtb_u_u1895) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")))
  | _ -> (((v_ps1 dtb_u_u1895) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("data/record"))) "data/record")
)
  | _ -> failwith "DT: impossible branch"
)))))

# 1105 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDeclBody = (fun (dtb_u_u1900 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1901 : int) (dtb_u_u1902 : t_DeclStart) -> (let dtb_u_u1903 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1900) in (match dtb_u_u1903 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1904; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1905 } -> (match dtb_u_u1904 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u1906) -> (if (dtb_u_u1906 = "(") then ((Base_dCommon.v_step (v_expectDeclName dtb_u_u1900)) (fun (dtb_u_u1907 : string) (dtb_u_u1908 : Frontend_dParser_dSupport.t_PState) -> (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1908) ":") then (((((v_parseSignature dtb_u_u1908) dtb_u_u1901) true) dtb_u_u1907) dtb_u_u1902) else ((((v_parseClause dtb_u_u1908) dtb_u_u1901) dtb_u_u1907) dtb_u_u1902)))) else (if (Frontend_dParser_dSupport.v_isReservedValueName dtb_u_u1906) then ((v_ps0 dtb_u_u1900) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl) else (let dtb_u_u1909 = (Frontend_dParser_dSupport.v_advance dtb_u_u1900) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1909) ":") then (((((v_parseSignature dtb_u_u1909) dtb_u_u1901) true) dtb_u_u1906) dtb_u_u1902) else ((((v_parseClause dtb_u_u1909) dtb_u_u1901) dtb_u_u1906) dtb_u_u1902)))))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u1910) -> (if (if (dtb_u_u1910 = "alias") then (v_tierFollows dtb_u_u1900) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprAlias) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (if (if (dtb_u_u1910 = "boxed") then (v_tierFollows dtb_u_u1900) else false) then ((((v_parseTieredDecl Frontend_dAst.C_ReprTier_ReprBoxed) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (let dtb_u_u1911 = (Frontend_dParser_dSupport.v_advance dtb_u_u1900) in (if ((Frontend_dParser_dSupport.v_atSym dtb_u_u1911) ":") then (((((v_parseSignature dtb_u_u1911) dtb_u_u1901) true) dtb_u_u1910) dtb_u_u1902) else ((((v_parseClause dtb_u_u1911) dtb_u_u1901) dtb_u_u1910) dtb_u_u1902)))))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1912) -> (if (dtb_u_u1912 = "data") then ((((v_parseData false) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (if (dtb_u_u1912 = "linear") then (((v_parseLinearDecl dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (if (dtb_u_u1912 = "axiom") then (((v_parseAxiom dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (if (dtb_u_u1912 = "extern") then (((v_parseExtern dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (if (dtb_u_u1912 = "record") then (((((v_parseRecord false) Frontend_dAst.C_ReprTier_ReprAuto) dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (if (dtb_u_u1912 = "trait") then (((v_parseTrait dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else (if (dtb_u_u1912 = "instance") then (((v_parseInstance dtb_u_u1900) dtb_u_u1901) dtb_u_u1902) else ((v_ps0 dtb_u_u1900) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl))))))))
  | _ -> ((v_ps0 dtb_u_u1900) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedTopLevelDecl)
)
  | _ -> failwith "DT: impossible branch"
)))

# 1097 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseDecl = (fun (dtb_u_u1913 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1914 : int) -> ((((Frontend_dParser_dSupport.v_withExtent Frontend_dCst.C_CstKind_CstDeclKind) v_semDecl) dtb_u_u1913) (fun (dtb_u_u1915 : Frontend_dParser_dSupport.t_PState) -> (((v_parseDeclBody dtb_u_u1915) dtb_u_u1914) { f_DeclStart_declStartId = (dtb_u_u1915).Frontend_dParser_dSupport.f_PState_openNodeId; f_DeclStart_declStartPos = (Frontend_dParser_dSupport.v_peekPos dtb_u_u1915) }))))

# 623 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseFixityOrDecl = (fun (dtb_u_u1916 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1917 : int) -> (let dtb_u_u1918 = (Frontend_dParser_dSupport.v_peekTok dtb_u_u1916) in (match dtb_u_u1918 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u1919; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u1920 } -> (match dtb_u_u1919 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u1921) -> (if (dtb_u_u1921 = "infixl") then ((Base_dCommon.v_step ((((v_parseFixityDecl dtb_u_u1916) dtb_u_u1917) 1) dtb_u_u1920)) (fun (dtb_u_u1922 : Frontend_dAst.t_FixityDecl) (dtb_u_u1923 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1922)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1923 })))) else (if (dtb_u_u1921 = "infixr") then ((Base_dCommon.v_step ((((v_parseFixityDecl dtb_u_u1916) dtb_u_u1917) 2) dtb_u_u1920)) (fun (dtb_u_u1924 : Frontend_dAst.t_FixityDecl) (dtb_u_u1925 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1924)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1925 })))) else (if (dtb_u_u1921 = "infix") then ((Base_dCommon.v_step ((((v_parseFixityDecl dtb_u_u1916) dtb_u_u1917) 0) dtb_u_u1920)) (fun (dtb_u_u1926 : Frontend_dAst.t_FixityDecl) (dtb_u_u1927 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1926)); f_ParsedDecl_parsedDecl = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1927 })))) else (if (v_exportStart dtb_u_u1916) then ((v_parseExportDecl dtb_u_u1916) dtb_u_u1917) else (if (v_opacityStart dtb_u_u1916) then ((v_parseOpacityDecl dtb_u_u1916) dtb_u_u1917) else ((Base_dCommon.v_step ((v_parseDecl dtb_u_u1916) dtb_u_u1917)) (fun (dtb_u_u1928 : Frontend_dAst.t_Decl) (dtb_u_u1929 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1928)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1929 })))))))))
  | _ -> (if (v_exportStart dtb_u_u1916) then ((v_parseExportDecl dtb_u_u1916) dtb_u_u1917) else (if (v_opacityStart dtb_u_u1916) then ((v_parseOpacityDecl dtb_u_u1916) dtb_u_u1917) else ((Base_dCommon.v_step ((v_parseDecl dtb_u_u1916) dtb_u_u1917)) (fun (dtb_u_u1930 : Frontend_dAst.t_Decl) (dtb_u_u1931 : Frontend_dParser_dSupport.t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_ParsedDecl_parsedFixity = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedDecl = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1930)); f_ParsedDecl_parsedExport = B_dData_dMaybe.C_Maybe_Nothing; f_ParsedDecl_parsedOpacity = B_dData_dMaybe.C_Maybe_Nothing }; B_dData_dPair.f_Pair_second = dtb_u_u1931 }))))))
)
  | _ -> failwith "DT: impossible branch"
)))

# 538 "Vuna/Compiler/Frontend/Parser.vuna"
let rec v_parseDecls = (fun (dtb_u_u1932 : bool) (dtb_u_u1933 : int) (dtb_u_u1934 : Frontend_dParser_dSupport.t_PState) (dtb_u_u1935 : int) (dtb_u_u1936 : t_DeclAcc) (dtb_u_u1937 : t_DeclBlock) -> (if (dtb_u_u1933 <= 0) then (Base_dDiag.v_icFuel "parser") else (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1934) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (v_reverseDeclAcc dtb_u_u1936); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1934; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil } })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1934) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1938; Base_dSource.f_Pos_posCol = dtb_u_u1939; Base_dSource.f_Pos_posOffset = dtb_u_u1940; Base_dSource.f_Pos_posEndOffset = dtb_u_u1941 } -> (if (dtb_u_u1939 = dtb_u_u1935) then (match ((v_parseFixityOrDecl dtb_u_u1934) dtb_u_u1935) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1942) -> (if dtb_u_u1932 then (let dtb_u_u1943 = ((v_recoverDecl dtb_u_u1934) dtb_u_u1935) in ((Base_dCommon.v_step ((((((v_parseDecls true) (dtb_u_u1933 - 1)) dtb_u_u1943) dtb_u_u1935) dtb_u_u1936) (v_dbClose dtb_u_u1937))) (fun (dtb_u_u1944 : t_DeclAcc) (dtb_u_u1945 : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1945 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1946; B_dData_dPair.f_Pair_second = dtb_u_u1947 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1944; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1946; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1942, dtb_u_u1947)) } }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_ErrC (dtb_u_u1942)))
  | Base_dDiag.C_Check_OkC (dtb_u_u1948) -> (let dtb_u_u1949 = (B_dData_dPair.v_firstOf dtb_u_u1948) in (let dtb_u_u1950 = (B_dData_dPair.v_secondOf dtb_u_u1948) in (let dtb_u_u1951 = ((v_addParsedDecl dtb_u_u1949) dtb_u_u1936) in (let dtb_u_u1952 = ((v_blockStep dtb_u_u1937) dtb_u_u1949) in (match (B_dData_dPair.v_firstOf dtb_u_u1952) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1953) -> (if dtb_u_u1932 then ((Base_dCommon.v_step ((((((v_parseDecls true) (dtb_u_u1933 - 1)) dtb_u_u1950) dtb_u_u1935) dtb_u_u1951) (B_dData_dPair.v_secondOf dtb_u_u1952))) (fun (dtb_u_u1954 : t_DeclAcc) (dtb_u_u1955 : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1955 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1956; B_dData_dPair.f_Pair_second = dtb_u_u1957 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1954; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1956; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1953, dtb_u_u1957)) } }))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dDiag.C_Check_ErrC (dtb_u_u1953)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_parseDecls dtb_u_u1932) (dtb_u_u1933 - 1)) dtb_u_u1950) dtb_u_u1935) dtb_u_u1951) (B_dData_dPair.v_secondOf dtb_u_u1952))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) else (((v_ps1 dtb_u_u1934) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedDeclAtColumn ((string_of_int dtb_u_u1935)))) (string_of_int dtb_u_u1935)))
  | _ -> failwith "DT: impossible branch"
))))

# 221 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceFile = (fun (dtb_u_u1958 : bool) (dtb_u_u1959 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step (v_parseModDecl dtb_u_u1959)) (fun (dtb_u_u1960 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (dtb_u_u1961 : Frontend_dParser_dSupport.t_PState) -> ((Base_dCommon.v_step ((v_parseImports (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1961)) dtb_u_u1961)) (fun (dtb_u_u1962 : (Frontend_dAst.t_Import B_dData_dList.t_List, Frontend_dAst.t_ExportItem B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u1963 : Frontend_dParser_dSupport.t_PState) -> (match dtb_u_u1962 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1964; B_dData_dPair.f_Pair_second = dtb_u_u1965 } -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1963) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u1960; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u1964; Frontend_dAst.f_SourceFile_sourceFileFixities = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileDecls = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileExports = B_dData_dList.C_List_Nil; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u1965; Frontend_dAst.f_SourceFile_sourceFileOpacity = B_dData_dList.C_List_Nil }; B_dData_dPair.f_Pair_second = dtb_u_u1963 }; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) else (match (Frontend_dParser_dSupport.v_peekPos dtb_u_u1963) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u1966; Base_dSource.f_Pos_posCol = dtb_u_u1967; Base_dSource.f_Pos_posOffset = dtb_u_u1968; Base_dSource.f_Pos_posEndOffset = dtb_u_u1969 } -> ((Base_dCommon.v_step ((((((v_parseDecls dtb_u_u1958) (Frontend_dParser_dSupport.v_stateFuel dtb_u_u1963)) dtb_u_u1963) dtb_u_u1967) v_emptyDeclAcc) v_emptyDeclBlock)) (fun (dtb_u_u1970 : t_DeclAcc) (dtb_u_u1971 : (Frontend_dParser_dSupport.t_PState, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1971 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1972; B_dData_dPair.f_Pair_second = dtb_u_u1973 } -> (match dtb_u_u1970 with
  | { f_DeclAcc_declAccFixities = dtb_u_u1974; f_DeclAcc_declAccDecls = dtb_u_u1975; f_DeclAcc_declAccExports = dtb_u_u1976; f_DeclAcc_declAccOpacity = dtb_u_u1977 } -> (if (Frontend_dParser_dSupport.v_isEof dtb_u_u1972) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u1960; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u1964; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u1974; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u1975; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u1976; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u1965; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u1977 }; B_dData_dPair.f_Pair_second = dtb_u_u1972 }; B_dData_dPair.f_Pair_second = dtb_u_u1973 })) else ((v_ps0 dtb_u_u1972) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedEndOfInput))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))))

# 57 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceCore = (fun (dtb_u_u1978 : Frontend_dParser_dSupport.t_EventMode) (dtb_u_u1979 : string) (dtb_u_u1980 : string) -> (let dtb_u_u1981 = (Frontend_dLexer.v_lexSourceWithComments dtb_u_u1980) in (match dtb_u_u1981 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1982) -> (match dtb_u_u1982 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1983; B_dData_dPair.f_Pair_second = dtb_u_u1984 } -> (let dtb_u_u1985 = (((((Frontend_dParser_dSupport.v_mkState dtb_u_u1979) dtb_u_u1980) dtb_u_u1983) Frontend_dParser_dSupport.C_ParseMode_PmTool) dtb_u_u1978) in (match ((v_parseSourceFile false) dtb_u_u1985) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1986) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1986))
  | Base_dDiag.C_Check_OkC (dtb_u_u1987) -> (Base_dDiag.C_Check_OkC ({ f_ParsedCore_pcSource = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u1987)); f_ParsedCore_pcComments = dtb_u_u1984; f_ParsedCore_pcToks = dtb_u_u1983; f_ParsedCore_pcFin = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u1987)) }))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1988) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1988))
  | _ -> failwith "DT: impossible branch"
)))

# 74 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceDetailed = (fun (dtb_u_u1989 : string) (dtb_u_u1990 : string) -> (match (((v_parseSourceCore Frontend_dParser_dSupport.C_EventMode_EvFull) dtb_u_u1989) dtb_u_u1990) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1991) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1991))
  | Base_dDiag.C_Check_OkC (dtb_u_u1992) -> (let dtb_u_u1993 = (Frontend_dParser_dSupport.v_eventsOf (dtb_u_u1992).f_ParsedCore_pcFin) in (let dtb_u_u1994 = (((((((Frontend_dCst.v_nestToTreeWithSurface (((Frontend_dCst.v_lexTokensOf dtb_u_u1990) (dtb_u_u1992).f_ParsedCore_pcToks) (dtb_u_u1992).f_ParsedCore_pcComments)) dtb_u_u1993) ((Frontend_dCst.v_parenEntriesOf (dtb_u_u1992).f_ParsedCore_pcToks) dtb_u_u1993)) ((dtb_u_u1992).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_backtickShapes) ((dtb_u_u1992).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_sectionShapes) ((dtb_u_u1992).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_interpMultis) ((dtb_u_u1992).f_ParsedCore_pcFin).Frontend_dParser_dSupport.f_PState_templateHoles) in (Base_dDiag.C_Check_OkC ({ f_ParsedSource_parsedFile = (Frontend_dAstView.v_ofTree dtb_u_u1994); f_ParsedSource_parsedComments = (dtb_u_u1992).f_ParsedCore_pcComments; f_ParsedSource_parsedRawToks = (dtb_u_u1992).f_ParsedCore_pcToks; f_ParsedSource_parsedCst = dtb_u_u1994 }))))
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceWithComments = (fun (dtb_u_u1995 : string) (dtb_u_u1996 : string) -> (match (((v_parseSourceCore Frontend_dParser_dSupport.C_EventMode_EvNone) dtb_u_u1995) dtb_u_u1996) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1997) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1997))
  | Base_dDiag.C_Check_OkC (dtb_u_u1998) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb_u_u1998).f_ParsedCore_pcSource; B_dData_dPair.f_Pair_second = (dtb_u_u1998).f_ParsedCore_pcComments }))
  | _ -> failwith "DT: impossible branch"
))

# 103 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSource = (fun (dtb_u_u1999 : string) (dtb_u_u2000 : string) -> (let dtb_u_u2001 = ((v_parseSourceWithComments dtb_u_u1999) dtb_u_u2000) in (match dtb_u_u2001 with
  | Base_dDiag.C_Check_OkC (dtb_u_u2002) -> (match dtb_u_u2002 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u2003; B_dData_dPair.f_Pair_second = dtb_u_u2004 } -> (Base_dDiag.C_Check_OkC (dtb_u_u2003))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u2005) -> (Base_dDiag.C_Check_ErrC (dtb_u_u2005))
  | _ -> failwith "DT: impossible branch"
)))

# 2942 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecoveringTokens = (fun (dtb_u_u2006 : string) (dtb_u_u2007 : string) (dtb_u_u2008 : Frontend_dParser_dSupport.t_ParseMode) (dtb_u_u2009 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (let dtb_u_u2010 = (((((Frontend_dParser_dSupport.v_mkState dtb_u_u2006) dtb_u_u2007) dtb_u_u2009) dtb_u_u2008) Frontend_dParser_dSupport.C_EventMode_EvLayout) in ((Base_dCommon.v_bind ((v_parseSourceFile true) dtb_u_u2010)) (fun (dtb_u_u2011 : ((Frontend_dAst.t_SourceFile, Frontend_dParser_dSupport.t_PState) B_dData_dPair.t_Pair, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (let dtb_u_u2012 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u2011)) in (let dtb_u_u2013 = (Frontend_dParser_dSupport.v_eventsOf dtb_u_u2012) in (let dtb_u_u2014 = ((Frontend_dCst.v_parenEntriesOf dtb_u_u2009) dtb_u_u2013) in (let dtb_u_u2015 = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) (dtb_u_u2012).Frontend_dParser_dSupport.f_PState_templateHoles) in (let dtb_u_u2016 = ((((Frontend_dCst.v_fixityFactsOfParts dtb_u_u2014) (dtb_u_u2012).Frontend_dParser_dSupport.f_PState_backtickShapes) (dtb_u_u2012).Frontend_dParser_dSupport.f_PState_sectionShapes) dtb_u_u2015) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u2011)); B_dData_dPair.f_Pair_second = dtb_u_u2016 }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u2011) })))))))))))

# 2930 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parseSourceRecovering = (fun (dtb_u_u2017 : string) (dtb_u_u2018 : string) -> ((Base_dCommon.v_bind (Frontend_dLexer.v_lexSource dtb_u_u2018)) (fun (dtb_u_u2019 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> ((((v_parseSourceRecoveringTokens dtb_u_u2017) dtb_u_u2018) Frontend_dParser_dSupport.C_ParseMode_PmStrict) dtb_u_u2019))))

# 36 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedFile = (fun (dtb_u_u2020 : t_ParsedSource) -> (match dtb_u_u2020 with
  | { f_ParsedSource_parsedFile = dtb_u_u2021; f_ParsedSource_parsedComments = dtb_u_u2022; f_ParsedSource_parsedRawToks = dtb_u_u2023; f_ParsedSource_parsedCst = dtb_u_u2024 } -> dtb_u_u2021
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedComments = (fun (dtb_u_u2025 : t_ParsedSource) -> (match dtb_u_u2025 with
  | { f_ParsedSource_parsedFile = dtb_u_u2026; f_ParsedSource_parsedComments = dtb_u_u2027; f_ParsedSource_parsedRawToks = dtb_u_u2028; f_ParsedSource_parsedCst = dtb_u_u2029 } -> dtb_u_u2027
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedRawToks = (fun (dtb_u_u2030 : t_ParsedSource) -> (match dtb_u_u2030 with
  | { f_ParsedSource_parsedFile = dtb_u_u2031; f_ParsedSource_parsedComments = dtb_u_u2032; f_ParsedSource_parsedRawToks = dtb_u_u2033; f_ParsedSource_parsedCst = dtb_u_u2034 } -> dtb_u_u2033
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedCst = (fun (dtb_u_u2035 : t_ParsedSource) -> (match dtb_u_u2035 with
  | { f_ParsedSource_parsedFile = dtb_u_u2036; f_ParsedSource_parsedComments = dtb_u_u2037; f_ParsedSource_parsedRawToks = dtb_u_u2038; f_ParsedSource_parsedCst = dtb_u_u2039 } -> dtb_u_u2039
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcSource = (fun (dtb_u_u2040 : t_ParsedCore) -> (match dtb_u_u2040 with
  | { f_ParsedCore_pcSource = dtb_u_u2041; f_ParsedCore_pcComments = dtb_u_u2042; f_ParsedCore_pcToks = dtb_u_u2043; f_ParsedCore_pcFin = dtb_u_u2044 } -> dtb_u_u2041
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcComments = (fun (dtb_u_u2045 : t_ParsedCore) -> (match dtb_u_u2045 with
  | { f_ParsedCore_pcSource = dtb_u_u2046; f_ParsedCore_pcComments = dtb_u_u2047; f_ParsedCore_pcToks = dtb_u_u2048; f_ParsedCore_pcFin = dtb_u_u2049 } -> dtb_u_u2047
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcToks = (fun (dtb_u_u2050 : t_ParsedCore) -> (match dtb_u_u2050 with
  | { f_ParsedCore_pcSource = dtb_u_u2051; f_ParsedCore_pcComments = dtb_u_u2052; f_ParsedCore_pcToks = dtb_u_u2053; f_ParsedCore_pcFin = dtb_u_u2054 } -> dtb_u_u2053
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Parser.vuna"
let v_pcFin = (fun (dtb_u_u2055 : t_ParsedCore) -> (match dtb_u_u2055 with
  | { f_ParsedCore_pcSource = dtb_u_u2056; f_ParsedCore_pcComments = dtb_u_u2057; f_ParsedCore_pcToks = dtb_u_u2058; f_ParsedCore_pcFin = dtb_u_u2059 } -> dtb_u_u2059
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccFixities = (fun (dtb_u_u2060 : t_DeclAcc) -> (match dtb_u_u2060 with
  | { f_DeclAcc_declAccFixities = dtb_u_u2061; f_DeclAcc_declAccDecls = dtb_u_u2062; f_DeclAcc_declAccExports = dtb_u_u2063; f_DeclAcc_declAccOpacity = dtb_u_u2064 } -> dtb_u_u2061
  | _ -> failwith "DT: impossible branch"
))

# 118 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccDecls = (fun (dtb_u_u2065 : t_DeclAcc) -> (match dtb_u_u2065 with
  | { f_DeclAcc_declAccFixities = dtb_u_u2066; f_DeclAcc_declAccDecls = dtb_u_u2067; f_DeclAcc_declAccExports = dtb_u_u2068; f_DeclAcc_declAccOpacity = dtb_u_u2069 } -> dtb_u_u2067
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccExports = (fun (dtb_u_u2070 : t_DeclAcc) -> (match dtb_u_u2070 with
  | { f_DeclAcc_declAccFixities = dtb_u_u2071; f_DeclAcc_declAccDecls = dtb_u_u2072; f_DeclAcc_declAccExports = dtb_u_u2073; f_DeclAcc_declAccOpacity = dtb_u_u2074 } -> dtb_u_u2073
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declAccOpacity = (fun (dtb_u_u2075 : t_DeclAcc) -> (match dtb_u_u2075 with
  | { f_DeclAcc_declAccFixities = dtb_u_u2076; f_DeclAcc_declAccDecls = dtb_u_u2077; f_DeclAcc_declAccExports = dtb_u_u2078; f_DeclAcc_declAccOpacity = dtb_u_u2079 } -> dtb_u_u2079
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedFixity = (fun (dtb_u_u2080 : t_ParsedDecl) -> (match dtb_u_u2080 with
  | { f_ParsedDecl_parsedFixity = dtb_u_u2081; f_ParsedDecl_parsedDecl = dtb_u_u2082; f_ParsedDecl_parsedExport = dtb_u_u2083; f_ParsedDecl_parsedOpacity = dtb_u_u2084 } -> dtb_u_u2081
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedDecl = (fun (dtb_u_u2085 : t_ParsedDecl) -> (match dtb_u_u2085 with
  | { f_ParsedDecl_parsedFixity = dtb_u_u2086; f_ParsedDecl_parsedDecl = dtb_u_u2087; f_ParsedDecl_parsedExport = dtb_u_u2088; f_ParsedDecl_parsedOpacity = dtb_u_u2089 } -> dtb_u_u2087
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedExport = (fun (dtb_u_u2090 : t_ParsedDecl) -> (match dtb_u_u2090 with
  | { f_ParsedDecl_parsedFixity = dtb_u_u2091; f_ParsedDecl_parsedDecl = dtb_u_u2092; f_ParsedDecl_parsedExport = dtb_u_u2093; f_ParsedDecl_parsedOpacity = dtb_u_u2094 } -> dtb_u_u2093
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Frontend/Parser.vuna"
let v_parsedOpacity = (fun (dtb_u_u2095 : t_ParsedDecl) -> (match dtb_u_u2095 with
  | { f_ParsedDecl_parsedFixity = dtb_u_u2096; f_ParsedDecl_parsedDecl = dtb_u_u2097; f_ParsedDecl_parsedExport = dtb_u_u2098; f_ParsedDecl_parsedOpacity = dtb_u_u2099 } -> dtb_u_u2099
  | _ -> failwith "DT: impossible branch"
))

# 136 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declStartId = (fun (dtb_u_u2100 : t_DeclStart) -> (match dtb_u_u2100 with
  | { f_DeclStart_declStartId = dtb_u_u2101; f_DeclStart_declStartPos = dtb_u_u2102 } -> dtb_u_u2101
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Frontend/Parser.vuna"
let v_declStartPos = (fun (dtb_u_u2103 : t_DeclStart) -> (match dtb_u_u2103 with
  | { f_DeclStart_declStartId = dtb_u_u2104; f_DeclStart_declStartPos = dtb_u_u2105 } -> dtb_u_u2105
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbOpen = (fun (dtb_u_u2106 : t_DeclBlock) -> (match dtb_u_u2106 with
  | { f_DeclBlock_dbOpen = dtb_u_u2107; f_DeclBlock_dbClauses = dtb_u_u2108; f_DeclBlock_dbFirst = dtb_u_u2109 } -> dtb_u_u2107
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbClauses = (fun (dtb_u_u2110 : t_DeclBlock) -> (match dtb_u_u2110 with
  | { f_DeclBlock_dbOpen = dtb_u_u2111; f_DeclBlock_dbClauses = dtb_u_u2112; f_DeclBlock_dbFirst = dtb_u_u2113 } -> dtb_u_u2112
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Frontend/Parser.vuna"
let v_dbFirst = (fun (dtb_u_u2114 : t_DeclBlock) -> (match dtb_u_u2114 with
  | { f_DeclBlock_dbOpen = dtb_u_u2115; f_DeclBlock_dbClauses = dtb_u_u2116; f_DeclBlock_dbFirst = dtb_u_u2117 } -> dtb_u_u2117
  | _ -> failwith "DT: impossible branch"
))

# 962 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadName = (fun (dtb_u_u2118 : t_TraitHead) -> (match dtb_u_u2118 with
  | { f_TraitHead_traitHeadName = dtb_u_u2119; f_TraitHead_traitHeadParams = dtb_u_u2120; f_TraitHead_traitHeadSupers = dtb_u_u2121 } -> dtb_u_u2119
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadParams = (fun (dtb_u_u2122 : t_TraitHead) -> (match dtb_u_u2122 with
  | { f_TraitHead_traitHeadName = dtb_u_u2123; f_TraitHead_traitHeadParams = dtb_u_u2124; f_TraitHead_traitHeadSupers = dtb_u_u2125 } -> dtb_u_u2124
  | _ -> failwith "DT: impossible branch"
))

# 964 "Vuna/Compiler/Frontend/Parser.vuna"
let v_traitHeadSupers = (fun (dtb_u_u2126 : t_TraitHead) -> (match dtb_u_u2126 with
  | { f_TraitHead_traitHeadName = dtb_u_u2127; f_TraitHead_traitHeadParams = dtb_u_u2128; f_TraitHead_traitHeadSupers = dtb_u_u2129 } -> dtb_u_u2129
  | _ -> failwith "DT: impossible branch"
))
