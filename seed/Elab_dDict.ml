open Vuna_runtime
type t_InstMatch = { f_InstMatch_instMatchInst : Elab_dTypes.t_DtInst; f_InstMatch_instMatchTerm : Core_dTerm.t_Term }
and t_InstScan = { f_InstScan_scanMatches : t_InstMatch B_dData_dList.t_List; f_InstScan_scanEc : Elab_dTypes.t_Ec; f_InstScan_scanExhausted : bool }
and t_InstTry = C_InstTry_InstMatched of (Core_dTerm.t_Term) * (Elab_dTypes.t_Ec) | C_InstTry_InstMissed | C_InstTry_InstOutOfFuel
and t_CtxSolve = C_CtxSolve_CtxSolved of ((Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (Elab_dTypes.t_Ec) | C_CtxSolve_CtxUnsolvable | C_CtxSolve_CtxOutOfFuel
and t_RowProofKind = C_RowProofKind_RowProofYes | C_RowProofKind_RowProofNo | C_RowProofKind_RowProofUnknown
and t_MemberLookup = C_MemberLookup_MemberFound of (Core_dTerm.t_Value) * (Elab_dTypes.t_Ec) | C_MemberLookup_MemberAbsent | C_MemberLookup_MemberStuck | C_MemberLookup_MemberAmbiguous of (string B_dData_dList.t_List)
and t_LabelCand = C_LabelCand_MkLabelCand of (string) * (int)
and t_DictTermTask = C_DictTermTask_DictTermValue of (Core_dTerm.t_Value) | C_DictTermTask_DictTermSpine of (Core_dTerm.t_Term) * (Core_dTerm.t_Value B_dData_dList.t_List) * (Core_dTerm.t_Rig B_dData_dList.t_List)
and t_BuiltinOp = { f_BuiltinOp_boShort : string; f_BuiltinOp_boOp : string; f_BuiltinOp_boRuntime : string }

# 35 "Vuna/Compiler/Elab/Dict.vuna"
let v_isDictFamily = (fun (dtb_u_u1 : Elab_dTypes.t_Ec) (dtb_u_u2 : string) -> ((B_dData_dList.v_memName dtb_u_u2) ((B_dData_dList.v_map (fun (dtb_u_u3 : Elab_dTypes.t_DtClass) -> (Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u3)))) (Elab_dTypes.v_ecClasses dtb_u_u1))))

# 28 "Vuna/Compiler/Elab/Dict.vuna"
let v_isDictValue = (fun (dtb_u_u4 : Elab_dTypes.t_Ec) (dtb_u_u5 : Core_dTerm.t_Value) -> (match dtb_u_u5 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u6) -> (match dtb_u_u6 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u7, dtb_u_u8) -> ((v_isDictFamily dtb_u_u4) dtb_u_u7)
  | _ -> false
)
  | _ -> false
))

# 25 "Vuna/Compiler/Elab/Dict.vuna"
let v_isDictDomain = (fun (dtb_u_u9 : Elab_dTypes.t_Ec) (dtb_u_u10 : Core_dTerm.t_Value) -> ((v_isDictValue dtb_u_u9) ((Elab_dTypes.v_forceVal dtb_u_u9) dtb_u_u10)))

# 52 "Vuna/Compiler/Elab/Dict.vuna"
let v_instDepthBound = 16

# 108 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_findClass = (fun (dtb_u_u11 : string) (dtb_u_u12 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match dtb_u_u12 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u13, dtb_u_u14) -> (if ((Elab_dTypes.v_dtClassName dtb_u_u13) = dtb_u_u11) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u13)) else ((v_findClass dtb_u_u11) dtb_u_u14))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Dict.vuna"
let v_famOfClass = (fun (dtb_u_u15 : Elab_dTypes.t_Ec) (dtb_u_u16 : string) -> (match ((v_findClass dtb_u_u16) (Elab_dTypes.v_ecClasses dtb_u_u15)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u17) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u17))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyViaClassFam = (fun (dtb_u_u18 : Elab_dTypes.t_Ec) (dtb_u_u19 : string) (dtb_u_u20 : string B_dData_dList.t_List) -> (match dtb_u_u20 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u21, dtb_u_u22) -> (match ((v_famOfClass dtb_u_u18) dtb_u_u21) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u23) -> (if (dtb_u_u23 = dtb_u_u19) then true else (((v_anyViaClassFam dtb_u_u18) dtb_u_u19) dtb_u_u22))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_anyViaClassFam dtb_u_u18) dtb_u_u19) dtb_u_u22)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaAllowsFam = (fun (dtb_u_u24 : Elab_dTypes.t_Ec) (dtb_u_u25 : Elab_dTypes.t_DtData) (dtb_u_u26 : string) -> (((v_anyViaClassFam dtb_u_u24) dtb_u_u26) (dtb_u_u25).Elab_dTypes.f_DtData_dtDataViaClasses))

# 132 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_applyDataPis = (fun (dtb_u_u27 : Elab_dTypes.t_Ec) (dtb_u_u28 : int) (dtb_u_u29 : Core_dTerm.t_Value) (dtb_u_u30 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u28 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u29)) else (match dtb_u_u30 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u31, dtb_u_u32) -> (match ((Elab_dTypes.v_forceVal dtb_u_u27) dtb_u_u29) with
  | Core_dTerm.C_Value_VPi (dtb_u_u33, dtb_u_u34, dtb_u_u35, dtb_u_u36, dtb_u_u37) -> ((((v_applyDataPis dtb_u_u27) (dtb_u_u28 - 1)) ((Core_dEval.v_applyClosure dtb_u_u37) dtb_u_u31)) dtb_u_u32)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 145 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaFieldType = (fun (dtb_u_u38 : Elab_dTypes.t_Ec) (dtb_u_u39 : Elab_dTypes.t_DtData) (dtb_u_u40 : Elab_dTypes.t_DtCtor) (dtb_u_u41 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if ((B_dData_dList.v_length dtb_u_u41) <> (B_dData_dList.v_length (dtb_u_u39).Elab_dTypes.f_DtData_dtDataParams)) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((v_applyDataPis dtb_u_u38) (B_dData_dList.v_length (dtb_u_u39).Elab_dTypes.f_DtData_dtDataParams)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u40))) dtb_u_u41) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u42) -> (match ((Elab_dTypes.v_forceVal dtb_u_u38) dtb_u_u42) with
  | Core_dTerm.C_Value_VPi (dtb_u_u43, dtb_u_u44, dtb_u_u45, dtb_u_u46, dtb_u_u47) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u46))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 172 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperShape = (fun (dtb_u_u48 : Elab_dTypes.t_Ec) (dtb_u_u49 : Elab_dTypes.t_DtData) (dtb_u_u50 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName dtb_u_u49)) (Elab_dRepresentation.v_unboxedFamilySet (Elab_dTypes.v_ecDatas dtb_u_u48))) then (match (Elab_dTypes.v_dtDataCtors dtb_u_u49) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> ((((v_viaFieldType dtb_u_u48) dtb_u_u49) dtb_u_u51) dtb_u_u50)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))

# 165 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperData = (fun (dtb_u_u53 : Elab_dTypes.t_Ec) (dtb_u_u54 : string) (dtb_u_u55 : string) (dtb_u_u56 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData dtb_u_u55) (Elab_dTypes.v_ecDatas dtb_u_u53)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u57) -> (if (((v_viaAllowsFam dtb_u_u53) dtb_u_u57) dtb_u_u54) then (((v_viaWrapperShape dtb_u_u53) dtb_u_u57) dtb_u_u56) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperOf = (fun (dtb_u_u58 : Elab_dTypes.t_Ec) (dtb_u_u59 : string) (dtb_u_u60 : Core_dTerm.t_Value) -> (let dtb_u_u61 = ((Elab_dTypes.v_forceVal dtb_u_u58) dtb_u_u60) in (match dtb_u_u61 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u62) -> (match dtb_u_u62 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u63, dtb_u_u64) -> ((((v_viaWrapperData dtb_u_u58) dtb_u_u59) dtb_u_u63) dtb_u_u64)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 182 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyViaWrapper = (fun (dtb_u_u65 : Elab_dTypes.t_Ec) (dtb_u_u66 : string) (dtb_u_u67 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u67 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u68, dtb_u_u69) -> (match (((v_viaWrapperOf dtb_u_u65) dtb_u_u66) dtb_u_u68) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u70) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_anyViaWrapper dtb_u_u65) dtb_u_u66) dtb_u_u69)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaCandidateExists = (fun (dtb_u_u71 : Elab_dTypes.t_Ec) (dtb_u_u72 : Core_dTerm.t_Value) -> (let dtb_u_u73 = ((Elab_dTypes.v_forceVal dtb_u_u71) dtb_u_u72) in (match dtb_u_u73 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u74) -> (match dtb_u_u74 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u75, dtb_u_u76) -> (((v_anyViaWrapper dtb_u_u71) dtb_u_u75) dtb_u_u76)
  | _ -> false
)
  | _ -> false
)))

# 197 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_replaceAt = (fun (dtb_u_u77 : int) (dtb_u_u78 : Core_dTerm.t_Value) (dtb_u_u79 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (if (dtb_u_u77 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u81)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u80, (((v_replaceAt (dtb_u_u77 - 1)) dtb_u_u78) dtb_u_u81))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_specificInstances = (fun (dtb_u_u82 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u82 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u83, dtb_u_u84) -> (if (Elab_dMeta.v_isBlanketInst dtb_u_u83) then (v_specificInstances dtb_u_u84) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u83, (v_specificInstances dtb_u_u84))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_blanketInstances = (fun (dtb_u_u85 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u85 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> (if (Elab_dMeta.v_isBlanketInst dtb_u_u86) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u86, (v_blanketInstances dtb_u_u87))) else (v_blanketInstances dtb_u_u87))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Dict.vuna"
let v_showResolvedValue = (fun (dtb_u_u88 : Elab_dTypes.t_Ec) (dtb_u_u89 : Core_dTerm.t_Value) -> (Core_dTerm.v_showTerm (((Elab_dMeta.v_zonkTerm dtb_u_u88) 0) ((Core_dEval.v_quote 0) ((Elab_dTypes.v_forceVal dtb_u_u88) dtb_u_u89)))))

# 273 "Vuna/Compiler/Elab/Dict.vuna"
let v_exhaustedInstance = (fun (dtb_u_u91 : Elab_dTypes.t_Ec) (dtb_u_u92 : Core_dTerm.t_Value) (dtb_u_u93 : Base_dSource.t_Span) -> (let dtb_u_u94 = ((v_showResolvedValue dtb_u_u91) dtb_u_u92) in (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u93) (Base_dDiagnostics_dTc.C_TcErr_InstanceSearchExhausted (dtb_u_u94))) dtb_u_u94)))

# 316 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_localDictLookupGo = (fun (dtb_u_u95 : Elab_dTypes.t_Ctx) (dtb_u_u96 : int) (dtb_u_u97 : Core_dTerm.t_Value) (dtb_u_u98 : Elab_dTypes.t_Ec) (dtb_u_u99 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u99 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u100, dtb_u_u101) -> (match dtb_u_u100 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u102; B_dData_dPair.f_Pair_second = dtb_u_u103 } -> (let dtb_u_u104 = ((Elab_dTypes.v_forceVal dtb_u_u98) (((Elab_dTypes.v_varTypeValue dtb_u_u95) dtb_u_u96) dtb_u_u103)) in (if ((v_isDictValue dtb_u_u98) dtb_u_u104) then (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u98)) (Elab_dTypes.v_ecSolsP dtb_u_u98)) (Elab_dTypes.v_ctxDepth dtb_u_u95)) dtb_u_u104) dtb_u_u97) with
  | Base_dDiag.C_Check_OkC (dtb_u_u105) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u102, dtb_u_u96, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutSols dtb_u_u98) (Core_dTerm.v_solsList dtb_u_u105)) }))
  | Base_dDiag.C_Check_ErrC (dtb_u_u106) -> (((((v_localDictLookupGo dtb_u_u95) (dtb_u_u96 + 1)) dtb_u_u97) dtb_u_u98) dtb_u_u101)
  | _ -> failwith "DT: impossible branch"
) else (((((v_localDictLookupGo dtb_u_u95) (dtb_u_u96 + 1)) dtb_u_u97) dtb_u_u98) dtb_u_u101)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Elab/Dict.vuna"
let v_localDictLookupExact = (fun (dtb_u_u107 : Elab_dTypes.t_Ctx) (dtb_u_u108 : int) (dtb_u_u109 : Core_dTerm.t_Value) (dtb_u_u110 : Elab_dTypes.t_Ec) -> (match (dtb_u_u107).Elab_dTypes.f_Ctx_ctxItems with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (((((v_localDictLookupGo dtb_u_u107) dtb_u_u108) dtb_u_u109) dtb_u_u110) (dtb_u_u107).Elab_dTypes.f_Ctx_ctxItems)
))

# 307 "Vuna/Compiler/Elab/Dict.vuna"
let v_localDictLookup = (fun (dtb_u_u111 : Elab_dTypes.t_Ctx) (dtb_u_u112 : int) (dtb_u_u113 : Core_dTerm.t_Value) (dtb_u_u114 : Elab_dTypes.t_Ec) -> ((((v_localDictLookupExact dtb_u_u111) dtb_u_u112) dtb_u_u113) dtb_u_u114))

# 336 "Vuna/Compiler/Elab/Dict.vuna"
let v_valueDictFamily = (fun (dtb_u_u115 : Core_dTerm.t_Value) -> (match dtb_u_u115 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u116) -> (match dtb_u_u116 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u117, dtb_u_u118) -> dtb_u_u117
  | _ -> ""
)
  | _ -> ""
))

# 228 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchCandidates = (fun (dtb_u_u119 : Elab_dTypes.t_Ec) (dtb_u_u120 : Core_dTerm.t_Value) -> (let dtb_u_u121 = (v_valueDictFamily ((Elab_dTypes.v_forceVal dtb_u_u119) dtb_u_u120)) in (if (dtb_u_u121 = "") then (Elab_dTypes.v_ecInstList dtb_u_u119) else ((Elab_dTypes.v_ecInstsFamily dtb_u_u119) dtb_u_u121))))

# 365 "Vuna/Compiler/Elab/Dict.vuna"
let v_termTypeNameOf = (fun (dtb_u_u122 : Core_dTerm.t_Term) -> (match dtb_u_u122 with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u123) -> dtb_u_u123
  | _ -> ""
))

# 359 "Vuna/Compiler/Elab/Dict.vuna"
let v_instHeadArgTypeName = (fun (dtb_u_u124 : Elab_dTypes.t_DtInst) -> (let dtb_u_u125 = (Elab_dTypes.v_flattenTaggedApp (dtb_u_u124).Elab_dTypes.f_DtInst_dtInstHead) in (match dtb_u_u125 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u126) -> (match dtb_u_u126 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u127; B_dData_dPair.f_Pair_second = dtb_u_u128 } -> (match dtb_u_u128 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130) -> (v_termTypeNameOf (B_dData_dPair.v_firstOf dtb_u_u129))
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ""
)))

