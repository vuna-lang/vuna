open Vuna_runtime
# 268 "Base/Data/String.vuna"
let v_Eq_u018fc178ff3df1b4_uString = (B_dTrait_dEq.C_Eq_Eq ((fun dtb_u_u1 dtb_u_u2 -> (dtb_u_u1 = dtb_u_u2)), (fun dtb_u_u3 dtb_u_u4 -> (dtb_u_u3 <> dtb_u_u4))))

# 272 "Base/Data/String.vuna"
let v_Ord_u5afb3bbeddafcb50_uString = (B_dTrait_dOrd.C_Ord_Ord ((fun dtb_u_u5 dtb_u_u6 -> (dtb_u_u5 < dtb_u_u6)), (fun dtb_u_u7 dtb_u_u8 -> (dtb_u_u7 <= dtb_u_u8)), (fun dtb_u_u9 dtb_u_u10 -> (dtb_u_u9 > dtb_u_u10)), (fun dtb_u_u11 dtb_u_u12 -> (dtb_u_u11 >= dtb_u_u12))))

# 279 "Base/Data/String.vuna"
let v_Hashable_ue4b0f10b020a5e82_uString = (B_dTrait_dHashable.C_Hashable_Hashable ((fun dtb_u_u13 -> (B_dTrait_dHashable.v_hashStr dtb_u_u13))))

# 282 "Base/Data/String.vuna"
let v_Semigroup_ueb264836545b3665_uString = (B_dTrait_dMonoid.C_Semigroup_Semigroup ((fun dtb_u_u14 dtb_u_u15 -> (dtb_u_u14 ^ dtb_u_u15))))

# 285 "Base/Data/String.vuna"
let v_Monoid_u4f2563914c7fbae1_uString = (B_dTrait_dMonoid.C_Monoid_Monoid (""))

# 22 "Base/Data/String.vuna"
let v_byteLength = (fun (dtb_u_u16 : string) -> (bi_natFromInt (String.length dtb_u_u16)))

# 38 "Base/Data/String.vuna"
let rec v_splitChars = (fun (dtb_u_u17 : string) (dtb_u_u18 : int) (dtb_u_u19 : int) (dtb_u_u20 : int) (dtb_u_u21 : string B_dData_dList.t_List) -> (if (dtb_u_u20 <= 0) then (B_dData_dList.v_reverse dtb_u_u21) else (if (dtb_u_u18 >= dtb_u_u19) then (B_dData_dList.v_reverse dtb_u_u21) else (((((v_splitChars dtb_u_u17) (dtb_u_u18 + 1)) dtb_u_u19) (dtb_u_u20 - 1)) (B_dData_dList.C_List__x58__x58_ ((((dtp_substring dtb_u_u18) 1) dtb_u_u17), dtb_u_u21))))))

