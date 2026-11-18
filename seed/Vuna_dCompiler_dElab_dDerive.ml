open Vuna_runtime
# 30 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dtraitShortName = (fun tname -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot tname))))

# 35 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal = (fun tname methodName -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot tname)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1 } -> (match dtb__0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> methodName
  | _ -> (String.concat "" [(Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__0); "."; methodName])
)
  | _ -> failwith "DT: impossible branch"
))

# 61 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_danyTraitHasMethod = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> (if (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName dtb__4) = mc1) then ((Base_dData_dList.v_Base_dData_dList_dmemName mc2) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__7)) else false) then true else (((v_Vuna_dCompiler_dElab_dDerive_danyTraitHasMethod dtb__3) mc1) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dDerive_danyTraitHasMethod dtb__3) mc1) mc2)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf = (fun decls classShort symbolName identName -> (if (((v_Vuna_dCompiler_dElab_dDerive_danyTraitHasMethod decls) classShort) symbolName) then symbolName else (if (((v_Vuna_dCompiler_dElab_dDerive_danyTraitHasMethod decls) classShort) identName) then identName else symbolName)))

# 86 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_drecordCtorOf = (fun dname params fields sp -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dname; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = (((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordArrowType fields) (((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordRetType dname) params) sp)) sp); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = (Base_dData_dList.v_Base_dData_dList_dlength fields); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = sp })

# 119 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__9, dtb__10, dtb__11) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__9) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__10))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__12, dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__15) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__16))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__18, dtb__19, dtb__20) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__18) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__19))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__21, dtb__22) -> (dtb__21 = mc0)
  | _ -> false
))
# 126 "Vuna/Compiler/Elab/Derive.vuna"
and v_Vuna_dCompiler_dElab_dDerive_danyExprMentions = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__23) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__24))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__27; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__28; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__29; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__30 } -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__28) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions mc0) dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, dtb__32) -> (if ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions dtb__31) mc1) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__31, ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__32) mc1))) else ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__32) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 207 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes dtb__37)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__39, dtb__40, dtb__41) -> (match dtb__39 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__42, dtb__43) -> (if (dtb__42 = "->") then (match dtb__40 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes dtb__46)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 213 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__48, dtb__49, dtb__50) -> (match dtb__48 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__51, dtb__52) -> dtb__51
  | _ -> "?"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__53, dtb__54) -> dtb__53
  | _ -> "?"
))

# 194 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor) (mc4 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) (mc5 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc3 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__55; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__56; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__57; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__58 } -> (if (dtb__57 = 1) then (match (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes dtb__56) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__59) = mc2) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (Base_dData_dList.C_Base_dData_dList_dList_Nil, mc4, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (mc1, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", mc5)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__55, mc5)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", mc5)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), mc5)), mc5)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), mc5)))) else (((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr3 mc5) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DeriveFieldType ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0), mc2, (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__59)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)) mc2) (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__59)))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DeriveCtorFieldCount ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DeriveCtorFieldCount ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
  | _ -> failwith "DT: impossible branch"
) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DeriveCtorFieldCount ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) (mc5 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> (match dtb__62 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor mc0) mc1) mc2) dtb__61) mc4) mc5)
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DeriveSingleCtor ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DeriveSingleCtor ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (mc0, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, mc2)))) mc1), mc2))
))

# 219 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dinstHead = (fun tn dname params sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (tn, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dname, sp))) params) sp), Base_dData_dList.C_Base_dData_dList_dList_Nil)), sp)))

# 256 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dshowOne = (fun proj v sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (proj, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v, sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), sp)))

# 248 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dshowFields = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (match dtb__64 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__63) mc2), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (")", mc2)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc2))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__63) mc2), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (" ", mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) dtb__64) mc2), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc2)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc2))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (")", mc2))
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dshowCtor = (fun (mc0 : string) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName mc1), mc3))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ((String.concat "" ["("; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName mc1); " "]), mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) mc2) mc3), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3))
))