# 351 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_hasSpecificInterpInstanceGo = (fun (dtb_u_u131 : string) (dtb_u_u132 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u132 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u133, dtb_u_u134) -> (if (if (B_dData_dBool.v_not (Elab_dMeta.v_isBlanketInst dtb_u_u133)) then ((v_instHeadArgTypeName dtb_u_u133) = dtb_u_u131) else false) then true else ((v_hasSpecificInterpInstanceGo dtb_u_u131) dtb_u_u134))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Dict.vuna"
let v_hasSpecificInterpInstance = (fun (dtb_u_u135 : Elab_dTypes.t_Ec) (dtb_u_u136 : string) -> ((v_hasSpecificInterpInstanceGo dtb_u_u136) ((Elab_dTypes.v_ecInstsFamily dtb_u_u135) (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName))))

# 369 "Vuna/Compiler/Elab/Dict.vuna"
let v_isMonoInst = (fun (dtb_u_u137 : Elab_dTypes.t_DtInst) -> (match (dtb_u_u137).Elab_dTypes.f_DtInst_dtInstTele with
  | B_dData_dList.C_List_Nil -> (match (dtb_u_u137).Elab_dTypes.f_DtInst_dtInstCtx with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
))

# 379 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_allInstancesMono = (fun (dtb_u_u138 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u138 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u139, dtb_u_u140) -> (if (v_isMonoInst dtb_u_u139) then (v_allInstancesMono dtb_u_u140) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Elab/Dict.vuna"
let v_allocMetaAt = (fun (dtb_u_u141 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u142 : Elab_dTypes.t_Ctx) (dtb_u_u143 : Elab_dTypes.t_Ec) -> (match dtb_u_u141 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u144) -> (((Elab_dMetaSpans.v_newMetaAt dtb_u_u144) dtb_u_u142) dtb_u_u143)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_newMeta dtb_u_u142) dtb_u_u143)
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Elab/Dict.vuna"
let v_termMetaId = (fun (dtb_u_u145 : Core_dTerm.t_Term) -> (match dtb_u_u145 with
  | Core_dTerm.C_Term_TMeta (dtb_u_u146) -> dtb_u_u146
  | _ -> 0
))

# 456 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_allocTeleMetas = (fun (dtb_u_u147 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (dtb_u_u148 : Elab_dTypes.t_Ctx) (dtb_u_u149 : Elab_dTypes.t_Ec) (dtb_u_u150 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u150 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u151, dtb_u_u152) -> (match (((v_allocMetaAt dtb_u_u147) dtb_u_u148) dtb_u_u149) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u153; B_dData_dPair.f_Pair_second = dtb_u_u154 } -> (match ((((v_allocTeleMetas dtb_u_u147) dtb_u_u148) dtb_u_u154) dtb_u_u152) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u155; B_dData_dPair.f_Pair_second = dtb_u_u156 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_termMetaId dtb_u_u153), dtb_u_u155)); B_dData_dPair.f_Pair_second = dtb_u_u156 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u149 }
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_solveTeleMetas = (fun (dtb_u_u157 : Elab_dTypes.t_Ec) (dtb_u_u158 : int B_dData_dList.t_List) -> (match dtb_u_u158 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u159, dtb_u_u160) -> (match ((Core_dTerm.v_metaLookup dtb_u_u159) (Elab_dTypes.v_ecSolTbl dtb_u_u157)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u161) -> (match ((v_solveTeleMetas dtb_u_u157) dtb_u_u160) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u162) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u161, dtb_u_u162))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Elab/Dict.vuna"
let v_instOutOfFuelDiag = (fun (dtb_u_u163 : Base_dDiag.t_Diagnostic) -> ((dtb_u_u163).Base_dDiag.f_Diagnostic_diagCode = (Base_dDiagnostics_dTc.v_tcCode (Base_dDiagnostics_dTc.C_TcErr_InstanceSearchExhausted ("")))))

# 508 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowMemDomName = "Base.Effect.Core.rowMem"

# 511 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowYesDomName = "Base.Effect.Core.Yes"

# 514 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowNoDomName = "Base.Effect.Core.No"

# 518 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowYesCtorName = "Base.Effect.Core.Yes.MkYes"

# 524 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberDomName = Base_dIntrinsics.v_effMemberFamilyName

# 528 "Vuna/Compiler/Elab/Dict.vuna"
let v_hereCtorName = Base_dIntrinsics.v_effMemberHereCtor

# 532 "Vuna/Compiler/Elab/Dict.vuna"
let v_thereCtorName = Base_dIntrinsics.v_effMemberThereCtor

# 545 "Vuna/Compiler/Elab/Dict.vuna"
let v_isMemberDomain = (fun (dtb_u_u164 : Elab_dTypes.t_Ec) (dtb_u_u165 : Core_dTerm.t_Value) -> (match dtb_u_u165 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u166) -> (match dtb_u_u166 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u167, dtb_u_u168) -> (if (dtb_u_u167 = v_memberDomName) then (let dtb_u_u169 = dtb_u_u168 in (match dtb_u_u169 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u170, dtb_u_u171) -> (match dtb_u_u171 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u172, dtb_u_u173) -> (match dtb_u_u173 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) else false)
  | _ -> false
)
  | _ -> false
))

# 555 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberSpine = (fun (dtb_u_u174 : Core_dTerm.t_Value) -> (match dtb_u_u174 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u175) -> (match dtb_u_u175 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u176, dtb_u_u177) -> (if (dtb_u_u176 = v_memberDomName) then (let dtb_u_u178 = dtb_u_u177 in (match dtb_u_u178 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u179, dtb_u_u180) -> (match dtb_u_u180 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u181, dtb_u_u182) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u181 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 565 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctorValue = (fun (dtb_u_u183 : Elab_dTypes.t_Ec) (dtb_u_u184 : string) (dtb_u_u185 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtCtorLookupEc dtb_u_u183) dtb_u_u184) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u186) -> (Core_dTerm.C_Value_VCon ((Elab_dTypes.v_dtCtorName dtb_u_u186), dtb_u_u185))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VCon (dtb_u_u184, dtb_u_u185))
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberProbe = (fun (dtb_u_u187 : Elab_dTypes.t_Ec) (dtb_u_u188 : int) (dtb_u_u189 : Core_dTerm.t_Value) (dtb_u_u190 : Core_dTerm.t_Value) -> (match ((((Elab_dMeta.v_convEc dtb_u_u187) dtb_u_u188) dtb_u_u189) dtb_u_u190) with
  | Base_dDiag.C_Check_OkC (dtb_u_u191) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u192) -> false
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberNameText = (fun (dtb_u_u193 : Elab_dTypes.t_Ec) (dtb_u_u194 : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal dtb_u_u193) dtb_u_u194) with
  | Core_dTerm.C_Value_VStr (dtb_u_u195) -> dtb_u_u195
  | _ -> ((Core_dEval.v_showValueAt 6) dtb_u_u194)
))

# 598 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandName = (fun (dtb_u_u196 : t_LabelCand) -> (match dtb_u_u196 with
  | C_LabelCand_MkLabelCand (dtb_u_u197, dtb_u_u198) -> dtb_u_u197
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandIdx = (fun (dtb_u_u199 : t_LabelCand) -> (match dtb_u_u199 with
  | C_LabelCand_MkLabelCand (dtb_u_u200, dtb_u_u201) -> dtb_u_u201
  | _ -> failwith "DT: impossible branch"
))

# 605 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandText = (fun (dtb_u_u202 : Elab_dTypes.t_Ec) (dtb_u_u203 : Core_dTerm.t_Value) -> (let dtb_u_u204 = ((Elab_dTypes.v_forceVal dtb_u_u202) dtb_u_u203) in (match dtb_u_u204 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u205) -> (match dtb_u_u205 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u206, dtb_u_u207) -> (if (dtb_u_u206 = Base_dIntrinsics.v_effNamedName) then (match dtb_u_u207 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u208, dtb_u_u209) -> ((v_memberNameText dtb_u_u202) dtb_u_u208)
  | _ -> ((Core_dEval.v_showValueAt 6) dtb_u_u203)
) else ((Core_dEval.v_showValueAt 6) dtb_u_u203))
  | _ -> ((Core_dEval.v_showValueAt 6) dtb_u_u203)
)
  | _ -> ((Core_dEval.v_showValueAt 6) dtb_u_u203)
)))

# 617 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_labelScan = (fun (dtb_u_u210 : int) (dtb_u_u211 : int) (dtb_u_u212 : Core_dTerm.t_Sols) (dtb_u_u213 : Elab_dTypes.t_Ec) (dtb_u_u214 : Core_dTerm.t_Value) (dtb_u_u215 : Core_dTerm.t_Value) (dtb_u_u216 : int) (dtb_u_u217 : t_LabelCand B_dData_dList.t_List) -> (if (dtb_u_u210 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal dtb_u_u213) dtb_u_u215) with
  | Core_dTerm.C_Value_VCon (dtb_u_u218, dtb_u_u219) -> (if (dtb_u_u218 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u217); B_dData_dPair.f_Pair_second = true })) else (if (dtb_u_u218 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u220 = dtb_u_u219 in (match dtb_u_u220 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u221, dtb_u_u222) -> (match dtb_u_u222 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u223, dtb_u_u224) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue dtb_u_u212) dtb_u_u221) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u225 = ((((v_memberProbe dtb_u_u213) dtb_u_u211) dtb_u_u214) dtb_u_u221) in (let dtb_u_u226 = (if dtb_u_u225 then (B_dData_dList.C_List__x58__x58_ ((C_LabelCand_MkLabelCand (((v_labelCandText dtb_u_u213) dtb_u_u221), dtb_u_u216)), dtb_u_u217)) else dtb_u_u217) in ((((((((v_labelScan (dtb_u_u210 - 1)) dtb_u_u211) dtb_u_u212) dtb_u_u213) dtb_u_u214) dtb_u_u223) (dtb_u_u216 + 1)) dtb_u_u226))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | Core_dTerm.C_Value_VNeutral (dtb_u_u227) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u217); B_dData_dPair.f_Pair_second = false }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 642 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_memberProofAtLabel = (fun (dtb_u_u228 : int) (dtb_u_u229 : int) (dtb_u_u230 : Elab_dTypes.t_Ec) (dtb_u_u231 : Core_dTerm.t_Value) (dtb_u_u232 : Core_dTerm.t_Value) (dtb_u_u233 : int) -> (if (dtb_u_u228 <= 0) then (Base_dDiag.v_icFuel "member proof") else (match ((Elab_dTypes.v_forceVal dtb_u_u230) dtb_u_u232) with
  | Core_dTerm.C_Value_VCon (dtb_u_u234, dtb_u_u235) -> (if (dtb_u_u234 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u236 = dtb_u_u235 in (match dtb_u_u236 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u238) -> (match dtb_u_u238 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u239, dtb_u_u240) -> (if (dtb_u_u233 <= 0) then ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc dtb_u_u230) dtb_u_u229) dtb_u_u231) dtb_u_u237)) (fun (dtb_u_u241 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_ctorValue dtb_u_u241) v_hereCtorName) (B_dData_dList.C_List__x58__x58_ (dtb_u_u231, (B_dData_dList.C_List__x58__x58_ (dtb_u_u239, B_dData_dList.C_List_Nil))))); B_dData_dPair.f_Pair_second = dtb_u_u241 })))) else ((Base_dCommon.v_bind ((((((v_memberProofAtLabel (dtb_u_u228 - 1)) dtb_u_u229) dtb_u_u230) dtb_u_u231) dtb_u_u239) (dtb_u_u233 - 1))) (fun (dtb_u_u242 : (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_ctorValue (B_dData_dPair.v_secondOf dtb_u_u242)) v_thereCtorName) (B_dData_dList.C_List__x58__x58_ (dtb_u_u231, (B_dData_dList.C_List__x58__x58_ (dtb_u_u237, (B_dData_dList.C_List__x58__x58_ (dtb_u_u239, (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb_u_u242), B_dData_dList.C_List_Nil))))))))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u242) })))))
  | _ -> (Base_dDiag.v_icInternal "malformed row in member proof")
)
  | _ -> (Base_dDiag.v_icInternal "malformed row in member proof")
)) else (Base_dDiag.v_icInternal "member proof target out of range"))
  | _ -> (Base_dDiag.v_icInternal "member proof target out of range")
)))

# 657 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberLookupRowLabel = (fun (dtb_u_u243 : int) (dtb_u_u244 : int) (dtb_u_u245 : Elab_dTypes.t_Ec) (dtb_u_u246 : Core_dTerm.t_Value) (dtb_u_u247 : Core_dTerm.t_Value) -> (if (dtb_u_u243 <= 0) then C_MemberLookup_MemberStuck else (let dtb_u_u248 = ((Elab_dTypes.v_forceVal dtb_u_u245) dtb_u_u246) in (let dtb_u_u249 = (Elab_dTypes.v_ecSolsP dtb_u_u245) in (let dtb_u_u250 = ((((((((v_labelScan 64) dtb_u_u244) dtb_u_u249) dtb_u_u245) dtb_u_u248) dtb_u_u247) 0) B_dData_dList.C_List_Nil) in (match dtb_u_u250 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u251) -> (match dtb_u_u251 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u252; B_dData_dPair.f_Pair_second = dtb_u_u253 } -> (match dtb_u_u252 with
  | B_dData_dList.C_List_Nil -> (if dtb_u_u253 then C_MemberLookup_MemberAbsent else C_MemberLookup_MemberStuck)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u254, dtb_u_u255) -> (match dtb_u_u255 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u256 = ((((((v_memberProofAtLabel (dtb_u_u243 - 1)) dtb_u_u244) dtb_u_u245) dtb_u_u248) dtb_u_u247) (v_labelCandIdx dtb_u_u254)) in (match dtb_u_u256 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u257) -> C_MemberLookup_MemberStuck
  | Base_dDiag.C_Check_OkC (dtb_u_u258) -> (match dtb_u_u258 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u259; B_dData_dPair.f_Pair_second = dtb_u_u260 } -> (C_MemberLookup_MemberFound (dtb_u_u259, dtb_u_u260))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (if ((Core_dTerm.v_hasUnsolvedMetaValue dtb_u_u249) dtb_u_u248) then (C_MemberLookup_MemberAmbiguous (((B_dData_dList.v_map v_labelCandName) dtb_u_u252))) else (let dtb_u_u261 = ((((((v_memberProofAtLabel (dtb_u_u243 - 1)) dtb_u_u244) dtb_u_u245) dtb_u_u248) dtb_u_u247) (v_labelCandIdx dtb_u_u254)) in (match dtb_u_u261 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u262) -> C_MemberLookup_MemberStuck
  | Base_dDiag.C_Check_OkC (dtb_u_u263) -> (match dtb_u_u263 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u264; B_dData_dPair.f_Pair_second = dtb_u_u265 } -> (C_MemberLookup_MemberFound (dtb_u_u264, dtb_u_u265))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_MemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
))))))

# 571 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberLookup = (fun (dtb_u_u266 : int) (dtb_u_u267 : int) (dtb_u_u268 : Elab_dTypes.t_Ec) (dtb_u_u269 : Core_dTerm.t_Value) -> (if (dtb_u_u266 <= 0) then C_MemberLookup_MemberStuck else (let dtb_u_u270 = (v_memberSpine dtb_u_u269) in (match dtb_u_u270 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u271) -> (match dtb_u_u271 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u272; B_dData_dPair.f_Pair_second = dtb_u_u273 } -> (((((v_memberLookupRowLabel dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u272) dtb_u_u273)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_MemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
))))

