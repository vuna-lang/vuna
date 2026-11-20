open Vuna_runtime
# 26 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_arityFun = (fun (n : int) (res : Core_dTerm.t_Term) -> (if (n <= 0) then res else (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_arityFun (n - 1)) res)))))

# 33 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_maxIntList = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (dtb__0 >= (v_maxIntList dtb__1)) then dtb__0 else (v_maxIntList dtb__1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_exprMaxAppArity = (fun (mc0 : string) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__2, dtb__3, dtb__4) -> ((v_exprMaxAppArity mc0) dtb__2)
  | Frontend_dRast.C_Expr_ERecord (dtb__5, dtb__6, dtb__7) -> (v_maxIntList ((B_dData_dList.v_map (fun (p : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprMaxAppArity mc0) (B_dData_dPair.v_secondOf p)))) dtb__6))
  | Frontend_dRast.C_Expr_EField (dtb__8, dtb__9, dtb__10) -> ((v_exprMaxAppArity mc0) dtb__8)
  | Frontend_dRast.C_Expr_EIf (dtb__11, dtb__12, dtb__13, dtb__14) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__11), (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__12), (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__13), B_dData_dList.C_List_Nil)))))))
  | Frontend_dRast.C_Expr_ECase (dtb__15, dtb__16, dtb__17) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__15), ((B_dData_dList.v_map (fun (a : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprMaxAppArity mc0) (B_dData_dPair.v_secondOf a)))) dtb__16))))
  | Frontend_dRast.C_Expr_ELet (dtb__18, dtb__19, dtb__20, dtb__21) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__19), ((B_dData_dList.v_map (fun (b : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprMaxAppArity mc0) (B_dData_dPair.v_secondOf b)))) dtb__18))))
  | Frontend_dRast.C_Expr_EPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__25), (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__26), B_dData_dList.C_List_Nil)))))
  | Frontend_dRast.C_Expr_ELam (dtb__28, dtb__29, dtb__30) -> ((v_exprMaxAppArity mc0) dtb__29)
  | Frontend_dRast.C_Expr_EApp (dtb__31, dtb__32, dtb__33) -> (match dtb__31 with
  | Frontend_dRast.C_Expr_EVar (dtb__34, dtb__35) -> (if ((Frontend_dRast_dName.v_rnameKey dtb__34) = mc0) then (v_maxIntList (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.v_length dtb__32), ((B_dData_dList.v_map (v_exprMaxAppArity mc0)) dtb__32)))) else (v_maxIntList ((B_dData_dList.v_map (v_exprMaxAppArity mc0)) dtb__32)))
  | _ -> (v_maxIntList (B_dData_dList.C_List__x58__x58_ (((v_exprMaxAppArity mc0) dtb__31), ((B_dData_dList.v_map (v_exprMaxAppArity mc0)) dtb__32))))
)
  | _ -> 0
))

# 29 "Vuna/Compiler/Elab/Sig.vuna"
let v_methodMaxAppArity = (fun (pname : string) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_maxIntList ((B_dData_dList.v_map (fun (m : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprMaxAppArity pname) (B_dData_dPair.v_secondOf m)))) methods)))

# 20 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKindOf = (fun (pname : string) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_arityFun ((v_methodMaxAppArity pname) methods)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 23 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKind = (fun (pname : string) (methods : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_classParamKindOf pname) methods))

# 65 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_methodArgRigsOfGo = (fun (mc0 : (bool) -> (Core_dTerm.t_Value) -> Core_dTerm.t_Rig) (mc1 : Core_dTerm.t_Term) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> (let domVal = ((Core_dEval.v_eval mc2) dtb__39) in (let v = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__36, (B_dData_dList.v_length mc2), B_dData_dList.C_List_Nil)))) in (B_dData_dList.C_List__x58__x58_ (dtb__38, (((v_methodArgRigsOfGo mc0) dtb__40) (B_dData_dList.C_List__x58__x58_ (v, mc2)))))))
  | _ -> B_dData_dList.C_List_Nil
))

