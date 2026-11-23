open Vuna_runtime
type t_InstMatch = { f_InstMatch_instMatchInst : Elab_dTypes.t_DtInst; f_InstMatch_instMatchTerm : Core_dTerm.t_Term }
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

# 55 "Vuna/Compiler/Elab/Dict.vuna"
let v_instMatchInst = (fun (mc0 : t_InstMatch) -> (match mc0 with
  | { f_InstMatch_instMatchInst = dtb__3; f_InstMatch_instMatchTerm = dtb__4 } -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

# 95 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_findClass = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtClass B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if ((Elab_dTypes.v_dtClassName dtb__5) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__5)) else ((v_findClass mc0) dtb__6))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Elab/Dict.vuna"
let v_famOfClass = (fun (ec : Elab_dTypes.t_Ec) (cn : string) -> (match ((v_findClass cn) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__7))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyViaClassFam = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (match ((v_famOfClass mc0) dtb__8) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> (if (dtb__10 = mc1) then true else (((v_anyViaClassFam mc0) mc1) dtb__9))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_anyViaClassFam mc0) mc1) dtb__9)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaAllowsFam = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtData) (fam : string) -> (((v_anyViaClassFam ec) fam) (d).Elab_dTypes.f_DtData_dtDataViaClasses))

# 119 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_applyDataPis = (fun (ec : Elab_dTypes.t_Ec) (n : int) (v : Core_dTerm.t_Value) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just (v)) else (match args with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VPi (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> ((((v_applyDataPis ec) (n - 1)) ((Core_dEval.v_applyClosure dtb__17) dtb__11)) dtb__12)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 132 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaFieldType = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtData) (c : Elab_dTypes.t_DtCtor) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if ((B_dData_dList.v_length args) <> (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((v_applyDataPis ec) (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (match ((Elab_dTypes.v_forceVal ec) dtb__18) with
  | Core_dTerm.C_Value_VPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (B_dData_dMaybe.C_Maybe_Just (dtb__22))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 159 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperShape = (fun (ec : Elab_dTypes.t_Ec) (d : Elab_dTypes.t_DtData) (wargs : Core_dTerm.t_Value B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName (Elab_dTypes.v_dtDataName d)) (Elab_dRepresentation.v_unboxedFamilySet (Elab_dTypes.v_ecDatas ec))) then (match (Elab_dTypes.v_dtDataCtors d) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> ((((v_viaFieldType ec) d) dtb__24) wargs)
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing))

# 152 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperData = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (w : string) (wargs : Core_dTerm.t_Value B_dData_dList.t_List) -> (match ((Elab_dRepresentation.v_findDtData w) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__26) -> (if (((v_viaAllowsFam ec) dtb__26) fam) then (((v_viaWrapperShape ec) dtb__26) wargs) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaWrapperOf = (fun (ec : Elab_dTypes.t_Ec) (fam : string) (arg : Core_dTerm.t_Value) -> (let nd_uscrut3 = ((Elab_dTypes.v_forceVal ec) arg) in (match nd_uscrut3 with
  | Core_dTerm.C_Value_VNeutral (dtb__27) -> (match dtb__27 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__28, dtb__29) -> ((((v_viaWrapperData ec) fam) dtb__28) dtb__29)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 169 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyViaWrapper = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match (((v_viaWrapperOf mc0) mc1) dtb__30) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_anyViaWrapper mc0) mc1) dtb__31)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Elab/Dict.vuna"
let v_viaCandidateExists = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__33) -> (match dtb__33 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__34, dtb__35) -> (((v_anyViaWrapper ec) dtb__34) dtb__35)
  | _ -> false
)
  | _ -> false
)))

# 184 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_replaceAt = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (mc1, dtb__37)) else (B_dData_dList.C_List__x58__x58_ (dtb__36, (((v_replaceAt (mc0 - 1)) mc1) dtb__37))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_specificInstances = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (if (Elab_dMeta.v_isBlanketInst dtb__38) then (v_specificInstances dtb__39) else (B_dData_dList.C_List__x58__x58_ (dtb__38, (v_specificInstances dtb__39))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 227 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_blanketInstances = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (if (Elab_dMeta.v_isBlanketInst dtb__40) then (B_dData_dList.C_List__x58__x58_ (dtb__40, (v_blanketInstances dtb__41))) else (v_blanketInstances dtb__41))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 262 "Vuna/Compiler/Elab/Dict.vuna"
let v_showResolvedValue = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (Core_dTerm.v_showTerm (((Elab_dMeta.v_zonkTerm ec) 0) ((Core_dEval.v_quote 0) ((Elab_dTypes.v_forceVal ec) v)))))

# 297 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_localDictLookupGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : int) (mc2 : Core_dTerm.t_Value) (mc3 : Elab_dTypes.t_Ec) (mc4 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__45 } -> (let v = ((Elab_dTypes.v_forceVal mc3) (((Elab_dTypes.v_varTypeValue mc0) mc1) dtb__45)) in (if ((v_isDictValue mc3) v) then (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl mc3)) (Elab_dTypes.v_ecSolsP mc3)) (Elab_dTypes.v_ctxDepth mc0)) v) mc2) with
  | Base_dDiag.C_Check_OkC (dtb__46) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__44, mc1, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = ((Elab_dTypes.v_ecPutSols mc3) (Core_dTerm.v_solsList dtb__46)) }))
  | Base_dDiag.C_Check_ErrC (dtb__47) -> (((((v_localDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43)
  | _ -> failwith "DT: impossible branch"
) else (((((v_localDictLookupGo mc0) (mc1 + 1)) mc2) mc3) dtb__43)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Elab/Dict.vuna"
let v_localDictLookupExact = (fun (ctx : Elab_dTypes.t_Ctx) (i : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (match (ctx).Elab_dTypes.f_Ctx_ctxItems with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (((((v_localDictLookupGo ctx) i) dom) ec) (ctx).Elab_dTypes.f_Ctx_ctxItems)
))

# 288 "Vuna/Compiler/Elab/Dict.vuna"
let v_localDictLookup = (fun (ctx : Elab_dTypes.t_Ctx) (i : int) (dom : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> ((((v_localDictLookupExact ctx) i) dom) ec))

# 317 "Vuna/Compiler/Elab/Dict.vuna"
let v_valueDictFamily = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__48) -> (match dtb__48 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__49, dtb__50) -> dtb__49
  | _ -> ""
)
  | _ -> ""
))

# 216 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchCandidates = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let fam = (v_valueDictFamily ((Elab_dTypes.v_forceVal ec) dom)) in (if (fam = "") then (Elab_dTypes.v_ecInsts ec) else ((Elab_dTypes.v_ecInstsFamily ec) fam))))

# 346 "Vuna/Compiler/Elab/Dict.vuna"
let v_termTypeNameOf = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__51) -> dtb__51
  | _ -> ""
))

# 340 "Vuna/Compiler/Elab/Dict.vuna"
let v_instHeadArgTypeName = (fun (i : Elab_dTypes.t_DtInst) -> (let nd_uscrut1 = (Elab_dTypes.v_flattenTaggedApp (i).Elab_dTypes.f_DtInst_dtInstHead) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> (match dtb__54 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (v_termTypeNameOf (B_dData_dPair.v_firstOf dtb__55))
  | _ -> ""
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ""
)))

# 332 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_hasSpecificInterpInstanceGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if (if (B_dData_dBool.v_not (Elab_dMeta.v_isBlanketInst dtb__57)) then ((v_instHeadArgTypeName dtb__57) = mc0) else false) then true else ((v_hasSpecificInterpInstanceGo mc0) dtb__58))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Elab/Dict.vuna"
let v_hasSpecificInterpInstance = (fun (ec : Elab_dTypes.t_Ec) (tyName : string) -> ((v_hasSpecificInterpInstanceGo tyName) ((Elab_dTypes.v_ecInstsFamily ec) (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName))))

# 350 "Vuna/Compiler/Elab/Dict.vuna"
let v_isMonoInst = (fun (i : Elab_dTypes.t_DtInst) -> (match (i).Elab_dTypes.f_DtInst_dtInstTele with
  | B_dData_dList.C_List_Nil -> (match (i).Elab_dTypes.f_DtInst_dtInstCtx with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> false
))

# 360 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_allInstancesMono = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (if (v_isMonoInst dtb__59) then (v_allInstancesMono dtb__60) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Elab/Dict.vuna"
let v_allocMetaAt = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (((Elab_dMetaSpans.v_newMetaAt dtb__61) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Elab_dTypes.v_newMeta mc1) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 414 "Vuna/Compiler/Elab/Dict.vuna"
let v_termMetaId = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TMeta (dtb__62) -> dtb__62
  | _ -> 0
))

