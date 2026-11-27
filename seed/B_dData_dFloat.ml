open Vuna_runtime
type 'a0 t_FromFloat = C_FromFloat_FromFloat of ((float) -> 'a0)

# 23 "Base/Data/Float.vuna"
let v_FromFloat_u70c61bb9501ecaf2_uFloat = (C_FromFloat_FromFloat ((fun dtb_u_u1 -> dtb_u_u1)))

# 26 "Base/Data/Float.vuna"
let v_Eq_u018fc178ff3df1b4_uFloat = (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u2 dtb_u_u3 -> (dtb_u_u2 = dtb_u_u3)), (fun dtb_u_u4 dtb_u_u5 -> (dtb_u_u4 <> dtb_u_u5))))

# 30 "Base/Data/Float.vuna"
let v_Ord_u5afb3bbeddafcb50_uFloat = (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u6 dtb_u_u7 -> (dtb_u_u6 < dtb_u_u7)), (fun dtb_u_u8 dtb_u_u9 -> (dtb_u_u8 <= dtb_u_u9)), (fun dtb_u_u10 dtb_u_u11 -> (dtb_u_u10 > dtb_u_u11)), (fun dtb_u_u12 dtb_u_u13 -> (dtb_u_u12 >= dtb_u_u13))))

# 37 "Base/Data/Float.vuna"
let v_Num_ub27c21f837ed69cc_uFloat = (B_dTrait_dNum.C_Num_Num ((fun dtb_u_u14 dtb_u_u15 -> (dtb_u_u14 +. dtb_u_u15)), (fun dtb_u_u16 dtb_u_u17 -> (dtb_u_u16 -. dtb_u_u17)), (fun dtb_u_u18 dtb_u_u19 -> (dtb_u_u18 *. dtb_u_u19)), (fun dtb_u_u20 dtb_u_u21 -> (dtb_u_u20 /. dtb_u_u21))))

# 44 "Base/Data/Float.vuna"
let v_Neg_uc22890dadc3767a7_uFloat = (B_dTrait_dNeg.C_Neg_Neg ((fun dtb_u_u22 -> (0.0 -. dtb_u_u22))))

# 20 "Base/Data/Float.vuna"
let v_fromFloat = (fun dtb_u_u24 (dtb_u_u25 : float) -> (match dtb_u_u24 with
  | C_FromFloat_FromFloat (dtb_u_u26) -> (dtb_u_u26 dtb_u_u25)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Base/Data/Float.vuna"
let v_abs = abs_float

# 56 "Base/Data/Float.vuna"
let v_sqrt = sqrt

# 60 "Base/Data/Float.vuna"
let v_intToFloat = float_of_int

# 65 "Base/Data/Float.vuna"
let v_floatToIntTrunc = int_of_float

# 69 "Base/Data/Float.vuna"
let v_floatToIntSat = (fun (dtb_u_u27 : float) -> (if (dtb_u_u27 <> dtb_u_u27) then 0 else (if (dtb_u_u27 >= 4611686018427387903.0) then 4611686018427387903 else (if (dtb_u_u27 < (0.0 -. 4611686018427387903.0)) then ((0 - 4611686018427387903) - 1) else (v_floatToIntTrunc dtb_u_u27)))))

# 78 "Base/Data/Float.vuna"
let v_floatToIntMaybe = (fun (dtb_u_u28 : float) -> (if (dtb_u_u28 <> dtb_u_u28) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u28 >= 4611686018427387903.0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u28 < (0.0 -. 4611686018427387903.0)) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just ((v_floatToIntTrunc dtb_u_u28)))))))

# 87 "Base/Data/Float.vuna"
let v_floatToNat = (fun (dtb_u_u29 : float) -> (bi_natFromInt (v_floatToIntSat dtb_u_u29)))

# 91 "Base/Data/Float.vuna"
let v_floatToNatMaybe = (fun (dtb_u_u30 : float) -> (if (dtb_u_u30 < 0.0) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_floatToIntMaybe dtb_u_u30) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u31) -> (B_dData_dMaybe.C_Maybe_Just ((bi_natFromInt dtb_u_u31)))
  | _ -> failwith "DT: impossible branch"
)))

# 101 "Base/Data/Float.vuna"
let v_isNaN = (fun (dtb_u_u32 : float) -> (dtb_u_u32 <> dtb_u_u32))

