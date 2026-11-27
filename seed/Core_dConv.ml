open Vuna_runtime
# 79 "Vuna/Compiler/Core/Conv.vuna"
let v_isNatCtorName = (fun (dtb_u_u1 : string) -> (if (dtb_u_u1 = Base_dIntrinsics.v_natZeroCtor) then true else (dtb_u_u1 = Base_dIntrinsics.v_natSuccCtor)))

# 83 "Vuna/Compiler/Core/Conv.vuna"
let v_natChainMaxValue = 4611686018427387903

# 86 "Vuna/Compiler/Core/Conv.vuna"
let v_natChainNextValue = (fun (dtb_u_u2 : int) -> (if (dtb_u_u2 >= v_natChainMaxValue) then v_natChainMaxValue else (dtb_u_u2 + 1)))

# 94 "Vuna/Compiler/Core/Conv.vuna"
let rec v_natFoldGo = (fun (dtb_u_u3 : int) (dtb_u_u4 : Core_dTerm.t_Value) -> (if (dtb_u_u3 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u4 with
  | Core_dTerm.C_Value_VCon (dtb_u_u5, dtb_u_u6) -> (((v_natFoldArgs (dtb_u_u3 - 1)) dtb_u_u5) dtb_u_u6)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u7) -> (match dtb_u_u7 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u8, dtb_u_u9) -> (((v_natFoldArgs (dtb_u_u3 - 1)) dtb_u_u8) dtb_u_u9)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Core_dTerm.C_Value_VApp (dtb_u_u10, dtb_u_u11) -> (((v_natFoldApplied (dtb_u_u3 - 1)) dtb_u_u10) dtb_u_u11)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))
# 108 "Vuna/Compiler/Core/Conv.vuna"
and v_natFoldArgs = (fun (dtb_u_u12 : int) (dtb_u_u13 : string) (dtb_u_u14 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u13 = Base_dIntrinsics.v_natZeroCtor) then (match dtb_u_u14 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u13 = Base_dIntrinsics.v_natSuccCtor) then (let dtb_u_u15 = dtb_u_u14 in (match dtb_u_u15 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u16, dtb_u_u17) -> (match dtb_u_u17 with
  | B_dData_dList.C_List_Nil -> ((v_natFoldSucc dtb_u_u12) dtb_u_u16)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))
# 121 "Vuna/Compiler/Core/Conv.vuna"
and v_natFoldApplied = (fun (dtb_u_u18 : int) (dtb_u_u19 : Core_dTerm.t_Value) (dtb_u_u20 : Core_dTerm.t_Value) -> (match dtb_u_u19 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u21) -> (let dtb_u_u22 = dtb_u_u21 in (match dtb_u_u22 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u23, dtb_u_u24) -> (match dtb_u_u24 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u23 = Base_dIntrinsics.v_natSuccCtor) then ((v_natFoldSucc dtb_u_u18) dtb_u_u20) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Core_dTerm.C_Value_VCon (dtb_u_u25, dtb_u_u26) -> (match dtb_u_u26 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u25 = Base_dIntrinsics.v_natSuccCtor) then ((v_natFoldSucc dtb_u_u18) dtb_u_u20) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
# 129 "Vuna/Compiler/Core/Conv.vuna"
and v_natFoldSucc = (fun (dtb_u_u27 : int) (dtb_u_u28 : Core_dTerm.t_Value) -> (match ((v_natFoldGo dtb_u_u27) dtb_u_u28) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u29) -> (B_dData_dMaybe.C_Maybe_Just ((v_natChainNextValue dtb_u_u29)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Core/Conv.vuna"
let v_natFoldValue = (fun (dtb_u_u30 : Core_dTerm.t_Value) -> ((v_natFoldGo 1000000) dtb_u_u30))

# 135 "Vuna/Compiler/Core/Conv.vuna"
let v_sameNatValue = (fun (dtb_u_u31 : Core_dTerm.t_Value) (dtb_u_u32 : Core_dTerm.t_Value) -> (match (v_natFoldValue dtb_u_u31) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u33) -> (match (v_natFoldValue dtb_u_u32) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u34) -> (dtb_u_u33 = dtb_u_u34)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Core/Conv.vuna"
let v_isNatLikeHead = (fun (dtb_u_u35 : Core_dTerm.t_Value) -> (match dtb_u_u35 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u36) -> (match dtb_u_u36 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u37, dtb_u_u38) -> (dtb_u_u37 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb_u_u39, dtb_u_u40) -> (dtb_u_u39 = Base_dIntrinsics.v_natSuccCtor)
  | _ -> false
))

# 145 "Vuna/Compiler/Core/Conv.vuna"
let v_isNatLikeValue = (fun (dtb_u_u41 : Core_dTerm.t_Value) -> (match dtb_u_u41 with
  | Core_dTerm.C_Value_VApp (dtb_u_u42, dtb_u_u43) -> (v_isNatLikeHead dtb_u_u42)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u44) -> (match dtb_u_u44 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u45, dtb_u_u46) -> (v_isNatCtorName dtb_u_u45)
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb_u_u47, dtb_u_u48) -> (v_isNatCtorName dtb_u_u47)
  | _ -> false
))

# 166 "Vuna/Compiler/Core/Conv.vuna"
let rec v_natPrefixGo = (fun (dtb_u_u49 : int) (dtb_u_u50 : Core_dTerm.t_Value) -> (if (dtb_u_u49 <= 0) then 100000 else (match dtb_u_u50 with
  | Core_dTerm.C_Value_VCon (dtb_u_u51, dtb_u_u52) -> (if (dtb_u_u51 = Base_dIntrinsics.v_natSuccCtor) then (let dtb_u_u53 = dtb_u_u52 in (match dtb_u_u53 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (match dtb_u_u55 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_natPrefixGo (dtb_u_u49 - 1)) dtb_u_u54))
  | _ -> 0
)
  | _ -> 0
)) else 0)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u56) -> (match dtb_u_u56 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u57, dtb_u_u58) -> (if (dtb_u_u57 = Base_dIntrinsics.v_natSuccCtor) then (let dtb_u_u59 = dtb_u_u58 in (match dtb_u_u59 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u60, dtb_u_u61) -> (match dtb_u_u61 with
  | B_dData_dList.C_List_Nil -> (1 + ((v_natPrefixGo (dtb_u_u49 - 1)) dtb_u_u60))
  | _ -> 0
)
  | _ -> 0
)) else 0)
  | _ -> 0
)
  | Core_dTerm.C_Value_VApp (dtb_u_u62, dtb_u_u63) -> (if (v_isNatLikeHead dtb_u_u62) then (1 + ((v_natPrefixGo (dtb_u_u49 - 1)) dtb_u_u63)) else 0)
  | _ -> 0
)))

# 163 "Vuna/Compiler/Core/Conv.vuna"
let v_natPrefixDepth = (fun (dtb_u_u64 : Core_dTerm.t_Value) -> ((v_natPrefixGo 100000) dtb_u_u64))

# 199 "Vuna/Compiler/Core/Conv.vuna"
let v_convFuelBase = 4096

