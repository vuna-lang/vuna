open Vuna_runtime
# 79 "Vuna/Compiler/Core/Conv.vuna"
let v_isNatCtorName = (fun (c : string) -> (if (c = Base_dIntrinsics.v_natZeroCtor) then true else (c = Base_dIntrinsics.v_natSuccCtor)))

# 83 "Vuna/Compiler/Core/Conv.vuna"
let v_natChainMaxValue = 4611686018427387903

# 86 "Vuna/Compiler/Core/Conv.vuna"
let v_natChainNextValue = (fun (n : int) -> (if (n >= v_natChainMaxValue) then v_natChainMaxValue else (n + 1)))

# 94 "Vuna/Compiler/Core/Conv.vuna"
let rec v_natFoldGo = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match v with
  | Core_dTerm.C_Value_VCon (dtb__0, dtb__1) -> (((v_natFoldArgs (fuel - 1)) dtb__0) dtb__1)
  | Core_dTerm.C_Value_VNeutral (dtb__2) -> (match dtb__2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__3, dtb__4) -> (((v_natFoldArgs (fuel - 1)) dtb__3) dtb__4)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VApp (dtb__5, dtb__6) -> (((v_natFoldApplied (fuel - 1)) dtb__5) dtb__6)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 108 "Vuna/Compiler/Core/Conv.vuna"
and v_natFoldArgs = (fun (fuel : int) (c : string) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (c = Base_dIntrinsics.v_natZeroCtor) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List_Nil -> ((v_natFoldSucc fuel) dtb__7)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) args) else B_dData_dMaybe.C_Maybe_Nothing)))
# 121 "Vuna/Compiler/Core/Conv.vuna"
and v_natFoldApplied = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__9) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__10, dtb__11) -> (match dtb__11 with
  | B_dData_dList.C_List_Nil -> (if (dtb__10 = Base_dIntrinsics.v_natSuccCtor) then ((v_natFoldSucc mc0) mc2) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) dtb__9)
  | Core_dTerm.C_Value_VCon (dtb__12, dtb__13) -> (match dtb__13 with
  | B_dData_dList.C_List_Nil -> (if (dtb__12 = Base_dIntrinsics.v_natSuccCtor) then ((v_natFoldSucc mc0) mc2) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 129 "Vuna/Compiler/Core/Conv.vuna"
and v_natFoldSucc = (fun (fuel : int) (a : Core_dTerm.t_Value) -> (match ((v_natFoldGo fuel) a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> (B_dData_dMaybe.C_Maybe_Just ((v_natChainNextValue dtb__14)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Core/Conv.vuna"
let v_natFoldValue = (fun (v : Core_dTerm.t_Value) -> ((v_natFoldGo 1000000) v))

# 135 "Vuna/Compiler/Core/Conv.vuna"
let v_sameNatValue = (fun (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (v_natFoldValue a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (match (v_natFoldValue b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> (dtb__15 = dtb__16)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Core/Conv.vuna"
let v_isNatLikeHead = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VNeutral (dtb__17) -> (match dtb__17 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__18, dtb__19) -> (dtb__18 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb__20, dtb__21) -> (dtb__20 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
))

# 145 "Vuna/Compiler/Core/Conv.vuna"
let v_isNatLikeValue = (fun (mc0 : Core_dTerm.t_Value) -> (match mc0 with
  | Core_dTerm.C_Value_VApp (dtb__22, dtb__23) -> (v_isNatLikeHead dtb__22)
  | Core_dTerm.C_Value_VNeutral (dtb__24) -> (match dtb__24 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__25, dtb__26) -> (v_isNatCtorName dtb__25)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb__27, dtb__28) -> (v_isNatCtorName dtb__27)
  | _ -> false
))

# 166 "Vuna/Compiler/Core/Conv.vuna"
let rec v_natPrefixGo = (fun (fuel : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then 100000 else (match v with
  | Core_dTerm.C_Value_VCon (dtb__29, dtb__30) -> (if (dtb__29 = Base_dIntrinsics.v_natSuccCtor) then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_natPrefixGo (fuel - 1)) dtb__31))
  | _ -> 0
)
  | _ -> 0
)) dtb__30) else 0)
  | Core_dTerm.C_Value_VNeutral (dtb__33) -> (match dtb__33 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__34, dtb__35) -> (if (dtb__34 = Base_dIntrinsics.v_natSuccCtor) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_natPrefixGo (fuel - 1)) dtb__36))
  | _ -> 0
)
  | _ -> 0
)) dtb__35) else 0)
  | _ -> 0
)
  | Core_dTerm.C_Value_VApp (dtb__38, dtb__39) -> (if (v_isNatLikeHead dtb__38) then (1 + ((v_natPrefixGo (fuel - 1)) dtb__39)) else 0)
  | _ -> 0
)))

# 163 "Vuna/Compiler/Core/Conv.vuna"
let v_natPrefixDepth = (fun (v : Core_dTerm.t_Value) -> ((v_natPrefixGo 100000) v))