# 279 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dhashFields = (fun (mc0 : string) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__65, dtb__66) -> (((((v_Vuna_dCompiler_dElab_dDerive_dhashFields mc0) mc1) dtb__66) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc4)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc3, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc4)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__65, mc4)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), mc4)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc4))) mc4)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo = (fun remaining prefix n -> (if (remaining <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((prefix ^ (bi_strFromInt (n - remaining))), (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (remaining - 1)) prefix) n)))))

# 373 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt = (fun prefix i n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (n - i)) prefix) n))

# 370 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dvarNames = (fun prefix n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt prefix) 0) n))

# 233 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dshowAlts = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__69; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__70; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__71; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__72 } -> ((fun vs -> ((fun pat -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = pat; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dDerive_dshowCtor mc0) dtb__69) vs) mc2) }, (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts mc0) dtb__68) mc2)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__69, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc2)))) vs), mc2)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__71))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dshowBody = (fun proj ctors scrut sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (scrut, sp)), (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts proj) ctors) sp), sp)))

# 269 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dhashAlts = (fun (mc0 : string) (mc1 : string) (mc2 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__73, dtb__74) -> (match dtb__73 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__75; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__76; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__77; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__78 } -> ((fun vs -> ((fun pat -> ((fun body -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = pat; Base_dData_dPair.f_Base_dData_dPair_dPair_second = body }, (((((v_Vuna_dCompiler_dElab_dDerive_dhashAlts mc0) mc1) dtb__74) (mc3 + 1)) mc4)))) (((((v_Vuna_dCompiler_dElab_dDerive_dhashFields mc0) mc1) vs) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (mc3, mc4))) mc4))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__75, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc4)))) vs), mc4)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__77))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dhashBody = (fun proj combineProj ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (((((v_Vuna_dCompiler_dElab_dDerive_dhashAlts proj) combineProj) ctors) 0) sp), sp)))

# 382 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dgtBody = (fun ltProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)))

# 385 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dgeBody = (fun leProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (leProj, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)))

# 395 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dboolTrue = (fun sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)))

# 398 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dboolFalse = (fun sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)))

# 307 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dconjFields = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (match dtb__80 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__79, mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__81, mc2)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc2))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("&&", mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__79, mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__81, mc2)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc2)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((((v_Vuna_dCompiler_dElab_dDerive_dconjFields dtb__80) dtb__82) mc2), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc2))
)
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc2)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dDerive_dboolTrue mc2)
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_deqInner = (fun cn ar sp -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (cn, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, sp)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)), sp)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dDerive_dconjFields ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") ar)) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)) sp) }, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (sp)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))

# 292 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_deqAlt = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor) (mc1 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__83; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__84; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__85; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__86 } -> ((fun vs -> ((fun pat -> ((fun body -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = pat; Base_dData_dPair.f_Base_dData_dPair_dPair_second = body }) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", mc1)), (((v_Vuna_dCompiler_dElab_dDerive_deqInner dtb__83) dtb__85) mc1), mc1)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__83, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc1)))) vs), mc1)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__85))
  | _ -> failwith "DT: impossible branch"
))

# 289 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_deqBody = (fun ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor) -> ((v_Vuna_dCompiler_dElab_dDerive_deqAlt c) sp))) ctors), sp)))

# 315 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dneqBody = (fun eqProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (eqProj, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)))

# 351 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dltFields = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match dtb__88 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("<", mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__89, mc3)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("||", mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("<", mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__89, mc3)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("&&", mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__89, mc3)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("&&", mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__89, mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__87, mc3)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dElab_dDerive_dltFields mc0) dtb__88) dtb__90) mc3), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), mc3))
)
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc3)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dordInnerGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) (mc4 : int) (mc5 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__91, dtb__92) -> (match dtb__91 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__93; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__94; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__95; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__96 } -> ((fun gs -> ((fun pat -> ((fun body -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = pat; Base_dData_dPair.f_Base_dData_dPair_dPair_second = body }, ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo mc0) mc1) mc2) dtb__92) (mc4 + 1)) mc5)))) (if (mc4 = mc1) then ((((v_Vuna_dCompiler_dElab_dDerive_dltFields mc0) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") mc2)) gs) mc5) else (if (mc4 < mc1) then (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc5) else (v_Vuna_dCompiler_dElab_dDerive_dboolTrue mc5))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__93, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc5)))) gs), mc5)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") dtb__95))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 335 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dordInner = (fun leProj i ar all sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo leProj) i) ar) all) 0) sp))

