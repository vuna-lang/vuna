open Vuna_runtime
# 32 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitShortName = (fun (tname : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot tname))))

# 36 "Vuna/Compiler/Elab/Derive.vuna"
let v_showEqClassName = "Base.Trait.Eq.Eq"

# 39 "Vuna/Compiler/Elab/Derive.vuna"
let v_showOrdClassName = "Base.Trait.Ord.Ord"

# 44 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitMethodGlobal = (fun (tname : string) (methodName : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot tname)) with
  | { B_dData_dPair.f_Pair_first = dtb__0; B_dData_dPair.f_Pair_second = dtb__1 } -> (match dtb__0 with
  | B_dData_dList.C_List_Nil -> methodName
  | _ -> (String.concat "" [(Base_dSource.v_joinDots dtb__0); "."; methodName])
)
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_anyTraitHasMethod = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match dtb__2 with
  | Frontend_dAst.C_Decl_DTrait (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> (if (if (dtb__4 = mc1) then ((B_dData_dList.v_memName mc2) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb__7)) else false) then true else (((v_anyTraitHasMethod dtb__3) mc1) mc2))
  | _ -> (((v_anyTraitHasMethod dtb__3) mc1) mc2)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Elab/Derive.vuna"
let v_traitMethodOf = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (classShort : string) (symbolName : string) (identName : string) -> (if (((v_anyTraitHasMethod decls) classShort) symbolName) then symbolName else (if (((v_anyTraitHasMethod decls) classShort) identName) then identName else symbolName)))

# 110 "Vuna/Compiler/Elab/Derive.vuna"
let v_recordCtorOf = (fun (dname : string) (params : string B_dData_dList.t_List) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (let s = (Frontend_dAst.v_nodeRefSpan sp) in { Frontend_dAst.f_Ctor_ctorName = dname; Frontend_dAst.f_Ctor_ctorType = (((Elab_dRecords.v_recordArrowType fields) (((Elab_dRecords.v_recordRetType dname) params) s)) s); Frontend_dAst.f_Ctor_ctorArity = (B_dData_dList.v_length fields); Frontend_dAst.f_Ctor_ctorRef = sp }))

