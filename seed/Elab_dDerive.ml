open Vuna_runtime
# 31 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitShortName = (fun (tname : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot tname))))

# 36 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitMethodGlobal = (fun (tname : string) (methodName : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot tname)) with
  | { B_dData_dPair.f_Pair_first = dtb__0; B_dData_dPair.f_Pair_second = dtb__1 } -> (match dtb__0 with
  | B_dData_dList.C_List_Nil -> methodName
  | _ -> (String.concat "" [(Base_dSource.v_joinDots dtb__0); "."; methodName])
)
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_anyTraitHasMethod = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : string) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | Frontend_dRast.C_Decl_DTrait (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> (if (if ((v_traitShortName dtb__4) = mc1) then ((B_dData_dList.v_memName mc2) ((B_dData_dList.v_map Frontend_dRast.v_traitMethodName) dtb__7)) else false) then true else (((v_anyTraitHasMethod dtb__3) mc1) mc2))
  | _ -> (((v_anyTraitHasMethod dtb__3) mc1) mc2)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitMethodOf = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) (classShort : string) (symbolName : string) (identName : string) -> (if (((v_anyTraitHasMethod decls) classShort) symbolName) then symbolName else (if (((v_anyTraitHasMethod decls) classShort) identName) then identName else symbolName)))

