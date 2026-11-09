open Vuna_runtime
type t_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan = C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) * (int) * (int) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan = C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) * (int) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep of (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain of (string) * (t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) * (Vuna_dCompiler_dCommon.t_Vuna_dCompiler_dCommon_dSpan)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig)
and t_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan = C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan of (string) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc)

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque = (fun ec ctx i -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (match dtb__0 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1, dtb__2) -> ((fun v -> ((fun r -> r) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec) ctx) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) (i + 1)) dtb__2)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxItemAt i) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__3, dtb__4) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (if (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque mc0) mc1) ((mc2 - 1) - mc4)) then (Base_dList.C_Base_dList_dList_Cons (((mc2 - 1) - mc4), (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__6) (mc4 + 1)))) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo mc0) mc1) mc2) dtb__6) (mc4 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices = (fun ec ctx n tele -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo ec) ctx) n) tele) 0))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase = (fun alts -> (if (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then true else (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dhasDupNames (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_daltNames alts))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__7 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__9, dtb__10) -> (match dtb__9 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__11, dtb__12) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__13, dtb__14) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__15) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts dtb__8)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf = (fun ec ty -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__16) -> (match dtb__16 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__17, dtb__18) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__17) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__19) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__19, (Base_dPair.C_Base_dPair_dPair_Pair (dtb__20, dtb__18))))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__19))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName = (fun i -> ("@vuna@record@proj" ^ (bi_strFromInt i)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistNthGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (mc0 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistNthGo (mc0 - 1)) dtb__23))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistNth = (fun n xs -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistNthGo n) xs))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFieldDomainsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> (if (mc0 > 0) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFieldDomainsGo (mc0 - 1)) dtb__28) mc2) else (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFieldDomainsGo 0) dtb__28) (Base_dList.C_Base_dList_dList_Cons (dtb__27, mc2))))
  | _ -> (Base_dList.v_Base_dList_dreverse mc2)
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFieldDomains = (fun arity ty -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFieldDomainsGo arity) ty) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldTypeAt = (fun arity fi params ctor -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistNth fi) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFieldDomains arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__29) -> ((fun dummy -> ((fun before -> ((fun env -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env) dtb__29)))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse before)) (Base_dList.v_Base_dList_dreverse params)))) ((Base_dList.v_Base_dList_dmap (fun _u -> dummy)) ((Base_dList.v_Base_dList_drange 0) fi)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("@vuna@record@dep", 0, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom = (fun i remaining sp -> (if (remaining <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp)), (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom (i + 1)) (remaining - 1)) sp)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats = (fun n sp -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom 0) n) sp))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match dtb__30 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__32, dtb__33) -> (if (dtb__32 = (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dfieldBinderName mc0)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (mc2, mc3)))) else ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo mc0) dtb__31) (mc2 + 1)) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup = (fun fname arity ctor -> ((fun tele -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo fname) tele) 0) (Base_dList.v_Base_dList_dlength tele))) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (match dtb__34 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__36, dtb__37) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup dtb__36) mc0) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__36))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo mc0) mc1) dtb__35)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown = (fun arity ctor fields -> (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo arity) ctor) fields))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (match dtb__39 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__41, dtb__42) -> (if ((Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dfieldBinderName dtb__41) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor mc0) dtb__40))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg = (fun i bname provided sp -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor (Base_dPair.v_Base_dPair_dfirstOf bname)) provided) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__43) -> dtb__43
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName i), sp))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs = (fun i tele provided sp -> (match tele with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (Base_dList.C_Base_dList_dList_Cons (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg i) dtb__44) provided) sp), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs (i + 1)) dtb__45) provided) sp)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan = (fun ec baseTy fname sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46) -> (match dtb__46 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__47, dtb__48) -> (match dtb__48 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__49, dtb__50) -> ((fun arity -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (match dtb__51 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__52, dtb__53) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldTypeAt arity) dtb__52) dtb__50) dtb__49) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "record field type is not representable")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__47, dtb__49, dtb__50, dtb__52, dtb__53, dtb__54))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ fname))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup fname) arity) dtb__49))) (Base_dList.v_Base_dList_dlength (match dtb__47 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> dtb__56
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve record type for field "; fname; "; add a type signature"]))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan = (fun ec baseTy fields sp -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (match dtb__61 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__62, dtb__63) -> (match dtb__63 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__64, dtb__65) -> ((fun arity -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown arity) dtb__64) fields) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__66) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ("record type has no field " ^ dtb__66))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun tele -> ((fun bodyArgs -> (Base_dResult.C_Base_dResult_dResult_Ok ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan (dtb__62, dtb__64, dtb__65, (Base_dList.v_Base_dList_dlength tele), bodyArgs))))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs 0) tele) fields) sp))) ((Base_dList.v_Base_dList_ddrop arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope dtb__64)))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (match dtb__62 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtData_DtData (dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> dtb__68
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "cannot resolve record type for update; add a type signature")
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf ec) baseTy)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName "Base.Record.HasField")

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__73 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__75, dtb__76) -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__77) -> (match dtb__77 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__78, dtb__79) -> (if (dtb__78 = v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName) then ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (match dtb__83 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> ((fun nd_uscrut27 -> (match nd_uscrut27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__86) -> (match dtb__86 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__87, dtb__88) -> (if (dtb__87 = "Base.Field.Field") then (match dtb__88 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__89, dtb__90) -> (match dtb__89 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__91) -> (if (dtb__91 = mc4) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__82) mc5) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__92) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__75, mc1)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__84, dtb__92))))))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__93) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) dtb__80))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) dtb__79) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo dtb__74) (mc1 + 1)) mc2) mc3) mc4) mc5)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc2) mc1) dtb__76)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict = (fun ctx ec fname baseTy -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Ctx (dtb__94, dtb__95) -> dtb__94
  | _ -> failwith "DT: impossible branch"
)) 0) ctx) ec) fname) baseTy))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel = (fun fuel globals ctx ec baseTerm baseTy fname sp -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__96) -> (match dtb__96 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__97, dtb__98) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["type "; dtb__97; " is not a record"]))
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__99) -> (match dtb__99 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__100, dtb__101) -> (match dtb__101 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__102, dtb__103) -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (proj, (Base_dPair.C_Base_dPair_dPair_Pair (dtb__102, dtb__103))))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__102), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__100, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)
  | _ -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> (match dtb__104 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__105, dtb__106) -> (match dtb__106 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__107, dtb__108) -> ((fun d -> ((fun labelTerm -> ((fun proj -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (proj, (Base_dPair.C_Base_dPair_dPair_Pair (dtb__107, dtb__108))))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Record.getField")), labelTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) baseTy), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote d) dtb__107), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__105, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), baseTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("Base.Field.Field")), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (fname)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["cannot resolve field "; fname; "; add a HasField (Field \""; fname; "\") constraint or a record type annotation"]))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict ctx) ec) fname) baseTy))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) baseTy)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__109, dtb__110, dtb__111) -> (match dtb__109 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__112, dtb__113) -> (match dtb__110 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__115 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__117 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__112) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail dtb__114) dtb__116) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__118, dtb__119) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__118) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail = (fun h t -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__120) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (h, dtb__120))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorShortName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__121)) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__121)) else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort mc0) dtb__122))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor = (fun ec fam short -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__123) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort short) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__123))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__124, dtb__125) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo mc0) mc1) dtb__125) mc3)) (fun t -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc1, mc3)), (Base_dList.C_Base_dList_dList_Cons (dtb__124, (Base_dList.C_Base_dList_dList_Cons (t, Base_dList.C_Base_dList_dList_Nil)))), mc3))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, mc3))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit = (fun ec fam elems sp -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor ec) fam) "Cons") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (fam))) fam)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__126)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__127)) elems) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf ec) expected) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__128) -> dtb__128
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit = (fun ec dom a -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__129) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))) dtb__129) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan a))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (a))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo (n - 1)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor, (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (acc, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), Base_dList.C_Base_dList_dList_Nil)))))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm = (fun n -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo n) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult = (fun sp n -> (if (n < 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NatLiteralOutOfRange) else (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm n)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("natToInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__130) -> (match dtb__130 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__131, dtb__132) -> (match dtb__132 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__131 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__133) -> (match dtb__133 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__134, dtb__135) -> (match dtb__135 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__134 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__136) -> (match dtb__136 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__137, dtb__138) -> (match dtb__138 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__137 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm = (fun ec expected actual term -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) actual) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm term))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands = (fun ec aTy bTy aTerm bTerm -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)), (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm), (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, bTy)), (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm), bTerm)))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.C_Base_dPair_dPair_Pair (aTy, v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)), (Base_dPair.C_Base_dPair_dPair_Pair (aTerm, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm))))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName = (fun name -> (if (if (if (name = "+") then true else (name = "-")) then true else (name = "*")) then true else (name = "/")))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName = (fun mc0 -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name)), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName = (fun mc0 -> (if (mc0 = "+") then "bi_add_float" else (if (mc0 = "-") then "bi_sub_float" else (if (mc0 = "*") then "bi_mul_float" else "bi_div_float"))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 = (fun name a b -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName name))), a, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), b, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__139, dtb__140) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__139))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower = (fun globals ctx ec traitName methodName lit expected sp -> ((fun dictDom -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__141) -> (match dtb__141 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__142, dtb__143) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (methodName, sp)), (Base_dList.C_Base_dList_dList_Cons (lit, Base_dList.C_Base_dList_dList_Nil)), sp)), dtb__143))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__144) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictDom) sp))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName traitName), (Base_dList.C_Base_dList_dList_Cons (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected), Base_dList.C_Base_dList_dList_Nil))))))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__145, dtb__146, dtb__147) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__146)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__148, dtb__149, dtb__150) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__149)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__151, dtb__152, dtb__153) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName dtb__151) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__152))
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__154) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__155))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> (match dtb__156 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__158, dtb__159) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor dtb__159) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor dtb__157))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (match dtb__160 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__162, dtb__163) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor dtb__162) then true else (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__161))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__164, dtb__165, dtb__166) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__164)) (fun value2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (value2, dtb__165, dtb__166))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__167, dtb__168) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt mc0)) dtb__167)) (fun stmts2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (stmts2, dtb__168))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__169, dtb__170, dtb__171) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__169)) (fun base2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun fv -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf fv), v2)))))))) dtb__170)) (fun fields2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (base2, fields2, dtb__171))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__172, dtb__173, dtb__174) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (fun fv -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (Base_dPair.v_Base_dPair_dsecondOf fv))) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf fv), v2)))))))) dtb__173)) (fun fields2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__172, fields2, dtb__174))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__175, dtb__176, dtb__177) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__175)) (fun base2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (base2, dtb__176, dtb__177))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__178, dtb__179, dtb__180, dtb__181) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__178)) (fun c2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__179)) (fun t2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__180)) (fun el2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (c2, t2, el2, dtb__181))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__182, dtb__183, dtb__184) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__182)) (fun scrut2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__183)) (fun alts2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (scrut2, alts2, dtb__184))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__185, dtb__186, dtb__187, dtb__188) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__185)) (fun binds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__186)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (binds2, body2, dtb__187, dtb__188))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__192)) (fun dom2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__193)) (fun cod2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__189, dtb__190, dtb__191, dom2, cod2, dtb__194))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__195, dtb__196, dtb__197) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__195)) (fun fn2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0)) dtb__196)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn2, args2, dtb__197))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__198, dtb__199, dtb__200) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__199)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__198, b2, dtb__200))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__201, dtb__202) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__201, dtb__202))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__203, dtb__204) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__203, dtb__204))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__205, dtb__206) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__205, dtb__206))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__207, dtb__208) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__207, dtb__208))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__209, dtb__210) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__209) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__209, dtb__210)))) else ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable mc0)) dtb__209))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: unreordered infix/paren in elaboration"))
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__211, dtb__212) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__212)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__211, v2))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__213, dtb__214) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__213)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (v2, dtb__214))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__215, dtb__216, dtb__217) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__216)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__215, v2, dtb__217))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas = (fun fuel ctx ec v -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__223, dtb__224) -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas (fuel - 1)) ctx) dtb__224) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__222) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__223)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (v, ec))))
)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__225, dtb__226) -> (match dtb__226 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__227, dtb__228) -> true
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__229, dtb__230) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__231) -> (match dtb__231 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__232, dtb__233, dtb__234) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__235, dtb__236) -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint = (fun goals0 ctx expected ec piTy -> (if ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) <= goals0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__237) -> (match dtb__237 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__238, dtb__239) -> ((fun forcedRes -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue dtb__239) forcedRes) then (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue dtb__239) expected) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__239) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) forcedRes) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__240) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__241) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241))
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__239) dtb__238))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__242) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas 64) ctx) ec) piTy))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__243) -> (match dtb__243 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__244, dtb__245) -> (match dtb__245 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__246, dtb__247) -> (match dtb__247 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__248, dtb__249) -> (if (dtb__244 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffTypeName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__246)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__250, dtb__251) -> (dtb__250 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels = (fun fuel ec row -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) row) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__252, dtb__253) -> (if (dtb__252 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)) else (if (dtb__252 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__254, dtb__255) -> (match dtb__255 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__256, dtb__257) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) dtb__254) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels (fuel - 1)) ec) dtb__256) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__258) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__254), dtb__258))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__253) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__259, dtb__260) -> (match dtb__260 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__259
  | _ -> (String.concat "" [dtb__259; ", "; (v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__260)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel = (fun ec expected actual -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__261) -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue ec) dtb__261) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) actual)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__262) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels 64) ec) dtb__262) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263) -> (if (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dString.v_Eq_uString)) dtb__263) Base_dList.C_Base_dList_dList_Nil) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels dtb__263))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromInt")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm = (fun t -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("strFromFloat")), t, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName, Base_dList.C_Base_dList_dList_Nil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__264) -> (match dtb__264 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__265, dtb__266) -> (match dtb__266 with
  | Base_dList.C_Base_dList_dList_Nil -> (dtb__265 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__267) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__267, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__268, dtb__269, dtb__270) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType dtb__268) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__271, dtb__272) -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__271, ((Base_dList.v_Base_dList_dappend dtb__272) (Base_dList.C_Base_dList_dList_Cons (dtb__269, Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dPair.C_Base_dPair_dPair_Pair ("", Base_dList.C_Base_dList_dList_Nil))
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs dtb__277)
  | _ -> (Base_dPair.v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType mc0))
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis dtb__282)
  | _ -> mc0
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__283, dtb__284) -> (match dtb__283 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__285, dtb__286) -> (if (dtb__286 = ((mc1 - 1) - mc0)) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs (mc0 + 1)) mc1) dtb__284) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine = (fun fam ctor -> ((fun k -> ((fun args -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__287, dtb__288) -> (if (dtb__287 = fam) then (if ((Base_dList.v_Base_dList_dlength args) > 0) then (if ((Base_dList.v_Base_dList_dlength args) < k) then (((v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs 0) k) args) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor)))) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__289, dtb__290) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dsecondOf dtb__289), ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo (mc0 - 1)) dtb__290))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs = (fun n bs -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo n) bs))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__291, dtb__292) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__293, dtb__294) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) mc1) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> (if dtb__296 then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo mc0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__299) dtb__291)) dtb__292) dtb__294) mc4) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc4) dtb__291), dtb__293)), mc5))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc5), (Base_dPair.C_Base_dPair_dPair_Pair (mc1, mc0))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs = (fun ec ctx ctor expected -> ((fun fam -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine fam) ctor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__300) -> (match dtb__300 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__301, dtb__302) -> ((fun arity -> (if (dtb__301 = fam) then (if ((Base_dList.v_Base_dList_dlength dtb__302) = arity) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))) dtb__302) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs arity) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope ctor))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) Base_dList.C_Base_dList_dList_Nil) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Base_dList.v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType ctor))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily ctor)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__303 = mc0 in (if dtnat__303 = 0 then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern resolve fuel exhausted")) else (let dtb__304 = (dtnat__303 - 1) in (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__305, dtb__306, dtb__307) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax dtb__305) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) "Nil") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__308) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__304) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__308)) dtb__306) dtb__307)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__306, dtb__307)), mc1))))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax dtb__305) then (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor mc1) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily mc1) mc3)) "Cons") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__309) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__304) mc1) mc2) mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__309)) dtb__306) dtb__307)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ("__list_literal__", dtb__306, dtb__307)), mc1))))
  | _ -> failwith "DT: impossible branch"
) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__305) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor mc1) dtb__307) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc3))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__305)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__305))) (fun target -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__304) mc1) mc2) mc3) target) dtb__306) dtb__307))) else (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel dtb__304) mc1) mc2) mc3) dtb__305) dtb__306) dtb__307))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__310, dtb__311, dtb__312) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (mc4, mc1))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (mc4, mc1))))
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (let dtnat__313 = mc0 in (if dtnat__313 = 0 then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern resolve fuel exhausted")) else (let dtb__314 = (dtnat__313 - 1) in (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc mc1) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)), mc1))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__315) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__316) -> (match dtb__316 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__317, dtb__318) -> (match dtb__318 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__319, dtb__320) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__314) dtb__320) mc2) dtb__319) mc5)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__321, dtb__322) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, dtb__321, mc6)), dtb__322))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (mc4, mc5, mc6)), mc1))))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs mc1) mc2) dtb__315) mc3))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__323 = mc0 in (if dtnat__323 = 0 then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern resolve fuel exhausted")) else (let dtb__324 = (dtnat__323 - 1) in (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc1))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__325, dtb__326) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__328 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__324) mc1) ctx2) ty2) (Base_dList.C_Base_dList_dList_Cons (dtb__325, dtb__326))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__324) mc1) mc2) dtb__330) dtb__325)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__332, dtb__333) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel dtb__324) dtb__333) ctx2) ty2) dtb__326)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__334, dtb__335) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__332, dtb__334)), dtb__335))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__331) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__327) dtb__330) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__327, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (mc4, mc1))))
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__336 = mc0 in (if dtnat__336 = 0 then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern resolve fuel exhausted")) else (let dtb__337 = (dtnat__336 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__338, dtb__339) -> (match dtb__338 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__340, dtb__341) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__340)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__342, dtb__343) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo dtb__337) dtb__343) mc2) mc3) dtb__339)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__344, dtb__345) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__342, dtb__341)), dtb__344)), dtb__345))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc1))))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts = (fun ec ctx ty alts -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo (bi_natFromInt 512)) ec) ctx) ty) alts))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__346 = mc0 in (if dtnat__346 = 0 then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern resolve fuel exhausted")) else (let dtb__347 = (dtnat__346 - 1) in (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc1))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__348, dtb__349) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc1) mc3) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> ((fun v -> ((fun ctx2 -> ((fun ty2 -> (if dtb__351 then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__347) mc1) ctx2) ty2) (Base_dList.C_Base_dList_dList_Cons (dtb__348, dtb__349))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel dtb__347) mc1) mc2) dtb__353) dtb__348)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__355, dtb__356) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel dtb__347) dtb__356) ctx2) ty2) dtb__349)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__357, dtb__358) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__355, dtb__357)), dtb__358))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__354) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__350) dtb__353) mc2))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__350, (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2), Base_dList.C_Base_dList_dList_Nil)))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (mc4, mc1))))
)
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo = (fun mc0 mc1 mc2 mc3 mc4 -> (let dtnat__359 = mc0 in (if dtnat__359 = 0 then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern resolve fuel exhausted")) else (let dtb__360 = (dtnat__359 - 1) in ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__361, dtb__362) -> (match dtb__361 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__363, dtb__364) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel (bi_natFromInt 512)) mc1) mc2) mc3) dtb__363)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__365, dtb__366) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo dtb__360) dtb__366) mc2) mc3) dtb__362)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__367, dtb__368) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__365, dtb__364)), dtb__367)), dtb__368))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc1))))
  | _ -> failwith "DT: impossible branch"
)) mc4)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats = (fun ec ctx expected clauses -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo (bi_natFromInt 512)) ec) ctx) expected) clauses))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__369, dtb__370, dtb__371) -> (match dtb__369 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__372, dtb__373) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__372) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__374) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain = (fun fuel canonical acc expr -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__375, dtb__376, dtb__377) -> (match dtb__375 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__378, dtb__379) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__378) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), expr))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__380) -> (if (canonical <> dtb__380) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__381, dtb__382) -> (match dtb__382 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__383, dtb__384) -> (match dtb__383 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__385, dtb__386, dtb__387) -> (match dtb__385 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__388, dtb__389) -> (match dtb__389 with
  | Base_dList.C_Base_dList_dList_Nil -> (match dtb__384 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain (fuel - 1)) dtb__380) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__388, dtb__381, dtb__379)), acc))) dtb__386)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__376))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), expr))))
)
  | _ -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse acc), expr))))
)) expr)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__390, dtb__391, dtb__392) -> (match dtb__390 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__393, dtb__394) -> (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical dtb__393) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__395) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__396) -> (match dtb__396 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__397, dtb__398) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__395, dtb__397, dtb__398, dtb__394))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain 4096) dtb__395) Base_dList.C_Base_dList_dList_Nil) mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__399, dtb__400) -> (match dtb__399 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__401, dtb__402, dtb__403) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (mc0, dtb__403)), (Base_dList.C_Base_dList_dList_Cons (dtb__402, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (dtb__401, Base_dList.C_Base_dList_dList_Nil)), ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild mc0) dtb__400) mc2) mc3), dtb__403)), Base_dList.C_Base_dList_dList_Nil)))), dtb__403))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback = (fun chain -> ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__404, dtb__405, dtb__406, dtb__407) -> dtb__404
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__408, dtb__409, dtb__410, dtb__411) -> dtb__409
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__412, dtb__413, dtb__414, dtb__415) -> dtb__414
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__416, dtb__417, dtb__418, dtb__419) -> dtb__419
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__420, dtb__421) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mc0) dtb__420)) dtb__421) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (mc0, dtb__420))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__422) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__422))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected = (fun ec expected -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__423) -> (match dtb__423 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__424, dtb__425, dtb__426) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__424, dtb__425, Base_dList.C_Base_dList_dList_Nil))))) dtb__426)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__427, dtb__428) -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__427, Base_dList.C_Base_dList_dList_Nil))))) dtb__428)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__429, dtb__430, dtb__431, dtb__432, dtb__433) -> (if dtb__430 then (match dtb__433 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__434, dtb__435, dtb__436, dtb__437, dtb__438) -> (if dtb__435 then (match dtb__437 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__439, dtb__440, dtb__441) -> (match dtb__439 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__442) -> (match dtb__440 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__443, dtb__444) -> (match dtb__438 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449) -> (if dtb__446 then (match dtb__449 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> (if dtb__451 then (match dtb__454 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (if dtb__456 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__458 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__460, dtb__461, dtb__462) -> (match dtb__460 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__463, dtb__464) -> (match dtb__461 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__465, dtb__466) -> (match dtb__459 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__467, dtb__468, dtb__469, dtb__470, dtb__471) -> (if dtb__468 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__470 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (if dtb__473 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match dtb__475 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__477, dtb__478) -> (match dtb__476 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__479, dtb__480, dtb__481) -> (match dtb__479 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__482, dtb__483) -> (match dtb__480 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__484, dtb__485) -> (match dtb__471 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__486, dtb__487, dtb__488) -> (match dtb__486 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__489, dtb__490) -> (match dtb__487 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__491, dtb__492) -> (if (if (if (if (dtb__444 = 0) then (dtb__464 = 3) else false) then (dtb__483 = 5) else false) then (dtb__490 = 5) else false) then (if (if (if (if (dtb__466 = 1) then (dtb__478 = 2) else false) then (dtb__485 = 2) else false) then (dtb__492 = 2) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__457, dtb__469, dtb__474)))) else (if (if (if (if (dtb__466 = 0) then (dtb__478 = 1) else false) then (dtb__485 = 3) else false) then (dtb__492 = 3) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__457, dtb__469, dtb__474)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf = (fun globals ctx ec bindName -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup bindName) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__493) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup bindName) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__494) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (bindName)), dtb__494))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf = (fun globals ctx ec bindName -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__495) -> (match dtb__495 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__496, dtb__497) -> (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf dtb__497) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__498) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__496, (Base_dPair.C_Base_dPair_dPair_Pair (dtb__497, dtb__498))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf globals) ctx) ec) bindName)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer = (fun ctx ec dom sp -> ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__499, dtb__500) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__499, ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__500) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__500) dom)) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep = (fun fuel globals ctx ec sp dom -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dom) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__501) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) then ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer ctx) ec) dom) sp) else (Base_dResult.C_Base_dResult_dResult_Err (dtb__501))))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__502) -> (match dtb__502 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__503, dtb__504) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__503, dtb__504))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)) sp)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock = (fun fuel globals ctx ec sp bindName headTerm bindTyTerm shape mVal aVal -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match shape with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoBindShape_DoBindShape (dtb__505, dtb__506, dtb__507) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__508, dtb__509, dtb__510, dtb__511, dtb__512) -> (if dtb__509 then ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__513, dtb__514, dtb__515, dtb__516, dtb__517) -> (if dtb__514 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__516) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep (fuel - 1)) globals) ctx) ec) sp) dtb__516)) (fun dp -> (match dp with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__518, dtb__519) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (bindName, headTerm, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) mVal), mVal, aVal, dtb__518, dtb__505, dtb__506, dtb__507, dtb__519))))))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__512) mVal))) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) bindTyTerm)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm = (fun ecLinear ecPaper ctx sp plan binder aVal eTerm argRig lamRig inner -> ((fun depth -> ((fun ctx2 -> ((fun inner2 -> ((fun binderName -> ((fun lamTerm -> ((fun args -> ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525, dtb__526, dtb__527, dtb__528, dtb__529) -> dtb__521
  | _ -> failwith "DT: impossible branch"
)) args)) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__530, dtb__531, dtb__532, dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> dtb__532
  | _ -> failwith "DT: impossible branch"
), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__540, dtb__541, dtb__542, dtb__543, dtb__544, dtb__545, dtb__546, dtb__547, dtb__548, dtb__549) -> dtb__545
  | _ -> failwith "DT: impossible branch"
), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) aVal), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__550, dtb__551, dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557, dtb__558, dtb__559) -> dtb__554
  | _ -> failwith "DT: impossible branch"
)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (eTerm, argRig)), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (lamTerm, (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__560, dtb__561, dtb__562, dtb__563, dtb__564, dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> dtb__567
  | _ -> failwith "DT: impossible branch"
))), Base_dList.C_Base_dList_dList_Nil)))))))))))))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, inner2)))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear ecLinear) ctx) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear ecLinear) ctx2) inner) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName sp) depth) binder) else binder) else binder))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ecPaper) ctx) aVal) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) inner) else inner))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue binder) aVal) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel globals ctx ec dd idxs scrutVal expected cname args psp body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 psp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownConstructorInCase ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__570) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__570)) args)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__571, dtb__572) -> (match dtb__572 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__573, dtb__574) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__574) then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 psp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_BranchTooManyArgs ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName cname)) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__571)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__571) dtb__570)) ((Base_dList.v_Base_dList_dmap (fun v -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs))) (fun refsIdx -> (match (((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__571) refsIdx) with
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleIndex -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImpossibleBranchIndex)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchImpossibleEmptyCtx -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImpossibleBranchEmptyCtx)
  | Vuna_dCompiler_dElab_dCase.C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_BranchOk -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__571)) refsIdx) ((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__571) dtb__570)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__575, dtb__576) -> ((fun n -> ((fun opaqueIdxs -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt (cname, dtb__573, bodyTerm2)), dtb__576))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__576) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses opaqueIdxs) dtb__575))) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices dtb__576) branchCtx2) n) dtb__573))) (Base_dList.v_Base_dList_dlength dtb__573))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__571) refs2))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__577, dtb__578) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match dtb__577 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__579, dtb__580) -> (match dtb__579 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__581, dtb__582, dtb__583) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__581) dtb__582) dtb__583) dtb__580)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__584, dtb__585) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__585) mc4) mc5) mc6) mc7) mc8) dtb__578) (Base_dList.C_Base_dList_dList_Cons (dtb__584, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__586, dtb__587) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__578) mc10) dtb__580) dtb__586) dtb__587)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__588) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__578) mc10) dtb__580) "_") dtb__588)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__579)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse mc10), mc3)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel globals ctx ec scrutTy dd idxs expected rest acc body pname psp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CatchAllNotLast) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__589, dtb__590) -> ((fun binds -> ((fun bodyTerm1 -> ((fun bodyTerm2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt ("", binds, bodyTerm2)), acc))), dtb__590))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__590) ctx) expected) then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased bodyTerm1) else bodyTerm1))) (if (pname = "_") then dtb__589 else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__590) ctx) scrutTy) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__589) else dtb__589)))) (if (pname = "_") then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (pname, ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) scrutTy))), Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
))))) (if (pname = "_") then ctx else (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__591, dtb__592) -> (match dtb__592 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__593, dtb__594) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts dtb__594) ctx) dtb__593) alts)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__595, dtb__596) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat dtb__595)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase dtb__595) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel (fuel - 1)) globals) ctx) dtb__596) scrut) dtb__595) expected) sp) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel (fuel - 1)) globals) ctx) dtb__596) dtb__591) dtb__593) dtb__595) expected) sp))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun name -> ((fun clauses -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (name, sp)), scrut)), Base_dList.C_Base_dList_dList_Nil)), bodyExpr, false, sp))) expected)))) ((Base_dList.v_Base_dList_dmap (fun alt -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf alt), Base_dList.C_Base_dList_dList_Nil)), (Base_dPair.v_Base_dPair_dsecondOf alt))))) alts))) ("nd_scrut" ^ (bi_strFromInt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel globals ctx ec scrutTerm scrutTy alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__597) -> (match dtb__597 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__598, dtb__599) -> (if (if (dtb__598 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then ((Base_dList.v_Base_dList_dlength dtb__599) = 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__598 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts alts) then ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel (fuel - 1)) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm scrutTerm)) scrutTerm) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue) alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__598) dtb__599) alts) expected) sp)) else (if (dtb__598 = "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__598 = "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__598) dtb__599) alts) expected) sp)))))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel globals ctx ec scrutTerm alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__600, dtb__601) -> (match dtb__601 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__602, dtb__603) -> (match dtb__602 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__604) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__600, dtb__604)), dtb__603))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__605, dtb__606) -> (match dtb__606 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__607, dtb__608) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (scrutTerm, dtb__600, dtb__605)), dtb__608))))
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
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel = (fun fuel globals ctx ec alts target expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__609, dtb__610) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match dtb__609 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__611, dtb__612) -> (match dtb__611 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__613, dtb__614, dtb__615) -> (if (dtb__613 = mc5) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__612) mc6)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__616, dtb__617) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__616, (Base_dPair.C_Base_dPair_dPair_Pair (mc8, dtb__617))))))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__610) mc5) mc6) mc7) mc8))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__618, dtb__619) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__612) mc6)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__620, dtb__621) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__610) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__620)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__622) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__612) mc6)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__623, dtb__624) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__610) mc5) mc6) mc7) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__623)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__611)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_BoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match mc8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__625) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__625, (Base_dPair.C_Base_dPair_dPair_Pair (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, mc3))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc7) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotExhaustive ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName mc5))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel globals ctx ec scrutTerm tyName alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__626, dtb__627) -> (match dtb__627 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__628, dtb__629) -> (if dtb__628 then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__626, dtb__629)))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__630, dtb__631) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match dtb__630 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__632, dtb__633) -> (match dtb__632 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__634, dtb__635) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__634))) dtb__633) dtb__631) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__636, dtb__637) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__636))) dtb__633) dtb__631) mc7) mc8)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__638, dtb__639) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__638) dtb__633) mc7) mc8)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__640, dtb__641) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__640, (Base_dPair.C_Base_dPair_dPair_Pair (true, dtb__641))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__642) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__633) mc7)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__643, dtb__644) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__643, (Base_dPair.C_Base_dPair_dPair_Pair (true, dtb__644))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__632)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))), (Base_dPair.C_Base_dPair_dPair_Pair (false, mc3)))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel globals ctx ec scrutTerm tyName litTerm body rest expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__645, dtb__646) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) dtb__646) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__647, dtb__648) -> (match dtb__648 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__649, dtb__650) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__645, dtb__647)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__649, dtb__650))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel globals ctx ec scrutTerm tyName name body expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__651, dtb__652) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__651)), scrutTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__652))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dList.C_Base_dList_dList_Nil))))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (tyName, Base_dList.C_Base_dList_dList_Nil))))) ctx))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) ec) cmpTerm) bindTerm) binderTy) alts) expected) sp)) (fun p -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__653, dtb__654) -> (match dtb__654 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__655, dtb__656) -> (if dtb__655 then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__653, dtb__656)))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__657, dtb__658) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match dtb__657 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__659, dtb__660) -> (match dtb__659 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__661, dtb__662) -> ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__661))) dtb__660) dtb__658) mc8) mc9)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__663, dtb__664) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) dtb__663) dtb__660) mc8) mc9)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__665, dtb__666) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__665, (Base_dPair.C_Base_dPair_dPair_Pair (true, dtb__666))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__667) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__660) mc8)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__668, dtb__669) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__668, (Base_dPair.C_Base_dPair_dPair_Pair (true, dtb__669))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__659)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)), (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (0)))), (Base_dPair.C_Base_dPair_dPair_Pair (false, mc3)))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel = (fun fuel globals ctx ec cmpTerm bindTerm binderTy litTerm body rest expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__670, dtb__671) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel (fuel - 1)) globals) ctx) dtb__671) cmpTerm) bindTerm) binderTy) rest) expected) sp)) (fun q -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__672, dtb__673) -> (match dtb__673 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__674, dtb__675) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ("bi_eq_int")), cmpTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), litTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__670, dtb__672)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__674, dtb__675))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel = (fun fuel globals ctx ec bindTerm binderTy name body expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__676, dtb__677) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, dtb__676)), bindTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__677))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) binderTy))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) binderTy) ctx))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel globals ctx ec scrutTerm scrutTy fam idxs alts expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NotInductiveFamily)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__678) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__678) idxs) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) Base_dList.C_Base_dList_dList_Nil)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__679, dtb__680) -> (((((((((Vuna_dCompiler_dElab_dCase.v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__680) ctx) dtb__678) idxs) alts) expected) sp) scrutTerm) dtb__679)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel globals ctx ec scrut alts sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun pmeta -> (match pmeta with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__681, dtb__682) -> ((fun metaTy -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) dtb__682) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__683, dtb__684) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__683, (Base_dPair.C_Base_dPair_dPair_Pair (metaTy, dtb__684))))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__681))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel globals ctx ec c sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) c) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil))))) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__685) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__685))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__686) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__687, dtb__688) -> (match dtb__688 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__689, dtb__690) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__689) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__687, dtb__690)))) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["if condition must be "; Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName; " (got "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__689); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__691) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) dtb__691) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__692) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__692)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__693) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__693))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__692))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain fuel) globals) ctx) ec) expr))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__694, dtb__695) -> (if (dtb__694 = "Type") then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))), ec)))))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__694) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__695) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_HoleNoExpectedType) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__694) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__695) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__694)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__694))) (fun t -> (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) t) dtb__695))) else (((((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__694) dtb__695))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__696, dtb__697) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__696)), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("Int", Base_dList.C_Base_dList_dList_Nil)))), ec))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__698, dtb__699) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__698)), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ("String", Base_dList.C_Base_dList_dList_Nil)))), ec))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__700, dtb__701) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__700)), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName, Base_dList.C_Base_dList_dList_Nil)))), ec))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__702, dtb__703, dtb__704, dtb__705, dtb__706, dtb__707) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) dtb__702) dtb__703) dtb__704) dtb__705) dtb__706) dtb__707)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__708, dtb__709, dtb__710) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__708) dtb__709) dtb__710) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__711, dtb__712, dtb__713) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__713) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaNoSignature)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__714, dtb__715, dtb__716, dtb__717) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__714) dtb__717)) (fun pc -> (match pc with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__718, dtb__719) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__719) dtb__715)) (fun pt -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__720, dtb__721) -> (match dtb__721 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__722, dtb__723) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__723) dtb__716)) (fun pe -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__724, dtb__725) -> (match dtb__725 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__726, dtb__727) -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__727) dtb__722) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__727) dtb__726) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__718, dtb__720, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__724))), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__722, dtb__727)))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__727) dtb__722) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__727) dtb__726) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__718, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__720), dtb__724)), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__727)))))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__727) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__722) dtb__726)) (fun ec4 -> ((fun branchOpaque -> ((fun tTerm2 -> ((fun eTerm2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__718, tTerm2, eTerm2)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__722, ec4))))))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__724) else dtb__724))) (if branchOpaque then (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dcastErased dtb__720) else dtb__720))) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn ec4) ctx) dtb__722))))))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__728, dtb__729, dtb__730, dtb__731) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) ec) dtb__728) dtb__729) dtb__730) dtb__731)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__732, dtb__733) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__732) then ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 dtb__733) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousCtor ("constructor pattern", "local function needs an explicit signature"))) "constructor pattern") "local function needs an explicit signature") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__732, dtb__733)))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__734, dtb__735, dtb__736) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__734) dtb__735) dtb__736)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__737, dtb__738, dtb__739) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel (fuel - 1)) globals) ctx) ec) dtb__737) dtb__738) dtb__739)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__740, dtb__741, dtb__742) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__742) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_RecordsUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__743, dtb__744, dtb__745) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel (fuel - 1)) globals) ctx) ec) dtb__743) dtb__744) dtb__745)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__746, dtb__747) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__747) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_DoUnsupported)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__748, dtb__749, dtb__750) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__748) dtb__749) dtb__750)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: unreordered infix/paren in elaboration"))
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel = (fun fuel globals ctx ec base fname sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__751, dtb__752) -> (match dtb__752 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__753, dtb__754) -> (match ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf dtb__754) dtb__753) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__755) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan dtb__754) dtb__753) fname) sp)) (fun plan -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (fuel - 1)) globals) ctx) dtb__754) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__756, dtb__757, dtb__758, dtb__759, dtb__760, dtb__761) -> dtb__756
  | _ -> failwith "DT: impossible branch"
)) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__762, dtb__763, dtb__764, dtb__765, dtb__766, dtb__767) -> dtb__764
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__751)) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__768, dtb__769, dtb__770, dtb__771, dtb__772, dtb__773) -> dtb__773
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__774, dtb__775, dtb__776, dtb__777, dtb__778, dtb__779) -> dtb__775
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__780, dtb__781, dtb__782, dtb__783, dtb__784, dtb__785) -> dtb__784
  | _ -> failwith "DT: impossible branch"
)) sp)) sp) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__786, dtb__787, dtb__788, dtb__789, dtb__790, dtb__791) -> dtb__789
  | _ -> failwith "DT: impossible branch"
)), sp)))) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__792, dtb__793) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__751, (Base_dList.C_Base_dList_dList_Cons (dtb__792, Base_dList.C_Base_dList_dList_Nil)))), (Base_dPair.C_Base_dPair_dPair_Pair ((match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dFieldAccessPlan_FieldAccessPlan (dtb__794, dtb__795, dtb__796, dtb__797, dtb__798, dtb__799) -> dtb__799
  | _ -> failwith "DT: impossible branch"
), dtb__793))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel (fuel - 1)) globals) ctx) dtb__754) dtb__751) dtb__753) fname) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel = (fun fuel globals ctx ec base fields sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match fields with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "record update needs at least one field")
  | _ -> (if (Vuna_dCompiler_dElab_dRecords.v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames fields) then ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_derrAt sp) "duplicate field in record update") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) base)) (fun pb -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__800, dtb__801) -> (match dtb__801 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__802, dtb__803) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan dtb__803) dtb__802) fields) sp)) (fun plan -> ((fun body -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (fuel - 1)) globals) ctx) dtb__803) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan (dtb__804, dtb__805, dtb__806, dtb__807, dtb__808) -> dtb__804
  | _ -> failwith "DT: impossible branch"
)) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan (dtb__809, dtb__810, dtb__811, dtb__812, dtb__813) -> dtb__811
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__800)) dtb__802) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan (dtb__814, dtb__815, dtb__816, dtb__817, dtb__818) -> dtb__815
  | _ -> failwith "DT: impossible branch"
))) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan (dtb__819, dtb__820, dtb__821, dtb__822, dtb__823) -> dtb__822
  | _ -> failwith "DT: impossible branch"
)) sp)) sp) body)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__824, dtb__825) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__800, (Base_dList.C_Base_dList_dList_Cons (dtb__824, Base_dList.C_Base_dList_dList_Nil)))), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__802, dtb__825))))))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan (dtb__826, dtb__827, dtb__828, dtb__829, dtb__830) -> dtb__827
  | _ -> failwith "DT: impossible branch"
)), sp)), (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dUpdateAccessPlan_UpdateAccessPlan (dtb__831, dtb__832, dtb__833, dtb__834, dtb__835) -> dtb__835
  | _ -> failwith "DT: impossible branch"
), sp)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb))))
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel globals ctx ec value ty sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__836, dtb__837) -> (match dtb__837 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__838, dtb__839) -> ((fun tyVal -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__839) value) tyVal)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__840, dtb__841) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__840, (Base_dPair.C_Base_dPair_dPair_Pair (tyVal, dtb__841))))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__836))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel globals ctx ec name implicit qty dom cod sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__842, dtb__843) -> (match dtb__843 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__844, dtb__845) -> ((fun domVal -> ((fun isTypeDom -> ((fun isLinDom -> ((fun lvl -> ((fun ctx2 -> ((fun badQty -> ((fun badLinQty -> (if badQty then (if implicit then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_MultiplicityImplicit (name))) name) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_MultiplicityTypeDomain (name))) name)) else (if badLinQty then (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LinearTypeNeedsOne (name))) name) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx2) dtb__845) cod)) (fun pc -> ((fun nd_uscrut28 -> (match nd_uscrut28 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__846, dtb__847) -> (match dtb__847 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__848, dtb__849) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (name, implicit, (if isLinDom then Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 else (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfQty implicit) isTypeDom) qty)), dtb__842, dtb__846)), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__844) dtb__848))), dtb__849))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__850) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero dtb__850) then isLinDom else false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (match qty with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__851) -> (if implicit then true else isTypeDom)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__842) ctx))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disLinearType ec) domVal))) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeDomain domVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__842))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__852, dtb__853) -> (if (dtb__852 = "->") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__854, dtb__855) -> (match dtb__855 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__856, dtb__857) -> (match dtb__857 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) dtb__854) dtb__856) sp)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InvalidArrowType)
)) args) else (if (dtb__852 = "Type") then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__858, dtb__859) -> (match dtb__858 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__860, dtb__861) -> (match dtb__859 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__860 < 0) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__861) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UniverseLevelNonNegative) else (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__860))), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__860)))), ec)))))))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__853) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__853) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__853) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeLevelArg)
)) args) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__862, dtb__863) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__862) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__863) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__862)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__862))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__863))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__862) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__864) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__862) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__865) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__865))) args) sp) hint)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__866, dtb__867) -> (match dtb__867 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__868, dtb__869) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__869)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__862))) dtb__866), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__868, dtb__869))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__862) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__870) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__862) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__871) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__871))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__870)) args) sp) hint)) (fun pa -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__872, dtb__873) -> (match dtb__873 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__874, dtb__875) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__875)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__862))) dtb__872), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__874, dtb__875))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__862) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__876) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__876))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__863) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__862))) dtb__862)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
  | _ -> (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__877, dtb__878) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__877) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__878) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__877)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__877))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__878))) args) sp) hint))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__877) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__879) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__877) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__880) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__880))) args) sp) hint)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__881, dtb__882) -> (match dtb__882 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__883, dtb__884) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__884)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__877))) dtb__881), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__883, dtb__884))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__877) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__885) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__877) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__886) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__886))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__885)) args) sp) hint)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__887, dtb__888) -> (match dtb__888 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__889, dtb__890) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__890)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__877))) dtb__887), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__889, dtb__890))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__877) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__891) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__891))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__878) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__877))) dtb__877)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)
)) fn)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__892, dtb__893) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__892) args) sp)) (fun mspec -> (match mspec with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__894) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__894))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp) hint)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel globals ctx ec fn args sp hint -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__895, dtb__896) -> (match dtb__896 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__897, dtb__898) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__898) dtb__897) args) sp) hint)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__899, dtb__900) -> (match dtb__900 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__901, dtb__902) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__902)) dtb__895) dtb__899), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__901, dtb__902))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pf)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo 64) globals) ctx) ec) ty) args) sp) hint)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo = (fun fuel globals ctx ec ty args sp hint -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__903, dtb__904, dtb__905, dtb__906, dtb__907) -> (if dtb__904 then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__906) then (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__906) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__906) dtb__907) args) sp) hint) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__906) args) sp)) (fun ec0 -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__908) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__906)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__906) dtb__907) args) sp) hint) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__906)) then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__906) dtb__907) args) sp) hint) else (Base_dResult.C_Base_dResult_dResult_Err (dtb__908))))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__909) -> (match dtb__909 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__910, dtb__911) -> ((fun ty2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__911) ty2) args) sp) hint)) (fun q -> ((fun nd_uscrut24 -> (match nd_uscrut24 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__912, dtb__913) -> (match dtb__913 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__914, dtb__915) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__910, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), dtb__912)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__914, dtb__915))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__907) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__910)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__906)) sp))))) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec) dtb__906) then (match ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ec) dtb__906) with
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__916, dtb__917) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__917) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__907) dtb__916)) args) sp) hint)) (fun p -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__918, dtb__919) -> (match dtb__919 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__920, dtb__921) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__916), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__918)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__920, dtb__921))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Vuna_dCompiler_dElab_dDict.C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__922, dtb__923) -> ((fun ec2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__907) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__922))) args) sp) hint)) (fun p -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__924, dtb__925) -> (match dtb__925 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__926, dtb__927) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__922, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__924)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__926, dtb__927))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__923) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkRow) m) dtb__906) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))
  | _ -> failwith "DT: impossible branch"
) else (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__906) then (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__928, dtb__929) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__929) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__907) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__928))) args) sp) hint)) (fun p -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__930, dtb__931) -> (match dtb__931 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__932, dtb__933) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__928, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__930)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__932, dtb__933))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ImplicitParamKind)))) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, (Base_dPair.C_Base_dPair_dPair_Pair (forced, ec))))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__934, dtb__935) -> ((fun ec0 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain ec0) sp) dtb__903) dtb__905) dtb__906)) (fun argRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit ec0) dtb__906) dtb__934)) (fun a2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec0) a2) dtb__906)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__936, dtb__937) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__937) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__907) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__936))) dtb__935) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun q -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__938, dtb__939) -> (match dtb__939 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__940, dtb__941) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__936, argRig)), dtb__938)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__940, dtb__941))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))))) ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__942) -> (match dtb__942 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__943, dtb__944) -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint dtb__943) ctx) dtb__944) ec) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ec
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__945) -> dtb__945
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ec
  | _ -> failwith "DT: impossible branch"
)) hint))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, (Base_dPair.C_Base_dPair_dPair_Pair (forced, ec))))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__946, dtb__947) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__946)) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel globals ctx ec dom clo args sp hint -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__948, dtb__949) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__949) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__949) dom)) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__948))) args) sp) hint)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__950, dtb__951) -> (match dtb__951 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__952, dtb__953) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__948, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), dtb__950)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__952, dtb__953))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel globals ec ctx dom args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__954) -> (match ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (ec))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__955) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__956, dtb__957) -> (match dtb__957 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__954) dtb__955) args) sp)) (fun ecProbe -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__956) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ecProbe)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__958) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__956) Base_dList.C_Base_dList_dList_Nil) dtb__958) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__959) -> (Base_dResult.C_Base_dResult_dResult_Ok (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__959))))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__960) -> (Base_dResult.C_Base_dResult_dResult_Ok (ec))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__954) dtb__955) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__954) dtb__955) args) sp)
)) dtb__954)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel globals ec ctx argTy argKind args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (ec))
  | Base_dList.C_Base_dList_dList_Cons (dtb__961, dtb__962) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__963) -> (match dtb__963 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__964, dtb__965) -> (match dtb__965 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__966, dtb__967) -> ((fun forced -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__967) ctx) argTy) argKind) dtb__962) sp) else (if (((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__967) ctx) forced) argKind) then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__967) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__968) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__968))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__969) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__967) ctx) argTy) argKind) dtb__962) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__967) ctx) argTy) argKind) dtb__962) sp)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__967) dtb__966))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__970) -> (Base_dResult.C_Base_dResult_dResult_Ok (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__961))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName name) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__971, dtb__972) -> (match dtb__972 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__973, dtb__974) -> (match dtb__974 with
  | Base_dList.C_Base_dList_dList_Nil -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__971) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__975, dtb__976) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__976) dtb__973) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__977, dtb__978) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__975) dtb__977), dtb__978))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__971) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__979, dtb__980) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__980) dtb__973) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__981, dtb__982) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__979) dtb__981), dtb__982))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy ec) expected) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__971) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__983, dtb__984) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__984) dtb__973) v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__985, dtb__986) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 name) dtb__983) dtb__985), dtb__986))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__987, dtb__988) -> (match dtb__988 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__989, dtb__990) -> (match dtb__990 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__987)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__991, dtb__992) -> (match dtb__992 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__993, dtb__994) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__994) dtb__989)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__995, dtb__996) -> (match dtb__996 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__997, dtb__998) -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__998) dtb__993) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__998) dtb__997) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__991) dtb__995), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__998)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__998) dtb__993) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__998) dtb__997) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__991) dtb__995), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__998)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__998) dtb__993) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__998) dtb__997) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2 name) dtb__991) dtb__995), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue, dtb__998)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__998) dtb__993) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__998) dtb__997) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__989) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__999) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__989)) dtb__999)) (fun bNat -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__991) bNat), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__998))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__991)) dtb__995), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__998))))))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__998) dtb__993) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__998) dtb__997) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__987) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1000) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__987)) dtb__1000)) (fun aNat -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) aNat) dtb__995), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__998))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__991) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__995)), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__998))))))))
  | _ -> failwith "DT: impossible branch"
) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1001) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit ec) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))) dtb__1001) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead expr) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock expr) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1002) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel (fuel - 1)) globals) ctx) ec) dtb__1002) expected)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1003) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__1003))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) (v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback dtb__1002)) expected)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain fuel) globals) ctx) ec) expr) expected))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__1004, dtb__1005, dtb__1006) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1005)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1007, dtb__1008) -> (match dtb__1008 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1009, dtb__1010) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1010) dtb__1004) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__1007))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1011, dtb__1012) -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor dtb__1011) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats ec) ctx) expected) dtb__1011)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1013, dtb__1014) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dMatch.v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable dtb__1014)) dtb__1013)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1014) bodyExpr) expected)))
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__1011, dtb__1012)))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1015, dtb__1016, dtb__1017, dtb__1018) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel (fuel - 1)) globals) ctx) ec) dtb__1015) dtb__1016) dtb__1017) expected) dtb__1018)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1019, dtb__1020, dtb__1021) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) ec) dtb__1019) dtb__1020) expected) dtb__1021)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__1022, dtb__1023, dtb__1024, dtb__1025) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__1026, dtb__1027, dtb__1028, dtb__1029, dtb__1030, dtb__1031) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1032, dtb__1033, dtb__1034) -> (match dtb__1032 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1035, dtb__1036) -> (if (dtb__1035 = "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__1035 = "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__1032) dtb__1033) expected) dtb__1034)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__1032) dtb__1033) expected) dtb__1034)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__1037, dtb__1038, dtb__1039) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (fuel - 1)) globals) ctx) ec) dtb__1037) dtb__1038) expected) dtb__1039)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__1040, dtb__1041) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1042, dtb__1043) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1044) -> (match dtb__1044 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1045, dtb__1046) -> (match dtb__1046 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1045 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatTypeName) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__1040)), ec)))) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1047) -> (match dtb__1047 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1048, dtb__1049) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1049) dtb__1048) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1041)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1050) -> (match dtb__1050 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1051, dtb__1052) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1052) dtb__1051) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1041))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1053) -> (match dtb__1053 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1054, dtb__1055) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1055) dtb__1054) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1041))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1056) -> (match dtb__1056 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1057, dtb__1058) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1058) dtb__1057) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName) expr) expected) dtb__1041))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__1059, dtb__1060) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1061, dtb__1062) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1063) -> (match dtb__1063 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1064, dtb__1065) -> (match dtb__1065 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1064 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__1059)), ec)))) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1066) -> (match dtb__1066 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1067, dtb__1068) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1068) dtb__1067) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1060)))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1069) -> (match dtb__1069 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1070, dtb__1071) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1071) dtb__1070) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1060))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1072) -> (match dtb__1072 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1073, dtb__1074) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1074) dtb__1073) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1060))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1075) -> (match dtb__1075 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1076, dtb__1077) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1077) dtb__1076) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName) expr) expected) dtb__1060))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__1078, dtb__1079) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1080, dtb__1081) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__1082) -> (match dtb__1082 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1083, dtb__1084) -> (match dtb__1084 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__1083 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult dtb__1079) dtb__1078)) (fun t -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (t, ec)))))) else (if (dtb__1083 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1085) -> (match dtb__1085 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1086, dtb__1087) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1087) dtb__1086) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1079))))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1088) -> (match dtb__1088 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1089, dtb__1090) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1090) dtb__1089) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1079))
)
  | _ -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1091) -> (match dtb__1091 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1092, dtb__1093) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1093) dtb__1092) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1079))
)
  | _ -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1094) -> (match dtb__1094 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1095, dtb__1096) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1096) dtb__1095) expected)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower globals) ctx) ec) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName) expr) expected) dtb__1079))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1097, dtb__1098) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disHoleName dtb__1097) then ((fun pmeta -> (match pmeta with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1099, dtb__1100) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1099, dtb__1100))))
  | _ -> failwith "DT: impossible branch"
)) (((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta ctx) ec) dtb__1098) expected) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf dtb__1097))) else (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1097) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1098) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1097)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1097))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1098))) Base_dList.C_Base_dList_dList_Nil) expected) dtb__1098))) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1097, dtb__1098))) Base_dList.C_Base_dList_dList_Nil) expected) dtb__1098)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) expr)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel globals ctx ec binds body rec_u expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dTerm_dSupport.v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1101, dtb__1102) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__1101) dtb__1102) mc5) mc6) mc7) mc8))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel globals ctx ec bind rest body rec_u expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match (Base_dPair.v_Base_dPair_dfirstOf bind) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1103, dtb__1104) -> ((fun value -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1105, dtb__1106) -> (match dtb__1106 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1107, dtb__1108) -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx2) dtb__1108) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1109, dtb__1110) -> ((fun bodyTerm2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__1103, rig, bodyTerm2)), dtb__1105, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__1110))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1110) ctx) dtb__1107) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1109) else dtb__1109))
  | _ -> failwith "DT: impossible branch"
)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1103) dtb__1107) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1107))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bind))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1111) -> ((fun value -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1112, dtb__1113) -> (match dtb__1113 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1114, dtb__1115) -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) dtb__1115) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1116, dtb__1117) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1116))), dtb__1112, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), dtb__1117))))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1114))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (Base_dPair.v_Base_dPair_dsecondOf bind))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Base_dPair.v_Base_dPair_dsecondOf bind), (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf bind), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (rest, body, rec_u, sp)))), Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (Base_dPair.v_Base_dPair_dfirstOf bind))))) expected)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1118, dtb__1119) -> (match dtb__1118 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1120, dtb__1121) -> (match dtb__1120 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__1122, dtb__1123) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__1122) dtb__1121) dtb__1119) body) rec_u) sp)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__1124) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__1121) dtb__1119) body) rec_u) sp)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__1121, (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1120, (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__1119, body, rec_u, sp)))), Base_dList.C_Base_dList_dList_Nil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__1120))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel globals ctx ec name value rest body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1125, dtb__1126) -> (match dtb__1126 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1127, dtb__1128) -> ((fun rig -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx2) dtb__1128) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1129, dtb__1130) -> (match dtb__1130 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1131, dtb__1132) -> ((fun bodyTerm2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (name, rig, bodyTerm2)), dtb__1125, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__1131, dtb__1132))))))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1132) ctx) dtb__1127) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1129) else dtb__1129))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__1127) ctx))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1127))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel globals ctx ec value rest body rec_u sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1133, dtb__1134) -> (match dtb__1134 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1135, dtb__1136) -> ((fun rig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) dtb__1136) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1137, dtb__1138) -> (match dtb__1138 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1139, dtb__1140) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam ("_", rig, (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__1137))), dtb__1133, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__1139, dtb__1140))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue ec) dtb__1135))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1141, dtb__1142, dtb__1143) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__1141) dtb__1142) dtb__1143) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)), expected)))))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel fuel) globals) ctx) ec) expr)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1144) -> (match dtb__1144 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1145, dtb__1146) -> (match dtb__1146 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1147, dtb__1148) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1148) expected) dtb__1147) dtb__1145) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1149) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1149, ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1148)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1148) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1147) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1150) -> (match (((v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel dtb__1148) expected) dtb__1147) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1151) -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnhandledEffects (dtb__1151))) dtb__1151)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [(Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)); ": "; dtb__1150])))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1152) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1145, ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1152)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1153) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__1153))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint (fuel - 1)) globals) ctx) ec) expr) expected))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1154, dtb__1155) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun forced -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__1156, dtb__1157) -> (match dtb__1157 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun lvl -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc2) mc3) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1158, dtb__1159) -> ((fun domVal -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc2) dtb__1159) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1160, dtb__1161) -> ((fun piVal -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__1161)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__1161)) lvl) dtb__1156) Base_dList.C_Base_dList_dList_Nil) piVal) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1162) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) mc2) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__1161) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__1162))) (Base_dList.C_Base_dList_dList_Cons (dtb__1154, dtb__1155))) mc5) piVal) mc7)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1163) -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi ("_", false, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, domVal, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (Base_dList.C_Base_dList_dList_Nil, dtb__1160)))))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc2) dtb__1158))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__1164, dtb__1165, dtb__1166, dtb__1167, dtb__1168) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain mc3) mc7) dtb__1154) dtb__1166) dtb__1167)) (fun lamRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__1155) mc5) expected2) mc7)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1169, dtb__1170) -> ((fun inner2 -> ((fun binderName -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (binderName, lamRig, inner2)), dtb__1170))))) (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear mc3) mc2) then (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear mc3) ctx2) dtb__1169) then (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dlinClosureName mc7) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2)) dtb__1154) else dtb__1154) else dtb__1154))) (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn dtb__1170) mc2) dtb__1167) then ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses (Base_dList.C_Base_dList_dList_Cons (0, Base_dList.C_Base_dList_dList_Nil))) dtb__1169) else dtb__1169))
  | _ -> failwith "DT: impossible branch"
)))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__1168) v))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1154) dtb__1167) mc2))) ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__1164) lvl))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_LambdaTooManyParams)
)) forced)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1171, dtb__1172, dtb__1173) -> (match dtb__1171 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1174, dtb__1175) -> (if (if (dtb__1174 = "->") then true else (dtb__1174 = "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1174) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1176) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1174) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1174) dtb__1172) dtb__1175) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1177) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1178) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__1178))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1179, dtb__1180) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1179) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1181) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__1179) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1182) -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1182))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1183) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1179)), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__1183, ec))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)) expr)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun p -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1184, dtb__1185) -> (match dtb__1185 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1186, dtb__1187) -> ((fun forced -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1188) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1184, (Base_dPair.C_Base_dPair_dPair_Pair (dtb__1188, dtb__1187))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ExpectedType (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1186)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1186))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1187) dtb__1186))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1189, dtb__1190) -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName dtb__1189) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor ec) dtb__1190) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (expected))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort dtb__1189)) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets dtb__1189))) (fun t -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (t, dtb__1190))) args) expected) sp))) else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__1189) ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1191) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor ec) dtb__1189) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1192) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1192) args) expected) dtb__1190)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1189) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__1189) args) expected) dtb__1190) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1189) args) expected) sp) dtb__1190))
  | _ -> failwith "DT: impossible branch"
) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel fuel) globals) ctx) ec) fn) dtb__1189) args) expected) sp) dtb__1190))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel = (fun fuel globals ctx ec fn name args expected sp vsp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1193) -> (match dtb__1193 with
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VEDef (dtb__1194) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | Vuna_dCompiler_dElab_dMeta.C_Vuna_dCompiler_dElab_dMeta_dValueEntry_VECtor (dtb__1195) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel (fuel - 1)) globals) ctx) ec) name) args) expected) vsp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) name))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1196, dtb__1197) -> (match dtb__1197 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1198, dtb__1199) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1199) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1198)))) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1196, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1200) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1200)) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1201, dtb__1202) -> (match dtb__1202 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1203, dtb__1204) -> (match (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1204) dtb__1203)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1205) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1201), (Base_dPair.C_Base_dPair_dPair_Pair (dtb__1205, dtb__1204))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disEqMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1206, dtb__1207) -> (match dtb__1207 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1208, dtb__1209) -> (match dtb__1209 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1206)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1210, dtb__1211) -> (match dtb__1211 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1212, dtb__1213) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1213) dtb__1208)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1214, dtb__1215) -> (match dtb__1215 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1216, dtb__1217) -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1217) dtb__1212) dtb__1216) dtb__1210) dtb__1214) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1218) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1218))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1218))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__1218))) dtb__1217)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1217) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1212) dtb__1216)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__1210) dtb__1214) sp) dtb__1212) ec3)))
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
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_disCmpMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1219, dtb__1220) -> (match dtb__1220 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1221, dtb__1222) -> (match dtb__1222 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1219)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1223, dtb__1224) -> (match dtb__1224 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1225, dtb__1226) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__1226) dtb__1221)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1227, dtb__1228) -> (match dtb__1228 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1229, dtb__1230) -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__1230) dtb__1225) dtb__1229) dtb__1223) dtb__1227) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1231) -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1231))) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__1231))) sp) (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dfirstOf dtb__1231))) dtb__1230)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1230) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__1225) dtb__1229)) (fun ec3 -> ((((((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__1223) dtb__1227) sp) dtb__1225) ec3)))
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
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpMethodName) then (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp (fuel - 1)) globals) ctx) ec) name) args) sp) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1232) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1232))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1233) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1233))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r3 -> (match r3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1234) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1234))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1235, dtb__1236) -> (match dtb__1236 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__1235)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1237, dtb__1238) -> (match dtb__1238 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1239, dtb__1240) -> ((fun tyv -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue tyv) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1237, (Base_dPair.C_Base_dPair_dPair_Pair (tyv, dtb__1240)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__1240) tyv) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1240) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName)) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm dtb__1237), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue, dtb__1240)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__1240) tyv) then (Base_dBool.v_Base_dBool_dnot ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance dtb__1240) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)) else false) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__1237)), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue, dtb__1240)))))))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy dtb__1240) tyv) then (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm dtb__1237), (Base_dPair.C_Base_dPair_dPair_Pair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue, dtb__1240)))))))) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__1240) dtb__1239))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) args)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (if (if (name = "&&") then true else (name = "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1241, dtb__1242) -> (match dtb__1242 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1243, dtb__1244) -> (match dtb__1244 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__1241) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))))) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1245, dtb__1246) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1246) dtb__1243) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))))) (fun pb -> (match pb with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1247, dtb__1248) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__1245) dtb__1247), (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))), dtb__1248))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)
  | _ -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NeedsTwoArgs (name))) name)
)) args) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match fn with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1249, dtb__1250) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel (fuel - 1)) globals) ctx) ec) dtb__1249) args) expected) sp)) (fun arith -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__1249) args) sp)) (fun mspec -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1251) -> (match dtb__1251 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1252, dtb__1253) -> (match dtb__1253 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1254, dtb__1255) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1255) expected) dtb__1254) dtb__1252) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1256) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1256, dtb__1255))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1255) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1254)) (fun ec2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1252, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mspec)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1257) -> (match dtb__1257 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1258, dtb__1259) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1258, dtb__1259))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) arith)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (fn, args, sp))) expected)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1260) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__1260))) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1261, dtb__1262) -> (match dtb__1262 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1263, dtb__1264) -> ((fun ctorTerm -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1264) expected) dtb__1263) ctorTerm) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1265) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1265, dtb__1264))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1264) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1263) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1266) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1266)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1261), dtb__1266))))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1267) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), dtb__1267))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) dtb__1267)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1264)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) dtb__1261))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1268) -> (match dtb__1268 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1269, dtb__1270) -> (match dtb__1270 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1271, dtb__1272) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__1272) dtb__1271) args) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1273, dtb__1274) -> (match dtb__1274 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1275, dtb__1276) -> ((fun allArgs -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__1276) expected) dtb__1275) (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1276)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1277) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1277, dtb__1276))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1276) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1275) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1278) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__1278)) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (name))) allArgs), dtb__1278))))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1279) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CtorError ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name), dtb__1279))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName name)) dtb__1279)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend dtb__1269) dtb__1273))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs ec) ctx) dtb__1260) expected))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain = (fun fuel globals ctx ec plan steps last -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1280, dtb__1281) -> (match dtb__1280 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChainStep_DoChainStep (dtb__1282, dtb__1283, dtb__1284) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1285, dtb__1286) -> ((fun aVal -> ((fun mArgTy -> ((fun ctx2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1286) dtb__1284) "_") (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1287, dtb__1288, dtb__1289, dtb__1290, dtb__1291, dtb__1292, dtb__1293, dtb__1294, dtb__1295, dtb__1296) -> dtb__1293
  | _ -> failwith "DT: impossible branch"
)) mArgTy)) (fun argRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__1286) dtb__1283) mArgTy)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1297, dtb__1298) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain dtb__1298) dtb__1284) dtb__1282) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1299, dtb__1300, dtb__1301, dtb__1302, dtb__1303, dtb__1304, dtb__1305, dtb__1306, dtb__1307, dtb__1308) -> dtb__1307
  | _ -> failwith "DT: impossible branch"
)) aVal)) (fun lamRig -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx2) dtb__1298) plan) dtb__1281) last)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1309, dtb__1310) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm dtb__1298) dtb__1310) ctx) dtb__1284) plan) dtb__1282) aVal) dtb__1297) argRig) lamRig) dtb__1309), dtb__1310))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__1282) aVal) ctx))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1311, dtb__1312, dtb__1313, dtb__1314, dtb__1315, dtb__1316, dtb__1317, dtb__1318, dtb__1319, dtb__1320) -> dtb__1314
  | _ -> failwith "DT: impossible branch"
)) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1285))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) last) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1321, dtb__1322, dtb__1323, dtb__1324, dtb__1325, dtb__1326, dtb__1327, dtb__1328, dtb__1329, dtb__1330) -> dtb__1324
  | _ -> failwith "DT: impossible branch"
)) (match plan with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1331, dtb__1332, dtb__1333, dtb__1334, dtb__1335, dtb__1336, dtb__1337, dtb__1338, dtb__1339, dtb__1340) -> dtb__1335
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) steps)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel = (fun fuel globals ctx ec chain expected -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1341) -> (match dtb__1341 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1342, dtb__1343) -> (match dtb__1343 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1344, dtb__1345) -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1346, dtb__1347) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) dtb__1347) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1348, dtb__1349) -> ((fun mVal -> ((fun aVal -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1349) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1350, dtb__1351, dtb__1352, dtb__1353) -> dtb__1353
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1354, dtb__1355, dtb__1356, dtb__1357) -> dtb__1354
  | _ -> failwith "DT: impossible branch"
)) dtb__1342) dtb__1344) dtb__1345) mVal) aVal)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1358) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (match dtb__1358 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1359, dtb__1360, dtb__1361, dtb__1362, dtb__1363, dtb__1364, dtb__1365, dtb__1366, dtb__1367, dtb__1368) -> dtb__1368
  | _ -> failwith "DT: impossible branch"
)) dtb__1358) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1369, dtb__1370, dtb__1371, dtb__1372) -> dtb__1370
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1373, dtb__1374, dtb__1375, dtb__1376) -> dtb__1375
  | _ -> failwith "DT: impossible branch"
))) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1377, dtb__1378) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1378) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue (match dtb__1358 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1379, dtb__1380, dtb__1381, dtb__1382, dtb__1383, dtb__1384, dtb__1385, dtb__1386, dtb__1387, dtb__1388) -> dtb__1382
  | _ -> failwith "DT: impossible branch"
)) (match dtb__1358 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1389, dtb__1390, dtb__1391, dtb__1392, dtb__1393, dtb__1394, dtb__1395, dtb__1396, dtb__1397, dtb__1398) -> dtb__1393
  | _ -> failwith "DT: impossible branch"
)))) (fun ec4 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1377, ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) ec4)))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1348))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1346))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1399) -> (match dtb__1399 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1400, dtb__1401) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) ec) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1402, dtb__1403, dtb__1404, dtb__1405) -> dtb__1405
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1406, dtb__1407, dtb__1408, dtb__1409) -> dtb__1406
  | _ -> failwith "DT: impossible branch"
)) dtb__1342) dtb__1344) dtb__1345) dtb__1400) dtb__1401)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1410) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (match dtb__1410 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1411, dtb__1412, dtb__1413, dtb__1414, dtb__1415, dtb__1416, dtb__1417, dtb__1418, dtb__1419, dtb__1420) -> dtb__1420
  | _ -> failwith "DT: impossible branch"
)) dtb__1410) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1421, dtb__1422, dtb__1423, dtb__1424) -> dtb__1422
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1425, dtb__1426, dtb__1427, dtb__1428) -> dtb__1427
  | _ -> failwith "DT: impossible branch"
))) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1429, dtb__1430) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1429, ((Vuna_dCompiler_dElab_dDict.v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__1430)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected ec) expected))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1431, dtb__1432, dtb__1433, dtb__1434) -> dtb__1431
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel = (fun fuel globals ctx ec chain -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1435) -> (match dtb__1435 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1436, dtb__1437) -> (match dtb__1437 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1438, dtb__1439) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1440, dtb__1441) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) dtb__1441) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1442, dtb__1443) -> ((fun mVal -> ((fun aVal -> ((fun resultTy -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock (fuel - 1)) globals) ctx) dtb__1443) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1444, dtb__1445, dtb__1446, dtb__1447) -> dtb__1447
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1448, dtb__1449, dtb__1450, dtb__1451) -> dtb__1448
  | _ -> failwith "DT: impossible branch"
)) dtb__1436) dtb__1438) dtb__1439) mVal) aVal)) (fun mp -> (match mp with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1452) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain (fuel - 1)) globals) ctx) (match dtb__1452 with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoPlan_DoPlan (dtb__1453, dtb__1454, dtb__1455, dtb__1456, dtb__1457, dtb__1458, dtb__1459, dtb__1460, dtb__1461, dtb__1462) -> dtb__1462
  | _ -> failwith "DT: impossible branch"
)) dtb__1452) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1463, dtb__1464, dtb__1465, dtb__1466) -> dtb__1464
  | _ -> failwith "DT: impossible branch"
)) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1467, dtb__1468, dtb__1469, dtb__1470) -> dtb__1469
  | _ -> failwith "DT: impossible branch"
))) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1471, dtb__1472) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__1471, (Base_dPair.C_Base_dPair_dPair_Pair (resultTy, dtb__1472))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue mVal) aVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1442))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__1440))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf globals) ctx) ec) (match chain with
  | C_Vuna_dCompiler_dElab_dTerm_dImpl_dDoChain_DoChain (dtb__1473, dtb__1474, dtb__1475, dtb__1476) -> dtb__1473
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind = (fun globals ctx ec expr expected sp -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__1477) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel 256) globals) ctx) ec) expr)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf p))))))))
  | _ -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__1478, dtb__1479, dtb__1480) -> (match dtb__1478 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1481, dtb__1482) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1481) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1481) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1481))) dtb__1481)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1483) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel 256) globals) ctx) ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1483)) dtb__1479) sp) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) (fun pa -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1484, dtb__1485) -> (match dtb__1485 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__1486, dtb__1487) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__1487) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__1486) with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__1488) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1481))) dtb__1484), dtb__1488))))
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__1489) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatch ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected), (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1486)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue expected)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__1486))
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
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__1490, dtb__1491) -> (if (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__1490) then (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__1490) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_UnknownName (dtb__1490))) dtb__1490)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__1492) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__1492))) (fun ec1 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__1490)), ec1))))))
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) globals) ctx) ec) expr) expected)
)) expr)
))