# 199 "Vuna/Compiler/Core/Conv.vuna"
let v_convFuelBase = 4096

# 219 "Vuna/Compiler/Core/Conv.vuna"
let rec v_natPrefixMax = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> ((fun d -> ((fun r -> (if (d >= r) then d else r)) (v_natPrefixMax dtb__41))) (if (v_isNatLikeValue dtb__40) then (v_natPrefixDepth dtb__40) else 0))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Core/Conv.vuna"
let v_convNatNear = (fun (v : Core_dTerm.t_Value) -> (if (v_isNatLikeValue v) then (v_natPrefixDepth v) else (match v with
  | Core_dTerm.C_Value_VCon (dtb__42, dtb__43) -> (v_natPrefixMax dtb__43)
  | Core_dTerm.C_Value_VNeutral (dtb__44) -> (match dtb__44 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__45, dtb__46) -> (v_natPrefixMax dtb__46)
  | Core_dTerm.C_Neutral_NVar (dtb__47, dtb__48, dtb__49) -> (v_natPrefixMax dtb__49)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VApp (dtb__50, dtb__51) -> (if (v_isNatLikeValue dtb__51) then (v_natPrefixDepth dtb__51) else 0)
  | _ -> 0
)))

# 234 "Vuna/Compiler/Core/Conv.vuna"
let v_convFuelMax = 100000

# 237 "Vuna/Compiler/Core/Conv.vuna"
let v_convNatFuel = (fun (depth : int) -> ((fun need -> (if (need > v_convFuelMax) then v_convFuelMax else need)) (v_convFuelBase + (4 * depth))))