# 690 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_ctxMemberProofUnifyGo = (fun (dtb_u_u274 : Elab_dTypes.t_Ctx) (dtb_u_u275 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u276 : int) (dtb_u_u277 : Elab_dTypes.t_Ec) (dtb_u_u278 : Core_dTerm.t_Value) -> (match dtb_u_u275 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u279, dtb_u_u280) -> (match dtb_u_u279 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u281; B_dData_dPair.f_Pair_second = dtb_u_u282 } -> (let dtb_u_u283 = (B_dData_dList.v_length dtb_u_u280) in (let dtb_u_u284 = ((Core_dEval.v_eval ((B_dData_dList.v_map ((Elab_dTypes.v_refineValue (dtb_u_u274).Elab_dTypes.f_Ctx_ctxRefVals) Core_dTerm.v_defaultFuel)) (((Elab_dTypes.v_ctxEnvAt dtb_u_u280) 0) dtb_u_u283))) dtb_u_u282) in (match ((((Elab_dMeta.v_convEc dtb_u_u277) (Elab_dTypes.v_ctxDepth dtb_u_u274)) dtb_u_u284) dtb_u_u278) with
  | Base_dDiag.C_Check_OkC (dtb_u_u285) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u281, dtb_u_u276, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb_u_u285 }))
  | Base_dDiag.C_Check_ErrC (dtb_u_u286) -> (((((v_ctxMemberProofUnifyGo dtb_u_u274) dtb_u_u280) (dtb_u_u276 + 1)) dtb_u_u277) dtb_u_u278)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctxMemberProofUnify = (fun (dtb_u_u287 : Elab_dTypes.t_Ctx) (dtb_u_u288 : Elab_dTypes.t_Ec) (dtb_u_u289 : Core_dTerm.t_Value) -> (((((v_ctxMemberProofUnifyGo dtb_u_u287) (dtb_u_u287).Elab_dTypes.f_Ctx_ctxItems) 0) dtb_u_u288) dtb_u_u289))

# 703 "Vuna/Compiler/Elab/Dict.vuna"
let v_solveRowMeta = (fun (dtb_u_u290 : Elab_dTypes.t_Ec) (dtb_u_u291 : int) (dtb_u_u292 : int) (dtb_u_u293 : Core_dTerm.t_Value) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u290)) (Elab_dTypes.v_ecSolsP dtb_u_u290)) dtb_u_u291) dtb_u_u292) B_dData_dList.C_List_Nil) dtb_u_u293) with
  | Base_dDiag.C_Check_OkC (dtb_u_u294) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols dtb_u_u290) (Core_dTerm.v_solsList dtb_u_u294))))
  | Base_dDiag.C_Check_ErrC (dtb_u_u295) -> (Base_dDiag.C_Check_ErrC (dtb_u_u295))
  | _ -> failwith "DT: impossible branch"
))

# 773 "Vuna/Compiler/Elab/Dict.vuna"
let v_pendingBucket = (fun (dtb_u_u296 : int) -> (if (dtb_u_u296 <= 0) then "0" else (if (dtb_u_u296 <= 4) then "1-4" else (if (dtb_u_u296 <= 16) then "5-16" else (if (dtb_u_u296 <= 64) then "17-64" else "65+")))))

# 972 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_piRigsOfInstGo = (fun (dtb_u_u297 : string) (dtb_u_u298 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u298 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u299, dtb_u_u300) -> (if ((Elab_dTypes.v_dtInstSym dtb_u_u299) = dtb_u_u297) then (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u301 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> Core_dTerm.C_Rig_Rig0)) (dtb_u_u299).Elab_dTypes.f_DtInst_dtInstTele)) ((B_dData_dList.v_map (fun (dtb_u_u302 : Core_dTerm.t_Term) -> Core_dTerm.C_Rig_RigOmega)) (dtb_u_u299).Elab_dTypes.f_DtInst_dtInstCtx)))) else ((v_piRigsOfInstGo dtb_u_u297) dtb_u_u300))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Elab/Dict.vuna"
let v_piRigsOfInst = (fun (dtb_u_u303 : Elab_dTypes.t_Ec) (dtb_u_u304 : string) -> ((v_piRigsOfInstGo dtb_u_u304) (Elab_dTypes.v_ecInstList dtb_u_u303)))

# 989 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_piRigs = (fun (dtb_u_u305 : Core_dTerm.t_Term) -> (match dtb_u_u305 with
  | Core_dTerm.C_Term_TPi (dtb_u_u306, dtb_u_u307, dtb_u_u308, dtb_u_u309, dtb_u_u310) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u308, (v_piRigs dtb_u_u310)))
  | _ -> B_dData_dList.C_List_Nil
))

# 980 "Vuna/Compiler/Elab/Dict.vuna"
let v_piRigsOfGlobal = (fun (dtb_u_u311 : Elab_dTypes.t_Ec) (dtb_u_u312 : string) -> (match ((v_piRigsOfInst dtb_u_u311) dtb_u_u312) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u313) -> dtb_u_u313
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u312) (Elab_dTypes.v_ecGlobalsTbl dtb_u_u311)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u314) -> (v_piRigs dtb_u_u314)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 930 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_renderDictTermAt = (fun (dtb_u_u315 : int) (dtb_u_u316 : Elab_dTypes.t_Ec) (dtb_u_u317 : int) (dtb_u_u318 : t_DictTermTask) -> (if (dtb_u_u315 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u319 = dtb_u_u318 in (match dtb_u_u319 with
  | C_DictTermTask_DictTermSpine (dtb_u_u320, dtb_u_u321, dtb_u_u322) -> (match dtb_u_u321 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u323, dtb_u_u324) -> (let dtb_u_u325 = (match ((((v_renderDictTermAt (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) (C_DictTermTask_DictTermValue (dtb_u_u323))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u332) -> dtb_u_u332
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Core_dEval.v_quote dtb_u_u317) dtb_u_u323)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u326 = (match dtb_u_u322 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u330, dtb_u_u331) -> dtb_u_u330
  | B_dData_dList.C_List_Nil -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u327 = (match dtb_u_u322 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u328, dtb_u_u329) -> dtb_u_u329
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in ((((v_renderDictTermAt (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TApp (dtb_u_u320, dtb_u_u325, dtb_u_u326)), dtb_u_u324, dtb_u_u327))))))
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u320))
  | _ -> failwith "DT: impossible branch"
)
  | C_DictTermTask_DictTermValue (dtb_u_u333) -> (match dtb_u_u333 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u334) -> (match dtb_u_u334 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u335, dtb_u_u336) -> ((((v_renderDictTermAt (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TGlobal (dtb_u_u335)), dtb_u_u336, ((v_piRigsOfGlobal dtb_u_u316) dtb_u_u335))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> (match ((Elab_dTypes.v_forceVal dtb_u_u316) dtb_u_u333) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u337) -> (match dtb_u_u337 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u338, dtb_u_u339) -> ((((v_renderDictTermAt (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TGlobal (dtb_u_u338)), dtb_u_u339, ((v_piRigsOfGlobal dtb_u_u316) dtb_u_u338))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
))))

# 927 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictTermOfValueAt = (fun (dtb_u_u340 : Elab_dTypes.t_Ec) (dtb_u_u341 : int) (dtb_u_u342 : Core_dTerm.t_Value) -> ((((v_renderDictTermAt 64) dtb_u_u340) dtb_u_u341) (C_DictTermTask_DictTermValue (dtb_u_u342))))

# 869 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_substDictTermGo = (fun (dtb_u_u343 : Elab_dTypes.t_Ec) (dtb_u_u344 : int) (dtb_u_u345 : Core_dTerm.t_Term) -> (match dtb_u_u345 with
  | Core_dTerm.C_Term_TIf (dtb_u_u346, dtb_u_u347, dtb_u_u348) -> (Core_dTerm.C_Term_TIf ((((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u346), (((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u347), (((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u348)))
  | Core_dTerm.C_Term_TCase (dtb_u_u349, dtb_u_u350) -> (Core_dTerm.C_Term_TCase ((((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u349), ((B_dData_dList.v_map (fun (dtb_u_u351 : Core_dTerm.t_CaseAlt) -> (((v_substDictTermAlt dtb_u_u343) dtb_u_u344) dtb_u_u351))) dtb_u_u350)))
  | Core_dTerm.C_Term_TRecord (dtb_u_u352, dtb_u_u353) -> (Core_dTerm.C_Term_TRecord (dtb_u_u352, ((B_dData_dList.v_map (fun (dtb_u_u354 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo dtb_u_u343) dtb_u_u344) (B_dData_dPair.v_firstOf dtb_u_u354)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u354) })) dtb_u_u353)))
  | Core_dTerm.C_Term_TMk (dtb_u_u355, dtb_u_u356) -> (Core_dTerm.C_Term_TMk (dtb_u_u355, ((B_dData_dList.v_map (fun (dtb_u_u357 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo dtb_u_u343) dtb_u_u344) (B_dData_dPair.v_firstOf dtb_u_u357)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u357) })) dtb_u_u356)))
  | Core_dTerm.C_Term_TCon (dtb_u_u358, dtb_u_u359) -> (Core_dTerm.C_Term_TCon (dtb_u_u358, ((B_dData_dList.v_map (fun (dtb_u_u360 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo dtb_u_u343) dtb_u_u344) (B_dData_dPair.v_firstOf dtb_u_u360)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u360) })) dtb_u_u359)))
  | Core_dTerm.C_Term_TApp (dtb_u_u361, dtb_u_u362, dtb_u_u363) -> (Core_dTerm.C_Term_TApp ((((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u361), (((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u362), dtb_u_u363))
  | Core_dTerm.C_Term_TLam (dtb_u_u364, dtb_u_u365, dtb_u_u366, dtb_u_u367, dtb_u_u368) -> (let dtb_u_u369 = (let dtb_u_u370 = dtb_u_u366 in (match dtb_u_u370 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u371) -> (match dtb_u_u371 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u372; B_dData_dPair.f_Pair_second = dtb_u_u373 } -> (match dtb_u_u373 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u374; B_dData_dPair.f_Pair_second = dtb_u_u375 } -> (let dtb_u_u376 = (match dtb_u_u374 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u379) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u379)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u377 = (match dtb_u_u375 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u378) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substDictTermGo dtb_u_u343) (dtb_u_u344 + 1)) dtb_u_u378)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u372; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u376; B_dData_dPair.f_Pair_second = dtb_u_u377 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u364, dtb_u_u365, dtb_u_u369, dtb_u_u367, (((v_substDictTermGo dtb_u_u343) (dtb_u_u344 + 1)) dtb_u_u368))))
  | Core_dTerm.C_Term_TPi (dtb_u_u380, dtb_u_u381, dtb_u_u382, dtb_u_u383, dtb_u_u384) -> (Core_dTerm.C_Term_TPi (dtb_u_u380, dtb_u_u381, dtb_u_u382, (((v_substDictTermGo dtb_u_u343) dtb_u_u344) dtb_u_u383), (((v_substDictTermGo dtb_u_u343) (dtb_u_u344 + 1)) dtb_u_u384)))
  | Core_dTerm.C_Term_TMeta (dtb_u_u385) -> (match ((Core_dTerm.v_metaLookup dtb_u_u385) (Elab_dTypes.v_ecSolTbl dtb_u_u343)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u345
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u386) -> (match (((v_dictTermOfValueAt dtb_u_u343) dtb_u_u344) dtb_u_u386) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u387) -> (if (if ((Core_dTerm.v_hasFreeTermVar dtb_u_u344) dtb_u_u387) then true else (Core_dTerm.v_hasNegativeVar dtb_u_u387)) then dtb_u_u345 else dtb_u_u387)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u388 = ((Core_dEval.v_quote dtb_u_u344) dtb_u_u386) in (if (if ((Core_dTerm.v_hasFreeTermVar dtb_u_u344) dtb_u_u388) then true else (Core_dTerm.v_hasNegativeVar dtb_u_u388)) then dtb_u_u345 else dtb_u_u388))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u345
))
# 914 "Vuna/Compiler/Elab/Dict.vuna"
and v_substDictTermAlt = (fun (dtb_u_u389 : Elab_dTypes.t_Ec) (dtb_u_u390 : int) (dtb_u_u391 : Core_dTerm.t_CaseAlt) -> (match dtb_u_u391 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u392; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u393; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u394 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u392; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u393; Core_dTerm.f_CaseAlt_caseAltBody = (((v_substDictTermGo dtb_u_u389) (dtb_u_u390 + (B_dData_dList.v_length dtb_u_u393))) dtb_u_u394) }
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Elab/Dict.vuna"
let v_substDictTerm = (fun (dtb_u_u395 : Elab_dTypes.t_Ec) (dtb_u_u396 : Core_dTerm.t_Term) -> (((v_substDictTermGo dtb_u_u395) 0) dtb_u_u396))

# 997 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_joinRestInstNames = (fun (dtb_u_u397 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u397 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u398, dtb_u_u399) -> (String.concat "" [", "; (Elab_dTypes.v_dtInstName dtb_u_u398); (v_joinRestInstNames dtb_u_u399)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Elab/Dict.vuna"
let v_joinInstNames = (fun (dtb_u_u400 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match dtb_u_u400 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u401, dtb_u_u402) -> ((Elab_dTypes.v_dtInstName dtb_u_u401) ^ (v_joinRestInstNames dtb_u_u402))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_ctorParamKindsFuel = (fun (dtb_u_u403 : int) (dtb_u_u404 : Elab_dTypes.t_Ec) (dtb_u_u405 : Core_dTerm.t_Value) (dtb_u_u406 : int) (dtb_u_u407 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u403 <= 0) then (B_dData_dList.v_reverse dtb_u_u407) else (match dtb_u_u405 with
  | Core_dTerm.C_Value_VPi (dtb_u_u408, dtb_u_u409, dtb_u_u410, dtb_u_u411, dtb_u_u412) -> (if dtb_u_u409 then (((((v_ctorParamKindsFuel (dtb_u_u403 - 1)) dtb_u_u404) ((Elab_dTypes.v_forceVal dtb_u_u404) ((Core_dEval.v_applyClosure dtb_u_u412) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u408, dtb_u_u406, B_dData_dList.C_List_Nil))))))) (dtb_u_u406 + 1)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u411, dtb_u_u407))) else (B_dData_dList.v_reverse dtb_u_u407))
  | _ -> (B_dData_dList.v_reverse dtb_u_u407)
)))

# 1016 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctorParamKinds = (fun (dtb_u_u413 : Elab_dTypes.t_Ec) (dtb_u_u414 : Core_dTerm.t_Value) (dtb_u_u415 : int) (dtb_u_u416 : Core_dTerm.t_Value B_dData_dList.t_List) -> (((((v_ctorParamKindsFuel 64) dtb_u_u413) dtb_u_u414) dtb_u_u415) dtb_u_u416))