# 62 "Vuna/Compiler/Elab/Sig.vuna"
let v_methodArgRigsOf = (fun (rigOf : (bool) -> (Core_dTerm.t_Value) -> Core_dTerm.t_Rig) (ty : Core_dTerm.t_Term) -> (((v_methodArgRigsOfGo rigOf) ty) B_dData_dList.C_List_Nil))

# 85 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_keepOut = (fun (mc0 : (string) -> bool) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (if (mc0 dtb__41) then ((v_keepOut mc0) dtb__42) else (B_dData_dList.C_List__x58__x58_ (dtb__41, ((v_keepOut mc0) dtb__42))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantify = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (Frontend_dRast.C_Expr_EPi (dtb__43, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Type"), mc2)), (((v_quantify dtb__44) mc1) mc2), mc2))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Sig.vuna"
let v_memberDomainOverridesOne = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__45, dtb__46, dtb__47) -> (match dtb__45 with
  | Frontend_dRast.C_Expr_EVar (dtb__48, dtb__49) -> (match dtb__46 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (match dtb__51 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | B_dData_dList.C_List_Nil -> (if ((Frontend_dRast_dName.v_rnameKey dtb__48) = Base_dIntrinsics.v_effMemberFamilyName) then (let nPart = (match dtb__50 with
  | Frontend_dRast.C_Expr_EVar (dtb__58, dtb__59) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__58); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_strTypeName), dtb__59)) }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
) in (let rPart = (match dtb__54 with
  | Frontend_dRast.C_Expr_EVar (dtb__56, dtb__57) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__56); B_dData_dPair.f_Pair_second = (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName Base_dIntrinsics.v_effRowFamilyName), dtb__57)) }, B_dData_dList.C_List_Nil))
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

# 123 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOverrides = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> ((B_dData_dList.v_append (v_memberDomainOverridesOne dtb__60)) (v_memberDomainOverrides dtb__61))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOf = (fun (mc0 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__62 with
  | { B_dData_dPair.f_Pair_first = dtb__64; B_dData_dPair.f_Pair_second = dtb__65 } -> (if (dtb__64 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__65)) else ((v_memberDomainOf dtb__63) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindArrowExpr = (fun (k : int) (sp : Base_dSource.t_Span) -> (if (k <= 0) then (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Type"), sp)) else (Frontend_dRast.C_Expr_EPi ("_", false, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "Type"), sp)), ((v_kindArrowExpr (k - 1)) sp), sp))))

# 98 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantifyTopKinds = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) (mc2 : Frontend_dRast.t_Expr) (mc3 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (Frontend_dRast.C_Expr_EPi (dtb__66, true, B_dData_dMaybe.C_Maybe_Nothing, ((v_kindArrowExpr ((v_exprMaxAppArity dtb__66) mc1)) mc3), ((((v_quantifyTopKinds dtb__67) mc1) mc2) mc3), mc3))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantifyTopKindsWith = (fun (mc0 : (string) -> Frontend_dRast.t_Expr B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dRast.t_Expr) (mc3 : Frontend_dRast.t_Expr) (mc4 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__68, dtb__69) -> (let dom = (match (mc0 dtb__68) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> dtb__70
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_kindArrowExpr ((v_exprMaxAppArity dtb__68) mc2)) mc4)
  | _ -> failwith "DT: impossible branch"
) in (Frontend_dRast.C_Expr_EPi (dtb__68, true, B_dData_dMaybe.C_Maybe_Nothing, dom, (((((v_quantifyTopKindsWith mc0) dtb__69) mc2) mc3) mc4), mc4)))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_piBoundNames = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> (B_dData_dList.C_List__x58__x58_ (dtb__71, (v_piBoundNames dtb__75)))
  | _ -> B_dData_dList.C_List_Nil
))

