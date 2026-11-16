open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDict_dInstMatch = { f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dDict_dRowProofKind = C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofYes | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofNo | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofUnknown
and t_Vuna_dCompiler_dElab_dDict_dMemberLookup = C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous of (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dDict_dMemberDom = C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue)
and t_Vuna_dCompiler_dElab_dDict_dMemberCand = C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand of (string) * (int)
and t_Vuna_dCompiler_dElab_dDict_dDictTermTask = C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig Base_dList.t_Base_dList_dList)

# 33 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec g -> ((Base_dList.v_Base_dList_dmemName g) ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec))))

# 27 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily mc0) dtb__1)
  | _ -> false
)
  | _ -> false
))

# 24 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 53 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dinstMatchInst = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst = dtb__3; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm = dtb__4 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfindClass = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__5) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5)) else ((v_Vuna_dCompiler_dElab_dDict_dfindClass mc0) dtb__6))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfamOfClass = (fun ec cn -> (match ((v_Vuna_dCompiler_dElab_dDict_dfindClass cn) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__7))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyViaClassFam = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match ((v_Vuna_dCompiler_dElab_dDict_dfamOfClass mc0) dtb__8) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (if (dtb__10 = mc1) then true else (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam mc0) mc1) dtb__9))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam mc0) mc1) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam = (fun ec d fam -> (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam ec) fam) (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses))

# 111 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dapplyDataPis = (fun ec n v args -> (if (n <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (v)) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> ((((v_Vuna_dCompiler_dElab_dDict_dapplyDataPis ec) (n - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__17) dtb__11)) dtb__12)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 120 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaFieldType = (fun ec d c args -> (if ((Base_dList.v_Base_dList_dlength args) <> (Base_dList.v_Base_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dElab_dDict_dapplyDataPis ec) (Base_dList.v_Base_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) args) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__18) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__18) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 141 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape = (fun ec d wargs -> (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))) then (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__24, dtb__25) -> ((((v_Vuna_dCompiler_dElab_dDict_dviaFieldType ec) d) dtb__24) wargs)
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 135 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaWrapperData = (fun ec fam w wargs -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData w) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> (if (((v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam ec) dtb__26) fam) then (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape ec) dtb__26) wargs) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 129 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf = (fun ec fam arg -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> ((((v_Vuna_dCompiler_dElab_dDict_dviaWrapperData ec) fam) dtb__28) dtb__29)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) arg)))

# 148 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyViaWrapper = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf mc0) mc1) dtb__30) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dDict_danyViaWrapper mc0) mc1) dtb__31)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__33) -> (match dtb__33 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__34, dtb__35) -> (((v_Vuna_dCompiler_dElab_dDict_danyViaWrapper ec) dtb__34) dtb__35)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 161 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dreplaceAt = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList__x58__x58_ (mc1, dtb__37)) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__36, (((v_Vuna_dCompiler_dElab_dDict_dreplaceAt (mc0 - 1)) mc1) dtb__37))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dspecificInstances = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__38) then (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__39) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__38, (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__39))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dblanketInstances = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__40) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__40, (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__41))) else (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__41))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue = (fun ec v -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))))

# 264 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__44; Base_dPair.f_Base_dPair_dPair_second = dtb__45 } -> ((fun v -> (if ((v_Vuna_dCompiler_dElab_dDict_disDictValue mc3) v) then (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc3)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) 0) v) mc2) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__46) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__44, mc1, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dPair.f_Base_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__46)) }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__47) -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc1) dtb__45)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 259 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupExact = (fun ctx i dom ec -> (match (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo ctx) i) dom) ec) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)
))

# 256 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup = (fun ctx i dom ec -> ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupExact ctx) i) dom) ec))

# 282 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__48) -> (match dtb__48 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__49, dtb__50) -> dtb__49
  | _ -> ""
)
  | _ -> ""
))

# 191 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsearchCandidates = (fun ec dom -> ((fun fam -> (if (fam = "") then (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) fam))) (v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

# 307 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__51) -> dtb__51
  | _ -> ""
))

# 302 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> (match dtb__52 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__53; Base_dPair.f_Base_dPair_dPair_second = dtb__54 } -> (match dtb__54 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf (Base_dPair.v_Base_dPair_dfirstOf dtb__55))
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ""
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))

