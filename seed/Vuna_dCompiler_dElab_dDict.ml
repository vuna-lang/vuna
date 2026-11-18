open Vuna_runtime
type t_Vuna_dCompiler_dElab_dDict_dInstMatch = { f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm }
and t_Vuna_dCompiler_dElab_dDict_dRowProofKind = C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofYes | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofNo | C_Vuna_dCompiler_dElab_dDict_dRowProofKind_RowProofUnknown
and t_Vuna_dCompiler_dElab_dDict_dMemberLookup = C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous of (string Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dElab_dDict_dLabelCand = C_Vuna_dCompiler_dElab_dDict_dLabelCand_MkLabelCand of (string) * (int)
and t_Vuna_dCompiler_dElab_dDict_dDictTermTask = C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine of (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig Base_dData_dList.t_Base_dData_dList_dList)

# 35 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disDictFamily = (fun ec g -> ((Base_dData_dList.v_Base_dData_dList_dmemName g) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass) -> (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName c)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec))))

# 28 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disDictValue = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__0) -> (match dtb__0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__1, dtb__2) -> ((v_Vuna_dCompiler_dElab_dDict_disDictFamily mc0) dtb__1)
  | _ -> false
)
  | _ -> false
))

# 25 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disDictDomain = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_disDictValue ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 55 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dinstMatchInst = (fun (mc0 : t_Vuna_dCompiler_dElab_dDict_dInstMatch) -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst = dtb__3; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm = dtb__4 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfindClass = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtClass Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__5) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__5)) else ((v_Vuna_dCompiler_dElab_dDict_dfindClass mc0) dtb__6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfamOfClass = (fun ec cn -> (match ((v_Vuna_dCompiler_dElab_dDict_dfindClass cn) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__7) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__7))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyViaClassFam = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : string) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match ((v_Vuna_dCompiler_dElab_dDict_dfamOfClass mc0) dtb__8) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__10) -> (if (dtb__10 = mc1) then true else (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam mc0) mc1) dtb__9))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam mc0) mc1) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam = (fun ec d fam -> (((v_Vuna_dCompiler_dElab_dDict_danyViaClassFam ec) fam) (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataViaClasses))

# 119 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dapplyDataPis = (fun ec n v args -> (if (n <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (v)) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> ((((v_Vuna_dCompiler_dElab_dDict_dapplyDataPis ec) (n - 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__17) dtb__11)) dtb__12)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 132 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaFieldType = (fun ec d c args -> (if ((Base_dData_dList.v_Base_dData_dList_dlength args) <> (Base_dData_dList.v_Base_dData_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dElab_dDict_dapplyDataPis ec) (Base_dData_dList.v_Base_dData_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c))) args) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__18) -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__18) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__22))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 159 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape = (fun ec d wargs -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) (Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec))) then (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__24, dtb__25) -> ((((v_Vuna_dCompiler_dElab_dDict_dviaFieldType ec) d) dtb__24) wargs)
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))

# 152 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaWrapperData = (fun ec fam w wargs -> (match ((Vuna_dCompiler_dElab_dRepresentation.v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData w) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__26) -> (if (((v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam ec) dtb__26) fam) then (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape ec) dtb__26) wargs) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf = (fun ec fam arg -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__27) -> (match dtb__27 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__28, dtb__29) -> ((((v_Vuna_dCompiler_dElab_dDict_dviaWrapperData ec) fam) dtb__28) dtb__29)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) arg)))

# 169 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyViaWrapper = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : string) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf mc0) mc1) dtb__30) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__32) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dElab_dDict_danyViaWrapper mc0) mc1) dtb__31)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__33) -> (match dtb__33 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__34, dtb__35) -> (((v_Vuna_dCompiler_dElab_dDict_danyViaWrapper ec) dtb__34) dtb__35)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 184 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dreplaceAt = (fun (mc0 : int) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, dtb__37) -> (if (mc0 <= 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc1, dtb__37)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, (((v_Vuna_dCompiler_dElab_dDict_dreplaceAt (mc0 - 1)) mc1) dtb__37))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dspecificInstances = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__38) then (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__39) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, (v_Vuna_dCompiler_dElab_dDict_dspecificInstances dtb__39))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dblanketInstances = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (if (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__40) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__41))) else (v_Vuna_dCompiler_dElab_dDict_dblanketInstances dtb__41))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue = (fun ec v -> (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dzonkTerm ec) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))))

# 296 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc4 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 } -> ((fun v -> (if ((v_Vuna_dCompiler_dElab_dDict_disDictValue mc3) v) then (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl mc3)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc3)) 0) v) mc2) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__46) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__44, mc1, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__46)) }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__47) -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43)
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue mc0) mc1) dtb__45)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 290 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupExact = (fun ctx i dom ec -> (match (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> (((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo ctx) i) dom) ec) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems)
))

