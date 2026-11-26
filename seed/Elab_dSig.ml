open Vuna_runtime
# 27 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_arityFun = (fun (n : int) (res : Core_dTerm.t_Term) -> (if (n <= 0) then res else (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_arityFun (n - 1)) res)))))

# 34 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_maxIntList = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (dtb__0 >= (v_maxIntList dtb__1)) then dtb__0 else (v_maxIntList dtb__1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Sig.vuna"
let v_altBodyOf = (fun (a : Frontend_dAst.t_Alt) -> (a).Frontend_dAst.f_Alt_altBody)

# 85 "Vuna/Compiler/Elab/Sig.vuna"
let v_clauseBodyOf = (fun (c : Frontend_dAst.t_LocalClause) -> (c).Frontend_dAst.f_LocalClause_lcBody)

# 45 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_exprMaxAppArityF = (fun (fuel : int) (pname : string) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then 0 else (let nd_uscrut3 = e in (match nd_uscrut3 with
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__2, dtb__3, dtb__4) -> (((v_exprMaxAppArityF (fuel - 1)) pname) dtb__2)
  | Frontend_dAst.C_Expr_ERecord (dtb__5, dtb__6, dtb__7) -> (v_maxIntList ((B_dData_dList.v_map (fun (q : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_exprMaxAppArityF (fuel - 1)) pname) (B_dData_dPair.v_secondOf q)))) dtb__6))
  | Frontend_dAst.C_Expr_EField (dtb__8, dtb__9, dtb__10) -> (((v_exprMaxAppArityF (fuel - 1)) pname) dtb__8)
  | Frontend_dAst.C_Expr_ECase (dtb__11, dtb__12, dtb__13) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__11), ((B_dData_dList.v_concatMap (fun (a : Frontend_dAst.t_Alt) -> (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) (v_altBodyOf a)), B_dData_dList.C_List_Nil)))) dtb__12))))
  | Frontend_dAst.C_Expr_ELet (dtb__14, dtb__15, dtb__16, dtb__17) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__15), (((v_exprMaxAppArityBindsF (fuel - 1)) pname) dtb__14))))
  | Frontend_dAst.C_Expr_EIf (dtb__18, dtb__19, dtb__20, dtb__21) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__18), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__19), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__20), B_dData_dList.C_List_Nil)))))))
  | Frontend_dAst.C_Expr_EPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__25), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__26), B_dData_dList.C_List_Nil)))))
  | Frontend_dAst.C_Expr_ELam (dtb__28, dtb__29, dtb__30) -> (((v_exprMaxAppArityF (fuel - 1)) pname) dtb__29)
  | Frontend_dAst.C_Expr_EApp (dtb__31, dtb__32, dtb__33) -> (match dtb__31 with
  | Frontend_dAst.C_Expr_EVar (dtb__34, dtb__35) -> (if (dtb__34 = pname) then (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.v_length dtb__32), ((B_dData_dList.v_map ((v_exprMaxAppArityF (fuel - 1)) pname)) dtb__32)))) else (v_maxIntList ((B_dData_dList.v_map ((v_exprMaxAppArityF (fuel - 1)) pname)) dtb__32)))
  | _ -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityF (fuel - 1)) pname) dtb__31), ((B_dData_dList.v_map ((v_exprMaxAppArityF (fuel - 1)) pname)) dtb__32))))
)
  | _ -> 0
))))
# 63 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppArityBindsF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityBindingF (mc0 - 1)) mc1) dtb__36), (((v_exprMaxAppArityBindsF (mc0 - 1)) mc1) dtb__37)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 68 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppArityBindingF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_Binding) -> (match mc2 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__38; Frontend_dAst.f_Binding_bindValue = dtb__39; Frontend_dAst.f_Binding_bindSig = dtb__40; Frontend_dAst.f_Binding_bindRef = dtb__41 } -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppArityValueF (mc0 - 1)) mc1) dtb__39), (B_dData_dList.C_List__x58__x58_ ((((v_exprMaxAppAritySigF (mc0 - 1)) mc1) dtb__40), B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
))
# 73 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppArityValueF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_BindingValue) -> (match mc2 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__42) -> (v_maxIntList ((B_dData_dList.v_map (fun (c : Frontend_dAst.t_LocalClause) -> (((v_exprMaxAppArityF (mc0 - 1)) mc1) (v_clauseBodyOf c)))) dtb__42))
  | Frontend_dAst.C_BindingValue_BVal (dtb__43) -> (((v_exprMaxAppArityF (mc0 - 1)) mc1) dtb__43)
  | _ -> failwith "DT: impossible branch"
))
# 78 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprMaxAppAritySigF = (fun (mc0 : int) (mc1 : string) (mc2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> (((v_exprMaxAppArityF (mc0 - 1)) mc1) (dtb__44).Frontend_dAst.f_BindingSig_sigType)
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprMaxAppArity = (fun (pname : string) (e : Frontend_dAst.t_Expr) -> (((v_exprMaxAppArityF ((Frontend_dAstQuery.v_exprBudget 64) e)) pname) e))