# 296 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__57)) then ((v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName dtb__57) = mc0) else false) then true else ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo mc0) dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance = (fun ec tyName -> ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo tyName) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName))))

# 311 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disMonoInst = (fun i -> (match (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele with
  | Base_dList.C_Base_dList_dList_Nil -> (match (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
))

# 319 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dallInstancesMono = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (if (v_Vuna_dCompiler_dElab_dDict_disMonoInst dtb__59) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono dtb__60) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 368 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dallocMetaAt = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt dtb__61) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dtermMetaId = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__62) -> dtb__62
  | _ -> 0
))

# 362 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocMetaAt mc0) mc1) mc2) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__65; Base_dPair.f_Base_dPair_dPair_second = dtb__66 } -> (match ((((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas mc0) mc1) dtb__66) dtb__64) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__67; Base_dPair.f_Base_dPair_dPair_second = dtb__68 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dDict_dtermMetaId dtb__65), dtb__67)); Base_dPair.f_Base_dPair_dPair_second = dtb__68 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__69, dtb__70) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__69) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__71) -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas mc0) dtb__70) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowMemDomName = "Base.Eff.rowMem"

# 400 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowYesDomName = "Base.Eff.Yes"

# 403 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowNoDomName = "Base.Eff.No"

# 407 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowYesCtorName = "Base.Eff.Yes.MkYes"

# 413 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberDomName = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName

# 417 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dhereCtorName = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberHereCtor

# 421 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dthereCtorName = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberThereCtor

# 431 "Vuna/Compiler/Elab/Dict.vuna"
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

# 441 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberSpine = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__83) -> (match dtb__83 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__84, dtb__85) -> (if (dtb__84 = v_Vuna_dCompiler_dElab_dDict_dmemberDomName) then (if ((Base_dList.v_Base_dList_dlength dtb__85) = 3) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (match dtb__87 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__88, dtb__89) -> (match dtb__89 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__90, dtb__91) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 (dtb__86, dtb__88, dtb__90))))
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

# 451 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctorValue = (fun ec name vals -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__92), vals))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (name, vals))
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberCandName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand (dtb__93, dtb__94) -> dtb__93
  | _ -> failwith "DT: impossible branch"
))

# 478 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberCandIdx = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand (dtb__95, dtb__96) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberProbe = (fun ec depth a b -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) a) b) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__97) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__98) -> false
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberNameText = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__99) -> dtb__99
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
))

# 494 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dmemberScan = (fun fuel depth sols ec nF eF rF idx acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__100, dtb__101) -> (if (dtb__100 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = true })) else (if (dtb__100 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__106, dtb__107) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) dtb__104) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun matched -> ((fun acc2 -> (((((((((v_Vuna_dCompiler_dElab_dDict_dmemberScan (fuel - 1)) depth) sols) ec) nF) eF) dtb__106) (idx + 1)) acc2)) (if matched then (Base_dList.C_Base_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dElab_dDict_dMemberCand_MkMemberCand (((v_Vuna_dCompiler_dElab_dDict_dmemberNameText ec) dtb__102), idx)), acc)) else acc))) (if ((((v_Vuna_dCompiler_dElab_dDict_dmemberProbe ec) depth) eF) dtb__104) then ((((v_Vuna_dCompiler_dElab_dDict_dmemberProbe ec) depth) nF) dtb__102) else false)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__101) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__108) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = false }))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

# 511 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dmemberProofAt = (fun fuel depth ec nF eF rF target -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "member proof") else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__109, dtb__110) -> (if (dtb__109 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match dtb__112 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__113, dtb__114) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__115, dtb__116) -> (if (target <= 0) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) eF) dtb__113)) (fun ec1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec1) depth) nF) dtb__111)) (fun ec2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dctorValue ec2) v_Vuna_dCompiler_dElab_dDict_dhereCtorName) (Base_dList.C_Base_dList_dList__x58__x58_ (nF, (Base_dList.C_Base_dList_dList__x58__x58_ (eF, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__115, Base_dList.C_Base_dList_dList_Nil))))))); Base_dPair.f_Base_dPair_dPair_second = ec2 })))))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dDict_dmemberProofAt (fuel - 1)) depth) ec) nF) eF) dtb__115) (target - 1))) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dctorValue (Base_dPair.v_Base_dPair_dsecondOf p)) v_Vuna_dCompiler_dElab_dDict_dthereCtorName) (Base_dList.C_Base_dList_dList__x58__x58_ (nF, (Base_dList.C_Base_dList_dList__x58__x58_ (eF, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__111, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__113, (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__115, (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dPair.v_Base_dPair_dfirstOf p), Base_dList.C_Base_dList_dList_Nil))))))))))))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed row in member proof")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed row in member proof")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed row in member proof")
)) dtb__110) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "member proof target out of range"))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "member proof target out of range")
)))

