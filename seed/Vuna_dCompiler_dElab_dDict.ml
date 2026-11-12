open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDict_dInstMatch = { f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dDict_dRowProofKind = C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofYes | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofNo | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofUnknown
and t_Vuna_dCompiler_dElab_dDict_dMemberLookup = C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous of (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDict_dMemberDom = C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dDict_dMemberCand = C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand of (string) * (int)
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt dtb__61) mc1) mc2)
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

let v_Vuna_dCompiler_dElab_dDict_dmemberCandName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand (dtb__93, dtb__94) -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmemberCandIdx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand (dtb__95, dtb__96) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmemberProbe = (fun ec depth a b -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) a) b) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__97) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__98) -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmemberNameText = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__99) -> dtb__99
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
))

let rec v_Vuna_dCompiler_dElab_dDict_dmemberScan = (fun fuel depth sols ec nF eF rF idx acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__100, dtb__101) -> (if (dtb__100 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = true })) else (if (dtb__100 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) dtb__104) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun matched -> ((fun acc2 -> (((((((((v_Vuna_dCompiler_dElab_dDict_dmemberScan (fuel - 1)) depth) sols) ec) nF) eF) dtb__106) (idx + 1)) acc2)) (if matched then (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand (((v_Vuna_dCompiler_dElab_dDict_dmemberNameText ec) dtb__102), idx)), acc)) else acc))) (if ((((v_Vuna_dCompiler_dElab_dDict_dmemberProbe ec) depth) eF) dtb__104) then ((((v_Vuna_dCompiler_dElab_dDict_dmemberProbe ec) depth) nF) dtb__102) else false)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__101) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__108) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = false }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

let rec v_Vuna_dCompiler_dElab_dDict_dmemberProofAt = (fun fuel depth ec nF eF rF target -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "member proof") else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__109, dtb__110) -> (if (dtb__109 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (match dtb__112 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__113, dtb__114) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (if (target <= 0) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) eF) dtb__113)) (fun ec1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec1) depth) nF) dtb__111)) (fun ec2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dctorValue ec2) v_Vuna_dCompiler_dElab_dDict_dhereCtorName) (Base_dList.C_Base_dList_dList_Cons (nF, (Base_dList.C_Base_dList_dList_Cons (eF, (Base_dList.C_Base_dList_dList_Cons (dtb__115, Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = ec2 })))))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dDict_dmemberProofAt (fuel - 1)) depth) ec) nF) eF) dtb__115) (target - 1))) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dctorValue (Base_dPair.v_Base_dPair_dsecondOf p)) v_Vuna_dCompiler_dElab_dDict_dthereCtorName) (Base_dList.C_Base_dList_dList_Cons (nF, (Base_dList.C_Base_dList_dList_Cons (eF, (Base_dList.C_Base_dList_dList_Cons (dtb__111, (Base_dList.C_Base_dList_dList_Cons (dtb__113, (Base_dList.C_Base_dList_dList_Cons (dtb__115, (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dfirstOf p), Base_dList.C_Base_dList_dList_Nil))))))))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })))))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed row in member proof")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed row in member proof")
)
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "malformed row in member proof")
)) dtb__110) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "member proof target out of range"))
  | _ -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "member proof target out of range")
)))

let v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow = (fun fuel depth ec nVal eVal rVal -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun nF -> ((fun eF -> ((fun sols -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> (match dtb__117 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = dtb__119 } -> (match dtb__118 with
  | Base_dList.C_Base_dList_dList_Nil -> (if dtb__119 then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent else C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck)
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__122) -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__123) -> (match dtb__123 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__124; Base_dPair.f_Base_dPair_dPair_second = dtb__125 } -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__124, dtb__125))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dmemberProofAt (fuel - 1)) depth) ec) nF) eF) rVal) (v_Vuna_dCompiler_dElab_dDict_dmemberCandIdx dtb__120)))
  | _ -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dDict_dmemberCandName) dtb__118)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) (((((((((v_Vuna_dCompiler_dElab_dDict_dmemberScan 64) depth) sols) ec) nF) eF) rVal) 0) Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) eVal))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) nVal))))

