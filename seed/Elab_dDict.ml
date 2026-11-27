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
let v_isDictFamily = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> ((B_dData_dList.v_memName g) ((B_dData_dList.v_map (fun (c : Elab_dTypes.t_DtClass) -> (Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName c)))) (Elab_dTypes.v_ecClasses ec))))

# 28 "Vuna/Compiler/Elab/Dict.vuna"
let v_isDictValue = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__0) -> (match dtb__0 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__1, dtb__2) -> ((v_isDictFamily mc0) dtb__1)
  | _ -> false
)
  | _ -> false
))

# 25 "Vuna/Compiler/Elab/Dict.vuna"
let v_isDictDomain = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((v_isDictValue ec) ((Elab_dTypes.v_forceVal ec) dom)))

# 52 "Vuna/Compiler/Elab/Dict.vuna"
let v_instDepthBound = 16

# 108 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_findClass = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (if ((Elab_dTypes.v_dtClassName dtb__3) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__3)) else ((v_findClass mc0) dtb__4))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 113 "Vuna/Compiler/Elab/Dict.vuna"
let v_famOfClass = (fun (ec : Elab_dTypes.t_Ec) (cn : string) -> (match ((v_findClass cn) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__5))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 120 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyViaClassFam = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (match ((v_famOfClass mc0) dtb__6) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (if (dtb__8 = mc1) then true else (((v_anyViaClassFam mc0) mc1) dtb__7))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_anyViaClassFam mc0) mc1) dtb__7)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaAllowsFam = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtData) (fam : string) -> (((v_anyViaClassFam ec) fam) (d).Elab_dTypes.f_DtData_dtDataViaClasses))

# 132 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_applyDataPis = (fun (ec : Elab_dTypes.t_Ec) (n : int) (v : Core_dTerm.t_Value) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just (v)) else (match args with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15) -> ((((v_applyDataPis ec) (n - 1)) ((Core_dEval.v_applyClosure dtb__15) dtb__9)) dtb__10)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 145 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaFieldType = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtData) (c : Elab_dTypes.t_DtCtor) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if ((B_dData_dList.v_length args) <> (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((v_applyDataPis ec) (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (match ((Elab_dTypes.v_forceVal ec) dtb__16) with
  | Core_dTerm.C_Value_VPi (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (B_dData_dMaybe.C_Maybe_Just (dtb__20))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 172 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperShape = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtData) (wargs : Core_dTerm.t_Value B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) (Elab_dRepresentation.v_unboxedFamilySet (Elab_dTypes.v_ecDatas ec))) then (match (Elab_dTypes.v_dtDataCtors d) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> ((((v_viaFieldType ec) d) dtb__22) wargs)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))

# 165 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperData = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (w : string) (wargs : Core_dTerm.t_Value B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData w) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__24) -> (if (((v_viaAllowsFam ec) dtb__24) fam) then (((v_viaWrapperShape ec) dtb__24) wargs) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperOf = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (arg : Core_dTerm.t_Value) -> (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) arg) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VNeutral (dtb__25) -> (match dtb__25 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__26, dtb__27) -> ((((v_viaWrapperData ec) fam) dtb__26) dtb__27)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 182 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyViaWrapper = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (match (((v_viaWrapperOf mc0) mc1) dtb__28) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__30) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_anyViaWrapper mc0) mc1) dtb__29)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaCandidateExists = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__31) -> (match dtb__31 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__32, dtb__33) -> (((v_anyViaWrapper ec) dtb__32) dtb__33)
  | _ -> false
)
  | _ -> false
)))

# 197 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_replaceAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (mc1, dtb__35)) else (B_dData_dList.C_List__x58__x58_ (dtb__34, (((v_replaceAt (mc0 - 1)) mc1) dtb__35))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_specificInstances = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (if (Elab_dMeta.v_isBlanketInst dtb__36) then (v_specificInstances dtb__37) else (B_dData_dList.C_List__x58__x58_ (dtb__36, (v_specificInstances dtb__37))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_blanketInstances = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (if (Elab_dMeta.v_isBlanketInst dtb__38) then (B_dData_dList.C_List__x58__x58_ (dtb__38, (v_blanketInstances dtb__39))) else (v_blanketInstances dtb__39))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Elab/Dict.vuna"
let v_showResolvedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (Core_dTerm.v_showTerm (((Elab_dMeta.v_zonkTerm ec) 0) ((Core_dEval.v_quote 0) ((Elab_dTypes.v_forceVal ec) v)))))

# 273 "Vuna/Compiler/Elab/Dict.vuna"
let v_exhaustedInstance = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let sd = ((v_showResolvedValue ec) dom) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_InstanceSearchExhausted (sd))) sd)))

# 316 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_localDictLookupGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__40 with
  | { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = dtb__43 } -> (let v = ((Elab_dTypes.v_forceVal mc3) (((Elab_dTypes.v_varTypeValue mc0) mc1) dtb__43)) in (if ((v_isDictValue mc3) v) then (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl mc3)) (Elab_dTypes.v_ecSolsP mc3)) (Elab_dTypes.v_ctxDepth mc0)) v) mc2) with
  | Base_dDiag.C_Check_OkC (dtb__44) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__42, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutSols mc3) (Core_dTerm.v_solsList dtb__44)) }))
  | Base_dDiag.C_Check_ErrC (dtb__45) -> (((((v_localDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__41)
  | _ -> failwith "DT: impossible branch"
) else (((((v_localDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__41)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Elab/Dict.vuna"
let v_localDictLookupExact = (fun (ctx : Elab_dTypes.t_Ctx) (i : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (match (ctx).Elab_dTypes.f_Ctx_ctxItems with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (((((v_localDictLookupGo ctx) i) dom) ec) (ctx).Elab_dTypes.f_Ctx_ctxItems)
))

# 307 "Vuna/Compiler/Elab/Dict.vuna"
let v_localDictLookup = (fun (ctx : Elab_dTypes.t_Ctx) (i : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> ((((v_localDictLookupExact ctx) i) dom) ec))

# 336 "Vuna/Compiler/Elab/Dict.vuna"
let v_valueDictFamily = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__46) -> (match dtb__46 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__47, dtb__48) -> dtb__47
  | _ -> ""
)
  | _ -> ""
))

# 228 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchCandidates = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let fam = (v_valueDictFamily ((Elab_dTypes.v_forceVal ec) dom)) in (if (fam = "") then (Elab_dTypes.v_ecInstList ec) else ((Elab_dTypes.v_ecInstsFamily ec) fam))))

# 365 "Vuna/Compiler/Elab/Dict.vuna"
let v_termTypeNameOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__49) -> dtb__49
  | _ -> ""
))

# 359 "Vuna/Compiler/Elab/Dict.vuna"
let v_instHeadArgTypeName = (fun (i : Elab_dTypes.t_DtInst) -> (let nd_uscrut1 = (Elab_dTypes.v_flattenTaggedApp (i).Elab_dTypes.f_DtInst_dtInstHead) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (match dtb__50 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (match dtb__52 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (v_termTypeNameOf (B_dData_dPair.v_firstOf dtb__53))
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ""
)))

# 351 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_hasSpecificInterpInstanceGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (if (if (B_dData_dBool.v_not (Elab_dMeta.v_isBlanketInst dtb__55)) then ((v_instHeadArgTypeName dtb__55) = mc0) else false) then true else ((v_hasSpecificInterpInstanceGo mc0) dtb__56))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Elab/Dict.vuna"
let v_hasSpecificInterpInstance = (fun (ec : Elab_dTypes.t_Ec) (tyName : string) -> ((v_hasSpecificInterpInstanceGo tyName) ((Elab_dTypes.v_ecInstsFamily ec) (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName))))

# 369 "Vuna/Compiler/Elab/Dict.vuna"
let v_isMonoInst = (fun (i : Elab_dTypes.t_DtInst) -> (match (i).Elab_dTypes.f_DtInst_dtInstTele with
  | B_dData_dList.C_List_Nil -> (match (i).Elab_dTypes.f_DtInst_dtInstCtx with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
))

# 379 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_allInstancesMono = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if (v_isMonoInst dtb__57) then (v_allInstancesMono dtb__58) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Elab/Dict.vuna"
let v_allocMetaAt = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (((Elab_dMetaSpans.v_newMetaAt dtb__59) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_newMeta mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 468 "Vuna/Compiler/Elab/Dict.vuna"
let v_termMetaId = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TMeta (dtb__60) -> dtb__60
  | _ -> 0
))

# 456 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_allocTeleMetas = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match (((v_allocMetaAt mc0) mc1) mc2) with
  | { B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = dtb__64 } -> (match ((((v_allocTeleMetas mc0) mc1) dtb__64) dtb__62) with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_termMetaId dtb__63), dtb__65)); B_dData_dPair.f_Pair_second = dtb__66 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 472 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_solveTeleMetas = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match ((Core_dTerm.v_metaLookup dtb__67) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (match ((v_solveTeleMetas mc0) dtb__68) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 498 "Vuna/Compiler/Elab/Dict.vuna"
let v_instOutOfFuelDiag = (fun (d : Base_dDiag.t_Diagnostic) -> ((d).Base_dDiag.f_Diagnostic_diagCode = (Base_dDiagnostics_dTc.v_tcCode (Base_dDiagnostics_dTc.C_TcErr_InstanceSearchExhausted ("")))))

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
let v_isMemberDomain = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__71) -> (match dtb__71 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__72, dtb__73) -> (if (dtb__72 = v_memberDomName) then (let nd_uscrut5 = dtb__73 in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__75 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
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
let v_memberSpine = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__78) -> (match dtb__78 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__79, dtb__80) -> (if (dtb__79 = v_memberDomName) then (let nd_uscrut4 = dtb__80 in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (match dtb__82 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__83 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 565 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctorValue = (fun (ec : Elab_dTypes.t_Ec) (name : string) (vals : Core_dTerm.t_Value B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> (Core_dTerm.C_Value_VCon ((Elab_dTypes.v_dtCtorName dtb__85), vals))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VCon (name, vals))
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberProbe = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match ((((Elab_dMeta.v_convEc ec) depth) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__86) -> true
  | Base_dDiag.C_Check_ErrC (dtb__87) -> false
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__88) -> dtb__88
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 598 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandName = (fun (mc0 : t_LabelCand) -> (match mc0 with
  | C_LabelCand_MkLabelCand (dtb__89, dtb__90) -> dtb__89
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandIdx = (fun (mc0 : t_LabelCand) -> (match mc0 with
  | C_LabelCand_MkLabelCand (dtb__91, dtb__92) -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

# 605 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__93) -> (match dtb__93 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__94, dtb__95) -> (if (dtb__94 = Base_dIntrinsics.v_effNamedName) then (match dtb__95 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> ((v_memberNameText ec) dtb__96)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
) else ((Core_dEval.v_showValueAt 6) v))
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 617 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_labelScan = (fun (fuel : int) (depth : int) (sols : Core_dTerm.t_Sols) (ec : Elab_dTypes.t_Ec) (eF : Core_dTerm.t_Value) (rF : Core_dTerm.t_Value) (idx : int) (acc : t_LabelCand B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) rF) with
  | Core_dTerm.C_Value_VCon (dtb__98, dtb__99) -> (if (dtb__98 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = true })) else (if (dtb__98 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut10 = dtb__99 in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__101 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue sols) dtb__100) then B_dData_dMaybe.C_Maybe_Nothing else (let matched = ((((v_memberProbe ec) depth) eF) dtb__100) in (let acc2 = (if matched then (B_dData_dList.C_List__x58__x58_ ((C_LabelCand_MkLabelCand (((v_labelCandText ec) dtb__100), idx)), acc)) else acc) in ((((((((v_labelScan (fuel - 1)) depth) sols) ec) eF) dtb__102) (idx + 1)) acc2))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | Core_dTerm.C_Value_VNeutral (dtb__104) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = false }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 642 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_memberProofAtLabel = (fun (fuel : int) (depth : int) (ec : Elab_dTypes.t_Ec) (eF : Core_dTerm.t_Value) (rF : Core_dTerm.t_Value) (target : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "member proof") else (match ((Elab_dTypes.v_forceVal ec) rF) with
  | Core_dTerm.C_Value_VCon (dtb__105, dtb__106) -> (if (dtb__105 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut8 = dtb__106 in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__108 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if (target <= 0) then ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc ec) depth) eF) dtb__107)) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_ctorValue ec1) v_hereCtorName) (B_dData_dList.C_List__x58__x58_ (eF, (B_dData_dList.C_List__x58__x58_ (dtb__109, B_dData_dList.C_List_Nil))))); B_dData_dPair.f_Pair_second = ec1 })))) else ((Base_dCommon.v_bind ((((((v_memberProofAtLabel (fuel - 1)) depth) ec) eF) dtb__109) (target - 1))) (fun (p : (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_ctorValue (B_dData_dPair.v_secondOf p)) v_thereCtorName) (B_dData_dList.C_List__x58__x58_ (eF, (B_dData_dList.C_List__x58__x58_ (dtb__107, (B_dData_dList.C_List__x58__x58_ (dtb__109, (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf p), B_dData_dList.C_List_Nil))))))))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))
  | _ -> (Base_dDiag.v_icInternal "malformed row in member proof")
)
  | _ -> (Base_dDiag.v_icInternal "malformed row in member proof")
)) else (Base_dDiag.v_icInternal "member proof target out of range"))
  | _ -> (Base_dDiag.v_icInternal "member proof target out of range")
)))