# 402 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_allocTeleMetas = (fun (mc0 : Base_dSource.t_Span B_dData_dMaybe.t_Maybe) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Elab_dTypes.t_Ec) (mc3 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match (((v_allocMetaAt mc0) mc1) mc2) with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> (match ((((v_allocTeleMetas mc0) mc1) dtb__66) dtb__64) with
  | { B_dData_dPair.f_Pair_first = dtb__67; B_dData_dPair.f_Pair_second = dtb__68 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((v_termMetaId dtb__65), dtb__67)); B_dData_dPair.f_Pair_second = dtb__68 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 418 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_solveTeleMetas = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (match ((Core_dTerm.v_metaLookup dtb__69) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (match ((v_solveTeleMetas mc0) dtb__70) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__72) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowMemDomName = "Base.Effect.Core.rowMem"

# 445 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowYesDomName = "Base.Effect.Core.Yes"

# 448 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowNoDomName = "Base.Effect.Core.No"

# 452 "Vuna/Compiler/Elab/Dict.vuna"
let v_rowYesCtorName = "Base.Effect.Core.Yes.MkYes"

# 458 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberDomName = Base_dIntrinsics.v_effMemberFamilyName

# 462 "Vuna/Compiler/Elab/Dict.vuna"
let v_hereCtorName = Base_dIntrinsics.v_effMemberHereCtor

# 466 "Vuna/Compiler/Elab/Dict.vuna"
let v_thereCtorName = Base_dIntrinsics.v_effMemberThereCtor

# 479 "Vuna/Compiler/Elab/Dict.vuna"
let v_isMemberDomain = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__73) -> (match dtb__73 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__74, dtb__75) -> (if (dtb__74 = v_memberDomName) then (let nd_uscrut5 = dtb__75 in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__77 with
  | B_dData_dList.C_List__x58__x58_ (dtb__78, dtb__79) -> (match dtb__79 with
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

# 489 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberSpine = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__80) -> (match dtb__80 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__81, dtb__82) -> (if (dtb__81 = v_memberDomName) then (let nd_uscrut4 = dtb__82 in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (match dtb__84 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__83; B_dData_dPair.f_Pair_second = dtb__85 }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 499 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctorValue = (fun (ec : Elab_dTypes.t_Ec) (name : string) (vals : Core_dTerm.t_Value B_dData_dList.t_List) -> (match ((Elab_dMeta.v_dtCtorLookupEc ec) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__87) -> (Core_dTerm.C_Value_VCon ((Elab_dTypes.v_dtCtorName dtb__87), vals))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Value_VCon (name, vals))
  | _ -> failwith "DT: impossible branch"
))

# 515 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberProbe = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match ((((Elab_dMeta.v_convEc ec) depth) a) b) with
  | Base_dDiag.C_Check_OkC (dtb__88) -> true
  | Base_dDiag.C_Check_ErrC (dtb__89) -> false
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberNameText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (match ((Elab_dTypes.v_forceVal ec) v) with
  | Core_dTerm.C_Value_VStr (dtb__90) -> dtb__90
  | _ -> ((Core_dEval.v_showValueAt 6) v)
))

# 532 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandName = (fun (mc0 : t_LabelCand) -> (match mc0 with
  | C_LabelCand_MkLabelCand (dtb__91, dtb__92) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandIdx = (fun (mc0 : t_LabelCand) -> (match mc0 with
  | C_LabelCand_MkLabelCand (dtb__93, dtb__94) -> dtb__94
  | _ -> failwith "DT: impossible branch"
))

# 539 "Vuna/Compiler/Elab/Dict.vuna"
let v_labelCandText = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) v) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__95) -> (match dtb__95 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__96, dtb__97) -> (if (dtb__96 = Base_dIntrinsics.v_effNamedName) then (match dtb__97 with
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> ((v_memberNameText ec) dtb__98)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
) else ((Core_dEval.v_showValueAt 6) v))
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)
  | _ -> ((Core_dEval.v_showValueAt 6) v)
)))

# 551 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_labelScan = (fun (fuel : int) (depth : int) (sols : Core_dTerm.t_Sols) (ec : Elab_dTypes.t_Ec) (eF : Core_dTerm.t_Value) (rF : Core_dTerm.t_Value) (idx : int) (acc : t_LabelCand B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Elab_dTypes.v_forceVal ec) rF) with
  | Core_dTerm.C_Value_VCon (dtb__100, dtb__101) -> (if (dtb__100 = Base_dIntrinsics.v_effRowNilCtor) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = true })) else (if (dtb__100 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut10 = dtb__101 in (match nd_uscrut10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (match dtb__103 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue sols) dtb__102) then B_dData_dMaybe.C_Maybe_Nothing else (let matched = ((((v_memberProbe ec) depth) eF) dtb__102) in (let acc2 = (if matched then (B_dData_dList.C_List__x58__x58_ ((C_LabelCand_MkLabelCand (((v_labelCandText ec) dtb__102), idx)), acc)) else acc) in ((((((((v_labelScan (fuel - 1)) depth) sols) ec) eF) dtb__104) (idx + 1)) acc2))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing))
  | Core_dTerm.C_Value_VNeutral (dtb__106) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = false }))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 576 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_memberProofAtLabel = (fun (fuel : int) (depth : int) (ec : Elab_dTypes.t_Ec) (eF : Core_dTerm.t_Value) (rF : Core_dTerm.t_Value) (target : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "member proof") else (match ((Elab_dTypes.v_forceVal ec) rF) with
  | Core_dTerm.C_Value_VCon (dtb__107, dtb__108) -> (if (dtb__107 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut8 = dtb__108 in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match dtb__110 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (if (target <= 0) then ((Base_dCommon.v_bind ((((Elab_dMeta.v_convEc ec) depth) eF) dtb__109)) (fun (ec1 : Elab_dTypes.t_Ec) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_ctorValue ec1) v_hereCtorName) (B_dData_dList.C_List__x58__x58_ (eF, (B_dData_dList.C_List__x58__x58_ (dtb__111, B_dData_dList.C_List_Nil))))); B_dData_dPair.f_Pair_second = ec1 })))) else ((Base_dCommon.v_bind ((((((v_memberProofAtLabel (fuel - 1)) depth) ec) eF) dtb__111) (target - 1))) (fun (p : (Core_dTerm.t_Value, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_ctorValue (B_dData_dPair.v_secondOf p)) v_thereCtorName) (B_dData_dList.C_List__x58__x58_ (eF, (B_dData_dList.C_List__x58__x58_ (dtb__109, (B_dData_dList.C_List__x58__x58_ (dtb__111, (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf p), B_dData_dList.C_List_Nil))))))))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })))))
  | _ -> (Base_dDiag.v_icInternal "malformed row in member proof")
)
  | _ -> (Base_dDiag.v_icInternal "malformed row in member proof")
)) else (Base_dDiag.v_icInternal "member proof target out of range"))
  | _ -> (Base_dDiag.v_icInternal "member proof target out of range")
)))

# 591 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberLookupRowLabel = (fun (fuel : int) (depth : int) (ec : Elab_dTypes.t_Ec) (eVal : Core_dTerm.t_Value) (rVal : Core_dTerm.t_Value) -> (if (fuel <= 0) then C_MemberLookup_MemberStuck else (let eF = ((Elab_dTypes.v_forceVal ec) eVal) in (let sols = (Elab_dTypes.v_ecSolsP ec) in (let nd_uscrut7 = ((((((((v_labelScan 64) depth) sols) ec) eF) rVal) 0) B_dData_dList.C_List_Nil) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__113) -> (match dtb__113 with
  | { B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = dtb__115 } -> (match dtb__114 with
  | B_dData_dList.C_List_Nil -> (if dtb__115 then C_MemberLookup_MemberAbsent else C_MemberLookup_MemberStuck)
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (match dtb__117 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut18 = ((((((v_memberProofAtLabel (fuel - 1)) depth) ec) eF) rVal) (v_labelCandIdx dtb__116)) in (match nd_uscrut18 with
  | Base_dDiag.C_Check_ErrC (dtb__118) -> C_MemberLookup_MemberStuck
  | Base_dDiag.C_Check_OkC (dtb__119) -> (match dtb__119 with
  | { B_dData_dPair.f_Pair_first = dtb__120; B_dData_dPair.f_Pair_second = dtb__121 } -> (C_MemberLookup_MemberFound (dtb__120, dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (C_MemberLookup_MemberAmbiguous (((B_dData_dList.v_map v_labelCandName) dtb__114)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_MemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
))))))

# 505 "Vuna/Compiler/Elab/Dict.vuna"
let v_memberLookup = (fun (fuel : int) (depth : int) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if (fuel <= 0) then C_MemberLookup_MemberStuck else (let nd_uscrut4 = (v_memberSpine dom) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__122) -> (match dtb__122 with
  | { B_dData_dPair.f_Pair_first = dtb__123; B_dData_dPair.f_Pair_second = dtb__124 } -> (((((v_memberLookupRowLabel fuel) depth) ec) dtb__123) dtb__124)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_MemberLookup_MemberStuck
  | _ -> failwith "DT: impossible branch"
))))

# 615 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_ctxMemberProofUnifyGo = (fun (mc0 : Elab_dTypes.t_Ctx) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (match dtb__125 with
  | { B_dData_dPair.f_Pair_first = dtb__127; B_dData_dPair.f_Pair_second = dtb__128 } -> (let olderDepth = (B_dData_dList.v_length dtb__126) in (let tyVal = ((Core_dEval.v_eval ((B_dData_dList.v_map ((Elab_dTypes.v_refineValue (mc0).Elab_dTypes.f_Ctx_ctxRefVals) Core_dTerm.v_defaultFuel)) (((Elab_dTypes.v_ctxEnvAt dtb__126) 0) olderDepth))) dtb__128) in (match ((((Elab_dMeta.v_convEc mc3) (Elab_dTypes.v_ctxDepth mc0)) tyVal) mc4) with
  | Base_dDiag.C_Check_OkC (dtb__129) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__127, mc2, { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })); B_dData_dPair.f_Pair_second = dtb__129 }))
  | Base_dDiag.C_Check_ErrC (dtb__130) -> (((((v_ctxMemberProofUnifyGo mc0) dtb__126) (mc2 + 1)) mc3) mc4)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctxMemberProofUnify = (fun (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (((((v_ctxMemberProofUnifyGo ctx) (ctx).Elab_dTypes.f_Ctx_ctxItems) 0) ec) dom))

# 628 "Vuna/Compiler/Elab/Dict.vuna"
let v_solveRowMeta = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (m : int) (v : Core_dTerm.t_Value) -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl ec)) (Elab_dTypes.v_ecSolsP ec)) depth) m) B_dData_dList.C_List_Nil) v) with
  | Base_dDiag.C_Check_OkC (dtb__131) -> (Base_dDiag.C_Check_OkC (((Elab_dTypes.v_ecPutSols ec) (Core_dTerm.v_solsList dtb__131))))
  | Base_dDiag.C_Check_ErrC (dtb__132) -> (Base_dDiag.C_Check_ErrC (dtb__132))
  | _ -> failwith "DT: impossible branch"
))

