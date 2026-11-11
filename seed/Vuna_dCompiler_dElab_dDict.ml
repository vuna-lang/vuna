open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDict_dInstMatch = { f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dDict_dRowProofKind = C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofYes | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofNo | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofUnknown
and t_Vuna_dCompiler_dElab_dDict_dMemberLookup = C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous of (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDict_dMemberDom = C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dDict_dDictTermTask = C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec g -> ((Base_dList.v_Base_dList_dmemName g) ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec))))

let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily mc0) dtb__1)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dinstMatchInst = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst = dtb__3; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm = dtb__4 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dfindClass = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__5) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5)) else ((v_Vuna_dCompiler_dElab_dDict_dfindClass mc0) dtb__6))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfamOfClass = (fun ec cn -> (match ((v_Vuna_dCompiler_dElab_dDict_dfindClass cn) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__7))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_danyViaClassFam = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match ((v_Vuna_dCompiler_dElab_dDict_dfamOfClass mc0) dtb__8) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (if (dtb__10 = mc1) then true else (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam mc0) mc1) dtb__9))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam mc0) mc1) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam = (fun ec d fam -> (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam ec) fam) (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses))

let rec v_Vuna_dCompiler_dElab_dDict_dapplyDataPis = (fun ec n v args -> (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v)) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> ((((v_Vuna_dCompiler_dElab_dDict_dapplyDataPis ec) (n - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__17) dtb__11)) dtb__12)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dviaFieldType = (fun ec d c args -> (if ((Base_dList.v_Base_dList_dlength args) <> (Base_dList.v_Base_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dElab_dDict_dapplyDataPis ec) (Base_dList.v_Base_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) args) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__18) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape = (fun ec d wargs -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))) then (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> ((((v_Vuna_dCompiler_dElab_dDict_dviaFieldType ec) d) dtb__24) wargs)
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

let v_Vuna_dCompiler_dElab_dDict_dviaWrapperData = (fun ec fam w wargs -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData w) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (if (((v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam ec) dtb__26) fam) then (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape ec) dtb__26) wargs) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf = (fun ec fam arg -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> ((((v_Vuna_dCompiler_dElab_dDict_dviaWrapperData ec) fam) dtb__28) dtb__29)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) arg)))

let rec v_Vuna_dCompiler_dElab_dDict_danyViaWrapper = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (match (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf mc0) mc1) dtb__30) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dDict_danyViaWrapper mc0) mc1) dtb__31)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__33) -> (match dtb__33 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__34, dtb__35) -> (((v_Vuna_dCompiler_dElab_dDict_danyViaWrapper ec) dtb__34) dtb__35)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let rec v_Vuna_dCompiler_dElab_dDict_dreplaceAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList_Cons (mc1, dtb__37)) else (Base_dList.C_Base_dList_dList_Cons (dtb__36, (((v_Vuna_dCompiler_dElab_dDict_dreplaceAt (mc0 - 1)) mc1) dtb__37))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dspecificInstances = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__38) then (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__39) else (Base_dList.C_Base_dList_dList_Cons (dtb__38, (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__39))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dblanketInstances = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__40) then (Base_dList.C_Base_dList_dList_Cons (dtb__40, (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__41))) else (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__41))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue = (fun ec v -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))))

let rec v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> ((fun v -> (if ((v_Vuna_dCompiler_dElab_dDict_disDictValue mc3) v) then (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc3)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) 0) v) mc2) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__46) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__44, mc1, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__46)) }))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__47) -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc1) dtb__45)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup = (fun ctx i dom ec -> (match (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo ctx) i) dom) ec) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)
))

let v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__48) -> (match dtb__48 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__49, dtb__50) -> dtb__49
  | _ -> ""
)
  | _ -> ""
))

let v_Vuna_dCompiler_dElab_dDict_dsearchCandidates = (fun ec dom -> ((fun fam -> (if (fam = "") then (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) fam))) (v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

let v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__51) -> dtb__51
  | _ -> ""
))

let v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> (match dtb__52 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__53; Base_dPair.f_Base_dPair_dPair_second = dtb__54 } -> (match dtb__54 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__55))
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ""
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))