# 1035 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictFamilyNameOf = (fun (dtb_u_u417 : Elab_dTypes.t_Ec) (dtb_u_u418 : Core_dTerm.t_Value) -> (let dtb_u_u419 = ((Elab_dTypes.v_forceVal dtb_u_u417) dtb_u_u418) in (match dtb_u_u419 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u420) -> (match dtb_u_u420 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u421, dtb_u_u422) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u421))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1003 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgKinds = (fun (dtb_u_u423 : Elab_dTypes.t_Ec) (dtb_u_u424 : Core_dTerm.t_Value) -> (match ((v_dictFamilyNameOf dtb_u_u423) dtb_u_u424) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u425) -> (match ((Elab_dMeta.v_dtDataLookup dtb_u_u425) (Elab_dTypes.v_ecDatas dtb_u_u423)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u426) -> (match (Elab_dTypes.v_dtDataCtors dtb_u_u426) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u427, dtb_u_u428) -> (B_dData_dMaybe.C_Maybe_Just (((((v_ctorParamKinds dtb_u_u423) ((Elab_dTypes.v_forceVal dtb_u_u423) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb_u_u427)))) 0) B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgKind = (fun (dtb_u_u429 : Elab_dTypes.t_Ec) (dtb_u_u430 : Core_dTerm.t_Value) -> (let dtb_u_u431 = ((v_dictArgKinds dtb_u_u429) dtb_u_u430) in (match dtb_u_u431 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u432) -> (match dtb_u_u432 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u433, dtb_u_u434) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u433))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1056 "Vuna/Compiler/Elab/Dict.vuna"
let v_neutralHeadOrSelf = (fun (dtb_u_u435 : Core_dTerm.t_Value) -> (match dtb_u_u435 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u436) -> (match dtb_u_u436 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u437, dtb_u_u438) -> (match dtb_u_u438 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u439, dtb_u_u440) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u437, B_dData_dList.C_List_Nil))))
  | _ -> dtb_u_u435
)
  | _ -> dtb_u_u435
)
  | _ -> dtb_u_u435
))

# 1043 "Vuna/Compiler/Elab/Dict.vuna"
let v_argHeadMatchesKind = (fun (dtb_u_u441 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u442 : Elab_dTypes.t_Ec) (dtb_u_u443 : Elab_dTypes.t_Ctx) (dtb_u_u444 : Core_dTerm.t_Value) (dtb_u_u445 : Core_dTerm.t_Value) -> (let dtb_u_u446 = (v_neutralHeadOrSelf dtb_u_u444) in (match dtb_u_u446 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u447) -> (match dtb_u_u447 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u448, dtb_u_u449) -> (match dtb_u_u449 with
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMeta.v_typeHeadLookup dtb_u_u441) dtb_u_u442) dtb_u_u448) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u450) -> (match ((((Elab_dMeta.v_convEc dtb_u_u442) (Elab_dTypes.v_ctxDepth dtb_u_u443)) dtb_u_u445) ((Elab_dTypes.v_forceVal dtb_u_u442) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u450))) with
  | Base_dDiag.C_Check_OkC (dtb_u_u451) -> true
  | Base_dDiag.C_Check_ErrC (dtb_u_u452) -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)))

# 1062 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictClassArgs = (fun (dtb_u_u453 : Elab_dTypes.t_Ec) (dtb_u_u454 : Core_dTerm.t_Value) -> (let dtb_u_u455 = ((Elab_dTypes.v_forceVal dtb_u_u453) dtb_u_u454) in (match dtb_u_u455 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u456) -> (match dtb_u_u456 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u457, dtb_u_u458) -> dtb_u_u458
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 1068 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictClassArg = (fun (dtb_u_u459 : Elab_dTypes.t_Ec) (dtb_u_u460 : Core_dTerm.t_Value) -> (match ((v_dictClassArgs dtb_u_u459) dtb_u_u460) with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u461, dtb_u_u462) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u461))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Elab/Dict.vuna"
let v_missingInstance = (fun (dtb_u_u464 : Elab_dTypes.t_Ec) (dtb_u_u465 : Core_dTerm.t_Value) (dtb_u_u466 : Base_dSource.t_Span) -> (let dtb_u_u467 = ((Elab_dTypes.v_forceVal dtb_u_u464) dtb_u_u465) in (let dtb_u_u468 = (Core_dEval.v_showValue dtb_u_u467) in (if ((v_valueDictFamily dtb_u_u467) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then (let dtb_u_u469 = (match ((v_dictClassArg dtb_u_u464) dtb_u_u467) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u470) -> ((v_showResolvedValue dtb_u_u464) dtb_u_u470)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u468
  | _ -> failwith "DT: impossible branch"
) in (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u466) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (dtb_u_u469))) dtb_u_u469)) else (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u466) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (dtb_u_u468))) dtb_u_u468)))))

# 289 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedInterpGoalGo = (fun (dtb_u_u471 : Elab_dTypes.t_Ec) (dtb_u_u472 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u472 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u473, dtb_u_u474) -> (match dtb_u_u473 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u475; Elab_dTypes.f_Constraint_conKind = dtb_u_u476; Elab_dTypes.f_Constraint_conMeta = dtb_u_u477; Elab_dTypes.f_Constraint_conDom = dtb_u_u478; Elab_dTypes.f_Constraint_conSpan = dtb_u_u479; Elab_dTypes.f_Constraint_conDepth = dtb_u_u480 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u477) (Elab_dTypes.v_ecSolTbl dtb_u_u471)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u481) -> ((v_firstUnsolvedInterpGoalGo dtb_u_u471) dtb_u_u474)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u482 = ((Elab_dTypes.v_forceVal dtb_u_u471) dtb_u_u478) in (if ((v_valueDictFamily dtb_u_u482) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then (B_dData_dMaybe.C_Maybe_Just ((match ((v_dictClassArg dtb_u_u471) dtb_u_u482) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u483) -> ((v_showResolvedValue dtb_u_u471) dtb_u_u483)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_showResolvedValue dtb_u_u471) dtb_u_u482)
  | _ -> failwith "DT: impossible branch"
))) else ((v_firstUnsolvedInterpGoalGo dtb_u_u471) dtb_u_u474)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedInterpGoal = (fun (dtb_u_u484 : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedInterpGoalGo dtb_u_u484) (Elab_dTypes.v_ecPendingList dtb_u_u484)))

# 1089 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_valueHasRigidNVar = (fun (dtb_u_u485 : Elab_dTypes.t_Ec) (dtb_u_u486 : int) (dtb_u_u487 : Core_dTerm.t_Value) -> (if (dtb_u_u486 <= 0) then false else (match ((Elab_dTypes.v_forceVal dtb_u_u485) dtb_u_u487) with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u488) -> (match dtb_u_u488 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u489, dtb_u_u490, dtb_u_u491) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u492, dtb_u_u493) -> (((v_anyValueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u493)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb_u_u494, dtb_u_u495) -> (((v_anyValueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u495)
  | Core_dTerm.C_Value_VApp (dtb_u_u496, dtb_u_u497) -> (if (((v_valueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u496) then true else (((v_valueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u497))
  | Core_dTerm.C_Value_VCase (dtb_u_u498, dtb_u_u499) -> (((v_valueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u498)
  | Core_dTerm.C_Value_VIf (dtb_u_u500, dtb_u_u501, dtb_u_u502) -> (if (if (((v_valueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u500) then true else (((v_valueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u501)) then true else (((v_valueHasRigidNVar dtb_u_u485) (dtb_u_u486 - 1)) dtb_u_u502))
  | _ -> false
)))
# 1105 "Vuna/Compiler/Elab/Dict.vuna"
and v_anyValueHasRigidNVar = (fun (dtb_u_u503 : Elab_dTypes.t_Ec) (dtb_u_u504 : int) (dtb_u_u505 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u505 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u506, dtb_u_u507) -> (if (((v_valueHasRigidNVar dtb_u_u503) dtb_u_u504) dtb_u_u506) then true else (((v_anyValueHasRigidNVar dtb_u_u503) dtb_u_u504) dtb_u_u507))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1086 "Vuna/Compiler/Elab/Dict.vuna"
let v_isRigidClassArg = (fun (dtb_u_u508 : Elab_dTypes.t_Ec) (dtb_u_u509 : Core_dTerm.t_Value) -> (((v_valueHasRigidNVar dtb_u_u508) 64) dtb_u_u509))

# 1081 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyRigidClassArg = (fun (dtb_u_u510 : Elab_dTypes.t_Ec) (dtb_u_u511 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u511 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u512, dtb_u_u513) -> (if ((v_isRigidClassArg dtb_u_u510) dtb_u_u512) then true else ((v_anyRigidClassArg dtb_u_u510) dtb_u_u513))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1078 "Vuna/Compiler/Elab/Dict.vuna"
let v_isRigidDictArg = (fun (dtb_u_u514 : Elab_dTypes.t_Ec) (dtb_u_u515 : Core_dTerm.t_Value) -> ((v_anyRigidClassArg dtb_u_u514) ((v_dictClassArgs dtb_u_u514) dtb_u_u515)))

# 332 "Vuna/Compiler/Elab/Dict.vuna"
let v_rigidSearchFast = (fun (dtb_u_u516 : Elab_dTypes.t_Ec) (dtb_u_u517 : Core_dTerm.t_Value) -> (if ((v_isRigidDictArg dtb_u_u516) dtb_u_u517) then (v_allInstancesMono ((v_searchCandidates dtb_u_u516) dtb_u_u517)) else false))

# 1111 "Vuna/Compiler/Elab/Dict.vuna"
let v_eqClassName = "Base.Trait.Eq.Eq"

# 1114 "Vuna/Compiler/Elab/Dict.vuna"
let v_ordClassName = "Base.Trait.Ord.Ord"

# 1117 "Vuna/Compiler/Elab/Dict.vuna"
let v_numClassName = "Base.Trait.Num.Num"

# 1123 "Vuna/Compiler/Elab/Dict.vuna"
let v_classHasProjection = (fun (dtb_u_u518 : string) (dtb_u_u519 : string) (dtb_u_u520 : string) (dtb_u_u521 : Elab_dTypes.t_Ec) -> (match ((v_findClass dtb_u_u518) (Elab_dTypes.v_ecClasses dtb_u_u521)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u522) -> (((Elab_dPrelude.v_classMethodProjection (dtb_u_u522).Elab_dTypes.f_DtClass_dtClassMethods) dtb_u_u519) = dtb_u_u520)
  | _ -> failwith "DT: impossible branch"
))

# 1131 "Vuna/Compiler/Elab/Dict.vuna"
let v_findEqClass = (fun (dtb_u_u523 : string) (dtb_u_u524 : Elab_dTypes.t_Ec) -> (match ((Elab_dMeta.v_findClassByMethod dtb_u_u523) (Elab_dTypes.v_ecClasses dtb_u_u524)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u525) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u525))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findClass v_eqClassName) (Elab_dTypes.v_ecClasses dtb_u_u524))
  | _ -> failwith "DT: impossible branch"
))

# 1137 "Vuna/Compiler/Elab/Dict.vuna"
let v_findOrdClass = (fun (dtb_u_u526 : string) (dtb_u_u527 : Elab_dTypes.t_Ec) -> (match ((Elab_dMeta.v_findClassByMethod dtb_u_u526) (Elab_dTypes.v_ecClasses dtb_u_u527)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u528) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u528))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findClass v_ordClassName) (Elab_dTypes.v_ecClasses dtb_u_u527))
  | _ -> failwith "DT: impossible branch"
))

# 1144 "Vuna/Compiler/Elab/Dict.vuna"
let v_methodShortOf = (fun (dtb_u_u529 : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u529))))

# 1158 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpShort = (fun (dtb_u_u530 : t_BuiltinOp) -> (match dtb_u_u530 with
  | { f_BuiltinOp_boShort = dtb_u_u531; f_BuiltinOp_boOp = dtb_u_u532; f_BuiltinOp_boRuntime = dtb_u_u533 } -> dtb_u_u531
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpName = (fun (dtb_u_u534 : t_BuiltinOp) -> (match dtb_u_u534 with
  | { f_BuiltinOp_boShort = dtb_u_u535; f_BuiltinOp_boOp = dtb_u_u536; f_BuiltinOp_boRuntime = dtb_u_u537 } -> dtb_u_u536
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpRuntime = (fun (dtb_u_u538 : t_BuiltinOp) -> (match dtb_u_u538 with
  | { f_BuiltinOp_boShort = dtb_u_u539; f_BuiltinOp_boOp = dtb_u_u540; f_BuiltinOp_boRuntime = dtb_u_u541 } -> dtb_u_u541
  | _ -> failwith "DT: impossible branch"
))

# 1167 "Vuna/Compiler/Elab/Dict.vuna"
let v_eqMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "=="; f_BuiltinOp_boOp = "=="; f_BuiltinOp_boRuntime = "eq" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "/="; f_BuiltinOp_boOp = "/="; f_BuiltinOp_boRuntime = "neq" }, B_dData_dList.C_List_Nil))))

# 1170 "Vuna/Compiler/Elab/Dict.vuna"
let v_ordMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "<"; f_BuiltinOp_boOp = "<"; f_BuiltinOp_boRuntime = "lt" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "<="; f_BuiltinOp_boOp = "<="; f_BuiltinOp_boRuntime = "le" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = ">"; f_BuiltinOp_boOp = ">"; f_BuiltinOp_boRuntime = "gt" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = ">="; f_BuiltinOp_boOp = ">="; f_BuiltinOp_boRuntime = "ge" }, B_dData_dList.C_List_Nil))))))))

# 1179 "Vuna/Compiler/Elab/Dict.vuna"
let v_numMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "+"; f_BuiltinOp_boOp = "+"; f_BuiltinOp_boRuntime = "add" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "-"; f_BuiltinOp_boOp = "-"; f_BuiltinOp_boRuntime = "sub" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "*"; f_BuiltinOp_boOp = "*"; f_BuiltinOp_boRuntime = "mul" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "/"; f_BuiltinOp_boOp = "/"; f_BuiltinOp_boRuntime = "div" }, B_dData_dList.C_List_Nil))))))))

# 1197 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_lookupBuiltinOpShort = (fun (dtb_u_u542 : string) (dtb_u_u543 : t_BuiltinOp B_dData_dList.t_List) -> (match dtb_u_u543 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u544, dtb_u_u545) -> (if ((v_builtinOpShort dtb_u_u544) = dtb_u_u542) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u544)) else ((v_lookupBuiltinOpShort dtb_u_u542) dtb_u_u545))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1202 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_lookupBuiltinOpProjection = (fun (dtb_u_u546 : Elab_dTypes.t_Ec) (dtb_u_u547 : string) (dtb_u_u548 : string) (dtb_u_u549 : t_BuiltinOp B_dData_dList.t_List) -> (match dtb_u_u549 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u550, dtb_u_u551) -> (if ((((v_classHasProjection dtb_u_u547) (v_builtinOpShort dtb_u_u550)) dtb_u_u548) dtb_u_u546) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u550)) else ((((v_lookupBuiltinOpProjection dtb_u_u546) dtb_u_u547) dtb_u_u548) dtb_u_u551))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1191 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpOf = (fun (dtb_u_u552 : Elab_dTypes.t_Ec) (dtb_u_u553 : string) (dtb_u_u554 : string) (dtb_u_u555 : t_BuiltinOp B_dData_dList.t_List) -> (match ((v_lookupBuiltinOpShort (v_methodShortOf dtb_u_u554)) dtb_u_u555) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u556) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u556))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lookupBuiltinOpProjection dtb_u_u552) dtb_u_u553) dtb_u_u554) dtb_u_u555)
  | _ -> failwith "DT: impossible branch"
))