# 227 "Vuna/Compiler/Core/Conv.vuna"
let v_convFuelFor = (fun (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> ((fun d -> ((fun d2 -> (v_convNatFuel (if (d >= d2) then d else d2))) (v_convNatNear b))) (v_convNatNear a)))

# 280 "Vuna/Compiler/Core/Conv.vuna"
let v_isNilList = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 284 "Vuna/Compiler/Core/Conv.vuna"
let v_sameNeutralAtom = (fun (mc0 : Core_dTerm.t_Neutral) (mc1 : Core_dTerm.t_Neutral) -> (match mc0 with
  | Core_dTerm.C_Neutral_NVar (dtb__52, dtb__53, dtb__54) -> (match mc1 with
  | Core_dTerm.C_Neutral_NVar (dtb__55, dtb__56, dtb__57) -> (if (if (if (dtb__52 = dtb__55) then (dtb__53 = dtb__56) else false) then (v_isNilList dtb__54) else false) then (v_isNilList dtb__57) else false)
  | _ -> false
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__58, dtb__59) -> (match mc1 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__60, dtb__61) -> (if (if (dtb__58 = dtb__60) then (v_isNilList dtb__59) else false) then (v_isNilList dtb__61) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Core/Conv.vuna"
let v_fastSame = (fun (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match a with
  | Core_dTerm.C_Value_VType (dtb__62) -> (match b with
  | Core_dTerm.C_Value_VType (dtb__63) -> ((Core_dTerm.v_levelEq dtb__62) dtb__63)
  | _ -> false
)
  | Core_dTerm.C_Value_VInt (dtb__64) -> (match b with
  | Core_dTerm.C_Value_VInt (dtb__65) -> (dtb__64 = dtb__65)
  | _ -> false
)
  | Core_dTerm.C_Value_VStr (dtb__66) -> (match b with
  | Core_dTerm.C_Value_VStr (dtb__67) -> (dtb__66 = dtb__67)
  | _ -> false
)
  | Core_dTerm.C_Value_VFloat (dtb__68) -> (match b with
  | Core_dTerm.C_Value_VFloat (dtb__69) -> (dtb__68 = dtb__69)
  | _ -> false
)
  | Core_dTerm.C_Value_VBool (dtb__70) -> (match b with
  | Core_dTerm.C_Value_VBool (dtb__71) -> (if dtb__70 then dtb__71 else (B_dData_dBool.v_not dtb__71))
  | _ -> false
)
  | Core_dTerm.C_Value_VNeutral (dtb__72) -> (match b with
  | Core_dTerm.C_Value_VNeutral (dtb__73) -> (if (if (v_isNatLikeValue a) then (v_isNatLikeValue b) else false) then ((v_sameNatValue a) b) else ((v_sameNeutralAtom dtb__72) dtb__73))
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb__74, dtb__75) -> (match b with
  | Core_dTerm.C_Value_VCon (dtb__76, dtb__77) -> (if (if (if (dtb__74 = dtb__76) then (v_isNilList dtb__75) else false) then (v_isNilList dtb__77) else false) then true else (if (if (v_isNatCtorName dtb__74) then (v_isNatCtorName dtb__76) else false) then ((v_sameNatValue a) b) else false))
  | _ -> false
)
  | Core_dTerm.C_Value_VApp (dtb__78, dtb__79) -> (match b with
  | Core_dTerm.C_Value_VApp (dtb__80, dtb__81) -> (if (if (v_isNatLikeValue a) then (v_isNatLikeValue b) else false) then ((v_sameNatValue a) b) else false)
  | _ -> false
)
  | _ -> false
))

# 477 "Vuna/Compiler/Core/Conv.vuna"
let v_mismatchAt = (fun (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> ((fun _u -> ((fun sa -> ((fun sb -> ((Base_dDiagnostics_dTc.v_tcTypeMismatchNoLoc sa) sb)) ((Core_dEval.v_showValueAt depth) b))) ((Core_dEval.v_showValueAt depth) a))) (((Base_dObs.v_obsCountAt 3) "vuna.counter.conv.mismatch") 1)))

# 499 "Vuna/Compiler/Core/Conv.vuna"
let v_metaCreatedDepth = (fun (sols : Core_dTerm.t_Sols) (depth : int) (m : int) -> (match ((Core_dTerm.v_solsDepth m) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> dtb__82
  | B_dData_dMaybe.C_Maybe_Nothing -> depth
  | _ -> failwith "DT: impossible branch"
))

# 579 "Vuna/Compiler/Core/Conv.vuna"
let v_isNilSpine = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 583 "Vuna/Compiler/Core/Conv.vuna"
let rec v_memLevel = (fun (mc0 : int) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (match dtb__83 with
  | { B_dData_dPair.f_Pair_first = dtb__85; B_dData_dPair.f_Pair_second = dtb__86 } -> (if (dtb__86 = mc0) then true else ((v_memLevel mc0) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Core/Conv.vuna"
let rec v_termScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term) -> (match mc4 with
  | Core_dTerm.C_Term_TIf (dtb__87, dtb__88, dtb__89) -> (if (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__87) then (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__88) else false) then (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__89) else false)
  | Core_dTerm.C_Term_TBool (dtb__90) -> true
  | Core_dTerm.C_Term_TFloat (dtb__91) -> true
  | Core_dTerm.C_Term_TStr (dtb__92) -> true
  | Core_dTerm.C_Term_TInt (dtb__93) -> true
  | Core_dTerm.C_Term_TCase (dtb__94, dtb__95) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__94) then (((((v_altsScopedTo mc0) mc1) mc2) mc3) dtb__95) else false)
  | Core_dTerm.C_Term_TRecUpd (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__96) then (((((v_termScopedTo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__98))) mc3) dtb__100) else false)
  | Core_dTerm.C_Term_TProj (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__101)
  | Core_dTerm.C_Term_TRecord (dtb__106, dtb__107) -> (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__107)
  | Core_dTerm.C_Term_TMk (dtb__108, dtb__109) -> (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__109)
  | Core_dTerm.C_Term_TCon (dtb__110, dtb__111) -> (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__111)
  | Core_dTerm.C_Term_TApp (dtb__112, dtb__113, dtb__114) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__112) then (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__113) else false)
  | Core_dTerm.C_Term_TLam (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> ((fun slotOk -> (if slotOk then (((((v_termScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__119) else false)) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> (match dtb__120 with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> (match dtb__121 with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__123)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)) dtb__117))
  | Core_dTerm.C_Term_TPi (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__127) then (((((v_termScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__128) else false)
  | Core_dTerm.C_Term_TType (dtb__129) -> true
  | Core_dTerm.C_Term_TGlobal (dtb__130) -> true
  | Core_dTerm.C_Term_TMeta (dtb__131) -> true
  | Core_dTerm.C_Term_TVar (dtb__132, dtb__133, dtb__134) -> (if (dtb__133 < mc2) then true else ((fun level -> (if (level >= 0) then (if (level < mc0) then true else ((v_memLevel level) mc3)) else false)) (((mc1 + mc2) - 1) - dtb__133)))
  | _ -> failwith "DT: impossible branch"
))
# 551 "Vuna/Compiler/Core/Conv.vuna"
and v_argsScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (match dtb__135 with
  | { B_dData_dPair.f_Pair_first = dtb__137; B_dData_dPair.f_Pair_second = dtb__138 } -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__137) then (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__136) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 556 "Vuna/Compiler/Core/Conv.vuna"
and v_altsScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (if (((((v_termScopedTo mc0) mc1) (mc2 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders dtb__139)))) mc3) (Core_dTerm.v_caseAltBody dtb__139)) then (((((v_altsScopedTo mc0) mc1) mc2) mc3) dtb__140) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 563 "Vuna/Compiler/Core/Conv.vuna"
let rec v_patternSpineOf = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (match dtb__141 with
  | Core_dTerm.C_Value_VNeutral (dtb__143) -> (match dtb__143 with
  | Core_dTerm.C_Neutral_NVar (dtb__144, dtb__145, dtb__146) -> (if (v_isNilSpine dtb__146) then (match (v_patternSpineOf dtb__142) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (if ((v_memLevel dtb__145) dtb__147) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__144; B_dData_dPair.f_Pair_second = dtb__145 }, dtb__147)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Core/Conv.vuna"
let rec v_levelPosGo = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> (if (dtb__148 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_levelPosGo mc0) dtb__149) (mc2 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Core/Conv.vuna"
let v_levelPos = (fun (level : int) (levels : int B_dData_dList.t_List) -> (((v_levelPosGo level) levels) 0))

# 594 "Vuna/Compiler/Core/Conv.vuna"
let rec v_spineLevels = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__150), (v_spineLevels dtb__151)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 602 "Vuna/Compiler/Core/Conv.vuna"
let rec v_absPatternBody = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : int) (mc4 : int B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term) -> (match mc5 with
  | Core_dTerm.C_Term_TIf (dtb__152, dtb__153, dtb__154) -> (Core_dTerm.C_Term_TIf (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__152), ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__153), ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__154)))
  | Core_dTerm.C_Term_TCase (dtb__155, dtb__156) -> (Core_dTerm.C_Term_TCase (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__155), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> { Core_dTerm.f_CaseAlt_caseAltName = (Core_dTerm.v_caseAltName alt); Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_caseAltBinders alt); Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_absPatternBody mc0) mc1) mc2) (mc3 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders alt)))) mc4) (Core_dTerm.v_caseAltBody alt)) })) dtb__156)))
  | Core_dTerm.C_Term_TCon (dtb__157, dtb__158) -> (Core_dTerm.C_Term_TCon (dtb__157, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__158)))
  | Core_dTerm.C_Term_TApp (dtb__159, dtb__160, dtb__161) -> (Core_dTerm.C_Term_TApp (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__159), ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__160), dtb__161))
  | Core_dTerm.C_Term_TLam (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> ((fun slot2 -> (Core_dTerm.C_Term_TLam (dtb__162, dtb__163, slot2, dtb__165, ((((((v_absPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__166)))) ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> (match dtb__167 with
  | { B_dData_dPair.f_Pair_first = dtb__168; B_dData_dPair.f_Pair_second = dtb__169 } -> ((Core_dTerm.v_lamTyOf (match dtb__168 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__170)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__169 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_absPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__171)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__164))
  | Core_dTerm.C_Term_TPi (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176) -> (Core_dTerm.C_Term_TPi (dtb__172, dtb__173, dtb__174, ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__175), ((((((v_absPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__176)))
  | Core_dTerm.C_Term_TVar (dtb__177, dtb__178, dtb__179) -> (if (dtb__178 < mc3) then mc5 else ((fun level -> (match ((v_levelPos level) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__180) -> (Core_dTerm.C_Term_TVar (dtb__177, (((mc3 + mc0) - 1) - dtb__180), dtb__179))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TVar (dtb__177, (dtb__178 + mc0), dtb__179))
  | _ -> failwith "DT: impossible branch"
)) (((mc2 + mc3) - 1) - dtb__178)))
  | _ -> mc5
))

# 656 "Vuna/Compiler/Core/Conv.vuna"
let rec v_wrapPatternLams = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> (match dtb__181 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (Core_dTerm.C_Term_TLam (dtb__183, Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_wrapPatternLams dtb__182) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 664 "Vuna/Compiler/Core/Conv.vuna"
let rec v_patternEnv = (fun (created : int) (depth : int) -> (if (depth <= 0) then B_dData_dList.C_List_Nil else ((fun level -> ((fun lvl -> (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_", lvl, B_dData_dList.C_List_Nil)))), ((v_patternEnv created) (depth - 1))))) (if (level < created) then level else 0))) (depth - 1))))

# 676 "Vuna/Compiler/Core/Conv.vuna"
let v_patternSolution = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (match dtb__185 with
  | { B_dData_dPair.f_Pair_first = dtb__187; B_dData_dPair.f_Pair_second = dtb__188 } -> (Core_dTerm.C_Value_VLam (dtb__187, Core_dTerm.C_Rig_RigOmega, { Core_dTerm.f_Closure_closureEnv = ((v_patternEnv mc1) mc2); Core_dTerm.f_Closure_closureBody = ((v_wrapPatternLams dtb__186) mc3) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Core_dEval.v_eval ((v_patternEnv mc1) mc2)) mc3)
  | _ -> failwith "DT: impossible branch"
))

# 688 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaEmptyStore = (fun (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (rhs : Core_dTerm.t_Value) -> ((fun created -> ((fun t -> (if (((Core_dTerm.v_hasMeta m) 0) t) then ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_termScopedTo created) depth) 0) B_dData_dList.C_List_Nil) t) then (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_solsCons m) rhs) sols))) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) ((Core_dEval.v_quote depth) rhs))) (((v_metaCreatedDepth sols) depth) m)))

# 683 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaEmpty = (fun (mc0 : Core_dTerm.t_Sols) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Value) -> (match mc3 with
  | Core_dTerm.C_Value_VMeta (dtb__189, dtb__190) -> (match dtb__190 with
  | B_dData_dList.C_List_Nil -> (if (dtb__189 = mc2) then (Base_dDiag.C_Check_OkC (mc0)) else ((((v_solveMetaEmptyStore mc0) mc1) mc2) mc3))
  | _ -> ((((v_solveMetaEmptyStore mc0) mc1) mc2) mc3)
)
  | _ -> ((((v_solveMetaEmptyStore mc0) mc1) mc2) mc3)
))

# 704 "Vuna/Compiler/Core/Conv.vuna"
let rec v_splitAtVals = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (mc0 = 0) then { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 } else (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (match ((v_splitAtVals (mc0 - 1)) dtb__192) with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__193)); B_dData_dPair.f_Pair_second = dtb__194 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
)))

# 245 "Vuna/Compiler/Core/Conv.vuna"
let rec v_convNatChains = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) (args : Core_dTerm.t_Value B_dData_dList.t_List) (args2 : Core_dTerm.t_Value B_dData_dList.t_List) (fuel : int) -> (match (v_natFoldValue a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (match (v_natFoldValue b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (if (dtb__195 = dtb__196) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_convValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_convValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
))
# 255 "Vuna/Compiler/Core/Conv.vuna"
and v_convNatNeutral = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (n1 : Core_dTerm.t_Neutral) (n2 : Core_dTerm.t_Neutral) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (v_natFoldValue a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> (match (v_natFoldValue b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> (if (dtb__197 = dtb__198) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_convNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_convNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
))
# 265 "Vuna/Compiler/Core/Conv.vuna"
and v_convNatApplied = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (f : Core_dTerm.t_Value) (x : Core_dTerm.t_Value) (f2 : Core_dTerm.t_Value) (x2 : Core_dTerm.t_Value) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (v_natFoldValue a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (match (v_natFoldValue b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (if (dtb__199 = dtb__200) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
))
# 294 "Vuna/Compiler/Core/Conv.vuna"
and v_convFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((v_fastSame a) b) then (Base_dDiag.C_Check_OkC (sols)) else ((fun a2 -> ((fun y2 -> (match a2 with
  | Core_dTerm.C_Value_VMeta (dtb__201, dtb__202) -> (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) dtb__201) dtb__202) y2)
  | _ -> (match y2 with
  | Core_dTerm.C_Value_VMeta (dtb__203, dtb__204) -> (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) dtb__203) dtb__204) a2)
  | _ -> ((((((v_convBothFuel (fuel - 1)) defs) sols) depth) a2) y2)
)
)) ((((Core_dEval.v_force defs) sols) Core_dTerm.v_defaultFuel) b))) ((((Core_dEval.v_force defs) sols) Core_dTerm.v_defaultFuel) a)))))
# 311 "Vuna/Compiler/Core/Conv.vuna"
and v_convBothFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match a with
  | Core_dTerm.C_Value_VType (dtb__205) -> (match b with
  | Core_dTerm.C_Value_VType (dtb__206) -> (if ((Core_dTerm.v_levelEq dtb__205) dtb__206) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VPi (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> (match b with
  | Core_dTerm.C_Value_VPi (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__208) dtb__213) then ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__210) dtb__215)) (fun (sols2 : Core_dTerm.t_Sols) -> ((fun v -> ((((((v_convFuel (fuel - 1)) defs) sols2) (depth + 1)) ((Core_dEval.v_applyClosure dtb__211) v)) ((Core_dEval.v_applyClosure dtb__216) v))) ((Core_dEval.v_freshVar dtb__207) depth)))) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VLam (dtb__217, dtb__218, dtb__219) -> (match b with
  | Core_dTerm.C_Value_VLam (dtb__220, dtb__221, dtb__222) -> ((fun v -> ((((((v_convFuel (fuel - 1)) defs) sols) (depth + 1)) ((Core_dEval.v_applyClosure dtb__219) v)) ((Core_dEval.v_applyClosure dtb__222) v))) ((Core_dEval.v_freshVar dtb__217) depth))
  | _ -> (((((((v_etaRightFuel (fuel - 1)) defs) sols) depth) dtb__217) dtb__219) b)
)
  | Core_dTerm.C_Value_VNeutral (dtb__223) -> (match b with
  | Core_dTerm.C_Value_VNeutral (dtb__224) -> (if (if (v_isNatLikeValue a) then (v_isNatLikeValue b) else false) then ((((((((v_convNatNeutral fuel) defs) sols) depth) dtb__223) dtb__224) a) b) else ((((((((v_convNeutralFuel (fuel - 1)) defs) sols) depth) dtb__223) dtb__224) a) b))
  | Core_dTerm.C_Value_VLam (dtb__225, dtb__226, dtb__227) -> (((((((v_etaLeftFuel (fuel - 1)) defs) sols) depth) a) dtb__225) dtb__227)
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VInt (dtb__228) -> (match b with
  | Core_dTerm.C_Value_VInt (dtb__229) -> (if (dtb__228 = dtb__229) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VStr (dtb__230) -> (match b with
  | Core_dTerm.C_Value_VStr (dtb__231) -> (if (dtb__230 = dtb__231) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VFloat (dtb__232) -> (match b with
  | Core_dTerm.C_Value_VFloat (dtb__233) -> (if (dtb__232 = dtb__233) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VBool (dtb__234) -> (match b with
  | Core_dTerm.C_Value_VBool (dtb__235) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_uBase_uData_uBool_uBool) dtb__234) dtb__235) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VCon (dtb__236, dtb__237) -> (match b with
  | Core_dTerm.C_Value_VCon (dtb__238, dtb__239) -> (if (dtb__236 = dtb__238) then (if (v_isNatCtorName dtb__236) then ((((((((v_convNatChains defs) sols) depth) a) b) dtb__237) dtb__239) fuel) else ((((((v_convValueListsFuel (fuel - 1)) defs) sols) depth) dtb__237) dtb__239)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VProj (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244) -> (match b with
  | Core_dTerm.C_Value_VProj (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> (if (if (dtb__241 = dtb__246) then (dtb__243 = dtb__248) else false) then ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__240) dtb__245) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VApp (dtb__250, dtb__251) -> (match b with
  | Core_dTerm.C_Value_VApp (dtb__252, dtb__253) -> (if (if (v_isNatLikeValue a) then (v_isNatLikeValue b) else false) then ((((((((((v_convNatApplied fuel) defs) sols) depth) dtb__250) dtb__251) dtb__252) dtb__253) a) b) else ((fun _u -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__250) dtb__252)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols2) depth) dtb__251) dtb__253)))) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["vapp: "; (Core_dEval.v_showValue a); " <> "; (Core_dEval.v_showValue b); " | x="; (Core_dEval.v_showValue dtb__251); " x2="; (Core_dEval.v_showValue dtb__253)])) else 0)))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VCase (dtb__254, dtb__255) -> (match b with
  | Core_dTerm.C_Value_VCase (dtb__256, dtb__257) -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__254) dtb__256)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convCaseAltsFuel (fuel - 1)) defs) sols2) depth) dtb__255) dtb__257)))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VIf (dtb__258, dtb__259, dtb__260) -> (match b with
  | Core_dTerm.C_Value_VIf (dtb__261, dtb__262, dtb__263) -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__258) dtb__261)) (fun (sols2 : Core_dTerm.t_Sols) -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols2) depth) dtb__259) dtb__262)) (fun (sols3 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols3) depth) dtb__260) dtb__263)))))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | _ -> (((v_mismatchAt depth) a) b)
)))
# 391 "Vuna/Compiler/Core/Conv.vuna"
and v_etaLeftFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (name : string) (clo : Core_dTerm.t_Closure) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else ((fun v -> ((((((v_convFuel (fuel - 1)) defs) sols) (depth + 1)) ((Core_dEval.v_applyValue a) v)) ((Core_dEval.v_applyClosure clo) v))) ((Core_dEval.v_freshVar name) depth))))
# 400 "Vuna/Compiler/Core/Conv.vuna"
and v_etaRightFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (name : string) (clo : Core_dTerm.t_Closure) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else ((fun v -> ((((((v_convFuel (fuel - 1)) defs) sols) (depth + 1)) ((Core_dEval.v_applyClosure clo) v)) ((Core_dEval.v_applyValue b) v))) ((Core_dEval.v_freshVar name) depth))))
# 409 "Vuna/Compiler/Core/Conv.vuna"
and v_convNeutralFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (n1 : Core_dTerm.t_Neutral) (n2 : Core_dTerm.t_Neutral) (v1 : Core_dTerm.t_Value) (v2 : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match n1 with
  | Core_dTerm.C_Neutral_NVar (dtb__264, dtb__265, dtb__266) -> (match n2 with
  | Core_dTerm.C_Neutral_NVar (dtb__267, dtb__268, dtb__269) -> (if (dtb__265 = dtb__268) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) dtb__266) dtb__269) v1) v2) else (((v_mismatchAt depth) v1) v2))
  | _ -> (((v_mismatchAt depth) v1) v2)
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__270, dtb__271) -> (match n2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__272, dtb__273) -> (if (dtb__270 = dtb__272) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) dtb__271) dtb__273) v1) v2) else (((v_mismatchAt depth) v1) v2))
  | _ -> (((v_mismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
)))
# 424 "Vuna/Compiler/Core/Conv.vuna"
and v_convSpinesFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc2 : Core_dTerm.t_Sols) (mc3 : int) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) (mc6 : Core_dTerm.t_Value) (mc7 : Core_dTerm.t_Value) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__274, dtb__275) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__276, dtb__277) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else ((Base_dCommon.v_bind ((((((v_convFuel (mc0 - 1)) mc1) mc2) mc3) dtb__274) dtb__276)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (mc0 - 1)) mc1) sols2) mc3) dtb__275) dtb__277) mc6) mc7))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (((v_mismatchAt mc3) mc6) mc7))
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (((v_mismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
))
# 436 "Vuna/Compiler/Core/Conv.vuna"
and v_convValueListsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc2 : Core_dTerm.t_Sols) (mc3 : int) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__278, dtb__279) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__280, dtb__281) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else ((Base_dCommon.v_bind ((((((v_convFuel (mc0 - 1)) mc1) mc2) mc3) dtb__278) dtb__280)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convValueListsFuel (mc0 - 1)) mc1) sols2) mc3) dtb__279) dtb__281))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCtorArity))
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
# 449 "Vuna/Compiler/Core/Conv.vuna"
and v_convCaseAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc2 : Core_dTerm.t_Sols) (mc3 : int) (mc4 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) (mc5 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__282, dtb__283) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__284, dtb__285) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((dtb__282).Core_dTerm.f_VCaseAlt_vCaseAltName = (dtb__284).Core_dTerm.f_VCaseAlt_vCaseAltName) then (if ((B_dData_dList.v_length (dtb__282).Core_dTerm.f_VCaseAlt_vCaseAltBinders) = (B_dData_dList.v_length (dtb__284).Core_dTerm.f_VCaseAlt_vCaseAltBinders)) then (match ((((((v_convOneAltFuel (mc0 - 1)) mc1) mc2) mc3) dtb__282) dtb__284) with
  | Base_dDiag.C_Check_ErrC (dtb__286) -> (Base_dDiag.C_Check_ErrC (dtb__286))
  | Base_dDiag.C_Check_OkC (dtb__287) -> ((((((v_convCaseAltsFuel (mc0 - 1)) mc1) dtb__287) mc3) dtb__283) dtb__285)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseVars ((dtb__282).Core_dTerm.f_VCaseAlt_vCaseAltName))) (dtb__282).Core_dTerm.f_VCaseAlt_vCaseAltName)) else (((Base_dDiagnostics_dTc.v_tcErr2NoLoc (Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseBranch ((dtb__282).Core_dTerm.f_VCaseAlt_vCaseAltName, (dtb__284).Core_dTerm.f_VCaseAlt_vCaseAltName))) (dtb__282).Core_dTerm.f_VCaseAlt_vCaseAltName) (dtb__284).Core_dTerm.f_VCaseAlt_vCaseAltName)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseCount))
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
# 466 "Vuna/Compiler/Core/Conv.vuna"
and v_convOneAltFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_VCaseAlt) (b : Core_dTerm.t_VCaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else ((fun bs -> ((fun n -> ((fun args -> ((((((v_convFuel (fuel - 1)) defs) sols) (depth + n)) ((Core_dEval.v_applyClosureBinder (a).Core_dTerm.f_VCaseAlt_vCaseAltClosure) args)) ((Core_dEval.v_applyClosureBinder (b).Core_dTerm.f_VCaseAlt_vCaseAltClosure) args))) (((Core_dEval.v_argValsAt bs) depth) 0))) (B_dData_dList.v_length bs))) (a).Core_dTerm.f_VCaseAlt_vCaseAltBinders)))
# 711 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaHoLegacyFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (rhs : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match rhs with
  | Core_dTerm.C_Value_VMeta (dtb__288, dtb__289) -> (match ((Core_dTerm.v_solsLookup dtb__288) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__290) -> ((((((v_convFuel (fuel - 1)) defs) sols) depth) ((Core_dEval.v_applySpine (Core_dTerm.C_Value_VMeta (m, sp))) B_dData_dList.C_List_Nil)) ((Core_dEval.v_applySpine dtb__290) dtb__289))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (m = dtb__288) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__289) (Core_dTerm.C_Value_VMeta (m, sp))) rhs) else ((Base_dCommon.v_bind (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VMeta (dtb__288, B_dData_dList.C_List_Nil)))) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__289) (Core_dTerm.C_Value_VMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VNeutral (dtb__291) -> (match dtb__291 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__292, dtb__293) -> (((((((((v_solveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Core_dTerm.C_Value_VNeutral (dtb__291))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__292, B_dData_dList.C_List_Nil))))) dtb__293)
  | Core_dTerm.C_Neutral_NVar (dtb__294, dtb__295, dtb__296) -> (((((((((v_solveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Core_dTerm.C_Value_VNeutral (dtb__291))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__294, dtb__295, B_dData_dList.C_List_Nil))))) dtb__296)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))
# 728 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaHeadLegacyFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (whole : Core_dTerm.t_Value) (headVal : Core_dTerm.t_Value) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((B_dData_dList.v_length args) >= (B_dData_dList.v_length sp)) then ((fun extra -> (match ((v_splitAtVals extra) args) with
  | { B_dData_dPair.f_Pair_first = dtb__297; B_dData_dPair.f_Pair_second = dtb__298 } -> ((Base_dCommon.v_bind (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) B_dData_dList.C_List_Nil) ((Core_dEval.v_applySpine headVal) dtb__297))) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__298) (Core_dTerm.C_Value_VMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) (bi_natSub (B_dData_dList.v_length args) (B_dData_dList.v_length sp))) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))