let rec v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__57)) then ((v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName dtb__57) = mc0) else false) then true else ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo mc0) dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance = (fun ec tyName -> ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo tyName) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName))))

let v_Vuna_dCompiler_dElab_dDict_disMonoInst = (fun i -> (match (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele with
  | Base_dList.C_Base_dList_dList_Nil -> (match (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dDict_dallInstancesMono = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (if (v_Vuna_dCompiler_dElab_dDict_disMonoInst dtb__59) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono dtb__60) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dallocMetaAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMetaAt dtb__61) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dtermMetaId = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__62) -> dtb__62
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocMetaAt mc0) mc1) mc2) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__65; Base_dPair.f_Base_dPair_dPair_second = dtb__66 } -> (match ((((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas mc0) mc1) dtb__66) dtb__64) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__67; Base_dPair.f_Base_dPair_dPair_second = dtb__68 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dDict_dtermMetaId dtb__65), dtb__67)); Base_dPair.f_Base_dPair_dPair_second = dtb__68 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__69) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71) -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas mc0) dtb__70) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_drowMemDomName = "Base.Eff.rowMem"

let v_Vuna_dCompiler_dElab_dDict_drowYesDomName = "Base.Eff.Yes"

let v_Vuna_dCompiler_dElab_dDict_drowNoDomName = "Base.Eff.No"

let v_Vuna_dCompiler_dElab_dDict_drowYesCtorName = "Base.Eff.Yes.MkYes"

let v_Vuna_dCompiler_dElab_dDict_dmemberDomName = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMemberFamilyName

let v_Vuna_dCompiler_dElab_dDict_dhereCtorName = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMemberHereCtor

let v_Vuna_dCompiler_dElab_dDict_dthereCtorName = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffMemberThereCtor

let v_Vuna_dCompiler_dElab_dDict_disMemberDomain = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__73, dtb__74, dtb__75) -> (match dtb__73 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__76, dtb__77, dtb__78) -> (match dtb__76 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__79, dtb__80, dtb__81) -> (match dtb__79 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__82) -> (dtb__82 = v_Vuna_dCompiler_dElab_dDict_dmemberDomName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dom)))

let v_Vuna_dCompiler_dElab_dDict_dmemberSpine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__83) -> (match dtb__83 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__84, dtb__85) -> (if (dtb__84 = v_Vuna_dCompiler_dElab_dDict_dmemberDomName) then (if ((Base_dList.v_Base_dList_dlength dtb__85) = 3) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 (dtb__86, dtb__88, dtb__90))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__85) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))

let v_Vuna_dCompiler_dElab_dDict_dctorValue = (fun ec name vals -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__92), vals))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (name, vals))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dnamedRowScan = (fun fuel sols ec eF rF -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__93, dtb__94) -> (if (dtb__93 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = true })) else (if (dtb__93 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (match dtb__96 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) dtb__97) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__101) -> (if dtb__101 then ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__102) -> (match dtb__102 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__103; Base_dPair.f_Base_dPair_dPair_second = dtb__104 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__97), dtb__103)); Base_dPair.f_Base_dPair_dPair_second = dtb__104 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dnamedRowScan (fuel - 1)) sols) ec) eF) dtb__99)) else (((((v_Vuna_dCompiler_dElab_dDict_dnamedRowScan (fuel - 1)) sols) ec) eF) dtb__99))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel 64) eF) dtb__97)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__94) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__105) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = false }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

