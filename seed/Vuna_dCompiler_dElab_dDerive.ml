open Vuna_runtime
# 30 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dtraitShortName = (fun tname -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot tname))))

# 35 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal = (fun tname methodName -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot tname)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__0; Base_dPair.f_Base_dPair_dPair_second = dtb__1 } -> (match dtb__0 with
  | Base_dList.C_Base_dList_dList_Nil -> methodName
  | _ -> (String.concat "" [(Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__0); "."; methodName])
)
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_drecordCtorOf = (fun dname params fields sp -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dname; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = (((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordArrowType fields) (((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_drecordRetType dname) params) sp)) sp); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = (Base_dList.v_Base_dList_dlength fields); Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = sp })

# 101 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__2, dtb__3, dtb__4) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__2) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__3))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9, dtb__10) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__8) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__9))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__11, dtb__12, dtb__13) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__11) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__12))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__14, dtb__15) -> (dtb__14 = mc0)
  | _ -> false
))
# 108 "Vuna/Compiler/Elab/Derive.vuna"
and v_Vuna_dCompiler_dElab_dDerive_danyExprMentions = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__16) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__17))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__20; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__21; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__22; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__23 } -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__21) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions mc0) dtb__19))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions dtb__24) mc1) then (Base_dList.C_Base_dList_dList_Cons (dtb__24, ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__25) mc1))) else ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__25) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> (Base_dList.C_Base_dList_dList_Cons (dtb__29, (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes dtb__30)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__32, dtb__33, dtb__34) -> (match dtb__32 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__35, dtb__36) -> (if (dtb__35 = "->") then (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__38 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (match dtb__40 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__37, (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes dtb__39)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 192 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__44, dtb__45) -> dtb__44
  | _ -> "?"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__46, dtb__47) -> dtb__46
  | _ -> "?"
))

# 173 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__48; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__49; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__50; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__51 } -> (if (dtb__50 = 1) then (match (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes dtb__49) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__52) = mc2) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (Base_dList.C_Base_dList_dList_Nil, mc4, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (mc1, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", mc5)), Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__48, mc5)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", mc5)), Base_dList.C_Base_dList_dList_Nil)), mc5)), mc5)), Base_dList.C_Base_dList_dList_Nil)), mc5)))) else (((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr3 mc5) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DeriveFieldType ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0), mc2, (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__52)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)) mc2) (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__52)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DeriveCtorFieldCount ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
)
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DeriveCtorFieldCount ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
  | _ -> failwith "DT: impossible branch"
) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DeriveCtorFieldCount ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))
  | _ -> failwith "DT: impossible branch"
))

# 164 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor mc0) mc1) mc2) dtb__54) mc4) mc5)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DeriveSingleCtor ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
)
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc5) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DeriveSingleCtor ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0)))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0))
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (mc0, ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, mc2)))) mc1), mc2))
))

# 198 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dinstHead = (fun tn dname params sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (tn, sp)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dname, sp))) params) sp), Base_dList.C_Base_dList_dList_Nil)), sp)))

# 235 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dshowOne = (fun proj v sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (proj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))

# 227 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dshowFields = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__56) mc2), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (")", mc2)), Base_dList.C_Base_dList_dList_Nil)))), mc2))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__56) mc2), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (" ", mc2)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) dtb__57) mc2), Base_dList.C_Base_dList_dList_Nil)))), mc2)), Base_dList.C_Base_dList_dList_Nil)))), mc2))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (")", mc2))
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dshowCtor = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName mc1), mc3))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ((String.concat "" ["("; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName mc1); " "]), mc3)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) mc2) mc3), Base_dList.C_Base_dList_dList_Nil)))), mc3))
))

# 258 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dhashFields = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (((((v_Vuna_dCompiler_dElab_dDerive_dhashFields mc0) mc1) dtb__59) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc4)), (Base_dList.C_Base_dList_dList_Cons (mc3, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc4)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__58, mc4)), Base_dList.C_Base_dList_dList_Nil)), mc4)), Base_dList.C_Base_dList_dList_Nil)))), mc4))) mc4)
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo = (fun remaining prefix n -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((prefix ^ (bi_strFromInt (n - remaining))), (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (remaining - 1)) prefix) n)))))

