open Vuna_runtime
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase = (fun alts -> (if (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then true else (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dhasDupNames (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_daltNames alts))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (acc, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm = (fun n -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo n) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor, Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult = (fun sp n -> (if (n < 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNatLiteralOutOfRange) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm n)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("natToInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> (match dtb__2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (dtb__1 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__3) -> (match dtb__3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__4, dtb__5) -> (match dtb__5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (dtb__4 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm = (fun ec expected actual term -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) actual) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm term))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands = (fun ec aTy bTy aTerm bTerm -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm), (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, bTy)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm), bTerm)))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (aTy, v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (aTerm, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm))))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName = (fun name -> (if (if (if (name = "+") then true else (name = "-")) then true else (name = "*")) then true else (name = "/")))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName = (fun mc0 -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name)), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__6, dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__8, dtb__9, dtb__10) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__8)) (fun value2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (value2, dtb__9, dtb__10))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__11, dtb__12) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt mc0)) dtb__11)) (fun stmts2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (stmts2, dtb__12))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__13, dtb__14, dtb__15) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__13)) (fun base2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun fv -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf fv), v2)))))))) dtb__14)) (fun fields2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (base2, fields2, dtb__15))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__16, dtb__17, dtb__18) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun fv -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf fv), v2)))))))) dtb__17)) (fun fields2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__16, fields2, dtb__18))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__19, dtb__20, dtb__21) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__19)) (fun base2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (base2, dtb__20, dtb__21))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__22, dtb__23, dtb__24, dtb__25) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__22)) (fun c2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__23)) (fun t2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__24)) (fun el2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, el2, dtb__25))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__26, dtb__27, dtb__28) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__26)) (fun scrut2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__27)) (fun alts2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__28))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__29, dtb__30, dtb__31, dtb__32) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__29)) (fun binds2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__30)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (binds2, body2, dtb__31, dtb__32))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__36)) (fun dom2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__37)) (fun cod2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__33, dtb__34, dtb__35, dom2, cod2, dtb__38))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__39, dtb__40, dtb__41) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__39)) (fun fn2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0)) dtb__40)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__41))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__42, dtb__43, dtb__44) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__43)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__42, b2, dtb__44))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__45, dtb__46) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__45, dtb__46))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__47, dtb__48) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__47, dtb__48))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__49, dtb__50) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__49, dtb__50))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__51, dtb__52) -> ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable mc0)) dtb__51)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unreordered infix/paren in elaboration"))
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__54) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__54)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, v2))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__55, dtb__56) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__55)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (v2, dtb__56))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__57, dtb__58, dtb__59) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__58)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__57, v2, dtb__59))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__60) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__61, dtb__62, dtb__63) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType dtb__61) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, ((Base_dList.v_Base_dList_dappend dtb__65) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__62, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Base_dList.C_Base_dList_dList_Base_dList_dNil))
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs dtb__70)
  | _ -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType mc0))
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis dtb__75)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (match dtb__76 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__78, dtb__79) -> (if (dtb__79 = ((mc1 - 1) - mc0)) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs (mc0 + 1)) mc1) dtb__77) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine = (fun fam ctor -> ((fun k -> ((fun args -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> (if (dtb__80 = fam) then (if ((Base_dList.v_Base_dList_dlength args) > 0) then (if ((Base_dList.v_Base_dList_dlength args) < k) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.v_Base_dPair_dsecondOf dtb__82), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo (mc0 - 1)) dtb__83))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs = (fun n bs -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo n) bs))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__84, dtb__85) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) mc1) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> (if dtb__89 then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__92) dtb__84)) dtb__85) dtb__87) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc4) dtb__84), dtb__86)), mc5))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc5), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc1, mc0))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs = (fun ec ctx ctor expected -> ((fun fam -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine fam) ctor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__93) -> (match dtb__93 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__94, dtb__95) -> ((fun arity -> (if (dtb__94 = fam) then (if ((Base_dList.v_Base_dList_dlength dtb__95) = arity) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) dtb__95) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dList.C_Base_dList_dList_Base_dList_dNil) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel globals ctx ec dd idxs scrutVal expected cname args psp body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 psp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownConstructorInCase (cname, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) cname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__96)) args)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> (match dtb__98 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__100) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 psp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBranchTooManyArgs (cname))) cname) else ((Base_dResult.v_Base_dResult_dandThen ((((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__97)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__97) dtb__96)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Base_dList_dNil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs))) (fun refsIdx -> (match (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__97) refsIdx) with
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchIndex)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchEmptyCtx)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__97)) refsIdx) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__97) dtb__96)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (cname, dtb__99, dtb__101)), dtb__102))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__97) refs2))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__103 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (match dtb__105 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__107, dtb__108, dtb__109) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__107) dtb__108) dtb__109) dtb__106)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, dtb__111) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__111) mc4) mc5) mc6) mc7) mc8) dtb__104) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__110, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__112, dtb__113) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__104) mc10) dtb__106) dtb__112) dtb__113)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__114) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__104) mc10) dtb__106) "_") dtb__114)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__105)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc10), mc3)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel globals ctx ec scrutTy dd idxs expected rest acc body pname psp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCatchAllNotLast) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> ((fun binds -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", binds, dtb__115)), acc))), dtb__116))))) (if (pname = "_") then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (pname, ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) scrutTy))), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))))) (if (pname = "_") then ctx else (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat alts)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase alts) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel (fuel - 1)) globals) ctx) ec) scrut) alts) expected) sp) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> (match dtb__118 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel (fuel - 1)) globals) ctx) dtb__120) dtb__117) dtb__119) alts) expected) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun name -> ((fun clauses -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (name, sp)), scrut)), Base_dList.C_Base_dList_dList_Base_dList_dNil)), bodyExpr, false, sp))) expected)))) ((Base_dList.v_Base_dList_dmap (fun alt -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.v_Base_dPair_dfirstOf alt), Base_dList.C_Base_dList_dList_Base_dList_dNil)), (Base_dPair.v_Base_dPair_dsecondOf alt))))) alts))) ("nd_scrut" ^ (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel globals ctx ec scrutTerm scrutTy alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__121) -> (match dtb__121 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__122, dtb__123) -> (if (if (dtb__122 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then ((Base_dList.v_Base_dList_dlength dtb__123) = 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__122 = "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__122 = "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__122) dtb__123) alts) expected) sp))))
  | _ -> ((fun _u -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("caseFam: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy)))))
)
  | _ -> ((fun _u -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("caseFam: " ^ (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy)))))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel globals ctx ec scrutTerm alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (match dtb__125 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (match dtb__126 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__124, dtb__128)), dtb__127))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> (match dtb__130 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__131, dtb__132) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__124, dtb__129)), dtb__132))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel = (fun fuel globals ctx ec alts target expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__133 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__135, dtb__136) -> (match dtb__135 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__137, dtb__138, dtb__139) -> (if (dtb__137 = mc5) then ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__136) mc6)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mc8, dtb__141))))))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__134) mc5) mc6) mc7) mc8))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__142, dtb__143) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__136) mc6)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__134) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__146) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__136) mc6)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__134) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__147)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__135)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match mc8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__149, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc3))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc7) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotExhaustive (mc5))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel globals ctx ec scrutTerm tyName alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (match dtb__151 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (if dtb__152 then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__153)))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__154 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (match dtb__156 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__158, dtb__159) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__158))) dtb__157) dtb__155) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__160, dtb__161) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__160))) dtb__157) dtb__155) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__162, dtb__163) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__162) dtb__157) mc7) mc8)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__165) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__165))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__166) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__157) mc7)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__167, dtb__168) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__167, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__168))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__156)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)))), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (false, mc3)))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel globals ctx ec scrutTerm tyName litTerm body rest expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__169, dtb__170) -> ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) dtb__170) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__173, dtb__174) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__169, dtb__171)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__173, dtb__174))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel globals ctx ec scrutTerm tyName name body expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> ((fun rig -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__175)), scrutTerm, rig)), dtb__176))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, Base_dList.C_Base_dList_dList_Base_dList_dNil))))) ctx))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel globals ctx ec scrutTerm scrutTy fam idxs alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__177) -> ((Base_dResult.v_Base_dResult_dandThen (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__177) idxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) Base_dList.C_Base_dList_dList_Base_dList_dNil)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> (((((((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__179) ctx) dtb__177) idxs) alts) expected) sp) scrutTerm) dtb__178)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel globals ctx ec scrut alts sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun pmeta -> (match pmeta with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> ((fun metaTy -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) dtb__181) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (metaTy, dtb__183))))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__180))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel globals ctx ec c sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) c) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil))))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__184) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__184))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__185) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (match dtb__187 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__188) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__189)))) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["if condition must be "; Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName; " (got "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__188); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__190, dtb__191) -> (if (dtb__190 = "Type") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))), ec)))))) else (if (dtb__190 = "_") then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__191) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dHoleNoExpectedType) else (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__190) dtb__191)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__192, dtb__193) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__192)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Int", Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__194, dtb__195) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__194)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("String", Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) dtb__196) dtb__197) dtb__198) dtb__199) dtb__200) dtb__201)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__202, dtb__203, dtb__204) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__202) dtb__203) dtb__204)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__205, dtb__206, dtb__207) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__207) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaNoSignature)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__208, dtb__209, dtb__210, dtb__211) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__208) dtb__211)) (fun pc -> (match pc with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__213) dtb__209)) (fun pt -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215) -> (match dtb__215 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__216, dtb__217) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__217) dtb__210)) (fun pe -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__218, dtb__219) -> (match dtb__219 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__220, dtb__221) -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__221) dtb__216) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__221) dtb__220) else false) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__212, dtb__214, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__218))), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__216, dtb__221)))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__221) dtb__216) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__221) dtb__220) else false) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__212, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__214), dtb__218)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__221)))))) else ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__221) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__216) dtb__220)) (fun ec4 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__212, dtb__214, dtb__218)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__216, ec4))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pe)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__222, dtb__223, dtb__224, dtb__225) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) ec) dtb__222) dtb__223) dtb__224) dtb__225)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__226, dtb__227) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__226, dtb__227)))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__228, dtb__229, dtb__230) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__228) dtb__229) dtb__230)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__231, dtb__232, dtb__233) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__233) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordFieldAccessUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__234, dtb__235, dtb__236) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__236) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordsUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__237, dtb__238, dtb__239) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__239) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordUpdateUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__240, dtb__241) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__241) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDoUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__242, dtb__243, dtb__244) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__242) dtb__243) dtb__244)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unreordered infix/paren in elaboration"))
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel globals ctx ec value ty sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, dtb__246) -> (match dtb__246 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, dtb__248) -> ((fun tyVal -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__248) value) tyVal)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, dtb__250) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (tyVal, dtb__250))))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__245))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel globals ctx ec name implicit qty dom cod sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__252) -> (match dtb__252 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__253, dtb__254) -> ((fun domVal -> ((fun isTypeDom -> ((fun isLinDom -> ((fun lvl -> ((fun ctx2 -> ((fun badQty -> ((fun badLinQty -> (if badQty then (if implicit then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dMultiplicityImplicit (name))) name) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dMultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLinearTypeNeedsOne (name))) name) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx2) dtb__254) cod)) (fun pc -> ((fun nd_uscrut28 -> (match nd_uscrut28 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__255, dtb__256) -> (match dtb__256 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__257, dtb__258) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, implicit, (if isLinDom then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1 else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfQty implicit) isTypeDom) qty)), dtb__251, dtb__255)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__253) dtb__257))), dtb__258))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__259) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero dtb__259) then isLinDom else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__260) -> (if implicit then true else isTypeDom)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__251) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) domVal))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeDomain domVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel globals ctx ec fn args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__261, dtb__262) -> (if (dtb__261 = "->") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__263, dtb__264) -> (match dtb__264 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__265, dtb__266) -> (match dtb__266 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) dtb__263) dtb__265) sp)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)) args) else (if (dtb__261 = "Type") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__267, dtb__268) -> (match dtb__267 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__269, dtb__270) -> (match dtb__268 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (dtb__269 < 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__270) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUniverseLevelNonNegative) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__269))), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__269)))), ec)))))))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__262) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__262) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__262) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)) args) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__271, dtb__272) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__271) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__273) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__271) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__274) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__274))) args) sp)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__275, dtb__276) -> (match dtb__276 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__277, dtb__278) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__278)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__271))) dtb__275), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__277, dtb__278))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__271) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__279) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__271) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__280) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__280))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__279)) args) sp)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__281, dtb__282) -> (match dtb__282 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, dtb__284) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__284)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__271))) dtb__281), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, dtb__284))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__271) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__285) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__285))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__272) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__271))) dtb__271)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
)))
  | _ -> (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__286, dtb__287) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__286) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__288) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__286) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__289) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__289))) args) sp)) (fun pa -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__290, dtb__291) -> (match dtb__291 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, dtb__293) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__293)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__286))) dtb__290), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, dtb__293))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__286) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__294) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__286) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__295) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__295))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__294)) args) sp)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__296, dtb__297) -> (match dtb__297 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__299)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__286))) dtb__296), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__298, dtb__299))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__286) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__300) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__300))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__287) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__286))) dtb__286)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
)
)) fn)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel = (fun fuel globals ctx ec fn args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__301, dtb__302) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__301) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__303) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__303))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel globals ctx ec fn args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, dtb__305) -> (match dtb__305 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__306, dtb__307) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__307) dtb__306) args) sp)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__308, dtb__309) -> (match dtb__309 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__310, dtb__311) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__311)) dtb__304) dtb__308), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__310, dtb__311))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pf)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel = (fun fuel globals ctx ec ty args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo 64) globals) ctx) ec) ty) args) sp)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo = (fun fuel globals ctx ec ty args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__312, dtb__313, dtb__314, dtb__315, dtb__316) -> (if dtb__313 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__315) then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__315) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__315) dtb__316) args) sp) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__315) args) sp)) (fun ec0 -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__317) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__315)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__315) dtb__316) args) sp) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__315)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__315) dtb__316) args) sp) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__317))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__318) -> (match dtb__318 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__319, dtb__320) -> ((fun ty2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__320) ty2) args) sp)) (fun q -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__321, dtb__322) -> (match dtb__322 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__323, dtb__324) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__319, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), dtb__321)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__323, dtb__324))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__316) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__319)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__315)) sp))))) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__315) then (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__325, dtb__326) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__326) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__316) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__325))) args) sp)) (fun p -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__327, dtb__328) -> (match dtb__328 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__329, dtb__330) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__325, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__327)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__329, dtb__330))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (match args with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__331, dtb__332) -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec) sp) dtb__312) dtb__314) dtb__315)) (fun argRig -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__331) dtb__315)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__333, dtb__334) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__334) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__316) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__333))) dtb__332) sp)) (fun q -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__335, dtb__336) -> (match dtb__336 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__337, dtb__338) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__333, argRig)), dtb__335)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__337, dtb__338))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__339, dtb__340) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__339)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel globals ctx ec dom clo args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__341, dtb__342) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__342) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__342) dom))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__341))) args) sp)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__343, dtb__344) -> (match dtb__344 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__345, dtb__346) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__341, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), dtb__343)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__345, dtb__346))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel globals ec ctx dom args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__347) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__348) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__349, dtb__350) -> (match dtb__350 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__347) dtb__348) args) sp)) (fun ecProbe -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__349) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ecProbe)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__351) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__349) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__351) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__352) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__352))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__353) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__347) dtb__348) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__347) dtb__348) args) sp)
)) dtb__347)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel globals ec ctx argTy argKind args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match args with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__354, dtb__355) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__356) -> (match dtb__356 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__357, dtb__358) -> (match dtb__358 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__359, dtb__360) -> ((fun forced -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__360) ctx) argTy) argKind) dtb__355) sp) else (if (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__360) ctx) forced) argKind) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__360) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__361) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__361))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__362) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__360) ctx) argTy) argKind) dtb__355) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__360) ctx) argTy) argKind) dtb__355) sp)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__360) dtb__359))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__363) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__354))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName name) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__364, dtb__365) -> (match dtb__365 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__366, dtb__367) -> (match dtb__367 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__364) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__369) dtb__366) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__371) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__368) dtb__370), dtb__371))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__364) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__373) dtb__366) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__374, dtb__375) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__372) dtb__374), dtb__375))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__376, dtb__377) -> (match dtb__377 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__378, dtb__379) -> (match dtb__379 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__376)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__380, dtb__381) -> (match dtb__381 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__383) dtb__378)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__384, dtb__385) -> (match dtb__385 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__386, dtb__387) -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__387) dtb__382) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__387) dtb__386) else false) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__380) dtb__384), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__387)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__387) dtb__382) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__387) dtb__386) else false) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__380) dtb__384), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__387)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__387) dtb__382) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__387) dtb__386) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__378) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__388) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__378)) dtb__388)) (fun bNat -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__380) bNat), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__387))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__380)) dtb__384), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__387))))))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__387) dtb__382) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__387) dtb__386) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__376) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__389) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__376)) dtb__389)) (fun aNat -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) aNat) dtb__384), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__387))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__380) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__384)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__387))))))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__390, dtb__391, dtb__392) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dtb__391)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__393, dtb__394) -> (match dtb__394 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__395, dtb__396) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__396) dtb__390) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__393))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__397, dtb__398) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__397, dtb__398)))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__399, dtb__400, dtb__401, dtb__402) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel (fuel - 1)) globals) ctx) ec) dtb__399) dtb__400) dtb__401) expected) dtb__402)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__403, dtb__404, dtb__405) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) ec) dtb__403) dtb__404) expected) dtb__405)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__406, dtb__407, dtb__408, dtb__409) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__410, dtb__411, dtb__412, dtb__413, dtb__414, dtb__415) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__416, dtb__417, dtb__418) -> (match dtb__416 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__419, dtb__420) -> (if (dtb__419 = "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__419 = "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__416) dtb__417) expected) dtb__418)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__416) dtb__417) expected) dtb__418)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__421, dtb__422, dtb__423) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (fuel - 1)) globals) ctx) ec) dtb__421) dtb__422) expected) dtb__423)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__424, dtb__425) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__426, dtb__427) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__428) -> (match dtb__428 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__429, dtb__430) -> (match dtb__430 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (dtb__429 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult dtb__427) dtb__426)) (fun t -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (t, ec)))))) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__431, dtb__432) -> (if (dtb__431 = "_") then ((fun pmeta -> (match pmeta with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__433, dtb__434) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__433, dtb__434))))
  | _ -> failwith "DT: impossible branch"
)) ((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta ctx) ec) dtb__432) expected)) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__431, dtb__432))) Base_dList.C_Base_dList_dList_Base_dList_dNil) expected) dtb__432))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) expr)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel globals ctx ec binds body rec_u expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__435, dtb__436) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__435) dtb__436) mc5) mc6) mc7) mc8))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel globals ctx ec bind rest body rec_u expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (Base_dPair.v_Base_dPair_dfirstOf bind) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__437, dtb__438) -> ((fun value -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__439, dtb__440) -> (match dtb__440 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__441, dtb__442) -> ((fun rig -> ((fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx2) dtb__442) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__443, dtb__444) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__437, rig, dtb__443)), dtb__439, rig)), dtb__444))))
  | _ -> failwith "DT: impossible branch"
)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__437) dtb__441) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__441))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bind))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__445) -> ((fun value -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__446, dtb__447) -> (match dtb__447 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__448, dtb__449) -> ((fun rig -> ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) dtb__449) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__450, dtb__451) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__450))), dtb__446, rig)), dtb__451))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__448))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bind))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((Base_dPair.v_Base_dPair_dsecondOf bind), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf bind), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (rest, body, rec_u, sp)))), Base_dList.C_Base_dList_dList_Base_dList_dNil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (Base_dPair.v_Base_dPair_dfirstOf bind))))) expected)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__452, dtb__453) -> (match dtb__452 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__454, dtb__455) -> (match dtb__454 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__456, dtb__457) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__456) dtb__455) dtb__453) body) rec_u) sp)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__458) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__455) dtb__453) body) rec_u) sp)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__455, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__454, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__453, body, rec_u, sp)))), Base_dList.C_Base_dList_dList_Base_dList_dNil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__454))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel globals ctx ec name value rest body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__459, dtb__460) -> (match dtb__460 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__461, dtb__462) -> ((fun rig -> ((fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx2) dtb__462) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__463, dtb__464) -> (match dtb__464 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__465, dtb__466) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__463)), dtb__459, rig)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__465, dtb__466))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__461) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__461))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel globals ctx ec value rest body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__467, dtb__468) -> (match dtb__468 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__469, dtb__470) -> ((fun rig -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) dtb__470) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__471, dtb__472) -> (match dtb__472 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__473, dtb__474) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__471))), dtb__467, rig)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__473, dtb__474))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__469))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__475) -> (match dtb__475 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__476, dtb__477) -> (match dtb__477 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__478, dtb__479) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__479) expected) dtb__478) dtb__476) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__480) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__480, ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__479)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__479) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__478) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__481) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)); ": "; dtb__481])))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__482) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__476, ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__482)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__483) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__483))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__484, dtb__485) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__486, dtb__487, dtb__488, dtb__489, dtb__490) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain mc3) mc7) dtb__484) dtb__488) dtb__489)) (fun lamRig -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__485) mc5) expected2) mc7)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__491, dtb__492) -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear mc3) mc2) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear mc3) ctx2) dtb__491) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc7) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLinearCaptureEscapes (dtb__484))) dtb__484) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__484, lamRig, dtb__491)), dtb__492))))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__484, lamRig, dtb__491)), dtb__492)))))
  | _ -> failwith "DT: impossible branch"
)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__490) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__484) dtb__489) mc2))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__486) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaTooManyParams)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__493, dtb__494, dtb__495) -> (match dtb__493 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__496, dtb__497) -> (if (if (dtb__496 = "->") then true else (dtb__496 = "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__496) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__498) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__496) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__496) dtb__494) dtb__497) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__499) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__500) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__500))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__501, dtb__502) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__501) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__503) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__501) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__504) -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__504))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__505) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__501)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__505, ec))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)) expr)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun p -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__506, dtb__507) -> (match dtb__507 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__508, dtb__509) -> ((fun forced -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__510) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__506, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__510, dtb__509))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedType (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__508)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__508))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__509) dtb__508))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__511, dtb__512) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__511) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__513) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__511) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__511) args) expected) dtb__512) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__514) -> (match dtb__514 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__515) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__516) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel (fuel - 1)) globals) ctx) ec) dtb__511) args) expected) dtb__512)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) dtb__511)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__517, dtb__518) -> (match dtb__518 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__519, dtb__520) -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__520) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__519)))) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__517, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__521) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__521)) args) sp)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__522, dtb__523) -> (match dtb__523 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__524, dtb__525) -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__525) dtb__524)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__526) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__522), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__526, dtb__525))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disEqMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__527, dtb__528) -> (match dtb__528 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__529, dtb__530) -> (match dtb__530 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__527)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__531, dtb__532) -> (match dtb__532 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__533, dtb__534) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__534) dtb__529)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__535, dtb__536) -> (match dtb__536 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__537, dtb__538) -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__538) dtb__533) dtb__537) dtb__531) dtb__535) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__539) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__539))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__539))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__539))) dtb__538)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__538) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__533) dtb__537)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__531) dtb__535) sp) dtb__533) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disCmpMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__540, dtb__541) -> (match dtb__541 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__542, dtb__543) -> (match dtb__543 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__540)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__544, dtb__545) -> (match dtb__545 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__546, dtb__547) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__547) dtb__542)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__548, dtb__549) -> (match dtb__549 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__550, dtb__551) -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__551) dtb__546) dtb__550) dtb__544) dtb__548) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__552) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__552))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__552))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__552))) dtb__551)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__551) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__546) dtb__550)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__544) dtb__548) sp) dtb__546) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__553) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__553))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__554) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__554))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r3 -> (match r3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__555) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__555))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (if (name = "&&") then true else (name = "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__556, dtb__557) -> (match dtb__557 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__558, dtb__559) -> (match dtb__559 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__556) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__560, dtb__561) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__561) dtb__558) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__562, dtb__563) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__560) dtb__562), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__563))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)) args) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__564, dtb__565) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel (fuel - 1)) globals) ctx) ec) dtb__564) args) expected) sp)) (fun arith -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__564) args) sp)) (fun mspec -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__566) -> (match dtb__566 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__567, dtb__568) -> (match dtb__568 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__569, dtb__570) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__570) expected) dtb__569) dtb__567) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__571) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__571, dtb__570))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__570) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__569)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__567, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mspec)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__572) -> (match dtb__572 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__573, dtb__574) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__573, dtb__574))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) arith)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__575) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__575))) args) sp)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__576, dtb__577) -> (match dtb__577 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__578, dtb__579) -> ((fun ctorTerm -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__579) expected) dtb__578) ctorTerm) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__580) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__580, dtb__579))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__579) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__578) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__581) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__581)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__576), dtb__581))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__582) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (name, dtb__582))) name) dtb__582)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__579)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__576))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__583) -> (match dtb__583 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__584, dtb__585) -> (match dtb__585 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__586, dtb__587) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__587) dtb__586) args) sp)) (fun pa -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__588, dtb__589) -> (match dtb__589 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__590, dtb__591) -> ((fun allArgs -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__591) expected) dtb__590) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__591)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) allArgs)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__592) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__592, dtb__591))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__591) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__590) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__593) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__593)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) allArgs), dtb__593))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__594) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (name, dtb__594))) name) dtb__594)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend dtb__584) dtb__588))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs ec) ctx) dtb__575) expected))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind = (fun globals ctx ec expr expected sp -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__595) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel 256) globals) ctx) ec) expr)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p))))))))
  | _ -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__596, dtb__597, dtb__598) -> (match dtb__596 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__599, dtb__600) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__599) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__599) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__599))) dtb__599)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__601) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel 256) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__601)) dtb__597) sp)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__602, dtb__603) -> (match dtb__603 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__604, dtb__605) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__605) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__604) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__606) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__599))) dtb__602), dtb__606))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__607) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatch ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected), (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__604)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__604))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__608, dtb__609) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__608) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__608) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__608))) dtb__608)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__610) -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__610))) (fun ec1 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__608)), ec1))))))
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)
)) expr)
))