# 528 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow = (fun fuel depth ec nVal eVal rVal -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun nF -> ((fun eF -> ((fun sols -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> (match dtb__117 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = dtb__119 } -> (match dtb__118 with
  | Base_dList.C_Base_dList_dList_Nil -> (if dtb__119 then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent else C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__120, dtb__121) -> (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__122) -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__123) -> (match dtb__123 with
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

# 456 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberLookup = (fun fuel depth ec dom -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126) -> (match dtb__126 with
  | C_Vuna_dCompiler_dElab_dDict_dMemberDom_MemberDom3 (dtb__127, dtb__128, dtb__129) -> ((((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow fuel) depth) ec) dtb__127) dtb__128) dtb__129)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_dmemberSpine dom))))

# 546 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__130, dtb__131) -> (match dtb__130 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__132; Base_dPair.f_Base_dPair_dPair_second = dtb__133 } -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__133) = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__132, mc1, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })))) else (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo dtb__131) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 552 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm = (fun ctx ec dom -> (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom))))

# 561 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__134, dtb__135) -> (match dtb__134 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__136; Base_dPair.f_Base_dPair_dPair_second = dtb__137 } -> ((fun olderDepth -> ((fun tyVal -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) tyVal) mc4) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__138) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__136, mc2, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dPair.f_Base_dPair_dPair_second = dtb__138 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__139) -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo mc0) dtb__135) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue (mc0).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__135) 0) olderDepth))) dtb__137))) (Base_dList.v_Base_dList_dlength dtb__135))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 558 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify = (fun ctx ec dom -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo ctx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) ec) dom))

# 574 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta = (fun ec m v -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dList.C_Base_dList_dList_Nil) v) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__140) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__140))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__141) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__141))
  | _ -> failwith "DT: impossible branch"
))

# 771 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__142) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun p -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)) (dtb__142).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)) ((Base_dList.v_Base_dList_dmap (fun t -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)) (dtb__142).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx)))) else ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo mc0) dtb__143))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 768 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst = (fun ec g -> ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))

# 784 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dpiRigs = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__146, (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__148)))
  | _ -> Base_dList.C_Base_dList_dList_Nil
))

# 777 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst ec) g) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149) -> dtb__149
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__150)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 737 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt = (fun fuel ec depth task -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine (dtb__151, dtb__152, dtb__153) -> (match dtb__152 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__154, dtb__155) -> ((fun argTerm -> ((fun r -> ((fun restRigs -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__151, argTerm, r)), dtb__155, restRigs)))) (match dtb__153 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__156, dtb__157) -> dtb__157
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (match dtb__153 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__158, dtb__159) -> dtb__158
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

# 734 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt = (fun ec depth v -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt 64) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (v))))

# 694 "Vuna/Compiler/Elab/Dict.vuna"
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
# 721 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__193; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__194; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__195 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__193; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__194; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + (Base_dList.v_Base_dList_dlength dtb__194))) dtb__195) }
  | _ -> failwith "DT: impossible branch"
))

# 691 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec t -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) 0) t))

# 792 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (String.concat "" [", "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__196); (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__197)])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 788 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__198, dtb__199) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__198) ^ (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__199))
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 811 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel = (fun fuel ec v lvl acc -> (if (fuel <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if dtb__201 then (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel (fuel - 1)) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__204) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__200, lvl, Base_dList.C_Base_dList_dList_Nil))))))) (lvl + 1)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__203, acc))) else (Base_dList.v_Base_dList_dreverse acc))
  | _ -> (Base_dList.v_Base_dList_dreverse acc)
)))

