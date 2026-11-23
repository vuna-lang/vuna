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
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List_Nil -> ((v_natFoldSucc fuel) dtb__7)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))
# 121 "Vuna/Compiler/Core/Conv.vuna"
and v_natFoldApplied = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VNeutral (dtb__9) -> (let nd_uscrut4 = dtb__9 in (match nd_uscrut4 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__10, dtb__11) -> (match dtb__11 with
  | B_dData_dList.C_List_Nil -> (if (dtb__10 = Base_dIntrinsics.v_natSuccCtor) then ((v_natFoldSucc mc0) mc2) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
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
  | Core_dTerm.C_Value_VCon (dtb__29, dtb__30) -> (if (dtb__29 = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut4 = dtb__30 in (match nd_uscrut4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> (match dtb__32 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_natPrefixGo (fuel - 1)) dtb__31))
  | _ -> 0
)
  | _ -> 0
)) else 0)
  | Core_dTerm.C_Value_VNeutral (dtb__33) -> (match dtb__33 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__34, dtb__35) -> (if (dtb__34 = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut5 = dtb__35 in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match dtb__37 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_natPrefixGo (fuel - 1)) dtb__36))
  | _ -> 0
)
  | _ -> 0
)) else 0)
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
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (let d = (if (v_isNatLikeValue dtb__40) then (v_natPrefixDepth dtb__40) else 0) in (let r = (v_natPrefixMax dtb__41) in (if (d >= r) then d else r)))
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
let v_convNatFuel = (fun (depth : int) -> (let need = (v_convFuelBase + (4 * depth)) in (if (need > v_convFuelMax) then v_convFuelMax else need)))

# 227 "Vuna/Compiler/Core/Conv.vuna"
let v_convFuelFor = (fun (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let d = (v_convNatNear a) in (let d2 = (v_convNatNear b) in (v_convNatFuel (if (d >= d2) then d else d2)))))

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