# 102 "Vuna/Compiler/Elab/Derive.vuna"
let v_recordCtorOf = (fun (dname : string) (params : string B_dData_dList.t_List) (fields : Frontend_dRast.t_Field B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> { Frontend_dRast.f_Ctor_ctorName = dname; Frontend_dRast.f_Ctor_ctorType = (((Elab_dRecords.v_recordArrowType fields) (((Elab_dRecords.v_recordRetType dname) params) sp)) sp); Frontend_dRast.f_Ctor_ctorArity = (B_dData_dList.v_length fields); Frontend_dRast.f_Ctor_ctorSpan = sp })

# 138 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_exprMentionsName = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EAnn (dtb__9, dtb__10, dtb__11) -> (if ((v_exprMentionsName mc0) dtb__9) then true else ((v_exprMentionsName mc0) dtb__10))
  | Frontend_dRast.C_Expr_EPi (dtb__12, dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> (if ((v_exprMentionsName mc0) dtb__15) then true else ((v_exprMentionsName mc0) dtb__16))
  | Frontend_dRast.C_Expr_EApp (dtb__18, dtb__19, dtb__20) -> (if ((v_exprMentionsName mc0) dtb__18) then true else ((v_anyExprMentions mc0) dtb__19))
  | Frontend_dRast.C_Expr_EVar (dtb__21, dtb__22) -> ((Frontend_dRast_dName.v_rnameKey dtb__21) = mc0)
  | _ -> false
))
# 145 "Vuna/Compiler/Elab/Derive.vuna"
and v_anyExprMentions = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if ((v_exprMentionsName mc0) dtb__23) then true else ((v_anyExprMentions mc0) dtb__24))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 134 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_anyCtorMentions = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__25 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__27; Frontend_dRast.f_Ctor_ctorType = dtb__28; Frontend_dRast.f_Ctor_ctorArity = dtb__29; Frontend_dRast.f_Ctor_ctorSpan = dtb__30 } -> (if ((v_exprMentionsName mc0) dtb__28) then true else ((v_anyCtorMentions mc0) dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_deriveCtxParams = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Ctor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (if ((v_anyCtorMentions dtb__31) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__31, ((v_deriveCtxParams dtb__32) mc1))) else ((v_deriveCtxParams dtb__32) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_deriveFieldTypes = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (B_dData_dList.C_List__x58__x58_ (dtb__36, (v_deriveFieldTypes dtb__37)))
  | Frontend_dRast.C_Expr_EApp (dtb__39, dtb__40, dtb__41) -> (match dtb__39 with
  | Frontend_dRast.C_Expr_EVar (dtb__42, dtb__43) -> (match dtb__42 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__44) -> (if (dtb__44 = "->") then (match dtb__40 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (match dtb__46 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (match dtb__48 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__45, (v_deriveFieldTypes dtb__47)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 235 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveFieldTypeName = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__49, dtb__50, dtb__51) -> (match dtb__49 with
  | Frontend_dRast.C_Expr_EVar (dtb__52, dtb__53) -> (Frontend_dRast_dName.v_rnameKey dtb__52)
  | _ -> "?"
)
  | Frontend_dRast.C_Expr_EVar (dtb__54, dtb__55) -> (Frontend_dRast_dName.v_rnameKey dtb__54)
  | _ -> "?"
))

# 216 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveWrapperCtor = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dRast.t_Ctor) (mc4 : Frontend_dRast.t_Expr) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__56; Frontend_dRast.f_Ctor_ctorType = dtb__57; Frontend_dRast.f_Ctor_ctorArity = dtb__58; Frontend_dRast.f_Ctor_ctorSpan = dtb__59 } -> (if (dtb__58 = 1) then (match (v_deriveFieldTypes dtb__57) with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (match dtb__61 with
  | B_dData_dList.C_List_Nil -> (if ((v_deriveFieldTypeName dtb__60) = mc2) then (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Decl_DInstance (B_dData_dList.C_List_Nil, mc4, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun (mc1, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", mc5)), B_dData_dList.C_List_Nil)), (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__56), mc5)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), mc5)), B_dData_dList.C_List_Nil)), mc5)), mc5)), B_dData_dList.C_List_Nil)), mc5)))) else (((((Base_dDiagnostics_dTc.v_tcErr3 mc5) (Base_dDiagnostics_dTc.C_TcErr_DeriveFieldType ((v_traitShortName mc0), mc2, (v_deriveFieldTypeName dtb__60)))) (v_traitShortName mc0)) mc2) (v_deriveFieldTypeName dtb__60)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc5) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName mc0)))) (v_traitShortName mc0))
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dTc.v_tcErr1 mc5) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName mc0)))) (v_traitShortName mc0))
  | _ -> failwith "DT: impossible branch"
) else (((Base_dDiagnostics_dTc.v_tcErr1 mc5) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName mc0)))) (v_traitShortName mc0)))
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveWrapper = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dRast.t_Ctor B_dData_dList.t_List) (mc4 : Frontend_dRast.t_Expr) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | B_dData_dList.C_List_Nil -> ((((((v_deriveWrapperCtor mc0) mc1) mc2) dtb__62) mc4) mc5)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 mc5) (Base_dDiagnostics_dTc.C_TcErr_DeriveSingleCtor ((v_traitShortName mc0)))) (v_traitShortName mc0))
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dTc.v_tcErr1 mc5) (Base_dDiagnostics_dTc.C_TcErr_DeriveSingleCtor ((v_traitShortName mc0)))) (v_traitShortName mc0))
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Elab/Derive.vuna"
let v_applyTypeParams = (fun (mc0 : Frontend_dRast.t_Expr) (mc1 : string B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dRast.C_Expr_EApp (mc0, ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName p), mc2)))) mc1), mc2))
))

# 241 "Vuna/Compiler/Elab/Derive.vuna"
let v_instHead = (fun (tn : string) (dname : string) (params : string B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName tn), sp)), (B_dData_dList.C_List__x58__x58_ ((((v_applyTypeParams (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dname), sp))) params) sp), B_dData_dList.C_List_Nil)), sp)))

# 282 "Vuna/Compiler/Elab/Derive.vuna"
let v_showOne = (fun (proj : string) (v : string) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName proj), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName v), sp)), B_dData_dList.C_List_Nil)), sp)))

# 271 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_showFields = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "++"), mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_showOne mc0) dtb__64) mc2), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (")", mc2)), B_dData_dList.C_List_Nil)))), mc2))
  | _ -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "++"), mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_showOne mc0) dtb__64) mc2), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "++"), mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (" ", mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_showFields mc0) dtb__65) mc2), B_dData_dList.C_List_Nil)))), mc2)), B_dData_dList.C_List_Nil)))), mc2))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EStr (")", mc2))
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Elab/Derive.vuna"
let v_showCtor = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EStr ((Frontend_dRast.v_ctorShortName mc1), mc3))
  | _ -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "++"), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr ((String.concat "" ["("; (Frontend_dRast.v_ctorShortName mc1); " "]), mc3)), (B_dData_dList.C_List__x58__x58_ ((((v_showFields mc0) mc2) mc3), B_dData_dList.C_List_Nil)))), mc3))
))

