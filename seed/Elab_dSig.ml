open Vuna_runtime
# 28 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_arityFun = (fun (n : int) (res : Core_dTerm.t_Term) -> (if (n <= 0) then res else (Core_dTerm.C_Term_TPi ("_", false, Core_dTerm.C_Rig_Rig0, (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero)), ((v_arityFun (n - 1)) res)))))

# 35 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_maxIntList = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if (dtb__0 >= (v_maxIntList dtb__1)) then dtb__0 else (v_maxIntList dtb__1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 65 "Vuna/Compiler/Elab/Sig.vuna"
let v_maxInt2 = (fun (a : int) (b : int) -> (if (a >= b) then a else b))

# 46 "Vuna/Compiler/Elab/Sig.vuna"
let v_addMaxAppArity = (fun (mc0 : string) (mc1 : int) (mc2 : Frontend_dAst.t_Expr) -> (match mc2 with
  | Frontend_dAst.C_Expr_EInterp (dtb__2, dtb__3) -> mc1
  | Frontend_dAst.C_Expr_EDo (dtb__4, dtb__5) -> mc1
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__6, dtb__7, dtb__8) -> mc1
  | Frontend_dAst.C_Expr_ERecord (dtb__9, dtb__10, dtb__11) -> mc1
  | Frontend_dAst.C_Expr_EField (dtb__12, dtb__13, dtb__14) -> mc1
  | Frontend_dAst.C_Expr_EIf (dtb__15, dtb__16, dtb__17, dtb__18) -> mc1
  | Frontend_dAst.C_Expr_ECase (dtb__19, dtb__20, dtb__21) -> mc1
  | Frontend_dAst.C_Expr_ELet (dtb__22, dtb__23, dtb__24, dtb__25) -> mc1
  | Frontend_dAst.C_Expr_EPi (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> mc1
  | Frontend_dAst.C_Expr_EApp (dtb__32, dtb__33, dtb__34) -> (match dtb__32 with
  | Frontend_dAst.C_Expr_EVar (dtb__35, dtb__36) -> (if (dtb__35 = mc0) then ((v_maxInt2 mc1) (B_dData_dList.v_length dtb__33)) else mc1)
  | _ -> mc1
)
  | Frontend_dAst.C_Expr_ELam (dtb__37, dtb__38, dtb__39) -> mc1
  | Frontend_dAst.C_Expr_EFloat (dtb__40, dtb__41) -> mc1
  | Frontend_dAst.C_Expr_EStr (dtb__42, dtb__43) -> mc1
  | Frontend_dAst.C_Expr_EInt (dtb__44, dtb__45) -> mc1
  | Frontend_dAst.C_Expr_EVar (dtb__46, dtb__47) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprMaxAppArity = (fun (pname : string) (e : Frontend_dAst.t_Expr) -> (((Frontend_dAstWalk.v_foldExpr (v_addMaxAppArity pname)) 0) e))

# 31 "Vuna/Compiler/Elab/Sig.vuna"
let v_methodMaxAppArity = (fun (pname : string) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (v_maxIntList ((B_dData_dList.v_map (fun (m : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((v_exprMaxAppArity pname) (B_dData_dPair.v_secondOf (Obj.magic m))))) methods)))

# 22 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKindOf = (fun (pname : string) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_arityFun ((v_methodMaxAppArity pname) methods)) (Core_dTerm.C_Term_TType (Core_dTerm.v_levelZero))))

# 25 "Vuna/Compiler/Elab/Sig.vuna"
let v_classParamKind = (fun (pname : string) (methods : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_classParamKindOf pname) methods))

# 40 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprMaxAppArityIn = (fun (pname : string) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (v_maxIntList ((B_dData_dList.v_map (v_exprMaxAppArity pname)) exprs)))

# 70 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_methodArgRigsOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (B_dData_dList.C_List__x58__x58_ (dtb__50, (v_methodArgRigsOf dtb__52)))
  | _ -> B_dData_dList.C_List_Nil
))

