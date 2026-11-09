open Vuna_runtime
let v_Vuna_dCompiler_dElab_dDerive_dtraitShortName = (fun tname -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot tname))))

let v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal = (fun tname methodName -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot tname)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__0, dtb__1) -> (match dtb__0 with
  | Base_dList.C_Base_dList_dList_Nil -> methodName
  | _ -> (String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__0); "."; methodName])
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__2, dtb__3, dtb__4) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__2) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__3))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9, dtb__10) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__8) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__9))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__11, dtb__12, dtb__13) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__11) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__12))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__14, dtb__15) -> (dtb__14 = mc0)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dDerive_danyExprMentions = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__16) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__17))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__20, dtb__21, dtb__22, dtb__23) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__21) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions mc0) dtb__19))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions dtb__24) mc1) then (Base_dList.C_Base_dList_dList_Cons (dtb__24, ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__25) mc1))) else ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__25) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

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

let v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__41, dtb__42, dtb__43) -> (match dtb__41 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__44, dtb__45) -> dtb__44
  | _ -> "?"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__46, dtb__47) -> dtb__46
  | _ -> "?"
))

let v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__48, dtb__49, dtb__50, dtb__51) -> (if (dtb__50 = 1) then (match (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes dtb__49) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__52) = mc2) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (Base_dList.C_Base_dList_dList_Nil, mc4, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (mc1, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", mc5)), Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__48, mc5)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", mc5)), Base_dList.C_Base_dList_dList_Nil)), mc5)), mc5)), Base_dList.C_Base_dList_dList_Nil)), mc5)))) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc5); ": cannot derive "; (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0); ": field type must be "; mc2; " (got "; (v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName dtb__52); ")"]))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc5); ": cannot derive "; (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0); ": constructor must have exactly one field"])))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc5); ": cannot derive "; (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0); ": constructor must have exactly one field"])))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc5); ": cannot derive "; (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0); ": constructor must have exactly one field"]))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor mc0) mc1) mc2) dtb__54) mc4) mc5)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc5); ": cannot derive "; (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0); ": type must have exactly one constructor"])))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc mc5); ": cannot derive "; (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName mc0); ": type must have exactly one constructor"])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (mc0, ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, mc2)))) mc1), mc2))
))

let v_Vuna_dCompiler_dElab_dDerive_dinstHead = (fun tn dname params sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (tn, sp)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dname, sp))) params) sp), Base_dList.C_Base_dList_dList_Nil)), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dshowOne = (fun proj v sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (proj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (v, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))

let rec v_Vuna_dCompiler_dElab_dDerive_dshowFields = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__56) mc2), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (")", mc2)), Base_dList.C_Base_dList_dList_Nil)))), mc2))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__56) mc2), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc2)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (" ", mc2)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) dtb__57) mc2), Base_dList.C_Base_dList_dList_Nil)))), mc2)), Base_dList.C_Base_dList_dList_Nil)))), mc2))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (")", mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dshowCtor = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName mc1), mc3))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("++", mc3)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr ((String.concat "" ["("; (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName mc1); " "]), mc3)), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) mc2) mc3), Base_dList.C_Base_dList_dList_Nil)))), mc3))
))

let rec v_Vuna_dCompiler_dElab_dDerive_dhashFields = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (((((v_Vuna_dCompiler_dElab_dDerive_dhashFields mc0) mc1) dtb__59) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc4)), (Base_dList.C_Base_dList_dList_Cons (mc3, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc4)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__58, mc4)), Base_dList.C_Base_dList_dList_Nil)), mc4)), Base_dList.C_Base_dList_dList_Nil)))), mc4))) mc4)
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo = (fun remaining prefix n -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((prefix ^ (bi_strFromInt (n - remaining))), (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (remaining - 1)) prefix) n)))))

let v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt = (fun prefix i n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (n - i)) prefix) n))

let v_Vuna_dCompiler_dElab_dDerive_dvarNames = (fun prefix n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt prefix) 0) n))

let rec v_Vuna_dCompiler_dElab_dDerive_dshowAlts = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (match dtb__60 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__62, dtb__63, dtb__64, dtb__65) -> ((fun vs -> ((fun pat -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (pat, ((((v_Vuna_dCompiler_dElab_dDerive_dshowCtor mc0) dtb__62) vs) mc2))), (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts mc0) dtb__61) mc2)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__62, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc2)))) vs), mc2)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__64))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dshowBody = (fun proj ctors scrut sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (scrut, sp)), (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts proj) ctors) sp), sp)))

