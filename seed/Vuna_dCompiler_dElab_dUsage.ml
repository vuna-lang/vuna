open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel = (fun fuel v -> (if (fuel <= 0) then false else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__0) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel (fuel - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__1, 0, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dUsage_disTypeForming = (fun v -> ((v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel 128) v))

let rec v_Vuna_dCompiler_dElab_dUsage_duZeroOf = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0, (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (n - 1))))))

let rec v_Vuna_dCompiler_dElab_dUsage_duVarAtGo = (fun n i -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((if (i = 0) then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0), ((v_Vuna_dCompiler_dElab_dUsage_duVarAtGo (n - 1)) (i - 1))))))

let v_Vuna_dCompiler_dElab_dUsage_duVarAt = (fun depth i -> (if (if (i < 0) then true else (i >= depth)) then (v_Vuna_dCompiler_dElab_dUsage_duZeroOf depth) else ((v_Vuna_dCompiler_dElab_dUsage_duVarAtGo depth) i)))

let rec v_Vuna_dCompiler_dElab_dUsage_duAdd = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigAdd dtb__6) dtb__8), ((v_Vuna_dCompiler_dElab_dUsage_duAdd dtb__7) dtb__9)))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> mc1
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_duScale = (fun rig us -> ((Base_dList.v_Base_dList_dmap (fun u -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigScale rig) u))) us))

let rec v_Vuna_dCompiler_dElab_dUsage_duJoin = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigJoin dtb__10) dtb__12), ((v_Vuna_dCompiler_dElab_dUsage_duJoin dtb__11) dtb__13)))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> mc1
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_duDrop = (fun n us -> (if (n <= 0) then us else (match us with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> ((v_Vuna_dCompiler_dElab_dUsage_duDrop (n - 1)) dtb__15)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dUsage_disRigZero = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> true
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearUnused (mc1))) mc1)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearOverused (mc1))) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero mc3) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ErasedBinderUsed (mc1))) mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig mc0) mc1) mc2) dtb__16)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__17))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: usage vector lost lambda binder"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__20, dtb__21) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: usage vector lost case binder"))
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig mc0) dtb__20) dtb__21) dtb__22)) (fun _u -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo mc0) dtb__19) dtb__23)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders = (fun sp binders us -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo sp) (Base_dList.v_Base_dList_dreverse binders)) us))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckTerm = (fun sp env t -> (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__24, dtb__25) -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dElab_dUsage_duVarAt (Base_dList.v_Base_dList_dlength env)) dtb__25)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__26) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__27) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__28) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__34, dtb__35, dtb__36) -> ((fun env2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env2) dtb__36)) (fun u -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder sp) dtb__34) dtb__35) u)))) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__34, dtb__35)), env)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__37, dtb__38, dtb__39) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__37)) (fun uf -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__39) then (Base_dResult.C_Base_dResult_dResult_Ok (uf)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__38)) (fun ua -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dElab_dUsage_duAdd uf) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__39) ua)))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__40, dtb__41) -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckArgs sp) env) dtb__41)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__42, dtb__43) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__42)) (fun us -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckAlts sp) env) dtb__43)) (fun ua -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dElab_dUsage_duAdd us) ua)))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__44, dtb__45, dtb__46) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__44)) (fun uc -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__45)) (fun ut -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) env) dtb__46)) (fun ue -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dElab_dUsage_duAdd uc) ((v_Vuna_dCompiler_dElab_dUsage_duJoin ut) ue))))))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__47) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__48) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__49) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__50) -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgs = (fun sp env args -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo sp) env) args) (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength env))))
and v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (match dtb__51 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__53, dtb__54) -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__54) then ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo mc0) mc1) dtb__52) mc3) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) mc1) dtb__53)) (fun ua -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo mc0) mc1) dtb__52) ((v_Vuna_dCompiler_dElab_dUsage_duAdd mc3) ((v_Vuna_dCompiler_dElab_dUsage_duScale dtb__54) ua))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (mc3))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcheckAlts = (fun sp env alts -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo sp) env) alts) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
and v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match dtb__55 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__57, dtb__58, dtb__59) -> ((fun env2 -> ((fun k -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm mc0) env2) dtb__59)) (fun u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders mc0) dtb__58) u)) (fun outer -> ((((v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo mc0) mc1) dtb__56) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> ((v_Vuna_dCompiler_dElab_dUsage_duJoin dtb__60) outer)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> outer
  | _ -> failwith "DT: impossible branch"
))))))))) (Base_dList.v_Base_dList_dlength dtb__58))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__58)) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> dtb__61
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dElab_dUsage_duZeroOf (Base_dList.v_Base_dList_dlength mc1))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage = (fun msp name body -> ((fun sp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckTerm sp) Base_dList.C_Base_dList_dList_Nil) body)) (fun rest -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dlength rest)))))) (match msp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> dtb__62
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear = (fun ec c -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) c) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily dtb__63)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear dtb__64)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel = (fun fuel ec sp t allowed -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: capture check fuel exhausted")) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__65, dtb__66) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__67) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__68) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__69) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__70) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__71) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__72) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__73) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78) -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__79, dtb__80, dtb__81) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinClosureName dtb__79) then (if allowed then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__81) false) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearCaptureEscapes ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__79)))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName dtb__79))) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__81) false))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__82, dtb__83, dtb__84) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__82) true)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dUsage_disRigZero dtb__84) then (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__83) false) else (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__83) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__84)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__85, dtb__86) -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel fuel) ec) sp) dtb__85) dtb__86)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__87, dtb__88, dtb__89) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__87) true)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__88) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__89) allowed)))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__90, dtb__91) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (fuel - 1)) ec) sp) dtb__90) true)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel fuel) ec) sp) allowed) dtb__91)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel = (fun fuel ec sp c args -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo fuel) ec) sp) ((v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear ec) c)) args))
and v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (match dtb__92 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__94, dtb__95) -> ((fun allowed -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__94) allowed)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo (mc0 - 1)) mc1) mc2) mc3) dtb__93)))) (if mc3 then (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsLinear dtb__95) else false))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__96 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (dtb__98, dtb__99, dtb__100) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel (mc0 - 1)) mc1) mc2) dtb__100) mc3)) (fun _u -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel (mc0 - 1)) mc1) mc2) mc3) dtb__97)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcapCheck = (fun ec sp t allowed -> (((((v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel 2048) ec) sp) t) allowed))

let v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef = (fun ec d -> (v_Vuna_dCompiler_dElab_dUsage_disTypeForming ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)))))

let v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__101) -> dtb__101
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture = (fun ec d body -> ((((v_Vuna_dCompiler_dElab_dUsage_dcapCheck ec) (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf d)) body) false))

let rec v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (if ((v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef mc0) dtb__102) then (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__103) mc2) else (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__102))) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf dtb__102)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearTopLevel ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__102)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__102)) else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__102) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__103) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture mc0) dtb__102) dtb__104)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__102)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__102)) dtb__104)) (fun _u -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo mc0) dtb__103) (mc2 + 1))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage = (fun ec defs -> (((v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo ec) defs) 0))
