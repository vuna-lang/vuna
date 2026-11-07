open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDict_dInstMatch = C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch of (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)
and t_Vuna_dCompiler_dElab_dDict_dRowProofKind = C_Vuna_dCompiler_dElab_dDict_dRowProofKind_Vuna_dCompiler_dElab_dDict_dRowProofYes | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_Vuna_dCompiler_dElab_dDict_dRowProofNo | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_Vuna_dCompiler_dElab_dDict_dRowProofUnknown
and t_Vuna_dCompiler_dElab_dDict_dMemberLookup = C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberFound of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberAbsent | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck

let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec g -> ((Base_dList.v_Base_dList_dmemName g) ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec))))

let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily mc0) dtb__1)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dinstMatchInst = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__3, dtb__4) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dspecificInstances = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__5, dtb__6) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__5) then (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__6) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__5, (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__6))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dblanketInstances = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__7) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__8))) else (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__8))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue = (fun ec v -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))))

let rec v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> (match dtb__9 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, dtb__12) -> ((fun v -> (if ((v_Vuna_dCompiler_dElab_dDict_disDictValue mc3) v) then (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc3)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) 0) v) mc2) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__13) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__11, mc1)), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__13))))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__14) -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__10)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__10))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc1) dtb__12)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup = (fun ctx i dom ec -> (match (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo ctx) i) dom) ec) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__17, dtb__18) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))
))

let v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__19) -> (match dtb__19 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__20, dtb__21) -> dtb__20
  | _ -> ""
)
  | _ -> ""
))

let v_Vuna_dCompiler_dElab_dDict_dinstFamilyNameOf = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__22) -> (match dtb__22 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__23, dtb__24) -> dtb__23
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__28
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__29) -> dtb__29
  | _ -> ""
))

let v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__30) -> (match dtb__30 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__33))
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ""
)) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dflattenTaggedApp (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__35, dtb__36, dtb__37, dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (if (if (if ((v_Vuna_dCompiler_dElab_dDict_dinstFamilyNameOf dtb__39) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__39)) else false) then ((v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName dtb__39) = mc0) else false) then true else ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo mc0) dtb__40))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance = (fun ec tyName -> ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo tyName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))

let v_Vuna_dCompiler_dElab_dDict_disMonoInst = (fun i -> (match (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__42
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (match i with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__45, dtb__46, dtb__47, dtb__48) -> dtb__47
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dDict_dallInstancesMonoFor = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> (if ((v_Vuna_dCompiler_dElab_dDict_dinstFamilyNameOf dtb__49) = mc0) then (if (v_Vuna_dCompiler_dElab_dDict_disMonoInst dtb__49) then ((v_Vuna_dCompiler_dElab_dDict_dallInstancesMonoFor mc0) dtb__50) else false) else ((v_Vuna_dCompiler_dElab_dDict_dallInstancesMonoFor mc0) dtb__50))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dallInstancesMono = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (if (v_Vuna_dCompiler_dElab_dDict_disMonoInst dtb__51) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono dtb__52) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dtermMetaId = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__53) -> dtb__53
  | _ -> 0
))

let rec v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc0) mc1) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas mc0) dtb__57) dtb__55) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dDict_dtermMetaId dtb__56), dtb__58)), dtb__59))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__60) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__62) -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas mc0) dtb__61) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__63) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__62, dtb__63))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_drowMemDomName = "Base.Eff.rowMem"

let v_Vuna_dCompiler_dElab_dDict_drowYesDomName = "Base.Eff.Yes"

let v_Vuna_dCompiler_dElab_dDict_drowNoDomName = "Base.Eff.No"

let v_Vuna_dCompiler_dElab_dDict_drowYesCtorName = "Base.Eff.MkYes"

let v_Vuna_dCompiler_dElab_dDict_dmemberDomName = "Base.Eff.Member"

let v_Vuna_dCompiler_dElab_dDict_dhereCtorName = "Base.Eff.Here"

