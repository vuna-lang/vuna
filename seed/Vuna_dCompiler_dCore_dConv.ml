open Vuna_runtime
let v_Vuna_dCompiler_dCore_dConv_disNilList = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__0, dtb__1, dtb__2) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__3, dtb__4, dtb__5) -> (if (if (if (dtb__0 = dtb__3) then (dtb__1 = dtb__4) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__2) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__5) else false)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__6, dtb__7) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__8, dtb__9) -> (if (if (dtb__6 = dtb__8) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__7) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__9) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dfastSame = (fun a b -> (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__10) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__11) -> ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__10) dtb__11)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__12) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__13) -> (dtb__12 = dtb__13)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__14) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__15) -> (dtb__14 = dtb__15)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__16) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__17) -> (dtb__16 = dtb__17)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__18) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__19) -> (if dtb__18 then dtb__19 else (Base_dBool.v_Base_dBool_dnot dtb__19))
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__20) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__21) -> ((v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom dtb__20) dtb__21)
  | _ -> false
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__22, dtb__23) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__24, dtb__25) -> (if (if (dtb__22 = dtb__24) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__23) else false) then (v_Vuna_dCompiler_dCore_dConv_disNilList dtb__25) else false)
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dCore_dConv_dmismatchAt = (fun depth a b -> ((fun sa -> ((fun sb -> (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatch (sa, sb))) sa) sb)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) b))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValueAt depth) a)))

let v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth = (fun sols depth m -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsDepth m) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__26) -> dtb__26
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> depth
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_disNilSpine = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dCore_dConv_dmemLevel = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__27 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__29, dtb__30) -> (if (dtb__30 = mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel mc0) dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dtermScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__31, dtb__32, dtb__33) -> (if (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__31) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__32) else false) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__33) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__34) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__35) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__36) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__37) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__38, dtb__39) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__38) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__39) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__40, dtb__41) -> (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__41)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__42, dtb__43, dtb__44) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__42) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__43) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__45, dtb__46, dtb__47) -> (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__47)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__51) then (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__52) else false)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__53) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__54) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__55) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__56, dtb__57) -> (if (dtb__57 < mc2) then true else ((fun level -> (if (level >= 0) then (if (level < mc0) then true else ((v_Vuna_dCompiler_dCore_dConv_dmemLevel level) mc3)) else false)) (((mc1 + mc2) - 1) - dtb__57)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dargsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (match dtb__58 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__60, dtb__61) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) mc2) mc3) dtb__60) then (((((v_Vuna_dCompiler_dCore_dConv_dargsScopedTo mc0) mc1) mc2) mc3) dtb__59) else false)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_daltsScopedTo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo mc0) mc1) (mc2 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders dtb__62)))) mc3) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody dtb__62)) then (((((v_Vuna_dCompiler_dCore_dConv_daltsScopedTo mc0) mc1) mc2) mc3) dtb__63) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match dtb__64 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__66) -> (match dtb__66 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__67, dtb__68, dtb__69) -> (if (v_Vuna_dCompiler_dCore_dConv_disNilSpine dtb__69) then (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf dtb__65) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70) -> (if ((v_Vuna_dCompiler_dCore_dConv_dmemLevel dtb__68) dtb__70) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__67, dtb__68)), dtb__70)))))
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (if (dtb__71 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc2)) else (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo mc0) dtb__72) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dlevelPos = (fun level levels -> (((v_Vuna_dCompiler_dCore_dConv_dlevelPosGo level) levels) 0))