# 219 "Vuna/Compiler/Core/Conv.vuna"
let rec v_natPrefixMax = (fun (dtb_u_u65 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u65 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (let dtb_u_u68 = (if (v_isNatLikeValue dtb_u_u66) then (v_natPrefixDepth dtb_u_u66) else 0) in (let dtb_u_u69 = (v_natPrefixMax dtb_u_u67) in (if (dtb_u_u68 >= dtb_u_u69) then dtb_u_u68 else dtb_u_u69)))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Core/Conv.vuna"
let v_convNatNear = (fun (dtb_u_u70 : Core_dTerm.t_Value) -> (if (v_isNatLikeValue dtb_u_u70) then (v_natPrefixDepth dtb_u_u70) else (match dtb_u_u70 with
  | Core_dTerm.C_Value_VCon (dtb_u_u71, dtb_u_u72) -> (v_natPrefixMax dtb_u_u72)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u73) -> (match dtb_u_u73 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u74, dtb_u_u75) -> (v_natPrefixMax dtb_u_u75)
  | Core_dTerm.C_Neutral_NVar (dtb_u_u76, dtb_u_u77, dtb_u_u78) -> (v_natPrefixMax dtb_u_u78)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VApp (dtb_u_u79, dtb_u_u80) -> (if (v_isNatLikeValue dtb_u_u80) then (v_natPrefixDepth dtb_u_u80) else 0)
  | _ -> 0
)))

# 234 "Vuna/Compiler/Core/Conv.vuna"
let v_convFuelMax = 100000

# 237 "Vuna/Compiler/Core/Conv.vuna"
let v_convNatFuel = (fun (dtb_u_u81 : int) -> (let dtb_u_u82 = (v_convFuelBase + (4 * dtb_u_u81)) in (if (dtb_u_u82 > v_convFuelMax) then v_convFuelMax else dtb_u_u82)))

# 227 "Vuna/Compiler/Core/Conv.vuna"
let v_convFuelFor = (fun (dtb_u_u83 : Core_dTerm.t_Value) (dtb_u_u84 : Core_dTerm.t_Value) -> (let dtb_u_u85 = (v_convNatNear dtb_u_u83) in (let dtb_u_u86 = (v_convNatNear dtb_u_u84) in (v_convNatFuel (if (dtb_u_u85 >= dtb_u_u86) then dtb_u_u85 else dtb_u_u86)))))

# 280 "Vuna/Compiler/Core/Conv.vuna"
let v_isNilList = (fun dtb_u_u88 -> (match dtb_u_u88 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 284 "Vuna/Compiler/Core/Conv.vuna"
let v_sameNeutralAtom = (fun (dtb_u_u89 : Core_dTerm.t_Neutral) (dtb_u_u90 : Core_dTerm.t_Neutral) -> (match dtb_u_u89 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u91, dtb_u_u92, dtb_u_u93) -> (match dtb_u_u90 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u94, dtb_u_u95, dtb_u_u96) -> (if (if (if (dtb_u_u91 = dtb_u_u94) then (dtb_u_u92 = dtb_u_u95) else false) then (v_isNilList dtb_u_u93) else false) then (v_isNilList dtb_u_u96) else false)
  | _ -> false
)
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u97, dtb_u_u98) -> (match dtb_u_u90 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u99, dtb_u_u100) -> (if (if (dtb_u_u97 = dtb_u_u99) then (v_isNilList dtb_u_u98) else false) then (v_isNilList dtb_u_u100) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 26 "Vuna/Compiler/Core/Conv.vuna"
let v_fastSame = (fun (dtb_u_u101 : Core_dTerm.t_Value) (dtb_u_u102 : Core_dTerm.t_Value) -> (match dtb_u_u101 with
  | Core_dTerm.C_Value_VType (dtb_u_u103) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VType (dtb_u_u104) -> ((Core_dTerm.v_levelEq dtb_u_u103) dtb_u_u104)
  | _ -> false
)
  | Core_dTerm.C_Value_VInt (dtb_u_u105) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VInt (dtb_u_u106) -> (dtb_u_u105 = dtb_u_u106)
  | _ -> false
)
  | Core_dTerm.C_Value_VStr (dtb_u_u107) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VStr (dtb_u_u108) -> (dtb_u_u107 = dtb_u_u108)
  | _ -> false
)
  | Core_dTerm.C_Value_VFloat (dtb_u_u109) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u110) -> (dtb_u_u109 = dtb_u_u110)
  | _ -> false
)
  | Core_dTerm.C_Value_VBool (dtb_u_u111) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VBool (dtb_u_u112) -> (if dtb_u_u111 then dtb_u_u112 else (B_dData_dBool.v_not dtb_u_u112))
  | _ -> false
)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u113) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u114) -> (if (if (v_isNatLikeValue dtb_u_u101) then (v_isNatLikeValue dtb_u_u102) else false) then ((v_sameNatValue dtb_u_u101) dtb_u_u102) else ((v_sameNeutralAtom dtb_u_u113) dtb_u_u114))
  | _ -> false
)
  | Core_dTerm.C_Value_VCon (dtb_u_u115, dtb_u_u116) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VCon (dtb_u_u117, dtb_u_u118) -> (if (if (if (dtb_u_u115 = dtb_u_u117) then (v_isNilList dtb_u_u116) else false) then (v_isNilList dtb_u_u118) else false) then true else (if (if (v_isNatCtorName dtb_u_u115) then (v_isNatCtorName dtb_u_u117) else false) then ((v_sameNatValue dtb_u_u101) dtb_u_u102) else false))
  | _ -> false
)
  | Core_dTerm.C_Value_VApp (dtb_u_u119, dtb_u_u120) -> (match dtb_u_u102 with
  | Core_dTerm.C_Value_VApp (dtb_u_u121, dtb_u_u122) -> (if (if (v_isNatLikeValue dtb_u_u101) then (v_isNatLikeValue dtb_u_u102) else false) then ((v_sameNatValue dtb_u_u101) dtb_u_u102) else false)
  | _ -> false
)
  | _ -> false
))

# 295 "Vuna/Compiler/Core/Conv.vuna"
let v_zonkMetaValue = (fun (dtb_u_u123 : Core_dTerm.t_Sols) (dtb_u_u124 : Core_dTerm.t_Value) -> (match dtb_u_u124 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u125, dtb_u_u126) -> (match ((Core_dTerm.v_solsLookup dtb_u_u125) dtb_u_u123) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u127) -> ((Core_dEval.v_applySpine dtb_u_u127) dtb_u_u126)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u124
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dtb_u_u124
))

# 306 "Vuna/Compiler/Core/Conv.vuna"
let rec v_sameSpineFast = (fun (dtb_u_u128 : Core_dTerm.t_Sols) (dtb_u_u129 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u130 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u129 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u131, dtb_u_u132) -> (match dtb_u_u130 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u133, dtb_u_u134) -> (if ((v_fastSame ((v_zonkMetaValue dtb_u_u128) dtb_u_u131)) ((v_zonkMetaValue dtb_u_u128) dtb_u_u133)) then (((v_sameSpineFast dtb_u_u128) dtb_u_u132) dtb_u_u134) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u130 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Core/Conv.vuna"
let v_fastSameSols = (fun (dtb_u_u135 : Core_dTerm.t_Sols) (dtb_u_u136 : Core_dTerm.t_Value) (dtb_u_u137 : Core_dTerm.t_Value) -> (match dtb_u_u136 with
  | Core_dTerm.C_Value_VApp (dtb_u_u138, dtb_u_u139) -> (match dtb_u_u137 with
  | Core_dTerm.C_Value_VApp (dtb_u_u140, dtb_u_u141) -> (if ((v_fastSame ((v_zonkMetaValue dtb_u_u135) dtb_u_u138)) ((v_zonkMetaValue dtb_u_u135) dtb_u_u140)) then ((v_fastSame ((v_zonkMetaValue dtb_u_u135) dtb_u_u139)) ((v_zonkMetaValue dtb_u_u135) dtb_u_u141)) else false)
  | _ -> false
)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u142) -> (match dtb_u_u137 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u143) -> (match dtb_u_u142 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u144, dtb_u_u145) -> (match dtb_u_u143 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u146, dtb_u_u147) -> (if (dtb_u_u144 = dtb_u_u146) then (((v_sameSpineFast dtb_u_u135) dtb_u_u145) dtb_u_u147) else false)
  | _ -> false
)
  | Core_dTerm.C_Neutral_NVar (dtb_u_u148, dtb_u_u149, dtb_u_u150) -> (match dtb_u_u143 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u151, dtb_u_u152, dtb_u_u153) -> (if (if (dtb_u_u148 = dtb_u_u151) then (dtb_u_u149 = dtb_u_u152) else false) then (((v_sameSpineFast dtb_u_u135) dtb_u_u150) dtb_u_u153) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)
  | _ -> false
))

# 520 "Vuna/Compiler/Core/Conv.vuna"
let v_mismatchAt = (fun (dtb_u_u155 : int) (dtb_u_u156 : Core_dTerm.t_Value) (dtb_u_u157 : Core_dTerm.t_Value) -> (let dtb_u_u158 = (((Base_dObs.v_obsCountAt 3) "vuna.counter.conv.mismatch") 1) in (let dtb_u_u159 = ((Core_dEval.v_showValueAt dtb_u_u155) dtb_u_u156) in (let dtb_u_u160 = ((Core_dEval.v_showValueAt dtb_u_u155) dtb_u_u157) in ((Base_dDiagnostics_dTc.v_tcTypeMismatchNoLoc dtb_u_u159) dtb_u_u160)))))

