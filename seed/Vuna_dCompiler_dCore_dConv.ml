open Vuna_runtime
let v_Vuna_dCompiler_dCore_dConv_disNilList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__0, dtb__1, dtb__2) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__3, dtb__4, dtb__5) -> (if (if (if (dtb__0 = dtb__3) then (dtb__1 = dtb__4) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__2) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__5) else false)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__6, dtb__7) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__8, dtb__9) -> (if (if (dtb__6 = dtb__8) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__7) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__9) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dfastSame = (fun a b -> (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__10) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__11) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__10) dtb__11)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__12) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__13) -> (dtb__12 = dtb__13)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__14) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__15) -> (dtb__14 = dtb__15)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__16) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__17) -> (if dtb__16 then dtb__17 else (Base_dBool.v_Base_dBool_dnot dtb__17))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__18) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__19) -> ((v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom dtb__18) dtb__19)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__20, dtb__21) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__22, dtb__23) -> (if (if (dtb__20 = dtb__22) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__21) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__23) else false)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun depth a b -> ((fun sa -> ((fun sb -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatch (sa, sb))) sa) sb)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)))

let v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth = (fun sols depth m -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsDepth m) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> dtb__24
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> depth
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_disNilSpine = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dCore_dConv_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (match dtb__25 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28) -> (if (dtb__28 = mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel mc0) dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dtermScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__29, dtb__30, dtb__31) -> (if (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__29) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__30) else false) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__31) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__32) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__33) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__34) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__35, dtb__36) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__35) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__36) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__37, dtb__38) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__38)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__39, dtb__40, dtb__41) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__39) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__40) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__42, dtb__43, dtb__44) -> (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__44)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__48) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__49) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__50) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__51) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__52) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__53, dtb__54) -> (if (dtb__54 < mc2) then true else ((fun level -> (if (level >= 0) then (if (level < mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel level) mc3)) else false)) (((mc1 + mc2) - 1) - dtb__54)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dargsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__55, dtb__56) -> (match dtb__55 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__57) then (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__56) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_daltsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__59)))) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__59)) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__60) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (match dtb__61 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__63) -> (match dtb__63 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__64, dtb__65, dtb__66) -> (if (v_Vuna_dCompiler_dCore_dConv_disNilSpine dtb__66) then (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf dtb__62) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__67) -> (if ((v_Vuna_dCompiler_dCore_dConv_dmemLevel dtb__65) dtb__67) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65)), dtb__67)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dlevelPosGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (if (dtb__68 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc2)) else (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo mc0) dtb__69) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dlevelPos = (fun level levels -> (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo level) levels) 0))

let rec v_Vuna_dCompiler_dCore_dConv_dspineLevels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.v_Base_dPair_dsecondOf dtb__70), (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__71)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dabsPatternBody = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__72, dtb__73, dtb__74) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__72), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__73), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__74)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__75, dtb__76) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__75), ((Base_dList.v_Base_dList_dmap (fun alt -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) mc4) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))) dtb__76)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__77, dtb__78) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__77, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__78)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__79, dtb__80, dtb__81) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__79), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__80), dtb__81))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__82, dtb__83, dtb__84) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__82, dtb__83, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__84)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__85, dtb__86, dtb__87, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__88), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__89)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__90, dtb__91) -> (if (dtb__91 < mc3) then mc5 else ((fun level -> (match ((v_Vuna_dCompiler_dCore_dConv_dlevelPos level) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__90, (((mc3 + mc0) - 1) - dtb__92)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__90, (dtb__91 + mc0)))
  | _ -> failwith "DT: impossible branch"
)) (((mc2 + mc3) - 1) - dtb__91)))
  | _ -> mc5
))

let rec v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__93 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__95, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__94) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternEnv = (fun created depth -> (if (depth <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else ((fun level -> ((fun lvl -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar ("_", lvl, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dCore_dConv_dpatternEnv created) (depth - 1))))) (if (level < created) then level else 0))) (depth - 1))))