# 306 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_hashFields = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dRast.t_Expr) (mc4 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (((((v_hashFields mc0) mc1) dtb__67) (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc1), mc4)), (B_dData_dList.C_List__x58__x58_ (mc3, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc4)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__66), mc4)), B_dData_dList.C_List_Nil)), mc4)), B_dData_dList.C_List_Nil)))), mc4))) mc4)
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_varNamesAtGo = (fun (remaining : int) (prefix : string) (n : int) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((prefix ^ (bi_strFromInt (n - remaining))), (((v_varNamesAtGo (remaining - 1)) prefix) n)))))

# 420 "Vuna/Compiler/Elab/Derive.vuna"
let v_varNamesAt = (fun (prefix : string) (i : int) (n : int) -> (((v_varNamesAtGo (n - i)) prefix) n))

# 417 "Vuna/Compiler/Elab/Derive.vuna"
let v_varNames = (fun (prefix : string) (n : int) -> (((v_varNamesAt prefix) 0) n))

# 256 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_showAlts = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Ctor B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (match dtb__68 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__70; Frontend_dRast.f_Ctor_ctorType = dtb__71; Frontend_dRast.f_Ctor_ctorArity = dtb__72; Frontend_dRast.f_Ctor_ctorSpan = dtb__73 } -> (let vs = ((v_varNames "fa") dtb__72) in (let pat = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__70), ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dRast.C_Pat_PVar (v, mc2)))) vs), mc2)) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = ((((v_showCtor mc0) dtb__70) vs) mc2) }, (((v_showAlts mc0) dtb__69) mc2)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Elab/Derive.vuna"
let v_showBody = (fun (proj : string) (ctors : Frontend_dRast.t_Ctor B_dData_dList.t_List) (scrut : string) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName scrut), sp)), (((v_showAlts proj) ctors) sp), sp)))

# 296 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_hashAlts = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dRast.t_Ctor B_dData_dList.t_List) (mc3 : int) (mc4 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__76; Frontend_dRast.f_Ctor_ctorType = dtb__77; Frontend_dRast.f_Ctor_ctorArity = dtb__78; Frontend_dRast.f_Ctor_ctorSpan = dtb__79 } -> (let vs = ((v_varNames "fa") dtb__78) in (let pat = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__76), ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dRast.C_Pat_PVar (v, mc4)))) vs), mc4)) in (let body = (((((v_hashFields mc0) mc1) vs) (Frontend_dRast.C_Expr_EInt (mc3, mc4))) mc4) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = body }, (((((v_hashAlts mc0) mc1) dtb__75) (mc3 + 1)) mc4))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Elab/Derive.vuna"
let v_hashBody = (fun (proj : string) (combineProj : string) (ctors : Frontend_dRast.t_Ctor B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), (((((v_hashAlts proj) combineProj) ctors) 0) sp), sp)))

# 431 "Vuna/Compiler/Elab/Derive.vuna"
let v_gtBody = (fun (ltProj : string) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName ltProj), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sy"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), B_dData_dList.C_List_Nil)))), sp)))

# 435 "Vuna/Compiler/Elab/Derive.vuna"
let v_geBody = (fun (leProj : string) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName leProj), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sy"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), B_dData_dList.C_List_Nil)))), sp)))

# 446 "Vuna/Compiler/Elab/Derive.vuna"
let v_boolTrue = (fun (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "=="), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EInt (1, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EInt (1, sp)), B_dData_dList.C_List_Nil)))), sp)))

# 449 "Vuna/Compiler/Elab/Derive.vuna"
let v_boolFalse = (fun (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "=="), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EInt (0, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EInt (1, sp)), B_dData_dList.C_List_Nil)))), sp)))