# 690 "Vuna/Compiler/Elab/Dict.vuna"
let v_pendingBucket = (fun (n : int) -> (if (n <= 0) then "0" else (if (n <= 4) then "1-4" else (if (n <= 16) then "5-16" else (if (n <= 64) then "17-64" else "65+")))))

# 889 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_piRigsOfInstGo = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (if ((Elab_dTypes.v_dtInstSym dtb__133) = mc0) then (B_dData_dMaybe.C_Maybe_Just (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> Core_dTerm.C_Rig_Rig0)) (dtb__133).Elab_dTypes.f_DtInst_dtInstTele)) ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> Core_dTerm.C_Rig_RigOmega)) (dtb__133).Elab_dTypes.f_DtInst_dtInstCtx)))) else ((v_piRigsOfInstGo mc0) dtb__134))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 886 "Vuna/Compiler/Elab/Dict.vuna"
let v_piRigsOfInst = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> ((v_piRigsOfInstGo g) (Elab_dTypes.v_ecInsts ec)))

# 906 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_piRigs = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139) -> (B_dData_dList.C_List__x58__x58_ (dtb__137, (v_piRigs dtb__139)))
  | _ -> B_dData_dList.C_List_Nil
))

# 897 "Vuna/Compiler/Elab/Dict.vuna"
let v_piRigsOfGlobal = (fun (ec : Elab_dTypes.t_Ec) (g : string) -> (match ((v_piRigsOfInst ec) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__140) -> dtb__140
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (Elab_dTypes.v_ecGlobalsTbl ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> (v_piRigs dtb__141)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 847 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_renderDictTermAt = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (depth : int) (task : t_DictTermTask) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut4 = task in (match nd_uscrut4 with
  | C_DictTermTask_DictTermSpine (dtb__142, dtb__143, dtb__144) -> (match dtb__143 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (let argTerm = (match ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermValue (dtb__145))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> dtb__151
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Core_dEval.v_quote depth) dtb__145)
  | _ -> failwith "DT: impossible branch"
) in (let r = (match dtb__144 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> dtb__149
  | B_dData_dList.C_List_Nil -> Core_dTerm.C_Rig_RigOmega
  | _ -> failwith "DT: impossible branch"
) in (let restRigs = (match dtb__144 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> dtb__148
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) in ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TApp (dtb__142, argTerm, r)), dtb__146, restRigs))))))
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__142))
  | _ -> failwith "DT: impossible branch"
)
  | C_DictTermTask_DictTermValue (dtb__152) -> (match dtb__152 with
  | Core_dTerm.C_Value_VNeutral (dtb__153) -> (match dtb__153 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__154, dtb__155) -> ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TGlobal (dtb__154)), dtb__155, ((v_piRigsOfGlobal ec) dtb__154))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> (match ((Elab_dTypes.v_forceVal ec) dtb__152) with
  | Core_dTerm.C_Value_VNeutral (dtb__156) -> (match dtb__156 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__157, dtb__158) -> ((((v_renderDictTermAt (fuel - 1)) ec) depth) (C_DictTermTask_DictTermSpine ((Core_dTerm.C_Term_TGlobal (dtb__157)), dtb__158, ((v_piRigsOfGlobal ec) dtb__157))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
)
  | _ -> failwith "DT: impossible branch"
))))

# 844 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictTermOfValueAt = (fun (ec : Elab_dTypes.t_Ec) (depth : int) (v : Core_dTerm.t_Value) -> ((((v_renderDictTermAt 64) ec) depth) (C_DictTermTask_DictTermValue (v))))

# 786 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_substDictTermGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TIf (dtb__159, dtb__160, dtb__161) -> (Core_dTerm.C_Term_TIf ((((v_substDictTermGo mc0) mc1) dtb__159), (((v_substDictTermGo mc0) mc1) dtb__160), (((v_substDictTermGo mc0) mc1) dtb__161)))
  | Core_dTerm.C_Term_TCase (dtb__162, dtb__163) -> (Core_dTerm.C_Term_TCase ((((v_substDictTermGo mc0) mc1) dtb__162), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> (((v_substDictTermAlt mc0) mc1) alt))) dtb__163)))
  | Core_dTerm.C_Term_TRecord (dtb__164, dtb__165) -> (Core_dTerm.C_Term_TRecord (dtb__164, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__165)))
  | Core_dTerm.C_Term_TMk (dtb__166, dtb__167) -> (Core_dTerm.C_Term_TMk (dtb__166, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__167)))
  | Core_dTerm.C_Term_TCon (dtb__168, dtb__169) -> (Core_dTerm.C_Term_TCon (dtb__168, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substDictTermGo mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__169)))
  | Core_dTerm.C_Term_TApp (dtb__170, dtb__171, dtb__172) -> (Core_dTerm.C_Term_TApp ((((v_substDictTermGo mc0) mc1) dtb__170), (((v_substDictTermGo mc0) mc1) dtb__171), dtb__172))
  | Core_dTerm.C_Term_TLam (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> (let slot2 = (let nd_uscrut8 = dtb__175 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> (match dtb__178 with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (match dtb__180 with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> (let bt2 = (match dtb__181 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substDictTermGo mc0) mc1) dtb__184)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__182 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substDictTermGo mc0) (mc1 + 1)) dtb__183)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__173, dtb__174, slot2, dtb__176, (((v_substDictTermGo mc0) (mc1 + 1)) dtb__177))))
  | Core_dTerm.C_Term_TPi (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189) -> (Core_dTerm.C_Term_TPi (dtb__185, dtb__186, dtb__187, (((v_substDictTermGo mc0) mc1) dtb__188), (((v_substDictTermGo mc0) (mc1 + 1)) dtb__189)))
  | Core_dTerm.C_Term_TMeta (dtb__190) -> (match ((Core_dTerm.v_metaLookup dtb__190) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> mc2
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> (match (((v_dictTermOfValueAt mc0) mc1) dtb__191) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (if (if ((Core_dTerm.v_hasFreeTermVar mc1) dtb__192) then true else (Core_dTerm.v_hasNegativeVar dtb__192)) then mc2 else dtb__192)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let soln0 = ((Core_dEval.v_quote mc1) dtb__191) in (if (if ((Core_dTerm.v_hasFreeTermVar mc1) soln0) then true else (Core_dTerm.v_hasNegativeVar soln0)) then mc2 else soln0))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc2
))
# 831 "Vuna/Compiler/Elab/Dict.vuna"
and v_substDictTermAlt = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_CaseAlt) -> (match mc2 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__193; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__194; Core_dTerm.f_CaseAlt_caseAltBody = dtb__195 } -> { Core_dTerm.f_CaseAlt_caseAltName = dtb__193; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__194; Core_dTerm.f_CaseAlt_caseAltBody = (((v_substDictTermGo mc0) (mc1 + (B_dData_dList.v_length dtb__194))) dtb__195) }
  | _ -> failwith "DT: impossible branch"
))

# 783 "Vuna/Compiler/Elab/Dict.vuna"
let v_substDictTerm = (fun (ec : Elab_dTypes.t_Ec) (t : Core_dTerm.t_Term) -> (((v_substDictTermGo ec) 0) t))

# 914 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_joinRestInstNames = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (String.concat "" [", "; (Elab_dTypes.v_dtInstName dtb__196); (v_joinRestInstNames dtb__197)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 910 "Vuna/Compiler/Elab/Dict.vuna"
let v_joinInstNames = (fun (mc0 : Elab_dTypes.t_DtInst B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> ((Elab_dTypes.v_dtInstName dtb__198) ^ (v_joinRestInstNames dtb__199))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 936 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_ctorParamKindsFuel = (fun (fuel : int) (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) (lvl : int) (acc : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.v_reverse acc) else (match v with
  | Core_dTerm.C_Value_VPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if dtb__201 then (((((v_ctorParamKindsFuel (fuel - 1)) ec) ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_applyClosure dtb__204) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__200, lvl, B_dData_dList.C_List_Nil))))))) (lvl + 1)) (B_dData_dList.C_List__x58__x58_ (dtb__203, acc))) else (B_dData_dList.v_reverse acc))
  | _ -> (B_dData_dList.v_reverse acc)
)))

# 933 "Vuna/Compiler/Elab/Dict.vuna"
let v_ctorParamKinds = (fun (ec : Elab_dTypes.t_Ec) (v : Core_dTerm.t_Value) (lvl : int) (acc : Core_dTerm.t_Value B_dData_dList.t_List) -> (((((v_ctorParamKindsFuel 64) ec) v) lvl) acc))

