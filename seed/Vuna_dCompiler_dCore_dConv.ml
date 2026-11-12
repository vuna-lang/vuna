open Vuna_runtime
let v_Vuna_dCompiler_dCore_dConv_disNatCtorName = (fun c -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

let v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue = 4611686018427387903

let v_Vuna_dCompiler_dCore_dConv_dnatChainNextValue = (fun n -> (if (n >= v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue) then v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue else (n + 1)))

let rec v_Vuna_dCompiler_dCore_dConv_dnatFoldGo = (fun fuel v -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__0, dtb__1) -> (((v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs (fuel - 1)) dtb__0) dtb__1)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__2) -> (match dtb__2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__3, dtb__4) -> (((v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs (fuel - 1)) dtb__3) dtb__4)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__5, dtb__6) -> (((v_Vuna_dCompiler_dCore_dConv_dnatFoldApplied (fuel - 1)) dtb__5) dtb__6)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))
and v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs = (fun fuel c args -> (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__8 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc fuel) dtb__7)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) args) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))
and v_Vuna_dCompiler_dCore_dConv_dnatFoldApplied = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__9) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__10 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc mc0) mc2) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) dtb__9)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__12 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc mc0) mc2) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
))
and v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc = (fun fuel a -> (match ((v_Vuna_dCompiler_dCore_dConv_dnatFoldGo fuel) a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((v_Vuna_dCompiler_dCore_dConv_dnatChainNextValue dtb__14)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dnatFoldValue = (fun v -> ((v_Vuna_dCompiler_dCore_dConv_dnatFoldGo 1000000) v))

let v_Vuna_dCompiler_dCore_dConv_dsameNatValue = (fun a b -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16) -> (dtb__15 = dtb__16)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_disNatLikeHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__17) -> (match dtb__17 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__18, dtb__19) -> (dtb__18 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__20, dtb__21) -> (dtb__20 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_disNatLikeValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__22, dtb__23) -> (v_Vuna_dCompiler_dCore_dConv_disNatLikeHead dtb__22)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__24) -> (match dtb__24 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__25, dtb__26) -> (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__25)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__27, dtb__28) -> (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__27)
  | _ -> false
))

let rec v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo = (fun fuel v -> (if (fuel <= 0) then 100000 else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__29, dtb__30) -> (if (dtb__29 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo (fuel - 1)) dtb__31))
  | _ -> 0
)
  | _ -> 0
)) dtb__30) else 0)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__33) -> (match dtb__33 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__34, dtb__35) -> (if (dtb__34 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo (fuel - 1)) dtb__36))
  | _ -> 0
)
  | _ -> 0
)) dtb__35) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__38, dtb__39) -> (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeHead dtb__38) then (1 + ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo (fuel - 1)) dtb__39)) else 0)
  | _ -> 0
)))

let v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth = (fun v -> ((v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo 100000) v))

let rec v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> ((fun d -> ((fun r -> (if (d >= r) then d else r)) (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__41))) (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue dtb__40) then (v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth dtb__40) else 0))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dconvNatNear = (fun v -> (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue v) then (v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth v) else (match v with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__42, dtb__43) -> (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__43)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__44) -> (match dtb__44 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__45, dtb__46) -> (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__46)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__47, dtb__48, dtb__49) -> (v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax dtb__49)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__50, dtb__51) -> (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue dtb__51) then (v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth dtb__51) else 0)
  | _ -> 0
)))

let v_Vuna_dCompiler_dCore_dConv_dconvFuelMax = 100000

let v_Vuna_dCompiler_dCore_dConv_dconvNatFuel = (fun depth -> (if (depth > 24984) then v_Vuna_dCompiler_dCore_dConv_dconvFuelMax else (64 + (4 * depth))))

let v_Vuna_dCompiler_dCore_dConv_dconvFuelFor = (fun a b -> ((fun d -> ((fun d2 -> (v_Vuna_dCompiler_dCore_dConv_dconvNatFuel (if (d >= d2) then d else d2))) (v_Vuna_dCompiler_dCore_dConv_dconvNatNear b))) (v_Vuna_dCompiler_dCore_dConv_dconvNatNear a)))