# 287 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup = (fun ctx i dom ec -> ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupExact ctx) i) dom) ec))

# 316 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__48) -> (match dtb__48 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__49, dtb__50) -> dtb__49
  | _ -> ""
)
  | _ -> ""
))

# 216 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsearchCandidates = (fun ec dom -> ((fun fam -> (if (fam = "") then (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec) else ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) fam))) (v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))

# 345 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__51) -> dtb__51
  | _ -> ""
))

# 339 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName = (fun i -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__52) -> (match dtb__52 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> (match dtb__54 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__55))
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ""
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead)))

# 331 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_disBlanketInst dtb__57)) then ((v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName dtb__57) = mc0) else false) then true else ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo mc0) dtb__58))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance = (fun ec tyName -> ((v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo tyName) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInstsFamily ec) (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName))))

# 349 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disMonoInst = (fun i -> (match (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (i).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> false
))

# 359 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dallInstancesMono = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (if (v_Vuna_dCompiler_dElab_dDict_disMonoInst dtb__59) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono dtb__60) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dallocMetaAt = (fun (mc0 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (match mc0 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__61) -> (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt dtb__61) mc1) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dnewMeta mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dtermMetaId = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__62) -> dtb__62
  | _ -> 0
))

# 402 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas = (fun (mc0 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan Base_dData_dMaybe.t_Base_dData_dMaybe_dMaybe) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc3 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (match (((v_Vuna_dCompiler_dElab_dDict_dallocMetaAt mc0) mc1) mc2) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__65; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__66 } -> (match ((((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas mc0) mc1) dtb__66) dtb__64) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__67; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 } -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dDict_dtermMetaId dtb__65), dtb__67)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__69, dtb__70) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__69) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__71) -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas mc0) dtb__70) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__72) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__71, dtb__72))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowMemDomName = "Base.Effect.Core.rowMem"

# 445 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowYesDomName = "Base.Effect.Core.Yes"

# 448 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowNoDomName = "Base.Effect.Core.No"

# 452 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drowYesCtorName = "Base.Effect.Core.Yes.MkYes"

# 458 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberDomName = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName

# 462 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dhereCtorName = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberHereCtor

# 466 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dthereCtorName = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberThereCtor

# 476 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disMemberDomain = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__73, dtb__74, dtb__75) -> (match dtb__73 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__76, dtb__77, dtb__78) -> (match dtb__76 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__79) -> (dtb__79 = v_Vuna_dCompiler_dElab_dDict_dmemberDomName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote 0) dom)))

# 482 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberSpine = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__80) -> (match dtb__80 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__81, dtb__82) -> (if (dtb__81 = v_Vuna_dCompiler_dElab_dDict_dmemberDomName) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (match dtb__84 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__83; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__85 }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__82) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
))

# 492 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctorValue = (fun ec name vals -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__87) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__87), vals))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (name, vals))
  | _ -> failwith "DT: impossible branch"
))

# 508 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberProbe = (fun ec depth a b -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) a) b) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__88) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__89) -> false
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberNameText = (fun ec v -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__90) -> dtb__90
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
))

# 525 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dlabelCandName = (fun (mc0 : t_Vuna_dCompiler_dElab_dDict_dLabelCand) -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dLabelCand_MkLabelCand (dtb__91, dtb__92) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dlabelCandIdx = (fun (mc0 : t_Vuna_dCompiler_dElab_dDict_dLabelCand) -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dDict_dLabelCand_MkLabelCand (dtb__93, dtb__94) -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dlabelCandText = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__95) -> (match dtb__95 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__96, dtb__97) -> (if (dtb__96 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffNamedName) then (match dtb__97 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__98, dtb__99) -> ((v_Vuna_dCompiler_dElab_dDict_dmemberNameText ec) dtb__98)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
) else ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v))
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)
  | _ -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt 6) v)
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

# 544 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dlabelScan = (fun fuel depth sols ec eF rF idx acc -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__100, dtb__101) -> (if (dtb__100 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = true })) else (if (dtb__100 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__102, dtb__103) -> (match dtb__103 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__104, dtb__105) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue sols) dtb__102) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun matched -> ((fun acc2 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dlabelScan (fuel - 1)) depth) sols) ec) eF) dtb__104) (idx + 1)) acc2)) (if matched then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dElab_dDict_dLabelCand_MkLabelCand (((v_Vuna_dCompiler_dElab_dDict_dlabelCandText ec) dtb__102), idx)), acc)) else acc))) ((((v_Vuna_dCompiler_dElab_dDict_dmemberProbe ec) depth) eF) dtb__102)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__101) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__106) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = false }))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))