# 86 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_keepOut = (fun (mc0 : (string) -> bool) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (if (mc0 dtb__53) then ((v_keepOut mc0) dtb__54) else (B_dData_dList.C_List__x58__x58_ (dtb__53, ((v_keepOut mc0) dtb__54))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantify = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) (mc2 : Base_dSource.t_Span) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (Frontend_dAst.C_Expr_EPi (dtb__55, true, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", (Frontend_dAst.v_detachedNodeRef mc2))), (((v_quantify dtb__56) mc1) mc2), (Frontend_dAst.v_detachedNodeRef mc2)))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Elab/Sig.vuna"
let v_memberDomainOverridesOne = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__57, dtb__58, dtb__59) -> (match dtb__57 with
  | Frontend_dAst.C_Expr_EVar (dtb__60, dtb__61) -> (match dtb__58 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__63 with
  | B_dData_dList.C_List__x58__x58_ (dtb__64, dtb__65) -> (match dtb__65 with
  | B_dData_dList.C_List__x58__x58_ (dtb__66, dtb__67) -> (match dtb__67 with
  | B_dData_dList.C_List_Nil -> (if (dtb__60 = Base_dIntrinsics.v_effMemberFamilyName) then (let nPart = (match dtb__62 with
  | Frontend_dAst.C_Expr_EVar (dtb__70, dtb__71) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_strTypeName, dtb__71)) }, B_dData_dList.C_List_Nil))
  | _ -> B_dData_dList.C_List_Nil
) in (let rPart = (match dtb__66 with
  | Frontend_dAst.C_Expr_EVar (dtb__68, dtb__69) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = (Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_effRowFamilyName, dtb__69)) }, B_dData_dList.C_List_Nil))
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

# 119 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOverrides = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> ((B_dData_dList.v_append (v_memberDomainOverridesOne dtb__72)) (v_memberDomainOverrides dtb__73))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_memberDomainOf = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { B_dData_dPair.f_Pair_first = dtb__76; B_dData_dPair.f_Pair_second = dtb__77 } -> (if (dtb__76 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__77)) else ((v_memberDomainOf dtb__75) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindArrowExpr = (fun (k : int) (sp : Base_dSource.t_Span) -> (let r = (Frontend_dAst.v_detachedNodeRef sp) in (if (k <= 0) then (Frontend_dAst.C_Expr_EVar ("Type", r)) else (Frontend_dAst.C_Expr_EPi ("_", false, B_dData_dMaybe.C_Maybe_Nothing, (Frontend_dAst.C_Expr_EVar ("Type", r)), ((v_kindArrowExpr (k - 1)) sp), r)))))

# 107 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_quantifyTopKindsWith = (fun (mc0 : (string) -> Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Expr) (mc4 : Base_dSource.t_Span) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (let dom = (match (mc0 dtb__78) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__80) -> dtb__80
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_kindArrowExpr ((v_exprMaxAppArityIn dtb__78) mc2)) mc4)
  | _ -> failwith "DT: impossible branch"
) in (Frontend_dAst.C_Expr_EPi (dtb__78, true, B_dData_dMaybe.C_Maybe_Nothing, dom, (((((v_quantifyTopKindsWith mc0) dtb__79) mc2) mc3) mc4), (Frontend_dAst.v_detachedNodeRef mc4))))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopKinds = (fun (names : string B_dData_dList.t_List) (sigExpr : Frontend_dAst.t_Expr) (e : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (((((v_quantifyTopKindsWith (fun (_u : string) -> B_dData_dMaybe.C_Maybe_Nothing)) names) (B_dData_dList.C_List__x58__x58_ (sigExpr, B_dData_dList.C_List_Nil))) e) sp))

# 153 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_piBoundNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EPi (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (B_dData_dList.C_List__x58__x58_ (dtb__81, (v_piBoundNames dtb__85)))
  | _ -> B_dData_dList.C_List_Nil
))