# 30 "Vuna/Compiler/Elab/Sig.vuna"
let v_methodMaxAppArity = (fun (pname : string) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_maxIntList ((B_dData_dList.v_map (fun (m : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprMaxAppArity pname) (B_dData_dPair.v_secondOf m)))) methods)))

# 21 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKindOf = (fun (pname : string) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_arityFun ((v_methodMaxAppArity pname) methods)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 24 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKind = (fun (pname : string) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_classParamKindOf pname) methods))

# 39 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprMaxAppArityIn = (fun (pname : string) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (v_maxIntList ((B_dData_dList.v_map (v_exprMaxAppArity pname)) exprs)))

# 93 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_methodArgRigsOfGo = (fun (mc0 : (bool) -> (Core_dTerm.t_Value) -> Core_dTerm.t_Rig) (mc1 : Core_dTerm.t_Term) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (let domVal = ((Core_dEval.v_eval mc2) dtb__48) in (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__45, (B_dData_dList.v_length mc2), B_dData_dList.C_List_Nil)))) in (B_dData_dList.C_List__x58__x58_ (dtb__47, (((v_methodArgRigsOfGo mc0) dtb__49) (B_dData_dList.C_List__x58__x58_ (v, mc2)))))))
  | _ -> B_dData_dList.C_List_Nil
))

# 90 "Vuna/Compiler/Elab/Sig.vuna"
let v_methodArgRigsOf = (fun (rigOf : (bool) -> (Core_dTerm.t_Value) -> Core_dTerm.t_Rig) (ty : Core_dTerm.t_Term) -> (((v_methodArgRigsOfGo rigOf) ty) B_dData_dList.C_List_Nil))

# 113 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_keepOut = (fun (mc0 : (string) -> bool) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (if (mc0 dtb__50) then ((v_keepOut mc0) dtb__51) else (B_dData_dList.C_List__x58__x58_ (dtb__50, ((v_keepOut mc0) dtb__51))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantify = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (Frontend_dAst.C_Expr_EPi (dtb__52, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef mc2))), (((v_quantify dtb__53) mc1) mc2), (Frontend_dAst.v_detachedNodeRef mc2)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 150 "Vuna/Compiler/Elab/Sig.vuna"
let v_memberDomainOverridesOne = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__54, dtb__55, dtb__56) -> (match dtb__54 with
  | Frontend_dAst.C_Expr_EVar (dtb__57, dtb__58) -> (match dtb__55 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match dtb__62 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match dtb__64 with
  | B_dData_dList.C_List_Nil -> (if (dtb__57 = Base_dIntrinsics.v_effMemberFamilyName) then (let nPart = (match dtb__59 with
  | Frontend_dAst.C_Expr_EVar (dtb__67, dtb__68) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_strTypeName, dtb__68)) }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
) in (let rPart = (match dtb__63 with
  | Frontend_dAst.C_Expr_EVar (dtb__65, dtb__66) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effRowFamilyName, dtb__66)) }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
) in ((B_dData_dList.v_append nPart) rPart))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))