# 177 "Vuna/Compiler/Elab/Sig.vuna"
let v_isLowerIdent = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if (dtb__77 >= 97) then (dtb__77 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_exprLowerVars = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__79, dtb__80, dtb__81) -> (v_exprLowerVars dtb__79)
  | Frontend_dRast.C_Expr_ERecord (dtb__82, dtb__83, dtb__84) -> ((B_dData_dList.v_concatMap (fun (p : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (v_exprLowerVars (B_dData_dPair.v_secondOf p)))) dtb__83)
  | Frontend_dRast.C_Expr_EField (dtb__85, dtb__86, dtb__87) -> (v_exprLowerVars dtb__85)
  | Frontend_dRast.C_Expr_ECase (dtb__88, dtb__89, dtb__90) -> ((B_dData_dList.v_append (v_exprLowerVars dtb__88)) ((B_dData_dList.v_concatMap (fun (a : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (v_exprLowerVars (B_dData_dPair.v_secondOf a)))) dtb__89))
  | Frontend_dRast.C_Expr_ELet (dtb__91, dtb__92, dtb__93, dtb__94) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (b : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> (v_exprLowerVars (B_dData_dPair.v_secondOf b)))) dtb__91)) (v_exprLowerVars dtb__92))
  | Frontend_dRast.C_Expr_EIf (dtb__95, dtb__96, dtb__97, dtb__98) -> ((B_dData_dList.v_append (v_exprLowerVars dtb__95)) ((B_dData_dList.v_append (v_exprLowerVars dtb__96)) (v_exprLowerVars dtb__97)))
  | Frontend_dRast.C_Expr_EPi (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> ((B_dData_dList.v_append (v_exprLowerVars dtb__102)) (v_exprLowerVars dtb__103))
  | Frontend_dRast.C_Expr_ELam (dtb__105, dtb__106, dtb__107) -> (v_exprLowerVars dtb__106)
  | Frontend_dRast.C_Expr_EApp (dtb__108, dtb__109, dtb__110) -> ((B_dData_dList.v_append (v_exprLowerVars dtb__108)) ((B_dData_dList.v_concatMap v_exprLowerVars) dtb__109))
  | Frontend_dRast.C_Expr_EVar (dtb__111, dtb__112) -> (if (v_isLowerIdent (Frontend_dRast_dName.v_rnameKey dtb__111)) then (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast_dName.v_rnameKey dtb__111), B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 159 "Vuna/Compiler/Elab/Sig.vuna"
let v_lowerVarNames = (fun (e : Frontend_dRast.t_Expr) -> (B_dData_dList.v_nubNames (v_exprLowerVars e)))

# 187 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dropName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if (dtb__113 = mc0) then ((v_dropName mc0) dtb__114) else (B_dData_dList.C_List__x58__x58_ (dtb__113, ((v_dropName mc0) dtb__114))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dropPiBound = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> ((v_dropPiBound ((v_dropName dtb__115) mc0)) dtb__116)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Sig.vuna"
let v_freeNames = (fun (inScope : (string) -> bool) (ty : Frontend_dRast.t_Expr) -> ((v_keepOut inScope) ((v_dropPiBound (v_lowerVarNames ty)) (v_piBoundNames ty))))

# 79 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTraitSig = (fun (inScope : (string) -> bool) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (((v_quantify ((v_freeNames inScope) ty)) ty) sp))

# 210 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindDomains = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EApp (dtb__117, dtb__118, dtb__119) -> (let nd_uscrut4 = dtb__117 in (match nd_uscrut4 with
  | Frontend_dRast.C_Expr_EVar (dtb__120, dtb__121) -> (match dtb__120 with
  | Frontend_dRast_dName.C_RName_RIntrinsic (dtb__122) -> (if (dtb__122 = "->") then (let nd_uscrut8 = dtb__118 in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__123, dtb__124) -> (match dtb__124 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (B_dData_dList.C_List__x58__x58_ (dtb__123, (v_kindDomains dtb__125)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
))
  | Frontend_dRast.C_Expr_EPi (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (B_dData_dList.C_List__x58__x58_ (dtb__130, (v_kindDomains dtb__131)))
  | _ -> B_dData_dList.C_List_Nil
))

# 200 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dataParamKindTbl = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (match dtb__133 with
  | Frontend_dRast.C_Decl_DData (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__135; B_dData_dPair.f_Pair_second = (v_kindDomains dtb__137) }, (v_dataParamKindTbl dtb__134)))
  | _ -> (v_dataParamKindTbl dtb__134)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_lookupParamKinds = (fun (mc0 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__144 with
  | { B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__147 } -> (if (dtb__146 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__147)) else ((v_lookupParamKinds dtb__145) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_zipArgKindsGo = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (match dtb__150 with
  | Frontend_dRast.C_Expr_EVar (dtb__152, dtb__153) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Frontend_dRast_dName.v_rnameKey dtb__152); B_dData_dPair.f_Pair_second = dtb__148 }, ((v_zipArgKindsGo dtb__149) dtb__151)))
  | _ -> ((v_zipArgKindsGo dtb__149) dtb__151)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Elab/Sig.vuna"
let v_zipArgKinds = (fun (mc0 : Frontend_dRast.t_Expr B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> ((v_zipArgKindsGo dtb__154) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_argParamKinds = (fun (mc0 : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Frontend_dRast.t_Expr) -> (match mc1 with
  | Frontend_dRast.C_Expr_EAnn (dtb__155, dtb__156, dtb__157) -> ((B_dData_dList.v_append ((v_argParamKinds mc0) dtb__155)) ((v_argParamKinds mc0) dtb__156))
  | Frontend_dRast.C_Expr_ERecUpdate (dtb__158, dtb__159, dtb__160) -> ((v_argParamKinds mc0) dtb__158)
  | Frontend_dRast.C_Expr_ERecord (dtb__161, dtb__162, dtb__163) -> ((B_dData_dList.v_concatMap (fun (p : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_argParamKinds mc0) (B_dData_dPair.v_secondOf p)))) dtb__162)
  | Frontend_dRast.C_Expr_EField (dtb__164, dtb__165, dtb__166) -> ((v_argParamKinds mc0) dtb__164)
  | Frontend_dRast.C_Expr_EIf (dtb__167, dtb__168, dtb__169, dtb__170) -> ((B_dData_dList.v_append ((v_argParamKinds mc0) dtb__167)) ((B_dData_dList.v_append ((v_argParamKinds mc0) dtb__168)) ((v_argParamKinds mc0) dtb__169)))
  | Frontend_dRast.C_Expr_ECase (dtb__171, dtb__172, dtb__173) -> ((B_dData_dList.v_append ((v_argParamKinds mc0) dtb__171)) ((B_dData_dList.v_concatMap (fun (a : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_argParamKinds mc0) (B_dData_dPair.v_secondOf a)))) dtb__172))
  | Frontend_dRast.C_Expr_ELet (dtb__174, dtb__175, dtb__176, dtb__177) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (b : (Frontend_dRast.t_Pat, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair) -> ((v_argParamKinds mc0) (B_dData_dPair.v_secondOf b)))) dtb__174)) ((v_argParamKinds mc0) dtb__175))
  | Frontend_dRast.C_Expr_EPi (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> ((B_dData_dList.v_append ((v_argParamKinds mc0) dtb__181)) ((v_argParamKinds mc0) dtb__182))
  | Frontend_dRast.C_Expr_ELam (dtb__184, dtb__185, dtb__186) -> ((v_argParamKinds mc0) dtb__185)
  | Frontend_dRast.C_Expr_EApp (dtb__187, dtb__188, dtb__189) -> (match dtb__187 with
  | Frontend_dRast.C_Expr_EVar (dtb__190, dtb__191) -> ((B_dData_dList.v_append ((v_zipArgKinds ((v_lookupParamKinds mc0) (Frontend_dRast_dName.v_rnameKey dtb__190))) dtb__188)) ((B_dData_dList.v_concatMap (v_argParamKinds mc0)) dtb__188))
  | _ -> ((B_dData_dList.v_append ((v_argParamKinds mc0) dtb__187)) ((B_dData_dList.v_concatMap (v_argParamKinds mc0)) dtb__188))
)
  | _ -> B_dData_dList.C_List_Nil
))