# 569 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dmemberProofAtLabel = (fun fuel depth ec eF rF target -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "member proof") else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) rF) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__107, dtb__108) -> (if (dtb__107 = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110) -> (match dtb__110 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (if (target <= 0) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) depth) eF) dtb__109)) (fun (ec1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dctorValue ec1) v_Vuna_dCompiler_dElab_dDict_dhereCtorName) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (eF, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, Base_dData_dList.C_Base_dData_dList_dList_Nil))))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec1 })))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDict_dmemberProofAtLabel (fuel - 1)) depth) ec) eF) dtb__111) (target - 1))) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dctorValue (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)) v_Vuna_dCompiler_dElab_dDict_dthereCtorName) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (eF, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf p), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })))))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed row in member proof")
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "malformed row in member proof")
)) dtb__108) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "member proof target out of range"))
  | _ -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "member proof target out of range")
)))

# 584 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowLabel = (fun fuel depth ec eVal rVal -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun eF -> ((fun sols -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__113) -> (match dtb__113 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__114; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__115 } -> (match dtb__114 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if dtb__115 then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent else C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__116, dtb__117) -> (match dtb__117 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__118) -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__119) -> (match dtb__119 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__120; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__121 } -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__120, dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dmemberProofAtLabel (fuel - 1)) depth) ec) eF) rVal) (v_Vuna_dCompiler_dElab_dDict_dlabelCandIdx dtb__116)))
  | _ -> (C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dDict_dlabelCandName) dtb__114)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dlabelScan 64) depth) sols) ec) eF) rVal) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) eVal))))

# 498 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmemberLookup = (fun fuel depth ec dom -> (if (fuel <= 0) then C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__122) -> (match dtb__122 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__123; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__124 } -> (((((v_Vuna_dCompiler_dElab_dDict_dmemberLookupRowLabel fuel) depth) ec) dtb__123) dtb__124)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dDict_dmemberSpine dom))))

# 606 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) (mc2 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__125, dtb__126) -> (match dtb__125 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__127; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__128 } -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__128) = mc2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__127, mc1, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })))) else (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo dtb__126) (mc1 + 1)) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 614 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm = (fun ctx ec dom -> (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dom))))

# 623 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc1 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : int) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__129, dtb__130) -> (match dtb__129 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__131; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__132 } -> ((fun olderDepth -> ((fun tyVal -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc mc3) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc0)) tyVal) mc4) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__133) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__131, mc2, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__133 }))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__134) -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo mc0) dtb__130) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dData_dList.v_Base_dData_dList_dmap ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_drefineValue (mc0).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxRefVals) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel)) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt dtb__130) 0) olderDepth))) dtb__132))) (Base_dData_dList.v_Base_dData_dList_dlength dtb__130))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 620 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify = (fun ctx ec dom -> (((((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo ctx) (ctx).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dCtx_ctxItems) 0) ec) dom))

# 636 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta = (fun ec m v -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) m) Base_dData_dList.C_Base_dData_dList_dList_Nil) v) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__135) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__135))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__136) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__136))
  | _ -> failwith "DT: impossible branch"
))

# 888 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__137) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair) -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)) (dtb__137).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele)) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)) (dtb__137).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx)))) else ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo mc0) dtb__138))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 885 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst = (fun ec g -> ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))

# 905 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dpiRigs = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__141, (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__143)))
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 896 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal = (fun ec g -> (match ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst ec) g) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__144) -> dtb__144
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) g) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__145) -> (v_Vuna_dCompiler_dElab_dDict_dpiRigs dtb__145)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 846 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt = (fun fuel ec depth task -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine (dtb__146, dtb__147, dtb__148) -> (match dtb__147 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__149, dtb__150) -> ((fun argTerm -> ((fun r -> ((fun restRigs -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__146, argTerm, r)), dtb__150, restRigs)))) (match dtb__148 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__151, dtb__152) -> dtb__152
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) (match dtb__148 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__153, dtb__154) -> dtb__153
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega
  | _ -> failwith "DT: impossible branch"
))) (match ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (dtb__149))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__155) -> dtb__155
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) dtb__149)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__146))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (dtb__156) -> (match dtb__156 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__157) -> (match dtb__157 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__158, dtb__159) -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__158)), dtb__159, ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__158))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dtb__156) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__160) -> (match dtb__160 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__161, dtb__162) -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt (fuel - 1)) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermSpine ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__161)), dtb__162, ((v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal ec) dtb__161))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
)) task)))

# 843 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt = (fun ec depth v -> ((((v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt 64) ec) depth) (C_Vuna_dCompiler_dElab_dDict_dDictTermTask_DictTermValue (v))))