let v_Vuna_dCompiler_dElab_dDict_dthereCtorName = "Base.Eff.There"

let v_Vuna_dCompiler_dElab_dDict_disMemberDomain = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__64, dtb__65, dtb__66) -> (match dtb__64 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__67, dtb__68, dtb__69) -> (match dtb__67 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__70) -> (dtb__70 = v_Vuna_dCompiler_dElab_dDict_dmemberDomName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dom)))

let v_Vuna_dCompiler_dElab_dDict_dmemberSpine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__71) -> (match dtb__71 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__72, dtb__73) -> (if (dtb__72 = v_Vuna_dCompiler_dElab_dDict_dmemberDomName) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__74, dtb__75) -> (match dtb__75 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__76))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__73) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dElab_dDict_dctorValue = (fun ec name vals -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__78), vals))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (name, vals))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow = (fun fuel depth ec eVal rVal -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__79, dtb__80) -> (if (dtb__79 = "Base.Eff.RNil") then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberAbsent else (if (dtb__79 = "Base.Eff.RCons") then (match dtb__80 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (match dtb__82 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) eVal) then true else ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) dtb__81)) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck else (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) eVal) dtb__81) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__85) -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberFound ((((v_Vuna_dCompiler_dElab_dDict_dctorValue dtb__85) v_Vuna_dCompiler_dElab_dDict_dhereCtorName) (Base_dList.C_Base_dList_dList_Base_dList_dCons (eVal, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, Base_dList.C_Base_dList_dList_Base_dList_dNil))))), dtb__85))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__86) -> (match (((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow (fuel - 1)) depth) ec) eVal) dtb__83) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberFound (dtb__87, dtb__88) -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberFound ((((v_Vuna_dCompiler_dElab_dDict_dctorValue dtb__88) v_Vuna_dCompiler_dElab_dDict_dthereCtorName) (Base_dList.C_Base_dList_dList_Base_dList_dCons (eVal, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__81, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__83, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__87, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))), dtb__88))
  | dtb__89 -> dtb__89
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck
)
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck
) else C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck))
  | _ -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rVal))))

let v_Vuna_dCompiler_dElab_dDict_dmemberLookup = (fun fuel depth ec dom -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__90) -> (match dtb__90 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> (((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow fuel) depth) ec) dtb__91) dtb__92)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_dmemberSpine dom))))

let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__93 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__96) = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__95, mc1)))) else (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo dtb__94) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm = (fun ctx ec dom -> (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__97, dtb__98) -> dtb__97
  | _ -> failwith "DT: impossible branch"
)) 0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom))))

let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__99, dtb__100) -> (match dtb__99 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_devalCtx mc0) dtb__102)) mc4) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__103) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__101, mc2)), dtb__103))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__104) -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo mc0) dtb__100) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify = (fun ctx ec dom -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo ctx) (match ctx with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dCtx_Vuna_dCompiler_dElab_dTypes_dCtx (dtb__105, dtb__106) -> dtb__105
  | _ -> failwith "DT: impossible branch"
)) 0) ec) dom))