# 657 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberLookupRowLabel = (fun (fuel : int) (depth : int) (ec : Elab_dTypes.t_Ec) (eVal : Core_dTerm.t_Value) (rVal : Core_dTerm.t_Value) -> (if (fuel <= 0) then C_MemberLookup_MemberStuck else (let eF = ((Elab_dTypes.v_forceVal ec) eVal) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let nd_uscrut7 = ((((((((v_labelScan 64) depth) sols) ec) eF) rVal) 0) B_dData_dList.C_List_Nil) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (match dtb__112 with
  | B_dData_dList.C_List_Nil -> (if dtb__113 then C_MemberLookup_MemberAbsent else C_MemberLookup_MemberStuck)
  | B_dData_dList.C_List__x58__x58_ (dtb__114, dtb__115) -> (match dtb__115 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut18 = ((((((v_memberProofAtLabel (fuel - 1)) depth) ec) eF) rVal) (v_labelCandIdx dtb__114)) in (match nd_uscrut18 with
  | Base_dDiag.C_Check_ErrC (dtb__116) -> C_MemberLookup_MemberStuck
  | Base_dDiag.C_Check_OkC (dtb__117) -> (match dtb__117 with
  | { B_dData_dPair.f_Pair_first = dtb__118; B_dData_dPair.f_Pair_second = dtb__119 } -> (C_MemberLookup_MemberFound (dtb__118, dtb__119))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (if ((Core_dTerm.v_hasUnsolvedMetaValue sols) eF) then (C_MemberLookup_MemberAmbiguous (((B_dData_dList.v_map v_labelCandName) dtb__112))) else (let nd_uscrut17 = ((((((v_memberProofAtLabel (fuel - 1)) depth) ec) eF) rVal) (v_labelCandIdx dtb__114)) in (match nd_uscrut17 with
  | Base_dDiag.C_Check_ErrC (dtb__120) -> C_MemberLookup_MemberStuck
  | Base_dDiag.C_Check_OkC (dtb__121) -> (match dtb__121 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> (C_MemberLookup_MemberFound (dtb__122, dtb__123))
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
let v_memberLookup = (fun (fuel : int) (depth : int) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then C_MemberLookup_MemberStuck else (let nd_uscrut4 = (v_memberSpine dom) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> (match dtb__124 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (((((v_memberLookupRowLabel fuel) depth) ec) dtb__125) dtb__126)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_MemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
))))

# 690 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_ctxMemberProofUnifyGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__127, dtb__128) -> (match dtb__127 with
  | { B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = dtb__130 } -> (let olderDepth = (B_dData_dList.v_length dtb__128) in (let tyVal = ((Core_dEval.v_eval ((B_dData_dList.v_map ((Elab_dTypes.v_refineValue (mc0).Elab_dTypes.f_Ctx_ctxRefVals) Core_dTerm.v_defaultFuel)) (((Elab_dTypes.v_ctxEnvAt dtb__128) 0) olderDepth))) dtb__130) in (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc0)) tyVal) mc4) with
  | Base_dDiag.C_Check_OkC (dtb__131) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__129, mc2, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__131 }))
  | Base_dDiag.C_Check_ErrC (dtb__132) -> (((((v_ctxMemberProofUnifyGo mc0) dtb__128) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 687 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctxMemberProofUnify = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (((((v_ctxMemberProofUnifyGo ctx) (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ec) dom))

# 703 "Vuna/Compiler/Elab/Dict.vuna"
let v_solveRowMeta = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (m : int) (v : Core_dTerm.t_Value) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) m) B_dData_dList.C_List_Nil) v) with
  | Base_dDiag.C_Check_OkC (dtb__133) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__133))))
  | Base_dDiag.C_Check_ErrC (dtb__134) -> (Base_dDiag.C_Check_ErrC (dtb__134))
  | _ -> failwith "DT: impossible branch"
))

# 773 "Vuna/Compiler/Elab/Dict.vuna"
let v_pendingBucket = (fun (n : int) -> (if (n <= 0) then "0" else (if (n <= 4) then "1-4" else (if (n <= 16) then "5-16" else (if (n <= 64) then "17-64" else "65+")))))

# 972 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_piRigsOfInstGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (if ((Elab_dTypes.v_dtInstSym dtb__135) = mc0) then (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> Core_dTerm.C_Rig_Rig0)) (dtb__135).Elab_dTypes.f_DtInst_dtInstTele)) ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> Core_dTerm.C_Rig_RigOmega)) (dtb__135).Elab_dTypes.f_DtInst_dtInstCtx)))) else ((v_piRigsOfInstGo mc0) dtb__136))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Elab/Dict.vuna"
let v_piRigsOfInst = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> ((v_piRigsOfInstGo g) (Elab_dTypes.v_ecInstList ec)))

# 989 "Vuna/Compiler/Elab/Dict.vuna"
let[@tail_mod_cons] rec v_piRigs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> (B_dData_dList.C_List__x58__x58_ (dtb__139, (v_piRigs dtb__141)))
  | _ -> B_dData_dList.C_List_Nil
))

