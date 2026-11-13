open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dSig_darityFun = (fun n res -> (if (n <= 0) then res else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dSig_darityFun (n - 1)) res)))))

let rec v_Vuna_dCompiler_dElab_dSig_dmaxIntList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (dtb__0 >= (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1)) then dtb__0 else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__2, dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__5, dtb__6, dtb__7) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dList.v_Base_dList_dmap (fun p -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dPair.v_Base_dPair_dsecondOf p)))) dtb__6))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__8, dtb__9, dtb__10) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__11, dtb__12, dtb__13, dtb__14) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__11), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__12), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__13), Base_dList.C_Base_dList_dList_Nil)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__15), ((Base_dList.v_Base_dList_dmap (fun a -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dPair.v_Base_dPair_dsecondOf a)))) dtb__16))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__18, dtb__19, dtb__20, dtb__21) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__19), ((Base_dList.v_Base_dList_dmap (fun b -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dPair.v_Base_dPair_dsecondOf b)))) dtb__18))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__25), (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__26), Base_dList.C_Base_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__28, dtb__29, dtb__30) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__29)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__31, dtb__32, dtb__33) -> (match dtb__31 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__34, dtb__35) -> (if (dtb__34 = mc0) then (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons ((Base_dList.v_Base_dList_dlength dtb__32), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32)))) else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dList.C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__31), ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32))))
)
  | _ -> 0
))

let v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity = (fun pname methods -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dList.v_Base_dList_dmap (fun m -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (Base_dPair.v_Base_dPair_dsecondOf m)))) methods)))

let v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf = (fun pname methods -> ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity pname) methods)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

let v_Vuna_dCompiler_dElab_dSig_dclassParamKind = (fun pname methods -> ((v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods))

let rec v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> ((fun domVal -> ((fun v -> (Base_dList.C_Base_dList_dList_Cons (dtb__38, (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo mc0) dtb__40) (Base_dList.C_Base_dList_dList_Cons (v, mc2)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__36, (Base_dList.v_Base_dList_dlength mc2), Base_dList.C_Base_dList_dList_Nil)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval mc2) dtb__39))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf = (fun rigOf ty -> (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo rigOf) ty) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOut = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if (mc0 dtb__41) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__42) else (Base_dList.C_Base_dList_dList_Cons (dtb__41, ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__42))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dquantify = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__43, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", mc2)), (((v_Vuna_dCompiler_dElab_dSig_dquantify dtb__44) mc1) mc2), mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverridesOne = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__45, dtb__46, dtb__47) -> (match dtb__45 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__48, dtb__49) -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__48 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMemberFamilyName) then ((fun nPart -> ((fun rPart -> ((Base_dList.v_Base_dList_dappend nPart) rPart)) (match dtb__54 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__56, dtb__57) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__56; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowFamilyName, dtb__57)) }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))) (match dtb__50 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__58, dtb__59) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__58; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName, dtb__59)) }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverridesOne dtb__60)) (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides dtb__61))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (match dtb__62 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__64; Base_dPair.f_Base_dPair_dPair_second = dtb__65 } -> (if (dtb__64 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65)) else ((v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf dtb__63) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr = (fun k sp -> (if (k <= 0) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi ("_", false, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("Type", sp)), ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr (k - 1)) sp), sp))))

let rec v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__66, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity dtb__66) mc1)) mc3), ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds dtb__67) mc1) mc2) mc3), mc3))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> ((fun dom -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__68, true, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, dom, (((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith mc0) dtb__69) mc2) mc3) mc4), mc4))) (match (mc0 dtb__68) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> dtb__70
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity dtb__68) mc2)) mc4)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dpiBoundNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> (Base_dList.C_Base_dList_dList_Cons (dtb__71, (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames dtb__75)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dSig_disLowerIdent = (fun n -> (match (Base_dList.dtp_unpack n) with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (dtb__77 >= 97) then (dtb__77 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dexprLowerVars = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__79, dtb__80, dtb__81) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__79)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__82, dtb__83, dtb__84) -> ((Base_dList.v_Base_dList_dconcatMap (fun p -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dPair.v_Base_dPair_dsecondOf p)))) dtb__83)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__85, dtb__86, dtb__87) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__85)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__88, dtb__89, dtb__90) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__88)) ((Base_dList.v_Base_dList_dconcatMap (fun a -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dPair.v_Base_dPair_dsecondOf a)))) dtb__89))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__91, dtb__92, dtb__93, dtb__94) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap (fun b -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dPair.v_Base_dPair_dsecondOf b)))) dtb__91)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__92))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__95, dtb__96, dtb__97, dtb__98) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__95)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__96)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__97)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__102)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__103))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__105, dtb__106, dtb__107) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__106)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__108, dtb__109, dtb__110) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__108)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) dtb__109))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__111, dtb__112) -> (if (v_Vuna_dCompiler_dElab_dSig_disLowerIdent dtb__111) then (Base_dList.C_Base_dList_dList_Cons (dtb__111, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let rec v_Vuna_dCompiler_dElab_dSig_ddedupNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (if ((Base_dList.v_Base_dList_dmemName dtb__113) dtb__114) then (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__114) else (Base_dList.C_Base_dList_dList_Cons (dtb__113, (v_Vuna_dCompiler_dElab_dSig_ddedupNames dtb__114))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dlowerVarNames = (fun e -> (v_Vuna_dCompiler_dElab_dSig_ddedupNames (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars e)))

let rec v_Vuna_dCompiler_dElab_dSig_ddropName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (if (dtb__115 = mc0) then ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__116) else (Base_dList.C_Base_dList_dList_Cons (dtb__115, ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__116))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_ddropPiBound = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__117, dtb__118) -> ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound ((v_Vuna_dCompiler_dElab_dSig_ddropName dtb__117) mc0)) dtb__118)
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dfreeNames = (fun inScope ty -> ((v_Vuna_dCompiler_dElab_dSig_dkeepOut inScope) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound (v_Vuna_dCompiler_dElab_dSig_dlowerVarNames ty)) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty))))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig = (fun inScope ty sp -> (((v_Vuna_dCompiler_dElab_dSig_dquantify ((v_Vuna_dCompiler_dElab_dSig_dfreeNames inScope) ty)) ty) sp))