let v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta = (fun ec m v -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Base_dList_dNil) v) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__107) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__107))))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__108) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__108))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__109 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__111, dtb__112) -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc4) dtb__112) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) mc4) dtb__112) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberFound (dtb__113, dtb__114) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__114) dtb__111) dtb__113) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__115) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__110) dtb__115) mc5)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__116) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__116))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberAbsent -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNoInstanceFound ("row membership"))) "row membership")
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck -> (match (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm mc1) mc4) dtb__112) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta mc4) dtb__111) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__117)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__118) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__110) dtb__118) mc5)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__119) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__119))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNoInstanceFound ("row membership"))) "row membership")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__120) -> (match dtb__120 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__122) dtb__111) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__121)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__123) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__110) dtb__123) mc5)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__124) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__124))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify mc1) mc4) dtb__112))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__110) mc4) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__111, dtb__112)), mc5))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals mc4) (Base_dList.v_Base_dList_dreverse mc5))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx = (fun globals ctx ec sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo globals) ctx) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)) ec) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__125, dtb__126) -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> ((((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt mc0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc1, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__125), dtb__127))) dtb__126) dtb__128)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt mc0) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (mc1, ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc0) dtb__125), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega))) dtb__126) Base_dList.C_Base_dList_dList_Base_dList_dNil)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dpiRigs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__131, (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__133)))
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal = (fun ec g -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__134) -> (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__134)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt = (fun ec depth v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__135) -> (match dtb__135 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__136, dtb__137) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((((v_Vuna_dCompiler_dElab_dDict_dfoldSpineWithTyRigsAt depth) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__136))) dtb__137) ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__136))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__138, dtb__139, dtb__140) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__138), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__139), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__140)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__141, dtb__142) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__141), ((Base_dList.v_Base_dList_dmap (fun alt -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt mc0) mc1) alt))) dtb__142)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__143, dtb__144) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__143, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__144)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__145, dtb__146, dtb__147) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__145), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__146), dtb__147))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__148, dtb__149, dtb__150) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__148, dtb__149, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__150)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__151, dtb__152, dtb__153, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__154), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__155)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__156) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__156) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc2
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (match (((v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt mc0) mc1) dtb__157) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__158) -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) dtb__158) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__158)) then mc2 else dtb__158)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun soln0 -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) soln0) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar soln0)) then mc2 else soln0)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__157))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
and v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__159, dtb__160, dtb__161) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (dtb__159, dtb__160, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__160))) dtb__161)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec t -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) 0) t))

let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (String.concat "" [", "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__162); (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__163)])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__164) ^ (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__165))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel = (fun fuel ec v lvl acc -> (if (fuel <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> (if dtb__167 then (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel (fuel - 1)) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__170) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__166, lvl, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) (lvl + 1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__169, acc))) else (Base_dList.v_Base_dList_dreverse acc))
  | _ -> (Base_dList.v_Base_dList_dreverse acc)
)))

let v_Vuna_dCompiler_dElab_dDict_dctorParamKinds = (fun ec v lvl acc -> (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel 64) ec) v) lvl) acc))

let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__171) -> (match dtb__171 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__172, dtb__173) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKinds = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__174) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__175) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__175) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKinds ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__176)))) 0) Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__178) -> (match dtb__178 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) ((v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__181) -> (match dtb__181 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__182, dtb__183) -> (match dtb__183 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__182, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals ec ctx forced argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__186) -> (match dtb__186 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__187, dtb__188) -> (match dtb__188 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__187) globals) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__189))) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__190) -> true
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__191) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArgs = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__192) -> (match dtb__192 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__193, dtb__194) -> dtb__194
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
)
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom) with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dmissingInstance = (fun ec dom sp -> ((fun forced -> ((fun sd -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then ((fun td -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInterpNoInstance (td))) td)) (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue ec) dtb__197)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> sd
  | _ -> failwith "DT: impossible branch"
)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNoInstanceFound (sd))) sd))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue forced))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> (match dtb__199 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__198 with
  | C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__200, dtb__201) -> dtb__201
  | _ -> failwith "DT: impossible branch"
), mc3))))
  | _ -> ((fun _u -> ((fun sd -> ((fun names -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAmbiguousInstance (sd, names))) sd) names)) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dDict_dinstMatchInst) mc2)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["search-ambig: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0); " cands="; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (fun x -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName (v_Vuna_dCompiler_dElab_dDict_dinstMatchInst x)))) mc2))])) else 0))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance mc3) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__202, dtb__203) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup (match dtb__202 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__204, dtb__205) -> dtb__204
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__206) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__203)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpTypeName)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg mc0) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__207) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) dtb__207)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__203))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) (match dtb__202 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__208, dtb__209) -> dtb__209
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)))