# 105 "Base/Data/Float.vuna"
let v_isInfinite = (fun (dtb_u_u33 : float) -> ((v_abs dtb_u_u33) = (1.0 /. 0.0)))

# 109 "Base/Data/Float.vuna"
let v_isFinite = (fun (dtb_u_u34 : float) -> (if (B_dData_dBool.v_not (v_isNaN dtb_u_u34)) then (B_dData_dBool.v_not (v_isInfinite dtb_u_u34)) else false))

# 116 "Base/Data/Float.vuna"
let v__uintegralLimit = 4503599627370496.0

# 120 "Base/Data/Float.vuna"
let v__unegZero = ((0.0 -. 1.0) *. 0.0)

# 124 "Base/Data/Float.vuna"
let v__ukeepZeroSign = (fun (dtb_u_u35 : float) (dtb_u_u36 : float) -> (if (if (dtb_u_u36 = 0.0) then ((1.0 /. dtb_u_u35) < 0.0) else false) then v__unegZero else dtb_u_u36))

# 128 "Base/Data/Float.vuna"
let v_trunc = (fun (dtb_u_u37 : float) -> (if (dtb_u_u37 <> dtb_u_u37) then dtb_u_u37 else (if ((v_abs dtb_u_u37) >= v__uintegralLimit) then dtb_u_u37 else ((v__ukeepZeroSign dtb_u_u37) (v_intToFloat (v_floatToIntTrunc dtb_u_u37))))))

# 135 "Base/Data/Float.vuna"
let v_floor = (fun (dtb_u_u38 : float) -> (if (dtb_u_u38 <> dtb_u_u38) then dtb_u_u38 else (if ((v_abs dtb_u_u38) >= v__uintegralLimit) then dtb_u_u38 else (let dtb_u_u39 = (v_trunc dtb_u_u38) in ((v__ukeepZeroSign dtb_u_u38) (if (dtb_u_u39 > dtb_u_u38) then (dtb_u_u39 -. 1.0) else dtb_u_u39))))))

# 147 "Base/Data/Float.vuna"
let v_ceil = (fun (dtb_u_u40 : float) -> (if (dtb_u_u40 <> dtb_u_u40) then dtb_u_u40 else (if ((v_abs dtb_u_u40) >= v__uintegralLimit) then dtb_u_u40 else (let dtb_u_u41 = (v_trunc dtb_u_u40) in ((v__ukeepZeroSign dtb_u_u40) (if (dtb_u_u41 < dtb_u_u40) then (dtb_u_u41 +. 1.0) else dtb_u_u41))))))

# 159 "Base/Data/Float.vuna"
let v_round = (fun (dtb_u_u42 : float) -> (if (dtb_u_u42 <> dtb_u_u42) then dtb_u_u42 else (if ((v_abs dtb_u_u42) >= v__uintegralLimit) then dtb_u_u42 else (let dtb_u_u43 = (v_trunc dtb_u_u42) in (let dtb_u_u44 = (dtb_u_u42 -. dtb_u_u43) in ((v__ukeepZeroSign dtb_u_u42) (if (dtb_u_u44 >= 0.5) then (dtb_u_u43 +. 1.0) else (if (dtb_u_u44 <= (0.0 -. 0.5)) then (dtb_u_u43 -. 1.0) else dtb_u_u43))))))))

# 172 "Base/Data/Float.vuna"
let v_floorToInt = (fun (dtb_u_u45 : float) -> (v_floatToIntMaybe (v_floor dtb_u_u45)))

# 176 "Base/Data/Float.vuna"
let v_ceilToInt = (fun (dtb_u_u46 : float) -> (v_floatToIntMaybe (v_ceil dtb_u_u46)))

# 180 "Base/Data/Float.vuna"
let v_roundToInt = (fun (dtb_u_u47 : float) -> (v_floatToIntMaybe (v_round dtb_u_u47)))

# 188 "Base/Data/Float.vuna"
let v_normStep = (fun (dtb_u_u48 : (int, float) B_dData_dPair.t_Pair) (dtb_u_u49 : int) -> (let dtb_u_u50 = (B_dData_dPair.v_firstOf dtb_u_u48) in (let dtb_u_u51 = (B_dData_dPair.v_secondOf dtb_u_u48) in (if (dtb_u_u51 >= 10.0) then { B_dData_dPair.f_Pair_first = (dtb_u_u50 + 1); B_dData_dPair.f_Pair_second = (dtb_u_u51 /. 10.0) } else (if (dtb_u_u51 < 1.0) then { B_dData_dPair.f_Pair_first = (dtb_u_u50 - 1); B_dData_dPair.f_Pair_second = (dtb_u_u51 *. 10.0) } else dtb_u_u48)))))