# 786 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__163, dtb__164, dtb__165) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__163), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__164), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__165)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__166, dtb__167) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__166), ((Base_dData_dList.v_Base_dData_dList_dmap (fun (alt : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt mc0) mc1) alt))) dtb__167)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__168, dtb__169) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__168, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__169)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__170, dtb__171) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__170, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__171)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__172, dtb__173) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__172, ((Base_dData_dList.v_Base_dData_dList_dmap (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p) })) dtb__173)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__174, dtb__175, dtb__176) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__174), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__175), dtb__176))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> ((fun slot2 -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__177, dtb__178, slot2, dtb__180, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__181)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__182) -> (match dtb__182 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__183; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__184 } -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlamTyOf (match dtb__183 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__185) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__185)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__184 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__186) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__186)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__179))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__187, dtb__188, dtb__189, (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) mc1) dtb__190), (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + 1)) dtb__191)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__192) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__192) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> mc2
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__193) -> (match (((v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt mc0) mc1) dtb__193) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__194) -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) dtb__194) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar dtb__194)) then mc2 else dtb__194)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun soln0 -> (if (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar mc1) soln0) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar soln0)) then mc2 else soln0)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote mc1) dtb__193))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
# 830 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) -> (match mc2 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__195; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__196; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__197 } -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__195; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__196; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo mc0) (mc1 + (Base_dData_dList.v_Base_dData_dList_dlength dtb__196))) dtb__197) }
  | _ -> failwith "DT: impossible branch"
))

# 783 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm = (fun ec t -> (((v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo ec) 0) t))

# 913 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__198, dtb__199) -> (String.concat "" [", "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__198); (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__199)])
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 909 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_djoinInstNames = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__200, dtb__201) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__200) ^ (v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames dtb__201))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 935 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel = (fun fuel ec v lvl acc -> (if (fuel <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse acc) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> (if dtb__203 then (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel (fuel - 1)) ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__206) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__202, lvl, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) (lvl + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, acc))) else (Base_dData_dList.v_Base_dData_dList_dreverse acc))
  | _ -> (Base_dData_dList.v_Base_dData_dList_dreverse acc)
)))

# 932 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dctorParamKinds = (fun ec v lvl acc -> (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel 64) ec) v) lvl) acc))

# 951 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__207) -> (match dtb__207 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__208, dtb__209) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__208))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 919 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictArgKinds = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf ec) dom) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__210) -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup dtb__210) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__211) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__211) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__212, dtb__213) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((((v_Vuna_dCompiler_dElab_dDict_dctorParamKinds ec) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__212)))) 0) Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 945 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictArgKind = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__214) -> (match dtb__214 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__215))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dElab_dDict_ddictArgKinds ec) dom)))

# 972 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__217) -> (match dtb__217 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__218, dtb__219) -> (match dtb__219 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__220, dtb__221) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__218, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 959 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind = (fun globals ec ctx forced argKind -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__222) -> (match dtb__222 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__223, dtb__224) -> (match dtb__224 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup globals) ec) dtb__223) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__225) -> (match ((((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dconvEc ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argKind) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__225))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__226) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__227) -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)))

# 978 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictClassArgs = (fun ec dom -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__228) -> (match dtb__228 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__229, dtb__230) -> dtb__230
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 984 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictClassArg = (fun ec dom -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__231, dtb__232) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__231))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmissingInstance = (fun ec dom sp -> ((fun forced -> ((fun sd -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((fun td -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_InterpNoInstance (td))) td)) (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) forced) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__233) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue ec) dtb__233)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> sd
  | _ -> failwith "DT: impossible branch"
)) else (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound (sd))) sd))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue forced))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom)))

# 232 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc1 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc2 : t_Vuna_dCompiler_dElab_dDict_dInstMatch Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (match dtb__235 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (dtb__234).f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 }))
  | _ -> ((fun _u -> ((fun sd -> ((fun names -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc1) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousInstance (sd, names))) sd) names)) (v_Vuna_dCompiler_dElab_dDict_djoinInstNames ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dDict_dinstMatchInst) mc2)))) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["search-ambig: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue mc0); " cands="; ((Base_dData_dString.v_Base_dData_dString_djoin ",") ((Base_dData_dList.v_Base_dData_dList_dmap (fun (x : t_Vuna_dCompiler_dElab_dDict_dInstMatch) -> (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName (v_Vuna_dCompiler_dElab_dDict_dinstMatchInst x)))) mc2))])) else 0))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance mc3) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__236, dtb__237) -> (match dtb__236 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__238; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__239; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__240; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__241; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__242; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__243 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__240) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__244) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__237)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg mc0) forced) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__245) -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) dtb__245)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo mc0) dtb__237))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__241))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1005 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar = (fun ec fuel v -> (if (fuel <= 0) then false else (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__246) -> (match dtb__246 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__247, dtb__248, dtb__249) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__250, dtb__251) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__251)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__252, dtb__253) -> (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar ec) (fuel - 1)) dtb__253)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__254, dtb__255) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__254) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__255))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__256, dtb__257) -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__256)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__258, dtb__259, dtb__260) -> (if (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__258) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__259)) then true else (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) (fuel - 1)) dtb__260))
  | _ -> false
)))
# 1021 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__261, dtb__262) -> (if (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar mc0) mc1) dtb__261) then true else (((v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar mc0) mc1) dtb__262))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1002 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disRigidClassArg = (fun ec arg -> (((v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar ec) 64) arg))