# 66 "Base/Data/String.vuna"
let[@tail_mod_cons] rec v__uinterleave = (fun (dtb_u_u22 : string) (dtb_u_u23 : string B_dData_dList.t_List) -> (match dtb_u_u23 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> (match dtb_u_u25 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u24, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u24, (B_dData_dList.C_List__x58__x58_ (dtb_u_u22, ((v__uinterleave dtb_u_u22) dtb_u_u25)))))
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 62 "Base/Data/String.vuna"
let v_join = (fun (dtb_u_u26 : string) (dtb_u_u27 : string B_dData_dList.t_List) -> (B_dData_dList.dtp_concatMany ((v__uinterleave dtb_u_u26) dtb_u_u27)))

# 76 "Base/Data/String.vuna"
let v_unlines = (fun (dtb_u_u28 : string B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List_Nil -> ""
  | _ -> (B_dData_dList.dtp_concatMany ((B_dData_dList.v_map (fun (dtb_u_u29 : string) -> (((B_dTrait_dInterp.v_interp B_dTrait_dInterp.v_Interp_uc9feaa570847b590_uString) dtb_u_u29) ^ "\n"))) dtb_u_u28))
))

# 146 "Base/Data/String.vuna"
let rec v_sameBytes = (fun (dtb_u_u30 : int) (dtb_u_u31 : string) (dtb_u_u32 : string) (dtb_u_u33 : int) (dtb_u_u34 : int) (dtb_u_u35 : int) -> (if (dtb_u_u35 <= 0) then true else (if (dtb_u_u33 >= dtb_u_u34) then true else (if ((let b = dtb_u_u31 in let k = dtb_u_u33 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = (let b = dtb_u_u32 in let k = (dtb_u_u30 + dtb_u_u33) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then ((((((v_sameBytes dtb_u_u30) dtb_u_u31) dtb_u_u32) (dtb_u_u33 + 1)) dtb_u_u34) (dtb_u_u35 - 1)) else false))))

# 58 "Base/Data/String.vuna"
let v__usepAt = (fun (dtb_u_u36 : string) (dtb_u_u37 : string) (dtb_u_u38 : int) (dtb_u_u39 : int) (dtb_u_u40 : int) -> (if ((dtb_u_u38 + dtb_u_u40) <= dtb_u_u39) then ((((((v_sameBytes dtb_u_u38) dtb_u_u36) dtb_u_u37) 0) dtb_u_u40) dtb_u_u40) else false))

# 46 "Base/Data/String.vuna"
let rec v_splitSep = (fun (dtb_u_u41 : string) (dtb_u_u42 : string) (dtb_u_u43 : int) (dtb_u_u44 : int) (dtb_u_u45 : int) (dtb_u_u46 : int) (dtb_u_u47 : int) (dtb_u_u48 : string B_dData_dList.t_List) -> (if (dtb_u_u47 <= 0) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring dtb_u_u43) (dtb_u_u45 - dtb_u_u43)) dtb_u_u42), dtb_u_u48))) else (if (dtb_u_u44 >= dtb_u_u45) then (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((((dtp_substring dtb_u_u43) (dtb_u_u45 - dtb_u_u43)) dtb_u_u42), dtb_u_u48))) else (if (((((v__usepAt dtb_u_u41) dtb_u_u42) dtb_u_u44) dtb_u_u45) dtb_u_u46) then ((((((((v_splitSep dtb_u_u41) dtb_u_u42) (dtb_u_u44 + dtb_u_u46)) (dtb_u_u44 + dtb_u_u46)) dtb_u_u45) dtb_u_u46) (dtb_u_u47 - 1)) (B_dData_dList.C_List__x58__x58_ ((((dtp_substring dtb_u_u43) (dtb_u_u44 - dtb_u_u43)) dtb_u_u42), dtb_u_u48))) else ((((((((v_splitSep dtb_u_u41) dtb_u_u42) dtb_u_u43) (dtb_u_u44 + 1)) dtb_u_u45) dtb_u_u46) (dtb_u_u47 - 1)) dtb_u_u48)))))

# 27 "Base/Data/String.vuna"
let v_split = (fun (dtb_u_u49 : string) (dtb_u_u50 : string) -> (let dtb_u_u51 = (String.length dtb_u_u50) in (let dtb_u_u52 = (String.length dtb_u_u49) in (if (dtb_u_u52 = 0) then (((((v_splitChars dtb_u_u50) 0) dtb_u_u51) ((2 * dtb_u_u51) + 2)) B_dData_dList.C_List_Nil) else ((((((((v_splitSep dtb_u_u49) dtb_u_u50) 0) 0) dtb_u_u51) dtb_u_u52) (((2 * dtb_u_u51) + dtb_u_u52) + 2)) B_dData_dList.C_List_Nil)))))

# 72 "Base/Data/String.vuna"
let v_lines = (fun (dtb_u_u53 : string) -> ((v_split "\n") dtb_u_u53))

# 119 "Base/Data/String.vuna"
let rec v__ucontainsAt = (fun (dtb_u_u54 : string) (dtb_u_u55 : string) (dtb_u_u56 : int) (dtb_u_u57 : int) (dtb_u_u58 : int) (dtb_u_u59 : int) -> (if (dtb_u_u59 <= 0) then false else (if ((dtb_u_u56 + dtb_u_u57) > dtb_u_u58) then false else (if ((((((v_sameBytes dtb_u_u56) dtb_u_u54) dtb_u_u55) 0) dtb_u_u57) dtb_u_u57) then true else ((((((v__ucontainsAt dtb_u_u54) dtb_u_u55) (dtb_u_u56 + 1)) dtb_u_u57) dtb_u_u58) (dtb_u_u59 - 1))))))

# 111 "Base/Data/String.vuna"
let v_contains = (fun (dtb_u_u60 : string) (dtb_u_u61 : string) -> (let dtb_u_u62 = (String.length dtb_u_u60) in (let dtb_u_u63 = (String.length dtb_u_u61) in ((((((v__ucontainsAt dtb_u_u60) dtb_u_u61) 0) dtb_u_u62) dtb_u_u63) (dtb_u_u63 + 1)))))

# 131 "Base/Data/String.vuna"
let v_startsWith = (fun (dtb_u_u64 : string) (dtb_u_u65 : string) -> (let dtb_u_u66 = (String.length dtb_u_u64) in (if (dtb_u_u66 > (String.length dtb_u_u65)) then false else ((((((v_sameBytes 0) dtb_u_u64) dtb_u_u65) 0) dtb_u_u66) dtb_u_u66))))