# 808 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctorParamKinds = (fun ec v lvl acc -> (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel 64) ec) v) lvl) acc))

# 826 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__205) -> (match dtb__205 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__206, dtb__207) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__206))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 798 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictArgKinds = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__208) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__208) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__209) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__209) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__210, dtb__211) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKinds ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__210)))) 0) Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 821 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__212) -> (match dtb__212 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__213, dtb__214) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__213))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec) dom)))

# 843 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__215) -> (match dtb__215 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__216, dtb__217) -> (match dtb__217 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__216, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 833 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals ec ctx forced argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__220) -> (match dtb__220 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__221, dtb__222) -> (match dtb__222 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__221) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__223))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__224) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__225) -> false
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

# 849 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictClassArgs = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__226) -> (match dtb__226 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__227, dtb__228) -> dtb__228
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 854 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__229, dtb__230) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmissingInstance = (fun ec dom sp -> ((fun forced -> ((fun sd -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((fun td -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (td))) td)) (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__231) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue ec) dtb__231)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> sd
  | _ -> failwith "DT: impossible branch"
)) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (sd))) sd))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue forced))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 207 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__232, dtb__233) -> (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (dtb__232).f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm; Base_dPair.f_Base_dPair_dPair_second = mc3 }))
  | _ -> ((fun _u -> ((fun sd -> ((fun names -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousInstance (sd, names))) sd) names)) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dDict_dinstMatchInst) mc2)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["search-ambig: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0); " cands="; ((Base_dString.v_Base_dString_djoin ",") ((Base_dList.v_Base_dList_dmap (fun x -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName (v_Vuna_dCompiler_dElab_dDict_dinstMatchInst x)))) mc2))])) else 0))
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance mc3) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 242 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (match dtb__234 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__236; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__237; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__238; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__239; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__240; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__241 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__238) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__242) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__235)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg mc0) forced) with
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

# 239 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 874 "Vuna/Compiler/Elab/Dict.vuna"
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
# 889 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__259, dtb__260) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar mc0) mc1) dtb__259) then true else (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar mc0) mc1) dtb__260))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 871 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec arg -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) 64) arg))

# 866 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__261, dtb__262) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg mc0) dtb__261) then true else ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg mc0) dtb__262))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 863 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

# 278 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drigidSearchFast = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dom) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom)) else false))

# 62 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel = (fun globals ctx fuel ec0 dom sp -> ((fun ec -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun _u -> (match ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup ctx) 0) dom) ec) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__263) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__263))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom)) else false) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__264; Base_dPair.f_Base_dPair_dPair_second = dtb__265 } -> (match dtb__264 with
  | Base_dList.C_Base_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__266) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__266))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__267) -> (match dtb__267 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) dtb__265) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dblanketInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__268; Base_dPair.f_Base_dPair_dPair_second = dtb__269 } -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__268) dtb__269)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__270) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__270))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dtryViaDict globals) ctx) (fuel - 1)) dtb__265) dom) sp))
  | _ -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__264) dtb__265)
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) ec) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dspecificInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["search: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " rigid="; (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then "T" else "F"); " insts="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))])) else 0)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decBump ec0) "elab.inst.search")))
# 166 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dtryViaDict = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__271) -> (match dtb__271 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__272, dtb__273) -> (if ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom) then ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) dtb__272) dtb__273) 0) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))
# 175 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dtryViaArgs = (fun globals ctx fuel ec sp fam args idx -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)) else (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__274, dtb__275) -> (match (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf ec) fam) dtb__274) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) fam) dtb__275) (idx + 1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__276) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) (fuel - 1)) ec) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (fam, (((v_Vuna_dCompiler_dElab_dDict_dreplaceAt idx) dtb__276) args)))))) sp)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 323 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dmatchInstances = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__277, dtb__278) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__278) mc7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> (match dtb__279 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__280; Base_dPair.f_Base_dPair_dPair_second = dtb__281 } -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) dtb__281) mc4) mc5) dtb__278) (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst = dtb__277; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm = dtb__280 }, mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dtryMatchInst mc0) mc1) mc2) mc3) dtb__277) mc4) mc5))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc7); Base_dPair.f_Base_dPair_dPair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))
# 331 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dtryMatchInst = (fun globals ctx fuel ec inst dom sp -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan) ctx) ec) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__282; Base_dPair.f_Base_dPair_dPair_second = dtb__283 } -> ((fun _u -> ((fun hd -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__283)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__283)) 0) dom) hd) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__284) -> ((fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["inst-conv-err: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " hd="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue hd)])) else 0))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__285) -> ((fun ec2 -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas ec2) dtb__282) with
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
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dList.v_Base_dList_dmap (fun m -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dList.C_Base_dList_dList_Nil)))) dtb__282)) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["inst-try: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " head="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " tele="; (bi_strFromInt (Base_dList.v_Base_dList_dlength (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))])) else 0))
  | _ -> failwith "DT: impossible branch"
)))
# 384 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__290, dtb__291) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__292) -> (match dtb__292 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__293; Base_dPair.f_Base_dPair_dPair_second = dtb__294 } -> (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs mc0) mc1) mc2) dtb__294) mc4) dtb__291) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__293; Base_dPair.f_Base_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__295) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel mc0) mc1) mc2) mc3) dtb__290) mc4))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc6); Base_dPair.f_Base_dPair_dPair_second = mc3 }))
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn = (fun globals ctx ec dom sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) 16) ec) dom) sp))