# 295 "Vuna/Compiler/Core/Conv.vuna"
let v_zonkMetaValue = (fun (mc0 : Core_dTerm.t_Sols) (mc1 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VMeta (dtb__82, dtb__83) -> (match ((Core_dTerm.v_solsLookup dtb__82) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> ((Core_dEval.v_applySpine dtb__84) dtb__83)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> mc1
))

# 306 "Vuna/Compiler/Core/Conv.vuna"
let rec v_sameSpineFast = (fun (mc0 : Core_dTerm.t_Sols) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (if ((v_fastSame ((v_zonkMetaValue mc0) dtb__85)) ((v_zonkMetaValue mc0) dtb__87)) then (((v_sameSpineFast mc0) dtb__86) dtb__88) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc2 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Core/Conv.vuna"
let v_fastSameSols = (fun (mc0 : Core_dTerm.t_Sols) (mc1 : Core_dTerm.t_Value) (mc2 : Core_dTerm.t_Value) -> (match mc1 with
  | Core_dTerm.C_Value_VApp (dtb__89, dtb__90) -> (match mc2 with
  | Core_dTerm.C_Value_VApp (dtb__91, dtb__92) -> (if ((v_fastSame ((v_zonkMetaValue mc0) dtb__89)) ((v_zonkMetaValue mc0) dtb__91)) then ((v_fastSame ((v_zonkMetaValue mc0) dtb__90)) ((v_zonkMetaValue mc0) dtb__92)) else false)
  | _ -> false
)
  | Core_dTerm.C_Value_VNeutral (dtb__93) -> (match mc2 with
  | Core_dTerm.C_Value_VNeutral (dtb__94) -> (match dtb__93 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__95, dtb__96) -> (match dtb__94 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__97, dtb__98) -> (if (dtb__95 = dtb__97) then (((v_sameSpineFast mc0) dtb__96) dtb__98) else false)
  | _ -> false
)
  | Core_dTerm.C_Neutral_NVar (dtb__99, dtb__100, dtb__101) -> (match dtb__94 with
  | Core_dTerm.C_Neutral_NVar (dtb__102, dtb__103, dtb__104) -> (if (if (dtb__99 = dtb__102) then (dtb__100 = dtb__103) else false) then (((v_sameSpineFast mc0) dtb__101) dtb__104) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 520 "Vuna/Compiler/Core/Conv.vuna"
let v_mismatchAt = (fun (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (let _u = (((Base_dObs.v_obsCountAt 3) "vuna.counter.conv.mismatch") 1) in (let sa = ((Core_dEval.v_showValueAt depth) a) in (let sb = ((Core_dEval.v_showValueAt depth) b) in ((Base_dDiagnostics_dTc.v_tcTypeMismatchNoLoc sa) sb)))))

# 542 "Vuna/Compiler/Core/Conv.vuna"
let v_metaCreatedDepth = (fun (sols : Core_dTerm.t_Sols) (depth : int) (m : int) -> (match ((Core_dTerm.v_solsDepth m) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> dtb__105
  | B_dData_dMaybe.C_Maybe_Nothing -> depth
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Core/Conv.vuna"
let v_isNilSpine = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 628 "Vuna/Compiler/Core/Conv.vuna"
let rec v_memLevel = (fun (mc0 : int) (mc1 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__106, dtb__107) -> (match dtb__106 with
  | { B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = dtb__109 } -> (if (dtb__109 = mc0) then true else ((v_memLevel mc0) dtb__107))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Core/Conv.vuna"
let rec v_termScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_Term) -> (match mc4 with
  | Core_dTerm.C_Term_TIf (dtb__110, dtb__111, dtb__112) -> (if (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__110) then (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__111) else false) then (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__112) else false)
  | Core_dTerm.C_Term_TBool (dtb__113) -> true
  | Core_dTerm.C_Term_TFloat (dtb__114) -> true
  | Core_dTerm.C_Term_TStr (dtb__115) -> true
  | Core_dTerm.C_Term_TInt (dtb__116) -> true
  | Core_dTerm.C_Term_TCase (dtb__117, dtb__118) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__117) then (((((v_altsScopedTo mc0) mc1) mc2) mc3) dtb__118) else false)
  | Core_dTerm.C_Term_TRecUpd (dtb__119, dtb__120, dtb__121, dtb__122, dtb__123) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__119) then (((((v_termScopedTo mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__121))) mc3) dtb__123) else false)
  | Core_dTerm.C_Term_TProj (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__124)
  | Core_dTerm.C_Term_TRecord (dtb__129, dtb__130) -> (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__130)
  | Core_dTerm.C_Term_TMk (dtb__131, dtb__132) -> (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__132)
  | Core_dTerm.C_Term_TCon (dtb__133, dtb__134) -> (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__134)
  | Core_dTerm.C_Term_TApp (dtb__135, dtb__136, dtb__137) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__135) then (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__136) else false)
  | Core_dTerm.C_Term_TLam (dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (let slotOk = (let nd_uscrut10 = dtb__140 in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (match dtb__143 with
  | { B_dData_dPair.f_Pair_first = dtb__144; B_dData_dPair.f_Pair_second = dtb__145 } -> (match dtb__145 with
  | { B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__147 } -> (match dtb__146 with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__148)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)) in (if slotOk then (((((v_termScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__142) else false))
  | Core_dTerm.C_Term_TPi (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__152) then (((((v_termScopedTo mc0) mc1) (mc2 + 1)) mc3) dtb__153) else false)
  | Core_dTerm.C_Term_TType (dtb__154) -> true
  | Core_dTerm.C_Term_TGlobal (dtb__155) -> true
  | Core_dTerm.C_Term_TMeta (dtb__156) -> true
  | Core_dTerm.C_Term_TVar (dtb__157, dtb__158, dtb__159) -> (if (dtb__158 < 0) then false else (if (dtb__158 < mc2) then true else (let level = (((mc1 + mc2) - 1) - dtb__158) in (if (level >= 0) then (if (level < mc0) then true else ((v_memLevel level) mc3)) else false))))
  | _ -> failwith "DT: impossible branch"
))
# 596 "Vuna/Compiler/Core/Conv.vuna"
and v_argsScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__160, dtb__161) -> (match dtb__160 with
  | { B_dData_dPair.f_Pair_first = dtb__162; B_dData_dPair.f_Pair_second = dtb__163 } -> (if (((((v_termScopedTo mc0) mc1) mc2) mc3) dtb__162) then (((((v_argsScopedTo mc0) mc1) mc2) mc3) dtb__161) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 601 "Vuna/Compiler/Core/Conv.vuna"
and v_altsScopedTo = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (if (((((v_termScopedTo mc0) mc1) (mc2 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders dtb__164)))) mc3) (Core_dTerm.v_caseAltBody dtb__164)) then (((((v_altsScopedTo mc0) mc1) mc2) mc3) dtb__165) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Core/Conv.vuna"
let rec v_patternSpineOf = (fun (mc0 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (match dtb__166 with
  | Core_dTerm.C_Value_VNeutral (dtb__168) -> (match dtb__168 with
  | Core_dTerm.C_Neutral_NVar (dtb__169, dtb__170, dtb__171) -> (if (v_isNilSpine dtb__171) then (match (v_patternSpineOf dtb__167) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (if ((v_memLevel dtb__170) dtb__172) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__170 }, dtb__172)))))
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

# 635 "Vuna/Compiler/Core/Conv.vuna"
let rec v_levelPosGo = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) (mc2 : int) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (if (dtb__173 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc2)) else (((v_levelPosGo mc0) dtb__174) (mc2 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 632 "Vuna/Compiler/Core/Conv.vuna"
let v_levelPos = (fun (level : int) (levels : int B_dData_dList.t_List) -> (((v_levelPosGo level) levels) 0))

# 639 "Vuna/Compiler/Core/Conv.vuna"
let rec v_spineLevels = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__175), (v_spineLevels dtb__176)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Core/Conv.vuna"
let rec v_absPatternBody = (fun (mc0 : int) (mc1 : int) (mc2 : int) (mc3 : int) (mc4 : int B_dData_dList.t_List) (mc5 : Core_dTerm.t_Term) -> (match mc5 with
  | Core_dTerm.C_Term_TIf (dtb__177, dtb__178, dtb__179) -> (Core_dTerm.C_Term_TIf (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__177), ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__178), ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__179)))
  | Core_dTerm.C_Term_TCase (dtb__180, dtb__181) -> (Core_dTerm.C_Term_TCase (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__180), ((B_dData_dList.v_map (fun (alt : Core_dTerm.t_CaseAlt) -> { Core_dTerm.f_CaseAlt_caseAltName = (Core_dTerm.v_caseAltName alt); Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_caseAltBinders alt); Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_absPatternBody mc0) mc1) mc2) (mc3 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders alt)))) mc4) (Core_dTerm.v_caseAltBody alt)) })) dtb__181)))
  | Core_dTerm.C_Term_TCon (dtb__182, dtb__183) -> (Core_dTerm.C_Term_TCon (dtb__182, ((B_dData_dList.v_map (fun (p : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__183)))
  | Core_dTerm.C_Term_TApp (dtb__184, dtb__185, dtb__186) -> (Core_dTerm.C_Term_TApp (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__184), ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__185), dtb__186))
  | Core_dTerm.C_Term_TLam (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> (let slot2 = (let nd_uscrut11 = dtb__189 in (match nd_uscrut11 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (match dtb__192 with
  | { B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = dtb__194 } -> (match dtb__194 with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> (let bt2 = (match dtb__195 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__198)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__196 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__197) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_absPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__197)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb__187, dtb__188, slot2, dtb__190, ((((((v_absPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__191))))
  | Core_dTerm.C_Term_TPi (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203) -> (Core_dTerm.C_Term_TPi (dtb__199, dtb__200, dtb__201, ((((((v_absPatternBody mc0) mc1) mc2) mc3) mc4) dtb__202), ((((((v_absPatternBody mc0) mc1) mc2) (mc3 + 1)) mc4) dtb__203)))
  | Core_dTerm.C_Term_TVar (dtb__204, dtb__205, dtb__206) -> (if (dtb__205 < mc3) then mc5 else (let level = (((mc2 + mc3) - 1) - dtb__205) in (match ((v_levelPos level) mc4) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__207) -> (Core_dTerm.C_Term_TVar (dtb__204, (((mc3 + mc0) - 1) - dtb__207), dtb__206))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TVar (dtb__204, (dtb__205 + mc0), dtb__206))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> mc5
))

# 700 "Vuna/Compiler/Core/Conv.vuna"
let rec v_wrapPatternLams = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__208, dtb__209) -> (match dtb__208 with
  | { B_dData_dPair.f_Pair_first = dtb__210; B_dData_dPair.f_Pair_second = dtb__211 } -> (Core_dTerm.C_Term_TLam (dtb__210, Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_wrapPatternLams dtb__209) mc1)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Core/Conv.vuna"
let rec v_patternEnv = (fun (created : int) (depth : int) -> (if (depth <= 0) then B_dData_dList.C_List_Nil else (let level = (depth - 1) in (let lvl = (if (level < created) then level else 0) in (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_", lvl, B_dData_dList.C_List_Nil)))), ((v_patternEnv created) (depth - 1))))))))

# 720 "Vuna/Compiler/Core/Conv.vuna"
let v_patternSolution = (fun (mc0 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (Core_dTerm.C_Value_VLam (dtb__214, Core_dTerm.C_Rig_RigOmega, { Core_dTerm.f_Closure_closureEnv = ((v_patternEnv mc1) mc2); Core_dTerm.f_Closure_closureBody = ((v_wrapPatternLams dtb__213) mc3) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Core_dEval.v_eval ((v_patternEnv mc1) mc2)) mc3)
  | _ -> failwith "DT: impossible branch"
))

# 732 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaEmptyStore = (fun (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (rhs : Core_dTerm.t_Value) -> (let created = (((v_metaCreatedDepth sols) depth) m) in (let t = ((Core_dEval.v_quote depth) rhs) in (if (((Core_dTerm.v_hasMeta m) 0) t) then ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_termScopedTo created) depth) 0) B_dData_dList.C_List_Nil) t) then (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_solsCons m) rhs) sols))) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m)))))))

# 727 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaEmpty = (fun (mc0 : Core_dTerm.t_Sols) (mc1 : int) (mc2 : int) (mc3 : Core_dTerm.t_Value) -> (match mc3 with
  | Core_dTerm.C_Value_VMeta (dtb__216, dtb__217) -> (match dtb__217 with
  | B_dData_dList.C_List_Nil -> (if (dtb__216 = mc2) then (Base_dDiag.C_Check_OkC (mc0)) else ((((v_solveMetaEmptyStore mc0) mc1) mc2) mc3))
  | _ -> ((((v_solveMetaEmptyStore mc0) mc1) mc2) mc3)
)
  | _ -> ((((v_solveMetaEmptyStore mc0) mc1) mc2) mc3)
))

# 748 "Vuna/Compiler/Core/Conv.vuna"
let rec v_splitAtVals = (fun (mc0 : int) (mc1 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (mc0 = 0) then { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc1 } else (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (match ((v_splitAtVals (mc0 - 1)) dtb__219) with
  | { B_dData_dPair.f_Pair_first = dtb__220; B_dData_dPair.f_Pair_second = dtb__221 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__220)); B_dData_dPair.f_Pair_second = dtb__221 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
)))

# 245 "Vuna/Compiler/Core/Conv.vuna"
let rec v_convNatChains = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) (args : Core_dTerm.t_Value B_dData_dList.t_List) (args2 : Core_dTerm.t_Value B_dData_dList.t_List) (fuel : int) -> (match (v_natFoldValue a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__222) -> (match (v_natFoldValue b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__223) -> (if (dtb__222 = dtb__223) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_convValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_convValueListsFuel (fuel - 1)) defs) sols) depth) args) args2)
  | _ -> failwith "DT: impossible branch"
))
# 255 "Vuna/Compiler/Core/Conv.vuna"
and v_convNatNeutral = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (n1 : Core_dTerm.t_Neutral) (n2 : Core_dTerm.t_Neutral) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (v_natFoldValue a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__224) -> (match (v_natFoldValue b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> (if (dtb__224 = dtb__225) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_convNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_convNeutralFuel (fuel - 1)) defs) sols) depth) n1) n2) a) b)
  | _ -> failwith "DT: impossible branch"
))
# 265 "Vuna/Compiler/Core/Conv.vuna"
and v_convNatApplied = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (f : Core_dTerm.t_Value) (x : Core_dTerm.t_Value) (f2 : Core_dTerm.t_Value) (x2 : Core_dTerm.t_Value) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (match (v_natFoldValue a) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__226) -> (match (v_natFoldValue b) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__227) -> (if (dtb__226 = dtb__227) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) f) f2)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols2) depth) x) x2)))
  | _ -> failwith "DT: impossible branch"
))
# 335 "Vuna/Compiler/Core/Conv.vuna"
and v_convFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((v_fastSame a) b) then (Base_dDiag.C_Check_OkC (sols)) else (if (((v_fastSameSols sols) a) b) then (Base_dDiag.C_Check_OkC (sols)) else (let a2 = ((((Core_dEval.v_force defs) sols) Core_dTerm.v_defaultFuel) a) in (let y2 = ((((Core_dEval.v_force defs) sols) Core_dTerm.v_defaultFuel) b) in (match a2 with
  | Core_dTerm.C_Value_VMeta (dtb__228, dtb__229) -> (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) dtb__228) dtb__229) y2)
  | _ -> (match y2 with
  | Core_dTerm.C_Value_VMeta (dtb__230, dtb__231) -> (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) dtb__230) dtb__231) a2)
  | _ -> ((((((v_convBothFuel (fuel - 1)) defs) sols) depth) a2) y2)
)
)))))))
# 354 "Vuna/Compiler/Core/Conv.vuna"
and v_convBothFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match a with
  | Core_dTerm.C_Value_VType (dtb__232) -> (match b with
  | Core_dTerm.C_Value_VType (dtb__233) -> (if ((Core_dTerm.v_levelEq dtb__232) dtb__233) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VPi (dtb__234, dtb__235, dtb__236, dtb__237, dtb__238) -> (match b with
  | Core_dTerm.C_Value_VPi (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb__235) dtb__240) then ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__237) dtb__242)) (fun (sols2 : Core_dTerm.t_Sols) -> (let v = ((Core_dEval.v_freshVar dtb__234) depth) in ((((((v_convFuel (fuel - 1)) defs) sols2) (depth + 1)) ((Core_dEval.v_applyClosure dtb__238) v)) ((Core_dEval.v_applyClosure dtb__243) v))))) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VLam (dtb__244, dtb__245, dtb__246) -> (match b with
  | Core_dTerm.C_Value_VLam (dtb__247, dtb__248, dtb__249) -> (let v = ((Core_dEval.v_freshVar dtb__244) depth) in ((((((v_convFuel (fuel - 1)) defs) sols) (depth + 1)) ((Core_dEval.v_applyClosure dtb__246) v)) ((Core_dEval.v_applyClosure dtb__249) v)))
  | _ -> (((((((v_etaRightFuel (fuel - 1)) defs) sols) depth) dtb__244) dtb__246) b)
)
  | Core_dTerm.C_Value_VNeutral (dtb__250) -> (match b with
  | Core_dTerm.C_Value_VNeutral (dtb__251) -> (if (if (v_isNatLikeValue a) then (v_isNatLikeValue b) else false) then ((((((((v_convNatNeutral fuel) defs) sols) depth) dtb__250) dtb__251) a) b) else ((((((((v_convNeutralFuel (fuel - 1)) defs) sols) depth) dtb__250) dtb__251) a) b))
  | Core_dTerm.C_Value_VLam (dtb__252, dtb__253, dtb__254) -> (((((((v_etaLeftFuel (fuel - 1)) defs) sols) depth) a) dtb__252) dtb__254)
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VInt (dtb__255) -> (match b with
  | Core_dTerm.C_Value_VInt (dtb__256) -> (if (dtb__255 = dtb__256) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VStr (dtb__257) -> (match b with
  | Core_dTerm.C_Value_VStr (dtb__258) -> (if (dtb__257 = dtb__258) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VFloat (dtb__259) -> (match b with
  | Core_dTerm.C_Value_VFloat (dtb__260) -> (if (dtb__259 = dtb__260) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VBool (dtb__261) -> (match b with
  | Core_dTerm.C_Value_VBool (dtb__262) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb__261) dtb__262) then (Base_dDiag.C_Check_OkC (sols)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VCon (dtb__263, dtb__264) -> (match b with
  | Core_dTerm.C_Value_VCon (dtb__265, dtb__266) -> (if (dtb__263 = dtb__265) then (if (v_isNatCtorName dtb__263) then ((((((((v_convNatChains defs) sols) depth) a) b) dtb__264) dtb__266) fuel) else ((((((v_convValueListsFuel (fuel - 1)) defs) sols) depth) dtb__264) dtb__266)) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VProj (dtb__267, dtb__268, dtb__269, dtb__270, dtb__271) -> (match b with
  | Core_dTerm.C_Value_VProj (dtb__272, dtb__273, dtb__274, dtb__275, dtb__276) -> (if (if (dtb__268 = dtb__273) then (dtb__270 = dtb__275) else false) then ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__267) dtb__272) else (((v_mismatchAt depth) a) b))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VApp (dtb__277, dtb__278) -> (match b with
  | Core_dTerm.C_Value_VApp (dtb__279, dtb__280) -> (if (if (v_isNatLikeValue a) then (v_isNatLikeValue b) else false) then ((((((((((v_convNatApplied fuel) defs) sols) depth) dtb__277) dtb__278) dtb__279) dtb__280) a) b) else (let _u = (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["vapp: "; (Core_dEval.v_showValue a); " <> "; (Core_dEval.v_showValue b); " | x="; (Core_dEval.v_showValue dtb__278); " x2="; (Core_dEval.v_showValue dtb__280)])) else 0) in ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__277) dtb__279)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols2) depth) dtb__278) dtb__280)))))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VCase (dtb__281, dtb__282) -> (match b with
  | Core_dTerm.C_Value_VCase (dtb__283, dtb__284) -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__281) dtb__283)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convCaseAltsFuel (fuel - 1)) defs) sols2) depth) dtb__282) dtb__284)))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | Core_dTerm.C_Value_VIf (dtb__285, dtb__286, dtb__287) -> (match b with
  | Core_dTerm.C_Value_VIf (dtb__288, dtb__289, dtb__290) -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols) depth) dtb__285) dtb__288)) (fun (sols2 : Core_dTerm.t_Sols) -> ((Base_dCommon.v_bind ((((((v_convFuel (fuel - 1)) defs) sols2) depth) dtb__286) dtb__289)) (fun (sols3 : Core_dTerm.t_Sols) -> ((((((v_convFuel (fuel - 1)) defs) sols3) depth) dtb__287) dtb__290)))))
  | _ -> (((v_mismatchAt depth) a) b)
)
  | _ -> (((v_mismatchAt depth) a) b)
)))
# 434 "Vuna/Compiler/Core/Conv.vuna"
and v_etaLeftFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_Value) (name : string) (clo : Core_dTerm.t_Closure) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (let v = ((Core_dEval.v_freshVar name) depth) in ((((((v_convFuel (fuel - 1)) defs) sols) (depth + 1)) ((Core_dEval.v_applyValue a) v)) ((Core_dEval.v_applyClosure clo) v)))))
# 443 "Vuna/Compiler/Core/Conv.vuna"
and v_etaRightFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (name : string) (clo : Core_dTerm.t_Closure) (b : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (let v = ((Core_dEval.v_freshVar name) depth) in ((((((v_convFuel (fuel - 1)) defs) sols) (depth + 1)) ((Core_dEval.v_applyClosure clo) v)) ((Core_dEval.v_applyValue b) v)))))
# 452 "Vuna/Compiler/Core/Conv.vuna"
and v_convNeutralFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (n1 : Core_dTerm.t_Neutral) (n2 : Core_dTerm.t_Neutral) (v1 : Core_dTerm.t_Value) (v2 : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match n1 with
  | Core_dTerm.C_Neutral_NVar (dtb__291, dtb__292, dtb__293) -> (match n2 with
  | Core_dTerm.C_Neutral_NVar (dtb__294, dtb__295, dtb__296) -> (if (dtb__292 = dtb__295) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) dtb__293) dtb__296) v1) v2) else (((v_mismatchAt depth) v1) v2))
  | _ -> (((v_mismatchAt depth) v1) v2)
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__297, dtb__298) -> (match n2 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__299, dtb__300) -> (if (dtb__297 = dtb__299) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) dtb__298) dtb__300) v1) v2) else (((v_mismatchAt depth) v1) v2))
  | _ -> (((v_mismatchAt depth) v1) v2)
)
  | _ -> failwith "DT: impossible branch"
)))
# 467 "Vuna/Compiler/Core/Conv.vuna"
and v_convSpinesFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc2 : Core_dTerm.t_Sols) (mc3 : int) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) (mc6 : Core_dTerm.t_Value) (mc7 : Core_dTerm.t_Value) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__301, dtb__302) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__303, dtb__304) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else ((Base_dCommon.v_bind ((((((v_convFuel (mc0 - 1)) mc1) mc2) mc3) dtb__301) dtb__303)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (mc0 - 1)) mc1) sols2) mc3) dtb__302) dtb__304) mc6) mc7))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (((v_mismatchAt mc3) mc6) mc7))
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (((v_mismatchAt mc3) mc6) mc7))
)
  | _ -> failwith "DT: impossible branch"
))
# 479 "Vuna/Compiler/Core/Conv.vuna"
and v_convValueListsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc2 : Core_dTerm.t_Sols) (mc3 : int) (mc4 : Core_dTerm.t_Value B_dData_dList.t_List) (mc5 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__305, dtb__306) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__307, dtb__308) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else ((Base_dCommon.v_bind ((((((v_convFuel (mc0 - 1)) mc1) mc2) mc3) dtb__305) dtb__307)) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((v_convValueListsFuel (mc0 - 1)) mc1) sols2) mc3) dtb__306) dtb__308))))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCtorArity))
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
# 492 "Vuna/Compiler/Core/Conv.vuna"
and v_convCaseAltsFuel = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (mc2 : Core_dTerm.t_Sols) (mc3 : int) (mc4 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) (mc5 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__309, dtb__310) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((dtb__309).Core_dTerm.f_VCaseAlt_vCaseAltName = (dtb__311).Core_dTerm.f_VCaseAlt_vCaseAltName) then (if ((B_dData_dList.v_length (dtb__309).Core_dTerm.f_VCaseAlt_vCaseAltBinders) = (B_dData_dList.v_length (dtb__311).Core_dTerm.f_VCaseAlt_vCaseAltBinders)) then (match ((((((v_convOneAltFuel (mc0 - 1)) mc1) mc2) mc3) dtb__309) dtb__311) with
  | Base_dDiag.C_Check_ErrC (dtb__313) -> (Base_dDiag.C_Check_ErrC (dtb__313))
  | Base_dDiag.C_Check_OkC (dtb__314) -> ((((((v_convCaseAltsFuel (mc0 - 1)) mc1) dtb__314) mc3) dtb__310) dtb__312)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseVars ((dtb__309).Core_dTerm.f_VCaseAlt_vCaseAltName))) (dtb__309).Core_dTerm.f_VCaseAlt_vCaseAltName)) else (((Base_dDiagnostics_dTc.v_tcErr2NoLoc (Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseBranch ((dtb__309).Core_dTerm.f_VCaseAlt_vCaseAltName, (dtb__311).Core_dTerm.f_VCaseAlt_vCaseAltName))) (dtb__309).Core_dTerm.f_VCaseAlt_vCaseAltName) (dtb__311).Core_dTerm.f_VCaseAlt_vCaseAltName)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseCount))
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (mc2)))
  | _ -> (if (mc0 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
# 509 "Vuna/Compiler/Core/Conv.vuna"
and v_convOneAltFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (a : Core_dTerm.t_VCaseAlt) (b : Core_dTerm.t_VCaseAlt) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (let bs = (a).Core_dTerm.f_VCaseAlt_vCaseAltBinders in (let n = (B_dData_dList.v_length bs) in (let args = (((Core_dEval.v_argValsAt bs) depth) 0) in ((((((v_convFuel (fuel - 1)) defs) sols) (depth + n)) ((Core_dEval.v_applyClosureBinder (a).Core_dTerm.f_VCaseAlt_vCaseAltClosure) args)) ((Core_dEval.v_applyClosureBinder (b).Core_dTerm.f_VCaseAlt_vCaseAltClosure) args)))))))
# 755 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaHoLegacyFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (rhs : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match rhs with
  | Core_dTerm.C_Value_VMeta (dtb__315, dtb__316) -> (match ((Core_dTerm.v_solsLookup dtb__315) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__317) -> ((((((v_convFuel (fuel - 1)) defs) sols) depth) ((Core_dEval.v_applySpine (Core_dTerm.C_Value_VMeta (m, sp))) B_dData_dList.C_List_Nil)) ((Core_dEval.v_applySpine dtb__317) dtb__316))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (m = dtb__315) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__316) (Core_dTerm.C_Value_VMeta (m, sp))) rhs) else ((Base_dCommon.v_bind (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VMeta (dtb__315, B_dData_dList.C_List_Nil)))) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__316) (Core_dTerm.C_Value_VMeta (m, sp))) rhs))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VNeutral (dtb__318) -> (match dtb__318 with
  | Core_dTerm.C_Neutral_NGlobal (dtb__319, dtb__320) -> (((((((((v_solveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Core_dTerm.C_Value_VNeutral (dtb__318))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb__319, B_dData_dList.C_List_Nil))))) dtb__320)
  | Core_dTerm.C_Neutral_NVar (dtb__321, dtb__322, dtb__323) -> (((((((((v_solveMetaHeadLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) (Core_dTerm.C_Value_VNeutral (dtb__318))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__321, dtb__322, B_dData_dList.C_List_Nil))))) dtb__323)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m))
)))
# 772 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaHeadLegacyFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (whole : Core_dTerm.t_Value) (headVal : Core_dTerm.t_Value) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((B_dData_dList.v_length args) >= (B_dData_dList.v_length sp)) then (let extra = (bi_natSub (B_dData_dList.v_length args) (B_dData_dList.v_length sp)) in (match ((v_splitAtVals extra) args) with
  | { B_dData_dPair.f_Pair_first = dtb__324; B_dData_dPair.f_Pair_second = dtb__325 } -> ((Base_dCommon.v_bind (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) B_dData_dList.C_List_Nil) ((Core_dEval.v_applySpine headVal) dtb__324))) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__325) (Core_dTerm.C_Value_VMeta (m, sp))) whole)))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((bi_strFromInt m)))) (bi_strFromInt m)))))