# 138 "Base/Data/String.vuna"
let v_endsWith = (fun (dtb_u_u67 : string) (dtb_u_u68 : string) -> (let dtb_u_u69 = (String.length dtb_u_u67) in (let dtb_u_u70 = (String.length dtb_u_u68) in (if (dtb_u_u69 > dtb_u_u70) then false else ((((((v_sameBytes (dtb_u_u70 - dtb_u_u69)) dtb_u_u67) dtb_u_u68) 0) dtb_u_u69) dtb_u_u69)))))

# 165 "Base/Data/String.vuna"
let rec v_repeatGo = (fun (dtb_u_u71 : int) (dtb_u_u72 : string) (dtb_u_u73 : string) (dtb_u_u74 : int) -> (if (dtb_u_u74 <= 0) then dtb_u_u73 else (if (dtb_u_u71 <= 0) then dtb_u_u73 else (if ((dtb_u_u71 - ((if 2 = 0 then failwith "division by zero" else dtb_u_u71 / 2) * 2)) = 1) then ((((v_repeatGo (if 2 = 0 then failwith "division by zero" else dtb_u_u71 / 2)) (dtb_u_u72 ^ dtb_u_u72)) (dtb_u_u72 ^ dtb_u_u73)) (dtb_u_u74 - 1)) else ((((v_repeatGo (if 2 = 0 then failwith "division by zero" else dtb_u_u71 / 2)) (dtb_u_u72 ^ dtb_u_u72)) dtb_u_u73) (dtb_u_u74 - 1))))))

# 158 "Base/Data/String.vuna"
let v_repeat = (fun (dtb_u_u75 : int) (dtb_u_u76 : string) -> (let dtb_u_u77 = dtb_u_u75 in (if (dtb_u_u77 <= 0) then "" else ((((v_repeatGo dtb_u_u77) dtb_u_u76) "") (dtb_u_u77 + 1)))))

# 177 "Base/Data/String.vuna"
let v_substring = (fun (dtb_u_u78 : int) (dtb_u_u79 : int) (dtb_u_u80 : string) -> (((dtp_substring dtb_u_u78) dtb_u_u79) dtb_u_u80))

# 227 "Base/Data/String.vuna"
let v__uminInt = ((0 - 4611686018427387903) - 1)

# 231 "Base/Data/String.vuna"
let rec v__udigitsToInt = (fun (dtb_u_u81 : string) (dtb_u_u82 : int) (dtb_u_u83 : int) (dtb_u_u84 : int) (dtb_u_u85 : int) -> (if (dtb_u_u85 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u82 >= dtb_u_u83) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u84)) else (let dtb_u_u86 = (let b = dtb_u_u81 in let k = dtb_u_u82 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) in (if (if (dtb_u_u86 < 48) then true else (dtb_u_u86 > 57)) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u87 = (dtb_u_u86 - 48) in (if (dtb_u_u84 > (if 10 = 0 then failwith "division by zero" else (4611686018427387903 - dtb_u_u87) / 10)) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToInt dtb_u_u81) (dtb_u_u82 + 1)) dtb_u_u83) ((dtb_u_u84 * 10) + dtb_u_u87)) (dtb_u_u85 - 1)))))))))

# 193 "Base/Data/String.vuna"
let v__unatDigits = (fun (dtb_u_u88 : string) (dtb_u_u89 : int) (dtb_u_u90 : int) (dtb_u_u91 : int) -> (if (dtb_u_u91 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u89 >= dtb_u_u90) then B_dData_dMaybe.C_Maybe_Nothing else (match (((((v__udigitsToInt dtb_u_u88) dtb_u_u89) dtb_u_u90) 0) ((dtb_u_u90 - dtb_u_u89) + 1)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u92) -> (B_dData_dMaybe.C_Maybe_Just ((bi_natFromInt dtb_u_u92)))
  | _ -> failwith "DT: impossible branch"
))))