# 341 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_conjFields = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__81 with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "=="), mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__80), mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__82), mc2)), B_dData_dList.C_List_Nil)))), mc2))
  | _ -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "&&"), mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "=="), mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__80), mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__82), mc2)), B_dData_dList.C_List_Nil)))), mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_conjFields dtb__81) dtb__83) mc2), B_dData_dList.C_List_Nil)))), mc2))
)
  | _ -> (v_boolFalse mc2)
)
  | B_dData_dList.C_List_Nil -> (v_boolTrue mc2)
  | _ -> failwith "DT: impossible branch"
))

# 331 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqInner = (fun (cn : string) (ar : int) (sp : Base_dSource.t_Span) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName cn), ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dRast.C_Pat_PVar (v, sp)))) ((v_varNames "fb") ar)), sp)); B_dData_dPair.f_Pair_second = (((v_conjFields ((v_varNames "fa") ar)) ((v_varNames "fb") ar)) sp) }, (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast.C_Pat_PWild (sp)); B_dData_dPair.f_Pair_second = (v_boolFalse sp) }, B_dData_dList.C_List_Nil)))))

# 323 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqAlt = (fun (mc0 : Frontend_dRast.t_Ctor) (mc1 : Base_dSource.t_Span) -> (match mc0 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__84; Frontend_dRast.f_Ctor_ctorType = dtb__85; Frontend_dRast.f_Ctor_ctorArity = dtb__86; Frontend_dRast.f_Ctor_ctorSpan = dtb__87 } -> (let vs = ((v_varNames "fa") dtb__86) in (let pat = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__84), ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dRast.C_Pat_PVar (v, mc1)))) vs), mc1)) in (let body = (Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sy"), mc1)), (((v_eqInner dtb__84) dtb__86) mc1), mc1)) in { B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = body })))
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqBody = (fun (ctors : Frontend_dRast.t_Ctor B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), ((B_dData_dList.v_map (fun (c : Frontend_dRast.t_Ctor) -> ((v_eqAlt c) sp))) ctors), sp)))

# 354 "Vuna/Compiler/Elab/Derive.vuna"
let v_neqBody = (fun (eqProj : string) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EIf ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName eqProj), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sy"), sp)), B_dData_dList.C_List_Nil)))), sp)), (v_boolFalse sp), (v_boolTrue sp), sp)))

# 395 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ltFields = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__90, dtb__91) -> (match dtb__89 with
  | B_dData_dList.C_List_Nil -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "<"), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__88), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__90), mc3)), B_dData_dList.C_List_Nil)))), mc3))
  | _ -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "||"), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "<"), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__88), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__90), mc3)), B_dData_dList.C_List_Nil)))), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "&&"), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__88), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__90), mc3)), B_dData_dList.C_List_Nil)))), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "&&"), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName mc0), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__90), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName dtb__88), mc3)), B_dData_dList.C_List_Nil)))), mc3)), (B_dData_dList.C_List__x58__x58_ (((((v_ltFields mc0) dtb__89) dtb__91) mc3), B_dData_dList.C_List_Nil)))), mc3)), B_dData_dList.C_List_Nil)))), mc3)), B_dData_dList.C_List_Nil)))), mc3))
)
  | _ -> (v_boolFalse mc3)
)
  | B_dData_dList.C_List_Nil -> (v_boolFalse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ordInnerGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : Frontend_dRast.t_Ctor B_dData_dList.t_List) (mc4 : int) (mc5 : Base_dSource.t_Span) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__94; Frontend_dRast.f_Ctor_ctorType = dtb__95; Frontend_dRast.f_Ctor_ctorArity = dtb__96; Frontend_dRast.f_Ctor_ctorSpan = dtb__97 } -> (let gs = ((v_varNames "fb") dtb__96) in (let pat = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__94), ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dRast.C_Pat_PVar (v, mc5)))) gs), mc5)) in (let body = (if (mc4 = mc1) then ((((v_ltFields mc0) ((v_varNames "fa") mc2)) gs) mc5) else (if (mc4 < mc1) then (v_boolFalse mc5) else (v_boolTrue mc5))) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = body }, ((((((v_ordInnerGo mc0) mc1) mc2) dtb__93) (mc4 + 1)) mc5))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Elab/Derive.vuna"
