open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__4) else false)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel = (fun fuel ctx ec head ty acc -> (if (fuel <= 0) then { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = ec } } else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> (if dtb__6 then ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__11 } -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel (fuel - 1)) ctx) dtb__11) head) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__9) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dList.C_Base_dList_dList_Nil)))) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__10; Base_dPair.f_Base_dPair_dPair_second = dtb__7 }, acc)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)) else { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = ec } })
  | _ -> { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ty; Base_dPair.f_Base_dPair_dPair_second = ec } }
)))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit = (fun ctx ec head ty acc -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel 64) ctx) ec) head) ty) acc))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef = (fun globals ctx ec name sp -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (match dtb__12 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__13) -> (if (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__13) then ((fun inst -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (inst))) (((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit ctx) ec) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__13)) Base_dList.C_Base_dList_dList_Nil)) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__13); Base_dPair.f_Base_dPair_dPair_second = ec } })))
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__14) -> ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef ec) ctx) name) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) name))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (match dtb__15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (name, dtb__16, sp)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) dtb__16) dtb__17); Base_dPair.f_Base_dPair_dPair_second = ec } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup name) ctx)))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__18, dtb__19) -> dtb__18
  | _ -> "_"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match (Base_dPair.v_Base_dPair_dsecondOf dtb__20) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__22, dtb__23, dtb__24) -> (v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs dtb__21)
  | _ -> ((fun name -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (Base_dPair.v_Base_dPair_dfirstOf dtb__20))) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_WhereNeedsSig (name, name))) name) name)) (v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName (Base_dPair.v_Base_dPair_dfirstOf dtb__20)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs = (fun mc0 mc1 -> (if mc0 then (v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs mc1) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))))

let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels dtb__26) ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithField (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dDiagField_FieldEffect (("unhandled: " ^ dtb__25)))) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