# 997 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__263, dtb__264) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidClassArg mc0) dtb__263) then true else ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg mc0) dtb__264))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disRigidDictArg = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

# 312 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_drigidSearchFast = (fun ec dom -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dom) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom)) else false))

# 64 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel = (fun globals ctx fuel ec0 dom sp -> ((fun ec -> (if (fuel <= 0) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun _u -> (match ((((v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup ctx) 0) dom) ec) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__265) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__265))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then (Base_dData_dBool.v_Base_dData_dBool_dnot ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom)) else false) then (((v_Vuna_dCompiler_dElab_dDict_dmissingInstance ec) dom) sp) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__266; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__267 } -> (match dtb__266 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__268) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__268))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__269) -> (match dtb__269 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) dtb__267) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dblanketInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__270; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__271 } -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__270) dtb__271)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__272) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__272))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dtryViaDict globals) ctx) (fuel - 1)) dtb__267) dom) sp))
  | _ -> ((((v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch dom) sp) dtb__266) dtb__267)
)
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances globals) ctx) fuel) ec) dom) sp) (v_Vuna_dCompiler_dElab_dDict_dspecificInstances ((v_Vuna_dCompiler_dElab_dDict_dsearchCandidates ec) dom))) Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["search: dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " rigid="; (if ((v_Vuna_dCompiler_dElab_dDict_drigidSearchFast ec) dom) then "T" else "F"); " insts="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts ec)))])) else 0)))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decBump ec0) "elab.inst.search")))
# 189 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dtryViaDict = (fun globals ctx fuel ec dom sp -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__273) -> (match dtb__273 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__274, dtb__275) -> (if ((v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists ec) dom) then ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) dtb__274) dtb__275) 0) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) dom))))
# 199 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dtryViaArgs = (fun globals ctx fuel ec sp fam args idx -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)) else (match args with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__276, dtb__277) -> (match (((v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf ec) fam) dtb__276) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dtryViaArgs globals) ctx) (fuel - 1)) ec) sp) fam) dtb__277) (idx + 1))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__278) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) (fuel - 1)) ec) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (fam, (((v_Vuna_dCompiler_dElab_dDict_dreplaceAt idx) dtb__278) args)))))) sp)) (fun (p : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 363 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dmatchInstances = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : int) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc4 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) (mc5 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc6 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtInst Base_dData_dList.t_Base_dData_dList_dList) (mc7 : t_Vuna_dCompiler_dElab_dDict_dInstMatch Base_dData_dList.t_Base_dData_dList_dList) -> (match mc6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__279, dtb__280) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__280) mc7)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__281) -> (match dtb__281 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__282; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__283 } -> ((((((((v_Vuna_dCompiler_dElab_dDict_dmatchInstances mc0) mc1) mc2) dtb__283) mc4) mc5) dtb__280) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchInst = dtb__279; f_Vuna_dCompiler_dElab_dDict_dInstMatch_instMatchTerm = dtb__282 }, mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dtryMatchInst mc0) mc1) mc2) mc3) dtb__279) mc4) mc5))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc7); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))
# 373 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dtryMatchInst = (fun globals ctx fuel ec inst dom sp -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match ((((v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstSpan) ctx) ec) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__284; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__285 } -> ((fun _u -> ((fun hd -> (match (((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dconv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__285)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__285)) 0) dom) hd) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__286) -> ((fun _u -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["inst-conv-err: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " dom="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dom); " hd="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue hd)])) else 0))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__287) -> ((fun ec2 -> (match ((v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas ec2) dtb__284) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__288) -> ((fun teleArgs -> ((fun env2 -> ((fun ctxVals -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__289) -> (match dtb__289 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__290; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst)))) ((Base_dData_dList.v_Base_dData_dList_dappend teleArgs) dtb__290)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs globals) ctx) (fuel - 1)) ec2) sp) ctxVals) Base_dData_dList.C_Base_dData_dList_dList_Nil))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval env2) t)))) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstCtx))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v))) dtb__288))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (v : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec2) v)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 })) (Base_dData_dList.v_Base_dData_dList_dreverse dtb__288)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__285) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__287)))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval ((Base_dData_dList.v_Base_dData_dList_dmap (fun (m : int) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) dtb__284)) (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["inst-try: "; (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtInstName inst); " head="; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstHead); " tele="; (bi_strFromInt (Base_dData_dList.v_Base_dData_dList_dlength (inst).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtInst_dtInstTele))])) else 0))
  | _ -> failwith "DT: impossible branch"
)))
# 428 "Vuna/Compiler/Elab/Dict.vuna"
and v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : int) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc4 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc5 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) (mc6 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__292, dtb__293) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__294) -> (match dtb__294 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__295; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__296 } -> (((((((v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs mc0) mc1) mc2) dtb__296) mc4) dtb__293) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__295; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega }, mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__297) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel mc0) mc1) mc2) mc3) dtb__292) mc4))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse mc6); Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc3 }))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn = (fun globals ctx ec dom sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel globals) ctx) 16) ec) dom) sp))