# 542 "Vuna/Compiler/Core/Conv.vuna"
let v_metaCreatedDepth = (fun (dtb_u_u161 : Core_dTerm.t_Sols) (dtb_u_u162 : int) (dtb_u_u163 : int) -> (match ((Core_dTerm.v_solsDepthAt dtb_u_u163) dtb_u_u161) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u164) -> dtb_u_u164
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u162
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Core/Conv.vuna"
let v_isNilSpine = (fun (dtb_u_u165 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u165 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
))

# 628 "Vuna/Compiler/Core/Conv.vuna"
let rec v_memLevel = (fun (dtb_u_u166 : int) (dtb_u_u167 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u167 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u168, dtb_u_u169) -> (match dtb_u_u168 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u170; B_dData_dPair.f_Pair_second = dtb_u_u171 } -> (if (dtb_u_u171 = dtb_u_u166) then true else ((v_memLevel dtb_u_u166) dtb_u_u169))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Core/Conv.vuna"
let rec v_termScopedTo = (fun (dtb_u_u172 : int) (dtb_u_u173 : int) (dtb_u_u174 : int) (dtb_u_u175 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u176 : Core_dTerm.t_Term) -> (match dtb_u_u176 with
  | Core_dTerm.C_Term_TIf (dtb_u_u177, dtb_u_u178, dtb_u_u179) -> (if (if (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u177) then (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u178) else false) then (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u179) else false)
  | Core_dTerm.C_Term_TBool (dtb_u_u180) -> true
  | Core_dTerm.C_Term_TFloat (dtb_u_u181) -> true
  | Core_dTerm.C_Term_TStr (dtb_u_u182) -> true
  | Core_dTerm.C_Term_TInt (dtb_u_u183) -> true
  | Core_dTerm.C_Term_TCase (dtb_u_u184, dtb_u_u185) -> (if (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u184) then (((((v_altsScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u185) else false)
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u186, dtb_u_u187, dtb_u_u188, dtb_u_u189, dtb_u_u190) -> (if (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u186) then (((((v_termScopedTo dtb_u_u172) dtb_u_u173) (dtb_u_u174 + (B_dData_dList.v_length dtb_u_u188))) dtb_u_u175) dtb_u_u190) else false)
  | Core_dTerm.C_Term_TProj (dtb_u_u191, dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195) -> (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u191)
  | Core_dTerm.C_Term_TRecord (dtb_u_u196, dtb_u_u197) -> (((((v_argsScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u197)
  | Core_dTerm.C_Term_TMk (dtb_u_u198, dtb_u_u199) -> (((((v_argsScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u199)
  | Core_dTerm.C_Term_TCon (dtb_u_u200, dtb_u_u201) -> (((((v_argsScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u201)
  | Core_dTerm.C_Term_TApp (dtb_u_u202, dtb_u_u203, dtb_u_u204) -> (if (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u202) then (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u203) else false)
  | Core_dTerm.C_Term_TLam (dtb_u_u205, dtb_u_u206, dtb_u_u207, dtb_u_u208, dtb_u_u209) -> (let dtb_u_u210 = (let dtb_u_u211 = dtb_u_u207 in (match dtb_u_u211 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u212) -> (match dtb_u_u212 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u213; B_dData_dPair.f_Pair_second = dtb_u_u214 } -> (match dtb_u_u214 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u215; B_dData_dPair.f_Pair_second = dtb_u_u216 } -> (match dtb_u_u215 with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u217) -> (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u217)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u210 then (((((v_termScopedTo dtb_u_u172) dtb_u_u173) (dtb_u_u174 + 1)) dtb_u_u175) dtb_u_u209) else false))
  | Core_dTerm.C_Term_TPi (dtb_u_u218, dtb_u_u219, dtb_u_u220, dtb_u_u221, dtb_u_u222) -> (if (((((v_termScopedTo dtb_u_u172) dtb_u_u173) dtb_u_u174) dtb_u_u175) dtb_u_u221) then (((((v_termScopedTo dtb_u_u172) dtb_u_u173) (dtb_u_u174 + 1)) dtb_u_u175) dtb_u_u222) else false)
  | Core_dTerm.C_Term_TType (dtb_u_u223) -> true
  | Core_dTerm.C_Term_TGlobal (dtb_u_u224) -> true
  | Core_dTerm.C_Term_TMeta (dtb_u_u225) -> true
  | Core_dTerm.C_Term_TVar (dtb_u_u226, dtb_u_u227, dtb_u_u228) -> (if (dtb_u_u227 < 0) then false else (if (dtb_u_u227 < dtb_u_u174) then true else (let dtb_u_u229 = (((dtb_u_u173 + dtb_u_u174) - 1) - dtb_u_u227) in (if (dtb_u_u229 >= 0) then (if (dtb_u_u229 < dtb_u_u172) then true else ((v_memLevel dtb_u_u229) dtb_u_u175)) else false))))
  | _ -> failwith "DT: impossible branch"
))
# 596 "Vuna/Compiler/Core/Conv.vuna"
and v_argsScopedTo = (fun (dtb_u_u230 : int) (dtb_u_u231 : int) (dtb_u_u232 : int) (dtb_u_u233 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u234 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u234 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u235, dtb_u_u236) -> (match dtb_u_u235 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u237; B_dData_dPair.f_Pair_second = dtb_u_u238 } -> (if (((((v_termScopedTo dtb_u_u230) dtb_u_u231) dtb_u_u232) dtb_u_u233) dtb_u_u237) then (((((v_argsScopedTo dtb_u_u230) dtb_u_u231) dtb_u_u232) dtb_u_u233) dtb_u_u236) else false)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))
# 601 "Vuna/Compiler/Core/Conv.vuna"
and v_altsScopedTo = (fun (dtb_u_u239 : int) (dtb_u_u240 : int) (dtb_u_u241 : int) (dtb_u_u242 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u243 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u243 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u244, dtb_u_u245) -> (if (((((v_termScopedTo dtb_u_u239) dtb_u_u240) (dtb_u_u241 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders dtb_u_u244)))) dtb_u_u242) (Core_dTerm.v_caseAltBody dtb_u_u244)) then (((((v_altsScopedTo dtb_u_u239) dtb_u_u240) dtb_u_u241) dtb_u_u242) dtb_u_u245) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Core/Conv.vuna"
let rec v_patternSpineOf = (fun (dtb_u_u246 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u246 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u247, dtb_u_u248) -> (match dtb_u_u247 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u249) -> (match dtb_u_u249 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u250, dtb_u_u251, dtb_u_u252) -> (if (v_isNilSpine dtb_u_u252) then (match (v_patternSpineOf dtb_u_u248) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u253) -> (if ((v_memLevel dtb_u_u251) dtb_u_u253) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u250; B_dData_dPair.f_Pair_second = dtb_u_u251 }, dtb_u_u253)))))
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
let rec v_levelPosGo = (fun (dtb_u_u254 : int) (dtb_u_u255 : int B_dData_dList.t_List) (dtb_u_u256 : int) -> (match dtb_u_u255 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u257, dtb_u_u258) -> (if (dtb_u_u257 = dtb_u_u254) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u256)) else (((v_levelPosGo dtb_u_u254) dtb_u_u258) (dtb_u_u256 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 632 "Vuna/Compiler/Core/Conv.vuna"
let v_levelPos = (fun (dtb_u_u259 : int) (dtb_u_u260 : int B_dData_dList.t_List) -> (((v_levelPosGo dtb_u_u259) dtb_u_u260) 0))

# 639 "Vuna/Compiler/Core/Conv.vuna"
let[@tail_mod_cons] rec v_spineLevels = (fun (dtb_u_u261 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u261 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u262, dtb_u_u263) -> (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb_u_u262), (v_spineLevels dtb_u_u263)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Core/Conv.vuna"
let rec v_absPatternBody = (fun (dtb_u_u264 : int) (dtb_u_u265 : int) (dtb_u_u266 : int) (dtb_u_u267 : int) (dtb_u_u268 : int B_dData_dList.t_List) (dtb_u_u269 : Core_dTerm.t_Term) -> (match dtb_u_u269 with
  | Core_dTerm.C_Term_TIf (dtb_u_u270, dtb_u_u271, dtb_u_u272) -> (Core_dTerm.C_Term_TIf (((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u270), ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u271), ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u272)))
  | Core_dTerm.C_Term_TCase (dtb_u_u273, dtb_u_u274) -> (Core_dTerm.C_Term_TCase (((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u273), ((B_dData_dList.v_map (fun (dtb_u_u275 : Core_dTerm.t_CaseAlt) -> { Core_dTerm.f_CaseAlt_caseAltName = (Core_dTerm.v_caseAltName dtb_u_u275); Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_caseAltBinders dtb_u_u275); Core_dTerm.f_CaseAlt_caseAltBody = ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) (dtb_u_u267 + (B_dData_dList.v_length (Core_dTerm.v_caseAltBinders dtb_u_u275)))) dtb_u_u268) (Core_dTerm.v_caseAltBody dtb_u_u275)) })) dtb_u_u274)))
  | Core_dTerm.C_Term_TCon (dtb_u_u276, dtb_u_u277) -> (Core_dTerm.C_Term_TCon (dtb_u_u276, ((B_dData_dList.v_map (fun (dtb_u_u278 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) (B_dData_dPair.v_firstOf dtb_u_u278)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u278) })) dtb_u_u277)))
  | Core_dTerm.C_Term_TApp (dtb_u_u279, dtb_u_u280, dtb_u_u281) -> (Core_dTerm.C_Term_TApp (((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u279), ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u280), dtb_u_u281))
  | Core_dTerm.C_Term_TLam (dtb_u_u282, dtb_u_u283, dtb_u_u284, dtb_u_u285, dtb_u_u286) -> (let dtb_u_u287 = (let dtb_u_u288 = dtb_u_u284 in (match dtb_u_u288 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u289) -> (match dtb_u_u289 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u290; B_dData_dPair.f_Pair_second = dtb_u_u291 } -> (match dtb_u_u291 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u292; B_dData_dPair.f_Pair_second = dtb_u_u293 } -> (let dtb_u_u294 = (match dtb_u_u292 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u297) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u297)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u295 = (match dtb_u_u293 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u296) -> (B_dData_dMaybe.C_Maybe_Just (((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) (dtb_u_u267 + 1)) dtb_u_u268) dtb_u_u296)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u290; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u294; B_dData_dPair.f_Pair_second = dtb_u_u295 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (Core_dTerm.C_Term_TLam (dtb_u_u282, dtb_u_u283, dtb_u_u287, dtb_u_u285, ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) (dtb_u_u267 + 1)) dtb_u_u268) dtb_u_u286))))
  | Core_dTerm.C_Term_TPi (dtb_u_u298, dtb_u_u299, dtb_u_u300, dtb_u_u301, dtb_u_u302) -> (Core_dTerm.C_Term_TPi (dtb_u_u298, dtb_u_u299, dtb_u_u300, ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) dtb_u_u267) dtb_u_u268) dtb_u_u301), ((((((v_absPatternBody dtb_u_u264) dtb_u_u265) dtb_u_u266) (dtb_u_u267 + 1)) dtb_u_u268) dtb_u_u302)))
  | Core_dTerm.C_Term_TVar (dtb_u_u303, dtb_u_u304, dtb_u_u305) -> (if (dtb_u_u304 < dtb_u_u267) then dtb_u_u269 else (let dtb_u_u306 = (((dtb_u_u266 + dtb_u_u267) - 1) - dtb_u_u304) in (match ((v_levelPos dtb_u_u306) dtb_u_u268) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u307) -> (Core_dTerm.C_Term_TVar (dtb_u_u303, (((dtb_u_u267 + dtb_u_u264) - 1) - dtb_u_u307), dtb_u_u305))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Core_dTerm.C_Term_TVar (dtb_u_u303, (dtb_u_u304 + dtb_u_u264), dtb_u_u305))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> dtb_u_u269
))

# 700 "Vuna/Compiler/Core/Conv.vuna"
let[@tail_mod_cons] rec v_wrapPatternLams = (fun (dtb_u_u308 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u309 : Core_dTerm.t_Term) -> (match dtb_u_u308 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u310, dtb_u_u311) -> (match dtb_u_u310 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u312; B_dData_dPair.f_Pair_second = dtb_u_u313 } -> (Core_dTerm.C_Term_TLam (dtb_u_u312, Core_dTerm.C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, ((v_wrapPatternLams dtb_u_u311) dtb_u_u309)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u309
  | _ -> failwith "DT: impossible branch"
))

# 708 "Vuna/Compiler/Core/Conv.vuna"
let rec v_patternEnv = (fun (dtb_u_u314 : int) (dtb_u_u315 : int) -> (if (dtb_u_u315 <= 0) then B_dData_dList.C_List_Nil else (let dtb_u_u316 = (dtb_u_u315 - 1) in (let dtb_u_u317 = (if (dtb_u_u316 < dtb_u_u314) then dtb_u_u316 else 0) in (B_dData_dList.C_List__x58__x58_ ((Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar ("_", dtb_u_u317, B_dData_dList.C_List_Nil)))), ((v_patternEnv dtb_u_u314) (dtb_u_u315 - 1))))))))

# 720 "Vuna/Compiler/Core/Conv.vuna"
let v_patternSolution = (fun (dtb_u_u318 : (string, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u319 : int) (dtb_u_u320 : int) (dtb_u_u321 : Core_dTerm.t_Term) -> (match dtb_u_u318 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u322, dtb_u_u323) -> (match dtb_u_u322 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u324; B_dData_dPair.f_Pair_second = dtb_u_u325 } -> (Core_dTerm.C_Value_VLam (dtb_u_u324, Core_dTerm.C_Rig_RigOmega, { Core_dTerm.f_Closure_closureEnv = ((v_patternEnv dtb_u_u319) dtb_u_u320); Core_dTerm.f_Closure_closureBody = ((v_wrapPatternLams dtb_u_u323) dtb_u_u321) }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Core_dEval.v_eval ((v_patternEnv dtb_u_u319) dtb_u_u320)) dtb_u_u321)
  | _ -> failwith "DT: impossible branch"
))

# 732 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaEmptyStore = (fun (dtb_u_u326 : Core_dTerm.t_Sols) (dtb_u_u327 : int) (dtb_u_u328 : int) (dtb_u_u329 : Core_dTerm.t_Value) -> (let dtb_u_u330 = (((v_metaCreatedDepth dtb_u_u326) dtb_u_u327) dtb_u_u328) in (let dtb_u_u331 = ((Core_dEval.v_quote dtb_u_u327) dtb_u_u329) in (if (((Core_dTerm.v_hasMeta dtb_u_u328) 0) dtb_u_u331) then ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveOccurs ((string_of_int dtb_u_u328)))) (string_of_int dtb_u_u328)) else (if (((((v_termScopedTo dtb_u_u330) dtb_u_u327) 0) B_dData_dList.C_List_Nil) dtb_u_u331) then (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_solsCons dtb_u_u328) dtb_u_u329) dtb_u_u326))) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveMetavar ((string_of_int dtb_u_u328)))) (string_of_int dtb_u_u328)))))))

# 727 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaEmpty = (fun (dtb_u_u332 : Core_dTerm.t_Sols) (dtb_u_u333 : int) (dtb_u_u334 : int) (dtb_u_u335 : Core_dTerm.t_Value) -> (match dtb_u_u335 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u336, dtb_u_u337) -> (match dtb_u_u337 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u336 = dtb_u_u334) then (Base_dDiag.C_Check_OkC (dtb_u_u332)) else ((((v_solveMetaEmptyStore dtb_u_u332) dtb_u_u333) dtb_u_u334) dtb_u_u335))
  | _ -> ((((v_solveMetaEmptyStore dtb_u_u332) dtb_u_u333) dtb_u_u334) dtb_u_u335)
)
  | _ -> ((((v_solveMetaEmptyStore dtb_u_u332) dtb_u_u333) dtb_u_u334) dtb_u_u335)
))