let v_Vuna_dCompiler_dCore_dConv_disNilList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__52, dtb__53, dtb__54) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__55, dtb__56, dtb__57) -> (if (if (if (dtb__52 = dtb__55) then (dtb__53 = dtb__56) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__54) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__57) else false)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__58, dtb__59) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__60, dtb__61) -> (if (if (dtb__58 = dtb__60) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__59) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__61) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dfastSame = (fun a b -> (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__62) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__63) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__62) dtb__63)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__64) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__65) -> (dtb__64 = dtb__65)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__66) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__67) -> (dtb__66 = dtb__67)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__68) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__69) -> (dtb__68 = dtb__69)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__70) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__71) -> (if dtb__70 then dtb__71 else (Base_dBool.v_Base_dBool_dnot dtb__71))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__72) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__73) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((v_Vuna_dCompiler_dCore_dConv_dsameNatValue a) b) else ((v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom dtb__72) dtb__73))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__74, dtb__75) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__76, dtb__77) -> (if (if (if (dtb__74 = dtb__76) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__75) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__77) else false) then true else (if (if (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__74) then (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__76) else false) then ((v_Vuna_dCompiler_dCore_dConv_dsameNatValue a) b) else false))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__78, dtb__79) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__80, dtb__81) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((v_Vuna_dCompiler_dCore_dConv_dsameNatValue a) b) else false)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun depth a b -> ((fun sa -> ((fun sb -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcTypeMismatchNoLoc sa) sb)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)))

let v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth = (fun sols depth m -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsDepth m) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> dtb__82
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> depth
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_disNilSpine = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dCore_dConv_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__83 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__85; Base_dPair.f_Base_dPair_dPair_second = dtb__86 } -> (if (dtb__86 = mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel mc0) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dtermScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__87, dtb__88, dtb__89) -> (if (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__87) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__88) else false) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__89) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__90) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__91) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__92) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__93) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__94, dtb__95) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__94) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__95) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__96) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength dtb__98))) mc3) dtb__100) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__101)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__106, dtb__107) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__107)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__108, dtb__109) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__109)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__110, dtb__111) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__111)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__112, dtb__113, dtb__114) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__112) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__113) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__115, dtb__116, dtb__117) -> (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__117)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__121) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__122) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__123) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__124) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__125) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__126, dtb__127, dtb__128) -> (if (dtb__127 < mc2) then true else ((fun level -> (if (level >= 0) then (if (level < mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel level) mc3)) else false)) (((mc1 + mc2) - 1) - dtb__127)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dargsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (match dtb__129 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__131; Base_dPair.f_Base_dPair_dPair_second = dtb__132 } -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__131) then (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__130) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_daltsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__133, dtb__134) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__133)))) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__133)) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__134) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__135 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__137) -> (match dtb__137 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__138, dtb__139, dtb__140) -> (if (v_Vuna_dCompiler_dCore_dConv_disNilSpine dtb__140) then (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf dtb__136) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__141) -> (if ((v_Vuna_dCompiler_dCore_dConv_dmemLevel dtb__139) dtb__141) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__138; Base_dPair.f_Base_dPair_dPair_second = dtb__139 }, dtb__141)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dlevelPosGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__142, dtb__143) -> (if (dtb__142 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo mc0) dtb__143) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dlevelPos = (fun level levels -> (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo level) levels) 0))

let rec v_Vuna_dCompiler_dCore_dConv_dspineLevels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__144, dtb__145) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dsecondOf dtb__144), (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__145)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dabsPatternBody = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__146, dtb__147, dtb__148) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__146), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__147), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__148)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__149, dtb__150) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__149), ((Base_dList.v_Base_dList_dmap (fun alt -> { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) mc4) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)) })) dtb__150)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__151, dtb__152) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__151, ((Base_dList.v_Base_dList_dmap (fun p -> { Base_dPair.f_Base_dPair_dPair_first = ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) (Base_dPair.v_Base_dPair_dfirstOf p)); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p) })) dtb__152)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__153, dtb__154, dtb__155) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__153), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__154), dtb__155))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__156, dtb__157, dtb__158) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__156, dtb__157, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__158)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__159, dtb__160, dtb__161, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__162), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__163)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__164, dtb__165, dtb__166) -> (if (dtb__165 < mc3) then mc5 else ((fun level -> (match ((v_Vuna_dCompiler_dCore_dConv_dlevelPos level) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__167) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__164, (((mc3 + mc0) - 1) - dtb__167), dtb__166))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__164, (dtb__165 + mc0), dtb__166))
  | _ -> failwith "DT: impossible branch"
)) (((mc2 + mc3) - 1) - dtb__165)))
  | _ -> mc5
))