# 352 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt = (fun prefix i n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (n - i)) prefix) n))

# 349 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dvarNames = (fun prefix n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt prefix) 0) n))

# 212 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dshowAlts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__60 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__62; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__63; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__64; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__65 } -> ((fun vs -> ((fun pat -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = pat; Base_dPair.f_Base_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dDerive_dshowCtor mc0) dtb__62) vs) mc2) }, (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts mc0) dtb__61) mc2)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__62, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc2)))) vs), mc2)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__64))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dshowBody = (fun proj ctors scrut sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (scrut, sp)), (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts proj) ctors) sp), sp)))

# 248 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dhashAlts = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__66 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__68; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__69; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__70; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__71 } -> ((fun vs -> ((fun pat -> ((fun body -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = pat; Base_dPair.f_Base_dPair_dPair_second = body }, (((((v_Vuna_dCompiler_dElab_dDerive_dhashAlts mc0) mc1) dtb__67) (mc3 + 1)) mc4)))) (((((v_Vuna_dCompiler_dElab_dDerive_dhashFields mc0) mc1) vs) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (mc3, mc4))) mc4))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__68, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc4)))) vs), mc4)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dhashBody = (fun proj combineProj ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (((((v_Vuna_dCompiler_dElab_dDerive_dhashAlts proj) combineProj) ctors) 0) sp), sp)))

# 361 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dgtBody = (fun ltProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

# 364 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dgeBody = (fun leProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (leProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

# 374 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dboolTrue = (fun sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

# 377 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dboolFalse = (fun sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

# 286 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dconjFields = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match dtb__73 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__72, mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__74, mc2)), Base_dList.C_Base_dList_dList_Nil)))), mc2))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("&&", mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__72, mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__74, mc2)), Base_dList.C_Base_dList_dList_Nil)))), mc2)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dconjFields dtb__73) dtb__75) mc2), Base_dList.C_Base_dList_dList_Nil)))), mc2))
)
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dDerive_dboolTrue mc2)
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_deqInner = (fun cn ar sp -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (cn, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, sp)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)), sp)); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dDerive_dconjFields ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") ar)) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)) sp) }, (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (sp)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp) }, Base_dList.C_Base_dList_dList_Nil)))))

# 271 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_deqAlt = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__76; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__77; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__78; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__79 } -> ((fun vs -> ((fun pat -> ((fun body -> { Base_dPair.f_Base_dPair_dPair_first = pat; Base_dPair.f_Base_dPair_dPair_second = body }) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", mc1)), (((v_Vuna_dCompiler_dElab_dDerive_deqInner dtb__76) dtb__78) mc1), mc1)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__76, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc1)))) vs), mc1)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__78))
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_deqBody = (fun ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), ((Base_dList.v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dElab_dDerive_deqAlt c) sp))) ctors), sp)))

# 294 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dneqBody = (fun eqProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (eqProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)))

# 330 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dltFields = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("<", mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__80, mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__82, mc3)), Base_dList.C_Base_dList_dList_Nil)))), mc3))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("||", mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("<", mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__80, mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__82, mc3)), Base_dList.C_Base_dList_dList_Nil)))), mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("&&", mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__80, mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__82, mc3)), Base_dList.C_Base_dList_dList_Nil)))), mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("&&", mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__82, mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__80, mc3)), Base_dList.C_Base_dList_dList_Nil)))), mc3)), (Base_dList.C_Base_dList_dList_Cons (((((v_Vuna_dCompiler_dElab_dDerive_dltFields mc0) dtb__81) dtb__83) mc3), Base_dList.C_Base_dList_dList_Nil)))), mc3)), Base_dList.C_Base_dList_dList_Nil)))), mc3)), Base_dList.C_Base_dList_dList_Nil)))), mc3))
)
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc3)
)
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dordInnerGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (match dtb__84 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__86; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__87; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__88; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__89 } -> ((fun gs -> ((fun pat -> ((fun body -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = pat; Base_dPair.f_Base_dPair_dPair_second = body }, ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo mc0) mc1) mc2) dtb__85) (mc4 + 1)) mc5)))) (if (mc4 = mc1) then ((((v_Vuna_dCompiler_dElab_dDerive_dltFields mc0) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") mc2)) gs) mc5) else (if (mc4 < mc1) then (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc5) else (v_Vuna_dCompiler_dElab_dDerive_dboolTrue mc5))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__86, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc5)))) gs), mc5)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") dtb__88))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dordInner = (fun leProj i ar all sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo leProj) i) ar) all) 0) sp))