let v_ordInner = (fun (leProj : string) (i : int) (ar : int) (all : Frontend_dRast.t_Ctor B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((v_ordInnerGo leProj) i) ar) all) 0) sp))

# 368 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ordAlts = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Ctor B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Ctor B_dData_dList.t_List) (mc3 : int) (mc4 : Base_dSource.t_Span) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | { Frontend_dRast.f_Ctor_ctorName = dtb__100; Frontend_dRast.f_Ctor_ctorType = dtb__101; Frontend_dRast.f_Ctor_ctorArity = dtb__102; Frontend_dRast.f_Ctor_ctorSpan = dtb__103 } -> (let vs = ((v_varNames "fa") dtb__102) in (let pat = (Frontend_dRast.C_Pat_PCon ((Frontend_dRast_dName.v_classifyName dtb__100), ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dRast.C_Pat_PVar (v, mc4)))) vs), mc4)) in (let body = (Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sy"), mc4)), (((((v_ordInner mc0) mc3) dtb__102) mc1) mc4), mc4)) in (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = pat; B_dData_dPair.f_Pair_second = body }, (((((v_ordAlts mc0) mc1) dtb__99) (mc3 + 1)) mc4))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 365 "Vuna/Compiler/Elab/Derive.vuna"
let v_ordBody = (fun (leProj : string) (ctors : Frontend_dRast.t_Ctor B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_ECase ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), (((((v_ordAlts leProj) ctors) ctors) 0) sp), sp)))

# 410 "Vuna/Compiler/Elab/Derive.vuna"
let v_leBody = (fun (ltProj : string) (sp : Base_dSource.t_Span) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "||"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName ltProj), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sy"), sp)), B_dData_dList.C_List_Nil)))), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EIf ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName ltProj), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sy"), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "sx"), sp)), B_dData_dList.C_List_Nil)))), sp)), (v_boolFalse sp), (v_boolTrue sp), sp)), B_dData_dList.C_List_Nil)))), sp)))

# 152 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveInstance = (fun (all : Frontend_dRast.t_Decl B_dData_dList.t_List) (dname : string) (params : string B_dData_dList.t_List) (ctors : Frontend_dRast.t_Ctor B_dData_dList.t_List) (tn : string) (sp : Base_dSource.t_Span) -> (let hd = ((((v_instHead tn) dname) params) sp) in (let used = ((v_deriveCtxParams params) ctors) in (let ctxExprs = ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName tn), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName p), sp)), B_dData_dList.C_List_Nil)), sp)))) used) in (if ((v_traitShortName tn) = "Show") then (let proj = ((v_traitMethodGlobal tn) "show") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun ("show", (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), B_dData_dList.C_List_Nil)), ((((v_showBody proj) ctors) "sx") sp), sp)), B_dData_dList.C_List_Nil)) in (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Decl_DInstance (ctxExprs, hd, ms, sp)))))) else (if ((v_traitShortName tn) = "Eq") then (let eqName = ((((v_traitMethodOf all) "Eq") "==") "eq") in (let neqName = ((((v_traitMethodOf all) "Eq") "/=") "neq") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun (eqName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_eqBody ctors) sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun (neqName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_neqBody "==") sp), sp)), B_dData_dList.C_List_Nil)))) in (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Decl_DInstance (ctxExprs, hd, ms, sp))))))) else (if ((v_traitShortName tn) = "Ord") then (let ltName = ((((v_traitMethodOf all) "Ord") "<") "lt") in (let leName = ((((v_traitMethodOf all) "Ord") "<=") "le") in (let gtName = ((((v_traitMethodOf all) "Ord") ">") "gt") in (let geName = ((((v_traitMethodOf all) "Ord") ">=") "ge") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun (ltName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), (((v_ordBody "<=") ctors) sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun (leName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_leBody "<") sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun (gtName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_gtBody "<") sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun (geName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_geBody "<=") sp), sp)), B_dData_dList.C_List_Nil)))))))) in (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Decl_DInstance (ctxExprs, hd, ms, sp))))))))) else (if ((v_traitShortName tn) = "Hashable") then (let hashProj = ((v_traitMethodGlobal tn) "hash") in (let combineProj = ((v_traitMethodGlobal tn) "hashCombine") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Decl_DFun ("hash", (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Pat_PVar ("sx", sp)), B_dData_dList.C_List_Nil)), ((((v_hashBody hashProj) combineProj) ctors) sp), sp)), B_dData_dList.C_List_Nil)) in (Base_dDiag.C_Check_OkC ((Frontend_dRast.C_Decl_DInstance (ctxExprs, hd, ms, sp))))))) else (if ((v_traitShortName tn) = "FromString") then ((((((v_deriveWrapper tn) "fromString") "String") ctors) hd) sp) else (if ((v_traitShortName tn) = "FromInt") then ((((((v_deriveWrapper tn) "fromInt") "Int") ctors) hd) sp) else (if ((v_traitShortName tn) = "FromFloat") then ((((((v_deriveWrapper tn) "fromFloat") "Float") ctors) hd) sp) else (let kind = (v_traitShortName tn) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_DeriveUnsupportedKind (kind))) kind)))))))))))))

