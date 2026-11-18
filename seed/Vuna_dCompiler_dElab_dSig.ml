open Vuna_runtime
# 26 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_darityFun = (fun n res -> (if (n <= 0) then res else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), ((v_Vuna_dCompiler_dElab_dSig_darityFun (n - 1)) res)))))

# 33 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dmaxIntList = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (if (dtb__0 >= (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1)) then dtb__0 else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 37 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__2, dtb__3, dtb__4) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__2)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__5, dtb__6, dtb__7) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) dtb__6))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__8, dtb__9, dtb__10) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__8)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__11, dtb__12, dtb__13, dtb__14) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__11), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__12), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__13), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__15, dtb__16, dtb__17) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__15), ((Base_dData_dList.v_Base_dData_dList_dmap (fun (a : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf a)))) dtb__16))))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__18, dtb__19, dtb__20, dtb__21) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__19), ((Base_dData_dList.v_Base_dData_dList_dmap (fun (b : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf b)))) dtb__18))))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__25), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__26), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__28, dtb__29, dtb__30) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__29)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__31, dtb__32, dtb__33) -> (match dtb__31 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__34, dtb__35) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__34) = mc0) then (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dList.v_Base_dData_dList_dlength dtb__32), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32)))) else (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0) dtb__31), ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity mc0)) dtb__32))))
)
  | _ -> 0
))

# 29 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity = (fun pname methods -> (v_Vuna_dCompiler_dElab_dSig_dmaxIntList ((Base_dData_dList.v_Base_dData_dList_dmap (fun (m : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity pname) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf m)))) methods)))

# 20 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf = (fun pname methods -> ((v_Vuna_dCompiler_dElab_dSig_darityFun ((v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity pname) methods)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))))

# 23 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dclassParamKind = (fun pname methods -> ((v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf pname) methods))

# 65 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo = (fun (mc0 : (bool) -> (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> ((fun domVal -> ((fun v -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo mc0) dtb__40) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (v, mc2)))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__36, (Base_dData_dList.v_Base_dData_dList_dlength mc2), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval mc2) dtb__39))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 62 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf = (fun rigOf ty -> (((v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo rigOf) ty) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 85 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dkeepOut = (fun (mc0 : (string) -> bool) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, dtb__42) -> (if (mc0 dtb__41) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__42) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__41, ((v_Vuna_dCompiler_dElab_dSig_dkeepOut mc0) dtb__42))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dquantify = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__43, true, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "Type"), mc2)), (((v_Vuna_dCompiler_dElab_dSig_dquantify dtb__44) mc1) mc2), mc2))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 127 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverridesOne = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__45, dtb__46, dtb__47) -> (match dtb__45 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__48, dtb__49) -> (match dtb__46 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__50, dtb__51) -> (match dtb__51 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (match dtb__53 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (match dtb__55 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__48) = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName) then ((fun nPart -> ((fun rPart -> ((Base_dData_dList.v_Base_dData_dList_dappend nPart) rPart)) (match dtb__54 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__56, dtb__57) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__56); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowFamilyName), dtb__57)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))) (match dtb__50 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__58, dtb__59) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__58); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName), dtb__59)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 123 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverridesOne dtb__60)) (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides dtb__61))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 144 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, dtb__63) -> (match dtb__62 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__64; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__65 } -> (if (dtb__64 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__65)) else ((v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf dtb__63) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr = (fun k sp -> (if (k <= 0) then (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "Type"), sp)) else (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi ("_", false, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "Type"), sp)), ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr (k - 1)) sp), sp))))