# 46 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec dom sp -> (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn Base_dList.C_Base_dList_dList_Nil) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dom) sp))

# 897 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dclassHasProjection = (fun className short name ec -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName className) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__296) -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__296).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) = name)
  | _ -> failwith "DT: impossible branch"
))

# 903 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dopShortOf = (fun name -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 909 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disEqMethod = (fun ec name -> (if (if (if (if (if (if (if ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "==") then true else ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "/=")) then true else ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "eq")) then true else ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "neq")) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "eq") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "neq") name) ec)) then true else (name = "==")) then true else (name = "/=")))

# 920 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disCmpMethod = (fun ec name -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "<") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "<=")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = ">")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = ">=")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "lt")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "le")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "gt")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "ge")) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "lt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "le") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "gt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "ge") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "<") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "<=") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") ">") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") ">=") name) ec)) then true else (name = "<")) then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then true else (name = "lt")) then true else (name = "le")) then true else (name = "gt")) then true else (name = "ge")))

# 953 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName = (fun ec name -> (if (if (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "+") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "add")) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "add") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "+") name) ec)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("+")) else (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "sub") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "-") name) ec)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("-")) else (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "mul") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "*") name) ec)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("*")) else (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "div") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "/") name) ec)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("/")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))

# 962 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmethodShortOf = (fun name -> (Base_dPair.v_Base_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 966 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf = (fun name -> (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf name))

# 969 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf = (fun name -> (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf name))

# 974 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmethodNameAliases = (fun mc0 -> (if (mc0 = "==") then (Base_dList.C_Base_dList_dList__x58__x58_ ("eq", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "eq") then (Base_dList.C_Base_dList_dList__x58__x58_ ("==", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "/=") then (Base_dList.C_Base_dList_dList__x58__x58_ ("neq", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "neq") then (Base_dList.C_Base_dList_dList__x58__x58_ ("/=", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "<") then (Base_dList.C_Base_dList_dList__x58__x58_ ("lt", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "lt") then (Base_dList.C_Base_dList_dList__x58__x58_ ("<", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "<=") then (Base_dList.C_Base_dList_dList__x58__x58_ ("le", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "le") then (Base_dList.C_Base_dList_dList__x58__x58_ ("<=", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = ">") then (Base_dList.C_Base_dList_dList__x58__x58_ ("gt", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "gt") then (Base_dList.C_Base_dList_dList__x58__x58_ (">", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = ">=") then (Base_dList.C_Base_dList_dList__x58__x58_ ("ge", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "ge") then (Base_dList.C_Base_dList_dList__x58__x58_ (">=", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "+") then (Base_dList.C_Base_dList_dList__x58__x58_ ("add", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "add") then (Base_dList.C_Base_dList_dList__x58__x58_ ("+", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "-") then (Base_dList.C_Base_dList_dList__x58__x58_ ("sub", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "sub") then (Base_dList.C_Base_dList_dList__x58__x58_ ("-", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "*") then (Base_dList.C_Base_dList_dList__x58__x58_ ("mul", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "mul") then (Base_dList.C_Base_dList_dList__x58__x58_ ("*", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "/") then (Base_dList.C_Base_dList_dList__x58__x58_ ("div", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "div") then (Base_dList.C_Base_dList_dList__x58__x58_ ("/", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = ">>=") then (Base_dList.C_Base_dList_dList__x58__x58_ ("bind", Base_dList.C_Base_dList_dList_Nil)) else (if (mc0 = "bind") then (Base_dList.C_Base_dList_dList__x58__x58_ (">>=", Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)))))))))))))))))))))))