# 152 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_exprMentionsName = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EPi (dtb__9, dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> (if ((v_exprMentionsName mc0) dtb__12) then true else ((v_exprMentionsName mc0) dtb__13))
  | Frontend_dAst.C_Expr_EApp (dtb__15, dtb__16, dtb__17) -> (if ((v_exprMentionsName mc0) dtb__15) then true else ((v_anyExprMentions mc0) dtb__16))
  | Frontend_dAst.C_Expr_EVar (dtb__18, dtb__19) -> (dtb__18 = mc0)
  | _ -> false
))
# 158 "Vuna/Compiler/Elab/Derive.vuna"
and v_anyExprMentions = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if ((v_exprMentionsName mc0) dtb__20) then true else ((v_anyExprMentions mc0) dtb__21))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_anyCtorMentions = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (match dtb__22 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__24; Frontend_dAst.f_Ctor_ctorType = dtb__25; Frontend_dAst.f_Ctor_ctorArity = dtb__26; Frontend_dAst.f_Ctor_ctorRef = dtb__27 } -> (if ((v_exprMentionsName mc0) dtb__25) then true else ((v_anyCtorMentions mc0) dtb__23))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Elab/Derive.vuna"
let[@tail_mod_cons] rec v_deriveCtxParams = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (if ((v_anyCtorMentions dtb__28) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__28, ((v_deriveCtxParams dtb__29) mc1))) else ((v_deriveCtxParams dtb__29) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Elab/Derive.vuna"
let[@tail_mod_cons] rec v_deriveFieldTypes = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> (B_dData_dList.C_List__x58__x58_ (dtb__33, (v_deriveFieldTypes dtb__34)))
  | Frontend_dAst.C_Expr_EApp (dtb__36, dtb__37, dtb__38) -> (match dtb__36 with
  | Frontend_dAst.C_Expr_EVar (dtb__39, dtb__40) -> (if (dtb__39 = "->") then (match dtb__37 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (match dtb__42 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (match dtb__44 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb__41, (v_deriveFieldTypes dtb__43)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 248 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveFieldTypeName = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__45, dtb__46, dtb__47) -> (match dtb__45 with
  | Frontend_dAst.C_Expr_EVar (dtb__48, dtb__49) -> dtb__48
  | _ -> "?"
)
  | Frontend_dAst.C_Expr_EVar (dtb__50, dtb__51) -> dtb__50
  | _ -> "?"
))

# 229 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveWrapperCtor = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Ctor) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc3 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__52; Frontend_dAst.f_Ctor_ctorType = dtb__53; Frontend_dAst.f_Ctor_ctorArity = dtb__54; Frontend_dAst.f_Ctor_ctorRef = dtb__55 } -> (if (dtb__54 = 1) then (match (v_deriveFieldTypes dtb__53) with
  | B_dData_dList.C_List__x58__x58_ (dtb__56, dtb__57) -> (match dtb__57 with
  | B_dData_dList.C_List_Nil -> (if ((v_deriveFieldTypeName dtb__56) = mc2) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (B_dData_dList.C_List_Nil, mc4, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (mc1, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", mc5)), B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (dtb__52, mc5)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", mc5)), B_dData_dList.C_List_Nil)), mc5)), mc5)), B_dData_dList.C_List_Nil)), mc5)))) else (((((Base_dDiagnostics_dTc.v_tcErr3 (Frontend_dAst.v_nodeRefSpan mc5)) (Base_dDiagnostics_dTc.C_TcErr_DeriveFieldType ((v_traitShortName mc0), mc2, (v_deriveFieldTypeName dtb__56)))) (v_traitShortName mc0)) mc2) (v_deriveFieldTypeName dtb__56)))
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan mc5)) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName mc0)))) (v_traitShortName mc0))
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan mc5)) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName mc0)))) (v_traitShortName mc0))
  | _ -> failwith "DT: impossible branch"
) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan mc5)) (Base_dDiagnostics_dTc.C_TcErr_DeriveCtorFieldCount ((v_traitShortName mc0)))) (v_traitShortName mc0)))
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveWrapper = (fun (mc0 : string) (mc1 : string) (mc2 : string) (mc3 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc4 : Frontend_dAst.t_Expr) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (match dtb__59 with
  | B_dData_dList.C_List_Nil -> ((((((v_deriveWrapperCtor mc0) mc1) mc2) dtb__58) mc4) mc5)
  | _ -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan mc5)) (Base_dDiagnostics_dTc.C_TcErr_DeriveSingleCtor ((v_traitShortName mc0)))) (v_traitShortName mc0))
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan mc5)) (Base_dDiagnostics_dTc.C_TcErr_DeriveSingleCtor ((v_traitShortName mc0)))) (v_traitShortName mc0))
  | _ -> failwith "DT: impossible branch"
))

# 258 "Vuna/Compiler/Elab/Derive.vuna"
let v_applyTypeParams = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> (Frontend_dAst.C_Expr_EApp (mc0, ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dAst.C_Expr_EVar (p, mc2)))) mc1), mc2))
))

# 254 "Vuna/Compiler/Elab/Derive.vuna"
let v_instHead = (fun (tn : string) (dname : string) (params : string B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (tn, sp)), (B_dData_dList.C_List__x58__x58_ ((((v_applyTypeParams (Frontend_dAst.C_Expr_EVar (dname, sp))) params) sp), B_dData_dList.C_List_Nil)), sp)))

# 294 "Vuna/Compiler/Elab/Derive.vuna"
let v_showOne = (fun (proj : string) (v : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (proj, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (v, sp)), B_dData_dList.C_List_Nil)), sp)))

# 283 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_showFields = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (match dtb__61 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_showOne mc0) dtb__60) mc2), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (")", mc2)), B_dData_dList.C_List_Nil)))), mc2))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_showOne mc0) dtb__60) mc2), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (" ", mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_showFields mc0) dtb__61) mc2), B_dData_dList.C_List_Nil)))), mc2)), B_dData_dList.C_List_Nil)))), mc2))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr (")", mc2))
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Elab/Derive.vuna"
let v_showCtor = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_NodeRef) -> (match mc2 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr ((Frontend_dAst.v_ctorShortName mc1), mc3))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr ((String.concat "" ["("; (Frontend_dAst.v_ctorShortName mc1); " "]), mc3)), (B_dData_dList.C_List__x58__x58_ ((((v_showFields mc0) mc2) mc3), B_dData_dList.C_List_Nil)))), mc3))
))