# 48 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dsearchInstance = (fun ec dom sp -> (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn Base_dData_dList.C_Base_dData_dList_dList_Nil) Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_demptyCtx) ec) dom) sp))

# 1029 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dclassHasProjection = (fun className short name ec -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName className) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__298) -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (dtb__298).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) = name)
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dopShortOf = (fun name -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dlastSeg name))

# 1042 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disEqMethod = (fun ec name -> (if (if (if (if (if (if (if ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "==") then true else ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "/=")) then true else ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "eq")) then true else ((v_Vuna_dCompiler_dElab_dDict_dopShortOf name) = "neq")) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "eq") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Eq") "neq") name) ec)) then true else (name = "==")) then true else (name = "/=")))

# 1055 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disCmpMethod = (fun ec name -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "<") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "<=")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = ">")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = ">=")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "lt")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "le")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "gt")) then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "ge")) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "lt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "le") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "gt") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "ge") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "<") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") "<=") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") ">") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Ord") ">=") name) ec)) then true else (name = "<")) then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then true else (name = "lt")) then true else (name = "le")) then true else (name = "gt")) then true else (name = "ge")))

# 1093 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName = (fun ec name -> (if (if (if (if ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "+") then true else ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf name) = "add")) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "add") name) ec)) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "+") name) ec)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("+")) else (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "sub") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "-") name) ec)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("-")) else (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "mul") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "*") name) ec)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("*")) else (if (if ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "div") name) ec) then true else ((((v_Vuna_dCompiler_dElab_dDict_dclassHasProjection "Num") "/") name) ec)) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ("/")) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))))

# 1107 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmethodShortOf = (fun name -> (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))))

# 1111 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf = (fun name -> (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf name))

# 1114 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf = (fun name -> (v_Vuna_dCompiler_dElab_dDict_dmethodShortOf name))

# 1119 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dmethodNameAliases = (fun (mc0 : string) -> (if (mc0 = "==") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("eq", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "eq") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("==", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "/=") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("neq", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "neq") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("/=", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "<") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("lt", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "lt") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("<", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "<=") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("le", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "le") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("<=", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = ">") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("gt", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "gt") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (">", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = ">=") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("ge", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "ge") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (">=", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "+") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("add", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "add") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("+", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "-") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("sub", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "sub") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("-", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "*") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("mul", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "mul") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("*", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "/") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("div", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "div") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("/", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = ">>=") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("bind", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (mc0 = "bind") then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (">>=", Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))))))))))))))))))

# 1145 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dhasMethodShort = (fun methods short -> (((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection methods) short) <> short))

# 1149 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dprojectionFor = (fun cls short -> (if ((v_Vuna_dCompiler_dElab_dDict_dhasMethodShort (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) short) else (match (v_Vuna_dCompiler_dElab_dDict_dmethodNameAliases short) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__299, dtb__300) -> (if ((v_Vuna_dCompiler_dElab_dDict_dhasMethodShort (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) dtb__299) then ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection (cls).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtClass_dtClassMethods) dtb__299) else short)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> short
  | _ -> failwith "DT: impossible branch"
)))

# 1201 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddeferEqDict = (fun globals ctx mname tyTerm aTerm bTerm sp dictTy ec -> ((fun m -> (match (((Vuna_dCompiler_dElab_dMetaSpans.v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt sp) ctx) ec) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__301; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__302 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__301, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((((((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decAddConstraint dtb__302) Vuna_dCompiler_dElab_dTypes.C_Vuna_dCompiler_dElab_dTypes_dConstraintKind_CkDict) m) dictTy) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (sp))) 0) } }))))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decNext ec)))

# 1248 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disLtShort = (fun m -> (if (m = "<") then true else (m = "lt")))

# 1251 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disLeShort = (fun m -> (if (m = "<=") then true else (m = "le")))

