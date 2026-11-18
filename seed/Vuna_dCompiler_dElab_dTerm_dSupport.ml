open Vuna_runtime
# 41 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__4) else false)
  | _ -> true
))

# 49 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel = (fun fuel ctx ec head ty acc -> (if (fuel <= 0) then { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ty; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } } else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> (if dtb__6 then ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel (fuel - 1)) ctx) dtb__11) head) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__9) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__7 }, acc)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ty; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })
  | _ -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ty; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }
)))

# 46 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit = (fun ctx ec head ty acc -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel 64) ctx) ec) head) ty) acc))

# 21 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef = (fun globals ctx ec name sp -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__12) -> (match dtb__12 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__13) -> (if (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__13) then ((fun inst -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (inst))) (((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit ctx) ec) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__13)) Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__13); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } })))
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__14) -> ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef ec) ctx) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) name))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__15) -> (match dtb__15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__16; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__17 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, dtb__16, sp)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) dtb__16) dtb__17); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup name) ctx)))

# 82 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__18, dtb__19) -> dtb__18
  | _ -> "_"
))

# 72 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (match (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__20) with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__22, dtb__23, dtb__24) -> (v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs dtb__21)
  | _ -> ((fun name -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dpatSpan (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__20))) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_WhereNeedsSig (name, name))) name) name)) (v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__20)))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 68 "Vuna/Compiler/Elab/Term/Support.vuna"
let v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs = (fun (mc0 : bool) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if mc0 then (v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs mc1) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))))

# 87 "Vuna/Compiler/Elab/Term/Support.vuna"
let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels dtb__26) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithField (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dDiagField_FieldEffect (("unhandled: " ^ dtb__25)))) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