# 318 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_hashFields = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Expr) (mc4 : Frontend_dAst.t_NodeRef) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (((((v_hashFields mc0) mc1) dtb__63) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc1, mc4)), (B_dData_dList.C_List__x58__x58_ (mc3, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc0, mc4)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__62, mc4)), B_dData_dList.C_List_Nil)), mc4)), B_dData_dList.C_List_Nil)))), mc4))) mc4)
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Elab/Derive.vuna"
let[@tail_mod_cons] rec v_varNamesAtGo = (fun (remaining : int) (prefix : string) (n : int) -> (if (remaining <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ ((prefix ^ (string_of_int (n - remaining))), (((v_varNamesAtGo (remaining - 1)) prefix) n)))))

# 429 "Vuna/Compiler/Elab/Derive.vuna"
let v_varNamesAt = (fun (prefix : string) (i : int) (n : int) -> (((v_varNamesAtGo (n - i)) prefix) n))

# 426 "Vuna/Compiler/Elab/Derive.vuna"
let v_varNames = (fun (prefix : string) (n : int) -> (((v_varNamesAt prefix) 0) n))

# 268 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_showAlts = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__64 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__66; Frontend_dAst.f_Ctor_ctorType = dtb__67; Frontend_dAst.f_Ctor_ctorArity = dtb__68; Frontend_dAst.f_Ctor_ctorRef = dtb__69 } -> (let vs = ((v_varNames "fa") dtb__68) in (let pat = (Frontend_dAst.C_Pat_PCon (dtb__66, ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dAst.C_Pat_PVar (v, mc2)))) vs), mc2)) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = ((((v_showCtor mc0) dtb__66) vs) mc2); Frontend_dAst.f_Alt_altRef = mc2 }, (((v_showAlts mc0) dtb__65) mc2)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Elab/Derive.vuna"
let v_showBody = (fun (proj : string) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (scrut : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (scrut, sp)), (((v_showAlts proj) ctors) sp), sp)))

# 308 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_hashAlts = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc3 : int) (mc4 : Frontend_dAst.t_NodeRef) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__72; Frontend_dAst.f_Ctor_ctorType = dtb__73; Frontend_dAst.f_Ctor_ctorArity = dtb__74; Frontend_dAst.f_Ctor_ctorRef = dtb__75 } -> (let vs = ((v_varNames "fa") dtb__74) in (let pat = (Frontend_dAst.C_Pat_PCon (dtb__72, ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dAst.C_Pat_PVar (v, mc4)))) vs), mc4)) in (let body = (((((v_hashFields mc0) mc1) vs) (Frontend_dAst.C_Expr_EInt (mc3, mc4))) mc4) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = body; Frontend_dAst.f_Alt_altRef = mc4 }, (((((v_hashAlts mc0) mc1) dtb__71) (mc3 + 1)) mc4))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Elab/Derive.vuna"
let v_hashBody = (fun (proj : string) (combineProj : string) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sx", sp)), (((((v_hashAlts proj) combineProj) ctors) 0) sp), sp)))

# 440 "Vuna/Compiler/Elab/Derive.vuna"
let v_gtBody = (fun (ltProj : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (ltProj, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", sp)), B_dData_dList.C_List_Nil)))), sp)))

# 443 "Vuna/Compiler/Elab/Derive.vuna"
let v_geBody = (fun (leProj : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (leProj, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", sp)), B_dData_dList.C_List_Nil)))), sp)))

# 452 "Vuna/Compiler/Elab/Derive.vuna"
let v_boolTrue = (fun (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_boolTrueCtor, sp)))

# 455 "Vuna/Compiler/Elab/Derive.vuna"
let v_boolFalse = (fun (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_boolFalseCtor, sp)))

# 354 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_conjFields = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__77 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("==", mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__76, mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__78, mc2)), B_dData_dList.C_List_Nil)))), mc2))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("&&", mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("==", mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__76, mc2)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__78, mc2)), B_dData_dList.C_List_Nil)))), mc2)), (B_dData_dList.C_List__x58__x58_ ((((v_conjFields dtb__77) dtb__79) mc2), B_dData_dList.C_List_Nil)))), mc2))
)
  | _ -> (v_boolFalse mc2)
)
  | B_dData_dList.C_List_Nil -> (v_boolTrue mc2)
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqInner = (fun (cn : string) (ar : int) (sp : Frontend_dAst.t_NodeRef) -> (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PCon (cn, ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dAst.C_Pat_PVar (v, sp)))) ((v_varNames "fb") ar)), sp)); Frontend_dAst.f_Alt_altBody = (((v_conjFields ((v_varNames "fa") ar)) ((v_varNames "fb") ar)) sp); Frontend_dAst.f_Alt_altRef = sp }, (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = (Frontend_dAst.C_Pat_PWild (sp)); Frontend_dAst.f_Alt_altBody = (v_boolFalse sp); Frontend_dAst.f_Alt_altRef = sp }, B_dData_dList.C_List_Nil)))))