let rec v_Vuna_dCompiler_dCore_dConv_dspineLevels = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.v_Base_dPair_dsecondOf dtb__73), (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__74)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dabsPatternBody = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__75, dtb__76, dtb__77) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__75), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__76), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__77)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__78, dtb__79) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__78), ((Base_dList.v_Base_dList_dmap (fun alt -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_CaseAlt ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt), (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))) mc4) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt)))))) dtb__79)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__80, dtb__81) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__80, ((Base_dList.v_Base_dList_dmap (fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) (Base_dPair.v_Base_dPair_dfirstOf p)), (Base_dPair.v_Base_dPair_dsecondOf p))))) dtb__81)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__82, dtb__83, dtb__84) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__82), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__83), dtb__84))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__85, dtb__86, dtb__87) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__85, dtb__86, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__87)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__88, dtb__89, dtb__90, ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) mc3) mc4) dtb__91), ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__92)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__93, dtb__94) -> (if (dtb__94 < mc3) then mc5 else ((fun level -> (match ((v_Vuna_dCompiler_dCore_dConv_dlevelPos level) mc4) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__93, (((mc3 + mc0) - 1) - dtb__95)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__93, (dtb__94 + mc0)))
  | _ -> failwith "DT: impossible branch"
)) (((mc2 + mc3) - 1) - dtb__94)))
  | _ -> mc5
))

let rec v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__96 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__98, dtb__99) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__98, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__97) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCore_dConv_dpatternEnv = (fun created depth -> (if (depth <= 0) then Base_dList.C_Base_dList_dList_Nil else ((fun level -> ((fun lvl -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar ("_", lvl, Base_dList.C_Base_dList_dList_Nil)))), ((v_Vuna_dCompiler_dCore_dConv_dpatternEnv created) (depth - 1))))) (if (level < created) then level else 0))) (depth - 1))))

let v_Vuna_dCompiler_dCore_dConv_dpatternSolution = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__100 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__102, dtb__103) -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__102, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega, (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dClosure_Closure (((v_Vuna_dCompiler_dCore_dConv_dpatternEnv mc1) mc2), ((v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams dtb__101) mc3)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelZero))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore = (fun sols depth m rhs -> ((fun created -> ((fun t -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) Base_dList.C_Base_dList_dList_Nil) t) then (Base_dResult.C_Base_dResult_dResult_Ok ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) rhs) sols))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m)))

let v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__104, dtb__105) -> (match dtb__105 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__104 = mc2) then (Base_dResult.C_Base_dResult_dResult_Ok (mc0)) else ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3))
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
)
  | _ -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore mc0) mc1) mc2) mc3)
))