let rec v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowUnique = (fun fuel depth ec nF eF rF -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__106, dtb__107) -> (if (dtb__106 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent else (if (dtb__106 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match dtb__109 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (match dtb__111 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114) -> (if dtb__114 then (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) nF) dtb__108) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__115) -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound ((((v_Vuna_dCompiler_dElab_dDict_dctorValue dtb__115) v_Vuna_dCompiler_dElab_dDict_dhereCtorName) (Base_dList.C_Base_dList_dList_Cons (nF, (Base_dList.C_Base_dList_dList_Cons (eF, (Base_dList.C_Base_dList_dList_Cons (dtb__112, Base_dList.C_Base_dList_dList_Nil))))))), dtb__115))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__116) -> (match ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowUnique (fuel - 1)) depth) ec) nF) eF) dtb__112) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__117, dtb__118) -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound ((((v_Vuna_dCompiler_dElab_dDict_dctorValue dtb__118) v_Vuna_dCompiler_dElab_dDict_dthereCtorName) (Base_dList.C_Base_dList_dList_Cons (nF, (Base_dList.C_Base_dList_dList_Cons (eF, (Base_dList.C_Base_dList_dList_Cons (dtb__108, (Base_dList.C_Base_dList_dList_Cons (dtb__110, (Base_dList.C_Base_dList_dList_Cons (dtb__112, (Base_dList.C_Base_dList_dList_Cons (dtb__117, Base_dList.C_Base_dList_dList_Nil))))))))))))), dtb__118))
  | dtb__119 -> dtb__119
)
  | _ -> failwith "DT: impossible branch"
) else (match ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowUnique (fuel - 1)) depth) ec) nF) eF) dtb__112) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__120, dtb__121) -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound ((((v_Vuna_dCompiler_dElab_dDict_dctorValue dtb__121) v_Vuna_dCompiler_dElab_dDict_dthereCtorName) (Base_dList.C_Base_dList_dList_Cons (nF, (Base_dList.C_Base_dList_dList_Cons (eF, (Base_dList.C_Base_dList_dList_Cons (dtb__108, (Base_dList.C_Base_dList_dList_Cons (dtb__110, (Base_dList.C_Base_dList_dList_Cons (dtb__112, (Base_dList.C_Base_dList_dList_Cons (dtb__120, Base_dList.C_Base_dList_dList_Nil))))))))))))), dtb__121))
  | dtb__122 -> dtb__122
))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel 64) eF) dtb__110))
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)) dtb__107) else C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck))
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)))

let rec v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowGreedy = (fun fuel depth ec nF eF rF -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__123, dtb__124) -> (if (dtb__123 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent else (if (dtb__123 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (match dtb__126 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) eF) dtb__127) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__131) -> ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowGreedy (fuel - 1)) depth) ec) nF) eF) dtb__129)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__132) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__132) depth) nF) dtb__125) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__133) -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound ((((v_Vuna_dCompiler_dElab_dDict_dctorValue dtb__133) v_Vuna_dCompiler_dElab_dDict_dhereCtorName) (Base_dList.C_Base_dList_dList_Cons (nF, (Base_dList.C_Base_dList_dList_Cons (eF, (Base_dList.C_Base_dList_dList_Cons (dtb__129, Base_dList.C_Base_dList_dList_Nil))))))), dtb__133))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__134) -> ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowGreedy (fuel - 1)) depth) ec) nF) eF) dtb__129)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)) dtb__124) else C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck))
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
)))

let v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow = (fun fuel depth ec nVal eVal rVal -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun nF -> ((fun eF -> ((fun sols -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) eF) then ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowGreedy fuel) depth) ec) nF) eF) rVal) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__135) -> (match dtb__135 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__136; Base_dPair.f_Base_dPair_dPair_second = dtb__137 } -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Nil -> (if dtb__137 then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent else C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck)
  | _ -> (if (if ((Base_dList.v_Base_dList_dlength dtb__136) >= 2) then ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) nF) else false) then (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__136)) else ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowUnique (fuel - 1)) depth) ec) nF) eF) rVal))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dnamedRowScan 64) sols) ec) eF) rVal)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) eVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) nVal))))

let v_Vuna_dCompiler_dElab_dDict_dmemberLookup = (fun fuel depth ec dom -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> (match dtb__138 with
  | C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 (dtb__139, dtb__140, dtb__141) -> ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow fuel) depth) ec) dtb__139) dtb__140) dtb__141)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_dmemberSpine dom))))

let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (match dtb__142 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__144; Base_dPair.f_Base_dPair_dPair_second = dtb__145 } -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__145) = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__144, mc1, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })))) else (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo dtb__143) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm = (fun ctx ec dom -> (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom))))