let v_Vuna_dCompiler_dElab_dDict_dmemberLookup = (fun fuel depth ec dom -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126) -> (match dtb__126 with
  | C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 (dtb__127, dtb__128, dtb__129) -> ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow fuel) depth) ec) dtb__127) dtb__128) dtb__129)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_dmemberSpine dom))))

let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__130 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__132; Base_dPair.f_Base_dPair_dPair_second = dtb__133 } -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__133) = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__132, mc1, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })))) else (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo dtb__131) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm = (fun ctx ec dom -> (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom))))

let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (match dtb__134 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__136; Base_dPair.f_Base_dPair_dPair_second = dtb__137 } -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc0) dtb__137)) mc4) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__138) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__136, mc2, { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 })); Base_dPair.f_Base_dPair_dPair_second = dtb__138 }))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__139) -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo mc0) dtb__135) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify = (fun ctx ec dom -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo ctx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) ec) dom))

let v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta = (fun ec m v -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Nil) v) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__140) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__140))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__141) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__141))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__142) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun p -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)) (dtb__142).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)) ((Base_dList.v_Base_dList_dmap (fun t -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)) (dtb__142).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx)))) else ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo mc0) dtb__143))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst = (fun ec g -> ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dpiRigs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (Base_dList.C_Base_dList_dList_Cons (dtb__146, (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__148)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst ec) g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149) -> dtb__149
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__150)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt = (fun fuel ec depth task -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine (dtb__151, dtb__152, dtb__153) -> (match dtb__152 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__154, dtb__155) -> ((fun argTerm -> ((fun r -> ((fun restRigs -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__151, argTerm, r)), dtb__155, restRigs)))) (match dtb__153 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__156, dtb__157) -> dtb__157
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (match dtb__153 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__158, dtb__159) -> dtb__158
  | Base_dList.C_Base_dList_dList_Nil -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> failwith "DT: impossible branch"
))) (match ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (dtb__154))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__160) -> dtb__160
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__154)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__151))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (dtb__161) -> (match dtb__161 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__162) -> (match dtb__162 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__163, dtb__164) -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__163)), dtb__164, ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__163))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__161) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__165) -> (match dtb__165 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__166, dtb__167) -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__166)), dtb__167, ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__166))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)) task)))

let v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt = (fun ec depth v -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt 64) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (v))))

let rec v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__168, dtb__169, dtb__170) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__168), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__169), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__170)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__171, dtb__172) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__171), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt mc0) mc1) alt))) dtb__172)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__173, dtb__174) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__173, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__174)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__175, dtb__176) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__175, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__176)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__177, dtb__178) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__177, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__178)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__179, dtb__180, dtb__181) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__179), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__180), dtb__181))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__182, dtb__183, dtb__184) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__182, dtb__183, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__184)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__185, dtb__186, dtb__187, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__188), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__189)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__190) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__190) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc2
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> (match (((v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt mc0) mc1) dtb__191) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__192) -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) dtb__192) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__192)) then mc2 else dtb__192)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun soln0 -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) soln0) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar soln0)) then mc2 else soln0)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__193; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__194; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__195 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__193; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__194; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__194))) dtb__195) }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec t -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) 0) t))

let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__196, dtb__197) -> (String.concat "" [", "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__196); (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__197)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__198, dtb__199) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__198) ^ (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__199))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel = (fun fuel ec v lvl acc -> (if (fuel <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if dtb__201 then (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel (fuel - 1)) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__204) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__200, lvl, Base_dList.C_Base_dList_dList_Nil))))))) (lvl + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__203, acc))) else (Base_dList.v_Base_dList_dreverse acc))
  | _ -> (Base_dList.v_Base_dList_dreverse acc)
)))

let v_Vuna_dCompiler_dElab_dDict_dctorParamKinds = (fun ec v lvl acc -> (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel 64) ec) v) lvl) acc))