let rec v_Vuna_dCompiler_dCore_dConv_dsplitAtVals = (fun mc0 mc1 -> (if (mc0 = 0) then (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, mc1))
  | _ -> failwith "DT: impossible branch"
) else (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals (mc0 - 1)) dtb__109) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__110, dtb__111) -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__110)), dtb__111))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dPair.C_Base_dPair_dPair_Pair (Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCore_dConv_dconvFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (if ((v_Vuna_dCompiler_dCore_dConv_dfastSame a) b) then (Base_dResult.C_Base_dResult_dResult_Ok (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__112, dtb__113) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__112) dtb__113) y2)
  | _ -> (match y2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__114, dtb__115) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) dtb__114) dtb__115) a2)
  | _ -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvBothFuel (fuel - 1)) defs) sols) depth) a2) y2)
)
)) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) b))) ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce defs) sols) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) a)))))
and v_Vuna_dCompiler_dCore_dConv_dconvBothFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__116) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VType (dtb__117) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelEq dtb__116) dtb__117) then (Base_dResult.C_Base_dResult_dResult_Ok (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VPi (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) dtb__119) dtb__124) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__121) dtb__126)) (fun sols2 -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__122) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__127) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__118) depth)))) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__128, dtb__129, dtb__130) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__131, dtb__132, dtb__133) -> ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__130) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__133) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar dtb__128) depth))
  | _ -> (((((((v_Vuna_dCompiler_dCore_dConv_detaRightFuel (fuel - 1)) defs) sols) depth) dtb__128) dtb__130) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__134) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__135) -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel (fuel - 1)) defs) sols) depth) dtb__134) dtb__135) a) b)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VLam (dtb__136, dtb__137, dtb__138) -> (((((((v_Vuna_dCompiler_dCore_dConv_detaLeftFuel (fuel - 1)) defs) sols) depth) a) dtb__136) dtb__138)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__139) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VInt (dtb__140) -> (if (dtb__139 = dtb__140) then (Base_dResult.C_Base_dResult_dResult_Ok (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__141) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VStr (dtb__142) -> (if (dtb__141 = dtb__142) then (Base_dResult.C_Base_dResult_dResult_Ok (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__143) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VFloat (dtb__144) -> (if (dtb__143 = dtb__144) then (Base_dResult.C_Base_dResult_dResult_Ok (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__145) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VBool (dtb__146) -> (if (((Base_dEq.v_Base_dEq_deq Base_dEq.v_Eq_uBase_uBool_uBool) dtb__145) dtb__146) then (Base_dResult.C_Base_dResult_dResult_Ok (sols)) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__147, dtb__148) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCon (dtb__149, dtb__150) -> (if (dtb__147 = dtb__149) then ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (fuel - 1)) defs) sols) depth) dtb__148) dtb__150) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__151, dtb__152) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VApp (dtb__153, dtb__154) -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__151) dtb__153)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__152) dtb__154)))) (if Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_ddebugOn then (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote (String.concat "" ["vapp: "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue a); " <> "; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue b); " | x="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__152); " x2="; (Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dshowValue dtb__154)])) else 0))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__155, dtb__156) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VCase (dtb__157, dtb__158) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__155) dtb__157)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (fuel - 1)) defs) sols2) depth) dtb__156) dtb__158)))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__159, dtb__160, dtb__161) -> (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VIf (dtb__162, dtb__163, dtb__164) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) dtb__159) dtb__162)) (fun sols2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols2) depth) dtb__160) dtb__163)) (fun sols3 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols3) depth) dtb__161) dtb__164)))))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) a) b)
)))
and v_Vuna_dCompiler_dCore_dConv_detaLeftFuel = (fun fuel defs sols depth a name clo -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue a) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_detaRightFuel = (fun fuel defs sols depth name clo b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else ((fun v -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) v)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyValue b) v))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dfreshVar name) depth))))
and v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel = (fun fuel defs sols depth n1 n2 v1 v2 -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (match n1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__165, dtb__166, dtb__167) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__168, dtb__169, dtb__170) -> (if (dtb__166 = dtb__169) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__167) dtb__170) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__171, dtb__172) -> (match n2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__173, dtb__174) -> (if (dtb__171 = dtb__173) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) dtb__172) dtb__174) v1) v2) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2))
  | _ -> (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__175, dtb__176) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__177, dtb__178) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__175) dtb__177)) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (mc0 - 1)) mc1) sols2) mc3) dtb__176) dtb__178) mc6) mc7))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (((v_Vuna_dCompiler_dCore_dConv_dmismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__179, dtb__180) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__181, dtb__182) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (mc0 - 1)) mc1) mc2) mc3) dtb__179) dtb__181)) (fun sols2 -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel (mc0 - 1)) mc1) sols2) mc3) dtb__180) dtb__182))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCtorArity))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__183, dtb__184) -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (if ((match dtb__183 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__187, dtb__188, dtb__189) -> dtb__187
  | _ -> failwith "DT: impossible branch"
) = (match dtb__185 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__190, dtb__191, dtb__192) -> dtb__190
  | _ -> failwith "DT: impossible branch"
)) then (if ((Base_dList.v_Base_dList_dlength (match dtb__183 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__193, dtb__194, dtb__195) -> dtb__194
  | _ -> failwith "DT: impossible branch"
)) = (Base_dList.v_Base_dList_dlength (match dtb__185 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__196, dtb__197, dtb__198) -> dtb__197
  | _ -> failwith "DT: impossible branch"
))) then (match ((((((v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel (mc0 - 1)) mc1) mc2) mc3) dtb__183) dtb__185) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__199) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__199))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__200) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel (mc0 - 1)) mc1) dtb__200) mc3) dtb__184) dtb__186)
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseVars ((match dtb__183 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__201, dtb__202, dtb__203) -> dtb__201
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__183 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__204, dtb__205, dtb__206) -> dtb__204
  | _ -> failwith "DT: impossible branch"
))) else (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseBranch ((match dtb__183 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__207, dtb__208, dtb__209) -> dtb__207
  | _ -> failwith "DT: impossible branch"
), (match dtb__185 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__210, dtb__211, dtb__212) -> dtb__210
  | _ -> failwith "DT: impossible branch"
)))) (match dtb__183 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__213, dtb__214, dtb__215) -> dtb__213
  | _ -> failwith "DT: impossible branch"
)) (match dtb__185 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__216, dtb__217, dtb__218) -> dtb__216
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseCount))
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_TypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel = (fun fuel defs sols depth a b -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else ((fun bs -> ((fun n -> ((fun args -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) (depth + n)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__219, dtb__220, dtb__221) -> dtb__221
  | _ -> failwith "DT: impossible branch"
)) args)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder (match b with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__222, dtb__223, dtb__224) -> dtb__224
  | _ -> failwith "DT: impossible branch"
)) args))) (((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dargValsAt bs) depth) 0))) (Base_dList.v_Base_dList_dlength bs))) (match a with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dVCaseAlt_VCaseAlt (dtb__225, dtb__226, dtb__227) -> dtb__226
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__228, dtb__229) -> (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__228) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) Base_dList.C_Base_dList_dList_Nil)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__230) dtb__229))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (m = dtb__228) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__229) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__228, Base_dList.C_Base_dList_dList_Nil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__229) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__231) -> (match dtb__231 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__232, dtb__233) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__231))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NGlobal (dtb__232, Base_dList.C_Base_dList_dList_Nil))))) dtb__233)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__234, dtb__235, dtb__236) -> (((((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral (dtb__231))) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_NVar (dtb__234, dtb__235, Base_dList.C_Base_dList_dList_Nil))))) dtb__236)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel = (fun fuel defs sols depth m sp whole headVal args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (if ((Base_dList.v_Base_dList_dlength args) >= (Base_dList.v_Base_dList_dlength sp)) then ((fun extra -> (match ((v_Vuna_dCompiler_dCore_dConv_dsplitAtVals extra) args) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__237, dtb__238) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Nil) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine headVal) dtb__237))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__238) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) (bi_natSub (Base_dList.v_Base_dList_dlength args) (Base_dList.v_Base_dList_dlength sp))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (match (v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf sp) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) rhs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__239) -> ((fun created -> ((fun t -> ((fun n -> ((fun levels -> (if (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dhasMeta m) 0) t) then ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_Vuna_dCompiler_dCore_dConv_dtermScopedTo created) depth) 0) dtb__239) t) then (Base_dResult.C_Base_dResult_dResult_Ok ((((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsCons m) ((((v_Vuna_dCompiler_dCore_dConv_dpatternSolution dtb__239) created) depth) ((((((v_Vuna_dCompiler_dCore_dConv_dabsPatternBody n) created) depth) 0) levels) t))) sols))) else ((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc (Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) (v_Vuna_dCompiler_dCore_dConv_dspineLevels dtb__239))) (Base_dList.v_Base_dList_dlength dtb__239))) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dquote depth) rhs))) (((v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth sols) depth) m))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel = (fun fuel defs sols depth m sp rhs -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: conv fuel exhausted")) else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup m) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> ((((((v_Vuna_dCompiler_dCore_dConv_dconvFuel (fuel - 1)) defs) sols) depth) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__240) sp)) rhs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match sp with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty sols) depth) m) rhs)
  | _ -> (match rhs with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__241, dtb__242) -> (if (dtb__241 = m) then ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__242) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs) else (match ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsLookup dtb__241) sols) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__243) -> (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) sp) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplySpine dtb__243) dtb__242))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((((v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel (fuel - 1)) defs) sols) depth) m) Base_dList.C_Base_dList_dList_Nil) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (dtb__241, Base_dList.C_Base_dList_dList_Nil)))) (fun sols2 -> ((((((((v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__242) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_VMeta (m, sp))) rhs)))
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