let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__146, dtb__147) -> (match dtb__146 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__148; Base_dPair.f_Base_dPair_dPair_second = dtb__149 } -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc0) dtb__149)) mc4) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__150) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__148, mc2, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = dtb__150 }))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__151) -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo mc0) dtb__147) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify = (fun ctx ec dom -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo ctx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) ec) dom))

let v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta = (fun ec m v -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Nil) v) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__152) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__152))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__153) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__153))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__154) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun p -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)) (dtb__154).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)) ((Base_dList.v_Base_dList_dmap (fun t -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)) (dtb__154).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx)))) else ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo mc0) dtb__155))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst = (fun ec g -> ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dpiRigs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> (Base_dList.C_Base_dList_dList_Cons (dtb__158, (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__160)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst ec) g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__161) -> dtb__161
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__162) -> (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__162)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt = (fun fuel ec depth task -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine (dtb__163, dtb__164, dtb__165) -> (match dtb__164 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__166, dtb__167) -> ((fun argTerm -> ((fun r -> ((fun restRigs -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__163, argTerm, r)), dtb__167, restRigs)))) (match dtb__165 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> dtb__169
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (match dtb__165 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> dtb__170
  | Base_dList.C_Base_dList_dList_Nil -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> failwith "DT: impossible branch"
))) (match ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (dtb__166))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172) -> dtb__172
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__166)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (dtb__173) -> (match dtb__173 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__174) -> (match dtb__174 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__175, dtb__176) -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__175)), dtb__176, ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__175))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__173) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__177) -> (match dtb__177 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__178, dtb__179) -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__178)), dtb__179, ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__178))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)) task)))

let v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt = (fun ec depth v -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt 64) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (v))))

let rec v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__180, dtb__181, dtb__182) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__180), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__181), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__182)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__183, dtb__184) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__183), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt mc0) mc1) alt))) dtb__184)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__185, dtb__186) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__185, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__186)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__187, dtb__188) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__187, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__188)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__189, dtb__190) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__189, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__190)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__191, dtb__192, dtb__193) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__191), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__192), dtb__193))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__194, dtb__195, dtb__196) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__194, dtb__195, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__196)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__197, dtb__198, dtb__199, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__200), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__201)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__202) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__202) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc2
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__203) -> (match (((v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt mc0) mc1) dtb__203) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__204) -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) dtb__204) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__204)) then mc2 else dtb__204)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun soln0 -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) soln0) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar soln0)) then mc2 else soln0)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__203))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__205; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__206; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__207 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__205; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__206; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__206))) dtb__207) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec t -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) 0) t))

let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__208, dtb__209) -> (String.concat "" [", "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__208); (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__209)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__210, dtb__211) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__210) ^ (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__211))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel = (fun fuel ec v lvl acc -> (if (fuel <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (if dtb__213 then (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel (fuel - 1)) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__216) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__212, lvl, Base_dList.C_Base_dList_dList_Nil))))))) (lvl + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__215, acc))) else (Base_dList.v_Base_dList_dreverse acc))
  | _ -> (Base_dList.v_Base_dList_dreverse acc)
)))

let v_Vuna_dCompiler_dElab_dDict_dctorParamKinds = (fun ec v lvl acc -> (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel 64) ec) v) lvl) acc))