# 279 "Vuna/Compiler/Elab/Sig.vuna"
let v_modulePrefixOf = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> (Base_dSource.v_joinDots dtb__192)
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_filterNamesInModule = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (if ((v_modulePrefixOf dtb__194) = (v_modulePrefixOf mc0)) then (B_dData_dList.C_List__x58__x58_ (dtb__194, ((v_filterNamesInModule mc0) dtb__195))) else ((v_filterNamesInModule mc0) dtb__195))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedKey = (fun (prefix : string) (name : string) -> (String.concat "" [prefix; "\t"; name]))

# 293 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedBannedTbl = (fun (defined : string B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = ((v_qualifiedKey (v_modulePrefixOf n)) n); B_dData_dPair.f_Pair_second = true })) defined)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)))

# 346 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_paramKindOf = (fun (mc0 : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__198; B_dData_dPair.f_Pair_second = dtb__199 } -> (if (dtb__198 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__199)) else ((v_paramKindOf dtb__197) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Elab/Sig.vuna"
let v_kindOverrideOf = (fun (memberOverrides : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (argOverrides : (string, Frontend_dRast.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (n : string) -> (match ((v_memberDomainOf memberOverrides) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (B_dData_dMaybe.C_Maybe_Just (dtb__200))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_paramKindOf argOverrides) n)
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_keepOutQualified = (fun (mc0 : string) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__201) mc2) then ((((v_keepOutQualified mc0) mc1) mc2) dtb__202) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) ((v_qualifiedKey mc0) dtb__201)) mc1) then ((((v_keepOutQualified mc0) mc1) mc2) dtb__202) else (B_dData_dList.C_List__x58__x58_ (dtb__201, ((((v_keepOutQualified mc0) mc1) mc2) dtb__202)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCached = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_freeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 314 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCached = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ctx : Frontend_dRast.t_Expr B_dData_dList.t_List) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let combined = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "#sig"), sp)), ((B_dData_dList.v_append ctx) (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil))), sp)) in (let lower = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) ctx)) (v_exprLowerVars ty))) in (let names = ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_dropPiBound lower) (v_piBoundNames ty))) in (let overrides = (v_memberDomainOverrides ctx) in (((((v_quantifyTopKindsWith (v_memberDomainOf overrides)) names) combined) ty) sp))))))