# 196 "Base/Data/Float.vuna"
let v_digStep = (fun (dtb_u_u52 : (float, int B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u53 : int) -> (let dtb_u_u54 = (B_dData_dPair.v_firstOf dtb_u_u52) in (let dtb_u_u55 = (B_dData_dPair.v_secondOf dtb_u_u52) in (let dtb_u_u56 = (v_floatToIntTrunc dtb_u_u54) in { B_dData_dPair.f_Pair_first = ((dtb_u_u54 -. (v_intToFloat dtb_u_u56)) *. 10.0); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u55) (B_dData_dList.C_List__x58__x58_ (dtb_u_u56, B_dData_dList.C_List_Nil))) }))))

# 205 "Base/Data/Float.vuna"
let rec v_carryRev = (fun (dtb_u_u57 : int B_dData_dList.t_List) -> (match dtb_u_u57 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u58, dtb_u_u59) -> (if (dtb_u_u58 = 9) then (match (v_carryRev dtb_u_u59) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u60) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (0, dtb_u_u60))))
  | _ -> failwith "DT: impossible branch"
) else (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ((dtb_u_u58 + 1), dtb_u_u59)))))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 216 "Base/Data/Float.vuna"
let rec v_trimZerosRev = (fun (dtb_u_u61 : int B_dData_dList.t_List) -> (match dtb_u_u61 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u62, dtb_u_u63) -> (if (dtb_u_u62 = 0) then (v_trimZerosRev dtb_u_u63) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u62, dtb_u_u63)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 221 "Base/Data/Float.vuna"
let v_trimZeros = (fun (dtb_u_u64 : int B_dData_dList.t_List) -> (match (B_dData_dList.v_reverse (v_trimZerosRev (B_dData_dList.v_reverse dtb_u_u64))) with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (0, B_dData_dList.C_List_Nil))
  | dtb_u_u65 -> dtb_u_u65
))

# 228 "Base/Data/Float.vuna"
let rec v_dsLen = (fun (dtb_u_u66 : int B_dData_dList.t_List) -> (match dtb_u_u66 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u67, dtb_u_u68) -> (1 + (v_dsLen dtb_u_u68))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 233 "Base/Data/Float.vuna"
let v_digitsText = (fun (dtb_u_u69 : int B_dData_dList.t_List) -> (((B_dData_dList.v_foldl (fun (dtb_u_u70 : string) (dtb_u_u71 : int) -> (dtb_u_u70 ^ (string_of_int dtb_u_u71)))) "") dtb_u_u69))

# 237 "Base/Data/Float.vuna"
let v_zerosText = (fun (dtb_u_u72 : int) -> (v_digitsText ((B_dData_dList.v_map (fun (dtb_u_u73 : int) -> 0)) ((B_dData_dList.v_range 0) dtb_u_u72))))

# 241 "Base/Data/Float.vuna"
let v_expSuffix = (fun (dtb_u_u74 : int) -> (let dtb_u_u75 = (if (dtb_u_u74 < 0) then (0 - dtb_u_u74) else dtb_u_u74) in (let dtb_u_u76 = (if (dtb_u_u74 < 0) then "-" else "+") in (dtb_u_u76 ^ (if (dtb_u_u75 < 10) then ("0" ^ (string_of_int dtb_u_u75)) else (string_of_int dtb_u_u75))))))

# 249 "Base/Data/Float.vuna"
let v_expForm = (fun (dtb_u_u77 : int) (dtb_u_u78 : int B_dData_dList.t_List) -> (match dtb_u_u78 with
  | B_dData_dList.C_List_Nil -> "0e+00"
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u79, dtb_u_u80) -> (match dtb_u_u80 with
  | B_dData_dList.C_List_Nil -> (String.concat "" [(string_of_int dtb_u_u79); "e"; (v_expSuffix dtb_u_u77)])
  | _ -> (String.concat "" [(string_of_int dtb_u_u79); "."; (v_digitsText dtb_u_u80); "e"; (v_expSuffix dtb_u_u77)])
)
  | _ -> failwith "DT: impossible branch"
))