# 748 "Vuna/Compiler/Core/Conv.vuna"
let rec v_splitAtVals = (fun (dtb_u_u338 : int) (dtb_u_u339 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u338 = 0) then { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u339 } else (match dtb_u_u339 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u340, dtb_u_u341) -> (match ((v_splitAtVals (dtb_u_u338 - 1)) dtb_u_u341) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u342; B_dData_dPair.f_Pair_second = dtb_u_u343 } -> { B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u340, dtb_u_u342)); B_dData_dPair.f_Pair_second = dtb_u_u343 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }
  | _ -> failwith "DT: impossible branch"
)))

# 245 "Vuna/Compiler/Core/Conv.vuna"
let rec v_convNatChains = (fun (dtb_u_u344 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u345 : Core_dTerm.t_Sols) (dtb_u_u346 : int) (dtb_u_u347 : Core_dTerm.t_Value) (dtb_u_u348 : Core_dTerm.t_Value) (dtb_u_u349 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u350 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u351 : int) -> (match (v_natFoldValue dtb_u_u347) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u352) -> (match (v_natFoldValue dtb_u_u348) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u353) -> (if (dtb_u_u352 = dtb_u_u353) then (Base_dDiag.C_Check_OkC (dtb_u_u345)) else (((v_mismatchAt dtb_u_u346) dtb_u_u347) dtb_u_u348))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_convValueListsFuel (dtb_u_u351 - 1)) dtb_u_u344) dtb_u_u345) dtb_u_u346) dtb_u_u349) dtb_u_u350)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((v_convValueListsFuel (dtb_u_u351 - 1)) dtb_u_u344) dtb_u_u345) dtb_u_u346) dtb_u_u349) dtb_u_u350)
  | _ -> failwith "DT: impossible branch"
))
# 255 "Vuna/Compiler/Core/Conv.vuna"
and v_convNatNeutral = (fun (dtb_u_u354 : int) (dtb_u_u355 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u356 : Core_dTerm.t_Sols) (dtb_u_u357 : int) (dtb_u_u358 : Core_dTerm.t_Neutral) (dtb_u_u359 : Core_dTerm.t_Neutral) (dtb_u_u360 : Core_dTerm.t_Value) (dtb_u_u361 : Core_dTerm.t_Value) -> (match (v_natFoldValue dtb_u_u360) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u362) -> (match (v_natFoldValue dtb_u_u361) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u363) -> (if (dtb_u_u362 = dtb_u_u363) then (Base_dDiag.C_Check_OkC (dtb_u_u356)) else (((v_mismatchAt dtb_u_u357) dtb_u_u360) dtb_u_u361))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_convNeutralFuel (dtb_u_u354 - 1)) dtb_u_u355) dtb_u_u356) dtb_u_u357) dtb_u_u358) dtb_u_u359) dtb_u_u360) dtb_u_u361)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_convNeutralFuel (dtb_u_u354 - 1)) dtb_u_u355) dtb_u_u356) dtb_u_u357) dtb_u_u358) dtb_u_u359) dtb_u_u360) dtb_u_u361)
  | _ -> failwith "DT: impossible branch"
))
# 265 "Vuna/Compiler/Core/Conv.vuna"
and v_convNatApplied = (fun (dtb_u_u364 : int) (dtb_u_u365 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u366 : Core_dTerm.t_Sols) (dtb_u_u367 : int) (dtb_u_u368 : Core_dTerm.t_Value) (dtb_u_u369 : Core_dTerm.t_Value) (dtb_u_u370 : Core_dTerm.t_Value) (dtb_u_u371 : Core_dTerm.t_Value) (dtb_u_u372 : Core_dTerm.t_Value) (dtb_u_u373 : Core_dTerm.t_Value) -> (match (v_natFoldValue dtb_u_u372) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u374) -> (match (v_natFoldValue dtb_u_u373) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u375) -> (if (dtb_u_u374 = dtb_u_u375) then (Base_dDiag.C_Check_OkC (dtb_u_u366)) else (((v_mismatchAt dtb_u_u367) dtb_u_u372) dtb_u_u373))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u364 - 1)) dtb_u_u365) dtb_u_u366) dtb_u_u367) dtb_u_u368) dtb_u_u370)) (fun (dtb_u_u376 : Core_dTerm.t_Sols) -> ((((((v_convFuel (dtb_u_u364 - 1)) dtb_u_u365) dtb_u_u376) dtb_u_u367) dtb_u_u369) dtb_u_u371)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u364 - 1)) dtb_u_u365) dtb_u_u366) dtb_u_u367) dtb_u_u368) dtb_u_u370)) (fun (dtb_u_u377 : Core_dTerm.t_Sols) -> ((((((v_convFuel (dtb_u_u364 - 1)) dtb_u_u365) dtb_u_u377) dtb_u_u367) dtb_u_u369) dtb_u_u371)))
  | _ -> failwith "DT: impossible branch"
))
# 335 "Vuna/Compiler/Core/Conv.vuna"
and v_convFuel = (fun (dtb_u_u378 : int) (dtb_u_u379 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u380 : Core_dTerm.t_Sols) (dtb_u_u381 : int) (dtb_u_u382 : Core_dTerm.t_Value) (dtb_u_u383 : Core_dTerm.t_Value) -> (if (dtb_u_u378 <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((v_fastSame dtb_u_u382) dtb_u_u383) then (Base_dDiag.C_Check_OkC (dtb_u_u380)) else (if (((v_fastSameSols dtb_u_u380) dtb_u_u382) dtb_u_u383) then (Base_dDiag.C_Check_OkC (dtb_u_u380)) else (let dtb_u_u384 = ((((Core_dEval.v_force dtb_u_u379) dtb_u_u380) Core_dTerm.v_defaultFuel) dtb_u_u382) in (let dtb_u_u385 = ((((Core_dEval.v_force dtb_u_u379) dtb_u_u380) Core_dTerm.v_defaultFuel) dtb_u_u383) in (match dtb_u_u384 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u386, dtb_u_u387) -> (((((((v_solveMetaFuel (dtb_u_u378 - 1)) dtb_u_u379) dtb_u_u380) dtb_u_u381) dtb_u_u386) dtb_u_u387) dtb_u_u385)
  | _ -> (match dtb_u_u385 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u388, dtb_u_u389) -> (((((((v_solveMetaFuel (dtb_u_u378 - 1)) dtb_u_u379) dtb_u_u380) dtb_u_u381) dtb_u_u388) dtb_u_u389) dtb_u_u384)
  | _ -> ((((((v_convBothFuel (dtb_u_u378 - 1)) dtb_u_u379) dtb_u_u380) dtb_u_u381) dtb_u_u384) dtb_u_u385)
)
)))))))
# 354 "Vuna/Compiler/Core/Conv.vuna"
and v_convBothFuel = (fun (dtb_u_u390 : int) (dtb_u_u391 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u392 : Core_dTerm.t_Sols) (dtb_u_u393 : int) (dtb_u_u394 : Core_dTerm.t_Value) (dtb_u_u395 : Core_dTerm.t_Value) -> (if (dtb_u_u390 <= 0) then (Base_dDiag.v_icFuel "conv") else (match dtb_u_u394 with
  | Core_dTerm.C_Value_VType (dtb_u_u396) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VType (dtb_u_u397) -> (if ((Core_dTerm.v_levelEq dtb_u_u396) dtb_u_u397) then (Base_dDiag.C_Check_OkC (dtb_u_u392)) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VPi (dtb_u_u398, dtb_u_u399, dtb_u_u400, dtb_u_u401, dtb_u_u402) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VPi (dtb_u_u403, dtb_u_u404, dtb_u_u405, dtb_u_u406, dtb_u_u407) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb_u_u399) dtb_u_u404) then ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u401) dtb_u_u406)) (fun (dtb_u_u408 : Core_dTerm.t_Sols) -> (let dtb_u_u409 = ((Core_dEval.v_freshVar dtb_u_u398) dtb_u_u393) in ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u408) (dtb_u_u393 + 1)) ((Core_dEval.v_applyClosure dtb_u_u402) dtb_u_u409)) ((Core_dEval.v_applyClosure dtb_u_u407) dtb_u_u409))))) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VLam (dtb_u_u410, dtb_u_u411, dtb_u_u412) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VLam (dtb_u_u413, dtb_u_u414, dtb_u_u415) -> (let dtb_u_u416 = ((Core_dEval.v_freshVar dtb_u_u410) dtb_u_u393) in ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) (dtb_u_u393 + 1)) ((Core_dEval.v_applyClosure dtb_u_u412) dtb_u_u416)) ((Core_dEval.v_applyClosure dtb_u_u415) dtb_u_u416)))
  | _ -> (((((((v_etaRightFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u410) dtb_u_u412) dtb_u_u395)
)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u417) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VNeutral (dtb_u_u418) -> (if (if (v_isNatLikeValue dtb_u_u394) then (v_isNatLikeValue dtb_u_u395) else false) then ((((((((v_convNatNeutral dtb_u_u390) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u417) dtb_u_u418) dtb_u_u394) dtb_u_u395) else ((((((((v_convNeutralFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u417) dtb_u_u418) dtb_u_u394) dtb_u_u395))
  | Core_dTerm.C_Value_VLam (dtb_u_u419, dtb_u_u420, dtb_u_u421) -> (((((((v_etaLeftFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u394) dtb_u_u419) dtb_u_u421)
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VInt (dtb_u_u422) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VInt (dtb_u_u423) -> (if (dtb_u_u422 = dtb_u_u423) then (Base_dDiag.C_Check_OkC (dtb_u_u392)) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VStr (dtb_u_u424) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VStr (dtb_u_u425) -> (if (dtb_u_u424 = dtb_u_u425) then (Base_dDiag.C_Check_OkC (dtb_u_u392)) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VFloat (dtb_u_u426) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VFloat (dtb_u_u427) -> (if (dtb_u_u426 = dtb_u_u427) then (Base_dDiag.C_Check_OkC (dtb_u_u392)) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VBool (dtb_u_u428) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VBool (dtb_u_u429) -> (if (((B_dTrait_dEq.v__x61__x61_ B_dTrait_dEq.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool) dtb_u_u428) dtb_u_u429) then (Base_dDiag.C_Check_OkC (dtb_u_u392)) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VCon (dtb_u_u430, dtb_u_u431) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VCon (dtb_u_u432, dtb_u_u433) -> (if (dtb_u_u430 = dtb_u_u432) then (if (v_isNatCtorName dtb_u_u430) then ((((((((v_convNatChains dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u394) dtb_u_u395) dtb_u_u431) dtb_u_u433) dtb_u_u390) else ((((((v_convValueListsFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u431) dtb_u_u433)) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VProj (dtb_u_u434, dtb_u_u435, dtb_u_u436, dtb_u_u437, dtb_u_u438) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VProj (dtb_u_u439, dtb_u_u440, dtb_u_u441, dtb_u_u442, dtb_u_u443) -> (if (if (dtb_u_u435 = dtb_u_u440) then (dtb_u_u437 = dtb_u_u442) else false) then ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u434) dtb_u_u439) else (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VApp (dtb_u_u444, dtb_u_u445) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VApp (dtb_u_u446, dtb_u_u447) -> (if (if (v_isNatLikeValue dtb_u_u394) then (v_isNatLikeValue dtb_u_u395) else false) then ((((((((((v_convNatApplied dtb_u_u390) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u444) dtb_u_u445) dtb_u_u446) dtb_u_u447) dtb_u_u394) dtb_u_u395) else (let dtb_u_u448 = (if ((dtp_log_on 3) "Vuna.Compiler.Core.Conv") then (((dtp_log_emit 3) "Vuna.Compiler.Core.Conv") (String.concat "" ["vapp: "; (Core_dEval.v_showValue dtb_u_u394); " <> "; (Core_dEval.v_showValue dtb_u_u395); " | x="; (Core_dEval.v_showValue dtb_u_u445); " x2="; (Core_dEval.v_showValue dtb_u_u447)])) else 0) in ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u444) dtb_u_u446)) (fun (dtb_u_u449 : Core_dTerm.t_Sols) -> ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u449) dtb_u_u393) dtb_u_u445) dtb_u_u447)))))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VCase (dtb_u_u450, dtb_u_u451) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VCase (dtb_u_u452, dtb_u_u453) -> ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u450) dtb_u_u452)) (fun (dtb_u_u454 : Core_dTerm.t_Sols) -> ((((((v_convCaseAltsFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u454) dtb_u_u393) dtb_u_u451) dtb_u_u453)))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | Core_dTerm.C_Value_VIf (dtb_u_u455, dtb_u_u456, dtb_u_u457) -> (match dtb_u_u395 with
  | Core_dTerm.C_Value_VIf (dtb_u_u458, dtb_u_u459, dtb_u_u460) -> ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u392) dtb_u_u393) dtb_u_u455) dtb_u_u458)) (fun (dtb_u_u461 : Core_dTerm.t_Sols) -> ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u461) dtb_u_u393) dtb_u_u456) dtb_u_u459)) (fun (dtb_u_u462 : Core_dTerm.t_Sols) -> ((((((v_convFuel (dtb_u_u390 - 1)) dtb_u_u391) dtb_u_u462) dtb_u_u393) dtb_u_u457) dtb_u_u460)))))
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)
  | _ -> (((v_mismatchAt dtb_u_u393) dtb_u_u394) dtb_u_u395)
)))
# 434 "Vuna/Compiler/Core/Conv.vuna"
and v_etaLeftFuel = (fun (dtb_u_u463 : int) (dtb_u_u464 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u465 : Core_dTerm.t_Sols) (dtb_u_u466 : int) (dtb_u_u467 : Core_dTerm.t_Value) (dtb_u_u468 : string) (dtb_u_u469 : Core_dTerm.t_Closure) -> (if (dtb_u_u463 <= 0) then (Base_dDiag.v_icFuel "conv") else (let dtb_u_u470 = ((Core_dEval.v_freshVar dtb_u_u468) dtb_u_u466) in ((((((v_convFuel (dtb_u_u463 - 1)) dtb_u_u464) dtb_u_u465) (dtb_u_u466 + 1)) ((Core_dEval.v_applyValue dtb_u_u467) dtb_u_u470)) ((Core_dEval.v_applyClosure dtb_u_u469) dtb_u_u470)))))
# 443 "Vuna/Compiler/Core/Conv.vuna"
and v_etaRightFuel = (fun (dtb_u_u471 : int) (dtb_u_u472 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u473 : Core_dTerm.t_Sols) (dtb_u_u474 : int) (dtb_u_u475 : string) (dtb_u_u476 : Core_dTerm.t_Closure) (dtb_u_u477 : Core_dTerm.t_Value) -> (if (dtb_u_u471 <= 0) then (Base_dDiag.v_icFuel "conv") else (let dtb_u_u478 = ((Core_dEval.v_freshVar dtb_u_u475) dtb_u_u474) in ((((((v_convFuel (dtb_u_u471 - 1)) dtb_u_u472) dtb_u_u473) (dtb_u_u474 + 1)) ((Core_dEval.v_applyClosure dtb_u_u476) dtb_u_u478)) ((Core_dEval.v_applyValue dtb_u_u477) dtb_u_u478)))))
# 452 "Vuna/Compiler/Core/Conv.vuna"
and v_convNeutralFuel = (fun (dtb_u_u479 : int) (dtb_u_u480 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u481 : Core_dTerm.t_Sols) (dtb_u_u482 : int) (dtb_u_u483 : Core_dTerm.t_Neutral) (dtb_u_u484 : Core_dTerm.t_Neutral) (dtb_u_u485 : Core_dTerm.t_Value) (dtb_u_u486 : Core_dTerm.t_Value) -> (if (dtb_u_u479 <= 0) then (Base_dDiag.v_icFuel "conv") else (match dtb_u_u483 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u487, dtb_u_u488, dtb_u_u489) -> (match dtb_u_u484 with
  | Core_dTerm.C_Neutral_NVar (dtb_u_u490, dtb_u_u491, dtb_u_u492) -> (if (dtb_u_u488 = dtb_u_u491) then ((((((((v_convSpinesFuel (dtb_u_u479 - 1)) dtb_u_u480) dtb_u_u481) dtb_u_u482) dtb_u_u489) dtb_u_u492) dtb_u_u485) dtb_u_u486) else (((v_mismatchAt dtb_u_u482) dtb_u_u485) dtb_u_u486))
  | _ -> (((v_mismatchAt dtb_u_u482) dtb_u_u485) dtb_u_u486)
)
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u493, dtb_u_u494) -> (match dtb_u_u484 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u495, dtb_u_u496) -> (if (dtb_u_u493 = dtb_u_u495) then ((((((((v_convSpinesFuel (dtb_u_u479 - 1)) dtb_u_u480) dtb_u_u481) dtb_u_u482) dtb_u_u494) dtb_u_u496) dtb_u_u485) dtb_u_u486) else (((v_mismatchAt dtb_u_u482) dtb_u_u485) dtb_u_u486))
  | _ -> (((v_mismatchAt dtb_u_u482) dtb_u_u485) dtb_u_u486)
)
  | _ -> failwith "DT: impossible branch"
)))
# 467 "Vuna/Compiler/Core/Conv.vuna"
and v_convSpinesFuel = (fun (dtb_u_u497 : int) (dtb_u_u498 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u499 : Core_dTerm.t_Sols) (dtb_u_u500 : int) (dtb_u_u501 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u502 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u503 : Core_dTerm.t_Value) (dtb_u_u504 : Core_dTerm.t_Value) -> (match dtb_u_u501 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u505, dtb_u_u506) -> (match dtb_u_u502 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u507, dtb_u_u508) -> (if (dtb_u_u497 <= 0) then (Base_dDiag.v_icFuel "conv") else ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u497 - 1)) dtb_u_u498) dtb_u_u499) dtb_u_u500) dtb_u_u505) dtb_u_u507)) (fun (dtb_u_u509 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (dtb_u_u497 - 1)) dtb_u_u498) dtb_u_u509) dtb_u_u500) dtb_u_u506) dtb_u_u508) dtb_u_u503) dtb_u_u504))))
  | _ -> (if (dtb_u_u497 <= 0) then (Base_dDiag.v_icFuel "conv") else (((v_mismatchAt dtb_u_u500) dtb_u_u503) dtb_u_u504))
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u502 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u497 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (dtb_u_u499)))
  | _ -> (if (dtb_u_u497 <= 0) then (Base_dDiag.v_icFuel "conv") else (((v_mismatchAt dtb_u_u500) dtb_u_u503) dtb_u_u504))
)
  | _ -> failwith "DT: impossible branch"
))
# 479 "Vuna/Compiler/Core/Conv.vuna"
and v_convValueListsFuel = (fun (dtb_u_u510 : int) (dtb_u_u511 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u512 : Core_dTerm.t_Sols) (dtb_u_u513 : int) (dtb_u_u514 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u515 : Core_dTerm.t_Value B_dData_dList.t_List) -> (match dtb_u_u514 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u516, dtb_u_u517) -> (match dtb_u_u515 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u518, dtb_u_u519) -> (if (dtb_u_u510 <= 0) then (Base_dDiag.v_icFuel "conv") else ((Base_dCommon.v_bind ((((((v_convFuel (dtb_u_u510 - 1)) dtb_u_u511) dtb_u_u512) dtb_u_u513) dtb_u_u516) dtb_u_u518)) (fun (dtb_u_u520 : Core_dTerm.t_Sols) -> ((((((v_convValueListsFuel (dtb_u_u510 - 1)) dtb_u_u511) dtb_u_u520) dtb_u_u513) dtb_u_u517) dtb_u_u519))))
  | _ -> (if (dtb_u_u510 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCtorArity))
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u515 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u510 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (dtb_u_u512)))
  | _ -> (if (dtb_u_u510 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCtorArity))
)
  | _ -> failwith "DT: impossible branch"
))
# 492 "Vuna/Compiler/Core/Conv.vuna"
and v_convCaseAltsFuel = (fun (dtb_u_u521 : int) (dtb_u_u522 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u523 : Core_dTerm.t_Sols) (dtb_u_u524 : int) (dtb_u_u525 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) (dtb_u_u526 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> (match dtb_u_u525 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u527, dtb_u_u528) -> (match dtb_u_u526 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u529, dtb_u_u530) -> (if (dtb_u_u521 <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((dtb_u_u527).Core_dTerm.f_VCaseAlt_vCaseAltName = (dtb_u_u529).Core_dTerm.f_VCaseAlt_vCaseAltName) then (if ((B_dData_dList.v_length (dtb_u_u527).Core_dTerm.f_VCaseAlt_vCaseAltBinders) = (B_dData_dList.v_length (dtb_u_u529).Core_dTerm.f_VCaseAlt_vCaseAltBinders)) then (match ((((((v_convOneAltFuel (dtb_u_u521 - 1)) dtb_u_u522) dtb_u_u523) dtb_u_u524) dtb_u_u527) dtb_u_u529) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u531) -> (Base_dDiag.C_Check_ErrC (dtb_u_u531))
  | Base_dDiag.C_Check_OkC (dtb_u_u532) -> ((((((v_convCaseAltsFuel (dtb_u_u521 - 1)) dtb_u_u522) dtb_u_u532) dtb_u_u524) dtb_u_u528) dtb_u_u530)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseVars ((dtb_u_u527).Core_dTerm.f_VCaseAlt_vCaseAltName))) (dtb_u_u527).Core_dTerm.f_VCaseAlt_vCaseAltName)) else (((Base_dDiagnostics_dTc.v_tcErr2NoLoc (Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseBranch ((dtb_u_u527).Core_dTerm.f_VCaseAlt_vCaseAltName, (dtb_u_u529).Core_dTerm.f_VCaseAlt_vCaseAltName))) (dtb_u_u527).Core_dTerm.f_VCaseAlt_vCaseAltName) (dtb_u_u529).Core_dTerm.f_VCaseAlt_vCaseAltName)))
  | _ -> (if (dtb_u_u521 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseCount))
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u526 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u521 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiag.C_Check_OkC (dtb_u_u523)))
  | _ -> (if (dtb_u_u521 <= 0) then (Base_dDiag.v_icFuel "conv") else (Base_dDiagnostics_dTc.v_tcErr0NoLoc Base_dDiagnostics_dTc.C_TcErr_TypeMismatchCaseCount))
)
  | _ -> failwith "DT: impossible branch"
))
# 509 "Vuna/Compiler/Core/Conv.vuna"
and v_convOneAltFuel = (fun (dtb_u_u533 : int) (dtb_u_u534 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u535 : Core_dTerm.t_Sols) (dtb_u_u536 : int) (dtb_u_u537 : Core_dTerm.t_VCaseAlt) (dtb_u_u538 : Core_dTerm.t_VCaseAlt) -> (if (dtb_u_u533 <= 0) then (Base_dDiag.v_icFuel "conv") else (let dtb_u_u539 = (dtb_u_u537).Core_dTerm.f_VCaseAlt_vCaseAltBinders in (let dtb_u_u540 = (B_dData_dList.v_length dtb_u_u539) in (let dtb_u_u541 = (((Core_dEval.v_argValsAt dtb_u_u539) dtb_u_u536) 0) in ((((((v_convFuel (dtb_u_u533 - 1)) dtb_u_u534) dtb_u_u535) (dtb_u_u536 + dtb_u_u540)) ((Core_dEval.v_applyClosureBinder (dtb_u_u537).Core_dTerm.f_VCaseAlt_vCaseAltClosure) dtb_u_u541)) ((Core_dEval.v_applyClosureBinder (dtb_u_u538).Core_dTerm.f_VCaseAlt_vCaseAltClosure) dtb_u_u541)))))))
# 755 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaHoLegacyFuel = (fun (dtb_u_u542 : int) (dtb_u_u543 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u544 : Core_dTerm.t_Sols) (dtb_u_u545 : int) (dtb_u_u546 : int) (dtb_u_u547 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u548 : Core_dTerm.t_Value) -> (if (dtb_u_u542 <= 0) then (Base_dDiag.v_icFuel "conv") else (match dtb_u_u548 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u549, dtb_u_u550) -> (match ((Core_dTerm.v_solsLookup dtb_u_u549) dtb_u_u544) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u551) -> ((((((v_convFuel (dtb_u_u542 - 1)) dtb_u_u543) dtb_u_u544) dtb_u_u545) ((Core_dEval.v_applySpine (Core_dTerm.C_Value_VMeta (dtb_u_u546, dtb_u_u547))) B_dData_dList.C_List_Nil)) ((Core_dEval.v_applySpine dtb_u_u551) dtb_u_u550))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u546 = dtb_u_u549) then ((((((((v_convSpinesFuel (dtb_u_u542 - 1)) dtb_u_u543) dtb_u_u544) dtb_u_u545) dtb_u_u547) dtb_u_u550) (Core_dTerm.C_Value_VMeta (dtb_u_u546, dtb_u_u547))) dtb_u_u548) else ((Base_dCommon.v_bind (((((((v_solveMetaFuel (dtb_u_u542 - 1)) dtb_u_u543) dtb_u_u544) dtb_u_u545) dtb_u_u546) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VMeta (dtb_u_u549, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u552 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (dtb_u_u542 - 1)) dtb_u_u543) dtb_u_u552) dtb_u_u545) dtb_u_u547) dtb_u_u550) (Core_dTerm.C_Value_VMeta (dtb_u_u546, dtb_u_u547))) dtb_u_u548))))
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VNeutral (dtb_u_u553) -> (match dtb_u_u553 with
  | Core_dTerm.C_Neutral_NGlobal (dtb_u_u554, dtb_u_u555) -> (((((((((v_solveMetaHeadLegacyFuel (dtb_u_u542 - 1)) dtb_u_u543) dtb_u_u544) dtb_u_u545) dtb_u_u546) dtb_u_u547) (Core_dTerm.C_Value_VNeutral (dtb_u_u553))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NGlobal (dtb_u_u554, B_dData_dList.C_List_Nil))))) dtb_u_u555)
  | Core_dTerm.C_Neutral_NVar (dtb_u_u556, dtb_u_u557, dtb_u_u558) -> (((((((((v_solveMetaHeadLegacyFuel (dtb_u_u542 - 1)) dtb_u_u543) dtb_u_u544) dtb_u_u545) dtb_u_u546) dtb_u_u547) (Core_dTerm.C_Value_VNeutral (dtb_u_u553))) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb_u_u556, dtb_u_u557, B_dData_dList.C_List_Nil))))) dtb_u_u558)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((string_of_int dtb_u_u546)))) (string_of_int dtb_u_u546))
)
  | _ -> ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((string_of_int dtb_u_u546)))) (string_of_int dtb_u_u546))
)))
# 772 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaHeadLegacyFuel = (fun (dtb_u_u559 : int) (dtb_u_u560 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u561 : Core_dTerm.t_Sols) (dtb_u_u562 : int) (dtb_u_u563 : int) (dtb_u_u564 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u565 : Core_dTerm.t_Value) (dtb_u_u566 : Core_dTerm.t_Value) (dtb_u_u567 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (dtb_u_u559 <= 0) then (Base_dDiag.v_icFuel "conv") else (if ((B_dData_dList.v_length dtb_u_u567) >= (B_dData_dList.v_length dtb_u_u564)) then (let dtb_u_u568 = (bi_natSub (B_dData_dList.v_length dtb_u_u567) (B_dData_dList.v_length dtb_u_u564)) in (match ((v_splitAtVals dtb_u_u568) dtb_u_u567) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u569; B_dData_dPair.f_Pair_second = dtb_u_u570 } -> ((Base_dCommon.v_bind (((((((v_solveMetaFuel (dtb_u_u559 - 1)) dtb_u_u560) dtb_u_u561) dtb_u_u562) dtb_u_u563) B_dData_dList.C_List_Nil) ((Core_dEval.v_applySpine dtb_u_u566) dtb_u_u569))) (fun (dtb_u_u571 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (dtb_u_u559 - 1)) dtb_u_u560) dtb_u_u571) dtb_u_u562) dtb_u_u564) dtb_u_u570) (Core_dTerm.C_Value_VMeta (dtb_u_u563, dtb_u_u564))) dtb_u_u565)))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveHigherOrder ((string_of_int dtb_u_u563)))) (string_of_int dtb_u_u563)))))
# 784 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaPattern = (fun (dtb_u_u572 : int) (dtb_u_u573 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u574 : Core_dTerm.t_Sols) (dtb_u_u575 : int) (dtb_u_u576 : int) (dtb_u_u577 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u578 : Core_dTerm.t_Value) -> (if (dtb_u_u572 <= 0) then (Base_dDiag.v_icFuel "conv") else (match (v_patternSpineOf dtb_u_u577) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_solveMetaHoLegacyFuel (dtb_u_u572 - 1)) dtb_u_u573) dtb_u_u574) dtb_u_u575) dtb_u_u576) dtb_u_u577) dtb_u_u578)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u579) -> (let dtb_u_u580 = (((v_metaCreatedDepth dtb_u_u574) dtb_u_u575) dtb_u_u576) in (let dtb_u_u581 = ((Core_dEval.v_quote dtb_u_u575) dtb_u_u578) in (let dtb_u_u582 = (B_dData_dList.v_length dtb_u_u579) in (let dtb_u_u583 = (v_spineLevels dtb_u_u579) in (if (((Core_dTerm.v_hasMeta dtb_u_u576) 0) dtb_u_u581) then ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveOccurs ((string_of_int dtb_u_u576)))) (string_of_int dtb_u_u576)) else (if (((((v_termScopedTo dtb_u_u580) dtb_u_u575) 0) dtb_u_u579) dtb_u_u581) then (Base_dDiag.C_Check_OkC ((((Core_dTerm.v_solsCons dtb_u_u576) ((((v_patternSolution dtb_u_u579) dtb_u_u580) dtb_u_u575) ((((((v_absPatternBody dtb_u_u582) dtb_u_u580) dtb_u_u575) 0) dtb_u_u583) dtb_u_u581))) dtb_u_u574))) else ((Base_dDiagnostics_dTc.v_tcErr1NoLoc (Base_dDiagnostics_dTc.C_TcErr_CannotSolveMetavar ((string_of_int dtb_u_u576)))) (string_of_int dtb_u_u576))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 799 "Vuna/Compiler/Core/Conv.vuna"
and v_solveMetaFuel = (fun (dtb_u_u584 : int) (dtb_u_u585 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u586 : Core_dTerm.t_Sols) (dtb_u_u587 : int) (dtb_u_u588 : int) (dtb_u_u589 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u590 : Core_dTerm.t_Value) -> (if (dtb_u_u584 <= 0) then (Base_dDiag.v_icFuel "conv") else (match ((Core_dTerm.v_solsLookup dtb_u_u588) dtb_u_u586) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u591) -> ((((((v_convFuel (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u586) dtb_u_u587) ((Core_dEval.v_applySpine dtb_u_u591) dtb_u_u589)) dtb_u_u590)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u589 with
  | B_dData_dList.C_List_Nil -> ((((v_solveMetaEmpty dtb_u_u586) dtb_u_u587) dtb_u_u588) dtb_u_u590)
  | _ -> (match dtb_u_u590 with
  | Core_dTerm.C_Value_VMeta (dtb_u_u592, dtb_u_u593) -> (if (dtb_u_u592 = dtb_u_u588) then ((((((((v_convSpinesFuel (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u586) dtb_u_u587) dtb_u_u589) dtb_u_u593) (Core_dTerm.C_Value_VMeta (dtb_u_u588, dtb_u_u589))) dtb_u_u590) else (match ((Core_dTerm.v_solsLookup dtb_u_u592) dtb_u_u586) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u594) -> (((((((v_solveMetaFuel (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u586) dtb_u_u587) dtb_u_u588) dtb_u_u589) ((Core_dEval.v_applySpine dtb_u_u594) dtb_u_u593))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((((((v_solveMetaFuel (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u586) dtb_u_u587) dtb_u_u588) B_dData_dList.C_List_Nil) (Core_dTerm.C_Value_VMeta (dtb_u_u592, B_dData_dList.C_List_Nil)))) (fun (dtb_u_u595 : Core_dTerm.t_Sols) -> ((((((((v_convSpinesFuel (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u595) dtb_u_u587) dtb_u_u589) dtb_u_u593) (Core_dTerm.C_Value_VMeta (dtb_u_u588, dtb_u_u589))) dtb_u_u590)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((((v_solveMetaPattern (dtb_u_u584 - 1)) dtb_u_u585) dtb_u_u586) dtb_u_u587) dtb_u_u588) dtb_u_u589) dtb_u_u590)
)
)
  | _ -> failwith "DT: impossible branch"
)))

# 821 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMetaNew = (fun (dtb_u_u596 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u597 : Core_dTerm.t_Sols) (dtb_u_u598 : int) (dtb_u_u599 : int) (dtb_u_u600 : Core_dTerm.t_Value) -> ((((v_solveMetaEmpty dtb_u_u597) dtb_u_u598) dtb_u_u599) dtb_u_u600))

# 824 "Vuna/Compiler/Core/Conv.vuna"
let v_conv = (fun (dtb_u_u601 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u602 : Core_dTerm.t_Sols) (dtb_u_u603 : int) (dtb_u_u604 : Core_dTerm.t_Value) (dtb_u_u605 : Core_dTerm.t_Value) -> (let dtb_u_u606 = (((Base_dObs.v_obsCountAt 3) "vuna.counter.core.conv") 1) in (let dtb_u_u607 = (if ((dtp_log_on 3) "Vuna.Compiler.Core.Conv") then (((dtp_log_emit 3) "Vuna.Compiler.Core.Conv") (String.concat "" ["conv-in: "; (Core_dTerm.v_showTerm ((Core_dEval.v_quote dtb_u_u603) dtb_u_u604)); " <> "; (Core_dTerm.v_showTerm ((Core_dEval.v_quote dtb_u_u603) dtb_u_u605)); " |v: "; ((Core_dEval.v_showValueAt dtb_u_u603) dtb_u_u604); " <> "; ((Core_dEval.v_showValueAt dtb_u_u603) dtb_u_u605); " @"; (string_of_int dtb_u_u603)])) else 0) in ((((((v_convFuel ((v_convFuelFor dtb_u_u604) dtb_u_u605)) dtb_u_u601) dtb_u_u602) dtb_u_u603) dtb_u_u604) dtb_u_u605))))

# 834 "Vuna/Compiler/Core/Conv.vuna"
let v_convBoth = (fun (dtb_u_u608 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u609 : Core_dTerm.t_Sols) (dtb_u_u610 : int) (dtb_u_u611 : Core_dTerm.t_Value) (dtb_u_u612 : Core_dTerm.t_Value) -> ((((((v_convBothFuel ((v_convFuelFor dtb_u_u611) dtb_u_u612)) dtb_u_u608) dtb_u_u609) dtb_u_u610) dtb_u_u611) dtb_u_u612))

# 837 "Vuna/Compiler/Core/Conv.vuna"
let v_convCaseAlts = (fun (dtb_u_u613 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u614 : Core_dTerm.t_Sols) (dtb_u_u615 : int) (dtb_u_u616 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) (dtb_u_u617 : Core_dTerm.t_VCaseAlt B_dData_dList.t_List) -> ((((((v_convCaseAltsFuel v_convFuelBase) dtb_u_u613) dtb_u_u614) dtb_u_u615) dtb_u_u616) dtb_u_u617))

# 840 "Vuna/Compiler/Core/Conv.vuna"
let v_convOneAlt = (fun (dtb_u_u618 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u619 : Core_dTerm.t_Sols) (dtb_u_u620 : int) (dtb_u_u621 : Core_dTerm.t_VCaseAlt) (dtb_u_u622 : Core_dTerm.t_VCaseAlt) -> ((((((v_convOneAltFuel v_convFuelBase) dtb_u_u618) dtb_u_u619) dtb_u_u620) dtb_u_u621) dtb_u_u622))

# 843 "Vuna/Compiler/Core/Conv.vuna"
let v_convValueLists = (fun (dtb_u_u623 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u624 : Core_dTerm.t_Sols) (dtb_u_u625 : int) (dtb_u_u626 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u627 : Core_dTerm.t_Value B_dData_dList.t_List) -> ((((((v_convValueListsFuel v_convFuelBase) dtb_u_u623) dtb_u_u624) dtb_u_u625) dtb_u_u626) dtb_u_u627))

# 846 "Vuna/Compiler/Core/Conv.vuna"
let v_convNeutral = (fun (dtb_u_u628 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u629 : Core_dTerm.t_Sols) (dtb_u_u630 : int) (dtb_u_u631 : Core_dTerm.t_Neutral) (dtb_u_u632 : Core_dTerm.t_Neutral) (dtb_u_u633 : Core_dTerm.t_Value) (dtb_u_u634 : Core_dTerm.t_Value) -> ((((((((v_convNeutralFuel v_convFuelBase) dtb_u_u628) dtb_u_u629) dtb_u_u630) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u634))

# 849 "Vuna/Compiler/Core/Conv.vuna"
let v_convSpines = (fun (dtb_u_u635 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u636 : Core_dTerm.t_Sols) (dtb_u_u637 : int) (dtb_u_u638 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u639 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u640 : Core_dTerm.t_Value) (dtb_u_u641 : Core_dTerm.t_Value) -> ((((((((v_convSpinesFuel v_convFuelBase) dtb_u_u635) dtb_u_u636) dtb_u_u637) dtb_u_u638) dtb_u_u639) dtb_u_u640) dtb_u_u641))

# 852 "Vuna/Compiler/Core/Conv.vuna"
let v_etaLeft = (fun (dtb_u_u642 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u643 : Core_dTerm.t_Sols) (dtb_u_u644 : int) (dtb_u_u645 : Core_dTerm.t_Value) (dtb_u_u646 : string) (dtb_u_u647 : Core_dTerm.t_Closure) -> (((((((v_etaLeftFuel v_convFuelBase) dtb_u_u642) dtb_u_u643) dtb_u_u644) dtb_u_u645) dtb_u_u646) dtb_u_u647))

# 855 "Vuna/Compiler/Core/Conv.vuna"
let v_etaRight = (fun (dtb_u_u648 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u649 : Core_dTerm.t_Sols) (dtb_u_u650 : int) (dtb_u_u651 : string) (dtb_u_u652 : Core_dTerm.t_Closure) (dtb_u_u653 : Core_dTerm.t_Value) -> (((((((v_etaRightFuel v_convFuelBase) dtb_u_u648) dtb_u_u649) dtb_u_u650) dtb_u_u651) dtb_u_u652) dtb_u_u653))

# 858 "Vuna/Compiler/Core/Conv.vuna"
let v_solveMeta = (fun (dtb_u_u654 : (string, Core_dTerm.t_Term) B_dContainer_dHashMap.t_HashMap) (dtb_u_u655 : Core_dTerm.t_Sols) (dtb_u_u656 : int) (dtb_u_u657 : int) (dtb_u_u658 : Core_dTerm.t_Value B_dData_dList.t_List) (dtb_u_u659 : Core_dTerm.t_Value) -> (let dtb_u_u660 = (((Base_dObs.v_obsCountAt 2) "vuna.counter.meta.solve") 1) in (((((((v_solveMetaFuel v_convFuelBase) dtb_u_u654) dtb_u_u655) dtb_u_u656) dtb_u_u657) dtb_u_u658) dtb_u_u659)))