# 329 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCachedKinds = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (paramKinds : (string, Frontend_dRast.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Frontend_dRast.t_Expr B_dData_dList.t_List) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> (let combined = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.v_classifyName "#sig"), sp)), ((B_dData_dList.v_append ctx) (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil))), sp)) in (let lower = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) ctx)) (v_exprLowerVars ty))) in (let names = ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_dropPiBound lower) (v_piBoundNames ty))) in (let memberOverrides = (v_memberDomainOverrides ctx) in (let argOverrides = ((v_argParamKinds paramKinds) combined) in (((((v_quantifyTopKindsWith ((v_kindOverrideOf memberOverrides) argOverrides)) names) combined) ty) sp)))))))

# 360 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_keepOutTbl = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__203) mc0) then ((v_keepOutTbl mc0) dtb__204) else (B_dData_dList.C_List__x58__x58_ (dtb__203, ((v_keepOutTbl mc0) dtb__204))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSig = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ty : Frontend_dRast.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((v_keepOutTbl banned) ((v_freeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 365 "Vuna/Compiler/Elab/Sig.vuna"
let v_topPreludeNames = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_typeIntrinsicNames) Base_dIntrinsics.v_preludeValueNames))

# 261 "Vuna/Compiler/Elab/Sig.vuna"
let v_topQuantBanned = (fun (defined : string B_dData_dList.t_List) -> (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_append defined) v_topPreludeNames)))

# 267 "Vuna/Compiler/Elab/Sig.vuna"
let v_bannedForModule = (fun (sigName : string) (defined : string B_dData_dList.t_List) -> (v_topQuantBanned ((v_filterNamesInModule sigName) defined)))

# 369 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_definedNames = (fun (mc0 : Frontend_dRast.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | Frontend_dRast.C_Decl_DFun (dtb__207, dtb__208, dtb__209, dtb__210) -> (B_dData_dList.C_List__x58__x58_ (dtb__207, (v_definedNames dtb__206)))
  | Frontend_dRast.C_Decl_DAxiom (dtb__211, dtb__212, dtb__213) -> (B_dData_dList.C_List__x58__x58_ (dtb__211, (v_definedNames dtb__206)))
  | Frontend_dRast.C_Decl_DExtern (dtb__214, dtb__215, dtb__216, dtb__217) -> (B_dData_dList.C_List__x58__x58_ (dtb__214, (v_definedNames dtb__206)))
  | _ -> (v_definedNames dtb__206)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