let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__217) -> (match dtb__217 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__218, dtb__219) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__218))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKinds = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__220) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__220) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__221) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__221) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKinds ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__222)))) 0) Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__224) -> (match dtb__224 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__225, dtb__226) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__227) -> (match dtb__227 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__228, dtb__229) -> (match dtb__229 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__230, dtb__231) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__228, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals ec ctx forced argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__232) -> (match dtb__232 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__233, dtb__234) -> (match dtb__234 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__233) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__235) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__235))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__236) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__237) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArgs = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__238) -> (match dtb__238 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__239, dtb__240) -> dtb__240
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__241, dtb__242) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__241))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmissingInstance = (fun ec dom sp -> ((fun forced -> ((fun sd -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((fun td -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (td))) td)) (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue ec) dtb__243)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> sd
  | _ -> failwith "DT: impossible branch"
)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (sd))) sd))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue forced))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__244, dtb__245) -> (match dtb__245 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__244).f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm; Base_dPair.f_Base_dPair_dPair_second = mc3 }))
  | _ -> ((fun _u -> ((fun sd -> ((fun names -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousInstance (sd, names))) sd) names)) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dDict_dinstMatchInst) mc2)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["search-ambig: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0); " cands="; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (fun x -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName (v_Vuna_dCompiler_dElab_dDict_dinstMatchInst x)))) mc2))])) else 0))
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance mc3) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__246, dtb__247) -> (match dtb__246 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__248; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__249; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__250; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__251; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__252; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__253 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__250) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__254) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__247)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg mc0) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__255) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) dtb__255)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__247))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__251))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar = (fun ec fuel v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__256) -> (match dtb__256 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__257, dtb__258, dtb__259) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__260, dtb__261) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__261)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__262, dtb__263) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__263)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__264, dtb__265) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__264) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__265))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__266, dtb__267) -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__266)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__268, dtb__269, dtb__270) -> (if (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__268) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__269)) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__270))
  | _ -> false
)))
and v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar mc0) mc1) dtb__271) then true else (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar mc0) mc1) dtb__272))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec arg -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) 64) arg))

let rec v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__273, dtb__274) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg mc0) dtb__273) then true else ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg mc0) dtb__274))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_drigidSearchFast = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dom) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom)) else false))

let rec v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun _u -> (match ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup ctx) 0) dom) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__275) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__275))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom)) else false) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__276; Base_dPair.f_Base_dPair_dPair_second = dtb__277 } -> (match dtb__276 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__278) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__278))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__279) -> (match dtb__279 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) dtb__277) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dblanketInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__280) dtb__281)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__282) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__282))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dtryViaDict globals) ctx) (fuel - 1)) dtb__277) dom) sp))
  | _ -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__276) dtb__277)
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) ec) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dspecificInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["search: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " rigid="; (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then "T" else "F"); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))])) else 0))))
and v_Vuna_dCompiler_dElab_dDict_dtryViaDict = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__283) -> (match dtb__283 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__284, dtb__285) -> (if ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom) then ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) dtb__284) dtb__285) 0) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))
and v_Vuna_dCompiler_dElab_dDict_dtryViaArgs = (fun globals ctx fuel ec sp fam args idx -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList_Cons (dtb__286, dtb__287) -> (match (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf ec) fam) dtb__286) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) fam) dtb__287) (idx + 1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) (fuel - 1)) ec) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (fam, (((v_Vuna_dCompiler_dElab_dDict_dreplaceAt idx) dtb__288) args)))))) sp)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDict_dmatchInstances = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__289, dtb__290) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__290) mc7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__291) -> (match dtb__291 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__292; Base_dPair.f_Base_dPair_dPair_second = dtb__293 } -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) dtb__293) mc4) mc5) dtb__290) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst = dtb__289; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm = dtb__292 }, mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dtryMatchInst mc0) mc1) mc2) mc3) dtb__289) mc4) mc5))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDict_dtryMatchInst = (fun globals ctx fuel ec inst dom sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan) ctx) ec) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__294; Base_dPair.f_Base_dPair_dPair_second = dtb__295 } -> ((fun _u -> ((fun hd -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__295)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__295)) 0) dom) hd) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__296) -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["inst-conv-err: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " hd="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue hd)])) else 0))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__297) -> ((fun ec2 -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas ec2) dtb__294) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__298) -> ((fun teleArgs -> ((fun env2 -> ((fun ctxVals -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__299) -> (match dtb__299 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__300; Base_dPair.f_Base_dPair_dPair_second = dtb__301 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst)))) ((Base_dList.v_Base_dList_dappend teleArgs) dtb__300)); Base_dPair.f_Base_dPair_dPair_second = dtb__301 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs globals) ctx) (fuel - 1)) ec2) sp) ctxVals) Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env2) t)))) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx))) ((Base_dList.v_Base_dList_dmap (fun v -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v))) dtb__298))) ((Base_dList.v_Base_dList_dmap (fun v -> { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v)); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 })) (Base_dList.v_Base_dList_dreverse dtb__298)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__295) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__297)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dList.C_Base_dList_dList_Nil)))) dtb__294)) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["inst-try: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " head="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " tele="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))])) else 0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__302, dtb__303) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__304) -> (match dtb__304 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__305; Base_dPair.f_Base_dPair_dPair_second = dtb__306 } -> (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs mc0) mc1) mc2) dtb__306) mc4) dtb__303) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__305; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__307) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel mc0) mc1) mc2) mc3) dtb__302) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc6); Base_dPair.f_Base_dPair_dPair_second = mc3 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn = (fun globals ctx ec dom sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) 16) ec) dom) sp))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec dom sp -> (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dom) sp))