# 257 "Base/Data/Float.vuna"
let v_fixedForm = (fun (dtb_u_u81 : int) (dtb_u_u82 : int B_dData_dList.t_List) -> (if (dtb_u_u81 >= 0) then (let dtb_u_u83 = (dtb_u_u81 + 1) in (let dtb_u_u84 = (v_dsLen dtb_u_u82) in (if (dtb_u_u84 <= dtb_u_u83) then (String.concat "" [(v_digitsText dtb_u_u82); (v_zerosText (dtb_u_u83 - dtb_u_u84)); "."]) else (String.concat "" [(v_digitsText ((B_dData_dList.v_take dtb_u_u83) dtb_u_u82)); "."; (v_digitsText ((B_dData_dList.v_drop dtb_u_u83) dtb_u_u82))])))) else (String.concat "" ["0."; (v_zerosText ((0 - dtb_u_u81) - 1)); (v_digitsText dtb_u_u82)])))

# 268 "Base/Data/Float.vuna"
let v_floatRender = (fun (dtb_u_u85 : float) -> (if (dtb_u_u85 <> dtb_u_u85) then "nan" else (let dtb_u_u86 = (1.0 /. 0.0) in (if (dtb_u_u85 = dtb_u_u86) then "inf" else (if (dtb_u_u85 = (0.0 -. dtb_u_u86)) then "-inf" else (if (dtb_u_u85 = 0.0) then (if ((1.0 /. dtb_u_u85) < 0.0) then "-0." else "0.") else (let dtb_u_u87 = (dtb_u_u85 < 0.0) in (let dtb_u_u88 = (if dtb_u_u87 then (0.0 -. dtb_u_u85) else dtb_u_u85) in (let dtb_u_u89 = (((B_dData_dList.v_foldl (fun (dtb_u_u103 : (int, float) B_dData_dPair.t_Pair) (dtb_u_u104 : int) -> ((v_normStep dtb_u_u103) dtb_u_u104))) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u88 }) ((B_dData_dList.v_range 0) 700)) in (let dtb_u_u90 = (B_dData_dPair.v_firstOf dtb_u_u89) in (let dtb_u_u91 = (B_dData_dPair.v_secondOf dtb_u_u89) in (let dtb_u_u92 = (((B_dData_dList.v_foldl (fun (dtb_u_u101 : (float, int B_dData_dList.t_List) B_dData_dPair.t_Pair) (dtb_u_u102 : int) -> ((v_digStep dtb_u_u101) dtb_u_u102))) { B_dData_dPair.f_Pair_first = dtb_u_u91; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }) ((B_dData_dList.v_range 0) 12)) in (let dtb_u_u93 = (v_floatToIntTrunc (B_dData_dPair.v_firstOf dtb_u_u92)) in (let dtb_u_u94 = (B_dData_dPair.v_secondOf dtb_u_u92) in (let dtb_u_u95 = (if (dtb_u_u93 >= 5) then (match (v_carryRev (B_dData_dList.v_reverse dtb_u_u94)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u99) -> { B_dData_dPair.f_Pair_first = dtb_u_u90; B_dData_dPair.f_Pair_second = (v_trimZeros (B_dData_dList.v_reverse dtb_u_u99)) }
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = (dtb_u_u90 + 1); B_dData_dPair.f_Pair_second = (v_trimZeros (B_dData_dList.C_List__x58__x58_ (1, ((B_dData_dList.v_map (fun (dtb_u_u100 : int) -> 0)) ((B_dData_dList.v_range 0) 11))))) }
  | _ -> failwith "DT: impossible branch"
) else { B_dData_dPair.f_Pair_first = dtb_u_u90; B_dData_dPair.f_Pair_second = (v_trimZeros dtb_u_u94) }) in (let dtb_u_u96 = (B_dData_dPair.v_firstOf dtb_u_u95) in (let dtb_u_u97 = (B_dData_dPair.v_secondOf dtb_u_u95) in (let dtb_u_u98 = (if (if (dtb_u_u96 < (0 - 4)) then true else (dtb_u_u96 >= 12)) then ((v_expForm dtb_u_u96) dtb_u_u97) else ((v_fixedForm dtb_u_u96) dtb_u_u97)) in (if dtb_u_u87 then ("-" ^ dtb_u_u98) else dtb_u_u98)))))))))))))))))))

# 47 "Base/Data/Float.vuna"
let v_Show_u0077d73cf424e521_uFloat = (B_dTrait_dShow.C_Show_Show ((fun dtb_u_u105 -> (v_floatRender dtb_u_u105))))