# 180 "Vuna/Compiler/Elab/Sig.vuna"
let v_isLowerIdent = (fun (n : string) -> (match (B_dData_dList.dtp_unpack n) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (if (dtb__87 >= 97) then (dtb__87 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 163 "Vuna/Compiler/Elab/Sig.vuna"
let v_addLowerName = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__89, dtb__90) -> mc0
  | Frontend_dAst.C_Expr_EDo (dtb__91, dtb__92) -> mc0
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__93, dtb__94, dtb__95) -> mc0
  | Frontend_dAst.C_Expr_ERecord (dtb__96, dtb__97, dtb__98) -> mc0
  | Frontend_dAst.C_Expr_EField (dtb__99, dtb__100, dtb__101) -> mc0
  | Frontend_dAst.C_Expr_EIf (dtb__102, dtb__103, dtb__104, dtb__105) -> mc0
  | Frontend_dAst.C_Expr_ECase (dtb__106, dtb__107, dtb__108) -> mc0
  | Frontend_dAst.C_Expr_ELet (dtb__109, dtb__110, dtb__111, dtb__112) -> mc0
  | Frontend_dAst.C_Expr_EPi (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118) -> mc0
  | Frontend_dAst.C_Expr_EApp (dtb__119, dtb__120, dtb__121) -> mc0
  | Frontend_dAst.C_Expr_ELam (dtb__122, dtb__123, dtb__124) -> mc0
  | Frontend_dAst.C_Expr_EFloat (dtb__125, dtb__126) -> mc0
  | Frontend_dAst.C_Expr_EStr (dtb__127, dtb__128) -> mc0
  | Frontend_dAst.C_Expr_EInt (dtb__129, dtb__130) -> mc0
  | Frontend_dAst.C_Expr_EVar (dtb__131, dtb__132) -> (if (v_isLowerIdent dtb__131) then (B_dData_dList.C_List__x58__x58_ (dtb__131, mc0)) else mc0)
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Elab/Sig.vuna"
let v_exprLowerVars = (fun (e : Frontend_dAst.t_Expr) -> (((Frontend_dAstWalk.v_foldExpr v_addLowerName) B_dData_dList.C_List_Nil) e))

# 157 "Vuna/Compiler/Elab/Sig.vuna"
let v_lowerVarNames = (fun (e : Frontend_dAst.t_Expr) -> (B_dData_dList.v_nubNames (v_exprLowerVars e)))

# 190 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_dropName = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (if (dtb__133 = mc0) then ((v_dropName mc0) dtb__134) else (B_dData_dList.C_List__x58__x58_ (dtb__133, ((v_dropName mc0) dtb__134))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_dropPiBound = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> ((v_dropPiBound ((v_dropName dtb__135) mc0)) dtb__136)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Elab/Sig.vuna"
let v_freeNames = (fun (inScope : (string) -> bool) (ty : Frontend_dAst.t_Expr) -> ((v_keepOut inScope) ((v_dropPiBound (v_lowerVarNames ty)) (v_piBoundNames ty))))

# 80 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTraitSig = (fun (inScope : (string) -> bool) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (((v_quantify ((v_freeNames inScope) ty)) ty) sp))

# 213 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_kindDomains = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__137, dtb__138, dtb__139) -> (let nd_uscrut4 = dtb__137 in (match nd_uscrut4 with
  | Frontend_dAst.C_Expr_EVar (dtb__140, dtb__141) -> (if (dtb__140 = "->") then (let nd_uscrut7 = dtb__138 in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (match dtb__143 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (B_dData_dList.C_List__x58__x58_ (dtb__142, (v_kindDomains dtb__144)))
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))
  | Frontend_dAst.C_Expr_EPi (dtb__146, dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> (B_dData_dList.C_List__x58__x58_ (dtb__149, (v_kindDomains dtb__150)))
  | _ -> B_dData_dList.C_List_Nil
))

# 203 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_dataParamKindTbl = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (match dtb__152 with
  | Frontend_dAst.C_Decl_DData (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__154; B_dData_dPair.f_Pair_second = (v_kindDomains dtb__156) }, (v_dataParamKindTbl dtb__153)))
  | _ -> (v_dataParamKindTbl dtb__153)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_lookupParamKinds = (fun (mc0 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__165; B_dData_dPair.f_Pair_second = dtb__166 } -> (if (dtb__165 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__166)) else ((v_lookupParamKinds dtb__164) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_zipArgKindsGo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__167, dtb__168) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (match dtb__169 with
  | Frontend_dAst.C_Expr_EVar (dtb__171, dtb__172) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__171; B_dData_dPair.f_Pair_second = dtb__167 }, ((v_zipArgKindsGo dtb__168) dtb__170)))
  | _ -> ((v_zipArgKindsGo dtb__168) dtb__170)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Elab/Sig.vuna"