# 980 "Vuna/Compiler/Elab/Dict.vuna"
let v_piRigsOfGlobal = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> (match ((v_piRigsOfInst ec) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> dtb__142
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (Elab_dTypes.v_ecGlobalsTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (v_piRigs dtb__143)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 930 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_renderDictTermAt = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (task : t_DictTermTask) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = task in (match nd_uscrut4 with
  | C_DictTermTask_DictTermSpine (dtb__144, dtb__145, dtb__146) -> (match dtb__145 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (let argTerm = (match ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermValue (dtb__147))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> dtb__153
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Core_dEval.v_quote depth) dtb__147)
  | _ -> failwith "DT: impossible branch"
) in (let r = (match dtb__146 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> dtb__151
  | B_dData_dList.C_List_Nil -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
) in (let restRigs = (match dtb__146 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> dtb__150
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TApp (dtb__144, argTerm, r)), dtb__148, restRigs))))))
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__144))
  | _ -> failwith "DT: impossible branch"
)
  | C_DictTermTask_DictTermValue (dtb__154) -> (match dtb__154 with
  | Core_dTerm.C_Value_VNeutral (dtb__155) -> (match dtb__155 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__156, dtb__157) -> ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TGlobal (dtb__156)), dtb__157, ((v_piRigsOfGlobal ec) dtb__156))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> (match ((Elab_dTypes.v_forceVal ec) dtb__154) with
  | Core_dTerm.C_Value_VNeutral (dtb__158) -> (match dtb__158 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__159, dtb__160) -> ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TGlobal (dtb__159)), dtb__160, ((v_piRigsOfGlobal ec) dtb__159))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
))))

# 927 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictTermOfValueAt = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (v : Core_dTerm.t_Value) -> ((((v_renderDictTermAt 64) ec) depth) (C_DictTermTask_DictTermValue (v))))

# 869 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_substDictTermGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TIf (dtb__161, dtb__162, dtb__163) -> (Core_dTerm.C_Term_TIf ((((v_substDictTermGo mc0) mc1) dtb__161), (((v_substDictTermGo mc0) mc1) dtb__162), (((v_substDictTermGo mc0) mc1) dtb__163)))
  | Core_dTerm.C_Term_TCase (dtb__164, dtb__165) -> (Core_dTerm.C_Term_TCase ((((v_substDictTermGo mc0) mc1) dtb__164), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> (((v_substDictTermAlt mc0) mc1) alt))) dtb__165)))
  | Core_dTerm.C_Term_TRecord (dtb__166, dtb__167) -> (Core_dTerm.C_Term_TRecord (dtb__166, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo mc0) mc1) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__167)))
  | Core_dTerm.C_Term_TMk (dtb__168, dtb__169) -> (Core_dTerm.C_Term_TMk (dtb__168, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo mc0) mc1) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__169)))
  | Core_dTerm.C_Term_TCon (dtb__170, dtb__171) -> (Core_dTerm.C_Term_TCon (dtb__170, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo mc0) mc1) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__171)))
  | Core_dTerm.C_Term_TApp (dtb__172, dtb__173, dtb__174) -> (Core_dTerm.C_Term_TApp ((((v_substDictTermGo mc0) mc1) dtb__172), (((v_substDictTermGo mc0) mc1) dtb__173), dtb__174))
  | Core_dTerm.C_Term_TLam (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179) -> (let slot2 = (let nd_uscrut8 = dtb__177 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__180) -> (match dtb__180 with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> (match dtb__182 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (let bt2 = (match dtb__183 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substDictTermGo mc0) mc1) dtb__186)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__184 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__185) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substDictTermGo mc0) (mc1 + 1)) dtb__185)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__175, dtb__176, slot2, dtb__178, (((v_substDictTermGo mc0) (mc1 + 1)) dtb__179))))
  | Core_dTerm.C_Term_TPi (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> (Core_dTerm.C_Term_TPi (dtb__187, dtb__188, dtb__189, (((v_substDictTermGo mc0) mc1) dtb__190), (((v_substDictTermGo mc0) (mc1 + 1)) dtb__191)))
  | Core_dTerm.C_Term_TMeta (dtb__192) -> (match ((Core_dTerm.v_metaLookup dtb__192) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> mc2
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (match (((v_dictTermOfValueAt mc0) mc1) dtb__193) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (if (if ((Core_dTerm.v_hasFreeTermVar mc1) dtb__194) then true else (Core_dTerm.v_hasNegativeVar dtb__194)) then mc2 else dtb__194)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let soln0 = ((Core_dEval.v_quote mc1) dtb__193) in (if (if ((Core_dTerm.v_hasFreeTermVar mc1) soln0) then true else (Core_dTerm.v_hasNegativeVar soln0)) then mc2 else soln0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
# 914 "Vuna/Compiler/Elab/Dict.vuna"
and v_substDictTermAlt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_CaseAlt) -> (match mc2 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__195; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__196; Core_dTerm.f_CaseAlt_caseAltBody = dtb__197 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__195; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__196; Core_dTerm.f_CaseAlt_caseAltBody = (((v_substDictTermGo mc0) (mc1 + (B_dData_dList.v_length dtb__196))) dtb__197) }
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Elab/Dict.vuna"
let v_substDictTerm = (fun (ec : Elab_dTypes.t_Ec) (t : Core_dTerm.t_Term) -> (((v_substDictTermGo ec) 0) t))

# 997 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_joinRestInstNames = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (String.concat "" [", "; (Elab_dTypes.v_dtInstName dtb__198); (v_joinRestInstNames dtb__199)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 993 "Vuna/Compiler/Elab/Dict.vuna"
let v_joinInstNames = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> ((Elab_dTypes.v_dtInstName dtb__200) ^ (v_joinRestInstNames dtb__201))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_ctorParamKindsFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) (lvl : int) (acc : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.v_reverse acc) else (match v with
  | Core_dTerm.C_Value_VPi (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> (if dtb__203 then (((((v_ctorParamKindsFuel (fuel - 1)) ec) ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_applyClosure dtb__206) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__202, lvl, B_dData_dList.C_List_Nil))))))) (lvl + 1)) (B_dData_dList.C_List__x58__x58_ (dtb__205, acc))) else (B_dData_dList.v_reverse acc))
  | _ -> (B_dData_dList.v_reverse acc)
)))

# 1016 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctorParamKinds = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) (lvl : int) (acc : Core_dTerm.t_Value B_dData_dList.t_List) -> (((((v_ctorParamKindsFuel 64) ec) v) lvl) acc))

# 1035 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictFamilyNameOf = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__207) -> (match dtb__207 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__208, dtb__209) -> (B_dData_dMaybe.C_Maybe_Just (dtb__208))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1003 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgKinds = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (match ((v_dictFamilyNameOf ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__210) -> (match ((Elab_dMeta.v_dtDataLookup dtb__210) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__211) -> (match (Elab_dTypes.v_dtDataCtors dtb__211) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (B_dData_dMaybe.C_Maybe_Just (((((v_ctorParamKinds ec) ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__212)))) 0) B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1029 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgKind = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_dictArgKinds ec) dom) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__214) -> (match dtb__214 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (B_dData_dMaybe.C_Maybe_Just (dtb__215))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 1056 "Vuna/Compiler/Elab/Dict.vuna"
let v_neutralHeadOrSelf = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__217) -> (match dtb__217 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__218, dtb__219) -> (match dtb__219 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__218, B_dData_dList.C_List_Nil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 1043 "Vuna/Compiler/Elab/Dict.vuna"
let v_argHeadMatchesKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (forced : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) -> (let nd_uscrut5 = (v_neutralHeadOrSelf forced) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__222) -> (match dtb__222 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__223, dtb__224) -> (match dtb__224 with
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMeta.v_typeHeadLookup globals) ec) dtb__223) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (match ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) argKind) ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__225))) with
  | Base_dDiag.C_Check_OkC (dtb__226) -> true
  | Base_dDiag.C_Check_ErrC (dtb__227) -> false
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
let v_dictClassArgs = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__228) -> (match dtb__228 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__229, dtb__230) -> dtb__230
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 1068 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictClassArg = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (match ((v_dictClassArgs ec) dom) with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> (B_dData_dMaybe.C_Maybe_Just (dtb__231))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Elab/Dict.vuna"
let v_missingInstance = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let forced = ((Elab_dTypes.v_forceVal ec) dom) in (let sd = (Core_dEval.v_showValue forced) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then (let td = (match ((v_dictClassArg ec) forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__233) -> ((v_showResolvedValue ec) dtb__233)
  | B_dData_dMaybe.C_Maybe_Nothing -> sd
  | _ -> failwith "DT: impossible branch"
) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (td))) td)) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (sd))) sd)))))

# 289 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedInterpGoalGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (match dtb__234 with
  | { Elab_dTypes.f_Constraint_conId = dtb__236; Elab_dTypes.f_Constraint_conKind = dtb__237; Elab_dTypes.f_Constraint_conMeta = dtb__238; Elab_dTypes.f_Constraint_conDom = dtb__239; Elab_dTypes.f_Constraint_conSpan = dtb__240; Elab_dTypes.f_Constraint_conDepth = dtb__241 } -> (match ((Core_dTerm.v_metaLookup dtb__238) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__242) -> ((v_firstUnsolvedInterpGoalGo mc0) dtb__235)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__239) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then (B_dData_dMaybe.C_Maybe_Just ((match ((v_dictClassArg mc0) forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> ((v_showResolvedValue mc0) dtb__243)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_showResolvedValue mc0) forced)
  | _ -> failwith "DT: impossible branch"
))) else ((v_firstUnsolvedInterpGoalGo mc0) dtb__235)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedInterpGoal = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedInterpGoalGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1089 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_valueHasRigidNVar = (fun (ec : Elab_dTypes.t_Ec) (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then false else (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VNeutral (dtb__244) -> (match dtb__244 with
  | Core_dTerm.C_Neutral_NVar (dtb__245, dtb__246, dtb__247) -> true
  | Core_dTerm.C_Neutral_NGlobal (dtb__248, dtb__249) -> (((v_anyValueHasRigidNVar ec) (fuel - 1)) dtb__249)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VCon (dtb__250, dtb__251) -> (((v_anyValueHasRigidNVar ec) (fuel - 1)) dtb__251)
  | Core_dTerm.C_Value_VApp (dtb__252, dtb__253) -> (if (((v_valueHasRigidNVar ec) (fuel - 1)) dtb__252) then true else (((v_valueHasRigidNVar ec) (fuel - 1)) dtb__253))
  | Core_dTerm.C_Value_VCase (dtb__254, dtb__255) -> (((v_valueHasRigidNVar ec) (fuel - 1)) dtb__254)
  | Core_dTerm.C_Value_VIf (dtb__256, dtb__257, dtb__258) -> (if (if (((v_valueHasRigidNVar ec) (fuel - 1)) dtb__256) then true else (((v_valueHasRigidNVar ec) (fuel - 1)) dtb__257)) then true else (((v_valueHasRigidNVar ec) (fuel - 1)) dtb__258))
  | _ -> false
)))
# 1105 "Vuna/Compiler/Elab/Dict.vuna"
and v_anyValueHasRigidNVar = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if (((v_valueHasRigidNVar mc0) mc1) dtb__259) then true else (((v_anyValueHasRigidNVar mc0) mc1) dtb__260))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1086 "Vuna/Compiler/Elab/Dict.vuna"
let v_isRigidClassArg = (fun (ec : Elab_dTypes.t_Ec) (arg : Core_dTerm.t_Value) -> (((v_valueHasRigidNVar ec) 64) arg))

