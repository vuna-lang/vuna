open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dAst_dField = { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName : string; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod = { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitParam = { f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind : t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild of (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt of (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dInterpPart = C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText of (string) | C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole of (t_Vuna_dCompiler_dFrontend_dAst_dExpr)
and t_Vuna_dCompiler_dFrontend_dAst_dQty = C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1
and t_Vuna_dCompiler_dFrontend_dAst_dReprTier = C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt of (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam of ((string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun of ((t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp of (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dInterpPart Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl = { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp : string; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dDoStmt = C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dCtor = { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName : string; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity : int; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dDecl = C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData of (string) * (string Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) * (string Base_dData_dList.t_Base_dData_dList_dList) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord of (string) * (string Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dField Base_dData_dList.t_Base_dData_dList_dList) * (string Base_dData_dList.t_Base_dData_dList_dList) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dReprTier) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitParam Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance of (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportItem = C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome of (string) * (string Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace of (string) * (string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportMembers = C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMNone | C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMAll | C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMOnly of (string Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dFrontend_dAst_dExportSpec = C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExportMembers) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dOpacity = C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityOpaque | C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityTransparent | C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityAbstract
and t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec = { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName : string; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind : t_Vuna_dCompiler_dFrontend_dAst_dOpacity; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dModDecl = { f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName : string; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList : bool; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems : t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports : t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dSourceFile = { f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl : t_Vuna_dCompiler_dFrontend_dAst_dModDecl Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports : t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities : t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports : t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec Base_dData_dList.t_Base_dData_dList_dList }
and t_Vuna_dCompiler_dFrontend_dAst_dImport = { f_Vuna_dCompiler_dFrontend_dAst_dImport_importName : string; f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified : bool; f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }

# 45 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dQty) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1 -> false
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dreprPrefix = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dReprTier) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed -> "boxed "
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias -> "alias "
  | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto -> ""
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp = dtb__0; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel = dtb__1; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc = dtb__2; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan = dtb__3 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportSpecName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__4, dtb__5, dtb__6) -> dtb__4
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__7, dtb__8) -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportSpecSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__9, dtb__10, dtb__11) -> dtb__11
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__12, dtb__13) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName = dtb__14; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind = dtb__15; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan = dtb__16 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName = dtb__17; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind = dtb__18; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan = dtb__19 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dpatSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dPat) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__20, dtb__21, dtb__22) -> dtb__22
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__23, dtb__24) -> dtb__24
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__25, dtb__26) -> dtb__26
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__27, dtb__28, dtb__29) -> dtb__29
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__30) -> dtb__30
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__31, dtb__32, dtb__33) -> dtb__33
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__34, dtb__35) -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__36, dtb__37, dtb__38) -> dtb__38
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__39, dtb__40, dtb__41) -> dtb__41
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__42, dtb__43) -> dtb__43
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__44, dtb__45, dtb__46) -> dtb__46
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__47, dtb__48, dtb__49) -> dtb__49
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__50, dtb__51, dtb__52) -> dtb__52
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__53, dtb__54, dtb__55, dtb__56) -> dtb__56
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__57, dtb__58, dtb__59) -> dtb__59
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__60, dtb__61) -> dtb__61
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__65
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> dtb__71
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__72, dtb__73, dtb__74) -> dtb__74
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__75, dtb__76, dtb__77) -> dtb__77
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__78, dtb__79) -> dtb__79
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__80, dtb__81) -> dtb__81
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__82, dtb__83) -> dtb__83
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__84, dtb__85, dtb__86) -> dtb__86
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__87, dtb__88, dtb__89) -> dtb__89
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__90, dtb__91) -> dtb__91
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__92, dtb__93, dtb__94, dtb__95) -> dtb__95
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__96, dtb__97) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__96)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__98, dtb__99, dtb__100, dtb__101) -> dtb__101
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__102, dtb__103) -> dtb__103
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__104, dtb__105) -> dtb__105
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__106, dtb__107, dtb__108) -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__109, dtb__110) -> dtb__109
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__111, dtb__112, dtb__113) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__114, dtb__115, dtb__116, dtb__117) -> dtb__117
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> dtb__130
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__134
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__138
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__139, dtb__140, dtb__141, dtb__142) -> dtb__142
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__143, dtb__144, dtb__145) -> dtb__145
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> dtb__154
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__155; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__156; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__157; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__158 } -> dtb__158
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__159; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__160; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__161 } -> dtb__161
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__162; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__163; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__164 } -> dtb__162
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__165; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__166; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__167 } -> dtb__166
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__168; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__169; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__170 } -> dtb__168
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__171; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__172; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__173 } -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExportItem) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__174, dtb__175, dtb__176) -> dtb__176
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__177, dtb__178) -> dtb__178
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__179, dtb__180, dtb__181) -> dtb__181
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__182, dtb__183) -> dtb__183
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__184, dtb__185) -> dtb__185
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__186, dtb__187) -> (match dtb__186 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__188, dtb__189, dtb__190, dtb__191) -> (if (dtb__188 = mc1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__189; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__190 }, ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__187) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__187) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__187) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun (decls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name))