# 335 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqAlt = (fun (mc0 : Frontend_dAst.t_Ctor) (mc1 : Frontend_dAst.t_NodeRef) -> (match mc0 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__80; Frontend_dAst.f_Ctor_ctorType = dtb__81; Frontend_dAst.f_Ctor_ctorArity = dtb__82; Frontend_dAst.f_Ctor_ctorRef = dtb__83 } -> (let vs = ((v_varNames "fa") dtb__82) in (let pat = (Frontend_dAst.C_Pat_PCon (dtb__80, ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dAst.C_Pat_PVar (v, mc1)))) vs), mc1)) in (let body = (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sy", mc1)), (((v_eqInner dtb__80) dtb__82) mc1), mc1)) in { Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = body; Frontend_dAst.f_Alt_altRef = mc1 })))
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Derive.vuna"
let v_eqBody = (fun (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sx", sp)), ((B_dData_dList.v_map (fun (c : Frontend_dAst.t_Ctor) -> ((v_eqAlt c) sp))) ctors), sp)))

# 367 "Vuna/Compiler/Elab/Derive.vuna"
let v_neqBody = (fun (eqProj : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EIf ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (eqProj, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", sp)), B_dData_dList.C_List_Nil)))), sp)), (v_boolFalse sp), (v_boolTrue sp), sp)))

# 404 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ltFields = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_NodeRef) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (match dtb__85 with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("<", mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__84, mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__86, mc3)), B_dData_dList.C_List_Nil)))), mc3))
  | _ -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("||", mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("<", mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__84, mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__86, mc3)), B_dData_dList.C_List_Nil)))), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("&&", mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc0, mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__84, mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__86, mc3)), B_dData_dList.C_List_Nil)))), mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("&&", mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (mc0, mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__86, mc3)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (dtb__84, mc3)), B_dData_dList.C_List_Nil)))), mc3)), (B_dData_dList.C_List__x58__x58_ (((((v_ltFields mc0) dtb__85) dtb__87) mc3), B_dData_dList.C_List_Nil)))), mc3)), B_dData_dList.C_List_Nil)))), mc3)), B_dData_dList.C_List_Nil)))), mc3))
)
  | _ -> (v_boolFalse mc3)
)
  | B_dData_dList.C_List_Nil -> (v_boolFalse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ordInnerGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc4 : int) (mc5 : Frontend_dAst.t_NodeRef) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__88, dtb__89) -> (match dtb__88 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__90; Frontend_dAst.f_Ctor_ctorType = dtb__91; Frontend_dAst.f_Ctor_ctorArity = dtb__92; Frontend_dAst.f_Ctor_ctorRef = dtb__93 } -> (let gs = ((v_varNames "fb") dtb__92) in (let pat = (Frontend_dAst.C_Pat_PCon (dtb__90, ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dAst.C_Pat_PVar (v, mc5)))) gs), mc5)) in (let body = (if (mc4 = mc1) then ((((v_ltFields mc0) ((v_varNames "fa") mc2)) gs) mc5) else (if (mc4 < mc1) then (v_boolFalse mc5) else (v_boolTrue mc5))) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = body; Frontend_dAst.f_Alt_altRef = mc5 }, ((((((v_ordInnerGo mc0) mc1) mc2) dtb__89) (mc4 + 1)) mc5))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Elab/Derive.vuna"