# 181 "Base/Data/String.vuna"
let v_parseNat = (fun (dtb_u_u93 : string) -> (let dtb_u_u94 = (String.length dtb_u_u93) in (if (dtb_u_u94 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (if ((let b = dtb_u_u93 in let k = 0 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 43) then (if (dtb_u_u94 = 1) then B_dData_dMaybe.C_Maybe_Nothing else ((((v__unatDigits dtb_u_u93) 1) dtb_u_u94) (dtb_u_u94 + 1))) else ((((v__unatDigits dtb_u_u93) 0) dtb_u_u94) (dtb_u_u94 + 1))))))

# 248 "Base/Data/String.vuna"
let rec v__udigitsToNegInt = (fun (dtb_u_u95 : string) (dtb_u_u96 : int) (dtb_u_u97 : int) (dtb_u_u98 : int) (dtb_u_u99 : int) -> (if (dtb_u_u99 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u96 >= dtb_u_u97) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u98)) else (let dtb_u_u100 = (let b = dtb_u_u95 in let k = dtb_u_u96 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) in (if (if (dtb_u_u100 < 48) then true else (dtb_u_u100 > 57)) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u101 = (dtb_u_u100 - 48) in (if (dtb_u_u98 < (if 10 = 0 then failwith "division by zero" else (v__uminInt + dtb_u_u101) / 10)) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToNegInt dtb_u_u95) (dtb_u_u96 + 1)) dtb_u_u97) ((dtb_u_u98 * 10) - dtb_u_u101)) (dtb_u_u99 - 1)))))))))

# 205 "Base/Data/String.vuna"
let v_parseInt = (fun (dtb_u_u102 : string) -> (let dtb_u_u103 = (String.length dtb_u_u102) in (if (dtb_u_u103 = 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u104 = (let b = dtb_u_u102 in let k = 0 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) in (if (dtb_u_u104 = 45) then (if (dtb_u_u103 = 1) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToNegInt dtb_u_u102) 1) dtb_u_u103) 0) (dtb_u_u103 + 1))) else (if (dtb_u_u104 = 43) then (if (dtb_u_u103 = 1) then B_dData_dMaybe.C_Maybe_Nothing else (((((v__udigitsToInt dtb_u_u102) 1) dtb_u_u103) 0) (dtb_u_u103 + 1))) else (((((v__udigitsToInt dtb_u_u102) 0) dtb_u_u103) 0) (dtb_u_u103 + 1))))))))

# 220 "Base/Data/String.vuna"
let v_parseIntOr = (fun (dtb_u_u105 : int) (dtb_u_u106 : string) -> (match (v_parseInt dtb_u_u106) with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u105
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> dtb_u_u107
  | _ -> failwith "DT: impossible branch"
))

# 265 "Base/Data/String.vuna"
let v__uisSpace = (fun (dtb_u_u108 : int) -> (if (if (if (dtb_u_u108 = 32) then true else (dtb_u_u108 = 9)) then true else (dtb_u_u108 = 10)) then true else (dtb_u_u108 = 13)))

# 85 "Base/Data/String.vuna"
let rec v_trimLeftGo = (fun (dtb_u_u109 : string) (dtb_u_u110 : int) (dtb_u_u111 : int) (dtb_u_u112 : int) -> (if (dtb_u_u112 <= 0) then (((dtp_substring dtb_u_u110) (dtb_u_u111 - dtb_u_u110)) dtb_u_u109) else (if (dtb_u_u110 >= dtb_u_u111) then (((dtp_substring dtb_u_u110) (dtb_u_u111 - dtb_u_u110)) dtb_u_u109) else (if (v__uisSpace (let b = dtb_u_u109 in let k = dtb_u_u110 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then ((((v_trimLeftGo dtb_u_u109) (dtb_u_u110 + 1)) dtb_u_u111) (dtb_u_u112 - 1)) else (((dtp_substring dtb_u_u110) (dtb_u_u111 - dtb_u_u110)) dtb_u_u109)))))

# 81 "Base/Data/String.vuna"
let v_trimLeft = (fun (dtb_u_u113 : string) -> ((((v_trimLeftGo dtb_u_u113) 0) (String.length dtb_u_u113)) ((String.length dtb_u_u113) + 1)))

# 98 "Base/Data/String.vuna"
let rec v_trimRightGo = (fun (dtb_u_u114 : string) (dtb_u_u115 : int) (dtb_u_u116 : int) -> (if (dtb_u_u116 <= 0) then (((dtp_substring 0) (dtb_u_u115 + 1)) dtb_u_u114) else (if (dtb_u_u115 < 0) then (((dtp_substring 0) (dtb_u_u115 + 1)) dtb_u_u114) else (if (v__uisSpace (let b = dtb_u_u114 in let k = dtb_u_u115 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))) then (((v_trimRightGo dtb_u_u114) (dtb_u_u115 - 1)) (dtb_u_u116 - 1)) else (((dtp_substring 0) (dtb_u_u115 + 1)) dtb_u_u114)))))

# 94 "Base/Data/String.vuna"
let v_trimRight = (fun (dtb_u_u117 : string) -> (((v_trimRightGo dtb_u_u117) ((String.length dtb_u_u117) - 1)) ((String.length dtb_u_u117) + 1)))

# 107 "Base/Data/String.vuna"
let v_trim = (fun (dtb_u_u118 : string) -> (v_trimLeft (v_trimRight dtb_u_u118)))