# 1254 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_disGtShort = (fun m -> (if (m = ">") then true else (m = "gt")))

# 1219 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName = (fun (mc0 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc1 : string) (mc2 : string) -> (if (mc2 = "Int") then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_int")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_int")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_int")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_int"))))) else (if (mc2 = "String") then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_str")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_str")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_str")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_str"))))) else (if (mc2 = "Float") then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_float")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_float")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_float")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_float"))))) else (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical mc2) then (if (v_Vuna_dCompiler_dElab_dDict_disLtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_lt_bool")) else (if (v_Vuna_dCompiler_dElab_dDict_disLeShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_le_bool")) else (if (v_Vuna_dCompiler_dElab_dDict_disGtShort mc1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_gt_bool")) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ("bi_ge_bool"))))) else ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc0) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OpNotDefinedFor (mc1, mc2))) mc1) mc2))))))

# 1267 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__303, dtb__304) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP mc0)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__303)) then true else ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) dtb__304))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 645 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dCtx) (mc2 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc3 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) (mc4 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc5 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, dtb__306) -> (match dtb__305 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__307; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__308; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__309; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__310; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__311; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__312 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc4) dtb__310) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc1)) mc4) dtb__310) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__313, dtb__314) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__314) dtb__309) dtb__313) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__315) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) dtb__315) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__316) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__316))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__317) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_AmbiguousInstance ("effect instance", ((Base_dData_dString.v_Base_dData_dString_djoin ", ") dtb__317)))) "effect instance") ((Base_dData_dString.v_Base_dData_dString_djoin ", ") dtb__317))
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> (match (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm mc1) mc4) dtb__310) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__318) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta mc4) dtb__309) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__318)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__319) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) dtb__319) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__320) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__320))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 mc2) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NoInstanceFound ("row membership"))) "row membership")
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__321) -> (match dtb__321 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__322; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__323 } -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__323) dtb__309) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__322)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__324) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) dtb__324) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__325) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__325))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify mc1) mc4) dtb__310))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc4) dtb__310) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) mc4) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, mc5)))
  | dtb__326 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc4) dtb__326) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) mc4) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, mc5))) else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc4) dtb__310) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc4)) else false) then ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) mc4) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, mc5))) else ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__327) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) mc4) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, mc5)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__328) -> (match dtb__328 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__329; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__330 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__330)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__330)) 0) dtb__309) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxEnv mc1)) dtb__329)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__331) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__330) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__331))) mc5)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__332) -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo mc0) mc1) mc2) dtb__306) mc4) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn mc0) mc1) mc4) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc4) dtb__310)) mc2))))
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending mc4) (Base_dData_dList.v_Base_dData_dList_dreverse mc5))))
  | _ -> failwith "DT: impossible branch"
))

# 642 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx = (fun globals ctx ec sp -> ((((((v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo globals) ctx) sp) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) ec) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 752 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc2 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dValue) -> (match mc2 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__333; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__334; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__335; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__336; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__337; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__338 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc1) dtb__336) then (match ((((v_Vuna_dCompiler_dElab_dDict_dmemberLookup 64) 0) mc1) dtb__336) with
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberFound (dtb__339, dtb__340) -> (match (((v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta dtb__340) dtb__335) dtb__339) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__341) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__341))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__342) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAbsent -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberAmbiguous (dtb__343) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | C_Vuna_dCompiler_dElab_dDict_dMemberLookup_MemberStuck -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc1) mc3) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | dtb__344 -> (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc1) dtb__344) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (if (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc1) mc3) then (v_Vuna_dCompiler_dElab_dDict_dallInstancesMono (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decInsts mc1)) else false) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__345) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__346) -> (match dtb__346 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__347; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__348 } -> (match ((((((Vuna_dCompiler_dCore_dConv.v_Vuna_dCompiler_dCore_dConv_dsolveMeta (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDefTbl dtb__348)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsP dtb__348)) 0) dtb__335) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__347)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__349) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutSols dtb__348) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__349))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__350) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dDict_dsearchInstance mc1) mc3) { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))))
))
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel = (fun fuel globals ec0 -> (if (fuel <= 0) then ec0 else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__351, dtb__352) -> (match dtb__351 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__354; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__356; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__357; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__358 } -> ((fun ec -> ((fun ec1 -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__355) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl ec1)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__359) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun solsNow -> (match ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decTriedAt ec1) dtb__353) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__360) -> (if (dtb__360 = solsNow) then ((fun ec2 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec2) ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec2)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__351, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1)) else ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__351) forced) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__361) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__361)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kept, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__353) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsCountOf ec1))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__354; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__356) then dtb__356 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__357; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__358 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__356)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun forced -> ((fun kept -> ((fun solsTried -> (match ((((v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal globals) ec1) dtb__351) forced) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__362) -> (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) dtb__362)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun ec2 -> ((fun ec3 -> ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec3) ((Base_dData_dList.v_Base_dData_dList_dappend (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec3)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (kept, Base_dData_dList.C_Base_dData_dList_dList_Nil))))) (((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decRecordTried ec2) dtb__353) solsTried))) (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel (fuel - 1)) globals) ec1))
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSols ec1)))) { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__353; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__354; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__355; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain ec1) dtb__356) then dtb__356 else forced); Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__357; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__358 })) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec1) dtb__356))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolsCountOf ec1))
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPending ec) dtb__352))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decBump ec0) "elab.dict.round"))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ec0
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec0))))