# 98 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc3 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__66, true, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity dtb__66) mc1)) mc3), ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds dtb__67) mc1) mc2) mc3), mc3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 111 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith = (fun (mc0 : (string) -> Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc3 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> ((fun dom -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__68, true, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, dom, (((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith mc0) dtb__69) mc2) mc3) mc4), mc4))) (match (mc0 dtb__68) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__70) -> dtb__70
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr ((v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity dtb__68) mc2)) mc4)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dpiBoundNames = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames dtb__75)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 177 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_disLowerIdent = (fun n -> (match (Base_dData_dList.dtp_unpack n) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> (if (dtb__77 >= 97) then (dtb__77 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 162 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dexprLowerVars = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__79, dtb__80, dtb__81) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__79)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__82, dtb__83, dtb__84) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) dtb__83)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__85, dtb__86, dtb__87) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__85)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__88, dtb__89, dtb__90) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__88)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (a : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dData_dPair.v_Base_dData_dPair_dsecondOf a)))) dtb__89))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__91, dtb__92, dtb__93, dtb__94) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (b : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars (Base_dData_dPair.v_Base_dData_dPair_dsecondOf b)))) dtb__91)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__92))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__95, dtb__96, dtb__97, dtb__98) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__95)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__96)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__97)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__102)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__103))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__105, dtb__106, dtb__107) -> (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__106)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__108, dtb__109, dtb__110) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars dtb__108)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) dtb__109))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__111, dtb__112) -> (if (v_Vuna_dCompiler_dElab_dSig_disLowerIdent (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__111)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__111), Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 159 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dlowerVarNames = (fun e -> (Base_dData_dList.v_Base_dData_dList_dnubNames (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars e)))

# 187 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_ddropName = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, dtb__114) -> (if (dtb__113 = mc0) then ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__114) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__113, ((v_Vuna_dCompiler_dElab_dSig_ddropName mc0) dtb__114))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_ddropPiBound = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__115, dtb__116) -> ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound ((v_Vuna_dCompiler_dElab_dSig_ddropName dtb__115) mc0)) dtb__116)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dfreeNames = (fun inScope ty -> ((v_Vuna_dCompiler_dElab_dSig_dkeepOut inScope) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound (v_Vuna_dCompiler_dElab_dSig_dlowerVarNames ty)) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty))))

# 79 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig = (fun inScope ty sp -> (((v_Vuna_dCompiler_dElab_dSig_dquantify ((v_Vuna_dCompiler_dElab_dSig_dfreeNames inScope) ty)) ty) sp))

# 210 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dkindDomains = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__117, dtb__118, dtb__119) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__120, dtb__121) -> (match dtb__120 with
  | Vuna_dCompiler_dFrontend_dRast_dName.C_Vuna_dCompiler_dFrontend_dRast_dName_dRName_RIntrinsic (dtb__122) -> (if (dtb__122 = "->") then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, dtb__124) -> (match dtb__124 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__123, (v_Vuna_dCompiler_dElab_dSig_dkindDomains dtb__125)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) dtb__118) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) dtb__117)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__130, (v_Vuna_dCompiler_dElab_dSig_dkindDomains dtb__131)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 200 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_ddataParamKindTbl = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__133, dtb__134) -> (match dtb__133 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DData (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__135; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dSig_dkindDomains dtb__137) }, (v_Vuna_dCompiler_dElab_dSig_ddataParamKindTbl dtb__134)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_ddataParamKindTbl dtb__134)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dlookupParamKinds = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (match dtb__144 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__146; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 } -> (if (dtb__146 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__147)) else ((v_Vuna_dCompiler_dElab_dSig_dlookupParamKinds dtb__145) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dzipArgKindsGo = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__148, dtb__149) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__150, dtb__151) -> (match dtb__150 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__152, dtb__153) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__152); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 }, ((v_Vuna_dCompiler_dElab_dSig_dzipArgKindsGo dtb__149) dtb__151)))
  | _ -> ((v_Vuna_dCompiler_dElab_dSig_dzipArgKindsGo dtb__149) dtb__151)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dzipArgKinds = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__154) -> ((v_Vuna_dCompiler_dElab_dSig_dzipArgKindsGo dtb__154) mc1)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dargParamKinds = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__155, dtb__156, dtb__157) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__155)) ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__156))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__158, dtb__159, dtb__160) -> ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__158)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__161, dtb__162, dtb__163) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (p : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))) dtb__162)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__164, dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__164)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__167, dtb__168, dtb__169, dtb__170) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__167)) ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__168)) ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__169)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__171, dtb__172, dtb__173) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__171)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (a : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf a)))) dtb__172))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__174, dtb__175, dtb__176, dtb__177) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (b : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf b)))) dtb__174)) ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__175))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__181)) ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__182))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__184, dtb__185, dtb__186) -> ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__185)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__187, dtb__188, dtb__189) -> (match dtb__187 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__190, dtb__191) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dSig_dzipArgKinds ((v_Vuna_dCompiler_dElab_dSig_dlookupParamKinds mc0) (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__190))) dtb__188)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0)) dtb__188))
  | _ -> ((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0) dtb__187)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dElab_dSig_dargParamKinds mc0)) dtb__188))
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 279 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf = (fun name -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__192; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__193 } -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__192)
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, dtb__195) -> (if ((v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf dtb__194) = (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf mc0)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__195))) else ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule mc0) dtb__195))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dqualifiedKey = (fun prefix name -> (String.concat "" [prefix; "\t"; name]))