let v_Vuna_dCompiler_dCore_dConv_dpatternSolution = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (match dtb__97 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__99, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRigOmega, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Vuna_dCompiler_dCore_dTerm_dClosure (((v_Vuna_dCompiler_dCore_dConv_dpatternEnv mc1) mc2), ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__98) mc3)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore = (fun sols depth m rhs -> ((fun created -> ((fun t -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) Base_dList.C_Base_dList_dList_Base_dList_dNil) t) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) rhs) sols))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m)))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__101, dtb__102) -> (match dtb__102 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (dtb__101 = mc2) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc0)) else ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
))

let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun mc0 mc1 -> (if (mc0 = 0) then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1))
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals (mc0 - 1)) dtb__106) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__107)), dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((v_Vuna_dCompiler_dCore_dConv_dfastSame a) b) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__109, dtb__110) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__109) dtb__110) y2)
  | _ -> (match y2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__111, dtb__112) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__111) dtb__112) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel (fuel - 1)) defs) sols) depth) a2) y2)
)
)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__113) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__114) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__113) dtb__114) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__116) dtb__121) then ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__118) dtb__123)) (fun sols2 -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__119) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__124) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__115) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__125, dtb__126, dtb__127) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__128, dtb__129, dtb__130) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__127) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__130) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__125) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel (fuel - 1)) defs) sols) depth) dtb__125) dtb__127) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__131) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__132) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) dtb__131) dtb__132) a) b)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVLam (dtb__133, dtb__134, dtb__135) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel (fuel - 1)) defs) sols) depth) a) dtb__133) dtb__135)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__136) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__137) -> (if (dtb__136 = dtb__137) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__138) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__139) -> (if (dtb__138 = dtb__139) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__140) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__141) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_dBool_dBool) dtb__140) dtb__141) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__142, dtb__143) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCon (dtb__144, dtb__145) -> (if (dtb__142 = dtb__144) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) dtb__143) dtb__145) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__146, dtb__147) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVApp (dtb__148, dtb__149) -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__146) dtb__148)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__147) dtb__149)))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["vapp: "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue a); " <> "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue b); " | x="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__147); " x2="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__149)])) else 0))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__150, dtb__151) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVCase (dtb__152, dtb__153) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__150) dtb__152)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (fuel - 1)) defs) sols2) depth) dtb__151) dtb__153)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__154, dtb__155, dtb__156) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVIf (dtb__157, dtb__158, dtb__159) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__154) dtb__157)) (fun sols2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__155) dtb__158)) (fun sols3 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols3) depth) dtb__156) dtb__159)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)))
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun fuel defs sols depth a name clo -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun fuel defs sols depth name clo b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun fuel defs sols depth n1 n2 v1 v2 -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match n1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__160, dtb__161, dtb__162) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__163, dtb__164, dtb__165) -> (if (dtb__161 = dtb__164) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__162) dtb__165) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__166, dtb__167) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__168, dtb__169) -> (if (dtb__166 = dtb__168) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__167) dtb__169) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__170, dtb__171) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__170) dtb__172)) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (mc0 - 1)) mc1) sols2) mc3) dtb__171) dtb__173) mc6) mc7))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__174) dtb__176)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (mc0 - 1)) mc1) sols2) mc3) dtb__175) dtb__177))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCtorArity))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__180, dtb__181) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__182, dtb__183, dtb__184) -> dtb__182
  | _ -> failwith "DT: impossible branch"
) = (match dtb__180 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__185, dtb__186, dtb__187) -> dtb__185
  | _ -> failwith "DT: impossible branch"
)) then (if ((Base_dList.v_Base_dList_dlength (match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__188, dtb__189, dtb__190) -> dtb__189
  | _ -> failwith "DT: impossible branch"
)) = (Base_dList.v_Base_dList_dlength (match dtb__180 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__191, dtb__192, dtb__193) -> dtb__192
  | _ -> failwith "DT: impossible branch"
))) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel (mc0 - 1)) mc1) mc2) mc3) dtb__178) dtb__180) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__194) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__194))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__195) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (mc0 - 1)) mc1) dtb__195) mc3) dtb__179) dtb__181)
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseVars ((match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__196, dtb__197, dtb__198) -> dtb__196
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__199, dtb__200, dtb__201) -> dtb__199
  | _ -> failwith "DT: impossible branch"
))) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseBranch ((match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__202, dtb__203, dtb__204) -> dtb__202
  | _ -> failwith "DT: impossible branch"
), (match dtb__180 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__205, dtb__206, dtb__207) -> dtb__205
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__178 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__208, dtb__209, dtb__210) -> dtb__208
  | _ -> failwith "DT: impossible branch"
)) (match dtb__180 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__211, dtb__212, dtb__213) -> dtb__211
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseCount))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + n)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__214, dtb__215, dtb__216) -> dtb__216
  | _ -> failwith "DT: impossible branch"
)) args)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__217, dtb__218, dtb__219) -> dtb__219
  | _ -> failwith "DT: impossible branch"
)) args))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (Base_dList.v_Base_dList_dlength bs))) (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_Vuna_dCompiler_dCore_dTerm_dVCaseAlt (dtb__220, dtb__221, dtb__222) -> dtb__221
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__223, dtb__224) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__223) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__225) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) Base_dList.C_Base_dList_dList_Base_dList_dNil)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__225) dtb__224))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (m = dtb__223) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__224) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__223, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__224) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__226) -> (match dtb__226 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__227, dtb__228) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__226))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__227, Base_dList.C_Base_dList_dList_Base_dList_dNil))))) dtb__228)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__229, dtb__230, dtb__231) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__226))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__229, dtb__230, Base_dList.C_Base_dList_dList_Base_dList_dNil))))) dtb__231)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel = (fun fuel defs sols depth m sp whole headVal args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (if ((Base_dList.v_Base_dList_dlength args) >= (Base_dList.v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__232))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__233) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) (bi_natSub (Base_dList.v_Base_dList_dlength args) (Base_dList.v_Base_dList_dlength sp))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf sp) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) rhs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__234) -> ((fun created -> ((fun t -> ((fun n -> ((fun levels -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) dtb__234) t) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) ((((v_Vuna_dCompiler_dCore_dConv_dpatternSolution dtb__234) created) depth) ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody n) created) depth) 0) levels) t))) sols))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__234))) (Base_dList.v_Base_dList_dlength dtb__234))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: conv fuel exhausted")) else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup m) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__235) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__235) sp)) rhs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match sp with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs)
  | _ -> (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__236, dtb__237) -> (if (dtb__236 = m) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__237) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs) else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__236) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__238) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) sp) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__238) dtb__237))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Base_dList_dNil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__236, Base_dList.C_Base_dList_dList_Base_dList_dNil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__237) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, sp))) rhs)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern (fuel - 1)) defs) sols) depth) m) sp) rhs)
)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew = (fun defs sols depth m rhs -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs))

let v_Vuna_dCompiler_dCore_dConv_dconv = (fun a1 a2 a3 a4 a5 -> (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then ((fun _u -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel 64) a1) a2) a3) a4) a5)) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["conv-in: "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote a3) a4)); " <> "; (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dshowTerm ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote a3) a5)); " |v: "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a4); " <> "; ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt a3) a5); " @"; (bi_strFromInt a3)]))) else ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel 64) a1) a2) a3) a4) a5)))

let v_Vuna_dCompiler_dCore_dConv_dconvBoth = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvOneAlt = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvValueLists = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel 64) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCore_dConv_dconvNeutral = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel 64) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dCore_dConv_dconvSpines = (fun a1 a2 a3 a4 a5 a6 a7 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel 64) a1) a2) a3) a4) a5) a6) a7))

let v_Vuna_dCompiler_dCore_dConv_detaLeft = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel 64) a1) a2) a3) a4) a5) a6))

let v_Vuna_dCompiler_dCore_dConv_detaRight = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel 64) a1) a2) a3) a4) a5) a6))

let v_Vuna_dCompiler_dCore_dConv_dsolveMeta = (fun a1 a2 a3 a4 a5 a6 -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel 64) a1) a2) a3) a4) a5) a6))