# 146 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOverrides = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> ((B_dData_dList.v_append (v_memberDomainOverridesOne dtb__69)) (v_memberDomainOverrides dtb__70))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOf = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (match dtb__71 with
  | { B_dData_dPair.f_Pair_first = dtb__73; B_dData_dPair.f_Pair_second = dtb__74 } -> (if (dtb__73 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__74)) else ((v_memberDomainOf dtb__72) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 171 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindArrowExpr = (fun (k : int) (sp : Base_dSource.t_Span) -> (let r = (Frontend_dAst.v_detachedNodeRef sp) in (if (k <= 0) then (Frontend_dAst.C_Expr_EVar ("Type", r)) else (Frontend_dAst.C_Expr_EPi ("_", false, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", r)), ((v_kindArrowExpr (k - 1)) sp), r)))))

# 134 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantifyTopKindsWith = (fun (mc0 : (string) -> Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Expr) (mc4 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (let dom = (match (mc0 dtb__75) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__77) -> dtb__77
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_kindArrowExpr ((v_exprMaxAppArityIn dtb__75) mc2)) mc4)
  | _ -> failwith "DT: impossible branch"
) in (Frontend_dAst.C_Expr_EPi (dtb__75, true, B_dData_dMaybe.C_Maybe_Nothing, dom, (((((v_quantifyTopKindsWith mc0) dtb__76) mc2) mc3) mc4), (Frontend_dAst.v_detachedNodeRef mc4))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 126 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopKinds = (fun (names : string B_dData_dList.t_List) (sigExpr : Frontend_dAst.t_Expr) (e : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (((((v_quantifyTopKindsWith (fun (_u : string) -> B_dData_dMaybe.C_Maybe_Nothing)) names) (B_dData_dList.C_List__x58__x58_ (sigExpr, B_dData_dList.C_List_Nil))) e) sp))

# 180 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_piBoundNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> (B_dData_dList.C_List__x58__x58_ (dtb__78, (v_piBoundNames dtb__82)))
  | _ -> B_dData_dList.C_List_Nil
))

# 230 "Vuna/Compiler/Elab/Sig.vuna"
let v_isLowerIdent = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (if (dtb__84 >= 97) then (dtb__84 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_exprLowerVarsF = (fun (fuel : int) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match e with
  | Frontend_dAst.C_Expr_EVar (dtb__86, dtb__87) -> (if (v_isLowerIdent dtb__86) then (B_dData_dList.C_List__x58__x58_ (dtb__86, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | Frontend_dAst.C_Expr_EApp (dtb__88, dtb__89, dtb__90) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (fuel - 1)) dtb__88)) ((B_dData_dList.v_concatMap (v_exprLowerVarsF (fuel - 1))) dtb__89))
  | Frontend_dAst.C_Expr_ELam (dtb__91, dtb__92, dtb__93) -> ((v_exprLowerVarsF (fuel - 1)) dtb__92)
  | Frontend_dAst.C_Expr_EPi (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (fuel - 1)) dtb__97)) ((v_exprLowerVarsF (fuel - 1)) dtb__98))
  | Frontend_dAst.C_Expr_EIf (dtb__100, dtb__101, dtb__102, dtb__103) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (fuel - 1)) dtb__100)) ((B_dData_dList.v_append ((v_exprLowerVarsF (fuel - 1)) dtb__101)) ((v_exprLowerVarsF (fuel - 1)) dtb__102)))
  | Frontend_dAst.C_Expr_ELet (dtb__104, dtb__105, dtb__106, dtb__107) -> ((B_dData_dList.v_append ((v_exprLowerVarsBindsF (fuel - 1)) dtb__104)) ((v_exprLowerVarsF (fuel - 1)) dtb__105))
  | Frontend_dAst.C_Expr_ECase (dtb__108, dtb__109, dtb__110) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (fuel - 1)) dtb__108)) ((B_dData_dList.v_concatMap (fun (a : Frontend_dAst.t_Alt) -> ((v_exprLowerVarsF (fuel - 1)) (v_altBodyOf a)))) dtb__109))
  | Frontend_dAst.C_Expr_EField (dtb__111, dtb__112, dtb__113) -> ((v_exprLowerVarsF (fuel - 1)) dtb__111)
  | Frontend_dAst.C_Expr_ERecord (dtb__114, dtb__115, dtb__116) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprLowerVarsF (fuel - 1)) (B_dData_dPair.v_secondOf q)))) dtb__115)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__117, dtb__118, dtb__119) -> ((v_exprLowerVarsF (fuel - 1)) dtb__117)
  | _ -> B_dData_dList.C_List_Nil
)))
# 208 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsBindsF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__120, dtb__121) -> ((B_dData_dList.v_append ((v_exprLowerVarsBindingF (mc0 - 1)) dtb__120)) ((v_exprLowerVarsBindsF (mc0 - 1)) dtb__121))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 213 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsBindingF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_Binding) -> (match mc1 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__122; Frontend_dAst.f_Binding_bindValue = dtb__123; Frontend_dAst.f_Binding_bindSig = dtb__124; Frontend_dAst.f_Binding_bindRef = dtb__125 } -> ((B_dData_dList.v_append ((v_exprLowerVarsValueF (mc0 - 1)) dtb__123)) ((v_exprLowerVarsSigF (mc0 - 1)) dtb__124))
  | _ -> failwith "DT: impossible branch"
))
# 217 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsValueF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_BindingValue) -> (match mc1 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__126) -> ((v_exprLowerVarsClausesF (mc0 - 1)) dtb__126)
  | Frontend_dAst.C_BindingValue_BVal (dtb__127) -> ((v_exprLowerVarsF (mc0 - 1)) dtb__127)
  | _ -> failwith "DT: impossible branch"
))
# 221 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsSigF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__128) -> ((v_exprLowerVarsF (mc0 - 1)) (dtb__128).Frontend_dAst.f_BindingSig_sigType)
  | _ -> failwith "DT: impossible branch"
))
# 225 "Vuna/Compiler/Elab/Sig.vuna"
and v_exprLowerVarsClausesF = (fun (mc0 : int) (mc1 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__129, dtb__130) -> ((B_dData_dList.v_append ((v_exprLowerVarsF (mc0 - 1)) (dtb__129).Frontend_dAst.f_LocalClause_lcBody)) ((v_exprLowerVarsClausesF (mc0 - 1)) dtb__130))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprLowerVars = (fun (e : Frontend_dAst.t_Expr) -> ((v_exprLowerVarsF ((Frontend_dAstQuery.v_exprBudget 64) e)) e))

# 184 "Vuna/Compiler/Elab/Sig.vuna"
let v_lowerVarNames = (fun (e : Frontend_dAst.t_Expr) -> (B_dData_dList.v_nubNames (v_exprLowerVars e)))

# 240 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dropName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (if (dtb__131 = mc0) then ((v_dropName mc0) dtb__132) else (B_dData_dList.C_List__x58__x58_ (dtb__131, ((v_dropName mc0) dtb__132))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dropPiBound = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> ((v_dropPiBound ((v_dropName dtb__133) mc0)) dtb__134)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 110 "Vuna/Compiler/Elab/Sig.vuna"
let v_freeNames = (fun (inScope : (string) -> bool) (ty : Frontend_dAst.t_Expr) -> ((v_keepOut inScope) ((v_dropPiBound (v_lowerVarNames ty)) (v_piBoundNames ty))))

# 107 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTraitSig = (fun (inScope : (string) -> bool) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (((v_quantify ((v_freeNames inScope) ty)) ty) sp))

# 263 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindDomains = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__135, dtb__136, dtb__137) -> (let nd_uscrut4 = dtb__135 in (match nd_uscrut4 with
  | Frontend_dAst.C_Expr_EVar (dtb__138, dtb__139) -> (if (dtb__138 = "->") then (let nd_uscrut7 = dtb__136 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (match dtb__141 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (B_dData_dList.C_List__x58__x58_ (dtb__140, (v_kindDomains dtb__142)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))
  | Frontend_dAst.C_Expr_EPi (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148, dtb__149) -> (B_dData_dList.C_List__x58__x58_ (dtb__147, (v_kindDomains dtb__148)))
  | _ -> B_dData_dList.C_List_Nil
))

# 253 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dataParamKindTbl = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (match dtb__150 with
  | Frontend_dAst.C_Decl_DData (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = (v_kindDomains dtb__154) }, (v_dataParamKindTbl dtb__151)))
  | _ -> (v_dataParamKindTbl dtb__151)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_lookupParamKinds = (fun (mc0 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (match dtb__161 with
  | { B_dData_dPair.f_Pair_first = dtb__163; B_dData_dPair.f_Pair_second = dtb__164 } -> (if (dtb__163 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__164)) else ((v_lookupParamKinds dtb__162) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_zipArgKindsGo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match dtb__167 with
  | Frontend_dAst.C_Expr_EVar (dtb__169, dtb__170) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__165 }, ((v_zipArgKindsGo dtb__166) dtb__168)))
  | _ -> ((v_zipArgKindsGo dtb__166) dtb__168)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Sig.vuna"
let v_zipArgKinds = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> ((v_zipArgKindsGo dtb__171) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_argParamKindsF = (fun (fuel : int) (tbl : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (let nd_uscrut3 = e in (match nd_uscrut3 with
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__172, dtb__173, dtb__174) -> (((v_argParamKindsF (fuel - 1)) tbl) dtb__172)
  | Frontend_dAst.C_Expr_ERecord (dtb__175, dtb__176, dtb__177) -> ((B_dData_dList.v_concatMap (fun (q : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (((v_argParamKindsF (fuel - 1)) tbl) (B_dData_dPair.v_secondOf q)))) dtb__176)
  | Frontend_dAst.C_Expr_EField (dtb__178, dtb__179, dtb__180) -> (((v_argParamKindsF (fuel - 1)) tbl) dtb__178)
  | Frontend_dAst.C_Expr_EIf (dtb__181, dtb__182, dtb__183, dtb__184) -> ((B_dData_dList.v_append (((v_argParamKindsF (fuel - 1)) tbl) dtb__181)) ((B_dData_dList.v_append (((v_argParamKindsF (fuel - 1)) tbl) dtb__182)) (((v_argParamKindsF (fuel - 1)) tbl) dtb__183)))
  | Frontend_dAst.C_Expr_ECase (dtb__185, dtb__186, dtb__187) -> ((B_dData_dList.v_append (((v_argParamKindsF (fuel - 1)) tbl) dtb__185)) ((B_dData_dList.v_concatMap (fun (a : Frontend_dAst.t_Alt) -> (((v_argParamKindsF (fuel - 1)) tbl) (v_altBodyOf a)))) dtb__186))
  | Frontend_dAst.C_Expr_ELet (dtb__188, dtb__189, dtb__190, dtb__191) -> ((B_dData_dList.v_append (((v_argParamKindsBindsF (fuel - 1)) tbl) dtb__188)) (((v_argParamKindsF (fuel - 1)) tbl) dtb__189))
  | Frontend_dAst.C_Expr_EPi (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> ((B_dData_dList.v_append (((v_argParamKindsF (fuel - 1)) tbl) dtb__195)) (((v_argParamKindsF (fuel - 1)) tbl) dtb__196))
  | Frontend_dAst.C_Expr_ELam (dtb__198, dtb__199, dtb__200) -> (((v_argParamKindsF (fuel - 1)) tbl) dtb__199)
  | Frontend_dAst.C_Expr_EApp (dtb__201, dtb__202, dtb__203) -> (match dtb__201 with
  | Frontend_dAst.C_Expr_EVar (dtb__204, dtb__205) -> ((B_dData_dList.v_append ((v_zipArgKinds ((v_lookupParamKinds tbl) dtb__204)) dtb__202)) ((B_dData_dList.v_concatMap ((v_argParamKindsF (fuel - 1)) tbl)) dtb__202))
  | _ -> ((B_dData_dList.v_append (((v_argParamKindsF (fuel - 1)) tbl) dtb__201)) ((B_dData_dList.v_concatMap ((v_argParamKindsF (fuel - 1)) tbl)) dtb__202))
)
  | _ -> B_dData_dList.C_List_Nil
))))
# 302 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsBindsF = (fun (mc0 : int) (mc1 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__206, dtb__207) -> ((B_dData_dList.v_append (((v_argParamKindsBindingF (mc0 - 1)) mc1) dtb__206)) (((v_argParamKindsBindsF (mc0 - 1)) mc1) dtb__207))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 307 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsBindingF = (fun (mc0 : int) (mc1 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Binding) -> (match mc2 with
  | { Frontend_dAst.f_Binding_bindPat = dtb__208; Frontend_dAst.f_Binding_bindValue = dtb__209; Frontend_dAst.f_Binding_bindSig = dtb__210; Frontend_dAst.f_Binding_bindRef = dtb__211 } -> ((B_dData_dList.v_append (((v_argParamKindsValueF (mc0 - 1)) mc1) dtb__209)) (((v_argParamKindsSigF (mc0 - 1)) mc1) dtb__210))
  | _ -> failwith "DT: impossible branch"
))
# 311 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsValueF = (fun (mc0 : int) (mc1 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_BindingValue) -> (match mc2 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__212) -> (((v_argParamKindsClausesF (mc0 - 1)) mc1) dtb__212)
  | Frontend_dAst.C_BindingValue_BVal (dtb__213) -> (((v_argParamKindsF (mc0 - 1)) mc1) dtb__213)
  | _ -> failwith "DT: impossible branch"
))
# 315 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsSigF = (fun (mc0 : int) (mc1 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> (((v_argParamKindsF (mc0 - 1)) mc1) (dtb__214).Frontend_dAst.f_BindingSig_sigType)
  | _ -> failwith "DT: impossible branch"
))
# 319 "Vuna/Compiler/Elab/Sig.vuna"
and v_argParamKindsClausesF = (fun (mc0 : int) (mc1 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> ((B_dData_dList.v_append (((v_argParamKindsF (mc0 - 1)) mc1) (dtb__215).Frontend_dAst.f_LocalClause_lcBody)) (((v_argParamKindsClausesF (mc0 - 1)) mc1) dtb__216))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Sig.vuna"
let v_argParamKinds = (fun (tbl : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (((v_argParamKindsF ((Frontend_dAstQuery.v_exprBudget 64) e)) tbl) e))

# 278 "Vuna/Compiler/Elab/Sig.vuna"
let v_argParamKindsIn = (fun (tbl : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (v_argParamKinds tbl)) exprs))

# 359 "Vuna/Compiler/Elab/Sig.vuna"
let v_modulePrefixOf = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 } -> (Base_dSource.v_joinDots dtb__217)
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_filterNamesInModule = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> (if ((v_modulePrefixOf dtb__219) = (v_modulePrefixOf mc0)) then (B_dData_dList.C_List__x58__x58_ (dtb__219, ((v_filterNamesInModule mc0) dtb__220))) else ((v_filterNamesInModule mc0) dtb__220))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 379 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedKey = (fun (prefix : string) (name : string) -> (String.concat "" [prefix; "\t"; name]))

# 373 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedBannedTbl = (fun (defined : string B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = ((v_qualifiedKey (v_modulePrefixOf n)) n); B_dData_dPair.f_Pair_second = true })) defined)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 426 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_paramKindOf = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__221, dtb__222) -> (match dtb__221 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> (if (dtb__223 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__224)) else ((v_paramKindOf dtb__222) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 420 "Vuna/Compiler/Elab/Sig.vuna"
let v_kindOverrideOf = (fun (memberOverrides : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (argOverrides : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (n : string) -> (match ((v_memberDomainOf memberOverrides) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (B_dData_dMaybe.C_Maybe_Just (dtb__225))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_paramKindOf argOverrides) n)
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_keepOutQualified = (fun (mc0 : string) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__226, dtb__227) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__226) mc2) then ((((v_keepOutQualified mc0) mc1) mc2) dtb__227) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((v_qualifiedKey mc0) dtb__226)) mc1) then ((((v_keepOutQualified mc0) mc1) mc2) dtb__227) else (B_dData_dList.C_List__x58__x58_ (dtb__226, ((((v_keepOutQualified mc0) mc1) mc2) dtb__227)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 383 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCached = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_freeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 394 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCached = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ctx : Frontend_dAst.t_Expr B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (let scanExprs = ((B_dData_dList.v_append ctx) (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil))) in (let lower = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) ctx)) (v_exprLowerVars ty))) in (let names = ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_dropPiBound lower) (v_piBoundNames ty))) in (let overrides = (v_memberDomainOverrides ctx) in (((((v_quantifyTopKindsWith (v_memberDomainOf overrides)) names) scanExprs) ty) sp))))))