# 1081 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyRigidClassArg = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (if ((v_isRigidClassArg mc0) dtb__261) then true else ((v_anyRigidClassArg mc0) dtb__262))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1078 "Vuna/Compiler/Elab/Dict.vuna"
let v_isRigidDictArg = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((v_anyRigidClassArg ec) ((v_dictClassArgs ec) dom)))

# 332 "Vuna/Compiler/Elab/Dict.vuna"
let v_rigidSearchFast = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isRigidDictArg ec) dom) then (v_allInstancesMono ((v_searchCandidates ec) dom)) else false))

# 1111 "Vuna/Compiler/Elab/Dict.vuna"
let v_eqClassName = "Base.Trait.Eq.Eq"

# 1114 "Vuna/Compiler/Elab/Dict.vuna"
let v_ordClassName = "Base.Trait.Ord.Ord"

# 1117 "Vuna/Compiler/Elab/Dict.vuna"
let v_numClassName = "Base.Trait.Num.Num"

# 1123 "Vuna/Compiler/Elab/Dict.vuna"
let v_classHasProjection = (fun (fullClassName : string) (short : string) (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((v_findClass fullClassName) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> (((Elab_dPrelude.v_classMethodProjection (dtb__263).Elab_dTypes.f_DtClass_dtClassMethods) short) = name)
  | _ -> failwith "DT: impossible branch"
))

# 1131 "Vuna/Compiler/Elab/Dict.vuna"
let v_findEqClass = (fun (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((Elab_dMeta.v_findClassByMethod name) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (B_dData_dMaybe.C_Maybe_Just (dtb__264))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findClass v_eqClassName) (Elab_dTypes.v_ecClasses ec))
  | _ -> failwith "DT: impossible branch"
))

# 1137 "Vuna/Compiler/Elab/Dict.vuna"
let v_findOrdClass = (fun (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((Elab_dMeta.v_findClassByMethod name) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__265) -> (B_dData_dMaybe.C_Maybe_Just (dtb__265))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findClass v_ordClassName) (Elab_dTypes.v_ecClasses ec))
  | _ -> failwith "DT: impossible branch"
))

# 1144 "Vuna/Compiler/Elab/Dict.vuna"
let v_methodShortOf = (fun (name : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 1158 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpShort = (fun (mc0 : t_BuiltinOp) -> (match mc0 with
  | { f_BuiltinOp_boShort = dtb__266; f_BuiltinOp_boOp = dtb__267; f_BuiltinOp_boRuntime = dtb__268 } -> dtb__266
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpName = (fun (mc0 : t_BuiltinOp) -> (match mc0 with
  | { f_BuiltinOp_boShort = dtb__269; f_BuiltinOp_boOp = dtb__270; f_BuiltinOp_boRuntime = dtb__271 } -> dtb__270
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpRuntime = (fun (mc0 : t_BuiltinOp) -> (match mc0 with
  | { f_BuiltinOp_boShort = dtb__272; f_BuiltinOp_boOp = dtb__273; f_BuiltinOp_boRuntime = dtb__274 } -> dtb__274
  | _ -> failwith "DT: impossible branch"
))

# 1167 "Vuna/Compiler/Elab/Dict.vuna"
let v_eqMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "=="; f_BuiltinOp_boOp = "=="; f_BuiltinOp_boRuntime = "eq" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "/="; f_BuiltinOp_boOp = "/="; f_BuiltinOp_boRuntime = "neq" }, B_dData_dList.C_List_Nil))))

# 1170 "Vuna/Compiler/Elab/Dict.vuna"
let v_ordMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "<"; f_BuiltinOp_boOp = "<"; f_BuiltinOp_boRuntime = "lt" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "<="; f_BuiltinOp_boOp = "<="; f_BuiltinOp_boRuntime = "le" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = ">"; f_BuiltinOp_boOp = ">"; f_BuiltinOp_boRuntime = "gt" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = ">="; f_BuiltinOp_boOp = ">="; f_BuiltinOp_boRuntime = "ge" }, B_dData_dList.C_List_Nil))))))))

# 1179 "Vuna/Compiler/Elab/Dict.vuna"
let v_numMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "+"; f_BuiltinOp_boOp = "+"; f_BuiltinOp_boRuntime = "add" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "-"; f_BuiltinOp_boOp = "-"; f_BuiltinOp_boRuntime = "sub" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "*"; f_BuiltinOp_boOp = "*"; f_BuiltinOp_boRuntime = "mul" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "/"; f_BuiltinOp_boOp = "/"; f_BuiltinOp_boRuntime = "div" }, B_dData_dList.C_List_Nil))))))))

# 1197 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_lookupBuiltinOpShort = (fun (mc0 : string) (mc1 : t_BuiltinOp B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (if ((v_builtinOpShort dtb__275) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__275)) else ((v_lookupBuiltinOpShort mc0) dtb__276))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1202 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_lookupBuiltinOpProjection = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string) (mc3 : t_BuiltinOp B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (if ((((v_classHasProjection mc1) (v_builtinOpShort dtb__277)) mc2) mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__277)) else ((((v_lookupBuiltinOpProjection mc0) mc1) mc2) dtb__278))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1191 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpOf = (fun (ec : Elab_dTypes.t_Ec) (className : string) (name : string) (ops : t_BuiltinOp B_dData_dList.t_List) -> (match ((v_lookupBuiltinOpShort (v_methodShortOf name)) ops) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> (B_dData_dMaybe.C_Maybe_Just (dtb__279))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lookupBuiltinOpProjection ec) className) name) ops)
  | _ -> failwith "DT: impossible branch"
))

# 1212 "Vuna/Compiler/Elab/Dict.vuna"
let v_isEqMethod = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((v_builtinOpOf ec) v_eqClassName) name) v_eqMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__280) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1218 "Vuna/Compiler/Elab/Dict.vuna"
let v_isCmpMethod = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((v_builtinOpOf ec) v_ordClassName) name) v_ordMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__281) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1225 "Vuna/Compiler/Elab/Dict.vuna"
let v_numMethodOpName = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((v_builtinOpOf ec) v_numClassName) name) v_numMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__282) -> (B_dData_dMaybe.C_Maybe_Just ((v_builtinOpName dtb__282)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1232 "Vuna/Compiler/Elab/Dict.vuna"
let v_projectionFor = (fun (cls : Elab_dTypes.t_DtClass) (short : string) -> ((Elab_dPrelude.v_classMethodProjection (cls).Elab_dTypes.f_DtClass_dtClassMethods) short))

# 1275 "Vuna/Compiler/Elab/Dict.vuna"
let v_deferEqDict = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (mname : string) (tyTerm : Core_dTerm.t_Term) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (dictTy : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__283; B_dData_dPair.f_Pair_second = dtb__284 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__283, Core_dTerm.C_Rig_RigOmega)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__284) Elab_dTypes.C_ConstraintKind_CkDict) m) dictTy) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) } }))))
  | _ -> failwith "DT: impossible branch"
)))

# 1294 "Vuna/Compiler/Elab/Dict.vuna"
let v_cmpTypeTag = (fun (mc0 : string) -> (if (mc0 = "Int") then (B_dData_dMaybe.C_Maybe_Just ("int")) else (if (mc0 = "String") then (B_dData_dMaybe.C_Maybe_Just ("str")) else (if (mc0 = "Float") then (B_dData_dMaybe.C_Maybe_Just ("float")) else (if (Base_dIntrinsics.v_isBoolCanonical mc0) then (B_dData_dMaybe.C_Maybe_Just ("bool")) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 1301 "Vuna/Compiler/Elab/Dict.vuna"
let v_cmpRuntimeName = (fun (sp : Base_dSource.t_Span) (method_ : string) (tyName : string) -> (match ((v_lookupBuiltinOpShort (v_methodShortOf method_)) v_ordMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__285) -> (match (v_cmpTypeTag tyName) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__286) -> (Base_dDiag.C_Check_OkC ((String.concat "" ["bi_"; (v_builtinOpRuntime dtb__285); "_"; dtb__286])))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor (method_, tyName))) method_) tyName)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor (method_, tyName))) method_) tyName)
  | _ -> failwith "DT: impossible branch"
))