# 293 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl = (fun defined -> (((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsertAll Base_dData_dString.v_Hashable_uString) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey (v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf n)) n); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true })) defined)) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)))

# 346 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dparamKindOf = (fun (mc0 : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (match dtb__196 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__198; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__199 } -> (if (dtb__198 = mc1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__199)) else ((v_Vuna_dCompiler_dElab_dSig_dparamKindOf dtb__197) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 340 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dkindOverrideOf = (fun memberOverrides argOverrides n -> (match ((v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf memberOverrides) n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__200) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__200))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dSig_dparamKindOf argOverrides) n)
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified = (fun (mc0 : string) (mc1 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc2 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc3 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, dtb__202) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__201) mc2) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__202) else (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) ((v_Vuna_dCompiler_dElab_dSig_dqualifiedKey mc0) dtb__201)) mc1) then ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__202) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified mc0) mc1) mc2) dtb__202)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 303 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCached = (fun prefix banned preludeBanned ty sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 314 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached = (fun prefix banned preludeBanned ctx ty sp -> ((fun combined -> ((fun lower -> ((fun names -> ((fun overrides -> (((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf overrides)) names) combined) ty) sp)) (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides ctx))) ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound lower) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty))))) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) ctx)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars ty))))) (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "#sig"), sp)), ((Base_dData_dList.v_Base_dData_dList_dappend ctx) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (ty, Base_dData_dList.C_Base_dData_dList_dList_Nil))), sp))))

# 329 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCachedKinds = (fun prefix banned preludeBanned paramKinds ctx ty sp -> ((fun combined -> ((fun lower -> ((fun names -> ((fun memberOverrides -> ((fun argOverrides -> (((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith ((v_Vuna_dCompiler_dElab_dSig_dkindOverrideOf memberOverrides) argOverrides)) names) combined) ty) sp)) ((v_Vuna_dCompiler_dElab_dSig_dargParamKinds paramKinds) combined))) (v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides ctx))) ((((v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified prefix) banned) preludeBanned) ((v_Vuna_dCompiler_dElab_dSig_ddropPiBound lower) (v_Vuna_dCompiler_dElab_dSig_dpiBoundNames ty))))) (Base_dData_dList.v_Base_dData_dList_dnubNames ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dSig_dexprLowerVars) ctx)) (v_Vuna_dCompiler_dElab_dSig_dexprLowerVars ty))))) (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "#sig"), sp)), ((Base_dData_dList.v_Base_dData_dList_dappend ctx) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (ty, Base_dData_dList.C_Base_dData_dList_dList_Nil))), sp))))

# 360 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl = (fun (mc0 : (string, bool) Base_dContainer_dHashMap.t_Base_dContainer_dHashMap_dHashMap) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__203) mc0) then ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__204) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl mc0) dtb__204))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig = (fun banned ty sp -> ((((v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds ((v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl banned) ((v_Vuna_dCompiler_dElab_dSig_dfreeNames (fun (n : string) -> false)) ty))) ty) ty) sp))

# 365 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Type", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("->", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("_", Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) ((Base_dData_dList.v_Base_dData_dList_dappend Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicNames) Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeValueNames))

# 261 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned = (fun defined -> (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames ((Base_dData_dList.v_Base_dData_dList_dappend defined) v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames)))

# 267 "Vuna/Compiler/Elab/Sig.vuna"
let v_Vuna_dCompiler_dElab_dSig_dbannedForModule = (fun sigName defined -> (v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned ((v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule sigName) defined)))

# 369 "Vuna/Compiler/Elab/Sig.vuna"
let rec v_Vuna_dCompiler_dElab_dSig_ddefinedNames = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dDecl Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DFun (dtb__207, dtb__208, dtb__209, dtb__210) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__207, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__206)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DAxiom (dtb__211, dtb__212, dtb__213) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__211, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__206)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dDecl_DExtern (dtb__214, dtb__215, dtb__216, dtb__217) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__214, (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__206)))
  | _ -> (v_Vuna_dCompiler_dElab_dSig_ddefinedNames dtb__206)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