# 1000 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dhasMethodShort = (fun methods short -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection methods) short) <> short))

# 1004 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dprojectionFor = (fun cls short -> (if ((v_Vuna_dCompiler_dElab_dDict_dhasMethodShort (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) else (match (v_Vuna_dCompiler_dElab_dDict_dmethodNameAliases short) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__297, dtb__298) -> (if ((v_Vuna_dCompiler_dElab_dDict_dhasMethodShort (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) dtb__297) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) dtb__297) else short)
  | Base_dList.C_Base_dList_dList_Nil -> short
  | _ -> failwith "DT: impossible branch"
)))

# 1052 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals ctx mname tyTerm aTerm bTerm sp dictTy ec -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__299; Base_dPair.f_Base_dPair_dPair_second = dtb__300 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__299, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dPair.f_Base_dPair_dPair_second = ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__300) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) dictTy) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (sp))) 0) } }))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

# 1089 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disLtShort = (fun m -> (if (m = "<") then true else (m = "lt")))

# 1092 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disLeShort = (fun m -> (if (m = "<=") then true else (m = "le")))

# 1095 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disGtShort = (fun m -> (if (m = ">") then true else (m = "gt")))

# 1070 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun mc0 mc1 mc2 -> (if (mc2 = "Int") then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_int")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_int")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_int")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_int"))))) else (if (mc2 = "String") then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_str")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_str")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_str")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_str"))))) else (if (mc2 = "Float") then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_float")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_float")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_float")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_float"))))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical mc2) then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_bool")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_bool")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_bool")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_bool"))))) else ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OpNotDefinedFor (mc1, mc2))) mc1) mc2))))))

# 1108 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__301, dtb__302) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__301)) then true else ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) dtb__302))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, dtb__304) -> (match dtb__303 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__305; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__306; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__307; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__308; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__309; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__310 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc4) dtb__308) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) mc4) dtb__308) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__311, dtb__312) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__312) dtb__307) dtb__311) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__313) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) dtb__313) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__314) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__314))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__315) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousInstance ("effect instance", ((Base_dString.v_Base_dString_djoin ", ") dtb__315)))) "effect instance") ((Base_dString.v_Base_dString_djoin ", ") dtb__315))
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> (match (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm mc1) mc4) dtb__308) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__316) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta mc4) dtb__307) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__316)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__317) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) dtb__317) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__318) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__318))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__319) -> (match dtb__319 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__320; Base_dPair.f_Base_dPair_dPair_second = dtb__321 } -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__321) dtb__307) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__320)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__322) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) dtb__322) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__323) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__323))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify mc1) mc4) dtb__308))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc4) dtb__308) with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, mc5)))
  | dtb__324 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc4) dtb__324) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, mc5))) else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc4) dtb__308) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc4)) else false) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, mc5))) else ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__325) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, mc5)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__326) -> (match dtb__326 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__327; Base_dPair.f_Base_dPair_dPair_second = dtb__328 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__328)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__328)) 0) dtb__307) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__327)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__329) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__328) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__329))) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__330) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__304) mc4) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__303, mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc4) dtb__308)) mc2))))
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc4) (Base_dList.v_Base_dList_dreverse mc5))))
  | _ -> failwith "DT: impossible branch"
))

# 579 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx = (fun globals ctx ec sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo globals) ctx) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) ec) Base_dList.C_Base_dList_dList_Nil))