# 740 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaPattern = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (rhs : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match (v_patternSpineOf sp) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_solveMetaHoLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) rhs)
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> ((fun created -> ((fun t -> ((fun n -> ((fun levels -> (if (((Core_dTerm.v_hasMeta m) 0) t) then ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_termScopedTo created) depth) 0) dtb__299) t) then (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_solsCons m) ((((v_patternSolution dtb__299) created) depth) ((((((v_absPatternBody n) created) depth) 0) levels) t))) sols))) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))) (v_spineLevels dtb__299))) (B_dData_dList.v_length dtb__299))) ((Core_dEval.v_quote depth) rhs))) (((v_metaCreatedDepth sols) depth) m))
  | _ -> failwith "DT: impossible branch"
)))
# 755 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (rhs : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match ((Core_dTerm.v_solsLookup m) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__300) -> ((((((v_convFuel (fuel - 1)) defs) sols) depth) ((Core_dEval.v_applySpine dtb__300) sp)) rhs)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match sp with
  | B_dData_dList.C_List_Nil -> ((((v_solveMetaEmpty sols) depth) m) rhs)
  | _ -> (match rhs with
  | Core_dTerm.C_Value_VMeta (dtb__301, dtb__302) -> (if (dtb__301 = m) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__302) (Core_dTerm.C_Value_VMeta (m, sp))) rhs) else (match ((Core_dTerm.v_solsLookup dtb__301) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__303) -> (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) sp) ((Core_dEval.v_applySpine dtb__303) dtb__302))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VMeta (dtb__301, B_dData_dList.C_List_Nil)))) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__302) (Core_dTerm.C_Value_VMeta (m, sp))) rhs)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((((v_solveMetaPattern (fuel - 1)) defs) sols) depth) m) sp) rhs)
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 777 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaNew = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (rhs : Core_dTerm.t_Value) -> ((((v_solveMetaEmpty sols) depth) m) rhs))