# 952 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictFamilyNameOf = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__205) -> (match dtb__205 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__206, dtb__207) -> (B_dData_dMaybe.C_Maybe_Just (dtb__206))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 920 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgKinds = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (match ((v_dictFamilyNameOf ec) dom) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__208) -> (match ((Elab_dMeta.v_dtDataLookup dtb__208) (Elab_dTypes.v_ecDatas ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__209) -> (match (Elab_dTypes.v_dtDataCtors dtb__209) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (B_dData_dMaybe.C_Maybe_Just (((((v_ctorParamKinds ec) ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__210)))) 0) B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 946 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgKind = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((v_dictArgKinds ec) dom) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> (match dtb__212 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> (B_dData_dMaybe.C_Maybe_Just (dtb__213))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 973 "Vuna/Compiler/Elab/Dict.vuna"
let v_neutralHeadOrSelf = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__215) -> (match dtb__215 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__216, dtb__217) -> (match dtb__217 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__216, B_dData_dList.C_List_Nil))))
  | _ -> mc0
)
  | _ -> mc0
)
  | _ -> mc0
))

# 960 "Vuna/Compiler/Elab/Dict.vuna"
let v_argHeadMatchesKind = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) (ctx : Elab_dTypes.t_Ctx) (forced : Core_dTerm.t_Value) (argKind : Core_dTerm.t_Value) -> (let nd_uscrut5 = (v_neutralHeadOrSelf forced) in (match nd_uscrut5 with
  | Core_dTerm.C_Value_VNeutral (dtb__220) -> (match dtb__220 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__221, dtb__222) -> (match dtb__222 with
  | B_dData_dList.C_List_Nil -> (match (((Elab_dMeta.v_typeHeadLookup globals) ec) dtb__221) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (match ((((Elab_dMeta.v_convEc ec) (Elab_dTypes.v_ctxDepth ctx)) argKind) ((Elab_dTypes.v_forceVal ec) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__223))) with
  | Base_dDiag.C_Check_OkC (dtb__224) -> true
  | Base_dDiag.C_Check_ErrC (dtb__225) -> false
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

# 979 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictClassArgs = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (let nd_uscrut2 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut2 with
  | Core_dTerm.C_Value_VNeutral (dtb__226) -> (match dtb__226 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__227, dtb__228) -> dtb__228
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)))

# 985 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictClassArg = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (match ((v_dictClassArgs ec) dom) with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (B_dData_dMaybe.C_Maybe_Just (dtb__229))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Elab/Dict.vuna"
let v_missingInstance = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let forced = ((Elab_dTypes.v_forceVal ec) dom) in (let sd = (Core_dEval.v_showValue forced) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then (let td = (match ((v_dictClassArg ec) forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__231) -> ((v_showResolvedValue ec) dtb__231)
  | B_dData_dMaybe.C_Maybe_Nothing -> sd
  | _ -> failwith "DT: impossible branch"
) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_InterpNoInstance (td))) td)) else (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound (sd))) sd)))))

# 232 "Vuna/Compiler/Elab/Dict.vuna"
let v_finishInstanceSearch = (fun (mc0 : Core_dTerm.t_Value) (mc1 : Base_dSource.t_Span) (mc2 : t_InstMatch B_dData_dList.t_List) (mc3 : Elab_dTypes.t_Ec) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (match dtb__233 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (dtb__232).f_InstMatch_instMatchTerm; B_dData_dPair.f_Pair_second = mc3 }))
  | _ -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["search-ambig: dom="; (Core_dEval.v_showValue mc0); " cands="; ((B_dData_dString.v_join ",") ((B_dData_dList.v_map (fun (x : t_InstMatch) -> (Elab_dTypes.v_dtInstName (v_instMatchInst x)))) mc2))])) else 0) in (let sd = (Core_dEval.v_showValue mc0) in (let names = (v_joinInstNames ((B_dData_dList.v_map v_instMatchInst) mc2)) in ((((Base_dDiagnostics_dTc.v_tcErr2 mc1) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousInstance (sd, names))) sd) names))))
)
  | B_dData_dList.C_List_Nil -> (((v_missingInstance mc3) mc0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Elab/Dict.vuna"
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

# 267 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedInterpGoal = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedInterpGoalGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1006 "Vuna/Compiler/Elab/Dict.vuna"
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
# 1022 "Vuna/Compiler/Elab/Dict.vuna"
and v_anyValueHasRigidNVar = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : int) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if (((v_valueHasRigidNVar mc0) mc1) dtb__259) then true else (((v_anyValueHasRigidNVar mc0) mc1) dtb__260))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1003 "Vuna/Compiler/Elab/Dict.vuna"
let v_isRigidClassArg = (fun (ec : Elab_dTypes.t_Ec) (arg : Core_dTerm.t_Value) -> (((v_valueHasRigidNVar ec) 64) arg))

# 998 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyRigidClassArg = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (if ((v_isRigidClassArg mc0) dtb__261) then true else ((v_anyRigidClassArg mc0) dtb__262))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 995 "Vuna/Compiler/Elab/Dict.vuna"
let v_isRigidDictArg = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((v_anyRigidClassArg ec) ((v_dictClassArgs ec) dom)))

# 313 "Vuna/Compiler/Elab/Dict.vuna"
let v_rigidSearchFast = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> (if ((v_isRigidDictArg ec) dom) then (v_allInstancesMono ((v_searchCandidates ec) dom)) else false))