# 1212 "Vuna/Compiler/Elab/Dict.vuna"
let v_isEqMethod = (fun (dtb_u_u557 : Elab_dTypes.t_Ec) (dtb_u_u558 : string) -> (match ((((v_builtinOpOf dtb_u_u557) v_eqClassName) dtb_u_u558) v_eqMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u559) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Elab/Dict.vuna"
let v_isCmpMethod = (fun (dtb_u_u560 : Elab_dTypes.t_Ec) (dtb_u_u561 : string) -> (match ((((v_builtinOpOf dtb_u_u560) v_ordClassName) dtb_u_u561) v_ordMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u562) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1225 "Vuna/Compiler/Elab/Dict.vuna"
let v_numMethodOpName = (fun (dtb_u_u563 : Elab_dTypes.t_Ec) (dtb_u_u564 : string) -> (match ((((v_builtinOpOf dtb_u_u563) v_numClassName) dtb_u_u564) v_numMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u565) -> (B_dData_dMaybe.C_Maybe_Just ((v_builtinOpName dtb_u_u565)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1232 "Vuna/Compiler/Elab/Dict.vuna"
let v_projectionFor = (fun (dtb_u_u566 : Elab_dTypes.t_DtClass) (dtb_u_u567 : string) -> ((Elab_dPrelude.v_classMethodProjection (dtb_u_u566).Elab_dTypes.f_DtClass_dtClassMethods) dtb_u_u567))

# 1275 "Vuna/Compiler/Elab/Dict.vuna"
let v_deferEqDict = (fun (dtb_u_u568 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u569 : Elab_dTypes.t_Ctx) (dtb_u_u570 : string) (dtb_u_u571 : Core_dTerm.t_Term) (dtb_u_u572 : Core_dTerm.t_Term) (dtb_u_u573 : Core_dTerm.t_Term) (dtb_u_u574 : Base_dSource.t_Span) (dtb_u_u575 : Core_dTerm.t_Value) (dtb_u_u576 : Elab_dTypes.t_Ec) -> (let dtb_u_u577 = (Elab_dTypes.v_ecNext dtb_u_u576) in (match (((Elab_dMetaSpans.v_newMetaAt dtb_u_u574) dtb_u_u569) dtb_u_u576) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u578; B_dData_dPair.f_Pair_second = dtb_u_u579 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u570)), dtb_u_u571, Core_dTerm.C_Rig_Rig0)), dtb_u_u578, Core_dTerm.C_Rig_RigOmega)), dtb_u_u572, Core_dTerm.C_Rig_Rig1)), dtb_u_u573, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb_u_u579) Elab_dTypes.C_ConstraintKind_CkDict) dtb_u_u577) dtb_u_u575) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u574))) (Elab_dTypes.v_ctxDepth dtb_u_u569)) } }))))
  | _ -> failwith "DT: impossible branch"
)))

# 1294 "Vuna/Compiler/Elab/Dict.vuna"
let v_cmpTypeTag = (fun (dtb_u_u580 : string) -> (if (dtb_u_u580 = "Int") then (B_dData_dMaybe.C_Maybe_Just ("int")) else (if (dtb_u_u580 = "String") then (B_dData_dMaybe.C_Maybe_Just ("str")) else (if (dtb_u_u580 = "Float") then (B_dData_dMaybe.C_Maybe_Just ("float")) else (if (Base_dIntrinsics.v_isBoolCanonical dtb_u_u580) then (B_dData_dMaybe.C_Maybe_Just ("bool")) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 1301 "Vuna/Compiler/Elab/Dict.vuna"
let v_cmpRuntimeName = (fun (dtb_u_u581 : Base_dSource.t_Span) (dtb_u_u582 : string) (dtb_u_u583 : string) -> (match ((v_lookupBuiltinOpShort (v_methodShortOf dtb_u_u582)) v_ordMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u584) -> (match (v_cmpTypeTag dtb_u_u583) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u585) -> (Base_dDiag.C_Check_OkC ((String.concat "" ["bi_"; (v_builtinOpRuntime dtb_u_u584); "_"; dtb_u_u585])))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u581) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor (dtb_u_u582, dtb_u_u583))) dtb_u_u582) dtb_u_u583)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u581) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor (dtb_u_u582, dtb_u_u583))) dtb_u_u582) dtb_u_u583)
  | _ -> failwith "DT: impossible branch"
))

# 1320 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyUnsolvedMetaArg = (fun (dtb_u_u586 : Elab_dTypes.t_Ec) (dtb_u_u587 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u587 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u588, dtb_u_u589) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP dtb_u_u586)) ((Elab_dTypes.v_forceVal dtb_u_u586) dtb_u_u588)) then true else ((v_anyUnsolvedMetaArg dtb_u_u586) dtb_u_u589))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1314 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgUnsolvedMeta = (fun (dtb_u_u590 : Elab_dTypes.t_Ec) (dtb_u_u591 : Core_dTerm.t_Value) -> ((v_anyUnsolvedMetaArg dtb_u_u590) ((v_dictClassArgs dtb_u_u590) dtb_u_u591)))

# 1358 "Vuna/Compiler/Elab/Dict.vuna"
let v_boolShortCircuit = (fun (dtb_u_u592 : string) (dtb_u_u593 : Core_dTerm.t_Term) (dtb_u_u594 : Core_dTerm.t_Term) -> (if (dtb_u_u592 = "&&") then (Core_dTerm.C_Term_TIf (dtb_u_u593, dtb_u_u594, (Core_dTerm.C_Term_TBool (false)))) else (Core_dTerm.C_Term_TIf (dtb_u_u593, (Core_dTerm.C_Term_TBool (true)), dtb_u_u594))))

# 1365 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedMemberGoalGo = (fun (dtb_u_u595 : Elab_dTypes.t_Ec) (dtb_u_u596 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u596 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u597, dtb_u_u598) -> (match dtb_u_u597 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u599; Elab_dTypes.f_Constraint_conKind = dtb_u_u600; Elab_dTypes.f_Constraint_conMeta = dtb_u_u601; Elab_dTypes.f_Constraint_conDom = dtb_u_u602; Elab_dTypes.f_Constraint_conSpan = dtb_u_u603; Elab_dTypes.f_Constraint_conDepth = dtb_u_u604 } -> (if ((v_isMemberDomain dtb_u_u595) dtb_u_u602) then (match ((Core_dTerm.v_metaLookup dtb_u_u601) (Elab_dTypes.v_ecSolTbl dtb_u_u595)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ((Core_dEval.v_showValue ((Elab_dTypes.v_forceVal dtb_u_u595) dtb_u_u602))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u605) -> ((v_firstUnsolvedMemberGoalGo dtb_u_u595) dtb_u_u598)
  | _ -> failwith "DT: impossible branch"
) else ((v_firstUnsolvedMemberGoalGo dtb_u_u595) dtb_u_u598))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1362 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedMemberGoal = (fun (dtb_u_u606 : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedMemberGoalGo dtb_u_u606) (Elab_dTypes.v_ecPendingList dtb_u_u606)))

# 1384 "Vuna/Compiler/Elab/Dict.vuna"
let v_isLeftoverDictGoal = (fun (dtb_u_u607 : Elab_dTypes.t_Ec) (dtb_u_u608 : Core_dTerm.t_Value) -> (if ((v_valueDictFamily dtb_u_u608) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then false else (if ((v_isMemberDomain dtb_u_u607) dtb_u_u608) then false else (if ((v_anyUnsolvedMetaArg dtb_u_u607) ((v_dictClassArgs dtb_u_u607) dtb_u_u608)) then false else (if ((v_isRigidDictArg dtb_u_u607) dtb_u_u608) then false else true)))))

# 1394 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalGo = (fun (dtb_u_u609 : Elab_dTypes.t_Ec) (dtb_u_u610 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u610 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u611, dtb_u_u612) -> (match dtb_u_u611 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u613; Elab_dTypes.f_Constraint_conKind = dtb_u_u614; Elab_dTypes.f_Constraint_conMeta = dtb_u_u615; Elab_dTypes.f_Constraint_conDom = dtb_u_u616; Elab_dTypes.f_Constraint_conSpan = dtb_u_u617; Elab_dTypes.f_Constraint_conDepth = dtb_u_u618 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u615) (Elab_dTypes.v_ecSolTbl dtb_u_u609)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u619) -> ((v_firstUnsolvedDictGoalGo dtb_u_u609) dtb_u_u612)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u620 = ((Elab_dTypes.v_forceVal dtb_u_u609) dtb_u_u616) in (if ((v_isLeftoverDictGoal dtb_u_u609) dtb_u_u620) then (B_dData_dMaybe.C_Maybe_Just (((v_showResolvedValue dtb_u_u609) dtb_u_u620))) else ((v_firstUnsolvedDictGoalGo dtb_u_u609) dtb_u_u612)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1379 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoal = (fun (dtb_u_u621 : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictGoalGo dtb_u_u621) (Elab_dTypes.v_ecPendingList dtb_u_u621)))

# 1442 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedInterpSpanGo = (fun (dtb_u_u622 : Elab_dTypes.t_Ec) (dtb_u_u623 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u623 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u624, dtb_u_u625) -> (match dtb_u_u624 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u626; Elab_dTypes.f_Constraint_conKind = dtb_u_u627; Elab_dTypes.f_Constraint_conMeta = dtb_u_u628; Elab_dTypes.f_Constraint_conDom = dtb_u_u629; Elab_dTypes.f_Constraint_conSpan = dtb_u_u630; Elab_dTypes.f_Constraint_conDepth = dtb_u_u631 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u628) (Elab_dTypes.v_ecSolTbl dtb_u_u622)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u632) -> ((v_firstUnsolvedInterpSpanGo dtb_u_u622) dtb_u_u625)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u633 = ((Elab_dTypes.v_forceVal dtb_u_u622) dtb_u_u629) in (if ((v_valueDictFamily dtb_u_u633) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then dtb_u_u630 else ((v_firstUnsolvedInterpSpanGo dtb_u_u622) dtb_u_u625)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1438 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedInterpGoalSpan = (fun (dtb_u_u634 : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedInterpSpanGo dtb_u_u634) (Elab_dTypes.v_ecPendingList dtb_u_u634)))

# 1460 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedMemberSpanGo = (fun (dtb_u_u635 : Elab_dTypes.t_Ec) (dtb_u_u636 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u636 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u637, dtb_u_u638) -> (match dtb_u_u637 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u639; Elab_dTypes.f_Constraint_conKind = dtb_u_u640; Elab_dTypes.f_Constraint_conMeta = dtb_u_u641; Elab_dTypes.f_Constraint_conDom = dtb_u_u642; Elab_dTypes.f_Constraint_conSpan = dtb_u_u643; Elab_dTypes.f_Constraint_conDepth = dtb_u_u644 } -> (if ((v_isMemberDomain dtb_u_u635) dtb_u_u642) then (match ((Core_dTerm.v_metaLookup dtb_u_u641) (Elab_dTypes.v_ecSolTbl dtb_u_u635)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u643
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u645) -> ((v_firstUnsolvedMemberSpanGo dtb_u_u635) dtb_u_u638)
  | _ -> failwith "DT: impossible branch"
) else ((v_firstUnsolvedMemberSpanGo dtb_u_u635) dtb_u_u638))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1456 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedMemberGoalSpan = (fun (dtb_u_u646 : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedMemberSpanGo dtb_u_u646) (Elab_dTypes.v_ecPendingList dtb_u_u646)))

# 1475 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictSpanGo = (fun (dtb_u_u647 : Elab_dTypes.t_Ec) (dtb_u_u648 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u648 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u649, dtb_u_u650) -> (match dtb_u_u649 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u651; Elab_dTypes.f_Constraint_conKind = dtb_u_u652; Elab_dTypes.f_Constraint_conMeta = dtb_u_u653; Elab_dTypes.f_Constraint_conDom = dtb_u_u654; Elab_dTypes.f_Constraint_conSpan = dtb_u_u655; Elab_dTypes.f_Constraint_conDepth = dtb_u_u656 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u653) (Elab_dTypes.v_ecSolTbl dtb_u_u647)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u657) -> ((v_firstUnsolvedDictSpanGo dtb_u_u647) dtb_u_u650)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u658 = ((Elab_dTypes.v_forceVal dtb_u_u647) dtb_u_u654) in (if ((v_isLeftoverDictGoal dtb_u_u647) dtb_u_u658) then dtb_u_u655 else ((v_firstUnsolvedDictSpanGo dtb_u_u647) dtb_u_u650)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1471 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalSpan = (fun (dtb_u_u659 : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictSpanGo dtb_u_u659) (Elab_dTypes.v_ecPendingList dtb_u_u659)))

# 1490 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalMetaGo = (fun (dtb_u_u660 : Elab_dTypes.t_Ec) (dtb_u_u661 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u661 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u662, dtb_u_u663) -> (match dtb_u_u662 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u664; Elab_dTypes.f_Constraint_conKind = dtb_u_u665; Elab_dTypes.f_Constraint_conMeta = dtb_u_u666; Elab_dTypes.f_Constraint_conDom = dtb_u_u667; Elab_dTypes.f_Constraint_conSpan = dtb_u_u668; Elab_dTypes.f_Constraint_conDepth = dtb_u_u669 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u666) (Elab_dTypes.v_ecSolTbl dtb_u_u660)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u670) -> ((v_firstUnsolvedDictGoalMetaGo dtb_u_u660) dtb_u_u663)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u671 = ((Elab_dTypes.v_forceVal dtb_u_u660) dtb_u_u667) in (if ((v_isLeftoverDictGoal dtb_u_u660) dtb_u_u671) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u666)) else ((v_firstUnsolvedDictGoalMetaGo dtb_u_u660) dtb_u_u663)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1486 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalMeta = (fun (dtb_u_u672 : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictGoalMetaGo dtb_u_u672) (Elab_dTypes.v_ecPendingList dtb_u_u672)))