# 692 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals = (fun globals ec -> (if (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decDictPassIdle ec) then ec else (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPutPassMarker (((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)) + 1)) globals) ec))))

# 1261 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta = (fun ec dom -> ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg ec) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs ec) dom)))

# 1168 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__363) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) dtb__363)) (fun (rt : string) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Eq") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun st -> (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_EqRequiresEvidence (st))) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__364) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__365) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__365)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__366) -> (match dtb__366 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__367; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__368 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__367, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__368 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__364)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (aTy, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (name = "==") then true else (name = "/=")) then true else (name = "eq")) then true else (name = "neq")) then ((v_Vuna_dCompiler_dElab_dDict_dprojectionFor dtb__364) (v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1276 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy = (fun globals ctx name aTerm bTerm sp aTy ec -> (match (Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__369) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName sp) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) dtb__369)) (fun (rt : string) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (rt)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ec } }))))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName "Ord") (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decClasses ec)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun st -> ((((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_OpNotDefinedFor ((v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name), st))) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) st)) (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) aTy)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__370) -> ((fun mname -> ((fun tyTerm -> ((fun dictTy -> (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__371) -> (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec) dictTy) then (((((((((v_Vuna_dCompiler_dElab_dDict_ddeferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__371)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__372) -> (match dtb__372 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__373; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__374 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (mname)), tyTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0)), dtb__373, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega)), aTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)), bTerm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dElab_dPrelude.v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__374 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec) dictTy) sp)))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal ((Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__370)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (aTy, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) aTy))) (if (if (if (if (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then true else (name = "lt")) then true else (name = "le")) then true else (name = "gt")) then true else (name = "ge")) then ((v_Vuna_dCompiler_dElab_dDict_dprojectionFor dtb__370) (v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf name)) else name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1305 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit = (fun name a b -> (if (name = "&&") then (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, b, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (false)))) else (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (a, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (true)), b))))

# 1312 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__377; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__378; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__379; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__380; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__381; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__382 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__380) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__379) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__380))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__383) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__376)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo mc0) dtb__376))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1309 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1329 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__384, dtb__385) -> (match dtb__384 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__386; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__387; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__388; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__389; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__390; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__391 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__388) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__392) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__385)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__385) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__385) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__385) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo mc0) dtb__385) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue mc0) forced)))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__389))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1326 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1356 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__393, dtb__394) -> (match dtb__393 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__395; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__396; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__397; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__398; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__399; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__400 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__397) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__401) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__394)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then dtb__399 else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo mc0) dtb__394))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__398))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1352 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1374 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__402, dtb__403) -> (match dtb__402 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__404; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__405; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__406; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__407; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__408; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__409 } -> (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) dtb__407) then (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__406) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> dtb__408
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__410) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__403)
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo mc0) dtb__403))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1370 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1389 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__411, dtb__412) -> (match dtb__411 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__413; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__414; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__415; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__416; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__417; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__418 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__415) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__419) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__412)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__412) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__412) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__412) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo mc0) dtb__412) else dtb__417))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__416))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1385 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))

# 1410 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dEc) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dConstraint Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__420, dtb__421) -> (match dtb__420 with
  | { Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conId = dtb__422; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conKind = dtb__423; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conMeta = dtb__424; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDom = dtb__425; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conSpan = dtb__426; Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dConstraint_conDepth = dtb__427 } -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__424) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decSolTbl mc0)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__428) -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__421)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun forced -> (if ((v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily forced) = (Vuna_dCompiler_dElab_dMeta.v_Vuna_dCompiler_dElab_dMeta_ddictTypeName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__421) else (if ((v_Vuna_dCompiler_dElab_dDict_disMemberDomain mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__421) else (if ((v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg mc0) ((v_Vuna_dCompiler_dElab_dDict_ddictClassArgs mc0) forced)) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__421) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg mc0) forced) then ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo mc0) dtb__421) else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__424))))))) ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_dforceVal mc0) dtb__425))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1406 "Vuna/Compiler/Elab/Dict.vuna"
let v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta = (fun ec -> ((v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo ec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_decPending ec)))
