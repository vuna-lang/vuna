open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dAst_dField = { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName : string; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod = { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitParam = { f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind : t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dMaybe.t_Base_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild of (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt of (int) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dInterpPart = C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText of (string) | C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole of (t_Vuna_dCompiler_dFrontend_dAst_dExpr)
and t_Vuna_dCompiler_dFrontend_dAst_dQty = C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1
and t_Vuna_dCompiler_dFrontend_dAst_dReprTier = C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt of (int) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam of (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun of ((t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp of (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dInterpPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl = { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp : string; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dDoStmt = C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dCtor = { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName : string; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity : int; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dDecl = C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dField Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitParam Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance of (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportItem = C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome of (string) * (string Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportMembers = C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMNone | C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMAll | C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMOnly of (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dAst_dExportSpec = C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue of (string) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExportMembers) * (Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dOpacity = C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityOpaque | C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityTransparent | C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityAbstract
and t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec = { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName : string; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind : t_Vuna_dCompiler_dFrontend_dAst_dOpacity; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dModDecl = { f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName : string; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList : bool; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems : t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports : t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dSourceFile = { f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl : t_Vuna_dCompiler_dFrontend_dAst_dModDecl Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports : t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities : t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports : t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec Base_dList.t_Base_dList_dList }
and t_Vuna_dCompiler_dFrontend_dAst_dImport = { f_Vuna_dCompiler_dFrontend_dAst_dImport_importName : string; f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified : bool; f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dSpan }

# 45 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> false
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dreprPrefix = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed -> "boxed "
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> "alias "
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp = dtb__0; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel = dtb__1; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc = dtb__2; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget = dtb__3; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan = dtb__4 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportSpecName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__5, dtb__6, dtb__7) -> dtb__5
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 182 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportSpecSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__10, dtb__11, dtb__12) -> dtb__12
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__13, dtb__14) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName = dtb__15; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind = dtb__16; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan = dtb__17 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName = dtb__18; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind = dtb__19; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan = dtb__20 } -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dpatSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__21, dtb__22, dtb__23) -> dtb__23
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__24, dtb__25) -> dtb__25
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__26, dtb__27) -> dtb__27
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__28, dtb__29, dtb__30) -> dtb__30
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__31) -> dtb__31
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__32, dtb__33, dtb__34) -> dtb__34
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__35, dtb__36) -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__37, dtb__38, dtb__39) -> dtb__39
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__40, dtb__41, dtb__42) -> dtb__42
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__43, dtb__44) -> dtb__44
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__45, dtb__46, dtb__47) -> dtb__47
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__48, dtb__49, dtb__50) -> dtb__50
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__51, dtb__52, dtb__53) -> dtb__53
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__54, dtb__55, dtb__56, dtb__57) -> dtb__57
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__58, dtb__59, dtb__60) -> dtb__60
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__61, dtb__62) -> dtb__62
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__63, dtb__64, dtb__65, dtb__66) -> dtb__66
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__72
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__73, dtb__74, dtb__75) -> dtb__75
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__76, dtb__77, dtb__78) -> dtb__78
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__79, dtb__80) -> dtb__80
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__81, dtb__82) -> dtb__82
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__83, dtb__84) -> dtb__84
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__85, dtb__86, dtb__87) -> dtb__87
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__88, dtb__89, dtb__90) -> dtb__90
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__91, dtb__92) -> dtb__92
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__93, dtb__94, dtb__95, dtb__96) -> dtb__96
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__97, dtb__98) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__97)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__99, dtb__100, dtb__101, dtb__102) -> dtb__102
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__103, dtb__104) -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__105, dtb__106) -> dtb__106
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__107, dtb__108, dtb__109) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__110, dtb__111) -> dtb__110
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__112, dtb__113, dtb__114) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__118
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> dtb__123
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> dtb__131
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__132, dtb__133, dtb__134, dtb__135) -> dtb__135
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__136, dtb__137, dtb__138, dtb__139) -> dtb__139
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__140, dtb__141, dtb__142, dtb__143) -> dtb__143
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__144, dtb__145, dtb__146) -> dtb__146
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> dtb__155
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__156; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__157; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__158; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__159 } -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__160; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__161; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__162 } -> dtb__162
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__163; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__164; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__165 } -> dtb__163
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__166; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__167; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__168 } -> dtb__167
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__169; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__170; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__171 } -> dtb__169
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__172; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__173; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__174 } -> dtb__174
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__175, dtb__176) -> dtb__176
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__177, dtb__178, dtb__179) -> dtb__179
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__180, dtb__181) -> dtb__181
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__182, dtb__183) -> dtb__183
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185) -> (match dtb__184 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__186, dtb__187, dtb__188, dtb__189) -> (if (dtb__186 = mc1) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 }, ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__185) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__185) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__185) mc1)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name))

# 318 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name decls -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (match dtb__190 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__192; Base_dPair.f_Base_dPair_dPair_second = dtb__193 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__192)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)))

# 323 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__194; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__195; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__196; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__197 } -> dtb__194
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorShortName = (fun name -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dlastSeg name))