# 409 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCachedKinds = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (paramKinds : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Frontend_dAst.t_Expr B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (let scanExprs = ((B_dData_dList.v_append ctx) (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil))) in (let lower = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) ctx)) (v_exprLowerVars ty))) in (let names = ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_dropPiBound lower) (v_piBoundNames ty))) in (let memberOverrides = (v_memberDomainOverrides ctx) in (let argOverrides = ((v_argParamKindsIn paramKinds) scanExprs) in (((((v_quantifyTopKindsWith ((v_kindOverrideOf memberOverrides) argOverrides)) names) scanExprs) ty) sp)))))))

# 440 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_keepOutTbl = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__228) mc0) then ((v_keepOutTbl mc0) dtb__229) else (B_dData_dList.C_List__x58__x58_ (dtb__228, ((v_keepOutTbl mc0) dtb__229))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSig = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((v_keepOutTbl banned) ((v_freeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 445 "Vuna/Compiler/Elab/Sig.vuna"
let v_topPreludeNames = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_typeIntrinsicNames) Base_dIntrinsics.v_preludeValueNames))

# 341 "Vuna/Compiler/Elab/Sig.vuna"
let v_topQuantBanned = (fun (defined : string B_dData_dList.t_List) -> (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_append defined) v_topPreludeNames)))

# 347 "Vuna/Compiler/Elab/Sig.vuna"
let v_bannedForModule = (fun (sigName : string) (defined : string B_dData_dList.t_List) -> (v_topQuantBanned ((v_filterNamesInModule sigName) defined)))

# 449 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_definedNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | Frontend_dAst.C_Decl_DFun (dtb__232, dtb__233, dtb__234, dtb__235) -> (B_dData_dList.C_List__x58__x58_ (dtb__232, (v_definedNames dtb__231)))
  | Frontend_dAst.C_Decl_DAxiom (dtb__236, dtb__237, dtb__238) -> (B_dData_dList.C_List__x58__x58_ (dtb__236, (v_definedNames dtb__231)))
  | Frontend_dAst.C_Decl_DExtern (dtb__239, dtb__240, dtb__241, dtb__242) -> (B_dData_dList.C_List__x58__x58_ (dtb__239, (v_definedNames dtb__231)))
  | _ -> (v_definedNames dtb__231)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