let rec v_Vuna_dCompiler_dElab_dDerive_dhashAlts = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__66 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__68, dtb__69, dtb__70, dtb__71) -> ((fun vs -> ((fun pat -> ((fun body -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (pat, body)), (((((v_Vuna_dCompiler_dElab_dDerive_dhashAlts mc0) mc1) dtb__67) (mc3 + 1)) mc4)))) (((((v_Vuna_dCompiler_dElab_dDerive_dhashFields mc0) mc1) vs) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (mc3, mc4))) mc4))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__68, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc4)))) vs), mc4)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__70))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dhashBody = (fun proj combineProj ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (((((v_Vuna_dCompiler_dElab_dDerive_dhashAlts proj) combineProj) ctors) 0) sp), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dgtBody = (fun ltProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dgeBody = (fun leProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (leProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dboolTrue = (fun sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dboolFalse = (fun sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (1, sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

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

let v_Vuna_dCompiler_dElab_dDerive_deqInner = (fun cn ar sp -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (cn, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, sp)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)), sp)), (((v_Vuna_dCompiler_dElab_dDerive_dconjFields ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") ar)) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)) sp))), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp))), Base_dList.C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dElab_dDerive_deqAlt = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__76, dtb__77, dtb__78, dtb__79) -> ((fun vs -> ((fun pat -> ((fun body -> (Base_dPair.C_Base_dPair_dPair_Pair (pat, body))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", mc1)), (((v_Vuna_dCompiler_dElab_dDerive_deqInner dtb__76) dtb__78) mc1), mc1)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__76, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc1)))) vs), mc1)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__78))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_deqBody = (fun ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), ((Base_dList.v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dElab_dDerive_deqAlt c) sp))) ctors), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dneqBody = (fun eqProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (eqProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)))

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

let rec v_Vuna_dCompiler_dElab_dDerive_dordInnerGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (match dtb__84 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__86, dtb__87, dtb__88, dtb__89) -> ((fun gs -> ((fun pat -> ((fun body -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (pat, body)), ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo mc0) mc1) mc2) dtb__85) (mc4 + 1)) mc5)))) (if (mc4 = mc1) then ((((v_Vuna_dCompiler_dElab_dDerive_dltFields mc0) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") mc2)) gs) mc5) else (if (mc4 < mc1) then (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc5) else (v_Vuna_dCompiler_dElab_dDerive_dboolTrue mc5))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__86, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc5)))) gs), mc5)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") dtb__88))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dordInner = (fun leProj i ar all sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo leProj) i) ar) all) 0) sp))

let rec v_Vuna_dCompiler_dElab_dDerive_dordAlts = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (match dtb__90 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Ctor (dtb__92, dtb__93, dtb__94, dtb__95) -> ((fun vs -> ((fun pat -> ((fun body -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (pat, body)), (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts mc0) mc1) dtb__91) (mc3 + 1)) mc4)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", mc4)), (((((v_Vuna_dCompiler_dElab_dDerive_dordInner mc0) mc3) dtb__94) mc1) mc4), mc4)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__92, ((Base_dList.v_Base_dList_dmap (fun v -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (v, mc4)))) vs), mc4)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__94))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dordBody = (fun leProj ctors sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts leProj) ctors) ctors) 0) sp), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dleBody = (fun ltProj sp -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("||", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (ltProj, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sy", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)), Base_dList.C_Base_dList_dList_Nil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dderiveInstance = (fun dname params ctors tn sp -> ((fun hd -> ((fun used -> ((fun ctxExprs -> (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Show") then ((fun proj -> ((fun ms -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("show", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dDerive_dshowBody proj) ctors) "sx") sp), sp)), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "show")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Eq") then ((fun eqProj -> ((fun ms -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("eq", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_deqBody ctors) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("neq", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dneqBody eqProj) sp), sp)), Base_dList.C_Base_dList_dList_Nil)))))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "eq")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Ord") then ((fun ltProj -> ((fun leProj -> ((fun ms -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("lt", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), (((v_Vuna_dCompiler_dElab_dDerive_dordBody leProj) ctors) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("le", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dleBody ltProj) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("gt", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgtBody ltProj) sp), sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("ge", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sy", sp)), Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgeBody leProj) sp), sp)), Base_dList.C_Base_dList_dList_Nil)))))))))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "le"))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "lt")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Hashable") then ((fun hashProj -> ((fun combineProj -> ((fun ms -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (ctxExprs, hd, ms, sp))))) (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun ("hash", (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ("sx", sp)), Base_dList.C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dDerive_dhashBody hashProj) combineProj) ctors) sp), sp)), Base_dList.C_Base_dList_dList_Nil)))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "hashCombine"))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "hash")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromString") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromString") "String") ctors) hd) sp) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromInt") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromInt") "Int") ctors) hd) sp) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "FromFloat") then ((((((v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper tn) "fromFloat") "Float") ctors) hd) sp) else ((fun kind -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot derive `"; kind; "` (supported: Show, Eq, Ord, Hashable, FromString, FromInt, FromFloat)"])))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn)))))))))) ((Base_dList.v_Base_dList_dmap (fun p -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (tn, sp)), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (p, sp)), Base_dList.C_Base_dList_dList_Nil)), sp)))) used))) ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams params) ctors))) ((((v_Vuna_dCompiler_dElab_dDerive_dinstHead tn) dname) params) sp)))

let rec v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dDerive_dderiveInstance mc0) mc1) mc2) dtb__96) mc4)) (fun decl -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo mc0) mc1) mc2) dtb__97) mc4) (Base_dList.C_Base_dList_dList_Cons (decl, mc5)))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse mc5)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dderivingsFor = (fun dname params ctors derivings sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo dname) params) ctors) derivings) sp) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> (if dtb__105 then (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99) else (if ((Base_dList.v_Base_dList_dlength dtb__104) = 0) then (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dDerive_dderivingsFor dtb__100) dtb__101) dtb__103) dtb__104) dtb__107)) (fun insts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99)) (fun more -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dappend insts) more)))))))))
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__99)
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings = (fun decls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings decls)) (fun insts -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dappend decls) insts))))))