# 115 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_derivingsForGo = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dRast.t_Ctor B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) (mc5 : Base_dSource.t_Span) (mc6 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> ((Base_dCommon.v_bind ((((((v_deriveInstance mc0) mc1) mc2) mc3) dtb__104) mc5)) (fun (decl : Frontend_dRast.t_Decl) -> (((((((v_derivingsForGo mc0) mc1) mc2) mc3) dtb__105) mc5) (B_dData_dList.C_List__x58__x58_ (decl, mc6)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc6)))
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Derive.vuna"
let v_derivingsFor = (fun (all : Frontend_dRast.t_Decl B_dData_dList.t_List) (dname : string) (params : string B_dData_dList.t_List) (ctors : Frontend_dRast.t_Ctor B_dData_dList.t_List) (derivings : string B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> (((((((v_derivingsForGo all) dname) params) ctors) derivings) sp) B_dData_dList.C_List_Nil))

# 107 "Vuna/Compiler/Elab/Derive.vuna"
let v_recordDerivingsFor = (fun (all : Frontend_dRast.t_Decl B_dData_dList.t_List) (dname : string) (params : string B_dData_dList.t_List) (fields : Frontend_dRast.t_Field B_dData_dList.t_List) (derivings : string B_dData_dList.t_List) (sp : Base_dSource.t_Span) -> ((((((v_derivingsFor all) dname) params) (B_dData_dList.C_List__x58__x58_ (((((v_recordCtorOf dname) params) fields) sp), B_dData_dList.C_List_Nil))) derivings) sp))

# 76 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_collectDerivings = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (match dtb__106 with
  | Frontend_dRast.C_Decl_DData (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> (if dtb__113 then ((v_collectDerivings mc0) dtb__107) else (if ((B_dData_dList.v_length dtb__112) = 0) then ((v_collectDerivings mc0) dtb__107) else ((Base_dCommon.v_bind ((((((v_derivingsFor mc0) dtb__108) dtb__109) dtb__111) dtb__112) dtb__116)) (fun (insts : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings mc0) dtb__107)) (fun (more : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append insts) more)))))))))
  | Frontend_dRast.C_Decl_DRecord (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (if dtb__121 then ((v_collectDerivings mc0) dtb__107) else (if ((B_dData_dList.v_length dtb__120) = 0) then ((v_collectDerivings mc0) dtb__107) else ((Base_dCommon.v_bind ((((((v_recordDerivingsFor mc0) dtb__117) dtb__118) dtb__119) dtb__120) dtb__124)) (fun (insts : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings mc0) dtb__107)) (fun (more : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append insts) more)))))))))
  | _ -> ((v_collectDerivings mc0) dtb__107)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Elab/Derive.vuna"
let v_expandDerivings = (fun (decls : Frontend_dRast.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings decls) decls)) (fun (insts : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append decls) insts))))))