# 325 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dordAlts = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__99; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__100; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__101; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__102 } -> ((fun vs -> ((fun pat -> ((fun body -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = pat; Base_dData_dPair.f_Base_dData_dPair_dPair_second = body }, (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts mc0) mc1) dtb__98) (mc3 + 1)) mc4)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", mc4)), (((((v_Vuna_dCompiler_dElab_dDerive_dordInner mc0) mc3) dtb__101) mc1) mc4), mc4)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__99, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc4)))) vs), mc4)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dordBody = (fun leProj ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts leProj) ctors) ctors) 0) sp), sp)))

# 364 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dleBody = (fun ltProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("||", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), sp)))

# 133 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveInstance = (fun all dname params ctors tn sp -> ((fun hd -> ((fun used -> ((fun ctxExprs -> (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Show") then ((fun proj -> ((fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("show", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dDerive_dshowBody proj) ctors) "sx") sp), sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "show")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Eq") then ((fun eqName -> ((fun neqName -> ((fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (eqName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_deqBody ctors) sp), sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (neqName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dneqBody "==") sp), sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf all) "Eq") "/=") "neq"))) ((((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf all) "Eq") "==") "eq")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Ord") then ((fun ltName -> ((fun leName -> ((fun gtName -> ((fun geName -> ((fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (ltName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dDerive_dordBody "<=") ctors) sp), sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (leName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dleBody "<") sp), sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (gtName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgtBody "<") sp), sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (geName, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgeBody "<=") sp), sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))) ((((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf all) "Ord") ">=") "ge"))) ((((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf all) "Ord") ">") "gt"))) ((((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf all) "Ord") "<=") "le"))) ((((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf all) "Ord") "<") "lt")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Hashable") then ((fun hashProj -> ((fun combineProj -> ((fun ms -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("hash", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dDerive_dhashBody hashProj) combineProj) ctors) sp), sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "hashCombine"))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "hash")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromString") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromString") "String") ctors) hd) sp) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromInt") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromInt") "Int") ctors) hd) sp) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromFloat") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromFloat") "Float") ctors) hd) sp) else ((fun kind -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_DeriveUnsupportedKind (kind))) kind)) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn)))))))))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : string) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (tn, sp)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, sp)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), sp)))) used))) ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams params) ctors))) ((((v_Vuna_dCompiler_dElab_dDerive_dinstHead tn) dname) params) sp)))

# 99 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dCtor Base_dData_dList.t_Base_dData_dList_dList) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc6 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__103, dtb__104) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveInstance mc0) mc1) mc2) mc3) dtb__103) mc5)) (fun (decl : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl) -> (((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo mc0) mc1) mc2) mc3) dtb__104) mc5) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (decl, mc6)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse mc6)))
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderivingsFor = (fun all dname params ctors derivings sp -> (((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo all) dname) params) ctors) derivings) sp) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 91 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_drecordDerivingsFor = (fun all dname params fields derivings sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsFor all) dname) params) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((v_Vuna_dCompiler_dElab_dDerive_drecordCtorOf dname) params) fields) sp), Base_dData_dList.C_Base_dData_dList_dList_Nil))) derivings) sp))

# 69 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__105, dtb__106) -> (match dtb__105 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115) -> (if dtb__112 then ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings mc0) dtb__106) else (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__111) = 0) then ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings mc0) dtb__106) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsFor mc0) dtb__107) dtb__108) dtb__110) dtb__111) dtb__115)) (fun (insts : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings mc0) dtb__106)) (fun (more : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend insts) more)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> (if dtb__120 then ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings mc0) dtb__106) else (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__119) = 0) then ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings mc0) dtb__106) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDerive_drecordDerivingsFor mc0) dtb__116) dtb__117) dtb__118) dtb__119) dtb__123)) (fun (insts : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings mc0) dtb__106)) (fun (more : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend insts) more)))))))))
  | _ -> ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings mc0) dtb__106)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings = (fun decls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings decls) decls)) (fun (insts : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend decls) insts))))))