# 784 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaPattern = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (rhs : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match (v_patternSpineOf sp) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_solveMetaHoLegacyFuel (fuel - 1)) defs) sols) depth) m) sp) rhs)
  | B_dData_dMaybe.C_Maybe_Just (dtb__326) -> (let created = (((v_metaCreatedDepth sols) depth) m) in (let t = ((Core_dEval.v_quote depth) rhs) in (let n = (B_dData_dList.v_length dtb__326) in (let levels = (v_spineLevels dtb__326) in (if (((Core_dTerm.v_hasMeta m) 0) t) then ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveOccurs ((bi_strFromInt m)))) (bi_strFromInt m)) else (if (((((v_termScopedTo created) depth) 0) dtb__326) t) then (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_solsCons m) ((((v_patternSolution dtb__326) created) depth) ((((((v_absPatternBody n) created) depth) 0) levels) t))) sols))) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveMetavar ((bi_strFromInt m)))) (bi_strFromInt m))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 799 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaFuel = (fun (fuel : int) (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (sp : Core_dTerm.t_Value B_dData_dList.t_List) (rhs : Core_dTerm.t_Value) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "conv") else (match ((Core_dTerm.v_solsLookup m) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__327) -> ((((((v_convFuel (fuel - 1)) defs) sols) depth) ((Core_dEval.v_applySpine dtb__327) sp)) rhs)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match sp with
  | B_dData_dList.C_List_Nil -> ((((v_solveMetaEmpty sols) depth) m) rhs)
  | _ -> (match rhs with
  | Core_dTerm.C_Value_VMeta (dtb__328, dtb__329) -> (if (dtb__328 = m) then ((((((((v_convSpinesFuel (fuel - 1)) defs) sols) depth) sp) dtb__329) (Core_dTerm.C_Value_VMeta (m, sp))) rhs) else (match ((Core_dTerm.v_solsLookup dtb__328) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__330) -> (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) sp) ((Core_dEval.v_applySpine dtb__330) dtb__329))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_solveMetaFuel (fuel - 1)) defs) sols) depth) m) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VMeta (dtb__328, B_dData_dList.C_List_Nil)))) (fun (sols2 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (fuel - 1)) defs) sols2) depth) sp) dtb__329) (Core_dTerm.C_Value_VMeta (m, sp))) rhs)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((((v_solveMetaPattern (fuel - 1)) defs) sols) depth) m) sp) rhs)
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 821 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaNew = (fun (defs : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (sols : Core_dTerm.t_Sols) (depth : int) (m : int) (rhs : Core_dTerm.t_Value) -> ((((v_solveMetaEmpty sols) depth) m) rhs))

# 824 "Vuna/Compiler/Core/Conv.vuna"
let v_conv = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) -> (let _u = (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.conv") 1) in (let _u = (if (dtp_debug_on 0) then (dtp_debug_line (String.concat "" ["conv-in: "; (Core_dTerm.v_showTerm ((Core_dEval.v_quote a3) a4)); " <> "; (Core_dTerm.v_showTerm ((Core_dEval.v_quote a3) a5)); " |v: "; ((Core_dEval.v_showValueAt a3) a4); " <> "; ((Core_dEval.v_showValueAt a3) a5); " @"; (bi_strFromInt a3)])) else 0) in ((((((v_convFuel ((v_convFuelFor a4) a5)) a1) a2) a3) a4) a5))))

# 833 "Vuna/Compiler/Core/Conv.vuna"
let v_convBoth = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : Core_dTerm.t_Value) -> ((((((v_convBothFuel ((v_convFuelFor a4) a5)) a1) a2) a3) a4) a5))