let v_Vuna_dCompiler_dElab_dDict_dclassHasProjection = (fun className short name ec -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName className) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__308) -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__308).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) = name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disEqMethod = (fun ec name -> (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "eq") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "neq") name) ec)) then true else (name = "==")) then true else (name = "/=")))

let v_Vuna_dCompiler_dElab_dDict_disCmpMethod = (fun ec name -> (if (if (if (if (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "lt") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "le") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "gt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "ge") name) ec)) then true else (name = "<")) then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")))

let v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName = (fun ec name -> (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "add") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("+")) else (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "sub") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("-")) else (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "mul") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("*")) else (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "div") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("/")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

let v_Vuna_dCompiler_dElab_dDict_dmethodShortOf = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf = (fun mc0 -> (if (mc0 = "==") then "eq" else (if (mc0 = "/=") then "neq" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))

let v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf = (fun mc0 -> (if (mc0 = "<") then "lt" else (if (mc0 = "<=") then "le" else (if (mc0 = ">") then "gt" else (if (mc0 = ">=") then "ge" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))))

let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals ctx mname tyTerm aTerm bTerm sp dictTy ec -> ((fun m -> (match (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__309; Base_dPair.f_Base_dPair_dPair_second = dtb__310 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__309, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__310) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) dictTy) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) 0) } }))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

let v_Vuna_dCompiler_dElab_dDict_dcmpGenericName = (fun mc0 -> (if (mc0 = "lt") then "bi_lt_generic" else (if (mc0 = "le") then "bi_le_generic" else (if (mc0 = "gt") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun mc0 mc1 mc2 -> (if (mc2 = "Int") then (if (mc1 = "lt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_lt_int")) else (if (mc1 = "le") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_le_int")) else (if (mc1 = "gt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_gt_int")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_ge_int"))))) else (if (mc2 = "String") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else (if (mc2 = "Float") then (if (mc1 = "lt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_lt_float")) else (if (mc1 = "le") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_le_float")) else (if (mc1 = "gt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_gt_float")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_ge_float"))))) else (if (mc2 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OpNotDefinedFor (mc1, mc2))) mc1) mc2))))))