let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__205) -> (match dtb__205 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__206, dtb__207) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKinds = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__208) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__208) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__209) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__209) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKinds ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__210)))) 0) Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__212) -> (match dtb__212 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__213, dtb__214) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__213))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__215) -> (match dtb__215 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__216, dtb__217) -> (match dtb__217 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__216, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals ec ctx forced argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__220) -> (match dtb__220 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__221, dtb__222) -> (match dtb__222 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__221) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__223))) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__224) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__225) -> false
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__226) -> (match dtb__226 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__227, dtb__228) -> dtb__228
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__229, dtb__230) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmissingInstance = (fun ec dom sp -> ((fun forced -> ((fun sd -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((fun td -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_InterpNoInstance (td))) td)) (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__231) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue ec) dtb__231)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> sd
  | _ -> failwith "DT: impossible branch"
)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound (sd))) sd))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue forced))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__232, dtb__233) -> (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__232).f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm; Base_dPair.f_Base_dPair_dPair_second = mc3 }))
  | _ -> ((fun _u -> ((fun sd -> ((fun names -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousInstance (sd, names))) sd) names)) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dDict_dinstMatchInst) mc2)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dperfEnabled then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugLine (String.concat "" ["search-ambig: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0); " cands="; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (fun x -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName (v_Vuna_dCompiler_dElab_dDict_dinstMatchInst x)))) mc2))])) else Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dunit))
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance mc3) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (match dtb__234 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__236; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__237; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__238; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__239; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__240; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__241 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__238) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__242) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__235)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg mc0) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) dtb__243)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__235))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__239))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar = (fun ec fuel v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__244) -> (match dtb__244 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__245, dtb__246, dtb__247) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__248, dtb__249) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__249)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__250, dtb__251) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__251)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__252, dtb__253) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__252) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__253))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__254, dtb__255) -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__254)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__256, dtb__257, dtb__258) -> (if (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__256) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__257)) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__258))
  | _ -> false
)))
and v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__259, dtb__260) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar mc0) mc1) dtb__259) then true else (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar mc0) mc1) dtb__260))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec arg -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) 64) arg))

let rec v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__261, dtb__262) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg mc0) dtb__261) then true else ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg mc0) dtb__262))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_drigidSearchFast = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dom) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom)) else false))

let rec v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun _u -> (match ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup ctx) 0) dom) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__263))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom)) else false) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__264; Base_dPair.f_Base_dPair_dPair_second = dtb__265 } -> (match dtb__264 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__266) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__266))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__267) -> (match dtb__267 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) dtb__265) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dblanketInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__268; Base_dPair.f_Base_dPair_dPair_second = dtb__269 } -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__268) dtb__269)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__270) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__270))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dtryViaDict globals) ctx) (fuel - 1)) dtb__265) dom) sp))
  | _ -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__264) dtb__265)
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) ec) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dspecificInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dperfEnabled then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugLine (String.concat "" ["search: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " rigid="; (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then "T" else "F"); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))])) else Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dunit))))
and v_Vuna_dCompiler_dElab_dDict_dtryViaDict = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__271) -> (match dtb__271 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__272, dtb__273) -> (if ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom) then ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) dtb__272) dtb__273) 0) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))
and v_Vuna_dCompiler_dElab_dDict_dtryViaArgs = (fun globals ctx fuel ec sp fam args idx -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList_Cons (dtb__274, dtb__275) -> (match (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf ec) fam) dtb__274) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) fam) dtb__275) (idx + 1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__276) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) (fuel - 1)) ec) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (fam, (((v_Vuna_dCompiler_dElab_dDict_dreplaceAt idx) dtb__276) args)))))) sp)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDict_dmatchInstances = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__277, dtb__278) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__278) mc7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> (match dtb__279 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) dtb__281) mc4) mc5) dtb__278) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst = dtb__277; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm = dtb__280 }, mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dtryMatchInst mc0) mc1) mc2) mc3) dtb__277) mc4) mc5))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDict_dtryMatchInst = (fun globals ctx fuel ec inst dom sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan) ctx) ec) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__282; Base_dPair.f_Base_dPair_dPair_second = dtb__283 } -> ((fun _u -> ((fun hd -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__283)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__283)) 0) dom) hd) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__284) -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dperfEnabled then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugLine (String.concat "" ["inst-conv-err: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " hd="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue hd)])) else Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dunit))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__285) -> ((fun ec2 -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas ec2) dtb__282) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__286) -> ((fun teleArgs -> ((fun env2 -> ((fun ctxVals -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__287) -> (match dtb__287 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__288; Base_dPair.f_Base_dPair_dPair_second = dtb__289 } -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst)))) ((Base_dList.v_Base_dList_dappend teleArgs) dtb__288)); Base_dPair.f_Base_dPair_dPair_second = dtb__289 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs globals) ctx) (fuel - 1)) ec2) sp) ctxVals) Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env2) t)))) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx))) ((Base_dList.v_Base_dList_dmap (fun v -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v))) dtb__286))) ((Base_dList.v_Base_dList_dmap (fun v -> { Base_dPair.f_Base_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v)); Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 })) (Base_dList.v_Base_dList_dreverse dtb__286)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__283) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__285)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dList.C_Base_dList_dList_Nil)))) dtb__282)) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dperfEnabled then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugLine (String.concat "" ["inst-try: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " head="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " tele="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))])) else Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dunit))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__290, dtb__291) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__292) -> (match dtb__292 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__293; Base_dPair.f_Base_dPair_dPair_second = dtb__294 } -> (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs mc0) mc1) mc2) dtb__294) mc4) dtb__291) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__293; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__295) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel mc0) mc1) mc2) mc3) dtb__290) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc6); Base_dPair.f_Base_dPair_dPair_second = mc3 }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn = (fun globals ctx ec dom sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) 16) ec) dom) sp))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec dom sp -> (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dom) sp))