# 335 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__198; Base_dPair.f_Base_dPair_dPair_second = dtb__199 } -> (match dtb__198 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__199
  | _ -> (match (Base_dList.v_Base_dList_dreverse dtb__198) with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__199
  | Base_dList.C_Base_dList_dList_Cons (dtb__200, dtb__201) -> (String.concat "" [dtb__200; "."; dtb__199])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name))))

# 342 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__202; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__203; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__204; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__205 } -> dtb__203
  | _ -> failwith "DT: impossible branch"
))

# 345 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__206, dtb__207, dtb__208) -> (match dtb__206 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__209, dtb__210) -> (if (dtb__209 = "->") then (match dtb__207 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__211, dtb__212) -> (match dtb__212 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__213, dtb__214) -> (match dtb__214 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__213))
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

# 349 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__215, dtb__216) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__215) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtb__215).f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity)) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__216))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match dtb__217 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__222) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__218)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__229, dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236) -> (if (mc0 = dtb__229) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__231))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__218))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__218)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 364 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__237, dtb__238, dtb__239, dtb__240) -> Base_dList.C_Base_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__244)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__246, dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253) -> (Base_dList.C_Base_dList_dList_Cons (dtb__246, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__254, dtb__255, dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__257)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__263, dtb__264, dtb__265, dtb__266) -> (Base_dList.C_Base_dList_dList_Cons (dtb__263, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__267, dtb__268, dtb__269, dtb__270) -> (Base_dList.C_Base_dList_dList_Cons (dtb__267, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__271, dtb__272, dtb__273) -> (Base_dList.C_Base_dList_dList_Cons (dtb__271, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__274, dtb__275, dtb__276, dtb__277) -> (Base_dList.C_Base_dList_dList_Cons (dtb__274, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 377 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

# 380 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> (Base_dList.C_Base_dList_dList_Cons (dtb__278, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__281)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__283, dtb__284, dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290) -> (Base_dList.C_Base_dList_dList_Cons (dtb__283, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__291, dtb__292, dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> (Base_dList.C_Base_dList_dList_Cons (dtb__291, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__294)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

# 387 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__303)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__305, dtb__306, dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312) -> (Base_dList.C_Base_dList_dList_Cons (dtb__305, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__313, dtb__314, dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__316)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 393 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

# 396 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326) -> (Base_dList.C_Base_dList_dList_Cons (dtb__322, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334) -> (Base_dList.C_Base_dList_dList_Cons (dtb__327, Base_dList.C_Base_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__335, dtb__336, dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> (Base_dList.C_Base_dList_dList_Cons (dtb__335, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 402 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

# 405 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> dtb__347
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__352, dtb__353, dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360) -> dtb__356
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 419 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dholeNamed = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (if (dtb__361 = 63) then (match dtb__362 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__363, dtb__364) -> true
  | _ -> false
) else false)
  | _ -> false
)) (Base_dList.dtp_unpack name)))

# 416 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHoleName = (fun name -> (if (name = "_") then true else (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name)))

# 425 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name) then name else ""))

# 435 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix = "@vuna@"

# 439 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix = "@vuna@ctor@"

# 443 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix) name))

# 447 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_ddropNChars = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__365, dtb__366) -> ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (n - 1)) dtb__366)
  | _ -> failwith "DT: impossible branch"
)))

# 454 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix = (fun p name -> (if ((Base_dString.v_Base_dString_dstartsWith p) name) then (Base_dList.dtp_pack ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (bi_strLength p)) (Base_dList.dtp_unpack name))) else name))

# 459 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__367, dtb__368) -> (match dtb__368 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__367
  | _ -> (String.concat "" [dtb__367; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt dtb__368)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorName = (fun short targets -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)]))

# 469 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort = (fun name -> (match ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | Base_dList.C_Base_dList_dList_Cons (dtb__369, dtb__370) -> dtb__369
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets = (fun name -> (match ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__371, dtb__372) -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

# 481 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name))

# 487 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax = "@vuna@list@nil"

# 491 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax = "@vuna@list@cons"

# 495 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax))

# 499 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax))

# 521 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax = "@vuna@perform"

# 525 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax))

# 537 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax = "@vuna@handle"

# 541 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHandleSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax))

# 545 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax = "@vuna@handle@noret"

# 549 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax))

# 555 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax = "@vuna@row@at"

# 559 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax))

# 566 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax = "@vuna@app@at"

# 570 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax))

# 575 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax = "@vuna@inst@arg"

# 579 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax))

# 591 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix = "@vuna@macro@"

# 595 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxName = (fun name -> (v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix ^ name))

# 599 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix) name))

# 603 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroNameOf = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName name) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix) name))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 608 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix = "@vuna@do@bind@"

# 612 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 616 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName = (fun canonical -> (v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix ^ canonical))

# 620 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName = (fun canonical -> (v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix ^ canonical))

# 624 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))

# 628 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))

# 633 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName name) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))) else (if (v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName name) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