let rec v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar = (fun ec fuel v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__210) -> (match dtb__210 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__211, dtb__212, dtb__213) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__214, dtb__215) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__215)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__216, dtb__217) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__217)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__218, dtb__219) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__218) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__219))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__220, dtb__221) -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__220)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__222, dtb__223, dtb__224) -> (if (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__222) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__223)) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__224))
  | _ -> false
)))
and v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__225, dtb__226) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar mc0) mc1) dtb__225) then true else (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar mc0) mc1) dtb__226))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec arg -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) 64) arg))

let rec v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__227, dtb__228) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg mc0) dtb__227) then true else ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg mc0) dtb__228))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_drigidSearchFast = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dom) then ((v_Vuna_dCompiler_dElab_dDict_dallInstancesMonoFor (v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)) else false))

let rec v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun _u -> (match ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup ctx) 0) dom) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__229) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__229))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, dtb__231) -> (match dtb__230 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) dtb__231) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dblanketInstances (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec))) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__232) dtb__233)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__230) dtb__231)
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) ec) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dspecificInstances (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec))) Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["search: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " rigid="; (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then "T" else "F"); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))])) else 0))))
and v_Vuna_dCompiler_dElab_dDict_dmatchInstances = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__234, dtb__235) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__235) mc7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__236) -> (match dtb__236 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238) -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) dtb__238) mc4) mc5) dtb__235) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dDict_dInstMatch_Vuna_dCompiler_dElab_dDict_dInstMatch (dtb__234, dtb__237)), mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dtryMatchInst mc0) mc1) mc2) mc3) dtb__234) mc4) mc5))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc7), mc3))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dDict_dtryMatchInst = (fun globals ctx fuel ec inst dom sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match (((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas ctx) ec) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__239, dtb__240, dtb__241, dtb__242) -> dtb__240
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244) -> ((fun _u -> ((fun hd -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__244)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__244)) 0) dom) hd) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__245) -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["inst-conv-err: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " hd="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue hd)])) else 0))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__246) -> ((fun ec2 -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas ec2) dtb__243) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__247) -> ((fun teleArgs -> ((fun env2 -> ((fun ctxVals -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__248) -> (match dtb__248 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, dtb__250) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst)))) ((Base_dList.v_Base_dList_dappend teleArgs) dtb__249)), dtb__250))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs globals) ctx) (fuel - 1)) ec2) sp) ctxVals) Base_dList.C_Base_dList_dList_Base_dList_dNil))) ((Base_dList.v_Base_dList_dmap (fun t -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env2) t)))) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__251, dtb__252, dtb__253, dtb__254) -> dtb__253
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dmap (fun v -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v))) dtb__247))) ((Base_dList.v_Base_dList_dmap (fun v -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v)), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)))) (Base_dList.v_Base_dList_dreverse dtb__247)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__244) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__246)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) dtb__243)) (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__255, dtb__256, dtb__257, dtb__258) -> dtb__258
  | _ -> failwith "DT: impossible branch"
)))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["inst-try: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " head="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__259, dtb__260, dtb__261, dtb__262) -> dtb__262
  | _ -> failwith "DT: impossible branch"
)); " tele="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (match inst with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtInst_Vuna_dCompiler_dElab_dTypes_dDtInst (dtb__263, dtb__264, dtb__265, dtb__266) -> dtb__264
  | _ -> failwith "DT: impossible branch"
)))])) else 0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__267, dtb__268) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__269) -> (match dtb__269 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__270, dtb__271) -> (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs mc0) mc1) mc2) dtb__271) mc4) dtb__268) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__270, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__272) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel mc0) mc1) mc2) mc3) dtb__267) mc4))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse mc6), mc3))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn = (fun globals ctx ec dom sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) 16) ec) dom) sp))

let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec dom sp -> (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn Base_dList.C_Base_dList_dList_Base_dList_dNil) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dom) sp))

let v_Vuna_dCompiler_dElab_dDict_dclassHasProjection = (fun className short name ec -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName className) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__273) -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (match dtb__273 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__274, dtb__275, dtb__276, dtb__277) -> dtb__276
  | _ -> failwith "DT: impossible branch"
)) short) = name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_disEqMethod = (fun ec name -> (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "eq") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "neq") name) ec)) then true else (name = "==")) then true else (name = "/=")))

