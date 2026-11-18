open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dAst_dField = { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName : string; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod = { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType : t_Vuna_dCompiler_dFrontend_dAst_dExpr; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
and t_Vuna_dCompiler_dFrontend_dAst_dTraitParam = { f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamName : string; f_Vuna_dCompiler_dFrontend_dAst_dTraitParam_traitParamKind : t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe }
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild of (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt of (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dInterpPart = C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText of (string) | C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole of (t_Vuna_dCompiler_dFrontend_dAst_dExpr)
and t_Vuna_dCompiler_dFrontend_dAst_dQty = C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0 | C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1
and t_Vuna_dCompiler_dFrontend_dAst_dReprTier = C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAuto | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprAlias | C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt of (int) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam of ((string, Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun of ((t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dData_dList.t_Base_dData_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp of (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dInterpPart Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat of (string) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl = { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp : string; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc : int; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget : string Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }
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

# 120 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp = dtb__0; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityLevel = dtb__1; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityAssoc = dtb__2; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityTarget = dtb__3; f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan = dtb__4 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 181 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportSpecName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__5, dtb__6, dtb__7) -> dtb__5
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__8, dtb__9) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportSpecSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExportSpec) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__10, dtb__11, dtb__12) -> dtb__12
  | C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__13, dtb__14) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 200 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName = dtb__15; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind = dtb__16; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan = dtb__17 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityName = dtb__18; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind = dtb__19; f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacitySpan = dtb__20 } -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dpatSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dPat) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__21, dtb__22, dtb__23) -> dtb__23
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__24, dtb__25) -> dtb__25
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__26, dtb__27) -> dtb__27
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__28, dtb__29, dtb__30) -> dtb__30
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__31) -> dtb__31
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__32, dtb__33, dtb__34) -> dtb__34
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__35, dtb__36) -> dtb__36
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc0 with
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

# 263 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__105, dtb__106) -> dtb__106
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__107, dtb__108, dtb__109) -> dtb__109
  | _ -> failwith "DT: impossible branch"
))

# 267 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDoStmt) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__110, dtb__111) -> dtb__110
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__112, dtb__113, dtb__114) -> dtb__113
  | _ -> failwith "DT: impossible branch"
))

# 271 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
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

# 281 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__156; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__157; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__158; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__159 } -> dtb__159
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__160; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__161; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__162 } -> dtb__162
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__163; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__164; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__165 } -> dtb__163
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dField) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dField_fieldName = dtb__166; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType = dtb__167; f_Vuna_dCompiler_dFrontend_dAst_dField_fieldSpan = dtb__168 } -> dtb__167
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__169; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__170; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__171 } -> dtb__169
  | _ -> failwith "DT: impossible branch"
))

# 296 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__172; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__173; f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__174 } -> dtb__174
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExportItem) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__175, dtb__176, dtb__177) -> dtb__177
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__178, dtb__179) -> dtb__179
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__180, dtb__181, dtb__182) -> dtb__182
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__183, dtb__184) -> dtb__184
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__185, dtb__186) -> dtb__186
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__188) -> (match dtb__187 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__189, dtb__190, dtb__191, dtb__192) -> (if (dtb__189 = mc1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__190; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__191 }, ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__188) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__188) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__188) mc1)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name))

# 322 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name decls -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, dtb__194) -> (match dtb__193 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__195; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__196 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__195)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)))

# 327 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__197; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__198; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__199; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__200 } -> dtb__197
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorShortName = (fun name -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 339 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__201; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__202 } -> (match dtb__201 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__202
  | _ -> (match (Base_dData_dList.v_Base_dData_dList_dreverse dtb__201) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__202
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (String.concat "" [dtb__203; "."; dtb__202])
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 346 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__205; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__206; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__207; f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__208 } -> dtb__206
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__209, dtb__210, dtb__211) -> (match dtb__209 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__212, dtb__213) -> (if (dtb__212 = "->") then (match dtb__210 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__214, dtb__215) -> (match dtb__215 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__216, dtb__217) -> (match dtb__217 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__216))
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