# 304 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dordAlts = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorName = dtb__92; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType = dtb__93; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorArity = dtb__94; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorSpan = dtb__95 } -> ((fun vs -> ((fun pat -> ((fun body -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = pat; Base_dPair.f_Base_dPair_dPair_second = body }, (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts mc0) mc1) dtb__91) (mc3 + 1)) mc4)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", mc4)), (((((v_Vuna_dCompiler_dElab_dDerive_dordInner mc0) mc3) dtb__94) mc1) mc4), mc4)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__92, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc4)))) vs), mc4)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__94))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dordBody = (fun leProj ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts leProj) ctors) ctors) 0) sp), sp)))

# 343 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dleBody = (fun ltProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("||", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

# 115 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderiveInstance = (fun dname params ctors tn sp -> ((fun hd -> ((fun used -> ((fun ctxExprs -> (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Show") then ((fun proj -> ((fun ms -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("show", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dDerive_dshowBody proj) ctors) "sx") sp), sp)), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "show")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Eq") then ((fun eqProj -> ((fun ms -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("eq", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_deqBody ctors) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("neq", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dneqBody eqProj) sp), sp)), Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "eq")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Ord") then ((fun ltProj -> ((fun leProj -> ((fun ms -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("lt", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dDerive_dordBody leProj) ctors) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("le", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dleBody ltProj) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("gt", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgtBody ltProj) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("ge", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgeBody leProj) sp), sp)), Base_dList.C_Base_dList_dList_Nil)))))))))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "le"))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "lt")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Hashable") then ((fun hashProj -> ((fun combineProj -> ((fun ms -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("hash", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dDerive_dhashBody hashProj) combineProj) ctors) sp), sp)), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "hashCombine"))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "hash")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromString") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromString") "String") ctors) hd) sp) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromInt") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromInt") "Int") ctors) hd) sp) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromFloat") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromFloat") "Float") ctors) hd) sp) else ((fun kind -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DeriveUnsupportedKind (kind))) kind)) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn)))))))))) ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (tn, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))) used))) ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams params) ctors))) ((((v_Vuna_dCompiler_dElab_dDerive_dinstHead tn) dname) params) sp)))

# 81 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDerive_dderiveInstance mc0) mc1) mc2) dtb__96) mc4)) (fun decl -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo mc0) mc1) mc2) dtb__97) mc4) (Base_dList.C_Base_dList_dList_Cons (decl, mc5)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc5)))
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dderivingsFor = (fun dname params ctors derivings sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo dname) params) ctors) derivings) sp) Base_dList.C_Base_dList_dList_Nil))

# 74 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_drecordDerivingsFor = (fun dname params fields derivings sp -> (((((v_Vuna_dCompiler_dElab_dDerive_dderivingsFor dname) params) (Base_dList.C_Base_dList_dList_Cons (((((v_Vuna_dCompiler_dElab_dDerive_drecordCtorOf dname) params) fields) sp), Base_dList.C_Base_dList_dList_Nil))) derivings) sp))

# 52 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> (if dtb__105 then (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99) else (if ((Base_dList.v_Base_dList_dlength dtb__104) = 0) then (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDerive_dderivingsFor dtb__100) dtb__101) dtb__103) dtb__104) dtb__108)) (fun insts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend insts) more)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> (if dtb__113 then (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99) else (if ((Base_dList.v_Base_dList_dlength dtb__112) = 0) then (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dDerive_drecordDerivingsFor dtb__109) dtb__110) dtb__111) dtb__112) dtb__116)) (fun insts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend insts) more)))))))))
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Elab/Derive.vuna"
let v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings decls)) (fun insts -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend decls) insts))))))