let v_Vuna_dCompiler_dElab_dDict_dclassHasProjection = (fun className short name ec -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName className) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__296) -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__296).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) = name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disEqMethod = (fun ec name -> (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "eq") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "neq") name) ec)) then true else (name = "==")) then true else (name = "/=")))

let v_Vuna_dCompiler_dElab_dDict_disCmpMethod = (fun ec name -> (if (if (if (if (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "lt") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "le") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "gt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "ge") name) ec)) then true else (name = "<")) then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")))

let v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName = (fun ec name -> (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "add") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("+")) else (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "sub") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("-")) else (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "mul") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("*")) else (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "div") name) ec) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("/")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

let v_Vuna_dCompiler_dElab_dDict_dmethodShortOf = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf = (fun mc0 -> (if (mc0 = "==") then "eq" else (if (mc0 = "/=") then "neq" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))

let v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf = (fun mc0 -> (if (mc0 = "<") then "lt" else (if (mc0 = "<=") then "le" else (if (mc0 = ">") then "gt" else (if (mc0 = ">=") then "ge" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))))

let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals ctx mname tyTerm aTerm bTerm sp dictTy ec -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__297; Base_dPair.f_Base_dPair_dPair_second = dtb__298 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__297, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__298) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) dictTy) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) 0) } }))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

let v_Vuna_dCompiler_dElab_dDict_dcmpGenericName = (fun mc0 -> (if (mc0 = "lt") then "bi_lt_generic" else (if (mc0 = "le") then "bi_le_generic" else (if (mc0 = "gt") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun mc0 mc1 mc2 -> (if (mc2 = "Int") then (if (mc1 = "lt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_lt_int")) else (if (mc1 = "le") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_le_int")) else (if (mc1 = "gt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_gt_int")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_ge_int"))))) else (if (mc2 = "String") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else (if (mc2 = "Float") then (if (mc1 = "lt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_lt_float")) else (if (mc1 = "le") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_le_float")) else (if (mc1 = "gt") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_gt_float")) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ("bi_ge_float"))))) else (if (mc2 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OpNotDefinedFor (mc1, mc2))) mc1) mc2))))))