let v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf = (fun name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__119; Base_dPair.f_Base_dPair_dPair_second = dtb__120 } -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__119)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (if ((v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf dtb__121) = (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf mc0)) then (Base_dList.C_Base_dList_dList_Cons (dtb__121, ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__122))) else ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__122))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dqualifiedKey = (fun prefix name -> (String.concat "" [prefix; "\t"; name]))

let v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl = (fun defined -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) ((Base_dList.v_Base_dList_dmap (fun n -> { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf n)) n); Base_dPair.f_Base_dPair_dPair_second = true })) defined)) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__123) mc2) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__124) else (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) ((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey mc0) dtb__123)) mc1) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__124) else (Base_dList.C_Base_dList_dList_Cons (dtb__123, ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__124)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCached = (fun prefix banned preludeBanned ty sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun n -> false)) ty))) ty) ty) sp))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached = (fun prefix banned preludeBanned ctx ty sp -> ((fun combined -> ((fun lower -> ((fun names -> ((fun overrides -> (((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf overrides)) names) combined) ty) sp)) (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides ctx))) ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound lower) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty))))) (v_Vuna_dCompiler_dElab_dSig_ddedupNames ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) ctx)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars ty))))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("#sig", sp)), ((Base_dList.v_Base_dList_dappend ctx) (Base_dList.C_Base_dList_dList_Cons (ty, Base_dList.C_Base_dList_dList_Nil))), sp))))

let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__125) mc0) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__126) else (Base_dList.C_Base_dList_dList_Cons (dtb__125, ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__126))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig = (fun banned ty sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl banned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun n -> false)) ty))) ty) ty) sp))

let v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ("Type", (Base_dList.C_Base_dList_dList_Cons ("->", (Base_dList.C_Base_dList_dList_Cons ("_", Base_dList.C_Base_dList_dList_Nil))))))) ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames))

let v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned = (fun defined -> (Base_dHashMap.v_Base_dHashMap_dofNames ((Base_dList.v_Base_dList_dappend defined) v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames)))

let v_Vuna_dCompiler_dElab_dSig_dbannedForModule = (fun sigName defined -> (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule sigName) defined)))

let rec v_Vuna_dCompiler_dElab_dSig_ddefinedNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__127 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__129, dtb__130, dtb__131, dtb__132) -> (Base_dList.C_Base_dList_dList_Cons (dtb__129, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__128)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__133, dtb__134, dtb__135) -> (Base_dList.C_Base_dList_dList_Cons (dtb__133, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__128)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__136, dtb__137, dtb__138, dtb__139) -> (Base_dList.C_Base_dList_dList_Cons (dtb__136, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__128)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__128)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