# 64 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_searchInstFuel = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (fuel : int) (ec0 : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (let ec = ((Elab_dTypes.v_ecBump ec0) "elab.inst.search") in (if (fuel <= 0) then (((v_missingInstance ec) dom) sp) else (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["search: dom="; (Core_dEval.v_showValue dom); " rigid="; (if ((v_rigidSearchFast ec) dom) then "T" else "F"); " insts="; (bi_strFromInt (B_dData_dList.v_length (Elab_dTypes.v_ecInsts ec)))])) else 0) in (match ((((v_localDictLookup ctx) 0) dom) ec) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__263) -> (Base_dDiag.C_Check_OkC (dtb__263))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (if ((v_rigidSearchFast ec) dom) then (B_dData_dBool.v_not ((v_viaCandidateExists ec) dom)) else false) then (((v_missingInstance ec) dom) sp) else (let nd_uscrut8 = ((((((((v_matchInstances globals) ctx) fuel) ec) dom) sp) (v_specificInstances ((v_searchCandidates ec) dom))) B_dData_dList.C_List_Nil) in (match nd_uscrut8 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (match dtb__264 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut14 = ((((((v_tryViaDict globals) ctx) (fuel - 1)) dtb__265) dom) sp) in (match nd_uscrut14 with
  | Base_dDiag.C_Check_ErrC (dtb__266) -> (Base_dDiag.C_Check_ErrC (dtb__266))
  | Base_dDiag.C_Check_OkC (dtb__267) -> (match dtb__267 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((((((v_matchInstances globals) ctx) fuel) dtb__265) dom) sp) (v_blanketInstances ((v_searchCandidates ec) dom))) B_dData_dList.C_List_Nil) with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> ((((v_finishInstanceSearch dom) sp) dtb__268) dtb__269)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__270) -> (Base_dDiag.C_Check_OkC (dtb__270))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((((v_finishInstanceSearch dom) sp) dtb__264) dtb__265)
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
# 189 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryViaDict = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (fuel : int) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)) else (let nd_uscrut6 = ((Elab_dTypes.v_forceVal ec) dom) in (match nd_uscrut6 with
  | Core_dTerm.C_Value_VNeutral (dtb__271) -> (match dtb__271 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__272, dtb__273) -> (if ((v_viaCandidateExists ec) dom) then ((((((((v_tryViaArgs globals) ctx) (fuel - 1)) ec) sp) dtb__272) dtb__273) 0) else (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
)
  | _ -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
))))
# 199 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryViaArgs = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (fuel : int) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) (fam : string) (args : Core_dTerm.t_Value B_dData_dList.t_List) (idx : int) -> (if (fuel <= 0) then (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)) else (match args with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dList.C_List__x58__x58_ (dtb__274, dtb__275) -> (match (((v_viaWrapperOf ec) fam) dtb__274) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_tryViaArgs globals) ctx) (fuel - 1)) ec) sp) fam) dtb__275) (idx + 1))
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> ((Base_dCommon.v_bind ((((((v_searchInstFuel globals) ctx) (fuel - 1)) ec) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (fam, (((v_replaceAt idx) dtb__276) args)))))) sp)) (fun (p : (Core_dTerm.t_Term, Elab_dTypes.t_Ec) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 364 "Vuna/Compiler/Elab/Dict.vuna"
and v_matchInstances = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Core_dTerm.t_Value) (mc5 : Base_dSource.t_Span) (mc6 : Elab_dTypes.t_DtInst B_dData_dList.t_List) (mc7 : t_InstMatch B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (let nd_uscrut11 = (((((((v_tryMatchInst mc0) mc1) mc2) mc3) dtb__277) mc4) mc5) in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_matchInstances mc0) mc1) mc2) mc3) mc4) mc5) dtb__278) mc7)
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> (match dtb__279 with
  | { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } -> ((((((((v_matchInstances mc0) mc1) mc2) dtb__281) mc4) mc5) dtb__278) (B_dData_dList.C_List__x58__x58_ ({ f_InstMatch_instMatchInst = dtb__277; f_InstMatch_instMatchTerm = dtb__280 }, mc7)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc7); B_dData_dPair.f_Pair_second = mc3 }
  | _ -> failwith "DT: impossible branch"
))
# 373 "Vuna/Compiler/Elab/Dict.vuna"
and v_tryMatchInst = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (fuel : int) (ec : Elab_dTypes.t_Ec) (inst : Elab_dTypes.t_DtInst) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((((v_allocTeleMetas (inst).Elab_dTypes.f_DtInst_dtInstSpan) ctx) ec) (inst).Elab_dTypes.f_DtInst_dtInstTele) with
  | { B_dData_dPair.f_Pair_first = dtb__282; B_dData_dPair.f_Pair_second = dtb__283 } -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["inst-try: "; (Elab_dTypes.v_dtInstName inst); " head="; (Core_dTerm.v_showTerm (inst).Elab_dTypes.f_DtInst_dtInstHead); " tele="; (bi_strFromInt (B_dData_dList.v_length (inst).Elab_dTypes.f_DtInst_dtInstTele))])) else 0) in (let hd = ((Core_dEval.v_eval ((B_dData_dList.v_map (fun (m : int) -> (Core_dTerm.C_Value_VMeta (m, B_dData_dList.C_List_Nil)))) dtb__282)) (inst).Elab_dTypes.f_DtInst_dtInstHead) in (match (((((Core_dConv.v_conv (Elab_dTypes.v_ecDefTbl dtb__283)) (Elab_dTypes.v_ecSolsP dtb__283)) (Elab_dTypes.v_ctxDepth ctx)) dom) hd) with
  | Base_dDiag.C_Check_ErrC (dtb__284) -> (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Elab.Dict") then (((dtp_log_emit 3) "Vuna.Compiler.Elab.Dict") (String.concat "" ["inst-conv-err: "; (Elab_dTypes.v_dtInstName inst); " dom="; (Core_dEval.v_showValue dom); " hd="; (Core_dEval.v_showValue hd)])) else 0) in B_dData_dMaybe.C_Maybe_Nothing)
  | Base_dDiag.C_Check_OkC (dtb__285) -> (let ec2 = ((Elab_dTypes.v_ecPutSols dtb__283) (Core_dTerm.v_solsList dtb__285)) in (match ((v_solveTeleMetas ec2) dtb__282) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__286) -> (let teleArgs = ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> { B_dData_dPair.f_Pair_first = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) ((Elab_dTypes.v_forceVal ec2) v)); B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_Rig0 })) (B_dData_dList.v_reverse dtb__286)) in (let env2 = ((B_dData_dList.v_map (fun (v : Core_dTerm.t_Value) -> ((Elab_dTypes.v_forceVal ec2) v))) dtb__286) in (let ctxVals = ((B_dData_dList.v_map (fun (t : Core_dTerm.t_Term) -> ((Elab_dTypes.v_forceVal ec2) ((Core_dEval.v_eval env2) t)))) (inst).Elab_dTypes.f_DtInst_dtInstCtx) in (let nd_uscrut20 = (((((((v_solveDictCtxs globals) ctx) (fuel - 1)) ec2) sp) ctxVals) B_dData_dList.C_List_Nil) in (match nd_uscrut20 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__287) -> (match dtb__287 with
  | { B_dData_dPair.f_Pair_first = dtb__288; B_dData_dPair.f_Pair_second = dtb__289 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ((Elab_dMeta.v_foldAppTerms (Core_dTerm.C_Term_TGlobal ((Elab_dTypes.v_dtInstSym inst)))) ((B_dData_dList.v_append teleArgs) dtb__288)); B_dData_dPair.f_Pair_second = dtb__289 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 428 "Vuna/Compiler/Elab/Dict.vuna"
and v_solveDictCtxs = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : int) (mc3 : Elab_dTypes.t_Ec) (mc4 : Base_dSource.t_Span) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) (mc6 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__290, dtb__291) -> (let nd_uscrut10 = ((((((v_searchInstFuel mc0) mc1) mc2) mc3) dtb__290) mc4) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__292) -> (match dtb__292 with
  | { B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = dtb__294 } -> (((((((v_solveDictCtxs mc0) mc1) mc2) dtb__294) mc4) dtb__291) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__293; B_dData_dPair.f_Pair_second = Core_dTerm.C_Rig_RigOmega }, mc6)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__295) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc6); B_dData_dPair.f_Pair_second = mc3 }))
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchInstanceIn = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> ((((((v_searchInstFuel globals) ctx) 16) ec) dom) sp))

# 48 "Vuna/Compiler/Elab/Dict.vuna"
let v_searchInstance = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) (sp : Base_dSource.t_Span) -> (((((v_searchInstanceIn B_dData_dList.C_List_Nil) Elab_dTypes.v_emptyCtx) ec) dom) sp))

# 1028 "Vuna/Compiler/Elab/Dict.vuna"
let v_eqClassName = "Base.Trait.Eq.Eq"

# 1031 "Vuna/Compiler/Elab/Dict.vuna"
let v_ordClassName = "Base.Trait.Ord.Ord"

# 1034 "Vuna/Compiler/Elab/Dict.vuna"
let v_numClassName = "Base.Trait.Num.Num"

# 1040 "Vuna/Compiler/Elab/Dict.vuna"
let v_classHasProjection = (fun (fullClassName : string) (short : string) (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((v_findClass fullClassName) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__296) -> (((Elab_dPrelude.v_classMethodProjection (dtb__296).Elab_dTypes.f_DtClass_dtClassMethods) short) = name)
  | _ -> failwith "DT: impossible branch"
))

# 1048 "Vuna/Compiler/Elab/Dict.vuna"
let v_findEqClass = (fun (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((Elab_dMeta.v_findClassByMethod name) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> (B_dData_dMaybe.C_Maybe_Just (dtb__297))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findClass v_eqClassName) (Elab_dTypes.v_ecClasses ec))
  | _ -> failwith "DT: impossible branch"
))

# 1054 "Vuna/Compiler/Elab/Dict.vuna"
let v_findOrdClass = (fun (name : string) (ec : Elab_dTypes.t_Ec) -> (match ((Elab_dMeta.v_findClassByMethod name) (Elab_dTypes.v_ecClasses ec)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> (B_dData_dMaybe.C_Maybe_Just (dtb__298))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_findClass v_ordClassName) (Elab_dTypes.v_ecClasses ec))
  | _ -> failwith "DT: impossible branch"
))

# 1061 "Vuna/Compiler/Elab/Dict.vuna"
let v_methodShortOf = (fun (name : string) -> (B_dData_dPair.v_secondOf (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name))))

# 1075 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpShort = (fun (mc0 : t_BuiltinOp) -> (match mc0 with
  | { f_BuiltinOp_boShort = dtb__299; f_BuiltinOp_boOp = dtb__300; f_BuiltinOp_boRuntime = dtb__301 } -> dtb__299
  | _ -> failwith "DT: impossible branch"
))

# 1078 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpName = (fun (mc0 : t_BuiltinOp) -> (match mc0 with
  | { f_BuiltinOp_boShort = dtb__302; f_BuiltinOp_boOp = dtb__303; f_BuiltinOp_boRuntime = dtb__304 } -> dtb__303
  | _ -> failwith "DT: impossible branch"
))

# 1081 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpRuntime = (fun (mc0 : t_BuiltinOp) -> (match mc0 with
  | { f_BuiltinOp_boShort = dtb__305; f_BuiltinOp_boOp = dtb__306; f_BuiltinOp_boRuntime = dtb__307 } -> dtb__307
  | _ -> failwith "DT: impossible branch"
))

# 1084 "Vuna/Compiler/Elab/Dict.vuna"
let v_eqMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "=="; f_BuiltinOp_boOp = "=="; f_BuiltinOp_boRuntime = "eq" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "/="; f_BuiltinOp_boOp = "/="; f_BuiltinOp_boRuntime = "neq" }, B_dData_dList.C_List_Nil))))

# 1087 "Vuna/Compiler/Elab/Dict.vuna"
let v_ordMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "<"; f_BuiltinOp_boOp = "<"; f_BuiltinOp_boRuntime = "lt" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "<="; f_BuiltinOp_boOp = "<="; f_BuiltinOp_boRuntime = "le" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = ">"; f_BuiltinOp_boOp = ">"; f_BuiltinOp_boRuntime = "gt" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = ">="; f_BuiltinOp_boOp = ">="; f_BuiltinOp_boRuntime = "ge" }, B_dData_dList.C_List_Nil))))))))

# 1096 "Vuna/Compiler/Elab/Dict.vuna"
let v_numMethodOps = (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "+"; f_BuiltinOp_boOp = "+"; f_BuiltinOp_boRuntime = "add" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "-"; f_BuiltinOp_boOp = "-"; f_BuiltinOp_boRuntime = "sub" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "*"; f_BuiltinOp_boOp = "*"; f_BuiltinOp_boRuntime = "mul" }, (B_dData_dList.C_List__x58__x58_ ({ f_BuiltinOp_boShort = "/"; f_BuiltinOp_boOp = "/"; f_BuiltinOp_boRuntime = "div" }, B_dData_dList.C_List_Nil))))))))