# 1320 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyUnsolvedMetaArg = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP mc0)) ((Elab_dTypes.v_forceVal mc0) dtb__287)) then true else ((v_anyUnsolvedMetaArg mc0) dtb__288))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1314 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgUnsolvedMeta = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((v_anyUnsolvedMetaArg ec) ((v_dictClassArgs ec) dom)))

# 1358 "Vuna/Compiler/Elab/Dict.vuna"
let v_boolShortCircuit = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (if (name = "&&") then (Core_dTerm.C_Term_TIf (a, b, (Core_dTerm.C_Term_TBool (false)))) else (Core_dTerm.C_Term_TIf (a, (Core_dTerm.C_Term_TBool (true)), b))))

# 1365 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedMemberGoalGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> (match dtb__289 with
  | { Elab_dTypes.f_Constraint_conId = dtb__291; Elab_dTypes.f_Constraint_conKind = dtb__292; Elab_dTypes.f_Constraint_conMeta = dtb__293; Elab_dTypes.f_Constraint_conDom = dtb__294; Elab_dTypes.f_Constraint_conSpan = dtb__295; Elab_dTypes.f_Constraint_conDepth = dtb__296 } -> (if ((v_isMemberDomain mc0) dtb__294) then (match ((Core_dTerm.v_metaLookup dtb__293) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ((Core_dEval.v_showValue ((Elab_dTypes.v_forceVal mc0) dtb__294))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> ((v_firstUnsolvedMemberGoalGo mc0) dtb__290)
  | _ -> failwith "DT: impossible branch"
) else ((v_firstUnsolvedMemberGoalGo mc0) dtb__290))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1362 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedMemberGoal = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedMemberGoalGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1384 "Vuna/Compiler/Elab/Dict.vuna"
let v_isLeftoverDictGoal = (fun (ec : Elab_dTypes.t_Ec) (forced : Core_dTerm.t_Value) -> (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then false else (if ((v_isMemberDomain ec) forced) then false else (if ((v_anyUnsolvedMetaArg ec) ((v_dictClassArgs ec) forced)) then false else (if ((v_isRigidDictArg ec) forced) then false else true)))))

# 1394 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__298, dtb__299) -> (match dtb__298 with
  | { Elab_dTypes.f_Constraint_conId = dtb__300; Elab_dTypes.f_Constraint_conKind = dtb__301; Elab_dTypes.f_Constraint_conMeta = dtb__302; Elab_dTypes.f_Constraint_conDom = dtb__303; Elab_dTypes.f_Constraint_conSpan = dtb__304; Elab_dTypes.f_Constraint_conDepth = dtb__305 } -> (match ((Core_dTerm.v_metaLookup dtb__302) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__306) -> ((v_firstUnsolvedDictGoalGo mc0) dtb__299)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__303) in (if ((v_isLeftoverDictGoal mc0) forced) then (B_dData_dMaybe.C_Maybe_Just (((v_showResolvedValue mc0) forced))) else ((v_firstUnsolvedDictGoalGo mc0) dtb__299)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1379 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoal = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictGoalGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1442 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedInterpSpanGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (match dtb__307 with
  | { Elab_dTypes.f_Constraint_conId = dtb__309; Elab_dTypes.f_Constraint_conKind = dtb__310; Elab_dTypes.f_Constraint_conMeta = dtb__311; Elab_dTypes.f_Constraint_conDom = dtb__312; Elab_dTypes.f_Constraint_conSpan = dtb__313; Elab_dTypes.f_Constraint_conDepth = dtb__314 } -> (match ((Core_dTerm.v_metaLookup dtb__311) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__315) -> ((v_firstUnsolvedInterpSpanGo mc0) dtb__308)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__312) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then dtb__313 else ((v_firstUnsolvedInterpSpanGo mc0) dtb__308)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1438 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedInterpGoalSpan = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedInterpSpanGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1460 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedMemberSpanGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__316, dtb__317) -> (match dtb__316 with
  | { Elab_dTypes.f_Constraint_conId = dtb__318; Elab_dTypes.f_Constraint_conKind = dtb__319; Elab_dTypes.f_Constraint_conMeta = dtb__320; Elab_dTypes.f_Constraint_conDom = dtb__321; Elab_dTypes.f_Constraint_conSpan = dtb__322; Elab_dTypes.f_Constraint_conDepth = dtb__323 } -> (if ((v_isMemberDomain mc0) dtb__321) then (match ((Core_dTerm.v_metaLookup dtb__320) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__322
  | B_dData_dMaybe.C_Maybe_Just (dtb__324) -> ((v_firstUnsolvedMemberSpanGo mc0) dtb__317)
  | _ -> failwith "DT: impossible branch"
) else ((v_firstUnsolvedMemberSpanGo mc0) dtb__317))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1456 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedMemberGoalSpan = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedMemberSpanGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1475 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictSpanGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__325, dtb__326) -> (match dtb__325 with
  | { Elab_dTypes.f_Constraint_conId = dtb__327; Elab_dTypes.f_Constraint_conKind = dtb__328; Elab_dTypes.f_Constraint_conMeta = dtb__329; Elab_dTypes.f_Constraint_conDom = dtb__330; Elab_dTypes.f_Constraint_conSpan = dtb__331; Elab_dTypes.f_Constraint_conDepth = dtb__332 } -> (match ((Core_dTerm.v_metaLookup dtb__329) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__333) -> ((v_firstUnsolvedDictSpanGo mc0) dtb__326)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__330) in (if ((v_isLeftoverDictGoal mc0) forced) then dtb__331 else ((v_firstUnsolvedDictSpanGo mc0) dtb__326)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1471 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalSpan = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictSpanGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1490 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalMetaGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__334, dtb__335) -> (match dtb__334 with
  | { Elab_dTypes.f_Constraint_conId = dtb__336; Elab_dTypes.f_Constraint_conKind = dtb__337; Elab_dTypes.f_Constraint_conMeta = dtb__338; Elab_dTypes.f_Constraint_conDom = dtb__339; Elab_dTypes.f_Constraint_conSpan = dtb__340; Elab_dTypes.f_Constraint_conDepth = dtb__341 } -> (match ((Core_dTerm.v_metaLookup dtb__338) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__342) -> ((v_firstUnsolvedDictGoalMetaGo mc0) dtb__335)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__339) in (if ((v_isLeftoverDictGoal mc0) forced) then (B_dData_dMaybe.C_Maybe_Just (dtb__338)) else ((v_firstUnsolvedDictGoalMetaGo mc0) dtb__335)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1486 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalMeta = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictGoalMetaGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1533 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_memberWeakenProof = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (eGoal : Core_dTerm.t_Value) (rGoal : Core_dTerm.t_Value) (rAssump : Core_dTerm.t_Value) (acc : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((Elab_dMeta.v_convEc ec) depth) rGoal) rAssump) with
  | Base_dDiag.C_Check_OkC (dtb__343) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = dtb__343 }))
  | Base_dDiag.C_Check_ErrC (dtb__344) -> (match ((Elab_dTypes.v_forceVal ec) rGoal) with
  | Core_dTerm.C_Value_VCon (dtb__345, dtb__346) -> (if (dtb__345 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut11 = dtb__346 in (match nd_uscrut11 with
  | B_dData_dList.C_List__x58__x58_ (dtb__347, dtb__348) -> (match dtb__348 with
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> (let nd_uscrut18 = (((((((v_memberWeakenProof (fuel - 1)) ec) depth) eGoal) dtb__349) rAssump) acc) in (match nd_uscrut18 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__351) -> (match dtb__351 with
  | { B_dData_dPair.f_Pair_first = dtb__352; B_dData_dPair.f_Pair_second = dtb__353 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (((v_ctorValue dtb__353) v_thereCtorName) (B_dData_dList.C_List__x58__x58_ (eGoal, (B_dData_dList.C_List__x58__x58_ (dtb__347, (B_dData_dList.C_List__x58__x58_ (dtb__349, (B_dData_dList.C_List__x58__x58_ (dtb__352, B_dData_dList.C_List_Nil))))))))); B_dData_dPair.f_Pair_second = dtb__353 }))
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
let rec v_ctxMemberWeakenGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__354, dtb__355) -> (match dtb__354 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (let olderDepth = (B_dData_dList.v_length dtb__355) in (let tyVal = ((Core_dEval.v_eval ((B_dData_dList.v_map ((Elab_dTypes.v_refineValue (mc0).Elab_dTypes.f_Ctx_ctxRefVals) Core_dTerm.v_defaultFuel)) (((Elab_dTypes.v_ctxEnvAt dtb__355) 0) olderDepth))) dtb__357) in (let nd_uscrut14 = (v_memberSpine mc4) in (match nd_uscrut14 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__358) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> (let nd_uscrut21 = (v_memberSpine tyVal) in (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__361) -> (match dtb__361 with
  | { B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = dtb__363 } -> (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc0)) dtb__359) dtb__362) with
  | Base_dDiag.C_Check_ErrC (dtb__364) -> (((((v_ctxMemberWeakenGo mc0) dtb__355) (mc2 + 1)) mc3) mc4)
  | Base_dDiag.C_Check_OkC (dtb__365) -> (let nd_uscrut30 = (((((((v_memberWeakenProof 64) dtb__365) (Elab_dTypes.v_ctxDepth mc0)) dtb__359) dtb__360) dtb__363) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__356, mc2, B_dData_dList.C_List_Nil))))) in (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__366) -> (match dtb__366 with
  | { B_dData_dPair.f_Pair_first = dtb__367; B_dData_dPair.f_Pair_second = dtb__368 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth mc0)) dtb__367); B_dData_dPair.f_Pair_second = dtb__368 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ctxMemberWeakenGo mc0) dtb__355) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ctxMemberWeakenGo mc0) dtb__355) (mc2 + 1)) mc3) mc4)
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
let v_ctxMemberWeaken = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (((((v_ctxMemberWeakenGo ctx) (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ec) dom))

# 59 "Vuna/Compiler/Elab/Dict.vuna"
let v_instMatchInst = (fun (p : t_InstMatch) -> (match p with
  | { f_InstMatch_instMatchInst = dtb__369; f_InstMatch_instMatchTerm = dtb__370 } -> dtb__369
  | _ -> failwith "DT: impossible branch"
))

# 244 "Vuna/Compiler/Elab/Dict.vuna"
let v_finishInstanceSearch = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Base_dSource.t_Span) (mc2 : t_InstMatch B_dData_dList.t_List) (mc3 : Elab_dTypes.t_Ec) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match dtb__372 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__371).f_InstMatch_instMatchTerm; B_dData_dPair.f_Pair_second = mc3 }))
  | _ -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["search-ambig: dom="; (Core_dEval.v_showValue mc0); " cands="; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (fun (x : t_InstMatch) -> (Elab_dTypes.v_dtInstName (v_instMatchInst x)))) mc2))])) else 0) in (let sd = (Core_dEval.v_showValue mc0) in (let names = (v_joinInstNames ((B_dData_dList.v_map v_instMatchInst) mc2)) in ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousInstance (sd, names))) sd) names))))
)
  | B_dData_dList.C_List_Nil -> (((v_missingInstance mc3) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 72 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_searchInstFuel = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (fuel : int) (ec0 : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let ec = ((Elab_dTypes.v_ecBump ec0) "elab.inst.search") in (if (fuel <= 0) then (((v_exhaustedInstance ec) dom) sp) else (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["search: dom="; (Core_dEval.v_showValue dom); " rigid="; (if ((v_rigidSearchFast ec) dom) then "T" else "F"); " insts="; (string_of_int (B_dData_dList.v_length (Elab_dTypes.v_ecInstList ec)))])) else 0) in (match ((((v_localDictLookup ctx) 0) dom) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__373) -> (Base_dDiag.C_Check_OkC (dtb__373))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((v_rigidSearchFast ec) dom) then (B_dData_dBool.v_not ((v_viaCandidateExists ec) dom)) else false) then (((v_missingInstance ec) dom) sp) else (match ((((((((v_matchInstances globals) ctx) fuel) ec) dom) sp) (v_specificInstances ((v_searchCandidates ec) dom))) B_dData_dList.C_List_Nil) with
  | dtb__374 -> (match (dtb__374).f_InstScan_scanMatches with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut10 = ((((((v_tryViaDict globals) ctx) (fuel - 1)) (dtb__374).f_InstScan_scanEc) dom) sp) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_ErrC (dtb__375) -> (Base_dDiag.C_Check_ErrC (dtb__375))
  | Base_dDiag.C_Check_OkC (dtb__376) -> (match dtb__376 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let blanket = ((((((((v_matchInstances globals) ctx) fuel) (dtb__374).f_InstScan_scanEc) dom) sp) (v_blanketInstances ((v_searchCandidates ec) dom))) B_dData_dList.C_List_Nil) in (match (blanket).f_InstScan_scanMatches with
  | B_dData_dList.C_List_Nil -> (if (if (dtb__374).f_InstScan_scanExhausted then true else (blanket).f_InstScan_scanExhausted) then (((v_exhaustedInstance (dtb__374).f_InstScan_scanEc) dom) sp) else (((v_missingInstance (dtb__374).f_InstScan_scanEc) dom) sp))
  | dtb__377 -> ((((v_finishInstanceSearch dom) sp) dtb__377) (blanket).f_InstScan_scanEc)
))
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> (Base_dDiag.C_Check_OkC (dtb__378))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | dtb__379 -> ((((v_finishInstanceSearch dom) sp) dtb__379) (dtb__374).f_InstScan_scanEc)
)
))
  | _ -> failwith "DT: impossible branch"
)))))
# 202 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryViaDict = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (depth : int) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let nd_uscrut6 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut6 with
  | Core_dTerm.C_Value_VNeutral (dtb__380) -> (match dtb__380 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__381, dtb__382) -> (if ((v_viaCandidateExists ec) dom) then ((((((((v_tryViaArgs globals) ctx) depth) ec) sp) dtb__381) dtb__382) 0) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)))