let v_Vuna_dCompiler_dElab_dDict_disCmpMethod = (fun ec name -> (if (if (if (if (if (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "lt") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "le") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "gt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "ge") name) ec)) then true else (name = "<")) then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")))

let v_Vuna_dCompiler_dElab_dDict_dmethodShortOf = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))))

let v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf = (fun mc0 -> (if (mc0 = "==") then "eq" else (if (mc0 = "/=") then "neq" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))

let v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf = (fun mc0 -> (if (mc0 = "<") then "lt" else (if (mc0 = "<=") then "le" else (if (mc0 = ">") then "gt" else (if (mc0 = ">=") then "ge" else (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf mc0))))))

let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals ctx mname tyTerm aTerm bTerm sp dictTy ec -> ((fun m -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__278, dtb__279) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__278, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__279) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, dictTy)))))))))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

let v_Vuna_dCompiler_dElab_dDict_dcmpGenericName = (fun mc0 -> (if (mc0 = "lt") then "bi_lt_generic" else (if (mc0 = "le") then "bi_le_generic" else (if (mc0 = "gt") then "bi_gt_generic" else "bi_ge_generic"))))

let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun mc0 mc1 mc2 -> (if (mc2 = "Int") then (if (mc1 = "lt") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if (mc1 = "le") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if (mc1 = "gt") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int"))))) else (if (mc2 = "String") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else (if (mc2 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dDict_dcmpGenericName mc1))) else ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 mc0) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOpNotDefinedFor (mc1, mc2))) mc1) mc2)))))

let rec v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__280, dtb__281) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__280) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__282, dtb__283) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__282) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__284) -> ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) dtb__281)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) dtb__281)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel = (fun fuel globals ec -> (if (fuel <= 0) then ec else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__285, dtb__286) -> (match dtb__285 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__287, dtb__288) -> ((fun ec1 -> ((fun forced -> ((fun keep -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__288) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) 0) ec1) dtb__288) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberFound (dtb__289, dtb__290) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__290) dtb__287) dtb__289) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__291) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__291)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__292) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberAbsent -> keep
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_Vuna_dCompiler_dElab_dDict_dMemberStuck -> keep
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec1) forced) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> keep
  | dtb__293 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg ec1) dtb__293) then keep else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec1) forced) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec1)) else false) then keep else ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__294) -> keep
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__295) -> (match dtb__295 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__296, dtb__297) -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__297)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__297)) 0) dtb__287) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__296)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__298) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__297) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__298)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__299) -> keep
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance ec1) forced) (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))))
))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)) (Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__287, (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__288) then dtb__288 else forced)))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__288))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutDictGoals ec) dtb__286))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ec
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec))))

let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals ec -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel 64) globals) ec))

let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__300) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) dtb__300)) (fun rt -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dEqRequiresEvidence (st))) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__301) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__302) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__302)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__303) -> (match dtb__303 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__304, dtb__305) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__304, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__305))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__301)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (aTy, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (name = "==") then true else (name = "/=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (match dtb__301 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__306, dtb__307, dtb__308, dtb__309) -> dtb__308
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__310) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) dtb__310)) (fun rt -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ec))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun st -> ((((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOpNotDefinedFor ((v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name), st))) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__311) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__312) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__312)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__313) -> (match dtb__313 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__314, dtb__315) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__314, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__315))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__311)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (aTy, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (match dtb__311 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtClass_Vuna_dCompiler_dElab_dTypes_dDtClass (dtb__316, dtb__317, dtb__318, dtb__319) -> dtb__318
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name a b -> (if (name = "&&") then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, b, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (true)), b))))

let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__320, dtb__321) -> (match dtb__320 with
  | Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (dtb__322, dtb__323) -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__323) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__322) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__323))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__324) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__321)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__321))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictGoals ec)))