let v_zipArgKinds = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> ((v_zipArgKindsGo dtb__173) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Elab/Sig.vuna"
let v_addArgKinds = (fun (mc0 : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Expr) -> (match mc2 with
  | Frontend_dAst.C_Expr_EInterp (dtb__174, dtb__175) -> mc1
  | Frontend_dAst.C_Expr_EDo (dtb__176, dtb__177) -> mc1
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__178, dtb__179, dtb__180) -> mc1
  | Frontend_dAst.C_Expr_ERecord (dtb__181, dtb__182, dtb__183) -> mc1
  | Frontend_dAst.C_Expr_EField (dtb__184, dtb__185, dtb__186) -> mc1
  | Frontend_dAst.C_Expr_EIf (dtb__187, dtb__188, dtb__189, dtb__190) -> mc1
  | Frontend_dAst.C_Expr_ECase (dtb__191, dtb__192, dtb__193) -> mc1
  | Frontend_dAst.C_Expr_ELet (dtb__194, dtb__195, dtb__196, dtb__197) -> mc1
  | Frontend_dAst.C_Expr_EPi (dtb__198, dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> mc1
  | Frontend_dAst.C_Expr_EApp (dtb__204, dtb__205, dtb__206) -> (match dtb__204 with
  | Frontend_dAst.C_Expr_EVar (dtb__207, dtb__208) -> ((B_dData_dList.v_append ((v_zipArgKinds ((v_lookupParamKinds mc0) dtb__207)) dtb__205)) mc1)
  | _ -> mc1
)
  | Frontend_dAst.C_Expr_ELam (dtb__209, dtb__210, dtb__211) -> mc1
  | Frontend_dAst.C_Expr_EFloat (dtb__212, dtb__213) -> mc1
  | Frontend_dAst.C_Expr_EStr (dtb__214, dtb__215) -> mc1
  | Frontend_dAst.C_Expr_EInt (dtb__216, dtb__217) -> mc1
  | Frontend_dAst.C_Expr_EVar (dtb__218, dtb__219) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 231 "Vuna/Compiler/Elab/Sig.vuna"
let v_argParamKinds = (fun (tbl : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (e : Frontend_dAst.t_Expr) -> (((Frontend_dAstWalk.v_foldExpr (v_addArgKinds tbl)) B_dData_dList.C_List_Nil) e))

# 228 "Vuna/Compiler/Elab/Sig.vuna"
let v_argParamKindsIn = (fun (tbl : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (exprs : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (v_argParamKinds tbl)) exprs))

# 288 "Vuna/Compiler/Elab/Sig.vuna"
let v_modulePrefixOf = (fun (name : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> (Base_dSource.v_joinDots dtb__220)
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_filterNamesInModule = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> (if ((v_modulePrefixOf dtb__222) = (v_modulePrefixOf mc0)) then (B_dData_dList.C_List__x58__x58_ (dtb__222, ((v_filterNamesInModule mc0) dtb__223))) else ((v_filterNamesInModule mc0) dtb__223))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedKey = (fun (prefix : string) (name : string) -> (String.concat "" [prefix; "\t"; name]))

# 302 "Vuna/Compiler/Elab/Sig.vuna"
let v_qualifiedBannedTbl = (fun (defined : string B_dData_dList.t_List) -> ((((B_dContainer_dHashMap.v_insertAll B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((B_dData_dList.v_map (fun (n : string) -> { B_dData_dPair.f_Pair_first = ((v_qualifiedKey (v_modulePrefixOf n)) n); B_dData_dPair.f_Pair_second = true })) defined)) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)))

# 355 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_paramKindOf = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> (match dtb__224 with
  | { B_dData_dPair.f_Pair_first = dtb__226; B_dData_dPair.f_Pair_second = dtb__227 } -> (if (dtb__226 = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__227)) else ((v_paramKindOf dtb__225) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Elab/Sig.vuna"
let v_kindOverrideOf = (fun (memberOverrides : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (argOverrides : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (n : string) -> (match ((v_memberDomainOf memberOverrides) n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__228) -> (B_dData_dMaybe.C_Maybe_Just (dtb__228))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_paramKindOf argOverrides) n)
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_keepOutQualified = (fun (mc0 : string) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : string B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__229) mc2) then ((((v_keepOutQualified mc0) mc1) mc2) dtb__230) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ((v_qualifiedKey mc0) dtb__229)) mc1) then ((((v_keepOutQualified mc0) mc1) mc2) dtb__230) else (B_dData_dList.C_List__x58__x58_ (dtb__229, ((((v_keepOutQualified mc0) mc1) mc2) dtb__230)))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCached = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_freeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 323 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCached = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ctx : Frontend_dAst.t_Expr B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (let scanExprs = ((B_dData_dList.v_append ctx) (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil))) in (let lower = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) ctx)) (v_exprLowerVars ty))) in (let names = ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_dropPiBound lower) (v_piBoundNames ty))) in (let overrides = (v_memberDomainOverrides ctx) in (((((v_quantifyTopKindsWith (v_memberDomainOf overrides)) names) scanExprs) ty) sp))))))