# 780 "Vuna/Compiler/Core/Conv.vuna"
let v_conv = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) -> ((fun _u -> ((fun _u -> ((((((v_convFuel ((v_convFuelFor a4) a5)) a1) a2) a3) a4) a5)) (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["conv-in: "; (Core_dTerm.v_showTerm ((Core_dEval.v_quote a3) a4)); " <> "; (Core_dTerm.v_showTerm ((Core_dEval.v_quote a3) a5)); " |v: "; ((Core_dEval.v_showValueAt a3) a4); " <> "; ((Core_dEval.v_showValueAt a3) a5); " @"; (bi_strFromInt a3)])) else 0))) (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.conv") 1)))

# 789 "Vuna/Compiler/Core/Conv.vuna"
let v_convBoth = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) -> ((((((v_convBothFuel ((v_convFuelFor a4) a5)) a1) a2) a3) a4) a5))

# 792 "Vuna/Compiler/Core/Conv.vuna"
let v_convCaseAlts = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) (a5 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((((v_convCaseAltsFuel v_convFuelBase) a1) a2) a3) a4) a5))

# 795 "Vuna/Compiler/Core/Conv.vuna"
let v_convOneAlt = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_VCaseAlt) (a5 : Core_dTerm.t_VCaseAlt) -> ((((((v_convOneAltFuel v_convFuelBase) a1) a2) a3) a4) a5))