# 1533 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_memberWeakenProof = (fun (dtb_u_u673 : int) (dtb_u_u674 : Elab_dTypes.t_Ec) (dtb_u_u675 : int) (dtb_u_u676 : Core_dTerm.t_Value) (dtb_u_u677 : Core_dTerm.t_Value) (dtb_u_u678 : Core_dTerm.t_Value) (dtb_u_u679 : Core_dTerm.t_Value) -> (if (dtb_u_u673 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((Elab_dMeta.v_convEc dtb_u_u674) dtb_u_u675) dtb_u_u677) dtb_u_u678) with
  | Base_dDiag.C_Check_OkC (dtb_u_u680) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u679; B_dData_dPair.f_Pair_second = dtb_u_u680 }))
  | Base_dDiag.C_Check_ErrC (dtb_u_u681) -> (match ((Elab_dTypes.v_forceVal dtb_u_u674) dtb_u_u677) with
  | Core_dTerm.C_Value_VCon (dtb_u_u682, dtb_u_u683) -> (if (dtb_u_u682 = Base_dIntrinsics.v_effRowConsCtor) then (let dtb_u_u684 = dtb_u_u683 in (match dtb_u_u684 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u685, dtb_u_u686) -> (match dtb_u_u686 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u687, dtb_u_u688) -> (let dtb_u_u689 = (((((((v_memberWeakenProof (dtb_u_u673 - 1)) dtb_u_u674) dtb_u_u675) dtb_u_u676) dtb_u_u687) dtb_u_u678) dtb_u_u679) in (match dtb_u_u689 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u690) -> (match dtb_u_u690 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u691; B_dData_dPair.f_Pair_second = dtb_u_u692 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_ctorValue dtb_u_u692) v_thereCtorName) (B_dData_dList.C_List__x58__x58_ (dtb_u_u676, (B_dData_dList.C_List__x58__x58_ (dtb_u_u685, (B_dData_dList.C_List__x58__x58_ (dtb_u_u687, (B_dData_dList.C_List__x58__x58_ (dtb_u_u691, B_dData_dList.C_List_Nil))))))))); B_dData_dPair.f_Pair_second = dtb_u_u692 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 1512 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_ctxMemberWeakenGo = (fun (dtb_u_u693 : Elab_dTypes.t_Ctx) (dtb_u_u694 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u695 : int) (dtb_u_u696 : Elab_dTypes.t_Ec) (dtb_u_u697 : Core_dTerm.t_Value) -> (match dtb_u_u694 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u698, dtb_u_u699) -> (match dtb_u_u698 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u700; B_dData_dPair.f_Pair_second = dtb_u_u701 } -> (let dtb_u_u702 = (B_dData_dList.v_length dtb_u_u699) in (let dtb_u_u703 = ((Core_dEval.v_eval ((B_dData_dList.v_map ((Elab_dTypes.v_refineValue (dtb_u_u693).Elab_dTypes.f_Ctx_ctxRefVals) Core_dTerm.v_defaultFuel)) (((Elab_dTypes.v_ctxEnvAt dtb_u_u699) 0) dtb_u_u702))) dtb_u_u701) in (let dtb_u_u704 = (v_memberSpine dtb_u_u697) in (match dtb_u_u704 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u705) -> (match dtb_u_u705 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u706; B_dData_dPair.f_Pair_second = dtb_u_u707 } -> (let dtb_u_u708 = (v_memberSpine dtb_u_u703) in (match dtb_u_u708 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u709) -> (match dtb_u_u709 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u710; B_dData_dPair.f_Pair_second = dtb_u_u711 } -> (match ((((Elab_dMeta.v_convEc dtb_u_u696) (Elab_dTypes.v_ctxDepth dtb_u_u693)) dtb_u_u706) dtb_u_u710) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u712) -> (((((v_ctxMemberWeakenGo dtb_u_u693) dtb_u_u699) (dtb_u_u695 + 1)) dtb_u_u696) dtb_u_u697)
  | Base_dDiag.C_Check_OkC (dtb_u_u713) -> (let dtb_u_u714 = (((((((v_memberWeakenProof 64) dtb_u_u713) (Elab_dTypes.v_ctxDepth dtb_u_u693)) dtb_u_u706) dtb_u_u707) dtb_u_u711) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u700, dtb_u_u695, B_dData_dList.C_List_Nil))))) in (match dtb_u_u714 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u715) -> (match dtb_u_u715 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u716; B_dData_dPair.f_Pair_second = dtb_u_u717 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth dtb_u_u693)) dtb_u_u716); B_dData_dPair.f_Pair_second = dtb_u_u717 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ctxMemberWeakenGo dtb_u_u693) dtb_u_u699) (dtb_u_u695 + 1)) dtb_u_u696) dtb_u_u697)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ctxMemberWeakenGo dtb_u_u693) dtb_u_u699) (dtb_u_u695 + 1)) dtb_u_u696) dtb_u_u697)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1509 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctxMemberWeaken = (fun (dtb_u_u718 : Elab_dTypes.t_Ctx) (dtb_u_u719 : Elab_dTypes.t_Ec) (dtb_u_u720 : Core_dTerm.t_Value) -> (((((v_ctxMemberWeakenGo dtb_u_u718) (dtb_u_u718).Elab_dTypes.f_Ctx_ctxItems) 0) dtb_u_u719) dtb_u_u720))