# 213 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryViaArgs = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Base_dSource.t_Span) (mc5 : string) (mc6 : Core_dTerm.t_Value B_dData_dList.t_List) (mc7 : int) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__383, dtb__384) -> (match (((v_viaWrapperOf mc3) mc5) dtb__383) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_tryViaArgs mc0) mc1) mc2) mc3) mc4) mc5) dtb__384) (mc7 + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> ((Base_dCommon.v_bind ((((((v_searchInstFuel mc0) mc1) (mc2 - 1)) mc3) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (mc5, (((v_replaceAt mc7) dtb__385) (B_dData_dList.C_List__x58__x58_ (dtb__383, dtb__384)))))))) mc4)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (p))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 394 "Vuna/Compiler/Elab/Dict.vuna"
and v_matchInstances = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (fuel : int) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) (insts : Elab_dTypes.t_DtInst B_dData_dList.t_List) (acc : t_InstMatch B_dData_dList.t_List) -> ((((((((((v_scanInstances globals) ctx) fuel) ec) dom) sp) insts) acc) B_dData_dMaybe.C_Maybe_Nothing) false))
# 398 "Vuna/Compiler/Elab/Dict.vuna"
and v_scanInstances = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) (mc5 : Base_dSource.t_Span) (mc6 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (mc7 : t_InstMatch B_dData_dList.t_List) (mc8 : Elab_dTypes.t_Ec B_dData_dMaybe.t_Maybe) (mc9 : bool) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__386, dtb__387) -> (match (((((((v_tryMatchInst mc0) mc1) mc2) mc3) dtb__386) mc4) mc5) with
  | C_InstTry_InstMatched (dtb__388, dtb__389) -> ((((((((((v_scanInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__387) (B_dData_dList.C_List__x58__x58_ ({ f_InstMatch_instMatchInst = dtb__386; f_InstMatch_instMatchTerm = dtb__388 }, mc7))) (match mc8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__390) -> (B_dData_dMaybe.C_Maybe_Just (dtb__390))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__389))
  | _ -> failwith "DT: impossible branch"
)) mc9)
  | C_InstTry_InstMissed -> ((((((((((v_scanInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__387) mc7) mc8) mc9)
  | C_InstTry_InstOutOfFuel -> ((((((((((v_scanInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__387) mc7) mc8) true)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { f_InstScan_scanMatches = (B_dData_dList.v_reverse mc7); f_InstScan_scanEc = (match mc8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__391) -> dtb__391
  | B_dData_dMaybe.C_Maybe_Nothing -> mc3
  | _ -> failwith "DT: impossible branch"
); f_InstScan_scanExhausted = mc9 }
  | _ -> failwith "DT: impossible branch"
))
# 426 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryMatchInst = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (fuel : int) (ec : Elab_dTypes.t_Ec) (inst : Elab_dTypes.t_DtInst) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then C_InstTry_InstOutOfFuel else (match ((((v_allocTeleMetas (inst).Elab_dTypes.f_DtInst_dtInstSpan) ctx) ec) (inst).Elab_dTypes.f_DtInst_dtInstTele) with
  | { B_dData_dPair.f_Pair_first = dtb__392; B_dData_dPair.f_Pair_second = dtb__393 } -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["inst-try: "; (Elab_dTypes.v_dtInstName inst); " head="; (Core_dTerm.v_showTerm (inst).Elab_dTypes.f_DtInst_dtInstHead); " tele="; (string_of_int (B_dData_dList.v_length (inst).Elab_dTypes.f_DtInst_dtInstTele))])) else 0) in (let hd = ((Core_dEval.v_eval ((B_dData_dList.v_map (fun (m : int) -> (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil)))) dtb__392)) (inst).Elab_dTypes.f_DtInst_dtInstHead) in (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__393)) (Elab_dTypes.v_ecSolsP dtb__393)) (Elab_dTypes.v_ctxDepth ctx)) dom) hd) with
  | Base_dDiag.C_Check_ErrC (dtb__394) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["inst-conv-err: "; (Elab_dTypes.v_dtInstName inst); " dom="; (Core_dEval.v_showValue dom); " hd="; (Core_dEval.v_showValue hd)])) else 0) in C_InstTry_InstMissed)
  | Base_dDiag.C_Check_OkC (dtb__395) -> (let ec2 = ((Elab_dTypes.v_ecPutSols dtb__393) (Core_dTerm.v_solsList dtb__395)) in (match ((v_solveTeleMetas ec2) dtb__392) with
  | B_dData_dMaybe.C_Maybe_Nothing -> C_InstTry_InstMissed
  | B_dData_dMaybe.C_Maybe_Just (dtb__396) -> (let teleArgs = ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> { B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) ((Elab_dTypes.v_forceVal ec2) v)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) (B_dData_dList.v_reverse dtb__396)) in (let env2 = ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> ((Elab_dTypes.v_forceVal ec2) v))) dtb__396) in (let ctxVals = ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> ((Elab_dTypes.v_forceVal ec2) ((Core_dEval.v_eval env2) t)))) (inst).Elab_dTypes.f_DtInst_dtInstCtx) in (match (((((((v_solveDictCtxs globals) ctx) (fuel - 1)) ec2) sp) ctxVals) B_dData_dList.C_List_Nil) with
  | C_CtxSolve_CtxSolved (dtb__397, dtb__398) -> (C_InstTry_InstMatched (((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dTypes.v_dtInstSym inst)))) ((B_dData_dList.v_append teleArgs) dtb__397)), dtb__398))
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
and v_solveDictCtxs = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Base_dSource.t_Span) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) (mc6 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__399, dtb__400) -> (let nd_uscrut10 = ((((((v_searchInstFuel mc0) mc1) mc2) mc3) dtb__399) mc4) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__401) -> (match dtb__401 with
  | { B_dData_dPair.f_Pair_first = dtb__402; B_dData_dPair.f_Pair_second = dtb__403 } -> (((((((v_solveDictCtxs mc0) mc1) mc2) dtb__403) mc4) dtb__400) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__402; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__404) -> (if (v_instOutOfFuelDiag dtb__404) then C_CtxSolve_CtxOutOfFuel else C_CtxSolve_CtxUnsolvable)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (C_CtxSolve_CtxSolved ((B_dData_dList.v_reverse mc6), mc3))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchInstanceIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> ((((((v_searchInstFuel globals) ctx) v_instDepthBound) ec) dom) sp))