# 338 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSigCtxCachedKinds = (fun (prefix : string) (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (preludeBanned : (string, bool) B_dContainer_dHashMap.t_HashMap) (paramKinds : (string, Frontend_dAst.t_Expr B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Frontend_dAst.t_Expr B_dData_dList.t_List) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> (let scanExprs = ((B_dData_dList.v_append ctx) (B_dData_dList.C_List__x58__x58_ (ty, B_dData_dList.C_List_Nil))) in (let lower = (B_dData_dList.v_nubNames ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprLowerVars) ctx)) (v_exprLowerVars ty))) in (let names = ((((v_keepOutQualified prefix) banned) preludeBanned) ((v_dropPiBound lower) (v_piBoundNames ty))) in (let memberOverrides = (v_memberDomainOverrides ctx) in (let argOverrides = ((v_argParamKindsIn paramKinds) scanExprs) in (((((v_quantifyTopKindsWith ((v_kindOverrideOf memberOverrides) argOverrides)) names) scanExprs) ty) sp)))))))

# 369 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_keepOutTbl = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__231) mc0) then ((v_keepOutTbl mc0) dtb__232) else (B_dData_dList.C_List__x58__x58_ (dtb__231, ((v_keepOutTbl mc0) dtb__232))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Elab/Sig.vuna"
let v_quantifyTopSig = (fun (banned : (string, bool) B_dContainer_dHashMap.t_HashMap) (ty : Frontend_dAst.t_Expr) (sp : Base_dSource.t_Span) -> ((((v_quantifyTopKinds ((v_keepOutTbl banned) ((v_freeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 374 "Vuna/Compiler/Elab/Sig.vuna"
let v_topPreludeNames = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_typeIntrinsicNames) Base_dIntrinsics.v_preludeValueNames))

# 270 "Vuna/Compiler/Elab/Sig.vuna"
let v_topQuantBanned = (fun (defined : string B_dData_dList.t_List) -> (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_append defined) v_topPreludeNames)))

# 276 "Vuna/Compiler/Elab/Sig.vuna"
let v_bannedForModule = (fun (sigName : string) (defined : string B_dData_dList.t_List) -> (v_topQuantBanned ((v_filterNamesInModule sigName) defined)))

# 378 "Vuna/Compiler/Elab/Sig.vuna"
let[@tail_mod_cons] rec v_definedNames = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> (match dtb__233 with
  | Frontend_dAst.C_Decl_DFun (dtb__235, dtb__236, dtb__237, dtb__238) -> (B_dData_dList.C_List__x58__x58_ (dtb__235, (v_definedNames dtb__234)))
  | Frontend_dAst.C_Decl_DAxiom (dtb__239, dtb__240, dtb__241) -> (B_dData_dList.C_List__x58__x58_ (dtb__239, (v_definedNames dtb__234)))
  | Frontend_dAst.C_Decl_DExtern (dtb__242, dtb__243, dtb__244, dtb__245) -> (B_dData_dList.C_List__x58__x58_ (dtb__242, (v_definedNames dtb__234)))
  | _ -> (v_definedNames dtb__234)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