# 322 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun (name : string) (decls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (match dtb__192 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__194; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__195 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__194)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)))

# 328 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__196; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__197; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__198; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__199 } -> dtb__196
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorShortName = (fun (name : string) -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 340 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__200; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__201 } -> (match dtb__200 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__201
  | _ -> (match (Base_dData_dList.v_Base_dData_dList_dreverse dtb__200) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__201
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__202, dtb__203) -> (String.concat "" [dtb__202; "."; dtb__201])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 349 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__204; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__205; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__206; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__207 } -> dtb__205
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__208, dtb__209, dtb__210) -> (match dtb__208 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__211, dtb__212) -> (if (dtb__211 = "->") then (match dtb__209 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__213, dtb__214) -> (match dtb__214 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (match dtb__216 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__215))
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
let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__217, dtb__218) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__217) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__217).f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity)) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__218))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__219, dtb__220) -> (match dtb__219 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__224) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__230))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__220)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238) -> (if (mc0 = dtb__231) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__233))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__220))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__220)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__239, dtb__240, dtb__241, dtb__242) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__243, dtb__244, dtb__245, dtb__246, dtb__247) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__246)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__256, dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__259)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__265, dtb__266, dtb__267, dtb__268) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__265, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__269, dtb__270, dtb__271, dtb__272) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__269, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__273, dtb__274, dtb__275) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__273, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__276, dtb__277, dtb__278, dtb__279) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__276, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun (decls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

# 389 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__280, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__283)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__285, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__293, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__296)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

# 396 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__305)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__307, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__315, dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__318)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 402 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun (decls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

# 405 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__324, dtb__325, dtb__326, dtb__327, dtb__328) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__324, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__329, dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__329, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__337, dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__337, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 411 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun (decls : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

# 414 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> dtb__349
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__354, dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362) -> dtb__358
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 428 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dholeNamed = (fun (name : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__363, dtb__364) -> (if (dtb__363 = 63) then (match dtb__364 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__365, dtb__366) -> true
  | _ -> false
) else false)
  | _ -> false
)) (Base_dData_dList.dtp_unpack name)))

# 425 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHoleName = (fun (name : string) -> (if (name = "_") then true else (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name)))

# 435 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name) then name else ""))

# 445 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix = "@vuna@"

# 449 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix = "@vuna@ctor@"

# 453 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix) name))

# 457 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_ddropNChars = (fun (n : int) (xs : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__367, dtb__368) -> ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (n - 1)) dtb__368)
  | _ -> failwith "DT: impossible branch"
)))

# 467 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix = (fun (p : string) (name : string) -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith p) name) then (Base_dData_dList.dtp_pack ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (bi_strLength p)) (Base_dData_dList.dtp_unpack name))) else name))

# 472 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__369, dtb__370) -> (match dtb__370 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__369
  | _ -> (String.concat "" [dtb__369; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt dtb__370)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorName = (fun (short : string) (targets : string Base_dData_dList.t_Base_dData_dList_dList) -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)]))

# 482 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__371, dtb__372) -> dtb__371
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__373, dtb__374) -> dtb__374
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name))

# 500 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix = "@vuna@value@"

# 503 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValueName = (fun (short : string) (targets : string Base_dData_dList.t_Base_dData_dList_dList) -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)]))

# 506 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValueShort = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__375, dtb__376) -> dtb__375
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets = (fun (name : string) -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__377, dtb__378) -> dtb__378
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disOverValueName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix) name))

# 524 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax = "@vuna@list@nil"

# 528 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax = "@vuna@list@cons"

# 532 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax))

# 536 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax))

# 558 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax = "@vuna@perform"

# 562 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax))

# 574 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax = "@vuna@handle"

# 578 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHandleSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax))

# 582 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax = "@vuna@handle@noret"

# 586 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax))

# 592 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax = "@vuna@row@at"

# 596 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax))

# 603 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax = "@vuna@app@at"

# 607 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax))

# 612 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax = "@vuna@inst@arg"

# 616 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax = (fun (name : string) -> (name = v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax))

# 628 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix = "@vuna@macro@"

# 632 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxName = (fun (name : string) -> (v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix ^ name))

# 636 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix) name))

# 640 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroNameOf = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 645 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix = "@vuna@do@bind@"

# 649 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 653 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName = (fun (canonical : string) -> (v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix ^ canonical))

# 657 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName = (fun (canonical : string) -> (v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix ^ canonical))

# 661 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))

# 665 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName = (fun (name : string) -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))

# 670 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))) else (if (v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