let rec v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__299, dtb__300) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__299)) then true else ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) dtb__300))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__301, dtb__302) -> (match dtb__301 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__303; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__304; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__305; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__306; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__307; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__308 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc4) dtb__306) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) mc4) dtb__306) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__309, dtb__310) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__310) dtb__305) dtb__309) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__311) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) dtb__311) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__312) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__312))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__313) -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_AmbiguousInstance ("effect instance", ((Base_dString.v_Base_dString_djoin ", ") dtb__313)))) "effect instance") ((Base_dString.v_Base_dString_djoin ", ") dtb__313))
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> (match (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm mc1) mc4) dtb__306) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__314) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta mc4) dtb__305) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__314)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__315) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) dtb__315) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__316) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__316))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__317) -> (match dtb__317 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__318; Base_dPair.f_Base_dPair_dPair_second = dtb__319 } -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__319) dtb__305) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__318)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__320) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) dtb__320) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__321) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__321))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify mc1) mc4) dtb__306))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc4) dtb__306) with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__301, mc5)))
  | dtb__322 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc4) dtb__322) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__301, mc5))) else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc4) dtb__306) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc4)) else false) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__301, mc5))) else ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__323) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__301, mc5)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__324) -> (match dtb__324 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__325; Base_dPair.f_Base_dPair_dPair_second = dtb__326 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__326)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__326)) 0) dtb__305) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__325)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__327) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__326) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__327))) mc5)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__328) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__302) mc4) (Base_dList.C_Base_dList_dList_Cons (dtb__301, mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc4) dtb__306)) mc2))))
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc4) (Base_dList.v_Base_dList_dreverse mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx = (fun globals ctx ec sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo globals) ctx) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) ec) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__329; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__330; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__331; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__332; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__333; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__334 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc1) dtb__332) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) 0) mc1) dtb__332) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__335, dtb__336) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__336) dtb__331) dtb__335) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__337) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__337))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__338) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__339) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc1) mc3) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | dtb__340 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc1) dtb__340) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc1) mc3) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc1)) else false) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__341) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__342) -> (match dtb__342 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__343; Base_dPair.f_Base_dPair_dPair_second = dtb__344 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__344)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__344)) 0) dtb__331) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__343)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__345) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__344) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__345))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__346) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__347, dtb__348) -> (match dtb__347 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__349; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__350; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__351; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__352; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__354 } -> ((fun ec1 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__351) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec1)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__355) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun solsNow -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decTriedAt ec1) dtb__349) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__356) -> (if (dtb__356 = solsNow) then ((fun ec2 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec2) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) (Base_dList.C_Base_dList_dList_Cons (dtb__347, Base_dList.C_Base_dList_dList_Nil))))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)) else ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__347) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__357) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__357)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dList.C_Base_dList_dList_Cons (kept, Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__349) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__349; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__350; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__351; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__352) then dtb__352 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__354 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__352)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__347) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__358) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__358)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dList.C_Base_dList_dList_Cons (kept, Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__349) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__349; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__350; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__351; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__352) then dtb__352 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__354 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__352))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) dtb__348))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ec
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec))))

let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals ec -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) + 1)) globals) ec))

let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__359) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) dtb__359)) (fun rt -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_EqRequiresEvidence (st))) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__360) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__361) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__361)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__362) -> (match dtb__362 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__363; Base_dPair.f_Base_dPair_dPair_second = dtb__364 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__363, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = dtb__364 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__360)), (Base_dList.C_Base_dList_dList_Cons (aTy, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (name = "==") then true else (name = "/=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__360).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__365) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) dtb__365)) (fun rt -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = ec } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_OpNotDefinedFor ((v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name), st))) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__366) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__367) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__367)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__368) -> (match dtb__368 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__369; Base_dPair.f_Base_dPair_dPair_second = dtb__370 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__369, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Nil)))); Base_dPair.f_Base_dPair_dPair_second = dtb__370 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__366)), (Base_dList.C_Base_dList_dList_Cons (aTy, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__366).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name a b -> (if (name = "&&") then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, b, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (true)), b))))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__371, dtb__372) -> (match dtb__371 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__373; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__374; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__375; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__376; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__377; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__378 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__376) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__375) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__376))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__379) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__372)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__372))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__380, dtb__381) -> (match dtb__380 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__382; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__383; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__384; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__385; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__386; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__387 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__384) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__388) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__381)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__381) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__381) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__381) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__381) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__385))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__389, dtb__390) -> (match dtb__389 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__391; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__392; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__393; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__394; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__395; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__396 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__393) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__397) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__390)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then dtb__395 else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__390))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__394))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__398, dtb__399) -> (match dtb__398 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__400; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__401; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__402; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__403; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__404; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__405 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__403) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__402) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> dtb__404
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__406) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__399)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__399))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__407, dtb__408) -> (match dtb__407 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__409; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__410; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__411; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__412; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__413; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__414 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__411) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__415) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__408)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__408) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__408) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__408) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__408) else dtb__413))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__412))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__416, dtb__417) -> (match dtb__416 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__418; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__419; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__420; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__421; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__422; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__423 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__420) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__424) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__417)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__417) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__417) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__417) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__417) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__420))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__421))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))