# 59 "Vuna/Compiler/Elab/Dict.vuna"
let v_instMatchInst = (fun (dtb_u_u721 : t_InstMatch) -> (match dtb_u_u721 with
  | { f_InstMatch_instMatchInst = dtb_u_u722; f_InstMatch_instMatchTerm = dtb_u_u723 } -> dtb_u_u722
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Dict.vuna"
let v_finishInstanceSearch = (fun (dtb_u_u724 : Core_dTerm.t_Value) (dtb_u_u725 : Base_dSource.t_Span) (dtb_u_u726 : t_InstMatch B_dData_dList.t_List) (dtb_u_u727 : Elab_dTypes.t_Ec) -> (match dtb_u_u726 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u728, dtb_u_u729) -> (match dtb_u_u729 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb_u_u728).f_InstMatch_instMatchTerm; B_dData_dPair.f_Pair_second = dtb_u_u727 }))
  | _ -> (let dtb_u_u730 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["search-ambig: dom="; (Core_dEval.v_showValue dtb_u_u724); " cands="; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (fun (dtb_u_u733 : t_InstMatch) -> (Elab_dTypes.v_dtInstName (v_instMatchInst dtb_u_u733)))) dtb_u_u726))])) else 0) in (let dtb_u_u731 = (Core_dEval.v_showValue dtb_u_u724) in (let dtb_u_u732 = (v_joinInstNames ((B_dData_dList.v_map v_instMatchInst) dtb_u_u726)) in ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u725) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousInstance (dtb_u_u731, dtb_u_u732))) dtb_u_u731) dtb_u_u732))))
)
  | B_dData_dList.C_List_Nil -> (((v_missingInstance dtb_u_u727) dtb_u_u724) dtb_u_u725)
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_searchInstFuel = (fun (dtb_u_u734 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u735 : Elab_dTypes.t_Ctx) (dtb_u_u736 : int) (dtb_u_u737 : Elab_dTypes.t_Ec) (dtb_u_u738 : Core_dTerm.t_Value) (dtb_u_u739 : Base_dSource.t_Span) -> (let dtb_u_u740 = ((Elab_dTypes.v_ecBump dtb_u_u737) "elab.inst.search") in (if (dtb_u_u736 <= 0) then (((v_exhaustedInstance dtb_u_u740) dtb_u_u738) dtb_u_u739) else (let dtb_u_u741 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["search: dom="; (Core_dEval.v_showValue dtb_u_u738); " rigid="; (if ((v_rigidSearchFast dtb_u_u740) dtb_u_u738) then "T" else "F"); " insts="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecInstList dtb_u_u740)))])) else 0) in (match ((((v_localDictLookup dtb_u_u735) 0) dtb_u_u738) dtb_u_u740) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u742) -> (Base_dDiag.C_Check_OkC (dtb_u_u742))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((v_rigidSearchFast dtb_u_u740) dtb_u_u738) then (B_dData_dBool.v_not ((v_viaCandidateExists dtb_u_u740) dtb_u_u738)) else false) then (((v_missingInstance dtb_u_u740) dtb_u_u738) dtb_u_u739) else (match ((((((((v_matchInstances dtb_u_u734) dtb_u_u735) dtb_u_u736) dtb_u_u740) dtb_u_u738) dtb_u_u739) (v_specificInstances ((v_searchCandidates dtb_u_u740) dtb_u_u738))) B_dData_dList.C_List_Nil) with
  | dtb_u_u743 -> (match (dtb_u_u743).f_InstScan_scanMatches with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u744 = ((((((v_tryViaDict dtb_u_u734) dtb_u_u735) (dtb_u_u736 - 1)) (dtb_u_u743).f_InstScan_scanEc) dtb_u_u738) dtb_u_u739) in (match dtb_u_u744 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u745) -> (Base_dDiag.C_Check_ErrC (dtb_u_u745))
  | Base_dDiag.C_Check_OkC (dtb_u_u746) -> (match dtb_u_u746 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u747 = ((((((((v_matchInstances dtb_u_u734) dtb_u_u735) dtb_u_u736) (dtb_u_u743).f_InstScan_scanEc) dtb_u_u738) dtb_u_u739) (v_blanketInstances ((v_searchCandidates dtb_u_u740) dtb_u_u738))) B_dData_dList.C_List_Nil) in (match (dtb_u_u747).f_InstScan_scanMatches with
  | B_dData_dList.C_List_Nil -> (if (if (dtb_u_u743).f_InstScan_scanExhausted then true else (dtb_u_u747).f_InstScan_scanExhausted) then (((v_exhaustedInstance (dtb_u_u743).f_InstScan_scanEc) dtb_u_u738) dtb_u_u739) else (((v_missingInstance (dtb_u_u743).f_InstScan_scanEc) dtb_u_u738) dtb_u_u739))
  | dtb_u_u748 -> ((((v_finishInstanceSearch dtb_u_u738) dtb_u_u739) dtb_u_u748) (dtb_u_u747).f_InstScan_scanEc)
))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u749) -> (Base_dDiag.C_Check_OkC (dtb_u_u749))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | dtb_u_u750 -> ((((v_finishInstanceSearch dtb_u_u738) dtb_u_u739) dtb_u_u750) (dtb_u_u743).f_InstScan_scanEc)
)
))
  | _ -> failwith "DT: impossible branch"
)))))
# 202 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryViaDict = (fun (dtb_u_u751 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u752 : Elab_dTypes.t_Ctx) (dtb_u_u753 : int) (dtb_u_u754 : Elab_dTypes.t_Ec) (dtb_u_u755 : Core_dTerm.t_Value) (dtb_u_u756 : Base_dSource.t_Span) -> (let dtb_u_u757 = ((Elab_dTypes.v_forceVal dtb_u_u754) dtb_u_u755) in (match dtb_u_u757 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u758) -> (match dtb_u_u758 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u759, dtb_u_u760) -> (if ((v_viaCandidateExists dtb_u_u754) dtb_u_u755) then ((((((((v_tryViaArgs dtb_u_u751) dtb_u_u752) dtb_u_u753) dtb_u_u754) dtb_u_u756) dtb_u_u759) dtb_u_u760) 0) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)))
# 213 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryViaArgs = (fun (dtb_u_u761 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u762 : Elab_dTypes.t_Ctx) (dtb_u_u763 : int) (dtb_u_u764 : Elab_dTypes.t_Ec) (dtb_u_u765 : Base_dSource.t_Span) (dtb_u_u766 : string) (dtb_u_u767 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u768 : int) -> (match dtb_u_u767 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u769, dtb_u_u770) -> (match (((v_viaWrapperOf dtb_u_u764) dtb_u_u766) dtb_u_u769) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_tryViaArgs dtb_u_u761) dtb_u_u762) dtb_u_u763) dtb_u_u764) dtb_u_u765) dtb_u_u766) dtb_u_u770) (dtb_u_u768 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u771) -> ((Base_dCommon.v_bind ((((((v_searchInstFuel dtb_u_u761) dtb_u_u762) (dtb_u_u763 - 1)) dtb_u_u764) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u766, (((v_replaceAt dtb_u_u768) dtb_u_u771) (B_dData_dList.C_List__x58__x58_ (dtb_u_u769, dtb_u_u770)))))))) dtb_u_u765)) (fun (dtb_u_u772 : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u772))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 394 "Vuna/Compiler/Elab/Dict.vuna"
and v_matchInstances = (fun (dtb_u_u773 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u774 : Elab_dTypes.t_Ctx) (dtb_u_u775 : int) (dtb_u_u776 : Elab_dTypes.t_Ec) (dtb_u_u777 : Core_dTerm.t_Value) (dtb_u_u778 : Base_dSource.t_Span) (dtb_u_u779 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (dtb_u_u780 : t_InstMatch B_dData_dList.t_List) -> ((((((((((v_scanInstances dtb_u_u773) dtb_u_u774) dtb_u_u775) dtb_u_u776) dtb_u_u777) dtb_u_u778) dtb_u_u779) dtb_u_u780) B_dData_dMaybe.C_Maybe_Nothing) false))
# 398 "Vuna/Compiler/Elab/Dict.vuna"
and v_scanInstances = (fun (dtb_u_u781 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u782 : Elab_dTypes.t_Ctx) (dtb_u_u783 : int) (dtb_u_u784 : Elab_dTypes.t_Ec) (dtb_u_u785 : Core_dTerm.t_Value) (dtb_u_u786 : Base_dSource.t_Span) (dtb_u_u787 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (dtb_u_u788 : t_InstMatch B_dData_dList.t_List) (dtb_u_u789 : Elab_dTypes.t_Ec B_dData_dMaybe.t_Maybe) (dtb_u_u790 : bool) -> (match dtb_u_u787 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u791, dtb_u_u792) -> (match (((((((v_tryMatchInst dtb_u_u781) dtb_u_u782) dtb_u_u783) dtb_u_u784) dtb_u_u791) dtb_u_u785) dtb_u_u786) with
  | C_InstTry_InstMatched (dtb_u_u793, dtb_u_u794) -> ((((((((((v_scanInstances dtb_u_u781) dtb_u_u782) dtb_u_u783) dtb_u_u784) dtb_u_u785) dtb_u_u786) dtb_u_u792) (B_dData_dList.C_List__x58__x58_ ({ f_InstMatch_instMatchInst = dtb_u_u791; f_InstMatch_instMatchTerm = dtb_u_u793 }, dtb_u_u788))) (match dtb_u_u789 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u795) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u795))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u794))
  | _ -> failwith "DT: impossible branch"
)) dtb_u_u790)
  | C_InstTry_InstMissed -> ((((((((((v_scanInstances dtb_u_u781) dtb_u_u782) dtb_u_u783) dtb_u_u784) dtb_u_u785) dtb_u_u786) dtb_u_u792) dtb_u_u788) dtb_u_u789) dtb_u_u790)
  | C_InstTry_InstOutOfFuel -> ((((((((((v_scanInstances dtb_u_u781) dtb_u_u782) dtb_u_u783) dtb_u_u784) dtb_u_u785) dtb_u_u786) dtb_u_u792) dtb_u_u788) dtb_u_u789) true)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_InstScan_scanMatches = (B_dData_dList.v_reverse dtb_u_u788); f_InstScan_scanEc = (match dtb_u_u789 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u796) -> dtb_u_u796
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u784
  | _ -> failwith "DT: impossible branch"
); f_InstScan_scanExhausted = dtb_u_u790 }
  | _ -> failwith "DT: impossible branch"
))
# 426 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryMatchInst = (fun (dtb_u_u797 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u798 : Elab_dTypes.t_Ctx) (dtb_u_u799 : int) (dtb_u_u800 : Elab_dTypes.t_Ec) (dtb_u_u801 : Elab_dTypes.t_DtInst) (dtb_u_u802 : Core_dTerm.t_Value) (dtb_u_u803 : Base_dSource.t_Span) -> (if (dtb_u_u799 <= 0) then C_InstTry_InstOutOfFuel else (match ((((v_allocTeleMetas (dtb_u_u801).Elab_dTypes.f_DtInst_dtInstSpan) dtb_u_u798) dtb_u_u800) (dtb_u_u801).Elab_dTypes.f_DtInst_dtInstTele) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u804; B_dData_dPair.f_Pair_second = dtb_u_u805 } -> (let dtb_u_u806 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["inst-try: "; (Elab_dTypes.v_dtInstName dtb_u_u801); " head="; (Core_dTerm.v_showTerm (dtb_u_u801).Elab_dTypes.f_DtInst_dtInstHead); " tele="; (string_of_int (B_dData_dList.v_length (dtb_u_u801).Elab_dTypes.f_DtInst_dtInstTele))])) else 0) in (let dtb_u_u807 = ((Core_dEval.v_eval ((B_dData_dList.v_map (fun (dtb_u_u821 : int) -> (Core_dTerm.C_Value_VMeta (dtb_u_u821, B_dData_dList.C_List_Nil)))) dtb_u_u804)) (dtb_u_u801).Elab_dTypes.f_DtInst_dtInstHead) in (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb_u_u805)) (Elab_dTypes.v_ecSolsP dtb_u_u805)) (Elab_dTypes.v_ctxDepth dtb_u_u798)) dtb_u_u802) dtb_u_u807) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u808) -> (let dtb_u_u809 = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["inst-conv-err: "; (Elab_dTypes.v_dtInstName dtb_u_u801); " dom="; (Core_dEval.v_showValue dtb_u_u802); " hd="; (Core_dEval.v_showValue dtb_u_u807)])) else 0) in C_InstTry_InstMissed)
  | Base_dDiag.C_Check_OkC (dtb_u_u810) -> (let dtb_u_u811 = ((Elab_dTypes.v_ecPutSols dtb_u_u805) (Core_dTerm.v_solsList dtb_u_u810)) in (match ((v_solveTeleMetas dtb_u_u811) dtb_u_u804) with
  | B_dData_dMaybe.C_Maybe_Nothing -> C_InstTry_InstMissed
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u812) -> (let dtb_u_u813 = ((B_dData_dList.v_map (fun (dtb_u_u820 : Core_dTerm.t_Value) -> { B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth dtb_u_u798)) ((Elab_dTypes.v_forceVal dtb_u_u811) dtb_u_u820)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) (B_dData_dList.v_reverse dtb_u_u812)) in (let dtb_u_u814 = ((B_dData_dList.v_map (fun (dtb_u_u819 : Core_dTerm.t_Value) -> ((Elab_dTypes.v_forceVal dtb_u_u811) dtb_u_u819))) dtb_u_u812) in (let dtb_u_u815 = ((B_dData_dList.v_map (fun (dtb_u_u818 : Core_dTerm.t_Term) -> ((Elab_dTypes.v_forceVal dtb_u_u811) ((Core_dEval.v_eval dtb_u_u814) dtb_u_u818)))) (dtb_u_u801).Elab_dTypes.f_DtInst_dtInstCtx) in (match (((((((v_solveDictCtxs dtb_u_u797) dtb_u_u798) (dtb_u_u799 - 1)) dtb_u_u811) dtb_u_u803) dtb_u_u815) B_dData_dList.C_List_Nil) with
  | C_CtxSolve_CtxSolved (dtb_u_u816, dtb_u_u817) -> (C_InstTry_InstMatched (((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dTypes.v_dtInstSym dtb_u_u801)))) ((B_dData_dList.v_append dtb_u_u813) dtb_u_u816)), dtb_u_u817))
  | C_CtxSolve_CtxUnsolvable -> C_InstTry_InstMissed
  | C_CtxSolve_CtxOutOfFuel -> C_InstTry_InstOutOfFuel
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 489 "Vuna/Compiler/Elab/Dict.vuna"
and v_solveDictCtxs = (fun (dtb_u_u822 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u823 : Elab_dTypes.t_Ctx) (dtb_u_u824 : int) (dtb_u_u825 : Elab_dTypes.t_Ec) (dtb_u_u826 : Base_dSource.t_Span) (dtb_u_u827 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u828 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u827 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u829, dtb_u_u830) -> (let dtb_u_u831 = ((((((v_searchInstFuel dtb_u_u822) dtb_u_u823) dtb_u_u824) dtb_u_u825) dtb_u_u829) dtb_u_u826) in (match dtb_u_u831 with
  | Base_dDiag.C_Check_OkC (dtb_u_u832) -> (match dtb_u_u832 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u833; B_dData_dPair.f_Pair_second = dtb_u_u834 } -> (((((((v_solveDictCtxs dtb_u_u822) dtb_u_u823) dtb_u_u824) dtb_u_u834) dtb_u_u826) dtb_u_u830) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u833; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, dtb_u_u828)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u835) -> (if (v_instOutOfFuelDiag dtb_u_u835) then C_CtxSolve_CtxOutOfFuel else C_CtxSolve_CtxUnsolvable)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (C_CtxSolve_CtxSolved ((B_dData_dList.v_reverse dtb_u_u828), dtb_u_u825))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchInstanceIn = (fun (dtb_u_u836 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u837 : Elab_dTypes.t_Ctx) (dtb_u_u838 : Elab_dTypes.t_Ec) (dtb_u_u839 : Core_dTerm.t_Value) (dtb_u_u840 : Base_dSource.t_Span) -> ((((((v_searchInstFuel dtb_u_u836) dtb_u_u837) v_instDepthBound) dtb_u_u838) dtb_u_u839) dtb_u_u840))

# 56 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchInstance = (fun (dtb_u_u841 : Elab_dTypes.t_Ec) (dtb_u_u842 : Core_dTerm.t_Value) (dtb_u_u843 : Base_dSource.t_Span) -> (((((v_searchInstanceIn B_dData_dList.C_List_Nil) Elab_dTypes.v_emptyCtx) dtb_u_u841) dtb_u_u842) dtb_u_u843))

# 712 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_resolveRowGoalsCtxGo = (fun (dtb_u_u844 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u845 : Elab_dTypes.t_Ctx) (dtb_u_u846 : Base_dSource.t_Span) (dtb_u_u847 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (dtb_u_u848 : Elab_dTypes.t_Ec) (dtb_u_u849 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u847 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u850, dtb_u_u851) -> (match dtb_u_u850 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u852; Elab_dTypes.f_Constraint_conKind = dtb_u_u853; Elab_dTypes.f_Constraint_conMeta = dtb_u_u854; Elab_dTypes.f_Constraint_conDom = dtb_u_u855; Elab_dTypes.f_Constraint_conSpan = dtb_u_u856; Elab_dTypes.f_Constraint_conDepth = dtb_u_u857 } -> (if ((v_isMemberDomain dtb_u_u848) dtb_u_u855) then (match ((((v_memberLookup 64) (Elab_dTypes.v_ctxDepth dtb_u_u845)) dtb_u_u848) dtb_u_u855) with
  | C_MemberLookup_MemberFound (dtb_u_u858, dtb_u_u859) -> (match ((((v_solveRowMeta dtb_u_u859) (Elab_dTypes.v_ctxDepth dtb_u_u845)) dtb_u_u854) dtb_u_u858) with
  | Base_dDiag.C_Check_OkC (dtb_u_u860) -> ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u860) dtb_u_u849)
  | Base_dDiag.C_Check_ErrC (dtb_u_u861) -> (Base_dDiag.C_Check_ErrC (dtb_u_u861))
  | _ -> failwith "DT: impossible branch"
)
  | C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u846) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | C_MemberLookup_MemberAmbiguous (dtb_u_u862) -> ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u846) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousInstance ("effect instance", ((B_dData_dString.v_join ", ") dtb_u_u862)))) "effect instance") ((B_dData_dString.v_join ", ") dtb_u_u862))
  | C_MemberLookup_MemberStuck -> (let dtb_u_u863 = (((v_ctxMemberProofUnify dtb_u_u845) dtb_u_u848) dtb_u_u855) in (match dtb_u_u863 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u864 = (((v_ctxMemberWeaken dtb_u_u845) dtb_u_u848) dtb_u_u855) in (match dtb_u_u864 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u846) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u865) -> (match dtb_u_u865 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u866; B_dData_dPair.f_Pair_second = dtb_u_u867 } -> (match ((((v_solveRowMeta dtb_u_u867) (Elab_dTypes.v_ctxDepth dtb_u_u845)) dtb_u_u854) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u845)) dtb_u_u866)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u868) -> ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u868) dtb_u_u849)
  | Base_dDiag.C_Check_ErrC (dtb_u_u869) -> (Base_dDiag.C_Check_ErrC (dtb_u_u869))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u870) -> (match dtb_u_u870 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u871; B_dData_dPair.f_Pair_second = dtb_u_u872 } -> (match ((((v_solveRowMeta dtb_u_u872) (Elab_dTypes.v_ctxDepth dtb_u_u845)) dtb_u_u854) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u845)) dtb_u_u871)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u873) -> ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u873) dtb_u_u849)
  | Base_dDiag.C_Check_ErrC (dtb_u_u874) -> (Base_dDiag.C_Check_ErrC (dtb_u_u874))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (match ((v_dictClassArgs dtb_u_u848) dtb_u_u855) with
  | B_dData_dList.C_List_Nil -> ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u848) (B_dData_dList.C_List__x58__x58_ (dtb_u_u850, dtb_u_u849)))
  | dtb_u_u875 -> (if ((v_anyUnsolvedMetaArg dtb_u_u848) dtb_u_u875) then ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u848) (B_dData_dList.C_List__x58__x58_ (dtb_u_u850, dtb_u_u849))) else (if (if ((v_isRigidDictArg dtb_u_u848) dtb_u_u855) then (v_allInstancesMono (Elab_dTypes.v_ecInstList dtb_u_u848)) else false) then ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u848) (B_dData_dList.C_List__x58__x58_ (dtb_u_u850, dtb_u_u849))) else (let dtb_u_u876 = (((((v_searchInstanceIn dtb_u_u844) dtb_u_u845) dtb_u_u848) ((Elab_dTypes.v_forceVal dtb_u_u848) dtb_u_u855)) dtb_u_u846) in (match dtb_u_u876 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u877) -> ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u848) (B_dData_dList.C_List__x58__x58_ (dtb_u_u850, dtb_u_u849)))
  | Base_dDiag.C_Check_OkC (dtb_u_u878) -> (match dtb_u_u878 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u879; B_dData_dPair.f_Pair_second = dtb_u_u880 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u880)) (Elab_dTypes.v_ecSolsP dtb_u_u880)) (Elab_dTypes.v_ctxDepth dtb_u_u845)) dtb_u_u854) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv dtb_u_u845)) dtb_u_u879)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u881) -> ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) ((Elab_dTypes.v_ecPutSols dtb_u_u880) (Core_dTerm.v_solsList dtb_u_u881))) dtb_u_u849)
  | Base_dDiag.C_Check_ErrC (dtb_u_u882) -> ((((((v_resolveRowGoalsCtxGo dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u851) dtb_u_u848) (B_dData_dList.C_List__x58__x58_ (dtb_u_u850, dtb_u_u849)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutPending dtb_u_u848) (B_dData_dList.v_reverse dtb_u_u849))))
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Elab/Dict.vuna"
let v_resolveRowGoalsCtx = (fun (dtb_u_u883 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u884 : Elab_dTypes.t_Ctx) (dtb_u_u885 : Elab_dTypes.t_Ec) (dtb_u_u886 : Base_dSource.t_Span) -> ((((((v_resolveRowGoalsCtxGo dtb_u_u883) dtb_u_u884) dtb_u_u886) (Elab_dTypes.v_ecPendingList dtb_u_u885)) dtb_u_u885) B_dData_dList.C_List_Nil))

# 831 "Vuna/Compiler/Elab/Dict.vuna"
let v_tryResolveDictGoal = (fun (dtb_u_u887 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u888 : Elab_dTypes.t_Ec) (dtb_u_u889 : Elab_dTypes.t_Constraint) (dtb_u_u890 : Core_dTerm.t_Value) -> (match dtb_u_u889 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u891; Elab_dTypes.f_Constraint_conKind = dtb_u_u892; Elab_dTypes.f_Constraint_conMeta = dtb_u_u893; Elab_dTypes.f_Constraint_conDom = dtb_u_u894; Elab_dTypes.f_Constraint_conSpan = dtb_u_u895; Elab_dTypes.f_Constraint_conDepth = dtb_u_u896 } -> (if (dtb_u_u896 > 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((v_isMemberDomain dtb_u_u888) dtb_u_u894) then (match ((((v_memberLookup 64) 0) dtb_u_u888) dtb_u_u894) with
  | C_MemberLookup_MemberFound (dtb_u_u897, dtb_u_u898) -> (match ((((v_solveRowMeta dtb_u_u898) dtb_u_u896) dtb_u_u893) dtb_u_u897) with
  | Base_dDiag.C_Check_OkC (dtb_u_u899) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u899))
  | Base_dDiag.C_Check_ErrC (dtb_u_u900) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_MemberLookup_MemberAbsent -> B_dData_dMaybe.C_Maybe_Nothing
  | C_MemberLookup_MemberAmbiguous (dtb_u_u901) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_MemberLookup_MemberStuck -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (match ((v_dictClassArgs dtb_u_u888) dtb_u_u890) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | dtb_u_u902 -> (if ((v_anyUnsolvedMetaArg dtb_u_u888) dtb_u_u902) then B_dData_dMaybe.C_Maybe_Nothing else (if (if ((v_isRigidDictArg dtb_u_u888) dtb_u_u890) then (v_allInstancesMono (Elab_dTypes.v_ecInstList dtb_u_u888)) else false) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u903 = (((v_searchInstance dtb_u_u888) dtb_u_u890) { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) in (match dtb_u_u903 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u904) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb_u_u905) -> (match dtb_u_u905 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u906; B_dData_dPair.f_Pair_second = dtb_u_u907 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb_u_u907)) (Elab_dTypes.v_ecSolsP dtb_u_u907)) dtb_u_u896) dtb_u_u893) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb_u_u906)) with
  | Base_dDiag.C_Check_OkC (dtb_u_u908) -> (B_dData_dMaybe.C_Maybe_Just (((Elab_dTypes.v_ecPutSols dtb_u_u907) (Core_dTerm.v_solsList dtb_u_u908))))
  | Base_dDiag.C_Check_ErrC (dtb_u_u909) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
)))
  | _ -> failwith "DT: impossible branch"
))