# 56 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchInstance = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((v_searchInstanceIn B_dData_dList.C_List_Nil) Elab_dTypes.v_emptyCtx) ec) dom) sp))

# 712 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_resolveRowGoalsCtxGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Base_dSource.t_Span) (mc3 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Ec) (mc5 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__405, dtb__406) -> (match dtb__405 with
  | { Elab_dTypes.f_Constraint_conId = dtb__407; Elab_dTypes.f_Constraint_conKind = dtb__408; Elab_dTypes.f_Constraint_conMeta = dtb__409; Elab_dTypes.f_Constraint_conDom = dtb__410; Elab_dTypes.f_Constraint_conSpan = dtb__411; Elab_dTypes.f_Constraint_conDepth = dtb__412 } -> (if ((v_isMemberDomain mc4) dtb__410) then (match ((((v_memberLookup 64) (Elab_dTypes.v_ctxDepth mc1)) mc4) dtb__410) with
  | C_MemberLookup_MemberFound (dtb__413, dtb__414) -> (match ((((v_solveRowMeta dtb__414) (Elab_dTypes.v_ctxDepth mc1)) dtb__409) dtb__413) with
  | Base_dDiag.C_Check_OkC (dtb__415) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) dtb__415) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__416) -> (Base_dDiag.C_Check_ErrC (dtb__416))
  | _ -> failwith "DT: impossible branch"
)
  | C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | C_MemberLookup_MemberAmbiguous (dtb__417) -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc2) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousInstance ("effect instance", ((B_dData_dString.v_join ", ") dtb__417)))) "effect instance") ((B_dData_dString.v_join ", ") dtb__417))
  | C_MemberLookup_MemberStuck -> (let nd_uscrut15 = (((v_ctxMemberProofUnify mc1) mc4) dtb__410) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let nd_uscrut17 = (((v_ctxMemberWeaken mc1) mc4) dtb__410) in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | B_dData_dMaybe.C_Maybe_Just (dtb__418) -> (match dtb__418 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> (match ((((v_solveRowMeta dtb__420) (Elab_dTypes.v_ctxDepth mc1)) dtb__409) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__419)) with
  | Base_dDiag.C_Check_OkC (dtb__421) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) dtb__421) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__422) -> (Base_dDiag.C_Check_ErrC (dtb__422))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Just (dtb__423) -> (match dtb__423 with
  | { B_dData_dPair.f_Pair_first = dtb__424; B_dData_dPair.f_Pair_second = dtb__425 } -> (match ((((v_solveRowMeta dtb__425) (Elab_dTypes.v_ctxDepth mc1)) dtb__409) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__424)) with
  | Base_dDiag.C_Check_OkC (dtb__426) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) dtb__426) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__427) -> (Base_dDiag.C_Check_ErrC (dtb__427))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (match ((v_dictClassArgs mc4) dtb__410) with
  | B_dData_dList.C_List_Nil -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__405, mc5)))
  | dtb__428 -> (if ((v_anyUnsolvedMetaArg mc4) dtb__428) then ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__405, mc5))) else (if (if ((v_isRigidDictArg mc4) dtb__410) then (v_allInstancesMono (Elab_dTypes.v_ecInstList mc4)) else false) then ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__405, mc5))) else (let nd_uscrut16 = (((((v_searchInstanceIn mc0) mc1) mc4) ((Elab_dTypes.v_forceVal mc4) dtb__410)) mc2) in (match nd_uscrut16 with
  | Base_dDiag.C_Check_ErrC (dtb__429) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__405, mc5)))
  | Base_dDiag.C_Check_OkC (dtb__430) -> (match dtb__430 with
  | { B_dData_dPair.f_Pair_first = dtb__431; B_dData_dPair.f_Pair_second = dtb__432 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__432)) (Elab_dTypes.v_ecSolsP dtb__432)) (Elab_dTypes.v_ctxDepth mc1)) dtb__409) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__431)) with
  | Base_dDiag.C_Check_OkC (dtb__433) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) ((Elab_dTypes.v_ecPutSols dtb__432) (Core_dTerm.v_solsList dtb__433))) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__434) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__406) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__405, mc5)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutPending mc4) (B_dData_dList.v_reverse mc5))))
  | _ -> failwith "DT: impossible branch"
))

# 709 "Vuna/Compiler/Elab/Dict.vuna"
let v_resolveRowGoalsCtx = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) -> ((((((v_resolveRowGoalsCtxGo globals) ctx) sp) (Elab_dTypes.v_ecPendingList ec)) ec) B_dData_dList.C_List_Nil))