let rec v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__311, dtb__312) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__311)) then true else ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) dtb__312))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__313, dtb__314) -> (match dtb__313 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__315; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__316; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__317; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__318; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__319; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__320 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc4) dtb__318) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) mc4) dtb__318) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__321, dtb__322) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__322) dtb__317) dtb__321) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__323) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) dtb__323) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__324) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__324))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__325) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousInstance ("effect instance", ((Base_dString.v_Base_dString_djoin ", ") dtb__325)))) "effect instance") ((Base_dString.v_Base_dString_djoin ", ") dtb__325))
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> (match (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm mc1) mc4) dtb__318) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__326) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta mc4) dtb__317) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__326)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__327) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) dtb__327) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__328) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__328))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__329) -> (match dtb__329 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__330; Base_dPair.f_Base_dPair_dPair_second = dtb__331 } -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__331) dtb__317) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__330)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__332) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) dtb__332) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__333) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__333))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify mc1) mc4) dtb__318))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc4) dtb__318) with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__313, mc5)))
  | dtb__334 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc4) dtb__334) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__313, mc5))) else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc4) dtb__318) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc4)) else false) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__313, mc5))) else ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__335) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__313, mc5)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__336) -> (match dtb__336 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__337; Base_dPair.f_Base_dPair_dPair_second = dtb__338 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__338)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__338)) 0) dtb__317) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__337)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__339) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__338) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__339))) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__340) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__314) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__313, mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc4) dtb__318)) mc2))))
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc4) (Base_dList.v_Base_dList_dreverse mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx = (fun globals ctx ec sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo globals) ctx) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) ec) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__341; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__342; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__343; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__344; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__345; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__346 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc1) dtb__344) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) 0) mc1) dtb__344) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__347, dtb__348) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__348) dtb__343) dtb__347) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__349) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__349))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__350) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__351) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc1) mc3) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | dtb__352 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc1) dtb__352) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc1) mc3) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc1)) else false) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__353) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__354) -> (match dtb__354 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__355; Base_dPair.f_Base_dPair_dPair_second = dtb__356 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__356)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__356)) 0) dtb__343) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__355)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__357) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__356) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__357))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__358) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance mc1) mc3) { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }))))
))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel = (fun fuel globals ec -> (if (fuel <= 0) then ec else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__359, dtb__360) -> (match dtb__359 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__361; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__362; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__363; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__364; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__365; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__366 } -> ((fun ec1 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__363) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec1)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__367) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun solsNow -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decTriedAt ec1) dtb__361) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__368) -> (if (dtb__368 = solsNow) then ((fun ec2 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec2) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) (Base_dList.C_Base_dList_dList_Cons (dtb__359, Base_dList.C_Base_dList_dList_Nil))))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)) else ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__359) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__369) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__369)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dList.C_Base_dList_dList_Cons (kept, Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__361) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__361; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__362; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__363; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__364) then dtb__364 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__365; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__366 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__364)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__359) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__370) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__370)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dList.C_Base_dList_dList_Cons (kept, Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__361) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__361; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__362; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__363; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__364) then dtb__364 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__365; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__366 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__364))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) dtb__360))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ec
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec))))

let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals ec -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) + 1)) globals) ec))

let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__371) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) dtb__371)) (fun rt -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_EqRequiresEvidence (st))) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__372) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__373) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__373)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__374) -> (match dtb__374 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__375; Base_dPair.f_Base_dPair_dPair_second = dtb__376 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__375, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = dtb__376 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__372)), (Base_dList.C_Base_dList_dList_Cons (aTy, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (name = "==") then true else (name = "/=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__372).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__377) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) dtb__377)) (fun rt -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OpNotDefinedFor ((v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name), st))) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__378) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__379) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__379)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__380) -> (match dtb__380 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__381; Base_dPair.f_Base_dPair_dPair_second = dtb__382 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__381, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = dtb__382 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__378)), (Base_dList.C_Base_dList_dList_Cons (aTy, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__378).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name a b -> (if (name = "&&") then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, b, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (true)), b))))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__383, dtb__384) -> (match dtb__383 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__385; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__386; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__387; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__388; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__389; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__390 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__388) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__387) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__388))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__391) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__384)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__384))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__392, dtb__393) -> (match dtb__392 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__394; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__395; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__396; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__397; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__398; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__399 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__396) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__400) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__393)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__393) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__393) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__393) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__393) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__397))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__401, dtb__402) -> (match dtb__401 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__403; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__404; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__405; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__406; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__407; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__408 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__405) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__409) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__402)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then dtb__407 else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__402))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__406))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__410, dtb__411) -> (match dtb__410 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__412; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__413; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__414; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__415; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__416; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__417 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__415) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__414) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> dtb__416
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__418) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__411)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__411))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__419, dtb__420) -> (match dtb__419 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__421; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__422; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__423; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__424; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__425; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__426 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__423) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__427) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__420)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__420) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__420) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__420) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__420) else dtb__425))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__424))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__428, dtb__429) -> (match dtb__428 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__430; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__431; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__432; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__433; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__434; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__435 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__432) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__436) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__429)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__429) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__429) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__429) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__429) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__432))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__433))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))