# 782 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_resolveDictGoalsFuel = (fun (dtb_u_u910 : int) (dtb_u_u911 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u912 : Elab_dTypes.t_Ec) -> (if (dtb_u_u910 <= 0) then dtb_u_u912 else (let dtb_u_u913 = (Elab_dTypes.v_ecPopPending dtb_u_u912) in (match dtb_u_u913 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u914) -> (match dtb_u_u914 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u915; B_dData_dPair.f_Pair_second = dtb_u_u916 } -> (match dtb_u_u915 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u917; Elab_dTypes.f_Constraint_conKind = dtb_u_u918; Elab_dTypes.f_Constraint_conMeta = dtb_u_u919; Elab_dTypes.f_Constraint_conDom = dtb_u_u920; Elab_dTypes.f_Constraint_conSpan = dtb_u_u921; Elab_dTypes.f_Constraint_conDepth = dtb_u_u922 } -> (let dtb_u_u923 = ((Elab_dTypes.v_ecBump dtb_u_u916) "elab.dict.round") in (match ((Core_dTerm.v_metaLookup dtb_u_u919) (Elab_dTypes.v_ecSolTbl dtb_u_u923)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u924) -> (((v_resolveDictGoalsFuel (dtb_u_u910 - 1)) dtb_u_u911) dtb_u_u923)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u925 = (Elab_dTypes.v_ecSolsCountOf dtb_u_u923) in (match ((Elab_dTypes.v_ecTriedAt dtb_u_u923) dtb_u_u917) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u926) -> (if (dtb_u_u926 = dtb_u_u925) then (let dtb_u_u927 = (((v_resolveDictGoalsFuel (dtb_u_u910 - 1)) dtb_u_u911) dtb_u_u923) in ((Elab_dTypes.v_ecPushPending dtb_u_u927) dtb_u_u915)) else (let dtb_u_u928 = ((Elab_dTypes.v_forceVal dtb_u_u923) dtb_u_u920) in (let dtb_u_u929 = { Elab_dTypes.f_Constraint_conId = dtb_u_u917; Elab_dTypes.f_Constraint_conKind = dtb_u_u918; Elab_dTypes.f_Constraint_conMeta = dtb_u_u919; Elab_dTypes.f_Constraint_conDom = (if ((v_isMemberDomain dtb_u_u923) dtb_u_u920) then dtb_u_u920 else dtb_u_u928); Elab_dTypes.f_Constraint_conSpan = dtb_u_u921; Elab_dTypes.f_Constraint_conDepth = dtb_u_u922 } in (let dtb_u_u930 = (Elab_dTypes.v_ecSolsCountOf dtb_u_u923) in (match ((((v_tryResolveDictGoal dtb_u_u911) dtb_u_u923) dtb_u_u915) dtb_u_u928) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u931) -> (((v_resolveDictGoalsFuel (dtb_u_u910 - 1)) dtb_u_u911) dtb_u_u931)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u932 = (((v_resolveDictGoalsFuel (dtb_u_u910 - 1)) dtb_u_u911) dtb_u_u923) in (let dtb_u_u933 = (((Elab_dTypes.v_ecRecordTried dtb_u_u932) dtb_u_u917) dtb_u_u930) in ((Elab_dTypes.v_ecPushPending dtb_u_u933) dtb_u_u929)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u934 = ((Elab_dTypes.v_forceVal dtb_u_u923) dtb_u_u920) in (let dtb_u_u935 = { Elab_dTypes.f_Constraint_conId = dtb_u_u917; Elab_dTypes.f_Constraint_conKind = dtb_u_u918; Elab_dTypes.f_Constraint_conMeta = dtb_u_u919; Elab_dTypes.f_Constraint_conDom = (if ((v_isMemberDomain dtb_u_u923) dtb_u_u920) then dtb_u_u920 else dtb_u_u934); Elab_dTypes.f_Constraint_conSpan = dtb_u_u921; Elab_dTypes.f_Constraint_conDepth = dtb_u_u922 } in (let dtb_u_u936 = (B_dData_dList.v_length (Elab_dTypes.v_ecSols dtb_u_u923)) in (match ((((v_tryResolveDictGoal dtb_u_u911) dtb_u_u923) dtb_u_u915) dtb_u_u934) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u937) -> (((v_resolveDictGoalsFuel (dtb_u_u910 - 1)) dtb_u_u911) dtb_u_u937)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u938 = (((v_resolveDictGoalsFuel (dtb_u_u910 - 1)) dtb_u_u911) dtb_u_u923) in (let dtb_u_u939 = (((Elab_dTypes.v_ecRecordTried dtb_u_u938) dtb_u_u917) dtb_u_u936) in ((Elab_dTypes.v_ecPushPending dtb_u_u939) dtb_u_u935)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u912
  | _ -> failwith "DT: impossible branch"
))))

# 761 "Vuna/Compiler/Elab/Dict.vuna"
let v_resolveDictGoals = (fun (dtb_u_u940 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u941 : Elab_dTypes.t_Ec) -> (let dtb_u_u942 = (Elab_dTypes.v_ecPendingCount dtb_u_u941) in (if (Elab_dTypes.v_ecDictPassIdle dtb_u_u941) then dtb_u_u941 else (Elab_dTypes.v_ecPutPassMarker (((v_resolveDictGoalsFuel (dtb_u_u942 + 1)) dtb_u_u940) ((Elab_dTypes.v_ecBump dtb_u_u941) ("elab.dict.pending.b" ^ (v_pendingBucket dtb_u_u942))))))))

# 1245 "Vuna/Compiler/Elab/Dict.vuna"
let v_specializeEqTy = (fun (dtb_u_u943 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u944 : Elab_dTypes.t_Ctx) (dtb_u_u945 : string) (dtb_u_u946 : Core_dTerm.t_Term) (dtb_u_u947 : Core_dTerm.t_Term) (dtb_u_u948 : Base_dSource.t_Span) (dtb_u_u949 : Core_dTerm.t_Value) (dtb_u_u950 : Elab_dTypes.t_Ec) -> (match (Elab_dPrelude.v_builtinEqTyName ((Elab_dTypes.v_forceVal dtb_u_u950) dtb_u_u949)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u951) -> ((Base_dCommon.v_bind ((Elab_dPrelude.v_eqRuntimeName (v_methodShortOf dtb_u_u945)) dtb_u_u951)) (fun (dtb_u_u952 : string) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u952)), dtb_u_u946, Core_dTerm.C_Rig_Rig1)), dtb_u_u947, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb_u_u950 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_findEqClass dtb_u_u945) dtb_u_u950) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u953 = (Core_dEval.v_showValue ((Elab_dTypes.v_forceVal dtb_u_u950) dtb_u_u949)) in (((Base_dDiagnostics_dTc.v_tcErr1 dtb_u_u948) (Base_dDiagnostics_dTc.C_TcErr_EqRequiresEvidence (dtb_u_u953))) dtb_u_u953))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u954) -> (let dtb_u_u955 = (if (if (dtb_u_u945 = "==") then true else (dtb_u_u945 = "/=")) then ((v_projectionFor dtb_u_u954) (v_methodShortOf dtb_u_u945)) else dtb_u_u945) in (let dtb_u_u956 = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth dtb_u_u944)) dtb_u_u949) in (let dtb_u_u957 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u954)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u949, B_dData_dList.C_List_Nil)))))) in (if ((v_dictArgUnsolvedMeta dtb_u_u950) dtb_u_u957) then (((((((((v_deferEqDict dtb_u_u943) dtb_u_u944) dtb_u_u955) dtb_u_u956) dtb_u_u946) dtb_u_u947) dtb_u_u948) dtb_u_u957) dtb_u_u950) else (let dtb_u_u958 = (((((v_searchInstanceIn dtb_u_u943) dtb_u_u944) dtb_u_u950) dtb_u_u957) dtb_u_u948) in (match dtb_u_u958 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u959) -> (if ((v_isRigidDictArg dtb_u_u950) dtb_u_u957) then (((((((((v_deferEqDict dtb_u_u943) dtb_u_u944) dtb_u_u955) dtb_u_u956) dtb_u_u946) dtb_u_u947) dtb_u_u948) dtb_u_u957) dtb_u_u950) else (Base_dDiag.C_Check_ErrC (dtb_u_u959)))
  | Base_dDiag.C_Check_OkC (dtb_u_u960) -> (match dtb_u_u960 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u961; B_dData_dPair.f_Pair_second = dtb_u_u962 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u955)), dtb_u_u956, Core_dTerm.C_Rig_Rig0)), dtb_u_u961, Core_dTerm.C_Rig_RigOmega)), dtb_u_u946, Core_dTerm.C_Rig_Rig1)), dtb_u_u947, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb_u_u962 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1329 "Vuna/Compiler/Elab/Dict.vuna"
let v_specializeCmpTy = (fun (dtb_u_u963 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u964 : Elab_dTypes.t_Ctx) (dtb_u_u965 : string) (dtb_u_u966 : Core_dTerm.t_Term) (dtb_u_u967 : Core_dTerm.t_Term) (dtb_u_u968 : Base_dSource.t_Span) (dtb_u_u969 : Core_dTerm.t_Value) (dtb_u_u970 : Elab_dTypes.t_Ec) -> (match (Elab_dPrelude.v_cmpBuiltinTyName ((Elab_dTypes.v_forceVal dtb_u_u970) dtb_u_u969)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u971) -> ((Base_dCommon.v_bind (((v_cmpRuntimeName dtb_u_u968) (v_methodShortOf dtb_u_u965)) dtb_u_u971)) (fun (dtb_u_u972 : string) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u972)), dtb_u_u966, Core_dTerm.C_Rig_Rig1)), dtb_u_u967, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb_u_u970 } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_findOrdClass dtb_u_u965) dtb_u_u970) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u973 = (Core_dEval.v_showValue ((Elab_dTypes.v_forceVal dtb_u_u970) dtb_u_u969)) in ((((Base_dDiagnostics_dTc.v_tcErr2 dtb_u_u968) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor ((v_methodShortOf dtb_u_u965), dtb_u_u973))) (v_methodShortOf dtb_u_u965)) dtb_u_u973))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u974) -> (let dtb_u_u975 = (if (if (if (if (dtb_u_u965 = "<") then true else (dtb_u_u965 = "<=")) then true else (dtb_u_u965 = ">")) then true else (dtb_u_u965 = ">=")) then ((v_projectionFor dtb_u_u974) (v_methodShortOf dtb_u_u965)) else dtb_u_u965) in (let dtb_u_u976 = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth dtb_u_u964)) dtb_u_u969) in (let dtb_u_u977 = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb_u_u974)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u969, B_dData_dList.C_List_Nil)))))) in (if ((v_dictArgUnsolvedMeta dtb_u_u970) dtb_u_u977) then (((((((((v_deferEqDict dtb_u_u963) dtb_u_u964) dtb_u_u975) dtb_u_u976) dtb_u_u966) dtb_u_u967) dtb_u_u968) dtb_u_u977) dtb_u_u970) else (let dtb_u_u978 = (((((v_searchInstanceIn dtb_u_u963) dtb_u_u964) dtb_u_u970) dtb_u_u977) dtb_u_u968) in (match dtb_u_u978 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u979) -> (if ((v_isRigidDictArg dtb_u_u970) dtb_u_u977) then (((((((((v_deferEqDict dtb_u_u963) dtb_u_u964) dtb_u_u975) dtb_u_u976) dtb_u_u966) dtb_u_u967) dtb_u_u968) dtb_u_u977) dtb_u_u970) else (Base_dDiag.C_Check_ErrC (dtb_u_u979)))
  | Base_dDiag.C_Check_OkC (dtb_u_u980) -> (match dtb_u_u980 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u981; B_dData_dPair.f_Pair_second = dtb_u_u982 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (dtb_u_u975)), dtb_u_u976, Core_dTerm.C_Rig_Rig0)), dtb_u_u981, Core_dTerm.C_Rig_RigOmega)), dtb_u_u966, Core_dTerm.C_Rig_Rig1)), dtb_u_u967, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb_u_u982 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1414 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalExhaustedGo = (fun (dtb_u_u983 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u984 : Elab_dTypes.t_Ec) (dtb_u_u985 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match dtb_u_u985 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u986, dtb_u_u987) -> (match dtb_u_u986 with
  | { Elab_dTypes.f_Constraint_conId = dtb_u_u988; Elab_dTypes.f_Constraint_conKind = dtb_u_u989; Elab_dTypes.f_Constraint_conMeta = dtb_u_u990; Elab_dTypes.f_Constraint_conDom = dtb_u_u991; Elab_dTypes.f_Constraint_conSpan = dtb_u_u992; Elab_dTypes.f_Constraint_conDepth = dtb_u_u993 } -> (match ((Core_dTerm.v_metaLookup dtb_u_u990) (Elab_dTypes.v_ecSolTbl dtb_u_u984)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u994) -> (((v_firstUnsolvedDictGoalExhaustedGo dtb_u_u983) dtb_u_u984) dtb_u_u987)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u995 = ((Elab_dTypes.v_forceVal dtb_u_u984) dtb_u_u991) in (if ((v_isLeftoverDictGoal dtb_u_u984) dtb_u_u995) then (let dtb_u_u996 = (match dtb_u_u992 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u999) -> dtb_u_u999
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
) in (match (((((v_searchInstanceIn dtb_u_u983) Elab_dTypes.v_emptyCtx) dtb_u_u984) dtb_u_u995) dtb_u_u996) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u997) -> (if (v_instOutOfFuelDiag dtb_u_u997) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u997)) else B_dData_dMaybe.C_Maybe_Nothing)
  | Base_dDiag.C_Check_OkC (dtb_u_u998) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (((v_firstUnsolvedDictGoalExhaustedGo dtb_u_u983) dtb_u_u984) dtb_u_u987)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1410 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalExhausted = (fun (dtb_u_u1000 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1001 : Elab_dTypes.t_Ec) -> (((v_firstUnsolvedDictGoalExhaustedGo dtb_u_u1000) dtb_u_u1001) (Elab_dTypes.v_ecPendingList dtb_u_u1001)))

# 60 "Vuna/Compiler/Elab/Dict.vuna"
let v_instMatchTerm = (fun (dtb_u_u1002 : t_InstMatch) -> (match dtb_u_u1002 with
  | { f_InstMatch_instMatchInst = dtb_u_u1003; f_InstMatch_instMatchTerm = dtb_u_u1004 } -> dtb_u_u1004
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Dict.vuna"
let v_scanMatches = (fun (dtb_u_u1005 : t_InstScan) -> (match dtb_u_u1005 with
  | { f_InstScan_scanMatches = dtb_u_u1006; f_InstScan_scanEc = dtb_u_u1007; f_InstScan_scanExhausted = dtb_u_u1008 } -> dtb_u_u1006
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Elab/Dict.vuna"
let v_scanEc = (fun (dtb_u_u1009 : t_InstScan) -> (match dtb_u_u1009 with
  | { f_InstScan_scanMatches = dtb_u_u1010; f_InstScan_scanEc = dtb_u_u1011; f_InstScan_scanExhausted = dtb_u_u1012 } -> dtb_u_u1011
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Elab/Dict.vuna"
let v_scanExhausted = (fun (dtb_u_u1013 : t_InstScan) -> (match dtb_u_u1013 with
  | { f_InstScan_scanMatches = dtb_u_u1014; f_InstScan_scanEc = dtb_u_u1015; f_InstScan_scanExhausted = dtb_u_u1016 } -> dtb_u_u1016
  | _ -> failwith "DT: impossible branch"
))

# 1153 "Vuna/Compiler/Elab/Dict.vuna"
let v_boShort = (fun (dtb_u_u1017 : t_BuiltinOp) -> (match dtb_u_u1017 with
  | { f_BuiltinOp_boShort = dtb_u_u1018; f_BuiltinOp_boOp = dtb_u_u1019; f_BuiltinOp_boRuntime = dtb_u_u1020 } -> dtb_u_u1018
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Elab/Dict.vuna"
let v_boOp = (fun (dtb_u_u1021 : t_BuiltinOp) -> (match dtb_u_u1021 with
  | { f_BuiltinOp_boShort = dtb_u_u1022; f_BuiltinOp_boOp = dtb_u_u1023; f_BuiltinOp_boRuntime = dtb_u_u1024 } -> dtb_u_u1023
  | _ -> failwith "DT: impossible branch"
))

# 1155 "Vuna/Compiler/Elab/Dict.vuna"
let v_boRuntime = (fun (dtb_u_u1025 : t_BuiltinOp) -> (match dtb_u_u1025 with
  | { f_BuiltinOp_boShort = dtb_u_u1026; f_BuiltinOp_boOp = dtb_u_u1027; f_BuiltinOp_boRuntime = dtb_u_u1028 } -> dtb_u_u1028
  | _ -> failwith "DT: impossible branch"
))
