open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dAst_dField = C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod = C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dTraitParam = C_Vuna_dCompiler_dFrontend_dAst_dTraitParam_Vuna_dCompiler_dFrontend_dAst_dTraitParam of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dMaybe.t_Base_dMaybe_dMaybe)
and t_Vuna_dCompiler_dFrontend_dAst_dPat = C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild of (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dPat) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dInterpPart = C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText of (string) | C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole of (t_Vuna_dCompiler_dFrontend_dAst_dExpr)
and t_Vuna_dCompiler_dFrontend_dAst_dQty = C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ0 | C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ1
and t_Vuna_dCompiler_dFrontend_dAst_dExpr = C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt of (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam of (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dQty Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet of ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun of ((t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((t_Vuna_dCompiler_dFrontend_dAst_dPat, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord of (string) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * ((string, t_Vuna_dCompiler_dFrontend_dAst_dExpr) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo of (t_Vuna_dCompiler_dFrontend_dAst_dDoStmt Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp of (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dInterpPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl = C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl of (string) * (int) * (int) * (string Base_dMaybe.t_Base_dMaybe_dMaybe) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDoStmt = C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind of (t_Vuna_dCompiler_dFrontend_dAst_dPat) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr of (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dCtor = C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (int) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dDecl = C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dPat Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord of (string) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dField Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (bool) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait of (string) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitParam Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dTraitMethod Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance of (t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dExportItem = C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan) | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule of (string) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dModDecl = C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExportItem Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dFrontend_dAst_dSourceFile = C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile of (t_Vuna_dCompiler_dFrontend_dAst_dModDecl Base_dMaybe.t_Base_dMaybe_dMaybe) * (t_Vuna_dCompiler_dFrontend_dAst_dImport Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dAst_dImport = C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport of (string) * (bool) * (string Base_dMaybe.t_Base_dMaybe_dMaybe) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)

let v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ1 -> false
  | C_Vuna_dCompiler_dFrontend_dAst_dQty_Vuna_dCompiler_dFrontend_dAst_dQ0 -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dpatSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__5, dtb__6, dtb__7) -> dtb__7
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__8, dtb__9) -> dtb__9
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__10, dtb__11) -> dtb__11
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__12, dtb__13, dtb__14) -> dtb__14
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__15) -> dtb__15
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__16, dtb__17, dtb__18) -> dtb__18
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__19, dtb__20) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dexprSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp (dtb__21, dtb__22, dtb__23) -> dtb__23
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__24, dtb__25, dtb__26) -> dtb__26
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__27, dtb__28) -> dtb__28
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__29, dtb__30, dtb__31) -> dtb__31
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__32, dtb__33, dtb__34) -> dtb__34
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__35, dtb__36, dtb__37) -> dtb__37
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__41
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__42, dtb__43, dtb__44) -> dtb__44
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__45, dtb__46) -> dtb__46
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__50
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> dtb__56
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__57, dtb__58, dtb__59) -> dtb__59
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__60, dtb__61, dtb__62) -> dtb__62
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__63, dtb__64) -> dtb__64
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__65, dtb__66) -> dtb__66
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__67, dtb__68, dtb__69) -> dtb__69
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__70, dtb__71, dtb__72) -> dtb__72
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__73, dtb__74) -> dtb__74
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__75, dtb__76, dtb__77, dtb__78) -> dtb__78
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__79, dtb__80) -> (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__79)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__81, dtb__82, dtb__83, dtb__84) -> dtb__84
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__85, dtb__86) -> dtb__86
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__87, dtb__88) -> dtb__88
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__89, dtb__90, dtb__91) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__92, dtb__93) -> dtb__92
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__94, dtb__95, dtb__96) -> dtb__95
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__97, dtb__98, dtb__99, dtb__100) -> dtb__100
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__101, dtb__102, dtb__103, dtb__104) -> dtb__104
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__110
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__114
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__118
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__119, dtb__120, dtb__121, dtb__122) -> dtb__122
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__123, dtb__124, dtb__125) -> dtb__125
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__133, dtb__134, dtb__135, dtb__136) -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__137, dtb__138, dtb__139) -> dtb__139
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__140, dtb__141, dtb__142) -> dtb__140
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dfieldType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__143, dtb__144, dtb__145) -> dtb__144
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__146, dtb__147, dtb__148) -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__149, dtb__150, dtb__151) -> dtb__151
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__152, dtb__153) -> dtb__153
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__154, dtb__155) -> dtb__155
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__156, dtb__157) -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (match dtb__158 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__160, dtb__161, dtb__162, dtb__163) -> (if (dtb__160 = mc1) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__161, dtb__162)), ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__159) mc1))) else ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__159) mc1))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses dtb__159) mc1)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dclausesFor = (fun decls name -> ((v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses decls) name))