# 1114 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_lookupBuiltinOpShort = (fun (mc0 : string) (mc1 : t_BuiltinOp B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__308, dtb__309) -> (if ((v_builtinOpShort dtb__308) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__308)) else ((v_lookupBuiltinOpShort mc0) dtb__309))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1119 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_lookupBuiltinOpProjection = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : string) (mc2 : string) (mc3 : t_BuiltinOp B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__310, dtb__311) -> (if ((((v_classHasProjection mc1) (v_builtinOpShort dtb__310)) mc2) mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__310)) else ((((v_lookupBuiltinOpProjection mc0) mc1) mc2) dtb__311))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1108 "Vuna/Compiler/Elab/Dict.vuna"
let v_builtinOpOf = (fun (ec : Elab_dTypes.t_Ec) (className : string) (name : string) (ops : t_BuiltinOp B_dData_dList.t_List) -> (match ((v_lookupBuiltinOpShort (v_methodShortOf name)) ops) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__312) -> (B_dData_dMaybe.C_Maybe_Just (dtb__312))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_lookupBuiltinOpProjection ec) className) name) ops)
  | _ -> failwith "DT: impossible branch"
))

# 1129 "Vuna/Compiler/Elab/Dict.vuna"
let v_isEqMethod = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((v_builtinOpOf ec) v_eqClassName) name) v_eqMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1135 "Vuna/Compiler/Elab/Dict.vuna"
let v_isCmpMethod = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((v_builtinOpOf ec) v_ordClassName) name) v_ordMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__314) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 1142 "Vuna/Compiler/Elab/Dict.vuna"
let v_numMethodOpName = (fun (ec : Elab_dTypes.t_Ec) (name : string) -> (match ((((v_builtinOpOf ec) v_numClassName) name) v_numMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__315) -> (B_dData_dMaybe.C_Maybe_Just ((v_builtinOpName dtb__315)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1149 "Vuna/Compiler/Elab/Dict.vuna"
let v_projectionFor = (fun (cls : Elab_dTypes.t_DtClass) (short : string) -> ((Elab_dPrelude.v_classMethodProjection (cls).Elab_dTypes.f_DtClass_dtClassMethods) short))

# 1192 "Vuna/Compiler/Elab/Dict.vuna"
let v_deferEqDict = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (mname : string) (tyTerm : Core_dTerm.t_Term) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (dictTy : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (let m = (Elab_dTypes.v_ecNext ec) in (match (((Elab_dMetaSpans.v_newMetaAt sp) ctx) ec) with
  | { B_dData_dPair.f_Pair_first = dtb__316; B_dData_dPair.f_Pair_second = dtb__317 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__316, Core_dTerm.C_Rig_RigOmega)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ((((((Elab_dTypes.v_ecAddConstraint dtb__317) Elab_dTypes.C_ConstraintKind_CkDict) m) dictTy) (B_dData_dMaybe.C_Maybe_Just (sp))) (Elab_dTypes.v_ctxDepth ctx)) } }))))
  | _ -> failwith "DT: impossible branch"
)))

# 1211 "Vuna/Compiler/Elab/Dict.vuna"
let v_cmpTypeTag = (fun (mc0 : string) -> (if (mc0 = "Int") then (B_dData_dMaybe.C_Maybe_Just ("int")) else (if (mc0 = "String") then (B_dData_dMaybe.C_Maybe_Just ("str")) else (if (mc0 = "Float") then (B_dData_dMaybe.C_Maybe_Just ("float")) else (if (Base_dIntrinsics.v_isBoolCanonical mc0) then (B_dData_dMaybe.C_Maybe_Just ("bool")) else B_dData_dMaybe.C_Maybe_Nothing)))))

# 1218 "Vuna/Compiler/Elab/Dict.vuna"
let v_cmpRuntimeName = (fun (sp : Base_dSource.t_Span) (method_ : string) (tyName : string) -> (match ((v_lookupBuiltinOpShort (v_methodShortOf method_)) v_ordMethodOps) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__318) -> (match (v_cmpTypeTag tyName) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__319) -> (Base_dDiag.C_Check_OkC ((String.concat "" ["bi_"; (v_builtinOpRuntime dtb__318); "_"; dtb__319])))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor (method_, tyName))) method_) tyName)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor (method_, tyName))) method_) tyName)
  | _ -> failwith "DT: impossible branch"
))

# 1237 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_anyUnsolvedMetaArg = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__320, dtb__321) -> (if ((Core_dTerm.v_hasUnsolvedMetaValue (Elab_dTypes.v_ecSolsP mc0)) ((Elab_dTypes.v_forceVal mc0) dtb__320)) then true else ((v_anyUnsolvedMetaArg mc0) dtb__321))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_resolveRowGoalsCtxGo = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ctx) (mc2 : Base_dSource.t_Span) (mc3 : Elab_dTypes.t_Constraint B_dData_dList.t_List) (mc4 : Elab_dTypes.t_Ec) (mc5 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__322, dtb__323) -> (match dtb__322 with
  | { Elab_dTypes.f_Constraint_conId = dtb__324; Elab_dTypes.f_Constraint_conKind = dtb__325; Elab_dTypes.f_Constraint_conMeta = dtb__326; Elab_dTypes.f_Constraint_conDom = dtb__327; Elab_dTypes.f_Constraint_conSpan = dtb__328; Elab_dTypes.f_Constraint_conDepth = dtb__329 } -> (if ((v_isMemberDomain mc4) dtb__327) then (match ((((v_memberLookup 64) (Elab_dTypes.v_ctxDepth mc1)) mc4) dtb__327) with
  | C_MemberLookup_MemberFound (dtb__330, dtb__331) -> (match ((((v_solveRowMeta dtb__331) (Elab_dTypes.v_ctxDepth mc1)) dtb__326) dtb__330) with
  | Base_dDiag.C_Check_OkC (dtb__332) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) dtb__332) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__333) -> (Base_dDiag.C_Check_ErrC (dtb__333))
  | _ -> failwith "DT: impossible branch"
)
  | C_MemberLookup_MemberAbsent -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | C_MemberLookup_MemberAmbiguous (dtb__334) -> ((((Base_dDiagnostics_dTc.v_tcErr2 mc2) (Base_dDiagnostics_dTc.C_TcErr_AmbiguousInstance ("effect instance", ((B_dData_dString.v_join ", ") dtb__334)))) "effect instance") ((B_dData_dString.v_join ", ") dtb__334))
  | C_MemberLookup_MemberStuck -> (let nd_uscrut15 = (((v_ctxMemberProofUnify mc1) mc4) dtb__327) in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dTc.v_tcErr1 mc2) (Base_dDiagnostics_dTc.C_TcErr_NoInstanceFound ("row membership"))) "row membership")
  | B_dData_dMaybe.C_Maybe_Just (dtb__335) -> (match dtb__335 with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> (match ((((v_solveRowMeta dtb__337) (Elab_dTypes.v_ctxDepth mc1)) dtb__326) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__336)) with
  | Base_dDiag.C_Check_OkC (dtb__338) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) dtb__338) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__339) -> (Base_dDiag.C_Check_ErrC (dtb__339))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) else (match ((v_dictClassArgs mc4) dtb__327) with
  | B_dData_dList.C_List_Nil -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__322, mc5)))
  | dtb__340 -> (if ((v_anyUnsolvedMetaArg mc4) dtb__340) then ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__322, mc5))) else (if (if ((v_isRigidDictArg mc4) dtb__327) then (v_allInstancesMono (Elab_dTypes.v_ecInsts mc4)) else false) then ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__322, mc5))) else (let nd_uscrut16 = (((((v_searchInstanceIn mc0) mc1) mc4) ((Elab_dTypes.v_forceVal mc4) dtb__327)) mc2) in (match nd_uscrut16 with
  | Base_dDiag.C_Check_ErrC (dtb__341) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__322, mc5)))
  | Base_dDiag.C_Check_OkC (dtb__342) -> (match dtb__342 with
  | { B_dData_dPair.f_Pair_first = dtb__343; B_dData_dPair.f_Pair_second = dtb__344 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__344)) (Elab_dTypes.v_ecSolsP dtb__344)) (Elab_dTypes.v_ctxDepth mc1)) dtb__326) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval (Elab_dTypes.v_ctxEnv mc1)) dtb__343)) with
  | Base_dDiag.C_Check_OkC (dtb__345) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) ((Elab_dTypes.v_ecPutSols dtb__344) (Core_dTerm.v_solsList dtb__345))) mc5)
  | Base_dDiag.C_Check_ErrC (dtb__346) -> ((((((v_resolveRowGoalsCtxGo mc0) mc1) mc2) dtb__323) mc4) (B_dData_dList.C_List__x58__x58_ (dtb__322, mc5)))
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

# 634 "Vuna/Compiler/Elab/Dict.vuna"
let v_resolveRowGoalsCtx = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (ec : Elab_dTypes.t_Ec) (sp : Base_dSource.t_Span) -> ((((((v_resolveRowGoalsCtxGo globals) ctx) sp) (Elab_dTypes.v_ecPendingList ec)) ec) B_dData_dList.C_List_Nil))