# 836 "Vuna/Compiler/Core/Conv.vuna"
let v_convCaseAlts = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) (a5 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((((v_convCaseAltsFuel v_convFuelBase) a1) a2) a3) a4) a5))

# 839 "Vuna/Compiler/Core/Conv.vuna"
let v_convOneAlt = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_VCaseAlt) (a5 : Core_dTerm.t_VCaseAlt) -> ((((((v_convOneAltFuel v_convFuelBase) a1) a2) a3) a4) a5))

# 842 "Vuna/Compiler/Core/Conv.vuna"
let v_convValueLists = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value B_dData_dList.t_List) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) -> ((((((v_convValueListsFuel v_convFuelBase) a1) a2) a3) a4) a5))

# 845 "Vuna/Compiler/Core/Conv.vuna"
let v_convNeutral = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Neutral) (a5 : Core_dTerm.t_Neutral) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Value) -> ((((((((v_convNeutralFuel v_convFuelBase) a1) a2) a3) a4) a5) a6) a7))

# 848 "Vuna/Compiler/Core/Conv.vuna"
let v_convSpines = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value B_dData_dList.t_List) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) (a7 : Core_dTerm.t_Value) -> ((((((((v_convSpinesFuel v_convFuelBase) a1) a2) a3) a4) a5) a6) a7))

# 851 "Vuna/Compiler/Core/Conv.vuna"
let v_etaLeft = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : Core_dTerm.t_Value) (a5 : string) (a6 : Core_dTerm.t_Closure) -> (((((((v_etaLeftFuel v_convFuelBase) a1) a2) a3) a4) a5) a6))

# 854 "Vuna/Compiler/Core/Conv.vuna"
let v_etaRight = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : string) (a5 : Core_dTerm.t_Closure) (a6 : Core_dTerm.t_Value) -> (((((((v_etaRightFuel v_convFuelBase) a1) a2) a3) a4) a5) a6))

# 857 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMeta = (fun (a1 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (a2 : Core_dTerm.t_Sols) (a3 : int) (a4 : int) (a5 : Core_dTerm.t_Value B_dData_dList.t_List) (a6 : Core_dTerm.t_Value) -> (let _u = (((Base_dObs.v_obsCountAt 2) "vuna.counter.meta.solve") 1) in (((((((v_solveMetaFuel v_convFuelBase) a1) a2) a3) a4) a5) a6)))