let rec v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (match dtb__168 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__170; Base_dPair.f_Base_dPair_dPair_second = dtb__171 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__170, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__169) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternEnv = (fun created depth -> (if (depth <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun level -> ((fun lvl -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_", lvl, Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dCore_dConv_dpatternEnv created) (depth - 1))))) (if (level < created) then level else 0))) (depth - 1))))

let v_Vuna_dCompiler_dCore_dConv_dpatternSolution = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__172, dtb__173) -> (match dtb__172 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__174; Base_dPair.f_Base_dPair_dPair_second = dtb__175 } -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__174, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureEnv = ((v_Vuna_dCompiler_dCore_dConv_dpatternEnv mc1) mc2); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dClosure_closureBody = ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__173) mc3) }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore = (fun sols depth m rhs -> ((fun created -> ((fun t -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) Base_dList.C_Base_dList_dList_Nil) t) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) rhs) sols))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m)))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__176, dtb__177) -> (match dtb__177 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__176 = mc2) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc0)) else ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
))

let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun mc0 mc1 -> (if (mc0 = 0) then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__178, dtb__179) -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = mc1 }
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__180, dtb__181) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals (mc0 - 1)) dtb__181) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__182; Base_dPair.f_Base_dPair_dPair_second = dtb__183 } -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__180, dtb__182)); Base_dPair.f_Base_dPair_dPair_second = dtb__183 }
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dConv_dconvNatChains = (fun defs sols depth a b args args2 fuel -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__184) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__185) -> (if (dtb__184 = dtb__185) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvNatNeutral = (fun fuel defs sols depth n1 n2 a b -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__187) -> (if (dtb__186 = dtb__187) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvNatApplied = (fun fuel defs sols depth f x f2 x2 a b -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue a) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__188) -> (match (v_Vuna_dCompiler_dCore_dConv_dnatFoldValue b) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__189) -> (if (dtb__188 = dtb__189) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (if ((v_Vuna_dCompiler_dCore_dConv_dfastSame a) b) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__190, dtb__191) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__190) dtb__191) y2)
  | _ -> (match y2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__192, dtb__193) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__192) dtb__193) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel (fuel - 1)) defs) sols) depth) a2) y2)
)
)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__194) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__195) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__194) dtb__195) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__196, dtb__197, dtb__198, dtb__199, dtb__200) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__201, dtb__202, dtb__203, dtb__204, dtb__205) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) dtb__197) dtb__202) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__199) dtb__204)) (fun sols2 -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__200) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__205) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__196) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__206, dtb__207, dtb__208) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__209, dtb__210, dtb__211) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__208) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__211) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__206) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel (fuel - 1)) defs) sols) depth) dtb__206) dtb__208) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__212) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__213) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNatNeutral fuel) defs) sols) depth) dtb__212) dtb__213) a) b) else ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) dtb__212) dtb__213) a) b))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__214, dtb__215, dtb__216) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel (fuel - 1)) defs) sols) depth) a) dtb__214) dtb__216)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__217) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__218) -> (if (dtb__217 = dtb__218) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__219) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__220) -> (if (dtb__219 = dtb__220) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__221) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__222) -> (if (dtb__221 = dtb__222) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__223) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__224) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) dtb__223) dtb__224) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__225, dtb__226) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__227, dtb__228) -> (if (dtb__225 = dtb__227) then (if (v_Vuna_dCompiler_dCore_dConv_disNatCtorName dtb__225) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNatChains defs) sols) depth) a) b) dtb__226) dtb__228) fuel) else ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) dtb__226) dtb__228)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__229, dtb__230, dtb__231, dtb__232, dtb__233) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VProj (dtb__234, dtb__235, dtb__236, dtb__237, dtb__238) -> (if (if (dtb__230 = dtb__235) then (dtb__232 = dtb__237) else false) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__229) dtb__234) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__239, dtb__240) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__241, dtb__242) -> (if (if (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue a) then (v_Vuna_dCompiler_dCore_dConv_disNatLikeValue b) else false) then ((((((((((v_Vuna_dCompiler_dCore_dConv_dconvNatApplied fuel) defs) sols) depth) dtb__239) dtb__240) dtb__241) dtb__242) a) b) else ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__239) dtb__241)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__240) dtb__242)))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dperfEnabled then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugLine (String.concat "" ["vapp: "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue a); " <> "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue b); " | x="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__240); " x2="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__242)])) else Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dunit)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__243, dtb__244) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__245, dtb__246) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__243) dtb__245)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (fuel - 1)) defs) sols2) depth) dtb__244) dtb__246)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__247, dtb__248, dtb__249) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__250, dtb__251, dtb__252) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__247) dtb__250)) (fun sols2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__248) dtb__251)) (fun sols3 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols3) depth) dtb__249) dtb__252)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)))
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun fuel defs sols depth a name clo -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun fuel defs sols depth name clo b -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun fuel defs sols depth n1 n2 v1 v2 -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (match n1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__253, dtb__254, dtb__255) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__256, dtb__257, dtb__258) -> (if (dtb__254 = dtb__257) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__255) dtb__258) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__259, dtb__260) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__261, dtb__262) -> (if (dtb__259 = dtb__261) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__260) dtb__262) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__265, dtb__266) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__263) dtb__265)) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (mc0 - 1)) mc1) sols2) mc3) dtb__264) dtb__266) mc6) mc7))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__267, dtb__268) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__269, dtb__270) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__267) dtb__269)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (mc0 - 1)) mc1) sols2) mc3) dtb__268) dtb__270))))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCtorArity))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__273, dtb__274) -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (if ((dtb__271).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName = (dtb__273).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName) then (if ((Base_dList.v_Base_dList_dlength (dtb__271).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders) = (Base_dList.v_Base_dList_dlength (dtb__273).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders)) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel (mc0 - 1)) mc1) mc2) mc3) dtb__271) dtb__273) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__275) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__275))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__276) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (mc0 - 1)) mc1) dtb__276) mc3) dtb__272) dtb__274)
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseVars ((dtb__271).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName))) (dtb__271).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName)) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseBranch ((dtb__271).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName, (dtb__273).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName))) (dtb__271).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName) (dtb__273).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltName)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseCount))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + n)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (a).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure) args)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (b).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltClosure) args))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (Base_dList.v_Base_dList_dlength bs))) (a).Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_vCaseAltBinders)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__277, dtb__278) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__277) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__279) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) Base_dList.C_Base_dList_dList_Nil)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__279) dtb__278))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (m = dtb__277) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__278) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__277, Base_dList.C_Base_dList_dList_Nil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__278) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__280) -> (match dtb__280 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__281, dtb__282) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__280))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__281, Base_dList.C_Base_dList_dList_Nil))))) dtb__282)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__283, dtb__284, dtb__285) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__280))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__283, dtb__284, Base_dList.C_Base_dList_dList_Nil))))) dtb__285)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel = (fun fuel defs sols depth m sp whole headVal args -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (if ((Base_dList.v_Base_dList_dlength args) >= (Base_dList.v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__286; Base_dPair.f_Base_dPair_dPair_second = dtb__287 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__286))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__287) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) (bi_natSub (Base_dList.v_Base_dList_dlength args) (Base_dList.v_Base_dList_dlength sp))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf sp) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) rhs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__288) -> ((fun created -> ((fun t -> ((fun n -> ((fun levels -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) dtb__288) t) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) ((((v_Vuna_dCompiler_dCore_dConv_dpatternSolution dtb__288) created) depth) ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody n) created) depth) 0) levels) t))) sols))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__288))) (Base_dList.v_Base_dList_dlength dtb__288))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "conv") else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup m) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__289) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__289) sp)) rhs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match sp with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs)
  | _ -> (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__290, dtb__291) -> (if (dtb__290 = m) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__291) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs) else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__290) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__292) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) sp) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__292) dtb__291))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__290, Base_dList.C_Base_dList_dList_Nil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__291) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern (fuel - 1)) defs) sols) depth) m) sp) rhs)
)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew = (fun defs sols depth m rhs -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs))

let v_Vuna_dCompiler_dCore_dConv_dconv = (fun a1 a2 a3 a4 a5 -> ((fun _u -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel ((v_Vuna_dCompiler_dCore_dConv_dconvFuelFor a4) a5)) a1) a2) a3) a4) a5)) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dperfEnabled then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugLine (String.concat "" ["conv-in: "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote a3) a4)); " <> "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote a3) a5)); " |v: "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a4); " <> "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a5); " @"; (bi_strFromInt a3)])) else Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dunit)))

let v_Vuna_dCompiler_dCore_dConv_dconvBoth = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel ((v_Vuna_dCompiler_dCore_dConv_dconvFuelFor a4) a5)) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvOneAlt = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvValueLists = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvNeutral = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel 64) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dCore_dConv_dconvSpines = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel 64) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dCore_dConv_detaLeft = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel 64) a1) a2) a3) a4) a5) a6))

let v_Vuna_dCompiler_dCore_dConv_detaRight = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel 64) a1) a2) a3) a4) a5) a6))

let v_Vuna_dCompiler_dCore_dConv_dsolveMeta = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel 64) a1) a2) a3) a4) a5) a6))