# 669 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__331; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__332; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__333; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__334; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__335; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__336 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc1) dtb__334) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) 0) mc1) dtb__334) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__337, dtb__338) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__338) dtb__333) dtb__337) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__339) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__339))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__340) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__341) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc1) mc3) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | dtb__342 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc1) dtb__342) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc1) mc3) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc1)) else false) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__343) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__344) -> (match dtb__344 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__345; Base_dPair.f_Base_dPair_dPair_second = dtb__346 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__346)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__346)) 0) dtb__333) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Nil) dtb__345)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__347) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__346) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__347))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__348) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance mc1) mc3) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))))
))
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel = (fun fuel globals ec0 -> (if (fuel <= 0) then ec0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__349, dtb__350) -> (match dtb__349 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__351; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__352; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__354; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__356 } -> ((fun ec -> ((fun ec1 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__353) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec1)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__357) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun solsNow -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decTriedAt ec1) dtb__351) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__358) -> (if (dtb__358 = solsNow) then ((fun ec2 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec2) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__349, Base_dList.C_Base_dList_dList_Nil))))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)) else ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__349) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__359) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__359)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dList.C_Base_dList_dList__x58__x58_ (kept, Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__351) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsCountOf ec1))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__351; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__352; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__354) then dtb__354 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__356 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__354)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__349) forced) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__360) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__360)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dList.C_Base_dList_dList__x58__x58_ (kept, Base_dList.C_Base_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__351) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__351; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__352; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__354) then dtb__354 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__356 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__354))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsCountOf ec1))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) dtb__350))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decBump ec0) "elab.dict.round"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ec0
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec0))))

# 613 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals ec -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictPassIdle ec) then ec else (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPassMarker (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) + 1)) globals) ec))))

# 1102 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

# 1022 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__361) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) dtb__361)) (fun rt -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dPair.f_Base_dPair_dPair_second = ec } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_EqRequiresEvidence (st))) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__362) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__363) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__363)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__364) -> (match dtb__364 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__365; Base_dPair.f_Base_dPair_dPair_second = dtb__366 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__365, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__366 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__362)), (Base_dList.C_Base_dList_dList__x58__x58_ (aTy, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (name = "==") then true else (name = "/=")) then true else (name = "eq")) then true else (name = "neq")) then ((v_Vuna_dCompiler_dElab_dDict_dprojectionFor dtb__362) (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1117 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__367) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) dtb__367)) (fun rt -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dPair.f_Base_dPair_dPair_second = ec } }))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun st -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OpNotDefinedFor ((v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name), st))) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__368) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__369) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__369)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__370) -> (match dtb__370 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__371; Base_dPair.f_Base_dPair_dPair_second = dtb__372 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__371, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dPair.f_Base_dPair_dPair_second = dtb__372 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__368)), (Base_dList.C_Base_dList_dList__x58__x58_ (aTy, Base_dList.C_Base_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then true else (name = "lt")) then true else (name = "le")) then true else (name = "gt")) then true else (name = "ge")) then ((v_Vuna_dCompiler_dElab_dDict_dprojectionFor dtb__368) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name a b -> (if (name = "&&") then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, b, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (true)), b))))

# 1150 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__373, dtb__374) -> (match dtb__373 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__375; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__376; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__377; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__378; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__379; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__380 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__378) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__377) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__378))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__381) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__374)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__374))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1147 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1164 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__382, dtb__383) -> (match dtb__382 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__384; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__385; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__386; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__387; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__388; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__389 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__386) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__390) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__383)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__383) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__383) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__383) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__383) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__387))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1185 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__391, dtb__392) -> (match dtb__391 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__393; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__394; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__395; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__396; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__397; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__398 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__395) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__399) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__392)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then dtb__397 else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__392))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__396))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1181 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1200 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__400, dtb__401) -> (match dtb__400 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__402; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__403; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__404; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__405; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__406; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__407 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__405) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__404) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> dtb__406
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__408) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__401)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__401))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1196 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1212 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__409, dtb__410) -> (match dtb__409 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__411; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__412; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__413; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__414; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__415; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__416 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__413) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__417) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__410)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__410) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__410) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__410) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__410) else dtb__415))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__414))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1208 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1229 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__418, dtb__419) -> (match dtb__418 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__420; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__421; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__422; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__423; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__424; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__425 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__422) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__426) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__419)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__419) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__419) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__419) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__419) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__422))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__423))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1225 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))