let v_ordInner = (fun (leProj : string) (i : int) (ar : int) (all : Frontend_dAst.t_Ctor B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> ((((((v_ordInnerGo leProj) i) ar) all) 0) sp))

# 377 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_ordAlts = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc3 : int) (mc4 : Frontend_dAst.t_NodeRef) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb__96; Frontend_dAst.f_Ctor_ctorType = dtb__97; Frontend_dAst.f_Ctor_ctorArity = dtb__98; Frontend_dAst.f_Ctor_ctorRef = dtb__99 } -> (let vs = ((v_varNames "fa") dtb__98) in (let pat = (Frontend_dAst.C_Pat_PCon (dtb__96, ((B_dData_dList.v_map (fun (v : string) -> (Frontend_dAst.C_Pat_PVar (v, mc4)))) vs), mc4)) in (let body = (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sy", mc4)), (((((v_ordInner mc0) mc3) dtb__98) mc1) mc4), mc4)) in (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = pat; Frontend_dAst.f_Alt_altBody = body; Frontend_dAst.f_Alt_altRef = mc4 }, (((((v_ordAlts mc0) mc1) dtb__95) (mc3 + 1)) mc4))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Elab/Derive.vuna"
let v_ordBody = (fun (leProj : string) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar ("sx", sp)), (((((v_ordAlts leProj) ctors) ctors) 0) sp), sp)))

# 419 "Vuna/Compiler/Elab/Derive.vuna"
let v_leBody = (fun (ltProj : string) (sp : Frontend_dAst.t_NodeRef) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("||", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (ltProj, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", sp)), B_dData_dList.C_List_Nil)))), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EIf ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (ltProj, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sy", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar ("sx", sp)), B_dData_dList.C_List_Nil)))), sp)), (v_boolFalse sp), (v_boolTrue sp), sp)), B_dData_dList.C_List_Nil)))), sp)))