let v_Vuna_dCompiler_dFrontend_dAst_dfunArity = (fun name decls -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__164 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, dtb__167) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dlength dtb__166)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dAst_dclausesFor decls) name)))

let v_Vuna_dCompiler_dFrontend_dAst_dctorName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__168, dtb__169, dtb__170, dtb__171) -> dtb__168
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__172, dtb__173, dtb__174, dtb__175) -> dtb__173
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dtypeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__176, dtb__177, dtb__178) -> (match dtb__176 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__179, dtb__180) -> (if (dtb__179 = "->") then (match dtb__177 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__182 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__183, dtb__184) -> (match dtb__184 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (1 + (v_Vuna_dCompiler_dFrontend_dAst_dtypeArity dtb__183))
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

let rec v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__185, dtb__186) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__185) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((match dtb__185 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__187, dtb__188, dtb__189, dtb__190) -> dtb__189
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__186))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dAst_dctorArity = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__191, dtb__192) -> (match dtb__191 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> (match ((v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity mc0) dtb__196) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__200) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__200))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__192)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> (if (mc0 = dtb__201) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dlength dtb__203))) else ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__192))
  | _ -> ((v_Vuna_dCompiler_dFrontend_dAst_dctorArity mc0) dtb__192)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__207, dtb__208, dtb__209, dtb__210) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__211, dtb__212, dtb__213, dtb__214) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__213)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__215, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__224)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__228, dtb__229, dtb__230, dtb__231) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__228, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__232, dtb__233, dtb__234, dtb__235) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__232, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__236, dtb__237, dtb__238) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__236, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__239, dtb__240, dtb__241, dtb__242) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__239, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dAst_dtopNames = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__243, dtb__244, dtb__245, dtb__246) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__243, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__245)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251, dtb__252) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__247, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__253, dtb__254, dtb__255, dtb__256, dtb__257, dtb__258, dtb__259) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__253, ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__256)))
  | _ -> (v_Vuna_dCompiler_dFrontend_dAst_ddeclNames mc0)
))

let v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__260, dtb__261, dtb__262, dtb__263) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__262)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__264, dtb__265, dtb__266, dtb__267, dtb__268, dtb__269) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__264, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__270, dtb__271, dtb__272, dtb__273, dtb__274, dtb__275, dtb__276) -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__273)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dFrontend_dAst_dctorsOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__277, dtb__278, dtb__279, dtb__280) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__277, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__281, dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__281, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__287, dtb__288, dtb__289, dtb__290, dtb__291, dtb__292, dtb__293) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__287, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames) decls))

let v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__294, dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> dtb__297
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306) -> dtb__304
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dFrontend_dAst_dholeNamed = (fun name -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__307, dtb__308) -> (if (dtb__307 = 63) then (match dtb__308 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__309, dtb__310) -> true
  | _ -> false
) else false)
  | _ -> false
)) (Base_dList.dtp_unpack name)))

let v_Vuna_dCompiler_dFrontend_dAst_disHoleName = (fun name -> (if (name = "_") then true else (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name)))

let v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dAst_dholeNamed name) then name else ""))