# 831 "Vuna/Compiler/Elab/Dict.vuna"
let v_tryResolveDictGoal = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Constraint) (mc3 : Core_dTerm.t_Value) -> (match mc2 with
  | { Elab_dTypes.f_Constraint_conId = dtb__435; Elab_dTypes.f_Constraint_conKind = dtb__436; Elab_dTypes.f_Constraint_conMeta = dtb__437; Elab_dTypes.f_Constraint_conDom = dtb__438; Elab_dTypes.f_Constraint_conSpan = dtb__439; Elab_dTypes.f_Constraint_conDepth = dtb__440 } -> (if (dtb__440 > 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((v_isMemberDomain mc1) dtb__438) then (match ((((v_memberLookup 64) 0) mc1) dtb__438) with
  | C_MemberLookup_MemberFound (dtb__441, dtb__442) -> (match ((((v_solveRowMeta dtb__442) dtb__440) dtb__437) dtb__441) with
  | Base_dDiag.C_Check_OkC (dtb__443) -> (B_dData_dMaybe.C_Maybe_Just (dtb__443))
  | Base_dDiag.C_Check_ErrC (dtb__444) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_MemberLookup_MemberAbsent -> B_dData_dMaybe.C_Maybe_Nothing
  | C_MemberLookup_MemberAmbiguous (dtb__445) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_MemberLookup_MemberStuck -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (match ((v_dictClassArgs mc1) mc3) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | dtb__446 -> (if ((v_anyUnsolvedMetaArg mc1) dtb__446) then B_dData_dMaybe.C_Maybe_Nothing else (if (if ((v_isRigidDictArg mc1) mc3) then (v_allInstancesMono (Elab_dTypes.v_ecInstList mc1)) else false) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut11 = (((v_searchInstance mc1) mc3) { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_ErrC (dtb__447) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__448) -> (match dtb__448 with
  | { B_dData_dPair.f_Pair_first = dtb__449; B_dData_dPair.f_Pair_second = dtb__450 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__450)) (Elab_dTypes.v_ecSolsP dtb__450)) dtb__440) dtb__437) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__449)) with
  | Base_dDiag.C_Check_OkC (dtb__451) -> (B_dData_dMaybe.C_Maybe_Just (((Elab_dTypes.v_ecPutSols dtb__450) (Core_dTerm.v_solsList dtb__451))))
  | Base_dDiag.C_Check_ErrC (dtb__452) -> B_dData_dMaybe.C_Maybe_Nothing
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
let rec v_resolveDictGoalsFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) -> (if (fuel <= 0) then ec0 else (let nd_uscrut3 = (Elab_dTypes.v_ecPopPending ec0) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__453) -> (match dtb__453 with
  | { B_dData_dPair.f_Pair_first = dtb__454; B_dData_dPair.f_Pair_second = dtb__455 } -> (match dtb__454 with
  | { Elab_dTypes.f_Constraint_conId = dtb__456; Elab_dTypes.f_Constraint_conKind = dtb__457; Elab_dTypes.f_Constraint_conMeta = dtb__458; Elab_dTypes.f_Constraint_conDom = dtb__459; Elab_dTypes.f_Constraint_conSpan = dtb__460; Elab_dTypes.f_Constraint_conDepth = dtb__461 } -> (let ec1 = ((Elab_dTypes.v_ecBump dtb__455) "elab.dict.round") in (match ((Core_dTerm.v_metaLookup dtb__458) (Elab_dTypes.v_ecSolTbl ec1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__462) -> (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let solsNow = (Elab_dTypes.v_ecSolsCountOf ec1) in (match ((Elab_dTypes.v_ecTriedAt ec1) dtb__456) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__463) -> (if (dtb__463 = solsNow) then (let ec2 = (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1) in ((Elab_dTypes.v_ecPushPending ec2) dtb__454)) else (let forced = ((Elab_dTypes.v_forceVal ec1) dtb__459) in (let kept = { Elab_dTypes.f_Constraint_conId = dtb__456; Elab_dTypes.f_Constraint_conKind = dtb__457; Elab_dTypes.f_Constraint_conMeta = dtb__458; Elab_dTypes.f_Constraint_conDom = (if ((v_isMemberDomain ec1) dtb__459) then dtb__459 else forced); Elab_dTypes.f_Constraint_conSpan = dtb__460; Elab_dTypes.f_Constraint_conDepth = dtb__461 } in (let solsTried = (Elab_dTypes.v_ecSolsCountOf ec1) in (match ((((v_tryResolveDictGoal globals) ec1) dtb__454) forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__464) -> (((v_resolveDictGoalsFuel (fuel - 1)) globals) dtb__464)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let ec2 = (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1) in (let ec3 = (((Elab_dTypes.v_ecRecordTried ec2) dtb__456) solsTried) in ((Elab_dTypes.v_ecPushPending ec3) kept)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal ec1) dtb__459) in (let kept = { Elab_dTypes.f_Constraint_conId = dtb__456; Elab_dTypes.f_Constraint_conKind = dtb__457; Elab_dTypes.f_Constraint_conMeta = dtb__458; Elab_dTypes.f_Constraint_conDom = (if ((v_isMemberDomain ec1) dtb__459) then dtb__459 else forced); Elab_dTypes.f_Constraint_conSpan = dtb__460; Elab_dTypes.f_Constraint_conDepth = dtb__461 } in (let solsTried = (B_dData_dList.v_length (Elab_dTypes.v_ecSols ec1)) in (match ((((v_tryResolveDictGoal globals) ec1) dtb__454) forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__465) -> (((v_resolveDictGoalsFuel (fuel - 1)) globals) dtb__465)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let ec2 = (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1) in (let ec3 = (((Elab_dTypes.v_ecRecordTried ec2) dtb__456) solsTried) in ((Elab_dTypes.v_ecPushPending ec3) kept)))
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
  | B_dData_dMaybe.C_Maybe_Nothing -> ec0
  | _ -> failwith "DT: impossible branch"
))))

# 761 "Vuna/Compiler/Elab/Dict.vuna"
let v_resolveDictGoals = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (let n = (Elab_dTypes.v_ecPendingCount ec) in (if (Elab_dTypes.v_ecDictPassIdle ec) then ec else (Elab_dTypes.v_ecPutPassMarker (((v_resolveDictGoalsFuel (n + 1)) globals) ((Elab_dTypes.v_ecBump ec) ("elab.dict.pending.b" ^ (v_pendingBucket n))))))))

# 1245 "Vuna/Compiler/Elab/Dict.vuna"
let v_specializeEqTy = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (name : string) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (aTy : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (match (Elab_dPrelude.v_builtinEqTyName ((Elab_dTypes.v_forceVal ec) aTy)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__466) -> ((Base_dCommon.v_bind ((Elab_dPrelude.v_eqRuntimeName (v_methodShortOf name)) dtb__466)) (fun (rt : string) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (rt)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_findEqClass name) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let st = (Core_dEval.v_showValue ((Elab_dTypes.v_forceVal ec) aTy)) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_EqRequiresEvidence (st))) st))
  | B_dData_dMaybe.C_Maybe_Just (dtb__467) -> (let mname = (if (if (name = "==") then true else (name = "/=")) then ((v_projectionFor dtb__467) (v_methodShortOf name)) else name) in (let tyTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) aTy) in (let dictTy = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__467)), (B_dData_dList.C_List__x58__x58_ (aTy, B_dData_dList.C_List_Nil)))))) in (if ((v_dictArgUnsolvedMeta ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (let nd_uscrut14 = (((((v_searchInstanceIn globals) ctx) ec) dictTy) sp) in (match nd_uscrut14 with
  | Base_dDiag.C_Check_ErrC (dtb__468) -> (if ((v_isRigidDictArg ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dDiag.C_Check_ErrC (dtb__468)))
  | Base_dDiag.C_Check_OkC (dtb__469) -> (match dtb__469 with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__470, Core_dTerm.C_Rig_RigOmega)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__471 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1329 "Vuna/Compiler/Elab/Dict.vuna"
let v_specializeCmpTy = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (name : string) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (aTy : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (match (Elab_dPrelude.v_cmpBuiltinTyName ((Elab_dTypes.v_forceVal ec) aTy)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__472) -> ((Base_dCommon.v_bind (((v_cmpRuntimeName sp) (v_methodShortOf name)) dtb__472)) (fun (rt : string) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (rt)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_findOrdClass name) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let st = (Core_dEval.v_showValue ((Elab_dTypes.v_forceVal ec) aTy)) in ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor ((v_methodShortOf name), st))) (v_methodShortOf name)) st))
  | B_dData_dMaybe.C_Maybe_Just (dtb__473) -> (let mname = (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then ((v_projectionFor dtb__473) (v_methodShortOf name)) else name) in (let tyTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) aTy) in (let dictTy = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__473)), (B_dData_dList.C_List__x58__x58_ (aTy, B_dData_dList.C_List_Nil)))))) in (if ((v_dictArgUnsolvedMeta ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (let nd_uscrut14 = (((((v_searchInstanceIn globals) ctx) ec) dictTy) sp) in (match nd_uscrut14 with
  | Base_dDiag.C_Check_ErrC (dtb__474) -> (if ((v_isRigidDictArg ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dDiag.C_Check_ErrC (dtb__474)))
  | Base_dDiag.C_Check_OkC (dtb__475) -> (match dtb__475 with
  | { B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__477 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__476, Core_dTerm.C_Rig_RigOmega)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__477 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1414 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalExhaustedGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__478, dtb__479) -> (match dtb__478 with
  | { Elab_dTypes.f_Constraint_conId = dtb__480; Elab_dTypes.f_Constraint_conKind = dtb__481; Elab_dTypes.f_Constraint_conMeta = dtb__482; Elab_dTypes.f_Constraint_conDom = dtb__483; Elab_dTypes.f_Constraint_conSpan = dtb__484; Elab_dTypes.f_Constraint_conDepth = dtb__485 } -> (match ((Core_dTerm.v_metaLookup dtb__482) (Elab_dTypes.v_ecSolTbl mc1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__486) -> (((v_firstUnsolvedDictGoalExhaustedGo mc0) mc1) dtb__479)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc1) dtb__483) in (if ((v_isLeftoverDictGoal mc1) forced) then (let gsp = (match dtb__484 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__489) -> dtb__489
  | B_dData_dMaybe.C_Maybe_Nothing -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }
  | _ -> failwith "DT: impossible branch"
) in (match (((((v_searchInstanceIn mc0) Elab_dTypes.v_emptyCtx) mc1) forced) gsp) with
  | Base_dDiag.C_Check_ErrC (dtb__487) -> (if (v_instOutOfFuelDiag dtb__487) then (B_dData_dMaybe.C_Maybe_Just (dtb__487)) else B_dData_dMaybe.C_Maybe_Nothing)
  | Base_dDiag.C_Check_OkC (dtb__488) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (((v_firstUnsolvedDictGoalExhaustedGo mc0) mc1) dtb__479)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1410 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalExhausted = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (((v_firstUnsolvedDictGoalExhaustedGo globals) ec) (Elab_dTypes.v_ecPendingList ec)))

# 60 "Vuna/Compiler/Elab/Dict.vuna"
let v_instMatchTerm = (fun (p : t_InstMatch) -> (match p with
  | { f_InstMatch_instMatchInst = dtb__490; f_InstMatch_instMatchTerm = dtb__491 } -> dtb__491
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Elab/Dict.vuna"
let v_scanMatches = (fun (p : t_InstScan) -> (match p with
  | { f_InstScan_scanMatches = dtb__492; f_InstScan_scanEc = dtb__493; f_InstScan_scanExhausted = dtb__494 } -> dtb__492
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Elab/Dict.vuna"
let v_scanEc = (fun (p : t_InstScan) -> (match p with
  | { f_InstScan_scanMatches = dtb__495; f_InstScan_scanEc = dtb__496; f_InstScan_scanExhausted = dtb__497 } -> dtb__496
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Elab/Dict.vuna"
let v_scanExhausted = (fun (p : t_InstScan) -> (match p with
  | { f_InstScan_scanMatches = dtb__498; f_InstScan_scanEc = dtb__499; f_InstScan_scanExhausted = dtb__500 } -> dtb__500
  | _ -> failwith "DT: impossible branch"
))

# 1153 "Vuna/Compiler/Elab/Dict.vuna"
let v_boShort = (fun (p : t_BuiltinOp) -> (match p with
  | { f_BuiltinOp_boShort = dtb__501; f_BuiltinOp_boOp = dtb__502; f_BuiltinOp_boRuntime = dtb__503 } -> dtb__501
  | _ -> failwith "DT: impossible branch"
))

# 1154 "Vuna/Compiler/Elab/Dict.vuna"
let v_boOp = (fun (p : t_BuiltinOp) -> (match p with
  | { f_BuiltinOp_boShort = dtb__504; f_BuiltinOp_boOp = dtb__505; f_BuiltinOp_boRuntime = dtb__506 } -> dtb__505
  | _ -> failwith "DT: impossible branch"
))

# 1155 "Vuna/Compiler/Elab/Dict.vuna"
let v_boRuntime = (fun (p : t_BuiltinOp) -> (match p with
  | { f_BuiltinOp_boShort = dtb__507; f_BuiltinOp_boOp = dtb__508; f_BuiltinOp_boRuntime = dtb__509 } -> dtb__509
  | _ -> failwith "DT: impossible branch"
))