# 165 "Vuna/Compiler/Elab/Derive.vuna"
let v_deriveInstance = (fun (all : Frontend_dAst.t_Decl B_dData_dList.t_List) (dname : string) (params : string B_dData_dList.t_List) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (tn : string) (sp : Frontend_dAst.t_NodeRef) -> (let hd = ((((v_instHead tn) dname) params) sp) in (let used = ((v_deriveCtxParams params) ctors) in (let ctxExprs = ((B_dData_dList.v_map (fun (p : string) -> (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (tn, sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EVar (p, sp)), B_dData_dList.C_List_Nil)), sp)))) used) in (if (tn = "Base.Trait.Show.Show") then (let proj = ((v_traitMethodGlobal tn) "show") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun ("show", (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), B_dData_dList.C_List_Nil)), ((((v_showBody proj) ctors) "sx") sp), sp)), B_dData_dList.C_List_Nil)) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctxExprs, hd, ms, sp)))))) else (if (tn = "Base.Trait.Eq.Eq") then (let eqName = ((((v_traitMethodOf all) v_showEqClassName) "==") "eq") in (let neqName = ((((v_traitMethodOf all) v_showEqClassName) "/=") "neq") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (eqName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_eqBody ctors) sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (neqName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_neqBody "==") sp), sp)), B_dData_dList.C_List_Nil)))) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctxExprs, hd, ms, sp))))))) else (if (tn = "Base.Trait.Ord.Ord") then (let ltName = ((((v_traitMethodOf all) v_showOrdClassName) "<") "lt") in (let leName = ((((v_traitMethodOf all) v_showOrdClassName) "<=") "le") in (let gtName = ((((v_traitMethodOf all) v_showOrdClassName) ">") "gt") in (let geName = ((((v_traitMethodOf all) v_showOrdClassName) ">=") "ge") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (ltName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), (((v_ordBody "<=") ctors) sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (leName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_leBody "<") sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (gtName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_gtBody "<") sp), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun (geName, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sy", sp)), B_dData_dList.C_List_Nil)))), ((v_geBody "<=") sp), sp)), B_dData_dList.C_List_Nil)))))))) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctxExprs, hd, ms, sp))))))))) else (if (tn = "Base.Trait.Hashable.Hashable") then (let hashProj = ((v_traitMethodGlobal tn) "hash") in (let combineProj = ((v_traitMethodGlobal tn) "hashCombine") in (let ms = (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Decl_DFun ("hash", (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Pat_PVar ("sx", sp)), B_dData_dList.C_List_Nil)), ((((v_hashBody hashProj) combineProj) ctors) sp), sp)), B_dData_dList.C_List_Nil)) in (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (ctxExprs, hd, ms, sp))))))) else (if (tn = "Base.Trait.FromString.FromString") then ((((((v_deriveWrapper tn) "fromString") "String") ctors) hd) sp) else (if (tn = "Base.Trait.FromInt.FromInt") then ((((((v_deriveWrapper tn) "fromInt") "Int") ctors) hd) sp) else (if (tn = "Base.Data.Float.FromFloat") then ((((((v_deriveWrapper tn) "fromFloat") "Float") ctors) hd) sp) else (let kind = tn in (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan sp)) (Base_dDiagnostics_dTc.C_TcErr_DeriveUnsupportedKind (kind))) kind)))))))))))))

# 125 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_derivingsForGo = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string) (mc2 : string B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Ctor B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dAst.t_NodeRef) (mc6 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (if (dtb__100 = Loader_dSelectors.v_selectorDerivingName) then (((((((v_derivingsForGo mc0) mc1) mc2) mc3) dtb__101) mc5) mc6) else ((Base_dCommon.v_bind ((((((v_deriveInstance mc0) mc1) mc2) mc3) dtb__100) mc5)) (fun (decl : Frontend_dAst.t_Decl) -> (((((((v_derivingsForGo mc0) mc1) mc2) mc3) dtb__101) mc5) (B_dData_dList.C_List__x58__x58_ (decl, mc6))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse mc6)))
  | _ -> failwith "DT: impossible branch"
))

# 121 "Vuna/Compiler/Elab/Derive.vuna"
let v_derivingsFor = (fun (all : Frontend_dAst.t_Decl B_dData_dList.t_List) (dname : string) (params : string B_dData_dList.t_List) (ctors : Frontend_dAst.t_Ctor B_dData_dList.t_List) (derivings : string B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> (((((((v_derivingsForGo all) dname) params) ctors) derivings) sp) B_dData_dList.C_List_Nil))

# 117 "Vuna/Compiler/Elab/Derive.vuna"
let v_recordDerivingsFor = (fun (all : Frontend_dAst.t_Decl B_dData_dList.t_List) (dname : string) (params : string B_dData_dList.t_List) (fields : Frontend_dAst.t_Field B_dData_dList.t_List) (derivings : string B_dData_dList.t_List) (sp : Frontend_dAst.t_NodeRef) -> ((((((v_derivingsFor all) dname) params) (B_dData_dList.C_List__x58__x58_ (((((v_recordCtorOf dname) params) fields) sp), B_dData_dList.C_List_Nil))) derivings) sp))

# 84 "Vuna/Compiler/Elab/Derive.vuna"
let rec v_collectDerivings = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match dtb__102 with
  | Frontend_dAst.C_Decl_DData (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> (if dtb__109 then ((v_collectDerivings mc0) dtb__103) else (if ((B_dData_dList.v_length dtb__108) = 0) then ((v_collectDerivings mc0) dtb__103) else ((Base_dCommon.v_bind ((((((v_derivingsFor mc0) dtb__104) dtb__105) dtb__107) dtb__108) dtb__112)) (fun (insts : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings mc0) dtb__103)) (fun (more : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append insts) more)))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (if dtb__117 then ((v_collectDerivings mc0) dtb__103) else (if ((B_dData_dList.v_length dtb__116) = 0) then ((v_collectDerivings mc0) dtb__103) else ((Base_dCommon.v_bind ((((((v_recordDerivingsFor mc0) dtb__113) dtb__114) dtb__115) dtb__116) dtb__120)) (fun (insts : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings mc0) dtb__103)) (fun (more : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append insts) more)))))))))
  | _ -> ((v_collectDerivings mc0) dtb__103)
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Elab/Derive.vuna"
let v_expandDerivings = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_collectDerivings decls) decls)) (fun (insts : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append decls) insts))))))