# 748 "Vuna/Compiler/Elab/Dict.vuna"
let v_tryResolveDictGoal = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Elab_dTypes.t_Ec) (mc2 : Elab_dTypes.t_Constraint) (mc3 : Core_dTerm.t_Value) -> (match mc2 with
  | { Elab_dTypes.f_Constraint_conId = dtb__347; Elab_dTypes.f_Constraint_conKind = dtb__348; Elab_dTypes.f_Constraint_conMeta = dtb__349; Elab_dTypes.f_Constraint_conDom = dtb__350; Elab_dTypes.f_Constraint_conSpan = dtb__351; Elab_dTypes.f_Constraint_conDepth = dtb__352 } -> (if (dtb__352 > 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((v_isMemberDomain mc1) dtb__350) then (match ((((v_memberLookup 64) 0) mc1) dtb__350) with
  | C_MemberLookup_MemberFound (dtb__353, dtb__354) -> (match ((((v_solveRowMeta dtb__354) dtb__352) dtb__349) dtb__353) with
  | Base_dDiag.C_Check_OkC (dtb__355) -> (B_dData_dMaybe.C_Maybe_Just (dtb__355))
  | Base_dDiag.C_Check_ErrC (dtb__356) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | C_MemberLookup_MemberAbsent -> B_dData_dMaybe.C_Maybe_Nothing
  | C_MemberLookup_MemberAmbiguous (dtb__357) -> B_dData_dMaybe.C_Maybe_Nothing
  | C_MemberLookup_MemberStuck -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else (match ((v_dictClassArgs mc1) mc3) with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | dtb__358 -> (if ((v_anyUnsolvedMetaArg mc1) dtb__358) then B_dData_dMaybe.C_Maybe_Nothing else (if (if ((v_isRigidDictArg mc1) mc3) then (v_allInstancesMono (Elab_dTypes.v_ecInsts mc1)) else false) then B_dData_dMaybe.C_Maybe_Nothing else (let nd_uscrut11 = (((v_searchInstance mc1) mc3) { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_ErrC (dtb__359) -> B_dData_dMaybe.C_Maybe_Nothing
  | Base_dDiag.C_Check_OkC (dtb__360) -> (match dtb__360 with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> (match ((((((Core_dConv.v_solveMeta (Elab_dTypes.v_ecDefTbl dtb__362)) (Elab_dTypes.v_ecSolsP dtb__362)) dtb__352) dtb__349) B_dData_dList.C_List_Nil) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__361)) with
  | Base_dDiag.C_Check_OkC (dtb__363) -> (B_dData_dMaybe.C_Maybe_Just (((Elab_dTypes.v_ecPutSols dtb__362) (Core_dTerm.v_solsList dtb__363))))
  | Base_dDiag.C_Check_ErrC (dtb__364) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
)))
  | _ -> failwith "DT: impossible branch"
))

# 699 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_resolveDictGoalsFuel = (fun (fuel : int) (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec0 : Elab_dTypes.t_Ec) -> (if (fuel <= 0) then ec0 else (let nd_uscrut3 = (Elab_dTypes.v_ecPopPending ec0) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__365) -> (match dtb__365 with
  | { B_dData_dPair.f_Pair_first = dtb__366; B_dData_dPair.f_Pair_second = dtb__367 } -> (match dtb__366 with
  | { Elab_dTypes.f_Constraint_conId = dtb__368; Elab_dTypes.f_Constraint_conKind = dtb__369; Elab_dTypes.f_Constraint_conMeta = dtb__370; Elab_dTypes.f_Constraint_conDom = dtb__371; Elab_dTypes.f_Constraint_conSpan = dtb__372; Elab_dTypes.f_Constraint_conDepth = dtb__373 } -> (let ec1 = ((Elab_dTypes.v_ecBump dtb__367) "elab.dict.round") in (match ((Core_dTerm.v_metaLookup dtb__370) (Elab_dTypes.v_ecSolTbl ec1)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let solsNow = (Elab_dTypes.v_ecSolsCountOf ec1) in (match ((Elab_dTypes.v_ecTriedAt ec1) dtb__368) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__375) -> (if (dtb__375 = solsNow) then (let ec2 = (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1) in ((Elab_dTypes.v_ecPushPending ec2) dtb__366)) else (let forced = ((Elab_dTypes.v_forceVal ec1) dtb__371) in (let kept = { Elab_dTypes.f_Constraint_conId = dtb__368; Elab_dTypes.f_Constraint_conKind = dtb__369; Elab_dTypes.f_Constraint_conMeta = dtb__370; Elab_dTypes.f_Constraint_conDom = (if ((v_isMemberDomain ec1) dtb__371) then dtb__371 else forced); Elab_dTypes.f_Constraint_conSpan = dtb__372; Elab_dTypes.f_Constraint_conDepth = dtb__373 } in (let solsTried = (Elab_dTypes.v_ecSolsCountOf ec1) in (match ((((v_tryResolveDictGoal globals) ec1) dtb__366) forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__376) -> (((v_resolveDictGoalsFuel (fuel - 1)) globals) dtb__376)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let ec2 = (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1) in (let ec3 = (((Elab_dTypes.v_ecRecordTried ec2) dtb__368) solsTried) in ((Elab_dTypes.v_ecPushPending ec3) kept)))
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal ec1) dtb__371) in (let kept = { Elab_dTypes.f_Constraint_conId = dtb__368; Elab_dTypes.f_Constraint_conKind = dtb__369; Elab_dTypes.f_Constraint_conMeta = dtb__370; Elab_dTypes.f_Constraint_conDom = (if ((v_isMemberDomain ec1) dtb__371) then dtb__371 else forced); Elab_dTypes.f_Constraint_conSpan = dtb__372; Elab_dTypes.f_Constraint_conDepth = dtb__373 } in (let solsTried = (B_dData_dList.v_length (Elab_dTypes.v_ecSols ec1)) in (match ((((v_tryResolveDictGoal globals) ec1) dtb__366) forced) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__377) -> (((v_resolveDictGoalsFuel (fuel - 1)) globals) dtb__377)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let ec2 = (((v_resolveDictGoalsFuel (fuel - 1)) globals) ec1) in (let ec3 = (((Elab_dTypes.v_ecRecordTried ec2) dtb__368) solsTried) in ((Elab_dTypes.v_ecPushPending ec3) kept)))
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

# 678 "Vuna/Compiler/Elab/Dict.vuna"
let v_resolveDictGoals = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ec : Elab_dTypes.t_Ec) -> (let n = (Elab_dTypes.v_ecPendingCount ec) in (if (Elab_dTypes.v_ecDictPassIdle ec) then ec else (Elab_dTypes.v_ecPutPassMarker (((v_resolveDictGoalsFuel (n + 1)) globals) ((Elab_dTypes.v_ecBump ec) ("elab.dict.pending.b" ^ (v_pendingBucket n))))))))

# 1231 "Vuna/Compiler/Elab/Dict.vuna"
let v_dictArgUnsolvedMeta = (fun (ec : Elab_dTypes.t_Ec) (dom : Core_dTerm.t_Value) -> ((v_anyUnsolvedMetaArg ec) ((v_dictClassArgs ec) dom)))

# 1162 "Vuna/Compiler/Elab/Dict.vuna"
let v_specializeEqTy = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (name : string) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (aTy : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (match (Elab_dPrelude.v_builtinEqTyName ((Elab_dTypes.v_forceVal ec) aTy)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> ((Base_dCommon.v_bind ((Elab_dPrelude.v_eqRuntimeName (v_methodShortOf name)) dtb__378)) (fun (rt : string) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (rt)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_findEqClass name) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let st = (Core_dEval.v_showValue ((Elab_dTypes.v_forceVal ec) aTy)) in (((Base_dDiagnostics_dTc.v_tcErr1 sp) (Base_dDiagnostics_dTc.C_TcErr_EqRequiresEvidence (st))) st))
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (let mname = (if (if (name = "==") then true else (name = "/=")) then ((v_projectionFor dtb__379) (v_methodShortOf name)) else name) in (let tyTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) aTy) in (let dictTy = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__379)), (B_dData_dList.C_List__x58__x58_ (aTy, B_dData_dList.C_List_Nil)))))) in (if ((v_dictArgUnsolvedMeta ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (let nd_uscrut14 = (((((v_searchInstanceIn globals) ctx) ec) dictTy) sp) in (match nd_uscrut14 with
  | Base_dDiag.C_Check_ErrC (dtb__380) -> (if ((v_isRigidDictArg ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dDiag.C_Check_ErrC (dtb__380)))
  | Base_dDiag.C_Check_OkC (dtb__381) -> (match dtb__381 with
  | { B_dData_dPair.f_Pair_first = dtb__382; B_dData_dPair.f_Pair_second = dtb__383 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__382, Core_dTerm.C_Rig_RigOmega)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__383 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1246 "Vuna/Compiler/Elab/Dict.vuna"
let v_specializeCmpTy = (fun (globals : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (ctx : Elab_dTypes.t_Ctx) (name : string) (aTerm : Core_dTerm.t_Term) (bTerm : Core_dTerm.t_Term) (sp : Base_dSource.t_Span) (aTy : Core_dTerm.t_Value) (ec : Elab_dTypes.t_Ec) -> (match (Elab_dPrelude.v_cmpBuiltinTyName ((Elab_dTypes.v_forceVal ec) aTy)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__384) -> ((Base_dCommon.v_bind (((v_cmpRuntimeName sp) (v_methodShortOf name)) dtb__384)) (fun (rt : string) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (rt)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = ec } }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_findOrdClass name) ec) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let st = (Core_dEval.v_showValue ((Elab_dTypes.v_forceVal ec) aTy)) in ((((Base_dDiagnostics_dTc.v_tcErr2 sp) (Base_dDiagnostics_dTc.C_TcErr_OpNotDefinedFor ((v_methodShortOf name), st))) (v_methodShortOf name)) st))
  | B_dData_dMaybe.C_Maybe_Just (dtb__385) -> (let mname = (if (if (if (if (name = "<") then true else (name = "<=")) then true else (name = ">")) then true else (name = ">=")) then ((v_projectionFor dtb__385) (v_methodShortOf name)) else name) in (let tyTerm = ((Core_dEval.v_quote (Elab_dTypes.v_ctxDepth ctx)) aTy) in (let dictTy = (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal ((Elab_dMeta.v_dictTypeName (Elab_dTypes.v_dtClassName dtb__385)), (B_dData_dList.C_List__x58__x58_ (aTy, B_dData_dList.C_List_Nil)))))) in (if ((v_dictArgUnsolvedMeta ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (let nd_uscrut14 = (((((v_searchInstanceIn globals) ctx) ec) dictTy) sp) in (match nd_uscrut14 with
  | Base_dDiag.C_Check_ErrC (dtb__386) -> (if ((v_isRigidDictArg ec) dictTy) then (((((((((v_deferEqDict globals) ctx) mname) tyTerm) aTerm) bTerm) sp) dictTy) ec) else (Base_dDiag.C_Check_ErrC (dtb__386)))
  | Base_dDiag.C_Check_OkC (dtb__387) -> (match dtb__387 with
  | { B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = dtb__389 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal (mname)), tyTerm, Core_dTerm.C_Rig_Rig0)), dtb__388, Core_dTerm.C_Rig_RigOmega)), aTerm, Core_dTerm.C_Rig_Rig1)), bTerm, Core_dTerm.C_Rig_Rig1)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = Elab_dPrelude.v_boolTyValue; B_dData_dPair.f_Pair_second = dtb__389 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 1275 "Vuna/Compiler/Elab/Dict.vuna"
let v_boolShortCircuit = (fun (name : string) (a : Core_dTerm.t_Term) (b : Core_dTerm.t_Term) -> (if (name = "&&") then (Core_dTerm.C_Term_TIf (a, b, (Core_dTerm.C_Term_TBool (false)))) else (Core_dTerm.C_Term_TIf (a, (Core_dTerm.C_Term_TBool (true)), b))))

# 1282 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedMemberGoalGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__390, dtb__391) -> (match dtb__390 with
  | { Elab_dTypes.f_Constraint_conId = dtb__392; Elab_dTypes.f_Constraint_conKind = dtb__393; Elab_dTypes.f_Constraint_conMeta = dtb__394; Elab_dTypes.f_Constraint_conDom = dtb__395; Elab_dTypes.f_Constraint_conSpan = dtb__396; Elab_dTypes.f_Constraint_conDepth = dtb__397 } -> (if ((v_isMemberDomain mc0) dtb__395) then (match ((Core_dTerm.v_metaLookup dtb__394) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just ((Core_dEval.v_showValue ((Elab_dTypes.v_forceVal mc0) dtb__395))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__398) -> ((v_firstUnsolvedMemberGoalGo mc0) dtb__391)
  | _ -> failwith "DT: impossible branch"
) else ((v_firstUnsolvedMemberGoalGo mc0) dtb__391))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1279 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedMemberGoal = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedMemberGoalGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1299 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__399, dtb__400) -> (match dtb__399 with
  | { Elab_dTypes.f_Constraint_conId = dtb__401; Elab_dTypes.f_Constraint_conKind = dtb__402; Elab_dTypes.f_Constraint_conMeta = dtb__403; Elab_dTypes.f_Constraint_conDom = dtb__404; Elab_dTypes.f_Constraint_conSpan = dtb__405; Elab_dTypes.f_Constraint_conDepth = dtb__406 } -> (match ((Core_dTerm.v_metaLookup dtb__403) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__407) -> ((v_firstUnsolvedDictGoalGo mc0) dtb__400)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__404) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then ((v_firstUnsolvedDictGoalGo mc0) dtb__400) else (if ((v_isMemberDomain mc0) forced) then ((v_firstUnsolvedDictGoalGo mc0) dtb__400) else (if ((v_anyUnsolvedMetaArg mc0) ((v_dictClassArgs mc0) forced)) then ((v_firstUnsolvedDictGoalGo mc0) dtb__400) else (if ((v_isRigidDictArg mc0) forced) then ((v_firstUnsolvedDictGoalGo mc0) dtb__400) else (B_dData_dMaybe.C_Maybe_Just (((v_showResolvedValue mc0) forced))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1296 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoal = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictGoalGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1326 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedInterpSpanGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__408, dtb__409) -> (match dtb__408 with
  | { Elab_dTypes.f_Constraint_conId = dtb__410; Elab_dTypes.f_Constraint_conKind = dtb__411; Elab_dTypes.f_Constraint_conMeta = dtb__412; Elab_dTypes.f_Constraint_conDom = dtb__413; Elab_dTypes.f_Constraint_conSpan = dtb__414; Elab_dTypes.f_Constraint_conDepth = dtb__415 } -> (match ((Core_dTerm.v_metaLookup dtb__412) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> ((v_firstUnsolvedInterpSpanGo mc0) dtb__409)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__413) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then dtb__414 else ((v_firstUnsolvedInterpSpanGo mc0) dtb__409)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1322 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedInterpGoalSpan = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedInterpSpanGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1344 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedMemberSpanGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__417, dtb__418) -> (match dtb__417 with
  | { Elab_dTypes.f_Constraint_conId = dtb__419; Elab_dTypes.f_Constraint_conKind = dtb__420; Elab_dTypes.f_Constraint_conMeta = dtb__421; Elab_dTypes.f_Constraint_conDom = dtb__422; Elab_dTypes.f_Constraint_conSpan = dtb__423; Elab_dTypes.f_Constraint_conDepth = dtb__424 } -> (if ((v_isMemberDomain mc0) dtb__422) then (match ((Core_dTerm.v_metaLookup dtb__421) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb__423
  | B_dData_dMaybe.C_Maybe_Just (dtb__425) -> ((v_firstUnsolvedMemberSpanGo mc0) dtb__418)
  | _ -> failwith "DT: impossible branch"
) else ((v_firstUnsolvedMemberSpanGo mc0) dtb__418))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1340 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedMemberGoalSpan = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedMemberSpanGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1359 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictSpanGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__426, dtb__427) -> (match dtb__426 with
  | { Elab_dTypes.f_Constraint_conId = dtb__428; Elab_dTypes.f_Constraint_conKind = dtb__429; Elab_dTypes.f_Constraint_conMeta = dtb__430; Elab_dTypes.f_Constraint_conDom = dtb__431; Elab_dTypes.f_Constraint_conSpan = dtb__432; Elab_dTypes.f_Constraint_conDepth = dtb__433 } -> (match ((Core_dTerm.v_metaLookup dtb__430) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__434) -> ((v_firstUnsolvedDictSpanGo mc0) dtb__427)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__431) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then ((v_firstUnsolvedDictSpanGo mc0) dtb__427) else (if ((v_isMemberDomain mc0) forced) then ((v_firstUnsolvedDictSpanGo mc0) dtb__427) else (if ((v_anyUnsolvedMetaArg mc0) ((v_dictClassArgs mc0) forced)) then ((v_firstUnsolvedDictSpanGo mc0) dtb__427) else (if ((v_isRigidDictArg mc0) forced) then ((v_firstUnsolvedDictSpanGo mc0) dtb__427) else dtb__432)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1355 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalSpan = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictSpanGo ec) (Elab_dTypes.v_ecPendingList ec)))

# 1380 "Vuna/Compiler/Elab/Dict.vuna"
let rec v_firstUnsolvedDictGoalMetaGo = (fun (mc0 : Elab_dTypes.t_Ec) (mc1 : Elab_dTypes.t_Constraint B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__435, dtb__436) -> (match dtb__435 with
  | { Elab_dTypes.f_Constraint_conId = dtb__437; Elab_dTypes.f_Constraint_conKind = dtb__438; Elab_dTypes.f_Constraint_conMeta = dtb__439; Elab_dTypes.f_Constraint_conDom = dtb__440; Elab_dTypes.f_Constraint_conSpan = dtb__441; Elab_dTypes.f_Constraint_conDepth = dtb__442 } -> (match ((Core_dTerm.v_metaLookup dtb__439) (Elab_dTypes.v_ecSolTbl mc0)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__443) -> ((v_firstUnsolvedDictGoalMetaGo mc0) dtb__436)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let forced = ((Elab_dTypes.v_forceVal mc0) dtb__440) in (if ((v_valueDictFamily forced) = (Elab_dMeta.v_dictTypeName Base_dIntrinsics.v_interpTypeName)) then ((v_firstUnsolvedDictGoalMetaGo mc0) dtb__436) else (if ((v_isMemberDomain mc0) forced) then ((v_firstUnsolvedDictGoalMetaGo mc0) dtb__436) else (if ((v_anyUnsolvedMetaArg mc0) ((v_dictClassArgs mc0) forced)) then ((v_firstUnsolvedDictGoalMetaGo mc0) dtb__436) else (if ((v_isRigidDictArg mc0) forced) then ((v_firstUnsolvedDictGoalMetaGo mc0) dtb__436) else (B_dData_dMaybe.C_Maybe_Just (dtb__439)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1376 "Vuna/Compiler/Elab/Dict.vuna"
let v_firstUnsolvedDictGoalMeta = (fun (ec : Elab_dTypes.t_Ec) -> ((v_firstUnsolvedDictGoalMetaGo ec) (Elab_dTypes.v_ecPendingList ec)))