# 353 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__218) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((dtb__218).f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity)) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__219))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__221) -> (match dtb__220 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__225) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__231) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__231))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__221)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__232, dtb__233, dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239) -> (if (mc0 = dtb__232) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__234))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__221))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__221)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__240, dtb__241, dtb__242, dtb__243) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__247)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__249, dtb__250, dtb__251, dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__249, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__257, dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__260)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__266, dtb__267, dtb__268, dtb__269) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__270, dtb__271, dtb__272, dtb__273) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__270, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__274, dtb__275, dtb__276) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__277, dtb__278, dtb__279, dtb__280) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__277, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

# 384 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__281, dtb__282, dtb__283, dtb__284, dtb__285) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__281, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__284)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__286, dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__286, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300, dtb__301, dtb__302) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__294, ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__297)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

# 391 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__303, dtb__304, dtb__305, dtb__306, dtb__307) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__306)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__308, dtb__309, dtb__310, dtb__311, dtb__312, dtb__313, dtb__314, dtb__315) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__308, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__316, dtb__317, dtb__318, dtb__319, dtb__320, dtb__321, dtb__322, dtb__323, dtb__324) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__319)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 397 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

# 400 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__325, dtb__326, dtb__327, dtb__328, dtb__329) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__325, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__330, dtb__331, dtb__332, dtb__333, dtb__334, dtb__335, dtb__336, dtb__337) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__330, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__338, dtb__339, dtb__340, dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__338, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 406 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

# 409 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__347, dtb__348, dtb__349, dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> dtb__350
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362, dtb__363) -> dtb__359
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 423 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dholeNamed = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__364, dtb__365) -> (if (dtb__364 = 63) then (match dtb__365 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__366, dtb__367) -> true
  | _ -> false
) else false)
  | _ -> false
)) (Base_dData_dList.dtp_unpack name)))

# 420 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHoleName = (fun name -> (if (name = "_") then true else (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name)))

# 429 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name) then name else ""))

# 439 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix = "@vuna@"

# 443 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix = "@vuna@ctor@"

# 447 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix) name))

# 451 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_ddropNChars = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__368, dtb__369) -> ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (n - 1)) dtb__369)
  | _ -> failwith "DT: impossible branch"
)))

# 458 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix = (fun p name -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith p) name) then (Base_dData_dList.dtp_pack ((v_Vuna_dCompiler_dFrontend_dAst_ddropNChars (bi_strLength p)) (Base_dData_dList.dtp_unpack name))) else name))

# 463 "Vuna/Compiler/Frontend/Ast.vuna"
let rec v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__370, dtb__371) -> (match dtb__371 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__370
  | _ -> (String.concat "" [dtb__370; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt dtb__371)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorName = (fun short targets -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)]))

# 473 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort = (fun name -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__372, dtb__373) -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

# 479 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets = (fun name -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__374, dtb__375) -> dtb__375
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix) name))

# 489 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix = "@vuna@value@"

# 492 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValueName = (fun short targets -> (String.concat "" [v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix; short; "@"; (v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt targets)]))

# 495 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValueShort = (fun name -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__376, dtb__377) -> dtb__376
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_doverValueTargets = (fun name -> (match ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnChar 64) ((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix) name)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__378, dtb__379) -> dtb__379
  | _ -> failwith "DT: impossible branch"
))

# 505 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disOverValueName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_doverValuePrefix) name))

# 511 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax = "@vuna@list@nil"

# 515 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax = "@vuna@list@cons"

# 519 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax))

# 523 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax))

# 545 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax = "@vuna@perform"

# 549 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax))

# 561 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax = "@vuna@handle"

# 565 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHandleSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax))

# 569 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax = "@vuna@handle@noret"

# 573 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax))

# 579 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax = "@vuna@row@at"

# 583 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax))

# 590 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax = "@vuna@app@at"

# 594 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax))

# 599 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax = "@vuna@inst@arg"

# 603 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax = (fun name -> (name = v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax))

# 615 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix = "@vuna@macro@"

# 619 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxName = (fun name -> (v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix ^ name))

# 623 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix) name))

# 627 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_dmacroNameOf = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 632 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix = "@vuna@do@bind@"

# 636 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix = "@vuna@do@ignore@"

# 640 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName = (fun canonical -> (v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix ^ canonical))

# 644 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName = (fun canonical -> (v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix ^ canonical))

# 648 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))

# 652 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))

# 657 "Vuna/Compiler/Frontend/Ast.vuna"
let v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix) name))) else (if (v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName name) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix) name))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