# 798 "Vuna/Compiler/Core/Conv.vuna"
let v_convValueLists = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value B_dData_dList.t_List) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) -> ((((((v_convValueListsFuel v_convFuelBase) a1) a2) a3) a4) a5))

# 801 "Vuna/Compiler/Core/Conv.vuna"
let v_convNeutral = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Neutral) (a5 : Core_dTerm.t_Neutral) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Value) -> ((((((((v_convNeutralFuel v_convFuelBase) a1) a2) a3) a4) a5) a6) a7))

# 804 "Vuna/Compiler/Core/Conv.vuna"
let v_convSpines = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value B_dData_dList.t_List) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Value) -> ((((((((v_convSpinesFuel v_convFuelBase) a1) a2) a3) a4) a5) a6) a7))

# 807 "Vuna/Compiler/Core/Conv.vuna"
let v_etaLeft = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : string) (a6 : Core_dTerm.t_Closure) -> (((((((v_etaLeftFuel v_convFuelBase) a1) a2) a3) a4) a5) a6))

# 810 "Vuna/Compiler/Core/Conv.vuna"
let v_etaRight = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : string) (a5 : Core_dTerm.t_Closure) (a6 : Core_dTerm.t_Value) -> (((((((v_etaRightFuel v_convFuelBase) a1) a2) a3) a4) a5) a6))

# 813 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMeta = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : int) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) -> ((fun _u -> (((((((v_solveMetaFuel v_convFuelBase) a1) a2) a3) a4) a5) a6)) (((Base_dObs.v_obsCountAt 2) "vuna.counter.meta.solve") 1)))
